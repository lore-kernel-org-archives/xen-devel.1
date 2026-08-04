Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84043C55184
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 15:48:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382280.1625725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHNf-0001dU-3X; Tue, 04 Aug 2026 15:48:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382280.1625725; Tue, 04 Aug 2026 15:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHNe-0001bl-6I; Tue, 04 Aug 2026 15:48:38 +0000
Received: by outflank-mailman (input) for mailman id 1382280;
 Tue, 04 Aug 2026 15:48:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wrHNc-0001I1-LM
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 15:48:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrHNc-009Gcw-1e
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 17:48:36 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7209c9-bab6-0a2a0a5309dd-0a2a4508eace-12
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:48:35 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7209d3-f659-0a2a45080019-d1558033ac15-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:48:35 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-495590dde14so34298045e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 08:48:35 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49949fcb46esm116430355e9.5.2026.08.04.08.48.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2026 08:48:35 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785858515; x=1786463315; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l7ZIghm4wlZpqQWikoFDy/4FVF6m3wHWKUUWrNvkWao=;
        b=ZTtd98gIekj8jEQRyKWKcBTNE6Pd8sn+nYTZsJfn9tDcE+mMVW6LsaZUhPpweZEZAV
         37nmU3i9gsPYsg9lbi3vicfBjZ1yy0o2DgdlW3ziIxeg8OHGW1SnmEPCZCMeps6MGIzJ
         2s9h+ueoOnnXUyS7FVarmeF1fUEedBnStMq13Udth8vYkoxRzgdBI5a7tEJuajHUelEU
         dxWJu/sYCvTrRldA3ILn/tQISeAkMw1vm+eGBa4S1fgKMYPJnDD4bAGuX7sNj3wAD445
         nCP9FutvThgjTvJVO5W8HRXYiiA5Y7UZwrVgKQT7mfi3aDf+PiqQf+IcifOCU0twdeH5
         URPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785858515; x=1786463315;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l7ZIghm4wlZpqQWikoFDy/4FVF6m3wHWKUUWrNvkWao=;
        b=CHHoqig/WU5M6+xWzN0oz8sH0uc7pwR/LIXLJeULMxJXPVD90hFIFI80K1Uw6up+SY
         wRGA6UeKqSQkIZ4qpDSY+9k4c39NYhbkrJo7uOpbhesbXQ1PNMwc7ysx68INwZ+uGbt4
         3fNygtA9XMxddfWZO841tsPXfklWoS4Kw61BYh6q+oePcUCuDpBaWXdQOepyuNH78/Ar
         Pi06yfrO0xiv7dUEe724ysWPm1i/Q1NJM3jCrRRt0gkSdyLOcvSlyrQeJ9DlRWUSQvCv
         Bp3Mr7cnlYZ8EoPazIurtFqZRahRDQxiXqpzC0llD7x1KW2cko88v3MCIlMGVcmGQpFC
         HvWA==
X-Gm-Message-State: AOJu0Yx3K58epaimVj6G4JIdnLs6nSZI6ivtF6zoSU7uVkDtE64jlCOy
	lcu1Nlv6IVKPi1pkQ+znmU1NesGgLfJQyg7tOMsA/97zg0gfnN6AdXYMhfMcNg==
X-Gm-Gg: AR+sD11xTBXWCcEWlh0tETy/kgeLuVl8+tE3FbxhpIL9EDM+XVnWvumrff9V1OBv/N5
	icQSGWhuRDodfOotMQs2lnejplhuVD+1GNe5OAWaInX/1O1jpBEpg40o3iiPb14wn4i77wOhyms
	7MUhMRX3VZtlhwwcj4Vn9DDC4tXRJzAmcDdQcgHgHxOvVkwex5XNVMhN27+qReImL7Zzqr+UgqJ
	7uLJmSUx/4lC08hjE8j7O5Sue13H0EOEM3mMC/L4WaSAXvUaFIYRCmOGcX5tMztdFlL/eyRQP8N
	KA9m8qW8/ywWxNDVkBnjNUS4aRznjU/tUzHSskz/z6aXBIqCt0XMktlU+Rb2d22ghQ3kc9hftix
	MFFiDQTxoH4Tu2T1iPHI3sMEAyqJ/bYtZ5I8NDoE6RbEY6qJ0wGdXNB7QNaVBnO0udUhBNlOuzI
	TR1bTRPdCac8L3/N7Y1L4m0UmMpyGaoGlgsKRGinoUNXrCDWijjNES0ZSNcq9/Zl2krVZPypZqi
	J0wVLXV3UkFnyhmgrr++419v1tpYYvKDg==
X-Received: by 2002:a05:600c:8b54:b0:495:4859:8f9b with SMTP id 5b1f17b1804b1-4980c674f25mr402292425e9.9.1785858515349;
        Tue, 04 Aug 2026 08:48:35 -0700 (PDT)
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 14/20] xen/riscv: generate IMSIC DT node for guest domains
Date: Tue,  4 Aug 2026 17:48:04 +0200
Message-ID: <c75d73c0153a036b300173ef2d5937d91849b36c.1785836421.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785836421.git.oleksii.kurochko@gmail.com>
References: <cover.1785836421.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1785858515-D497287B-E186827D/10/73395122804
X-purgate-type: spam
X-purgate-size: 10732

Guests using the IMSIC interrupt controller require a corresponding
Device Tree description.

Add support for generating an IMSIC node when building the guest DT.
This allows guests to discover and use the IMSIC interrupt controller.

The value choosen for GUEST_IMSIC_S_BASE is an address which is typically
used for IMSIC and QEMU.

DT-building functions are marked __init because domain creation happens at
boot time, before the init sections are freed. In a typical deployment
libxl creates the interrupt controller node in userspace and hands the
complete FDT to Xen, so these functions are only called during early
domain construction.

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v7:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v6:
 - Simplify initialization of guest_num_msis.
 - s/sizeof(vimsic_name)/ARRAY_SIZE(...).
 - Add empty line between declaration(s) and statement(s) in make_domu_dt_node().
 - define GUEST_IMSIC_MAX_MSIS as 255U to avoid '+0U' when min(...) is used.
---
Changes in v5:
 - s/GUEST_IMSIC_NUM_MSIS/GUEST_IMSIC_MAX_MSIS throughout.
 - Changed __read_mostly → __ro_after_init on guest_num_msis, since the value
   is set once during __init and never again.
 - Made imsic_parse_node() __init.
 - Moved the min(GUEST_IMSIC_MAX_MSIS, ...) cap into imsic_parse_node() right
   after guest_num_msis is assigned, so the bound is applied once at init
   time rather than on every DT node construction call.
 - Removed the now-unnecessary num_msis local variable from
   vimsic_make_domu_dt_node(); guest_num_msis is used directly.
 - s/snprintf(buf, sizeof(buf), ...)/snprintf(buf, ARRAY_SIZE(buf), ...)
   in guest_imsic_set_interrupt_extended_prop().
 - Added decl. of vimsic_make_domu_dt_node() in this patch instead of next.
---
Changes in v4:
 - Add a comment for guest_num_msis explaining that it is host-dependent
   and therefore identical for every domain, which is why a single global
   is used instead of a per-domain value.
 - Reduce vimsic_name[] from 128 to 32 bytes, which is enough to hold
   "/soc/imsic@" plus a 64-bit hex address.
 - Add a comment before GUEST_IMSIC_S_BASE noting that the value is the
   address typically used for IMSIC by QEMU.
 - s/__ULL/_UL for defintion of GUEST_IMSIC_S_BASE.
---
Changes in v3:
 - s/__ro_after_init/__read_mostly for guest_num_msis.
 - Use IMSIC_MAX_ID as default for guest_num_msis instead of imsic_cfg.nr_ids.
 - Drop base_addr local variable in guest_imsic_make_reg_property(); use
   GUEST_IMSIC_S_BASE directly and introduce size to avoid spelling
   IMSIC_MMIO_PAGE_SZ * d->max_vcpus twice.
 - Change irq_ext type from uint32_t * to __be32 * in
   guest_imsic_set_interrupt_extended_prop().
 - Move phandle declaration into the loop body.
 - Extend commit message to explain why __init is used for DT-building
   functions: libxl creates the interrupt controller node before handing
   the FDT to Xen, so these functions are only invoked during boot-time
   domain construction.
 - Re-order patch before APLIC DT node creation patch.
 - Update commit message.
---
Changes in v2:
 - s/imsic_make_reg_property/guest_imsic_make_reg_property.
 - s/imsic_set_interrupt_extended_prop/guest_imsic_set_interrupt_extended_prop.
 - Use initalizer for regs[] array in imsic_make_reg_property().
 - Move buf[] insde the for() loop.
 - Correct check of returned phandle.
 - Drop local variable len.
 - /s/XVFREE/xvfree in imsic_set_interrupt_extended_prop().
 - Drop initializer for local variable data.
 - s/uint32_t/unsinged int for pos and cpu in imsic_set_interrupt_extended_prop().
 - Drop next_phandle as it is now in common code.
 - Introduce vcpu_imsic_deinit.
 - Refactor vimsic_make_domu_dt_node() to avoid usage of host IMSIC dt node.
---
---
 xen/arch/riscv/imsic.c                    | 143 +++++++++++++++++++++-
 xen/arch/riscv/include/asm/guest-layout.h |   6 +
 xen/arch/riscv/include/asm/imsic.h        |   3 +
 3 files changed, 151 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index 5a5758e45dc2..ffce77209c26 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -13,8 +13,12 @@
 #include <xen/const.h>
 #include <xen/cpumask.h>
 #include <xen/device_tree.h>
+#include <xen/domain.h>
 #include <xen/errno.h>
+#include <xen/fdt-domain-build.h>
+#include <xen/fdt-kernel.h>
 #include <xen/init.h>
+#include <xen/libfdt/libfdt.h>
 #include <xen/macros.h>
 #include <xen/sched.h>
 #include <xen/smp.h>
@@ -34,6 +38,21 @@ static struct imsic_config imsic_cfg = {
     .lock = SPIN_LOCK_UNLOCKED,
 };
 
+/*
+ * Number of MSIs available to a guest. Determined by the host interrupt
+ * controller, so it is identical for every domain -- hence a single global
+ * rather than a per-domain value.
+ */
+static unsigned int __ro_after_init guest_num_msis;
+
+#define GUEST_IMSIC_COMPATIBLE "riscv,imsics"
+
+/*
+ * Value is inspired by what QEMU is using for riscv,num-ids property for IMSIC
+ * node.
+ */
+#define GUEST_IMSIC_MAX_MSIS 255U
+
 #define IMSIC_DISABLE_EIDELIVERY    0
 #define IMSIC_ENABLE_EIDELIVERY     1
 #define IMSIC_DISABLE_EITHRESHOLD   1
@@ -182,7 +201,7 @@ static int __init imsic_get_parent_hartid(const struct dt_device_node *node,
  * or IRQ_M_EXT if the IMSIC node corresponds to a machine-mode IMSIC,
  * which should be ignored by the hypervisor.
  */
-static int imsic_parse_node(const struct dt_device_node *node,
+static int __init imsic_parse_node(const struct dt_device_node *node,
                             unsigned int *nr_parent_irqs,
                             unsigned int *nr_mmios)
 {
@@ -285,6 +304,11 @@ static int imsic_parse_node(const struct dt_device_node *node,
         return -ENOENT;
     }
 
+    if ( dt_property_read_u32(node, "riscv,num-guest-ids", &tmp) )
+        guest_num_msis = min(GUEST_IMSIC_MAX_MSIS, tmp);
+    else
+        guest_num_msis = GUEST_IMSIC_MAX_MSIS;
+
     if ( (imsic_cfg.nr_ids < IMSIC_MIN_ID) ||
          (imsic_cfg.nr_ids > IMSIC_MAX_ID) )
     {
@@ -522,3 +546,120 @@ int __init imsic_init(const struct dt_device_node *node)
 
     return rc;
 }
+
+static int __init guest_imsic_make_reg_property(struct domain *d, void *fdt)
+{
+    paddr_t size = IMSIC_MMIO_PAGE_SZ * d->max_vcpus;
+    __be32 regs[4] = {
+        cpu_to_be32(GUEST_IMSIC_S_BASE >> 32),
+        cpu_to_be32(GUEST_IMSIC_S_BASE),
+        cpu_to_be32(size >> 32),
+        cpu_to_be32(size),
+    };
+
+    return fdt_property(fdt, "reg", regs, sizeof(regs));
+}
+
+static int __init guest_imsic_set_interrupt_extended_prop(struct domain *d,
+                                                          void *fdt)
+{
+    unsigned int cpu, pos = 0;
+    __be32 *irq_ext;
+    int res;
+
+    irq_ext = xvzalloc_array(__be32, d->max_vcpus * 2);
+    if ( !irq_ext )
+        return -ENOMEM;
+
+    for ( cpu = 0; cpu < d->max_vcpus; cpu++ )
+    {
+        char buf[64];
+        uint32_t phandle;
+
+        snprintf(buf, ARRAY_SIZE(buf), "/cpus/cpu@%u/interrupt-controller", cpu);
+        phandle = fdt_get_phandle(fdt, fdt_path_offset(fdt, buf));
+
+        if ( !phandle )
+        {
+            res = -ENODEV;
+            goto out;
+        }
+
+        irq_ext[pos++] = cpu_to_be32(phandle);
+        irq_ext[pos++] = cpu_to_be32(IRQ_S_EXT);
+    }
+
+    res = fdt_property(fdt, "interrupts-extended", irq_ext,
+                       d->max_vcpus * 2 * sizeof(*irq_ext));
+
+ out:
+    xvfree(irq_ext);
+
+    return res;
+}
+
+int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
+                                    unsigned int *phandle)
+{
+    int res;
+    void *fdt = kinfo->fdt;
+    char vimsic_name[32];
+    unsigned int vimsic_phandle;
+
+    res = snprintf(vimsic_name, ARRAY_SIZE(vimsic_name), "/soc/imsic@%lx",
+                   GUEST_IMSIC_S_BASE);
+    if ( res >= ARRAY_SIZE(vimsic_name) )
+    {
+        dprintk(XENLOG_DEBUG, "vimsic name is truncated\n");
+        return -ENOBUFS;
+    }
+
+    res = fdt_begin_node(fdt, vimsic_name);
+    if ( res )
+        return res;
+
+    res = fdt_property_string(fdt, "compatible", GUEST_IMSIC_COMPATIBLE);
+    if ( res )
+        return res;
+
+    res = guest_imsic_make_reg_property(kinfo->bd.d, fdt);
+    if ( res )
+        return res;
+
+    res = guest_imsic_set_interrupt_extended_prop(kinfo->bd.d, fdt);
+    if ( res )
+        return res;
+
+    res = fdt_property_u32(fdt, "riscv,num-ids", guest_num_msis);
+    if ( res )
+        return res;
+
+    res = fdt_property(fdt, "msi-controller", NULL, 0);
+    if ( res )
+        return res;
+
+    res = fdt_property_u32(fdt, "#msi-cells", 0);
+    if ( res )
+        return res;
+
+    res = fdt_property(fdt, "interrupt-controller", NULL, 0);
+    if ( res )
+        return res;
+
+    res = fdt_property_u32(fdt, "#interrupt-cells", 0);
+    if ( res )
+        return res;
+
+    vimsic_phandle = alloc_phandle(kinfo);
+    if ( !vimsic_phandle )
+        return -EOVERFLOW;
+
+    res = fdt_property_cell(fdt, "phandle", vimsic_phandle);
+    if ( res )
+        return res;
+
+    if ( phandle )
+        *phandle = vimsic_phandle;
+
+    return fdt_end_node(fdt);
+}
diff --git a/xen/arch/riscv/include/asm/guest-layout.h b/xen/arch/riscv/include/asm/guest-layout.h
index 68d95a09394c..5e566450bdfa 100644
--- a/xen/arch/riscv/include/asm/guest-layout.h
+++ b/xen/arch/riscv/include/asm/guest-layout.h
@@ -3,6 +3,12 @@
 
 #include <public/xen.h>
 
+/*
+ * Base address of the guest's supervisor-mode IMSIC. The value is the address
+ * typically used for IMSIC by QEMU.
+ */
+#define GUEST_IMSIC_S_BASE _UL(0x28000000)
+
 #define GUEST_RAM_BANKS   2
 
 /*
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index e2c413487d24..e1ec3d03c4e9 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -78,6 +78,7 @@ struct vimsic_state {
 };
 
 struct dt_device_node;
+struct kernel_info;
 struct vcpu;
 
 int imsic_init(const struct dt_device_node *node);
@@ -93,4 +94,6 @@ int vcpu_imsic_init(struct vcpu *v);
 void vcpu_imsic_deinit(struct vcpu *v);
 unsigned int vcpu_guest_file_id(const struct vcpu *v);
 
+int vimsic_make_domu_dt_node(struct kernel_info *kinfo, unsigned int *phandle);
+
 #endif /* ASM_RISCV_IMSIC_H */
-- 
2.55.0


