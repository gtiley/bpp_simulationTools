
          seed = __SEED__

       seqfile = __SEQFILE__   * comment out this line if you don't want seqs
      treefile = __TREEFILE__   * comment out this line if you don't want trees
      Imapfile = __IMAPFILE__

  species&tree = 4  A  B  C  D
                    __NSEQS__  __NSEQS__  __NSEQS__  __NSEQS__
  (((A #__THETA__, B #__THETA__) :__BL1__ #__THETA__, C #__THETA__):__BL2__ #__THETA__, D #__THETA__) :__BL3__ #__THETA__;

   loci&length = 1000 __NSITES__   * number of loci & number of sites at each locus

    migration = 7   * number of pops (order fixed by program)
                A     B     C     D    ABCD    ABC   AB
        A       0     0     0     0     -1     -1   -1
        B       __MIGRATE__   0     0     0     -1     -1   -1
        C       0     0     0     0     -1     -1    0
        D       0     0     0     0     -1      0    0
        ABCD   -1    -1    -1    -1      0     -1   -1
        ABC    -1    -1     0     0     -1      0    0
        AB     -1    -1     0     0     -1      0    0
