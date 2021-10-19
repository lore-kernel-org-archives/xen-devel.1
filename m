Return-Path: <SRS0=1/kX=PH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54CD3C433EF
	for <xen-devel@archiver.kernel.org>; Tue, 19 Oct 2021 10:41:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21D71610E7
	for <xen-devel@archiver.kernel.org>; Tue, 19 Oct 2021 10:41:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 21D71610E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.212955.371037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcmYq-0000cv-DE; Tue, 19 Oct 2021 10:41:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212955.371037; Tue, 19 Oct 2021 10:41:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcmYq-0000ch-9u; Tue, 19 Oct 2021 10:41:36 +0000
Received: by outflank-mailman (input) for mailman id 212955;
 Tue, 19 Oct 2021 10:41:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJzt=PH=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1mcmYo-0008TS-Mw
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 10:41:34 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 1e14144b-30c9-11ec-830c-12813bfff9fa;
 Tue, 19 Oct 2021 10:41:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78C26D6E;
 Tue, 19 Oct 2021 03:41:30 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3FF343F70D;
 Tue, 19 Oct 2021 03:41:29 -0700 (PDT)
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
X-Inumbo-ID: 1e14144b-30c9-11ec-830c-12813bfff9fa
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	sstabellini@kernel.org,
	Oleksandr_Andrushchenko@epam.com,
	jbeulich@suse.com,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/3] xen/vpci: Remove __hwdom_init for vpci_add_handlers
Date: Tue, 19 Oct 2021 11:40:34 +0100
Message-Id: <33b03be7eeea521953790542eb31d5a1386d2b81.1634639117.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634639117.git.bertrand.marquis@arm.com>
References: <cover.1634639117.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vpci_add_handlers is called on during pci_device_add which can be called
at runtime through hypercall physdev_op.
Remove __hwdom_init as the call is not limited anymore to hardware
domain init.

Fixes: d59168dc05 ("xen/arm: Enable the existing x86 virtual PCI support
for ARM")
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/drivers/vpci/vpci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index decf7d87a1..74894bcbac 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -54,7 +54,7 @@ void vpci_remove_device(struct pci_dev *pdev)
     pdev->vpci = NULL;
 }
 
-int __hwdom_init vpci_add_handlers(struct pci_dev *pdev)
+int vpci_add_handlers(struct pci_dev *pdev)
 {
     unsigned int i;
     int rc = 0;
-- 
2.25.1


