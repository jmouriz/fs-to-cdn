#!/usr/bin/perl
use strict;
use warnings;
use utf8;
use JSON 'decode_json';

my $input = (shift or die "Por favor, especifica el archivo a tratar.\n");
my $packages = undef;

for ('package.json', 'bower.json') {
   if (-r) {
      open PACKAGES, $_ or die "No se pudo abrir el archivo $_ $!\n";
      local $/;
      my $dependencies = (decode_json <PACKAGES>)->{dependencies};
      close PACKAGES;
      for (keys %$dependencies) {
         $packages->{$_} = $dependencies->{$_};
      }
   }
}

open INPUT, $input or die "No se pudo abrir el archivo $input: $!\n";

while (<INPUT>) {
   if (/<(script\s+.*src="|link\s+.*href=".*)(node_modules|bower_components)\/([^\/]+)\/([^"]+)"/) {
      my $version = $packages->{$3};
      my $cdn = "https://unpkg.com/$3";
      $cdn .= "\@$version" if $version;
      $cdn .= "/$4";
      s/$2\/$3\/$4/$cdn/;
   }
   print;
}

close INPUT;
