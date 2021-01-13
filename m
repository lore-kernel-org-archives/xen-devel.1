Return-Path: <SRS0=UsJP=GQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3908C433E0
	for <xen-devel@archiver.kernel.org>; Wed, 13 Jan 2021 13:27:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 573C3221F1
	for <xen-devel@archiver.kernel.org>; Wed, 13 Jan 2021 13:27:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 573C3221F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.66525.118201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzgAt-0002qy-E3; Wed, 13 Jan 2021 13:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66525.118201; Wed, 13 Jan 2021 13:26:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzgAt-0002qr-AZ; Wed, 13 Jan 2021 13:26:59 +0000
Received: by outflank-mailman (input) for mailman id 66525;
 Wed, 13 Jan 2021 13:26:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=anHs=GQ=casper.srs.infradead.org=batv+0dec5b2398d3e162eee7+6352+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1kzgAq-0002b0-Hw
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 13:26:57 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ed141c5-1e13-4e8d-ab65-61b862738d15;
 Wed, 13 Jan 2021 13:26:38 +0000 (UTC)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1kzgA5-006IZS-AH; Wed, 13 Jan 2021 13:26:13 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1kzgA4-001m38-Tb; Wed, 13 Jan 2021 13:26:08 +0000
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
X-Inumbo-ID: 9ed141c5-1e13-4e8d-ab65-61b862738d15
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=syx4fu3vYSlHpqPUTOPP75qBiFyto3EbQNXax9AAeb0=; b=njCsb+X1885IP+Jo5MZr8HIal/
	GYKp9MPuFSINd1L828fHtiBUJzOjnuMi0Yqv4Rw/knAuMQ5fU/6DK9Bc0ffBM/+AUiz6ZgwPjLdME
	momt5HGkIZ7wJptAEHwQrEdkfTk5EJyQ/Y6RU2J2LlHBP8xyGNzOE/esxcKBod7h8DND+hcbbTETL
	JmB3Eo5XoBOptP3MW2ySGn1lfC1p8edv/+zG/zbXpk/kNJC7pN9Nng+SpiS3/bwjunjo4Mfl5O8fi
	da21WVycMIKzZ+oaXQZ6Pw+EZg1jkem/UWXTvpGIb1regco2xVidKkKpUmwPCSl61v/ttrxwDWdzJ
	FbRyLv8A==;
From: David Woodhouse <dwmw2@infradead.org>
To: x86@kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Paul Durrant <pdurrant@amazon.com>,
	jgrall@amazon.com,
	karahmed@amazon.de,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH v4 2/5] xen: Set platform PCI device INTX affinity to CPU0
Date: Wed, 13 Jan 2021 13:26:03 +0000
Message-Id: <20210113132606.422794-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210113132606.422794-1-dwmw2@infradead.org>
References: <20210113132606.422794-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

With INTX or GSI delivery, Xen uses the event channel structures of CPU0.

If the interrupt gets handled by Linux on a different CPU, then no events
are seen as pending. Rather than introducing locking to allow other CPUs
to process CPU0's events, just ensure that the PCI interrupts happens
only on CPU0.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
---
 drivers/xen/platform-pci.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/xen/platform-pci.c b/drivers/xen/platform-pci.c
index 9db557b76511..18f0ed8b1f93 100644
--- a/drivers/xen/platform-pci.c
+++ b/drivers/xen/platform-pci.c
@@ -132,6 +132,13 @@ static int platform_pci_probe(struct pci_dev *pdev,
 			dev_warn(&pdev->dev, "request_irq failed err=%d\n", ret);
 			goto out;
 		}
+		/*
+		 * It doesn't strictly *have* to run on CPU0 but it sure
+		 * as hell better process the event channel ports delivered
+		 * to CPU0.
+		 */
+		irq_set_affinity(pdev->irq, cpumask_of(0));
+
 		callback_via = get_callback_via(pdev);
 		ret = xen_set_callback_via(callback_via);
 		if (ret) {
-- 
2.29.2


