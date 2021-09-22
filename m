Return-Path: <SRS0=cgBe=OM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D53C433EF
	for <xen-devel@archiver.kernel.org>; Wed, 22 Sep 2021 11:40:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4DB560EE7
	for <xen-devel@archiver.kernel.org>; Wed, 22 Sep 2021 11:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B4DB560EE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.192611.343136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT0bx-0004Hv-DW; Wed, 22 Sep 2021 11:40:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192611.343136; Wed, 22 Sep 2021 11:40:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT0bx-0004Ho-AJ; Wed, 22 Sep 2021 11:40:25 +0000
Received: by outflank-mailman (input) for mailman id 192611;
 Wed, 22 Sep 2021 11:40:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hzcW=OM=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mT0bv-0004AV-Ue
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 11:40:23 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 5d221a6b-b1a8-40fb-9927-c7c79fe36240;
 Wed, 22 Sep 2021 11:40:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B735D11B3;
 Wed, 22 Sep 2021 04:40:18 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B5B3C3F719;
 Wed, 22 Sep 2021 04:40:17 -0700 (PDT)
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
X-Inumbo-ID: 5d221a6b-b1a8-40fb-9927-c7c79fe36240
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	andre.przywara@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 13/17] xen:arm: Implement pci access functions
Date: Wed, 22 Sep 2021 12:34:59 +0100
Message-Id: <f05b02c04803809bbe4ebd49ed4abb5a4656b010.1632307952.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1632307952.git.rahul.singh@arm.com>
References: <cover.1632307952.git.rahul.singh@arm.com>
In-Reply-To: <cover.1632307952.git.rahul.singh@arm.com>
References: <cover.1632307952.git.rahul.singh@arm.com>

Implement generic pci access functions to read/write the configuration
space.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Change in v2: Fixed comments 
---
 xen/arch/arm/pci/pci-access.c      | 58 ++++++++++++++++++++++++++++++
 xen/arch/arm/pci/pci-host-common.c | 19 ++++++++++
 xen/include/asm-arm/pci.h          |  2 ++
 3 files changed, 79 insertions(+)

diff --git a/xen/arch/arm/pci/pci-access.c b/xen/arch/arm/pci/pci-access.c
index 04fe9fbf92..45500cec2a 100644
--- a/xen/arch/arm/pci/pci-access.c
+++ b/xen/arch/arm/pci/pci-access.c
@@ -16,6 +16,7 @@
 #include <asm/io.h>
 
 #define INVALID_VALUE (~0U)
+#define PCI_ERR_VALUE(len) GENMASK(0, len * 8)
 
 int pci_generic_config_read(struct pci_host_bridge *bridge, uint32_t sbdf,
                             uint32_t reg, uint32_t len, uint32_t *value)
@@ -72,6 +73,63 @@ int pci_generic_config_write(struct pci_host_bridge *bridge, uint32_t sbdf,
     return 0;
 }
 
+static uint32_t pci_config_read(pci_sbdf_t sbdf, unsigned int reg,
+                                unsigned int len)
+{
+    uint32_t val = PCI_ERR_VALUE(len);
+
+    struct pci_host_bridge *bridge = pci_find_host_bridge(sbdf.seg, sbdf.bus);
+
+    if ( unlikely(!bridge) )
+        return val;
+
+    if ( unlikely(!bridge->ops->read) )
+        return val;
+
+    bridge->ops->read(bridge, (uint32_t) sbdf.sbdf, reg, len, &val);
+
+    return val;
+}
+
+static void pci_config_write(pci_sbdf_t sbdf, unsigned int reg,
+                             unsigned int len, uint32_t val)
+{
+    struct pci_host_bridge *bridge = pci_find_host_bridge(sbdf.seg, sbdf.bus);
+
+    if ( unlikely(!bridge) )
+        return;
+
+    if ( unlikely(!bridge->ops->write) )
+        return;
+
+    bridge->ops->write(bridge, (uint32_t) sbdf.sbdf, reg, len, val);
+}
+
+/*
+ * Wrappers for all PCI configuration access functions.
+ */
+
+#define PCI_OP_WRITE(size, type)                            \
+    void pci_conf_write##size(pci_sbdf_t sbdf,              \
+                              unsigned int reg, type val)   \
+{                                                           \
+    pci_config_write(sbdf, reg, size / 8, val);             \
+}
+
+#define PCI_OP_READ(size, type)                             \
+    type pci_conf_read##size(pci_sbdf_t sbdf,               \
+                              unsigned int reg)             \
+{                                                           \
+    return pci_config_read(sbdf, reg, size / 8);            \
+}
+
+PCI_OP_READ(8, uint8_t)
+PCI_OP_READ(16, uint16_t)
+PCI_OP_READ(32, uint32_t)
+PCI_OP_WRITE(8, uint8_t)
+PCI_OP_WRITE(16, uint16_t)
+PCI_OP_WRITE(32, uint32_t)
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
index 4beec14f2f..3bdc336268 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -243,6 +243,25 @@ err_exit:
     return err;
 }
 
+/*
+ * This function will lookup an hostbridge based on the segment and bus
+ * number.
+ */
+struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus)
+{
+    struct pci_host_bridge *bridge;
+
+    list_for_each_entry( bridge, &pci_host_bridges, node )
+    {
+        if ( bridge->segment != segment )
+            continue;
+        if ( (bus < bridge->bus_start) || (bus > bridge->bus_end) )
+            continue;
+        return bridge;
+    }
+
+    return NULL;
+}
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
index 4b32c7088a..5406daecda 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -18,6 +18,7 @@
 #ifdef CONFIG_HAS_PCI
 
 #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
+#define PRI_pci "%04x:%02x:%02x.%u"
 
 extern bool_t pci_passthrough_enabled;
 
@@ -84,6 +85,7 @@ int pci_generic_config_write(struct pci_host_bridge *bridge, uint32_t sbdf,
                             uint32_t reg, uint32_t len, uint32_t value);
 void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
                                uint32_t sbdf, uint32_t where);
+struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus);
 
 static always_inline bool is_pci_passthrough_enabled(void)
 {
-- 
2.17.1


