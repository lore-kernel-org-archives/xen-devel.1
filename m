Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8C0C61DD6
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 11:12:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408225.1640903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Rqb-0005vw-7z; Fri, 04 Sep 2026 11:12:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408225.1640903; Fri, 04 Sep 2026 11:12:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Rqb-0005vQ-3s; Fri, 04 Sep 2026 11:12:41 +0000
Received: by outflank-mailman (input) for mailman id 1408225;
 Fri, 04 Sep 2026 11:12:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1x2RqZ-0005LI-1p
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 11:12:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2RqY-00DcP9-ET
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 13:12:38 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a9aa79b-2eae-0a2a0a5409dd-0a2a450ce3d8-34
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 13:12:38 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a9aa7a6-f479-0a2a450c0019-d155dd2fc059-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 13:12:38 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-4843efcbdb2so513462f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 04:12:38 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485885be1c1sm5501729f8f.32.2026.09.04.04.12.36
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
        d=citrix.com; s=google; t=1788520358; x=1789125158; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=04LSpSbvGT7DUfjS/h4Xju9eXZbdvvnkNdn9duYaZ48=;
        b=dOsg4CycfVClRRmAg419hlxRUS99DLzE6QWlaPcRQtu+OfkRcE+eIWEqHUwRSRURRS
         vy2i2xFBqWOIal4PPxNX0ev/Z7Hv7b85RIWvHzeH3SEAk3qQ3YH1uU1Pt0jvX4n2c0cG
         eXPXLrFtFmK7byyBFjiT4O2CAvEQLqR12JdPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520358; x=1789125158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=04LSpSbvGT7DUfjS/h4Xju9eXZbdvvnkNdn9duYaZ48=;
        b=VUXQV6coVWA54MinkS37SA0qJg6oYGMdpeMKFz/ObJFTIy2blMTJRtyD4hp1EVSPuG
         +bhlGlJdrGgXcx7HZp+/AdAEYKc6xtVtSz2KC78+G82JB52YXVzDTu4PBJ2ZSA0QiFHU
         2NTLHtfbDpWpUaWxShpsR/hMXaX7bIYepPA6somlCOT5A09hNy0VT/m8NTZ/v7hqZdJ5
         aSM2DOiSX9aobpiBw69P6iMrUQrEUS0scQE/I/20hnCwGGeWrW+x3viF7udPuYoK4mWG
         IIhdtP3I923mE9S3nUgRE/Fd49cNC5PTwjBqtQifa4lgI6glAm7m/JCD3RRHTRuLec1i
         dQ6Q==
X-Gm-Message-State: AFuF++nJsNQBxm+ljsVghaSv1xtKvniHTs8ZIGs1ej50W8CGkreWaK4r
	3GRdFSUB1099/Fr3BGZMZRUGALMKkrZDZfulTKQQc+A/vMdR25novlFqXz6EEPlfFaOsLg18nrN
	at8UBalk=
X-Gm-Gg: AYBFou3K70uU6v8xSCFOmKLhLXpvkSO1EnyOwc08y2dP1CGf5E7BNnR5eBsDN/4JCBr
	soetPMJZ5SeuO1porTq4dVTv3dkAzii2qF5R42HWzfejJu+BBcivIt+VYQzKK5y4CG8WJIBbDVr
	qSlcQVVlrxT5d2aPjfWotyadYoo9MNgtJ9EXzjHW3bPFeAmdjl+SmEkb7HdHElP3jgs4+zCPkXf
	boGjAk8bmcsnfGeOwmZp7yFru/X8MRoRpXiYxI7XNnM4hIZvMJr2mt+nD4+k/S2sZwuJld9swfT
	feGX5YWI0bbDyze1bW/hmxoIZQPaiiubEYe3L7M/9Pyttmcx0DUsJIcnFlniXTxT7wZuelWyxT9
	odbb6PXN1/kccdLIcTdK+Ihrq1dVndAPicJWY1JcZB0RWM+sp7R2/LxJbc60CUgloO1b/5b0yn9
	JpJ6iMClyjbhmMVDPBdunfzYPBJ0NwOU1qnzsG8EjHcBh9c6cG4tlg9WnGF278sDsdui4ySC8Hf
	w9DFeYPXdCbNH+KWsy6X5eykv+i8fK2qjMN1As=
X-Received: by 2002:a05:6000:4610:b0:485:8a47:5b86 with SMTP id ffacd0b85a97d-4858a475c82mr3512586f8f.35.1788520357493;
        Fri, 04 Sep 2026 04:12:37 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>
Subject: [PATCH v2 5/5] xen/arm: Rewrite arm_smccc_*() to return by value
Date: Fri,  4 Sep 2026 12:12:28 +0100
Message-Id: <20260904111228.3022634-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260904111228.3022634-1-andrew.cooper3@citrix.com>
References: <20260904111228.3022634-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1788520358-00ACCA5B-99FB727D/0/0
X-purgate-type: clean
X-purgate-size: 24069

Use statement expressions to return struct arm_smccc_res which makes the code
read a lot more normally, and avoids needing to pass in NULL in order to skip
return information.

More importantly, it removes the local implementation of __count_args() which
is off by two and deeply confusing to try and follow.

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
 * Transform extra call in optee_probe()

Xen compiles identically before and after this change, for both arm32 and arm64.
---
 xen/arch/arm/cpuerrata.c         | 18 +++----
 xen/arch/arm/include/asm/smccc.h | 87 ++++++++++++++------------------
 xen/arch/arm/platforms/exynos5.c |  2 +-
 xen/arch/arm/platforms/seattle.c |  4 +-
 xen/arch/arm/psci.c              | 17 +++----
 xen/arch/arm/tee/optee.c         | 50 +++++++++---------
 xen/arch/arm/traps.c             |  4 +-
 7 files changed, 86 insertions(+), 96 deletions(-)

diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
index 3a32183618dc..35ad98d29d14 100644
--- a/xen/arch/arm/cpuerrata.c
+++ b/xen/arch/arm/cpuerrata.c
@@ -179,8 +179,8 @@ static int enable_smccc_arch_workaround_1(void *data)
     if ( smccc_ver < SMCCC_VERSION(1, 1) )
         goto warn;
 
-    arm_smccc_1_1_smc(ARM_SMCCC_ARCH_FEATURES_FID,
-                      ARM_SMCCC_ARCH_WORKAROUND_1_FID, &res);
+    res = arm_smccc_1_1_smc(ARM_SMCCC_ARCH_FEATURES_FID,
+                            ARM_SMCCC_ARCH_WORKAROUND_1_FID);
     /* The return value is in the lower 32-bits. */
     if ( (int)res.a0 < 0 )
         goto warn;
@@ -256,8 +256,8 @@ static int enable_spectre_bhb_workaround(void *data)
         if ( smccc_ver < SMCCC_VERSION(1, 1) )
             goto warn;
 
-        arm_smccc_1_1_smc(ARM_SMCCC_ARCH_FEATURES_FID,
-                          ARM_SMCCC_ARCH_WORKAROUND_3_FID, &res);
+        res = arm_smccc_1_1_smc(ARM_SMCCC_ARCH_FEATURES_FID,
+                                ARM_SMCCC_ARCH_WORKAROUND_3_FID);
         /* The return value is in the lower 32-bits. */
         if ( (int)res.a0 < 0 )
         {
@@ -398,8 +398,8 @@ static bool has_ssbd_mitigation(const struct arm_cpu_capabilities *entry)
     if ( smccc_ver < SMCCC_VERSION(1, 1) )
         return false;
 
-    arm_smccc_1_1_smc(ARM_SMCCC_ARCH_FEATURES_FID,
-                      ARM_SMCCC_ARCH_WORKAROUND_2_FID, &res);
+    res = arm_smccc_1_1_smc(ARM_SMCCC_ARCH_FEATURES_FID,
+                            ARM_SMCCC_ARCH_WORKAROUND_2_FID);
 
     switch ( (int)res.a0 )
     {
@@ -429,7 +429,7 @@ static bool has_ssbd_mitigation(const struct arm_cpu_capabilities *entry)
     case ARM_SSBD_FORCE_DISABLE:
         printk_once("%s disabled from command-line\n", entry->desc);
 
-        arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 0, NULL);
+        arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 0);
         required = false;
         break;
 
@@ -437,7 +437,7 @@ static bool has_ssbd_mitigation(const struct arm_cpu_capabilities *entry)
         if ( required )
         {
             this_cpu(ssbd_callback_required) = 1;
-            arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 1, NULL);
+            arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 1);
         }
 
         break;
@@ -445,7 +445,7 @@ static bool has_ssbd_mitigation(const struct arm_cpu_capabilities *entry)
     case ARM_SSBD_FORCE_ENABLE:
         printk_once("%s forced from command-line\n", entry->desc);
 
-        arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 1, NULL);
+        arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 1);
         required = true;
         break;
 
diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/smccc.h
index 4ed2a40ed0ac..2d0f2db0b256 100644
--- a/xen/arch/arm/include/asm/smccc.h
+++ b/xen/arch/arm/include/asm/smccc.h
@@ -95,20 +95,14 @@ struct arm_smccc_res {
     unsigned long a3;
 };
 
-/* SMCCC v1.1 implementation madness follows */
-#define ___count_args(_0, _1, _2, _3, _4, _5, _6, _7, _8, x, ...) x
-
-#define __count_args(...)                               \
-    ___count_args(__VA_ARGS__, 7, 6, 5, 4, 3, 2, 1, 0)
-
-#define __constraint_read_0 "r" (arg0)
-#define __constraint_read_1 __constraint_read_0, "r" (arg1)
-#define __constraint_read_2 __constraint_read_1, "r" (arg2)
-#define __constraint_read_3 __constraint_read_2, "r" (arg3)
-#define __constraint_read_4 __constraint_read_3, "r" (arg4)
-#define __constraint_read_5 __constraint_read_4, "r" (arg5)
-#define __constraint_read_6 __constraint_read_5, "r" (arg6)
-#define __constraint_read_7 __constraint_read_6, "r" (arg7)
+#define __constraint_read_1 "r" (arg0)
+#define __constraint_read_2 __constraint_read_1, "r" (arg1)
+#define __constraint_read_3 __constraint_read_2, "r" (arg2)
+#define __constraint_read_4 __constraint_read_3, "r" (arg3)
+#define __constraint_read_5 __constraint_read_4, "r" (arg4)
+#define __constraint_read_6 __constraint_read_5, "r" (arg5)
+#define __constraint_read_7 __constraint_read_6, "r" (arg6)
+#define __constraint_read_8 __constraint_read_7, "r" (arg7)
 
 /*
  * Macro arguments MUST be evaluated before being assigned to a register
@@ -117,44 +111,43 @@ struct arm_smccc_res {
  * This is manual register scheduling for the asm() statement, and any other
  * logic to evaluate may clobber the already-scheduled registers.
  */
-#define __declare_arg_0(a0, res)                        \
+#define __declare_arg_1(a0)                             \
     auto __a0 = (uint32_t)(a0);                         \
-    struct arm_smccc_res    *___res = (res);            \
     register unsigned long  arg0 ASM_REG(0) = __a0
 
-#define __declare_arg_1(a0, a1, res)                    \
+#define __declare_arg_2(a0, a1)                         \
     auto __a1 = (a1);                                   \
-    __declare_arg_0(a0, res);                           \
+    __declare_arg_1(a0);                                \
     register auto           arg1 ASM_REG(1) = __a1
 
-#define __declare_arg_2(a0, a1, a2, res)                \
+#define __declare_arg_3(a0, a1, a2)                     \
     auto __a2 = (a2);                                   \
-    __declare_arg_1(a0, a1, res);                       \
+    __declare_arg_2(a0, a1);                            \
     register auto           arg2 ASM_REG(2) = __a2
 
-#define __declare_arg_3(a0, a1, a2, a3, res)            \
+#define __declare_arg_4(a0, a1, a2, a3)                 \
     auto __a3 = (a3);                                   \
-    __declare_arg_2(a0, a1, a2, res);                   \
+    __declare_arg_3(a0, a1, a2);                        \
     register auto           arg3 ASM_REG(3) = __a3
 
-#define __declare_arg_4(a0, a1, a2, a3, a4, res)        \
+#define __declare_arg_5(a0, a1, a2, a3, a4)             \
     auto __a4 = (a4);                                   \
-    __declare_arg_3(a0, a1, a2, a3, res);               \
+    __declare_arg_4(a0, a1, a2, a3);                    \
     register auto           arg4 ASM_REG(4) = __a4
 
-#define __declare_arg_5(a0, a1, a2, a3, a4, a5, res)    \
+#define __declare_arg_6(a0, a1, a2, a3, a4, a5)         \
     auto __a5 = (a5);                                   \
-    __declare_arg_4(a0, a1, a2, a3, a4, res);           \
+    __declare_arg_5(a0, a1, a2, a3, a4);                \
     register auto           arg5 ASM_REG(5) = __a5
 
-#define __declare_arg_6(a0, a1, a2, a3, a4, a5, a6, res)    \
-    auto __a6 = (a6);                                       \
-    __declare_arg_5(a0, a1, a2, a3, a4, a5, res);           \
+#define __declare_arg_7(a0, a1, a2, a3, a4, a5, a6)     \
+    auto __a6 = (a6);                                   \
+    __declare_arg_6(a0, a1, a2, a3, a4, a5);            \
     register auto           arg6 ASM_REG(6) = __a6
 
-#define __declare_arg_7(a0, a1, a2, a3, a4, a5, a6, a7, res)    \
-    auto __a7 = (a7);                                           \
-    __declare_arg_6(a0, a1, a2, a3, a4, a5, a6, res);           \
+#define __declare_arg_8(a0, a1, a2, a3, a4, a5, a6, a7) \
+    auto __a7 = (a7);                                   \
+    __declare_arg_7(a0, a1, a2, a3, a4, a5, a6);        \
     register auto           arg7 ASM_REG(7) = __a7
 
 #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
@@ -181,21 +174,20 @@ struct arm_smccc_res {
  * makes it stick.
  */
 #define arm_smccc_1_1_smc(...)                                  \
-    do {                                                        \
+    ({                                                          \
         register unsigned long r0 ASM_REG(0);                   \
         register unsigned long r1 ASM_REG(1);                   \
         register unsigned long r2 ASM_REG(2);                   \
         register unsigned long r3 ASM_REG(3);                   \
-        __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
+        __declare_args(count_args(__VA_ARGS__), __VA_ARGS__);   \
         asm volatile (                                          \
             "smc #0"                                            \
             : "=r" (r0), "=r" (r1), "=r" (r2), "=r" (r3)        \
             : PASTE(__constraint_read_,                         \
-                    __count_args(__VA_ARGS__))                  \
+                    count_args(__VA_ARGS__))                    \
             : "memory" );                                       \
-        if ( ___res )                                           \
-            *___res = (struct arm_smccc_res){ r0, r1, r2, r3 }; \
-    } while ( 0 )
+        (struct arm_smccc_res){ r0, r1, r2, r3 };               \
+    })
 
 /*
  * The calling convention for arm32 is the same for both SMCCC v1.0 and
@@ -208,8 +200,8 @@ static inline void arm_smccc_guest_smc(struct cpu_user_regs *regs)
 {
     struct arm_smccc_res res;
 
-    arm_smccc_1_1_smc(regs->r0, regs->r1, regs->r2, regs->r3,
-                      regs->r4, regs->r5, regs->r6, regs->r7, &res);
+    res = arm_smccc_1_1_smc(regs->r0, regs->r1, regs->r2, regs->r3,
+                            regs->r4, regs->r5, regs->r6, regs->r7);
 
     regs->r0 = res.a0;
     regs->r1 = res.a1;
@@ -226,7 +218,7 @@ static inline void arm_smccc_guest_smc(struct cpu_user_regs *regs)
  * are strictly preserved.  Always mark x4 through x17 as clobbered.
  */
 #define arm_smccc_smc(...)                                      \
-    do {                                                        \
+    ({                                                          \
         register unsigned long r0  ASM_REG(0);                  \
         register unsigned long r1  ASM_REG(1);                  \
         register unsigned long r2  ASM_REG(2);                  \
@@ -246,7 +238,7 @@ static inline void arm_smccc_guest_smc(struct cpu_user_regs *regs)
         register unsigned long c15 ASM_REG(15);                 \
         register unsigned long c16 ASM_REG(16);                 \
         register unsigned long c17 ASM_REG(17);                 \
-        __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
+        __declare_args(count_args(__VA_ARGS__), __VA_ARGS__);   \
         asm volatile (                                          \
             "smc #0"                                            \
             : "=r" (r0),  "=r" (r1),  "=r" (r2),  "=r" (r3),    \
@@ -255,11 +247,10 @@ static inline void arm_smccc_guest_smc(struct cpu_user_regs *regs)
               "=r" (c12), "=r" (c13), "=r" (c14), "=r" (c15),   \
               "=r" (c16), "=r" (c17)                            \
             : PASTE(__constraint_read_,                         \
-                    __count_args(__VA_ARGS__))                  \
+                    count_args(__VA_ARGS__))                    \
             : "memory" );                                       \
-        if ( ___res )                                           \
-            *___res = (struct arm_smccc_res){ r0, r1, r2, r3 }; \
-    } while ( 0 )
+        (struct arm_smccc_res){ r0, r1, r2, r3 };               \
+    })
 
 #define arm_smccc_1_1_smc(...) arm_smccc_smc(__VA_ARGS__)
 
@@ -268,8 +259,8 @@ static inline void arm_smccc_guest_smc(struct cpu_user_regs *regs)
 {
     struct arm_smccc_res res;
 
-    arm_smccc_1_1_smc(regs->x0, regs->x1, regs->x2, regs->x3,
-                      regs->x4, regs->x5, regs->x6, regs->x7, &res);
+    res = arm_smccc_1_1_smc(regs->x0, regs->x1, regs->x2, regs->x3,
+                            regs->x4, regs->x5, regs->x6, regs->x7);
 
     regs->x0 = res.a0;
     regs->x1 = res.a1;
diff --git a/xen/arch/arm/platforms/exynos5.c b/xen/arch/arm/platforms/exynos5.c
index f7c09520675e..f08d50c1fe38 100644
--- a/xen/arch/arm/platforms/exynos5.c
+++ b/xen/arch/arm/platforms/exynos5.c
@@ -249,7 +249,7 @@ static int exynos5_cpu_up(int cpu)
     iounmap(power);
 
     if ( secure_firmware )
-        arm_smccc_smc(SMC_CMD_CPU1BOOT, cpu, NULL);
+        arm_smccc_smc(SMC_CMD_CPU1BOOT, cpu);
 
     return cpu_up_send_sgi(cpu);
 }
diff --git a/xen/arch/arm/platforms/seattle.c b/xen/arch/arm/platforms/seattle.c
index 64cc1868c24b..dfa5cf4265c0 100644
--- a/xen/arch/arm/platforms/seattle.c
+++ b/xen/arch/arm/platforms/seattle.c
@@ -33,12 +33,12 @@ static const char * const seattle_dt_compat[] __initconst =
  */
 static void seattle_system_reset(void)
 {
-    arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_RESET, NULL);
+    arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_RESET);
 }
 
 static void seattle_system_off(void)
 {
-    arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_OFF, NULL);
+    arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_OFF);
 }
 
 PLATFORM_START(seattle, "SEATTLE")
diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
index b6860a776031..634d0d7467cf 100644
--- a/xen/arch/arm/psci.c
+++ b/xen/arch/arm/psci.c
@@ -41,8 +41,8 @@ int call_psci_cpu_on(int cpu)
 {
     struct arm_smccc_res res;
 
-    arm_smccc_smc(psci_cpu_on_nr, cpu_logical_map(cpu), __pa(init_secondary),
-                  &res);
+    res = arm_smccc_smc(psci_cpu_on_nr, cpu_logical_map(cpu),
+                        __pa(init_secondary));
 
     return PSCI_RET(res);
 }
@@ -54,7 +54,7 @@ void call_psci_cpu_off(void)
         struct arm_smccc_res res;
 
         /* If successfull the PSCI cpu_off call doesn't return */
-        arm_smccc_smc(PSCI_0_2_FN32_CPU_OFF, &res);
+        res = arm_smccc_smc(PSCI_0_2_FN32_CPU_OFF);
         panic("PSCI cpu off failed for CPU%d err=%d\n", smp_processor_id(),
               PSCI_RET(res));
     }
@@ -63,13 +63,13 @@ void call_psci_cpu_off(void)
 void call_psci_system_off(void)
 {
     if ( psci_ver > PSCI_VERSION(0, 1) )
-        arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_OFF, NULL);
+        arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_OFF);
 }
 
 void call_psci_system_reset(void)
 {
     if ( psci_ver > PSCI_VERSION(0, 1) )
-        arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_RESET, NULL);
+        arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_RESET);
 }
 
 static int __init psci_features(uint32_t psci_func_id)
@@ -79,7 +79,7 @@ static int __init psci_features(uint32_t psci_func_id)
     if ( psci_ver < PSCI_VERSION(1, 0) )
         return PSCI_NOT_SUPPORTED;
 
-    arm_smccc_smc(PSCI_1_0_FN32_PSCI_FEATURES, psci_func_id, &res);
+    res = arm_smccc_smc(PSCI_1_0_FN32_PSCI_FEATURES, psci_func_id);
 
     return PSCI_RET(res);
 }
@@ -116,9 +116,8 @@ static void __init psci_init_smccc(void)
 
     if ( psci_features(ARM_SMCCC_VERSION_FID) != PSCI_NOT_SUPPORTED )
     {
-        struct arm_smccc_res res;
+        struct arm_smccc_res res = arm_smccc_smc(ARM_SMCCC_VERSION_FID);
 
-        arm_smccc_smc(ARM_SMCCC_VERSION_FID, &res);
         if ( PSCI_RET(res) != ARM_SMCCC_NOT_SUPPORTED )
             smccc_ver = PSCI_RET(res);
     }
@@ -191,7 +190,7 @@ static int __init psci_init_0_2(void)
         }
     }
 
-    arm_smccc_smc(PSCI_0_2_FN32_PSCI_VERSION, &res);
+    res = arm_smccc_smc(PSCI_0_2_FN32_PSCI_VERSION);
     psci_ver = PSCI_RET(res);
 
     /* For the moment, we only support PSCI 0.2 and PSCI 1.x */
diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
index 3d2633237074..5e94daee0686 100644
--- a/xen/arch/arm/tee/optee.c
+++ b/xen/arch/arm/tee/optee.c
@@ -178,7 +178,7 @@ static bool optee_probe(void)
         return false;
 
     /* Check UID */
-    arm_smccc_smc(ARM_SMCCC_CALL_UID_FID(TRUSTED_OS_END), &resp);
+    resp = arm_smccc_smc(ARM_SMCCC_CALL_UID_FID(TRUSTED_OS_END));
 
     if ( (uint32_t)resp.a0 != OPTEE_MSG_UID_0 ||
          (uint32_t)resp.a1 != OPTEE_MSG_UID_1 ||
@@ -187,7 +187,7 @@ static bool optee_probe(void)
         return false;
 
     /* Read number of threads */
-    arm_smccc_smc(OPTEE_SMC_GET_THREAD_COUNT, &resp);
+    resp = arm_smccc_smc(OPTEE_SMC_GET_THREAD_COUNT);
     if ( resp.a0 == OPTEE_SMC_RETURN_OK )
     {
         max_optee_threads = resp.a1;
@@ -209,7 +209,7 @@ static bool optee_probe(void)
      * call. It will return OPTEE_SMC_RETURN_UNKNOWN_FUNCTION if
      * OP-TEE have no virtualization support enabled.
      */
-    arm_smccc_smc(OPTEE_SMC_VM_DESTROYED, 0, 0, 0, 0, 0, 0, 0, &resp);
+    resp = arm_smccc_smc(OPTEE_SMC_VM_DESTROYED, 0, 0, 0, 0, 0, 0, 0);
     if ( resp.a0 == OPTEE_SMC_RETURN_UNKNOWN_FUNCTION )
         return false;
 
@@ -243,8 +243,8 @@ static int optee_domain_init(struct domain *d)
      *
      * a7 should be 0, so we can't skip last 6 parameters of arm_smccc_smc()
      */
-    arm_smccc_smc(OPTEE_SMC_VM_CREATED, OPTEE_CLIENT_ID(d), 0, 0, 0, 0, 0, 0,
-                  &resp);
+    resp = arm_smccc_smc(OPTEE_SMC_VM_CREATED, OPTEE_CLIENT_ID(d),
+                         0, 0, 0, 0, 0, 0);
     if ( resp.a0 != OPTEE_SMC_RETURN_OK )
     {
         printk(XENLOG_WARNING "%pd: Unable to create OPTEE client: rc = 0x%X\n",
@@ -681,8 +681,8 @@ static int optee_relinquish_resources(struct domain *d)
      *
      * a7 should be 0, so we can't skip last 6 parameters of arm_smccc_smc()
      */
-    arm_smccc_smc(OPTEE_SMC_VM_DESTROYED, OPTEE_CLIENT_ID(d), 0, 0, 0, 0, 0, 0,
-                  &resp);
+    resp = arm_smccc_smc(OPTEE_SMC_VM_DESTROYED, OPTEE_CLIENT_ID(d),
+                         0, 0, 0, 0, 0, 0);
 
     ASSERT(!spin_is_locked(&ctx->lock));
     ASSERT(!atomic_read(&ctx->call_count));
@@ -1171,15 +1171,15 @@ static void do_call_with_arg(struct optee_domain *ctx,
 {
     struct arm_smccc_res res;
 
-    arm_smccc_smc(a0, a1, a2, a3, a4, a5, 0, OPTEE_CLIENT_ID(current->domain),
-                  &res);
+    res = arm_smccc_smc(a0, a1, a2, a3, a4, a5, 0,
+                        OPTEE_CLIENT_ID(current->domain));
 
     if ( OPTEE_SMC_RETURN_IS_RPC(res.a0) )
     {
         while ( handle_rpc_return(ctx, &res, regs, call)  == -ERESTART )
         {
-            arm_smccc_smc(res.a0, res.a1, res.a2, res.a3, 0, 0, 0,
-                          OPTEE_CLIENT_ID(current->domain), &res);
+            res = arm_smccc_smc(res.a0, res.a1, res.a2, res.a3, 0, 0, 0,
+                                OPTEE_CLIENT_ID(current->domain));
 
             if ( !OPTEE_SMC_RETURN_IS_RPC(res.a0) )
                 break;
@@ -1619,8 +1619,8 @@ static void handle_exchange_capabilities(struct cpu_user_regs *regs)
     caps = get_user_reg(regs, 1);
     caps &= OPTEE_KNOWN_NSEC_CAPS;
 
-    arm_smccc_smc(OPTEE_SMC_EXCHANGE_CAPABILITIES, caps, 0, 0, 0, 0, 0,
-                  OPTEE_CLIENT_ID(current->domain), &resp);
+    resp = arm_smccc_smc(OPTEE_SMC_EXCHANGE_CAPABILITIES, caps, 0, 0, 0, 0, 0,
+                         OPTEE_CLIENT_ID(current->domain));
     if ( resp.a0 != OPTEE_SMC_RETURN_OK ) {
         set_user_reg(regs, 0, resp.a0);
         return;
@@ -1664,8 +1664,8 @@ static bool optee_handle_call(struct cpu_user_regs *regs)
         return true;
 
     case OPTEE_SMC_CALLS_UID:
-        arm_smccc_smc(OPTEE_SMC_CALLS_UID, 0, 0, 0, 0, 0, 0,
-                      OPTEE_CLIENT_ID(current->domain), &resp);
+        resp = arm_smccc_smc(OPTEE_SMC_CALLS_UID, 0, 0, 0, 0, 0, 0,
+                             OPTEE_CLIENT_ID(current->domain));
         set_user_reg(regs, 0, resp.a0);
         set_user_reg(regs, 1, resp.a1);
         set_user_reg(regs, 2, resp.a2);
@@ -1673,15 +1673,15 @@ static bool optee_handle_call(struct cpu_user_regs *regs)
         return true;
 
     case OPTEE_SMC_CALLS_REVISION:
-        arm_smccc_smc(OPTEE_SMC_CALLS_REVISION, 0, 0, 0, 0, 0, 0,
-                      OPTEE_CLIENT_ID(current->domain), &resp);
+        resp = arm_smccc_smc(OPTEE_SMC_CALLS_REVISION, 0, 0, 0, 0, 0, 0,
+                             OPTEE_CLIENT_ID(current->domain));
         set_user_reg(regs, 0, resp.a0);
         set_user_reg(regs, 1, resp.a1);
         return true;
 
     case OPTEE_SMC_CALL_GET_OS_UUID:
-        arm_smccc_smc(OPTEE_SMC_CALL_GET_OS_UUID, 0, 0, 0, 0, 0, 0,
-                      OPTEE_CLIENT_ID(current->domain),&resp);
+        resp = arm_smccc_smc(OPTEE_SMC_CALL_GET_OS_UUID, 0, 0, 0, 0, 0, 0,
+                             OPTEE_CLIENT_ID(current->domain));
         set_user_reg(regs, 0, resp.a0);
         set_user_reg(regs, 1, resp.a1);
         set_user_reg(regs, 2, resp.a2);
@@ -1689,21 +1689,21 @@ static bool optee_handle_call(struct cpu_user_regs *regs)
         return true;
 
     case OPTEE_SMC_CALL_GET_OS_REVISION:
-        arm_smccc_smc(OPTEE_SMC_CALL_GET_OS_REVISION, 0, 0, 0, 0, 0, 0,
-                      OPTEE_CLIENT_ID(current->domain), &resp);
+        resp = arm_smccc_smc(OPTEE_SMC_CALL_GET_OS_REVISION, 0, 0, 0, 0, 0, 0,
+                             OPTEE_CLIENT_ID(current->domain));
         set_user_reg(regs, 0, resp.a0);
         set_user_reg(regs, 1, resp.a1);
         return true;
 
     case OPTEE_SMC_ENABLE_SHM_CACHE:
-        arm_smccc_smc(OPTEE_SMC_ENABLE_SHM_CACHE, 0, 0, 0, 0, 0, 0,
-                      OPTEE_CLIENT_ID(current->domain), &resp);
+        resp = arm_smccc_smc(OPTEE_SMC_ENABLE_SHM_CACHE, 0, 0, 0, 0, 0, 0,
+                             OPTEE_CLIENT_ID(current->domain));
         set_user_reg(regs, 0, resp.a0);
         return true;
 
     case OPTEE_SMC_DISABLE_SHM_CACHE:
-        arm_smccc_smc(OPTEE_SMC_DISABLE_SHM_CACHE, 0, 0, 0, 0, 0, 0,
-                      OPTEE_CLIENT_ID(current->domain), &resp);
+        resp = arm_smccc_smc(OPTEE_SMC_DISABLE_SHM_CACHE, 0, 0, 0, 0, 0, 0,
+                             OPTEE_CLIENT_ID(current->domain));
         set_user_reg(regs, 0, resp.a0);
         if ( resp.a0 == OPTEE_SMC_RETURN_OK ) {
             free_shm_rpc(ctx,  regpair_to_uint64(resp.a1, resp.a2));
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 625d229396bb..6a5dcef2aa87 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1991,7 +1991,7 @@ void asmlinkage enter_hypervisor_from_guest_preirq(void)
 
     /* If the guest has disabled the workaround, bring it back on. */
     if ( needs_ssbd_flip(v) )
-        arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 1, NULL);
+        arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 1);
 }
 
 /*
@@ -2334,7 +2334,7 @@ void asmlinkage leave_hypervisor_to_guest(void)
      * If the guest wants it disabled, so be it...
      */
     if ( needs_ssbd_flip(current) )
-        arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 0, NULL);
+        arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 0);
 }
 
 /*
-- 
2.39.5


