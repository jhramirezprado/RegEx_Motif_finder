#!/usr/bin/perl


opendir (DIR, "/home/folder/folder1"); #This folder holds the genomes (fasta)
open (d, ">/home/folder/file1.txt");
	my @files= readdir (DIR);
	$howmanyfiles=@files;
	$howmanygenomes=$howmanyfiles-2;
closedir(DIR);

open (LIST, ">/home/folder/"."file2.txt");

foreach my $file(@files)
{

	next if $file=~ /^\.\.?$/;
	next if -d $file;
	print d "$file\n";

open (TXTFILE, "/home/folder/folder1/".$file);
open (CHS, ">>/home/folder/Sequences.txt"); 
      	$a= "";
	$b= "";

while ($a= <TXTFILE>)                  
{ 
	chop ($a);
	$b=$b.$a;
}                                

my $sec=$b;
my @CHS=$sec=~ m/>[^>]*Q..EY[A-Z]*EDR.L[A-Z]*Q.RRW[^>]*/gi; #The Regular expression


my $CHSN=@CHS;							#prints on screen results
	   			
          print FULL_LIST "\n$file"."\tCHS found:"."\t$CHSN"; 
	print "\nGenome "."$file"." done."."\tCHS found:"."\t$CHSN"; 
                             
while ($a!=$CHSN)
{
          print CHS "$CHS[$a]\n";      
          $a=$a+1;
} 				

close(TXTFILE);

 
}

print "\nProcessing "."$howmanygenomes"." Genome files."." Wait for ALL Genomes to finish\n"; #prints on screen progress
