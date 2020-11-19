Return-Path: <SRS0=hRpO=EZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82BAEC388F9
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2020 07:53:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 203BE2100A
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2020 07:53:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 203BE2100A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.30391.60354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfek3-0007Qq-2E; Thu, 19 Nov 2020 07:52:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30391.60354; Thu, 19 Nov 2020 07:52:31 +0000
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
	id 1kfek2-0007Qj-VP; Thu, 19 Nov 2020 07:52:30 +0000
Received: by outflank-mailman (input) for mailman id 30391;
 Thu, 19 Nov 2020 07:52:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fcmS=EZ=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kfek2-0007Qe-4a
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 07:52:30 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca5b5c32-c7a6-4a26-bc8a-f11b25facf80;
 Thu, 19 Nov 2020 07:52:28 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E541867373; Thu, 19 Nov 2020 08:52:25 +0100 (CET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=fcmS=EZ=lst.de=hch@srs-us1.protection.inumbo.net>)
	id 1kfek2-0007Qe-4a
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 07:52:30 +0000
X-Inumbo-ID: ca5b5c32-c7a6-4a26-bc8a-f11b25facf80
Received: from verein.lst.de (unknown [213.95.11.211])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ca5b5c32-c7a6-4a26-bc8a-f11b25facf80;
	Thu, 19 Nov 2020 07:52:28 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id E541867373; Thu, 19 Nov 2020 08:52:25 +0100 (CET)
Date: Thu, 19 Nov 2020 08:52:25 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Tejun Heo <tj@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, Richard Weinberger <richard@nod.at>,
	Jan Kara <jack@suse.com>, linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 07/20] init: refactor name_to_dev_t
Message-ID: <20201119075225.GA15815@lst.de>
References: <20201118084800.2339180-1-hch@lst.de> <20201118084800.2339180-8-hch@lst.de> <20201118143747.GL1981@quack2.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201118143747.GL1981@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Nov 18, 2020 at 03:37:47PM +0100, Jan Kara wrote:
> > -static inline dev_t blk_lookup_devt(const char *name, int partno)
> > -{
> > -	dev_t devt = MKDEV(0, 0);
> > -	return devt;
> > -}
> >  #endif /* CONFIG_BLOCK */
> 
> This hunk looks unrelated to the change? Also why you move the declaration
> outside the CONFIG_BLOCK ifdef? AFAICS blk_lookup_devt() still exists only
> when CONFIG_BLOCK is defined? Otherwise the patch looks good to me.

blk_lookup_devt is a hack only for name_to_dev_t only referenced from
code under CONFIG_BLOCK now, as it didn't do anything before when
blk_lookup_devt returned 0.  I guess I'll need to update the commit log
a little to mention this.

