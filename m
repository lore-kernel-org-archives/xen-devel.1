Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E70C61DD3
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2026 12:20:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1403959.1637911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x10zW-0007Xt-MC; Mon, 31 Aug 2026 12:19:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1403959.1637911; Mon, 31 Aug 2026 12:19:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x10zW-0007Wl-HK; Mon, 31 Aug 2026 12:19:58 +0000
Received: by outflank-mailman (input) for mailman id 1403959;
 Mon, 31 Aug 2026 12:19:57 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1x10zV-0007LP-KG
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 12:19:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x10zV-004lvp-0h
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 14:19:57 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a957163-e002-0a2a0a5209dd-0a2a4509a31c-32
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 14:19:57 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a95716c-be1a-0a2a45090019-d155dd34cd8c-3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 14:19:56 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-47c2b362ee2so2964444f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 05:19:56 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48440e094d0sm847709f8f.23.2026.08.31.05.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2026 05:19:55 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1788178796; x=1788783596; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PmiQSMZPixZ6AjqLdv2qezZIur3EMHWcw7A7AXRMY8E=;
        b=julaYGgfxZvL1vSMT3Zztt5xs75D1qWygTk37pJvgjnbvwCV3ghHQBpTc9CA9vnfth
         j/zuwFTWOkR1VS+y09VsaxsIZgPEWVWLape0Cs62YVnMcNoTnc/HcwDNCzl76cmNrXkZ
         1M56mSG7a/2mYQr5sStM+fRj6hTnEStKE4ETg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788178796; x=1788783596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PmiQSMZPixZ6AjqLdv2qezZIur3EMHWcw7A7AXRMY8E=;
        b=R95OfJvAd5Q9EXumA15aMgA3I8p6z6HnQdzKNpO1VQB8Lb5HxW7Hq91OKadl9Lgwh9
         RSjvRME9orIP//cFdRHIP3kReN7gAmu4hCoSr3TeYKEN6JcHwpwhfiQQr/5bxm1oMeP3
         ptGrIcG90tQmDgwaQj24270RrZnmEC/wWzD0VRW51sy8kkIte0KzyAAeF9Vsa3TfTLN3
         +cCKCqW4l2ejLlzE+yJK4QJY5UB3qoHvlz7YgdQxNvTpi7PSC7vJoiJ7S7SQnwCUWe1S
         8K96Kpc2NIKtOju9AHnWTxU5wJ7p2jj1aUiIxOcm1ZwCtjh1qIHgnM1m4jd0JIi3feRj
         tGzA==
X-Gm-Message-State: AFuF++m/gusRMwts54mVA4d61LqhYA/PkHOJfOLX/cfM0dWU/ve0cMCG
	FZh+f78QpKnUXKlC/738dK/XYIabSm7XDPo18NeCS4/FQbfEZMaIO1vweKHL7X4E7qo3mdJAMHO
	Ub5Tg
X-Gm-Gg: AYBFou3DrYm+wHN0CF1cbTM+cX9WKZdZpXpzidTek62fNW/e8Rn3SLL0ta0prLzhs32
	8bUMPvPI3ZJO+GT0mud6IP2TnoRZ2IrWY2AzdMgmexkneZCoe3kSqoCe08fXrtJJXmTol5uV+Z5
	xI95DDeE+YiCK79PdYZix3Mr8njZr1esfX2QCR8IJb8W6+ZjeXB8F767odXt1yretXPRYvzxWo+
	7r8HQgP8kGiQjv56lOQmHmX/CoCZlZj+5ThQF6uCTY4omvpnAETBEjM7khRdub4BkIooqsc9Yyw
	+Dk0QgsYD2uKeGxanXNA2UZLF2/djHSC0pvZFm5bCGZfhFDCSDD2Q0YwhWjyFknthWPGTldwuit
	q4E5vJ7CSLb5+hL1aesmaLA6s05DDTq8VGXJUR7er2OWZT7C7f48qMxNf/NmzoM2Mp1pPcmI4Pe
	F9NJ1ZUYq3uq5zvHxU/7r8p3nYceQL7S0TN0iZRt/FY1qfbSlidQvEL3066DBkZ/l7VXsOjvZ5f
	wyqWkXM76sgZ/83IgbNiAIUUWacr86UOn7aB+A=
X-Received: by 2002:a05:6000:38f:b0:484:3315:1a38 with SMTP id ffacd0b85a97d-48433152785mr26443741f8f.28.1788178795509;
        Mon, 31 Aug 2026 05:19:55 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>
Subject: [PATCH 4/6] xen/arm: Rewrite arm_smccc_smc() for arm64
Date: Mon, 31 Aug 2026 13:19:43 +0100
Message-Id: <20260831121944.2908139-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260831121944.2908139-1-andrew.cooper3@citrix.com>
References: <20260831121944.2908139-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1788178796-BC4CB034-8DBD56A9/0/0
X-purgate-type: clean
X-purgate-size: 9682

PSCI v1.0 says that x4 thru x17 may be clobbered.  PSCI v1.1 says they are
strictly preserved unless they contain return values.

Xen deals with this by having __arm_smccc_1_0_smc() as an out-of-line
function, but this causes awful code generation in arm_smccc_smc().
cpus_have_const_cap() is opaque to the optimiser, so we end up with one basic
block doing the reasonably-ok arm_smccc_1_1_smc() code generation and a second
basic block setting up all 8 input registers even when they're not needed,
spilling or discarding x8 thru x17, and calling an out-of-line function.

Remove __arm_smccc_1_0_smc() entirely, and rewrite arm_smccc_smc() to declare
x4 thru x17 as clobbered.

This fully inlines the SMC, is a single basic block which instructs the
compiler to spill or discard the potentially clobbered registers, and only
sets up the necessary number of arguments for the call.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>

Bloat-o-meter reports:

  add/remove: 0/1 grow/shrink: 0/10 up/down: 0/-795 (-795)
  Function                                     old     new   delta
  symbols_sorted_offsets                     23832   23824      -8
  symbols_names                              42962   42943     -19
  symbols_addresses                          35128   35104     -24
  __arm_smccc_1_0_smc                           32       -     -32
  call_psci_cpu_off                            144      76     -68
  seattle_system_reset                          92      16     -76
  seattle_system_off                            92      16     -76
  call_psci_system_reset                       112      32     -80
  call_psci_system_off                         112      32     -80
  call_psci_cpu_on                             252     124    -128
  psci_init                                    628     424    -204

An alternative way to do this would be to have x8 thru x17 in the clobber list
rather than the output list which would reduce the source size, but this form
is more amenable to having PSCI v1.2 worked into it too.
---
 xen/arch/arm/arm64/smc.S         | 16 ------
 xen/arch/arm/include/asm/smccc.h | 95 ++++++++++++++++----------------
 2 files changed, 48 insertions(+), 63 deletions(-)

diff --git a/xen/arch/arm/arm64/smc.S b/xen/arch/arm/arm64/smc.S
index 68b05e8ddd12..65b4eabe4f87 100644
--- a/xen/arch/arm/arm64/smc.S
+++ b/xen/arch/arm/arm64/smc.S
@@ -13,22 +13,6 @@
  * GNU General Public License for more details.
  */
 
-/*
- * void __arm_smccc_1_0_smc(register_t a0, register_t a1, register_t a2,
- *                          register_t a3, register_t a4, register_t a5,
- *                          register_t a6, register_t a7,
- *                          struct arm_smccc_res *res)
- */
-FUNC(__arm_smccc_1_0_smc)
-        smc     #0
-        ldr     x4, [sp]
-        cbz     x4, 1f          /* No need to store the result */
-        stp     x0, x1, [x4, #SMCCC_RES_a0]
-        stp     x2, x3, [x4, #SMCCC_RES_a2]
-1:
-        ret
-END(__arm_smccc_1_0_smc)
-
 /*
  * void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
  *                        struct arm_smccc_1_2_regs *res)
diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/smccc.h
index 5fe54013ac83..8920c54b09a6 100644
--- a/xen/arch/arm/include/asm/smccc.h
+++ b/xen/arch/arm/include/asm/smccc.h
@@ -16,9 +16,6 @@
 #ifndef __ASM_ARM_SMCCC_H__
 #define __ASM_ARM_SMCCC_H__
 
-#include <asm/alternative.h>
-#include <asm/cpufeature.h>
-
 #define SMCCC_VERSION_MAJOR_SHIFT            16
 #define SMCCC_VERSION_MINOR_MASK             \
         ((1U << SMCCC_VERSION_MAJOR_SHIFT) - 1)
@@ -57,6 +54,9 @@
 #ifndef __ASSEMBLER__
 
 #include <xen/macros.h>
+#include <xen/types.h>
+
+#include <asm/asm_defns.h>
 
 extern uint32_t smccc_ver;
 
@@ -160,6 +160,8 @@ struct arm_smccc_res {
 #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
 #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
 
+#ifdef CONFIG_ARM_32
+
 /*
  * arm_smccc_1_1_smc() - make an SMCCC v1.1 compliant SMC call
  *
@@ -199,7 +201,6 @@ struct arm_smccc_res {
  * The calling convention for arm32 is the same for both SMCCC v1.0 and
  * v1.1.
  */
-#ifdef CONFIG_ARM_32
 #define arm_smccc_smc(...) arm_smccc_1_1_smc(__VA_ARGS__)
 
 /* Make an SMCCC v1.1 compliant SMC call with guest register state. */
@@ -218,53 +219,53 @@ static inline void arm_smccc_guest_smc(struct cpu_user_regs *regs)
 
 #else /* CONFIG_ARM_64 */
 
-void __arm_smccc_1_0_smc(register_t a0, register_t a1, register_t a2,
-                         register_t a3, register_t a4, register_t a5,
-                         register_t a6, register_t a7,
-                         struct arm_smccc_res *res);
-
-/* Macros to handle variadic parameter for SMCCC v1.0 helper */
-#define __arm_smccc_1_0_smc_7(a0, a1, a2, a3, a4, a5, a6, a7, res)  \
-    __arm_smccc_1_0_smc(a0, a1, a2, a3, a4, a5, a6, a7, res)
-
-#define __arm_smccc_1_0_smc_6(a0, a1, a2, a3, a4, a5, a6, res)  \
-    __arm_smccc_1_0_smc_7(a0, a1, a2, a3, a4, a5, a6, 0, res)
-
-#define __arm_smccc_1_0_smc_5(a0, a1, a2, a3, a4, a5, res)  \
-    __arm_smccc_1_0_smc_6(a0, a1, a2, a3, a4, a5, 0, res)
-
-#define __arm_smccc_1_0_smc_4(a0, a1, a2, a3, a4, res)  \
-    __arm_smccc_1_0_smc_5(a0, a1, a2, a3, a4, 0, res)
-
-#define __arm_smccc_1_0_smc_3(a0, a1, a2, a3, res)  \
-    __arm_smccc_1_0_smc_4(a0, a1, a2, a3, 0, res)
-
-#define __arm_smccc_1_0_smc_2(a0, a1, a2, res)  \
-    __arm_smccc_1_0_smc_3(a0, a1, a2, 0, res)
-
-#define __arm_smccc_1_0_smc_1(a0, a1, res)  \
-    __arm_smccc_1_0_smc_2(a0, a1, 0, res)
-
-#define __arm_smccc_1_0_smc_0(a0, res)  \
-    __arm_smccc_1_0_smc_1(a0, 0, res)
-
-#define ___arm_smccc_1_0_smc_count(count, ...)    \
-    __arm_smccc_1_0_smc_ ## count(__VA_ARGS__)
-
-#define __arm_smccc_1_0_smc_count(count, ...)   \
-    ___arm_smccc_1_0_smc_count(count, __VA_ARGS__)
-
-#define arm_smccc_1_0_smc(...)                                              \
-        __arm_smccc_1_0_smc_count(__count_args(__VA_ARGS__), __VA_ARGS__)
-
+/*
+ * Make an SMCCC call compatible with both PSCI v1.1 and v1.0.
+ *
+ * PSCI v1.1 says that x4 through x17 are strictly preserved unless they
+ * contain return data.  PSCI v1.0 says they clobbered.
+ *
+ * Xen doesn't make PSCI v1.1 calls which expect more than 4 return registers,
+ * so imply list x4 through x17 as clobbered.
+ */
 #define arm_smccc_smc(...)                                      \
     do {                                                        \
-        if ( cpus_have_const_cap(ARM_SMCCC_1_1) )               \
-            arm_smccc_1_1_smc(__VA_ARGS__);                     \
-        else                                                    \
-            arm_smccc_1_0_smc(__VA_ARGS__);                     \
+        register unsigned long r0  ASM_REG(0);                  \
+        register unsigned long r1  ASM_REG(1);                  \
+        register unsigned long r2  ASM_REG(2);                  \
+        register unsigned long r3  ASM_REG(3);                  \
+        /* Potentially clobbered in PSCI 1.0 */                 \
+        register unsigned long c4  ASM_REG(4);                  \
+        register unsigned long c5  ASM_REG(5);                  \
+        register unsigned long c6  ASM_REG(6);                  \
+        register unsigned long c7  ASM_REG(7);                  \
+        register unsigned long c8  ASM_REG(8);                  \
+        register unsigned long c9  ASM_REG(9);                  \
+        register unsigned long c10 ASM_REG(10);                 \
+        register unsigned long c11 ASM_REG(11);                 \
+        register unsigned long c12 ASM_REG(12);                 \
+        register unsigned long c13 ASM_REG(13);                 \
+        register unsigned long c14 ASM_REG(14);                 \
+        register unsigned long c15 ASM_REG(15);                 \
+        register unsigned long c16 ASM_REG(16);                 \
+        register unsigned long c17 ASM_REG(17);                 \
+        __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
+        asm volatile (                                          \
+            "smc #0"                                            \
+            : "=r" (r0),  "=r" (r1),  "=r" (r2),  "=r" (r3),    \
+              "=r" (c4),  "=r" (c5),  "=r" (c6),  "=r" (c7),    \
+              "=r" (c8),  "=r" (c9),  "=r" (c10), "=r" (c11),   \
+              "=r" (c12), "=r" (c13), "=r" (c14), "=r" (c15),   \
+              "=r" (c16), "=r" (c17)                            \
+            : PASTE(__constraint_read_,                         \
+                    __count_args(__VA_ARGS__))                  \
+            : "memory" );                                       \
+        if ( ___res )                                           \
+            *___res = (struct arm_smccc_res){ r0, r1, r2, r3 }; \
     } while ( 0 )
 
+#define arm_smccc_1_1_smc(...) arm_smccc_smc(__VA_ARGS__)
+
 /* Make an SMCCC v1.1 compliant SMC call with guest register state. */
 static inline void arm_smccc_guest_smc(struct cpu_user_regs *regs)
 {
-- 
2.39.5


