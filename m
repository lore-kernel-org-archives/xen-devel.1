Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032C9C61DE2
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2026 12:20:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1403957.1637898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x10zV-0007DZ-0Q; Mon, 31 Aug 2026 12:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1403957.1637898; Mon, 31 Aug 2026 12:19:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x10zU-0007DR-Rr; Mon, 31 Aug 2026 12:19:56 +0000
Received: by outflank-mailman (input) for mailman id 1403957;
 Mon, 31 Aug 2026 12:19:55 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1x10zT-00070O-Gl
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 12:19:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x10zS-004lvp-Tm
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 14:19:54 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a957163-e002-0a2a0a5209dd-0a2a4509a31c-20
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 14:19:54 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a95716a-be1a-0a2a45090019-d1558030b01d-3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 14:19:54 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-49b0dbfbf7bso24301855e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 05:19:54 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48440e094d0sm847709f8f.23.2026.08.31.05.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2026 05:19:53 -0700 (PDT)
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
        d=citrix.com; s=google; t=1788178794; x=1788783594; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MVv38LcWR6swmevPdVRrJrsniqIiQEzhS6N0zpQmzY8=;
        b=dIHg9EM3i3uShTC9Y48KQmQXv8PiVCrVPxu0q0OGpuYFAUIfgXFx5c2BZg6f+jDFvK
         Z3FIGYRzlUTjziWRQQ+GPJpIl4wodz34DJsvl0HQhUwmd+uS9ERM/+6Am+qYtRyGo6EK
         NdGPxGa+J093ujxy0r22ygy/Rq3U8QzPJdkmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788178794; x=1788783594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MVv38LcWR6swmevPdVRrJrsniqIiQEzhS6N0zpQmzY8=;
        b=gb1UanIix2qrIfesedjJbNHIJ3xVzrAGhXFiC1CWGcqeCf7QOWewIzUDYRuycGBVyS
         JwFCVsNt70FpA6U3DkzfdUmeCPCsFDNUB/L6l48jrrj1ND0O5TcAMycK4q3Ik6raTcsz
         E2pT4BB1JwchU4HAg9CqpFWQmw8QKQDZI0D+KHiw/lGl6cyHBlPCRF9uzUL0tPl+tTTe
         4zvxgEuj2qcUgoFmjB/aCKNJ5znjdAdZx5Gnew1caQcK1+46jzBuQrNUIHivr92D741l
         cHVyPBECrVXrUTWQaCL+vg+8g1SooLRGZKLTVgCgNQj6/0tzgumJodRWkyTAd/XhD8US
         +c9Q==
X-Gm-Message-State: AFuF++nS27tyAykEhzOZnptHIFxycdYkJmlfmud9CGR+iEWLlUQU22Sl
	CURlXWUSxYqWBWQY4qhN5rsAOMXzfK6KwPrbXFNzTmjJAzFcNuQK8Xkf5QAwhiWmcXrqAP2HUC+
	t62x7umw=
X-Gm-Gg: AR+sD13cuDfw7j6LZKp5+N4FPqHhpHnDyY+vcnZwS/47KYopynglYqposoBltOCkZEv
	QG6hOfP35FjV0RMcy9jw6b2As1YGlwII8EYWigT9g1whGAoMnHGrJzJCP10K+vHRv3bBnGn+tbt
	eJXoOJcEVEFFm2dNMvS3Y3jTlO53PEgAQGE98V6lpGAo4TkPccJVxyJR+uYZjTYwFp16rAqHcgG
	L81HKmnzo1yWr7nMRk4eeWoLhzT8x2EaZVkIELR+xb59rSRm/JwI4eFQiyZFR3Rgx5+6yTmxdK/
	BNIuqqXf1sAvotbz2Y116J4++vGFx2klP7+9Vc5x9DAH+XLwN/T+M4xnSciqIuEBnFqzPDDHZug
	O5eqAztSRtsEblw69hKCPDM0qbhu8gKsHoMLNN/eQlQYZh349AclvdqlmyhA5I/uTWZlgy9O+vc
	fTA/3vKhuSKhHrBI32ggK1xmXIfOxczZxcCtI/mVpDcQIKjyP3cIcnHdb8Qt2lp14nrkrdT1biV
	aPgQxwlZxi7uo1bx2gsUyP71uy3QtntYOXm5uw=
X-Received: by 2002:a05:600c:3492:b0:49b:909e:922e with SMTP id 5b1f17b1804b1-49cdc4523d5mr2030625e9.10.1788178793786;
        Mon, 31 Aug 2026 05:19:53 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>
Subject: [PATCH 2/6] xen/arm: Introduce arm_smccc_guest_smc()
Date: Mon, 31 Aug 2026 13:19:41 +0100
Message-Id: <20260831121944.2908139-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260831121944.2908139-1-andrew.cooper3@citrix.com>
References: <20260831121944.2908139-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1788178794-FCC15034-9B0C6FF7/0/0
X-purgate-type: clean
X-purgate-size: 8290

Both {get,set}_user_reg() are out-of-line functions, leading to awful code
generation.

Introduce arm_smccc_guest_smc() to operate directly on guest registers.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>

For arm64:

  add/remove: 0/0 grow/shrink: 2/4 up/down: 27/-864 (-837)
  Function                                     old     new   delta
  symbols_addresses                          35096   35120     +24
  symbols_names                              42958   42961      +3
  imx8qm_smc                                   544     348    -196
  scmi_handle_smc                              372     152    -220
  imx8m_smc                                    576     356    -220
  zynqmp_eemi                                  864     636    -228

For arm32:

  add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-160 (-160)
  Function                                     old     new   delta
  scmi_handle_smc                              392     232    -160
---
 xen/arch/arm/firmware/scmi-smc.c            | 16 +-----------
 xen/arch/arm/include/asm/smccc.h            | 29 +++++++++++++++++++++
 xen/arch/arm/platforms/imx8m.c              | 16 +-----------
 xen/arch/arm/platforms/imx8qm.c             | 16 +-----------
 xen/arch/arm/platforms/xilinx-zynqmp-eemi.c | 17 ++----------
 5 files changed, 34 insertions(+), 60 deletions(-)

diff --git a/xen/arch/arm/firmware/scmi-smc.c b/xen/arch/arm/firmware/scmi-smc.c
index 0835ddeeeccc..a0cc6c6192f8 100644
--- a/xen/arch/arm/firmware/scmi-smc.c
+++ b/xen/arch/arm/firmware/scmi-smc.c
@@ -50,7 +50,6 @@ static bool scmi_is_valid_smc_id(uint32_t fid)
 static bool scmi_handle_smc(struct cpu_user_regs *regs)
 {
     uint32_t fid = (uint32_t)get_user_reg(regs, 0);
-    struct arm_smccc_res res;
 
     if ( !scmi_is_valid_smc_id(fid) )
         return false;
@@ -63,20 +62,7 @@ static bool scmi_handle_smc(struct cpu_user_regs *regs)
     }
 
     /* For the moment, forward the SCMI Request to FW running at EL3 */
-    arm_smccc_1_1_smc(fid,
-                      get_user_reg(regs, 1),
-                      get_user_reg(regs, 2),
-                      get_user_reg(regs, 3),
-                      get_user_reg(regs, 4),
-                      get_user_reg(regs, 5),
-                      get_user_reg(regs, 6),
-                      get_user_reg(regs, 7),
-                      &res);
-
-    set_user_reg(regs, 0, res.a0);
-    set_user_reg(regs, 1, res.a1);
-    set_user_reg(regs, 2, res.a2);
-    set_user_reg(regs, 3, res.a3);
+    arm_smccc_guest_smc(regs);
 
     return true;
 }
diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/smccc.h
index 53cdddb690b7..832157f43734 100644
--- a/xen/arch/arm/include/asm/smccc.h
+++ b/xen/arch/arm/include/asm/smccc.h
@@ -202,6 +202,21 @@ struct arm_smccc_res {
 #ifdef CONFIG_ARM_32
 #define arm_smccc_1_0_smc(...) arm_smccc_1_1_smc(__VA_ARGS__)
 #define arm_smccc_smc(...) arm_smccc_1_1_smc(__VA_ARGS__)
+
+/* Make an SMCCC v1.1 compliant SMC call with guest register state. */
+static inline void arm_smccc_guest_smc(struct cpu_user_regs *regs)
+{
+    struct arm_smccc_res res;
+
+    arm_smccc_1_1_smc(regs->r0, regs->r1, regs->r2, regs->r3,
+                      regs->r4, regs->r5, regs->r6, regs->r7, &res);
+
+    regs->r0 = res.a0;
+    regs->r1 = res.a1;
+    regs->r2 = res.a2;
+    regs->r3 = res.a3;
+}
+
 #else
 
 void __arm_smccc_1_0_smc(register_t a0, register_t a1, register_t a2,
@@ -251,6 +266,20 @@ void __arm_smccc_1_0_smc(register_t a0, register_t a1, register_t a2,
             arm_smccc_1_0_smc(__VA_ARGS__);                     \
     } while ( 0 )
 
+/* Make an SMCCC v1.1 compliant SMC call with guest register state. */
+static inline void arm_smccc_guest_smc(struct cpu_user_regs *regs)
+{
+    struct arm_smccc_res res;
+
+    arm_smccc_1_1_smc(regs->x0, regs->x1, regs->x2, regs->x3,
+                      regs->x4, regs->x5, regs->x6, regs->x7, &res);
+
+    regs->x0 = res.a0;
+    regs->x1 = res.a1;
+    regs->x2 = res.a2;
+    regs->x3 = res.a3;
+}
+
 /*
  * struct arm_smccc_1_2_regs - Arguments for or Results from SMC call
  * @a0-a17 argument values from registers 0 to 17
diff --git a/xen/arch/arm/platforms/imx8m.c b/xen/arch/arm/platforms/imx8m.c
index 669dd517e057..efb0ad20d6e8 100644
--- a/xen/arch/arm/platforms/imx8m.c
+++ b/xen/arch/arm/platforms/imx8m.c
@@ -50,7 +50,6 @@ static bool imx8m_smc(struct cpu_user_regs *regs)
 {
     uint32_t function_id = get_user_reg(regs, 0);
     uint32_t subfunction_id = get_user_reg(regs, 1);
-    struct arm_smccc_res res;
 
     if ( !cpus_have_const_cap(ARM_SMCCC_1_1) )
     {
@@ -122,20 +121,7 @@ static bool imx8m_smc(struct cpu_user_regs *regs)
         return false;
     }
 
-    arm_smccc_1_1_smc(function_id,
-                      subfunction_id,
-                      get_user_reg(regs, 2),
-                      get_user_reg(regs, 3),
-                      get_user_reg(regs, 4),
-                      get_user_reg(regs, 5),
-                      get_user_reg(regs, 6),
-                      get_user_reg(regs, 7),
-                      &res);
-
-    set_user_reg(regs, 0, res.a0);
-    set_user_reg(regs, 1, res.a1);
-    set_user_reg(regs, 2, res.a2);
-    set_user_reg(regs, 3, res.a3);
+    arm_smccc_guest_smc(regs);
 
     return true;
 }
diff --git a/xen/arch/arm/platforms/imx8qm.c b/xen/arch/arm/platforms/imx8qm.c
index 3600a073e8ba..7249e14ab640 100644
--- a/xen/arch/arm/platforms/imx8qm.c
+++ b/xen/arch/arm/platforms/imx8qm.c
@@ -67,7 +67,6 @@ static bool imx8qm_smc(struct cpu_user_regs *regs)
 {
     uint32_t function_id = get_user_reg(regs, 0);
     uint32_t subfunction_id = get_user_reg(regs, 1);
-    struct arm_smccc_res res;
 
     if ( !cpus_have_const_cap(ARM_SMCCC_1_1) )
     {
@@ -106,20 +105,7 @@ static bool imx8qm_smc(struct cpu_user_regs *regs)
     }
 
  allow_call:
-    arm_smccc_1_1_smc(function_id,
-                      subfunction_id,
-                      get_user_reg(regs, 2),
-                      get_user_reg(regs, 3),
-                      get_user_reg(regs, 4),
-                      get_user_reg(regs, 5),
-                      get_user_reg(regs, 6),
-                      get_user_reg(regs, 7),
-                      &res);
-
-    set_user_reg(regs, 0, res.a0);
-    set_user_reg(regs, 1, res.a1);
-    set_user_reg(regs, 2, res.a2);
-    set_user_reg(regs, 3, res.a3);
+    arm_smccc_guest_smc(regs);
 
     return true;
 }
diff --git a/xen/arch/arm/platforms/xilinx-zynqmp-eemi.c b/xen/arch/arm/platforms/xilinx-zynqmp-eemi.c
index 2053ed7ac5f6..326c8a1ba6e5 100644
--- a/xen/arch/arm/platforms/xilinx-zynqmp-eemi.c
+++ b/xen/arch/arm/platforms/xilinx-zynqmp-eemi.c
@@ -51,7 +51,6 @@ static inline bool domain_has_reset_access(struct domain *d, uint32_t rst)
 
 bool zynqmp_eemi(struct cpu_user_regs *regs)
 {
-    struct arm_smccc_res res;
     uint32_t fid = get_user_reg(regs, 0);
     uint32_t nodeid = get_user_reg(regs, 1);
     unsigned int pm_fn = fid & 0xFFFF;
@@ -187,20 +186,8 @@ bool zynqmp_eemi(struct cpu_user_regs *regs)
      * can forward the whole command to firmware without additional
      * parameters checks.
      */
-    arm_smccc_1_1_smc(get_user_reg(regs, 0),
-                      get_user_reg(regs, 1),
-                      get_user_reg(regs, 2),
-                      get_user_reg(regs, 3),
-                      get_user_reg(regs, 4),
-                      get_user_reg(regs, 5),
-                      get_user_reg(regs, 6),
-                      get_user_reg(regs, 7),
-                      &res);
-
-    set_user_reg(regs, 0, res.a0);
-    set_user_reg(regs, 1, res.a1);
-    set_user_reg(regs, 2, res.a2);
-    set_user_reg(regs, 3, res.a3);
+    arm_smccc_guest_smc(regs);
+
     return true;
 
 done:
-- 
2.39.5


