Return-Path: <SRS0=hRpO=EZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A13C2D0E4
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2020 08:25:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7F73246B0
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2020 08:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7F73246B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.30407.60379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kffFg-0002aT-4G; Thu, 19 Nov 2020 08:25:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30407.60379; Thu, 19 Nov 2020 08:25:12 +0000
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
	id 1kffFg-0002aM-1J; Thu, 19 Nov 2020 08:25:12 +0000
Received: by outflank-mailman (input) for mailman id 30407;
 Thu, 19 Nov 2020 08:25:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kVKL=EZ=suse.cz=jack@srs-us1.protection.inumbo.net>)
 id 1kffFe-0002aH-5W
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 08:25:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8f1dfd8-6ae2-4d3d-a096-a325b05b9686;
 Thu, 19 Nov 2020 08:25:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1FC9DAD2F;
 Thu, 19 Nov 2020 08:25:06 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id C74001E1303; Thu, 19 Nov 2020 09:25:05 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=kVKL=EZ=suse.cz=jack@srs-us1.protection.inumbo.net>)
	id 1kffFe-0002aH-5W
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 08:25:10 +0000
X-Inumbo-ID: f8f1dfd8-6ae2-4d3d-a096-a325b05b9686
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f8f1dfd8-6ae2-4d3d-a096-a325b05b9686;
	Thu, 19 Nov 2020 08:25:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1FC9DAD2F;
	Thu, 19 Nov 2020 08:25:06 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id C74001E1303; Thu, 19 Nov 2020 09:25:05 +0100 (CET)
Date: Thu, 19 Nov 2020 09:25:05 +0100
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
Subject: Re: [PATCH 07/20] init: refactor name_to_dev_t
Message-ID: <20201119082505.GS1981@quack2.suse.cz>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-8-hch@lst.de>
 <20201118143747.GL1981@quack2.suse.cz>
 <20201119075225.GA15815@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119075225.GA15815@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu 19-11-20 08:52:25, Christoph Hellwig wrote:
> On Wed, Nov 18, 2020 at 03:37:47PM +0100, Jan Kara wrote:
> > > -static inline dev_t blk_lookup_devt(const char *name, int partno)
> > > -{
> > > -	dev_t devt = MKDEV(0, 0);
> > > -	return devt;
> > > -}
> > >  #endif /* CONFIG_BLOCK */
> > 
> > This hunk looks unrelated to the change? Also why you move the declaration
> > outside the CONFIG_BLOCK ifdef? AFAICS blk_lookup_devt() still exists only
> > when CONFIG_BLOCK is defined? Otherwise the patch looks good to me.
> 
> blk_lookup_devt is a hack only for name_to_dev_t only referenced from
> code under CONFIG_BLOCK now, as it didn't do anything before when
> blk_lookup_devt returned 0.  I guess I'll need to update the commit log
> a little to mention this.

OK, understood. Still it would seem more logical to leave blk_lookup_devt()
declaration inside #ifdef CONFIG_BLOCK and just delete the !CONFIG_BLOCK
definition (to make it clear we ever expect only users compiled when
CONFIG_BLOCK is defined). But whatever... Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

