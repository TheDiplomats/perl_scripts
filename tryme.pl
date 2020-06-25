#!/usr/bin/perl					# Startup line
use warnings;					# imports

print "What is your name? ";	# Print statement
chomp(my $name = <STDIN>);		# Waits for user input
print "Welcome $name, are you ready for Night City? ";
chomp(my $response = <STDIN>);
$response = lc($response);		# Convert response to lowercase
if($response eq "yes" or $response eq "y") {
	print "This is the Blackwall...beyond lies the free AIs\n"
} else {
	print "Wake the f*ck up Samurai!\n";
}

$now = localtime;				# Perl func to get date and time
print "$name, your script executed at $now.\n"
