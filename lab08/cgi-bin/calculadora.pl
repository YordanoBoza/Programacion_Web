#!"C:\xamppp\perl\bin\perl.exe"
use strict;
use warnings;
use CGI;

my $cgi = CGI->new;
my $caracter = $cgi->param('caracter');
my $expresion_anterior = $cgi->param('expresion');
my $expresion_actualizada;

# Manejar casos especiales
if ($caracter eq 'AC') {
    $expresion_actualizada = '';
}
elsif ($caracter eq '.') {
    if(substr($expresion_anterior,-1)=~ /\d/){
        $expresion_actualizada = $expresion_anterior . $caracter;
    }else{
        $expresion_actualizada = $expresion_anterior;
    }
}
elsif ($caracter eq '%') {
    $expresion_actualizada = $expresion_anterior / 100;
}elsif($caracter =~ /[+\-\/]/){
    if(substr($expresion_anterior,-1)=~ /\d|\)/ ){
        $expresion_actualizada = $expresion_anterior . $caracter;
    }else{
        $expresion_actualizada = $expresion_anterior;
    }
}
else {
    $expresion_actualizada = $expresion_anterior . $caracter;
}
