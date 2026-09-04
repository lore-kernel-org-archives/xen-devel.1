Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5A0C61DD6
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 11:12:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408223.1640874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2RqY-0005A0-FI; Fri, 04 Sep 2026 11:12:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408223.1640874; Fri, 04 Sep 2026 11:12:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2RqY-00058B-Bj; Fri, 04 Sep 2026 11:12:38 +0000
Received: by outflank-mailman (input) for mailman id 1408223;
 Fri, 04 Sep 2026 11:12:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1x2RqX-0004wG-7x
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 11:12:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2RqW-00DcPh-L8
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 13:12:36 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a9aa79f-e002-0a2a0a5209dd-0a2a450292f6-26
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 13:12:36 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a9aa7a4-6ca4-0a2a45020019-d155dd36b945-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 13:12:36 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-484362f5c4aso1049816f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 04:12:36 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485885be1c1sm5501729f8f.32.2026.09.04.04.12.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 04:12:34 -0700 (PDT)
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
        d=citrix.com; s=google; t=1788520356; x=1789125156; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OKNHZdlEt0x1ge8w8zMMA0euhweC/5SXf88v2qkE/1s=;
        b=FFvZSbAx+ad8M+G4vQ+lQ0ZJW1yKISbGM+51Axr8M4q1mIdiSYlT3ftg/Un51Lim60
         UPWekGrSrNBXCQ6bnSgt9e2vRb9REwAZ+FwUpMPpNXMWkycVNGOOT292hm4aUsxNvUwl
         NuzQzFXemW5F36TdHp9YK48he1PqlyfiBOruw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520356; x=1789125156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OKNHZdlEt0x1ge8w8zMMA0euhweC/5SXf88v2qkE/1s=;
        b=FkOujCbm9xuSyRekJMr3+ZEW9GFhd6zcRmPH2CK3mW9WOyrJyqb1Q8jzxuTV3c9gWO
         GfhRAj9HjabgE4TRpkU8ok/Ho7lOGTXzZtJzwjHZ0P5ckh2kQKhJU+0Z2WN1NPLgXz4R
         xAbdqQWGc/e8wqRbdS1uCK8LQxoKAg/eL86I7h2HNllO/6d3g6G/lAIDB+2b+RdeEyBB
         T1L/ddskY0LwZDGIn2Bfa3R8CcnS77V56JA9BUzZAd+oTP2r4jc0+ZyUmUp8n+XnoxF/
         d42An+44OTpGuuEUscL2nAEvsCUOeE0QY0fiiNOvK6ogQue9vErJtkMVhF6h+jV4nXlp
         yjfw==
X-Gm-Message-State: AFuF++nilzSre5ZcGoo89hiwCYseP4s7K5Hdc/9IPhmY0cenJHYanqWX
	Y6H3IlqFiyjkazgPIe4GBOutlOfXOgILTbWbJt3H5s1rniW27scZ8oNWFiTUHO0IPgQ7bAKkeOW
	DOjwkYKI=
X-Gm-Gg: AYBFou1ywGctguzqn+d5XnpqbaW8EhaBRvG1N0VFLBy7cbFkjaXW6K4WSC/O7UoVxPY
	sptoxiNLyTfMXYZItf1qqfo1POClfw3KM8gM//j5d68ua1KR/9VS10YQRCp66C6gyqpfEqh8lxd
	lVryzaep86ZihAbPRI1fULqoxxncXqCWRQnaktvsQFozYJA/R25x+fNSR89/lk2vWBhgKyiy8Jh
	e87J8xhLxrmYJO0F6qBlvLgK/Prx4ectadBlOmdUaq71NeXT6wRhCJmynJmgfU/8jzNhucdIcrX
	6G+649mlJyJeuxwRxWUtNmWrq6M5I3jKTn8cWPDR+mP5RkP0hOLlqfSsKBw9k2kGhlQTilNwFG8
	nej9Jl5gdfyEWKi3ZHxkrntvJvvrv/GhOBUetfdDmTSbFziLb9lD5/OvOLn1zhcNeE10LSF5+7y
	mXeOc9klfiCRRpkvowJv6v0sR7t0u0oVeKEuQc87L41NS3eyIPEQBioJgmmUm3hkGFL9b01++0v
	nBWylhUqT1BSORyKwZmWOvZMVila0VK9qP+R6c=
X-Received: by 2002:a05:6000:4796:b0:484:3312:f127 with SMTP id ffacd0b85a97d-4858709b371mr8520454f8f.27.1788520355821;
        Fri, 04 Sep 2026 04:12:35 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>
Subject: [PATCH v2 3/5] xen/arm: Clean up 32bit arm_smccc_1_1_smc()
Date: Fri,  4 Sep 2026 12:12:26 +0100
Message-Id: <20260904111228.3022634-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260904111228.3022634-1-andrew.cooper3@citrix.com>
References: <20260904111228.3022634-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1788520356-F30B02AC-56B4610A/0/0
X-purgate-type: clean
X-purgate-size: 5507

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
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
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


