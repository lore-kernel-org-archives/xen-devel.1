Return-Path: <SRS0=LZyn=O4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72323C433EF
	for <xen-devel@archiver.kernel.org>; Fri,  8 Oct 2021 07:45:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 385EE60FF2
	for <xen-devel@archiver.kernel.org>; Fri,  8 Oct 2021 07:45:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 385EE60FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.204464.359610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYkZU-00016Q-53; Fri, 08 Oct 2021 07:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204464.359610; Fri, 08 Oct 2021 07:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYkZU-00016J-1i; Fri, 08 Oct 2021 07:45:36 +0000
Received: by outflank-mailman (input) for mailman id 204464;
 Fri, 08 Oct 2021 07:45:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JgHw=O4=huawei.com=yuehaibing@srs-us1.protection.inumbo.net>)
 id 1mYkZS-00015s-5Q
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 07:45:34 +0000
Received: from szxga02-in.huawei.com (unknown [45.249.212.188])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b66476de-280b-11ec-8024-12813bfff9fa;
 Fri, 08 Oct 2021 07:45:32 +0000 (UTC)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HQg8n2vzdz909M;
 Fri,  8 Oct 2021 15:40:41 +0800 (CST)
Received: from dggema769-chm.china.huawei.com (10.1.198.211) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Fri, 8 Oct 2021 15:45:23 +0800
Received: from localhost (10.174.179.215) by dggema769-chm.china.huawei.com
 (10.1.198.211) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.8; Fri, 8 Oct
 2021 15:45:23 +0800
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
X-Inumbo-ID: b66476de-280b-11ec-8024-12813bfff9fa
From: YueHaibing <yuehaibing@huawei.com>
To: <boris.ostrovsky@oracle.com>, <jgross@suse.com>, <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>,
	YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] xen-pciback: Fix return in pm_ctrl_init()
Date: Fri, 8 Oct 2021 15:44:17 +0800
Message-ID: <20211008074417.8260-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggema769-chm.china.huawei.com (10.1.198.211)
X-CFilter-Loop: Reflected

Return NULL instead of passing to ERR_PTR while err is zero,
this fix smatch warnings:
drivers/xen/xen-pciback/conf_space_capability.c:163
 pm_ctrl_init() warn: passing zero to 'ERR_PTR'

Fixes: a92336a1176b ("xen/pciback: Drop two backends, squash and cleanup some code.")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/xen/xen-pciback/conf_space_capability.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/xen-pciback/conf_space_capability.c b/drivers/xen/xen-pciback/conf_space_capability.c
index 22f13abbe913..5e53b4817f16 100644
--- a/drivers/xen/xen-pciback/conf_space_capability.c
+++ b/drivers/xen/xen-pciback/conf_space_capability.c
@@ -160,7 +160,7 @@ static void *pm_ctrl_init(struct pci_dev *dev, int offset)
 	}
 
 out:
-	return ERR_PTR(err);
+	return err ? ERR_PTR(err) : NULL;
 }
 
 static const struct config_field caplist_pm[] = {
-- 
2.17.1


