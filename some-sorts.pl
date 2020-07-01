use warnings;
my @my_list = ("dog", "cat", "bird", "snake");
print "Original list: @my_list\n";
my @sorted = sort(@my_list);
print "ASCII Sort: @sorted\n";
my @reversed = reverse sort @my_list;
print "ASCII Reversed: @reversed\n";

#The following demonstrates using subroutines to specify how to conduct sort

# Now ascii sort using subroutine 
sub asc_sort {
	$a cmp $b; # Sort ascending order
}

my @sorted_list = sort asc_sort(@my_list);
print "ASCII Sort Again: @sorted_list\n";

sub numeric_sort {
	$a <=> $b; #a and b are compared numerically
}

my @number_sort = sort numeric_sort 10, 0, 5, 9.5, 10, 1000;
print "Numeric sort: @number_sort\n";

#Here is an example of a sort with a lambda or block also called inline subroutine
my @lambda_sort = sort {$a <=> $b} (3, 4, 1, 2);
print "Lambda Sort: @lambda_sort\n";
