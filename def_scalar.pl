use warnings;

open(my $fh, "<", "example.txt") or die $!; # $! Prints reason died.
while(<$fh>) {
	print;
}
close $fh;
