Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7112606A320
	for <xen-devel@archiver.kernel.org>; Sun, 22 Nov 2026 09:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tpo40UgB
Received: from list by lists.xenproject.org with outflank-mailman.1499537.1696315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xV4HQ-0005LZ-7h; Sun, 22 Nov 2026 09:54:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1499537.1696315; Sun, 22 Nov 2026 09:54:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xV4HQ-0005LR-3h; Sun, 22 Nov 2026 09:54:40 +0000
Received: by outflank-mailman (input) for mailman id 1499537;
 Sun, 22 Nov 2026 09:54:38 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <haseebashraf091@gmail.com>) id 1xV4HO-0005Gw-OH
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2026 09:54:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xV4HO-00ExLX-4y
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2026 10:54:38 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <haseebashraf091@gmail.com>)
 id 6b02bbc6-bab6-0a2a0a5309dd-0a2a4505c3ae-12
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 10:54:38 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <haseebashraf091@gmail.com>)
 id 6b02bbdd-4cb1-0a2a45050019-d1558036eda8-3
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 10:54:37 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4bb85e07aadso26963025e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 01:54:37 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.36.59.78])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8849e598sm218409605e9.8.2026.11.22.01.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2026 01:54:36 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1795341277; x=1795946077; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I1BLtEUMvehhpFQ6Z0pgP6yp1celKNfoPEoGbciJo5M=;
        b=tpo40UgBm/63eXt8y2jn5ahZWOP+I1L8NFnRLv81Wj8qqn1J83JLMFYnh83ZobsI5Y
         skD4OjVib1diVKBJAjkDImS6b/WNOvz8kiaD1VAt0pCsB7AjCai8IVrGp1hB3DEfeh5U
         IDHw2VVdjjH+VfOm2S8Ngg6xUT7PuLmvKRvERh3TrMZN476PvE5aovT4iSD6K2TF/YQR
         D2jW73h6vGPRTjfl1MN89DD2WgpgzkUDRNpgWS189k1RXwJ1W1pgvrGLnbLmMixg9qGH
         JF+KsM73YPJoBAuQ7LPeVGaVHLgmrhQBgi6bHr87c3+lMvjzEfcfNJNWBrYDg1gYUygx
         JBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795341277; x=1795946077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I1BLtEUMvehhpFQ6Z0pgP6yp1celKNfoPEoGbciJo5M=;
        b=m8OrjUmS7Nsklf5o8hYEgb32RdMN85UjZypWUs0qLHHaxsRGa5uZ8BTrvDvknJcFH5
         ec7IJSxlLFRKdliT3VAl/lURAzNmqabTrf0ZHaLPyZG1mUi7SY43G2QO+yHVtUUsvQcH
         6yzbsTRdekMXVJ8sRE57GQgyvJB2lvXgYKznm5DhC7Xwz93diIrsyxmhkdR5b+jZ8mQJ
         BqPejVC8hLHUMaQIewmpsSlXNtQhMEQEI/o6UEhw6qk2hVQILnDdl0T9hYGh9/j6y4VT
         pL+Q47NSoYPJkXxgNjqrNX3Vuen+edj3iecBf88kHlLgxrBaWum/U8reFx0eGWoxg6mW
         sABQ==
X-Gm-Message-State: APuU4Z8/ggZ0Id2DiNV4Nr9BozYpop3+2waPaI9dNkkZPMStXdp/VW7V
	i4jcuhFmrsDIVg+eo5oRd2mEH6NT+Mjb820rWwX4I6dKEj2fh45zC2/PYXf+dbf54/g=
X-Gm-Gg: AZFdTZfU+Ctrk2rhCKChLTJd2cWRTlpI/c6Cd70XeAQr8KHV+N/LP7+8oeO4rrXPjsB
	RLO6AtCtj5WWRhfVXRGL1SCw8uV4f2zk/n0f5vj4L8QOqJbqlMU4Ki02Cz6FENSvixJJGm5Nulp
	kyvoVbrT1YCb3D1IB4SJJAcndk2iJpoL+oD/y0rEaZJrBHLw+mhWXVp8gBF0WTvlWPjShOOrQWS
	NCiN64hG4VzQHmtoxcBIIKEu0AqcDfMQcQYgEkBSlerVNumfTFyIF80ATvezN2W2WBjirql9iz0
	sqKuG3GQZCcINmtsMnFiiug31LpzX3qbkfvEYmRNcgDbCa5mC+63/hCqnWjRt42nhlcH0b43csE
	L5PzrHLeznVvTF6kxp6+UGsORUgoeoyAsVgTVkRm9aO1z0g+ObwDym/kTAcPl39rjsw1NdjqE3P
	ZAHd4R6YBD9WngTSgO1QRPJuv8v2uXDpaU7v7zz+sWMTfWxkn/0mbg9jCdk8IrxAwrfCmmAaKCJ
	pR/77lViufjeRP28+UjTHfJL49zUSJ9qatuqSidQ2At7O00n0rOsJe0b3c/Xmqtlcp36thJzK2U
	5fjmRSw+4auOdRXOUwiXMQvqmWFSC5SoRXVCKWd/Ihz4StYhGP5pbmWAbvyfao5vRqk8Gj3vUVD
	+jMcsbyUrg1hTEh09a9CjFe7p/w==
X-Received: by 2002:a05:600c:3f0a:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4bb8880cde7mr169167775e9.22.1795341277368;
        Sun, 22 Nov 2026 01:54:37 -0800 (PST)
From: Haseeb Ashraf <haseebashraf091@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Haseeb Ashraf <haseeb.ashraf@siemens.com>,
	sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com
Subject: [XEN][PATCH v5 3/8] xen/arm32: use IPA-based TLBI when supported with FEAT_nTLBPA
Date: Sun, 22 Nov 2026 14:54:17 +0500
Message-ID: <9bf1e84e4ef124fc11fe5c2e58d09ee1003f9434.1795336377.git.haseebashraf091@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795336377.git.haseebashraf091@gmail.com>
References: <cover.1795336377.git.haseebashraf091@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1795341278-F5CA82A1-5419D372/0/0
X-purgate-type: clean
X-purgate-size: 7495
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Haseeb Ashraf <haseeb.ashraf@siemens.com>

Detect TLBI by IPA from ID_MMFR2.UniTLB, which reports the Arm32
instruction support. ID_MMFR5.nTLBPA reports whether intermediate
translation-table walk caches are absent.

Use TLBI IPAS2IS in the p2m range-flush helper only when both
capabilities are present. Without FEAT_nTLBPA, a stage-2-only
invalidation would need a separate stage-1 invalidation, which Arm32
cannot issue for the guest; keep the full guest flush in that case.

Bound the per-page loop with TLBI_MAX_PAGE_OPS, like the Arm64 fallback.

Suggested-by: Julien Grall <julien@xen.org>
Signed-off-by: Haseeb Ashraf <haseeb.ashraf@siemens.com>
---
Changes in v5:
- Bound the loop with TLBI_MAX_PAGE_OPS.
- Put the TLBI instruction in a helper and cite DDI 0487 M.d.

 xen/arch/arm/cpufeature.c                 | 21 +++++++++++-
 xen/arch/arm/include/asm/arm32/flushtlb.h | 42 ++++++++++++++++++++---
 xen/arch/arm/include/asm/cpregs.h         |  1 +
 xen/arch/arm/include/asm/cpufeature.h     | 21 +++++++++++-
 xen/arch/arm/include/asm/processor.h      |  7 ++++
 5 files changed, 86 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
index 0a87186a7e..e4e0dd0922 100644
--- a/xen/arch/arm/cpufeature.c
+++ b/xen/arch/arm/cpufeature.c
@@ -17,6 +17,18 @@ DECLARE_BITMAP(cpu_hwcaps, ARM_NCAPS);
 
 struct cpuinfo_arm __read_mostly domain_cpuinfo;
 
+#ifdef CONFIG_ARM_32
+static bool has_tlb_ipa_instruction(const struct arm_cpu_capabilities *entry)
+{
+    return system_cpuinfo.mm32.unitlb == MM32_UNITLB_BY_IPA;
+}
+
+static bool has_ntlbpa(const struct arm_cpu_capabilities *entry)
+{
+    return system_cpuinfo.mm32.ntlbpa == MM32_NTLBPA_SUPPORT_IMP;
+}
+#endif
+
 #ifdef CONFIG_ARM_64
 static bool has_ntlbpa(const struct arm_cpu_capabilities *entry)
 {
@@ -30,7 +42,14 @@ static bool has_sb_instruction(const struct arm_cpu_capabilities *entry)
 #endif
 
 static const struct arm_cpu_capabilities arm_features[] = {
-#ifdef CONFIG_ARM_64
+#ifdef CONFIG_ARM_32
+    {
+        .desc = "IPA-based TLB Invalidation",
+        .capability = ARM32_HAS_TLB_IPA,
+        .matches = has_tlb_ipa_instruction,
+    },
+#endif
+#if defined(CONFIG_ARM_32) || defined(CONFIG_ARM_64)
     {
         .desc = "Intermediate caching of translation table walks (nTLBPA)",
         .capability = ARM_HAS_NTLBPA,
diff --git a/xen/arch/arm/include/asm/arm32/flushtlb.h b/xen/arch/arm/include/asm/arm32/flushtlb.h
index 374b8bfe54..b2a96372a4 100644
--- a/xen/arch/arm/include/asm/arm32/flushtlb.h
+++ b/xen/arch/arm/include/asm/arm32/flushtlb.h
@@ -77,6 +77,13 @@ static inline void __flush_xen_tlb_one(vaddr_t va)
 /* Only for ARM64_WORKAROUND_REPEAT_TLBI */
 static inline void __tlb_repeat_sync(void) {}
 
+/* TLBI IPAS2IS: invalidate the stage-2 entries of one IPA of the VMID. */
+static inline void tlbi_ipas2is(paddr_t ipa)
+{
+    asm volatile ( STORE_CP32(0, TLBIIPAS2IS)
+                   : : "r" (ipa >> PAGE_SHIFT) : "memory" );
+}
+
 /*
  * Flush a range of IPA's mappings from the TLB of all processors in the
  * inner-shareable domain.
@@ -85,12 +92,39 @@ static inline void flush_guest_tlb_range_ipa(paddr_t ipa,
                                              unsigned long size)
 {
     /*
-     * Following can invalidate both stage-1 and stage-2 TLBs depending upon
-     * the execution mode.
+     * IPA-based stage-2 invalidation is only useful when FEAT_nTLBPA is
+     * present. Without FEAT_nTLBPA, invalidating stage-2 alone may still
+     * require discarding associated stage-1 side effects, and Arm32 does not
+     * provide a separate guest stage-1 TLBI for that case.
      *
-     * See Arm ARM (DDI 0487 M.d), G5.9.5, Table G5-23.
+     * A range of TLBI_MAX_PAGE_OPS pages or more is flushed with the whole
+     * VMID, to bound the number of broadcast TLBIs like on Arm64.
      */
-    flush_guest_tlb();
+    if ( cpus_have_const_cap(ARM_HAS_NTLBPA) &&
+         cpus_have_const_cap(ARM32_HAS_TLB_IPA) &&
+         (size >> PAGE_SHIFT) < TLBI_MAX_PAGE_OPS )
+    {
+        paddr_t end = ipa + size;
+
+        dsb(ishst); /* Ensure prior page-tables updates have completed */
+        for ( ; ipa < end; ipa += PAGE_SIZE )
+        {
+            /* Flush stage-2 TLBs for this IPA. */
+            tlbi_ipas2is(ipa);
+        }
+        dsb(ish);
+        isb();
+    }
+    else
+    {
+        /*
+         * Following can invalidate both stage-1 and stage-2 TLBs depending
+         * upon the execution mode.
+         *
+         * See Arm ARM (DDI 0487 M.d), G5.9.5, Table G5-23.
+         */
+        flush_guest_tlb();
+    }
 }
 
 #endif /* __ASM_ARM_ARM32_FLUSHTLB_H__ */
diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
index 7e559253d7..9869bc7d3c 100644
--- a/xen/arch/arm/include/asm/cpregs.h
+++ b/xen/arch/arm/include/asm/cpregs.h
@@ -223,6 +223,7 @@
 #define TLBIMVA         p15,0,c8,c7,1   /* invalidate unified TLB entry by MVA */
 #define TLBIASID        p15,0,c8,c7,2   /* invalid unified TLB by ASID match */
 #define TLBIMVAA        p15,0,c8,c7,3   /* invalidate unified TLB entries by MVA all ASID */
+#define TLBIIPAS2IS     p15,4,c8,c0,1   /* Invalidate unified TLB entry for stage 2 by IPA inner shareable */
 #define TLBIALLHIS      p15,4,c8,c3,0   /* Invalidate Entire Hyp. Unified TLB inner shareable */
 #define TLBIMVAHIS      p15,4,c8,c3,1   /* Invalidate Unified Hyp. TLB by MVA inner shareable */
 #define TLBIALLNSNHIS   p15,4,c8,c3,4   /* Invalidate Entire Non-Secure Non-Hyp. Unified TLB inner shareable */
diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
index 97e371724f..38e01aa94d 100644
--- a/xen/arch/arm/include/asm/cpufeature.h
+++ b/xen/arch/arm/include/asm/cpufeature.h
@@ -77,8 +77,9 @@
 #define ARM_HAS_SB 16
 #define ARM64_WORKAROUND_1508412 17
 #define ARM_HAS_NTLBPA 18
+#define ARM32_HAS_TLB_IPA 19
 
-#define ARM_NCAPS           19
+#define ARM_NCAPS           20
 
 #ifndef __ASSEMBLER__
 
@@ -454,6 +455,24 @@ struct cpuinfo_arm {
 
     struct {
         register_t bits[6];
+        struct {
+            /* MMFR0 */
+            unsigned long __res0:32;
+            /* MMFR1 */
+            unsigned long __res1:32;
+            /* MMFR2 */
+            unsigned long __res2:16;
+            unsigned long unitlb:4;
+            unsigned long __res3:12;
+            /* MMFR3 */
+            unsigned long __res4:32;
+            /* MMFR4 */
+            unsigned long __res5:32;
+            /* MMFR5 */
+            unsigned long __res6:4;
+            unsigned long ntlbpa:4;
+            unsigned long __res7:24;
+        };
     } mm32;
 
     struct {
diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 49774b65eb..6899f91ef0 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -484,6 +484,13 @@
 /* FSR long format */
 #define FSRL_STATUS_DEBUG       (_AC(0x22,UL)<<0)
 
+#ifdef CONFIG_ARM_32
+#define MM32_UNITLB_NI              0x0
+#define MM32_UNITLB_BY_IPA          0x6
+
+#define MM32_NTLBPA_SUPPORT_NI      0x0
+#define MM32_NTLBPA_SUPPORT_IMP     0x1
+#endif
 #ifdef CONFIG_ARM_64
 #define MM64_VMID_8_BITS_SUPPORT    0x0
 #define MM64_VMID_16_BITS_SUPPORT   0x2

