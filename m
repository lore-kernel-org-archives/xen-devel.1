Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1855ACC6B34
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 12:07:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446671.1665870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHKEp-0000Zy-6Q; Thu, 15 Oct 2026 12:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446671.1665870; Thu, 15 Oct 2026 12:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHKEp-0000Ys-0q; Thu, 15 Oct 2026 12:07:11 +0000
Received: by outflank-mailman (input) for mailman id 1446671;
 Tue, 13 Oct 2026 05:36:32 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <tpk.teshan@gmail.com>) id 1xGVBg-0004ns-1n
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 05:36:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGVBf-000dO6-Ec
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 07:36:31 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <tpk.teshan@gmail.com>)
 id 6acdc35b-8faa-0a2a0a5109dd-0a2a450cba12-14
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 07:36:31 +0200
Received: from [209.85.216.43] (helo=mail-pj1-f43.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <tpk.teshan@gmail.com>)
 id 6acdc35d-f479-0a2a450c0019-d155d82bd831-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 07:36:31 +0200
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-3a0aaa0fd13so1758365a91.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 22:36:30 -0700 (PDT)
Received: from laptop ([175.157.230.130]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3ab38f4863esm22898117a91.11.2026.10.12.22.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 22:36:28 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791869789; x=1792474589; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=31jej+zw5eC3wdks2N/0FrXz19KzIMeRP96y4F0yMqY=;
        b=lB5Y4BVdzKoAhMkIvOAKLK+rpLLKjqFM0LN2xkM5Q+xB/qohtXxUpe7MTDBf7GpQ/M
         IhFwbOWaLmS62NkTR0Mym2IpSZtaGNIHXXOex+PGf7f70Jh410OZWIQq+T8GryKKHujB
         aAQPlXS+O52xD5iSRuT6UpQ/K9RAktSYDPqaWfi5tFGpq4geqa+tQNJlcYLvF8i8FFGd
         URRUZB91MDatTz4ll0dadSCd4Q0KGbbp9HxM5QSQJjSHyjplhQAZL9WnPNSsudZmBF/F
         Vr2g+7AQa4p6xduTzL5GNkvc7KBxer+7uledE2asNwO+L40aE4f/whQxmBDNXszPcC5c
         TIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791869789; x=1792474589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=31jej+zw5eC3wdks2N/0FrXz19KzIMeRP96y4F0yMqY=;
        b=CaCfvC9D0EIQbvz9382zSh+qHKMhV49VkhKylEQ1lbXkaTi/i7pqlmcHsNYq/cDr20
         camNCQAojT09FyptdRltecnnMFfYaYs6/8s+Uusw1gFKmCd6Q4ANWjWXRIYuWwHOjsSm
         GFFAkPMacDrjH8MAF7QGr3hJlZXpo6uYRg7Wd278BtwTIvW9idxm7OxIAVeU12PlWyq5
         fqLXzcSzY8hWf7Txf+r3ozWG9wM4RNJBHOKjzt4rVE9554foafch125h8vyh+5xvnbtZ
         vaS5kTmBfxXRd+atDFrH5bCBinPrMi7n1JJjtVWxhToJs7lpB+PuG4eaMXCNV8b13bRn
         6gsg==
X-Forwarded-Encrypted: i=1; AKwUvBxKBn9M4a1qIJ2ONYsci2gNt8QbW0DUMFdsOAMktaIw0hMZBNx2MgdnGyI7F854wvkt6gvOn4DuA0Y=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLmO8wKuOQboJ3b/aG1nfyrR0b696H0YtyIurEYtXBXgg5cxr2q
	TS4R4ZMpsPdksu8ex/h4bf8cPUCGlhNL2dvWyKOIijQSoYgI5y4pNIxpOF2/jtx3
X-Gm-Gg: AYBFou0mKsYvgyARwDjUvXf0RSueJN8qBkMjt+oI8bmBZxeRew1H/A530wJiEMRyUvl
	9v7NWYaLTGZ1hnhqtcJFBSJa9mMONfhUilprLB/kLf35cXrYrcOWCAh0tNKGQCN6N37Os/nhjEQ
	4vCm8PTeYK6uvln0SoYArU86ie6BXYFzPsvTatlT+tV75OXqC1IHG7/X2UpRxs6ZWVdtbO1hkvx
	RiK9e/S0X9ontfZz8yz03JUGn0IBmcygA4jf40sGVfm81T+Im+kNE8rlOAT3na2fFvodR26kKEb
	d9mP4ImxV+Co45sSBjLDHOvI/+bUPcvEe/tFFhSW+R2785vSH+X4wrHn6t5+TD8ulpjqskWMXPv
	4KkC9fDfJS+COe7QyESIaeLWY5jDjcs/AtMKyQ1xhBGWxnPtJhwRxf9Z3zqzpyXa59AhWmNykDm
	c892/EVhOfsNb0wjmHvO1S20ofS44UTYzGZsi0Io6lDUDohWbxXb4wiFQLb3cfTEzS3NjuwmOjI
	5x78nBOZMa7rkskmkG8GmrSLWG0du3igWUoeyqBBeqZfgyk6MhiC2sqsA==
X-Received: by 2002:a17:90b:314e:b0:3ab:3201:310c with SMTP id 98e67ed59e1d1-3ab3a9aa90amr9458427a91.63.1791869789235;
        Mon, 12 Oct 2026 22:36:29 -0700 (PDT)
From: Teshan Kannangara <tpk.teshan@gmail.com>
To: jgross@suse.com
Cc: sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Teshan Kannangara <tpk.teshan@gmail.com>
Subject: [PATCH] xen/platform-pci: Disable device before releasing PCI regions
Date: Tue, 13 Oct 2026 11:06:14 +0530
Message-ID: <20261013053614.1337340-1-tpk.teshan@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1791869791-00CCBA5B-FCF871B2/0/0
X-purgate-type: clean
X-purgate-size: 1873

   The probe error paths release the PCI regions before disabling the
   device. Documentation/PCI/pci.rst specifies that drivers should disable
   the device before releasing its regions to prevent devices from
   colliding on the same address range.

   Track successfully requested BARs in a bitmask and use a common cleanup
   path to disable the device before releasing those regions.

Signed-off-by: Teshan Kannangara <tpk.teshan@gmail.com>
---
 drivers/xen/platform-pci.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/xen/platform-pci.c b/drivers/xen/platform-pci.c
index f2438232518c..a12ac57274a6 100644
--- a/drivers/xen/platform-pci.c
+++ b/drivers/xen/platform-pci.c
@@ -95,6 +95,7 @@ static int platform_pci_probe(struct pci_dev *pdev,
 			      const struct pci_device_id *ent)
 {
 	int i, ret;
+	int requested_bars = 0;
 	long ioaddr;
 	long mmio_addr, mmio_len;
 	unsigned int max_nr_gframes;
@@ -115,16 +116,18 @@ static int platform_pci_probe(struct pci_dev *pdev,
 	if (mmio_addr == 0 || ioaddr == 0) {
 		dev_err(&pdev->dev, "no resources found\n");
 		ret = -ENOENT;
-		goto pci_out;
+		goto out;
 	}
 
 	ret = pci_request_region(pdev, 1, DRV_NAME);
 	if (ret < 0)
-		goto pci_out;
+		goto out;
+	requested_bars |= BIT(1);
 
 	ret = pci_request_region(pdev, 0, DRV_NAME);
 	if (ret < 0)
-		goto mem_out;
+		goto out;
+	requested_bars |= BIT(0);
 
 	platform_mmio = mmio_addr;
 	platform_mmiolen = mmio_len;
@@ -165,11 +168,8 @@ static int platform_pci_probe(struct pci_dev *pdev,
 	if (!xen_have_vector_callback)
 		free_irq(pdev->irq, pdev);
 out:
-	pci_release_region(pdev, 0);
-mem_out:
-	pci_release_region(pdev, 1);
-pci_out:
 	pci_disable_device(pdev);
+	pci_release_selected_regions(pdev, requested_bars);
 	return ret;
 }
 
-- 
2.53.0


