Return-Path: <SRS0=kjYx=FA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58634C64E7C
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2020 10:00:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C69B2221E2
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2020 10:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C69B2221E2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.38392.71104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiE49-00039W-Ot; Thu, 26 Nov 2020 09:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38392.71104; Thu, 26 Nov 2020 09:59:53 +0000
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
	id 1kiE49-00039P-Lj; Thu, 26 Nov 2020 09:59:53 +0000
Received: by outflank-mailman (input) for mailman id 38392;
 Thu, 26 Nov 2020 09:59:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uoLz=FA=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kiE48-00039K-TW
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 09:59:52 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d16e5cb3-e941-4945-9622-1a1d50805e99;
 Thu, 26 Nov 2020 09:59:51 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9883168B02; Thu, 26 Nov 2020 10:59:48 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=uoLz=FA=lst.de=hch@srs-us1.protection.inumbo.net>)
	id 1kiE48-00039K-TW
	for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 09:59:52 +0000
X-Inumbo-ID: d16e5cb3-e941-4945-9622-1a1d50805e99
Received: from verein.lst.de (unknown [213.95.11.211])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d16e5cb3-e941-4945-9622-1a1d50805e99;
	Thu, 26 Nov 2020 09:59:51 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 9883168B02; Thu, 26 Nov 2020 10:59:48 +0100 (CET)
Date: Thu, 26 Nov 2020 10:59:48 +0100
From: Christoph Hellwig <hch@lst.de>
To: Minchan Kim <minchan@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Justin Sanders <justin@coraid.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Mike Snitzer <snitzer@redhat.com>, Song Liu <song@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com, nbd@other.debian.org,
	ceph-devel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: Re: [PATCH 60/78] zram: remove the claim mechanism
Message-ID: <20201126095948.GA24035@lst.de>
References: <20201116145809.410558-1-hch@lst.de> <20201116145809.410558-61-hch@lst.de> <20201126011107.GA57352@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201126011107.GA57352@google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Nov 25, 2020 at 05:11:07PM -0800, Minchan Kim wrote:
> With this patch, how deal with the race?
> 
> CPU 1                                     CPU 2
> 
> hot_remove_store
>   zram_remove
>     zram_busy
>       return -EBUSY
>                                          open /dev/zram0
>     del_gendisk
>     zram_reset and destroy

Yeah, it looks like zram does not really handle hot unplugging unlike
other drivers.  So I've dropped this one for now.

