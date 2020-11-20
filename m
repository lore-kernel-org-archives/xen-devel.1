Return-Path: <SRS0=Yd2Y=E2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90057C5519F
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2020 15:33:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FA4922D0A
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2020 15:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FA4922D0A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.32387.63397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg8PE-0001JZ-0f; Fri, 20 Nov 2020 15:33:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32387.63397; Fri, 20 Nov 2020 15:32:59 +0000
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
	id 1kg8PD-0001JS-Tr; Fri, 20 Nov 2020 15:32:59 +0000
Received: by outflank-mailman (input) for mailman id 32387;
 Fri, 20 Nov 2020 15:32:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tRH+=E2=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kg8PD-0001JN-0K
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 15:32:59 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 209cd0d0-1788-45b3-a500-a7bd4ee488a5;
 Fri, 20 Nov 2020 15:32:56 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id ED47B67373; Fri, 20 Nov 2020 16:32:53 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=tRH+=E2=lst.de=hch@srs-us1.protection.inumbo.net>)
	id 1kg8PD-0001JN-0K
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 15:32:59 +0000
X-Inumbo-ID: 209cd0d0-1788-45b3-a500-a7bd4ee488a5
Received: from verein.lst.de (unknown [213.95.11.211])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 209cd0d0-1788-45b3-a500-a7bd4ee488a5;
	Fri, 20 Nov 2020 15:32:56 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id ED47B67373; Fri, 20 Nov 2020 16:32:53 +0100 (CET)
Date: Fri, 20 Nov 2020 16:32:53 +0100
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
Subject: Re: [PATCH 14/20] block: remove the nr_sects field in struct
 hd_struct
Message-ID: <20201120153253.GA18990@lst.de>
References: <20201118084800.2339180-1-hch@lst.de> <20201118084800.2339180-15-hch@lst.de> <20201119120525.GW1981@quack2.suse.cz> <20201120090820.GD21715@lst.de> <20201120112121.GB15537@quack2.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201120112121.GB15537@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Nov 20, 2020 at 12:21:21PM +0100, Jan Kara wrote:
> > > AFAICT bd_size_lock is pointless after these changes so we can just remove
> > > it?
> > 
> > I don't think it is, as reuqiring bd_mutex for size updates leads to
> > rather awkward lock ordering problems.
> 
> OK, let me ask differently: What is bd_size_lock protecting now? Ah, I see,
> on 32-bit it is needed to prevent torn writes to i_size, right?

Exactly.  In theory we could skip it for 64-bit, but as updating the
size isn't a fast path, and struct block_device isn't super size critical
I'd rather keep the same code for 32 vs 64-bit builds.

