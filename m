Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24D6C44530
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:01:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367024.1616916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqQM-0002aE-3V; Mon, 20 Jul 2026 16:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367024.1616916; Mon, 20 Jul 2026 16:00:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqQL-0002WV-0y; Mon, 20 Jul 2026 16:00:57 +0000
Received: by outflank-mailman (input) for mailman id 1367024;
 Mon, 20 Jul 2026 16:00:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqQI-00025f-Qu
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:00:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqQI-00HThX-7S
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:00:54 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e4632-e002-0a2a0a5209dd-0a2a4507c57c-10
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:54 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e4635-b4ea-0a2a45070019-d155dd29d495-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:54 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-47f7444576cso1009059f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:00:54 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63edd7d3sm30084673f8f.25.2026.07.20.09.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:00:51 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784563253; x=1785168053; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LNKh9iZCNRF5pxwhL4Q/IsesPS2+IO+kB0heVo/BkTo=;
        b=RCesPm+TjmDqTvES5uexlxci/EUjRBK6KaR26z8j3ioMrEmjA5picJJ9fhjtr7iinY
         jsUxl+eMZPiq11z56fvnSClBnLCQipBRP4Z3ml35Lb0J/Gnq1Z27mXwRBzND063ROXd8
         wZOKIiwWxF4bL4ueFf1IDElLpuOtJrSXFeKLmZMm0UiAHP+E4VbL6T9ASgMLolal7bBK
         0DgZEvcn4rTEikYH+Dj0ApodtY5M3xkXy2/sFEBuWX3H/SANZiT18sx7tj4fKHabAyuT
         zJtLXV00WxMFSruVaPnveW5iiqws5BN28iRgQ24Pglc3tUCD7zfxB4eFus5pRw/PUDnR
         lL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563253; x=1785168053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LNKh9iZCNRF5pxwhL4Q/IsesPS2+IO+kB0heVo/BkTo=;
        b=r3H4Y9RSoNraBW4glXYcBwHtXBeq0UjV+RM7DqEq8TeeIJ5tEbvMfb6Zdr69v3oHau
         dezE9EIUwa6ugJqWItv5vUPtY2QglcXybKp+qgyO4wurjwur5totPWT4MVohu8nDmOp/
         K5YxG3lsQWu4Vht/Gw5hRaE82UgAL5066r30+5GHOXXkVsAh8DhnePpHeq+7FG1GYVbg
         2mnG+OmFtTxlkqWzu1BDt6Z6G4/5ADhBuwAY0K3OBf3gDfQN1FPijgt5A5+Q2MzOvXlY
         6cFVPFT99nM+2buw7fEQ4CpoiZrPA2PjHw5QwAyv/CJEyOGc3om+yd1EZjrTJ7/xTma6
         YPlQ==
X-Gm-Message-State: AOJu0YzD80+EGqDVQYAiXNUDIjcdhFR/sjHt/agnQPUQIbnUhN8lkLTs
	RdtJFqwMHFlrbEhMWlBkhBt7eqFyVJ7N4wepplGP74rSvZ9/c6LvLuNJooWpmg==
X-Gm-Gg: AR+sD120nlU8LNW/LPj4WBtsKPKFPO05zne7gSXVdIrrKqG1dbNr3mOyCR2+gEoMRmg
	ihRTSTjAtzRu8l7vKddvi3TYYxqfvpUGSmLMwjWUHveM1NLXQmMHfILu2xLQeilUGWTDjQtQ03h
	3njzs1IAnjF5Zo6p3+bVSQHtyvmFz74y48NUUWccg80vPK6J2qwwISv8KHvQrtHhvjr704J4orm
	zDtpRKaOibve2xNhd9IXtBzIBEFVwmPymctZE+dJUtY32zldroCw6tQahJQZQU0Z1sGJupJ3Nzj
	ZRB12tQ0cumnK0ltjvW+ISt7svwmr3M79u5/WjyPIEzYqieUXAeJEFZ1VApUgezVoYbH7321zi0
	W1VvJ5f39MrWjrEl79tYxKvCAHluubgulZpaZe/00PiYeXnbmKDDaI4Dt809dszfC3gA7akiWy4
	tYOLoHcWWUVAi+PXeB3+TIAf6eVZE/2P4lSZ2QZijtXknwNGM=
X-Received: by 2002:a05:6000:4a01:b0:474:b860:b7b1 with SMTP id ffacd0b85a97d-47f622feef4mr17043290f8f.9.1784563253056;
        Mon, 20 Jul 2026 09:00:53 -0700 (PDT)
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
Subject: [PATCH v6 22/23] xen/riscv: add initial dom0less infrastructure support
Date: Mon, 20 Jul 2026 18:00:03 +0200
Message-ID: <0b381795a3a7c2d09088c1fae59d3a19099069c2.1784559209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784559209.git.oleksii.kurochko@gmail.com>
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1784563254-3C212AE4-EE3B00B7/10/73395122804
X-purgate-type: spam
X-purgate-size: 7283

Enable dom0less support for RISC-V by selecting HAS_DOM0LESS and
providing the minimal architecture hooks required by the common
dom0less infrastructure.

Add stub implementations for architecture-specific helpers used when
building domains from the device tree. These allow the generic
dom0less code to build and let a basic DomU be constructed on RISC-V.
construct_hwdom() and make_hypervisor_node() are still stubs returning
an error: Dom0/hwdom construction isn't supported yet, and the
hypervisor node generation (needed by domains with
DOM0LESS_ENHANCED_NO_XS set) is not implemented. Both are marked with
a TODO and are not reached by the currently supported configurations.

Provide missing helpers and definitions required by the domain
construction code, including domain bitness helpers and the
p2m_set_allocation() prototype.

Additionally define the guest magic memory region (GUEST_MAGIC_BASE /
GUEST_MAGIC_SIZE) in asm/guest-layout.h. The base is arbitrary; the
only constraint is that the region must not overlap guest RAM or the
emulated device regions. It is placed in the unused gap below
GUEST_RAM0_BASE (0x80000000); the constraints are documented next to
the #define-s.

A separate region for grant tables will be introduced at the same time as
the introduction of the grant table for RISC-V.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v6:
 - Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v5:
 - Reword the comment above defintion of GUEST_MAGIC_BASE.
 - Shrunk the size of GUEST_MAGIC_SIZE to 2Mb as looking on the Arm
   only 4 pages are used and there is no technical reason to have 16Mb for
   that region. (Maybe in case of Arm it is connected that Arm has these
   definitions in public header so more space is reserved to not "break"
   public API in future)
 - Update the commit message with a remark about grant table region
   in guest-layout.h.
---
Changes in v4:
  - Reword the description: the stubs do not let dom0less fully "run"
    since construct_hwdom() and make_hypervisor_node() return an error;
    spell out these limitations instead.
  - Add a TODO comment to construct_hwdom() explaining that Dom0/hwdom
    construction isn't supported yet.
  - Add a TODO comment to make_hypervisor_node() explaining that
    returning an error breaks building of domains with
    DOM0LESS_ENHANCED_NO_XS set, and why that is harmless for now.
  - Document the constraints on GUEST_MAGIC_BASE/GUEST_MAGIC_SIZE next
    to the #define-s and drop the QEMU-based justification (QEMU is not
    involved); the base is simply an arbitrary non-overlapping address.
Changes in v3:
  - Add /* Nothing specific to do for now */ comment to
    arch_handle_passthrough_prop().
  - Use _ULL() instead of xen_mk_ullong() for GUEST_MAGIC_BASE and
    GUEST_MAGIC_SIZE (xen_mk_ullong() is intended for public headers only).
  - Fix GUEST_MAGIC_BASE from 0x39000000 to 0x79000000 to avoid the
    QEMU RISC-V virt machine PCIE_ECAM range.
  - Drop CONFIG_STATIC_MEMORY=n from the CI randconfig; now redundant
    since STATIC_MEMORY depends on HAS_STATIC_MEMORY which RISC-V does
    not select.
Changes in v2:
  - Move declaration of p2m_set_allocation() to p2m-common.h.
  - Add __initdata for max_init_domid and drop initalizer for it.
  - Add CONFIG_STATIC_MEMORY=n to CI's randconfig to avoid
    compilation error because of guest_physmap_add_pages()
    isn't provided.
---
 xen/arch/riscv/Kconfig                    |  2 ++
 xen/arch/riscv/dom0less-build.c           |  7 ++++++
 xen/arch/riscv/domain-build.c             | 28 +++++++++++++++++++++++
 xen/arch/riscv/include/asm/guest-layout.h | 12 ++++++++++
 4 files changed, 49 insertions(+)

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index 48520588fe40..d8a348c0cf07 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -6,6 +6,8 @@ config RISCV
 	select GENERIC_BUG_FRAME
 	select GENERIC_UART_INIT
 	select HAS_DEVICE_TREE_DISCOVERY
+	select HAS_DOM0LESS
+	select HAS_DOMAIN_TYPE
 	select HAS_EX_TABLE
 	select HAS_PMAP
 	select HAS_UBSAN
diff --git a/xen/arch/riscv/dom0less-build.c b/xen/arch/riscv/dom0less-build.c
index d1a51b92936a..0801d7e25059 100644
--- a/xen/arch/riscv/dom0less-build.c
+++ b/xen/arch/riscv/dom0less-build.c
@@ -102,3 +102,10 @@ int __init arch_parse_dom0less_node(struct dt_device_node *node,
 
     return 0;
 }
+
+int __init arch_handle_passthrough_prop(struct kernel_info *kinfo,
+                                        struct dt_device_node *node)
+{
+    /* Nothing specific to do for now */
+    return 0;
+}
diff --git a/xen/arch/riscv/domain-build.c b/xen/arch/riscv/domain-build.c
index 6b14dce9c0a6..04a8d3c244cb 100644
--- a/xen/arch/riscv/domain-build.c
+++ b/xen/arch/riscv/domain-build.c
@@ -175,9 +175,37 @@ int __init make_cpus_node(const struct domain *d, struct kernel_info *kinfo)
     return res;
 }
 
+int __init construct_hwdom(struct kernel_info *kinfo,
+                           const struct dt_device_node *node)
+{
+    /*
+     * TODO: Dom0/hwdom construction isn't supported on RISC-V yet, so this
+     * is a stub returning an error. It must be implemented before a hardware
+     * domain can be built from the device tree.
+     */
+
+    return -EOPNOTSUPP;
+}
+
 int __init make_timer_node(const struct kernel_info *kinfo)
 {
     /* There is no need for timer node for RISC-V. */
 
     return 0;
 }
+
+int __init make_hypervisor_node(struct domain *d,
+                                const struct kernel_info *kinfo,
+                                int addrcells, int sizecells)
+{
+    /*
+     * TODO: Generating the hypervisor node isn't implemented yet. Returning
+     * an error here breaks building of any domain (DomU included) whose
+     * dom0less_feature has DOM0LESS_ENHANCED_NO_XS set. This is harmless for
+     * now because Dom0/hwdom construction isn't supported on RISC-V yet
+     * either, and no RISC-V DomU sets that flag, so this path is never taken.
+     * It must be implemented before DOM0LESS_ENHANCED_NO_XS is used.
+     */
+
+    return -EOPNOTSUPP;
+}
diff --git a/xen/arch/riscv/include/asm/guest-layout.h b/xen/arch/riscv/include/asm/guest-layout.h
index 90603f06bb91..ceed9125e7e2 100644
--- a/xen/arch/riscv/include/asm/guest-layout.h
+++ b/xen/arch/riscv/include/asm/guest-layout.h
@@ -32,4 +32,16 @@
 #define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE, GUEST_RAM1_BASE }
 #define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE, GUEST_RAM1_SIZE }
 
+/*
+ * The guest magic region holds the Xen-reserved pages mapped into the
+ * guest's physical address space. The only real constraint on
+ * GUEST_MAGIC_BASE/SIZE is that the region must not overlap guest RAM
+ * (the GUEST_RAMx banks) or the emulated device regions defined above;
+ * the exact base is otherwise arbitrary. Here it is placed in the unused gap
+ * below GUEST_RAM0_BASE (0x80000000), but a hole after a RAM bank would work
+ * equally well.
+ */
+#define GUEST_MAGIC_BASE  _UL(0x79000000)
+#define GUEST_MAGIC_SIZE  _UL(0x00200000)
+
 #endif /* ASM_RISCV_GUEST_LAYOUT_H */
-- 
2.54.0


