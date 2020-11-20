Return-Path: <SRS0=Yd2Y=E2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 413CBC5519F
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2020 10:53:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAF9C20657
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2020 10:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAF9C20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.31941.62748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg42e-0006Lf-UF; Fri, 20 Nov 2020 10:53:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31941.62748; Fri, 20 Nov 2020 10:53:24 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg42e-0006LY-QX; Fri, 20 Nov 2020 10:53:24 +0000
Received: by outflank-mailman (input) for mailman id 31941;
 Fri, 20 Nov 2020 10:53:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ulUS=E2=suse.cz=jack@srs-us1.protection.inumbo.net>)
 id 1kg42c-0006LT-Uy
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 10:53:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 41e52736-4b7b-4545-823a-415df167cc6a;
 Fri, 20 Nov 2020 10:53:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 015E9AED9;
 Fri, 20 Nov 2020 10:53:20 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id AC96F1E130B; Fri, 20 Nov 2020 11:53:19 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ulUS=E2=suse.cz=jack@srs-us1.protection.inumbo.net>)
	id 1kg42c-0006LT-Uy
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 10:53:22 +0000
X-Inumbo-ID: 41e52736-4b7b-4545-823a-415df167cc6a
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 41e52736-4b7b-4545-823a-415df167cc6a;
	Fri, 20 Nov 2020 10:53:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 015E9AED9;
	Fri, 20 Nov 2020 10:53:20 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id AC96F1E130B; Fri, 20 Nov 2020 11:53:19 +0100 (CET)
Date: Fri, 20 Nov 2020 11:53:19 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Jan Kara <jack@suse.cz>, Jens Axboe <axboe@kernel.dk>,
	Tejun Heo <tj@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, Richard Weinberger <richard@nod.at>,
	Jan Kara <jack@suse.com>, linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 15/20] block: merge struct block_device and struct
 hd_struct
Message-ID: <20201120105319.GA15537@quack2.suse.cz>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-16-hch@lst.de>
 <20201119143921.GX1981@quack2.suse.cz>
 <20201120091546.GE21715@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201120091546.GE21715@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri 20-11-20 10:15:46, Christoph Hellwig wrote:
> On Thu, Nov 19, 2020 at 03:39:21PM +0100, Jan Kara wrote:
> > This patch is kind of difficult to review due to the size of mostly
> > mechanical changes mixed with not completely mechanical changes. Can we
> > perhaps split out the mechanical bits? E.g. the rq->part => rq->bdev
> > renaming is mechanical and notable part of the patch. Similarly the
> > part->foo => part->bd_foo bits...
> 
> We'd end with really weird patches that way.  Never mind that I'm not
> even sure how we could mechnically do the renaming.

Well, I believe coccinelle should be able to do the renaming automatically.

> > Also I'm kind of wondering: AFAIU the new lifetime rules, gendisk holds
> > bdev reference and bdev is created on gendisk allocation so bdev lifetime is
> > strictly larger than gendisk lifetime. But what now keeps bdev->bd_disk
> > reference safe in presence device hot unplug? In most cases we are still
> > protected by gendisk reference taken in __blkdev_get() but how about
> > disk->lookup_sem and disk->flags dereferences before we actually grab the
> > reference?
> 
> Good question.  I'll need to think about this a bit more.

My thinking was that you could use

kobject_get_unless_zero(bdev->bd_device->kobj)

and after you hold this reference, you can do everything else safely. In
this case it is really useful that device is embedded in block_dev and
not in gendisk itself...

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

