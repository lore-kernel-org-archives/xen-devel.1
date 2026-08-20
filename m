Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B8FC5DF8A
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2026 17:44:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1396848.1634510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx6oB-0001V5-1m; Thu, 20 Aug 2026 17:44:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1396848.1634510; Thu, 20 Aug 2026 17:44:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx6oA-0001Uy-VT; Thu, 20 Aug 2026 17:44:06 +0000
Received: by outflank-mailman (input) for mailman id 1396848;
 Thu, 20 Aug 2026 17:44:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1wx6oA-0001My-3L
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 17:44:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wx6o9-00E23e-1a;
 Thu, 20 Aug 2026 17:44:05 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wx6o8-00DjFg-3D;
 Thu, 20 Aug 2026 17:44:05 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=KyUzHauc47Dbzb+CzrzMBc+T+6WI7kFJLHChZreYt2Y=; b=WW9phl8g1HvvMFoIU0fHSEPlwm
	Q47FtqfSVIV4WP5EZyUC2aONk9rsUMyxNacn7zzrw+bwnNs8YzqNmpRXUJzp6snu1J8fbwRHdU7YK
	pI6Mo9L2eEmogfFaBCZaw5lgp5imqJIbA/W0v1UyGJDDSTgMDT1NYyNIOODvowJtFeG4=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 3/7] x86/pv: use populate_perdomain_mapping() to map the Xen GDT
Date: Thu, 20 Aug 2026 18:43:43 +0100
Message-ID: <20260820-asi-part1-3-f2dbd92b8459@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820-asi-part1-0-f2dbd92b8459@xenproject.org>
References: <20260820-asi-part1-0-f2dbd92b8459@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Roger Pau Monné <roger.pau@citrix.com>

Currently, update_xen_slot_in_full_gdt() uses the stashed pointer in
d->arch.pv.gdt_ldt_l1tab to update the incoming vcpu's page-tables with
Xen's GDT, by writing a stashed per-cpu copy of a pre-baked L1 entry
(either 64-bit or compat version).

Now that all perdomain pagetables are allocated from the xenheap and
their root L3 stashed in d->arch.perdomain_l3,
d->arch.pv.gdt_ldt_l1tab is redundant.  Remove one user by switching
update_xen_slot_in_full_gdt() to using populate_perdomain_mapping().

Since populate_perdomain_mapping() takes an mfn rather than an l1e,
cache the mfn of the per-cpu page instead.  As a side effect, this
consolidates the setting of the flags into a single place.  Continue
to check that the per-cpu value we're using has been initialized:
per-CPU data starts out zeroed, and no GDT can live at MFN 0.

What was one store through a cached pointer is now an out-of-line
walk (L3 pointer, L3e, L2e, then the L1e) on every PV context switch:
three dependent loads, negligible next to the CR3 write that follows.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes since the previously posted version:
- populate_perdomain_mapping() introduction split into the previous
   patch; this patch is now just the Xen GDT conversion.
- Retain the "GDT MFN cached" check as ASSERT(mfn_x(mfn)).
---
 xen/arch/x86/domain.c           | 13 +++++++++----
 xen/arch/x86/include/asm/desc.h |  6 ++++--
 xen/arch/x86/smpboot.c          | 14 +++++---------
 xen/arch/x86/traps.c            |  4 ++--
 4 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 163a2c97ae..f5b2eef95a 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2062,11 +2062,16 @@ static always_inline bool need_full_gdt(const struct domain *d)
 
 static void update_xen_slot_in_full_gdt(const struct vcpu *v, unsigned int cpu)
 {
-    ASSERT(per_cpu(gdt_l1e, cpu).l1); /* Confirm these have been cached. */
+    mfn_t mfn = !is_pv_32bit_vcpu(v) ? per_cpu(gdt_mfn, cpu)
+                                     : per_cpu(compat_gdt_mfn, cpu);
 
-    l1e_write(pv_gdt_ptes(v) + FIRST_RESERVED_GDT_PAGE,
-              !is_pv_32bit_vcpu(v) ? per_cpu(gdt_l1e, cpu)
-                                   : per_cpu(compat_gdt_l1e, cpu));
+    /* Confirm the GDT MFNs have been cached (MFN 0 is never a GDT). */
+    ASSERT(mfn_x(mfn));
+
+    populate_perdomain_mapping(v,
+                               GDT_VIRT_START(v) +
+                               (FIRST_RESERVED_GDT_PAGE << PAGE_SHIFT),
+                               &mfn, 1, __PAGE_HYPERVISOR_RW);
 }
 
 static void load_full_gdt(const struct vcpu *v, unsigned int cpu)
diff --git a/xen/arch/x86/include/asm/desc.h b/xen/arch/x86/include/asm/desc.h
index dcbdac3ff7..a26df9fbe9 100644
--- a/xen/arch/x86/include/asm/desc.h
+++ b/xen/arch/x86/include/asm/desc.h
@@ -44,6 +44,8 @@
 
 #ifndef __ASSEMBLER__
 
+#include <xen/mm-frame.h>
+
 #define GUEST_KERNEL_RPL(d) (is_pv_32bit_domain(d) ? 1 : 3)
 
 /* Fix up the RPL of a guest segment selector. */
@@ -136,10 +138,10 @@ struct __packed desc_ptr {
 
 extern seg_desc_t boot_gdt[];
 DECLARE_PER_CPU(seg_desc_t *, gdt);
-DECLARE_PER_CPU(l1_pgentry_t, gdt_l1e);
+DECLARE_PER_CPU(mfn_t, gdt_mfn);
 extern seg_desc_t boot_compat_gdt[];
 DECLARE_PER_CPU(seg_desc_t *, compat_gdt);
-DECLARE_PER_CPU(l1_pgentry_t, compat_gdt_l1e);
+DECLARE_PER_CPU(mfn_t, compat_gdt_mfn);
 DECLARE_PER_CPU(bool, full_gdt_loaded);
 
 static inline void lgdt(const struct desc_ptr *gdtr)
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 84e9e4beed..9246945506 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -1085,8 +1085,7 @@ static int cpu_smpboot_alloc(unsigned int cpu)
     if ( gdt == NULL )
         goto out;
     per_cpu(gdt, cpu) = gdt;
-    per_cpu(gdt_l1e, cpu) =
-        l1e_from_pfn(virt_to_mfn(gdt), __PAGE_HYPERVISOR_RW);
+    per_cpu(gdt_mfn, cpu) = _mfn(virt_to_mfn(gdt));
     memcpy(gdt, boot_gdt, NR_RESERVED_GDT_PAGES * PAGE_SIZE);
     BUILD_BUG_ON(NR_CPUS > 0x10000);
     gdt[PER_CPU_GDT_ENTRY - FIRST_RESERVED_GDT_ENTRY].a = cpu;
@@ -1095,8 +1094,7 @@ static int cpu_smpboot_alloc(unsigned int cpu)
     per_cpu(compat_gdt, cpu) = gdt = alloc_xenheap_pages(0, memflags);
     if ( gdt == NULL )
         goto out;
-    per_cpu(compat_gdt_l1e, cpu) =
-        l1e_from_pfn(virt_to_mfn(gdt), __PAGE_HYPERVISOR_RW);
+    per_cpu(compat_gdt_mfn, cpu) = _mfn(virt_to_mfn(gdt));
     memcpy(gdt, boot_compat_gdt, NR_RESERVED_GDT_PAGES * PAGE_SIZE);
     gdt[PER_CPU_GDT_ENTRY - FIRST_RESERVED_GDT_ENTRY].a = cpu;
 #endif
@@ -1174,15 +1172,13 @@ void __init smp_prepare_cpus(void)
     print_cpu_info(0);
 
     /*
-     * Cache {,compat_}gdt_l1e for the BSP now that physically relocation is
+     * Cache {,compat_}gdt_mfn for the BSP now that physically relocation is
      * done.  It must be after physical relocation of Xen, and before the
      * first context_switch().
      */
-    this_cpu(gdt_l1e) =
-        l1e_from_pfn(virt_to_mfn(boot_gdt), __PAGE_HYPERVISOR_RW);
+    this_cpu(gdt_mfn) = _mfn(virt_to_mfn(boot_gdt));
     if ( IS_ENABLED(CONFIG_PV32) )
-        this_cpu(compat_gdt_l1e) =
-            l1e_from_pfn(virt_to_mfn(boot_compat_gdt), __PAGE_HYPERVISOR_RW);
+        this_cpu(compat_gdt_mfn) = _mfn(virt_to_mfn(boot_compat_gdt));
 
     boot_cpu_physical_apicid = get_apic_id();
     x86_cpu_to_apicid[0] = boot_cpu_physical_apicid;
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 1774966305..2fcaa413f7 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -71,10 +71,10 @@ DEFINE_PER_CPU(uint64_t, efer);
 static DEFINE_PER_CPU(unsigned long, last_extable_addr);
 
 DEFINE_PER_CPU_READ_MOSTLY(seg_desc_t *, gdt);
-DEFINE_PER_CPU_READ_MOSTLY(l1_pgentry_t, gdt_l1e);
+DEFINE_PER_CPU_READ_MOSTLY(mfn_t, gdt_mfn);
 #ifdef CONFIG_PV32
 DEFINE_PER_CPU_READ_MOSTLY(seg_desc_t *, compat_gdt);
-DEFINE_PER_CPU_READ_MOSTLY(l1_pgentry_t, compat_gdt_l1e);
+DEFINE_PER_CPU_READ_MOSTLY(mfn_t, compat_gdt_mfn);
 #endif
 
 /*
-- 
2.55.0


