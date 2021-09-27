Return-Path: <SRS0=KeRi=OR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E10C4332F
	for <xen-devel@archiver.kernel.org>; Mon, 27 Sep 2021 22:01:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC1D860EE9
	for <xen-devel@archiver.kernel.org>; Mon, 27 Sep 2021 22:01:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC1D860EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.197199.350186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUygJ-0001Lf-DY; Mon, 27 Sep 2021 22:01:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197199.350186; Mon, 27 Sep 2021 22:01:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUygJ-0001LY-9y; Mon, 27 Sep 2021 22:01:03 +0000
Received: by outflank-mailman (input) for mailman id 197199;
 Mon, 27 Sep 2021 22:01:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0LRd=OR=infradead.org=mcgrof@srs-us1.protection.inumbo.net>)
 id 1mUygH-0000mS-EQ
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 22:01:01 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d3805c9-e55a-48d0-a539-d4a837333b2a;
 Mon, 27 Sep 2021 22:00:49 +0000 (UTC)
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mUyfw-004SvO-N8; Mon, 27 Sep 2021 22:00:40 +0000
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
X-Inumbo-ID: 5d3805c9-e55a-48d0-a539-d4a837333b2a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=vLYLL0oFZhxGylgSJPWXsGjPK2psQoUWyxkb9au47Xw=; b=vFdtNbirDyd+cqwuiMxjiJzgLG
	Jt0ChJnf2JuPRFu4a+wlNaF4kthrKz7PxnttkR0Ds40s2EhZvp4JmkbSX6L3ADzaVDhCnLDp3cCs/
	l0Ao4N5wA1GF1nIHrrOdTV9k0vDEX8dt7ZIGbkn5jeXk4By4iFu7i+TmcRDENgYIuV6M0/X0COZJ8
	PTZwba2aQr3+WagO31hkbEZG4Js9Hr92YGi4M//TLw0Zk2t95HtZSK54Goe3CUTOj1kxdO0jr9W83
	2Y8mWhaksDHH+sEiqrhCSZnBTG/J8tSzqfz5X0PYVM21EAFDp2zVD0/Chb9dwkwaSbB31hydbvvRb
	1P5EOUhg==;
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
Subject: [PATCH v2 08/10] nvdimm/blk: add error handling support for add_disk()
Date: Mon, 27 Sep 2021 15:00:37 -0700
Message-Id: <20210927220039.1064193-9-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927220039.1064193-1-mcgrof@kernel.org>
References: <20210927220039.1064193-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Luis Chamberlain <mcgrof@infradead.org>

We never checked for errors on add_disk() as this function
returned void. Now that this is fixed, use the shiny new
error handling.

Since nvdimm/blk uses devm we just need to move the devm
registration towards the end. And in hindsight, that seems
to also provide a fix given del_gendisk() should not be
called unless the disk was already added via add_disk().
The probably of that issue happening is low though, like
OOM while calling devm_add_action(), so the fix is minor.

We manually unwind in case of add_disk() failure prior
to the devm registration.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/nvdimm/blk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/nvdimm/blk.c b/drivers/nvdimm/blk.c
index 591fa1f86f1e..9f1eb41404ac 100644
--- a/drivers/nvdimm/blk.c
+++ b/drivers/nvdimm/blk.c
@@ -265,7 +265,9 @@ static int nsblk_attach_disk(struct nd_namespace_blk *nsblk)
 	}
 
 	set_capacity(disk, available_disk_size >> SECTOR_SHIFT);
-	device_add_disk(dev, disk, NULL);
+	rc = device_add_disk(dev, disk, NULL);
+	if (rc)
+		goto out_before_devm_err;
 
 	/* nd_blk_release_disk() is called if this fails */
 	if (devm_add_action_or_reset(dev, nd_blk_release_disk, disk))
-- 
2.30.2


