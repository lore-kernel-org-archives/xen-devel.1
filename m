Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF56AC5CFC1
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2026 17:04:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1391298.1631187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuvKM-0004hb-3p; Fri, 14 Aug 2026 17:04:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1391298.1631187; Fri, 14 Aug 2026 17:04:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuvKM-0004hU-1B; Fri, 14 Aug 2026 17:04:18 +0000
Received: by outflank-mailman (input) for mailman id 1391298;
 Fri, 14 Aug 2026 16:25:48 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <onlywig@gmail.com>) id 1wuuj6-0008G1-C7
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 16:25:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuuj5-006hns-PA
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 18:25:47 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <onlywig@gmail.com>)
 id 6a7f416c-8faa-0a2a0a5109dd-0a2a45018f30-42
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 18:25:47 +0200
Received: from [209.85.214.181] (helo=mail-pl1-f181.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <onlywig@gmail.com>)
 id 6a7f418a-5984-0a2a45010019-d155d6b5d95a-3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 18:25:47 +0200
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2cab973140bso20226625ad.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 09:25:47 -0700 (PDT)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net.
 [125.227.154.99]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d3aeb29f62sm12585735ad.38.2026.08.14.09.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2026 09:25:44 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1786724745; x=1787329545; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hewASw0YES1004X+TmHWipBlBUBhlbOj1JEjiurEJeU=;
        b=ZzMyywEv0yOKF6G638s4nkMvRSO817PuQkiCV2BPsjqmGrB1dqBRhFYLtX8HUdCZ9c
         0jxInmAQ61f03FlrbTByPAgqSFyItPl8jVmT5Tt151Dkc+v3zsYN8tuaiM7gFVZKVPxM
         BCVL2Hk6+YFXoo7byl2/96rcNrdQoVGBhHE9Qo0KmvW1CNCiTMhoSDDAKoM08tZItt5I
         vHVPall/HHrCqGXuPJYN/xndCYOjsOTucQ1iknpz8RQq2crxMYREp2fuDlxVU9eOWpGx
         QD43Zfu9DF4Oa+WMOLWZ25xrLwKxYUVi4fDdBmKphtceoG0XYG+gwVSEUUYhoevUzZ+o
         q6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786724745; x=1787329545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hewASw0YES1004X+TmHWipBlBUBhlbOj1JEjiurEJeU=;
        b=NUGjEAgSumW+smhmtuZdunG3SZqjh3/EKX/YwNh33c70pW3lZs78YmX5plU60yFEEp
         7BKDw1x9kcbR8MItmlQlc/B9DxUH3l0aq30bORqarKukfbmYlP+BWeErCI/hzQ4uhRL5
         j75kgVqGyNlan5T/wlGhk74PP+qWZeyo5GqUl+rD4eJcTCnW42dfYvjmN5HWey/uhsnE
         w0iYouydcUkmawa/1VpkfdHC/Lj7g60KEyodot+khZ354cKDrsO5XC1KXT5Nl+wu0/ny
         SmSqcH9dkVbRYINT5ZAjPSTHjUr1xIYqWzJJy/YRIHfIUu0c1WI9ENDvwoNKuW6STabu
         mkWw==
X-Gm-Message-State: AOJu0Yyk1aEDZkLkou1JCgakowFYhgarsS1duBwL9VStBSKzj5nR/Mfg
	M/qIUc+/HD0WjwEWPSQZgAyDAJlkdn1iI81fU2iLaw3vTO4B/fYmw2AkQbDr2poQ
X-Gm-Gg: AR+sD12hsVvCrjVUHZ7uDo8IxM/i0ttGEwvSuI5GvSSjRIBTvI4u9CWgiUiktOCe/QZ
	R+N8N8a5BaR+K+lwytKxChlTabUiJPyij+L2R2Mrp9HTrOmRdsr2LhDwEKhk8ckHqZxNfxvz6d9
	iIxCFV029pqzq5y94svgV9WS40Njha4FdSj203gUTWaIYNqysZbp4sdc92xH0E8lCJCaUxrhTwM
	skGF+VzxAWw+OIWB74I1fwVJxV75pMxZhYCjgPJi34OrvYTyh3OzO6EUw/rPNNuLmwjZyZQAB8/
	maujVYLCoAFepHzjr+j66ET+yBNWRWhm96AUMZoKp86TodToOBuZSqy/f42txNDVii0OAGy/WE4
	fnSNrkFWmOB8V8qKlm/vn8N4HoQgF9yO1eR4U1gJ0waMX3su8g4+x8tZXVBPo0cAbBQ/RjR4/Lh
	xfPoago+Y1dQBV2tWRYtdTa5EJ+c5SKHyyktPVb6IKf5na2YLa/4X0PgNshKQOelJVF6GvzsC6t
	6mpUt7K1Lh3NlUBnsQqgdVnuDdusPp/
X-Received: by 2002:a17:902:d549:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2d3b0c6832dmr87106425ad.14.1786724745458;
        Fri, 14 Aug 2026 09:25:45 -0700 (PDT)
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
Subject: [PATCH 0/3] xen/arm: add i.MX8M platform and UART support
Date: Sat, 15 Aug 2026 00:25:32 +0800
Message-ID: <20260814162535.331459-1-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1786724747-1DC79757-D3965F9C/0/0
X-purgate-type: clean
X-purgate-size: 1901

This series adds Xen support for the NXP i.MX8M family (i.MX8MP / MQ /
MM / MN).  It provides the console UART driver, its early printk, and
the platform glue (SiP SMC whitelist for the calls the dom0 kernel
issues to TF-A).

Tested on i.MX8MP (4x Cortex-A53, GICv3): dom0 boots to login on the
hypervisor console, and a domU starts with a PV disk and virtio
devices running a full Wayland distro.  This addresses the concern
raised on the 2019 i.MX8MQ RFC that only a ramfs dom0 had been shown.

Notes for reviewers:

- Unlike i.MX8MQ, the i.MX8MP device tree uses the GIC as the root
  interrupt controller (interrupt-parent = <&gic>), so no device-tree
  workaround is needed and power domains keep working.

- The i.MX8M family has no SMMU, so device passthrough relies on the
  1:1 direct-mapped hardware domain.

- The SiP SMC whitelist forwards only the function IDs the dom0 kernel
  actually issues (extracted from the upstream and vendor kernels);
  no call outside the whitelist was observed at runtime.


Wig Cheng (3):
  xen/char: add classic i.MX UART driver
  xen/arm64: add early printk for the classic i.MX UART
  xen/arm: add i.MX8M platform support

 xen/arch/arm/Kconfig.debug            |  12 ++
 xen/arch/arm/arm64/debug-imx-uart.inc |  39 +++++
 xen/arch/arm/include/asm/imx-uart.h   |  62 +++++++
 xen/arch/arm/platforms/Makefile       |   1 +
 xen/arch/arm/platforms/imx8m.c        | 116 +++++++++++++
 xen/drivers/char/Kconfig              |   8 +
 xen/drivers/char/Makefile             |   1 +
 xen/drivers/char/imx-uart.c           | 227 ++++++++++++++++++++++++++
 8 files changed, 466 insertions(+)
 create mode 100644 xen/arch/arm/arm64/debug-imx-uart.inc
 create mode 100644 xen/arch/arm/include/asm/imx-uart.h
 create mode 100644 xen/arch/arm/platforms/imx8m.c
 create mode 100644 xen/drivers/char/imx-uart.c

-- 
2.43.0


