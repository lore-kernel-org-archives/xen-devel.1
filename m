Return-Path: <SRS0=IFNi=NS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2069BC4320E
	for <xen-devel@archiver.kernel.org>; Fri, 27 Aug 2021 20:12:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC6C860F92
	for <xen-devel@archiver.kernel.org>; Fri, 27 Aug 2021 20:12:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC6C860F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.173939.317333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJiDB-0007we-JC; Fri, 27 Aug 2021 20:12:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173939.317333; Fri, 27 Aug 2021 20:12:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJiDB-0007wU-BB; Fri, 27 Aug 2021 20:12:25 +0000
Received: by outflank-mailman (input) for mailman id 173939;
 Fri, 27 Aug 2021 19:18:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8NxO=NS=infradead.org=mcgrof@srs-us1.protection.inumbo.net>)
 id 1mJhMz-0001H3-Ai
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 19:18:29 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2aa9978-f404-4658-9129-de5088371fed;
 Fri, 27 Aug 2021 19:18:23 +0000 (UTC)
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mJhMg-00D5Ao-Ti; Fri, 27 Aug 2021 19:18:10 +0000
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
X-Inumbo-ID: a2aa9978-f404-4658-9129-de5088371fed
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=+haEytmu63y3zWbWZRI3xhnFTvWyZ+JIjCoqN6FFLWY=; b=K2x3pPY1MjMXFVBKWItW/EUmz3
	oXTuPhFDfnmLiBjDzjBod7BEzvqr8kGcf5ytJZUzzsGuIUfqyRpJhcX80zL0lRzDZAS9amWITcPsM
	XVvA+RKxBCvgNSjP0X1szvA7ZlpF/3YjoBZ33+dmPNEx+hJ1CCVAsBc4AYNyAlx/cVlQ6F2TbPjmu
	7C6yudMpOkpOSu4bkqcbhoJA70i0CfddYCZwj22VzG6stQYi8XFhm14+Dp+G+0cLOSi3k21VwV2Xi
	ADNTqx7RTt769nCMLIQRhz78hIfqIY3Fg7E30rRJeeLZOxfb1Xp0sNZYlrB6721r6oUAljCk750jK
	ihFnTrMQ==;
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
Subject: [PATCH 00/10] block: first batch of add_disk() error handling conversions
Date: Fri, 27 Aug 2021 12:17:59 -0700
Message-Id: <20210827191809.3118103-1-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Luis Chamberlain <mcgrof@infradead.org>

This is my second batch of driver conversions to use add_disk() error
handling. Please review and let me know if you spot any issues. This is
part of a larger effort to covert all drivers over to use the new
add_disk() error handling. The entire work can be found on my branch
dedicated for this work [0]

[0] https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/log/?h=20210827-for-axboe-add-disk-error-handling-next-2nd

Luis Chamberlain (10):
  block/brd: add error handling support for add_disk()
  bcache: add error handling support for add_disk()
  nvme-multipath: add error handling support for add_disk()
  nvdimm/btt: do not call del_gendisk() if not needed
  nvdimm/btt: use goto error labels on btt_blk_init()
  nvdimm/btt: add error handling support for add_disk()
  nvdimm/blk: avoid calling del_gendisk() on early failures
  nvdimm/blk: add error handling support for add_disk()
  xen-blkfront: add error handling support for add_disk()
  zram: add error handling support for add_disk()

 drivers/block/brd.c           | 10 ++++++++--
 drivers/block/xen-blkfront.c  |  8 +++++++-
 drivers/block/zram/zram_drv.c |  6 +++++-
 drivers/md/bcache/super.c     | 17 ++++++++++++-----
 drivers/nvdimm/blk.c          | 21 +++++++++++++++------
 drivers/nvdimm/btt.c          | 24 +++++++++++++++---------
 drivers/nvme/host/multipath.c | 10 +++++++---
 7 files changed, 69 insertions(+), 27 deletions(-)

-- 
2.30.2


