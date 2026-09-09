Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE912C79FB6
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 15:09:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413281.1643554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Juu-0003zJ-7Z; Wed, 09 Sep 2026 15:08:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413281.1643554; Wed, 09 Sep 2026 15:08:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Juu-0003z8-3a; Wed, 09 Sep 2026 15:08:52 +0000
Received: by outflank-mailman (input) for mailman id 1413281;
 Wed, 09 Sep 2026 15:08:51 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4Jus-0003ra-VY
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 15:08:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4Jus-00DoNW-CD
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 17:08:50 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa17680-e002-0a2a0a5209dd-0a2a45048b98-12
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 17:08:50 +0200
Received: from [209.85.218.46] (helo=mail-ej1-f46.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa17681-b57f-0a2a45040019-d155da2ed9b8-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 17:08:49 +0200
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-c255c58156bso1230116666b.3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 08:08:49 -0700 (PDT)
Received: from fedora (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c261f673000sm709991666b.24.2026.09.09.08.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 08:08:48 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788966529; x=1789571329; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dt+oJbLlbJOl272w2oSgdeAx/VzdS+DDC/2pUVZckDs=;
        b=HuAUpCbos4lRFB/J4xlcz5OHPjwi6dJTZ2LdcaqS/jtojHTrsiX4aQ8BSQ+K88RyCY
         gkQWXGQf0uxh3KgAc5lQEM+M8LbKp7FfyA/CEnxchQwov3oWlc7BMmpzMhsJjMgUAx6B
         JWnW4v3kIMzlQKsnn/Lsj43FEKRuHWvQuOxURFXxATfbCaKtyujVShXvqC7qTENfU2Ux
         GwuzICfLP2mpl+lZIKCnz+oaF3JZolusN0zuBmDbeWjDSH1RXJCCaPhpeF5PsfVk3t8H
         5CAq7y4z7EHdxVbtu+h5ut0mRMsXvAy0jvxyHgH39x6wDIOpBDLYYD8M+QW5HZF4AEYp
         iBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966529; x=1789571329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dt+oJbLlbJOl272w2oSgdeAx/VzdS+DDC/2pUVZckDs=;
        b=No5rS1RqeeHTXdw8UixBNHCdnwGxDg3WhHHyzoUkL8iW0lxZDjzDWZlBTl3SfqQm0X
         mq+c2iMY4p/a8iapfId+N908YFVqjyI9s7fqajGPYULSZOLeYlzICnY30XmNioH7JbTj
         Zv6iWxMEWnWd7XEoA23tiJN40LwHWZ7oBQVRs+f9vl0Gb/dkVUbokbijtyO7smowLfZ3
         kknx26CnzkApBTUc0yOrBxk4JcfCeg/Y2/GBxIpg6BHy0aOtD2gmIXxrQreJC2zodaGK
         3LuOOaP0uRc+Hn6mKf9GwzJkq9bMbwRVyE5kPV2ZzOS2nR5cNAvWXFIFaxliM3z/8Nx5
         hzew==
X-Gm-Message-State: AFuF++lhXknTGnHfIAAXNCGdnAQLx5e8VZpYHIlgAkjTkkiXFbqLrEHP
	Oeqi+4DihaXuYyY14FR5E4G2VELdalOoJB/nGtgGJTOLEkRvSRKCG4riEVD4EDWk
X-Gm-Gg: AYBFou0+COdw4Sn2jRA9SBTumHmuW8fHzK3IIJeXTmNVTg5PMAvbPLeJhXVmEkfBNOi
	Kic9d8bNYjxit3p7b0QY3ULaR/Io+cwWqGAbd4QLoPJ1wO6cUs+iGMp3KqpDCrZ+U01MXiCeMeE
	jXn3R3IlcU4x0zm13l7d1px4AkRMl+vE5kxmea+6FCvrcrr6Jx94UU+SebjPtyuIJG4HdG8gegc
	FrfrkgjoZq9wAazpHi6mpLJ99Gl2ZSt1PdnQfVyD+VRUcAFnDJR6LSZj7l8bZIxIdBnk9kVQb1M
	CNkEVYhke7zD0FW/e7rUuJGaXCTYZfbWSFH5ODwxaS2LbQ+lPDMTXAe70alXtPUF6TKXztrFM9P
	xuE0xiJPran90lgm92ardK6TDQLSX5WmYE2KIquX4VdXtlwhKNTyzUsgCTfxz80sqTsQzpP4Tw8
	71baRLTwDwkjuMrm61Eh65Amwp+auPOZMaZTjeEuEvvzFPzIw0XlwbA5ZTTSxoAqzTwGMUt4CrT
	FCxLhFg+KNaNAJcfEmPMmNWZDqaUw==
X-Received: by 2002:a17:907:d90:b0:c24:6985:d7a1 with SMTP id a640c23a62f3a-c260c7aa1d2mr1326746266b.7.1788966529239;
        Wed, 09 Sep 2026 08:08:49 -0700 (PDT)
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
Subject: [PATCH v9 12/20] xen/riscv: introduce minimal virtual APLIC (vAPLIC) infrastructure
Date: Wed,  9 Sep 2026 17:07:30 +0200
Message-ID: <2317c9e591944d29f77d5759f2b4c7570186e6cf.1788876411.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788876411.git.oleksii.kurochko@gmail.com>
References: <cover.1788876411.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1788966529-508D9B50-9E6824E9/10/73395122804
X-purgate-type: spam
X-purgate-size: 10434

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
Note that already existed init_ops field in struct vintc will be init-ed
for APLIC in the follow up patch.

The vAPLIC implementation of these operations will be provided later
once guests can be run and these operations are actually needed.

Introduce these structures here as they are required for the implementation
of domain_vaplic_init() and domain_vaplic_alloc(). Also, introduce
vaplic_init() and init vintc_ops->vcpu_init() with it.

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v9:
 - Nothing changed. Only rebase.
---
Changes in v8:
 - Drop vaplic_init() and vcpu_imsic_deinit() as they are just calling
   IMSIC related files as we are expecting to work only MSI mode.
 - And add cf_check for vcpu_imsic_(de)init as they are directly used now
   for vintc_ops->vcpu_(de)init.
---
Changes in v7:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
 - Update the comment above init_ops member of vintc structure.
---
Changes in v6:
 - Nothing changed. Only rebase.
---
Changes in v5:
 - Add explanational comments for fields in struct vintc.
 - Drop unnessary empty line in asm/aplic.h.
 - Update the commit message to tell that init_ops will be init-ed later
   in follow up patch.
 - Init. .domaincfg with only APLIC_DOMAINCFG_RO.
 - Update the comment above APLIC_DOMAINCFG_RO.
 - Add defintion for APLIC_DOMAINCFG_BE.
---
Changes in v4:
 - Change subject of the commit.
 - s/APLIC_DOMAINCFG_RO80/APLIC_DOMAINCFG_RO + added a comment above definition.
 - Drop unnessary blank lines.
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
 xen/arch/riscv/domain.c             | 11 ++----
 xen/arch/riscv/imsic.c              |  4 +--
 xen/arch/riscv/include/asm/aplic.h  |  7 ++++
 xen/arch/riscv/include/asm/intc.h   | 12 +++++++
 xen/arch/riscv/include/asm/vaplic.h | 34 +++++++++++++++++++
 xen/arch/riscv/vaplic.c             | 52 +++++++++++++++++++++++++++++
 7 files changed, 111 insertions(+), 10 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/vaplic.h
 create mode 100644 xen/arch/riscv/vaplic.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 8e7a6370eee2..fcd73c7a2dd5 100644
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
index c9933147595e..45712d305975 100644
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
 
diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index 4a2ef5069d0c..809f29af860a 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -318,7 +318,7 @@ static int imsic_parse_node(const struct dt_device_node *node,
     return 0;
 }
 
-int vcpu_imsic_init(struct vcpu *v)
+int cf_check vcpu_imsic_init(struct vcpu *v)
 {
     struct vimsic_state *imsic_state;
 
@@ -342,7 +342,7 @@ int vcpu_imsic_init(struct vcpu *v)
     return 0;
 }
 
-void vcpu_imsic_deinit(struct vcpu *v)
+void cf_check vcpu_imsic_deinit(struct vcpu *v)
 {
     XVFREE(v->arch.vimsic_state);
 }
diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
index b0724fe6f360..5a7fcb6ec4f1 100644
--- a/xen/arch/riscv/include/asm/aplic.h
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -15,8 +15,15 @@
 
 #include <asm/imsic.h>
 
+/*
+ * domaincfg read-only fields (AIA spec):
+ *  - bits [31:24] -> read-only 0x80
+ *  - bit 7        -> read-only 0
+ */
+#define APLIC_DOMAINCFG_RO      (0x80U << 24)
 #define APLIC_DOMAINCFG_IE      BIT(8, U)
 #define APLIC_DOMAINCFG_DM      BIT(2, U)
+#define APLIC_DOMAINCFG_BE      BIT(0, U)
 
 #define APLIC_SOURCECFG_SM_INACTIVE     0x0
 #define APLIC_SOURCECFG_SM_DETACH       0x1
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index a4e678fad90b..875728885292 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -17,6 +17,7 @@ enum intc_variant {
 struct cpu_user_regs;
 struct irq_desc;
 struct kernel_info;
+struct vcpu;
 
 struct intc_info {
     enum intc_variant hw_variant;
@@ -53,8 +54,19 @@ struct vintc_init_ops {
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
+    /* Callbacks invoked during domain construction only. */
     const struct vintc_init_ops *init_ops;
+    /* Runtime callbacks used for the lifetime of the guest. */
+    const struct vintc_ops *ops;
 };
 
 void intc_preinit(void);
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
index 000000000000..c9f188b989a3
--- /dev/null
+++ b/xen/arch/riscv/vaplic.c
@@ -0,0 +1,52 @@
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
+static const struct vintc_ops vintc_ops = {
+    .vcpu_init = vcpu_imsic_init,
+    .vcpu_deinit = vcpu_imsic_deinit,
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
+    vaplic->regs.domaincfg = APLIC_DOMAINCFG_RO;
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
2.55.0


