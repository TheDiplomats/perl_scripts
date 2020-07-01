use warnings;
my ($name, $phone, $address, $bd, $sal);
while(<DATA>){
	($name, $phone, $address, $bd, $sal) = split(":");
	print "$name\t $phone\n";
}

__DATA__
Sir Godrick Gryffindor:245-836-8357:492 Haughty Hill, Hollywood CA 91464:4/04/23:12100
Dame Rowena Ravenclaw:245-836-8357:492 Smart Street, Hollywood CA 91413:7/07/23:13960
Dame Helga Hufflepuff:245-836-8357:492 Right Road, Hollywood CA 91422:8/08/23:14500
Sir Salazar Slytherin:245-836-8357:492 Low Lane, Hollywood CA 91404:7/19/23:13246

