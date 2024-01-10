#!"C:/xampp/perl/bin/perl.exe"
use strict;
use warnings;
use CGI;
use Text::CSV;
my $cgi = CGI->new;
$cgi->charset('latin-1');
my $nombre_universidad = uc($cgi->param('nombre_universidad')) || '';
my $periodo_licenciamiento = uc($cgi->param('periodo_licenciamiento')) || '';
my $departamento_local = uc($cgi->param('departamento_local')) || '';
my $denominacion_programa = uc($cgi->param('denominacion_programa')) || '';
