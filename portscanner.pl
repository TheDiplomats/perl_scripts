#!/usr/local/bin/perl5.30.2 -w
#use diagnostics; #Dev debugging
use strict;
use Net::Pcap; #Sniffing packets
use NetPacket::Ethernet; #Decode packets
use Net::RawIp;
use NetPacket::TCP;
use NetPacket::IP;
use List::Util qw(shuffle);
die "Usage ./portscanner.pl <target ip> <port range> <tcp type> <my ip>
<timeout (seconds)> <pause time>" if(!$ARGV[0] || $#ARGV != 5);
my $target = shift; #target IP
my $pa = shift; #port range A..B
my $myPort = 55378 #my port
my $reqType = shift; #request type, can be null
my $ip = shift; #my IP
my $pause = shift; $timeout += 1000;
$pa =- s/([0-9]+)-([0-9]+)/$1/;
my @portRange = ($pa..$2);
my($ports,$open,$closed,$filtered)=(0)x4;
#Most commonly used ports first
my $common="^(20|21|23|25|42|53|67|68|69|80|88|102|110|119|”.
  "135|137|138|139|143|161|162|389|443|445|464|500|".
  "515|522|531|543|544|548|554|560|563|568|569|636|993|".
  "995|1024|1234|1433|1500|1503|1645|1646|1701|1720|".
  "1723|1731|1801|1812|1813|2053|2101|2103|2105|2500|".
  "2504|3389|3527|5000|6665|6667|8000|8001|8002)\$";
my %winports = (135 => 'msrpc', 139 => 'netbios-ssn',
445 => 'microsoft-ds', 554 => 'rtsp',
2689 => 'icslap', 5357 => 'wsdapi');
my %rtports = (80 => 'http', 443 => 'https', 8080 => 'http-proxy',
5000 => 'upnp', 8888 => 'sun-answerbook');
my ($win, $rtr, $oui)=(0)x2; #Primitive os detection
my ($err, $net, $mask, $filter, $packet)=""x5;
my $filterStr = "(src net ".$target.") && (dst port ".$myPort.")";
my $dev = pcap_lookupdev(\$err);
pcap_lookupnet($dev, \$net, \$mask, \$err);
my $pcap = pcap_open_live($dev, 1024, 0, 1000, \$err);
pcap_compile($pcap, \$filter, \$filterStr, 0, $mask);
pcap_setFilter($pcap, $filter);
my %header;

sub sniffPacket{
sleep $pause if($pause > 0); # pausing
$ports++; # stats (all ports tried)
my $port = shift; # to print it
sendPacket($port); # send the TCP request
while(1){
  my $pktRef = pcap_next_ex($pcap,\%header,\$packet);
  if($pktRef == 1){ # we’ve got a packet:
   my $eth = NetPacket::Ethernet::strip($packet);
   my $ethdec = NetPacket::Ethernet->decode($packet);
   my $tcp = NetPacket::TCP->decode(NetPacket::IP::strip($eth));
   oui($ethdec->{‘src_mac’})if(!$oui); # return MAC manufacturer
   if($tcp->{‘flags’} == 18){
    $open++; 
    print $port,”\topen\t”;
    if(exists $rtrports{$_}){ print $rtrports{$_}; $rtr++; }
    elsif(exists $winports{$_}){ print $winports{$_}; $win++; }
    else{ print “unknown port.”}
    print “\n”;
   }elsif($tcp->{‘flags’} == 20){
   # closed port
   }
   last; # found response, next ip
  }elsif($pktRef == 0){
   $filtered++; # filtered port from no response.
   last; # found response, next ip
  }else{
   print “packets error!\n”;
  }
}
return;
}

sub sendPacket{ # Target port = $_[0]
my $targetPort = shift;
my $packet = Net::RawIP->new({
  ip  => {
   saddr => $ip,
   daddr => $target,
  },
   tcp => {
   source => $myPort,
   dest   => $targetPort,
  },
}); # craft packet
$packet->set({tcp => {$reqType => 1}}) if($reqType ne “null”);
$packet->send; # send packet
return;
}

sub oui{
my $mac = shift;
(my $macBytes = $mac) =~ s/([0-9a-f]{2})([0-9a-f]{2})([0-9a-f]{2})([0-9a-f]
{2})([0-9a-f]{2})([0-9a-f]{2})/$1:$2:$3:$4:$5:$6/;
$oui=1; # make true
$mac =~ s/([0-9a-f]{2})([0-9a-f]{2})([0-9a-f]{2}).*/$1.$2.$3/;
open(OUI,“oui.txt”)||die”please download oui.txt from IEEE.org\n”;
while(my $l = <OUI>){
  if($l =~ /$mac/i){
   print $macBytes,” MAC Manufacturer: “;
   (my $v = $l) =~ s/.*x\)\s+//;
   print $v,”\n”;
   last;
  }
}
close OUI;
return;
}
