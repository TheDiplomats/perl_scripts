use warnings;
# Searching for patterns in list
my @list = ("gilbert", "peon", "tomatoes", "tomorrow", "potatoes", "phantom", "Tommy");
my $count = grep($_ =~ /tom/i, @list);
@items = grep(/tom/i, @list);
print "Found items: @items\nNumber found: $count\n";
