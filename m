Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 097D2CD98E4
	for <xen-devel@archiver.kernel.org>; Wed, 17 Jun 2026 11:18:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1340105.1601212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoI3-00061X-Al; Wed, 17 Jun 2026 11:18:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340105.1601212; Wed, 17 Jun 2026 11:18:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoI1-0005vb-MK; Wed, 17 Jun 2026 11:18:37 +0000
Received: by outflank-mailman (input) for mailman id 1340105;
 Wed, 17 Jun 2026 11:18:22 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZoHl-0003Ya-9Q
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:18:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZoHk-008naJ-JK
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:18:20 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328277-5cb7-0a2a0a5109dd-0a2a4505bd80-12
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:20 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a32827c-aaa8-0a2a45050019-d1558036dd53-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:20 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-49222fb062bso46603855e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:18:20 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa3a8efsm151319985e9.2.2026.06.17.04.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 04:18:19 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781695100; x=1782299900; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XwCDX+bjauFbF5BAFy5k5d2Hdce0oX7JFJAMNfRxcjY=;
        b=EnkvCRWlB0T28MW5dklAjxjFG2u4H2WlyQ43FX2yqKQ2z9sT8lQFOpZxt6tRKa5nWK
         fgI+1XeFwnnycN4b0RsPKKBa4Dyhl27gxq5lVyoRe0NS/MOFZ9PliPZvDQeCfgtM5gIl
         VaNnoXG+J7wjPSXi0zP3zKGg9o7rfzLCKH/vFWwH3Gx4amlN0np9n9TQgjvFEbKFl+Vw
         AZaAZtMeVOop3lqVSMIZFtx+YSokVAR47Q8CWlIgKkVqL7XMuak0D1AFox53t/kBZhUJ
         BBOnyuGyVIsgwtToW74j4PJKXVkOYjCv5no47tXodFyOH6FEAkqjIyGSkn1sNkd/buJM
         7Z4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781695100; x=1782299900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XwCDX+bjauFbF5BAFy5k5d2Hdce0oX7JFJAMNfRxcjY=;
        b=YQ7ofs0eDntt2/Z4gK8Cgc/PUqPSon6lhvpsI74n6OhrgHZoBOD60VRN78eGtHXaD9
         aG3GyoB4raYVZn1OJBFhfrR7OFo3bAhDy39VnmBsrjHtzynjGbAlLlgAlQix/xNPh43V
         dlXKWSSSvQ2IQ9kh1u3J3LTnsAszP0nWEb0WAHjH6AlrzbZc5YrIlSAO1bFq/zTsxIB1
         xAs6Gborfzqjtfv9qgRUfle47mk8vzjABrJTkb83jGTrqBGqm9qeS1Dp8q1+X+31mhTW
         7wqdbH32lVlNm870lwaj3HMowc80+uNp2+854nJSUkCZkpJYiIHdrlmqVnwIagEOTsWp
         r1Zg==
X-Gm-Message-State: AOJu0YwtZdsh5jPqOKIg5Xamq6KERzMdVDV38LGMttupsKs5bd70hUFS
	z1ktHU90DkYoQhcnAyxMgpH3XdPCFJLjzKxAfbCsoJP6C+MiYwfvvTkTg2meBg==
X-Gm-Gg: Acq92OESN2oxF0e0NaewsrVeQa5yvYzGpIVwG3zwz6XjTQlXilisY97MfSwbbqSFi3U
	u2ZRC77sKDO+c5SRAiptGFokxPrXY/YdKMrXwaBCkQs21RbiQszo8olypHoF9dFC+GWWF2ghBQJ
	r/GL4AAUNXR7F19EqcZNkGPZCVzUN50MOP+oraRJWk5pU7ZyOyOp1RYSwB5Udrfncz/CGLA1z4g
	B9FFAnAQH4jIJd6LpZXq0Epr3QIV/71tO4/dMD8REZAMIRcXs6FdOOk905BpKC5PDZAWpJ75oRk
	ZkQsnfgp2Y23PT8MQbTyNY7YrIIaF4RSvbNEF3t5PpZiblfE/vinXB6L0/tvkAJvfml+Gfi0o/X
	bF3rJD0W6RHiNP4CEnm7p6t5cqBA533KOJoc2myEiaTuu4G3uRKsax7TxQsHCB9Gw+zCkyGFwGJ
	S8ybXnj2wZK9VJaSFkKsOjS1MeX2HXLaXdrWF82y+DG61qv/+oN1gZcH1xLg==
X-Received: by 2002:a05:600c:c09a:b0:490:e196:6574 with SMTP id 5b1f17b1804b1-492333bf89bmr50542825e9.13.1781695099770;
        Wed, 17 Jun 2026 04:18:19 -0700 (PDT)
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
Subject: [PATCH v3 17/23] xen/riscv: create APLIC DT node for guest domains
Date: Wed, 17 Jun 2026 13:17:45 +0200
Message-ID: <0b034d584b7aaec54b70e9e575c727b07930d2ed.1781693963.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1781693963.git.oleksii.kurochko@gmail.com>
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1781695100-DAB68443-C494604C/10/73395122804
X-purgate-type: spam
X-purgate-size: 7553

Guests require a Device Tree description of the interrupt controller
topology. Add support for creating an APLIC node when building the
guest DT.

Provide stub for imsic_make_dt_node() it will be introduced properly
in follow-up patch.

The value chosen for GUEST_APLIC_S_BASE is based on QEMU one.

DT-building functions are marked __init because domain creation happens at
boot time, before the init sections are freed. In a typical deployment
libxl creates the interrupt controller node in userspace and hands the
complete FDT to Xen, so these functions are only called during early
domain construction.

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Fix rebase conflicts becuase of this patch is reordered after IMSIC DT
   node creation is intoduced.
 - Update the commit message.
 - Move initialization of domaincfg with APLIC_DOMAINCFG_RO80 from this
   patch to earlier.
 - Change paddr_t aplic_size to unsigned int in vaplic_make_domu_dt_node()
   and replace the UB (after it started to be uint) aplic_size >> 32 with
   an explicit 0 in the DT reg property.
 - Add BUILD_BUG_ON() to be sure that aplic size isn't bigger then
   UINT32_MAX.
---
Changes in v2:
 - Avoid as max as possible of host properties inheritance. Only number of
   APLIC's irqs are checked what leads to an introduction of
   get_aplic_irqs_num().
 - Move this patch earlier what leads to an introduction of
   vimsic_make_domu_dt_node() stub.
 - s/vimsic_make_domu_dt_node/imsic_make_domu_dt_node.
 - Refactor vimsic_make_domu_dt_node() to avoid re-usage of APLIC host
   properties.
 - Drop next_phandle as it is now in common code.
 - Drop const for kinfo argument of vimsic_make_domu_dt_node() is is
   going to be updated inside vimsic_make_domu_dt_node().
 - Use introduced before vintc->num_irqs.
---
---
 xen/arch/riscv/aplic.c                    |  2 +
 xen/arch/riscv/include/asm/aplic.h        |  8 +++
 xen/arch/riscv/include/asm/guest-layout.h |  2 +
 xen/arch/riscv/include/asm/imsic.h        |  3 +
 xen/arch/riscv/vaplic.c                   | 76 +++++++++++++++++++++++
 5 files changed, 91 insertions(+)

diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 620768fb6164..0abe32c2e446 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -12,8 +12,10 @@
 #include <xen/const.h>
 #include <xen/device_tree.h>
 #include <xen/errno.h>
+#include <xen/fdt-kernel.h>
 #include <xen/init.h>
 #include <xen/irq.h>
+#include <xen/libfdt/libfdt.h>
 #include <xen/mm.h>
 #include <xen/sections.h>
 #include <xen/spinlock.h>
diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
index d443faac57c4..b42b159496b8 100644
--- a/xen/arch/riscv/include/asm/aplic.h
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -28,6 +28,14 @@
 
 #define APLIC_TARGET_HART_IDX_SHIFT 18
 
+#define APLIC_IDC_SIZE          32
+
+#define APLIC_MIN_SIZE          0x4000
+#define APLIC_SIZE_ALIGN(x)     ROUNDUP(x, APLIC_MIN_SIZE)
+
+#define APLIC_SIZE(nr_cpus)     (APLIC_MIN_SIZE + \
+                                 APLIC_SIZE_ALIGN(APLIC_IDC_SIZE * (nr_cpus)))
+
 struct aplic_regs {
     uint32_t domaincfg;         /* 0x0000 */
     uint32_t sourcecfg[1023];   /* 0x0004 */
diff --git a/xen/arch/riscv/include/asm/guest-layout.h b/xen/arch/riscv/include/asm/guest-layout.h
index d757bb9219ff..2e5762af863f 100644
--- a/xen/arch/riscv/include/asm/guest-layout.h
+++ b/xen/arch/riscv/include/asm/guest-layout.h
@@ -3,6 +3,8 @@
 
 #include <public/xen.h>
 
+#define GUEST_APLIC_S_BASE __ULL(0xd000000)
+
 #define GUEST_IMSIC_S_BASE __ULL(0x28000000)
 
 #define GUEST_RAM_BANKS   2
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index 316fe5423c48..9c7fe0d469d1 100644
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
diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
index 8170e93701ad..683e8aaec2f3 100644
--- a/xen/arch/riscv/vaplic.c
+++ b/xen/arch/riscv/vaplic.c
@@ -9,6 +9,8 @@
  */
 
 #include <xen/errno.h>
+#include <xen/fdt-kernel.h>
+#include <xen/libfdt/libfdt.h>
 #include <xen/sched.h>
 #include <xen/xvmalloc.h>
 
@@ -19,6 +21,11 @@
 
 #include "aplic-priv.h"
 
+#define VAPLIC_COMPATIBLE "riscv,aplic"
+#define VAPLIC_NUM_SOURCES 96
+
+#define FDT_VAPLIC_INT_CELLS 2
+
 static int cf_check vaplic_init(struct vcpu *v)
 {
     return vcpu_imsic_init(v);
@@ -29,6 +36,74 @@ static void cf_check vaplic_deinit(struct vcpu *v)
     return vcpu_imsic_deinit(v);
 }
 
+static int __init cf_check vaplic_make_domu_dt_node(struct kernel_info *kinfo)
+{
+    struct domain *d = kinfo->bd.d;
+    int res = 0;
+    void *fdt = kinfo->fdt;
+    unsigned int msi_parent_phandle;
+    char vaplic_name[128];
+    unsigned int aplic_size = APLIC_SIZE(d->max_vcpus);
+    const __be32 reg[] = {
+        cpu_to_be32(GUEST_APLIC_S_BASE >> 32),
+        cpu_to_be32(GUEST_APLIC_S_BASE),
+        cpu_to_be32(0),
+        cpu_to_be32(aplic_size),
+    };
+
+    BUILD_BUG_ON(APLIC_SIZE(MAX_VIRT_CPUS) > UINT_MAX);
+
+    res = snprintf(vaplic_name, sizeof(vaplic_name), "/soc/aplic@%lx",
+                   GUEST_APLIC_S_BASE);
+    if ( res >= sizeof(vaplic_name) )
+    {
+        dprintk(XENLOG_DEBUG, "vaplic name is truncated\n");
+        return -ENOBUFS;
+    }
+
+    res = vimsic_make_domu_dt_node(kinfo, &msi_parent_phandle);
+    if ( res )
+        return res;
+
+    res = fdt_begin_node(fdt, vaplic_name);
+    if ( res )
+        return res;
+
+    res = fdt_property_cell(fdt, "#interrupt-cells", FDT_VAPLIC_INT_CELLS);
+    if ( res )
+        return res;
+
+    res = fdt_property(fdt, "reg", reg, sizeof(reg));
+    if ( res )
+        return res;
+
+    res = fdt_property_cell(fdt, "riscv,num-sources", VAPLIC_NUM_SOURCES);
+    if ( res )
+        return res;
+
+    res = fdt_property(fdt, "interrupt-controller", NULL, 0);
+    if ( res )
+        return res;
+
+    res = fdt_property_string(fdt, "compatible", VAPLIC_COMPATIBLE);
+    if ( res )
+        return res;
+
+    res = fdt_property_cell(fdt, "msi-parent", msi_parent_phandle);
+    if ( res )
+        return res;
+
+    res = fdt_property_cell(fdt, "phandle", kinfo->phandle_intc);
+    if ( res )
+        return res;
+
+    return fdt_end_node(fdt);
+}
+
+static const struct vintc_init_ops __initdata init_ops = {
+    .make_domu_dt_node = vaplic_make_domu_dt_node,
+};
+
 static const struct vintc_ops vintc_ops = {
     .vcpu_init = vaplic_init,
     .vcpu_deinit = vaplic_deinit,
@@ -43,6 +118,7 @@ int domain_vaplic_init(struct domain *d)
 
     d->arch.vintc = &vaplic->vintc;
     d->arch.vintc->ops = &vintc_ops;
+    d->arch.vintc->init_ops = &init_ops;
 
     vaplic->regs.domaincfg = APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM |
                              APLIC_DOMAINCFG_RO80;
-- 
2.54.0


