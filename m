Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E27C61DC4
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:22:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400938.1636639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvV-0000jy-Tl; Thu, 27 Aug 2026 15:22:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400938.1636639; Thu, 27 Aug 2026 15:22:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvV-0000jW-Me; Thu, 27 Aug 2026 15:22:01 +0000
Received: by outflank-mailman (input) for mailman id 1400938;
 Thu, 27 Aug 2026 15:22:00 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbvU-0000XW-DJ
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:22:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbvT-003Nrj-QN
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:21:59 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905609-8faa-0a2a0a5109dd-0a2a4505b4fe-28
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:21:59 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905617-4cb1-0a2a45050019-d1558031d407-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:21:59 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-49954b88fffso19307055e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:21:59 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:21:54 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787844119; x=1788448919; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+mUEQMJI16BPjjRNAZdOqq3piDAydbHYBCLE/r0NMJk=;
        b=iiWPgwPYm4Qpky+c0ockvP8SnR12lzPdvYuQpUrbDs2Alyb4jrdAojslb8yNSkb89q
         iJ/GpfXvDobiG86Q3MZ3jipDIx3NvlpJc5vDN2hNhc6H2Fu015Y+jzsbaxZzr/YVLYZ0
         O6AN2T1I/ENDvTwMT06NHMEHFlKtjBdXysJ9OiorJPkl9A9ab2HTwTv4PswlfPYQ8iCK
         ttVx2ar3YKKH2n14AOGCL4vWD7lBzviOqZ1n/MhbXeKWruYMwCkmknbPLBCO4e6Z/G9n
         AYUz80mkN96tyjcPm/orZ+y6H9G7LHZ6sNtBulBLCbyqlpGSxqwwY8WpTFZImQy4XuIA
         LnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844119; x=1788448919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+mUEQMJI16BPjjRNAZdOqq3piDAydbHYBCLE/r0NMJk=;
        b=FOeI0GssIN8pIpCp8eezL+Hqm6Er/5zAhoG1ULtXxDzmoinNu82PuPMNAB3jCA5MZ6
         J1qO38X0+EeDzdPMbfEPG1c0pY7Fgab2ywBWbK8852lAQqIYpnedHLWNP9kf1ipPp0jd
         SSm5zdhEW9lIbjYpJ86FXTTYE7abUPMDP+GYpobIa9QJtLnm6QvVwCymlnxFmnka/MeT
         zjgBWEkg/rlkx6bYbcba+OdlIBYH4h9uJP8y8lLv0Gm5M+kiXOAvNdVyP+/HCn/RCZ3a
         zkLQ7H4MOsllgP6IgJhPIUW7FTtVxbsgS7WpE/22iOti3/2QUpG6joydIp7tCKfkExYO
         aBwg==
X-Gm-Message-State: AFuF++nDmkr6mQDKKFmV9gg6uMtCEWGTCtwyCThwayfSoOKLKgN2Sbn9
	lNiHhnbSZd0hhJ9J+87tVW2nBhkrSYS4+eIpdGrJlA7d+EVPvh7RrlCGmEC3qQ==
X-Gm-Gg: AR+sD13tITeHnzLMrNu0zbksMjSIA6dT7RoS2fYWp/Rfr3lKxDYqSperlMTpsyczes+
	hU8ch5pgB3RXc7zXkl5w4JM10/yqN6j29JpF0sKlgiyO7Jp0BMurFwoqv61YXEOYPad/qxKHsQQ
	Xw4Ky0cbadqPHbwhKbfl2r7NV7fDd45sJQQ0D+c53ni6NFG6wiI781ImRx91h1EiKaBlck4GOjE
	2fanmKIz8aADBx37pe8NwDbPzpxWfxe1SaFDEGrUYnQGaviQwM98utr6RHIgROqcKbNOL7qMZa4
	ctTYhRDR2hmSe7IBnYE0w1og22xBkBxyV9dAjfmL+xIaWtkm3CbwbVeK8oKlJk5x90eQ1GZL8Rj
	akV4UMNukf4fn4j5XNsBs999ubaXVXAkZ9e7Os9wI4sK7cGpTtIGwRUs3dHR5tBZz6ipAbyY3iT
	xPAG6KhIQ793GvHolrSAG2wfZFgqjy3tS/nL0XyDYUoDn9PJnm/9CRc8Vm066hcxUSGpx5TXvOo
	MiutI5XOUNh9UxooVGg8DQBqR3hk/QL
X-Received: by 2002:a05:600c:8901:b0:49b:5521:785d with SMTP id 5b1f17b1804b1-49b5530be2cmr85344635e9.4.1787844119222;
        Thu, 27 Aug 2026 08:21:59 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Zheng Zhang <zhangzheng@iscas.ac.cn>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 11/39] xen/riscv: add helper to check APLIC MSI mode
Date: Thu, 27 Aug 2026 17:20:55 +0200
Message-ID: <a36ddb794b06ec9b7c470d9e665126989f4db58a.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1787844119-73ABF2A1-270AB87B/10/73395122804
X-purgate-type: spam
X-purgate-size: 1612

Use convient helper instead of open-coding the things.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Rename helper.
 - Update the commit message.
---
---
 xen/arch/riscv/aplic.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 319a954f6f3c..b4c419755ac3 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -37,6 +37,11 @@ static struct intc_info __ro_after_init aplic_info = {
     .hw_variant = INTC_APLIC,
 };
 
+static bool aplic_msi_mode(void)
+{
+    return readl(&aplic.regs->domaincfg) & APLIC_DOMAINCFG_DM;
+}
+
 /*
  * The arrangement of IMSIC interrupt files in MMIO space follows a topology
  * defined by the RISC-V AIA specification. An IMSIC group is a set of
@@ -250,7 +255,7 @@ static void cf_check aplic_irq_enable(struct irq_desc *desc)
      *       If APLIC without MSI interrupts is required in the future,
      *       this function will need to be updated accordingly.
      */
-    ASSERT(readl(&aplic.regs->domaincfg) & APLIC_DOMAINCFG_DM);
+    ASSERT(aplic_msi_mode());
 
     ASSERT(spin_is_locked(&desc->lock));
 
@@ -281,7 +286,7 @@ static void cf_check aplic_irq_disable(struct irq_desc *desc)
      *       If APLIC without MSI interrupts is required in the future,
      *       this function will need to be updated accordingly.
      */
-    ASSERT(readl(&aplic.regs->domaincfg) & APLIC_DOMAINCFG_DM);
+    ASSERT(aplic_msi_mode());
 
     ASSERT(spin_is_locked(&desc->lock));
 
-- 
2.55.0


