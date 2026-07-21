Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA95C44529
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2026 07:55:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367525.1617284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm5Ji-0005Oi-RX; Tue, 21 Jul 2026 07:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367525.1617284; Tue, 21 Jul 2026 07:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm5Ji-0005OZ-OG; Tue, 21 Jul 2026 07:55:06 +0000
Received: by outflank-mailman (input) for mailman id 1367525;
 Tue, 21 Jul 2026 07:55:06 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <haseebashraf091@gmail.com>) id 1wm5Jh-0005Nt-Uh
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 07:55:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wm5Jh-001akS-4C
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 09:55:05 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <haseebashraf091@gmail.com>)
 id 6a5f25d7-bab6-0a2a0a5309dd-0a2a45028c5c-6
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 09:55:05 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <haseebashraf091@gmail.com>)
 id 6a5f25d8-6ca4-0a2a45020019-d155802cf148-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 09:55:05 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-49548aebcd8so25133395e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 00:55:05 -0700 (PDT)
Received: from PKL-HASEEBA-LT.. ([139.135.37.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956537c7desm64018485e9.7.2026.07.21.00.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 00:55:03 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784620504; x=1785225304; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l1YwPtqEAgkhkVo9sNpi4i947+4EUoWWzwp3eKb1YOA=;
        b=ou7ygeDv2ecqmZ/YD/vdNCOtSb4T9dGPoMEzQrxgrIjRV/j1kA4RIg23VooO2FbYX6
         IKr//XpUNGzI85LwjR+OSwPxqw3Cm0LS6x0qxBf/XmGRrFKAJQv1ObwNQjmVTNThd705
         ITnxHZzfEcnkQ3rtoiyw01UVYiKu5M19JuFRSn5pli7LV0M8o9y4eFeD1Cr9PM0vVKJM
         rFRzQfRpWrB6jAguzy1JTSSxx3zSppu8rH2BM7JBheICSlRIgRLYc4H8yr3GBlYuJBWc
         hjvpA5dZ4fekXJLstssExLm/0scBsmuEiVU2Cc4E2ErGSVUuyuMrvnu3v5VI1t2xyCfW
         uTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620504; x=1785225304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l1YwPtqEAgkhkVo9sNpi4i947+4EUoWWzwp3eKb1YOA=;
        b=Lf/4iAKuS+nBfS+ZOGyLOZVwsrWu2ezAP31u45HfAFpM0UlVku3k8AB2nC543mpbRp
         6jYNjSJQEz1rAMxxYt3iDDnY6n8rvmbQmlFF9O2x0wHkvnYbo8MlQE1ehqdmOY47xMnt
         62NeIH42yTTWAkY/a3tGLRGxX1BGW9e3X21RtBjapM5LCjtBcuFfV8jKPLZwWf+NLFfb
         M1fp5izHwJSY9KOquWv+U4kIj+7pHTK9Y35l3fXFjg6SStFJ+Sns8yUq5NB4QJcde2mx
         LND3XQH8NfYaycHAOAOovPYBLuaP7HMHGYHSifu5gm3RqHMZrY+sNIRmCqMVUhhLbuAL
         WB1Q==
X-Gm-Message-State: AOJu0Yz6yWK4cfYdDI3/D8NRFwGoKfxBbfjERAqx6r7B5nqbDw5oFPAW
	1sk6Ir/dmXqOF8uxoP3H3n5rtjM51+YmXijedqwaZ3Fa2IN5ukVRO4GwcdlpAD52
X-Gm-Gg: AfdE7cleyvlq5WWx7WR3vALlpqGdsFWs635BehbTEUOIo0rqJU8p9uOI2M9NAjbB3EP
	j6ifP4Q7o9+FqW4edukULi3i9VbA3i6PfMEiTWRCcxMtTIRrusSoO7tpnFxCpuS7RQNMXlmcz5q
	WGNvT5ehHdCvZ+KRGDhAldTLs3bmKnkjRqhdufOy+cZG1is5g/cC01jCdXmczHc9ALQEcppuONV
	QEixr5eDbYJXl5y/pQrSi8ydDiqIX4YJyKMBIgUvwopOk9eS9xwbGBq8AWb/E3S7MnVBN7/acX2
	w83HRxxpsveN5PauM4Rc2KiasTVwqhzUB4cugISr6udS9ptzjo8w+UDKnZB9p94sEo3CbnbEcLW
	nAOejJwJr17E3XNznJGCmFlzTc59G9TuIIJt88E/MXKqZHZXA4gHX/Ty0fwe2YGR1PF29b5ovf3
	YZwkh/m9CaY3rzYCH9zOy9+8wZCH8nI22FC3wr/JfW8mI=
X-Received: by 2002:a05:600c:3112:b0:495:472c:208d with SMTP id 5b1f17b1804b1-4954a41307cmr179462365e9.38.1784620504275;
        Tue, 21 Jul 2026 00:55:04 -0700 (PDT)
From: Haseeb Ashraf <haseebashraf091@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: haseeb.ashraf@siemens.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Mohamed Mediouni <mohamed@unpredictable.fr>
Subject: [XEN][RESEND][PATCH 2/3] xen/arm: optimize stage-1,2 combined TLBI in presence of FEAT_nTLBPA
Date: Tue, 21 Jul 2026 12:54:50 +0500
Message-ID: <ed2e6c02d99bf75b6e6dfc0b7275573c58f4e076.1784619778.git.haseeb.ashraf@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <e933703bf76cbc33e5d05a023900389fd6a9f925.1784619778.git.haseeb.ashraf@siemens.com>
References: <e933703bf76cbc33e5d05a023900389fd6a9f925.1784619778.git.haseeb.ashraf@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1784620505-31FD62AC-B943B358/0/0
X-purgate-type: clean
X-purgate-size: 11048

From: Haseeb Ashraf <haseeb.ashraf@siemens.com>

FEAT_nTLBPA guarantees that intermediate caching of translation table
walks does not retain non-coherent cached copies of previously valid
translation table entries since the last completed applicable TLBI.

When FEAT_nTLBPA is present, a stage-2 invalidation no longer needs to
be paired with an additional stage-1 invalidation solely to discard
such side effects. Use this to avoid redundant stage-1 invalidation in
the combined guest TLBI paths.

Update the stage-1-only guest TLBI helpers so that they become no-ops
when FEAT_nTLBPA is present. This allows existing call sites that
conservatively issue stage-1 invalidation after stage-2 invalidation to
benefit without further restructuring.

Also update the Arm64 IPA-based invalidation helper so that:
  - stage-2 invalidation by IPA is performed explicitly,
  - stage-1 invalidation is issued separately only when FEAT_nTLBPA is
    absent,
  - completion of the broadcast TLBI sequence remains explicit.

This makes the architectural intent clearer and avoids redundant
invalidations on systems that implement FEAT_nTLBPA.

Suggested-by: Mohamed Mediouni <mohamed@unpredictable.fr>
Signed-off-by: Haseeb Ashraf <haseeb.ashraf@siemens.com>

Changes in v4:
- Reworked the Arm64 IPA-based invalidation helper so that stage-2,
  optional stage-1, and final TLBI completion are expressed
  separately and explicitly.
- Simplified the FEAT_nTLBPA optimization by reusing the explicit TLBI
  completion helper instead of open-coding a special final IPA TLBI
  sequence.
- Refined comments and commit message wording.

Changes in v3:
- This commit has no functional change in v3, only rebasing changes
  due to updates in commit-1.

Changes in v2:
- This commit is implemented in v2 and is splitted from commit-1 in
  v1. This is implemented by using CPU capability.
---
 xen/arch/arm/cpufeature.c                 | 19 ++++++++++
 xen/arch/arm/include/asm/arm32/flushtlb.h | 14 ++++----
 xen/arch/arm/include/asm/arm64/flushtlb.h | 44 +++++++++++++++++++----
 xen/arch/arm/include/asm/cpufeature.h     | 24 +++++++++++--
 xen/arch/arm/include/asm/processor.h      |  7 ++++
 5 files changed, 93 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
index 94d14fb6a9..86720c10a3 100644
--- a/xen/arch/arm/cpufeature.c
+++ b/xen/arch/arm/cpufeature.c
@@ -17,7 +17,19 @@ DECLARE_BITMAP(cpu_hwcaps, ARM_NCAPS);
 
 struct cpuinfo_arm __read_mostly domain_cpuinfo;
 
+#ifdef CONFIG_ARM_32
+static bool has_ntlbpa(const struct arm_cpu_capabilities *entry)
+{
+    return system_cpuinfo.mm32.ntlbpa == MM32_NTLBPA_SUPPORT_IMP;
+}
+#endif
+
 #ifdef CONFIG_ARM_64
+static bool has_ntlbpa(const struct arm_cpu_capabilities *entry)
+{
+    return system_cpuinfo.mm64.ntlbpa == MM64_NTLBPA_SUPPORT_IMP;
+}
+
 static bool has_sb_instruction(const struct arm_cpu_capabilities *entry)
 {
     return system_cpuinfo.isa64.sb;
@@ -25,6 +37,13 @@ static bool has_sb_instruction(const struct arm_cpu_capabilities *entry)
 #endif
 
 static const struct arm_cpu_capabilities arm_features[] = {
+#if defined(CONFIG_ARM_32) || defined(CONFIG_ARM_64)
+    {
+        .desc = "Intermediate caching of translation table walks (nTLBPA)",
+        .capability = ARM_HAS_NTLBPA,
+        .matches = has_ntlbpa,
+    },
+#endif
 #ifdef CONFIG_ARM_64
     {
         .desc = "Speculation barrier instruction (SB)",
diff --git a/xen/arch/arm/include/asm/arm32/flushtlb.h b/xen/arch/arm/include/asm/arm32/flushtlb.h
index 1497f16ba5..30df161323 100644
--- a/xen/arch/arm/include/asm/arm32/flushtlb.h
+++ b/xen/arch/arm/include/asm/arm32/flushtlb.h
@@ -49,8 +49,8 @@ TLB_HELPER(flush_xen_tlb_local, TLBIALLH, nsh)
  * Flush TLB of local processor. Use when flush for only stage-1 is intended.
  *
  * The following function should be used where intention is to clear only
- * stage-1 TLBs. This would be helpful in future in identifying which stage-1
- * TLB flushes can be skipped such as in present of FEAT_nTLBPA.
+ * stage-1 TLBs. This would be helpful in identifying which stage-1 TLB flushes
+ * can be skipped such as in present of FEAT_nTLBPA.
  */
 static inline void flush_guest_tlb_s1_local(void)
 {
@@ -60,7 +60,8 @@ static inline void flush_guest_tlb_s1_local(void)
      *
      * See ARMv8 (DDI 0487L.b): G5-11698 Table G5-23.
      */
-    return flush_guest_tlb_local();
+    if ( !cpus_have_const_cap(ARM_HAS_NTLBPA) )
+        flush_guest_tlb_local();
 }
 
 /*
@@ -68,8 +69,8 @@ static inline void flush_guest_tlb_s1_local(void)
  * stage-1 is intended.
  *
  * The following function should be used where intention is to clear only
- * stage-1 TLBs. This would be helpful in future in identifying which stage-1
- * TLB flushes can be skipped such as in present of FEAT_nTLBPA.
+ * stage-1 TLBs. This would be helpful in identifying which stage-1 TLB flushes
+ * can be skipped such as in present of FEAT_nTLBPA.
  */
 static inline void flush_guest_tlb_s1(void)
 {
@@ -79,7 +80,8 @@ static inline void flush_guest_tlb_s1(void)
      *
      * See ARMv8 (DDI 0487L.b): G5-11698 Table G5-23.
      */
-    return flush_guest_tlb();
+    if ( !cpus_have_const_cap(ARM_HAS_NTLBPA) )
+        flush_guest_tlb();
 }
 
 /* Flush TLB of local processor for address va. */
diff --git a/xen/arch/arm/include/asm/arm64/flushtlb.h b/xen/arch/arm/include/asm/arm64/flushtlb.h
index cbe2a0da57..de266b0e11 100644
--- a/xen/arch/arm/include/asm/arm64/flushtlb.h
+++ b/xen/arch/arm/include/asm/arm64/flushtlb.h
@@ -63,6 +63,36 @@ static inline void name(void)                         \
         : : : "memory"); \
 }
 
+#define TLB_HELPER_NTLBPA_LOCAL(name, tlbop)     \
+static inline void name(void)                    \
+{                                                \
+    if ( !cpus_have_const_cap(ARM_HAS_NTLBPA) )  \
+        asm_inline volatile (                    \
+            "dsb  nshst;"                        \
+            "tlbi "  # tlbop  ";"                \
+            "dsb  nsh;"                          \
+            "isb;"                               \
+            : : : "memory");                     \
+}
+
+#define TLB_HELPER_NTLBPA(name, tlbop)                \
+static inline void name(void)                         \
+{                                                     \
+    if ( !cpus_have_const_cap(ARM_HAS_NTLBPA) )       \
+        asm_inline volatile (                         \
+            "dsb  ishst;"                             \
+            "tlbi "  # tlbop  ";"                     \
+            ALTERNATIVE(                              \
+                "nop; nop;",                          \
+                "dsb  ish;"                           \
+                "tlbi vale2is, xzr;",                 \
+                ARM64_WORKAROUND_REPEAT_TLBI,         \
+                CONFIG_ARM64_WORKAROUND_REPEAT_TLBI)  \
+            "dsb  ish;"                               \
+            "isb;"                                    \
+            : : : "memory");                          \
+}
+
 /* Flush local TLBs, current VMID only. */
 TLB_HELPER_LOCAL(flush_guest_tlb_local, vmalls12e1)
 
@@ -70,10 +100,10 @@ TLB_HELPER_LOCAL(flush_guest_tlb_local, vmalls12e1)
 TLB_HELPER(flush_guest_tlb, vmalls12e1is)
 
 /* Flush local TLBs, current VMID, stage-1 only */
-TLB_HELPER(flush_guest_tlb_s1_local, vmalle1, nsh)
+TLB_HELPER_NTLBPA_LOCAL(flush_guest_tlb_s1_local, vmalle1)
 
 /* Flush innershareable TLBs, current VMID, stage-1 only */
-TLB_HELPER(flush_guest_tlb_s1, vmalle1is, ish)
+TLB_HELPER_NTLBPA(flush_guest_tlb_s1, vmalle1is)
 
 /* Flush local TLBs, all VMIDs, non-hypervisor mode */
 TLB_HELPER_LOCAL(flush_all_guests_tlb_local, alle1)
@@ -86,6 +116,8 @@ TLB_HELPER_LOCAL(flush_xen_tlb_local, alle2)
 
 #undef TLB_HELPER_LOCAL
 #undef TLB_HELPER
+#undef TLB_HELPER_NTLBPA_LOCAL
+#undef TLB_HELPER_NTLBPA
 
 /*
  * FLush TLB by VA. This will likely be used in a loop, so the caller
@@ -169,11 +201,11 @@ static inline void flush_guest_tlb_range_ipa(paddr_t ipa, unsigned long size)
     }
 
     /*
-     * Invalidate stage-1 entries for the current VMID as well. Keep this
-     * separate from completion of the broadcast TLBI sequence so that the
-     * final barriers/workaround are explicit.
+     * Without FEAT_nTLBPA, invalidate corresponding stage-1 side effects
+     * separately. Completion of the broadcast TLBI sequence remains explicit.
      */
-    asm_inline volatile("tlbi vmalle1is" : : : "memory");
+    if ( !cpus_have_const_cap(ARM_HAS_NTLBPA) )
+        asm_inline volatile("tlbi vmalle1is" : : : "memory");
 
     tlbi_complete_broadcast();
 }
diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
index bf902a3970..3e56dd27ef 100644
--- a/xen/arch/arm/include/asm/cpufeature.h
+++ b/xen/arch/arm/include/asm/cpufeature.h
@@ -76,8 +76,9 @@
 #define ARM_WORKAROUND_BHB_SMCC_3 15
 #define ARM_HAS_SB 16
 #define ARM64_WORKAROUND_1508412 17
+#define ARM_HAS_NTLBPA 18
 
-#define ARM_NCAPS           18
+#define ARM_NCAPS           19
 
 #ifndef __ASSEMBLER__
 
@@ -276,7 +277,8 @@ struct cpuinfo_arm {
             unsigned long ets:4;
             unsigned long __res2:4;
             unsigned long afp:4;
-            unsigned long __res3:12;
+            unsigned long ntlbpa:4;
+            unsigned long __res3:8;
             unsigned long ecbhb:4;
 
             /* MMFR2 */
@@ -437,8 +439,24 @@ struct cpuinfo_arm {
         register_t bits[1];
     } aux32;
 
-    struct {
+    union {
         register_t bits[6];
+        struct {
+            /* MMFR0 */
+            unsigned long __res0:32;
+            /* MMFR1 */
+            unsigned long __res1:32;
+            /* MMFR2 */
+            unsigned long __res2:32;
+            /* MMFR3 */
+            unsigned long __res3:32;
+            /* MMFR4 */
+            unsigned long __res4:32;
+            /* MMFR5 */
+            unsigned long __res5:4;
+            unsigned long ntlbpa:4;
+            unsigned long __res6:24;
+        };
     } mm32;
 
     struct {
diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index a3753c317f..dbf9471a7a 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -484,9 +484,16 @@
 /* FSR long format */
 #define FSRL_STATUS_DEBUG       (_AC(0x22,UL)<<0)
 
+#ifdef CONFIG_ARM_32
+#define MM32_NTLBPA_SUPPORT_NI      0x0
+#define MM32_NTLBPA_SUPPORT_IMP     0x1
+#endif
+
 #ifdef CONFIG_ARM_64
 #define MM64_VMID_8_BITS_SUPPORT    0x0
 #define MM64_VMID_16_BITS_SUPPORT   0x2
+#define MM64_NTLBPA_SUPPORT_NI      0x0
+#define MM64_NTLBPA_SUPPORT_IMP     0x1
 #endif
 
 #define MM64_MSA_PMSA_SUPPORT       0xf
-- 
2.43.0


