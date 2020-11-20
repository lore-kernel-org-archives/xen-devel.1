Return-Path: <SRS0=Yd2Y=E2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A640CC5519F
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2020 08:56:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E39122256
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2020 08:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E39122256
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.31769.62428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg2DZ-0006uF-IU; Fri, 20 Nov 2020 08:56:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31769.62428; Fri, 20 Nov 2020 08:56:33 +0000
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
	id 1kg2DZ-0006u8-FA; Fri, 20 Nov 2020 08:56:33 +0000
Received: by outflank-mailman (input) for mailman id 31769;
 Fri, 20 Nov 2020 08:56:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tRH+=E2=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kg2DX-0006tN-SN
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 08:56:31 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d13ad8e4-9b61-46d7-9130-5e26d69e31fa;
 Fri, 20 Nov 2020 08:56:30 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 134F468B05; Fri, 20 Nov 2020 09:56:27 +0100 (CET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=tRH+=E2=lst.de=hch@srs-us1.protection.inumbo.net>)
	id 1kg2DX-0006tN-SN
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 08:56:31 +0000
X-Inumbo-ID: d13ad8e4-9b61-46d7-9130-5e26d69e31fa
Received: from verein.lst.de (unknown [213.95.11.211])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d13ad8e4-9b61-46d7-9130-5e26d69e31fa;
	Fri, 20 Nov 2020 08:56:30 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 134F468B05; Fri, 20 Nov 2020 09:56:27 +0100 (CET)
Date: Fri, 20 Nov 2020 09:56:26 +0100
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
Subject: Re: [PATCH 11/20] block: reference struct block_device from struct
 hd_struct
Message-ID: <20201120085626.GB21715@lst.de>
References: <20201118084800.2339180-1-hch@lst.de> <20201118084800.2339180-12-hch@lst.de> <20201119094157.GT1981@quack2.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119094157.GT1981@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Nov 19, 2020 at 10:41:57AM +0100, Jan Kara wrote:
> >  	rcu_assign_pointer(ptbl->part[0], &disk->part0);
> > @@ -1772,8 +1626,10 @@ struct gendisk *__alloc_disk_node(int minors, int node_id)
> >  	 * converted to make use of bd_mutex and sequence counters.
> >  	 */
> >  	hd_sects_seq_init(&disk->part0);
> > -	if (hd_ref_init(&disk->part0))
> > -		goto out_free_part0;
> > +	if (hd_ref_init(&disk->part0)) {
> > +		hd_free_part(&disk->part0);
> 
> Aren't you missing kfree(disk) here?

This should actually jump to out_free_bdstats, I've fixed it up.

