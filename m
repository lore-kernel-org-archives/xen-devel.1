Return-Path: <SRS0=OK+i=G7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE7DC433DB
	for <xen-devel@archiver.kernel.org>; Thu, 28 Jan 2021 07:13:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C02061492
	for <xen-devel@archiver.kernel.org>; Thu, 28 Jan 2021 07:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C02061492
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.76594.138263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51U8-000410-QG; Thu, 28 Jan 2021 07:12:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76594.138263; Thu, 28 Jan 2021 07:12:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51U8-00040s-My; Thu, 28 Jan 2021 07:12:56 +0000
Received: by outflank-mailman (input) for mailman id 76594;
 Thu, 28 Jan 2021 07:12:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YU/W=G7=wdc.com=prvs=655a99766=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1l51U7-0003zD-KJ
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 07:12:55 +0000
Received: from esa1.hgst.iphmx.com (unknown [68.232.141.245])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ff1ad29-a7ab-4c39-8880-191d8951c6ec;
 Thu, 28 Jan 2021 07:12:54 +0000 (UTC)
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:12:53 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 22:57:13 -0800
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:12:53 -0800
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
X-Inumbo-ID: 9ff1ad29-a7ab-4c39-8880-191d8951c6ec
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611817974; x=1643353974;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ebUREFacDD1ljG2MqWB5dUmMjUM91D8UhGi2M79Y0SA=;
  b=K8jv0v10vzDROlHMAnGu7Z1hdg89hf1NvfWpHccppyK2Qqq3I5FXJ1Zy
   gb+n9+RaltggaA3QpwfbXvNXVuR1GUTcq1r3FjYZdyayvPZVcvsBNkuYJ
   1tHEb4maZhlXtjuPbzNXlJX/f8LHgQLAzc+tw+oHVlHmxnjF+DgsNyO/8
   I9u5VSzQ9n0F4RLx3m6GATkO8D+Gn2JVOYPScXahFRsJXCXc9yYEJCfqd
   Onrnc5Us9clHEj3SglR5XpUbMz89HKdmJAD5eZ2hDhO9gbsiQVBg5Q9+i
   Xylgo0lOMOOmg4aohszg0cbaoWepQJRFdFuLAUd0BS/21772QKRyQYLtH
   A==;
IronPort-SDR: E1fkX9mALQSpSQRqYGIloGS2cfDW2oPRzPHVlF7jQ7qBQOXa/TDr/IH3wmc6ReYeQENynSr/DV
 KuvglDqJ2MVpPpj9UNQIh+je/PRWnsuo5rqsq3o3L/GEhxLEarbcYUt7tRCKHmUn/h6vhFeem9
 NjVp0pWhNUGvTE0tRSyregZcLO3cMwYt57yD85l4Pqsmh95fxxmB96eqXE4DJhvJZUeEwsMhJQ
 65dhOKyqY5H0Swh7RCXOQX0JJOgGUVJ/IPEBQVCoPLpkYNS2PXlWifiT0lwfGI3aPvd+/ej2N9
 rLM=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="268892411"
IronPort-SDR: JfaHSbgsTX4tBshRNu85zNjDX4JfSgpAalYsa9ganL72RXI+lwj1CvALk7jNkTKHODDRhaPULM
 2QCxQBHaDQLKLzzTTJx6sZDUI4QL2z7sj7oWlFeKpkDsPjNz6ohW6OPAT+Fj31fP0Wco69Q5Wb
 9KQAR7f3aFnCh6IFqA/U90eJ4ctmO1CHn2o9RL+SRg+TzT0pUU076X0anJZOd6l64DJj/v5S2x
 FcDy3SpjPUZr3Me2WQqUpbt8A2reaS4klVrZtLnI9YgzishgdQzwaHzWX3zoeLKZHP4K7W5aZI
 /mFTgzYM+x5E5leio1xLhyRQ
IronPort-SDR: PY5y9iQTPaVno0Uv+vDzXalBIBo52CYeNhdpn1c7TxoOle28qWYUG06GBXepBaS7SSBSs9yjco
 7juMCiLNAFC5Fl7+86T3v8dT5wViZ/r3nWsFgtnjfanPUZXEs47a6Ez/SVmFCas+uBcEU4K0rz
 829GMnmof7Vria8o+CPxuoND3CfaQPgb+QYuf0lvO7BAPoDvQAY10VoO7lep1Qta/l6nA5+vbg
 ht+uppfjRckOmE5ekZUsc4vMGzhgqqwVxG/dC7eG99G+et4hw+q4h30FxFyz73HjopgItSw/2N
 PHA=
WDCIronportException: Internal
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org,
	linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org,
	jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org,
	ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org,
	linux-mm@kvack.org
Cc: axboe@kernel.dk,
	philipp.reisner@linbit.com,
	lars.ellenberg@linbit.com,
	konrad.wilk@oracle.com,
	roger.pau@citrix.com,
	minchan@kernel.org,
	ngupta@vflare.org,
	sergey.senozhatsky.work@gmail.com,
	agk@redhat.com,
	snitzer@redhat.com,
	hch@lst.de,
	sagi@grimberg.me,
	chaitanya.kulkarni@wdc.com,
	martin.petersen@oracle.com,
	viro@zeniv.linux.org.uk,
	tytso@mit.edu,
	jaegeuk@kernel.org,
	ebiggers@kernel.org,
	djwong@kernel.org,
	shaggy@kernel.org,
	konishi.ryusuke@gmail.com,
	mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com,
	damien.lemoal@wdc.com,
	naohiro.aota@wdc.com,
	jth@kernel.org,
	rjw@rjwysocki.net,
	len.brown@intel.com,
	pavel@ucw.cz,
	akpm@linux-foundation.org,
	hare@suse.de,
	gustavoars@kernel.org,
	tiwai@suse.de,
	alex.shi@linux.alibaba.com,
	asml.silence@gmail.com,
	ming.lei@redhat.com,
	tj@kernel.org,
	osandov@fb.com,
	bvanassche@acm.org,
	jefflexu@linux.alibaba.com
Subject: [RFC PATCH 08/34] dm-zoned: use bio_new in get_mblock_slow
Date: Wed, 27 Jan 2021 23:11:07 -0800
Message-Id: <20210128071133.60335-9-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 drivers/md/dm-zoned-metadata.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 039d17b28938..e6252f48a49c 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -550,7 +550,8 @@ static struct dmz_mblock *dmz_get_mblock_slow(struct dmz_metadata *zmd,
 	if (!mblk)
 		return ERR_PTR(-ENOMEM);
 
-	bio = bio_alloc(GFP_NOIO, 1);
+	bio = bio_new(dev->bdev, dmz_blk2sect(block), REQ_OP_READ,
+		      REQ_META | REQ_PRIO, 1, GFP_NOIO);
 	if (!bio) {
 		dmz_free_mblock(zmd, mblk);
 		return ERR_PTR(-ENOMEM);
@@ -577,11 +578,8 @@ static struct dmz_mblock *dmz_get_mblock_slow(struct dmz_metadata *zmd,
 	spin_unlock(&zmd->mblk_lock);
 
 	/* Submit read BIO */
-	bio->bi_iter.bi_sector = dmz_blk2sect(block);
-	bio_set_dev(bio, dev->bdev);
 	bio->bi_private = mblk;
 	bio->bi_end_io = dmz_mblock_bio_end_io;
-	bio_set_op_attrs(bio, REQ_OP_READ, REQ_META | REQ_PRIO);
 	bio_add_page(bio, mblk->page, DMZ_BLOCK_SIZE, 0);
 	submit_bio(bio);
 
-- 
2.22.1


