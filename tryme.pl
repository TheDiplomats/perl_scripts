#!/usr/bin/perl					# Startup line
use warnings;					# imports

print "What is your name? ";	# Print statement
chomp(my $name = <STDIN>);		# Waits for user input
print "Hey $name, you alright? ";
chomp(my $response = <STDIN>);
$response = lc($response);		# Convert response to lowercase
if($response eq "yes" or $response eq "y") {
	print "Beyond there are no borders...Beyond the Blackwall.\n"
} else {
	print "Wake the fuck up Samurai...\n";
}

my $now = localtime;				# Perl func to get date and time
print "$name, timestamp at $now.\n"
