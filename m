Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93EF3C79FB7
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 15:09:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413284.1643563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Juv-0004F1-H9; Wed, 09 Sep 2026 15:08:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413284.1643563; Wed, 09 Sep 2026 15:08:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Juv-0004Eq-DU; Wed, 09 Sep 2026 15:08:53 +0000
Received: by outflank-mailman (input) for mailman id 1413284;
 Wed, 09 Sep 2026 15:08:52 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4Juu-0003yx-6p
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 15:08:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4Jut-007z99-Jn
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 17:08:51 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa17682-8faa-0a2a0a5109dd-0a2a450c8274-2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 17:08:51 +0200
Received: from [74.125.228.140] (helo=mail-ej2-f12.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa17683-f479-0a2a450c0019-4a7de48c9210-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 17:08:51 +0200
Received: by mail-ej2-f12.google.com with SMTP id
 a640c23a62f3a-c294496989aso15911166b.3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 08:08:51 -0700 (PDT)
Received: from fedora (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c261f673000sm709991666b.24.2026.09.09.08.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 08:08:50 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788966531; x=1789571331; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XBmqn5QW1wcqH90/ZG0vHM4CgtbXqvupt8SmP6XIcus=;
        b=NZsNTGh80mlwrtH2WIm2Z+8QvqQhqheAerJa0op/12z2uUpkFGimIqnpTP0s8qJmtk
         12hUKIMIoatn28V7Jgz8BDV4TmZD/ClcgQ9Uw7HrhGwCUqOgB7PMJRVaU/HXgTZY6FsP
         trbbUXzAoKKzpr7eEqb8L3kczfDAtbR+3jX1Y8ZyIyaOuB1LWJbZR7rGqrY2hvkijAfN
         RBadKHfLZUiNxCuuieASXfcH91YnmHqRZSQ+ITPSU6A7ZM7cEHk/4LDVQ+j+DSaQjyFg
         7wfD107cOI5/oyH1m1JfZWvFSIexFXobwuNNfo7PraAIP8MGwrimPsZ7rvM+IccaoIen
         K+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966531; x=1789571331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XBmqn5QW1wcqH90/ZG0vHM4CgtbXqvupt8SmP6XIcus=;
        b=LzaVE5MtE70gHZtyMxWRYkF2hyuEhQf5eQ1Vz5lyEbBCysbjBvqGblH8O31TdD1rqL
         4e+/ZhuspbSw1M3xSDYFgMJ685IPpnqq1+xlf58l/Vn3znD1mexWHj0tKgRqGfIZQ9AD
         LCm3EmFdtzFAxz171mR8IS56cUpiqGRP+l/ABvTvmVzX29RSiXf1Qq5b60fbi3qFNaqL
         /gCQynDirjGOyU4hW2FzLbm14Ad9/U4YQMxZnnU9tCSfkMHYJdUHoQnsof0bzGJlaWhm
         6AjC2g3cQOsxMmYKF6zn486g3+85vDi97bxTs2n4Yi9clhvo/gOezOs2uT7vLHKd5fWs
         gVnw==
X-Gm-Message-State: AFuF++ngALNpHhJm8Ni9dblpLNjoAIZ8XM+fNX9Gkm7qCIwEtilPtgOd
	yxQho2h5RL7qib6MJowVRxKNO4ATth02DkE0uJVEjFoUVkzNekZSx7bTvTdpxon/
X-Gm-Gg: AYBFou0O06SpyLSIRg272zvXlRtyeLDuwaMTE+jnCoKgd1uNPYPdbEigGXW6q/fAyB5
	S+QPD2MHVDImZUJ66Sy+6pmcZ/mrYIqsBJWUjjf8hHhUP98xFpcD2wfYszEOiT1Ap63KIDTkQnK
	N+0up77wfKZ9wLOX5fH+bqcOC6U/tqQ55k3PmPtwHe8CFup6BhwmvjS7nLJ9plJiejCF1QjlkgX
	fCQGUKwtrvFfCXhvJNaz8H5gB+gKEp4C1zVSmv+Fuh/Mwl7N1Urj3fViruDa7I/ko8KsxJuKAZt
	LfA1g7DIwkDYZa1HkNbi37sQLHQq8zKn9LxGEuOhExnOzt3Mw8N81EWKjzYWiT+mCSVt5PL7OXy
	WMitO00HpeFRYafcSqutvtGjgVK+V2fOXx5Axg6+1NP+Lz6PVK4VG4NoNmWq/vKUXYguQvAVw4Y
	KuRC1qimFPrixyavk4zwFTWucvRmXYE+bTApfqgA700t91zLOheCKwIc2WgPfWc+WnxcMDkWh2N
	AbcShW2NpcqqUGKGZ4=
X-Received: by 2002:a17:907:c244:b0:c26:1648:a076 with SMTP id a640c23a62f3a-c2941be4cc7mr63914866b.49.1788966530979;
        Wed, 09 Sep 2026 08:08:50 -0700 (PDT)
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
Subject: [PATCH v9 13/20] xen/riscv: introduce (de)initialization helpers for vINTC
Date: Wed,  9 Sep 2026 17:07:31 +0200
Message-ID: <bd88906b7f36af7e973d7b4fcdda2c571e0845fc.1788876411.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788876411.git.oleksii.kurochko@gmail.com>
References: <cover.1788876411.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1788966531-768DDA5B-AB41261D/10/73395122804
X-purgate-type: spam
X-purgate-size: 4217

Add common helpers domain_vintc_init() and domain_vintc_deinit() to
allocate and deallocate a virtual interrupt controller (vINTC)
structure and initialize basic virtual interrupt controller registers.

domain_vintc_deinit() isn't called at the moment as arch_domain_destroy()
is implemented as stub at the moment.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v9:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
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


