Return-Path: <SRS0=Yd2Y=E2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3DFCC56201
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2020 07:26:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90252223AC
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2020 07:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90252223AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.31607.62117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg0oM-00023i-4N; Fri, 20 Nov 2020 07:26:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31607.62117; Fri, 20 Nov 2020 07:26:26 +0000
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
	id 1kg0oM-00023b-1J; Fri, 20 Nov 2020 07:26:26 +0000
Received: by outflank-mailman (input) for mailman id 31607;
 Fri, 20 Nov 2020 07:26:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ruer=E2=suse.de=hare@srs-us1.protection.inumbo.net>)
 id 1kg0oK-00023V-Sp
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 07:26:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bda6b7c4-a2dd-42e1-95fd-4bd05bba2548;
 Fri, 20 Nov 2020 07:26:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2A51FAB3D;
 Fri, 20 Nov 2020 07:26:23 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Ruer=E2=suse.de=hare@srs-us1.protection.inumbo.net>)
	id 1kg0oK-00023V-Sp
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 07:26:24 +0000
X-Inumbo-ID: bda6b7c4-a2dd-42e1-95fd-4bd05bba2548
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id bda6b7c4-a2dd-42e1-95fd-4bd05bba2548;
	Fri, 20 Nov 2020 07:26:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2A51FAB3D;
	Fri, 20 Nov 2020 07:26:23 +0000 (UTC)
Subject: Re: [PATCH 55/78] block: change the hash used for looking up block
 devices
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Justin Sanders <justin@coraid.com>, Josef Bacik <josef@toxicpanda.com>,
 Ilya Dryomov <idryomov@gmail.com>, Jack Wang <jinpu.wang@cloud.ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Minchan Kim <minchan@kernel.org>, Mike Snitzer <snitzer@redhat.com>,
 Song Liu <song@kernel.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, dm-devel@redhat.com,
 linux-block@vger.kernel.org, drbd-dev@lists.linbit.com,
 nbd@other.debian.org, ceph-devel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-raid@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
References: <20201116145809.410558-1-hch@lst.de>
 <20201116145809.410558-56-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <75f4c397-ac03-2c5f-d620-0e619ad78fe8@suse.de>
Date: Fri, 20 Nov 2020 08:26:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116145809.410558-56-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/16/20 3:57 PM, Christoph Hellwig wrote:
> Adding the minor to the major creates tons of pointless conflicts. Just
> use the dev_t itself, which is 32-bits and thus is guaranteed to fit
> into ino_t.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   fs/block_dev.c | 26 ++------------------------
>   1 file changed, 2 insertions(+), 24 deletions(-)
> 
> diff --git a/fs/block_dev.c b/fs/block_dev.c
> index d8664f5c1ff669..29db12c3bb501c 100644
> --- a/fs/block_dev.c
> +++ b/fs/block_dev.c
> @@ -870,35 +870,12 @@ void __init bdev_cache_init(void)
>   	blockdev_superblock = bd_mnt->mnt_sb;   /* For writeback */
>   }
>   
> -/*
> - * Most likely _very_ bad one - but then it's hardly critical for small
> - * /dev and can be fixed when somebody will need really large one.
> - * Keep in mind that it will be fed through icache hash function too.
> - */
> -static inline unsigned long hash(dev_t dev)
> -{
> -	return MAJOR(dev)+MINOR(dev);
> -}
> -
> -static int bdev_test(struct inode *inode, void *data)
> -{
> -	return BDEV_I(inode)->bdev.bd_dev == *(dev_t *)data;
> -}
> -
> -static int bdev_set(struct inode *inode, void *data)
> -{
> -	BDEV_I(inode)->bdev.bd_dev = *(dev_t *)data;
> -	return 0;
> -}
> -
>   static struct block_device *bdget(dev_t dev)
>   {
>   	struct block_device *bdev;
>   	struct inode *inode;
>   
> -	inode = iget5_locked(blockdev_superblock, hash(dev),
> -			bdev_test, bdev_set, &dev);
> -
> +	inode = iget_locked(blockdev_superblock, dev);
>   	if (!inode)
>   		return NULL;
>   
> @@ -910,6 +887,7 @@ static struct block_device *bdget(dev_t dev)
>   		bdev->bd_super = NULL;
>   		bdev->bd_inode = inode;
>   		bdev->bd_part_count = 0;
> +		bdev->bd_dev = dev;
>   		inode->i_mode = S_IFBLK;
>   		inode->i_rdev = dev;
>   		inode->i_bdev = bdev;
> 
Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

