From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: AMD EPYC Topology problems
Date: Sun, 2 Dec 2018 20:23:05 +0000
Message-ID: <7369db0c-4917-0807-eef4-cba5e5ae0d4e@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0434723652798788372=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel List <xen-devel@lists.xen.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Jan Beulich <JBeulich@suse.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, SuraveeSuthikulpanit <suravee.suthikulpanit@amd.com>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Brian Woods <brian.woods@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brijesh Singh <brijeshkumar.singh@amd.com>
List-Id: xen-devel@lists.xenproject.org

--===============0434723652798788372==
Content-Type: multipart/alternative;
	boundary="------------6A970018E576025AD14B02A5"
Content-Language: en-GB

--------------6A970018E576025AD14B02A5
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hello,

I have dual socket server with the following processor:

[root@xrtmia-09-01 ~]# head /proc/cpuinfo 
processor	: 0
vendor_id	: AuthenticAMD
cpu family	: 23
model		: 1
model name	: AMD EPYC 7281 16-Core Processor
stepping	: 2

Which has highlighted a issue in the topology derivation logic. 
(Actually, it was discovered with Xen, but we share the same topology
infrastructure and the issue is also present with Linux).

There are a total of 64 threads in the system, made of two 32-thread
sockets.  The APIC IDs for this system are sparse - they are 0x0-0x3,
0x8-0xb, 0x10-0x13 etc, all the way up to 0x7b.

This is because the socket is made of 4 nodes with 4 cores each, but
space has been left in the layout for the maximum possible number of
APIC IDs.

In particular, CPUID 0x80000008:ecx reports 0x0000601f.  That is, an
APIC ID shift of 6 (reporting a maximum of 64 threads per socket), and
NC as 31 (reporting 32 threads per socket in the current configuration).

c->x86_max_cores is derived from NC and shifted once to exclude threads,
giving it a final value of 16 cores per socket.

Given the sparseness of the APIC IDs, it is unsafe to allocate an array
of c->x86_max_cores entries, then index it with c->cpu_core_id, as half
the cores in the system have a cpu_core_id greater than x86_max_cores. 
There is no logical core ID derived during boot which might be a safe to
use as an index.

Furthermore, the documentation indicates that these values are expected
to be per-package, while they are all actually per-socket (with up to 4
nodes per socket) in the EPYC case.

In the short term, my fix will be to not use c->x86_max_cores for sizing
the array, but I think this discovery warrants a discussion as to
whether the current topology infrastructure/expectations are suitable.

Thanks,

~Andrew

--------------6A970018E576025AD14B02A5
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Hello,<br>
    <br>
    I have dual socket server with the following processor:<br>
    <br>
    <pre>[root@xrtmia-09-01 ~]# head /proc/cpuinfo 
processor	: 0
vendor_id	: AuthenticAMD
cpu family	: 23
model		: 1
model name	: AMD EPYC 7281 16-Core Processor
stepping	: 2

</pre>
    Which has highlighted a issue in the topology derivation logic. 
    (Actually, it was discovered with Xen, but we share the same
    topology infrastructure and the issue is also present with Linux).<br>
    <br>
    There are a total of 64 threads in the system, made of two 32-thread
    sockets.  The APIC IDs for this system are sparse - they are
    0x0-0x3, 0x8-0xb, 0x10-0x13 etc, all the way up to 0x7b.<br>
    <br>
    This is because the socket is made of 4 nodes with 4 cores each, but
    space has been left in the layout for the maximum possible number of
    APIC IDs.<br>
    <br>
    In particular, CPUID 0x80000008:ecx reports 0x0000601f.  That is, an
    APIC ID shift of 6 (reporting a maximum of 64 threads per socket),
    and NC as 31 (reporting 32 threads per socket in the current
    configuration).<br>
    <br>
    c-&gt;x86_max_cores is derived from NC and shifted once to exclude
    threads, giving it a final value of 16 cores per socket.<br>
    <br>
    Given the sparseness of the APIC IDs, it is unsafe to allocate an
    array of c-&gt;x86_max_cores entries, then index it with
    c-&gt;cpu_core_id, as half the cores in the system have a
    cpu_core_id greater than x86_max_cores.  There is no logical core ID
    derived during boot which might be a safe to use as an index.<br>
    <br>
    Furthermore, the documentation indicates that these values are
    expected to be per-package, while they are all actually per-socket
    (with up to 4 nodes per socket) in the EPYC case.<br>
    <br>
    In the short term, my fix will be to not use c-&gt;x86_max_cores for
    sizing the array, but I think this discovery warrants a discussion
    as to whether the current topology infrastructure/expectations are
    suitable.<br>
    <br>
    Thanks,<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------6A970018E576025AD14B02A5--


--===============0434723652798788372==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0434723652798788372==--
