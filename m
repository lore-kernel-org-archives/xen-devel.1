Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D1AC4452D
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:00:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366961.1616828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqQ0-0006wO-NA; Mon, 20 Jul 2026 16:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366961.1616828; Mon, 20 Jul 2026 16:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqQ0-0006w5-Ha; Mon, 20 Jul 2026 16:00:36 +0000
Received: by outflank-mailman (input) for mailman id 1366961;
 Mon, 20 Jul 2026 16:00:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqPy-0006dT-W6
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:00:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqPy-00AdEr-BV
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:00:34 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e4615-5cb7-0a2a0a5109dd-0a2a4501a09c-20
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:34 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e4622-5984-0a2a45010019-d1558036cd4c-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:34 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-493f75f7172so81100485e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:00:34 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63edd7d3sm30084673f8f.25.2026.07.20.09.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:00:31 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784563234; x=1785168034; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Hr1g/e/xXcDb/D7IngZWRsUaR/73i2SVKxkYoNQW+Y=;
        b=CJIFCxnfi1ntWNYnxSS2QgyXaz0Ve7929NzTBFCAqC+yqMcbCYXXuOxQqIa9ifhQen
         DhDybGmXS6UVbfkcyOS+/eZmL0Uho7I87AD6+h8SIejcY+PozwaZ2/KbW0qkdMEpQE7O
         8UxC2/RBOb5JzyIEiP+RA3l6VgNhX5Iuzo36skUMc3zYPJRQ4ucDJhAl6YsE0/HtYh0O
         l4+wNbEr0UeDZzEeXYs025yN+w0n97E0q01mpgkPeMgJesQCWWmCW5U1rzjr0UMFjoEs
         jP78vhHLqHeitbmg5RaFg81KpWa3A7Es3TDzzAJcitiPeXAgmN+0krzMgN/3rnWu1GA5
         0ptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563234; x=1785168034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Hr1g/e/xXcDb/D7IngZWRsUaR/73i2SVKxkYoNQW+Y=;
        b=bZAFRky05Rmj/1wFXvbUb2xP+ogkYKwYMCJYnGeIwCtmC4t4c2RM5XTG8K35bVnZM7
         F4aTXMIsVmXrManqL0aCXBcWRtM4At8rw6s9xbzp3SiBvoAdBvgwFlIKtQtgl7h6U3z4
         nZvnYr57JijoFyBd/5KaCWXWpzKMcZAmkDlWzqocxrDl8fnxBhFaV9CGEmZC5R4WjA5L
         8c+0WUX3+imGcGLuUuGoJX0z4uUpbjaUSdKZB+nE72wI9tFem5ZR4sy66qBt5h7szwCg
         z4sXoiVnWYgWjPZJRLxS3xmFU//YDlxxNT2rgbJV6jc/GmaHs/i54W/bCKZGZwgwXRRB
         w4Sg==
X-Gm-Message-State: AOJu0YwHDJeNTRnTvEomhueOV5MLiQ2ah/TWxzBnXl/6euA9W+G1QQ1R
	UN3DcNf+oYbn7fXFolgdn+kIyer+ZpdsXAAXtZcX7+LQ/OH3fEQPqnaPuyN5zw==
X-Gm-Gg: AfdE7clw1vnhMidIDGG/RCBFkJxGRRhWnZbX1vFDQKr27f4s12ypkGsoq0or0tZ/9jo
	Sb6iKm566/tcheSMc38my7Yy3irExUEGxqzSJVu1lpyFGThMQLmdfoweza0WHWd94giqzUoxEK6
	5Uk6YcPuPm/naguZNasA7m72LwkzXIo99cYQnQ4WRh6UG2XvPEEoJGUeXM2NC2DHmIQrduOTjSR
	z+nJDAUN2pWQBd8DtYSUyNzFnO3Q12dFR8slzQey5bnX9lTDoIZSVNEZi8RhoP02CXCi271xP9G
	JOahfsM0pE0jjubpm4h2cKU7n7+PWcmjReOAFklfe6E9BJd0BCbMWsyQThpJlQ0lRNTMkocPpfH
	h6Hjjq+sIrrB45dmoNBeMn5SssUj2KZjNqOiv78eYVd3RaBrXLGip3EhN3VWZW6wL6mUn6/iGtN
	bg2Y8S5Kid82F+a1Z1sjxVbU564MBDR3LoeMN9Ng9RgWdq0BQ=
X-Received: by 2002:a05:600c:e54a:10b0:490:5057:f5f7 with SMTP id 5b1f17b1804b1-4954a3ed516mr114597095e9.11.1784563233430;
        Mon, 20 Jul 2026 09:00:33 -0700 (PDT)
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
Subject: [PATCH v6 11/23] xen/riscv: implement make_intc_domU_node()
Date: Mon, 20 Jul 2026 17:59:52 +0200
Message-ID: <93a8222f2033567ea207d4c81b509cb32701f9d3.1784559209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784559209.git.oleksii.kurochko@gmail.com>
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1784563234-C5146757-AE09C739/10/73395122804
X-purgate-type: spam
X-purgate-size: 3437

Introduce a RISC-V specific function to create an interrupt controller
Device Tree node for DomU domains during dom0less build.

Add make_intc_domU_node() to the dom0less build path and wire it to
a new generic helper, intc_make_domu_dt_node(), which delegates DT
node creation to the active interrupt controller implementation via
vintc_init_ops.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v5:
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
2.54.0


