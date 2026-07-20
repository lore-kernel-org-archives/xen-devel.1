Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31329C44515
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:02:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367142.1616967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqRu-0007sF-GY; Mon, 20 Jul 2026 16:02:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367142.1616967; Mon, 20 Jul 2026 16:02:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqRu-0007ru-AF; Mon, 20 Jul 2026 16:02:34 +0000
Received: by outflank-mailman (input) for mailman id 1367142;
 Mon, 20 Jul 2026 16:02:33 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqRt-0007m7-7Y
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:02:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqRs-001mtW-Kj
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:02:32 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e4690-2eae-0a2a0a5409dd-0a2a4502999c-12
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:02:32 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e4698-6ca4-0a2a45020019-d1558034c1fa-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:02:32 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4954aff6088so20295395e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:02:32 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49563eee22esm31331765e9.1.2026.07.20.09.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:02:30 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784563352; x=1785168152; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A6F9yb8UBT35/tqzXm+AhbL5wSjaP+QCKMU+T8wtsuc=;
        b=sJiN9+FiVPf58Ap0wISDMP8veZJQEv935yly0JpoCNPI1D4amWYuxXY1ox4p1fcbpb
         OZpVPL1fD6K9GtS6uYC2w40M0aaVG83MqceNoRoTaFDeO12PFHzs7MYoKypcr+qPUb2h
         hLsLsni8eO3jisNikUQIyaLvpj5/yg0ix3kl03hWAz6xbMSQ0Vi7fwJrZwLdQ7AiFROz
         9YWPtX7p6n+gDQYedkMiApRQBQ9oqtbl3yX6GpKXecJZRkP7dNCfjB1mQC5I5yLsqp7e
         h/wZ4NrrIyBe/smoSjz3A+3qJGQaJ1X16JhhHTbg7XElP9D+MfausiZ7feIoVnxtF17t
         rdbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563352; x=1785168152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A6F9yb8UBT35/tqzXm+AhbL5wSjaP+QCKMU+T8wtsuc=;
        b=phc1aVnYjP5s9VLKJ/KL/KMwhF7gSQvnYr2Kk+LWaIX4i5EHA2N2gnaXazb2zUi/Wt
         xEHodbtKv9/SkPoSv49vs1ZB6yUsoJsUkpYl1C65wm4OSo2oyrwFvt0ozHzkQJPc87ZI
         TOln8UYTLrGkn5mvgYqojqRQHwjEEPGbj0/N5d6zcF3FzQEIGpLRwA53cV4TajPOdw2m
         sDUciMlT3S0VznsBIEPv0veMfD4e7BgdxLYsWUEn9R3xLcc9phIMJUZWvSmgquu24R47
         nm8Gt+M+ZnsaEnSXZ1w2+66+jf+qWvCwQP/FNxiAJAO0MrEDwHS/ejTM9hPYaWofpn/8
         5l/g==
X-Gm-Message-State: AOJu0YyAoEB6Kr06pKwiZtWg9ZG6/pPC3AnYV87aiK8mWxAYQtc3faWW
	5Do+S37Vy6MNas/72vsQbIUaJMMHijQMt62nsoaHZLSwBW4Gw7LCOSdiabpPmQ==
X-Gm-Gg: AfdE7cmtpAYwPwcjrcLJFLhAXvu6PDfK+r1jQaGMD3+Ug29Nuxfe/6pljrdzxm4Ff3s
	0ELAMr0mVsQWXwjY7Nlch184MlNJ+rWCwOBlA48gtcagoWhfIGunS73RmOk/H2sLbdnyDEhE+Ae
	k0YJ6PHVLChKrBTHKw2bEnZ0b47tXjrZsieWoi1OoLJUhGygm5yj0y35rwjglzvy1XnFujCgMCf
	Xn+ULYtOe7wrjjHl6irCNY8BhQPcureLVpghVpNoSlpI1rer4quis7TofqgiYEdJl0IVyUL99+m
	YWm2NZfNiu2DYE72Mvgg+ZNMh9UlJR9NdHbmzCD5jXI7o0BqEnKRm6J8+oTY+4icci17nhnIaGT
	RGNvHKGAizLF8mQKLgkcMYCvHcPla/6TR5wvSALLw/5uhzFmDD1zGUPyt60FGWmhmwDS2ZDcfae
	YAPmziiofcdYPP3hGnoAmmd+gyZChI0dg2QAdwqaBMEie1bHY=
X-Received: by 2002:a05:600c:198b:b0:495:5044:d37d with SMTP id 5b1f17b1804b1-4955044d4e8mr116785745e9.19.1784563351799;
        Mon, 20 Jul 2026 09:02:31 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 03/17] xen/riscv: add missing APLIC register offsets, masks to asm/aplic.h
Date: Mon, 20 Jul 2026 18:02:01 +0200
Message-ID: <ee3825adfd0012437a594f6a0e51c6ee71175cc4.1784560663.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784560663.git.oleksii.kurochko@gmail.com>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1784563352-F32B12AC-872315EA/10/73395122804
X-purgate-type: spam
X-purgate-size: 2760

These definitions are required for correct decoding of APLIC MMIO
accesses and target configuration, and will be used by both the
physical and virtual APLIC implementations.

No functional change is intended by this patch; it only centralises
hardware definitions that were previously missing.

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Drop APLIC_TARGET_IPRIO_MASK and APLIC_TARGET_GUEST_IDX_SHIFT (unused).
 - Add comments to each register field group (domaincfg, sourcecfg, target).
 - Group APLIC_TARGET_HART_IDX_SHIFT and APLIC_TARGET_EIID_MASK together
   under /* target register fields */ at the top of the field definitions.
---
Changes in v2:
 - new patch
---
---
 xen/arch/riscv/include/asm/aplic.h | 35 ++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
index 07318aaac25d..f22622b9a23f 100644
--- a/xen/arch/riscv/include/asm/aplic.h
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -15,6 +15,8 @@
 
 #include <asm/imsic.h>
 
+#define APLIC_REG_OFFSET_MASK   0x3fff
+
 /*
  * domaincfg read-only fields (AIA spec):
  *  - bits [31:24] -> read-only 0x80
@@ -25,6 +27,7 @@
 #define APLIC_DOMAINCFG_DM      BIT(2, U)
 #define APLIC_DOMAINCFG_BE      BIT(0, U)
 
+/* sourcecfg register fields */
 #define APLIC_SOURCECFG_SM_INACTIVE     0x0
 #define APLIC_SOURCECFG_SM_DETACH       0x1
 #define APLIC_SOURCECFG_SM_EDGE_RISE    0x4
@@ -32,7 +35,39 @@
 #define APLIC_SOURCECFG_SM_LEVEL_HIGH   0x6
 #define APLIC_SOURCECFG_SM_LEVEL_LOW    0x7
 
+/* target register fields */
 #define APLIC_TARGET_HART_IDX_SHIFT 18
+#define APLIC_TARGET_EIID_MASK      0x7ff
+
+#define APLIC_DOMAINCFG         0x0000
+#define APLIC_SOURCECFG_BASE    0x0004
+#define APLIC_SOURCECFG_LAST    0x0ffc
+
+#define APLIC_SMSICFGADDR       0x1bc8
+#define APLIC_SMSICFGADDRH      0x1bcc
+
+#define APLIC_SETIP_BASE        0x1c00
+#define APLIC_SETIP_LAST        0x1c7c
+#define APLIC_SETIPNUM          0x1cdc
+
+#define APLIC_CLRIP_BASE        0x1d00
+#define APLIC_CLRIP_LAST        0x1d7c
+#define APLIC_CLRIPNUM          0x1ddc
+
+#define APLIC_SETIE_BASE        0x1e00
+#define APLIC_SETIE_LAST        0x1e7c
+#define APLIC_SETIENUM          0x1edc
+
+#define APLIC_CLRIE_BASE        0x1f00
+#define APLIC_CLRIE_LAST        0x1f7c
+#define APLIC_CLRIENUM          0x1fdc
+
+#define APLIC_SETIPNUM_LE       0x2000
+
+#define APLIC_GENMSI            0x3000
+
+#define APLIC_TARGET_BASE       0x3004
+#define APLIC_TARGET_LAST       0x3ffc
 
 #define APLIC_IDC_SIZE          32
 
-- 
2.54.0


