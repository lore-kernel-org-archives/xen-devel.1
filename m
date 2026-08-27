Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F65C61DC4
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:20:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400826.1636463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbtK-00064R-Ic; Thu, 27 Aug 2026 15:19:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400826.1636463; Thu, 27 Aug 2026 15:19:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbtK-000620-4v; Thu, 27 Aug 2026 15:19:46 +0000
Received: by outflank-mailman (input) for mailman id 1400826;
 Thu, 27 Aug 2026 15:19:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbtI-0005kT-Nc
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:19:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbtI-00C6ki-4E
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:19:44 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905589-2eae-0a2a0a5409dd-0a2a4502d400-32
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:19:44 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a90558f-6ca4-0a2a45020019-d155802adc43-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:19:44 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-49978908b35so17282975e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:19:44 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e28f5d01sm10049148f8f.32.2026.08.27.08.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:19:42 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787843983; x=1788448783; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UB6QIi9ewt7tM857WFc3rZ8Sx0meiAHCBYlBjEcGVaY=;
        b=kKkpGy3raDjNXHmo+Jthwx3Dfak2xYw+ypmUuvTW5QV6YO9UHrqvbxzfNjs+UB2/oD
         o3v9E5OLKO9i5m/r23pOL3mbLCan0x9S/Qdrwc6S0mTPtMs7u/8SqYMfKWcpKtbG4aeO
         yBuaSn94ybH/PsXt++mHYuH7/vI5Dx0y2kTyrjY3FgT/X697Zv9YOuDeP0/lhw5g9ImB
         0LoA9x7ImToj85Bc70LUHN8X0zEzbRRoTLWX212EqNymx5f22zggpm80Lhdh03gWh6Ok
         ksO8wTNJjDFVYxrGkV7Z1M7Vw8XHkeVSKZ2RLB79p/X2pm2lCEaVTwTjoCnR6SbSWyqH
         4Vaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787843983; x=1788448783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UB6QIi9ewt7tM857WFc3rZ8Sx0meiAHCBYlBjEcGVaY=;
        b=cPUMgkWWIk6cAMnRCz2/E/wrGt2q0eSao1GpMOKh6e9kcjsNaacf3jm5j9dycjeO6R
         UAOe8bxZ05rlOpE58EchYOwBhpRQq/XZ/r8qlglKXgHJKD/Uu39teCije2JQU/88gM3Q
         zQZwwPrwcYMoU5unZ1ahuR6GrKWNVD2h9j0fiJnqdYQZPNbY2nqmWwwNu48Ok/GUOTfF
         p0v/kFUXlmtmpylT/W3IGXkrRHTthcOUtVHEXzVtKgwYkTZ5gPF0YTA2UipQ7D3A204t
         PnAYMoPqqzk18NnreHa4lJQGbVxXe36Gzy34GN6S1nxlAciLuUjYVrvz4Oh8D6OnfOVc
         KEZQ==
X-Gm-Message-State: AFuF++mjh927HhUHtdEADU77rbsVlPfAv05cW4Hkz4QM9YRnvwH260pf
	0s7DFigoYWlDzA1Pg2mLSsu0qzrPyOouSZO8HPGTtCj/J2KOY5LFIKETXp2PNg==
X-Gm-Gg: AR+sD12p94kTC/kacSKvuiRSQ/gu6jrhBuTZt/mx2mlSvVVzLxz+4XP6lCt/h/bQv9f
	kjA4Bv8NW1BL4SIxKauTBdEfZtstW4usDDaaQkuIVBgspH7V21dTmUM9MWiIBOpCMvASLi7jJMl
	7uWJkJ0vUMgsgZbqqjSrhW/aqtf19/eZ1YE6ZS+qI2bvJCx1rVNqe5bVE98rx7nvWux0HG3f2VH
	v5u/ZYDOlnOk5ZXpRNOVolH5AmJ8j1AnAV1Wt6jlaLc3ebwq+Mo0+VPCp4xUAf4jNZZeomN3oTH
	PS7tuWrlL3KbFjO1j77a02Slb71wduabLPHJb2aygpy/2UjgbfpBhksZfHn/rv1qTzpfV8Y5f6U
	dSu7J9CEtwj+lBKD/OBprp4sRA1TV3e7E3F8pjtE32vmXampxAYoYpm2ZfYTxOCLffmQ/AXBlJv
	pL5Bt8ctcBbbr4FD9U44DDKyE8eLJikbbn4E894DLCUftjGuohHMXdJiTGXwHVceKVp0YtM/PvE
	DwFW2LXqwAgRK/1vvMV0DRqEvs8xqGNA9K7zTN3kLQ=
X-Received: by 2002:a05:600c:6912:b0:499:cd34:100d with SMTP id 5b1f17b1804b1-499dc703bd3mr211493985e9.7.1787843983291;
        Thu, 27 Aug 2026 08:19:43 -0700 (PDT)
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
Subject: [PATCH v8 13/20] xen/riscv: introduce (de)initialization helpers for vINTC
Date: Thu, 27 Aug 2026 17:19:06 +0200
Message-ID: <688352e340872a50af99a51082966669787b1f72.1787836900.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787836900.git.oleksii.kurochko@gmail.com>
References: <cover.1787836900.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1787843984-F18AC2AC-9C4DB48E/10/73395122804
X-purgate-type: spam
X-purgate-size: 4102

Add common helpers domain_vintc_init() and domain_vintc_deinit() to
allocate and deallocate a virtual interrupt controller (vINTC)
structure and initialize basic virtual interrupt controller registers.

domain_vintc_deinit() isn't called at the moment as arch_domain_destroy()
is implemented as stub at the moment.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v8:
 - Add call of domain_vintc_deinit() to arch_domain_destroy().
 - Update printk message.
 - Drop Acked-by.
---
Changes in v6-7:
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
 xen/arch/riscv/domain.c           |  7 ++++++-
 xen/arch/riscv/include/asm/intc.h |  3 +++
 xen/arch/riscv/intc.c             | 35 +++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 45712d305975..d94652809e36 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -291,7 +291,9 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
 
 void arch_domain_destroy(struct domain *d)
 {
-    printk(XENLOG_WARNING "%s: unimplemented\n", __func__);
+    printk(XENLOG_WARNING "%s: not fully implemented\n", __func__);
+
+    domain_vintc_deinit(d);
 }
 
 int arch_domain_create(struct domain *d,
@@ -308,6 +310,9 @@ int arch_domain_create(struct domain *d,
     if ( (rc = p2m_init(d, config)) != 0)
         goto fail;
 
+    if ( (rc = domain_vintc_init(d)) )
+        goto fail;
+
     return rc;
 
  fail:
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 875728885292..6fc0e620e937 100644
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
2.55.0


