Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C2DC624D3
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 11:12:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408222.1640872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2RqY-00055U-8B; Fri, 04 Sep 2026 11:12:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408222.1640872; Fri, 04 Sep 2026 11:12:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2RqY-00054W-2w; Fri, 04 Sep 2026 11:12:38 +0000
Received: by outflank-mailman (input) for mailman id 1408222;
 Fri, 04 Sep 2026 11:12:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1x2RqV-0004qN-QX
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 11:12:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2RqV-00DcPh-70
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 13:12:35 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a9aa79f-e002-0a2a0a5209dd-0a2a450292f6-18
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 13:12:35 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a9aa7a2-6ca4-0a2a45020019-d155dd32b183-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 13:12:35 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-484374f54d0so519938f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 04:12:35 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485885be1c1sm5501729f8f.32.2026.09.04.04.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 04:12:33 -0700 (PDT)
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
        d=citrix.com; s=google; t=1788520354; x=1789125154; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ppy5o97De8trlM8n4YR2jLYgSbac3XUfe4LKYxgPMgw=;
        b=KnFkU5zEsshsz0eFEDQ5VQx3BdvkrSQqudzhEQbMjapwrptxNkMdmVEiuQB+EXe4cS
         MNyYdnKtP4UsABLLIhMdU0Xtdw8R35GcJwN6oaWxt71cUu3x/7WbVcuvvm23mPWnkbTl
         ja0OcMLHk7LHXYjXYc9YIRRTJE9Y/34tqSDsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520354; x=1789125154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ppy5o97De8trlM8n4YR2jLYgSbac3XUfe4LKYxgPMgw=;
        b=bFT/Zpe1AOhW9kFMCabyrVHgIouqMg4E/B8zB4e72XEv784bUebay55Z1wSKX/oKJ5
         dWEA62D4trpQa7rCO18Nu6ZpHgBJRcIjtwtD7GdYiDPyS2u9fXF+5SqD96yiZcD62b7U
         32HVFvEPlqPOewdND/uais6jo3J2bfvHBaV8bxTzdMVVjQ0nq4TaDUMlLM6PXznGgt3k
         lYw3hUQs8DTl+wwtejwiAyUREfWVPZg5NCYHiHPRbbfjyB4vnxZ5CSHvKr3Ys3UAoGXB
         1WWzwZZ6bH432g9xZBerS9sLLmPp4EAsXjFAu39AoT/nPbTx3F2OHDN7kvjVC2BVGixX
         UfGw==
X-Gm-Message-State: AFuF++l2bOGlO9Kz/IjYP0LimuCvYHys5z5ECRmj2sVbFGET1b4kOqj4
	N5MpDHWSOu+quyCybZE69ImDQeUQ9Bk29JY2IHjq1aozK8okCDq17zPUvfzgCjpwr7BrxbZ7kd9
	Om90LDYs=
X-Gm-Gg: AYBFou0R98gNdImlg5Cdi0HpaEWpvxPU75MsHwq9ZDO3cEDLvdPT2aDMpllCWtM60D+
	4Kl86SSRqwEkvz8g45byAfwM+lit5kuTnBhXpi2KzIWeRMdMcQO8E+hAFG4cwmcbCJHVK3Blw6y
	bgPLZOrvQ+/6uZ2KPNAd4UCwdcald8sC/mkQFf0zYCuHXchVyj13OlvUH/DQeVH6TBvuu3N75rU
	3VZLUOnBmf7D6UuXZr8EV/N94cIuwnRXaL5/wOu/IHIfo0LrpbcFoCryQclPOUDVFh5WMgSGRkZ
	o8ADn3p/I4B8dySjbDzJhaF5QqN6xvQfQJ5iZ1RJ5W3UdD4iOQcF4KUIliRnpyO6qYDKOuYhG+x
	A+3B3qm+/DBjfATR0Br4Gl7CI5lH9ig/XLrVeP5lMQkSZ8g9fkreGJ0WfuFG75zVUBJbSmyus4N
	C7fp9/NolJUoIjg2+RP0vn7vBh8e4B4GUBimAwC8XMrd8HIIreUX+H04yWXc7IHbSr4yXIozuHx
	4yIBN/Zh+VrV2Psm8zeiuZ0aW2ozB7x54QjP4Y=
X-Received: by 2002:a05:6000:2084:b0:482:f0ee:1390 with SMTP id ffacd0b85a97d-48587289c5bmr10690519f8f.22.1788520354233;
        Fri, 04 Sep 2026 04:12:34 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>
Subject: [PATCH v2 2/5] xen/arm: Introduce arm_smccc_guest_smc()
Date: Fri,  4 Sep 2026 12:12:25 +0100
Message-Id: <20260904111228.3022634-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260904111228.3022634-1-andrew.cooper3@citrix.com>
References: <20260904111228.3022634-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1788520355-660A82AC-E334D494/0/0
X-purgate-type: clean
X-purgate-size: 8348

Both {get,set}_user_reg() are out-of-line functions, leading to awful code
generation.

Introduce arm_smccc_guest_smc() to operate directly on guest registers.

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


