From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v7 0/9] xen/x86: various XPTI speedups
Date: Fri, 13 Apr 2018 12:29:25 +0200
Message-ID: <35e9dc0e-3756-cdaf-e632-57c4b60e015a@suse.com>
References: <20180412180944.31735-1-jgross@suse.com>
 <61c5b514-2198-e13e-e349-d13f72935e55@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------1706D2688DC7C7B79E2B727F"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=adv8=hc=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f6vxR-00013a-ME
 for xen-devel@lists.xenproject.org; Fri, 13 Apr 2018 10:29:29 +0000
In-Reply-To: <61c5b514-2198-e13e-e349-d13f72935e55@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--------------1706D2688DC7C7B79E2B727F
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 13/04/18 11:59, Andrew Cooper wrote:
> On 12/04/18 19:09, Juergen Gross wrote:
>> This patch series aims at reducing the overhead of the XPTI Meltdown
>> mitigation.
> 
> Sadly, there are still problems. 
> 
> (XEN) [   13.486805] Dom0 has maximum 2 VCPUs
> (XEN) [   13.486824] ----[ Xen-4.11.0-5.0.3-d  x86_64  debug=y   Not tainted ]----
> (XEN) [   13.486826] CPU:    0
> (XEN) [   13.486828] RIP:    e008:[<ffff82d0802885f4>] switch_cr3_cr4+0x58/0x116
> (XEN) [   13.486833] RFLAGS: 0000000000010086   CONTEXT: hypervisor
> (XEN) [   13.486836] rax: 00000000000000df   rbx: 0000000000000282   rcx: ffff82d0804b7fff
> (XEN) [   13.486839] rdx: 0000000000152660   rsi: 00000000001526e0   rdi: 8000001071d4a000
> (XEN) [   13.486841] rbp: ffff82d0804b78d8   rsp: ffff82d0804b78a8   r8:  0000000000000000
> (XEN) [   13.486844] r9:  0000ffff0000ffff   r10: 00ff00ff00ff00ff   r11: 0f0f0f0f0f0f0f0f
> (XEN) [   13.486847] r12: 8000001071d4a000   r13: 0000000057ea8000   r14: 00000000001526e0
> (XEN) [   13.486849] r15: ffff83107326f000   cr0: 000000008005003b   cr4: 0000000000152660
> (XEN) [   13.486851] cr3: 0000000057ea8000   cr2: 0000000000000000
> (XEN) [   13.486853] fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
> (XEN) [   13.486855] ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
> (XEN) [   13.486859] Xen code around <ffff82d0802885f4> (switch_cr3_cr4+0x58/0x116):
> (XEN) [   13.486860]  00 00 66 0f 38 82 4d d0 <41> 0f 22 dc 4c 39 f2 75 56 4c 89 ea 81 e2 ff 0f
> (XEN) [   13.486869] Xen stack trace from rsp=ffff82d0804b78a8:
> (XEN) [   13.486870]    ffff82d0804b78d8 ffff82d0804466a2 ffff83005a1f1000 0000000000000002
> (XEN) [   13.486874]    ffffffff82000000 ffff830000060fa0 ffff82d0804b7d68 ffff82d08044349e
> (XEN) [   13.486878]    0000000000000000 ffff830000060fa0 ffffffff82000000 0000000000000ff0
> (XEN) [   13.486881]    0000000000000000 0000001071d4c000 ffff831071d4b000 ffff831071d4c000
> (XEN) [   13.486884]    ffffffff81d49000 0000000000000000 0000000000000013 ffff831071d4dff8
> (XEN) [   13.486887]    0000001071d5c000 ffff831071d4d000 ffffffff81d5e000 ffffffff81000000
> (XEN) [   13.486891]    0000000001072000 0000001071d5d000 ffffffff81d4a000 ffffffff81d49000
> (XEN) [   13.486894]    ffff831071d4c080 0000000000002000 0000000001070000 ffffffff81d49000
> (XEN) [   13.486897]    ffffffff82000000 ffff831071d4aff8 0000000000002000 0000000000000001
> (XEN) [   13.486900]    0000008000200000 0000008000000000 000000000000570a 0000000000040000
> (XEN) [   13.486903]    0000000000000000 ffffffff80000000 ffff831071d4dff0 ffff82d080485580
> (XEN) [   13.486907]    ffff83005a1f1000 0000000005709ac2 0000000000000000 ffff832079bd182c
> (XEN) [   13.486910]    ffff832079bd19e8 0000000000000000 0000000000000000 0000000000000000
> (XEN) [   13.486913]    0000000000000001 ffff82d0803fd5e8 ffffffff81b051f0 0000000000000001
> (XEN) [   13.486916]    ffff82d0803fd436 ffffffff81001000 0000000000000001 ffff82d0803fd410
> (XEN) [   13.486919]    ffffffff80000000 0000000000000001 ffff82d0803fd429 0000000000000000
> (XEN) [   13.486923]    0000000000000002 ffff82d0803fd578 ffff832079bd1868 0000000000000002
> (XEN) [   13.486926]    ffff82d0803fd3d4 ffff832079bd183c 0000000000000002 ffff82d0803fd584
> (XEN) [   13.486929]    ffff832079bd1854 0000000000000002 ffff82d0803fd3cd ffff832079bd1944
> (XEN) [   13.486933]    0000000000000002 ffff82d0803fd592 ffff832079bd1930 0000000000000002
> (XEN) [   13.486936] Xen call trace:
> (XEN) [   13.486938]    [<ffff82d0802885f4>] switch_cr3_cr4+0x58/0x116
> (XEN) [   13.486942]    [<ffff82d08044349e>] dom0_construct_pv+0x1bb1/0x29e3
> (XEN) [   13.486945]    [<ffff82d0804470ba>] construct_dom0+0x8c/0xb86
> (XEN) [   13.486949]    [<ffff82d080437fd3>] __start_xen+0x23c4/0x2629
> (XEN) [   13.486952]    [<ffff82d0802000f3>] __high_start+0x53/0x58
> (XEN) [   13.486954]
> (XEN) [   14.047278]
> (XEN) [   14.049274] ****************************************
> (XEN) [   14.054734] Panic on CPU 0:
> (XEN) [   14.058026] GENERAL PROTECTION FAULT
> (XEN) [   14.062099] [error_code=0000]
> (XEN) [   14.065565] ****************************************
> (XEN) [   14.071024]
> (XEN) [   14.073018] Reboot in five seconds...
> 
> The faulting instruction is `mov %r12, %cr3` which is trying to use
> noflush while %cr4.pcide is clear.

While I can see how that happened I'm not sure why I didn't hit this
when testing my series. Could it be some cpus won't GP in this case?

Could you try the series without the last patch? Maybe it would be
possible to commit some of the patches at least.

I'm just about to leave for the Linux root conference in Kiev, so the
patch attached is only compile tested. You might want to try that.


Juergen


--------------1706D2688DC7C7B79E2B727F
Content-Type: text/x-patch;
 name="fixup.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="fixup.patch"

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 22c5150444..34c77bcbe4 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -718,7 +718,7 @@ int __init dom0_construct_pv(struct domain *d,
         update_cr3(v);
 
     /* We run on dom0's page tables for the final part of the build process. */
-    switch_cr3_cr4(v->arch.cr3, read_cr4());
+    switch_cr3_cr4(cr3_pa(v->arch.cr3), read_cr4());
     mapcache_override_current(v);
 
     /* Copy the OS image and free temporary buffer. */

--------------1706D2688DC7C7B79E2B727F
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------1706D2688DC7C7B79E2B727F--
