Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C151FC5DF7E
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 15:40:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394295.1633126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwLuv-0003xp-TV; Tue, 18 Aug 2026 15:39:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394295.1633126; Tue, 18 Aug 2026 15:39:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwLuv-0003xi-Ph; Tue, 18 Aug 2026 15:39:57 +0000
Received: by outflank-mailman (input) for mailman id 1394295;
 Tue, 18 Aug 2026 15:39:57 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <onlywig@gmail.com>) id 1wwLuv-0003xc-CX
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 15:39:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwLuu-00HSrn-5e
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 17:39:56 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <onlywig@gmail.com>)
 id 6a847cc0-e002-0a2a0a5209dd-0a2a4509d81a-18
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 17:39:56 +0200
Received: from [209.85.214.182] (helo=mail-pl1-f182.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <onlywig@gmail.com>)
 id 6a847cca-be1a-0a2a45090019-d155d6b6cd7a-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 17:39:55 +0200
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2d58efc7356so29588125ad.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 08:39:55 -0700 (PDT)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net.
 [125.227.154.99]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3954d2de41dsm6247737a91.5.2026.08.18.08.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2026 08:39:53 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787067594; x=1787672394; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=llSGcMbfo3K/AzLAPUD4hx170m1T96Ika40zCHvxGzw=;
        b=LUKXlw+B2PmKLjEmxuxFAY06appfoyqc+iY9lmHzhSLPVLhoMbZOrcy8xeJiTGGECE
         x2p8V8CLnAKgBV8D5SXuTkmyGsr7a78S6XOmvpO1uqXa2XNefyCmPGcYUYP4R8lpLr2R
         NQ/HUYP4pW+DczZJpREdQTXUYnTXxBb13aXfTw1/ppMYjW8gMTkOMvWXw9OatVEInWfb
         9EDxZXfDUuxxJlOrO7yhV1aVcxVSeF8IzQwYhcQFYHyGWBT1m7j49LeAbAUaDc7Z89y4
         BIrrQLlQqoTXjDx//alxhQTCo2NoYGhMImf7bnGmVi1weJEyyR1wzvxLAfYV4rCZ8D61
         jIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787067594; x=1787672394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=llSGcMbfo3K/AzLAPUD4hx170m1T96Ika40zCHvxGzw=;
        b=WpClA4YwesruFTy/WYi0GQDUXuRBI5bbzWq4GUVVVCdpfVRWSLL29ER5LjOCn+Qsoj
         TriZGK6c2sWQoU/zg2y9joQfrrkowmEBFWLNmVNskTn2ptYDaLpKGQ0YfBpFmle+Bb2H
         XkCCyjaT0BG9WNCYV9GE6Dwx8kNpLz2U2gsrbSLA2xovkKjjAlu0ZtzhiP8vL+eQHexR
         NHzO0oDP0G9850yilm5SJgquRH2/HwZfVYB72u6BFlBmmGMU8f65IQWlAFukWELqxciX
         29b0fC5ucCJrr2+aEHn70tb5H1sv1EguwVd6Xy/zL2pZD08JSWzNX2ElpqrUiN8SUmzC
         4SkQ==
X-Gm-Message-State: AOJu0YwBmrsFyw4v4nP/5Hz9GiCSgYjNjsQjPjcd9TolVJp4GmyZXsjd
	nGgimm5LiywPzs6se57q7ERKEEsGSbF1tEHrMzkzUFcp09EplZ4CzKWZKuKxt671
X-Gm-Gg: AR+sD13sLuqAi7gn5rc321Hf8yFMccOMW29waCNA0lRXP77xP9pNlviTNHEHd0gnPOO
	iyjY+6yJ5kzxsldXgY8x2vGkSkwlhHHQmMSUFlT0YZOPBKOKxsBBKtARVUJpufzNkTODs8AX1J5
	D4JhyajwgBhSMRjXvvEW90qugc+IIST3s1Wt4ubD2RM1qp2RxUDnw80WHPZKZjA8Nq2oCBrb1tD
	UJszEx9qwLn/3o5eCdmHCFtBuTh3FDJaSEeNoVcp+q8yDNvDzE+yQctW/kyFJJiGCvHWi+tq5/c
	v86ruL4+Y1rsomnfCOjsuEufjp/dRuxjdHvCJhGY8qHn/chLEKRB1j7+/iOjy+mpLDNzpz/H4df
	1jpdQFAI1luJRL0uURT29VBxf196YSG3/M6FnMnANZSQ4uYc5YhLtrJOek3+6k3YbJwQ/MT2lQS
	5V7YFfE4kURDXs1lavS2tbhO0Fg3gITbefNq30HDu9qkQM3Ai76QXYnbT+kKLASrtkG/dqN7WQq
	ER/ndbXGyRFYCpyilHTiIqTR20Rrylm8meIXOQB2ZY=
X-Received: by 2002:a17:90b:17d2:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-3933e60c1damr34155541a91.14.1787067593849;
        Tue, 18 Aug 2026 08:39:53 -0700 (PDT)
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
Subject: [PATCH v3 0/4] xen/arm: add i.MX8M platform and UART support
Date: Tue, 18 Aug 2026 23:39:42 +0800
Message-ID: <20260818153946.1635464-1-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1787067596-FDC6D034-2C5F9CEF/0/0
X-purgate-type: clean
X-purgate-size: 3303

Following Michal Orzel's review of v2, this series adds Xen support for
the NXP i.MX8M family (i.MX8MP / MQ / MM / MN).  It provides the console
UART driver, its early printk, the platform glue (SiP SMC whitelist for
the calls the dom0 kernel issues to TF-A), and a MAINTAINERS entry.

Tested on i.MX8MP (4x Cortex-A53, GICv3) with the vendor kernel 6.18:
dom0 boots to login on the hypervisor console, and a domU starts with a
PV disk and virtio devices running a full Wayland distro.

Notes for reviewers:

- Unlike i.MX8MQ, the i.MX8MP device tree uses the GIC as the root
  interrupt controller (interrupt-parent = <&gic>), so no device-tree
  workaround is needed and power domains keep working.

- The i.MX8M family has no SMMU, so device passthrough relies on the
  1:1 direct-mapped hardware domain.

- The SiP SMC whitelist forwards only the specific subfunctions the
  dom0 kernel issues, extracted from the vendor kernel call sites.
  Following the v2 review, CPU and DRAM frequency scaling are now both
  denied: the hardware domain cannot make an informed decision about
  resources it shares with the other domains.  dom0's i.MX8M DDRC
  devfreq driver issues the DDR DVFS call at boot; with it denied that
  driver just skips DRAM frequency scaling (the DRAM stays at the
  frequency set by firmware) and dom0 boots normally.

Changes since v2:

Patch 1 (UART driver):
- Add imx-uart.c to the Arm MAINTAINERS section so it falls under Arm
  maintainership.
- Gate serial_tx_interrupt() on TRDYEN; USR1_TRDY is a raw status bit,
  set independently of whether the TX interrupt is enabled.
- Print the IRQ number with %u.

Patch 2 (early printk):
- No code changes; picked up Michal's Reviewed-by.

Patch 3 (platform):
- Include <asm/regs.h> for get/set_user_reg().
- Add a description for the CPUFREQ function id.
- Drop the unused SRC M4_START and NoC LCDIF subfunction macros.
- Order the switch cases by function id.
- Deny DDR DVFS as well as CPU frequency scaling (same reasoning),
  rather than forwarding it.
- Return false directly on a denied subfunction instead of goto plus a
  redundant printk.

Patch 4 (MAINTAINERS):
- No changes; picked up Michal's Reviewed-by.

v2: https://lore.kernel.org/xen-devel/20260818025224.4165503-1-onlywig@gmail.com/

Wig Cheng (4):
  xen/char: add classic i.MX UART driver
  xen/arm64: add early printk for the classic i.MX UART
  xen/arm: add i.MX8M platform support
  MAINTAINERS: add myself as reviewer of i.MX8M related patches

 MAINTAINERS                           |   8 +
 xen/arch/arm/Kconfig.debug            |  12 ++
 xen/arch/arm/arm64/debug-imx-uart.inc |  37 ++++
 xen/arch/arm/include/asm/imx-uart.h   |  57 +++++++
 xen/arch/arm/platforms/Makefile       |   1 +
 xen/arch/arm/platforms/imx8m.c        | 139 +++++++++++++++
 xen/drivers/char/Kconfig              |   8 +
 xen/drivers/char/Makefile             |   1 +
 xen/drivers/char/imx-uart.c           | 233 ++++++++++++++++++++++++++
 9 files changed, 496 insertions(+)
 create mode 100644 xen/arch/arm/arm64/debug-imx-uart.inc
 create mode 100644 xen/arch/arm/include/asm/imx-uart.h
 create mode 100644 xen/arch/arm/platforms/imx8m.c
 create mode 100644 xen/drivers/char/imx-uart.c

-- 
2.43.0


