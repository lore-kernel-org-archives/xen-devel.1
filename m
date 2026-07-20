Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7205DC44520
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:01:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366992.1616877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqQC-0000nB-Nd; Mon, 20 Jul 2026 16:00:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366992.1616877; Mon, 20 Jul 2026 16:00:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqQC-0000lS-9W; Mon, 20 Jul 2026 16:00:48 +0000
Received: by outflank-mailman (input) for mailman id 1366992;
 Mon, 20 Jul 2026 16:00:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqQ9-0000FN-Vn
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:00:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqQ9-00HTZO-BR
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:00:45 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e462a-2eae-0a2a0a5409dd-0a2a450c925a-18
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:45 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e462d-f479-0a2a450c0019-d155dd30c02f-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:45 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-47f64ca1c2dso595671f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:00:45 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63edd7d3sm30084673f8f.25.2026.07.20.09.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:00:43 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784563245; x=1785168045; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/v9AJtlwqp03/iX7Ft7ZUikj9vvUmz3xSjpbTVKP9RU=;
        b=TiL0DxML06IMTkiLQk82n3XWti5bxr5RxGibbFjJWZJneV+dVXf+j5bbSsP92JYoi9
         I1J2+CGQqo95CVhysrxfIi1iL2jH5a45PH+x0s0ldMQNLwZrKvEXh7IgAtF+Wh8H+MCW
         xXBOyX/a7kYTkoX4+NqTphxbapK0KuzIdNV03tynWRYDYLh401/4eOPcfjDq5Hkqc4K6
         0lR+4wPcv4aYazARnVqWZKAgY3f2ycPPXas3qStkJ9I2oLe+v1OXskclE/54MpR+zLLq
         rf5llBbiaRTZWIHbYxoP4KwO91pimy1ZPyk1BWZuIwpxVa7j32vV8ALBQjZHSR0cpFrE
         vvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563245; x=1785168045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/v9AJtlwqp03/iX7Ft7ZUikj9vvUmz3xSjpbTVKP9RU=;
        b=QanBWIK/rxnpzw6rGcVTXnnaM4eb6Pm4KywTJ1Te7Dt/g0D7N/Cm0eNGMjLCLxbIy3
         0NE8QcIPknmX4VDC0RU9Or52HdH3vyFP3eNpeyBUNnC+Nsxg6ZQep1RSSBzAZ9YcEFy6
         ViClv+yKtcUnHn2LCwL/fVvGFugPVSe9J5ggkHtEkGlbs/Q6n2AJT2qrL5C3oTrbubWC
         QlEx9exgXUNHLi5osyBSc2U7yuKojHjmJ14yzCHwZVraaf5yzVZlawVfwlcRiAtJGK98
         W6MMRsA4/hnCTITYp6KvDuljV03qJSzFrkKTIz14/Ht/NIk7K8xNHbfbX4PEghq5GhTW
         PHyA==
X-Gm-Message-State: AOJu0YyYwPXmWIdtSd6IrX1dtjFd8PscTcFbSG3GQU62cCgBS+VJP9hw
	snAEGcbQG10R3BLMluNyWUy1dnYx/MqrcMreW0JJJqlpAsJgHBYX702dLVACog==
X-Gm-Gg: AR+sD13NiOYvXzgRzvMp+bzGfswwYVpGZJFCp6AWe+2MwhvyapT8/NX1oPQLRt2T51+
	K5T3f7mr4NA21XUa989nhr2Hn+1wcFk93VbznEI3jWGsxy79o2c/4PT+A34BgZZ39KOK71Tdxmf
	ZsCtsz1RaJ7XMORd5h4QLvpimHusQCadW1dEZGy/0RKtueWoPJdPcdoCh0rGx6Gt9KhjBOuKdJO
	pkiSx/5U/d0vKjoFkdUlckt/nDPWp9wPDnA7IEpBWEU3f674fFOYl00OyF52UmueZtZSHflKZNi
	FDpcYvT8culKrjX28CSpJD/RoRjmnMCEEpLXYVn9kDIDpB20eJKpM2i21mEwwaA6OwuEtxwlh/C
	5M1Pk2pRfQvd4I2XWkHW791pHNqokA6aQFCwTNm0LyMqU5rbOLxMzH/KwgfnJCl6ZiebOq0EvYX
	exVE2vaaxOkJn3zMiX2n2qAeRgxV2iKDHXafhCkNVIAb2i0agFgqOnnak0kg==
X-Received: by 2002:a05:6000:2991:10b0:47f:6fd2:12ff with SMTP id ffacd0b85a97d-47f6fd214b0mr7719793f8f.9.1784563244450;
        Mon, 20 Jul 2026 09:00:44 -0700 (PDT)
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 17/23] xen/riscv: create APLIC DT node for guest domains
Date: Mon, 20 Jul 2026 17:59:58 +0200
Message-ID: <06c022159e9cf70bacd0c061b7460b99a3dc88ea.1784559209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784559209.git.oleksii.kurochko@gmail.com>
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1784563245-034D7A5B-A8AB01CC/10/73395122804
X-purgate-type: spam
X-purgate-size: 8635

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
 xen/arch/riscv/aplic-priv.h               | 14 +++++
 xen/arch/riscv/aplic.c                    |  2 +
 xen/arch/riscv/include/asm/aplic.h        |  8 +++
 xen/arch/riscv/include/asm/guest-layout.h |  6 ++
 xen/arch/riscv/vaplic.c                   | 77 +++++++++++++++++++++++
 5 files changed, 107 insertions(+)

diff --git a/xen/arch/riscv/aplic-priv.h b/xen/arch/riscv/aplic-priv.h
index 85e0d028d1ae..1391837f89b9 100644
--- a/xen/arch/riscv/aplic-priv.h
+++ b/xen/arch/riscv/aplic-priv.h
@@ -34,4 +34,18 @@ struct aplic_priv {
     const struct imsic_config *imsic_cfg;
 };
 
+/*
+ * Value is inspired by what QEMU is using for riscv,num-sources property for
+ * APLIC node.
+ */
+#define GUEST_APLIC_MAX_SOURCES 96U
+
+/*
+ * Specifies the number of wired interrupt sources supported by guest APLIC
+ * domain.
+ * Could be limited by host interrupt controller and is identical for every
+ * domain.
+ */
+extern unsigned int guest_aplic_num_sources;
+
 #endif /* ASM_RISCV_APLIC_PRIV_H */
diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 126d56fb7ea8..e02d78999b77 100644
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
index c813979a2ecb..e6af63ec59d7 100644
--- a/xen/arch/riscv/vaplic.c
+++ b/xen/arch/riscv/vaplic.c
@@ -9,6 +9,8 @@
  */
 
 #include <xen/errno.h>
+#include <xen/fdt-kernel.h>
+#include <xen/libfdt/libfdt.h>
 #include <xen/sched.h>
 #include <xen/xvmalloc.h>
 
@@ -19,6 +21,12 @@
 
 #include "aplic-priv.h"
 
+unsigned int __ro_after_init guest_aplic_num_sources;
+
+#define VAPLIC_COMPATIBLE "riscv,aplic"
+
+#define FDT_VAPLIC_INT_CELLS 2
+
 static int cf_check vaplic_init(struct vcpu *v)
 {
     return vcpu_imsic_init(v);
@@ -29,6 +37,74 @@ static void cf_check vaplic_deinit(struct vcpu *v)
     return vcpu_imsic_deinit(v);
 }
 
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
     .vcpu_init = vaplic_init,
     .vcpu_deinit = vaplic_deinit,
@@ -43,6 +119,7 @@ int domain_vaplic_init(struct domain *d)
 
     d->arch.vintc = &vaplic->vintc;
     d->arch.vintc->ops = &vintc_ops;
+    d->arch.vintc->init_ops = &init_ops;
 
     vaplic->regs.domaincfg = APLIC_DOMAINCFG_RO;
 
-- 
2.54.0


