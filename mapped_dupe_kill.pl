use warnings;
my (@courses, %c);
@courses = ("Rust", "Go", "Perl", "Ruby", "Python", "Perl", "Go", "Lisp");
%c = map {$_ => undef} @courses; # Create a unique list of keys.
@courses = keys %c;
print "@courses\n";
