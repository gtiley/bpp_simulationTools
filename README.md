# bpp_simulationTools
## Scripts for automating simulation experiments in BPP to evaluate divergence time estimation in the presense of gene flow
Three scenarios are tested here
1. Post-divergence gene-flow between sister species (a)
2. Gene flow between non-sister species (b)
3. Gene flow from an unsampled ghost lineage into an extant species (c)
  
![Networks Used for Simulations](./images/Fig1.png)

Scripts for simulation and estimation under the MSci model for the three trees are in the folders msci1, msci2, and msci3. There is also simulation under the IM model, but estimation with MSci in im1, im2, and im3.

```simDriver.pl``` does the work, but depends on the control files as templates for simulation and estimation.

As an example, here is the control file used for simulation in msci1 - MCcoal.4s-MScitree1.ctl

	seed = __SEED__

	seqfile = __SEQFILE__   * comment out this line if you don't want seqs
	treefile = __TREEFILE__   * comment out this line if you don't want trees
	Imapfile = __IMAPFILE__
	*    concatfile = concatenatedfile.txt  * comment out this line if you don't want concatenated alignment

	species&tree = 4  A  B  C  D
	__NSEQS__  __NSEQS__  __NSEQS__  __NSEQS__ 
	(((h[&tau-parent=yes] #__THETA__, ((A #__THETA__)h [&phi=__MIGRATE__,&tau-parent=no], B #__THETA__)g : __BL4__ #__THETA__)t : __BL1__ #__THETA__, C #__THETA__)s : __BL2__ #__THETA__, D #__THETA__)r :__BL3__ #__THETA__;

	loci&length = 1000 __NSITES__ * number of loci & number of sites at each locus

This is a modified version of a very basic bpp control file. Some features such as the number of individuals per species (__NSEQS__) and number of sites per locus (__NSITES__) is hard-coded in ```simdriver.pl```, which will iterate over all of the combinations. The branch lengths are assumed proportional to mutation-scaled population size (__THETA__).


The control file used for estimation is template.ctl. It is named the same in every folder, but the trees change.

	seed = __SEED__    
	seqfile = __SEQFILE__
	Imapfile = __IMAPFILE__
	outfile = __OUTFILE__
	mcmcfile = __MCMCFILE__
	species&tree = 4   A  B  C  D
	__NSEQS__ __NSEQS__ __NSEQS__ __NSEQS__
	*t1 (((h[&tau-parent=yes], ((A) h [&phi=0.1,&tau-parent=no], B) g) t, C) s, D) r;
	*t2 (((A, B) t, C) s, D) r;
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
	
The script ```runbpp.pl``` distributes many bpp jobs with the simulated data with the above settings for estimation. The beta parameters for the priors are set in ```runbpp.pl```. The lines starting with *t1 are used for the MSci analysis and the lines with *t2 are used for the MSC analysis.

You will need to specify some of the SLURM configuration settings for your cluster or adapt if need be. BPP v4.1.4 was used and is specified here, but additional models and features are available in newer versions.


The scripts and control files as they are currently configured will repeat analyses from the manuscript. However, the trees and other parameter settings can be modified to facilitate simulation and estimation under a wide range of models and explore other aspects of estimation error such as the number of loci or variation in theta. 