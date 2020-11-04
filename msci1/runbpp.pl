#!/usr/bin/perl -w

$k = "0";

for $i (0..1)
{
    for $j (0..1)
    {
	for $l (0..1)
	{
	    for $m (0..1)
	    {
		$simcon = "sim" . "$i" . "$j" . "$k" . "$l" . "$m";
		for $n (1..10)
		{
		    $ctlFile = "$simcon" . "." . "$n"  . ".ctl";
		    $submitfile = "$simcon" . "." . "$n" . ".bpp.sh";
		    $ctlFile1 = "$simcon" . "." . "$n"  . ".1.ctl";
		    $ctlFile2 = "$simcon" . "." . "$n"  . ".2.ctl";
		    open OUT1,'>',"$simcon/$submitfile";
		    print OUT1 "#!/bin/bash\n#SBATCH --job-name=$simcon.$n.bpp\n#SBATCH --output=$simcon.$n.bpp.log\n#SBATCH --mail-user=<YOUR_EMAIL>\n#SBATCH --mail-type=FAIL\n#SBATCH --time=300:00:00\n#SBATCH --mem-per-cpu=1000M\n#SBATCH --nodes=1\n#SBATCH --ntasks=1\n#SBATCH --cpus-per-task=1\ncd <PATH>/msci1/$simcon\n";
		    print OUT1 "<PATH_TO_BPP>/bpp-4.1.4-linux-x86_64/bin/bpp --simulate $ctlFile\n"; 
		    print OUT1 "<PATH_TO_BPP>/bpp-4.1.4-linux-x86_64/bin/bpp --cfile $ctlFile1\n";
		    print OUT1 "<PATH_TO_BPP>/bpp-4.1.4-linux-x86_64/bin/bpp --cfile $ctlFile2\n";
		    close OUT1;
		    system "sbatch $simcon/$submitfile";
		}
	    }
	}
    }
}
exit;
