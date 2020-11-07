Return-Path: <SRS0=ycEq=EN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADC12C2D0A3
	for <xen-devel@archiver.kernel.org>; Sat,  7 Nov 2020 00:33:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A67F20728
	for <xen-devel@archiver.kernel.org>; Sat,  7 Nov 2020 00:33:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="O7dyOXal"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A67F20728
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.21196.47473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kbC9Y-0003AC-HJ; Sat, 07 Nov 2020 00:32:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 21196.47473; Sat, 07 Nov 2020 00:32:24 +0000
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
	id 1kbC9Y-0003A5-EH; Sat, 07 Nov 2020 00:32:24 +0000
Received: by outflank-mailman (input) for mailman id 21196;
 Sat, 07 Nov 2020 00:32:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eQUk=EN=kernel.org=song@srs-us1.protection.inumbo.net>)
 id 1kbC9W-00039y-P8
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2020 00:32:22 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7bc9f7f5-1e96-4fd1-a3ec-6a14ab5f913c;
 Sat, 07 Nov 2020 00:32:21 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7101222202
 for <xen-devel@lists.xenproject.org>; Sat,  7 Nov 2020 00:32:20 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id s30so4378456lfc.4
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2020 16:32:20 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=eQUk=EN=kernel.org=song@srs-us1.protection.inumbo.net>)
	id 1kbC9W-00039y-P8
	for xen-devel@lists.xenproject.org; Sat, 07 Nov 2020 00:32:22 +0000
X-Inumbo-ID: 7bc9f7f5-1e96-4fd1-a3ec-6a14ab5f913c
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7bc9f7f5-1e96-4fd1-a3ec-6a14ab5f913c;
	Sat, 07 Nov 2020 00:32:21 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 7101222202
	for <xen-devel@lists.xenproject.org>; Sat,  7 Nov 2020 00:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604709140;
	bh=KcpIPe+A58yFNxxgdAdaS3ugXYdHOBtuseeQrVYguHI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=O7dyOXal7YL7+3TQPR507WAWXuCRa9VXvh3tl/XZ3Wmey5p91Ew7PyDj8k/tZUsUX
	 XY5D3+3MbK8y+gvrbaa+8QamA+h71zwFvUqQhxnEoaqEjETZ+k6/bM4uDXaudNmc1c
	 Llst5cl3Ll69uQ67EfsvLxy48UchXaU9XWGm+pGE=
Received: by mail-lf1-f50.google.com with SMTP id s30so4378456lfc.4
        for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2020 16:32:20 -0800 (PST)
X-Gm-Message-State: AOAM532YESMNR/zFnEKDhMHvZVwr2yUGSGtuyVQ48LgxmWZ7HdhmH7IQ
	rT6c505zhJZBPIA9fqNwhX8c8XRSrkXnM/APe4A=
X-Google-Smtp-Source: ABdhPJzPKJgvb0YpcBOATticPbEhSqNhkf0gjO34lXWldMg14DmOELWQsnbdEhjrrSsS6KPE2QcSxjJkDLUT8kUmj4w=
X-Received: by 2002:a19:ae13:: with SMTP id f19mr1682538lfc.193.1604709138508;
 Fri, 06 Nov 2020 16:32:18 -0800 (PST)
MIME-Version: 1.0
References: <20201106190337.1973127-1-hch@lst.de> <20201106190337.1973127-22-hch@lst.de>
In-Reply-To: <20201106190337.1973127-22-hch@lst.de>
From: Song Liu <song@kernel.org>
Date: Fri, 6 Nov 2020 16:32:07 -0800
X-Gmail-Original-Message-ID: <CAPhsuW6GuXe_2YKnP5wRHg7ytOxjUzTQZ=fG2RKxs6woNVPFaQ@mail.gmail.com>
Message-ID: <CAPhsuW6GuXe_2YKnP5wRHg7ytOxjUzTQZ=fG2RKxs6woNVPFaQ@mail.gmail.com>
Subject: Re: [PATCH 21/24] md: use set_capacity_and_notify
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Justin Sanders <justin@coraid.com>, 
	Josef Bacik <josef@toxicpanda.com>, Ilya Dryomov <idryomov@gmail.com>, 
	Jack Wang <jinpu.wang@cloud.ionos.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Minchan Kim <minchan@kernel.org>, Mike Snitzer <snitzer@redhat.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, dm-devel@redhat.com, 
	linux-block@vger.kernel.org, drbd-dev@lists.linbit.com, nbd@other.debian.org, 
	ceph-devel@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-raid <linux-raid@vger.kernel.org>, linux-nvme@lists.infradead.org, 
	linux-scsi@vger.kernel.org, Linux-Fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 6, 2020 at 11:04 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Use set_capacity_and_notify to set the size of both the disk and block
> device.  This also gets the uevent notifications for the resize for free.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Song Liu <song@kernel.org>

