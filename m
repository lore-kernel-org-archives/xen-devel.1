Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60ACF606A320
	for <xen-devel@archiver.kernel.org>; Sun, 22 Nov 2026 09:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V1ndHlNH
Received: from list by lists.xenproject.org with outflank-mailman.1499535.1696290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xV4HL-0004kn-FA; Sun, 22 Nov 2026 09:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1499535.1696290; Sun, 22 Nov 2026 09:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xV4HL-0004kZ-AX; Sun, 22 Nov 2026 09:54:35 +0000
Received: by outflank-mailman (input) for mailman id 1499535;
 Sun, 22 Nov 2026 09:54:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <haseebashraf091@gmail.com>) id 1xV4HK-0004iC-Hr
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2026 09:54:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xV4HI-008zYS-Jp
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2026 10:54:32 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <haseebashraf091@gmail.com>)
 id 6b02bb5d-2eae-0a2a0a5409dd-0a2a450a9242-34
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 10:54:32 +0100
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <haseebashraf091@gmail.com>)
 id 6b02bbd8-f2d2-0a2a450a0019-d155802fd145-3
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 10:54:32 +0100
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4a214c5c4c0so20859305e9.3
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 01:54:32 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.36.59.78])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8849e598sm218409605e9.8.2026.11.22.01.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2026 01:54:31 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795341272; x=1795946072; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F45nlTbvn7TAkfWyNo2QK2nZ+G6tc7lSCTyxrLV0R8k=;
        b=V1ndHlNHRaSNYfhsb0xm+9Z8ZMXr/0ySMkVFPuHVvz4yR7Wq0/rHiWIk7gCUKQnkxf
         eHRKcU+N1gmhbfqag6AtaKgWoJwTV7rJBWZQnpAASJsVoYTUcZwmWsvlGM40Q8UXzubb
         XAZeiKIn7sI+BAR0mxJPvlAEaLlkPfhi8mOcp/xcceeGnILtg/P+4DKWCd5xLGNGS29W
         IdaPaG86bhfv6WsqXke5ffsGTcjcZSkmPZGg4jfzfwf32cB6rLxKo4/eqXFSwU8k+9yU
         dnXmWjtcMPi1uLNUKScLkC2k3WMGA0zQzNooKXTbKkel2PlNDsY5R9WLIiCmYUGZk94M
         Bc5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795341272; x=1795946072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F45nlTbvn7TAkfWyNo2QK2nZ+G6tc7lSCTyxrLV0R8k=;
        b=fwgbfUEaoh0vHDnv6iggAEh1UaBnYIfLrPt5NkZcfujAvlXcc0NSO+nyARK/vH/mVu
         29WTVgdUjtJSUxGTmgupLNh4P5wyMyFXZNRO1xWlz1OHEaNcAENxYed9ANXUkTw/eRys
         ESySGj3UHpOmdFj5lq/GO5QY5NOFOAX5XHTajlt+LnqsFCioY3Qap2M5O3w2h29xGHa8
         3hVDgxPJ/yUE2NLk5woOjmPSABT5AJ8yusodbET3ZHsmup1DdkeIp0TdMwTHYkRSycC5
         i+3hamR5xy4hXdCzvt5+QYF9dLbPg69XammBUXTfwNwleKKRhRpV6p51lNSkcxI84NNA
         AJkg==
X-Gm-Message-State: APuU4Z9eHUcdVnMXIc7Dh8SsLydAIMWXDfljLivWASrYz/WIGRW2NGsw
	fUb87SDX8vRIOCJjdNO/F9308WBJF4pRHscW7S2+yv99ftk3AOemVRrCBkQjagpGH5w=
X-Gm-Gg: AZFdTZeZ2i8F6ctaU60zfU/ydWpAQ7GS+HAueqXBcqAPvSyloNjMHHJ/PTcNnFVCv8C
	BAWpe0VrxsYwOcTTcsvJlOCJ74xtiAIf4tydUpjLPeT3/gQJpfHzp51oqsZw7MGnUaA8cmekC67
	IRMpgY0iYTVx1PHq5WSj0v6LAQXMKa9K2hPMitLUADVhF9PLU4w4j2DkIbcpNWlru8mv+bw9LXB
	FwL7ykdDjhcVGzA5S0ggYKZcK3tPdwWbK4/MssN6LdS82cFf6THZs53su0qaEicEpiwodFvXvk7
	s4kDNhs9qMa6zDth1zsI3QFyHB41J8MzDQE2A8tlBzMc+61SQgJl+OyTqSgYBHzXMOnw8ZPRFoL
	ebVNIfzbrYfq7+Udf/WXDOha8WDhRTyoHXw0QYivR0uA0QGd73XuSViMo0wwS6wzkfAUDtm9Xf9
	qk1b+yXJQtN2esBp9+IiIdCIgU2h9lsErIyM6m7GGtlxAH8EmNw1lhwqpENtxl2Db6y7k8cqzH2
	92fm96M+/KemB5nLmMzRkCNdiSW+Mfckce0+y3ulqQkLYzTgSX8LoTIpXcZLjPxUdho0PEQ0dqN
	SNJts3vZ6gk+G6SwGpe9i5/jOCyNqwKdb2XHSN22D6aewuzRofVQ27O+0+BIcDc2xcvNC5Vne3k
	VHp/kmO+3Z0sRp13AOsg6fAP6
X-Received: by 2002:a05:600c:4f15:b0:4bb:6861:657d with SMTP id 5b1f17b1804b1-4bb88923954mr198879805e9.21.1795341271760;
        Sun, 22 Nov 2026 01:54:31 -0800 (PST)
From: Haseeb Ashraf <haseebashraf091@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Haseeb Ashraf <haseeb.ashraf@siemens.com>,
	sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com
Subject: [XEN][PATCH v5 1/8] xen/arm/p2m: perform IPA-based TLBI when IPA is known
Date: Sun, 22 Nov 2026 14:54:15 +0500
Message-ID: <536b83c4b9b22c6be55aad4e3d1c9d13be2aa31a.1795336377.git.haseebashraf091@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795336377.git.haseebashraf091@gmail.com>
References: <cover.1795336377.git.haseebashraf091@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1795341272-528DDCFC-DDA21309/0/0
X-purgate-type: clean
X-purgate-size: 17343
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Haseeb Ashraf <haseeb.ashraf@siemens.com>

VMALLS12E1IS invalidates all stage-1 and stage-2 translations for the
current VMID across the inner-shareable domain, regardless of which
mapping changed. This can be particularly costly when every TLBI is
emulated by an outer hypervisor.

Narrow the invalidation where Xen knows what changed:

- When a pCPU switches between vCPUs of a domain, use a local flush to
drop the prior vCPU's stage-1 translations. Arm64 uses a stage-1-only
TLBI; on Arm32 the available local guest-TLB instruction can also
invalidate stage-2 entries, depending on execution context.
- When p2m_remove_mapping() removes a range, invalidate that IPA range
instead of the whole VMID.
- When a valid entry is replaced, invalidate its IPA range. When a
superpage is split, invalidate the whole old block at its aligned base.

The IPA sequence issues one broadcast TLBI per page and is limited to
fewer than TLBI_MAX_PAGE_OPS pages (512 with 4KB pages), following
Linux's MAX_DVM_OPS limit. A larger range keeps the whole-VMID
invalidation. The limit bounds the number of broadcast operations; it is
not a performance crossover.

Existing deferred flushes remain unchanged: teardown of all mappings of
a dying domain, permission-only memaccess changes, and removals by
callers that do not know the range are still flushed by
p2m_write_unlock().

Complete stage-2 invalidation before stage-1 invalidation, and complete
the broadcast sequence before the repeat-TLBI workaround.

On Arm32, the range helper keeps the full flush; patch 3 adds the
capability-gated IPA implementation.

Linux references:
- arm64: KVM: Implement TLB handling, for the IPA TLBI followed by a
  stage-1 invalidation:
  https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=5eec0a91e32a2862e86265532ae773820e0afd77
- arm64: tlbi: Set MAX_TLBI_OPS to PTRS_PER_PTE, for the per-flush
  operation limit:
  https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=3d65b6bbc01ecece8142e62a8a5f1d48ba41a240
- The later rename of that limit to MAX_DVM_OPS:
  https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=ec1c3b9ff16082f880b304be40992568f4eee6a7

Suggested-by: Julien Grall <julien@xen.org>
Signed-off-by: Haseeb Ashraf <haseeb.ashraf@siemens.com>
---
Changes in v5:
- Replace the 256MB limit with TLBI_MAX_PAGE_OPS, following Linux.
- Flush the known range in p2m_remove_mapping(); other removals and
  permission-only memaccess changes remain deferred.
- Invalidate the whole old block when a superpage is split.
- Complete stage-2 invalidation before stage-1 invalidation, and complete
  the first DSB before the repeat-TLBI workaround.
- Fix the Arm64 helper macros so this patch builds on its own; they did
  not build on their own in v4.
- Keep TLBI instructions in one-instruction helpers and add the MPU stub
  for p2m_force_tlb_flush_range_sync(). Cite DDI 0487 M.d.

 xen/arch/arm/include/asm/arm32/flushtlb.h | 33 ++++++++
 xen/arch/arm/include/asm/arm64/flushtlb.h | 78 ++++++++++++++++++
 xen/arch/arm/include/asm/flushtlb.h       | 12 +++
 xen/arch/arm/include/asm/mmu/p2m.h        |  2 +
 xen/arch/arm/include/asm/mpu/p2m.h        |  4 +
 xen/arch/arm/mmu/p2m.c                    | 99 +++++++++++++++++++----
 xen/arch/arm/p2m.c                        | 16 +++-
 7 files changed, 226 insertions(+), 18 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm32/flushtlb.h b/xen/arch/arm/include/asm/arm32/flushtlb.h
index 5483be08fb..374b8bfe54 100644
--- a/xen/arch/arm/include/asm/arm32/flushtlb.h
+++ b/xen/arch/arm/include/asm/arm32/flushtlb.h
@@ -45,6 +45,23 @@ TLB_HELPER(flush_xen_tlb_local, TLBIALLH, nsh)
 
 #undef TLB_HELPER
 
+/*
+ * Flush TLB of local processor. Use when flush for only stage-1 is intended.
+ *
+ * The following function should be used where intention is to clear only
+ * stage-1 TLBs.
+ */
+static inline void flush_guest_tlb_s1_local(void)
+{
+    /*
+     * Same instruction can invalidate both stage-1 and stage-2 TLBs depending
+     * upon the execution context.
+     *
+     * See Arm ARM (DDI 0487 M.d), G5.9.5, Table G5-23.
+     */
+    flush_guest_tlb_local();
+}
+
 /* Flush TLB of local processor for address va. */
 static inline void __flush_xen_tlb_one_local(vaddr_t va)
 {
@@ -60,6 +77,22 @@ static inline void __flush_xen_tlb_one(vaddr_t va)
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
+     * See Arm ARM (DDI 0487 M.d), G5.9.5, Table G5-23.
+     */
+    flush_guest_tlb();
+}
+
 #endif /* __ASM_ARM_ARM32_FLUSHTLB_H__ */
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/arm64/flushtlb.h b/xen/arch/arm/include/asm/arm64/flushtlb.h
index 1606b26bf2..b3bce7baf2 100644
--- a/xen/arch/arm/include/asm/arm64/flushtlb.h
+++ b/xen/arch/arm/include/asm/arm64/flushtlb.h
@@ -67,6 +67,9 @@ TLB_HELPER_LOCAL(flush_guest_tlb_local, vmalls12e1)
 /* Flush innershareable TLBs, current VMID only */
 TLB_HELPER(flush_guest_tlb, vmalls12e1is)
 
+/* Flush local TLBs, current VMID, stage-1 only */
+TLB_HELPER_LOCAL(flush_guest_tlb_s1_local, vmalle1)
+
 /* Flush local TLBs, all VMIDs, non-hypervisor mode */
 TLB_HELPER_LOCAL(flush_all_guests_tlb_local, alle1)
 
@@ -116,6 +119,81 @@ static inline void __tlb_repeat_sync(void)
         : : : "memory");
 }
 
+/*
+ * Complete a broadcast TLBI sequence.
+ *
+ * The first DSB completes the TLBIs issued so far. For all relevant errata
+ * it is then only necessary to execute a single additional TLBI;DSB sequence,
+ * which __tlb_repeat_sync() does when the workaround is enabled.
+ */
+static inline void tlbi_complete_broadcast(void)
+{
+    dsb(ish);
+    __tlb_repeat_sync();
+    isb();
+}
+
+/*
+ * TLBI IPAS2E1IS: invalidate the stage-2 and combined entries of one IPA of
+ * the current VMID, in the inner-shareable domain. The caller issues the
+ * barriers.
+ */
+static inline void tlbi_ipas2e1is(paddr_t ipa)
+{
+    asm_inline volatile(
+        "tlbi ipas2e1is, %0"
+        : : "r" (ipa >> PAGE_SHIFT) : "memory");
+}
+
+/* TLBI VMALLE1IS: invalidate the stage-1 entries of the current VMID. */
+static inline void tlbi_vmalle1is(void)
+{
+    asm_inline volatile("tlbi vmalle1is" : : : "memory");
+}
+
+/*
+ * Flush a range of IPA's mappings from the TLB of all processors in the
+ * inner-shareable domain.
+ *
+ * A range of TLBI_MAX_PAGE_OPS pages or more is flushed with the whole
+ * VMID. Each page of the range costs a broadcast TLBI, and the limit bounds
+ * their number like MAX_DVM_OPS does in Linux. It is not a tuned value.
+ */
+static inline void flush_guest_tlb_range_ipa(paddr_t ipa, unsigned long size)
+{
+    unsigned long pages = size >> PAGE_SHIFT;
+    paddr_t end = ipa + size;
+
+    if ( pages >= TLBI_MAX_PAGE_OPS )
+    {
+        flush_guest_tlb();
+        return;
+    }
+
+    /*
+     * See Arm ARM (DDI 0487 M.d), D8.17.6.1 (Invalidating TLB entries from
+     * stage 2 translations).
+     */
+    dsb(ishst); /* Ensure prior page-table updates have completed */
+    for ( ; ipa < end; ipa += PAGE_SIZE )
+    {
+        /* Flush stage-2 TLBs for IPA address */
+        tlbi_ipas2e1is(ipa);
+    }
+
+    /*
+     * The stage-1 entries and walks that went through the removed stage-2
+     * entries have to be invalidated too. The stage-2 invalidation has to be
+     * complete first, or a walk on another CPU could still refill the TLBs
+     * with stage-1 and the old stage-2 translation. Linux does the same (see
+     * __kvm_tlb_flush_vmid_ipa()).
+     */
+    dsb(ish);
+    tlbi_vmalle1is();
+
+    tlbi_complete_broadcast();
+}
+
 #endif /* __ASM_ARM_ARM64_FLUSHTLB_H__ */
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/flushtlb.h b/xen/arch/arm/include/asm/flushtlb.h
index c292c3c00d..2711b76611 100644
--- a/xen/arch/arm/include/asm/flushtlb.h
+++ b/xen/arch/arm/include/asm/flushtlb.h
@@ -17,6 +17,18 @@ static inline void page_set_tlbflush_timestamp(struct page_info *page)
     page->tlbflush_timestamp = tlbflush_current_time();
 }
 
+/*
+ * Upper bound on the number of broadcast TLBI operations issued, one per
+ * page, to invalidate a range. A range of this many pages or more is
+ * invalidated with the whole VMID instead.
+ *
+ * This is the number of entries of a page table, which is the limit Linux
+ * uses for the same purpose (MAX_DVM_OPS in arch/arm64/include/asm/
+ * tlbflush.h). It bounds the burst of broadcast operations, and the time
+ * spent with the p2m lock held. It is not a tuned value.
+ */
+#define TLBI_MAX_PAGE_OPS       (1UL << (PAGE_SHIFT - 3))
+
 #if defined(CONFIG_ARM_32)
 # include <asm/arm32/flushtlb.h>
 #elif defined(CONFIG_ARM_64)
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
diff --git a/xen/arch/arm/include/asm/mpu/p2m.h b/xen/arch/arm/include/asm/mpu/p2m.h
index 1484c75b55..b799738314 100644
--- a/xen/arch/arm/include/asm/mpu/p2m.h
+++ b/xen/arch/arm/include/asm/mpu/p2m.h
@@ -17,6 +17,10 @@ static inline void p2m_clear_root_pages(struct p2m_domain *p2m) {}
 
 static inline void p2m_tlb_flush_sync(struct p2m_domain *p2m) {}
 
+static inline void p2m_force_tlb_flush_range_sync(struct p2m_domain *p2m,
+                                                  uint64_t start_ipa,
+                                                  uint64_t page_count) {}
+
 #endif /* __ARM_MPU_P2M_H__ */
 
 /*
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 53d28935af..b93ead6c46 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -233,37 +233,33 @@ void p2m_restore_state(struct vcpu *n)
     isb();
 
     /*
-     * Flush local TLB for the domain to prevent wrong TLB translation
-     * when running multiple vCPU of the same domain on a single pCPU.
+     * All vCPUs of the domain share the same p2m and the same effective
+     * stage-2 translation regime. The stage-1 translations of the vCPU that
+     * ran last on this pCPU must not be used by this one.
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
@@ -282,8 +278,14 @@ void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
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
@@ -291,10 +293,64 @@ void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
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
+        flush_guest_tlb_range_ipa(start_ipa, page_count * PAGE_SIZE);
+
+    p2m_restore_vttbr(ovttbr, flags);
+}
+
 void p2m_tlb_flush_sync(struct p2m_domain *p2m)
 {
     if ( p2m->need_flush )
@@ -1013,6 +1069,7 @@ static int __p2m_set_entry(struct p2m_domain *p2m,
     {
         /* We need to split the original page. */
         lpae_t split_pte = *entry;
+        unsigned long nr = 1UL << XEN_PT_LEVEL_ORDER(level);
 
         ASSERT(p2m_is_superpage(*entry, level));
 
@@ -1036,7 +1093,9 @@ static int __p2m_set_entry(struct p2m_domain *p2m,
          * For more details see (D4.7.1 in ARM DDI 0487A.j).
          */
         p2m_remove_pte(entry, p2m->clean_pte);
-        p2m_force_tlb_flush_sync(p2m);
+        p2m_force_tlb_flush_range_sync(p2m,
+                                       pfn_to_paddr(gfn_x(sgfn) & ~(nr - 1)),
+                                       nr);
 
         p2m_write_pte(entry, split_pte, p2m->clean_pte);
 
@@ -1092,7 +1151,12 @@ static int __p2m_set_entry(struct p2m_domain *p2m,
         p2m_remove_pte(entry, p2m->clean_pte);
 
     if ( removing_mapping )
-        /* Flush can be deferred if the entry is removed */
+        /*
+         * Flush can be deferred if the entry is removed. A caller that knows
+         * the range it removes flushes it by IPA when it is done, see
+         * p2m_remove_mapping(). Otherwise p2m_write_unlock() flushes all
+         * the TLBs of the domain, once for all the entries removed.
+         */
         p2m->need_flush |= !!lpae_is_valid(orig_pte);
     else
     {
@@ -1112,7 +1176,8 @@ static int __p2m_set_entry(struct p2m_domain *p2m,
         {
             if ( likely(!p2m->mem_access_enabled) ||
                  P2M_CLEAR_PERM(pte) != P2M_CLEAR_PERM(orig_pte) )
-                p2m_force_tlb_flush_sync(p2m);
+                p2m_force_tlb_flush_range_sync(p2m, gfn_to_gaddr(sgfn),
+                                               1UL << page_order);
             else
                 p2m->need_flush = true;
         }
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index fb03978a19..a39351ede9 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -133,6 +133,7 @@ static inline int p2m_remove_mapping(struct domain *d,
     int rc;
 
     p2m_write_lock(p2m);
+
     /*
      * Before removing the GFN - MFN mapping for any RAM pages make sure
      * that there is no difference between what is already mapped and what
@@ -161,7 +162,20 @@ static inline int p2m_remove_mapping(struct domain *d,
     rc = p2m_set_entry(p2m, start_gfn, nr, INVALID_MFN,
                        p2m_invalid, p2m_access_rwx);
 
-out:
+    /*
+     * The range that may have changed is known. Invalidate it instead of
+     * all the TLBs of the domain, which p2m_write_unlock() would do. The
+     * whole domain is still flushed when the range is too large for an
+     * invalidation by IPA. A failure after some entries were removed is
+     * covered by the same range.
+     */
+    if ( p2m->need_flush )
+    {
+        p2m_force_tlb_flush_range_sync(p2m, gfn_to_gaddr(start_gfn), nr);
+        p2m->need_flush = false;
+    }
+
+ out:
     p2m_write_unlock(p2m);
 
     return rc;

