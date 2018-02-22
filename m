From: xen@randomwebstuff.com
Subject: pvh+vcpus startup issue
Date: Thu, 22 Feb 2018 17:37:42 +1300
Message-ID: <c22ca929-cb20-aaf2-f4ce-a9790759eaff@rimuhosting.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------1F1C4A869FD561205B2A1B40"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=wvei=fq=rimuhosting.com=peter@srs-us1.protection.inumbo.net>)
 id 1eoidm-0003N0-5l
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2018 04:37:54 +0000
Received: from mail.rimuhosting.com (localhost [127.0.0.1])
 by mail.rimuhosting.com (Postfix) with ESMTP id 1CFA961807
 for <xen-devel@lists.xenproject.org>; Thu, 22 Feb 2018 04:37:45 +0000 (UTC)
Received: from [10.253.193.96] (115-188-142-103.jetstream.xtra.co.nz
 [115.188.142.103])
 by mail.rimuhosting.com (Postfix) with ESMTPSA id 4E394617FF
 for <xen-devel@lists.xenproject.org>; Thu, 22 Feb 2018 04:37:44 +0000 (UTC)
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--------------1F1C4A869FD561205B2A1B40
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi.  I have a domU.  Its params file has: vcpus = 8.  It will start with 
pv, but not type="pvh".  It will not start (on pvh) with vcpus = 7 or 6 
or 5.  It does start with vcpus = 4.

I diffed the xl -v create logs, no difference there on either startup.

I grabbed the domU console output for a vcpus = 5 start (attached).  It 
dies right after:

[    0.007110] cpu 3 spinlock event irq 23
[    0.007336] installing Xen timer for CPU 4

I think this issue is only affecting some CPUs.  So it might be related 
to some CPU calculation/allocation code?

I see xl info reports nr_nodes to be 1.  This is a server with two E5420 
CPUs.  I see other dual socket, dual CPU servers (e.g. E5410, E5310) 
that report at nr_nodes 1 .

I also see one newer CPU that I'd expect to have nr_nodes 2.

nr_cpus                : 20nr_nodes               : 
1cores_per_socket       : 10threads_per_core       : 2 model name    : 
Intel(R) Xeon(R) CPU E5-2640 v4 @ 2.40GHz

I note that a v3 version of that CPU reports nr_nodes 2 as I would expect.

nr_cpus                : 32nr_nodes               : 
2cores_per_socket       : 8threads_per_core       : 2 model name    : 
Intel(R) Xeon(R) CPU E5-2640 v3 @ 2.60GHz

# xl info
release                : 4.14.12-2.el6xen.x86_64
version                : #2 SMP Sat Jan 6 03:49:33 UTC 2018
machine                : x86_64
nr_cpus                : 8
max_cpu_id             : 7
nr_nodes               : 1
cores_per_socket       : 4
threads_per_core       : 1
cpu_mhz                : 2500
hw_caps                : 
bfebfbff:040ce3bd:20100800:00000001:00000000:00000000:00000000:00000000
virt_caps              : hvm
total_memory           : 64766
free_memory            : 15433
sharing_freed_memory   : 0
sharing_used_memory    : 0
outstanding_claims     : 0
free_cpus              : 0
xen_major              : 4
xen_minor              : 10
xen_extra              : .0
xen_version            : 4.10.0
xen_caps               : xen-3.0-x86_64 xen-3.0-x86_32p hvm-3.0-x86_32 
hvm-3.0-x86_32p hvm-3.0-x86_64
xen_scheduler          : credit
xen_pagesize           : 4096
platform_params        : virt_start=0xffff800000000000
xen_changeset          :
xen_commandline        : dom0_mem=2048M cpufreq=xen dom0_max_vcpus=2 
dom0_vcpus_pin loglvl=info vcpu_migration_delay=1000
cc_compiler            : gcc (GCC) 4.4.7 20120313 (Red Hat 4.4.7-18)
cc_compile_by          : build
cc_compile_date        : Sun Jan  7 23:45:02 UTC 2018
build_id               : f61b02cac217640909b4c2d0f07ba50e0fe0f3d1
xend_config_format     : 4


cat /proc/cpuinfo

processor    : 0
vendor_id    : GenuineIntel
cpu family    : 6
model        : 23
model name    : Intel(R) Xeon(R) CPU           E5420  @ 2.50GHz

...

processor    : 1
vendor_id    : GenuineIntel
cpu family    : 6
model        : 23
model name    : Intel(R) Xeon(R) CPU           E5420  @ 2.50GHz

Possibly related to

https://lists.xenproject.org/archives/html/xen-devel/2018-01/msg01471.html

https://lists.xen.org/archives/html/xen-users/2018-01/msg00031.html

https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=7209b8bf08700b1ed3b7dd15c6ca0b76f537ddb3 
"
x86: Don't use potentially incorrect CPUID values for topology information"

Regards, Peter


--------------1F1C4A869FD561205B2A1B40
Content-Type: text/plain; charset=UTF-8;
 name="vcpu5startup.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="vcpu5startup.txt"

WyAgICAwLjAwMDAwMF0gQ29tbWFuZCBsaW5lOiByb290PS9kZXYveHZkYTEgcm8gY29uc29s
ZT1odmMwIGVsZXZhdG9yPW5vb3AgeGVuLWJsa2Zyb250Lm1heD02NCBpbml0PS9iaW4vYmFz
aApbICAgIDAuMDAwMDAwXSB4ODYvZnB1OiBTdXBwb3J0aW5nIFhTQVZFIGZlYXR1cmUgMHgw
MDE6ICd4ODcgZmxvYXRpbmcgcG9pbnQgcmVnaXN0ZXJzJwpbICAgIDAuMDAwMDAwXSB4ODYv
ZnB1OiBTdXBwb3J0aW5nIFhTQVZFIGZlYXR1cmUgMHgwMDI6ICdTU0UgcmVnaXN0ZXJzJwpb
ICAgIDAuMDAwMDAwXSB4ODYvZnB1OiBFbmFibGVkIHhzdGF0ZSBmZWF0dXJlcyAweDMsIGNv
bnRleHQgc2l6ZSBpcyA1NzYgYnl0ZXMsIHVzaW5nICdzdGFuZGFyZCcgZm9ybWF0LgpbICAg
IDAuMDAwMDAwXSBlODIwOiBCSU9TLXByb3ZpZGVkIHBoeXNpY2FsIFJBTSBtYXA6ClsgICAg
MC4wMDAwMDBdIEJJT1MtZTgyMDogW21lbSAweDAwMDAwMDAwMDAwMDAwMDAtMHgwMDAwMDAw
MDAwMDlmZmZmXSB1c2FibGUKWyAgICAwLjAwMDAwMF0gQklPUy1lODIwOiBbbWVtIDB4MDAw
MDAwMDAwMDBhMDAwMC0weDAwMDAwMDAwMDAwZmVmZmZdIHJlc2VydmVkClsgICAgMC4wMDAw
MDBdIEJJT1MtZTgyMDogW21lbSAweDAwMDAwMDAwMDAwZmYwMDAtMHgwMDAwMDAwMDAwMGZm
ZmZmXSBBQ1BJIGRhdGEKWyAgICAwLjAwMDAwMF0gQklPUy1lODIwOiBbbWVtIDB4MDAwMDAw
MDAwMDEwMDAwMC0weDAwMDAwMDAwODAwMDAzZmZdIHVzYWJsZQpbICAgIDAuMDAwMDAwXSBC
SU9TLWU4MjA6IFttZW0gMHgwMDAwMDAwMGZjMDAwMDAwLTB4MDAwMDAwMDBmYzAwN2ZmZl0g
QUNQSSBkYXRhClsgICAgMC4wMDAwMDBdIE5YIChFeGVjdXRlIERpc2FibGUpIHByb3RlY3Rp
b246IGFjdGl2ZQpbICAgIDAuMDAwMDAwXSBETUkgbm90IHByZXNlbnQgb3IgaW52YWxpZC4K
WyAgICAwLjAwMDAwMF0gSHlwZXJ2aXNvciBkZXRlY3RlZDogWGVuIEhWTQpbICAgIDAuMDAw
MDAwXSBYZW4gdmVyc2lvbiA0LjEwLgpbICAgIDAuMDAwMDAwXSBYZW4gUGxhdGZvcm0gUENJ
OiB1bnJlY29nbmlzZWQgbWFnaWMgdmFsdWUKWyAgICAwLjAwMDAwMF0gdHNjOiBGYXN0IFRT
QyBjYWxpYnJhdGlvbiBmYWlsZWQKWyAgICAwLjAwMDAwMF0gdHNjOiBVbmFibGUgdG8gY2Fs
aWJyYXRlIGFnYWluc3QgUElUClsgICAgMC4wMDAwMDBdIHRzYzogTm8gcmVmZXJlbmNlIChI
UEVUL1BNVElNRVIpIGF2YWlsYWJsZQpbICAgIDAuMDAwMDAwXSBlODIwOiBsYXN0X3BmbiA9
IDB4ODAwMDAgbWF4X2FyY2hfcGZuID0gMHg0MDAwMDAwMDAKWyAgICAwLjAwMDAwMF0gTVRS
UjogRGlzYWJsZWQKWyAgICAwLjAwMDAwMF0geDg2L1BBVDogTVRSUnMgZGlzYWJsZWQsIHNr
aXBwaW5nIFBBVCBpbml0aWFsaXphdGlvbiB0b28uClsgICAgMC4wMDAwMDBdIENQVSBNVFJS
cyBhbGwgYmxhbmsgLSB2aXJ0dWFsaXplZCBzeXN0ZW0uClsgICAgMC4wMDAwMDBdIHg4Ni9Q
QVQ6IENvbmZpZ3VyYXRpb24gWzAtN106IFdCICBXVCAgVUMtIFVDICBXQiAgV1QgIFVDLSBV
QyAgClsgICAgMC4wMDAwMDBdIEFDUEk6IEVhcmx5IHRhYmxlIGNoZWNrc3VtIHZlcmlmaWNh
dGlvbiBkaXNhYmxlZApbICAgIDAuMDAwMDAwXSBBQ1BJOiBSU0RQIDB4MDAwMDAwMDAwMDBG
RkZDMCAwMDAwMjQgKHYwMiBYZW4gICApClsgICAgMC4wMDAwMDBdIEFDUEk6IFhTRFQgMHgw
MDAwMDAwMEZDMDA3RjgwIDAwMDAzNCAodjAxIFhlbiAgICBIVk0gICAgICAwMDAwMDAwMCBI
Vk1MIDAwMDAwMDAwKQpbICAgIDAuMDAwMDAwXSBBQ1BJOiBGQUNQIDB4MDAwMDAwMDBGQzAw
N0Q3MCAwMDAxMEMgKHYwNSBYZW4gICAgSFZNICAgICAgMDAwMDAwMDAgSFZNTCAwMDAwMDAw
MCkKWyAgICAwLjAwMDAwMF0gQUNQSTogRFNEVCAweDAwMDAwMDAwRkMwMDEwNTAgMDA2QzlC
ICh2MDUgWGVuICAgIEhWTSAgICAgIDAwMDAwMDAwIElOVEwgMjAwOTAxMjMpClsgICAgMC4w
MDAwMDBdIEFDUEk6IEZBQ1MgMHgwMDAwMDAwMEZDMDAxMDEwIDAwMDA0MApbICAgIDAuMDAw
MDAwXSBBQ1BJOiBGQUNTIDB4MDAwMDAwMDBGQzAwMTAxMCAwMDAwNDAKWyAgICAwLjAwMDAw
MF0gQUNQSTogQVBJQyAweDAwMDAwMDAwRkMwMDdFODAgMDAwMDU0ICh2MDIgWGVuICAgIEhW
TSAgICAgIDAwMDAwMDAwIEhWTUwgMDAwMDAwMDApClsgICAgMC4wMDAwMDBdIE5vIE5VTUEg
Y29uZmlndXJhdGlvbiBmb3VuZApbICAgIDAuMDAwMDAwXSBGYWtpbmcgYSBub2RlIGF0IFtt
ZW0gMHgwMDAwMDAwMDAwMDAwMDAwLTB4MDAwMDAwMDA3ZmZmZmZmZl0KWyAgICAwLjAwMDAw
MF0gTk9ERV9EQVRBKDApIGFsbG9jYXRlZCBbbWVtIDB4N2ZmZmMwMDAtMHg3ZmZmZmZmZl0K
WyAgICAwLjAwMDAwMF0gWm9uZSByYW5nZXM6ClsgICAgMC4wMDAwMDBdICAgRE1BICAgICAg
W21lbSAweDAwMDAwMDAwMDAwMDEwMDAtMHgwMDAwMDAwMDAwZmZmZmZmXQpbICAgIDAuMDAw
MDAwXSAgIERNQTMyICAgIFttZW0gMHgwMDAwMDAwMDAxMDAwMDAwLTB4MDAwMDAwMDA3ZmZm
ZmZmZl0KWyAgICAwLjAwMDAwMF0gICBOb3JtYWwgICBlbXB0eQpbICAgIDAuMDAwMDAwXSBN
b3ZhYmxlIHpvbmUgc3RhcnQgZm9yIGVhY2ggbm9kZQpbICAgIDAuMDAwMDAwXSBFYXJseSBt
ZW1vcnkgbm9kZSByYW5nZXMKWyAgICAwLjAwMDAwMF0gICBub2RlICAgMDogW21lbSAweDAw
MDAwMDAwMDAwMDEwMDAtMHgwMDAwMDAwMDAwMDlmZmZmXQpbICAgIDAuMDAwMDAwXSAgIG5v
ZGUgICAwOiBbbWVtIDB4MDAwMDAwMDAwMDEwMDAwMC0weDAwMDAwMDAwN2ZmZmZmZmZdClsg
ICAgMC4wMDAwMDBdIEluaXRtZW0gc2V0dXAgbm9kZSAwIFttZW0gMHgwMDAwMDAwMDAwMDAx
MDAwLTB4MDAwMDAwMDA3ZmZmZmZmZl0KWyAgICAwLjAwMDAwMF0gQUNQSTogTm8gSU9BUElD
IGVudHJpZXMgcHJlc2VudApbICAgIDAuMDAwMDAwXSBVc2luZyBBQ1BJIGZvciBwcm9jZXNz
b3IgKExBUElDKSBjb25maWd1cmF0aW9uIGluZm9ybWF0aW9uClsgICAgMC4wMDAwMDBdIHNt
cGJvb3Q6IEFsbG93aW5nIDUgQ1BVcywgMCBob3RwbHVnIENQVXMKWyAgICAwLjAwMDAwMF0g
ZTgyMDogW21lbSAweDgwMDAwNDAwLTB4ZmJmZmZmZmZdIGF2YWlsYWJsZSBmb3IgUENJIGRl
dmljZXMKWyAgICAwLjAwMDAwMF0gQm9vdGluZyBwYXJhdmlydHVhbGl6ZWQga2VybmVsIG9u
IFhlbiBQVkgKWyAgICAwLjAwMDAwMF0gY2xvY2tzb3VyY2U6IHJlZmluZWQtamlmZmllczog
bWFzazogMHhmZmZmZmZmZiBtYXhfY3ljbGVzOiAweGZmZmZmZmZmLCBtYXhfaWRsZV9uczog
MTkxMDk2OTk0MDM5MTQxOSBucwpbICAgIDAuMDAwMDAwXSByYW5kb206IGZhc3QgaW5pdCBk
b25lClsgICAgMC4wMDAwMDBdIHNldHVwX3BlcmNwdTogTlJfQ1BVUzo2NCBucl9jcHVtYXNr
X2JpdHM6NjQgbnJfY3B1X2lkczo1IG5yX25vZGVfaWRzOjEKWyAgICAwLjAwMDAwMF0gcGVy
Y3B1OiBFbWJlZGRlZCA0MSBwYWdlcy9jcHUgQGZmZmY4ODAwN2QwMDAwMDAgczEzODUyMCBy
MCBkMjk0MTYgdTEwNDg1NzYKWyAgICAwLjAwMDAwMF0gUFYgcXNwaW5sb2NrIGhhc2ggdGFi
bGUgZW50cmllczogMjU2IChvcmRlcjogMCwgNDA5NiBieXRlcykKWyAgICAwLjAwMDAwMF0g
QnVpbHQgMSB6b25lbGlzdHMsIG1vYmlsaXR5IGdyb3VwaW5nIG9uLiAgVG90YWwgcGFnZXM6
IDUxNTk5MQpbICAgIDAuMDAwMDAwXSBQb2xpY3kgem9uZTogRE1BMzIKWyAgICAwLjAwMDAw
MF0gS2VybmVsIGNvbW1hbmQgbGluZTogcm9vdD0vZGV2L3h2ZGExIHJvIGNvbnNvbGU9aHZj
MCBlbGV2YXRvcj1ub29wIHhlbi1ibGtmcm9udC5tYXg9NjQgaW5pdD0vYmluL2Jhc2gKWyAg
ICAwLjAwMDAwMF0gbG9nX2J1Zl9sZW4gaW5kaXZpZHVhbCBtYXggY3B1IGNvbnRyaWJ1dGlv
bjogNjU1MzYgYnl0ZXMKWyAgICAwLjAwMDAwMF0gbG9nX2J1Zl9sZW4gdG90YWwgY3B1X2V4
dHJhIGNvbnRyaWJ1dGlvbnM6IDI2MjE0NCBieXRlcwpbICAgIDAuMDAwMDAwXSBsb2dfYnVm
X2xlbiBtaW4gc2l6ZTogNjU1MzYgYnl0ZXMKWyAgICAwLjAwMDAwMF0gbG9nX2J1Zl9sZW46
IDUyNDI4OCBieXRlcwpbICAgIDAuMDAwMDAwXSBlYXJseSBsb2cgYnVmIGZyZWU6IDU5ODg4
KDkxJSkKWyAgICAwLjAwMDAwMF0gUElEIGhhc2ggdGFibGUgZW50cmllczogNDA5NiAob3Jk
ZXI6IDMsIDMyNzY4IGJ5dGVzKQpbICAgIDAuMDAwMDAwXSBNZW1vcnk6IDIwMzIyMzZLLzIw
OTY3NjRLIGF2YWlsYWJsZSAoMTYzOTZLIGtlcm5lbCBjb2RlLCAxMDA5SyByd2RhdGEsIDMy
MDhLIHJvZGF0YSwgMTEyMEsgaW5pdCwgNjUySyBic3MsIDY0NTI4SyByZXNlcnZlZCwgMEsg
Y21hLXJlc2VydmVkKQpbICAgIDAuMDAwMDAwXSBTTFVCOiBIV2FsaWduPTY0LCBPcmRlcj0w
LTMsIE1pbk9iamVjdHM9MCwgQ1BVcz01LCBOb2Rlcz0xClsgICAgMC4wMDAwMDBdIEtlcm5l
bC9Vc2VyIHBhZ2UgdGFibGVzIGlzb2xhdGlvbjogZW5hYmxlZApbICAgIDAuMDAxMDAwXSBI
aWVyYXJjaGljYWwgUkNVIGltcGxlbWVudGF0aW9uLgpbICAgIDAuMDAxMDAwXSAJUkNVIHJl
c3RyaWN0aW5nIENQVXMgZnJvbSBOUl9DUFVTPTY0IHRvIG5yX2NwdV9pZHM9NS4KWyAgICAw
LjAwMTAwMF0gUkNVOiBBZGp1c3RpbmcgZ2VvbWV0cnkgZm9yIHJjdV9mYW5vdXRfbGVhZj0x
NiwgbnJfY3B1X2lkcz01ClsgICAgMC4wMDEwMDBdIFVzaW5nIE5VTEwgbGVnYWN5IFBJQwpb
ICAgIDAuMDAxMDAwXSBOUl9JUlFTOiA0MzUyLCBucl9pcnFzOiA5NiwgcHJlYWxsb2NhdGVk
IGlycXM6IDAKWyAgICAwLjAwMTAwMF0geGVuOmV2ZW50czogVXNpbmcgRklGTy1iYXNlZCBB
QkkKWyAgICAwLjAwMTAwMF0geGVuOmV2ZW50czogWGVuIEhWTSBjYWxsYmFjayB2ZWN0b3Ig
Zm9yIGV2ZW50IGRlbGl2ZXJ5IGlzIGVuYWJsZWQKWyAgICAwLjAwMTAwMF0gQ29uc29sZTog
Y29sb3VyIGR1bW15IGRldmljZSA4MHgyNQpbICAgIDAuMDAxMDAwXSBjb25zb2xlIFtodmMw
XSBlbmFibGVkClsgICAgMC4wMDEwMDBdIHRzYzogRmFzdCBUU0MgY2FsaWJyYXRpb24gZmFp
bGVkClsgICAgMC4wMDEwMDBdIHRzYzogVW5hYmxlIHRvIGNhbGlicmF0ZSBhZ2FpbnN0IFBJ
VApbICAgIDAuMDAxMDAwXSB0c2M6IE5vIHJlZmVyZW5jZSAoSFBFVC9QTVRJTUVSKSBhdmFp
bGFibGUKWyAgICAwLjAwMTAwMF0gdHNjOiBEZXRlY3RlZCAyNTAwLjA5OCBNSHogcHJvY2Vz
c29yClsgICAgMC4wMDEwMDBdIENhbGlicmF0aW5nIGRlbGF5IGxvb3AgKHNraXBwZWQpLCB2
YWx1ZSBjYWxjdWxhdGVkIHVzaW5nIHRpbWVyIGZyZXF1ZW5jeS4uIDUwMDAuMTkgQm9nb01J
UFMgKGxwaj0yNTAwMDk4KQpbICAgIDAuMDAxMDAwXSBwaWRfbWF4OiBkZWZhdWx0OiAzMjc2
OCBtaW5pbXVtOiAzMDEKWyAgICAwLjAwMTAwMF0gQUNQSTogQ29yZSByZXZpc2lvbiAyMDE3
MDcyOApbICAgIDAuMDAxMDAwXSBBQ1BJOiAxIEFDUEkgQU1MIHRhYmxlcyBzdWNjZXNzZnVs
bHkgYWNxdWlyZWQgYW5kIGxvYWRlZApbICAgIDAuMDAxMDAwXSBBQ1BJOiBzZXR0aW5nIEVM
Q1IgdG8gMDIwMCAoZnJvbSBmZmZmKQpbICAgIDAuMDAxMDAwXSBTZWN1cml0eSBGcmFtZXdv
cmsgaW5pdGlhbGl6ZWQKWyAgICAwLjAwMTAwMF0gQXBwQXJtb3I6IEFwcEFybW9yIGRpc2Fi
bGVkIGJ5IGJvb3QgdGltZSBwYXJhbWV0ZXIKWyAgICAwLjAwMTAwMF0gRGVudHJ5IGNhY2hl
IGhhc2ggdGFibGUgZW50cmllczogMjYyMTQ0IChvcmRlcjogOSwgMjA5NzE1MiBieXRlcykK
WyAgICAwLjAwMTAwMF0gSW5vZGUtY2FjaGUgaGFzaCB0YWJsZSBlbnRyaWVzOiAxMzEwNzIg
KG9yZGVyOiA4LCAxMDQ4NTc2IGJ5dGVzKQpbICAgIDAuMDAxMDAwXSBNb3VudC1jYWNoZSBo
YXNoIHRhYmxlIGVudHJpZXM6IDQwOTYgKG9yZGVyOiAzLCAzMjc2OCBieXRlcykKWyAgICAw
LjAwMTAwMF0gTW91bnRwb2ludC1jYWNoZSBoYXNoIHRhYmxlIGVudHJpZXM6IDQwOTYgKG9y
ZGVyOiAzLCAzMjc2OCBieXRlcykKWyAgICAwLjAwMTAwMF0gQ1BVOiBQaHlzaWNhbCBQcm9j
ZXNzb3IgSUQ6IDAKWyAgICAwLjAwMTAwMF0gQ1BVOiBQcm9jZXNzb3IgQ29yZSBJRDogMApb
ICAgIDAuMDAxMDAwXSBMYXN0IGxldmVsIGlUTEIgZW50cmllczogNEtCIDEyOCwgMk1CIDQs
IDRNQiA0ClsgICAgMC4wMDEwMDBdIExhc3QgbGV2ZWwgZFRMQiBlbnRyaWVzOiA0S0IgMjU2
LCAyTUIgMCwgNE1CIDMyLCAxR0IgMApbICAgIDAuMDAxMDAwXSBTcGVjdHJlIFYyIDoga2Vy
bmVsIG5vdCBjb21waWxlZCB3aXRoIHJldHBvbGluZTsgbm8gbWl0aWdhdGlvbiBhdmFpbGFi
bGUhClsgICAgMC4wMDEwMDBdIEZyZWVpbmcgU01QIGFsdGVybmF0aXZlcyBtZW1vcnk6IDYw
SwpbICAgIDAuMDAxMDAwXSBzbXBib290OiBNYXggbG9naWNhbCBwYWNrYWdlczogMQpbICAg
IDAuMDAxMDAwXSBjbG9ja3NvdXJjZTogeGVuOiBtYXNrOiAweGZmZmZmZmZmZmZmZmZmZmYg
bWF4X2N5Y2xlczogMHgxY2Q0MmU0ZGZmYiwgbWF4X2lkbGVfbnM6IDg4MTU5MDU5MTQ4MyBu
cwpbICAgIDAuMDAxMDAwXSBpbnN0YWxsaW5nIFhlbiB0aW1lciBmb3IgQ1BVIDAKWyAgICAw
LjAwMTAwMF0gc21wYm9vdDogQ1BVMDogSW50ZWwoUikgWGVvbihSKSBDUFUgICAgICAgICAg
IEU1NDIwICBAIDIuNTBHSHogKGZhbWlseTogMHg2LCBtb2RlbDogMHgxNywgc3RlcHBpbmc6
IDB4YSkKWyAgICAwLjAwMTAwMF0gY3B1IDAgc3BpbmxvY2sgZXZlbnQgaXJxIDUKWyAgICAw
LjAwMTAwMF0gUGVyZm9ybWFuY2UgRXZlbnRzOiB1bnN1cHBvcnRlZCBwNiBDUFUgbW9kZWwg
MjMgbm8gUE1VIGRyaXZlciwgc29mdHdhcmUgZXZlbnRzIG9ubHkuClsgICAgMC4wMDEwMDBd
IEhpZXJhcmNoaWNhbCBTUkNVIGltcGxlbWVudGF0aW9uLgpbICAgIDAuMDAxMjM0XSBzbXA6
IEJyaW5naW5nIHVwIHNlY29uZGFyeSBDUFVzIC4uLgpbICAgIDAuMDAxNTYyXSBpbnN0YWxs
aW5nIFhlbiB0aW1lciBmb3IgQ1BVIDEKWyAgICAwLjAwMTYyM10geDg2OiBCb290aW5nIFNN
UCBjb25maWd1cmF0aW9uOgpbICAgIDAuMDAxNjMzXSAuLi4uIG5vZGUgICMwLCBDUFVzOiAg
ICAgICMxClsgICAgMC4wMDMwOTJdIGNwdSAxIHNwaW5sb2NrIGV2ZW50IGlycSAxMQpbICAg
IDAuMDAzMjkwXSBpbnN0YWxsaW5nIFhlbiB0aW1lciBmb3IgQ1BVIDIKWyAgICAwLjAwMzM2
Nl0gICMyClsgICAgMC4wMDUxNjddIGNwdSAyIHNwaW5sb2NrIGV2ZW50IGlycSAxNwpbICAg
IDAuMDA1MzAwXSBpbnN0YWxsaW5nIFhlbiB0aW1lciBmb3IgQ1BVIDMKWyAgICAwLjAwNTM2
MF0gICMzClsgICAgMC4wMDcxMTBdIGNwdSAzIHNwaW5sb2NrIGV2ZW50IGlycSAyMwpbICAg
IDAuMDA3MzM2XSBpbnN0YWxsaW5nIFhlbiB0aW1lciBmb3IgQ1BVIDQKCnZtIGFwcGVhcnMg
dG8gYmUgZGVzdHJveSBhdC9hZnRlciB0aGlzIHBvaW50
--------------1F1C4A869FD561205B2A1B40
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------1F1C4A869FD561205B2A1B40--
