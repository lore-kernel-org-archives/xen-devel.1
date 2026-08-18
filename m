Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F62C5DF7D
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 02:53:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393344.1632143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ww9wV-0001Ja-Rr; Tue, 18 Aug 2026 02:52:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393344.1632143; Tue, 18 Aug 2026 02:52:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ww9wV-0001JT-PF; Tue, 18 Aug 2026 02:52:47 +0000
Received: by outflank-mailman (input) for mailman id 1393344;
 Tue, 18 Aug 2026 02:52:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <onlywig@gmail.com>) id 1ww9wT-0001JN-Mq
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 02:52:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ww9wR-00DVhL-Er
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 04:52:43 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <onlywig@gmail.com>)
 id 6a83c8af-bab6-0a2a0a5309dd-0a2a4508976c-22
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 04:52:43 +0200
Received: from [209.85.216.44] (helo=mail-pj1-f44.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <onlywig@gmail.com>)
 id 6a83c8f9-f659-0a2a45080019-d155d82cdc00-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 04:52:43 +0200
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-38de840f2f0so3438473a91.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 19:52:42 -0700 (PDT)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net.
 [125.227.154.99]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3954d3b40basm4333605a91.14.2026.08.17.19.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 19:52:39 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787021561; x=1787626361; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bQe/YNeMzslWflwKz05RqhD/PfB8cMsJmRD4V0ONpOI=;
        b=FEmlDpDYA5Clrp8wPHl/IFQ/IwHxtTqYCl2chyj6bUNYluKpaaYY3bxGSWj7+WG7Va
         7kHM4DMkcqZ6HVQnK9/bq9nY7iaZTwNR+P2Vj+zkZnCFQYvtaoSl5aNwwZ9+KR1W/tjb
         Z+XYnbhx7B1l2hbf/Zx9Uni30PW4Xv3HHQoTynxxP+w7B0C6E369/upcXUZvsvR8BzWQ
         Z8XMP31Czjp3t/Skm6ONeosXiu17aDSMsCv00YLAwltbek/QM4+LMlhC+U8ayWD16lKk
         ev5m70Zj9RX+ZvGqqmW9euhDH0gYQzTX6bfhKx1sjOT5OQUZ8s6GRvMtT80h+5m5GEkE
         haDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787021561; x=1787626361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bQe/YNeMzslWflwKz05RqhD/PfB8cMsJmRD4V0ONpOI=;
        b=YmgkU+s1BTN5yOPtF6uvIF9IrMFEaIffMyohusE6+pkZqJoa+/GRBYQ6fkuWVDDXto
         9gyffNesp9zTOu1/iiuVDYZnfx7bwiyehfI7eh4m60sXw033t6gnatlZUHzrtiJ3hXUa
         5pH05WcwAotzEAcK8muT729cWVFEpi8bfV/I+mEhrYpktgkERfBd/Qp/1gFAEho2thQK
         Xp7Q08v7V3qs2avnEUVxJEHrsYzIn2KksVJrzPjQWb4fENPICbiiV8rlMeM41cElaimd
         Y7G/jRmacxtAhtj/Yz5bWV+Y1FjiEnnnq4lIc+aSBYbY0AukjFA5+vJtoOuDxOEZazHN
         nbjQ==
X-Gm-Message-State: AOJu0YxLlpWdHyquKbgLnuf2Be6nerTDjs+u2b9iU911UzDLAMHRLrmV
	SNM8e7z+eHtyWApy30aSMkskEalFJ4EFYD5EkyHSZCOJe3AT+/OB1p+gdek9sUyq
X-Gm-Gg: AR+sD13atb2wJDzpF/DtM9F9xDHWUNfXkAQX90EJekbkPZyQE6EvmTbkx3LvdMH3sVJ
	MrgYannnEE0bmLHSyAEIvKT/kSgb8eTXfTXMDR2Y4fsealLnZGRV2zkMwOs2nwmcIlgdsOW2Uuq
	+puAVZH3w/kwquiLn97PDp1DvkCDFpb8XmDZ1FUHrk6q59qsbuqkVmaaYN/sYq73tQyjzPzj8b2
	Lx2bXINVwVJ2zByBKWM3SIYyVrNbfdOZIjCHPvHi+1rFeoKNX+aVeBUr1jy5m1j/fDhZ2TJCLGJ
	9yGtw+yZFLHXt/8V4E1B5dNhpGQDySJsgZy5UQX02i4qwNgWcsuDD9iHAjqMfc4MBVCUILupL/l
	c/TxJzjprwB6EH82LyOhmGscJopyqUUQ/3hP6sXHAiyRbP5HIEdVusvWuWOBxMoMvD31QepICbr
	676xgEwIYVACo+euJNhfR8AyPAfmLl3lwMWpIu7JaLPQWeN+B00Djto7ZmMC1CLMtQln6kNqnIz
	0au8Vv+obfhXEcmcSrmwve6YNv3EO6Bx1g9/KOkmy4=
X-Received: by 2002:a17:90b:5884:b0:38f:efed:5445 with SMTP id 98e67ed59e1d1-3933b7c3b7cmr32452216a91.4.1787021561039;
        Mon, 17 Aug 2026 19:52:41 -0700 (PDT)
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
Subject: [PATCH v2 0/4] xen/arm: add i.MX8M platform and UART support
Date: Tue, 18 Aug 2026 10:52:20 +0800
Message-ID: <20260818025224.4165503-1-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1787021563-D775B87B-0E7FC015/0/0
X-purgate-type: clean
X-purgate-size: 3115

Following Michal Orzel's review of v1, this series adds Xen support for
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
  DDR DVFS is left at service level because its reg1 is a frequency
  setpoint rather than a fixed subfunction id.  No call was denied at
  runtime.

Changes since v1:

Patch 1 (UART driver):
- Documentation narrowed to the i.MX8M family (dropped i.MX6/7).
- Relicensed the new files as GPL-2.0-only.
- Dropped the stale file-path lines from the file headers.
- Renamed the header guard to ASM_IMX_UART_H.
- Removed unused register/bit macros; header is now asm-safe (BIT(n, U)).
- Also clear UCR1_TXMPTYEN on init; documented that the console is
  driven entirely through UCR1.

Patch 2 (early printk):
- bne -> b.ne.

Patch 3 (platform):
- Build the SiP function IDs with ARM_SMCCC_CALL_VAL (IMX_SIP_FID),
  matching the i.MX8QM platform.
- Whitelist per subfunction (GPC, SRC, NoC) instead of whole services;
  DDR DVFS and SoC info kept at service level with a comment on why.
- Dropped the BBSM call, which is not issued on i.MX8M.
- Fixed the misleading "secure RTC" comment and a stray space.

Patch 4 (new):
- MAINTAINERS entry, as a separate patch.

v1: https://lore.kernel.org/xen-devel/20260814162535.331459-1-onlywig@gmail.com/


Wig Cheng (4):
  xen/char: add classic i.MX UART driver
  xen/arm64: add early printk for the classic i.MX UART
  xen/arm: add i.MX8M platform support
  MAINTAINERS: add myself as reviewer of i.MX8M related patches

 MAINTAINERS                           |   7 +
 xen/arch/arm/Kconfig.debug            |  12 ++
 xen/arch/arm/arm64/debug-imx-uart.inc |  37 +++++
 xen/arch/arm/include/asm/imx-uart.h   |  57 +++++++
 xen/arch/arm/platforms/Makefile       |   1 +
 xen/arch/arm/platforms/imx8m.c        | 152 +++++++++++++++++
 xen/drivers/char/Kconfig              |   8 +
 xen/drivers/char/Makefile             |   1 +
 xen/drivers/char/imx-uart.c           | 226 ++++++++++++++++++++++++++
 9 files changed, 501 insertions(+)
 create mode 100644 xen/arch/arm/arm64/debug-imx-uart.inc
 create mode 100644 xen/arch/arm/include/asm/imx-uart.h
 create mode 100644 xen/arch/arm/platforms/imx8m.c
 create mode 100644 xen/drivers/char/imx-uart.c

-- 
2.43.0


