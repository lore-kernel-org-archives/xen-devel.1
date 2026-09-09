Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D86C79FB6
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 15:16:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413392.1643653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4K2C-00033L-Jq; Wed, 09 Sep 2026 15:16:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413392.1643653; Wed, 09 Sep 2026 15:16:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4K2C-00033D-G4; Wed, 09 Sep 2026 15:16:24 +0000
Received: by outflank-mailman (input) for mailman id 1413392;
 Wed, 09 Sep 2026 15:16:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4K2B-000336-8x
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 15:16:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4K2A-00CvId-MD
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 17:16:22 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa17835-8faa-0a2a0a5109dd-0a2a45079ebe-30
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 17:16:22 +0200
Received: from [74.125.228.76] (helo=mail-ed2-f12.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa17846-b4ea-0a2a45070019-4a7de44cb5bd-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 17:16:22 +0200
Received: by mail-ed2-f12.google.com with SMTP id
 4fb4d7f45d1cf-6a60591ae54so1999389a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 08:16:22 -0700 (PDT)
Received: from fedora (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c261f673000sm709991666b.24.2026.09.09.08.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 08:08:26 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788966982; x=1789571782; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pmK9naUMbOofZXsZTLQyyxB70Co/ElUNF72aKPXn/H8=;
        b=i8SMFLYLTsBjl487V7MNH5F3VWRKW11sToSG0c24UaNBwfVqQ2D5D+rhm0L58Jb50E
         ijCtSqaQsInXgoQu0oOJHTip6jfTv+mck9esKtEJcF7wLGky8p74Lmg/uTzxIcTFwyy9
         sPutq6DDYMIp93ScZqy84mASqo2eJotcrbmnNSRl8aFio9oj5onwSxEzbFE7zkQIIprt
         3ULyrSgNbQXMHTyGnzlb1aZAmoqpzLxvpY+3qeIe3zSPV+UGDuqtoYfx4PC4hu2WfPks
         5xyuYjd/ZtRh9RLS8KSJu7QW+nxVmffpKgL0Xlp9jwbAssrh2zRdNAuyZgzt5Y3DwjW5
         Ixqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966982; x=1789571782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pmK9naUMbOofZXsZTLQyyxB70Co/ElUNF72aKPXn/H8=;
        b=AGx+O2ikbIJn2reGoek3f/4SwkAqol85B0wv5GL46/Xq/nQg1W3O0VX1wJfBdAFop0
         Pas6BH/nbtgXYr9lsFJ8NyonKjqX7O8i7+PER+LM8TG9eOFpaHFQKiXF0djXUP8+ZJvZ
         g+uUUqemjtz2BQvAUCBAqZR4Laet5FiM7W+xEsn6ikiPOu4Ow/wrEnoa2ILuQDqPt+YT
         2wtduiGUlHhjxODDs3attMcrbUSOFHVzns+7N1h/wgKHSY3pcfenFxhqDflxOIXvvLyo
         oN92UIqeqqXN5Pk54DLQ2Wk9qbRsYn4IKsXJA2J7yRZodfH2gZsabwcliNk+JGTTQ7F/
         3/kQ==
X-Gm-Message-State: AFuF++mkoQz2zCBr6rOBmn953QtBn+fe64XCc/P7HAZNvv2xDMEl5WKq
	oBc5q2yZFPqFsTaYxsIeWFsQOJDM2/rYlXy6Hjhs6hEaHR5+IGsY1CnHfr69TMnj
X-Gm-Gg: AYBFou2mONKv8P4oUJsuyYhn4QIgXpjA2OiKP60YUrXJysaVygf6zl2Q9l5M5dmMs01
	MwRylESge+MdMyeJvtiGi1xpZbIkZ7A6uXgxSLIGimFKhQkm5QKyk2/EpCxxmgEmUSUbAd11paI
	ubSbiT+moQkG5wcHdC4sBYWj9CWs8/fRTqV+cis4JIN/3g8tTxR8VFwCMNbvK1rbXCH+9fNzmp0
	gS1gXlO0NMY1lwDI2kxvIfkh9zEmr4ozqhd++udhxjVQ7hFCMOj0+NV7P9GEwea42ZRSVu1POL3
	eQkvmAifCxsh55qe5A7GA6Mx1qFw2/2497AJf7EmWseZRDb3vZStHg4HzSwjGRFQL/8uBtMDmLc
	ESpkCEWLZaBRsvVWExuYwBQJT3M14+o5eSSIxr4sVjKwLyRCNUXqf55MeLCB6yC936M12ipGbvn
	RcbcYcHaboUaejCm94blyHCIBMq18rmLgN6pxQbY9Q06W2lQmcTY8NTCHmvR6He7oBsqPzlJFOu
	InmSm3tUg5RG03BLt0=
X-Received: by 2002:a17:907:7214:b0:c25:ed6e:7edf with SMTP id a640c23a62f3a-c292b138196mr498302266b.11.1788966507316;
        Wed, 09 Sep 2026 08:08:27 -0700 (PDT)
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
Subject: [PATCH v9 09/20] xen/riscv: implement make_intc_domU_node()
Date: Wed,  9 Sep 2026 17:07:27 +0200
Message-ID: <fab1caff15068b1981bdb0626b0bb2003b132761.1788876411.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788876411.git.oleksii.kurochko@gmail.com>
References: <cover.1788876411.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1788966982-A5AC0AE4-42CEE675/10/73395122804
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
Changes in v5-9:
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


