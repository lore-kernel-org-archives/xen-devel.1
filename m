Return-Path: <SRS0=Pc9a=EP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF48C2D0A3
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2020 06:59:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73A2D20665
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2020 06:59:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b="OlOP6e+h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73A2D20665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cloud.ionos.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.22019.48369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc196-0002bI-V1; Mon, 09 Nov 2020 06:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22019.48369; Mon, 09 Nov 2020 06:59:20 +0000
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
	id 1kc196-0002bB-Qf; Mon, 09 Nov 2020 06:59:20 +0000
Received: by outflank-mailman (input) for mailman id 22019;
 Mon, 09 Nov 2020 06:56:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWh8=EP=cloud.ionos.com=jinpu.wang@srs-us1.protection.inumbo.net>)
 id 1kc16c-0002WW-4H
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 06:56:46 +0000
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f99bf70e-5509-4ffa-8364-ec172001a3fd;
 Mon, 09 Nov 2020 06:56:44 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id ay21so7542903edb.2
 for <xen-devel@lists.xenproject.org>; Sun, 08 Nov 2020 22:56:44 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=fWh8=EP=cloud.ionos.com=jinpu.wang@srs-us1.protection.inumbo.net>)
	id 1kc16c-0002WW-4H
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 06:56:46 +0000
X-Inumbo-ID: f99bf70e-5509-4ffa-8364-ec172001a3fd
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f99bf70e-5509-4ffa-8364-ec172001a3fd;
	Mon, 09 Nov 2020 06:56:44 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id ay21so7542903edb.2
        for <xen-devel@lists.xenproject.org>; Sun, 08 Nov 2020 22:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lhEWojdnEETMpoDmZaKWZITR453k36pmv/sfAr6vN/Q=;
        b=OlOP6e+hTTnzcMIwdaF/T/hnfIBf/9oJMDqvqjYzplHIQ4xMgH25+911Ixq0B3+K58
         5Dj/JmHZRD8Yi8zqOu+1rKF07XS2mrjA0Wv9PMukIV3uX40Qn/weu/uMdAMCHG7RU935
         A8pgkbko6hNqb1nFuLU3A3PiBPYVj8XjATb55mVvvHvMOvvFHanlnCDmyhaMxkXN6DKS
         Bf5AgcB50gTwwmoZvVJaG5dtCbnwCB8M7N5x+uhcjSrbjJF9nKnn2cuHHSz7I/a4akR/
         xE89AMdrexbc31NBbIF2vvHpBBUezGpS6XdWxnMo7c/NgKk9nHTIb/0D5wlGo0gz8gEr
         D1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lhEWojdnEETMpoDmZaKWZITR453k36pmv/sfAr6vN/Q=;
        b=M4qveyHfqVMjA0F01UJZsEwehImPK4b0g4sjZHPWzegdvew8Y75cWiaueJQzGv5zIn
         CrNZ8NBPc5152frpu6uUQ/AqcojYxIogEisrBrRQKBlS3Ey/lV8FudzLyuQQ1ueh5qSm
         uYBOOOq2Seag2dnw7urHCl7GzyrstISRmKCJ+hAqcOZxHaBfC4yUQmVgd3RhGC6VeY5P
         H8L02sFe8FmV+7dkv0jerHTNJoJo/fU5ZzRq+lTvhAKpKIJTj9APGvtUpr+GHT4KFC1r
         INiiNN9uC76T+dCaU3ObIkfRj2dFFVXaNkkP9SguTqqgBOh378AU32L50gPipqgxI0Na
         ASGg==
X-Gm-Message-State: AOAM533+WinJaJt0xUl6f97WZzfeGwCzEV/Alv4VPLVYTm8tFLc3MS9U
	vPE0QTpm/kWmwcQY5yMv8fi6TGwj7FOxnjtBX2w8OQ==
X-Google-Smtp-Source: ABdhPJy5lMTAmAT8/Ewb7MyKs6V0kAUlIo1q9lM6dl2oB700nsAVEi6e4At1FesCFzDNwPnUu593st+zxY/BthW2KiM=
X-Received: by 2002:a50:fc89:: with SMTP id f9mr14573990edq.89.1604905003672;
 Sun, 08 Nov 2020 22:56:43 -0800 (PST)
MIME-Version: 1.0
References: <20201106190337.1973127-1-hch@lst.de> <20201106190337.1973127-19-hch@lst.de>
In-Reply-To: <20201106190337.1973127-19-hch@lst.de>
From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Mon, 9 Nov 2020 07:56:32 +0100
Message-ID: <CAMGffEnRgesKniK_X5b2nAoiQ_i6xqL4gnCw7dJxapkD-6Dvwg@mail.gmail.com>
Subject: Re: [PATCH 18/24] rnbd: use set_capacity_and_notify
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Justin Sanders <justin@coraid.com>, 
	Josef Bacik <josef@toxicpanda.com>, Ilya Dryomov <idryomov@gmail.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Minchan Kim <minchan@kernel.org>, Mike Snitzer <snitzer@redhat.com>, Song Liu <song@kernel.org>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, 
	device-mapper development <dm-devel@redhat.com>, linux-block@vger.kernel.org, 
	drbd-dev@lists.linbit.com, nbd@other.debian.org, ceph-devel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-raid <linux-raid@vger.kernel.org>, 
	linux-nvme@lists.infradead.org, 
	Linux SCSI Mailinglist <linux-scsi@vger.kernel.org>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 6, 2020 at 8:04 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Use set_capacity_and_notify to set the size of both the disk and block
> device.  This also gets the uevent notifications for the resize for free.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
Thanks, Christoph!
Acked-by: Jack Wang <jinpu.wang@cloud.ionos.com>
> ---
>  drivers/block/rnbd/rnbd-clt.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/block/rnbd/rnbd-clt.c b/drivers/block/rnbd/rnbd-clt.c
> index 8b2411ccbda97c..bb13d7dd195a08 100644
> --- a/drivers/block/rnbd/rnbd-clt.c
> +++ b/drivers/block/rnbd/rnbd-clt.c
> @@ -100,8 +100,7 @@ static int rnbd_clt_change_capacity(struct rnbd_clt_dev *dev,
>         rnbd_clt_info(dev, "Device size changed from %zu to %zu sectors\n",
>                        dev->nsectors, new_nsectors);
>         dev->nsectors = new_nsectors;
> -       set_capacity(dev->gd, dev->nsectors);
> -       revalidate_disk_size(dev->gd, true);
> +       set_capacity_and_notify(dev->gd, dev->nsectors);
>         return 0;
>  }
>
> --
> 2.28.0
>

