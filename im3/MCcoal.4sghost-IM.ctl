          seed = __SEED__

       seqfile = __SEQFILE__   * comment out this line if you don't want seqs
      treefile = __TREEFILE__   * comment out this line if you don't want trees
      Imapfile = __IMAPFILE__
*    concatfile = concatenatedfile.txt  * comment out this line if you don't want concatenated alignment

  species&tree = 5  A  B  C  D  O
                    __NSEQS__  __NSEQS__  __NSEQS__  __NSEQS__  0
 ((((A #__THETA__, B #__THETA__) :__BL1__ #__THETA__, C #__THETA__) : __BL2__ #__THETA__, D #__THETA__) : __BL3__ #__THETA__, O #__THETA__)  :__BL4__ #__THETA__;

     migration = 9   * number of pops (order of pops fixed by program)
             A     B     C     D     O     ABCDO ABCD  ABC   AB
  A          0     0     0     0     0     0     0     0     0
  B          0     0     0     0     0     0     0     0     0
  C          0     0     0     0     0     0     0     0     0
  D          0     0     0     0     0     0     0     0     0
  O          __MIGRATE__   0     0     0     0     0     0     0     0
  ABCDO      0     0     0     0     0     0     0     0     0
  ABCD       0     0     0     0     0     0     0     0     0
  ABC        0     0     0     0     0     0     0     0     0
  AB         0     0     0     0     0     0     0     0     0

   loci&length = 1000 __NSITES__ * number of loci & number of sites at each locus
