Return-Path: <SRS0=fYmn=E6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 854ABC2D0E4
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2020 21:19:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C140206E0
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2020 21:19:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzhyL5qO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C140206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.36970.69078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khfiW-0006tN-Kv; Tue, 24 Nov 2020 21:19:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36970.69078; Tue, 24 Nov 2020 21:19:16 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khfiW-0006tG-Hj; Tue, 24 Nov 2020 21:19:16 +0000
Received: by outflank-mailman (input) for mailman id 36970;
 Tue, 24 Nov 2020 21:19:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
 id 1khfiV-0006t9-AO
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 21:19:15 +0000
Received: from mail-qv1-xf42.google.com (unknown [2607:f8b0:4864:20::f42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b058068b-e21d-43cd-aca2-3677d21dc479;
 Tue, 24 Nov 2020 21:19:14 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id k3so4513359qvz.4
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 13:19:14 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id c27sm387614qkk.57.2020.11.24.13.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 13:19:12 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YSly=E6=gmail.com=htejun@srs-us1.protection.inumbo.net>)
	id 1khfiV-0006t9-AO
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 21:19:15 +0000
X-Inumbo-ID: b058068b-e21d-43cd-aca2-3677d21dc479
Received: from mail-qv1-xf42.google.com (unknown [2607:f8b0:4864:20::f42])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b058068b-e21d-43cd-aca2-3677d21dc479;
	Tue, 24 Nov 2020 21:19:14 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id k3so4513359qvz.4
        for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 13:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sg9SO3UStMfqHkCvNI1YBGGkjTmKJ7UaheqYby9uxnM=;
        b=OzhyL5qOUmNMCmaqmA0AJ7YTZnOa5s8lOvdGSd5gsRFwIjVjcK9RMkEdmOZVvPKHkC
         HEfwzTPFGhRpcwv4Zdi1eKZAQCSJDqL9242nm6t+004qxnjr2Wo1RG+dvaQzjYpDTlFJ
         y4MEeMckfEdVhdL9TeWxoL3uJseLhfNpPNLJKI+4lWddjQrQSYtmPS6DbLtZKSCyuI0M
         VPOnBALIPZDz9HaljCXz/QtzQMoFkORQ/oSOcQG0yJ5cuTGS83XWqbo7FaIck74bBkz3
         zSrrMusanZp5T2dH6BfcuYD799YU+BVDp+VbnKu/pAzjL4fvbG44Apq0OxYfntbUtAy3
         IgsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=sg9SO3UStMfqHkCvNI1YBGGkjTmKJ7UaheqYby9uxnM=;
        b=nu/2QHGJS/cDrwGJQ/Asj8nz7NayM81EDS7p1P6xtuM+6bjbkBOGSywiIPGibOjqJ9
         ECw34RnSPPHWaSx637L8jyR2yO/Z3sgrszv572wxjpb85mtnLcWNOBKtQIHIniRToevd
         gt5OhdvHh9qtUTCDwEGsKz5Vur7QjWJObVEuyTO/dxZS9T2/X2xMZXNF79aGcLsf3q1s
         cs9/IWTUdQzGRgJpbjkDQAXTyMKkvCsm1uYl/fO1w8+wtxHPOM6n/rPfb0VnJ9h3Ma0E
         9BjT/sG5Htybq3qWHTptnp+Ho3Jf/+G/UYPA3XNsPaec9Qo3U2DTLmaaHPI3WqHWGPN+
         tnKQ==
X-Gm-Message-State: AOAM533nXi2oRgi5LcuSNaeap2NPikifyACAPpgcNo89h7KsAE6eu2ea
	xvPJZGnckrMyJ3/iHWxigz0=
X-Google-Smtp-Source: ABdhPJymsM7t3QC8HGlAx0p+5Wt4X/uLuUZsX3zmVjKyK1/8swtwKOE7/+uzSFJWv6qwdRjGjoCR5w==
X-Received: by 2002:a0c:fa08:: with SMTP id q8mr548456qvn.25.1606252753574;
        Tue, 24 Nov 2020 13:19:13 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
        by smtp.gmail.com with ESMTPSA id c27sm387614qkk.57.2020.11.24.13.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 13:19:12 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Tue, 24 Nov 2020 16:18:49 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.cz>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	dm-devel@redhat.com, Richard Weinberger <richard@nod.at>,
	Jan Kara <jack@suse.com>, linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 25/45] block: reference struct block_device from struct
 hd_struct
Message-ID: <X714udEyPuGarVYp@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-26-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-26-hch@lst.de>

Hello,

Please see lkml.kernel.org/r/X708BTJ5njtbC2z1@mtj.duckdns.org for a few nits
on the previous version.

On Tue, Nov 24, 2020 at 02:27:31PM +0100, Christoph Hellwig wrote:
> To simplify block device lookup and a few other upcoming areas, make sure
> that we always have a struct block_device available for each disk and
> each partition.  The only downside of this is that each device and
> partition uses a little more memory.  The upside will be that a lot of
> code can be simplified.
> 
> With that all we need to look up the block device is to lookup the inode
> and do a few sanity checks on the gendisk, instead of the separate lookup
> for the gendisk.  These checks are in a new RCU critical section and
> the disk is now freed using kfree_rcu().

I might be confused but am wondering whether RCU is needed. It's currently
used to ensure that gendisk is accessible in the blkdev_get path but
wouldn't it be possible to simply pin gendisk from block_devices? The
gendisk and hd_structs hold the base refs of the block_devices and in turn
the block_devices pin the gendisk. When the gendisk gets deleted, it puts
the base refs of the block devices but stays around while the block devices
are being accessed.

Also, would it make sense to separate out lookup_sem removal? I *think* it's
there to ensure that the same bdev doesn't get associated with old and new
gendisks at the same time but can't wrap my head around how it works
exactly. I can see that this may not be needed once the lifetimes of gendisk
and block_devices are tied together but that may warrant a bit more
explanation.

Thanks.

-- 
tejun

