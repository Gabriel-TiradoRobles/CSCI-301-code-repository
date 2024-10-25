#!/usr/bin/perl

#--------------------------------------------Part 1--------------------------------------------------------#
=begin

Perl code-along. Not meant to be run as a program!


Official site: https://www.perl.org/


Reference site: https://perldoc.perl.org/perl 

Good tutorial: https://www.perltutorial.org/


History: https://www.salon.com/1998/10/13/feature_269/


Philosophy: https://www.perl.org/about.html
# Perl's philosophy: there is more than one way to do it.

IDE: third party, no command line interpreter

Directives: 

use strict;
use warnings;

-w flag: should not use both


Error Handling: various try/catch statements


=end

#----------------------------Hello world!
#declaring variables
$MyVar = 'Barney';
print $MyVar;

#asking for input:
print "input a name\n";
my $var = <STDIN>; 
print "Hello, $var";

#-------------------------------Boolean
#has extended operators and "truthiness"

$str = "This statement is false.\n";
print $str;
if ($str)  {
    print "The last statement is true.\n";
}

# -------------------------------= vs == vs Eq
# first example from perldoc

my $a = 1;

$a = 1;
if($a == 1){
   print("Welcome to the Perl if tutorial!\n");
}


$a = 1;
if($a = 40){
   print("variable changed to $a (don't forget the double equals)\n");
}

# ---------------------------------------------strings 
#reference: https://perldotcom.perl.org/pub/2008/05/07/beginners-introduction-to-perl-510-part-2.html/
# another reference: https://perlmaven.com/how-to-split-a-text-file-line-by-line



#---------------------------------------------file IO
#read(from perltutorial.org)


my $filename = './PerlCodeAlong.pl'';

open(FH, '<', $filename) or die $!;

while(<FH>){
   print $_; #note the implicit variable $_
}

close(FH);



#--------------------------------------------Part 2--------------------------------------------------------#

#subprograms:
#reference: https://perldoc.perl.org/perlsub
#tutorial:https://www.tutorialspoint.com/perl/perl_subroutines.htm (demonstrate)

#---------------------------------decision structures

#if statement (example from https://www.perltutorial.org/perl-if/)


my $a = 1;
my $b = 2;

if($a == $b){
   print("a and b are equal\n");
}elsif($a > $b){
   print("a is greater than b\n");
}else{
   print("a is less than b\n");
}

#unless statement  https://www.perltutorial.org/perl-unless/

#review philosophy

my $a = 10;
unless($a >= 0){
   print("a is less than 0\n");                   
}else{
   print("a is greater than or equal 0\n");	                   
}

#also has "given" statement (similar to switch) https://www.perltutorial.org/perl-given/ (show link)

#--------------------iteration structures

#Compare and contrast, come back to them in complex structures

#for (foreach) https://www.perltutorial.org/perl-for-loop/


#while https://www.perltutorial.org/perl-while/ (checked at the beginning)

#until https://www.perltutorial.org/perl-until/ (checked at the beginning)


#do...while https://www.perltutorial.org/perl-do-while/ (checked at the end)


#do ..until  https://www.perltutorial.org/perl-do-until/ (checked at the end)


#next (similar to LOOP) https://www.perltutorial.org/perl-next/


#last (similar to exit) https://www.perltutorial.org/perl-last/

#-----------------------complex structures


#list https://www.perltutorial.org/perl-list/ (example adapted from this source)
#(, , ) -immutable
print(()); # display nothing
print("\n");
print(10,20,30);
print("\n");
print("Super","cali", "fragilistic", "expiali","docious"); 
print("\n");



#array https://www.perltutorial.org/perl-array/ (example from source)
# declared with @
my @days = qw(Mon Tue Wed Thu Fri Sat Sun); #note that this is created with "quick word"
print("@days" ,"\n");
my $WeekDays = ("Mon Tue Wed Thu Fri Sat Sun");
my @days2 = split(" ",$WeekDays);
#print all at once
print "@days2","\n" ;
#iterate through and print
foreach (@days2) {
  print "$_\n";
}

#hash https://www.perltutorial.org/perl-hash/ (example from source)
#declared with %

#!/usr/bin/perl
use warnings;
use strict;
# defines country => language hash
my %langs = ( England => 'English',
 France => 'French', 
 Spain => 'Spanish', 
 China => 'Chinese', 
 Germany => 'German');

# get language of England
my $lang = $langs{'England'}; # English
print($lang,"\n");


#add one element
$langs{'Italy'} = 'Italian';


#iterate
for(keys %langs){
	print("Official Language of $_ is $langs{$_}\n");
}


# quirks https://perlmaven.com/common-warnings-and-error-messages 

# Perl's philosophy: there is more than one way to do it.
# all ways are not helpful
# use perltutorial.org to understand the commands 









