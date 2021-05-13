seed = __SEED__    
seqfile = __SEQFILE__
Imapfile = __IMAPFILE__
outfile = __OUTFILE__
mcmcfile = __MCMCFILE__
species&tree = 5 A B C D O
                   __NSEQS__ __NSEQS__ __NSEQS__ __NSEQS__ 0
*t1 ((O,(A)h[&tau-parent=no,&phi=0.1])g,(((h[&tau-parent=yes],B)t,C)s,D)r)q;
*t2 ((((A, B) t, C) s, D) r, O)q;
usedata = 1
nloci = 1000
cleandata = 0
thetaprior = 3 __THETA_BETA__ e
tauprior = 3 __TAU_BETA__
*t1 phiprior = 1 1
*t1 finetune = 1: 21.06 .0002 .0003 .00001 .2 .01 .01 .01
*t2 finetune = 1: 21.06 .0002 .0003 .00001 .2 .01 .01 .01
print = 1 0 0 0
burnin = 20000
sampfreq = 2
nsample = 200000