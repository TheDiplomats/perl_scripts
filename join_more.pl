use warnings;
my @names = ("Grif", "Rav", "Huf", "Sly");
@names = join("\n", sort(@names));
print @names;
