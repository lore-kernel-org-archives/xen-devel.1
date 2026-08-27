Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B79C61DD4
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:20:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400819.1636431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbtF-00058X-DB; Thu, 27 Aug 2026 15:19:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400819.1636431; Thu, 27 Aug 2026 15:19:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbtF-00058L-5e; Thu, 27 Aug 2026 15:19:41 +0000
Received: by outflank-mailman (input) for mailman id 1400819;
 Thu, 27 Aug 2026 15:19:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbtD-0004nW-GK
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:19:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbtC-00C6ki-TB
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:19:38 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905589-2eae-0a2a0a5409dd-0a2a4502d400-12
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:19:38 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a90558a-6ca4-0a2a45020019-d155dd2de85a-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:19:38 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-482e4998d28so1200291f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:19:38 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e28f5d01sm10049148f8f.32.2026.08.27.08.19.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:19:37 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787843978; x=1788448778; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0M3EgygiTwyj1BTDY//NIuuLWaR+oYVriRuH7zUtriM=;
        b=HmQfarzbUsV9Eqo6dzQ8Bt0jTde2bfSbrXU4KMUiysvKDVeAzkyrZrdClqR1frpubu
         xv1GNo2Cpomwt9zGBi9NbhKbvgp/6mZGXffDdW3avLRg3i0e8jaSdY2c0riu1iv1TkrH
         NbIevmGCkMTsvVZiFWzMVCb9VnnNXOJzB4Bh2HjUptHwRsHdi84UK7PTVgc34HyCvEDS
         304yqBZcDMj5k/s0w6ROkQSJDDhgHEXkXuYTfUsqXFL1XLVqhY86yFkG88S1pfgd3QiN
         O54we6KEE1VzjCWa/KdRIoGuSmgXcqUHVe+Dr+ohwt+c3uI/VID0OFl+SmnM5TyFAX4b
         O7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787843978; x=1788448778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0M3EgygiTwyj1BTDY//NIuuLWaR+oYVriRuH7zUtriM=;
        b=oM95EtiKDjb4EDcsLMbjuAtzmdChWgwJqU8weFiTDEAbO3sTcoUjDkIqwROs9WZeQL
         Wn3gpGt76giUtsV/9Jtw0FWwnW12Uyo34dVjd6D9NTrHtTUyVBDVUKvCK8acsXEb2uXB
         FfxZq7paghM4tWHbyKkWyb0Qq2O/xC2fvs43QlTRZ6poNe5XdQukYSHgab/TRvp4I1qi
         K++04HZr2yrTgrhX/CTBONQoa76N8Ia3QRbw9hYtzwQ9IZ4ellL1TpH9NUPcLt8YhzTk
         y0V513pEL6tRufK3NqMoGdOgM8qQDqXodWxz8ulTPnQ3b7nZUA2DA4FwzlM6i1N2XlKo
         yaqQ==
X-Gm-Message-State: AFuF++me78mUyAxe/d2X+o4tQ34K69kO/AOo6WJEb3SW/eg8LqgNz5WP
	CpDqamkNqNXrPdAeo79f4Fc0ia+7JftApJv6NW93bkP7cIBfbr5LrLrrkZHQbg==
X-Gm-Gg: AR+sD10nKLrfwxatEqClmC7HCj4zkv/AirBXJATJQ/aMR05qd7FniQZTJD/IYxODn+A
	/8OlHC4JiSksirZA7x6+nZSrddh9PDOBD92Md8zXqzNsJAnalqBISxsY7Ix1AafP1zFn+wnvGdy
	gXH7XmWZsyMvO18bX0Pz5NVqneyv/M2h1fToxztKxENVdJw5E6aqvR7epaaCgvKaRmz3jtJCn1O
	+etmAX/XBW8RqSKIN6zoJhcU/by4kvHxeyasgw4EhJ0GYTL3yzznnzYn8Nw6Te5GAWBBjmEtjV7
	BCBhFgXOtwNi68heKPfud2bBg1JyM1LB1RYA8b/EJYKoAkLKPOXQ3RHcjB/ELpl2YQbZF7xHc7V
	PaWF+HDSekoxmRjEzuSOdmGB4nL7CqoWTvsFHFbGfzdZP6D8OTN2c6V970GFipdvy0teWbDGuu2
	Cnlodf2VitGktmgZ7jkAJHce9lsbr2vOVacEEYYTUV6glslsTBUv11Qr6OwbvuaPO+1pox+0qDX
	UGK2pDTKB4CjW5Fkhs3FIpntkmLWi0Tew==
X-Received: by 2002:a05:6000:2008:b0:482:c72e:6af4 with SMTP id ffacd0b85a97d-482e2628158mr21154717f8f.0.1787843978226;
        Thu, 27 Aug 2026 08:19:38 -0700 (PDT)
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
Subject: [PATCH v8 09/20] xen/riscv: implement make_intc_domU_node()
Date: Thu, 27 Aug 2026 17:19:02 +0200
Message-ID: <a5001a14e8bbf357788af6a9fd9fa1956cc5a548.1787836900.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787836900.git.oleksii.kurochko@gmail.com>
References: <cover.1787836900.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1787843978-307C22AC-55D4A302/10/73395122804
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
Changes in v5-8:
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


