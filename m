Return-Path: <SRS0=yhtS=OY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A951FC433F5
	for <xen-devel@archiver.kernel.org>; Mon,  4 Oct 2021 11:53:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70BFD6139E
	for <xen-devel@archiver.kernel.org>; Mon,  4 Oct 2021 11:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 70BFD6139E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.201301.355748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXMWn-0000fu-1Q; Mon, 04 Oct 2021 11:53:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201301.355748; Mon, 04 Oct 2021 11:53:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXMWm-0000fn-T9; Mon, 04 Oct 2021 11:53:04 +0000
Received: by outflank-mailman (input) for mailman id 201301;
 Mon, 04 Oct 2021 11:53:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TJPG=OY=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mXMWl-0000bX-SY
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 11:53:03 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 9ebeedf2-2509-11ec-beab-12813bfff9fa;
 Mon, 04 Oct 2021 11:52:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5B80D6E;
 Mon,  4 Oct 2021 04:52:58 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B51833F70D;
 Mon,  4 Oct 2021 04:52:57 -0700 (PDT)
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
X-Inumbo-ID: 9ebeedf2-2509-11ec-beab-12813bfff9fa
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Andre.Przywara@arm.com,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 01/14] xen/pci: gate APEI support on ARM
Date: Mon,  4 Oct 2021 12:51:56 +0100
Message-Id: <86152436450756519f255309b7ea9cf23823517d.1633340795.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633340795.git.rahul.singh@arm.com>
References: <cover.1633340795.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

APEI not supported on ARM yet move the code under CONFIG_X86 flag to
gate the code for ARM.

This patch is the preparatory work to enable HAS_PCI on ARM to avoid
compilation error on ARM.

prelink.o: In function `pcie_aer_get_firmware_first’:
drivers/passthrough/pci.c:1251: undefined reference to `apei_hest_parse'

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Chane in v4:
- Modify commit message based on received comment.
- Added Acked-by: Jan Beulich <jbeulich@suse.com>
- Added Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Change in v3: Added Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Change in v2: Add in code comment "APEI not supported on ARM yet"
---
---
 xen/drivers/passthrough/pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 5456ca3a63..e1b735d9e8 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1149,7 +1149,8 @@ void __hwdom_init setup_hwdom_pci_devices(
     pcidevs_unlock();
 }
 
-#ifdef CONFIG_ACPI
+/* APEI not supported on ARM yet. */
+#if defined(CONFIG_ACPI) && defined(CONFIG_X86)
 #include <acpi/acpi.h>
 #include <acpi/apei.h>
 
-- 
2.25.1


