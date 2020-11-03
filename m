Return-Path: <SRS0=JyiM=EJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CFF7C2D0A3
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2020 16:00:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0104F22264
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2020 16:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0104F22264
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.18395.43428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZyjH-0008Jg-7E; Tue, 03 Nov 2020 16:00:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18395.43428; Tue, 03 Nov 2020 16:00:15 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZyjH-0008JX-2B; Tue, 03 Nov 2020 16:00:15 +0000
Received: by outflank-mailman (input) for mailman id 18395;
 Tue, 03 Nov 2020 16:00:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RC30=EJ=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kZyjG-0008I1-0D
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 16:00:14 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0d301239-0fe5-4670-a290-67d4b4fefb0d;
 Tue, 03 Nov 2020 16:00:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1660E139F;
 Tue,  3 Nov 2020 08:00:12 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown
 [10.58.246.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B8DAD3F66E;
 Tue,  3 Nov 2020 08:00:10 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=RC30=EJ=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kZyjG-0008I1-0D
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 16:00:14 +0000
X-Inumbo-ID: 0d301239-0fe5-4670-a290-67d4b4fefb0d
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 0d301239-0fe5-4670-a290-67d4b4fefb0d;
	Tue, 03 Nov 2020 16:00:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1660E139F;
	Tue,  3 Nov 2020 08:00:12 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown [10.58.246.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B8DAD3F66E;
	Tue,  3 Nov 2020 08:00:10 -0800 (PST)
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/4] xen/pci: Introduce new CONFIG_PCI_ATS flag for PCI ATS functionality.
Date: Tue,  3 Nov 2020 15:59:13 +0000
Message-Id: <27814e614618c413ac61a9f7a48d795c557bfe5c.1604417224.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604417224.git.rahul.singh@arm.com>
References: <cover.1604417224.git.rahul.singh@arm.com>
In-Reply-To: <cover.1604417224.git.rahul.singh@arm.com>
References: <cover.1604417224.git.rahul.singh@arm.com>

PCI ATS functionality is not enabled and tested for ARM architecture
but it is enabled for x86 and referenced in common passthrough/pci.c
code.

Therefore introducing the new flag to enable the ATS functionality for
x86 only to avoid issues for ARM architecture.

No functional change.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---

Changes in v2:
 - Fixed return value of PCI ATS related functions when PCI_ATS is not enabled.
 - Make PCI_ATS user selectable kconfig option.

---
 xen/drivers/passthrough/ats.h        | 26 ++++++++++++++++++++++++++
 xen/drivers/passthrough/x86/Makefile |  2 +-
 xen/drivers/pci/Kconfig              |  9 +++++++++
 3 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/ats.h b/xen/drivers/passthrough/ats.h
index 22ae209b37..3a71fedcb4 100644
--- a/xen/drivers/passthrough/ats.h
+++ b/xen/drivers/passthrough/ats.h
@@ -17,6 +17,8 @@
 
 #include <xen/pci_regs.h>
 
+#ifdef CONFIG_PCI_ATS
+
 #define ATS_REG_CAP    4
 #define ATS_REG_CTL    6
 #define ATS_QUEUE_DEPTH_MASK     0x1f
@@ -48,5 +50,29 @@ static inline int pci_ats_device(int seg, int bus, int devfn)
     return pci_find_ext_capability(seg, bus, devfn, PCI_EXT_CAP_ID_ATS);
 }
 
+#else
+
+#define ats_enabled (false)
+
+static inline int enable_ats_device(struct pci_dev *pdev,
+                                    struct list_head *ats_list)
+{
+    return -EOPNOTSUPP;
+}
+
+static inline void disable_ats_device(struct pci_dev *pdev) { }
+
+static inline int pci_ats_enabled(int seg, int bus, int devfn)
+{
+    return 0;
+}
+
+static inline int pci_ats_device(int seg, int bus, int devfn)
+{
+    return 0;
+}
+
+#endif /* CONFIG_PCI_ATS */
+
 #endif /* _ATS_H_ */
 
diff --git a/xen/drivers/passthrough/x86/Makefile b/xen/drivers/passthrough/x86/Makefile
index a70cf9460d..aa515c680d 100644
--- a/xen/drivers/passthrough/x86/Makefile
+++ b/xen/drivers/passthrough/x86/Makefile
@@ -1,2 +1,2 @@
-obj-y += ats.o
+obj-$(CONFIG_PCI_ATS) += ats.o
 obj-y += iommu.o
diff --git a/xen/drivers/pci/Kconfig b/xen/drivers/pci/Kconfig
index 7da03fa13b..3cb79ea954 100644
--- a/xen/drivers/pci/Kconfig
+++ b/xen/drivers/pci/Kconfig
@@ -1,3 +1,12 @@
 
 config HAS_PCI
 	bool
+
+config PCI_ATS
+	bool "PCI ATS support"
+	default y
+	depends on X86 && HAS_PCI
+	---help---
+	 Enable PCI Address Translation Services.
+
+	 If unsure, say Y.
-- 
2.17.1


