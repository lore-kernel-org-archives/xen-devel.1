Return-Path: <SRS0=wK0z=ET=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 857FBC388F9
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2020 05:15:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 023EE2137B
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2020 05:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 023EE2137B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.26027.54349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdRQD-0007Tk-NH; Fri, 13 Nov 2020 05:14:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26027.54349; Fri, 13 Nov 2020 05:14:53 +0000
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
	id 1kdRQD-0007Td-Jz; Fri, 13 Nov 2020 05:14:53 +0000
Received: by outflank-mailman (input) for mailman id 26027;
 Thu, 12 Nov 2020 19:22:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3lRS=ES=suse.cz=pvorel@srs-us1.protection.inumbo.net>)
 id 1kdIAt-0002rd-RB
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 19:22:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab37eda9-1c41-4a50-bf41-c9b76256a01c;
 Thu, 12 Nov 2020 19:22:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9C79EAFF8;
 Thu, 12 Nov 2020 19:22:25 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3lRS=ES=suse.cz=pvorel@srs-us1.protection.inumbo.net>)
	id 1kdIAt-0002rd-RB
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 19:22:27 +0000
X-Inumbo-ID: ab37eda9-1c41-4a50-bf41-c9b76256a01c
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ab37eda9-1c41-4a50-bf41-c9b76256a01c;
	Thu, 12 Nov 2020 19:22:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9C79EAFF8;
	Thu, 12 Nov 2020 19:22:25 +0000 (UTC)
Date: Thu, 12 Nov 2020 20:22:23 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Justin Sanders <justin@coraid.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Roger Pau =?iso-8859-2?Q?Monn=E9?= <roger.pau@citrix.com>,
	Minchan Kim <minchan@kernel.org>, Mike Snitzer <snitzer@redhat.com>,
	Song Liu <song@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com, nbd@other.debian.org,
	ceph-devel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 05/24] block: remove the update_bdev parameter from
 set_capacity_revalidate_and_notify
Message-ID: <20201112192223.GA17194@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20201111082658.3401686-1-hch@lst.de>
 <20201111082658.3401686-6-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111082658.3401686-6-hch@lst.de>

Hi Christoph,

> The update_bdev argument is always set to true, so remove it.  Also
> rename the function to the slighly less verbose set_capacity_and_notify,
> as propagating the disk size to the block device isn't really
> revalidation.

> Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Petr Vorel <pvorel@suse.cz>

Nice cleanup.

Kind regards,
Petr

