Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8860C44502
	for <xen-devel@archiver.kernel.org>; Fri, 26 Jun 2026 15:47:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1346294.1604856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8lo-000492-54; Fri, 26 Jun 2026 15:47:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346294.1604856; Fri, 26 Jun 2026 15:47:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8ln-0003yp-2j; Fri, 26 Jun 2026 15:47:07 +0000
Received: by outflank-mailman (input) for mailman id 1346294;
 Fri, 26 Jun 2026 15:47:04 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wd8lk-0003SW-Gj
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 15:47:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd8lj-00D1eP-T7
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 17:47:03 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9ef7-5cb7-0a2a0a5109dd-0a2a4505e2d0-6
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:47:03 +0200
Received: from [209.85.167.41] (helo=mail-lf1-f41.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9ef7-3cb2-0a2a45050019-d155a729b04d-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:47:03 +0200
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5ad58f31846so1048619e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 08:47:03 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ae9cd5b232sm2612888e87.29.2026.06.26.08.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 08:47:02 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782488823; x=1783093623; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ayLS/4Tj1pdUVipiDBa+IiAffN+x6DQ9eb41/7qATdY=;
        b=HEvLfG4D39IkI0Eb3HpoIhrttyISSxWWWkdiIO/N6ReJJ+6kyq0lFcTUtI5Wbt9zoU
         sZqgqD8aFI+LsvosqqA2jMDcSmUg9Ik5x19YiQyHhGHsafTTDchDUV+9yUckk/kG4JUS
         jRd91Fk1vv/I6kvke145Eki1j3+TNaoNICvINsOaxlROYivtw/FFKPrw5P2AyRUkyune
         lx9HpAhiIkQ+fiARJX4MoGH0tsh+9PysWC8jj17VXMq9HRtxbwlxNEA1Osa0MYa2lUIM
         YER0Qpkck8FrQU6EX3AM5K8bVadsQgj2nKvRLmDKgTtlzLjjeDoKSF5gScL2x9idN7oT
         9Blw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782488823; x=1783093623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ayLS/4Tj1pdUVipiDBa+IiAffN+x6DQ9eb41/7qATdY=;
        b=qIgpNVnzbQGKEsHu5IQJqn6Wgs7BjOTlIXaDFUHxIMw/kCowvbfLOQyi2e/bcjddrk
         /Pyq2YTFWwPO4Bmh0QRXSXPZLdQNI9KEeljSwS4QGGe45x8UgLCeccuCYXhaVCo9/mmv
         OjK6uQ2fcfl3dkkXouKW+9mk1jHnvPPKrFPlvjb3DRuyPm3dewmKBWyo8nc3Vyk8nNQ9
         Z+yTem38z5JCP0WPFJ8lsZIgGwRRma/mWF7mOmtbPy+Xina1FPRep9tQoTC/9GfeHT2O
         p83oFpD3LTNp5FAjAWYdMq+HbbVY3V0xyuKgMcyGPd9ZjFoQk2NBs1EbquohWhX7C+PC
         mKBQ==
X-Gm-Message-State: AOJu0Yz1xby/z2hx8TTV1RPjDB652zYt0Yp3QcnHwZA7r4rW+uZTRH66
	ZEj8NKo8wRTn+WmV8hN5rMd6RAw+6iXwL/xse3J5GDsrz0T8tbonox1T1h3Jcw==
X-Gm-Gg: AfdE7cllAcXOXwRmtfoVRP8RXDGslNTGMViIuSSs1qCh6zDVmNNLj+E8E3ZQ2SqJI9j
	Q8b2rX0xRzKdOqm1t0Gede0CN4xmhraoORzLOh+9VcwdpUFg34rQ/vZASG7/PUueSFmfYUSbn3q
	nJhLfI3sBfLh5okNeIP5oAkpW9tTh3MrySulFaaOaVbiVMuxlvjmPzhBnjH8X4BbS1fW7DKZVAD
	M2ZhknUFYKZcRAfClyM3ALkIHNDje6nG0h/Diwr2hwppJi47mbPtdoWtPBArNqB3R1Aw+Gj84iZ
	E4rLGeM31Va2u8cBOYuyKac8TmazHc99tv0j++aQBs41auMl8xZnRAoObhABX05KfHv+IPnA1wN
	X/z03FGjvLBzEDdTEecYwE3Q+H2TWum6MJkIR1PbeNLqSEFHA4sey0KLpx+vGXqhDBglpSuiKfb
	Me5DHM5583dTdYdksF0Kc3oIXHbBBXKkDfjbAZF36cZgLUIMt9DSAG+peeAA==
X-Received: by 2002:a05:6512:3983:b0:5aa:6e86:55e5 with SMTP id 2adb3069b0e04-5aea945b98emr249770e87.13.1782488822877;
        Fri, 26 Jun 2026 08:47:02 -0700 (PDT)
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
Subject: [PATCH v4 18/25] xen/riscv: introduce (de)initialization helpers for vINTC
Date: Fri, 26 Jun 2026 17:46:27 +0200
Message-ID: <ac0b9a985afc35023822150062b4f14f5a583bea.1782487661.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782487661.git.oleksii.kurochko@gmail.com>
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1782488823-17B192B8-1FB907BE/10/73395122804
X-purgate-type: spam
X-purgate-size: 3430

Add common helpers domain_vintc_init() and domain_vintc_deinit() to
allocate and deallocate a virtual interrupt controller (vINTC)
structure and initialize basic virtual interrupt controller registers.

domain_vintc_deinit() isn't called at the moment as arch_domain_destroy()
is implemented as stub at the moment.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - Drop the comment from domain_vintc_init() about guests receiving a
   virtual interrupt controller that mirrors the host hardware as there
   can (and eventually should) be alternatives.
 - Finish renaming intc_version to intc_variant in domain_vintc_(de)init()
   (enum intc_variant, info->hw_variant, local variable) started in the
   prev patch.
---
Changes in v3:
 - Drop redundant printk() from domain_vintc_deinit()'s default case to
   avoid duplicate messages when init fails.
 - Add a comment to domain_vintc_init() clarifying that guests currently
   receive a virtual interrupt controller that mirrors the host hardware.
---
Changes in v2:
 - Drop __init for domain_vintc_(de)init().
 - Update the commit message.
---
---
 xen/arch/riscv/domain.c           |  3 +++
 xen/arch/riscv/include/asm/intc.h |  3 +++
 xen/arch/riscv/intc.c             | 35 +++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 129e775c52cb..3499c25dcfe0 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -309,6 +309,9 @@ int arch_domain_create(struct domain *d,
     if ( (rc = p2m_init(d, config)) != 0)
         goto fail;
 
+    if ( (rc = domain_vintc_init(d)) )
+        goto fail;
+
     return rc;
 
  fail:
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index f7d42aa9fc40..62260155dc6b 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -75,4 +75,7 @@ void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority);
 
 void intc_handle_external_irqs(struct cpu_user_regs *regs);
 
+int domain_vintc_init(struct domain *d);
+void domain_vintc_deinit(struct domain *d);
+
 #endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index 2864a896b677..0eb7eb924e9c 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -11,6 +11,7 @@
 
 #include <asm/aia.h>
 #include <asm/intc.h>
+#include <asm/vaplic.h>
 
 static const struct intc_hw_operations *__ro_after_init intc_hw_ops;
 
@@ -83,3 +84,37 @@ int __init make_intc_domU_node(struct kernel_info *kinfo)
 
     return vintc->init_ops->make_domu_dt_node(kinfo);
 }
+
+int domain_vintc_init(struct domain *d)
+{
+    int ret = -EOPNOTSUPP;
+    const enum intc_variant variant = intc_hw_ops->info->hw_variant;
+
+    switch ( variant )
+    {
+    case INTC_APLIC:
+        ret = domain_vaplic_init(d);
+        break;
+
+    default:
+        printk("vintc (variant:%d) isn't implemented\n", variant);
+        break;
+    }
+
+    return ret;
+}
+
+void domain_vintc_deinit(struct domain *d)
+{
+    const enum intc_variant variant = intc_hw_ops->info->hw_variant;
+
+    switch ( variant )
+    {
+    case INTC_APLIC:
+        domain_vaplic_deinit(d);
+        break;
+
+    default:
+        break;
+    }
+}
-- 
2.54.0


