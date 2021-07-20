#!/usr/bin/perl

use strict;
use warnings;

my $genomes_folder=$ARGV[0]; # Path of the genomes folder
my $files_extension = $ARGV[1]; # File extension of the genomes
my $CDS_folder = $ARGV[2]; # Path of the CDS folder


if (( $genomes_folder eq "-h") or ( $genomes_folder eq "--help") or ($genomes_folder eq "")) {
        print "Usage: perl prodigal_loop.pl <genomes_folder_path> <files_extension> <CDS_folder_path>\nExample: perl prodigal_loop.pl /stor/work/Ochman/marta/genomes ffn /stor/work/Ochman/marta/CDS\n";
}
else {
opendir(my $indir,$path) || die "I cannot open the file\n";
my @files=grep(/.$files_extension$/,readdir $indir);
closedir $indir;

foreach my $p(@files) {
	my $command="prodigal -d $CDS_folder/$p.cds.fasta -i $genomes_folder/$p";
 	system $command;
}
}
