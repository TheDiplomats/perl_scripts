use warnings;
my %dup = (); #empty hash
my @colors = ("red", "blue", "green", "yellow", "red", "green", "red", "orange");
foreach my $color (@colors) {
	$dup{$color}++;
}
printf "Color	Number of Occurences\n";
while((my $key, my $value)= each %dup){ #captures key and value in hash
	printf"%-12s%-s\n", $key, $value;
}

@colors = sort keys %dup;
print "Duplicates removed: @colors\n";
