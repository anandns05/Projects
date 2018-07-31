
# perl compfiles <file1> <file2> 
# output in f1 - only in file1only.txt, f2only.txt only in file2, f1f2both.txt

print "Usage : compfiles <file1> <file2> \n";

$f1 = shift @ARGV; 
$f2 = shift @ARGV;

open F1, $f1 or die "Failed to open $f1, $!\n";
open F2, $f2 or die "Failed to open $f2, $!\n";

# open the output files

while (<F1>) {
   chomp; 
   $File1{$_} = 1;
}
close F1;

open F1Only, ">$f1-only.txt" or die "Failed to open $f1-only.txt, $!\n";
open F2Only, ">$f2-only.txt" or die "Failed to open $f2-only.txt, $!\n";
open F1F2Both, ">$f1-$f2-both.txt" or die "Failed to open $f1-$f2-both.txt, $!\n";

while (<F2>) {
	chomp;
	if ($File1{$_} > 0) {
		# it is there in file 1 and file 2
		print F1F2Both "$_\n";
		$File1{$_} = 2;
		next;
	}

	# only on F2
	print F2Only "$_\n";
}

close F2;

foreach $key (keys %File1) {
	if ($File1{$key} == 1) {
		print F1Only "$key\n";
	}
}

close F1Only;
close F2Only;
close F1F2Both;

print "done\n";
