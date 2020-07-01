use warnings;
my $line = "the quick red fox jumped over the lazy brown dog";
my @words = split(' ', $line);
foreach my $word (@words) {
	print $word . "\n";
}
