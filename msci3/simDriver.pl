#!/usr/bin/perl -w

$k = 2; 
@MIGRATE = ("0.05","0.2");
@THETA = ("0.001","0.01");
@NSITES = ("100","500");
@NSEQS = ("2","10");

for $i (0..1)
{
    for $j (0..1)
    {
	for $l (0..1)
	{
	    for $m (0..1)
	    {
		$simcon = "sim" . "$i" . "$j" . "$k" . "$l" . "$m";
		$seed = int(rand(1000000000));
		system "mkdir $simcon";
		for $n (1..10)
		{
		    system "mkdir $simcon";
		    open OUT1,'>', "$simcon/$simcon.$n.ctl";
		    open FH1,'<',"MCcoal.4sghost-MSci.ctl";
		    
		    $bl1 = 1 * $THETA[$j];
		    $bl2 = 2 * $THETA[$j];
		    $bl3 = 3 * $THETA[$j];
		    $bl4 = 4 * $THETA[$j];
		    $bl5 = $THETA[$j] / 2;

		    while(<FH1>)
		    {
			$line = $_;
			chomp $line;
			$line =~ s/__SEED__/$seed/;
			$line =~ s/__SEQFILE__/$simcon.$n.seq/;
			$line =~ s/__TREEFILE__/$simcon.$n.trees/;
			$line =~ s/__IMAPFILE__/$simcon.$n.imap/;
			$line =~ s/__MIGRATE__/$MIGRATE[$i]/g;
			$line =~ s/__THETA__/$THETA[$j]/g;
			$line =~ s/__NSITES__/$NSITES[$l]/g;
			$line =~ s/__NSEQS__/$NSEQS[$m]/g;
			$line =~ s/__BL1__/$bl1/;
			$line =~ s/__BL2__/$bl2/;
			$line =~ s/__BL3__/$bl3/;
			$line =~ s/__BL4__/$bl4/;
			$line =~ s/__BL5__/$bl5/;
			print OUT1 "$line\n";
		    }
		    close FH1;
		    close OUT1;
		    
		    for $t (1..2)
		    {
			if ($t == 1)
			{
			    $seed = int(rand(1000000));
			    $thetabeta = $THETA[$j] * 2;
			    $taubeta = $THETA[$j] * 6;
			    open OUT1,'>',"$simcon/$simcon.$n.$t.ctl";
			    open FH1,'<',"template.ctl";
			    while (<FH1>)
			    {
				$line =$_;
				chomp $line;
				$line =~ s/__SEED__/$seed/;
				$line =~ s/__SEQFILE__/$simcon.$n.seq/;
				$line =~ s/__TREEFILE__/$simcon.$n.trees/;
				$line =~ s/__IMAPFILE__/$simcon.$n.imap/;
				$line =~ s/__OUTFILE__/$simcon.$n.out.txt/;
				$line =~ s/__MCMCFILE__/$simcon.$n.mcmc/;
				$line =~ s/__NSEQS__/$NSEQS[$m]/g;
				$line =~ s/__THETA_BETA__/$thetabeta/;
				$line =~ s/__TAU_BETA__/$taubeta/;
				$line =~ s/\*t1//g;
				$line =~ s/^\*.+//g;
				if (length($line) > 5)
				{
				    print OUT1 "$line\n";
				}
			    }
			    close FH1;
			    close OUT1;
			}
			if ($t == 2)
                        {
                            $seed = int(rand(1000000));
                            $thetabeta = $THETA[$j] * 2;
                            $taubeta = $THETA[$j] * 6;
                            open OUT1,'>',"$simcon/$simcon.$n.$t.ctl";
                            open FH1,'<',"template.ctl";
                            while (<FH1>)
                            {
				$line = $_;
				chomp $line;
                                $line =~ s/__SEED__/$seed/;
                                $line =~ s/__SEQFILE__/$simcon.$n.seq/;
                                $line =~ s/__TREEFILE__/$simcon.$n.trees/;
                                $line =~ s/__IMAPFILE__/$simcon.$n.imap/;
                                $line =~ s/__OUTFILE__/$simcon.$n.out.nointr.txt/;
                                $line =~ s/__MCMCFILE__/$simcon.$n.nointr.mcmc/;
                                $line =~ s/__NSEQS__/$NSEQS[$m]/g;
                                $line =~ s/__THETA_BETA__/$thetabeta/;
				$line =~ s/__TAU_BETA__/$taubeta/;
				$line =~ s/\*t2//g;
				$line =~ s/^\*.+//g;
				if (length($line) > 5)
				{
				    print OUT1 "$line\n";
				}
			    }
                            close FH1;
                        }
		    }
		}
	    }
	}
    }
}
exit;
