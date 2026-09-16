Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73BCC982C1
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 17:12:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1423397.1648540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6tBE-0006wY-Dm; Wed, 16 Sep 2026 17:12:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1423397.1648540; Wed, 16 Sep 2026 17:12:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6tBE-0006wR-AT; Wed, 16 Sep 2026 17:12:20 +0000
Received: by outflank-mailman (input) for mailman id 1423397;
 Wed, 16 Sep 2026 17:12:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vulab@iscas.ac.cn>) id 1x6tBC-0006wJ-RZ
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 17:12:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6tBC-00GGGJ-8b
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 19:12:18 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vulab@iscas.ac.cn>)
 id 6aaacdde-bab6-0a2a0a5309dd-0a2a4509af94-22
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 19:12:16 +0200
Received: from [159.226.251.25] (helo=cstnet.cn)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <vulab@iscas.ac.cn>)
 id 6aaacded-be1a-0a2a45090019-9fe2fb1981ba-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 19:12:15 +0200
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
 by APP-05 (Coremail) with SMTP id zQCowAA3oDrpzapqV1xuCA--.22441S2;
 Thu, 17 Sep 2026 01:12:09 +0800 (CST)
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
To: Jiqian.Chen@amd.com
Cc: jgross@suse.com,
	linux-kernel@vger.kernel.org,
	oleksandr_tyshchenko@epam.com,
	ray.huang@amd.com,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] xen-pciback: Fix pcistub_device ref leak in pcistub_get_gsi_from_sbdf()
Date: Wed, 16 Sep 2026 17:11:41 +0000
Message-Id: <20260916171141.2086627-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAA3oDrpzapqV1xuCA--.22441S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKrW8WFWUuF17JF1xKrW7Jwb_yoWkKwcEgr
	WIvr97urs8tFWxtrW7uwn0vrZav3Z0q395XF1xta4rGw4j9r4UXr1rXF98Wr4Igr45JF13
	Xr1DCr93Kr4I9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbxkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8
	JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUb
	o5l5UUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgEMA2qqok9l6QAAsp
X-purgate-ID: tlsNG-bad1c0/1789578736-39AC0034-4730C548/0/0
X-purgate-type: clean
X-purgate-size: 1205

pcistub_get_gsi_from_sbdf() obtains the stub device with
pcistub_device_find(), which returns it with its kref incremented, and
returns psdev->gsi without dropping that reference again.  The caller
cannot release it either, so every lookup leaks one reference to the
stub device.

Release the reference after reading gsi.

Fixes: 2fae6bb7be32 ("xen/privcmd: Add new syscall to get gsi from dev")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/xen/xen-pciback/pci_stub.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback/pci_stub.c
index 79a2b5dfd694..d1a335233aab 100644
--- a/drivers/xen/xen-pciback/pci_stub.c
+++ b/drivers/xen/xen-pciback/pci_stub.c
@@ -234,13 +234,16 @@ static int pcistub_get_gsi_from_sbdf(unsigned int sbdf)
 	int bus = PCI_BUS_NUM(sbdf);
 	int slot = PCI_SLOT(sbdf);
 	int func = PCI_FUNC(sbdf);
+	int gsi;
 
 	psdev = pcistub_device_find(domain, bus, slot, func);
-
 	if (!psdev)
 		return -ENODEV;
 
-	return psdev->gsi;
+	gsi = psdev->gsi;
+	pcistub_device_put(psdev);
+
+	return gsi;
 }
 #endif
 
-- 
2.34.1


