Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D52C44524
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:00:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366979.1616862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqQ9-0008Vt-Dy; Mon, 20 Jul 2026 16:00:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366979.1616862; Mon, 20 Jul 2026 16:00:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqQ8-0008Uj-No; Mon, 20 Jul 2026 16:00:44 +0000
Received: by outflank-mailman (input) for mailman id 1366979;
 Mon, 20 Jul 2026 16:00:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqQ6-00085f-Sc
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:00:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqQ6-00HTZO-9C
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:00:42 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e4615-2eae-0a2a0a5409dd-0a2a4503ae26-44
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:42 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e462a-fae8-0a2a45030019-d155dd2ce029-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:42 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-47f3b39f2a1so4922713f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:00:42 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63edd7d3sm30084673f8f.25.2026.07.20.09.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:00:39 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784563242; x=1785168042; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7PR8dTPk2Iy7WHpPzeSLIaD4BXd6K6Qr9Xmib8pSojg=;
        b=F7eJfKV2Rexz6eN/YHHtkdxIiH3lJrJEgG1kfJXXhIEd+QJvWaIoFipDTe25G0TH1R
         J80uOZ5SIj3Skv8mGYwnrUpf/rN90ruJ0c9KQnCvpcbu/iW2xU14Y8pVh0ddJ3jnhA+Y
         qQ5V8TPn9MFyY17TH/c7WL26W2WWzhyf5Z1lsnxHOSf/pcJRYlZ1Dbqms0yNSMQpj/wc
         lfyOxmDPhn3GSUA7yaut1x6BT6CPzBObFL8/j5k15CslFjl10ALKqe+NBNqmAxq+PwD9
         hAQ6NyXAgiXb8RZ/kLhVP0NIB5lLv5yJgSQJRZyxkOxKh6SP7fmoShCnfJWwYkWLMiwg
         6GNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563242; x=1785168042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7PR8dTPk2Iy7WHpPzeSLIaD4BXd6K6Qr9Xmib8pSojg=;
        b=nnO91MWfO2du+1/AzcPkQuu1Rls6HI2T7aBCkhGjTbMnPGpi1ULUzSKOTkf9aK9pZP
         doEte33Onhf29WSWJ7x4G65tyWHQq8OXwAMcS0Nfw4o9xpoVWVlWkZ7Mgrh2kmZ5V1Rz
         q+bXZs0c5CHwGAzE8JPtER2ePLNfJ0L/g3OqC1KdFDGc1N84w3TQf8SwI2u5PM8KhQwY
         HksRBx8sQq+GCb54LNVs6mh1RFUn5tU3cfcWbmfM52/izd80VSxC8aw1it65/9JZODsh
         WJCAuCW2klXAItmsqR2lXh3Zs5/chJAy07vmQ3BIcrN5rD8CR2dXFSVR8/TmDaPvDbs7
         CXTA==
X-Gm-Message-State: AOJu0Ywk/8cZGyDZ+bj5zUtAR/e4toLui57gxbfj7N8HLPGL6Zt3GB9Z
	dg2W258BfUA6TT4x1pLagRAJyN78udZ7BsB0byLIbedXbANdunQJDCuxdSWwlQ==
X-Gm-Gg: AR+sD130cKYyHaVRjum8Sa/kkvHONhe5G+htLJN6GAA6XTcGzwuOqE9VbcUPMGsxUqq
	p8cxa7E+qsufPwwu/Vtb1PzsUeX1WUNu8x1IHGNrYY6ns4bF+UuVLi7giPbwbIlirqK9etqT7q+
	Xia4d77EXVqged/Vg6i6q0uVdx455p35jnjwGem6VEqSFbQRfp4WOQNlQS1kEctf8X1yMwz8Sry
	BAcP70IQ8wtuJbYbz4ZTuxBO4ioYhf7D1JLqXl5+6Lo0eU6X3Nbxn0sPuH+eE46X9l8uLMaqj2z
	ASgSDp///sJX3BixpqYiME43C/TyD52AgRZV64ZarNmbdCugfGv9zjpFZ1E7HdfanIHrESJJWV1
	I4Lzw9diMe+AD5Q6kUufsT3haY5pXfnqgTGE32O86xSXzulnU1DWl7+GGGkq72g6WIbRm4EHw1t
	hWafaf0GWcPgzcwzb9LMvUI6Ay1Y18kJUlDSZAu2KLGazwo5s=
X-Received: by 2002:a05:6000:188f:b0:476:8d5:cf34 with SMTP id ffacd0b85a97d-47f622f2c57mr17730288f8f.8.1784563241247;
        Mon, 20 Jul 2026 09:00:41 -0700 (PDT)
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
Subject: [PATCH v6 15/23] xen/riscv: introduce (de)initialization helpers for vINTC
Date: Mon, 20 Jul 2026 17:59:56 +0200
Message-ID: <13bdc64635f7c87b7bb574bdf3f3139422fa8c59.1784559209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784559209.git.oleksii.kurochko@gmail.com>
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1784563242-756834E9-E96D372C/10/73395122804
X-purgate-type: spam
X-purgate-size: 3633

Add common helpers domain_vintc_init() and domain_vintc_deinit() to
allocate and deallocate a virtual interrupt controller (vINTC)
structure and initialize basic virtual interrupt controller registers.

domain_vintc_deinit() isn't called at the moment as arch_domain_destroy()
is implemented as stub at the moment.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v6:
 - Nothing changed. Only rebase.
---
Changes in v5:
 - s/printk/printk_once().
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
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
index 45712d305975..4db9c28662c7 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -308,6 +308,9 @@ int arch_domain_create(struct domain *d,
     if ( (rc = p2m_init(d, config)) != 0)
         goto fail;
 
+    if ( (rc = domain_vintc_init(d)) )
+        goto fail;
+
     return rc;
 
  fail:
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 5330666e139e..dad4c5fab08b 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -79,4 +79,7 @@ void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority);
 
 void intc_handle_external_irqs(struct cpu_user_regs *regs);
 
+int domain_vintc_init(struct domain *d);
+void domain_vintc_deinit(struct domain *d);
+
 #endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index 2864a896b677..f5c8af6ddea4 100644
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
+        printk_once("vintc (variant:%d) isn't implemented\n", variant);
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


