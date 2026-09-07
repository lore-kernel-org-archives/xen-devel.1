Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77F8C79F89
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 09:27:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410729.1641523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3Vch-0003cj-B8; Mon, 07 Sep 2026 09:26:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410729.1641523; Mon, 07 Sep 2026 09:26:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3Vch-0003cc-7u; Mon, 07 Sep 2026 09:26:43 +0000
Received: by outflank-mailman (input) for mailman id 1410729;
 Mon, 07 Sep 2026 09:22:04 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frediano.ziglio@gmail.com>) id 1x3VYB-0003Ep-Us
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 09:22:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3VYB-006FcV-4k
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 11:22:03 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frediano.ziglio@gmail.com>)
 id 6a9e822b-bab6-0a2a0a5309dd-0a2a4504d7b0-42
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 11:22:03 +0200
Received: from [209.85.128.173] (helo=mail-yw1-f173.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frediano.ziglio@gmail.com>)
 id 6a9e8239-b57f-0a2a45040019-d15580ada41a-3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 11:22:02 +0200
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-855de2d0d4dso35064747b3.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 02:22:02 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1788772921; cv=none;
        d=google.com; s=arc-20260327;
        b=HcUnBuFAXPepcnQEsV/FnnAv0QxZ6t1SFrR49kVDNxlWUtNkOLbrBMkHDPRZAK4nA1
         6Q/tTYqQkyR2lWpEEySGODE6H4nEePHgtRBLulkDvzDN8nhUGVVerNHRmZiJTLCXrq3S
         zhjSpG80y6PK2cXu5KsU6Tky5BfQJ6J8UupJzyEFd5UVwUXjLnMXGVkMejzU4iFvqGuL
         eV5LKhu3CrfAsN3SjMiK+4DSITOl/x9AQ06fwps54eyk/IhMfuGAICNz5U8SyN1ugvSX
         Wffqh3EboBbBLXdstTexFg/rSiQX+REYLqVEfDrDg3Oi97i5ghrM8qI448EmrxXuO6bL
         ZTHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J0t5MHJvx2iLkVwFpdNQYQKKsnnTlLCT8TZwcuf3lTs=;
        fh=MLKe2YFdBtG+CQJioQQ4py81TRbJLTewHNkwBRtiK1s=;
        b=mDUgMp4rKjGvgMjtOs1x0ElP93RQhvRr3eG0q3KUa7JTmcpvbH10+RULUkS9Wr+mGv
         wLkVAU+iR6C58C461Zn8kZu7BmNqM/fq3fxtp2xvNTX+N6TxkBtGfJZqpLMoUdtwsGkS
         dTgmCzn9uf/yZJOWpfowuGT/FnrXYa2ZYoHaxc3AKQlgxUJ+IBGagadIzCV6Sb4Zm2vW
         ypE+qYz+a4BFNEhgUvaRQJqdRpvBHoqBOW4wHaVP+9vckPMCn7zTfl5/YF7rNW5lsk7B
         Eu/mi49H0kHn4C5v5ow8sts3iXEg2o8+DxkzgsGR6KAwSzyvvJ0N4TqJwAqKSFZmFqVJ
         xSow==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788772921; x=1789377721; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J0t5MHJvx2iLkVwFpdNQYQKKsnnTlLCT8TZwcuf3lTs=;
        b=exUg6jkWeEPZGiRJxZmNI2KOT10c+EfhkbPhdvhVNV/QgI5o4x6eV4u+z/EpIJ1zE7
         OhfUzFrys5q4d6jac/gx64sdKmQwgWuG98yxjBE4xxMWcijJCXh56+PrcQXO+ZupoEmG
         LE8iOkUpno9+fWoX8bccf8crtvxaTIOU0A8hmpoLp+Vno14wmn2r/6+UwWS9CpE6WJVU
         3vr0YVv8rrK9DhlpfIPi2dSm7ouha616L1TkUQNQVNn2Z5mEoipDRbp1J/phTrdWrUAQ
         kIev/P8oF2eviesmb7mMPltEOysYwtleJ5zGxkoQbOFl+WIMOdUYDOcXhdc8Z/vdR5od
         C/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788772921; x=1789377721;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J0t5MHJvx2iLkVwFpdNQYQKKsnnTlLCT8TZwcuf3lTs=;
        b=NOl/R6MEz28Bojrcb6WGKvBnEYgTkcj+gA9UQmI8qi+LoQkA5ZcS5nAONfgL17ZBx0
         CmuLIXAksURrYFy+ebzuD+Q3bPXJh7L/hMaOEx5wgLLi72fNjylr+c10+w09NLpmoTLj
         DXmiwcYrRJHgukmG64WL2hAgoS0DOJiHq8AUIldG0uuvcpXr/DN3AIbH3NU8HkokwiTd
         vGxwKRKKaUj/LeMfNMzRO4gftouNtpYw+ICHzBL3fQnd9LObM+cJ9S8sD9c7d3XEb/HC
         IqFnWP1csnv0P5rHlDKNNYP5pomPXkFF/2eRxBTExakMRy03e1y/NpDCorvinCSSxbc8
         8Uwg==
X-Forwarded-Encrypted: i=1; AKwUvBxg/AxaLHg58ndoCq/+7Zjj2kM470fojRmFvtFBxOu9kw0ZRuRmiRgBb7e3vkICmVb/WdSC7HJN9Bk=@lists.xenproject.org
X-Gm-Message-State: AFuF++nVg/ED45A4Sc7aRcnuLoiOhYA5qanrQ24FPyvEeQZjm2x62/Vn
	UwgOtW1MSMts6zoxPSR29xmPgdJu3KDBdvamAXcX3cecMOqKgLLg/lEBM3oYK1yJKMRiZNTtrLu
	u9l2y7CN6ccdgXDE9eN1y1qQt9Eotyg0=
X-Gm-Gg: AYBFou2qabCxx/dvrXgXcySBKsajvGkLhNXmPdcHE28d1mgX4rlfX8widCLAUgYW0nd
	6TvVO3cNM+jbU2dBtd+SyVyEal/5hiUBd8p12FvCTbNitmQLHoo/Cfptm5l/iSdIMEcMQ3+1ggb
	8Bx4DXUDNXev/lcKbPapVjIahDzml3embbWdA1szprkOmZlWW8Hp4E5kDCKxYHkuEaBSwwGgVka
	1fz2EHD/xMb7W0qrLPX0R4WrKmoHVmUMOs/P0O52udxYNLqR3eQUlBUUfFvRhbjGSvgrEuk7q/u
	PgxzGj7gVCvquQw2oAcFSs9tiw6i9rVbAH3OEJeMu5pE63W7rRiKQ0CWOqKXiJUIp7mEr87DKYA
	O
X-Received: by 2002:a05:690c:a84:b0:7f0:38f7:6ca6 with SMTP id
 00721157ae682-86e6d7905ccmr100098477b3.5.1788772921510; Mon, 07 Sep 2026
 02:22:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260907063531.23981-1-hemanth.selam@gmail.com>
In-Reply-To: <20260907063531.23981-1-hemanth.selam@gmail.com>
From: Frediano Ziglio <frediano.ziglio@gmail.com>
Date: Mon, 7 Sep 2026 10:21:50 +0100
X-Gm-Features: AcwNN1UZe9OK-phDYGL6Rp7bdzbs1SB4QayVK-l7Y6JKSNPJ-dx1Aq5zzRqdwzM
Message-ID: <CAHt6W4erMMhNoqD+OjG+BmpWvZEcWLjoszFok_guwM2gANR14Q@mail.gmail.com>
Subject: Re: [PATCH] xen: fix typos in comments
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K . Petersen" <mkp@kernel.org>, xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-ebf023/1788772923-516D2B50-89A26183/0/0
X-purgate-type: clean
X-purgate-size: 4070

On Mon, 7 Sept 2026 at 07:36, Hemanth Selam <hemanth.selam@gmail.com> wrote:
>
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
>
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  drivers/scsi/xen-scsifront.c     | 2 +-
>  drivers/xen/mcelog.c             | 2 +-
>  include/xen/interface/platform.h | 4 ++--
>  include/xen/interface/xen.h      | 2 +-
>  include/xen/xenbus.h             | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/scsi/xen-scsifront.c b/drivers/scsi/xen-scsifront.c
> index 989bcaee42ca..f86a47056ea8 100644
> --- a/drivers/scsi/xen-scsifront.c
> +++ b/drivers/scsi/xen-scsifront.c
> @@ -1076,7 +1076,7 @@ static void scsifront_do_lun_hotplug(struct vscsifrnt_info *info, int op)
>
>                 /*
>                  * Front device state path, used in sdev_configure called
> -                * on successfull scsi_add_device, and in sdev_destroy called
> +                * on successful scsi_add_device, and in sdev_destroy called
>                  * on remove of a device.
>                  */
>                 snprintf(info->dev_state_path, sizeof(info->dev_state_path),
> diff --git a/drivers/xen/mcelog.c b/drivers/xen/mcelog.c
> index 32ab419bb503..f19cc7a67f36 100644
> --- a/drivers/xen/mcelog.c
> +++ b/drivers/xen/mcelog.c
> @@ -1,6 +1,6 @@
>  /******************************************************************************
>   * mcelog.c
> - * Driver for receiving and transferring machine check error infomation
> + * Driver for receiving and transferring machine check error information
>   *
>   * Copyright (c) 2012 Intel Corporation
>   * Author: Liu, Jinsong <jinsong.liu@intel.com>
> diff --git a/include/xen/interface/platform.h b/include/xen/interface/platform.h
> index 79a443c65ea9..462e36392a9f 100644
> --- a/include/xen/interface/platform.h
> +++ b/include/xen/interface/platform.h
> @@ -421,10 +421,10 @@ struct xenpf_pcpuinfo {
>         /* IN */
>         uint32_t xen_cpuid;
>         /* OUT */
> -       /* The maxium cpu_id that is present */
> +       /* The maximum cpu_id that is present */
>         uint32_t max_present;
>  #define XEN_PCPU_FLAGS_ONLINE   1
> -       /* Correponding xen_cpuid is not present*/
> +       /* Corresponding xen_cpuid is not present*/
>  #define XEN_PCPU_FLAGS_INVALID  2
>         uint32_t flags;
>         uint32_t apic_id;
> diff --git a/include/xen/interface/xen.h b/include/xen/interface/xen.h
> index 40c9793e9880..f9acb21875cf 100644
> --- a/include/xen/interface/xen.h
> +++ b/include/xen/interface/xen.h
> @@ -94,7 +94,7 @@
>  #define VIRQ_XENOPROF   7  /* V. XenOprofile interrupt: new sample available */
>  #define VIRQ_CON_RING   8  /* G. (DOM0) Bytes received on console            */
>  #define VIRQ_PCPU_STATE 9  /* G. (DOM0) PCPU state changed                   */
> -#define VIRQ_MEM_EVENT  10 /* G. (DOM0) A memory event has occured           */
> +#define VIRQ_MEM_EVENT  10 /* G. (DOM0) A memory event has occurred           */
>  #define VIRQ_XC_RESERVED 11 /* G. Reserved for XenClient                     */
>  #define VIRQ_ENOMEM     12 /* G. (DOM0) Low on heap memory       */
>  #define VIRQ_XENPMU     13  /* PMC interrupt                                 */
> diff --git a/include/xen/xenbus.h b/include/xen/xenbus.h
> index 8ca15743af7f..6424c5cf8ef5 100644
> --- a/include/xen/xenbus.h
> +++ b/include/xen/xenbus.h
> @@ -63,7 +63,7 @@ struct xenbus_watch
>         unsigned int nr_pending;
>
>         /*
> -        * Called just before enqueing new event while a spinlock is held.
> +        * Called just before enqueuing new event while a spinlock is held.
>          * The event will be discarded if this callback returns false.
>          */
>         bool (*will_handle)(struct xenbus_watch *,

Reviewed-by: Frediano Ziglio <freddy77@gmail.com>

Frediano

