use warnings;

my @grades = (90, 89, 78, 100, 87);
print "The original array is: @grades\n";
print "The number of the last index is $#grades\n";
print "The value of the last element in the array is $grades[$#grades]\n";
foreach my $grade (@grades) {
		print "Perl: $grade\n";
}
