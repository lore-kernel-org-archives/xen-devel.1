Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79FAC5CFCF
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 18:05:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390219.1630819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuZnW-00029Z-Tf; Thu, 13 Aug 2026 18:04:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390219.1630819; Thu, 13 Aug 2026 18:04:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuZnW-00029S-Qm; Thu, 13 Aug 2026 18:04:58 +0000
Received: by outflank-mailman (input) for mailman id 1390219;
 Thu, 13 Aug 2026 15:31:46 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ruoyuw560@gmail.com>) id 1wuXPG-0007Wt-K9
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 15:31:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuXPF-009x93-KM
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 17:31:45 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ruoyuw560@gmail.com>)
 id 6a7de349-bab6-0a2a0a5309dd-0a2a450bc1c0-48
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 17:31:45 +0200
Received: from [209.85.214.169] (helo=mail-pl1-f169.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ruoyuw560@gmail.com>)
 id 6a7de360-b7e8-0a2a450b0019-d155d6a9cdb0-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 17:31:45 +0200
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2cc97653887so1076835ad.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 08:31:45 -0700 (PDT)
Received: from haichao.tail057a43.ts.net
 ([2001:da8:e000:1206:3b7:6da1:c188:d14f])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d37c4e8098sm11911405ad.84.2026.08.13.08.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2026 08:31:42 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786635103; x=1787239903; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5PO43KtK1vinlhveejSpb/w0mOz3aVvtFpKxNKIjn3Q=;
        b=SZtONlbgC7aXywlk40MDcZG3OJDcYKUoLLxnE6mleBj0KH5TjvBhfNp2c/3Kl16iW4
         nUvcR21mgpXUcOZdkepV82hNg3Ypzh/gSPuiGdVISnYjZ+qfVOM25T6xumLaBujDS4pK
         IcVakOSmE40DkP/ii4ZZW27fINI1oO109eqIhBOeWcffRq16DhLP8pvapI0XDALEv7vz
         eyT4R2Tfr0OSpOCE6w3NEPxTjn9vYTMI07lYS/yfrPH2K+BEVk3gOxZIVxzyAYodTwPk
         SIfk3wEDGMGKOLySVDXVSlV3O1NFJSRT4ZNgwTaquad0Msu4j+KE+1UUVmCi7pkjLjF/
         Eaig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635103; x=1787239903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5PO43KtK1vinlhveejSpb/w0mOz3aVvtFpKxNKIjn3Q=;
        b=cdNYPuwy5ecECcAg9i35V99or2NuoCuiPg6Euc9GTK9blPAJsYL9cJSTySzYpH1nlK
         fhnno7wEkfVNTa5JC6FyaoQTs+jr5HeybIdyaH40ge/IeLCMmY3rNDa07BOc/4moyqr9
         St4rwPic6DtKHxfNLnVmgcwMV2gIRznGfQ52PAg8mR3IxDey5nhu17HzSZiX75cSfVeR
         KTKIWa03/v8aBruP4JvwCqgi0YQ7mGA71UrV6ZJiWfMzhM3gh+XuKqkBQBGSC01xZX5d
         SRtVrPLnMa7PVzMVkJ4sKNOj8QQUuY/tICjxtmfh2rg1TmQyXNQ72Ivqkaj1tveWHmlT
         2w0w==
X-Gm-Message-State: AOJu0YxnjNQQiSpuPiDPWW49+bOPJX7zjVi9lbJjNLhhls/J1IVEZxsW
	z1CQdWizj5OYxwU/VTJUwZzR1w5QdsT4fPy+5cU2ebz0iSdCjSTgD1G05D4oJAYjztA=
X-Gm-Gg: AR+sD10JFGJLPuW/kV6bkr/rfGUdJCtIskiJfAbz9tek6gabZKnVc1PIvRi8Gfgr4/0
	Aletpk03/071Q3foeU2ideg0rpMDSu647yKBSrda5FVn/uR6flYGh6knnOVKkmKoTo1QSWI7LM7
	vSjxNzF8MUkaKPGJu/KmlG9WEdiy9AoYtBEmePv9dDY/dYc4YYj02LsY0wkULwzWDY6iHpHVDl8
	0iJ1dwzcxsARC10ERqBVWWjgCtqFXHn1IypjO4LH0EeGObVch8Nek4Ec4wXnwCAD6vf10eFdvg8
	pUDmzrznNzsz2CQBbd2T8+T2toAavdoOZWQ2gZtlTzEFeh0nzyYJn0mVWjXU5Mr7Gv7F1omjOay
	oJP3EJ/0621/tTfRuI6c/LTiwo+9MfD4Y/mrgnqOvbGY9bbmOhwTqoblDBe1Lrn17CA3VkhaQ9y
	S1uTJ7WGhBraCD8P7lYIVuFONmrThvpf9g9F1XRgp07CxQMJtIk9zKYRegq0sgEYhmtByMxMoZl
	ce8iFcV
X-Received: by 2002:a17:902:ea0b:b0:2c9:9a19:df with SMTP id d9443c01a7336-2d37ebb174cmr71789975ad.18.1786635103360;
        Thu, 13 Aug 2026 08:31:43 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	bhelgaas@google.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] xen/pcifront: Fix PCI device reference leak in AER handling
Date: Thu, 13 Aug 2026 23:31:38 +0800
Message-ID: <20260813153138.3953222-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1786635105-18CCF9EA-38E32766/0/0
X-purgate-type: clean
X-purgate-size: 2422

pci_get_domain_bus_and_slot() increments the reference count of the
returned PCI device. pcifront_common_process() drops that reference only
when the device or its driver is missing. All paths for a bound device
either return directly after invoking an error recovery callback or fall
through without calling pci_dev_put(). Consequently, each AER request for
a bound device leaks a reference and can keep the device allocated after
removal.

Store the callback result, release the reference after callback dispatch,
and then return the result. This keeps the device alive while its callback
runs and balances the lookup on every successful path.

This issue was found by a static analysis checker and confirmed by manual
source review.

Fixes: 956a9202cd12 ("xen-pcifront: Xen PCI frontend driver.")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/pci/xen-pcifront.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/xen-pcifront.c b/drivers/pci/xen-pcifront.c
index cffc32d6603277..07263dfe22d538 100644
--- a/drivers/pci/xen-pcifront.c
+++ b/drivers/pci/xen-pcifront.c
@@ -575,6 +575,7 @@ static pci_ers_result_t pcifront_common_process(int cmd,
 						struct pcifront_device *pdev,
 						pci_channel_state_t state)
 {
+	pci_ers_result_t result = PCI_ERS_RESULT_NONE;
 	struct pci_driver *pdrv;
 	int bus = pdev->sh_info->aer_op.bus;
 	int devfn = pdev->sh_info->aer_op.devfn;
@@ -597,21 +598,25 @@ static pci_ers_result_t pcifront_common_process(int cmd,
 		pci_dbg(pcidev, "trying to call AER service\n");
 		switch (cmd) {
 		case XEN_PCI_OP_aer_detected:
-			return pdrv->err_handler->error_detected(pcidev, state);
+			result = pdrv->err_handler->error_detected(pcidev, state);
+			break;
 		case XEN_PCI_OP_aer_mmio:
-			return pdrv->err_handler->mmio_enabled(pcidev);
+			result = pdrv->err_handler->mmio_enabled(pcidev);
+			break;
 		case XEN_PCI_OP_aer_slotreset:
-			return pdrv->err_handler->slot_reset(pcidev);
+			result = pdrv->err_handler->slot_reset(pcidev);
+			break;
 		case XEN_PCI_OP_aer_resume:
 			pdrv->err_handler->resume(pcidev);
-			return PCI_ERS_RESULT_NONE;
+			break;
 		default:
 			dev_err(&pdev->xdev->dev,
 				"bad request in aer recovery operation!\n");
 		}
 	}
 
-	return PCI_ERS_RESULT_NONE;
+	pci_dev_put(pcidev);
+	return result;
 }
 
 
-- 
2.51.0


