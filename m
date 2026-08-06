Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDA1C56205
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 15:49:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384954.1627646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws0LY-0004t2-Vq; Thu, 06 Aug 2026 15:49:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384954.1627646; Thu, 06 Aug 2026 15:49:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws0LY-0004ss-TF; Thu, 06 Aug 2026 15:49:28 +0000
Received: by outflank-mailman (input) for mailman id 1384954;
 Thu, 06 Aug 2026 15:49:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1ws0LX-0004sV-Pv
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 15:49:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1ws0LX-00834N-1a;
 Thu, 06 Aug 2026 15:49:27 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1ws0LW-009qdZ-2z;
 Thu, 06 Aug 2026 15:49:27 +0000
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
	bh=4D0z06vjOYg9blHCRUsB77y4tATWODBBrawlmczEE3k=; b=1FpGpzkxrMGxAJSJ6Ab7WQRMjd
	SFsrpewCbERnt7CjwpKqp4f2Wq8cXbDeMLDvxEUV+HGSVDzrhWRsgoUe1Eg+wqrLYzdWaTWwBnSHj
	YHYBpLyrI5rf8h38BaHm7Fu3MORoI+ikSlF0XUrKdCsNYDTXB8lfSyDfetTtrFTy8HWo=;
From: Roger Pau Monne <roger@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v2 1/2] x86/pci: prevent cross-device accesses in pci_mmcfg_{read,write}()
Date: Thu,  6 Aug 2026 17:26:18 +0200
Message-ID: <20260806152619.23881-2-roger@xenproject.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806152619.23881-1-roger@xenproject.org>
References: <20260806152619.23881-1-roger@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce a specific check that prevents an accesses from spilling across
two devices.

Signed-off-by: Roger Pau Monné <roger@xenproject.org>
---
Changes since v1:
 - New in this version.
---
 xen/arch/x86/x86_64/mmconfig_64.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/x86_64/mmconfig_64.c b/xen/arch/x86/x86_64/mmconfig_64.c
index 940cf6d7471b..91b1a398e646 100644
--- a/xen/arch/x86/x86_64/mmconfig_64.c
+++ b/xen/arch/x86/x86_64/mmconfig_64.c
@@ -61,7 +61,8 @@ int pci_mmcfg_read(unsigned int seg, unsigned int bus,
     char __iomem *addr;
 
     /* Why do we have this when nobody checks it. How about a BUG()!? -AK */
-    if (unlikely((bus > 255) || (devfn > 255) || (reg > 4095))) {
+    if (unlikely((bus > 255) || (devfn > 255) ||
+                 (reg + len > PCI_CFG_SPACE_EXP_SIZE))) {
 err:        *value = -1;
         return -EINVAL;
     }
@@ -91,7 +92,8 @@ int pci_mmcfg_write(unsigned int seg, unsigned int bus,
     char __iomem *addr;
 
     /* Why do we have this when nobody checks it. How about a BUG()!? -AK */
-    if (unlikely((bus > 255) || (devfn > 255) || (reg > 4095)))
+    if (unlikely((bus > 255) || (devfn > 255) ||
+                 (reg + len > PCI_CFG_SPACE_EXP_SIZE)))
         return -EINVAL;
 
     addr = pci_dev_base(seg, bus, devfn);
-- 
2.53.0


