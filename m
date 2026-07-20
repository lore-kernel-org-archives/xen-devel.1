Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E0BC4452E
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:01:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366999.1616883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqQD-0000xI-K3; Mon, 20 Jul 2026 16:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366999.1616883; Mon, 20 Jul 2026 16:00:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqQD-0000vT-4x; Mon, 20 Jul 2026 16:00:49 +0000
Received: by outflank-mailman (input) for mailman id 1366999;
 Mon, 20 Jul 2026 16:00:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqQB-0000bp-Uj
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:00:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqQB-00HTZO-7R
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:00:47 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e4626-2eae-0a2a0a5409dd-0a2a450acce8-26
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:47 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e462f-f2d2-0a2a450a0019-d155dd34a47b-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:47 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-4758bd3731bso3213523f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:00:47 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63edd7d3sm30084673f8f.25.2026.07.20.09.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:00:45 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784563246; x=1785168046; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZoeTmaEjyoYEs4a5u0hn2/Wi0J0r3D+XAH8l4guCWVY=;
        b=rpNHJbl7uiD6gRzRvnsI3dLdUM1FzVSbzMNANZo2td+cPTJkGokGFXlUOu9efhzqVz
         Bl9KaOScxWcCp1CbAgaoZ6WPvpzop9psr6TH+aVvavO+P5jOv9GP5RLNO+8b04Dyeu7t
         UMS9QdsixWNZusVvhBmnQyg+VXgQxGfT1i1cKrC/b/w8NOXRdzls4Pr6D+UTleYe7tPd
         XwIS1WjlhMoosUVCd3aVXuyjCxy40ibezgm8jNHzsEsfmTNGYtJHLiIq4dj/8NM9OsjX
         oEZr1X5Fdhrupbdx7m2nvi6jtz8sA7YTxfSq9NB/Y5G3GgFfKRMpYFIgAoCjU32B1Vth
         Z5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563246; x=1785168046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZoeTmaEjyoYEs4a5u0hn2/Wi0J0r3D+XAH8l4guCWVY=;
        b=EpcnH18iffsGsTkWhD3WH7aLCCcK1az960ROY7/VPCYQDXcPUTSDboxdaWYq06rmaa
         TjNDnGSuJhpUY2E9xohu22Sa1rn5UXFaCkL+oSonWz3xEQkP0C653ee+/oDWauqx8E36
         KWx7L9smffZfRCN8G4V2flvrzTrLhGbbXDEDcKaaFKah5vJHDaeI1WAgNR7gTZz2mDz3
         8hO5CEHg+g9elVL0Tq15dIkGJqdT4qZM75jU6yK/hTQA1xu5J5nmTL0sAlTLIKXI6IJP
         7lGrj6vrCfA17TcB50QjtinPP/j6pa8zIc38QL2JICn1+S5L40H0gWye7U9l+mQmJ8Fp
         SuHA==
X-Gm-Message-State: AOJu0YwAhnqIX2qilbulKvUEbjnVi14uZ0nZpTUhhNq57xzPNzagdYQM
	S8ABPm3pSslUil0bxBfYSAIT8PPXOczmeqmI55fgZu2ZlNts8tmSU+WZdOSVbw==
X-Gm-Gg: AR+sD12Vxac7whPQR6CMetfm9XdRESW/kVZ0NMnQ3SbSWJJbkdHvebyr4yXbgSfa07z
	El4rnPIJ2EnWVJ1YXadqxF1rzh/S7ch4mELlYZ3RvlORKXYSUEe6s2kAb8lNK9NzKNnWeWFnGyM
	sqZDklGdN5FgUOhtJkUQzc1B468yenVBU9xPJLOTQ7rH/IsxOY206gHdFIfowhWahXbmMmNikxv
	RccIPOEEB1MDRMaPFrmHMvnS5pmAoc4D9hFzpyI3HrOtpAYbwbiVPSeQDpz+MnOP8IsTH86YBOh
	ujFul1DQFlD3OQHitx8nOlVoDzQpJJlWmtyoMFwf2qKsXqW9WxlCWupbZxEd+k1IKs2Lp9+pyhU
	hbdZFU2KsoysK8E6m8HSMN8oEHy7f8533cfj2rPHgqtwTdEml7t9DYmJZcQujOOSpQ/r4wv9xUA
	RpF8E/8s2L+Os7U4qhAKVXqwQMW62zpckchZM+X06rdy/Eu7+wqX9feo+PRA==
X-Received: by 2002:a05:6000:4712:b0:473:c2ec:7a79 with SMTP id ffacd0b85a97d-47f623bc38bmr16610617f8f.12.1784563246225;
        Mon, 20 Jul 2026 09:00:46 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v6 18/23] xen/riscv: implement IRQ routing for device passthrough
Date: Mon, 20 Jul 2026 17:59:59 +0200
Message-ID: <c489a420b1c01c5312773c2e2b51f63d3babf855.1784559209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784559209.git.oleksii.kurochko@gmail.com>
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1784563247-583CCCFC-56A9073C/10/73395122804
X-purgate-type: spam
X-purgate-size: 22639

dom0less device passthrough requires granting guest domains access to
device interrupts.  Introduce map_device_irqs_to_domain() to enumerate
a DT node's interrupt properties, skipping those not owned by
the primary interrupt controller (as at the moment I haven't seen usages
of it), and map_irq_to_domain() to grant domain access and configure
Xen's interrupt descriptor accordingly. Sharing IRQ between domains is
rejected.

Both map_irq_to_domain() and map_device_irqs_to_domain() are marked
__overlay_init, mirroring Arm: without CONFIG_OVERLAY_DTB this expands to
__init, so the functions are init-only and need no XSM check; with
CONFIG_OVERLAY_DTB they become runtime-callable, but the only runtime
entry point is dt_overlay_domctl(), which performs the XSM checks at the
domctl layer.  RISC-V does not wire up DT overlay yet, so today these are
strictly __init; if/when overlay support is added, the domctl-level XSM
gating must be added together with it, as on Arm.

route_irq_to_guest() and release_irq() manage irq_desc ownership for
guest-assigned interrupts.  Each assignment carries a small irq_guest
structure as irqaction::dev_id, recording the owning domain and virtual
IRQ number which is 1:1 mapped to physical IRQ number.  A per-domain
vIRQ allocation bitmap (used_irqs in struct vintc), managed by
vintc_reserve_virq(), prevents the same vIRQ being claimed twice.

Host and guest interrupts may differ in some operations (EOI timing in
particular, possibly others): a host IRQ is completed once Xen's handler
runs, whereas a passthrough IRQ must defer the physical completion until
the guest issues its own EOI, otherwise a still-asserted level line would
immediately retrigger and storm.  This affects only the .end callback;
the rest of hw_interrupt_type is shared, hence the separate host and
guest hw_interrupt_type instances.

With APLIC+IMSIC, guest interrupts are delivered directly by hardware
through the IMSIC, bypassing do_IRQ(). The _IRQ_GUEST branch in
do_IRQ() is therefore left as BUG() until a platform without direct
IMSIC delivery is encountered.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v6:
 - size nr_virqs as guest_aplic_num_sources + 1 to reserve APLIC's 1-indexed
   source 0, so the highest source/irq could be reserved.
---
Changes in v5:
 - add early -EINVAL return in route_irq_to_guest() if domain is dying
 - use __clear_bit() instead of clear_bit() in release_guest_irq()
   since desc->lock is already held
 - remove irq_get_domain() wrapper; inline irq_get_guest_info(desc)->d
    at its single call site
 - reword IRQ_GUEST comment in do_IRQ() for clarity
 - move XVFREE(used_irqs) before the switch so it is freed prior to
   variant-specific vintc teardown
 - fix missing space in dt_dprintk() format string split across lines
 - Drop 'inline' for irq_get_guest_info() and leave it only static.
 - Drop xfree(info) from release_guest_irq() to avoid a potential
   dangling-pointer issue with the ->dev_id field. Now that
   'struct irqaction action;' is embedded into 'struct irq_guest',
   'info' will be freed as part of release_irq() at the end.
---
Changes in v4:
 - Update the commit message.
 - Mark map_irq_to_domain() and map_device_irqs_to_domain() as
   __overlay_init (mirroring Arm) and include <xen/dt-overlay.h>.
 - Fix grammar in the controller-skip comment ("IRQ" -> "IRQs").
 - Drop the redundant 'base' local in guest_imsic_make_reg_property();
   use GUEST_IMSIC_S_BASE directly.
 - Rename vintc::irq_nums -> nr_virqs and update all users.
 - Guard domain_vintc_deinit() against a NULL d->arch.vintc.
 - Use smp_rmb() instead of smp_mb() in release_irq()'s wait loop and
   document how it pairs with the spin_unlock() in do_IRQ().
 - In release_guest_irq(), reject live unrouting from a non-dying domain
   (-EBUSY) and clear _IRQ_GUEST under desc->lock so a concurrent
   release for the same IRQ bails out instead of double-freeing 'info'.
 - Tidy spurious whitespace in release_irq()'s spin_lock/unlock calls.
---
Changes in v3:
 - Drop extraneous "to" from "Unable to permit to %pd" message.
 - Move res/irq/rirq to loop scope; use nirq as declaration initializer.
 - Hoist irq_ranges check before the loop (it is loop-invariant).
 - Remove spurious forward declarations (struct dt_device_node, struct
   rangeset) from intc.h; remove all three from setup.h.
 - Use __set_bit() instead of set_bit() in intc_route_irq_to_guest()
   since desc->lock is always held on every write path for desc->status.
 - Use XVFREE() instead of xvfree() in domain_vintc_deinit().
 - Rename allocated_irqs -> used_irqs in struct vintc.
 - Fix dangling desc->action in release_irq()'s !IRQ_HAS_MULTIPLE_ACTION
   path by nulling *action_ptr after saving the action pointer.
 - Use true (not 1) for free_on_release in route_irq_to_guest().
 - Use %pd for domain printing in route_irq_to_guest() error paths.
 - Introduce release_guest_irq() to pair with route_irq_to_guest() and
   plug the irq_guest info leak; call it from domain_vintc_deinit()
   for each vIRQ recorded in used_irqs.
---
Changes in v2:
 - Rework IRQ mapping in more common (similar approach to Arm).
---
---
 xen/arch/riscv/Makefile           |   1 +
 xen/arch/riscv/aplic.c            |   4 +
 xen/arch/riscv/device.c           |  94 ++++++++++++
 xen/arch/riscv/include/asm/intc.h |   9 ++
 xen/arch/riscv/include/asm/irq.h  |   5 +
 xen/arch/riscv/intc.c             |  45 ++++++
 xen/arch/riscv/irq.c              | 238 ++++++++++++++++++++++++++++++
 xen/arch/riscv/vaplic.c           |   9 ++
 8 files changed, 405 insertions(+)
 create mode 100644 xen/arch/riscv/device.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 9d8d21b65188..fc6b34661111 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -1,6 +1,7 @@
 obj-y += aia.o
 obj-y += aplic.o
 obj-y += cpufeature.o
+obj-y += device.o
 obj-y += domain.o
 obj-y += domain-build.init.o
 obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.init.o
diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index e02d78999b77..fe319041cece 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -306,9 +306,13 @@ static const hw_irq_controller aplic_xen_irq_type = {
     .set_affinity = aplic_set_irq_affinity,
 };
 
+/* At the moment there is no difference between guest and Xen ops */
+#define aplic_guest_irq_type aplic_xen_irq_type
+
 static const struct intc_hw_operations aplic_ops = {
     .info                = &aplic_info,
     .host_irq_type       = &aplic_xen_irq_type,
+    .guest_irq_type      = &aplic_guest_irq_type,
     .handle_interrupt    = aplic_handle_interrupt,
     .set_irq_type        = aplic_set_irq_type,
 };
diff --git a/xen/arch/riscv/device.c b/xen/arch/riscv/device.c
new file mode 100644
index 000000000000..f54d0fdaa7ab
--- /dev/null
+++ b/xen/arch/riscv/device.c
@@ -0,0 +1,94 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <xen/device_tree.h>
+#include <xen/dt-overlay.h>
+#include <xen/errno.h>
+#include <xen/iocap.h>
+#include <xen/rangeset.h>
+#include <xen/sched.h>
+
+#include <asm/intc.h>
+
+int __overlay_init map_irq_to_domain(struct domain *d, unsigned int irq,
+                                     bool need_mapping, const char *devname)
+{
+    int res;
+
+    res = irq_permit_access(d, irq);
+    if ( res )
+    {
+        printk(XENLOG_ERR "Unable to permit %pd access to IRQ %u\n", d, irq);
+        return res;
+    }
+
+    if ( need_mapping )
+    {
+        /*
+         * Checking the return of vintc_reserve_virq is not
+         * necessary. It should not fail except when we try to map
+         * the IRQ twice. This can legitimately happen if the IRQ is shared.
+         */
+        vintc_reserve_virq(d, irq);
+
+        res = route_irq_to_guest(d, irq, irq, devname);
+        if ( res < 0 )
+        {
+            printk(XENLOG_ERR "Unable to map IRQ%u to %pd\n", irq, d);
+            return res;
+        }
+    }
+
+    dt_dprintk("  - IRQ: %u\n", irq);
+
+    return 0;
+}
+
+int __overlay_init map_device_irqs_to_domain(struct domain *d,
+                                             struct dt_device_node *dev,
+                                             bool need_mapping,
+                                             struct rangeset *irq_ranges)
+{
+    unsigned int i, nirq = dt_number_of_irq(dev);
+
+    if ( irq_ranges )
+        return -EOPNOTSUPP;
+
+    /* Give permission and map IRQs */
+    for ( i = 0; i < nirq; i++ )
+    {
+        int res, irq;
+        struct dt_raw_irq rirq;
+
+        res = dt_device_get_raw_irq(dev, i, &rirq);
+        if ( res )
+        {
+            printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
+                   i, dt_node_full_name(dev));
+            return res;
+        }
+
+        /*
+         * Don't map IRQs that have no physical meaning
+         * ie: IRQs whose controller is not APLIC/IMSIC/PLIC.
+         */
+        if ( rirq.controller != dt_interrupt_controller )
+        {
+            dt_dprintk("irq %u not connected to primary controller. Connected to %s\n",
+                       i, dt_node_full_name(rirq.controller));
+            continue;
+        }
+
+        irq = platform_get_irq(dev, i);
+        if ( irq < 0 )
+        {
+            printk("Unable to get irq %u for %s\n", i, dt_node_full_name(dev));
+            return irq;
+        }
+
+        res = map_irq_to_domain(d, irq, need_mapping, dt_node_name(dev));
+        if ( res )
+            return res;
+    }
+
+    return 0;
+}
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index dad4c5fab08b..2ee5d1533c8e 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -15,6 +15,7 @@ enum intc_variant {
 };
 
 struct cpu_user_regs;
+struct domain;
 struct irq_desc;
 struct kernel_info;
 struct vcpu;
@@ -34,6 +35,9 @@ struct intc_hw_operations {
     /* hw_irq_controller to enable/disable/eoi host irq */
     const struct hw_interrupt_type *host_irq_type;
 
+    /* hw_irq_controller to enable/disable/eoi guest irq */
+    const struct hw_interrupt_type *guest_irq_type;
+
     /* Set IRQ type */
     void (*set_irq_type)(struct irq_desc *desc, unsigned int type);
     /* Set IRQ priority */
@@ -63,6 +67,8 @@ struct vintc_ops {
 };
 
 struct vintc {
+    unsigned int nr_virqs;
+    unsigned long *used_irqs;
     /* Used during domain build only; dropped afterwards. */
     const struct vintc_init_ops *init_ops;
     /* Runtime callbacks used for the lifetime of the guest. */
@@ -76,10 +82,13 @@ void register_intc_ops(const struct intc_hw_init_ops *init_ops);
 void intc_init(void);
 
 void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority);
+int intc_route_irq_to_guest(struct irq_desc *desc, unsigned int priority);
 
 void intc_handle_external_irqs(struct cpu_user_regs *regs);
 
 int domain_vintc_init(struct domain *d);
 void domain_vintc_deinit(struct domain *d);
 
+bool vintc_reserve_virq(const struct domain *d, unsigned int virq);
+
 #endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */
diff --git a/xen/arch/riscv/include/asm/irq.h b/xen/arch/riscv/include/asm/irq.h
index 62648bdc4252..66067747dc0f 100644
--- a/xen/arch/riscv/include/asm/irq.h
+++ b/xen/arch/riscv/include/asm/irq.h
@@ -52,6 +52,11 @@ void init_IRQ(void);
 
 void do_IRQ(struct cpu_user_regs *regs, unsigned int irq);
 
+int route_irq_to_guest(struct domain *d, unsigned int virq,
+                       unsigned int irq, const char *devname);
+
+int release_guest_irq(struct domain *d, unsigned int virq);
+
 #endif /* ASM__RISCV__IRQ_H */
 
 /*
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index f5c8af6ddea4..372c8d3a20f9 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -7,7 +7,9 @@
 #include <xen/init.h>
 #include <xen/irq.h>
 #include <xen/lib.h>
+#include <xen/sched.h>
 #include <xen/spinlock.h>
+#include <xen/xvmalloc.h>
 
 #include <asm/aia.h>
 #include <asm/intc.h>
@@ -78,6 +80,22 @@ void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
     intc_set_irq_priority(desc, priority);
 }
 
+int intc_route_irq_to_guest(struct irq_desc *desc,
+                            unsigned int priority)
+{
+    ASSERT(spin_is_locked(&desc->lock));
+
+    ASSERT(intc_hw_ops->guest_irq_type);
+
+    desc->handler = intc_hw_ops->guest_irq_type;
+    __set_bit(_IRQ_GUEST, &desc->status);
+
+    intc_set_irq_type(desc, desc->arch.type);
+    intc_set_irq_priority(desc, priority);
+
+    return 0;
+}
+
 int __init make_intc_domU_node(struct kernel_info *kinfo)
 {
     const struct vintc *vintc = kinfo->bd.d->arch.vintc;
@@ -101,12 +119,31 @@ int domain_vintc_init(struct domain *d)
         break;
     }
 
+    if ( !ret )
+    {
+        d->arch.vintc->used_irqs =
+            xvzalloc_array(unsigned long,
+                           BITS_TO_LONGS(d->arch.vintc->nr_virqs));
+        if ( !d->arch.vintc->used_irqs )
+            ret = -ENOMEM;
+    }
+
     return ret;
 }
 
 void domain_vintc_deinit(struct domain *d)
 {
     const enum intc_variant variant = intc_hw_ops->info->hw_variant;
+    unsigned int virq;
+
+    if ( !d->arch.vintc )
+        return;
+
+    for ( virq = 0; virq < d->arch.vintc->nr_virqs; virq++ )
+        if ( test_bit(virq, d->arch.vintc->used_irqs) )
+            release_guest_irq(d, virq);
+
+    XVFREE(d->arch.vintc->used_irqs);
 
     switch ( variant )
     {
@@ -118,3 +155,11 @@ void domain_vintc_deinit(struct domain *d)
         break;
     }
 }
+
+bool vintc_reserve_virq(const struct domain *d, unsigned int virq)
+{
+    if ( virq >= d->arch.vintc->nr_virqs )
+        return false;
+
+    return !test_and_set_bit(virq, d->arch.vintc->used_irqs);
+}
diff --git a/xen/arch/riscv/irq.c b/xen/arch/riscv/irq.c
index b5066fc3e981..6e9972e5059d 100644
--- a/xen/arch/riscv/irq.c
+++ b/xen/arch/riscv/irq.c
@@ -12,11 +12,29 @@
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/irq.h>
+#include <xen/sched.h>
 #include <xen/spinlock.h>
+#include <xen/xvmalloc.h>
 
 #include <asm/hardirq.h>
 #include <asm/intc.h>
 
+/*
+ * Describe an IRQ assigned to a guest.
+ *
+ * The irqaction is embedded here (rather than allocated separately with
+ * its dev_id pointing at a standalone struct irq_guest) so that freeing
+ * the action in release_irq() also frees this whole structure in one go.
+ * That avoids the alternative of release_irq()'s caller having to free
+ * dev_id itself (something like in Arm release_guest_irq()).
+ */
+struct irq_guest
+{
+    struct irqaction action;
+    struct domain *d;
+    unsigned int virq;
+};
+
 static irq_desc_t irq_desc[NR_IRQS];
 
 struct irq_desc *irq_to_desc(unsigned int irq)
@@ -198,6 +216,14 @@ void do_IRQ(struct cpu_user_regs *regs, unsigned int irq)
     if ( desc->handler->ack )
         desc->handler->ack(desc);
 
+    if ( desc->status & IRQ_GUEST )
+        /*
+         * With APLIC + IMSIC, guest interrupts bypass Xen and are delivered
+         * directly to the guest. Without IMSIC, interrupts would be trapped
+         * by Xen and would need injecting into the guest here.
+         */
+        panic("unimplemented");
+
     if ( desc->status & IRQ_DISABLED )
         goto out;
 
@@ -227,3 +253,215 @@ void do_IRQ(struct cpu_user_regs *regs, unsigned int irq)
     spin_unlock(&desc->lock);
     irq_exit();
 }
+
+static struct irq_guest *irq_get_guest_info(struct irq_desc *desc)
+{
+    ASSERT(spin_is_locked(&desc->lock));
+    ASSERT(test_bit(_IRQ_GUEST, &desc->status));
+    ASSERT(desc->action != NULL);
+
+    return desc->action->dev_id;
+}
+
+
+void release_irq(unsigned int irq, const void *dev_id)
+{
+    struct irq_desc *desc;
+    unsigned long flags;
+    struct irqaction *action, **action_ptr;
+
+    desc = irq_to_desc(irq);
+
+    spin_lock_irqsave(&desc->lock, flags);
+
+    action_ptr = &desc->action;
+#ifdef CONFIG_IRQ_HAS_MULTIPLE_ACTION
+    for ( ;; )
+    {
+        action = *action_ptr;
+        if ( !action )
+        {
+            printk(XENLOG_WARNING "Trying to free already-free IRQ %u\n", irq);
+            spin_unlock_irqrestore(&desc->lock, flags);
+            return;
+        }
+
+        if ( action->dev_id == dev_id )
+            break;
+
+        action_ptr = &action->next;
+    }
+
+    /* Found it - remove it from the action list */
+    *action_ptr = action->next;
+#else
+    action = *action_ptr;
+    *action_ptr = NULL;
+#endif
+
+    /* If this was the last action, shut down the IRQ */
+    if ( !desc->action )
+    {
+        desc->handler->shutdown(desc);
+        __clear_bit(_IRQ_GUEST, &desc->status);
+    }
+
+    spin_unlock_irqrestore(&desc->lock, flags);
+
+    /*
+     * Wait to make sure it's not being used on another CPU.
+     *
+     * The read barrier pairs with the spin_unlock() in do_IRQ(): once we
+     * observe _IRQ_INPROGRESS cleared, we are guaranteed to also see the
+     * writes do_IRQ() made to desc (e.g. desc->action) before releasing the
+     * lock, so it is safe to free the action below.
+     */
+    do { smp_rmb(); } while ( test_bit(_IRQ_INPROGRESS, &desc->status) );
+
+    if ( action->free_on_release )
+        xvfree(action);
+}
+
+int release_guest_irq(struct domain *d, unsigned int virq)
+{
+    struct irq_desc *desc = irq_to_desc(virq);
+    struct irq_guest *info;
+    unsigned long flags;
+    int ret = -EINVAL;
+
+    spin_lock_irqsave(&desc->lock, flags);
+
+    if ( !test_bit(_IRQ_GUEST, &desc->status) )
+        goto unlock_err;
+
+    info = irq_get_guest_info(desc);
+    if ( d != info->d )
+        goto unlock_err;
+
+    /*
+     * Live IRQ unrouting from a running domain is not supported: the tear-down
+     * drops desc->lock across release_irq()/xvfree() and relies on no
+     * concurrent route_irq_to_guest() being issued for this domain. Only permit
+     * it for a dying domain, where assignment is frozen and no new routes can
+     * appear.
+     */
+    if ( !d->is_dying )
+    {
+        ret = -EBUSY;
+        goto unlock_err;
+    }
+
+    /*
+     * Clear _IRQ_GUEST while still holding the lock so that a concurrent
+     * release_guest_irq() for the same IRQ observes it and bails out, rather
+     * than capturing the same 'info' and double-freeing it below.
+     */
+    __clear_bit(_IRQ_GUEST, &desc->status);
+
+    spin_unlock_irqrestore(&desc->lock, flags);
+
+    release_irq(desc->irq, info);
+
+    return 0;
+
+ unlock_err:
+    spin_unlock_irqrestore(&desc->lock, flags);
+    return ret;
+}
+
+/* Route an IRQ to a specific guest */
+int route_irq_to_guest(struct domain *d, unsigned int virq,
+                       unsigned int irq, const char *devname)
+{
+    struct irqaction *action;
+    struct irq_guest *info;
+    struct irq_desc *desc;
+    unsigned long flags;
+    int retval = 0;
+
+    if ( d->is_dying )
+        return -EINVAL;
+
+    desc = irq_to_desc(irq);
+
+    /*
+     * release_irq() frees this action via xvfree(), relying on action
+     * being the first member of struct irq_guest so that &info->action
+     * coincides with info itself. Guard the layout so a future field
+     * reorder can't silently turn that into a free() of a mid-allocation
+     * pointer.
+     */
+    BUILD_BUG_ON(offsetof(struct irq_guest, action) != 0);
+
+    info = xvmalloc(struct irq_guest);
+    if ( !info )
+        return -ENOMEM;
+
+    info->d = d;
+    info->virq = virq;
+
+    action = &info->action;
+    action->dev_id = info;
+    action->name = devname;
+    action->free_on_release = true;
+
+    spin_lock_irqsave(&desc->lock, flags);
+
+    /*
+     * If the IRQ is already used by someone
+     *  - If it's the same domain -> Xen doesn't need to update the IRQ desc.
+     *  For safety check if we are not trying to assign the IRQ to a
+     *  different vIRQ.
+     *  - Otherwise -> For now, don't allow the IRQ to be shared between
+     *  Xen and domains.
+     */
+    if ( desc->action != NULL )
+    {
+        if ( test_bit(_IRQ_GUEST, &desc->status) )
+        {
+            struct domain *ad = irq_get_guest_info(desc)->d;
+
+            if ( d != ad )
+            {
+                printk(XENLOG_G_ERR "IRQ %u is already used by %pd\n",
+                       irq, ad);
+                retval = -EBUSY;
+            }
+            else if ( irq_get_guest_info(desc)->virq != virq )
+            {
+                printk(XENLOG_G_ERR
+                       "%pd: IRQ %u is already assigned to vIRQ %u\n",
+                       d, irq, irq_get_guest_info(desc)->virq);
+                retval = -EBUSY;
+            }
+        }
+        else
+        {
+            printk(XENLOG_G_ERR "IRQ %u is already used by Xen\n", irq);
+            retval = -EBUSY;
+        }
+        goto out;
+    }
+
+    retval = _setup_irq(desc, 0, action);
+    if ( retval )
+        goto out;
+
+    retval = intc_route_irq_to_guest(desc, IRQ_NO_PRIORITY);
+
+    spin_unlock_irqrestore(&desc->lock, flags);
+
+    if ( retval )
+    {
+        release_irq(desc->irq, info);
+        return retval;
+    }
+
+    return 0;
+
+ out:
+    spin_unlock_irqrestore(&desc->lock, flags);
+    xvfree(info);
+
+    return retval;
+}
diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
index e6af63ec59d7..449240c5cd23 100644
--- a/xen/arch/riscv/vaplic.c
+++ b/xen/arch/riscv/vaplic.c
@@ -123,6 +123,15 @@ int domain_vaplic_init(struct domain *d)
 
     vaplic->regs.domaincfg = APLIC_DOMAINCFG_RO;
 
+    /*
+     * APLIC source 0 is reserved; sources are numbered 1..guest_aplic_num_sources
+     * and used directly as indices into used_irqs. Size the bitmap to
+     * guest_aplic_num_sources + 1 so the highest source has a valid slot
+     * (index 0 stays unused). Without the +1, vintc_reserve_virq() can't record
+     * the top source, so domain_vintc_deinit() never releases it.
+     */
+    d->arch.vintc->nr_virqs = guest_aplic_num_sources + 1;
+
     return 0;
 }
 
-- 
2.54.0


