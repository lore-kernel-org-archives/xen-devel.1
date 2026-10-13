Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A63CC6B34
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 12:07:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446669.1665863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHKEo-0000TJ-Qp; Thu, 15 Oct 2026 12:07:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446669.1665863; Thu, 15 Oct 2026 12:07:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHKEo-0000T9-Mw; Thu, 15 Oct 2026 12:07:10 +0000
Received: by outflank-mailman (input) for mailman id 1446669;
 Tue, 13 Oct 2026 05:35:52 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <tpk.teshan@gmail.com>) id 1xGVB2-0004ln-II
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 05:35:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGVAz-000dC6-3S
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 07:35:49 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <tpk.teshan@gmail.com>)
 id 6acdc31d-8faa-0a2a0a5109dd-0a2a4501b136-30
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 07:35:48 +0200
Received: from [209.85.216.47] (helo=mail-pj1-f47.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <tpk.teshan@gmail.com>)
 id 6acdc333-5984-0a2a45010019-d155d82fe4ca-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 07:35:48 +0200
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-381b831d535so3018871a91.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 22:35:48 -0700 (PDT)
Received: from laptop ([175.157.230.130]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3ab38f5509fsm19656383a91.12.2026.10.12.22.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 22:35:46 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791869747; x=1792474547; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=31jej+zw5eC3wdks2N/0FrXz19KzIMeRP96y4F0yMqY=;
        b=OHrUm715gA0pDQU1qXyaUS/LRfb/JKe2hwZl+rfHUngBFNvf1nckouQHI3p8KWuVQi
         BCHlnm6fNihYikhOvpqNIIXINREkXrwZ2hHD11mCyjbIQ39trdyo5HUwbBTn9cYmxfDR
         aNEI+hIVHiswHAYXDf8SQtaInpHo2tDvT4RuxHPKPD+DFFpcyj/sh/JyOk2YQzUZ1M2L
         VxSV1SVguQ7Fbm4sL66tke6vz6gFyedPEw9E5cFMkrrVrLbCRfZTnP31bawZSnSX6r+U
         /Iz4gNgdxWBfps5Y8KNINUOpY4K58xFiNAYKxYIc2fXfThIBCr7hzyUjhgV6dl3nc7Ut
         3iSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791869747; x=1792474547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=31jej+zw5eC3wdks2N/0FrXz19KzIMeRP96y4F0yMqY=;
        b=rtSpTurph5BH884JViExpAmuu42GeA3FBLv0E4x1wxr3Y2xSwX8gdVSF/SQH7m6mG9
         NrXeoqRTlN0sKEK1s3XJt6P+MlrFm3euf16tsqer1O3GV6s3Zg7bf19jOdBVvRERiEu+
         uSxVbbIVscoF1hj1UcWPurrFtUcW23IYD4sUdnIPncPCg70LyZEaRsrL5X0ZhHFJKEog
         z4QdT55BdI89CcudrN1RakC28q9M4O3RSCql9WYylBcHCg7uhzkRLsS6mSl1iUEWJPAc
         FdBi63RZZyLFuWADOpzeXEqcQoYY1aIBAWhs8Py8OsXWeIFdvmpeRRI2Q/sRLbnnkQxB
         MiEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkpk9LQG50bj+AHLLA54pxqQmLvSPE3pfdJZ2D2wYdZ15KaXHxEtVtod6BGbTYiMUqken/hV58ozQ=@lists.xenproject.org
X-Gm-Message-State: AFq9FYICwQKmEs2at9vHRL612L7N+tT2Kmphi5IXVPrGU5nFgGFWzHyg
	nK1YnjZyqoHhbjxj1mVgcc8oymgnjaEkOocEh+O7+Tbs1sjHwvQKFEqL
X-Gm-Gg: AYBFou2wquvY7BoJq2oQpcTrLwzfYMf9gxo4LUIo+dQSndZD8Hp1aNxf2xVuDjeZTqb
	0j396pkKdOCbmwWGZ1JQgrjG7ZnkpnTpmk9btgPvrg99NZKP2AAl7ObvZC3+RbbsSl3pQejTA/P
	S/m8/ObVfLNgjg7582W0GEk5xMQaMi7vDxZzo6GVOvZc7fjNexif+Ro3XBJJr6UjKdbqY5DK/2X
	zfiRmo4EB3HM+qSwvNYa9YUPSuUIQbmWY7JN1QIT9nQUtM7yoFCiFmlU60wD4GqFxKnFnqn/59r
	fjrU4ccxvtYeo9uB0w1BpF8astspbtWQ+KsyToq6D0A9SdjgiiJIgqmTI24LjBmbWhoEMeU8lXL
	2cKFd+51+tZrIla1O55RixMj8gskjOF3B0tSAYVhrloiBh1sMUXheB8jk5CUf04d6QvJmw+cA/h
	Z7xYW85iQU4zYTJ6ElfPAaqMQQcd4z3mQGgeIjrrNzJNl2nwNEbHLITZwBCD6riQ2JBeIwvysGX
	QwHsuLDcY9PMdC67B7AQnn3ivekppSAdPx7hjTYxLhB/5rhVYIJIuGb
X-Received: by 2002:a17:90b:4e83:b0:3ab:4f1:4f7e with SMTP id 98e67ed59e1d1-3ab3a9dfb4amr9315608a91.28.1791869746831;
        Mon, 12 Oct 2026 22:35:46 -0700 (PDT)
From: Teshan Kannangara <tpk.teshan@gmail.com>
To: jgross@suse.com
Cc: sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Teshan Kannangara <tpk.teshan@gmail.com>
Subject: [PATCH] xen/platform-pci: Disable device before releasing PCI regions
Date: Tue, 13 Oct 2026 11:05:26 +0530
Message-ID: <20261013053526.1336149-1-tpk.teshan@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1791869748-BF063757-AE1F3130/0/0
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


