Return-Path: <SRS0=CtBx=E7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72483C5519F
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2020 12:31:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1906206E5
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2020 12:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1906206E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.37734.70203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khtxP-0001gi-N3; Wed, 25 Nov 2020 12:31:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37734.70203; Wed, 25 Nov 2020 12:31:35 +0000
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
	id 1khtxP-0001gb-K7; Wed, 25 Nov 2020 12:31:35 +0000
Received: by outflank-mailman (input) for mailman id 37734;
 Wed, 25 Nov 2020 12:31:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sFqU=E7=suse.cz=jack@srs-us1.protection.inumbo.net>)
 id 1khtxP-0001gW-38
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 12:31:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c63aedca-6747-43bb-b526-183eb1a25ba6;
 Wed, 25 Nov 2020 12:31:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6A34EAF0E;
 Wed, 25 Nov 2020 12:31:33 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 3DD711E130F; Wed, 25 Nov 2020 13:31:33 +0100 (CET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sFqU=E7=suse.cz=jack@srs-us1.protection.inumbo.net>)
	id 1khtxP-0001gW-38
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 12:31:35 +0000
X-Inumbo-ID: c63aedca-6747-43bb-b526-183eb1a25ba6
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c63aedca-6747-43bb-b526-183eb1a25ba6;
	Wed, 25 Nov 2020 12:31:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6A34EAF0E;
	Wed, 25 Nov 2020 12:31:33 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 3DD711E130F; Wed, 25 Nov 2020 13:31:33 +0100 (CET)
Date: Wed, 25 Nov 2020 13:31:33 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>,
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
Subject: Re: [PATCH 05/45] mtip32xx: remove the call to fsync_bdev on removal
Message-ID: <20201125123133.GI16944@quack2.suse.cz>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-6-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-6-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue 24-11-20 14:27:11, Christoph Hellwig wrote:
> del_gendisk already calls fsync_bdev for every partition, no need
> to do this twice.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Makes sense to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  drivers/block/mtip32xx/mtip32xx.c | 15 ---------------
>  drivers/block/mtip32xx/mtip32xx.h |  2 --
>  2 files changed, 17 deletions(-)
> 
> diff --git a/drivers/block/mtip32xx/mtip32xx.c b/drivers/block/mtip32xx/mtip32xx.c
> index 153e2cdecb4d40..53ac59d19ae530 100644
> --- a/drivers/block/mtip32xx/mtip32xx.c
> +++ b/drivers/block/mtip32xx/mtip32xx.c
> @@ -3687,7 +3687,6 @@ static int mtip_block_initialize(struct driver_data *dd)
>  	/* Enable the block device and add it to /dev */
>  	device_add_disk(&dd->pdev->dev, dd->disk, NULL);
>  
> -	dd->bdev = bdget_disk(dd->disk, 0);
>  	/*
>  	 * Now that the disk is active, initialize any sysfs attributes
>  	 * managed by the protocol layer.
> @@ -3721,9 +3720,6 @@ static int mtip_block_initialize(struct driver_data *dd)
>  	return rv;
>  
>  kthread_run_error:
> -	bdput(dd->bdev);
> -	dd->bdev = NULL;
> -
>  	/* Delete our gendisk. This also removes the device from /dev */
>  	del_gendisk(dd->disk);
>  
> @@ -3804,14 +3800,6 @@ static int mtip_block_remove(struct driver_data *dd)
>  	blk_mq_tagset_busy_iter(&dd->tags, mtip_no_dev_cleanup, dd);
>  	blk_mq_unquiesce_queue(dd->queue);
>  
> -	/*
> -	 * Delete our gendisk structure. This also removes the device
> -	 * from /dev
> -	 */
> -	if (dd->bdev) {
> -		bdput(dd->bdev);
> -		dd->bdev = NULL;
> -	}
>  	if (dd->disk) {
>  		if (test_bit(MTIP_DDF_INIT_DONE_BIT, &dd->dd_flag))
>  			del_gendisk(dd->disk);
> @@ -4206,9 +4194,6 @@ static void mtip_pci_remove(struct pci_dev *pdev)
>  	} while (atomic_read(&dd->irq_workers_active) != 0 &&
>  		time_before(jiffies, to));
>  
> -	if (!dd->sr)
> -		fsync_bdev(dd->bdev);
> -
>  	if (atomic_read(&dd->irq_workers_active) != 0) {
>  		dev_warn(&dd->pdev->dev,
>  			"Completion workers still active!\n");
> diff --git a/drivers/block/mtip32xx/mtip32xx.h b/drivers/block/mtip32xx/mtip32xx.h
> index e22a7f0523bf30..88f4206310e4c8 100644
> --- a/drivers/block/mtip32xx/mtip32xx.h
> +++ b/drivers/block/mtip32xx/mtip32xx.h
> @@ -463,8 +463,6 @@ struct driver_data {
>  
>  	int isr_binding;
>  
> -	struct block_device *bdev;
> -
>  	struct list_head online_list; /* linkage for online list */
>  
>  	struct list_head remove_list; /* linkage for removing list */
> -- 
> 2.29.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

