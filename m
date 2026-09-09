Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956C4C79FB7
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 15:09:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413288.1643581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Juz-0004rW-By; Wed, 09 Sep 2026 15:08:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413288.1643581; Wed, 09 Sep 2026 15:08:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Juz-0004qT-68; Wed, 09 Sep 2026 15:08:57 +0000
Received: by outflank-mailman (input) for mailman id 1413288;
 Wed, 09 Sep 2026 15:08:56 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4Juy-0004av-Al
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 15:08:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4Jux-00DoNW-NW
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 17:08:55 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa1766f-e002-0a2a0a5209dd-0a2a4505af18-42
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 17:08:55 +0200
Received: from [209.85.218.50] (helo=mail-ej1-f50.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa17687-4cb1-0a2a45050019-d155da32e593-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 17:08:55 +0200
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-c15e2dab83eso1042451966b.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 08:08:55 -0700 (PDT)
Received: from fedora (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c261f673000sm709991666b.24.2026.09.09.08.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 08:08:54 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788966535; x=1789571335; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YFhrvSESi6fuTpLM2ezR0PpqXfEfgOGaTAHwrSqOA/E=;
        b=N+maZJfail7MMaasnzjppekChzt5mDu3reYwp9qcGzxiCIUvnYW3ql0F/PvYdr9xB6
         a1FvVNLokZfrew54TbiEeJx587u34vDi1rMxpoXlky6iHuCU8NYvDnrObB3Whtttd4eF
         BNwhXi2+nWLlimUrtcxMIePqYdCPzd9lSG42K3kUCltGIBQVawlnobQHEEcbh2SAUZ19
         qMjwAcfWHtWEq6jgUWhdF93E6A5FWnQ7DzJ+1/ISteN8YKoH43AOYl1J/eovsDJ1bg0g
         M74A6GV3qT/DnoSDxD2EwAwBxu+euA6ps5Jogh/Urxx0kDfI9tSRoN/yAONqwyrV0Zvl
         7ekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966535; x=1789571335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YFhrvSESi6fuTpLM2ezR0PpqXfEfgOGaTAHwrSqOA/E=;
        b=oLq9ErnqVmHAA2RCC9SlzxXiWYlt0dqWrkM5oEZy+2pNvxMLXJPWgzzWac1MAyubS9
         GnFv4gEU6I6WA+Y7tAsStNBPtCLJIiyd9bbsmdGPuP4D6gy6qBwQwXe3nYWWwR5KWK1n
         zGud5l3xs8gm7nh6nKX+9W884q2eoVqnIJ+1jcflpqhxrMOLa6JBWwmb/s24vQnNcrlu
         hTE5yvHhlBpdHVOdzcBsJpAXrl5JaAM6mK3pddTgP/7+76kEW5ZivNtmKMm1AMRdwbo4
         ZFU6Jv/GMowSwB5wCzqZdwtzVCVwGYcXTdRaqM5fPpHqzIvGb0Q4RuY9PYdRACh8sbW0
         ePAw==
X-Gm-Message-State: AFuF++kLcvYnKA54cBEzXhInqwZ2bfKkNafgIQntNrEBCFGK/faBMI8g
	FsbMKMwjxW/OGctJ1imL5iPLG71S4oMNePx0LOH5HfTI+WMCpiZ+zqu9UmRLI6e2
X-Gm-Gg: AYBFou2ZFZLsUw7YhjL7fdtisURET7vJDB22DOUAzMi0qe/bdKL9yXQNreWN1Btqzcn
	KyadfedoesYsrayYMNDDEBo6CtGfJps6H52OXDLjoLRGjGcoVwxTdf/XPTbjQ7fJqXDIwe0aBZ7
	GSTy4hmnYUocw2VDKYy9v3W6zFQWRNOyWYOJEK/F1e1u1LKKLWXX372EkeZQFy2GVwxmCe6mehM
	+ONFTqfpF2qegoTkUVJnbzIXGtLu8xl6AJC6emoAEZHWSmkeiki1fIMKAVl+Q1LgzmRXgsVPPir
	SttC5koGxBCgJCWJJa40gLKPTLK2G4WF/k/nFnHBgFz0y6l1CNIsyWkWRRWlmzpKKlGUPnDZvXL
	SrwdjKPhMNrT/poUncabf99+IliLPo0dUfqZxMvUnAJ94g29NWPGpy7tlkEW695vomUS3FHyKB6
	maTqtxsZimDdW5C/uDI+fxSTX6yncdjRzdQ37oUT1X7dws2FXerNmYDQBGtL3JDFaS5P7Jd/BOg
	KXwo/YweLl5m4a1YYY=
X-Received: by 2002:a17:906:c151:b0:c26:19de:912c with SMTP id a640c23a62f3a-c2619dea162mr1489635866b.31.1788966534970;
        Wed, 09 Sep 2026 08:08:54 -0700 (PDT)
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
Subject: [PATCH v9 15/20] xen/riscv: create APLIC DT node for guest domains
Date: Wed,  9 Sep 2026 17:07:33 +0200
Message-ID: <6ca287c7944692cd86720871eaf441071450563b.1788876411.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788876411.git.oleksii.kurochko@gmail.com>
References: <cover.1788876411.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1788966535-716AD2A1-AD4769AD/10/73395122804
X-purgate-type: spam
X-purgate-size: 8888

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
Acked-by: Jan Beulich <jbeulich@suse.com>
---
changes in v8 - v9:
 - Nothing changed. Only rebase.
---
Changes in v7:
 - Update the comment for guest_aplic_num_sources: drop "wired" to be less
   confusing, and mention that it is identical for every domain only for
   now.
 - Use ARRAY_SIZE() instead of sizeof() for the size argument of
   snprintf() in vaplic_make_domu_dt_node().
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v6:
 - Redefine GUEST_APLIC_MAX_SOURCES as 96U to avoid '+OU' in min(...).
 - s/guest_num_sources/guest_aplic_num_sources.
---
Changes in v5:
 - Drop pointless initializer for local variable res in
   vaplic_make_domu_dt_node().
 - Limit guest_num_sources in the similar way to IMSIC.
 - Rename VAPLIC_NUM_SOURCES to GUEST_APLIC_MAX_SOURCES to be aligned with
   the similar place in vIMSIC related code.
---
Changes in v4:
 - Drop spurious <xen/fdt-kernel.h> and <xen/libfdt/libfdt.h> includes from
   aplic.c (mistakenly added, they belong to vaplic.c).
 - Reduce vaplic_name[] from 128 to 32 bytes in vaplic_make_domu_dt_node().
 - Use __initconstrel (with const) for init_ops instead of __initdata.
 - s/__ULL/_UL for defintion of GUEST_APLIC_S_BASE.
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
 xen/arch/riscv/aplic-priv.h               | 13 ++++
 xen/arch/riscv/aplic.c                    |  2 +
 xen/arch/riscv/include/asm/aplic.h        |  8 +++
 xen/arch/riscv/include/asm/guest-layout.h |  6 ++
 xen/arch/riscv/vaplic.c                   | 77 +++++++++++++++++++++++
 5 files changed, 106 insertions(+)

diff --git a/xen/arch/riscv/aplic-priv.h b/xen/arch/riscv/aplic-priv.h
index 85e0d028d1ae..35100d3a64fe 100644
--- a/xen/arch/riscv/aplic-priv.h
+++ b/xen/arch/riscv/aplic-priv.h
@@ -34,4 +34,17 @@ struct aplic_priv {
     const struct imsic_config *imsic_cfg;
 };
 
+/*
+ * Value is inspired by what QEMU is using for riscv,num-sources property for
+ * APLIC node.
+ */
+#define GUEST_APLIC_MAX_SOURCES 96U
+
+/*
+ * Specifies the number of interrupt sources supported by guest APLIC domain.
+ * Could be limited by host interrupt controller and is identical for every
+ * domain for now.
+ */
+extern unsigned int guest_aplic_num_sources;
+
 #endif /* ASM_RISCV_APLIC_PRIV_H */
diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index d08401db46b3..c2d7183e1852 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -92,6 +92,8 @@ static int __init cf_check aplic_init(void)
         panic("%s: failed to get number of interrupt sources\n",
               node->full_name);
 
+    guest_aplic_num_sources = min(GUEST_APLIC_MAX_SOURCES, aplic_info.num_irqs);
+
     if ( aplic_info.num_irqs > ARRAY_SIZE(aplic.regs->sourcecfg) )
         aplic_info.num_irqs = ARRAY_SIZE(aplic.regs->sourcecfg);
 
diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
index 5a7fcb6ec4f1..07318aaac25d 100644
--- a/xen/arch/riscv/include/asm/aplic.h
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -34,6 +34,14 @@
 
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
index 5e566450bdfa..90603f06bb91 100644
--- a/xen/arch/riscv/include/asm/guest-layout.h
+++ b/xen/arch/riscv/include/asm/guest-layout.h
@@ -3,6 +3,12 @@
 
 #include <public/xen.h>
 
+/*
+ * Base address of the guest's supervisor-mode APLIC. The value is the address
+ * typically used for APLIC by QEMU.
+ */
+#define GUEST_APLIC_S_BASE _UL(0xd000000)
+
 /*
  * Base address of the guest's supervisor-mode IMSIC. The value is the address
  * typically used for IMSIC by QEMU.
diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
index c9f188b989a3..a529a5b1dc49 100644
--- a/xen/arch/riscv/vaplic.c
+++ b/xen/arch/riscv/vaplic.c
@@ -9,6 +9,8 @@
  */
 
 #include <xen/errno.h>
+#include <xen/fdt-kernel.h>
+#include <xen/libfdt/libfdt.h>
 #include <xen/sched.h>
 #include <xen/xvmalloc.h>
 
@@ -19,6 +21,80 @@
 
 #include "aplic-priv.h"
 
+unsigned int __ro_after_init guest_aplic_num_sources;
+
+#define VAPLIC_COMPATIBLE "riscv,aplic"
+
+#define FDT_VAPLIC_INT_CELLS 2
+
+static int __init cf_check vaplic_make_domu_dt_node(struct kernel_info *kinfo)
+{
+    struct domain *d = kinfo->bd.d;
+    int res;
+    void *fdt = kinfo->fdt;
+    unsigned int msi_parent_phandle;
+    char vaplic_name[32];
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
+    res = snprintf(vaplic_name, ARRAY_SIZE(vaplic_name), "/soc/aplic@%lx",
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
+    res = fdt_property_cell(fdt, "riscv,num-sources", guest_aplic_num_sources);
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
+static const struct vintc_init_ops __initconstrel init_ops = {
+    .make_domu_dt_node = vaplic_make_domu_dt_node,
+};
+
 static const struct vintc_ops vintc_ops = {
     .vcpu_init = vcpu_imsic_init,
     .vcpu_deinit = vcpu_imsic_deinit,
@@ -33,6 +109,7 @@ int domain_vaplic_init(struct domain *d)
 
     d->arch.vintc = &vaplic->vintc;
     d->arch.vintc->ops = &vintc_ops;
+    d->arch.vintc->init_ops = &init_ops;
 
     vaplic->regs.domaincfg = APLIC_DOMAINCFG_RO;
 
-- 
2.55.0


