#!/usr/bin/perl

## the pig doktah v(whatever it says below!)
## cummingsj@gmail.com

# Copyright (C) 2010 JJ Cummings

# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

use strict;
use warnings;
use Carp;
use GD::Graph::area;
use Getopt::Long qw(:config no_ignore_case bundling);
use PDF::Create;
use Data::Dumper;

my $APP_VERSION = '0.1 Dev';

if($#ARGV==-1){Help("Please read the README for runtime options and configuration documentation");}

my ($pmfile,$pdfile,$htmlfile,$stdout,$verbose,$htmlopen,$htmlclose);
my ($dumpvals,$filepath,$graphtime);

## Lets grab any runtime values and insert into our variables using getopt::long
GetOptions ( "v+" => \$verbose,
        "V!" => sub { Version() },
		"r=s" => \$pmfile,
		"w=s" => \$filepath,
		"g=s" => \$graphtime,
		"p=s" => \$pdfile,
		"h=s" => \$htmlfile,
		"s!" => \$stdout,
		"d!" => \$dumpvals,
		"help|?" => sub { Help() });
		
# declare our hash that we will store all of our data in for analysis
my %pmdata = ();

$graphtime *= 60 if $graphtime;
$graphtime = (time() - $graphtime) if $graphtime;

# Wet the bed if it's not a real file!
croak ("$pmfile is not a regular file!") unless -f $pmfile;

# We are gonna need these in a minute
my $counter = 2;
my $user = 27;
my $sys = 28;
my $idle = 29;

# open our stats file for read only and dump the values into a hash!
open (FH,"<",$pmfile) || croak ($!);
while (<FH>) {
	next if $_ =~ /^#/; 
	my @vals=split(/,/,$_);
	$pmdata{$vals[0]}{'drop_rate'} = $vals[1];
	$pmdata{$vals[0]}{'mbits_wire'} = $vals[2];
	$pmdata{$vals[0]}{'alerts'} = $vals[3];
	$pmdata{$vals[0]}{'kpkts_wire'} = $vals[4];
	$pmdata{$vals[0]}{'pktbytes'} = $vals[5];
	$pmdata{$vals[0]}{'patmatch'} = $vals[6];
	$pmdata{$vals[0]}{'syns'} = $vals[7];
	$pmdata{$vals[0]}{'synacks'} = $vals[8];
	$pmdata{$vals[0]}{'sessions_new'} = $vals[9];
	$pmdata{$vals[0]}{'sessions_del'} = $vals[10];
	$pmdata{$vals[0]}{'sessions_cur'} = $vals[11];
	$pmdata{$vals[0]}{'sessions_max'} = $vals[12];
	$pmdata{$vals[0]}{'stream_flush'} = $vals[13];
	$pmdata{$vals[0]}{'stream_fault'} = $vals[14];
	$pmdata{$vals[0]}{'stream_timeout'} = $vals[15];
	$pmdata{$vals[0]}{'frag_new'} = $vals[16];
	$pmdata{$vals[0]}{'frag_complete'} = $vals[17];
	$pmdata{$vals[0]}{'frag_insert'} = $vals[18];
	$pmdata{$vals[0]}{'frag_delete'} = $vals[19];
	$pmdata{$vals[0]}{'frag_auto'} = $vals[20];
	$pmdata{$vals[0]}{'frag_flushes'} = $vals[21];
	$pmdata{$vals[0]}{'frag_current'} = $vals[22];
	$pmdata{$vals[0]}{'frag_max'} = $vals[23];
	$pmdata{$vals[0]}{'frag_timeout'} = $vals[24];
	$pmdata{$vals[0]}{'frag_faults'} = $vals[25];
	$pmdata{$vals[0]}{'cpu_count'} = $vals[26];
	$pmdata{$vals[0]}{'cpu1_user'} = $vals[27];
	$pmdata{$vals[0]}{'cpu1_sys'} = $vals[28];
	$pmdata{$vals[0]}{'cpu1_idle'} = $vals[29];
	# handle multiple cpu entries
	while ($counter <= $vals[26]) {
		$user += 3;
		$sys += 3;
		$idle += 3;
		$pmdata{$vals[0]}{'cpu'.$counter.'_user'} = $vals[$user];
		$pmdata{$vals[0]}{'cpu'.$counter.'_sys'} = $vals[$sys];
		$pmdata{$vals[0]}{'cpu'.$counter.'_idle'} = $vals[$idle];
		$counter++;
	}
	# skipped +1 since it's duplicated mbps_wire
	$pmdata{$vals[0]}{'mbits_ipfrag'} = $vals[($idle+2)];
	$pmdata{$vals[0]}{'mbits_ipreass'} = $vals[($idle+3)];
	$pmdata{$vals[0]}{'mbits_tcprebuilt'} = $vals[($idle+4)];
	$pmdata{$vals[0]}{'mbits_ipfrag'} = $vals[($idle+5)];
	$pmdata{$vals[0]}{'mbits_applayer'} = $vals[($idle+6)];
	# skipped +7 since it's duplicated
	$pmdata{$vals[0]}{'bytes_ipfrag'} = $vals[($idle+8)];
	$pmdata{$vals[0]}{'bytes_ipreass'} = $vals[($idle+9)];
	$pmdata{$vals[0]}{'bytes_tcprebuilt'} = $vals[($idle+10)];
	$pmdata{$vals[0]}{'bytes_applayer'} = $vals[($idle+11)];
	# skipped +12 since it's duplicated
	$pmdata{$vals[0]}{'kpkts_ipfrag'} = $vals[($idle+13)];
	$pmdata{$vals[0]}{'kpkts_ipreass'} = $vals[($idle+14)];
	$pmdata{$vals[0]}{'kpkts_iptcprebuilt'} = $vals[($idle+15)];
	$pmdata{$vals[0]}{'kpkts_applayer'} = $vals[($idle+16)];
	$pmdata{$vals[0]}{'pkts_total'} = $vals[($idle+17)];
	$pmdata{$vals[0]}{'pkts_dropped'} = $vals[($idle+18)];
	$pmdata{$vals[0]}{'pkts_blocked'} = $vals[($idle+19)];
	$pmdata{$vals[0]}{'pkts_dropped_percentage'} = $vals[($idle+20)];
	$pmdata{$vals[0]}{'filtered_tcp'} = $vals[($idle+21)];
	$pmdata{$vals[0]}{'filtered_udp'} = $vals[($idle+22)];
	$pmdata{$vals[0]}{'sessions_midstream'} = $vals[($idle+23)];
	$pmdata{$vals[0]}{'sessions_closed'} = $vals[($idle+24)];
	$pmdata{$vals[0]}{'sessions_pruned'} = $vals[($idle+25)];
	$pmdata{$vals[0]}{'sessions_timedout'} = $vals[($idle+26)];
	$pmdata{$vals[0]}{'sessions_dropped'} = $vals[($idle+27)];
	$pmdata{$vals[0]}{'sessions_init'} = $vals[($idle+28)];
	$pmdata{$vals[0]}{'sessions_est'} = $vals[($idle+29)];
	$pmdata{$vals[0]}{'sessions_close'} = $vals[($idle+30)];
	$pmdata{$vals[0]}{'sessions_max'} = $vals[($idle+31)];
	$pmdata{$vals[0]}{'sessions_udp_cached_sec'} = $vals[($idle+32)];
	$pmdata{$vals[0]}{'sessions_udp_cachedSsns_sec'} = $vals[($idle+33)];
	$pmdata{$vals[0]}{'sessions_udp_cached_current'} = $vals[($idle+34)];
	$pmdata{$vals[0]}{'sessions_udp_cached_max'} = $vals[($idle+35)];
	$pmdata{$vals[0]}{'attrib_hosts_current'} = $vals[($idle+36)];
	$pmdata{$vals[0]}{'attrib_reloads'} = $vals[($idle+37)];
	$pmdata{$vals[0]}{'mbps_snort'} = $vals[($idle+38)];
	$pmdata{$vals[0]}{'mbps_sniffing'} = $vals[($idle+39)] if (defined $vals[($idle+39)] && $vals[($idle+39)] =~ /^[+-]?\d+(\.\d+)?$/);
	$pmdata{$vals[0]}{'mbps_combined'} = $vals[($idle+40)] if defined $vals[($idle+40)];
	$pmdata{$vals[0]}{'useconds_snort'} = $vals[($idle+41)] if defined $vals[($idle+41)];
	$pmdata{$vals[0]}{'useconds_sniffing'} = $vals[($idle+42)] if defined $vals[($idle+42)];
	$pmdata{$vals[0]}{'useconds_combined'} = $vals[($idle+43)] if defined $vals[($idle+43)];
	$pmdata{$vals[0]}{'kpkts_snort'} = $vals[($idle+44)] if defined $vals[($idle+44)];
	$pmdata{$vals[0]}{'kpkts_sniffing'} = $vals[($idle+45)] if defined $vals[($idle+45)];
	$pmdata{$vals[0]}{'kpkts_combined'} = $vals[($idle+46)] if defined $vals[($idle+46)];
	
	undef @vals;
	$counter = 2;
	$user = 27;
	$sys = 28;
	$idle = 29;
}
close(FH) || carp ($!);

# Declare some more vars that we will need
my @mbpsdata = undef;
my @syndata = undef;
my @cpudata = undef;
my $min = time();
my $max = 0;
my %stats = ();

# loop through our hash and calculate/build/store our values
foreach (sort keys %pmdata) {
	

	# Push some data into multidimensional arrays for graphing!
	if ($graphtime && $_ > $graphtime) {
		$counter++;
		push @{ $syndata[0] },scalar localtime($_);
		push @{ $syndata[1] },$pmdata{$_}{'syns'};
		push @{ $syndata[2] },$pmdata{$_}{'synacks'};
		push @{ $mbpsdata[0] },scalar localtime($_);
		push @{ $mbpsdata[1] },$pmdata{$_}{'mbits_wire'};
		push @{ $mbpsdata[2] },$pmdata{$_}{'mbits_wire'}*($pmdata{$_}{'pkts_dropped_percentage'}/100);
	}
	$min = $_ if $min > $_;
	$max = $_ if $max < $_;
	
	# let's use another hash to store some of this stuff, it's much cleaner and more efficient
	# best to loop it also so that it's more automatified
	foreach my $k (sort keys %{$pmdata{$_}}) {
		
		# build our total for later manipulation
		$stats{$k}{'avg'} = $pmdata{$_}{$k} unless defined $stats{$k}{'avg'};
		$stats{$k}{'avg'} += $pmdata{$_}{$k};
		$stats{$k}{'avg'} /= 2;
		$stats{$k}{'avg'} = sprintf("%.3f",$stats{$k}{'avg'});
		
		# find our high value and it's date
		$stats{$k}{'high'} = $pmdata{$_}{$k} unless defined $stats{$k}{'high'};
		$stats{$k}{'high_date'} = scalar localtime($_) unless defined $stats{$k}{'high_date'};
		if ($stats{$k}{'high'} <= $pmdata{$_}{$k}) {
			$stats{$k}{'high'} = $pmdata{$_}{$k};
			$stats{$k}{'high_date'} = scalar localtime($_);
		}
		
		# find our low value and it's date
		$stats{$k}{'low'} = $pmdata{$_}{$k} unless defined $stats{$k}{'low'};
		$stats{$k}{'low_date'} = scalar localtime($_) unless defined $stats{$k}{'low_date'};
		if ($stats{$k}{'low'} >= $pmdata{$_}{$k}) {
			$stats{$k}{'low'} = $pmdata{$_}{$k};
			$stats{$k}{'low_date'} = scalar localtime($_);
		}
	}
}

# Calculate our duration
my $seconds = $max - $min;
$max = scalar localtime($max);
$min = scalar localtime($min);
$seconds = sprintf("%d days, %d hours, %d minutes and %d seconds\n",(gmtime $seconds)[7,2,1,0]);

#
# Sub to create area graphs
#
sub graph_area {
	my ($aref, $title, $legend, $gfile,$ymax) = @_;
	my @lvals = split(/,/,$legend);
	
	# creat graph object
	my $graph = GD::Graph::area->new(600,300);
	
	# Set our various graph options
	$graph->set( 
		'x_label'          => 'Time',
		'y_label'           => 'Value',
		'title'             => $title,
		'bgclr' => 'white', 
		'transparent' => 0, 
		'long_ticks' => 1, 
		'tick_length' => 0, 
		'x_ticks' => 10, 
		'x_label_skip' => (sprintf("%.0f",($counter/3))),
		'x_labels_vertical' => 1,
		'x_label_position' => .5, 
		'y_label_position' => .5,
		'y_max_value' => $ymax, 
	) or croak($graph->error);
	
	# build the graph legend
	$graph->set_legend( @lvals );
	my $gd = $graph->plot($aref) || croak($graph->error);

	# save the graph!
	open(IMG, '>',"$gfile.png") || croak($!);
	binmode IMG;
	print IMG $gd->png;
	close IMG || croak ($!);
	undef ($graph);
	undef ($gd);
}

#
# Sub to print HELP output
#
sub Help {
	my $err = shift;
	print "\nError: $err\n" if $err;
print<<"__EOT";

-= Tha Pig Doktah $APP_VERSION =-
Copyright (C) 2010 JJ Cummings

$0 -r <path to perfmonfile>

	-r Specify the full path to the snort perfmon file
	-p Enable PDF output
	-w Writefile path (where we write the output files to!)
	-g Graph time length (in minutes)
	-h Enable HTML output
	-s Enable stdout output
	-d Dump all calculated hash key values to stdout!
	-v Enable verbose stdout output
	-V Show version
	-?|help Show this help
	
__EOT

	exit(0);

}

#
# Version sub
#
sub Version {
print<<"__EOT";

-= Tha Pig Doktah $APP_VERSION =-
Copyright (C) 2010 JJ Cummings

__EOT
return (0);
}


if ($htmlfile) {
	$htmlopen = "<head><title>The Pig Doktah $APP_VERSION HTML Report</title></head><pre>";
	$htmlclose = '</pre><br><p><img src=mbps.png></p><hr><p><img src=syns.png></p><br> ';
} else {
	$htmlopen = "";
	$htmlclose = "";
}

# Everything to stdout!
my $results = <<"__EOT";

-= Tha Pig Doktah $APP_VERSION =-
Copyright (C) 2010 JJ Cummings

Report Info:
	Processed: $pmfile
	First Entry: $min
	Last Entry: $max
	Time Span: $seconds
Wirespeed:
	High: $stats{'mbits_wire'}{'high'} Mbits/Sec | $stats{'mbits_wire'}{'high_date'}
	Low: $stats{'mbits_wire'}{'low'} Mbits/Sec | $stats{'mbits_wire'}{'low_date'}
	Avg: $stats{'mbits_wire'}{'avg'} Mbits/Sec
	
% Packet Loss:
	High: $stats{'pkts_dropped_percentage'}{'high'}% | $stats{'pkts_dropped_percentage'}{'high_date'}
	Low: $stats{'pkts_dropped_percentage'}{'low'}% | $stats{'pkts_dropped_percentage'}{'low_date'}
	Avg: $stats{'pkts_dropped_percentage'}{'avg'}%

Additional Info:
	Avg Pkt Size: $stats{'pktbytes'}{'avg'} bytes
	Avg Syns/Sec: $stats{'syns'}{'avg'}
	Avg SynAcks/Sec: $stats{'synacks'}{'avg'}
	Avg Alerts/Sec: $stats{'alerts'}{'avg'}
	Avg Current Cached Sessions: $stats{'sessions_cur'}{'avg'}
__EOT

# add more output if flagged to do so
if ($dumpvals) {
	$results .= "\nRaw Values:\n";
	foreach (sort keys %stats) {
		foreach my $k (sort keys %{$stats{$_}}) {
			$results .= "\t $_ $k = $stats{$_}{$k}\n";
				
		}
	}
}

# write the html as specified
if ($htmlfile) {
	
	Help("You must specify a write file path -w to write the html contents!") unless $filepath;
	$filepath .= "/" unless $filepath =~ /\/$/;

	# lets paint some pretty pictures!
	graph_area(\@mbpsdata,'Mbps vs Packet Loss', 'Mbps,Packet Loss', $filepath.'mbps', 5);
	graph_area(\@syndata,'SYNS vs SYNACKS (per second)', 'Syns/Sec,Synacks/Sec', $filepath.'syns', 1);
	
	open (FH,'>',$filepath.$htmlfile) || croak ($!);
	print FH $htmlopen;
	print FH $results;
	print FH $htmlclose;
	close (FH) || croak ($!);
}

# write the pdf if we specified
if ($pdfile) {
	
	# lets paint some pretty pictures for inclusion in the file!
	graph_area(\@mbpsdata,'Mbps vs Packet Loss', 'Mbps,Packet Loss', 'mbps', 5);
	graph_area(\@syndata,'SYNS vs SYNACKS (per second)', 'Syns/Sec,Synacks/Sec', 'syns', 1);

	my $pdf = new PDF::Create(	'filename' => $pdfile,
								'Author' => 'The Pig Doktah!',
								'Title' => 'Snort Performance Report',
								'CreationDate' => [ localtime ], );
	my $a4 = $pdf->new_page('MediaBox' => $pdf->get_page_size('A4'));
	my $page = $a4->new_page;
	my $f1 = $pdf->font('BaseFont' => 'Helvetica');
	my $toc = $pdf->new_outline('Title' => 'Title Page', 'Destination' => $page);
	$page->printnl("$results", $f1, 10, 20, 800);
	$pdf->close;
	
}

undef @mbpsdata;
undef @syndata;

print $results if $stdout;
	
__END__
