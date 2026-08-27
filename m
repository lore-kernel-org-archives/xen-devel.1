Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF43AC61DC6
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:19:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400829.1636472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbtM-0006Pk-0i; Thu, 27 Aug 2026 15:19:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400829.1636472; Thu, 27 Aug 2026 15:19:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbtL-0006OQ-PY; Thu, 27 Aug 2026 15:19:47 +0000
Received: by outflank-mailman (input) for mailman id 1400829;
 Thu, 27 Aug 2026 15:19:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbtK-0005zJ-1n
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:19:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbtJ-00C6ki-Eb
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:19:45 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905584-2eae-0a2a0a5409dd-0a2a4506d496-14
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:19:45 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905591-195a-0a2a45060019-d155802eb561-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:19:45 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-49557167508so8884265e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:19:45 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e28f5d01sm10049148f8f.32.2026.08.27.08.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:19:44 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787843985; x=1788448785; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9qwEd9f+ju7hZ/8uC6ij6YLmcv1QVKWDiXLVpDUqbt0=;
        b=MZJOISWzi1LAq+vX8ht4aOs1JAacPN8R2d+ocD/onaF3aOrHAYaHG30ZYuD5plX8YF
         TOFBI5Fl2Yow2ZDO3QxrJregtm2N8UFsIl2N3CBUyFAZr4bjtMd8M+5gpURKjFoxswyQ
         ci6hVbmh+KIMNrvc2ivosW6ZpVxf1W3y1tyTedu7yBkovyb+YnsJTdihKlq1awn2mNBL
         M3z41lDdNBc8LvGhju7lKuzr52wVNqDY2qfMGnHyVXY+339ZQc9r1kRIy/Mymvm65wTH
         cM9ebLvmPYXglNycxeU0NSdSKxyL+U2NoucfqFfGMbq91dsIiBAUbjECcdHkDur6RjCa
         tWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787843985; x=1788448785;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9qwEd9f+ju7hZ/8uC6ij6YLmcv1QVKWDiXLVpDUqbt0=;
        b=LNNvSmWU8l0sze6/NZF0gNlxohUZ6jMPKTlk9lDxhWPPuTLxB9Ux/1Xw+Ch8fUoC6W
         axdugWjKOQdkq7oZf7DGVYsCZfpOYZlZ7QyKBGNKfYRDoPECTVZGySQB0otsngvPfNbJ
         gAdsRr/vfjrkqCBKLme0KefUFY1W2lZGMRJSml1JlKl8ji72JqyWa9Ee8qyoH7le2CD1
         WUhzXVK6lfvuwRBGk/mfAvMJGwPqcEuNJdbNFsoNm/tom2FOo72No8AH3V791GQDSXEJ
         sQxWBqHTAR1ifFCzmWyIZ/Tyqg5l0yh5imhPvRtBOIgLK4ZF8ZBRh6keJstk01iCXTym
         Vwfw==
X-Gm-Message-State: AFuF++kMMljTeQ2Hnpmulr9+qkQCCOxY2GBzzFI0xMajh+qANqNQDhT/
	6t/ug+jox3mjqLuZO+9/99Qqafk3PKo2ISfc1pRxuTjjcGYwuuWAcCRKb6KOAg==
X-Gm-Gg: AR+sD12Qr7QAT2z0rOOslSKCWrtAzMUnK+4Eb2F2mLgHi2B17uQOljDQwCiMHuw2aFm
	yjPab90NU0peOA1sKfbx2k8jfSyo2KNNv23qTFrCd+0KCEKCZ2udokMsPlvlI9c78gH8gHUSmqA
	AY2grYmEc2Q225yn6ZxcMb9V7q0/91QjIho06xpn8eal/4Py94ZL7spodRjo5TZ+U/OSN3vE4WU
	/IGex04tZfgJxzleOn0iXqB3Z+NH/L/VVuROTbhUPVNCIowuaQdQf7Vm1jJClWfC5xJPeul+Nwt
	iO67R4Sq9aRTnRHIOo8RXIf9dI+X8g6M9XnDTNnOQCPlsrNJ4U7MjhFqzlS0pFW0CthxyA6komw
	V0Ws3KDeUKXlg8d2RscnofiaBadmnqRDeK+nsLkmzepc2KavtWYhRKzidHRLlkCZZOroTZ5AXee
	/sssu3iRNZSxtnIGnnd23zfZ8hNZja5gDoqs0mWHPoy9piIVQIgeCOzJtYJtl/glXTZNtoYqnJm
	0xue1vD33/99e9n5oVTDk5lryHkoC2b
X-Received: by 2002:a05:600c:1382:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-499dc70b76dmr175117265e9.7.1787843984684;
        Thu, 27 Aug 2026 08:19:44 -0700 (PDT)
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
Subject: [PATCH v8 14/20] xen/riscv: generate IMSIC DT node for guest domains
Date: Thu, 27 Aug 2026 17:19:07 +0200
Message-ID: <6ab7ba5a0e47bba5f77c919ace4834a775f5a3b0.1787836900.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787836900.git.oleksii.kurochko@gmail.com>
References: <cover.1787836900.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1787843985-F687577B-888D0FA5/10/73395122804
X-purgate-type: spam
X-purgate-size: 10787

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
Changes in v8:
 - Nothing changed. Only rebase.
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
index 1e285a68fc4c..ad0a220edac2 100644
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
index 5ee954bbf3ef..2425430ed116 100644
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


