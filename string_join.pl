use warnings;
my(@colors, $color_string);
@colors = ("red", "orange", "yellow", "green", "blue", "indigo", "violet");
$color_string = join(", ", @colors);
print "$color_string";
