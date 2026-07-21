Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96958C4452B
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2026 07:55:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367526.1617292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm5Jn-0005gl-2b; Tue, 21 Jul 2026 07:55:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367526.1617292; Tue, 21 Jul 2026 07:55:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm5Jm-0005gX-Vl; Tue, 21 Jul 2026 07:55:10 +0000
Received: by outflank-mailman (input) for mailman id 1367526;
 Tue, 21 Jul 2026 07:55:10 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <haseebashraf091@gmail.com>) id 1wm5Jl-0005es-VD
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 07:55:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wm5Jl-009Ifk-By
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 09:55:09 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <haseebashraf091@gmail.com>)
 id 6a5f25d7-e002-0a2a0a5209dd-0a2a45018776-14
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 09:55:09 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <haseebashraf091@gmail.com>)
 id 6a5f25db-5984-0a2a45010019-d1558031c8fe-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 09:55:07 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4956869750eso1244745e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 00:55:07 -0700 (PDT)
Received: from PKL-HASEEBA-LT.. ([139.135.37.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956537c7desm64018485e9.7.2026.07.21.00.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 00:55:06 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784620507; x=1785225307; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8y3SqamaTJh0GUJ2sdHO6bq/+cXRF/0GLWO2Zr3rpE=;
        b=IK8nxTsKG3T8u+muZfVIe0DihAbjdB92kfH1H3SlgtlWPswignnku75dtP4R3F7oRy
         /jo0vgCey04/l8UQjL7ezj3vB87ERInnsErHHnqDaG/hljjhPqNzelmAyONZ+IKUKJ9z
         OO6kqejL5YJWfle7P332UuoiUpeKr2WLLwg5W2xPWlOaNcRLC0JMipqAsusFZc6cCvUm
         cI2XxNHPDEWjhkW2CtTsiTL4/7WG/Y+X8tBPLIj6j3ZIUDrkTITA0nJt6QdQEUHSwaIW
         /z8xIzm297RwG1Nk8f9KjyMm6YehZ3ww1opzYgUVgi77oxbH4fJiJY7f0UOjeS5keMQd
         GEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620507; x=1785225307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F8y3SqamaTJh0GUJ2sdHO6bq/+cXRF/0GLWO2Zr3rpE=;
        b=EjKhff0vfkIQ8LQgtwPCeVSn0S/PBu7zwlwAspAcV/hjxZhTwE+S1XxJMC8qRrYJV1
         spQxxzJWcVzQsMbS8CcsWJGrwDzjNcPzZj7fY9UOnsv9tiDA0NLlBJSAkn8CDU8vvPub
         6xGCdsKQ6kQQH7XxTMnmtX3+FHPN8UULPVGeiLUS9ZKiTuMC7eYTHKWqfkWmgInQsnVD
         U8YRPXRvlHm8/4yENdGzeN/eH5jz5Eszx/ZUblz7LxhLcX6ZO4jemi7CHgnx0jwRy6Bm
         MqH2AyTaGSH4D2LGlgds8S6/4yDv210Xm0YvDttCaPuKYUGvLsfEHV5bP3zvZHVvJZDN
         SwYw==
X-Gm-Message-State: AOJu0Yz+TS0rSO52HToR8dZwQQiaDgW9fbQ4H7t9w0j2mA8RNuIa49le
	Ge6ceIrLlxlrrPAwM4ljRqg5hBYKUjwpPhzYLsOBjKFynsoPEgwQWNv2ikwsBEbI
X-Gm-Gg: AfdE7ckT2Ocb2WADtj9SqOEHWau10A+tTPRJi7Q+R2NFAx+UOSN3BFriskI7FIyQjbK
	ITcEq0JZO0/EzJNYp/isg7BGb45yOpmqGT9C2kCinP4Y5qiRKzzuBmNGCWzRfH0JTLdR7+24b6W
	kxhZRy4fl5xr0O/ZukogD6GWq9CldvNVJDC8633/e11uA7fjpTeRuO6h5B5ydLNA4DRn3In7eJO
	ptYLOVp7REUEs4AFUWLqYq5tDDAbQaWtzM6s4CH64XYlGaZoeUt3jtOERtmjaa1jYqSd+HfAtV9
	L3T5OGvvSia35RkkNY4poNbo2JWT9bKilK2jw94pC2xvRzjtn+iItNhfpb8/wZT7lKVQZKo6vrf
	ZPgaxqp+YDtuxImLN1nOXhEwGRvcTSmQ8J5uSAKtFhXhBRzQG+He7jBVtErZ+qkym4M0PKifkyP
	DT/r4hxcvbPVIabP1WU++7cs84ym9KquzOZ0FgxbOUlR4=
X-Received: by 2002:a05:600c:5351:b0:493:c8a6:b517 with SMTP id 5b1f17b1804b1-4954a51bb65mr138176715e9.38.1784620507118;
        Tue, 21 Jul 2026 00:55:07 -0700 (PDT)
From: Haseeb Ashraf <haseebashraf091@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: haseeb.ashraf@siemens.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][RESEND][PATCH 3/3] xen/arm32: use IPA-based TLBI when supported with FEAT_nTLBPA
Date: Tue, 21 Jul 2026 12:54:51 +0500
Message-ID: <d072f06ddbe9960b20d454809cdcdcfd294532f9.1784619778.git.haseeb.ashraf@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <e933703bf76cbc33e5d05a023900389fd6a9f925.1784619778.git.haseeb.ashraf@siemens.com>
References: <e933703bf76cbc33e5d05a023900389fd6a9f925.1784619778.git.haseeb.ashraf@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1784620507-C4B45757-FCB4C2C3/0/0
X-purgate-type: clean
X-purgate-size: 8491

From: Haseeb Ashraf <haseeb.ashraf@siemens.com>

Arm32 provides TLBI-by-IPA instructions on CPUs that implement the
relevant stage-2 invalidation support. Detect this as a CPU capability
and use it to perform IPA-based invalidation in the p2m range flush
helper.

On Arm32, however, IPA-based stage-2 invalidation is only useful when
FEAT_nTLBPA is also present. Without FEAT_nTLBPA, a stage-2 invalidation
may still require discarding associated stage-1 side effects, and Arm32
does not provide a separate stage-1 guest TLBI that Xen can use here.
In that case, falling back to the existing full guest flush remains the
correct approach.

Therefore, enable Arm32 IPA-based invalidation only when both:
  - TLBI-by-IPA is supported, and
  - FEAT_nTLBPA is present.

As on Arm64, the helper bounds the per-page invalidation loop with a
256MB cutoff and falls back to a full guest flush for larger ranges.
For Arm32 this threshold is used as a conservative practical limit,
reusing the Arm64 cutoff, rather than as an Arm32-specific tuned value.

Suggested-by: Julien Grall <julien@xen.org>
Signed-off-by: Haseeb Ashraf <haseeb.ashraf@siemens.com>

Changes in v4:
- Clarified that Arm32 IPA-based TLBI is only enabled when both
  TLBI-by-IPA support and FEAT_nTLBPA are present.
- Clarified that the 256MB threshold is reused as a conservative
  practical cutoff and is not based on Arm32-specific measurements.
- Refined comments and commit message wording.

Changes in v3:
- There are no functional changes in this version. There are minor
  code updates and comment updates as per the feedback on v2.
- The cpregs are defined in order as per Coprocessor-> CRn-> Opcode 1
  -> CRm-> Opcode 2.
- Added comment to explain why IPA-based TLBI is added only in
  presence of FEAT_nTLBPA.
- Replaced `goto default_tlbi` with if...else.
- Removed extra definitions of MM32_UNITLB_* macros which were not
  being used.

Changes in v2:
- This commit is implemented in v2 as per the feedback to implement
  IPA-based TLBI for Arm32 in addition to Arm64.
---
 xen/arch/arm/cpufeature.c                 | 12 ++++++
 xen/arch/arm/include/asm/arm32/flushtlb.h | 47 ++++++++++++++++++++---
 xen/arch/arm/include/asm/cpregs.h         |  1 +
 xen/arch/arm/include/asm/cpufeature.h     | 15 +++++---
 xen/arch/arm/include/asm/processor.h      |  3 ++
 5 files changed, 67 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
index 86720c10a3..9ca449a551 100644
--- a/xen/arch/arm/cpufeature.c
+++ b/xen/arch/arm/cpufeature.c
@@ -18,6 +18,11 @@ DECLARE_BITMAP(cpu_hwcaps, ARM_NCAPS);
 struct cpuinfo_arm __read_mostly domain_cpuinfo;
 
 #ifdef CONFIG_ARM_32
+static bool has_tlb_ipa_instruction(const struct arm_cpu_capabilities *entry)
+{
+    return system_cpuinfo.mm32.unitlb == MM32_UNITLB_BY_IPA;
+}
+
 static bool has_ntlbpa(const struct arm_cpu_capabilities *entry)
 {
     return system_cpuinfo.mm32.ntlbpa == MM32_NTLBPA_SUPPORT_IMP;
@@ -37,6 +42,13 @@ static bool has_sb_instruction(const struct arm_cpu_capabilities *entry)
 #endif
 
 static const struct arm_cpu_capabilities arm_features[] = {
+#ifdef CONFIG_ARM_32
+    {
+        .desc = "IPA-based TLB Invalidation",
+        .capability = ARM32_HAS_TLB_IPA,
+        .matches = has_tlb_ipa_instruction,
+    },
+#endif
 #if defined(CONFIG_ARM_32) || defined(CONFIG_ARM_64)
     {
         .desc = "Intermediate caching of translation table walks (nTLBPA)",
diff --git a/xen/arch/arm/include/asm/arm32/flushtlb.h b/xen/arch/arm/include/asm/arm32/flushtlb.h
index 30df161323..1db6b8410e 100644
--- a/xen/arch/arm/include/asm/arm32/flushtlb.h
+++ b/xen/arch/arm/include/asm/arm32/flushtlb.h
@@ -1,6 +1,8 @@
 #ifndef __ASM_ARM_ARM32_FLUSHTLB_H__
 #define __ASM_ARM_ARM32_FLUSHTLB_H__
 
+#include <xen/sizes.h> /* For SZ_* macros. */
+
 /*
  * Every invalidation operation use the following patterns:
  *
@@ -107,12 +109,47 @@ static inline void flush_guest_tlb_range_ipa(paddr_t ipa,
                                              unsigned long size)
 {
     /*
-     * Following can invalidate both stage-1 and stage-2 TLBs depending upon
-     * the execution mode.
-     *
-     * See ARMv8 (DDI 0487L.b): G5-11698 Table G5-23.
+     * IPA-based stage-2 invalidation is only useful when FEAT_nTLBPA is
+     * present. Without FEAT_nTLBPA, invalidating stage-2 alone may still
+     * require discarding associated stage-1 side effects, and Arm32 does not
+     * provide a separate guest stage-1 TLBI for that case.
      */
-    flush_guest_tlb();
+    if ( cpus_have_const_cap(ARM_HAS_NTLBPA) &&
+         cpus_have_const_cap(ARM32_HAS_TLB_IPA) )
+    {
+        /*
+         * If the IPA range is too large, fall back to a full guest flush
+         * rather than issuing a long per-page TLBI sequence. Reuse the same
+         * practical cutoff as Arm64.
+         */
+        if ( size > SZ_256M )
+            flush_guest_tlb();
+        else
+        {
+            paddr_t end = ipa + size;
+
+            dsb(ishst); /* Ensure prior page-tables updates have completed */
+            while ( ipa < end )
+            {
+                /* Flush stage-2 TLBs for this IPA. */
+                asm volatile ( STORE_CP32(0, TLBIIPAS2IS)
+                               : : "r" (ipa >> PAGE_SHIFT) : "memory" );
+                ipa += PAGE_SIZE;
+            }
+            dsb(ish);
+            isb();
+        }
+    }
+    else
+    {
+        /*
+         * Following can invalidate both stage-1 and stage-2 TLBs depending
+         * upon the execution mode.
+         *
+         * See ARMv8 (DDI 0487L.b): G5-11698 Table G5-23.
+         */
+        flush_guest_tlb();
+    }
 }
 
 #endif /* __ASM_ARM_ARM32_FLUSHTLB_H__ */
diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
index a7503a190f..26b5c08d0e 100644
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
index 3e56dd27ef..09a516fe49 100644
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
 
@@ -447,15 +448,17 @@ struct cpuinfo_arm {
             /* MMFR1 */
             unsigned long __res1:32;
             /* MMFR2 */
-            unsigned long __res2:32;
+            unsigned long __res2:16;
+            unsigned long unitlb:4;
+            unsigned long __res3:12;
             /* MMFR3 */
-            unsigned long __res3:32;
-            /* MMFR4 */
             unsigned long __res4:32;
+            /* MMFR4 */
+            unsigned long __res5:32;
             /* MMFR5 */
-            unsigned long __res5:4;
+            unsigned long __res6:4;
             unsigned long ntlbpa:4;
-            unsigned long __res6:24;
+            unsigned long __res7:24;
         };
     } mm32;
 
diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index dbf9471a7a..0c47225de0 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -485,6 +485,9 @@
 #define FSRL_STATUS_DEBUG       (_AC(0x22,UL)<<0)
 
 #ifdef CONFIG_ARM_32
+#define MM32_UNITLB_NI              0x0
+#define MM32_UNITLB_BY_IPA          0x6
+
 #define MM32_NTLBPA_SUPPORT_NI      0x0
 #define MM32_NTLBPA_SUPPORT_IMP     0x1
 #endif
-- 
2.43.0


