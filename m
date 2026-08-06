Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E17AC56205
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 15:49:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384955.1627656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws0Le-000588-98; Thu, 06 Aug 2026 15:49:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384955.1627656; Thu, 06 Aug 2026 15:49:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws0Le-000580-4X; Thu, 06 Aug 2026 15:49:34 +0000
Received: by outflank-mailman (input) for mailman id 1384955;
 Thu, 06 Aug 2026 15:49:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1ws0Lc-000579-S3
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 15:49:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1ws0Lc-00834V-28;
 Thu, 06 Aug 2026 15:49:32 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1ws0Lc-009r6I-0L;
 Thu, 06 Aug 2026 15:49:32 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=v8h1wppUhC/u/nkKEBQJ22KAaFfqUX8DZenk5l0qwSs=; b=E3djs5jXPwiXuhHLhTg9/Zkj/V
	BUEnWf+1Uz1xhEse4IKMmlZxHISKW5NFHqUzbijq8DDScnvR9y0sEWsKLv8kojb/QLURb9HkRHnSy
	rnEfu87ivdlfZDUnuXA9O+B1qTT17bpzIEnCU0sJrQuMFPphb0CdfikQg+O24mSr+w2s=;
From: Roger Pau Monne <roger@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger@xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v2 2/2] xen/vpci: allow unaligned accesses by the hardware domain
Date: Thu,  6 Aug 2026 17:26:19 +0200
Message-ID: <20260806152619.23881-3-roger@xenproject.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806152619.23881-1-roger@xenproject.org>
References: <20260806152619.23881-1-roger@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's possible for domains to generate unaligned PCI config space accesses
when using ECAM, and hence vPCI should support those at least for the
hardware domain.  Such unaligned accesses to the PCI config space have been
reported to come from ACPI logic.

Relax the checking in vpci_access_allowed() to allow such accesses for the
hardware domain, and fix the handling in pci_conf_{read,write}{16,32}() to
fulfill them using MMCFG.

MMCFG regions are identity exposed to the hardware domain, and hence such
unaligned accesses can only come as a result of the host having MMCFG in the
first place, as otherwise MMCFG won't be exposed to the hardware domain
either.

Note that vpci_ecam_{read,write}() already refuse accesses that cross a
device boundary unconditionally.

Reported-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Roger Pau Monné <roger@xenproject.org>
---
 tools/include/xen-tools/common-macros.h | 2 ++
 xen/arch/x86/x86_64/pci.c               | 8 ++++----
 xen/drivers/vpci/vpci.c                 | 6 ++++--
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/tools/include/xen-tools/common-macros.h b/tools/include/xen-tools/common-macros.h
index 88b4a0e5a693..1f9146b23b0e 100644
--- a/tools/include/xen-tools/common-macros.h
+++ b/tools/include/xen-tools/common-macros.h
@@ -68,6 +68,8 @@
     })
 #endif
 
+#define IS_ALIGNED(val, align) (!((val) & ((align) - 1)))
+
 #define ROUNDUP(x, a) (((x) + (a) - 1) & ~((a) - 1))
 #define ROUNDDOWN(x, a) ((x) & ~((a) - 1))
 
diff --git a/xen/arch/x86/x86_64/pci.c b/xen/arch/x86/x86_64/pci.c
index 8d33429103b9..6298141c3ca7 100644
--- a/xen/arch/x86/x86_64/pci.c
+++ b/xen/arch/x86/x86_64/pci.c
@@ -26,7 +26,7 @@ uint8_t pci_conf_read8(pci_sbdf_t sbdf, unsigned int reg)
 
 uint16_t pci_conf_read16(pci_sbdf_t sbdf, unsigned int reg)
 {
-    if ( sbdf.seg || reg > 255 )
+    if ( sbdf.seg || reg > 255 || !IS_ALIGNED(reg, 2) )
     {
         uint32_t value;
 
@@ -39,7 +39,7 @@ uint16_t pci_conf_read16(pci_sbdf_t sbdf, unsigned int reg)
 
 uint32_t pci_conf_read32(pci_sbdf_t sbdf, unsigned int reg)
 {
-    if ( sbdf.seg || reg > 255 )
+    if ( sbdf.seg || reg > 255 || !IS_ALIGNED(reg, 4) )
     {
         uint32_t value;
 
@@ -60,7 +60,7 @@ void pci_conf_write8(pci_sbdf_t sbdf, unsigned int reg, uint8_t data)
 
 void pci_conf_write16(pci_sbdf_t sbdf, unsigned int reg, uint16_t data)
 {
-    if ( sbdf.seg || reg > 255 )
+    if ( sbdf.seg || reg > 255 || !IS_ALIGNED(reg, 2) )
         pci_mmcfg_write(sbdf.seg, sbdf.bus, sbdf.devfn, reg, 2, data);
     else
         pci_conf_write(PCI_CONF_ADDRESS(sbdf, reg), reg & 2, 2, data);
@@ -68,7 +68,7 @@ void pci_conf_write16(pci_sbdf_t sbdf, unsigned int reg, uint16_t data)
 
 void pci_conf_write32(pci_sbdf_t sbdf, unsigned int reg, uint32_t data)
 {
-    if ( sbdf.seg || reg > 255 )
+    if ( sbdf.seg || reg > 255 || !IS_ALIGNED(reg, 4) )
         pci_mmcfg_write(sbdf.seg, sbdf.bus, sbdf.devfn, reg, 4, data);
     else
         pci_conf_write(PCI_CONF_ADDRESS(sbdf, reg), 0, 4, data);
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 0ac9ec8b0475..9e2c27e3a300 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -685,6 +685,8 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
 /* Helper function to check an access size and alignment on vpci space. */
 bool vpci_access_allowed(unsigned int reg, unsigned int len)
 {
+    const struct domain *currd = current->domain;
+
     /* Check access size. */
     if ( len != 1 && len != 2 && len != 4 && len != 8 )
         return false;
@@ -695,8 +697,8 @@ bool vpci_access_allowed(unsigned int reg, unsigned int len)
         return false;
 #endif
 
-    /* Check that access is size aligned. */
-    if ( (reg & (len - 1)) )
+    /* Refuse unaligned accesses for non-hardware domains. */
+    if ( !is_hardware_domain(currd) && !IS_ALIGNED(reg, len) )
         return false;
 
     return true;
-- 
2.53.0


