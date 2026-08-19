Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7ABDC5DF81
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 15:28:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1395589.1633938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwiDW-0004Z5-Rv; Wed, 19 Aug 2026 15:28:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1395589.1633938; Wed, 19 Aug 2026 15:28:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwiDW-0004Yw-Oa; Wed, 19 Aug 2026 15:28:38 +0000
Received: by outflank-mailman (input) for mailman id 1395589;
 Wed, 19 Aug 2026 15:28:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <onlywig@gmail.com>) id 1wwiDV-0004XO-OZ
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 15:28:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwiDV-009wZP-5C
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 17:28:37 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <onlywig@gmail.com>)
 id 6a85cb7e-bab6-0a2a0a5309dd-0a2a4504bacc-32
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 17:28:37 +0200
Received: from [209.85.210.169] (helo=mail-pf1-f169.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <onlywig@gmail.com>)
 id 6a85cba3-b57f-0a2a45040019-d155d2a9dd6d-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 17:28:36 +0200
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-84830c774a0so1191353b3a.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 08:28:36 -0700 (PDT)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net.
 [125.227.154.99]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-851d3617434sm787575b3a.29.2026.08.19.08.28.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2026 08:28:34 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787153315; x=1787758115; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oCTJm4KprltrO2DL2H0L71Et98Ar4/DK5gqKwieMcHI=;
        b=TGkL8+PFm6hIVmuzNShpvBMa28/sfgXhRlkBZwoHyi8xqXo/O8bcaKUX1QXnBCaVBL
         DMS14Hdfa80U7qN3rD/GH5yVLGbUgLQKZgPO0wC6GRVzTVkcCW95Ru7ALxfT3V/7dmTb
         KWQyaaY8jla959gJNU317Ufv5Y6Nq8d57dA6WdS4UWglmu+OgFmrh6Tmu2/9Q74HFe76
         OSDV3dTokp/9v4Qiz19GEykCBRCkpPaD0L2fSLv+Z/ljY502lw6tBse1UOhQEeXOGG2D
         wKVpp4erZGYdhcNREpQ6rSp4lF+9nHhdZNLBwz2sb7on5OxzPGSU8Bi1gd11Qz5UZuSI
         BFYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153315; x=1787758115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oCTJm4KprltrO2DL2H0L71Et98Ar4/DK5gqKwieMcHI=;
        b=CEMyHnkOixiNCJqyP4bs/WzWevpc4zI9K5GqOij98KDBiJHttoMR1JDW+Rll28j5ap
         ffbQLnfSc+Z80cgsgvWkZBr2KtBwOuiiz5MjLef2xuIiSggxSXB6j0ASU3Bjzag1iiW6
         zY9Me2yHuzpO5YVOqJxKudWoDnTr/r9Ah0hYtiXxIU2rLWNxLWESx8s09f2IKRJtGROq
         HlqJmxy7nYOIU9D7IL2l9ZDEn6WfQAzikPgv4lMeHZ7zDhQ4exf9TUIhzlSKKSupi5Gd
         aTqTJlkoVYw5pTwny1KsJTK44OIw1AW+C4uC63DfvZRokGUANQRMvlMZhZvDP+3f1X74
         lvYQ==
X-Gm-Message-State: AOJu0Yyxr9j7rCEx5RbjlMRBQUDcxHutgfW3f9EglhlozfpbFwkaigJb
	6RSro2ObSYN3r+piX54/xlz+1YkbxieP5cQae94p9iaOUi+zmsVQTqo31/lag+nJ
X-Gm-Gg: AR+sD12Oc2SZo1LpR2IpA64WWC2PXPFFzmuADWltgmZeSrGDNlX55JQuajP9KqLlL09
	6sS61RBFDFmZcQ/K5Q5VZOEeZMIcSw0IYkGESGpOKLUzcq4LItR2oZScckyljMAE9pYDbuAlDsV
	jCyseNTQ+gp3ek3TZI2EJcuuhum4n7bL53vUskZSzAq+85PS28MOwbHoTT+6BREKLLWWwmPeQa1
	7eXEdf0nPJM03wGEGkwGvoRWiREKENZiX9eh6bPnf6x8tk7RG9sbJ0dQOC8LP47jQPKr98QKnHR
	HEvWInITn/CMShXJaEoVIE1/zhOr80Y4AK6Q3SuENByGMVmdE5ITo/dXqGkJsBHBzVkXmORvYFh
	9IdlOfx0gWZWGOFBeoTgjxlTSXxQauGFLq5lDLf+9ASECExaKurOrI+hUM7dfj3eFPDjMlMGISM
	8GkxbbE8u11BR8mEqBjLkfRz4ob/FztDWAo+Sqw7Dz3y8+ehtSi9uSckbBcVFlEqIC9Ke9gnjh4
	X669B2KroM5wcSoKGQqypYfz2DxhRod
X-Received: by 2002:a05:6a00:ba8e:b0:847:9267:2104 with SMTP id d2e1a72fcca58-851d394802emr8097891b3a.12.1787153314949;
        Wed, 19 Aug 2026 08:28:34 -0700 (PDT)
From: Wig Cheng <onlywig@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Michal Orzel <michal.orzel@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	John Ernberg <john.ernberg@actia.se>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v4 3/4] xen/arm: add i.MX8M platform support
Date: Wed, 19 Aug 2026 23:28:20 +0800
Message-ID: <20260819152821.3361898-4-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819152821.3361898-1-onlywig@gmail.com>
References: <20260819152821.3361898-1-onlywig@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1787153317-508D9B50-366F072F/0/0
X-purgate-type: clean
X-purgate-size: 7252

Add platform glue for the NXP i.MX8M family (i.MX8MP/MQ/MM/MN).

When Linux is used as dom0 a number of drivers make SiP SMC calls into
TF-A to manage hardware: GPC power domains, SRC (M-core remoteproc),
SoC info and NoC QoS.  There is no public specification for these
calls; the function IDs and their subfunctions are taken from the
vendor kernel call sites.

Forward only the specific subfunctions the hardware domain issues,
following the whitelist model of the i.MX8QM platform.  Each service
with a fixed set of subfunctions (GPC, SRC, NoC) filters them with an
explicit switch on the subfunction id, and the SoC info call is a
read-only query.  CPU and DRAM frequency scaling are denied because
the hardware domain cannot make an informed decision about resources
shared with the other domains, and any unknown function ID is
rejected.

Signed-off-by: Wig Cheng <onlywig@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v4:
- SRC and NoC: filter the subfunction id with an explicit switch that
  lists each accepted subfunction, instead of a range check.
- NoC: accept only the QoS priority subfunction; the LCDIF subfunction
  has no caller in the vendor kernel.  Note that i.MX8MP issues no NoC
  call at boot (only i.MX8MQ does).
- Print the subfunction id as well when rejecting an unknown function
  id.
- Picked up Michal's Reviewed-by.

 xen/arch/arm/platforms/Makefile |   1 +
 xen/arch/arm/platforms/imx8m.c  | 161 ++++++++++++++++++++++++++++++++
 2 files changed, 162 insertions(+)
 create mode 100644 xen/arch/arm/platforms/imx8m.c

diff --git a/xen/arch/arm/platforms/Makefile b/xen/arch/arm/platforms/Makefile
index bec6e55d1f..cdf936c50d 100644
--- a/xen/arch/arm/platforms/Makefile
+++ b/xen/arch/arm/platforms/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_ALL_PLAT)   += sunxi.o
 obj-$(CONFIG_ALL64_PLAT) += thunderx.o
 obj-$(CONFIG_ALL64_PLAT) += xgene-storm.o
 obj-$(CONFIG_ALL64_PLAT) += brcm-raspberry-pi.o
+obj-$(CONFIG_ALL64_PLAT) += imx8m.o
 obj-$(CONFIG_ALL64_PLAT) += imx8qm.o
 obj-$(CONFIG_MPSOC_PLATFORM)  += xilinx-zynqmp.o
 obj-$(CONFIG_MPSOC_PLATFORM)  += xilinx-zynqmp-eemi.o
diff --git a/xen/arch/arm/platforms/imx8m.c b/xen/arch/arm/platforms/imx8m.c
new file mode 100644
index 0000000000..ad76935f5d
--- /dev/null
+++ b/xen/arch/arm/platforms/imx8m.c
@@ -0,0 +1,161 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * i.MX 8M family setup
+ *
+ * Copyright 2026 Open-EP (E-Paper) Community
+ */
+
+#include <xen/sched.h>
+#include <asm/platform.h>
+#include <asm/regs.h>
+#include <asm/smccc.h>
+
+static const char * const imx8m_dt_compat[] __initconst =
+{
+    "fsl,imx8mp",
+    "fsl,imx8mq",
+    "fsl,imx8mm",
+    "fsl,imx8mn",
+    NULL
+};
+
+#define IMX_SIP_FID(fid) \
+    ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, \
+                       ARM_SMCCC_CONV_64, \
+                       ARM_SMCCC_OWNER_SIP, \
+                       (fid))
+
+/*
+ * SiP SMC function IDs used by the i.MX8M Linux drivers.  There is no
+ * public specification for these; the IDs and their subfunctions are
+ * extracted from the vendor kernel call sites (see drivers/soc/imx,
+ * drivers/devfreq, drivers/remoteproc).
+ */
+#define IMX_SIP_F_GPC       0x0   /* GPC power-domain control */
+#define IMX_SIP_F_CPUFREQ   0x1   /* CPU frequency scaling */
+#define IMX_SIP_F_DDR_DVFS  0x4   /* DRAM frequency scaling */
+#define IMX_SIP_F_SRC       0x5   /* SRC: M-core remoteproc start/stop */
+#define IMX_SIP_F_SOC_INFO  0x6   /* read-only SoC info query */
+#define IMX_SIP_F_NOC       0x8   /* NoC QoS priority setup */
+
+#define IMX_SIP_GPC_SF_PM_DOMAIN    0x03
+
+#define IMX_SIP_SRC_SF_M4_START     0x00
+#define IMX_SIP_SRC_SF_M4_STARTED   0x01
+#define IMX_SIP_SRC_SF_M4_STOP      0x02
+
+#define IMX_SIP_NOC_SF_PRIORITY     0x01
+
+static bool imx8m_smc(struct cpu_user_regs *regs)
+{
+    uint32_t function_id = get_user_reg(regs, 0);
+    uint32_t subfunction_id = get_user_reg(regs, 1);
+    struct arm_smccc_res res;
+
+    if ( !cpus_have_const_cap(ARM_SMCCC_1_1) )
+    {
+        printk_once(XENLOG_WARNING
+                    "imx8m: smc: no SMCCC 1.1 support. Disabling firmware calls\n");
+
+        return false;
+    }
+
+    /* Only the hardware domain may use the SiP calls */
+    if ( !is_hardware_domain(current->domain) )
+    {
+        gprintk(XENLOG_WARNING, "imx8m: smc: No access\n");
+        return false;
+    }
+
+    /*
+     * Forward only the subfunctions the dom0 kernel actually issues.  All
+     * of these manage hardware that belongs to the hardware domain (power
+     * domains, M-core, NoC) or are read-only queries.
+     */
+    switch ( function_id )
+    {
+    case IMX_SIP_FID(IMX_SIP_F_GPC):
+        if ( subfunction_id != IMX_SIP_GPC_SF_PM_DOMAIN )
+            return false;
+        break;
+
+    /*
+     * CPU and DRAM frequency scaling: the hardware domain does not see the
+     * whole system and cannot make an informed decision about resources
+     * shared with the other domains, so deny both (CPU frequency scaling
+     * is denied on the i.MX8QM platform for the same reason).
+     */
+    case IMX_SIP_FID(IMX_SIP_F_CPUFREQ):
+    case IMX_SIP_FID(IMX_SIP_F_DDR_DVFS):
+        return false;
+
+    case IMX_SIP_FID(IMX_SIP_F_SRC):
+        /* SRC: M-core remoteproc start, poll-started and stop. */
+        switch ( subfunction_id )
+        {
+        case IMX_SIP_SRC_SF_M4_START:
+        case IMX_SIP_SRC_SF_M4_STARTED:
+        case IMX_SIP_SRC_SF_M4_STOP:
+            break;
+
+        default:
+            return false;
+        }
+        break;
+
+    case IMX_SIP_FID(IMX_SIP_F_SOC_INFO):
+        break;
+
+    case IMX_SIP_FID(IMX_SIP_F_NOC):
+        /*
+         * NoC QoS priority setup.  Only i.MX8MQ issues this at boot;
+         * i.MX8MP issues no NoC call, but the platform covers both.
+         */
+        switch ( subfunction_id )
+        {
+        case IMX_SIP_NOC_SF_PRIORITY:
+            break;
+
+        default:
+            return false;
+        }
+        break;
+
+    default:
+        gprintk(XENLOG_WARNING,
+                "imx8m: smc: Unknown function id %x subfunction id %x\n",
+                function_id, subfunction_id);
+        return false;
+    }
+
+    arm_smccc_1_1_smc(function_id,
+                      subfunction_id,
+                      get_user_reg(regs, 2),
+                      get_user_reg(regs, 3),
+                      get_user_reg(regs, 4),
+                      get_user_reg(regs, 5),
+                      get_user_reg(regs, 6),
+                      get_user_reg(regs, 7),
+                      &res);
+
+    set_user_reg(regs, 0, res.a0);
+    set_user_reg(regs, 1, res.a1);
+    set_user_reg(regs, 2, res.a2);
+    set_user_reg(regs, 3, res.a3);
+
+    return true;
+}
+
+PLATFORM_START(imx8m, "i.MX 8M")
+    .compatible = imx8m_dt_compat,
+    .smc = imx8m_smc,
+PLATFORM_END
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.43.0


