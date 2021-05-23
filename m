Return-Path: <SRS0=rGpA=KS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C92C4707A
	for <xen-devel@archiver.kernel.org>; Sun, 23 May 2021 07:03:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9425D61205
	for <xen-devel@archiver.kernel.org>; Sun, 23 May 2021 07:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9425D61205
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.131547.245811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lki8E-000079-CR; Sun, 23 May 2021 07:02:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131547.245811; Sun, 23 May 2021 07:02:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lki8E-00006z-92; Sun, 23 May 2021 07:02:38 +0000
Received: by outflank-mailman (input) for mailman id 131547;
 Sun, 23 May 2021 07:02:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VPDj=KS=huawei.com=yuehaibing@srs-us1.protection.inumbo.net>)
 id 1lki8C-00006q-KZ
 for xen-devel@lists.xenproject.org; Sun, 23 May 2021 07:02:36 +0000
Received: from szxga06-in.huawei.com (unknown [45.249.212.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d04ccc05-d41e-4eaf-9ec5-2584cfdbb027;
 Sun, 23 May 2021 07:02:31 +0000 (UTC)
Received: from dggems706-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Fnrnh22sgzmYZJ;
 Sun, 23 May 2021 15:00:08 +0800 (CST)
Received: from dggema769-chm.china.huawei.com (10.1.198.211) by
 dggems706-chm.china.huawei.com (10.3.19.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Sun, 23 May 2021 15:02:26 +0800
Received: from localhost (10.174.179.215) by dggema769-chm.china.huawei.com
 (10.1.198.211) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Sun, 23
 May 2021 15:02:26 +0800
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
X-Inumbo-ID: d04ccc05-d41e-4eaf-9ec5-2584cfdbb027
From: YueHaibing <yuehaibing@huawei.com>
To: <boris.ostrovsky@oracle.com>, <jgross@suse.com>, <sstabellini@kernel.org>,
	<yuehaibing@huawei.com>
CC: <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] xen/pcpu: Use DEVICE_ATTR_RW macro
Date: Sun, 23 May 2021 15:02:14 +0800
Message-ID: <20210523070214.34948-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggema769-chm.china.huawei.com (10.1.198.211)
X-CFilter-Loop: Reflected

Use DEVICE_ATTR_RW helper instead of plain DEVICE_ATTR,
which makes the code a bit shorter and easier to read.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/xen/pcpu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/xen/pcpu.c b/drivers/xen/pcpu.c
index 1bcdd5227771..47aa3a1ccaf5 100644
--- a/drivers/xen/pcpu.c
+++ b/drivers/xen/pcpu.c
@@ -92,7 +92,7 @@ static int xen_pcpu_up(uint32_t cpu_id)
 	return HYPERVISOR_platform_op(&op);
 }
 
-static ssize_t show_online(struct device *dev,
+static ssize_t online_show(struct device *dev,
 			   struct device_attribute *attr,
 			   char *buf)
 {
@@ -101,7 +101,7 @@ static ssize_t show_online(struct device *dev,
 	return sprintf(buf, "%u\n", !!(cpu->flags & XEN_PCPU_FLAGS_ONLINE));
 }
 
-static ssize_t __ref store_online(struct device *dev,
+static ssize_t __ref online_store(struct device *dev,
 				  struct device_attribute *attr,
 				  const char *buf, size_t count)
 {
@@ -130,7 +130,7 @@ static ssize_t __ref store_online(struct device *dev,
 		ret = count;
 	return ret;
 }
-static DEVICE_ATTR(online, S_IRUGO | S_IWUSR, show_online, store_online);
+static DEVICE_ATTR_RW(online);
 
 static struct attribute *pcpu_dev_attrs[] = {
 	&dev_attr_online.attr,
-- 
2.17.1


