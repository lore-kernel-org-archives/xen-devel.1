From: Juergen Gross <jgross@suse.com>
Subject: Re: Recent 4.9 kernel not booting as dom0
Date: Thu, 5 Jul 2018 12:57:29 +0200
Message-ID: <adcdd60e-50e4-86ed-3573-efc407ae9b78@suse.com>
References: <CAAzNQHQGhtGReJ=7p=i7nQE72pQdWgsyYRp=K2KBzbqKt3HyLA@mail.gmail.com>
 <755ba9c6-34c8-1a06-73c2-7afbc02b1bbd@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------7144DD7D439A18E95E1C851C"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jouk=jv=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fb1x5-0007Oo-Pd
 for xen-devel@lists.xenproject.org; Thu, 05 Jul 2018 10:57:31 +0000
In-Reply-To: <755ba9c6-34c8-1a06-73c2-7afbc02b1bbd@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Karl Johnson <karljohnson.it@gmail.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--------------7144DD7D439A18E95E1C851C
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 05/07/18 12:19, Juergen Gross wrote:
> On 04/07/18 20:16, Karl Johnson wrote:
>> Hello,
>>
>> I'm building dom0 kernel RPMs for the CentOS Xen project
>> (https://github.com/CentOS-virt7/xen-kernel) and it seems that the 4.9
>> branch isn't booting anymore as dom0. I recently built 4.9.110 and
>> 4.9.111, both give black screen and reboot while booting dom0. Our last
>> successful version is 4.9.105 therefore something must be wrong between
>> 4.9.106 and 4.9.110.
>>
>> I checked the OSSTEST for linux-4.9 and the last working flight was
>> 4.9.101. Is there a known issue with Xen and Linux 4.9?
> 
> I think I've found the reason. Testing a patch right now.

It worked. I have already sent it to stable. In case you want to try
it I'm attaching it for reference.


Juergen

--------------7144DD7D439A18E95E1C851C
Content-Type: text/x-patch;
 name="0001-x86-cpu-Re-apply-forced-caps-every-time-CPU-caps-are.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-x86-cpu-Re-apply-forced-caps-every-time-CPU-caps-are.pa";
 filename*1="tch"

>From cc2872574d060fb3d35fd28c81327ee887f540ef Mon Sep 17 00:00:00 2001
From: Juergen Gross <jgross@suse.com>
Date: Thu, 5 Jul 2018 12:29:48 +0200
Subject: [PATCH-for-4.9-stable] x86/cpu: Re-apply forced caps every time CPU caps are re-read

Calling get_cpu_cap() will reset a bunch of CPU features.  This will
cause the system to lose track of force-set and force-cleared
features in the words that are reset until the end of CPU
initialization.  This can cause X86_FEATURE_FPU, for example, to
change back and forth during boot and potentially confuse CPU setup.

To minimize the chance of confusion, re-apply forced caps every time
get_cpu_cap() is called.

Signed-off-by: Andy Lutomirski <luto@kernel.org>
Reviewed-by: Borislav Petkov <bp@suse.de>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Brian Gerst <brgerst@gmail.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Matthew Whitehead <tedheadster@gmail.com>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Rik van Riel <riel@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Yu-cheng Yu <yu-cheng.yu@intel.com>
Link: http://lkml.kernel.org/r/c817eb373d2c67c2c81413a70fc9b845fa34a37e.1484705016.git.luto@kernel.org
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
upstream commit: 60d3450167433f2d099ce2869dc52dd9e7dc9b29
needed for Xen PV guests to boot, was broken since commit
c43b4ff972a986c85bdd8dc1aa05fe23b29ef99c
---
 arch/x86/kernel/cpu/common.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index b0fd028b2eee..7a4279d8a902 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -848,6 +848,13 @@ void get_cpu_cap(struct cpuinfo_x86 *c)
 
 	init_scattered_cpuid_features(c);
 	init_speculation_control(c);
+
+	/*
+	 * Clear/Set all flags overridden by options, after probe.
+	 * This needs to happen each time we re-probe, which may happen
+	 * several times during CPU initialization.
+	 */
+	apply_forced_caps(c);
 }
 
 static void identify_cpu_without_cpuid(struct cpuinfo_x86 *c)
-- 
2.13.7


--------------7144DD7D439A18E95E1C851C
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------7144DD7D439A18E95E1C851C--
