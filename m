Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF984C5DF81
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2026 13:56:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1396599.1634385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx3Fh-0000Wt-Oa; Thu, 20 Aug 2026 13:56:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1396599.1634385; Thu, 20 Aug 2026 13:56:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx3Fh-0000Wm-L4; Thu, 20 Aug 2026 13:56:17 +0000
Received: by outflank-mailman (input) for mailman id 1396599;
 Thu, 20 Aug 2026 13:56:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ruoyuw560@gmail.com>) id 1wx3Ff-0000WN-TQ
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 13:56:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wx3Fd-004Cef-1F
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 15:56:13 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ruoyuw560@gmail.com>)
 id 6a870776-bab6-0a2a0a5309dd-0a2a45079eaa-20
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 15:56:13 +0200
Received: from [209.85.216.48] (helo=mail-pj1-f48.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ruoyuw560@gmail.com>)
 id 6a87077b-b4ea-0a2a45070019-d155d830e1ea-3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 15:56:12 +0200
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-38e7109321dso1472780a91.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 06:56:12 -0700 (PDT)
Received: from haichao.tail057a43.ts.net
 ([2001:da8:e000:1206:85a4:b9cf:b578:4307])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3957f9ab4b4sm6653893a91.8.2026.08.20.06.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2026 06:56:10 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787234171; x=1787838971; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IK7VtHj+yeJrnKBH2mt3PEgztVO6LVM/yM8XqEcV4BY=;
        b=bYEhHylU7fZzWK3DV+nPQbiZnn4JIfjyrTcQVacBESHQVmqY3T1rwxH0ZMeKnRxuQM
         +C0N7UqMlheeFwObIIgZWVvASVVBmHLBCSnU9wZSlMNAp2giF3bYXrXe69fkS/GNgwzL
         WZhbHX2hhhJxLbw43WpSJh6LdMIuD5ecvLxW8n/LsWNfex9KFpTa/EljE0bAKERCNlaM
         T4XnyrbN78N+lJvYk/TBg4n/TXFYdk19DnN598p2walnwhNnRSj/ohLTe7fPlWfNOqhe
         YyHCl7LpzzwLn7LmQdlN33ux6e2jusemVQ9GFgn+NW9uuxIGpRsGl72UAyZF78Ayu7u0
         osTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787234171; x=1787838971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IK7VtHj+yeJrnKBH2mt3PEgztVO6LVM/yM8XqEcV4BY=;
        b=rk/RHRWtDMd4x/WLTSt+kzFr3dGtO82GFHLIzXXsUgXic4Jvl5l8egjjIcuBJPPXsS
         qPgrrtzZyg/O0a+xeDql3RzfOlLhiLDmMjz8o27TDnmj1AOM7p+GQZ0WPAX1Tq+2Sz7+
         QR0XucPE6XYluP8K49hOGnpyvLMgnSxjzDSrHdWUykccUF9QjHrrHEJD+bmXRbfoqmMu
         4hzst8I4b2gfHG8YHEsGEb4oU3h08JXqOnC6NgtcjCHK5wr0Qn/hdzn1ApJOXbT/Kwyf
         Wb3+wS6tGYI/gK12ay2ti+bXBzitQm3J2DLivHhgilK25GrjDUF0qKB3M20hWbOFY2U7
         oUXw==
X-Gm-Message-State: AFuF++lTA+gTC/Uex/BlW2bs7BnfxN0a+viXwTKhE+dxwqocjdAMAwvZ
	t0ckZ1Tz0sukWkbKrODilD2+eOXY4yav1B75ZTj4A00HE1CFTgE+1KO9
X-Gm-Gg: AR+sD12ADH67XCIP4MuPXvD6vkrIxIw7/NLQJl9uCx6jA3pIIivLBB/bVe6Qp3/JkYy
	S7xNKQCX/Dy8XmjAAU5046O3SwG81udR85UM9fBBNTGNk86tQcEz1LJGJRRBbcNHz/Z64dkGrzf
	iV0yy9Epz/+G2EBOw0MoQ8D/P51LPBaFP9QKRpfWxyRZNnSOb1nXyL69pauKOEcxuAEdMMdkoee
	voJ6u9VbqNzLe7WGCmnb1MysS71a6+GCoZqJIEnCX85Aeq2S9kJUwSMPZhkm29QQDBx7grTOnxP
	ZAi38mEN/NL9vIL/l4ikEx/4mDM1XIzo70bRiIDAQz6HE5f5zIJrngt7ztE06wOhesF/Wl9xg2g
	eIKH9J/+4VGQ5phTnN4j/oWffY9QKsljexFUZqcLbxlWqklBzzVix7YyWsqrC3CkO55MnAb+6IG
	DiqEKkUB0Gl76G+kuRVn6xwZP5Euu6zzPbxIipWNW920cI4nlurVpnoYQZT/H2MbNZY5uzGGxqj
	BFUUsc+
X-Received: by 2002:a17:90b:2d05:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-39581470f03mr25148158a91.14.1787234170841;
        Thu, 20 Aug 2026 06:56:10 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Jan Beulich <JBeulich@novell.com>,
	Lukas Wunner <lukas@wunner.de>
Cc: xen-devel@lists.xenproject.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH v2] xen/pcifront: Fix PCI device reference leak in AER handling
Date: Thu, 20 Aug 2026 21:56:03 +0800
Message-ID: <20260820135603.3901798-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1787234173-35EC6AE4-DEF991CC/0/0
X-purgate-type: clean
X-purgate-size: 2143

pci_get_domain_bus_and_slot() increments the reference count of the
returned PCI device. pcifront_common_process() drops that reference only
when the device or its driver is missing. All paths for a bound device
either return directly after invoking an error recovery callback or fall
through without calling pci_dev_put(). Consequently, each AER request for
a bound device leaks a reference and can keep the device allocated after
removal.

Declare the looked-up device with __free(pci_dev_put), so every return
path releases the reference after callback dispatch. This keeps the
device alive while its callback runs and balances the lookup without
restructuring the callback returns.

This issue was found by a static analysis checker and confirmed by manual
source review.

Fixes: 956a9202cd12 ("xen-pcifront: Xen PCI frontend driver.")
Suggested-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
Changes in v2:
- Use __free(pci_dev_put) instead of restructuring the callback returns.

Link: https://lore.kernel.org/r/20260813153138.3953222-1-ruoyuw560@gmail.com/
---
 drivers/pci/xen-pcifront.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/xen-pcifront.c b/drivers/pci/xen-pcifront.c
index cffc32d660327..0dea8a69fa36c 100644
--- a/drivers/pci/xen-pcifront.c
+++ b/drivers/pci/xen-pcifront.c
@@ -579,16 +579,15 @@ static pci_ers_result_t pcifront_common_process(int cmd,
 	int bus = pdev->sh_info->aer_op.bus;
 	int devfn = pdev->sh_info->aer_op.devfn;
 	int domain = pdev->sh_info->aer_op.domain;
-	struct pci_dev *pcidev;
+	struct pci_dev *pcidev __free(pci_dev_put) =
+		pci_get_domain_bus_and_slot(domain, bus, devfn);
 
 	dev_dbg(&pdev->xdev->dev,
 		"pcifront AER process: cmd %x (bus:%x, devfn%x)",
 		cmd, bus, devfn);
 
-	pcidev = pci_get_domain_bus_and_slot(domain, bus, devfn);
 	if (!pcidev || !pcidev->dev.driver) {
 		dev_err(&pdev->xdev->dev, "device or AER driver is NULL\n");
-		pci_dev_put(pcidev);
 		return PCI_ERS_RESULT_NONE;
 	}
 	pdrv = to_pci_driver(pcidev->dev.driver);
-- 
2.51.0


