use warnings;

print "The name of this file is ", __FILE__, "\n";
print "The default package is ", __PACKAGE__, "\n";
print "This is line ",__LINE__, "\n";

# Try commenting the below line...
__END__

while(<DATA>) {
	print;
}

__DATA__
If the above END line was commented...
This line will be printed.
As will this line
And finally this line
