Return-Path: <SRS0=Vzag=PD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC59C43217
	for <xen-devel@archiver.kernel.org>; Fri, 15 Oct 2021 23:31:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 757C86023E
	for <xen-devel@archiver.kernel.org>; Fri, 15 Oct 2021 23:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 757C86023E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.211132.368273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbWfR-0001ff-Eq; Fri, 15 Oct 2021 23:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211132.368273; Fri, 15 Oct 2021 23:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbWfR-0001fU-Ae; Fri, 15 Oct 2021 23:31:13 +0000
Received: by outflank-mailman (input) for mailman id 211132;
 Fri, 15 Oct 2021 23:31:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZYBM=PD=infradead.org=mcgrof@srs-us1.protection.inumbo.net>)
 id 1mbWfQ-0000i4-3r
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 23:31:12 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e90cedc-e943-40d0-ba37-340a88011eb1;
 Fri, 15 Oct 2021 23:30:57 +0000 (UTC)
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mbWej-0095v1-AI; Fri, 15 Oct 2021 23:30:29 +0000
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
X-Inumbo-ID: 6e90cedc-e943-40d0-ba37-340a88011eb1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=U16tRkYxOu2xTupE2mvnO7g0MO56Pwj7My6exHcD7bk=; b=SMPXMOkYs49b2c68ayB39v03zE
	1JbaklyNPDkaFFKPIXJZSSf9JcNnGytHsTLxnHHQA91QOrgnaKH/dLotpGBtyzbNzYxWMbm6l5XQK
	+VrXpCqV6xYKGZthiSp/C2mY62tj1C8bC4VDaVWWAqDgxXXxLsfk3NO3Y3R/Ly8UnemuQck06fwiw
	k+nhdx+1yKj/AmmFUFCI4buRGvoBC+xntL9ylynuTURoS86DXIkYd1Ev5Vq6pSXk2TDGlcg1vt8CR
	wRa1vy5MYVu0t5ZCYrJOvV4bPw2j3MZaKqQJzqy/uCT64e5hx776C5FvqrkL4WyO4f7ES6KOhW78j
	nMYiK8XA==;
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	agk@redhat.com,
	snitzer@redhat.com,
	colyli@suse.de,
	kent.overstreet@gmail.com,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	roger.pau@citrix.com,
	geert@linux-m68k.org,
	ulf.hansson@linaro.org,
	tj@kernel.org,
	hare@suse.de,
	jdike@addtoit.com,
	richard@nod.at,
	anton.ivanov@cambridgegreys.com,
	johannes.berg@intel.com,
	krisman@collabora.com,
	chris.obbard@collabora.com,
	thehajime@gmail.com,
	zhuyifei1999@gmail.com,
	haris.iqbal@ionos.com,
	jinpu.wang@ionos.com,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org
Cc: linux-scsi@vger.kernel.org,
	dm-devel@redhat.com,
	linux-bcache@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-m68k@lists.linux-m68k.org,
	linux-um@lists.infradead.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH 5/9] xen-blkfront: add error handling support for add_disk()
Date: Fri, 15 Oct 2021 16:30:24 -0700
Message-Id: <20211015233028.2167651-6-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211015233028.2167651-1-mcgrof@kernel.org>
References: <20211015233028.2167651-1-mcgrof@kernel.org>
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

Reviewed-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/block/xen-blkfront.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index df0deb927760..8e3983e456f3 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -2386,7 +2386,13 @@ static void blkfront_connect(struct blkfront_info *info)
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


