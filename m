Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DA5C4451C
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2026 07:55:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367524.1617274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm5Jg-0005Ad-GD; Tue, 21 Jul 2026 07:55:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367524.1617274; Tue, 21 Jul 2026 07:55:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm5Jg-0005AW-DQ; Tue, 21 Jul 2026 07:55:04 +0000
Received: by outflank-mailman (input) for mailman id 1367524;
 Tue, 21 Jul 2026 07:55:02 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <haseebashraf091@gmail.com>) id 1wm5Je-00050T-KD
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 07:55:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wm5Je-00E2ej-0M
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 09:55:02 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <haseebashraf091@gmail.com>)
 id 6a5f25cd-2eae-0a2a0a5409dd-0a2a4506cfb8-22
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 09:55:01 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <haseebashraf091@gmail.com>)
 id 6a5f25d5-195a-0a2a45060019-d155802fe909-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 09:55:01 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4955de8797cso10836425e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 00:55:01 -0700 (PDT)
Received: from PKL-HASEEBA-LT.. ([139.135.37.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956537c7desm64018485e9.7.2026.07.21.00.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 00:55:00 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784620501; x=1785225301; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AENZ0AC4KepQ7USLtmlsrEkAPkSmxijOL+eq95NbtDQ=;
        b=eqAyCQUuCR+47NsDk9Z0ZnYjEyrek4v+M7tMLb4dcJqDyRoeNqbJ1kEAlRV6KtvxIl
         rgqDSjRLSwNEO2MrZS8pjqrgKkY6mtXaVPSccc3eQdkVPvcjfaGUj0+KS1h20DCxiXhb
         rfPfoa+ub/cRDnySVblVvY6KaZ/mX5ECYJf5435VHATcTL/vvRE2YLuNS/pvf6LxZnqX
         b2ZuzgUDJSZZL4EemagiFI/DfPSPrRMyqFuLr51SyHc7uFCfqDn8CPq20MC0r/bZ/6EQ
         SABWCmhU6WjiWi+MnVzqpm1gY8+d+zZ9H1WLx5wbRATfpV3oXzHzqI6Yvhb1h7+vsL17
         KDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620501; x=1785225301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AENZ0AC4KepQ7USLtmlsrEkAPkSmxijOL+eq95NbtDQ=;
        b=WMJ7t5rODyU0aa5NLPzdUbduxxIbGEz6ePuQ62Xc/Ghk0c8OgDFaYnE1q7wLxoX3oT
         MWGnVH9YhQ1bCk1Beic7tFPVRqctnAYLi4Sj1T8BbId+sDzZEkzl7k223n0X4IsrRa0p
         o+FQBwpnuSfdTVUhcSfIUDG/sq/2oAxzhQCA6tB7dwA7IdaQJIqiuSMpQpaOViHhXpHc
         2YDsZo6XBCb2j5td6H1k77k+7MRKYfiwislSN87PF1QyHsfCv8aKhISYK3NItX/8joL7
         3Ar7US6t5WuVM41Q1hOC6pSDj9VfABNTXJ9Zynaa9r+FjhH2tWS1oNaGiYAVSwzfUG2f
         pTeQ==
X-Gm-Message-State: AOJu0YydB/uBZ1B9oP9jSBccabQa0A9oOU4A+dtVKFgZaSNJwGeFzFTz
	uA5sWEtMX9tdRYm4WC9mamllmE7hd5Or9c09CxrUcdf3malLGhPRvDcgLI+40rne
X-Gm-Gg: AfdE7cmKWt+rYKjFJhEZU78yfLyOOqg1eT4teEZcELUH+TeqMxaALJXZZwi/5ULKH/O
	5M74ww32D4oqfsQ404/qO7WWk/vXLJXhAGDLe4fzSHwX5sUWTTaJh16HJRWfDgHjBlntZ+a+s6e
	E+cYs8JuN6apqhbUvXrkqcv0ynKfQb3gHGkN+a2M7/4tKTsaujWLJXCDIB4Gb/XCNaAB9TkjGT0
	uFE6AdCuWJFagqg00loXjWOeNezt6t0dmOFT2WbyrQycoC5MvzdDPKEkTosZ7gMULe0hjUSRyrR
	9O6l1tjEjACfGbVnGod4AUfbZnHkJmFlxpxmdrgvaME/S0vuJZyj51V5Unv+MR46QWSQ3pLkNYR
	z4YuxDZ6jYWPv2rpcxbzOe9rl34OVWkxb39MC/cV85teb+de62y6J8DnYf81YyrFzCZHYL00fmn
	WTw9mbFNbXQZQY3D5EZMFTbnaie6dW+o+Ezy1QF+v9HNc=
X-Received: by 2002:a7b:c054:0:b0:495:5172:661f with SMTP id 5b1f17b1804b1-49551726896mr103037815e9.19.1784620501056;
        Tue, 21 Jul 2026 00:55:01 -0700 (PDT)
From: Haseeb Ashraf <haseebashraf091@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: haseeb.ashraf@siemens.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][RESEND][PATCH 1/3] xen/arm/p2m: perform IPA-based TLBI when IPA is known
Date: Tue, 21 Jul 2026 12:54:49 +0500
Message-ID: <e933703bf76cbc33e5d05a023900389fd6a9f925.1784619778.git.haseeb.ashraf@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765197209.git.haseeb.ashraf@siemens.com>
References: <cover.1765197209.git.haseeb.ashraf@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1784620501-F580D77B-F0D363E8/0/0
X-purgate-type: clean
X-purgate-size: 14776

From: Haseeb Ashraf <haseeb.ashraf@siemens.com>

Running Xen as an L1 hypervisor on KVM exposes the high cost of
emulating VMALLS12E1IS, especially when it is issued repeatedly.

Two p2m-related paths are particularly affected:

  (a) vCPU migration on a pCPU, where the flush is intended to avoid
      stage-1 translations associated with one vCPU leaking into
      another, even though the effective stage-2 translation regime is
      shared at the domain p2m level.

  (b) p2m updates where the affected IPA range is known, for example
      when XENMEM_remove_from_physmap removes mappings one page at a
      time.

Address both cases by narrowing the invalidation where possible.

For the vCPU migration case, replace the combined guest flush with a
stage-1-only invalidation. This preserves the required separation
between per-vCPU stage-1 translations while avoiding unnecessary
stage-2 invalidation.

For p2m updates where the affected IPA range is known, invalidate by
IPA range instead of always flushing the whole guest TLB. Since the
Arm64 TLBI-by-IPA sequence loops per page, cap the range at an
empirically chosen threshold and fall back to the full guest flush
above that point.

On Graviton4 running Xen-on-KVM, the cost of a full guest TLBI was
measured to be roughly comparable to tens of thousands of single-page
IPA invalidations, so a 256MB threshold is used as a practical cutoff.

On Arm32 this patch keeps the conservative full-flush behaviour for the
IPA-range helper. Follow-up patches will refine that path further.

Suggested-by: Julien Grall <julien@xen.org>
Signed-off-by: Haseeb Ashraf <haseeb.ashraf@siemens.com>

Changes in v4:
- Reworked the Arm64 IPA-based TLBI sequence to make completion of the
  broadcast TLBI explicit instead of relying on a stage-1 helper for
  the final barriers/workaround.
- Reused __tlb_repeat_sync() for the repeat-TLBI workaround handling.
- Added a small robustness check in p2m_force_tlb_flush_range_sync().
- Refined comments and commit message wording.

Changes in v3:
- Updated IPA-based TLBI sequence to apply ARM64 repeat TLBI
  workaround to only final TLBI and DSB of the sequence.
- Removed TLB_HELPER_IPA and instead directly used the TLBI
  instruction where needed as that was the only instance where it is
  being used.
- Removed flush_guest_tlb_range_ipa_local() as it was not being used.
- Updated comments as per feedback in v2 about holding lock before
  p2m_load_vttbr.
- Updated references of ARM ARM to use newer version DDI 0487L.b
  instead of older version DDI 0487A.e.

Changes in v2:
- This commit implements the baseline implementation to address the
  problem at hand. Removed the FEAT_nTLBPA implementation from this
  commit which will be implemented in following commit using CPU
  capability.
- Moved ARM32 and ARM64 specific implementations of TLBIs to
  architecture specific flushtlb.h.
- Added references of ARM ARM in code comments.
- Evaluated and added a threshold to select between IPA-based TLB
  invalidation vs fallback to full stage TLB invalidation above
  the threshold.
---
 xen/arch/arm/include/asm/arm32/flushtlb.h |  53 +++++++++++
 xen/arch/arm/include/asm/arm64/flushtlb.h |  62 +++++++++++++
 xen/arch/arm/include/asm/mmu/p2m.h        |   2 +
 xen/arch/arm/mmu/p2m.c                    | 105 ++++++++++++++++------
 4 files changed, 195 insertions(+), 27 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm32/flushtlb.h b/xen/arch/arm/include/asm/arm32/flushtlb.h
index 5483be08fb..1497f16ba5 100644
--- a/xen/arch/arm/include/asm/arm32/flushtlb.h
+++ b/xen/arch/arm/include/asm/arm32/flushtlb.h
@@ -45,6 +45,43 @@ TLB_HELPER(flush_xen_tlb_local, TLBIALLH, nsh)
 
 #undef TLB_HELPER
 
+/*
+ * Flush TLB of local processor. Use when flush for only stage-1 is intended.
+ *
+ * The following function should be used where intention is to clear only
+ * stage-1 TLBs. This would be helpful in future in identifying which stage-1
+ * TLB flushes can be skipped such as in present of FEAT_nTLBPA.
+ */
+static inline void flush_guest_tlb_s1_local(void)
+{
+    /*
+     * Same instruction can invalidate both stage-1 and stage-2 TLBs depending
+     * upon the execution context.
+     *
+     * See ARMv8 (DDI 0487L.b): G5-11698 Table G5-23.
+     */
+    return flush_guest_tlb_local();
+}
+
+/*
+ * Flush TLB of inner-shareable processor domain. Use when flush for only
+ * stage-1 is intended.
+ *
+ * The following function should be used where intention is to clear only
+ * stage-1 TLBs. This would be helpful in future in identifying which stage-1
+ * TLB flushes can be skipped such as in present of FEAT_nTLBPA.
+ */
+static inline void flush_guest_tlb_s1(void)
+{
+    /*
+     * Same instruction can invalidate both stage-1 and stage-2 TLBs depending
+     * upon the execution context.
+     *
+     * See ARMv8 (DDI 0487L.b): G5-11698 Table G5-23.
+     */
+    return flush_guest_tlb();
+}
+
 /* Flush TLB of local processor for address va. */
 static inline void __flush_xen_tlb_one_local(vaddr_t va)
 {
@@ -60,6 +97,22 @@ static inline void __flush_xen_tlb_one(vaddr_t va)
 /* Only for ARM64_WORKAROUND_REPEAT_TLBI */
 static inline void __tlb_repeat_sync(void) {}
 
+/*
+ * Flush a range of IPA's mappings from the TLB of all processors in the
+ * inner-shareable domain.
+ */
+static inline void flush_guest_tlb_range_ipa(paddr_t ipa,
+                                             unsigned long size)
+{
+    /*
+     * Following can invalidate both stage-1 and stage-2 TLBs depending upon
+     * the execution mode.
+     *
+     * See ARMv8 (DDI 0487L.b): G5-11698 Table G5-23.
+     */
+    flush_guest_tlb();
+}
+
 #endif /* __ASM_ARM_ARM32_FLUSHTLB_H__ */
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/arm64/flushtlb.h b/xen/arch/arm/include/asm/arm64/flushtlb.h
index 1606b26bf2..cbe2a0da57 100644
--- a/xen/arch/arm/include/asm/arm64/flushtlb.h
+++ b/xen/arch/arm/include/asm/arm64/flushtlb.h
@@ -1,6 +1,8 @@
 #ifndef __ASM_ARM_ARM64_FLUSHTLB_H__
 #define __ASM_ARM_ARM64_FLUSHTLB_H__
 
+#include <xen/sizes.h> /* For SZ_* macros. */
+
 /*
  * Every invalidation operation use the following patterns:
  *
@@ -67,6 +69,12 @@ TLB_HELPER_LOCAL(flush_guest_tlb_local, vmalls12e1)
 /* Flush innershareable TLBs, current VMID only */
 TLB_HELPER(flush_guest_tlb, vmalls12e1is)
 
+/* Flush local TLBs, current VMID, stage-1 only */
+TLB_HELPER(flush_guest_tlb_s1_local, vmalle1, nsh)
+
+/* Flush innershareable TLBs, current VMID, stage-1 only */
+TLB_HELPER(flush_guest_tlb_s1, vmalle1is, ish)
+
 /* Flush local TLBs, all VMIDs, non-hypervisor mode */
 TLB_HELPER_LOCAL(flush_all_guests_tlb_local, alle1)
 
@@ -116,6 +124,60 @@ static inline void __tlb_repeat_sync(void)
         : : : "memory");
 }
 
+/*
+ * Complete a broadcast TLBI sequence.
+ *
+ * For all relevant errata it is only necessary to execute a single
+ * additional TLBI;DSB sequence after the invalidation sequence has completed.
+ */
+static inline void tlbi_complete_broadcast(void)
+{
+    __tlb_repeat_sync();
+    dsb(ish);
+    isb();
+}
+
+/*
+ * Flush a range of IPA's mappings from the TLB of all processors in the
+ * inner-shareable domain.
+ */
+static inline void flush_guest_tlb_range_ipa(paddr_t ipa, unsigned long size)
+{
+    paddr_t end;
+
+    /*
+     * If IPA range is too big (empirically found to be 256M), then fallback to
+     * full TLB flush.
+     */
+    if ( size > SZ_256M )
+        return flush_guest_tlb();
+
+    end = ipa + size;
+
+    /*
+     * See ARM ARM DDI 0487L.b D8.17.6.1 (Invalidating TLB entries from stage 2
+     * translations) for details of TLBI sequence.
+     */
+    dsb(ishst); /* Ensure prior page-table updates have completed */
+    while ( ipa < end )
+    {
+        /* Flush stage-2 TLBs for IPA address */
+        asm_inline volatile(
+            "tlbi ipas2e1is, %0"
+            : : "r" (ipa >> PAGE_SHIFT) : "memory");
+        ipa += PAGE_SIZE;
+    }
+
+    /*
+     * Invalidate stage-1 entries for the current VMID as well. Keep this
+     * separate from completion of the broadcast TLBI sequence so that the
+     * final barriers/workaround are explicit.
+     */
+    asm_inline volatile("tlbi vmalle1is" : : : "memory");
+
+    tlbi_complete_broadcast();
+}
+
 #endif /* __ASM_ARM_ARM64_FLUSHTLB_H__ */
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/mmu/p2m.h b/xen/arch/arm/include/asm/mmu/p2m.h
index 58496c0b09..8a16722b82 100644
--- a/xen/arch/arm/include/asm/mmu/p2m.h
+++ b/xen/arch/arm/include/asm/mmu/p2m.h
@@ -10,6 +10,8 @@ extern unsigned int p2m_root_level;
 
 struct p2m_domain;
 void p2m_force_tlb_flush_sync(struct p2m_domain *p2m);
+void p2m_force_tlb_flush_range_sync(struct p2m_domain *p2m, uint64_t start_ipa,
+                                    uint64_t page_count);
 void p2m_tlb_flush_sync(struct p2m_domain *p2m);
 
 void p2m_clear_root_pages(struct p2m_domain *p2m);
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 51abf3504f..525afcc210 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -231,37 +231,33 @@ void p2m_restore_state(struct vcpu *n)
     isb();
 
     /*
-     * Flush local TLB for the domain to prevent wrong TLB translation
-     * when running multiple vCPU of the same domain on a single pCPU.
+     * This only needs to invalidate stage-1 TLB state. All vCPUs of the
+     * domain share the same p2m, and therefore the same effective stage-2
+     * translation regime.
      */
     if ( *last_vcpu_ran != INVALID_VCPU_ID && *last_vcpu_ran != n->vcpu_id )
-        flush_guest_tlb_local();
+        flush_guest_tlb_s1_local();
 
     *last_vcpu_ran = n->vcpu_id;
 }
 
 /*
- * Force a synchronous P2M TLB flush.
+ * Loads VTTBR from given P2M.
  *
  * Must be called with the p2m lock held.
+ *
+ * This returns switched out VTTBR.
  */
-void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
+static uint64_t p2m_load_vttbr(struct p2m_domain *p2m, unsigned long *flags)
 {
-    unsigned long flags = 0;
     uint64_t ovttbr;
 
-    ASSERT(p2m_is_write_locked(p2m));
-
-    /*
-     * ARM only provides an instruction to flush TLBs for the current
-     * VMID. So switch to the VTTBR of a given P2M if different.
-     */
     ovttbr = READ_SYSREG64(VTTBR_EL2);
     if ( ovttbr != p2m->vttbr )
     {
         uint64_t vttbr;
 
-        local_irq_save(flags);
+        local_irq_save(*flags);
 
         /*
          * ARM64_WORKAROUND_AT_SPECULATE: We need to stop AT to allocate
@@ -280,8 +276,14 @@ void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
         isb();
     }
 
-    flush_guest_tlb();
+    return ovttbr;
+}
 
+/*
+ * Restores VTTBR which was switched out as a result of p2m_load_vttbr().
+ */
+static void p2m_restore_vttbr(uint64_t ovttbr, unsigned long flags)
+{
     if ( ovttbr != READ_SYSREG64(VTTBR_EL2) )
     {
         WRITE_SYSREG64(ovttbr, VTTBR_EL2);
@@ -289,10 +291,66 @@ void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
         isb();
         local_irq_restore(flags);
     }
+}
+
+/*
+ * Force a synchronous P2M TLB flush.
+ *
+ * Must be called with the p2m lock held.
+ */
+void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
+{
+    unsigned long flags = 0;
+    uint64_t ovttbr;
+
+    ASSERT(p2m_is_write_locked(p2m));
+
+    /*
+     * ARM only provides an instruction to flush TLBs for the current
+     * VMID. So switch to the VTTBR of a given P2M if different.
+     */
+    ovttbr = p2m_load_vttbr(p2m, &flags);
+
+    flush_guest_tlb();
+
+    p2m_restore_vttbr(ovttbr, flags);
 
     p2m->need_flush = false;
 }
 
+/*
+ * Force a synchronous P2M TLB flush on a range of addresses.
+ *
+ * Must be called with the p2m lock held.
+ */
+void p2m_force_tlb_flush_range_sync(struct p2m_domain *p2m, uint64_t start_ipa,
+                                    uint64_t page_count)
+{
+    unsigned long flags = 0;
+    uint64_t ovttbr;
+
+    ASSERT(p2m_is_write_locked(p2m));
+
+    if ( !page_count )
+        return;
+
+    /*
+     * ARM only provides an instruction to flush TLBs for the current
+     * VMID. So switch to the VTTBR of a given P2M if different.
+     */
+    ovttbr = p2m_load_vttbr(p2m, &flags);
+
+    /* Invalidate TLB entries by IPA range */
+    if ( unlikely(page_count > ULONG_MAX / PAGE_SIZE) )
+        flush_guest_tlb();
+    else
+    {
+        flush_guest_tlb_range_ipa(start_ipa, page_count * PAGE_SIZE);
+    }
+
+    p2m_restore_vttbr(ovttbr, flags);
+}
+
 void p2m_tlb_flush_sync(struct p2m_domain *p2m)
 {
     if ( p2m->need_flush )
@@ -1034,7 +1092,8 @@ static int __p2m_set_entry(struct p2m_domain *p2m,
          * For more details see (D4.7.1 in ARM DDI 0487A.j).
          */
         p2m_remove_pte(entry, p2m->clean_pte);
-        p2m_force_tlb_flush_sync(p2m);
+        p2m_force_tlb_flush_range_sync(p2m, gfn_x(sgfn) << PAGE_SHIFT,
+                                       1UL << page_order);
 
         p2m_write_pte(entry, split_pte, p2m->clean_pte);
 
@@ -1090,8 +1149,8 @@ static int __p2m_set_entry(struct p2m_domain *p2m,
         p2m_remove_pte(entry, p2m->clean_pte);
 
     if ( removing_mapping )
-        /* Flush can be deferred if the entry is removed */
-        p2m->need_flush |= !!lpae_is_valid(orig_pte);
+        p2m_force_tlb_flush_range_sync(p2m, gfn_x(sgfn) << PAGE_SHIFT,
+                                       1UL << page_order);
     else
     {
         lpae_t pte = mfn_to_p2m_entry(smfn, t, a);
@@ -1102,18 +1161,10 @@ static int __p2m_set_entry(struct p2m_domain *p2m,
         /*
          * It is necessary to flush the TLB before writing the new entry
          * to keep coherency when the previous entry was valid.
-         *
-         * Although, it could be defered when only the permissions are
-         * changed (e.g in case of memaccess).
          */
         if ( lpae_is_valid(orig_pte) )
-        {
-            if ( likely(!p2m->mem_access_enabled) ||
-                 P2M_CLEAR_PERM(pte) != P2M_CLEAR_PERM(orig_pte) )
-                p2m_force_tlb_flush_sync(p2m);
-            else
-                p2m->need_flush = true;
-        }
+            p2m_force_tlb_flush_range_sync(p2m, gfn_x(sgfn) << PAGE_SHIFT,
+                                           1UL << page_order);
         else if ( !p2m_is_valid(orig_pte) ) /* new mapping */
             p2m->stats.mappings[level]++;
 
-- 
2.43.0


