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

print $cgi->header(type   => 'text/html',charset => 'latin-1');
my $csv_file = 'Programas de Universidades.csv';

my $csv = Text::CSV->new({ binary => 1, auto_diag => 1, sep_char => '|'});
#abrir el archivo csv
open my $fh, '<:encoding(latin-1)', $csv_file or die "No se puede abrir archivo CSV: $csv_file";

my $header = $csv->getline($fh);


my @resultados;
while (my $fila = $csv->getline($fh)) {
    my %datos;
    @datos{@$header} = @$fila;
    if (
        $datos{'NOMBRE'} eq $nombre_universidad ||
        $datos{'PERIODO_LICENCIAMIENTO'} eq $periodo_licenciamiento ||
        $datos{'DEPARTAMENTO_LOCAL'} eq $departamento_local ||
        $datos{'DENOMINACION_PROGRAMA'} eq $denominacion_programa
    ) {
        if($datos{'NOMBRE'} ne ''){
            push @resultados, \%datos;
        }

    }
}

# Cerrar el archivo CSV
close $fh;

print <<HTML;
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="latin-1">
    <title>Resultado de la Consulta</title>
    <link rel="stylesheet" href="../estilos.css">
</head>
<body>
    <div>
        <h1>Resultado de la Consulta</h1>
    </div>
    <div class="resultado">
        <table  border="1">
            <tr>
                <th >Nombre de Universidad</th>
                <th >Per&iacute;odo de Licenciamiento</th>
                <th >Departamento Local</th>
                <th >Denominaci&oacute;n Programa</th>
            </tr>
HTML

