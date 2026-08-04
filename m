Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE563C55184
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 15:49:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382294.1625766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHNq-0003gc-RC; Tue, 04 Aug 2026 15:48:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382294.1625766; Tue, 04 Aug 2026 15:48:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHNp-0003YL-AF; Tue, 04 Aug 2026 15:48:49 +0000
Received: by outflank-mailman (input) for mailman id 1382294;
 Tue, 04 Aug 2026 15:48:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wrHNj-0002FV-1s
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 15:48:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrHNi-00Fkwn-EG
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 17:48:42 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7209c2-5cb7-0a2a0a5109dd-0a2a4502e47a-46
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:48:42 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7209da-6ca4-0a2a45020019-d1558029dc3a-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:48:42 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4954afac04bso39788275e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 08:48:42 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49949fcb46esm116430355e9.5.2026.08.04.08.48.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2026 08:48:41 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785858522; x=1786463322; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mU8gqNd7fh25EXrT+sx22hsxtXPyXu1gA9iMQ0AEA40=;
        b=U9uM+0BWUx54E3p3oARTBXFN52DxEUN/nQ3zIv9Qi/sGG4yu3YGGOjsn8ZnKLSBkHq
         0VUtK3r+Bcdf907qUynx/eudQTHTciMwsw+WRiyRFGiZd5ZDY4M5finLD0A3XCIA6wpI
         Tb9kDZUNAgDS9tkYA+xYdUhVmhgflBf03gsfAlSyZnRfSndisXD2Z5f2s9/kiR2hD91V
         rylPyx4ygn6qBh4X9WMLpv7Tlb1o5o++rrxxqdgfgJ18YYgFYX54aeGl4vsTZNjt3KsL
         Q4IYpWLN2T29kSXlgb1eh3xgkB/pxGXolR6ZbfW6C+9ZyaVHsc5lttdCYoVl6ky2ZSyb
         zBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785858522; x=1786463322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mU8gqNd7fh25EXrT+sx22hsxtXPyXu1gA9iMQ0AEA40=;
        b=d1zKLDxJ27a2ttg2RLNlZWUbFztuqfXXllnrcL8i8pahY0rX1e00sQIUTOq6H1lOwf
         Bh27/M7jcJOz231Cjve+2hX1GNeOMj5kg0QcTN/SrHRea/sSibYMgdofUzS+8Yf1vP/8
         /l7oowdQ+aMSKSmnkjUaUZRxZlK/jKjkfwL1SbyBjI8B9ez5jLQEyV9SE/KbnF0gxQtP
         aW5qBRhPQ2O5qdrRkIl+UoXxKxE1GSVoT27QtmiQQx0b77my+tcyVbPjuX9bIoQMfS2f
         XQM0jlYnmT7FdhToRj9JqBMnliI6W0msxHjqcTEsdaVinaYoJPoNE2Zt7MhkuTJtAMtZ
         hwKg==
X-Gm-Message-State: AOJu0YwnfU13j8gmnXRv5JQuoq1Cf5jQVZWeOy7M5FnrBfEog2PZ+8ow
	tzFVmVYUM7dt2wc5rFobXcfnTP2nfGJW243wgOQbyV3Lu/Sn7a+2lTW2Ue+3qw==
X-Gm-Gg: AR+sD12JB0smAKeeqOTkDdWc3lSIKDHXoRiyH8Q96NM5B1ufarKfNnKD4GJBQt2fSN/
	/4Dfvwmk/L9vyiC//z2kTKWoZQ7pydgu9DYeNa357MgCZksKaf8UCVb9dA+s031iXaydfuLMi21
	cNmlleQLFuTI/rxkbJir+6aM8iJxlW3KaGRLlO0u0Ma9mIX6wuAGJ7VEYBNjcy9PZg9OzkSFXuu
	fjn1KZ0I+UXLkVTT54G4fOP/TqTrgc6fN+XpRPmZx8TwJc+WNeq8IazzQbrLEaF4HqBIBCj0C77
	nEa+E1rv+66P4RlAvwI6TUMM/Je4cQM4287YGPavEJEyY6UYgt2Vv06Grk40iP7D3R8Tyn+sb83
	iRF/9mWbvtud4k7QwN4/sjJweicZSL5y0kyO9NyrUYZIYeyLnlXmummovAuGOXsk9IcMudumEcV
	STDWajmmKrbO2DYzzJpyjI4XleeXNwtadqeMp0cQk0HuCpU22cX43yFpdz+wwHzA2dNqLPdpZ2M
	lCasJpZLihoBPj+Gurr+5Dtjs9H4IhpBuL8V/0c617x/RDxrfHhNdKd
X-Received: by 2002:a05:600c:6990:b0:495:4d00:2fc0 with SMTP id 5b1f17b1804b1-4980c673907mr369152375e9.12.1785858521751;
        Tue, 04 Aug 2026 08:48:41 -0700 (PDT)
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
Subject: [PATCH v7 20/20] xen/riscv: add initial dom0less infrastructure support
Date: Tue,  4 Aug 2026 17:48:10 +0200
Message-ID: <f07fa4b45048098e4b98818fedda7b107cca3ae2.1785836421.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785836421.git.oleksii.kurochko@gmail.com>
References: <cover.1785836421.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1785858522-F28B42AC-6F1C9BE7/10/73395122804
X-purgate-type: spam
X-purgate-size: 7342

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
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v6-7:
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
index d7613721db95..1e3abe259ccd 100644
--- a/xen/arch/riscv/domain-build.c
+++ b/xen/arch/riscv/domain-build.c
@@ -156,9 +156,37 @@ int __init make_cpus_node(const struct domain *d, struct kernel_info *kinfo)
     return fdt_end_node(fdt);
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
2.55.0


