Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B7F606A31B
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 02:16:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1471121.1679740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOQXI-0008I1-EO; Wed, 04 Nov 2026 02:15:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1471121.1679740; Wed, 04 Nov 2026 02:15:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOQXI-0008Hu-BE; Wed, 04 Nov 2026 02:15:36 +0000
Received: by outflank-mailman (input) for mailman id 1471121;
 Wed, 04 Nov 2026 02:15:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vulab@iscas.ac.cn>) id 1xOQXH-0008Ho-2U
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 02:15:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOQXF-00CluU-UN
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 03:15:33 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vulab@iscas.ac.cn>)
 id 6aea951b-2eae-0a2a0a5409dd-0a2a450b8334-14
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 03:15:32 +0100
Received: from [159.226.251.21] (helo=cstnet.cn)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <vulab@iscas.ac.cn>)
 id 6aea9541-b7e8-0a2a450b0019-9fe2fb15d4ea-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 03:15:31 +0100
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
 by APP-01 (Coremail) with SMTP id qwCowABHcPpAlepq_Xc+AA--.41911S2;
 Wed, 04 Nov 2026 10:15:28 +0800 (CST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Wentao Liang <vulab@iscas.ac.cn>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org
Subject: [PATCH] xen/pciback: drop the device reference if the export fails
Date: Wed,  4 Nov 2026 02:15:37 +0000
Message-Id: <20261104021537.1468780-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowABHcPpAlepq_Xc+AA--.41911S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGr4kXry7Kr47Gr1rKF18Grg_yoW5uF1Upa
	yftFW5ArWkGrZrKwnxXF1UWa4Ykw4Sv34fCryxA3y09395XayxKF95Ar1jga1xC3y8uF1a
	q3srJr48Wr4UAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkqb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14
	v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
	McIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv
	6cx26r48ZrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr
	1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY
	6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU5EQ6tUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgIBA2rqY4K8dgAAst
X-purgate-ID: tlsNG-42698a/1793758532-AB6D29EA-BEA134A8/0/0
X-purgate-type: clean
X-purgate-size: 3344
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

xen_pcibk_export_device() takes a pcistub_device reference through
pcistub_get_pci_dev_by_slot().  On success xen_pcibk_add_pci_dev()
stores the device on the backend's device list and the reference is
released later by xen_pcibk_release_devices().

When the add fails before the device was queued -- the list entry
allocation fails, or for the vpci backend the device is a bridge or no
virtual slot is free -- the reference is never dropped.  psdev->pdev
then keeps pointing at the pdev that free_pdev() frees, and the device
can never be exported to a guest again because
pcistub_device_get_pci_dev() rejects a psdev that already has an owner.

Drop the reference on these paths, taking the device lock which
pcistub_put_pci_dev() requires.  Whether the device was queued is
checked with the coordinates the frontend sees, obtained through
xen_pcibk_get_pcifront_dev(), because the vpci backend hides the real
topology behind a single virtual bus.  The reference is kept when the
failure came from the publish callback, which runs after
list_add_tail() and is undone by xen_pcibk_release_devices().

Fixes: 30edc14bf39a ("xen/pciback: xen pci backend driver.")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/xen/xen-pciback/xenbus.c | 33 +++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/xen-pciback/xenbus.c b/drivers/xen/xen-pciback/xenbus.c
index b34785ba72e1..07e89d4593bb 100644
--- a/drivers/xen/xen-pciback/xenbus.c
+++ b/drivers/xen/xen-pciback/xenbus.c
@@ -223,6 +223,22 @@ static int xen_pcibk_publish_pci_dev(struct xen_pcibk_device *pdev,
 	return err;
 }
 
+/* Is @dev on the device list of the backend behind @pdev? */
+static bool xen_pcibk_dev_is_exported(struct xen_pcibk_device *pdev,
+				      struct pci_dev *dev)
+{
+	unsigned int domain, bus, devfn;
+
+	/*
+	 * The lists are keyed on the coordinates the frontend sees, which
+	 * xen_pcibk_get_pcifront_dev() reports for @dev.
+	 */
+	if (!xen_pcibk_get_pcifront_dev(dev, pdev, &domain, &bus, &devfn))
+		return false;
+
+	return xen_pcibk_get_pci_dev(pdev, domain, bus, devfn) == dev;
+}
+
 static int xen_pcibk_export_device(struct xen_pcibk_device *pdev,
 				 int domain, int bus, int slot, int func,
 				 int devid)
@@ -246,8 +262,23 @@ static int xen_pcibk_export_device(struct xen_pcibk_device *pdev,
 
 	err = xen_pcibk_add_pci_dev(pdev, dev, devid,
 				    xen_pcibk_publish_pci_dev);
-	if (err)
+	if (err) {
+		/*
+		 * The reference taken above is only handed over once the
+		 * device is queued on the backend's device list.  Failures
+		 * before that (no entry, bridge on the vpci bus, no free
+		 * virtual slot) have to drop it here, otherwise the device
+		 * stays pinned to a pdev that is about to be freed.  A
+		 * failing publish callback comes after the queueing and is
+		 * undone by xen_pcibk_release_devices().
+		 */
+		if (!xen_pcibk_dev_is_exported(pdev, dev)) {
+			device_lock(&dev->dev);
+			pcistub_put_pci_dev(dev);
+			device_unlock(&dev->dev);
+		}
 		goto out;
+	}
 
 	dev_info(&dev->dev, "registering for %d\n", pdev->xdev->otherend_id);
 	if (xen_register_device_domain_owner(dev,
-- 
2.34.1


