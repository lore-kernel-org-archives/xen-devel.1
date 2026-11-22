Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13012606A32A
	for <xen-devel@archiver.kernel.org>; Sun, 22 Nov 2026 09:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OxB7gloY
Received: from list by lists.xenproject.org with outflank-mailman.1499538.1696323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xV4HS-0005a2-DK; Sun, 22 Nov 2026 09:54:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1499538.1696323; Sun, 22 Nov 2026 09:54:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xV4HS-0005Zv-AK; Sun, 22 Nov 2026 09:54:42 +0000
Received: by outflank-mailman (input) for mailman id 1499538;
 Sun, 22 Nov 2026 09:54:41 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <haseebashraf091@gmail.com>) id 1xV4HR-0005Yj-Eb
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2026 09:54:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xV4HQ-00ExLX-RN
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2026 10:54:40 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <haseebashraf091@gmail.com>)
 id 6b02bbc6-bab6-0a2a0a5309dd-0a2a4505c3ae-18
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 10:54:40 +0100
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <haseebashraf091@gmail.com>)
 id 6b02bbe0-4cb1-0a2a45050019-d155802cbdf4-3
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 10:54:40 +0100
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4bb702a7548so16642405e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 01:54:40 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.36.59.78])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8849e598sm218409605e9.8.2026.11.22.01.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2026 01:54:39 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1795341280; x=1795946080; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fM8Pt+w103yss8koq0I3JGySpUK8NMJUieRlgYIlzMA=;
        b=OxB7gloYsZVVZuRy3Pxv2Z9tl7oPEgzSfTDJqtK016rnNJUN+1R0jWakaz+M7i/Omt
         J+izBJ1BBk2ZusYkzCm44hbAHyAdvJEkZ6D06Ldrri/jSC7l0gttQQf/OKytOb39HfUU
         VT2lqaNfCiNum1Ib6L+qSTzmU1VHlHW04bHqtUjD2nVQFE4tIDWmgiJDL2Vxl76PGa8c
         ABQTfAd66qaSGQJUv9e4sEBROjuo+MrIbIX+uA6eI6jq9sSPyS9QbyGiSlqRUXNC6FpP
         4LNMXoLPOBfiJunTVrGjMmSX5Yeuad1/sJfq21U9/mtVv/AP4E5JHdfJTHwGiXeJSRv3
         Umfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795341280; x=1795946080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fM8Pt+w103yss8koq0I3JGySpUK8NMJUieRlgYIlzMA=;
        b=HyzJY4NW147mHDZXhx4EBlDD/7/3cFoy1Qv3ZH5rnmeoLH1jZatZUdHvad0R+jE3B7
         Kl1JjKUzaVuSEs9QyVWfPakj71gK8TDbr0Vo+goSjcRkyT+sVyEI3z+VMQuI0yIZxC0c
         3weRz9FmQ807+Y0N514fq2oYPmtox5kpcmD59NKG03fwcu1ZbSo0Yo5VZpdrmN3kT2pB
         p6H2ebNkFECO8/VjguV+aUoE8pSp8rU8Lv4Fo/m3xn8n712tQo8/42Emj2Jnu2hPn2yt
         4DWHAhHxu/rkirOKFQa4xdBH4+HVlygv0ocCVV0Y9AleFFP1rhLT8LcUNieyLfbpMlO/
         uLkA==
X-Gm-Message-State: APuU4Z8fonDlHwP67266Q05+WDjdFvIb9xStmnn6sXiKbCkITfHjnNj0
	ch8otALWUidzhnrMcwMyOeArrct1HKDvRoUY/fIuSok1TPqT9VyGDkQ2DQVcSzx9tEA=
X-Gm-Gg: AZFdTZcYP9apDI6tVn9FehhxJCw8AdQXzcQu0vIx0LKdsrWMASF6BMfmprDcNthT1Hw
	LbO8i/XpcuEtmz9vQ98UF+AmgAxksMrDB/BQ4UqsRPlEirKPEmsBQamxedA63haKXDQt3JZWhzV
	ASwYoXaoK0gT0+36HV6iIjm+cx8Zj2ShATDjyvlhTzzt55C33YckYwnQf8wGs6RvxnCkFdhWDky
	XJeNszWTC6AeJsKyckeORXG3KuxY54wjSa/DsibPIZVe9MP/l5bSAS6gIQ6B44oXYaSkq8Gm72d
	mYsA8+okXGPPbY5N/YFFrNismHuad4kAD1X2jKdhb+ZqKvW7P+JPXxAssu+8XlJjuft7Xuo7Dvp
	BkJw73Ur+5AG9ouKsAUMTlNBYdudOIN4/enyVsOx+SuvUnOsoD0VN6mBDJG7LlNjHmg3+fQ/YwN
	Vi8HnxSN8mJuc5MZzZrfW0DNZzAIycd1hDu4nSn6jNLV54EFA/uxJwq4PreE4Ei2eqnETAKJkyL
	bUg+rw5b5tw4E0cV0iGHT+AmclPVDuJ4M/NsFc2l37TYNkGnY9wZou5CnVfzZJw/Ie+i2ljiPEp
	Wo7dhl4N8xo7n7Bc8CgWfe2xrdJwWTQk7TkHlcBTehx+pNShCcvh//BRcE0g/dfBs+wwlFhI8jp
	K9CTU32dmvihQkmq3KmEMPKse
X-Received: by 2002:a05:600c:1c1b:b0:4a7:a5db:a93e with SMTP id 5b1f17b1804b1-4bb887e2677mr202835235e9.4.1795341280198;
        Sun, 22 Nov 2026 01:54:40 -0800 (PST)
From: Haseeb Ashraf <haseebashraf091@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Haseeb Ashraf <haseeb.ashraf@siemens.com>,
	sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com
Subject: [XEN][PATCH v5 4/8] xen/arm64: use range TLBI for IPA flush with FEAT_TLBIRANGE
Date: Sun, 22 Nov 2026 14:54:18 +0500
Message-ID: <b79baebc670c76175341fde6d9e9582529c874c4.1795336377.git.haseebashraf091@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795336377.git.haseebashraf091@gmail.com>
References: <cover.1795336377.git.haseebashraf091@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1795341280-73ABF2A1-D5A54D98/0/0
X-purgate-type: clean
X-purgate-size: 9019
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Haseeb Ashraf <haseeb.ashraf@siemens.com>

Invalidating a range of IPAs with TLBI IPAS2E1IS takes one broadcast
instruction per page. With FEAT_TLBIRANGE, TLBI RIPAS2E1IS invalidates
a range with at most four range operations when it fits the range limit
of the instruction. Larger ranges fall back to a full VMID invalidation.
When Xen runs on top of another hypervisor, each instruction also traps
to it.

A range of one page costs one instruction either way. The gain is for
multi-page ranges: the whole old block of a split superpage, a removal
of several pages, and the batched removal added by patches 6 and 7.
Without the feature, a block of 512 pages or more is flushed with the
whole VMID, as before.

Detect the feature as a CPU capability, from ID_AA64ISAR0_EL1.TLB.
When it is present, flush_guest_tlb_range_ipa() covers the range with
one operation per scale, the largest first. Only a range that does not
fit the largest operation is flushed with VMALLS12E1IS, which is the
limit Linux uses (MAX_TLBI_RANGE_PAGES). Without the feature the
per-page loop and its TLBI_MAX_PAGE_OPS bound are unchanged.

A range operation covers an even number of pages. Extend an odd range
by one page to the next even boundary instead of ending with a single
page TLBI IPAS2E1IS, which saves one instruction per range. A page
more is always safe to invalidate, and extending to the neighbor
that makes the range 2 page aligned never leaves the IPA space.

The operation is encoded with SYS so that no assembler support for
FEAT_TLBIRANGE is required. Stage-2 of Xen does not use FEAT_LPA2, so
BADDR holds IPA[48:12].

Linux references:
- arm64: tlb: Use the TLBI RANGE feature in arm64, for the range
  encoding and the scale decomposition:
  https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=d1d3aa98b1d4826a19adfefb69b96142a0cac633
- KVM: arm64: Implement __kvm_tlb_flush_vmid_range(), for the stage-2
  IPA range invalidation:
  https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=6354d15052ec88273c24beae4c99e31c3d3889b6

Signed-off-by: Haseeb Ashraf <haseeb.ashraf@siemens.com>
---
 xen/arch/arm/cpufeature.c                 |  14 +++
 xen/arch/arm/include/asm/arm64/flushtlb.h | 113 ++++++++++++++++++++--
 xen/arch/arm/include/asm/cpufeature.h     |   3 +-
 3 files changed, 121 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
index e4e0dd0922..05c4393324 100644
--- a/xen/arch/arm/cpufeature.c
+++ b/xen/arch/arm/cpufeature.c
@@ -39,6 +39,15 @@ static bool has_sb_instruction(const struct arm_cpu_capabilities *entry)
 {
     return system_cpuinfo.isa64.sb;
 }
+
+static bool has_tlbi_range(const struct arm_cpu_capabilities *entry)
+{
+    /*
+     * ID_AA64ISAR0_EL1.TLB: 0b0001 is FEAT_TLBIOS, 0b0010 adds
+     * FEAT_TLBIRANGE.
+     */
+    return system_cpuinfo.isa64.tlb >= 2;
+}
 #endif
 
 static const struct arm_cpu_capabilities arm_features[] = {
@@ -62,6 +71,11 @@ static const struct arm_cpu_capabilities arm_features[] = {
         .capability = ARM_HAS_SB,
         .matches = has_sb_instruction,
     },
+    {
+        .desc = "Range-based TLB invalidation (FEAT_TLBIRANGE)",
+        .capability = ARM64_HAS_TLBI_RANGE,
+        .matches = has_tlbi_range,
+    },
 #endif
     {},
 };
diff --git a/xen/arch/arm/include/asm/arm64/flushtlb.h b/xen/arch/arm/include/asm/arm64/flushtlb.h
index ff2ce2bae2..7dc8ae608a 100644
--- a/xen/arch/arm/include/asm/arm64/flushtlb.h
+++ b/xen/arch/arm/include/asm/arm64/flushtlb.h
@@ -133,6 +133,70 @@ static inline void tlbi_complete_broadcast(void)
     isb();
 }
 
+/*
+ * Range-based TLB invalidation (FEAT_TLBIRANGE), see Arm ARM
+ * (DDI 0487 M.d), C5.5.22 (TLBI RIPAS2E1IS).
+ *
+ * The operand of TLBI RIPAS2E1IS is:
+ *   [47:46] TG     translation granule, 0b01 for 4KB
+ *   [45:44] SCALE
+ *   [43:39] NUM
+ *   [38:37] TTL    0b00, no level hint
+ *   [36:0]  BADDR  IPA[48:12], Xen does not use FEAT_LPA2 for stage-2
+ * and the instruction invalidates (NUM + 1) * 2^(5 * SCALE + 1) pages.
+ *
+ * These are the same definitions as in Linux, see
+ * arch/arm64/include/asm/tlbflush.h.
+ */
+#define TLBI_RANGE_MAX_SCALE    3
+#define TLBI_RANGE_PAGES(num, scale) \
+    ((((unsigned long)(num)) + 1) << (5 * (scale) + 1))
+#define TLBI_RANGE_MAX_PAGES    TLBI_RANGE_PAGES(31, TLBI_RANGE_MAX_SCALE)
+/* Gives -1 to 31 for a range of up to TLBI_RANGE_MAX_PAGES pages. */
+#define TLBI_RANGE_NUM(pages, scale) \
+    ((long)((pages) >> (5 * (scale) + 1)) - 1)
+
+/*
+ * TLBI RIPAS2E1IS: invalidate a range of IPAs of the current VMID, in the
+ * inner-shareable domain. It is encoded as SYS #4, C8, C0, #2 so that no
+ * assembler support for FEAT_TLBIRANGE is required.
+ */
+static inline void tlbi_ripas2e1is(uint64_t op)
+{
+    asm_inline volatile(
+        "sys #4, c8, c0, #2, %0"
+        : : "r" (op) : "memory");
+}
+
+/*
+ * Invalidate an even number @pages, of at most TLBI_RANGE_MAX_PAGES, of
+ * stage-2 pages starting at @ipa, using at most one range operation per
+ * scale. The caller issues the barriers.
+ */
+static inline void tlbi_range_ipas2e1is(paddr_t ipa, unsigned long pages)
+{
+    int scale = TLBI_RANGE_MAX_SCALE;
+
+    while ( pages > 1 && scale >= 0 )
+    {
+        long num = TLBI_RANGE_NUM(pages, scale);
+
+        if ( num >= 0 )
+        {
+            uint64_t op = ((ipa >> PAGE_SHIFT) & 0x1fffffffffULL) |
+                          ((uint64_t)num << 39) |
+                          ((uint64_t)scale << 44) |
+                          (1ULL << 46);
+
+            tlbi_ripas2e1is(op);
+
+            ipa += (paddr_t)TLBI_RANGE_PAGES(num, scale) << PAGE_SHIFT;
+            pages -= TLBI_RANGE_PAGES(num, scale);
+        }
+        scale--;
+    }
+}
+
 /*
  * TLBI IPAS2E1IS: invalidate the stage-2 and combined entries of one IPA of
  * the current VMID, in the inner-shareable domain. The caller issues the
@@ -155,16 +219,42 @@ static inline void tlbi_vmalle1is(void)
  * Flush a range of IPA's mappings from the TLB of all processors in the
  * inner-shareable domain.
  *
- * A range of TLBI_MAX_PAGE_OPS pages or more is flushed with the whole
- * VMID. Each page of the range costs a broadcast TLBI, and the limit bounds
- * their number like MAX_DVM_OPS does in Linux. It is not a tuned value.
+ * With FEAT_TLBIRANGE, ranges larger than TLBI_RANGE_MAX_PAGES are flushed
+ * with the whole VMID. Without it, a range of TLBI_MAX_PAGE_OPS pages or
+ * more uses the whole VMID; each smaller range costs one broadcast TLBI per
+ * page. These limits bound instruction count; neither is a tuned crossover.
  */
 static inline void flush_guest_tlb_range_ipa(paddr_t ipa, unsigned long size)
 {
     unsigned long pages = size >> PAGE_SHIFT;
-    paddr_t end = ipa + size;
+    bool range = cpus_have_const_cap(ARM64_HAS_TLBI_RANGE);
+
+    if ( !pages )
+        return;
 
-    if ( pages >= TLBI_MAX_PAGE_OPS )
+    if ( range )
+    {
+        /*
+         * A range operation covers an even number of pages. Extend an odd
+         * range by one page, on the side that makes it 2 pages aligned: the
+         * neighbor is always inside the IPA space, and a page more is safe
+         * to invalidate.
+         */
+        if ( (pages & 1UL) != 0UL )
+        {
+            if ( (ipa & PAGE_SIZE) != 0UL )
+                ipa -= PAGE_SIZE;
+            pages++;
+        }
+
+        /* Same limit as Linux, one range operation per scale at most. */
+        if ( pages > TLBI_RANGE_MAX_PAGES )
+        {
+            flush_guest_tlb();
+            return;
+        }
+    }
+    else if ( pages >= TLBI_MAX_PAGE_OPS )
     {
         flush_guest_tlb();
         return;
@@ -175,10 +265,17 @@ static inline void flush_guest_tlb_range_ipa(paddr_t ipa, unsigned long size)
      * stage 2 translations).
      */
     dsb(ishst); /* Ensure prior page-table updates have completed */
-    for ( ; ipa < end; ipa += PAGE_SIZE )
+    if ( range )
+        tlbi_range_ipas2e1is(ipa, pages);
+    else
     {
-        /* Flush stage-2 TLBs for IPA address */
-        tlbi_ipas2e1is(ipa);
+        paddr_t end = ipa + size;
+
+        for ( ; ipa < end; ipa += PAGE_SIZE )
+        {
+            /* Flush stage-2 TLBs for IPA address */
+            tlbi_ipas2e1is(ipa);
+        }
     }
 
     /*
diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
index 38e01aa94d..a4f7bcbe3e 100644
--- a/xen/arch/arm/include/asm/cpufeature.h
+++ b/xen/arch/arm/include/asm/cpufeature.h
@@ -78,8 +78,9 @@
 #define ARM64_WORKAROUND_1508412 17
 #define ARM_HAS_NTLBPA 18
 #define ARM32_HAS_TLB_IPA 19
+#define ARM64_HAS_TLBI_RANGE 20
 
-#define ARM_NCAPS           20
+#define ARM_NCAPS           21
 
 #ifndef __ASSEMBLER__
 

