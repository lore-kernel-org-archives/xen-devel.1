Return-Path: <SRS0=bueV=K7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A629CC47082
	for <xen-devel@archiver.kernel.org>; Sat,  5 Jun 2021 14:03:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4937361354
	for <xen-devel@archiver.kernel.org>; Sat,  5 Jun 2021 14:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4937361354
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.137227.254275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lpWtE-00078H-Rq; Sat, 05 Jun 2021 14:03:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137227.254275; Sat, 05 Jun 2021 14:03:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lpWtE-00078A-O5; Sat, 05 Jun 2021 14:03:04 +0000
Received: by outflank-mailman (input) for mailman id 137227;
 Sat, 05 Jun 2021 14:03:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6L7A=K7=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1lpWtC-000784-Ql
 for xen-devel@lists.xenproject.org; Sat, 05 Jun 2021 14:03:02 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b401d8e-98e1-48b9-a154-17b52f48b0fe;
 Sat, 05 Jun 2021 14:03:01 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8575C6736F; Sat,  5 Jun 2021 16:02:57 +0200 (CEST)
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
X-Inumbo-ID: 8b401d8e-98e1-48b9-a154-17b52f48b0fe
Date: Sat, 5 Jun 2021 16:02:57 +0200
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, jgross@suse.com,
	Jens Axboe <axboe@kernel.dk>, Justin Sanders <justin@coraid.com>,
	Denis Efremov <efremov@linux.com>,
	Josef Bacik <josef@toxicpanda.com>, Tim Waugh <tim@cyberelk.net>,
	Geoff Levand <geoff@infradead.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Mike Snitzer <snitzer@redhat.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>, dm-devel@redhat.com,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: simplify gendisk and request_queue allocation for blk-mq based
 drivers
Message-ID: <20210605140257.GA13166@lst.de>
References: <20210602065345.355274-1-hch@lst.de> <YLpNqiw0LMkYWUyN@0xbeefdead.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLpNqiw0LMkYWUyN@0xbeefdead.lan>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Jun 04, 2021 at 11:58:34AM -0400, Konrad Rzeszutek Wilk wrote:
> On Wed, Jun 02, 2021 at 09:53:15AM +0300, Christoph Hellwig wrote:
> > Hi all,
> 
> Hi!
> 
> You wouldn't have a nice git repo to pull so one can test it easily?

git://git.infradead.org/users/hch/block.git alloc_disk-part2

