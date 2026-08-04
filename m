Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0181DC55838
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 15:48:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382271.1625688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHNZ-0000XC-0j; Tue, 04 Aug 2026 15:48:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382271.1625688; Tue, 04 Aug 2026 15:48:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHNY-0000VR-Oq; Tue, 04 Aug 2026 15:48:32 +0000
Received: by outflank-mailman (input) for mailman id 1382271;
 Tue, 04 Aug 2026 15:48:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wrHNX-0008SN-08
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 15:48:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrHNW-009QHz-CE
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 17:48:30 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7209c8-5cb7-0a2a0a5109dd-0a2a450bdaba-14
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:48:30 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7209ce-b7e8-0a2a450b0019-d155802cd52a-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:48:30 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so21020405e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 08:48:30 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49949fcb46esm116430355e9.5.2026.08.04.08.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2026 08:48:29 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785858509; x=1786463309; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ER+uu35/NuCBQKkMFT6UQDxN44ZmROCjZqSQxG2REVI=;
        b=F54137HGfFFkXinnUZXnS7aXsO5/c6pfNP0uqQi3BtZ/TxB4/ncciWBE/X9lnMeKvB
         aMkKUTdvllYkgyFLEBUQoyEcv9SAqEab47Ltz6PwZklfEU+Gh5WGm4xpOjU6Riqi92/Y
         lzdAPinMymdF8+Ol5l3B4QI4OSu/5tFPFTb7/zti6Lgkb7CJVFpynTuDfWJvXRJtJpPT
         EpbQ3hzv3uHF6liBeGRaQMwS3NoYM927o/RMhg7NPddHzBWX/6GQ8bcxxOTdeea7RZQR
         cwQpCfHM5iyA5YyoYiE/PXceSrNvhNjWE7IaalLFjcTW2PPt4ZrSD6fN37j/RQ6zrBL4
         UZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785858509; x=1786463309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ER+uu35/NuCBQKkMFT6UQDxN44ZmROCjZqSQxG2REVI=;
        b=esN7SLpwAfrVa+6ydYijbtIrQ18+8cAZ3pVvoQqqiw2rLb1oKedSHz3YyuEtV5MkxN
         LCc+jtLi08PcD1qersDP0irsbMxbfVZFWmbf2XjkjoAxtl+KZmlhrhmJodoLIBUVAuQt
         QxhBSn9Zj40IoASGll/9Am8QDQYhXo8H3ic6K6KXJ0SkCP5MFNGGiWbCyQF6JDZFKHEn
         H8rsE2nzBz1C6xDldz2u7jL8gfKZlzuSgfpADnNOBSX7QscaVHSf8nnBiEsS4MDb8Z81
         wHM0JH5nTrQqTJzzBQW6NpqMq7vlG3hXz3EsqRXTtLG+o0d+UaCHHwWUJDScJmCy/hNn
         t2AQ==
X-Gm-Message-State: AOJu0Yy/fUALqaYi7mZNFBz0hkhqbnNnHvdkLQIhNfbvbSHu2mDd8hgl
	szYiFtQ5ykDmDs1P6USpfgaDPdbtmY3o6qrECDo6MTjaduNitfKwkarqhUIyXQ==
X-Gm-Gg: AR+sD10yWPMyOlfN3rVnNMaO1XZl2aCyosP5EsIdAXwb4kXBvuTHFmxnv/9nMEwXfoP
	jP/6mYYmjMZm7sxIvrKfcDIeRa10D5kRXwr/yAqMEdaU6r5i2wWJUN6iBDZHlmplMvZ6rGN+wUE
	kozU7YyEfrcVJ/c5BpG3czrqX0fjCn4QFBPRofQQYRmj2Yya9bTyRwgGbesdanajBGGxPdpXYVN
	PwAE57cEpP/vzvIo7cjcf2gJRJAfIX1e6b2FZds5V9D5O3B1qpXjhzAzup5FGYVH7oGgyKcvBj9
	bxOXJ9yrfjzxKxoGc9RK3E8o5old9Q70FB1MmeA5nA5WajwpTRSYcl+FxoDwsIONphTv79QHDod
	eZb5+gaQXRoHwin38+JgRYtJrlVinUod+Abmo52KtHpg9MXhELqoNYzkOmg851WcWtn6daTwmJd
	g7sXrLuWlya+j2VYCJF/A/VHkO3y8pjpFoPTicK9e0Y3+lSVW40T9xJYl7e4vid2cMRGDOky4EO
	eYFg7rb1tfAZmO8sRzOMox77RkIOrbaUD5h2Hbh1qOn
X-Received: by 2002:a05:600c:3550:b0:495:607e:5ee7 with SMTP id 5b1f17b1804b1-4980c679513mr352247215e9.17.1785858509525;
        Tue, 04 Aug 2026 08:48:29 -0700 (PDT)
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 09/20] xen/riscv: implement make_intc_domU_node()
Date: Tue,  4 Aug 2026 17:47:59 +0200
Message-ID: <17901dd6707a12daef4aa1200c01fc1e0a754f63.1785836421.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785836421.git.oleksii.kurochko@gmail.com>
References: <cover.1785836421.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1785858510-AA2C49EA-10D82817/10/73395122804
X-purgate-type: spam
X-purgate-size: 3439

Introduce a RISC-V specific function to create an interrupt controller
Device Tree node for DomU domains during dom0less build.

Add make_intc_domU_node() to the dom0less build path and wire it to
a new generic helper, intc_make_domu_dt_node(), which delegates DT
node creation to the active interrupt controller implementation via
vintc_init_ops.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v5-7:
 - Nothing changed. Onlye rebase.
---
Change in v4:
 - Made local variable vintc pointer-to-const.
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v3:
 - Use const struct vintc_init_ops *init_ops in struct vintc.
 - Drop redundant intc_hw_ops check in make_intc_domU_node().
 - Drop NULL pointer checks in make_intc_domU_node() as we can't start domU
   without properly created interrupt contoller node.
---
Changes in v2:
 - s/intc_make_domu_dt_node/make_intc_domU_node.
 - introduce separate intc_hw_init_ops structure for init operations.
 - Return -EOPNOTSUPP instead of -ENOSYS.
 - Drop const for kinfo argument as it could be changed by interrupt
   controller node creation code.
 - Refactor make_domu_dt_node().
 - Make make_domu_dt_node part of vintc structure as it looks more logical to be
   there.
---
---
 xen/arch/riscv/include/asm/domain.h |  2 ++
 xen/arch/riscv/include/asm/intc.h   | 10 ++++++++++
 xen/arch/riscv/intc.c               |  8 ++++++++
 3 files changed, 20 insertions(+)

diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 8ae01a5e4dcc..bd43ed08c22c 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -97,6 +97,8 @@ struct arch_domain {
     struct paging_domain paging;
 
     const unsigned long *isa;
+
+    struct vintc *vintc;
 };
 
 #include <xen/sched.h>
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index d7b34fc15ad1..a4e678fad90b 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -16,6 +16,7 @@ enum intc_variant {
 
 struct cpu_user_regs;
 struct irq_desc;
+struct kernel_info;
 
 struct intc_info {
     enum intc_variant hw_variant;
@@ -47,6 +48,15 @@ struct intc_hw_init_ops {
     int (*init)(void);
 };
 
+struct vintc_init_ops {
+    /* Create interrupt controller node for domain */
+    int (*make_domu_dt_node)(struct kernel_info *kinfo);
+};
+
+struct vintc {
+    const struct vintc_init_ops *init_ops;
+};
+
 void intc_preinit(void);
 
 void register_intc_ops(const struct intc_hw_init_ops *init_ops);
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index 3600d23bdb5b..e63da5e22efc 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -3,6 +3,7 @@
 #include <xen/acpi.h>
 #include <xen/bug.h>
 #include <xen/device_tree.h>
+#include <xen/fdt-kernel.h>
 #include <xen/init.h>
 #include <xen/irq.h>
 #include <xen/lib.h>
@@ -72,3 +73,10 @@ void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
     intc_set_irq_type(desc, desc->arch.type);
     intc_set_irq_priority(desc, priority);
 }
+
+int __init make_intc_domU_node(struct kernel_info *kinfo)
+{
+    const struct vintc *vintc = kinfo->bd.d->arch.vintc;
+
+    return vintc->init_ops->make_domu_dt_node(kinfo);
+}
-- 
2.55.0


