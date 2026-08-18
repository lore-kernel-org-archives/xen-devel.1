Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F5B1C5B572
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 02:53:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393348.1632172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ww9wf-0001ze-Je; Tue, 18 Aug 2026 02:52:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393348.1632172; Tue, 18 Aug 2026 02:52:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ww9wf-0001zX-Fk; Tue, 18 Aug 2026 02:52:57 +0000
Received: by outflank-mailman (input) for mailman id 1393348;
 Tue, 18 Aug 2026 02:52:56 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <onlywig@gmail.com>) id 1ww9we-0001yE-5S
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 02:52:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ww9wd-0015Oq-Il
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 04:52:55 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <onlywig@gmail.com>)
 id 6a83c8e3-2eae-0a2a0a5409dd-0a2a4505b2d2-30
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 04:52:55 +0200
Received: from [209.85.215.169] (helo=mail-pg1-f169.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <onlywig@gmail.com>)
 id 6a83c906-4cb1-0a2a45050019-d155d7a9e116-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 04:52:55 +0200
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-cbee3777e1cso2310403a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 19:52:55 -0700 (PDT)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net.
 [125.227.154.99]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3954d3b40basm4333605a91.14.2026.08.17.19.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 19:52:51 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787021573; x=1787626373; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bjcs/pOZ08cE/dRMsQLU7rzeUl8ZNFGFfdNRoYL0AWQ=;
        b=eoV32anN7ryIN5hp+TFDhtPsqX51VbbIEBoh0FmeZWCqCBQ43WoAQSMjVTO5KMsWPQ
         sa79iRbFdF7JG2M0WfvCRmwvR/8NwzJGR9zz4QyMnSExo8VVHpgkZBH5BhIvUcd8pGLJ
         oVseWynis7RsR1pn7i9hRCBB4FAfhfNvkZb3kSOLxVXP4ItcDAld+t7D3JHFQJxfIOwJ
         m09n+0DhqlcWozOWDx2yreJJqperUmvOVScSUqeNrm6O9vRjnDRs1zUePZj0XMb+z7Vg
         qz6BxDFliUDLBcUjmB67ORR3FVHny5eI2VZmZ1/nJNJcyph34Tq2sTXM1pOpcBgV4NX3
         eWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787021573; x=1787626373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bjcs/pOZ08cE/dRMsQLU7rzeUl8ZNFGFfdNRoYL0AWQ=;
        b=GnFLl7vm1G+GbU1Z/G5WK1nDt76wep2QEYmLk0fsvtWHED4x/aMtKxs9gaOFBMpxZ7
         q08sk2pXZhLZwUQwUGYUP8YVAOPWk6b/NOMMuQN6EfBXNcBrZdf1zCrA8U7jrH7F+Bkm
         joHb/HeAHfFiw3KXIgSCBubr0Rt+pnIkZ+E8KHxAKKMKZjjnjNfhFDYd+EU+7jQ36Nm2
         14G4eJEvUbwy0VHry4FYWZKmIyVZYvNCY5RzKUHteYz3tW/mYVAeVc02HZp+j5y+iibP
         cD3skkmHSflGstVwYiN6y2un6W8AvBh69H4ZskcU9luEPiACiqZmE1YOyb1oWvftZGOq
         0oAQ==
X-Gm-Message-State: AOJu0YwQ5HZjHJ6sxGTJCb7mkA1ejlE+BwiavMdnNBQDM9zmf23Pf4rW
	QQxk5GmP7TlbKrPfhOH/kwCbwhK5Bl22tjFK9p/nE2fwyqBFbsi79JAQockBpVrW
X-Gm-Gg: AR+sD128h53r5foSgjUp2d1/bida4V8762fgaeZ0dkQ97PSe9anVgTQiRhomRQqr09F
	IwdND/hJOuHj+yUP/6aihDoAoYrwAykoKmJ1XYFIKlOopyixwvfM/OuDtVAw3J9UL7GzJ+fB22E
	3WpLgDIx9WuFexVsqr/Ums8lxnLDmzf36J/jArPtU9bM0d3kCY3BrFU3Jm/cyUuuJZgveBumU8z
	iTc07CVqkVods9QfsGDbFTp0Dz7/uo/la0m107pXkqCSeCTU/HbJx1QfJQiFym0HXUKqo4rLpfR
	ugekDNSrRO/KIflrU5lA2sgMAnfOnabrStJ6oQAC1Ht6Xg9t8GRyW5SCPqfClOvFrFLI/4+vl5P
	HV+72Yzm5mdDaNBwI341d/Q9jkpMwXpyEuYjOrVk9XkGR2YgVJgl+lx1Eml9oPBYeEXcB6jLPQr
	GgbdoTW9OvLjb5mUw+QLsdVL8AMvpgDD0CKpeZUsZXw/a3gi0Uf8yuFHs60e/9uUnITwScfgkIh
	Xu8MRTp2XZGQggLzo6Mrh0tX2+fUg/8
X-Received: by 2002:a17:90a:da8f:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-3933b95e327mr30350317a91.14.1787021573357;
        Mon, 17 Aug 2026 19:52:53 -0700 (PDT)
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
Subject: [PATCH v2 3/4] xen/arm: add i.MX8M platform support
Date: Tue, 18 Aug 2026 10:52:23 +0800
Message-ID: <20260818025224.4165503-4-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818025224.4165503-1-onlywig@gmail.com>
References: <20260818025224.4165503-1-onlywig@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1787021575-738BE2A1-CAC23869/0/0
X-purgate-type: clean
X-purgate-size: 6551

Add platform glue for the NXP i.MX8M family (i.MX8MP/MQ/MM/MN).

When Linux is used as dom0 a number of drivers make SiP SMC calls into
TF-A to manage hardware: GPC power domains, DDR frequency scaling, SRC
(M-core remoteproc), SoC info and NoC QoS.  There is no public
specification for these calls; the function IDs and their subfunctions
are taken from the vendor kernel call sites.

Forward only the specific subfunctions the hardware domain issues,
following the whitelist model of the i.MX8QM platform.  Where a service
has a fixed set of subfunctions (GPC, SRC, NoC) they are filtered; DDR
DVFS is left at service level because its reg1 is a frequency setpoint
rather than a fixed subfunction id, and the SoC info call is a read-only
query.  CPU frequency scaling is denied because the hardware domain
cannot make an informed decision, and any unknown function ID is
rejected.

Signed-off-by: Wig Cheng <onlywig@gmail.com>
---
 xen/arch/arm/platforms/Makefile |   1 +
 xen/arch/arm/platforms/imx8m.c  | 152 ++++++++++++++++++++++++++++++++
 2 files changed, 153 insertions(+)
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
index 0000000000..fcf01298d8
--- /dev/null
+++ b/xen/arch/arm/platforms/imx8m.c
@@ -0,0 +1,152 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
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
+#define IMX_SIP_F_CPUFREQ   0x1
+#define IMX_SIP_F_DDR_DVFS  0x4   /* DRAM frequency scaling */
+#define IMX_SIP_F_SRC       0x5   /* SRC: M-core remoteproc start/stop */
+#define IMX_SIP_F_SOC_INFO  0x6   /* read-only SoC info query */
+#define IMX_SIP_F_NOC       0x8   /* NoC QoS priority setup */
+
+#define IMX_SIP_GPC_SF_PM_DOMAIN    0x03
+
+#define IMX_SIP_SRC_SF_M4_START     0x00
+#define IMX_SIP_SRC_SF_M4_STOP      0x02
+
+#define IMX_SIP_NOC_SF_LCDIF        0x00
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
+     * domains, DRAM controller, M-core, NoC) or are read-only queries.
+     */
+    switch ( function_id )
+    {
+    case IMX_SIP_FID(IMX_SIP_F_GPC):
+        if ( subfunction_id != IMX_SIP_GPC_SF_PM_DOMAIN )
+            goto deny_subfunction;
+        break;
+
+    case IMX_SIP_FID(IMX_SIP_F_SRC):
+        if ( subfunction_id > IMX_SIP_SRC_SF_M4_STOP )
+            goto deny_subfunction;
+        break;
+
+    case IMX_SIP_FID(IMX_SIP_F_NOC):
+        if ( subfunction_id > IMX_SIP_NOC_SF_PRIORITY )
+            goto deny_subfunction;
+        break;
+
+    case IMX_SIP_FID(IMX_SIP_F_DDR_DVFS):
+        /*
+         * For DDR DVFS reg1 is a frequency setpoint index (or the
+         * GET_FREQ_COUNT / GET_FREQ_INFO query), not a fixed subfunction
+         * id, so it is not filtered here.
+         */
+        break;
+
+    case IMX_SIP_FID(IMX_SIP_F_SOC_INFO):
+        break;
+
+    /*
+     * CPU frequency scaling: the hardware domain does not see the whole
+     * system and cannot make an informed decision, so deny it (matches
+     * the i.MX8QM platform).
+     */
+    case IMX_SIP_FID(IMX_SIP_F_CPUFREQ):
+        return false;
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
+
+ deny_subfunction:
+    gprintk(XENLOG_WARNING,
+            "imx8m: smc: function %x: denied subfunction %x\n",
+            function_id, subfunction_id);
+    return false;
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


