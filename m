Return-Path: <SRS0=KeRi=OR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A70DFC433EF
	for <xen-devel@archiver.kernel.org>; Mon, 27 Sep 2021 22:01:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79B4761058
	for <xen-devel@archiver.kernel.org>; Mon, 27 Sep 2021 22:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79B4761058
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.197205.350230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUygc-00030T-LP; Mon, 27 Sep 2021 22:01:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197205.350230; Mon, 27 Sep 2021 22:01:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUygc-00030F-HM; Mon, 27 Sep 2021 22:01:22 +0000
Received: by outflank-mailman (input) for mailman id 197205;
 Mon, 27 Sep 2021 22:01:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0LRd=OR=infradead.org=mcgrof@srs-us1.protection.inumbo.net>)
 id 1mUygb-0000mS-En
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 22:01:21 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 946b4533-7b5a-43da-948d-9031806784ea;
 Mon, 27 Sep 2021 22:00:49 +0000 (UTC)
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mUyfw-004SvT-Oa; Mon, 27 Sep 2021 22:00:40 +0000
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
X-Inumbo-ID: 946b4533-7b5a-43da-948d-9031806784ea
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=n0t709e+/n6TLkwKfO+OryH6p8FtdPpV7nSeauOqbbE=; b=TLHZvka2DfAcoJlgj2gIUo2wwQ
	kBYYzdPNPYZC/AnRdkDO1kXKwqIG4rX1TuRVaeYtm8g8FZZLnXZznHA97zWn40Cv+a49q1z7q0fZa
	slzU1wKKIiAjk3kitEZmW44QvUwxkBOqzr/j2l5uAv8zMAnIa38hcxTP2ODG/t5RHM9iNanZDHu/7
	ZE0n1Z2FLyslzo/QQ7+mSDhGkk2EDFgc4z39HCJ9EZKnv11bxOqtIBEY2UOuJM8Cw3/2GicMyHVGG
	QLkdR4EXXZuimuvP3kbLVXuTIVA1Zlt1Xfds0uWdLzXPM0UJNwE3jIdqAPP3/+yI4lDSsg6Ur4uif
	adlVMKew==;
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk,
	colyli@suse.de,
	kent.overstreet@gmail.com,
	kbusch@kernel.org,
	sagi@grimberg.me,
	vishal.l.verma@intel.com,
	dan.j.williams@intel.com,
	dave.jiang@intel.com,
	ira.weiny@intel.com,
	konrad.wilk@oracle.com,
	roger.pau@citrix.com,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	minchan@kernel.org,
	ngupta@vflare.org,
	senozhatsky@chromium.org
Cc: xen-devel@lists.xenproject.org,
	nvdimm@lists.linux.dev,
	linux-nvme@lists.infradead.org,
	linux-bcache@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH v2 09/10] xen-blkfront: add error handling support for add_disk()
Date: Mon, 27 Sep 2021 15:00:38 -0700
Message-Id: <20210927220039.1064193-10-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927220039.1064193-1-mcgrof@kernel.org>
References: <20210927220039.1064193-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Luis Chamberlain <mcgrof@infradead.org>

We never checked for errors on device_add_disk() as this function
returned void. Now that this is fixed, use the shiny new error
handling. The function xlvbd_alloc_gendisk() typically does the
unwinding on error on allocating the disk and creating the tag,
but since all that error handling was stuffed inside
xlvbd_alloc_gendisk() we must repeat the tag free'ing as well.

We set the info->rq to NULL to ensure blkif_free() doesn't crash
on blk_mq_stop_hw_queues() on device_add_disk() error as the queue
will be long gone by then.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/block/xen-blkfront.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 72902104f111..86440b051766 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -2385,7 +2385,13 @@ static void blkfront_connect(struct blkfront_info *info)
 	for_each_rinfo(info, rinfo, i)
 		kick_pending_request_queues(rinfo);
 
-	device_add_disk(&info->xbdev->dev, info->gd, NULL);
+	err = device_add_disk(&info->xbdev->dev, info->gd, NULL);
+	if (err) {
+		blk_cleanup_disk(info->gd);
+		blk_mq_free_tag_set(&info->tag_set);
+		info->rq = NULL;
+		goto fail;
+	}
 
 	info->is_ready = 1;
 	return;
-- 
2.30.2


