![pigs-on-couches](https://github.com/enhanced/thepigdoktah/blob/master/pigdoktah.png) The Pig Doktah!

Tool for parsing and generating usable information from snort performance metric output.

This is still a largely undevelopped project, expect to see some movement though, should there be interest.

Current sample output:
```
-= Tha Pig Doktah 0.1 Dev =-

Copyright (C) 2010 JJ Cummings



Report Info:

Processed: /var/tmp/snortstat

First Entry: Wed Sep  1 11:34:05 2010

Last Entry: Tue Sep  7 15:40:17 2010

Time Span: 6 days, 4 hours, 6 minutes and 12 seconds



Wirespeed:

High: 10.613 Mbits/Sec | Sat Sep  4 07:59:48 2010

Low: 0.006 Mbits/Sec | Sat Sep  4 07:12:47 2010

Avg: 1.094 Mbits/Sec



% Packet Loss:

High: 10.504% | Sat Sep  4 03:00:00 2010

Low: 0.000% | Tue Sep  7 15:40:17 2010

Avg: 0.262%



Additional Info:

Avg Pkt Size: 580.223 bytes

Avg Syns/Sec: 0.121

Avg SynAcks/Sec: 0.108

Avg Alerts/Sec: 0.001

Avg Current Cached Sessions: 2977.419



Raw Values:

alerts avg = 0.001

alerts high = 0.032

alerts high_date = Wed Sep  1 12:32:57 2010

alerts low = 0.000

alerts low_date = Tue Sep  7 15:40:17 2010

attrib_hosts_current avg = 0.000

attrib_hosts_current high = 0.000

attrib_hosts_current high_date = Tue Sep  7 15:40:17 2010

attrib_hosts_current low = 0.000

attrib_hosts_current low_date = Tue Sep  7 15:40:17 2010

attrib_reloads avg = 0.000

attrib_reloads high = 0

attrib_reloads high_date = Tue Sep  7 15:40:17 2010

attrib_reloads low = 0

attrib_reloads low_date = Tue Sep  7 15:40:17 2010

bytes_applayer avg = 0.143

bytes_applayer high = 1.352

bytes_applayer high_date = Sat Sep  4 07:59:48 2010

bytes_applayer low = 0.006

bytes_applayer low_date = Tue Sep  7 09:13:56 2010

bytes_ipfrag avg = 0.000

bytes_ipfrag high = 0

bytes_ipfrag high_date = Tue Sep  7 15:40:17 2010

bytes_ipfrag low = 0

bytes_ipfrag low_date = Tue Sep  7 15:40:17 2010

bytes_ipreass avg = 2066.350

bytes_ipreass high = 3660

bytes_ipreass high_date = Thu Sep  2 13:47:36 2010

bytes_ipreass low = 368

bytes_ipreass low_date = Thu Sep  2 10:22:15 2010

bytes_tcprebuilt avg = 646.166

bytes_tcprebuilt high = 1458

bytes_tcprebuilt high_date = Sun Sep  5 15:19:06 2010

bytes_tcprebuilt low = 136

bytes_tcprebuilt low_date = Sat Sep  4 00:58:27 2010

cpu1_idle avg = 97.975

cpu1_idle high = 99.977

cpu1_idle high_date = Sat Sep  4 00:58:27 2010

cpu1_idle low = 69.943

cpu1_idle low_date = Tue Sep  7 06:20:11 2010

cpu1_sys avg = 0.030

cpu1_sys high = 0.287

cpu1_sys high_date = Sat Sep  4 07:59:48 2010

cpu1_sys low = 0.000

cpu1_sys low_date = Tue Sep  7 14:10:57 2010

cpu1_user avg = 1.995

cpu1_user high = 29.860

cpu1_user high_date = Tue Sep  7 06:20:11 2010

cpu1_user low = 0.023

cpu1_user low_date = Sat Sep  4 00:58:27 2010

cpu_count avg = 1.000

cpu_count high = 1

cpu_count high_date = Tue Sep  7 15:40:17 2010

cpu_count low = 1

cpu_count low_date = Tue Sep  7 15:40:17 2010

drops avg = 0.262

drops high = 10.504

drops high_date = Sat Sep  4 03:00:00 2010

drops low = 0.000

drops low_date = Tue Sep  7 15:40:17 2010

filtered_tcp avg = 1473.995

filtered_tcp high = 45608

filtered_tcp high_date = Tue Sep  7 09:24:12 2010

filtered_tcp low = 85

filtered_tcp low_date = Wed Sep  1 11:50:25 2010

filtered_udp avg = 1473.995

filtered_udp high = 45608

filtered_udp high_date = Tue Sep  7 09:24:12 2010

filtered_udp low = 85

filtered_udp low_date = Wed Sep  1 11:50:25 2010

frag_auto avg = 0.000

frag_auto high = 0.000

frag_auto high_date = Tue Sep  7 15:40:17 2010

frag_auto low = 0.000

frag_auto low_date = Tue Sep  7 15:40:17 2010

frag_complete avg = 0.000

frag_complete high = 0.000

frag_complete high_date = Tue Sep  7 15:40:17 2010

frag_complete low = 0.000

frag_complete low_date = Tue Sep  7 15:40:17 2010

frag_current avg = 0.000

frag_current high = 0

frag_current high_date = Tue Sep  7 15:40:17 2010

frag_current low = 0

frag_current low_date = Tue Sep  7 15:40:17 2010

frag_delete avg = 0.000

frag_delete high = 0.000

frag_delete high_date = Tue Sep  7 15:40:17 2010

frag_delete low = 0.000

frag_delete low_date = Tue Sep  7 15:40:17 2010

frag_faults avg = 0.000

frag_faults high = 0

frag_faults high_date = Tue Sep  7 15:40:17 2010

frag_faults low = 0

frag_faults low_date = Tue Sep  7 15:40:17 2010

frag_flushes avg = 0.000

frag_flushes high = 0.000

frag_flushes high_date = Tue Sep  7 15:40:17 2010

frag_flushes low = 0.000

frag_flushes low_date = Tue Sep  7 15:40:17 2010

frag_insert avg = 0.000

frag_insert high = 0.000

frag_insert high_date = Tue Sep  7 15:40:17 2010

frag_insert low = 0.000

frag_insert low_date = Tue Sep  7 15:40:17 2010

frag_max avg = 0.000

frag_max high = 0

frag_max high_date = Tue Sep  7 15:40:17 2010

frag_max low = 0

frag_max low_date = Tue Sep  7 15:40:17 2010

frag_new avg = 0.000

frag_new high = 0.000

frag_new high_date = Tue Sep  7 15:40:17 2010

frag_new low = 0.000

frag_new low_date = Tue Sep  7 15:40:17 2010

frag_timeout avg = 0.000

frag_timeout high = 0

frag_timeout high_date = Tue Sep  7 15:40:17 2010

frag_timeout low = 0

frag_timeout low_date = Tue Sep  7 15:40:17 2010

kpkts_applayer avg = 105223.610

kpkts_applayer high = 444882

kpkts_applayer high_date = Thu Sep  2 22:42:20 2010

kpkts_applayer low = 5738

kpkts_applayer low_date = Wed Sep  1 18:55:09 2010

kpkts_ipfrag avg = 0.000

kpkts_ipfrag high = 0.000

kpkts_ipfrag high_date = Tue Sep  7 15:40:17 2010

kpkts_ipfrag low = 0.000

kpkts_ipfrag low_date = Tue Sep  7 15:40:17 2010

kpkts_ipreass avg = 0.001

kpkts_ipreass high = 0.366

kpkts_ipreass high_date = Tue Sep  7 06:20:11 2010

kpkts_ipreass low = 0.000

kpkts_ipreass low_date = Tue Sep  7 15:22:38 2010

kpkts_iptcprebuilt avg = 0.144

kpkts_iptcprebuilt high = 1.646

kpkts_iptcprebuilt high_date = Thu Sep  2 22:42:20 2010

kpkts_iptcprebuilt low = 0.006

kpkts_iptcprebuilt low_date = Tue Sep  7 09:13:56 2010

kpkts_wire avg = 0.143

kpkts_wire high = 1.352

kpkts_wire high_date = Sat Sep  4 07:59:48 2010

kpkts_wire low = 0.006

kpkts_wire low_date = Tue Sep  7 09:13:56 2010

mbits_applayer avg = 580.223

mbits_applayer high = 1009

mbits_applayer high_date = Sat Sep  4 08:09:48 2010

mbits_applayer low = 120

mbits_applayer low_date = Mon Sep  6 05:52:07 2010

mbits_ipfrag avg = 1.100

mbits_ipfrag high = 17.685

mbits_ipfrag high_date = Tue Sep  7 06:20:11 2010

mbits_ipfrag low = 0.007

mbits_ipfrag low_date = Mon Sep  6 17:12:03 2010

mbits_ipreass avg = 0.000

mbits_ipreass high = 0.000

mbits_ipreass high_date = Tue Sep  7 15:40:17 2010

mbits_ipreass low = 0.000

mbits_ipreass low_date = Tue Sep  7 15:40:17 2010

mbits_tcprebuilt avg = 0.007

mbits_tcprebuilt high = 8.324

mbits_tcprebuilt high_date = Tue Sep  7 06:20:11 2010

mbits_tcprebuilt low = 0.000

mbits_tcprebuilt low_date = Tue Sep  7 01:11:34 2010

mbps_snort avg = 0.000

mbps_snort high = 0

mbps_snort high_date = Tue Sep  7 15:40:17 2010

mbps_snort low = 0

mbps_snort low_date = Tue Sep  7 15:40:17 2010

mbps_wire avg = 1.094

mbps_wire high = 10.613

mbps_wire high_date = Sat Sep  4 07:59:48 2010

mbps_wire low = 0.006

mbps_wire low_date = Sat Sep  4 07:12:47 2010

patmatch avg = 298.111

patmatch high = 556.312

patmatch high_date = Sun Sep  5 19:37:37 2010

patmatch low = 3.186

patmatch low_date = Fri Sep  3 08:51:09 2010

pktbytes avg = 580.223

pktbytes high = 1009

pktbytes high_date = Sat Sep  4 08:09:48 2010

pktbytes low = 120

pktbytes low_date = Mon Sep  6 05:52:07 2010

pkts_blocked avg = 0.210

pkts_blocked high = 14.322

pkts_blocked high_date = Sun Sep  5 20:50:12 2010

pkts_blocked low = 0.109

pkts_blocked low_date = Sat Sep  4 01:34:34 2010

pkts_dropped avg = 0.000

pkts_dropped high = 0

pkts_dropped high_date = Tue Sep  7 15:40:17 2010

pkts_dropped low = 0

pkts_dropped low_date = Tue Sep  7 15:40:17 2010

pkts_dropped_percentage avg = 0.187

pkts_dropped_percentage high = 9.096

pkts_dropped_percentage high_date = Sun Sep  5 20:50:12 2010

pkts_dropped_percentage low = 0.003

pkts_dropped_percentage low_date = Wed Sep  1 11:50:25 2010

pkts_total avg = 538.195

pkts_total high = 38320

pkts_total high_date = Thu Sep  2 22:42:20 2010

pkts_total low = 0

pkts_total low_date = Tue Sep  7 15:40:17 2010

sessions_close avg = 0.000

sessions_close high = 0.000

sessions_close high_date = Tue Sep  7 15:40:17 2010

sessions_close low = 0.000

sessions_close low_date = Tue Sep  7 15:40:17 2010

sessions_closed avg = 707.953

sessions_closed high = 2980

sessions_closed high_date = Mon Sep  6 12:37:55 2010

sessions_closed low = 2

sessions_closed low_date = Wed Sep  1 11:34:05 2010

sessions_cur avg = 2977.419

sessions_cur high = 8173

sessions_cur high_date = Sun Sep  5 21:10:31 2010

sessions_cur low = 51

sessions_cur low_date = Wed Sep  1 11:34:05 2010

sessions_del avg = 0.032

sessions_del high = 3.055

sessions_del high_date = Mon Sep  6 05:52:07 2010

sessions_del low = 0.000

sessions_del low_date = Sun Sep  5 19:53:29 2010

sessions_dropped avg = 0.001

sessions_dropped high = 0.006

sessions_dropped high_date = Wed Sep  1 11:50:25 2010

sessions_dropped low = 0.000

sessions_dropped low_date = Tue Sep  7 15:40:17 2010

sessions_est avg = 0.209

sessions_est high = 11.686

sessions_est high_date = Sun Sep  5 20:50:12 2010

sessions_est low = 0.003

sessions_est low_date = Wed Sep  1 11:50:25 2010

sessions_init avg = 0.021

sessions_init high = 0.150

sessions_init high_date = Thu Sep  2 11:30:26 2010

sessions_init low = 0.000

sessions_init low_date = Tue Sep  7 09:24:12 2010

sessions_max avg = 0.000

sessions_max high = 0.000

sessions_max high_date = Tue Sep  7 15:40:17 2010

sessions_max low = 0.000

sessions_max low_date = Tue Sep  7 15:40:17 2010

sessions_midstream avg = 2980.107

sessions_midstream high = 8175

sessions_midstream high_date = Sun Sep  5 21:03:29 2010

sessions_midstream low = 51

sessions_midstream low_date = Wed Sep  1 11:34:05 2010

sessions_new avg = 0.114

sessions_new high = 3.062

sessions_new high_date = Mon Sep  6 05:52:07 2010

sessions_new low = 0.016

sessions_new low_date = Fri Sep  3 20:12:36 2010

sessions_pruned avg = 374.569

sessions_pruned high = 953

sessions_pruned high_date = Sun Sep  5 08:30:47 2010

sessions_pruned low = 3

sessions_pruned low_date = Wed Sep  1 11:50:25 2010

sessions_timedout avg = 1894.898

sessions_timedout high = 7586

sessions_timedout high_date = Sun Sep  5 21:22:42 2010

sessions_timedout low = 31

sessions_timedout low_date = Wed Sep  1 11:34:05 2010

sessions_udp_cachedSsns_sec avg = 0.000

sessions_udp_cachedSsns_sec high = 0

sessions_udp_cachedSsns_sec high_date = Tue Sep  7 15:40:17 2010

sessions_udp_cachedSsns_sec low = 0

sessions_udp_cachedSsns_sec low_date = Tue Sep  7 15:40:17 2010

sessions_udp_cached_current avg = 0.000

sessions_udp_cached_current high = 0.000

sessions_udp_cached_current high_date = Tue Sep  7 15:40:17 2010

sessions_udp_cached_current low = 0.000

sessions_udp_cached_current low_date = Tue Sep  7 15:40:17 2010

sessions_udp_cached_max avg = 0.000

sessions_udp_cached_max high = 0

sessions_udp_cached_max high_date = Tue Sep  7 15:40:17 2010

sessions_udp_cached_max low = 0

sessions_udp_cached_max low_date = Tue Sep  7 15:40:17 2010

sessions_udp_cached_sec avg = 0.000

sessions_udp_cached_sec high = 0

sessions_udp_cached_sec high_date = Tue Sep  7 15:40:17 2010

sessions_udp_cached_sec low = 0

sessions_udp_cached_sec low_date = Tue Sep  7 15:40:17 2010

stream_fault avg = 0.001

stream_fault high = 47

stream_fault high_date = Sun Sep  5 18:39:56 2010

stream_fault low = 0

stream_fault low_date = Tue Sep  7 15:40:17 2010

stream_flush avg = 0.436

stream_flush high = 365.535

stream_flush high_date = Tue Sep  7 06:20:11 2010

stream_flush low = 0.013

stream_flush low_date = Thu Sep  2 05:44:59 2010

stream_timeout avg = 181.641

stream_timeout high = 3578

stream_timeout high_date = Sun Sep  5 20:50:12 2010

stream_timeout low = 1

stream_timeout low_date = Wed Sep  1 11:50:25 2010

synacks avg = 0.108

synacks high = 2.771

synacks high_date = Mon Sep  6 12:42:56 2010

synacks low = 0.006

synacks low_date = Sat Sep  4 00:58:27 2010

syns avg = 0.121

syns high = 6.072

syns high_date = Mon Sep  6 05:52:07 2010

syns low = 0.019

syns low_date = Fri Sep  3 20:12:36 2010

```