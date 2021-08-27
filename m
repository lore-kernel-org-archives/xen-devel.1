Return-Path: <SRS0=IFNi=NS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC6B1C25AEB
	for <xen-devel@archiver.kernel.org>; Fri, 27 Aug 2021 20:12:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFD4360F92
	for <xen-devel@archiver.kernel.org>; Fri, 27 Aug 2021 20:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AFD4360F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.173949.317368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJiDD-0000DL-Gb; Fri, 27 Aug 2021 20:12:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173949.317368; Fri, 27 Aug 2021 20:12:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJiDD-0000AE-9A; Fri, 27 Aug 2021 20:12:27 +0000
Received: by outflank-mailman (input) for mailman id 173949;
 Fri, 27 Aug 2021 19:18:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8NxO=NS=infradead.org=mcgrof@srs-us1.protection.inumbo.net>)
 id 1mJhNO-0001H3-BB
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 19:18:54 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db4f7f30-1be1-407b-9704-aa92b7b28dd8;
 Fri, 27 Aug 2021 19:18:23 +0000 (UTC)
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mJhMh-00D5B6-CX; Fri, 27 Aug 2021 19:18:11 +0000
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
X-Inumbo-ID: db4f7f30-1be1-407b-9704-aa92b7b28dd8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=hsYRy5mW2eSZFEqOw8JTWcpX/S1jq2Dljgzx3k3VBB0=; b=ag2MWG9JRPRl7v1Wm4knifBuDH
	x/k7sA6IMtBfImriQpfdYn9OfQrmhh704BYOZ1efraWf6MvZLkuIu8ui3RaFGt2h0JGEnJbE/mzGG
	UMpYztDhF4uGbNZV/BKzqSXSAymUMxJHuUsN0AeDORBz3rq0NtTKCdwuHZFTV3ylWbjUQPELSZJnJ
	Uv8SvIfFCz+zqm8iSInPS4MX23d9OwRSOPydfEoraAzMapqy1iXSYJRU/ysyMRbUQvaeuY0q2kbAF
	WsvxN6a8SYo3ajPRyxlChb/HXfw9y48GMnLlBgH5jr3PXLLMmtQlkt0jpuLPPGCKR46h3vY8cdWgw
	KUC5BgwQ==;
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
Subject: [PATCH 07/10] nvdimm/blk: avoid calling del_gendisk() on early failures
Date: Fri, 27 Aug 2021 12:18:06 -0700
Message-Id: <20210827191809.3118103-8-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210827191809.3118103-1-mcgrof@kernel.org>
References: <20210827191809.3118103-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Luis Chamberlain <mcgrof@infradead.org>

If nd_integrity_init() fails we'd get del_gendisk() called,
but that's not correct as we should only call that if we're
done with device_add_disk(). Fix this by providing unwinding
prior to the devm call being registered and moving the devm
registration to the very end.

This should fix calling del_gendisk() if nd_integrity_init()
fails. I only spotted this issue through code inspection. It
does not fix any real world bug.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/nvdimm/blk.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/nvdimm/blk.c b/drivers/nvdimm/blk.c
index 088d3dd6f6fa..591fa1f86f1e 100644
--- a/drivers/nvdimm/blk.c
+++ b/drivers/nvdimm/blk.c
@@ -240,6 +240,7 @@ static int nsblk_attach_disk(struct nd_namespace_blk *nsblk)
 	resource_size_t available_disk_size;
 	struct gendisk *disk;
 	u64 internal_nlba;
+	int rc;
 
 	internal_nlba = div_u64(nsblk->size, nsblk_internal_lbasize(nsblk));
 	available_disk_size = internal_nlba * nsblk_sector_size(nsblk);
@@ -256,20 +257,26 @@ static int nsblk_attach_disk(struct nd_namespace_blk *nsblk)
 	blk_queue_logical_block_size(disk->queue, nsblk_sector_size(nsblk));
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, disk->queue);
 
-	if (devm_add_action_or_reset(dev, nd_blk_release_disk, disk))
-		return -ENOMEM;
-
 	if (nsblk_meta_size(nsblk)) {
-		int rc = nd_integrity_init(disk, nsblk_meta_size(nsblk));
+		rc = nd_integrity_init(disk, nsblk_meta_size(nsblk));
 
 		if (rc)
-			return rc;
+			goto out_before_devm_err;
 	}
 
 	set_capacity(disk, available_disk_size >> SECTOR_SHIFT);
 	device_add_disk(dev, disk, NULL);
+
+	/* nd_blk_release_disk() is called if this fails */
+	if (devm_add_action_or_reset(dev, nd_blk_release_disk, disk))
+		return -ENOMEM;
+
 	nvdimm_check_and_set_ro(disk);
 	return 0;
+
+out_before_devm_err:
+	blk_cleanup_disk(disk);
+	return rc;
 }
 
 static int nd_blk_probe(struct device *dev)
-- 
2.30.2


