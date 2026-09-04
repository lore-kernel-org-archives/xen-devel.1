Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432C9C79F83
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 11:12:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408224.1640893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2RqZ-0005gd-V6; Fri, 04 Sep 2026 11:12:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408224.1640893; Fri, 04 Sep 2026 11:12:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2RqZ-0005fX-PX; Fri, 04 Sep 2026 11:12:39 +0000
Received: by outflank-mailman (input) for mailman id 1408224;
 Fri, 04 Sep 2026 11:12:38 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1x2RqY-00059N-Iu
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 11:12:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2RqX-006qSV-VG
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 13:12:37 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a9aa79c-8faa-0a2a0a5109dd-0a2a4503b272-26
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 13:12:37 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a9aa7a5-fae8-0a2a45030019-d1558031f1e3-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 13:12:37 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-49ccfae359fso6877575e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 04:12:37 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485885be1c1sm5501729f8f.32.2026.09.04.04.12.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 04:12:36 -0700 (PDT)
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
        d=citrix.com; s=google; t=1788520357; x=1789125157; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gQNZV3/Wwp2qSBWtwYPdoz/wcPd4hlfIxvJUtY/sSz4=;
        b=erjHWhRIjbMv3Np6Gy060tckZwPnDImNH/xbvlnuCMAUvYCMbMUmO99hSgwaxBHCxa
         dkUon0pvd/nfcX+ptOQyL+9gj8XUOTbIsDCGAIigyc1Z0r6sQYkGa94mJjEbtpvh2fPM
         fIgBzS703RP7zy5VJzzNTncfpDae0AQrMrv88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520357; x=1789125157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gQNZV3/Wwp2qSBWtwYPdoz/wcPd4hlfIxvJUtY/sSz4=;
        b=EHfvuJQf8e53V9K8LUT7fsKG+C/U7jmpkXeyigoSkCHK4Ebk7LZqVcHznNw33wIPTm
         crtK7c2V8tZ/HYmoGS57low6JKYeBn6ZS0GaG0DePxRfEmzb5568WoB72OWnLCpzRVp2
         +sL2+g8JqAqrbu65sJtAq0cohr86jT+TOcdDlvM+gflnMRuQtKjy28JqE/AFcNgtShii
         sNHyQFztAu2WtQvUbYUqhNNbxnVBUmaSDR1PTyS1x860B5Ynaza5rLMOpr4wqprlTZ83
         zVo3GcB3T3BBbCDmpC4+hpPu8DMW/+Pg7pMZp4HsKrg0HyPt3lk6pgxnPFT7kyzxFem9
         bbCQ==
X-Gm-Message-State: AFuF++ldUJ4WR0mso2CgxdSDuUphUR67OgKCevX3Ag57e4/sKiuYcLpy
	ETNnmL5bSPYaeg6XDA3yU8GBdYo2TLuZ+Dwtd1fBGgkiJjtdrUNxfrN3ywfQqsKOGnatU9wWwT5
	Q4W4Ac2g=
X-Gm-Gg: AYBFou3dXkrp5QYRJWDk6YPbHJ4yMVTod0an82n65yNK0/hf47vXFMfrFqXb4OaOuvD
	JmmyrAVlZLil0lwKszegp7XnnYq/JYGK0CBJUv82L9Qulu24vmz4n+ADMTlotwv/w6Dk0x+Lh6Q
	DYHwHTgwlT9rN825EKtkBfLltlEX9oH3tcTAclRx0QAOuY7+tRUMR/0M3DYiY7heUCHKOxC8n/y
	lEa3sfsMB4nZNNah618flpV+VRHHJZsVcLb+1n33joAhnEVF3kg/hKtDqpFUPdW6cU9t3+dxK/7
	BaT3/n9X0f3sYpwEEc7WyLNYC34t+aUs9ZS3fuZkpQGXmYlrnoCyovGAdrZ7lnt1io4fbNp7fja
	QUWmaYpgAOvsOJXM6T5ScqliF3DTrj4PwMvjOA5/nAaCYd2z2TiaHD2kUbTY+SjxMmF34nQZCCS
	GEP05zfRUGB4b7aKx/4xUc6lWGApTVWjOuu/HjxYtH51R1qUT0dljcoIKw73sxNrDAxhoM1Cq5y
	tj9OQOr96gpaRhIMIMEizF/Tko2VS9yBtQPOu8=
X-Received: by 2002:a05:600c:190b:b0:49c:fc6c:be12 with SMTP id 5b1f17b1804b1-49cfc6cc0acmr22537745e9.24.1788520356605;
        Fri, 04 Sep 2026 04:12:36 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>
Subject: [PATCH v2 4/5] xen/arm: Rewrite arm_smccc_smc() for arm64
Date: Fri,  4 Sep 2026 12:12:27 +0100
Message-Id: <20260904111228.3022634-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260904111228.3022634-1-andrew.cooper3@citrix.com>
References: <20260904111228.3022634-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1788520357-75EFF4E9-7DA99E5D/0/0
X-purgate-type: clean
X-purgate-size: 9681

SMCCC v1.0 says that x4 through x17 may be clobbered.  SMCCC v1.1 says they
are strictly preserved, and SMCCC v1.2 permits them to contain extra return
values.

Xen deals with this by having __arm_smccc_1_0_smc() as an out-of-line
function, but this causes awful code generation in arm_smccc_smc().
cpus_have_const_cap() is opaque to the optimiser, so we end up with one basic
block doing the reasonably-ok arm_smccc_1_1_smc() code generation and a second
basic block setting up all 8 input registers even when they're not needed,
spilling or discarding x8 through x17, and calling an out-of-line function.

Remove __arm_smccc_1_0_smc() entirely, and rewrite arm_smccc_smc() to declare
x4 through x17 as clobbered.

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

v2:
 * s/PSCI/SMCCC/g
 * Rewrite the comment for the new arm_smccc_smc().

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
is more amenable to having SMCCC v1.2 worked into it too.
---
 xen/arch/arm/arm64/smc.S         | 16 ------
 xen/arch/arm/include/asm/smccc.h | 92 ++++++++++++++++----------------
 2 files changed, 45 insertions(+), 63 deletions(-)

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
index 5fe54013ac83..4ed2a40ed0ac 100644
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
@@ -218,53 +219,50 @@ static inline void arm_smccc_guest_smc(struct cpu_user_regs *regs)
 
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
+ * Make an SMC call compatible with both SMCCC v1.1 and v1.0.
+ *
+ * SMCCC v1.0 says that x4 through x17 are clobbered.  SMCCC v1.1 says they
+ * are strictly preserved.  Always mark x4 through x17 as clobbered.
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
+        /* Potentially clobbered in SMCCC v1.0 */               \
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


