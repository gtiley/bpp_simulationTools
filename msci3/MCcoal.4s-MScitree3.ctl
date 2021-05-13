          seed = __SEED__

       seqfile = __SEQFILE__   * comment out this line if you don't want seqs
      treefile = __TREEFILE__   * comment out this line if you don't want trees
      Imapfile = __IMAPFILE__
*    concatfile = concatenatedfile.txt  * comment out this line if you don't want concatenated alignment

  species&tree = 5  A  B  C  D  O
                    __NSEQS__  __NSEQS__  __NSEQS__  __NSEQS__  0
 ((O #__THETA__, (A #__THETA__)h[&tau-parent=no,&phi=__MIGRATE__] )g :__BL5__ #__THETA__, (((h[&tau-parent=yes] #__THETA__, B #__THETA__)t : __BL1__ #__THETA__, C #__THETA__)s : __BL2__ #__THETA__, D #__THETA__)r : __BL3__ #__THETA__)q : __BL4__ #__THETA__;

   loci&length = 1000 __NSITES__ * number of loci & number of sites at each locus
