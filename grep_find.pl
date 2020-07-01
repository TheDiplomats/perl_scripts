use warnings;
my(@colors, $index);
#Search index value where pattern is found
@colors = ("red","green", "blue", "orange", "blueblack"); 
my @index_vals = grep($colors[$_] =~ /blue/, (0..$#colors)); #colors each, =~ regex, size colors
print "Found index values: @index_vals where blue was found"
# =~ is the bind operator 
