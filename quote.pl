use warnings;

print 'She cried, "I can\'t help you!"', "\n"; # clumsy
print qq/She cried, "I can't help you!" \n/; # qq double quotes
print qq(I need $5.00\n); # should use single quores
print qq/\n/, q/I need $5.00/,"\n"; # backslash interpretation
print q!I need $5.00!,"\n";
print "The present working directory is ", `pwd`;
print qq/Today is /, qx/date/; # use qx#date /T# (Windows)
print "The hous is ", qx{date +%H}; # Unix Only
