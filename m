Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECD11073CBF
	for <xen-devel@archiver.kernel.org>; Wed,  8 Apr 2026 13:56:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1276214.1561771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wATNn-0001w9-7i; Wed, 08 Apr 2026 13:55:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276214.1561771; Wed, 08 Apr 2026 13:55:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wATNn-0001w1-57; Wed, 08 Apr 2026 13:55:51 +0000
Received: by outflank-mailman (input) for mailman id 1276214;
 Wed, 08 Apr 2026 13:55:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luca.fancellu@arm.com>) id 1wATNl-0001ij-So
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 13:55:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wATNl-0081Hn-8N
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 15:55:49 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 69d65e64-2eae-0a2a0a5409dd-0a2a4505be88-10
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 15:55:49 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.0)
 (envelope-from <luca.fancellu@arm.com>)
 id 69d65e64-3760-0a2a45050019-d98c6eacd16c-1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 15:55:48 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 440191E32;
 Wed,  8 Apr 2026 06:55:42 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC7F63F641;
 Wed,  8 Apr 2026 06:55:46 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=foss header.d=arm.com header.i="@arm.com" header.h="From:To:Cc:Subject:Date:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775656548; bh=v5LF9EBgnpQL3pb+wunpmzDERz+oj+KrD99jf6QSUyw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KlPwKuHMTA3nm6OSjAxLvuR9Qvyu1Bs4h2BMjvm8xbW1beM0vu/VITGIND60fgeBW
	 Njl8aP1nGuhPfHde+wdmASMyeVPa9v8wipSdgR03K1GwRVbGtI3wyc3xCZEXSW8fql
	 Oolf4ht585ZHaQ5pcKahZyOpaA7fnLGXe+fzUsGM=
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Harry Ramsey <harry.ramsey@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 2/3] arm/mpu: Introduce `v8r_el1_msa` device tree property for domains
Date: Wed,  8 Apr 2026 14:55:30 +0100
Message-Id: <20260408135531.1744388-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260408135531.1744388-1-luca.fancellu@arm.com>
References: <20260408135531.1744388-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1775656549-38BE896F-DE5C9B4A/0/0
X-purgate-type: clean
X-purgate-size: 6467

From: Harry Ramsey <harry.ramsey@arm.com>

Add a new device tree property `v8r_el1_msa` to select the MSA (memory
system architecture) at EL1 i.e. MPU(default) or MMU.

Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v3:
- Improve commit message and device tree property description
- Remove macro protection
- Remove unused function is_mpu_domain
- Code formatting
---
 docs/misc/arm/device-tree/booting.txt | 12 ++++++++++++
 xen/arch/arm/dom0less-build.c         | 24 ++++++++++++++++++++++++
 xen/arch/arm/domain.c                 |  4 ++++
 xen/arch/arm/include/asm/domain.h     |  7 +++++++
 xen/arch/arm/include/asm/mpu.h        |  5 +++++
 xen/arch/arm/mpu/arm32/mm.c           |  5 +++++
 xen/arch/arm/mpu/arm64/mm.c           |  5 +++++
 xen/include/public/arch-arm.h         |  2 ++
 8 files changed, 64 insertions(+)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 977b4286082f..b1a329c0e8d9 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -322,6 +322,18 @@ with the following properties:
     Should be used together with scmi-smc-passthrough Xen command line
     option.
 
+- v8r_el1_msa
+
+    A string property specifying whether, on Armv8-R systems, a domain
+    should use PMSAv8 (MPU) at EL1 or VMSAv8 (MMU) at EL1.
+
+    - "mmu"
+    Enables VMSAv8 at EL1. This requires hardware support and is only
+    optionally available on AArch64.
+
+    - "mpu"
+    Enables PMSAv8 at EL1. (Default)
+
 Under the "xen,domain" compatible node, one or more sub-nodes are present
 for the DomU kernel and ramdisk.
 
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 4181c105389a..456dc553bb23 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -24,6 +24,7 @@
 #include <asm/domain_build.h>
 #include <asm/firmware/sci.h>
 #include <asm/grant_table.h>
+#include <asm/mpu.h>
 #include <asm/setup.h>
 
 #ifdef CONFIG_VGICV2
@@ -315,6 +316,7 @@ int __init arch_parse_dom0less_node(struct dt_device_node *node,
     struct xen_domctl_createdomain *d_cfg = &bd->create_cfg;
     unsigned int flags = bd->create_flags;
     uint32_t val;
+    const char *v8r_el1_msa;
 
     d_cfg->arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
     d_cfg->flags |= XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
@@ -322,6 +324,28 @@ int __init arch_parse_dom0less_node(struct dt_device_node *node,
     if ( domu_dt_sci_parse(node, d_cfg) )
         panic("Error getting SCI configuration\n");
 
+    if (!dt_property_read_string(node, "v8r_el1_msa", &v8r_el1_msa))
+    {
+#ifdef CONFIG_MPU
+        if ( !strcmp(v8r_el1_msa, "mmu") )
+        {
+            if ( !has_v8r_vmsa_support() )
+                panic("Platform does not support VMSA at EL1 (v8r_el1_msa)\n");
+            d_cfg->arch.v8r_el1_msa = MPU_EL1_VMSA;
+        }
+        else if ( !strcmp(v8r_el1_msa, "mpu") )
+        {
+            d_cfg->arch.v8r_el1_msa = MPU_EL1_PMSA;
+            if ( !(flags & CDF_staticmem) || !(flags & CDF_directmap) )
+                panic("PMSA is not valid for domain without static allocation and direct map (v8r_el1_msa)\n");
+        }
+        else
+            panic("Invalid device tree option for v8r_el1_msa\n");
+#else
+        panic("'v8r_el1_msa' property found, but CONFIG_MPU not selected\n");
+#endif
+    }
+
     if ( !dt_property_read_u32(node, "nr_spis", &d_cfg->arch.nr_spis) )
     {
         int vpl011_virq = GUEST_VPL011_SPI;
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 26380a807cad..c044293acd39 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -725,6 +725,10 @@ int arch_domain_create(struct domain *d,
     if ( (rc = sci_domain_init(d, config)) != 0 )
         goto fail;
 
+#ifdef CONFIG_MPU
+    d->arch.v8r_el1_msa = config->arch.v8r_el1_msa;
+#endif
+
     return 0;
 
 fail:
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index ffe5d0d9f0a6..fd0a83046893 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -30,6 +30,9 @@ enum domain_type {
 #define is_64bit_domain(d) (0)
 #endif
 
+#define MPU_EL1_PMSA 0
+#define MPU_EL1_VMSA 1
+
 /*
  * Is the domain using the host memory layout?
  *
@@ -128,6 +131,10 @@ struct arch_domain
 #endif
 
     struct resume_info resume_ctx;
+
+#ifdef CONFIG_MPU
+    uint8_t v8r_el1_msa;
+#endif
 }  __cacheline_aligned;
 
 struct arch_vcpu
diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
index 72fa5b00b861..8a8c01086206 100644
--- a/xen/arch/arm/include/asm/mpu.h
+++ b/xen/arch/arm/include/asm/mpu.h
@@ -27,6 +27,11 @@
 
 #ifndef __ASSEMBLER__
 
+/*
+ * Utility function to determine if an Armv8-R processor supports VMSA.
+ */
+bool has_v8r_vmsa_support(void);
+
 /*
  * Set base address of MPU protection region.
  *
diff --git a/xen/arch/arm/mpu/arm32/mm.c b/xen/arch/arm/mpu/arm32/mm.c
index a4673c351141..5eaeb3400e6c 100644
--- a/xen/arch/arm/mpu/arm32/mm.c
+++ b/xen/arch/arm/mpu/arm32/mm.c
@@ -38,6 +38,11 @@
         break;                                            \
     }
 
+bool has_v8r_vmsa_support(void)
+{
+    return false;
+}
+
 /*
  * Armv8-R supports direct access and indirect access to the MPU regions through
  * registers:
diff --git a/xen/arch/arm/mpu/arm64/mm.c b/xen/arch/arm/mpu/arm64/mm.c
index ed643cad4073..b07e729a7d05 100644
--- a/xen/arch/arm/mpu/arm64/mm.c
+++ b/xen/arch/arm/mpu/arm64/mm.c
@@ -32,6 +32,11 @@
         break;                                                  \
     }
 
+bool has_v8r_vmsa_support(void)
+{
+    return system_cpuinfo.mm64.msa_frac == MM64_MSA_FRAC_VMSA_SUPPORT;
+}
+
 /*
  * Armv8-R supports direct access and indirect access to the MPU regions through
  * registers:
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index cd563cf70684..23df2f24cb09 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -355,6 +355,8 @@ struct xen_arch_domainconfig {
     uint32_t clock_frequency;
     /* IN */
     uint8_t arm_sci_type;
+    /* IN */
+    uint8_t v8r_el1_msa;
 };
 #endif /* __XEN__ || __XEN_TOOLS__ */
 
-- 
2.34.1


