Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01662C5DF7E
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 15:40:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394300.1633154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwLvR-0005lJ-Ne; Tue, 18 Aug 2026 15:40:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394300.1633154; Tue, 18 Aug 2026 15:40:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwLvR-0005l7-Id; Tue, 18 Aug 2026 15:40:29 +0000
Received: by outflank-mailman (input) for mailman id 1394300;
 Tue, 18 Aug 2026 15:40:28 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <onlywig@gmail.com>) id 1wwLvQ-0005jp-Gs
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 15:40:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwLvP-006hOt-Ti
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 17:40:27 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <onlywig@gmail.com>)
 id 6a847ce4-8faa-0a2a0a5109dd-0a2a4504d266-20
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 17:40:27 +0200
Received: from [209.85.216.44] (helo=mail-pj1-f44.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <onlywig@gmail.com>)
 id 6a847cea-b57f-0a2a45040019-d155d82cd18f-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 17:40:27 +0200
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-384930ca5e2so83335a91.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 08:40:27 -0700 (PDT)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net.
 [125.227.154.99]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3954d2de41dsm6247737a91.5.2026.08.18.08.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2026 08:40:24 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787067626; x=1787672426; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M9gYmqB9sm85nt1WIzPntBQ829u0LTMSjCyLS2s6yWc=;
        b=dR2SSz3uPUK3epUlw4KJb0txon1RPqOlQUxOV94V0pu+SPsMRYYZsWHeB2RcYIeOJl
         OarhFesP8EIvV0D2uK5nABveVpEO5wbzicaraEMwXP54O4DfqNFqzk6JqfIcgFPMdB1Q
         w9pG2HLJ6f9eR9wrJmxjIbpB+UbAvuXnZGbUZkDldL3KaKsngd4MU6I1Mnfe+E/KIxQv
         N8/g4dyq/266eM8UTsIsqQTCrImsTvTQsahSd5gTBQ/yeCwRgLpvXzLUpv4lPir7gJ0n
         gneUQsDjJZE7QUPnB+qJZITQS5LslBpVybeE7SzT71GwT645OlAfqhpzVgqqoMMHH0J2
         R0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787067626; x=1787672426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M9gYmqB9sm85nt1WIzPntBQ829u0LTMSjCyLS2s6yWc=;
        b=I0Ri7HXebCxlAkQaJ6XxdUU5aiv+y2leuy9s+XAV9H9fQRLK3+Cp3N/DpyRlVMzgEw
         6YowfrqlditWrGDFIyRkeO0GUb6q00JJtf4mYdHeUvjIUhgOiQin4+L2aNu2M3t+7RaV
         RIyRQbuMuci4tnjAijr3Te8kT89LY4DDzfk+i9LbsvTBrjpT+9i0OISBgPN2LgbWynIS
         4OHFfncXrTwrTNTNy7mXFeGIddwVBw7iAZbN8Vce3jQfczzwk2xz73Q+bvxZhUFeLXgY
         bxCqjDBMLr0AtpLtN+pWd2mGCL0jYhpvDYlx2yA8cisyCY5B8K0c3dlQOtO6m6qZzB3j
         Frig==
X-Gm-Message-State: AOJu0YxgreaHsqxw4TN7MmyvFMzi/mvCK0GAXxV45ocWo/C5vlfTM7LS
	Bwf3GK1tJBlB6kPvGK7a+jFoiffYT+jntzJW4Kbn9inZc3yAEMMxl4rPYaomdZdc
X-Gm-Gg: AR+sD13E61YbFfM8rkpASrknx9yxniQHeWwvgR1Q0oBubOAqEccQSl8tX43liCaX707
	tS1VxExfb6Y4OhYK1nBl7vzM1EyEYHZSi4rtQNL81u0Lp14Li2LdSWpq+8x/AQr7NNZjbc6iEE1
	9U9W3BMxvEGkxhhGKl/MHvmJL2Ke3yNagCRLYYT0WqHofHyt753OITq2RyVqDanUcLuoyjthXkn
	uGZM7M7/Xr5Z55VcrqYsnhGF6mNX5fsBfW4pjZG3tKZt1dA0gNh7+XBICQpAOkYNlb+9isbVtw6
	v8l9iC+8v3cCWktSlJOD4q1w/IT21NCNDaeVJ+w6tLXVo2MCkttHlGkVKus3q0XBWZE6O/056dF
	ByTTz7xB1iWNCCTyQfeIm06akfBp7KZ1JXk73uuik0vwYnCr326yCwlQHZfNKz1p4ucNpyDBQBI
	pD8ImkzDEWMV7pJ8dpUF0ZMXPF5KvIEtsC5WitYNDHWAaY4SNAD873LfvTU36GaBaaVsVpKv6VF
	8ICoIwNpaibm0mD+8lD/gHGMsvrvXk4jxkmdkN1JsU=
X-Received: by 2002:a17:90b:5707:b0:38f:5801:dc0e with SMTP id 98e67ed59e1d1-3933e61bee2mr39142719a91.15.1787067625672;
        Tue, 18 Aug 2026 08:40:25 -0700 (PDT)
From: Wig Cheng <onlywig@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Michal Orzel <michal.orzel@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	John Ernberg <john.ernberg@actia.se>,
	Peng Fan <peng.fan@nxp.com>,
	Wig Cheng <onlywig@gmail.com>
Subject: [PATCH v3 3/4] xen/arm: add i.MX8M platform support
Date: Tue, 18 Aug 2026 23:39:45 +0800
Message-ID: <20260818153946.1635464-4-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818153946.1635464-1-onlywig@gmail.com>
References: <20260818153946.1635464-1-onlywig@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1787067627-510DDB50-329D83F9/0/0
X-purgate-type: clean
X-purgate-size: 6665

Add platform glue for the NXP i.MX8M family (i.MX8MP/MQ/MM/MN).

When Linux is used as dom0 a number of drivers make SiP SMC calls into
TF-A to manage hardware: GPC power domains, SRC (M-core remoteproc),
SoC info and NoC QoS.  There is no public specification for these
calls; the function IDs and their subfunctions are taken from the
vendor kernel call sites.

Forward only the specific subfunctions the hardware domain issues,
following the whitelist model of the i.MX8QM platform.  Where a service
has a fixed set of subfunctions (GPC, SRC, NoC) they are filtered, and
the SoC info call is a read-only query.  CPU and DRAM frequency scaling
are denied because the hardware domain cannot make an informed decision
about resources shared with the other domains, and any unknown function
ID is rejected.

Signed-off-by: Wig Cheng <onlywig@gmail.com>
---
Changes in v3:
- Include <asm/regs.h> for get/set_user_reg().
- Add a description for the CPUFREQ function id.
- Drop the unused SRC M4_START and NoC LCDIF subfunction macros.
- Order the switch cases by function id.
- Deny DDR DVFS as well, for the same reason CPU frequency scaling is
  denied: the hardware domain cannot make an informed decision about
  DRAM shared with the other domains.  Previously it was forwarded.
- Return false directly on a denied subfunction instead of goto plus a
  redundant printk (vsmccc_handle_call() already logs the rejection).

 xen/arch/arm/platforms/Makefile |   1 +
 xen/arch/arm/platforms/imx8m.c  | 139 ++++++++++++++++++++++++++++++++
 2 files changed, 140 insertions(+)
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
index 0000000000..0aceed9d43
--- /dev/null
+++ b/xen/arch/arm/platforms/imx8m.c
@@ -0,0 +1,139 @@
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
+        if ( subfunction_id > IMX_SIP_SRC_SF_M4_STOP )
+            return false;
+        break;
+
+    case IMX_SIP_FID(IMX_SIP_F_SOC_INFO):
+        break;
+
+    case IMX_SIP_FID(IMX_SIP_F_NOC):
+        if ( subfunction_id > IMX_SIP_NOC_SF_PRIORITY )
+            return false;
+        break;
+
+    default:
+        gprintk(XENLOG_WARNING, "imx8m: smc: Unknown function id %x\n",
+                function_id);
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


