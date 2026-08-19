Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6B2C5DF81
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 15:28:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1395586.1633911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwiDP-0003qM-1R; Wed, 19 Aug 2026 15:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1395586.1633911; Wed, 19 Aug 2026 15:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwiDO-0003qF-Uv; Wed, 19 Aug 2026 15:28:30 +0000
Received: by outflank-mailman (input) for mailman id 1395586;
 Wed, 19 Aug 2026 15:28:29 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <onlywig@gmail.com>) id 1wwiDN-0003ow-GW
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 15:28:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwiDM-00FCv4-TY
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 17:28:28 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <onlywig@gmail.com>)
 id 6a85cb81-e002-0a2a0a5209dd-0a2a45079170-38
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 17:28:28 +0200
Received: from [209.85.215.180] (helo=mail-pg1-f180.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <onlywig@gmail.com>)
 id 6a85cb9b-b4ea-0a2a45070019-d155d7b4bd9e-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 17:28:28 +0200
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-cc1469c1b83so1231314a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 08:28:28 -0700 (PDT)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net.
 [125.227.154.99]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-851d3617434sm787575b3a.29.2026.08.19.08.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2026 08:28:26 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787153307; x=1787758107; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gURzRJNpCSIB7YbDliLuIS2za+vACAoh58p0svjXRV4=;
        b=iNMcwqjP3Utj54zOzdc60guVMJbGhSUMIskBOG49MZ+YdtVV+pGqpiMZjuLjyiBPxO
         xbfzhVmDbEnOctILZUzZ0fjov3HBwbvKpsO3rviLO0UE+7VM/YhDYgRFeovG/Z8xvoyu
         Kq8ZEDcxJqFgBfZ3Oavt2SQzVWX2m9FrAjzzPOcRXcsCanEr2OrM2aZzRJ8IkNsxgNkz
         HWT/NiqWGml5+uZo4vmLHadAJqRcT9k5C3+nMAcnjI5W/qkxfVHMSR6kE7Qo1NmvC8xD
         DlxdFU4bWrJcS6swQY81ZhL5xhexOMBKtd6Dddn7SdUE7CBh4G9ce16rplKMrIYWJgpF
         KDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153307; x=1787758107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gURzRJNpCSIB7YbDliLuIS2za+vACAoh58p0svjXRV4=;
        b=VGa5Irmyh9XneO27cIwmypMtpWpgmvDWLG3BjiD6bJwyN7V/wUGJHXGeRA0jAfMxFL
         +wTXYIkbHbhsVLozIOiLcjE2F/JLAw3Pi3DuH9nVfyCe+Q1OD2hpkIuQALsTd1jx1d3b
         ORwdbCeeE+UOiR3QZhKzMOMxSuledxQvjpdUE29kqycz0vBQ6ZSIvKkgrpWF9K54Ly7t
         tbF8/HGMHG5fl69fxLBccEaFUdFWQQWzvtr+Ve7OZNBsiztO8FbPX1G88NZsN94lEKhR
         etghwwwzNWc+uGzaUwihGosvCQtmb9izXdeHoFVeNK0O5FPelTDKrfUu7QecAnMoDdFR
         Vfgw==
X-Gm-Message-State: AOJu0Yzi/D0HbFpWV9AoBHApvrdOZQgIs0XDHylX2HWBdsu1h9VDLl0g
	aR8wmc3tCYoKFS7L2ed+Vr1XTpF+eqRkL7rP2Zlke0c4AGu02sW0dHXrzxCwbdn4
X-Gm-Gg: AR+sD11xwBvnAWbdpw/GpQdi3spgoGzb5TxAbM1I8xxdA6e/oxkayy70HsfBhB5R7jx
	ZfPVvyGi1vUClPbLUUwiA1CU7H5hgL4uF+2iJzCJtlss48jVRm3nyOnz19w7cAVBTKSYamd6eCp
	YzsF1l+XZcfrNyeQTtx+vXCUBIO6R9INYOXOUWNh8WI2/SIoBYi+4RLAcgdux4xIHiuU5kpGBhe
	v1UESxBVJ+KUynuRjLwxfTlqH7juLBIGHfrPPcm1HJXQghJUR50OzRqzQ32bSRTYS0u7OXC2O2c
	blKycQPJbqJqkBFRvjfuiIyPBl0KP6QdNoxv5pZBv4+ILXVCU2HCPlSf9AcFUC8TeLt1/75uDXU
	/AwZFzJN0K17gQ9F608ExV48eqkUgV4snw6B18+tDgjTL5020HeM5SiDMuiCWoy+K5KvmkUI++5
	tNJKu6ngPIOTp0PmfKs9Cxq2jYSm5X4rUEqdKTHyz/u2/8XbjGPxNcUMqrkkpFXv/br+oZ2NeDe
	iWqX2E1czjchI2Zweyp5Pg2kbi93wXQuJJSmmRaqZI=
X-Received: by 2002:a05:6a00:4009:b0:848:4754:28e4 with SMTP id d2e1a72fcca58-851d3a93294mr10104827b3a.15.1787153306718;
        Wed, 19 Aug 2026 08:28:26 -0700 (PDT)
From: Wig Cheng <onlywig@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Michal Orzel <michal.orzel@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	John Ernberg <john.ernberg@actia.se>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v4 0/4] xen/arm: add i.MX8M platform and UART support
Date: Wed, 19 Aug 2026 23:28:17 +0800
Message-ID: <20260819152821.3361898-1-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1787153308-37AD0AE4-8276DB7D/0/0
X-purgate-type: clean
X-purgate-size: 2814

This series adds Xen support for the NXP i.MX8M family (i.MX8MP / MQ /
MM / MN).  It provides the console UART driver, its early printk, the
platform glue (SiP SMC whitelist for the calls the dom0 kernel issues
to TF-A), and a MAINTAINERS entry.

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
  dom0 kernel issues, extracted from the vendor kernel call sites.  CPU
  and DRAM frequency scaling are both denied: the hardware domain
  cannot make an informed decision about resources it shares with the
  other domains.  dom0's i.MX8M DDRC devfreq driver issues the DDR DVFS
  call at boot; with it denied that driver just skips DRAM frequency
  scaling (the DRAM stays at the frequency set by firmware) and dom0
  boots normally.

Changes since v3:

- Patch 3: filter the SRC and NoC subfunctions with an explicit switch
  that lists each accepted subfunction, instead of a range check
  (Michal Orzel).  The NoC service now accepts only the QoS priority
  subfunction, and the unknown-function-id warning also prints the
  subfunction id.
- Patches 1, 2 and 4 are unchanged; all four patches now carry Michal's
  Reviewed-by.

Per-patch changelogs are in each patch.

v3: https://lore.kernel.org/xen-devel/20260818153946.1635464-1-onlywig@gmail.com/

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
 xen/arch/arm/platforms/imx8m.c        | 161 ++++++++++++++++++
 xen/drivers/char/Kconfig              |   8 +
 xen/drivers/char/Makefile             |   1 +
 xen/drivers/char/imx-uart.c           | 233 ++++++++++++++++++++++++++
 9 files changed, 518 insertions(+)
 create mode 100644 xen/arch/arm/arm64/debug-imx-uart.inc
 create mode 100644 xen/arch/arm/include/asm/imx-uart.h
 create mode 100644 xen/arch/arm/platforms/imx8m.c
 create mode 100644 xen/drivers/char/imx-uart.c

-- 
2.43.0


