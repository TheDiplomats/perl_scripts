#!c:/Perl/bin/perl.exe
#HTML tags are embeded in here document
my $now = localtime;
print "Content-Type: text/html\n\n";
print <<EOF; # here document in a CGI script (common gateway interface)
<html><head><title>Town Crier</title><head>
<body bgColor="lightgreen">
<div align="center"><h1>Hear ye, Hear ye, Sir Richard cometh!!</h1>
<img src="http:localhost/sir-richard-grenville.jpg">
<h2>Today is $now. </h2></div>
</body>
</html>
EOF
