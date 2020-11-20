Return-Path: <SRS0=Yd2Y=E2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C25C56201
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2020 07:25:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 086F52158C
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2020 07:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 086F52158C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.31596.62094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg0n6-0001p2-Ae; Fri, 20 Nov 2020 07:25:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31596.62094; Fri, 20 Nov 2020 07:25:08 +0000
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
	id 1kg0n6-0001ov-7L; Fri, 20 Nov 2020 07:25:08 +0000
Received: by outflank-mailman (input) for mailman id 31596;
 Fri, 20 Nov 2020 07:25:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ruer=E2=suse.de=hare@srs-us1.protection.inumbo.net>)
 id 1kg0n4-0001oo-Ps
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 07:25:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05d94c1f-3a7a-4830-8a10-74c912ce443b;
 Fri, 20 Nov 2020 07:25:05 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0A558AD29;
 Fri, 20 Nov 2020 07:25:05 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Ruer=E2=suse.de=hare@srs-us1.protection.inumbo.net>)
	id 1kg0n4-0001oo-Ps
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 07:25:06 +0000
X-Inumbo-ID: 05d94c1f-3a7a-4830-8a10-74c912ce443b
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 05d94c1f-3a7a-4830-8a10-74c912ce443b;
	Fri, 20 Nov 2020 07:25:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0A558AD29;
	Fri, 20 Nov 2020 07:25:05 +0000 (UTC)
Subject: Re: [PATCH 53/78] blk-cgroup: fix a hd_struct leak in
 blkcg_fill_root_iostats
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
 <20201116145809.410558-54-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <b7e7dd80-b46b-afaf-9117-8dade0e2420e@suse.de>
Date: Fri, 20 Nov 2020 08:25:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116145809.410558-54-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/16/20 3:57 PM, Christoph Hellwig wrote:
> disk_get_part needs to be paired with a disk_put_part.
> 
> Fixes: ef45fe470e1 ("blk-cgroup: show global disk stats in root cgroup io.stat")
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   block/blk-cgroup.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/block/blk-cgroup.c b/block/blk-cgroup.c
> index c68bdf58c9a6e1..54fbe1e80cc41a 100644
> --- a/block/blk-cgroup.c
> +++ b/block/blk-cgroup.c
> @@ -849,6 +849,7 @@ static void blkcg_fill_root_iostats(void)
>   			blkg_iostat_set(&blkg->iostat.cur, &tmp);
>   			u64_stats_update_end(&blkg->iostat.sync);
>   		}
> +		disk_put_part(part);
>   	}
>   }
>   
> 
Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

