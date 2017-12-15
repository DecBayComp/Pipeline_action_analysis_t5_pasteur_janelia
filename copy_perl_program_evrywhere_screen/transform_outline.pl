#!/usr/bin/perl

use strict;
use warnings;


## name and renaming sequence
my $filename = $ARGV[0];
my $output_filename = $filename;
$output_filename =~ s{\.[^.]+ $}{};
my $contour = "contour";
$output_filename = substr($output_filename, 0, -7);
$output_filename= $output_filename.$contour;

open(my $filehandle, '<', $filename) or die "Could not open $filename\n";
open(my $fout, '>', $output_filename) or die "Could not open $output_filename\n";
my $val;



my @resultarray;
while(my $line = <$filehandle>){
    chomp $line;
    my @linearray = split(" ", $line);
  #  push(@resultarray, @linearray);
  foreach my $val (@linearray) {
    #print "$val\n";
    print $fout "$val\n" ;
  }
}
print "done\n";
