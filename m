Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E465C55175
	for <xen-devel@archiver.kernel.org>; Sun,  2 Aug 2026 13:10:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1380649.1624412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqVxO-00073e-Ls; Sun, 02 Aug 2026 13:10:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1380649.1624412; Sun, 02 Aug 2026 13:10:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqVxO-00072q-Gf; Sun, 02 Aug 2026 13:10:22 +0000
Received: by outflank-mailman (input) for mailman id 1380649;
 Sun, 02 Aug 2026 13:10:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sergii.dmytruk@3mdeb.com>) id 1wqVxN-0006yB-3h
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 13:10:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqVxM-001lF1-Gh
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 15:10:20 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f41a9-e002-0a2a0a5209dd-0a2a4505e158-16
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:10:20 +0200
Received: from [87.98.181.248] (helo=5.mo560.mail-out.ovh.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f41bb-4cb1-0a2a45050019-5762b5f8891f-3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:10:20 +0200
Received: from director8.ghost.mail-out.ovh.net (unknown [10.110.43.172])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4hCgCH5LSBzB5rZ
 for <xen-devel@lists.xenproject.org>; Sun,  2 Aug 2026 13:10:19 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-mzsh5 (unknown [10.110.113.68])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id E6D71C0120;
 Sun,  2 Aug 2026 13:10:18 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.105])
 by ghost-submission-7d8d68f679-mzsh5 with ESMTPSA
 id fXhJKLpBb2pj5QUAuSgMJA
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 02 Aug 2026 13:10:18 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ovhmo3617313-selector1 header.d=3mdeb.com header.i="@3mdeb.com" header.h=From
Authentication-Results:garm.ovh; auth=pass (GARM-105G0066ba2b957-759b-4dab-a1b9-b171d58bcbdf,
                    A7BD45287BC66A7121136900083CD01C39616B1D) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.215
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@gmail.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v4 12/23] x86/slaunch: restore boot MTRRs after Intel TXT DRTM
Date: Sun,  2 Aug 2026 16:09:28 +0300
Message-ID: <c0fa37704bd04e6e2a1ac4351e95ee3db0245de7.1785668458.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
References: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 4736379434136577468
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEO37Lm1soAj3J6HJwxZueJ91jNrKiCMD9VOxO+7S6oZcwX5ZhHy/rf+u1q3gsSFBR0MQ0G/W66mTSt5xumJoxY/EyDpxdVBT5aAA1fHupbW88f/IumzeClwwf3PGe5NCfIC4rAkaw9D49zl0L3FOqYw1yebY9XQZPEoEgqOhxU7iAITzoi4rSZJugXTxFrfgz5z3QYtYzrLSr0w464iDE2Jv+mfsQyDLbPqlC9XEGpFu9KBxFx07+KPXWsR6kr02Tgk2fJ3ulvjdiKijPJd2EPMcqID96OcOqj/uCF/V+6MYDFkW6NlVR5eWMFf+caoPBoCiQxHguJ/BWn2Nt+/d7LjfFvrcZF/8u8Q0n3PRHV4r3WKIwqRJzxJHPFSQxIKbl3XKNnFvBMXLOpuFHhZH23vljAyKNWXhmDAuNjJx+48Xd79wb1kFhk4s4YAFiFF/CVJN2Zsd6Gpz9N2JkkrsrlXnt3OHFvS8MHgPe6pYWDNjrhVTKEFh1bdt4tWvVVIZ+8woEhh6YA1yerfSR6yGkZEMy4A2UTcafcpvD2uDfNKO9Y5/nle0Uw/V9ra7AnWQwHcMv3n76VKKlBUNHLO4sKlPa1oupiaIcxzn7yOQZWEygxdQF5fsa33PPA/dvi89nZzUt4xXZ20devYMkWwQoLGOCH9fpurC4Yr9x5I7VD7w
DKIM-Signature: a=rsa-sha256; bh=+7PqKj5rgs6xrE/At11/PBfNJMiWB0u0NPN3/ZI5tEc=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1785676219; v=1;
 b=ZiBwsSJKedYzeY7PbMzMY/56bIkaFnx4nGmP5x7pJ99HTIhHDEfiJxpXvWPTdojoG1f8STrF
 6r9KQx0Un0fxHb3PIfDmsI65gi9VAYMbHAyUuK2lrhAfO+WcSea57kcYl/CB1CoQpzvXwkkahWM
 kAAIEhElCVL3uvBsZc+a7rfX0VRKDbRiWrN1oCS5HA59+b1ehsp8GQ2fnp0Cq3yMUYmGQdz5pG4
 KHsZ5RTDOiIFf63ZHzujLfbL5bn5UZzj9SCfzRPwDBUcTqcmVsnkCVkP2lo25Hp3U4fvSQcvg7K
 m9RkXEjA4AgayF4WoQoORDnXUk9oln9P4lr2gLWhjrdyg==
X-purgate-ID: tlsNG-c201ff/1785676220-F74BC2A1-6258F757/0/0
X-purgate-type: clean
X-purgate-size: 8515

From: Krystian Hebel <krystian.hebel@3mdeb.com>

In preparation for TXT SENTER call, GRUB had to modify MTRR settings
to be UC for everything except SINIT ACM. Old values are restored
from SLRT where they were saved by the bootloader.

Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
Signed-off-by: Michał Żygowski <michal.zygowski@3mdeb.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---

Notes:
    v4: now this commit makes two functions of mtrr/generic.c public
    v4: take CONFIG_SLAUNCH into account
    v4: restore MTRRs earlier: move from mtrr_top_of_ram() to machine_specific_memory_setup()
    v4: renamed parameter of txt_restore_mtrrs(): e820_verbose => verbose
    v4: don't use rdmsrl() and wrmsrl()
    v4: extract part of an integer consistently (`mtrr_cap` in txt_restore_mtrrs(), was a mix of `(uint8_t)` cast and `& 0xff`)
    v4: use container_of()
    v4: manage MTRR count in txt_restore_mtrrs() better (separate variable, no weird ?: operator)

 xen/arch/x86/cpu/mtrr/generic.c      |  9 +--
 xen/arch/x86/e820.c                  |  5 ++
 xen/arch/x86/include/asm/intel-txt.h |  3 +
 xen/arch/x86/include/asm/mtrr.h      |  8 +++
 xen/arch/x86/include/asm/slaunch.h   |  8 +++
 xen/arch/x86/intel-txt.c             | 84 ++++++++++++++++++++++++++++
 6 files changed, 110 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/cpu/mtrr/generic.c b/xen/arch/x86/cpu/mtrr/generic.c
index 86eb0f405b..c179935dd3 100644
--- a/xen/arch/x86/cpu/mtrr/generic.c
+++ b/xen/arch/x86/cpu/mtrr/generic.c
@@ -14,11 +14,6 @@
 #include <asm/cpufeature.h>
 #include "mtrr.h"
 
-struct mtrr_pausing_state {
-	bool pge;
-	uint64_t def_type;
-};
-
 static const struct fixed_range_block {
 	uint32_t base_msr;   /* start address of an MTRR block */
 	unsigned int ranges; /* number of MTRRs in this block  */
@@ -440,7 +435,7 @@ static DEFINE_SPINLOCK(set_atomicity_lock);
  * has been called.
  */
 
-static void mtrr_pause_caching(struct mtrr_pausing_state *state)
+void mtrr_pause_caching(struct mtrr_pausing_state *state)
 {
 	unsigned long cr4;
 
@@ -481,7 +476,7 @@ static void mtrr_pause_caching(struct mtrr_pausing_state *state)
 	alternative("wbinvd", "", X86_FEATURE_XEN_SELFSNOOP);
 }
 
-static void mtrr_resume_caching(struct mtrr_pausing_state state)
+void mtrr_resume_caching(struct mtrr_pausing_state state)
 {
 	/* Intel (P6) standard MTRRs */
 	mtrr_wrmsr(MSR_MTRRdefType, state.def_type);
diff --git a/xen/arch/x86/e820.c b/xen/arch/x86/e820.c
index 872208ab37..c63b0b12cc 100644
--- a/xen/arch/x86/e820.c
+++ b/xen/arch/x86/e820.c
@@ -11,6 +11,8 @@
 #include <asm/mtrr.h>
 #include <asm/msr.h>
 #include <asm/guest.h>
+#include <asm/intel-txt.h>
+#include <asm/slaunch.h>
 
 /*
  * opt_mem: Limit maximum address of physical RAM.
@@ -499,6 +501,9 @@ static void __init machine_specific_memory_setup(struct e820map *raw)
     uint64_t top_of_ram, size;
     unsigned int i;
 
+    if ( slaunch_active )
+        txt_restore_mtrrs(e820_verbose);
+
     sanitize_e820_map(raw->map, &raw->nr_map);
     copy_e820_map(raw->map, raw->nr_map);
 
diff --git a/xen/arch/x86/include/asm/intel-txt.h b/xen/arch/x86/include/asm/intel-txt.h
index db6b0defd0..406929fac2 100644
--- a/xen/arch/x86/include/asm/intel-txt.h
+++ b/xen/arch/x86/include/asm/intel-txt.h
@@ -389,6 +389,9 @@ void txt_map_mem_regions(void);
 /* Marks TXT-specific memory as used to avoid its corruption. */
 void txt_reserve_mem_regions(void);
 
+/* Restores original MTRR values saved by a bootloader before starting DRTM. */
+void txt_restore_mtrrs(bool verbose);
+
 #endif /* !__ASSEMBLER__ */
 
 #endif /* X86_INTEL_TXT_H */
diff --git a/xen/arch/x86/include/asm/mtrr.h b/xen/arch/x86/include/asm/mtrr.h
index 3a5b4f5b6e..bf82af8c47 100644
--- a/xen/arch/x86/include/asm/mtrr.h
+++ b/xen/arch/x86/include/asm/mtrr.h
@@ -63,6 +63,14 @@ extern uint8_t pat_type_2_pte_flags(uint8_t pat_type);
 extern void mtrr_aps_sync_begin(void);
 extern void mtrr_aps_sync_end(void);
 
+struct mtrr_pausing_state {
+	bool pge;
+	uint64_t def_type;
+};
+
+extern void mtrr_pause_caching(struct mtrr_pausing_state *state);
+extern void mtrr_resume_caching(struct mtrr_pausing_state state);
+
 extern bool mtrr_var_range_msr_set(struct domain *d, struct mtrr_state *m,
                                    uint32_t msr, uint64_t msr_content);
 extern bool mtrr_fix_range_msr_set(struct domain *d, struct mtrr_state *m,
diff --git a/xen/arch/x86/include/asm/slaunch.h b/xen/arch/x86/include/asm/slaunch.h
index 3df7174b4b..459fc83388 100644
--- a/xen/arch/x86/include/asm/slaunch.h
+++ b/xen/arch/x86/include/asm/slaunch.h
@@ -23,8 +23,16 @@ struct slaunch_early_init_results
     uint32_t slrt_pa;
 } __packed;
 
+#ifdef CONFIG_SLAUNCH
 /* Indicates an active Secure Launch boot. */
 extern bool slaunch_active;
+#else
+/*
+ * This avoids `#ifdef CONFIG_SLAUNCH` around `if ( slaunch_active )` thanks to
+ * dead code elimination.
+ */
+static bool slaunch_active = false;
+#endif
 
 /*
  * Holds physical address of SLRT.  Use slaunch_get_slrt() to access SLRT
diff --git a/xen/arch/x86/intel-txt.c b/xen/arch/x86/intel-txt.c
index 4a42abf8df..e0344d3421 100644
--- a/xen/arch/x86/intel-txt.c
+++ b/xen/arch/x86/intel-txt.c
@@ -8,10 +8,13 @@
 
 #include <xen/bug.h>
 #include <xen/init.h>
+#include <xen/kernel.h>
 #include <xen/lib.h>
 #include <xen/types.h>
 #include <asm/e820.h>
 #include <asm/intel-txt.h>
+#include <asm/msr.h>
+#include <asm/mtrr.h>
 #include <asm/slaunch.h>
 
 /*
@@ -111,3 +114,84 @@ void __init txt_reserve_mem_regions(void)
                      TXT_PRIV_CONFIG_REGS_BASE + TXT_CONFIG_SPACE_SIZE);
     BUG_ON(!ok);
 }
+
+void __init txt_restore_mtrrs(bool verbose)
+{
+    const struct slr_entry_hdr *entry;
+    const struct slr_entry_intel_info *intel_info;
+    uint64_t mtrr_cap, mtrr_def, base, mask;
+    unsigned int i;
+    unsigned int vcnt;
+    uint64_t def_type;
+    struct mtrr_pausing_state pausing_state;
+
+    mtrr_cap = rdmsr(MSR_MTRRcap);
+    mtrr_def = rdmsr(MSR_MTRRdefType);
+
+    vcnt = mtrr_cap & 0xFF;
+
+    if ( verbose )
+    {
+        printk("MTRRs set previously for SINIT ACM:\n");
+        printk(" MTRR cap: %"PRIx64" type: %"PRIx64"\n", mtrr_cap, mtrr_def);
+
+        for ( i = 0; i < vcnt; i++ )
+        {
+            base = rdmsr(MSR_IA32_MTRR_PHYSBASE(i));
+            mask = rdmsr(MSR_IA32_MTRR_PHYSMASK(i));
+
+            printk(" MTRR[%d]: base %"PRIx64" mask %"PRIx64"\n",
+                   i, base, mask);
+        }
+    }
+
+    entry =
+        slr_next_entry_by_tag(slaunch_get_slrt(), NULL, SLR_ENTRY_INTEL_INFO);
+    intel_info = container_of(entry, const struct slr_entry_intel_info, hdr);
+
+    if ( vcnt != intel_info->saved_bsp_mtrrs.mtrr_vcnt )
+    {
+        printk("Bootloader saved %ld MTRR values, but there should be %d\n",
+               intel_info->saved_bsp_mtrrs.mtrr_vcnt, vcnt);
+        /* Choose the smaller one to be on the safe side. */
+        if ( intel_info->saved_bsp_mtrrs.mtrr_vcnt < vcnt )
+            vcnt = intel_info->saved_bsp_mtrrs.mtrr_vcnt;
+    }
+
+    def_type = intel_info->saved_bsp_mtrrs.default_mem_type;
+    mtrr_pause_caching(&pausing_state);
+
+    for ( i = 0; i < vcnt; i++ )
+    {
+        base = intel_info->saved_bsp_mtrrs.mtrr_pair[i].mtrr_physbase;
+        mask = intel_info->saved_bsp_mtrrs.mtrr_pair[i].mtrr_physmask;
+        wrmsr(MSR_IA32_MTRR_PHYSBASE(i), base);
+        wrmsr(MSR_IA32_MTRR_PHYSMASK(i), mask);
+    }
+
+    pausing_state.def_type = def_type;
+    mtrr_resume_caching(pausing_state);
+
+    if ( verbose )
+    {
+        printk("Restored MTRRs:\n");
+
+        /*
+         * If MTRRs are not enabled or WB is not the default, MTRRs won't be
+         * printed.
+         */
+        if ( !test_bit(11, &def_type) || (def_type & 0x7) == X86_MT_WB )
+        {
+            for ( i = 0; i < vcnt; i++ )
+            {
+                base = rdmsr(MSR_IA32_MTRR_PHYSBASE(i));
+                mask = rdmsr(MSR_IA32_MTRR_PHYSMASK(i));
+                printk(" MTRR[%d]: base %"PRIx64" mask %"PRIx64"\n",
+                       i, base, mask);
+            }
+        }
+    }
+
+    /* Restore IA32_MISC_ENABLES */
+    wrmsr(MSR_IA32_MISC_ENABLE, intel_info->saved_misc_enable_msr);
+}
-- 
2.55.0


