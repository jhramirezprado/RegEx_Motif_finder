# RegEx_Motif_finder

**Code used on this publication:**

Pacheco-Arjona, J. R., & **Ramirez-Prado, J. H.\*** (2014). Large-scale phylogenetic classification of fungal chitin synthases and identification of a putative cell-wall metabolism gene cluster in Aspergillus genomes. _PloS one_, 9(8), e104920.

\*corresponding author

https://doi.org/10.1371/journal.pone.0104920

**Large-scale phylogenetic classification of fungal chitin synthases and identification of a putative cell-wall metabolism gene cluster in Aspergillus genomes.**

**ABSTRACT**

The cell wall is a protective and versatile structure distributed in all fungi. The component responsible for its rigidity is chitin, a product of chitin synthase (Chsp) enzymes. There are seven classes of chitin synthase genes (CHS) and the amount and type encoded in fungal genomes varies considerably from one species to another. Previous Chsp sequence analyses focused on their study as individual units, regardless of genomic context. The identification of blocks of conserved genes between genomes can provide important clues about the interactions and localization of chitin synthases. On the present study, we carried out an in silico search of all putative Chsp encoded in 54 full fungal genomes, encompassing 21 orders from five phyla. Phylogenetic studies of these Chsp were able to confidently classify 347 out of the 369 Chsp identified (94%). Patterns in the distribution of Chsp related to taxonomy were identified, the most prominent being related to the type of fungal growth. More importantly, a synteny analysis for genomic blocks centered on class IV Chsp (the most abundant and widely distributed Chsp class) identified a putative cell wall metabolism gene cluster in members of the genus Aspergillus, the first such association reported for any fungal genome.

**MATERIALS AND METHODS**

**FUNGAL GENOMES**

For this study, a collection of the protein models for 54 fungal genomes [(Table S1)](https://doi.org/10.1371/journal.pone.0104920.s012) was used. We relied on the genome annotations provided by the corresponding sequencing project. The data were taken from: Fungal Genome Initiative-BROAD Institute (BROAD- FGI), Department of Energy Joint Genome Institute (JGI), National Center for Biotechnology Information (NCBI), The Institute for Genomic Research (TIGR), Wellcome Trust Sanger Institute, Genomic Exploration of the Hemiascomycete Yeasts (Génolevures), and the National Institute of Technology and Evaluation (NITE).

**PUTATIVE Chsp SEARCH**

A search for putative Chsp was performed on the protein models corresponding to the 54 fungal genomes. For this, a regular expression (RE) based on the shorter version of the CON1 region (hereafter called CON1S) containing the three conserved Chsp motifs **QXXEY**, **QXRRW** and **EDRXL** [3](https://academic.oup.com/femsyr/article/1/4/247/519059?login=true), [4](https://febs.onlinelibrary.wiley.com/doi/full/10.1111/j.1432-1033.2004.04135.x), [6](https://www.sciencedirect.com/science/article/abs/pii/S1087184506001101), was used: “**Q‥EY[A-Z]\*EDR.L[A-Z]\*Q.RRW**” (periods represent a single amino acid). The RE was coded in a script written in the Perl programming language [16](https://www.perl.org/) [(File S1)](https://doi.org/10.1371/journal.pone.0104920.s022).

**This is the perl script**

<pre><code>
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
</code></pre>


**Copyright:** © 2014 Pacheco-Arjona, Ramirez-Prado. This is an open-access article distributed under the terms of the Creative Commons Attribution License, which permits unrestricted use, distribution, and reproduction in any medium, provided the original author and source are credited.

**Data Availability:** The authors confirm that all data underlying the findings are fully available without restriction. Table S1 contains a list of the genome databases from which the selected genomes were retrieved. Table S2 contains a list of the accession numbers (on already reported genomes) for all putative Chsp found on this work.

**Funding:** This work was supported by funds from Mexico National Science and Technology Council CONACYT grant CB-2008 107114 to JHR-P as well as a CONACYT Ph.D. scholarship to JRP-A. The funders had no role in study design, data collection and analysis, decision to publish, or preparation of the manuscript.
