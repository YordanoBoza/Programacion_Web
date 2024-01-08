#!"C:\xamppp\perl\bin\perl.exe"
use strict;
use warnings;
use CGI;

my $cgi = CGI->new;
my $caracter = $cgi->param('caracter');
my $expresion_anterior = $cgi->param('expresion');

