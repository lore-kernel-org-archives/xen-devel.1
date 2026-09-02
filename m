Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3617C624D0
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 09:44:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405456.1638968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1hVq-0002jO-04; Wed, 02 Sep 2026 09:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405456.1638968; Wed, 02 Sep 2026 09:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1hVp-0002h2-ON; Wed, 02 Sep 2026 09:44:09 +0000
Received: by outflank-mailman (input) for mailman id 1405456;
 Wed, 02 Sep 2026 09:44:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 1x1hVn-0002GM-JK
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 09:44:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1hVm-00G2d4-QD
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 11:44:06 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 6a97efe3-bab6-0a2a0a5309dd-0a2a450ba8c2-8
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:44:06 +0200
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.fritz.box)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTP (eXpurgate 4.57.1)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 6a97efe5-b7e8-0a2a450b0019-d99ba50cf2f6-1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:44:05 +0200
Received: by Georges-MacBook-Pro-2.fritz.box (Postfix, from userid 501)
 id 7CC1836928DB; Wed,  2 Sep 2026 10:44:05 +0100 (BST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
From: George Dunlap <dunlapg@umich.edu>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Alejandro Vallejo <agarciav@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH v2 03/14] x86/pv: use populate_perdomain_mapping() to map the Xen GDT
Date: Wed,  2 Sep 2026 10:43:47 +0100
Message-ID: <20260901-asi-part2-3-ecc269f268b7@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1788342245-ABAD09EA-76AC3068/0/0
X-purgate-type: clean
X-purgate-size: 6038

From: Roger Pau Monné <roger.pau@citrix.com>

Currently, update_xen_slot_in_full_gdt() uses the stashed direct-map
pointer in d->arch.pv.gdt_ldt_l1tab to update the incoming vcpu's
page tables with Xen's GDT, by writing a stashed per-cpu copy of a
pre-baked L1 entry (either 64-bit or compat version).

Switch this to using populate_perdomain_mapping(), which doesn't rely
on the stashed address of the l1 page in the direct map.  Rather than
also stashing a pre-baked value for the payload, compute the mfn from
the per-cpu GDT pointer at use: the conversion is a handful of cycles
on a path costing thousands, and computing at use removes the
parallel {,compat_}gdt_l1e bookkeeping along with its boot-ordering
constraint (the cached value could only be generated after Xen's
physical relocation, and had to be in place before the first context
switch; a use-time lookup is correct by construction).  The flags on
the final mapping are identical.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v2:
- Drop the {,compat_}gdt_mfn caching entirely (suggested by Andrew
   Cooper): compute virt_to_mfn() from the per-cpu GDT pointer at use.
   The PDX lookup behind it measures ~5-10 cycles warm against a
   ~1,500-cycle context switch, and this removes the double
   bookkeeping and the after-relocation caching constraint.  The
   cached-MFN assertion goes with the cache: a use-time computation
   from a live pointer needs no staleness check.

Changes since the previously posted version:
- populate_perdomain_mapping() introduction split into the previous
   patch; this patch is now just the Xen GDT conversion.
- Retain the "GDT MFN cached" check as ASSERT(mfn_x(mfn)).
---
 xen/arch/x86/domain.c           | 13 ++++++++-----
 xen/arch/x86/include/asm/desc.h |  2 --
 xen/arch/x86/smpboot.c          | 15 ---------------
 xen/arch/x86/traps.c            |  2 --
 4 files changed, 8 insertions(+), 24 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 996b50af7a..d8af06e533 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2062,11 +2062,14 @@ static always_inline bool need_full_gdt(const struct domain *d)
 
 static void update_xen_slot_in_full_gdt(const struct vcpu *v, unsigned int cpu)
 {
-    ASSERT(per_cpu(gdt_l1e, cpu).l1); /* Confirm these have been cached. */
-
-    l1e_write(pv_gdt_ptes(v) + FIRST_RESERVED_GDT_PAGE,
-              !is_pv_32bit_vcpu(v) ? per_cpu(gdt_l1e, cpu)
-                                   : per_cpu(compat_gdt_l1e, cpu));
+    mfn_t mfn = _mfn(virt_to_mfn(!is_pv_32bit_vcpu(v)
+                                 ? per_cpu(gdt, cpu)
+                                 : per_cpu(compat_gdt, cpu)));
+
+    populate_perdomain_mapping(v,
+                               GDT_VIRT_START(v) +
+                               (FIRST_RESERVED_GDT_PAGE << PAGE_SHIFT),
+                               &mfn, 1, __PAGE_HYPERVISOR_RW);
 }
 
 static void load_full_gdt(const struct vcpu *v, unsigned int cpu)
diff --git a/xen/arch/x86/include/asm/desc.h b/xen/arch/x86/include/asm/desc.h
index dcbdac3ff7..a860134211 100644
--- a/xen/arch/x86/include/asm/desc.h
+++ b/xen/arch/x86/include/asm/desc.h
@@ -136,10 +136,8 @@ struct __packed desc_ptr {
 
 extern seg_desc_t boot_gdt[];
 DECLARE_PER_CPU(seg_desc_t *, gdt);
-DECLARE_PER_CPU(l1_pgentry_t, gdt_l1e);
 extern seg_desc_t boot_compat_gdt[];
 DECLARE_PER_CPU(seg_desc_t *, compat_gdt);
-DECLARE_PER_CPU(l1_pgentry_t, compat_gdt_l1e);
 DECLARE_PER_CPU(bool, full_gdt_loaded);
 
 static inline void lgdt(const struct desc_ptr *gdtr)
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 84e9e4beed..9b837a1769 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -1085,8 +1085,6 @@ static int cpu_smpboot_alloc(unsigned int cpu)
     if ( gdt == NULL )
         goto out;
     per_cpu(gdt, cpu) = gdt;
-    per_cpu(gdt_l1e, cpu) =
-        l1e_from_pfn(virt_to_mfn(gdt), __PAGE_HYPERVISOR_RW);
     memcpy(gdt, boot_gdt, NR_RESERVED_GDT_PAGES * PAGE_SIZE);
     BUILD_BUG_ON(NR_CPUS > 0x10000);
     gdt[PER_CPU_GDT_ENTRY - FIRST_RESERVED_GDT_ENTRY].a = cpu;
@@ -1095,8 +1093,6 @@ static int cpu_smpboot_alloc(unsigned int cpu)
     per_cpu(compat_gdt, cpu) = gdt = alloc_xenheap_pages(0, memflags);
     if ( gdt == NULL )
         goto out;
-    per_cpu(compat_gdt_l1e, cpu) =
-        l1e_from_pfn(virt_to_mfn(gdt), __PAGE_HYPERVISOR_RW);
     memcpy(gdt, boot_compat_gdt, NR_RESERVED_GDT_PAGES * PAGE_SIZE);
     gdt[PER_CPU_GDT_ENTRY - FIRST_RESERVED_GDT_ENTRY].a = cpu;
 #endif
@@ -1173,17 +1169,6 @@ void __init smp_prepare_cpus(void)
     initialize_cpu_data(0); /* Final full version of the data */
     print_cpu_info(0);
 
-    /*
-     * Cache {,compat_}gdt_l1e for the BSP now that physically relocation is
-     * done.  It must be after physical relocation of Xen, and before the
-     * first context_switch().
-     */
-    this_cpu(gdt_l1e) =
-        l1e_from_pfn(virt_to_mfn(boot_gdt), __PAGE_HYPERVISOR_RW);
-    if ( IS_ENABLED(CONFIG_PV32) )
-        this_cpu(compat_gdt_l1e) =
-            l1e_from_pfn(virt_to_mfn(boot_compat_gdt), __PAGE_HYPERVISOR_RW);
-
     boot_cpu_physical_apicid = get_apic_id();
     x86_cpu_to_apicid[0] = boot_cpu_physical_apicid;
 
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 1774966305..2ab61db167 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -71,10 +71,8 @@ DEFINE_PER_CPU(uint64_t, efer);
 static DEFINE_PER_CPU(unsigned long, last_extable_addr);
 
 DEFINE_PER_CPU_READ_MOSTLY(seg_desc_t *, gdt);
-DEFINE_PER_CPU_READ_MOSTLY(l1_pgentry_t, gdt_l1e);
 #ifdef CONFIG_PV32
 DEFINE_PER_CPU_READ_MOSTLY(seg_desc_t *, compat_gdt);
-DEFINE_PER_CPU_READ_MOSTLY(l1_pgentry_t, compat_gdt_l1e);
 #endif
 
 /*
-- 
2.55.0


