Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0B9C624A4
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2026 12:20:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1403958.1637906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x10zW-0007RX-6d; Mon, 31 Aug 2026 12:19:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1403958.1637906; Mon, 31 Aug 2026 12:19:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x10zW-0007RO-2n; Mon, 31 Aug 2026 12:19:58 +0000
Received: by outflank-mailman (input) for mailman id 1403958;
 Mon, 31 Aug 2026 12:19:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1x10zU-000777-K5
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 12:19:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x10zT-000RzD-NZ
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 14:19:55 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a95715e-2eae-0a2a0a5409dd-0a2a4508e5ea-28
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 14:19:55 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a95716b-f659-0a2a45080019-d155dd35d850-3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 14:19:55 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-484392e3d33so700947f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 05:19:55 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48440e094d0sm847709f8f.23.2026.08.31.05.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2026 05:19:54 -0700 (PDT)
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
        d=citrix.com; s=google; t=1788178795; x=1788783595; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=keXqSb8JkKc0s5NgPnbFMK+OAKHx91OAcyhTg8jXG0o=;
        b=jC84KEjSs5cKROcpyGtPky3HO4v966WbzNtAdamqFDwpu273B2J91Mg2+DhUbibO2C
         SSIa8gHXZvJf2a5CwGGR4KgWWXgJkqimx1i4CYcht5PtFGJsfxgGk8G1H81H9XUTa3FY
         GD0QW42shM4PAbOL0CEEuSNak4+Ba/c4kSd7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788178795; x=1788783595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=keXqSb8JkKc0s5NgPnbFMK+OAKHx91OAcyhTg8jXG0o=;
        b=k3sK0kySVMOEB9I+rIE/uD+h9d4sII53XZEWry6Xzh2ciSY8DowrgKU3i5UANWPEfj
         Ax7z5Lz88wNq84drtxeIrD+poY5+4CZBf9UbWQlcNsJK3HJ3vXQuI8yd35InIBYoYGXI
         RXbShFef86PMzxPcBaBfpZ21AwAmt/g1i6Eq/XXut1a5YWs8uhbpB/OhLj+SYWZt5pVp
         yulf2/xfK3YNjaHmal7c7cluEDqGByjqAQsNG48AD9pf9vY08NNFp+xU3y3CRNOBuEdP
         rGM9H+O3ahQycWDvu32Qsj6C2Hh97mTiKykO9xLcS3XJeA9cz4/a4Nw+GgEd66kdfAdW
         8Xpw==
X-Gm-Message-State: AFuF++kHIa+RwXd97EhWoTnVb2C9F/MWg1bJ/yLzKhWQLii3Pq3tHsQt
	58S6OkFJNsd5fDgJbJWHC9/67vz3kvbFKZe8qUXWPGMWJrz8SYHEQYfVQZcBP+E34Mi4KHVbEZr
	XYm3fZVA=
X-Gm-Gg: AYBFou0GhnlNTNLpwDYF25v7c3KM5/gPrNkpAIuBe8gojNsp624iL4l010Kr+9Lk8cP
	lNSX/RkVFyirH2bMKWSHbjCQcI4C+T3N6elkZObXPXpWAjwLO7fJCS/bSr4qZuDFX000jgW9lf4
	93daHdtIe3FFbVeybojB2kGEzTl1ytIUx+oBKFK0bsG5ag0S/Oz87EWO4QK6d6/ZL33aXI10FqT
	ctq/IEaj8C8cIqlD8S81xq0e5cw4v+YUfHSJPmeF3/jXUWlpzN2hJpZYmkL1u9FzQUrnuXyTv4q
	ia5eIV7O/DtoJssRWPBJypDMOr2ZtCeFZGCc0VChRBkDIfUeQaJKZeIrNsigUcsRbxfW9Y2hgpE
	JYLYc2WO+PvBRhars6dlG7Xw/uDuuOJA5PBGVS4Zk43TlIf8WsVYG3atCBwoF/xS64HRJ4fVpwD
	RH8hmRsUfStxRE6YSTXl8mNjmFpTjTwrNljNzBYUflFuOIi4LaaqjzbT/sGiVY/kWm9lUu34Dyi
	QvhSEJliwcpOqbqi70SRCmq142Y2SCJU3IzXjM=
X-Received: by 2002:a05:6000:38f:b0:484:3317:a17 with SMTP id ffacd0b85a97d-48433170b89mr27778382f8f.24.1788178794558;
        Mon, 31 Aug 2026 05:19:54 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>
Subject: [PATCH 3/6] xen/arm: Clean up 32bit arm_smccc_1_1_smc()
Date: Mon, 31 Aug 2026 13:19:42 +0100
Message-Id: <20260831121944.2908139-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260831121944.2908139-1-andrew.cooper3@citrix.com>
References: <20260831121944.2908139-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1788178795-D5F4787B-8DF8300B/0/0
X-purgate-type: clean
X-purgate-size: 5449

... before making a related copy of it.

 * Drop __constraints() so the output parameters are visible in the same block
   as they're defined.  Use PASTE() rather than opencoding it.
 * Adust the indentation of trailing \'s for consistency.
 * Drop the newline at the end of the instruction.
 * Indent the if condition correctly.  ___res is always of type
   arm_smccc_res (declared in __declare_arg_0()), so drop the typeof().
 * Drop arm_smccc_1_0_smc() as it has no users.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>
---
 xen/arch/arm/include/asm/smccc.h | 45 ++++++++++++++++----------------
 1 file changed, 22 insertions(+), 23 deletions(-)

diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/smccc.h
index 832157f43734..5fe54013ac83 100644
--- a/xen/arch/arm/include/asm/smccc.h
+++ b/xen/arch/arm/include/asm/smccc.h
@@ -56,6 +56,8 @@
 
 #ifndef __ASSEMBLER__
 
+#include <xen/macros.h>
+
 extern uint32_t smccc_ver;
 
 /* Check if this is fast call. */
@@ -115,24 +117,24 @@ struct arm_smccc_res {
  * This is manual register scheduling for the asm() statement, and any other
  * logic to evaluate may clobber the already-scheduled registers.
  */
-#define __declare_arg_0(a0, res)                            \
-    auto __a0 = (uint32_t)(a0);                             \
-    struct arm_smccc_res    *___res = (res);                \
+#define __declare_arg_0(a0, res)                        \
+    auto __a0 = (uint32_t)(a0);                         \
+    struct arm_smccc_res    *___res = (res);            \
     register unsigned long  arg0 ASM_REG(0) = __a0
 
-#define __declare_arg_1(a0, a1, res)                        \
-    auto __a1 = (a1);                                       \
-    __declare_arg_0(a0, res);                               \
+#define __declare_arg_1(a0, a1, res)                    \
+    auto __a1 = (a1);                                   \
+    __declare_arg_0(a0, res);                           \
     register auto           arg1 ASM_REG(1) = __a1
 
-#define __declare_arg_2(a0, a1, a2, res)                    \
-    auto __a2 = (a2);                                       \
-    __declare_arg_1(a0, a1, res);                           \
+#define __declare_arg_2(a0, a1, a2, res)                \
+    auto __a2 = (a2);                                   \
+    __declare_arg_1(a0, a1, res);                       \
     register auto           arg2 ASM_REG(2) = __a2
 
-#define __declare_arg_3(a0, a1, a2, a3, res)                \
-    auto __a3 = (a3);                                       \
-    __declare_arg_2(a0, a1, a2, res);                       \
+#define __declare_arg_3(a0, a1, a2, a3, res)            \
+    auto __a3 = (a3);                                   \
+    __declare_arg_2(a0, a1, a2, res);                   \
     register auto           arg3 ASM_REG(3) = __a3
 
 #define __declare_arg_4(a0, a1, a2, a3, a4, res)        \
@@ -158,12 +160,6 @@ struct arm_smccc_res {
 #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
 #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
 
-#define ___constraints(count)                       \
-    : "=r" (r0), "=r" (r1), "=r" (r2), "=r" (r3)     \
-    : __constraint_read_ ## count                   \
-    : "memory"
-#define __constraints(count)    ___constraints(count)
-
 /*
  * arm_smccc_1_1_smc() - make an SMCCC v1.1 compliant SMC call
  *
@@ -189,10 +185,14 @@ struct arm_smccc_res {
         register unsigned long r2 ASM_REG(2);                   \
         register unsigned long r3 ASM_REG(3);                   \
         __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
-        asm volatile("smc #0\n"                                 \
-                     __constraints(__count_args(__VA_ARGS__))); \
+        asm volatile (                                          \
+            "smc #0"                                            \
+            : "=r" (r0), "=r" (r1), "=r" (r2), "=r" (r3)        \
+            : PASTE(__constraint_read_,                         \
+                    __count_args(__VA_ARGS__))                  \
+            : "memory" );                                       \
         if ( ___res )                                           \
-        *___res = (typeof(*___res)){r0, r1, r2, r3};            \
+            *___res = (struct arm_smccc_res){ r0, r1, r2, r3 }; \
     } while ( 0 )
 
 /*
@@ -200,7 +200,6 @@ struct arm_smccc_res {
  * v1.1.
  */
 #ifdef CONFIG_ARM_32
-#define arm_smccc_1_0_smc(...) arm_smccc_1_1_smc(__VA_ARGS__)
 #define arm_smccc_smc(...) arm_smccc_1_1_smc(__VA_ARGS__)
 
 /* Make an SMCCC v1.1 compliant SMC call with guest register state. */
@@ -217,7 +216,7 @@ static inline void arm_smccc_guest_smc(struct cpu_user_regs *regs)
     regs->r3 = res.a3;
 }
 
-#else
+#else /* CONFIG_ARM_64 */
 
 void __arm_smccc_1_0_smc(register_t a0, register_t a1, register_t a2,
                          register_t a3, register_t a4, register_t a5,
-- 
2.39.5


