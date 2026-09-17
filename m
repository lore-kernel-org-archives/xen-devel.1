Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99848C982CF
	for <xen-devel@archiver.kernel.org>; Thu, 17 Sep 2026 13:30:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1424091.1648809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7CBY-0007mf-CP; Thu, 17 Sep 2026 13:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1424091.1648809; Thu, 17 Sep 2026 13:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7CBY-0007mY-8k; Thu, 17 Sep 2026 13:29:56 +0000
Received: by outflank-mailman (input) for mailman id 1424091;
 Thu, 17 Sep 2026 13:29:54 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vulab@iscas.ac.cn>) id 1x7CBW-0007mS-OA
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 13:29:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7CBV-00BPNz-Lg
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 15:29:53 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vulab@iscas.ac.cn>)
 id 6aabeb49-2eae-0a2a0a5409dd-0a2a450ae47a-20
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 15:29:52 +0200
Received: from [159.226.251.25] (helo=cstnet.cn)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <vulab@iscas.ac.cn>)
 id 6aabeb4d-f2d2-0a2a450a0019-9fe2fb19a85e-3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 15:29:51 +0200
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
 by APP-05 (Coremail) with SMTP id zQCowACXADtI66tqC3qBCA--.3599S2;
 Thu, 17 Sep 2026 21:29:44 +0800 (CST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Wentao Liang <vulab@iscas.ac.cn>
To: bhelgaas@google.com
Cc: boris.ostrovsky@oracle.com,
	jgross@suse.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	oleksandr_tyshchenko@epam.com,
	sstabellini@kernel.org,
	u.kleine-koenig@pengutronix.de,
	xen-devel@lists.xenproject.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] xen/pcifront: Fix PCI device reference leak in pcifront_common_process()
Date: Thu, 17 Sep 2026 13:29:44 +0000
Message-Id: <20260917132944.2153421-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowACXADtI66tqC3qBCA--.3599S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WF1Uur1rKw1fAFWxWry5twb_yoW8uw1fp3
	98AF13Ars0ya40qrZxAF4jga45ZFsrJ3y7C3ySg3s7X34aq3Z5Jw15JF1a9r48G395Zrnx
	trnxJa1UZF1UXaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPqb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxV
	W0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Cr1j6rxdMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VAI37AI020EjII2zVCS5cI20VAGYxC7M4II
	rI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMx
	AIw28IcVCjz48v1sIEY20_Gr43Wr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r
	43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
	0_Gr1j6F4UJwCI42IY6I8E87Iv6xkF7I0E14v26rxl6s0DYxBIdaVFxhVjvjDU0xZFpf9x
	07bb5rxUUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgQNA2qrq3bHZgAAsx
X-purgate-ID: tlsNG-4011c0/1789651792-53ED2CFC-D9A70334/0/0
X-purgate-type: clean
X-purgate-size: 2147

pcifront_common_process() gets a reference to the PCI device with
pci_get_domain_bus_and_slot() and only drops it on the early error
path.  Returning directly from the AER handler switch instead of
recording the result and falling through to the common
pci_dev_put(pcidev) leaks the reference on every successful call.

Collect the handler result in a variable and drop the reference on the
single exit path again.

Fixes: 34ab316d7287 ("xen/pcifront: Drop pcifront_common_process() tests of pcidev, pdrv")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/pci/xen-pcifront.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/xen-pcifront.c b/drivers/pci/xen-pcifront.c
index cffc32d66032..5fdce7c41af5 100644
--- a/drivers/pci/xen-pcifront.c
+++ b/drivers/pci/xen-pcifront.c
@@ -579,6 +579,7 @@ static pci_ers_result_t pcifront_common_process(int cmd,
 	int bus = pdev->sh_info->aer_op.bus;
 	int devfn = pdev->sh_info->aer_op.devfn;
 	int domain = pdev->sh_info->aer_op.domain;
+	pci_ers_result_t result = PCI_ERS_RESULT_NONE;
 	struct pci_dev *pcidev;
 
 	dev_dbg(&pdev->xdev->dev,
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
2.34.1


