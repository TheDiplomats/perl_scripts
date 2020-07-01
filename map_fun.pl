use warnings;
my (@list, @words, @n);
@list = (0x53, 0x77, 0x65, 0x64, 0x65, 0x6e, 012);
my @letters = map chr $_, @list;
print @letters;
@n = (2, 4, 6, 8);
@n = map $_ * 2 + 6, @n;
print "@n\n";
