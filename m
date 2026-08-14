Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD4FC5CFDB
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2026 17:04:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1391302.1631198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuvKM-0004oW-Kj; Fri, 14 Aug 2026 17:04:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1391302.1631198; Fri, 14 Aug 2026 17:04:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuvKM-0004n9-EV; Fri, 14 Aug 2026 17:04:18 +0000
Received: by outflank-mailman (input) for mailman id 1391302;
 Fri, 14 Aug 2026 16:26:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <onlywig@gmail.com>) id 1wuujI-0008H0-9x
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 16:26:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuujH-006hmA-N6
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 18:25:59 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <onlywig@gmail.com>)
 id 6a7f4188-2eae-0a2a0a5409dd-0a2a4505d3be-14
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 18:25:59 +0200
Received: from [209.85.214.179] (helo=mail-pl1-f179.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <onlywig@gmail.com>)
 id 6a7f4196-4cb1-0a2a45050019-d155d6b3e940-3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 18:25:59 +0200
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2ce7d2adef4so21025855ad.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 09:25:59 -0700 (PDT)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net.
 [125.227.154.99]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d3aeb29f62sm12585735ad.38.2026.08.14.09.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2026 09:25:56 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1786724758; x=1787329558; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pANIpxy73mwji3KETZ0SQ4NuCZV/pLf/fluSXSojwX0=;
        b=bv5hcZOBpC8NxwXfQFp5eC6/oYyoISXaCw/FAe5ISCfYNR1pWJIR4axA6bWuxpkmEO
         odzIsEi0C2AKCutMsyxv8iHwTsw/cYtJakBB2enEq2IaEPeoJg5vs1bcc8aZiMnPe477
         u9D9vHudsiQO7kAanqQhzgA1DsiWDyFsD8BWkigATyLWfXfZueCqdKZvNqRhUjCK09k7
         MMjIjgF5ojj+ZFordewlofj3WJRk+UewLIdjiMYKm4js6xvxBCUd7BcRZq4uhvsfqFlo
         BqXmYGa2uoFd+qtHjI9CQD+9qujnlGbZJhpM6gotJ90eTem4R6gnvn4YLULomMCYUr3B
         hv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786724758; x=1787329558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pANIpxy73mwji3KETZ0SQ4NuCZV/pLf/fluSXSojwX0=;
        b=HEX4ECJaZQjS5GUKijDAWNA2J2R1dLBaMafS2rYd7CqAR6YPpblhX2Cke4fZuhmDER
         OTRSdehB4fs/nuYJGlv6HTETMA7G3TSgFDnkMpwpEtW7UQu9oiJ3DbO/Xd1Wh6mwHICO
         hfO9nryXzzKgSeY9+W307r35IwKgOSHMQjK3Kb2w1xVrWLjlEVqfcWNcud6zLhQ39FEB
         KzJqk+sfb5CdGJpq0VrzjqC8VkFcFRs5s2K6OXxvOuLrWO0McSV00rEdjWhvS+26Pt+0
         ZN6z/yZvz5WFr9fwVF8nETxHjh7NYp7E6tcP46vbr3ARQ0HfDUaco1dAt2/eO8tliFPg
         ji4w==
X-Gm-Message-State: AOJu0YxRkd9IE6sCrJE+2x2eQS5gSC0WfGNbe6fcAfEJWZHAyXuUOk1E
	Ctq4q/EXHL78aThum1MOCR35i41SmNg+UlTDHWQHOP9+00dtusmXRh5NsnazCIkG
X-Gm-Gg: AR+sD101eE5x5DvFWHGBRgpP9x9Fk+VXMsR5utNnBQaJ40SFK2JQnSZ1NVPk7/90QeA
	RTbGGUagIxAsZjvutozV/9MmAAQNO5lQPFhWHKuLQMb0cm5d8BXLrj1nFMCR5Bv4f79+lsyukog
	R7IUZtjIr9xYpN7I9F/FpZoIALy3l8h+X+E7395RcOa+TuuwJpQO2wpmeXMXenxskIE2aIhe7Fm
	CQw8wiqld8FuwKIws11mEFbNBv4KHck0nEPhQCTuJh1blp6PIHhbRGEhl7Wy+xGT/bN0m8d5LwY
	MmiB7wIr2vPZdpM9vQwMC8zPpL6OdVsGV/pweGsKBYQJ/eJ7KCA4G4wdebaBM/dwD/G2VXYFx4z
	7T4WnmyaDFHLBsVNswTfJTVwbI6T1wlkYs//wBwDOPuCuzD9ZshGinGm3TnltKqLTVVGNGxCISL
	7txpIt69HQFbVpF0/RbyrLWrbQ3gNCQWnZRc5x9qtD05refbf/jYMuSc6Tfzwr8nNmpJnl0F2Z8
	uPduDa/z8Kk/EexBuHDF0ob63wZTQmZ
X-Received: by 2002:a17:903:1103:b0:2c1:98b7:ecf3 with SMTP id d9443c01a7336-2d3b0cd3392mr88100305ad.23.1786724757484;
        Fri, 14 Aug 2026 09:25:57 -0700 (PDT)
From: Wig Cheng <onlywig@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	John Ernberg <john.ernberg@actia.se>,
	Peng Fan <peng.fan@nxp.com>,
	Wig Cheng <onlywig@gmail.com>
Subject: [PATCH 3/3] xen/arm: add i.MX8M platform support
Date: Sat, 15 Aug 2026 00:25:35 +0800
Message-ID: <20260814162535.331459-4-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814162535.331459-1-onlywig@gmail.com>
References: <20260814162535.331459-1-onlywig@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1786724759-738BE2A1-0552155B/0/0
X-purgate-type: clean
X-purgate-size: 5089

Add platform glue for the NXP i.MX8M family (i.MX8MP/MQ/MM/MN).

When Linux is used as dom0 a number of drivers make SiP SMC calls into
TF-A to manage hardware: GPC power domains, DDR frequency scaling, SRC
(M-core remoteproc), SoC info, NoC QoS and BBSM tamper status.  There
is no public specification for these calls; the function IDs are taken
from the upstream and vendor kernels.

Forward this reviewed set of calls from the hardware domain, following
the whitelist model of the i.MX8QM platform.  CPU frequency scaling is
denied because the hardware domain cannot make an informed decision,
and any unknown function ID is rejected.

Signed-off-by: Wig Cheng <onlywig@gmail.com>
---
 xen/arch/arm/platforms/Makefile |   1 +
 xen/arch/arm/platforms/imx8m.c  | 116 ++++++++++++++++++++++++++++++++
 2 files changed, 117 insertions(+)
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
index 0000000000..dc49e754ee
--- /dev/null
+++ b/xen/arch/arm/platforms/imx8m.c
@@ -0,0 +1,116 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * xen/arch/arm/platforms/imx8m.c
+ *
+ * i.MX 8M family setup
+ *
+ * Copyright 2026 Open-EP (E-Paper) Community
+ */
+
+#include <xen/sched.h>
+#include <asm/platform.h>
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
+/*
+ * SiP SMC function IDs used by the i.MX8M Linux drivers.  There is no
+ * public specification for these; the IDs and names are extracted from
+ * the upstream and vendor kernels (see drivers/soc/imx, drivers/devfreq,
+ * drivers/remoteproc, drivers/firmware/imx).
+ */
+#define IMX_SIP_GPC         0xC2000000  /* GPC power-domain control */
+#define IMX_SIP_CPUFREQ     0xC2000001
+#define IMX_SIP_DDR_DVFS    0xC2000004  /* DRAM frequency scaling */
+#define IMX_SIP_SRC         0xC2000005  /* SRC: M-core remoteproc start/stop */
+#define IMX_SIP_GET_SOC_INFO 0xC2000006
+#define IMX_SIP_NOC         0xC2000008  /* NoC QoS priority setup */
+#define IMX_SIP_BBSM        0xC200000D  /* BBSM tamper status */
+
+static bool imx8m_smc(struct cpu_user_regs *regs)
+{
+    uint32_t function_id = get_user_reg(regs, 0);
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
+    switch ( function_id )
+    {
+    /*
+     * All of these manage hardware that belongs to the hardware domain
+     * (power domains, DRAM controller, M-core, NoC, secure RTC) or are
+     * read-only queries.  Forward them.
+     */
+    case IMX_SIP_GPC:
+    case IMX_SIP_DDR_DVFS:
+    case IMX_SIP_SRC:
+    case IMX_SIP_GET_SOC_INFO:
+    case IMX_SIP_NOC:
+    case IMX_SIP_BBSM:
+        break;
+
+    /*
+     * CPU frequency scaling: the hardware domain does not see the whole
+     * system and cannot make an informed decision, so deny it (matches
+     * the i.MX8QM platform).
+     */
+    case IMX_SIP_CPUFREQ:
+        return false;
+
+    default:
+        gprintk(XENLOG_WARNING, "imx8m: smc: Unknown function id %x\n",
+                function_id);
+        return false;
+    }
+
+    arm_smccc_1_1_smc(function_id,
+                      get_user_reg(regs, 1),
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


