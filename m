Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A26CD98E4
	for <xen-devel@archiver.kernel.org>; Wed, 17 Jun 2026 11:18:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1340100.1601190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoHt-0004EG-3N; Wed, 17 Jun 2026 11:18:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340100.1601190; Wed, 17 Jun 2026 11:18:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoHr-00049q-4G; Wed, 17 Jun 2026 11:18:27 +0000
Received: by outflank-mailman (input) for mailman id 1340100;
 Wed, 17 Jun 2026 11:18:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZoHi-0003Hf-II
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:18:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZoHg-00CoLo-Uu
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:18:16 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328270-2eae-0a2a0a5409dd-0a2a4506b2ec-28
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:16 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328278-7371-0a2a45060019-d1558036f134-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:16 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-490b64c8311so55010275e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:18:16 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa3a8efsm151319985e9.2.2026.06.17.04.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 04:18:15 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781695096; x=1782299896; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YgS4xncGRmEKcmvBSvgWNruiE6NqAhsldZjnjIta9fI=;
        b=kunzc0y8voFEyo35ThAd4kc/rp+ec1ZoAVcqsiR2X90I0HOz7PUBIXSBTRx9Bjvbe+
         17axQM4kdDFRR1Sbb1idlMG+6ZfdSqo2YwXCTImzr0P+/JuZxa4PaND8LdKR/de2hygI
         F+0tklsIHeLnw4LGwNpzt4wGz3/NyGWTiRG47MBOWjDgmWJmEBnAqKsdZdYcx24wpVyr
         BM8MmKTfR58WjDapSdKN1hhwYC7uS2iuDqJFAEPRBPR9QV8vXGy2FDaUGSGMb77zHH9K
         4Ltwvks98CuPhsaTAeKIqetduwviu1XfYCmYZfyThPYmXdluf8d/i7fCbeh320wGvN4j
         n+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781695096; x=1782299896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YgS4xncGRmEKcmvBSvgWNruiE6NqAhsldZjnjIta9fI=;
        b=tKv1+/8cp9pHfoMqKEAn3XjS3WgwxDzehiQTnZ5C6W96QWlH0pDuUjpKXpWxu/lv9U
         1+KOuGAIR/kWIlFksYbwF/qsEaFOdyYYsnVbg3Jmhn/GWX72R9TusO4KwTqNdKLypfJy
         ytUz4DwE1JB+9fhZpvMspX6DIpy/9b7C9Rqdawas1Wm5XcaepaRj5vS6/pE3Fjji8Z8o
         SkuvaSo3fbP5gVfXj+TnIRxiEfgi+rmLJ/Uc6l3JCaE+dBp129bjwYqEjVzxeAv4lxfM
         bULKaWHa3Rcw9Yc9QJ2F+DURXSchhPQF3GtHRX8rHUgrwvJO0H6Y9wjyDHVb9utTfTXb
         i1Jg==
X-Gm-Message-State: AOJu0YwWX3vKjnKFqJFrzvCT+H2PdfmIJnmjdqab89F9oPmoNQoz6QfK
	esWntH/+oaoe1Vwvauur4PcbAkShwmb40LnLjfuv9NU4mhfUNlEJQmu0YPefew==
X-Gm-Gg: Acq92OFJqCt0EPlH8pPDWL25Ohn/+shDz6nxxFQgaWdU95Kxxd37eqaMPgjjLCbL+5J
	nwLqOo8rePP+TNgFD5QO1cqnpjXP5Jt8sMfgw+WklYjlEDblSXvzeM4CIxvV0hon3/ZyMob4qrY
	teYgDF2Etb62Vd41yIxrF43Oeb0MrAP7B4IlddZ3QYCT3/WWWJ8BVhrPgrVo3yB4fXawK0EKaoe
	SOK14TX1FCh7pAXy7pa1wJI9mCQ1+XEqwZK8FpKxBpvRXpeWdN3SuISK5xO1NQ0+BjAeCjKt2mw
	wxkAIh8/PWRUVHyIO+Gr7dNoJ20u2HTmXkU6M05FHyU9ujPJ3uw9Wq4x2F2IyNDf2pg6Ue+FD2a
	YvSBsd5ke9vEu+Dvo5DWWGdZFlmreb6Tcd/EJoYHv+k3msDawBfcmFRVAVvp22a+niy/iH7ZoJw
	fzoqyZRTS6CC+6H3oMzblAe8kEw+uNxtW8SR0FWfvib8woa5hZfgRr8eHgWQ==
X-Received: by 2002:a05:600d:117:b0:490:a646:9d77 with SMTP id 5b1f17b1804b1-492333a1c30mr48448225e9.6.1781695096087;
        Wed, 17 Jun 2026 04:18:16 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
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
Subject: [PATCH v3 14/23] xen/riscv: add very early virtual APLIC (vAPLIC) initialization support
Date: Wed, 17 Jun 2026 13:17:42 +0200
Message-ID: <9dc992009d0c1f9d1c6b6e88c0ea8bceabcb4d72.1781693963.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1781693963.git.oleksii.kurochko@gmail.com>
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1781695096-8556ED75-ABB18FC0/10/73395122804
X-purgate-type: spam
X-purgate-size: 8822

At the current development stage, only domain vINTC init and deinit
operations are required, so implement those first.

Initialize vAPLIC's domaincfg to with the interrupt-enable bit set and
MSI delivery mode selected as the current solution is exepcted to have
always IMSIC, and initialize vintc->ops.

Other operations such as emulate_load(), emulate_store(), and is_access()
will be needed once guests are running and MMIO accesses to APLIC MMIO
range must be handled. These will be introduced separately later.

Introduce a structure to describe a virtual interrupt controller (vINTC)
and a vintc_ops structure, which provides operations to emulate load and
store accesses to interrupt controller MMIOs and to check whether a given
address falls within the MMIO range of a specific virtual interrupt
controller.

The vAPLIC implementation of these operations will be provided later
once guests can be run and these operations are actually needed.

Introduce these structures here as they are required for the implementation
of domain_vaplic_init() and domain_vaplic_alloc(). Also, introduce
vaplic_init() and init vintc_ops->vcpu_init() with it.

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Drop ASSERT() before vintc->ops->vcpu_init() in arch_vcpu_create(); a
   NULL deref already produces a sufficient backtrace.
 - Parenthesize macro argument in to_vaplic().
 - Drop __init from domain_vaplic_init() and domain_vaplic_deinit() since
   the caller domain_vintc_init() (follow-up patch) is not __init.
 - Remove pointless zero-initializer for rc in vcpu_vaplic_init().
 - Fix domain_vaplic_deinit() to null d->arch.vintc before freeing, making
   the function idempotent.
 - Drop intc_irq_nums(), (*nr_irqs)(void) hook from intc_hw_operations,
   aplic_nr_irqs(), and vintc->nr_irqs field entirely.
 - Rename vcpu_vaplic_init() to vaplic_init() and drop vgein_assign() and
   imsic_set_guest_file_id() calls; those will be introduced/called later,
   where for sure we will know on which pCPU vCPU as it is required for
   proper h/w IMSIC interrupt file calculation, to have this initialization
   in one place.
 - Introduce vaplic_deinit().
---
Changes in v2:
 - s/vcpu/v for function arguments in struct vintc_ops().
 - Update the comment above is_access() and drop const for addr argument.
 - Update to_vaplic() to work with 'struct domain *'.
 - Drop smsiaddrcfg{h} from vaplic_regs struct as they aren't used for now.
 - Drop inclusion of xen/schec.h from intc.c.
 - use result of xvzalloc() as initializer in vpalic_alloc().
 - Drop goto in domain_vaplic_init().
 - s/XVFREE/xvfree.
 - s/aplic/vintc.
 - Drop __init for vcpu_vaplic_init() as it could be called for secondary CPU bring up.
 - Drop vaplic_alloc().
 - Drop vintc_ops struct, embed callbacks iniside struct vintc.
 - Introduce and init vintc irqs for vAPLIC.
 - Introduce intc_irq_nums() to properly initialize number of vAPLIC's irqs.
---
---
 xen/arch/riscv/Makefile             |  1 +
 xen/arch/riscv/domain.c             | 11 ++---
 xen/arch/riscv/include/asm/aplic.h  |  1 +
 xen/arch/riscv/include/asm/intc.h   | 12 ++++++
 xen/arch/riscv/include/asm/vaplic.h | 34 ++++++++++++++++
 xen/arch/riscv/vaplic.c             | 63 +++++++++++++++++++++++++++++
 6 files changed, 114 insertions(+), 8 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/vaplic.h
 create mode 100644 xen/arch/riscv/vaplic.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 9df8b72b5494..9d8d21b65188 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -25,6 +25,7 @@ obj-y += smpboot.o
 obj-y += stubs.o
 obj-y += time.o
 obj-y += traps.o
+obj-y += vaplic.o
 obj-y += vmid.o
 obj-y += vm_event.o
 obj-y += vsbi/
diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index e4a8c27ea9cb..129e775c52cb 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -11,6 +11,7 @@
 #include <asm/bitops.h>
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
+#include <asm/intc.h>
 #include <asm/riscv_encoding.h>
 #include <asm/vtimer.h>
 
@@ -155,14 +156,8 @@ int arch_vcpu_create(struct vcpu *v)
     if ( (rc = vcpu_vtimer_init(v)) )
         goto fail;
 
-    /*
-     * As interrupt controller (IC) is not yet implemented,
-     * return an error.
-     *
-     * TODO: Drop this once IC is implemented.
-     */
-    rc = -EOPNOTSUPP;
-    goto fail;
+    if ( (rc = v->domain->arch.vintc->ops->vcpu_init(v)) )
+        goto fail;
 
     return rc;
 
diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
index b0724fe6f360..d443faac57c4 100644
--- a/xen/arch/riscv/include/asm/aplic.h
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -15,6 +15,7 @@
 
 #include <asm/imsic.h>
 
+#define APLIC_DOMAINCFG_RO80    (0x80U << 24)
 #define APLIC_DOMAINCFG_IE      BIT(8, U)
 #define APLIC_DOMAINCFG_DM      BIT(2, U)
 
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 9b701445179f..d3d456afe5f0 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -15,6 +15,7 @@ enum intc_version {
 struct cpu_user_regs;
 struct irq_desc;
 struct kernel_info;
+struct vcpu;
 
 struct intc_info {
     enum intc_version hw_version;
@@ -38,6 +39,7 @@ struct intc_hw_operations {
 
     /* handle external interrupt */
     void (*handle_interrupt)(struct cpu_user_regs *regs);
+
 };
 
 struct intc_hw_init_ops {
@@ -51,8 +53,17 @@ struct vintc_init_ops {
     int (*make_domu_dt_node)(struct kernel_info *kinfo);
 };
 
+struct vintc_ops {
+    /* Initialize some vINTC-related stuff for a vCPU */
+    int (*vcpu_init)(struct vcpu *v);
+
+    /* Deinitialize some vINTC-related stuff for a vCPU */
+    void (*vcpu_deinit)(struct vcpu *v);
+};
+
 struct vintc {
     const struct vintc_init_ops *init_ops;
+    const struct vintc_ops *ops;
 };
 
 void intc_preinit(void);
@@ -65,4 +76,5 @@ void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority);
 
 void intc_handle_external_irqs(struct cpu_user_regs *regs);
 
+
 #endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */
diff --git a/xen/arch/riscv/include/asm/vaplic.h b/xen/arch/riscv/include/asm/vaplic.h
new file mode 100644
index 000000000000..96080bfbc23b
--- /dev/null
+++ b/xen/arch/riscv/include/asm/vaplic.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * xen/arch/riscv/vaplic.c
+ *
+ * Virtual RISC-V Advanced Platform-Level Interrupt Controller support
+ *
+ * Copyright (c) Microchip.
+ */
+
+#ifndef ASM__RISCV__VAPLIC_H
+#define ASM__RISCV__VAPLIC_H
+
+#include <xen/kernel.h>
+#include <xen/types.h>
+
+#include <asm/intc.h>
+
+struct domain;
+
+#define to_vaplic(d) container_of((d)->arch.vintc, struct vaplic, vintc)
+
+struct vaplic_regs {
+    uint32_t domaincfg;
+};
+
+struct vaplic {
+    struct vintc vintc;
+    struct vaplic_regs regs;
+};
+
+int domain_vaplic_init(struct domain *d);
+void domain_vaplic_deinit(struct domain *d);
+
+#endif /* ASM__RISCV__VAPLIC_H */
diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
new file mode 100644
index 000000000000..8170e93701ad
--- /dev/null
+++ b/xen/arch/riscv/vaplic.c
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * xen/arch/riscv/vaplic.c
+ *
+ * Virtual RISC-V Advanced Platform-Level Interrupt Controller support
+ *
+ * Copyright (c) Microchip.
+ * Copyright (c) Vates
+ */
+
+#include <xen/errno.h>
+#include <xen/sched.h>
+#include <xen/xvmalloc.h>
+
+#include <asm/aia.h>
+#include <asm/imsic.h>
+#include <asm/intc.h>
+#include <asm/vaplic.h>
+
+#include "aplic-priv.h"
+
+static int cf_check vaplic_init(struct vcpu *v)
+{
+    return vcpu_imsic_init(v);
+}
+
+static void cf_check vaplic_deinit(struct vcpu *v)
+{
+    return vcpu_imsic_deinit(v);
+}
+
+static const struct vintc_ops vintc_ops = {
+    .vcpu_init = vaplic_init,
+    .vcpu_deinit = vaplic_deinit,
+};
+
+int domain_vaplic_init(struct domain *d)
+{
+    struct vaplic *vaplic = xvzalloc(struct vaplic);
+
+    if ( !vaplic )
+        return -ENOMEM;
+
+    d->arch.vintc = &vaplic->vintc;
+    d->arch.vintc->ops = &vintc_ops;
+
+    vaplic->regs.domaincfg = APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM |
+                             APLIC_DOMAINCFG_RO80;
+
+    return 0;
+}
+
+void domain_vaplic_deinit(struct domain *d)
+{
+    struct vaplic *vaplic;
+
+    if ( !d->arch.vintc )
+        return;
+
+    vaplic = to_vaplic(d);
+    d->arch.vintc = NULL;
+    xvfree(vaplic);
+}
-- 
2.54.0


