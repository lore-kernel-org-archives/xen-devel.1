Return-Path: <SRS0=TkWG=EY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 290F3C56201
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2020 21:35:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD3DF20715
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2020 21:35:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD3DF20715
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.30266.60176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfV6L-0000Ol-F2; Wed, 18 Nov 2020 21:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30266.60176; Wed, 18 Nov 2020 21:34:53 +0000
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
	id 1kfV6L-0000Ob-AX; Wed, 18 Nov 2020 21:34:53 +0000
Received: by outflank-mailman (input) for mailman id 30266;
 Wed, 18 Nov 2020 21:34:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WhnZ=EY=suse.cz=jack@srs-us1.protection.inumbo.net>)
 id 1kfV6K-0008UU-3v
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 21:34:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2cf0719f-8d9e-4f2d-a34d-98edcec36759;
 Wed, 18 Nov 2020 21:34:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4578DB018;
 Wed, 18 Nov 2020 21:34:24 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 94E761E132C; Wed, 18 Nov 2020 15:42:55 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=WhnZ=EY=suse.cz=jack@srs-us1.protection.inumbo.net>)
	id 1kfV6K-0008UU-3v
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 21:34:52 +0000
X-Inumbo-ID: 2cf0719f-8d9e-4f2d-a34d-98edcec36759
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 2cf0719f-8d9e-4f2d-a34d-98edcec36759;
	Wed, 18 Nov 2020 21:34:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4578DB018;
	Wed, 18 Nov 2020 21:34:24 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 94E761E132C; Wed, 18 Nov 2020 15:42:55 +0100 (CET)
Date: Wed, 18 Nov 2020 15:42:55 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, Richard Weinberger <richard@nod.at>,
	Jan Kara <jack@suse.com>, linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 09/20] init: cleanup match_dev_by_uuid and
 match_dev_by_label
Message-ID: <20201118144255.GN1981@quack2.suse.cz>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-10-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201118084800.2339180-10-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed 18-11-20 09:47:49, Christoph Hellwig wrote:
> Avoid a totally pointless goto label, and use the same style of
> comparism for both helpers.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

OK. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza
> ---
>  init/do_mounts.c | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/init/do_mounts.c b/init/do_mounts.c
> index afa26a4028d25e..5879edf083b318 100644
> --- a/init/do_mounts.c
> +++ b/init/do_mounts.c
> @@ -79,15 +79,10 @@ static int match_dev_by_uuid(struct device *dev, const void *data)
>  	const struct uuidcmp *cmp = data;
>  	struct hd_struct *part = dev_to_part(dev);
>  
> -	if (!part->info)
> -		goto no_match;
> -
> -	if (strncasecmp(cmp->uuid, part->info->uuid, cmp->len))
> -		goto no_match;
> -
> +	if (!part->info ||
> +	    strncasecmp(cmp->uuid, part->info->uuid, cmp->len))
> +		return 0;
>  	return 1;
> -no_match:
> -	return 0;
>  }
>  
>  /**
> @@ -174,10 +169,9 @@ static int match_dev_by_label(struct device *dev, const void *data)
>  	const char *label = data;
>  	struct hd_struct *part = dev_to_part(dev);
>  
> -	if (part->info && !strcmp(label, part->info->volname))
> -		return 1;
> -
> -	return 0;
> +	if (!part->info || strcmp(label, part->info->volname))
> +		return 0;
> +	return 1;
>  }
>  
>  static dev_t devt_from_partlabel(const char *label)
> -- 
> 2.29.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

