Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709D9CA5FC7
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 16:24:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437544.1656472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6L-0003AY-Gp; Wed, 30 Sep 2026 16:24:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437544.1656472; Wed, 30 Sep 2026 16:24:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6L-0003AR-E5; Wed, 30 Sep 2026 16:24:13 +0000
Received: by outflank-mailman (input) for mailman id 1437544;
 Wed, 30 Sep 2026 16:24:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBx6J-0003AK-Vw
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:24:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBx6J-0073tv-Cn
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:24:11 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37a6-e002-0a2a0a5209dd-0a2a450ba504-10
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:11 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37ab-b7e8-0a2a450b0019-4a7de18dcc44-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:11 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e6b885ef8so33054485e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 09:24:11 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01cd43e66sm14620485e9.2.2026.09.30.09.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:24:10 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790785451; x=1791390251; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3BzXTGnWcfy6ALLYgep1c2vgCuLID+Lhul4DxE5IZxE=;
        b=KMKgdIT9YQ5/nIpVIY4AkSDyymOU3BWsMMBcCuyxGvGoZo28mJ93Gt4p3Cv8TnZqPM
         pBz5vKbWtelT9sgP6ftmqoJ9pohNp0LW8SMZXF5wus7ouh4XvZBJ60I5NaLFpOE+rWM0
         Y9kekywtncSmtqOtGxaIzCP2nHQb9mH//H/5+J26kdnjyA9QgDPj9EJCsaRwfeIIxWh0
         kqeFg8CCeKYB7Lxq6WeVIXXR78xoIzFwAutlstZErAvTnmTOJe6EO8xnnh4FUekqCs0V
         66SY5F2tLjvgsF7ppx/dyyDr4BxsZavVaoj2rTt9o4LOR2alFqkpgaAiZAca51YSeXrM
         7cxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785451; x=1791390251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3BzXTGnWcfy6ALLYgep1c2vgCuLID+Lhul4DxE5IZxE=;
        b=iyJ3ivmp9uOea9DFnQJitP/IxRu8ndxY5cAZ3kBfgU7gOAXfPGTkjl5lct21HS+WCA
         /yGYUI0LCXmvhq1FZ67rKBlwkHtiIrmUeXGB+GAz0uLu0GwCP48M5arVZqKjrQnG1sw/
         VxmWYWMkSYpsKWPcJ7FhU1HW19H00HKPiet7aP4lgni+E3y7LUPBNnSnyPo40e/xYykK
         zR/oGNt8i8ksMLEWHb2dzhgIEE53OQJk4lBhCIj1EdJb2FZ4dvEhe7NOCQzCWhIiDN5V
         Fvn7EifcQ8ipyMWMjjVaV/f4y/nEp75ZaISpvWx1s8FaowIhmo+VsVmCEcPisQzAQ0AT
         C1GQ==
X-Gm-Message-State: AFuF++nyUny+1POd0Uv7Y8uBzXnkJtvdb0Vp8qYBcYVBtz7hqaD00ZQs
	hWj3TyCfsbWARbmjSgcHBHA/ruywgtzerGRupNssNOmKjneYAxT8MBE5+wKdeg==
X-Gm-Gg: AYBFou2zu2+0xDti2GGp6Z6sIOfLBkIqhN2SisyfUf4I/yNTRtymNBIzJY8zyKU3qzo
	qZVH/HDmjVGACmGi0fUp7P2KtCflAvXsbWpAAaSCijUYb8/DDAVa41YqJ56leQqG0qMyoya4F7h
	wTo1ZYRviUww3Ylfm3A2skiXEL1C2Cu18dBrgw3ZK6R+65Y++752RwCryTEUsau4okoiLSOnVVz
	2h7xDPZGGXAXjYob4hvbw5M4rxo6TWnT6of9uVs9Yu/nJQNNjCCOD4p3jCzJ0wupi9/6QUpvK4K
	tVaTmHFgREF35EnC1rUHV3DM8svzFmpxl7UdwHzLSwdVRj79PmV/GQ66Hi8oNlQUokmo6qbM68p
	unnUTyYJe1t1/Dhsz2RPZtF3DFbIsFhVsKWUM/5qt79eHcifXPOqO9wERfRHfn/4XFOV1wlfGGd
	5YaRbQsH2A0Lv0/YLt2KIdtSEEUs9qW9hfSpdsRIjkMhX3Y6BBIgk0aoqRJ2V1Ffrn2ii5vf0wb
	wiMA9rIxGOLlwVBraPxP0U1ioilZv+TI5gWdeJj
X-Received: by 2002:a05:600c:3144:b0:4a0:1c0e:b2a8 with SMTP id 5b1f17b1804b1-4a01c0ecb6fmr27717895e9.28.1790785450819;
        Wed, 30 Sep 2026 09:24:10 -0700 (PDT)
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
Subject: [PATCH v3 10/39] xen/riscv: add helper to check APLIC MSI mode
Date: Wed, 30 Sep 2026 18:23:29 +0200
Message-ID: <2395aff35a311735f759b76728d7c09ce5f43fcb.1790779209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1790785451-1B2DC9EA-62212CE6/10/78276251493
X-purgate-type: spam
X-purgate-size: 1853

Use convient helper instead of open-coding the things.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v3:
 - Add Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>.
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v2:
 - Rename helper.
 - Update the commit message.
---
---
 xen/arch/riscv/aplic.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 62bbcc9afacf..60f5f239c394 100644
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
@@ -260,7 +265,7 @@ static void cf_check aplic_irq_enable(struct irq_desc *desc)
      *       If APLIC without MSI interrupts is required in the future,
      *       this function will need to be updated accordingly.
      */
-    ASSERT(readl(&aplic.regs->domaincfg) & APLIC_DOMAINCFG_DM);
+    ASSERT(aplic_msi_mode());
 
     ASSERT(spin_is_locked(&desc->lock));
 
@@ -291,7 +296,7 @@ static void cf_check aplic_irq_disable(struct irq_desc *desc)
      *       If APLIC without MSI interrupts is required in the future,
      *       this function will need to be updated accordingly.
      */
-    ASSERT(readl(&aplic.regs->domaincfg) & APLIC_DOMAINCFG_DM);
+    ASSERT(aplic_msi_mode());
 
     ASSERT(spin_is_locked(&desc->lock));
 
-- 
2.55.0


