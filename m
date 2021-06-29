Return-Path: <SRS0=dxCq=LX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE651C11F66
	for <xen-devel@archiver.kernel.org>; Tue, 29 Jun 2021 12:10:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A391661D70
	for <xen-devel@archiver.kernel.org>; Tue, 29 Jun 2021 12:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A391661D70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.148021.273349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyCZd-0005A6-Cq; Tue, 29 Jun 2021 12:10:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148021.273349; Tue, 29 Jun 2021 12:10:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyCZd-00059z-9m; Tue, 29 Jun 2021 12:10:41 +0000
Received: by outflank-mailman (input) for mailman id 148021;
 Tue, 29 Jun 2021 12:10:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DRwR=LX=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lyCZc-00059t-5D
 for xen-devel@lists.xenproject.org; Tue, 29 Jun 2021 12:10:40 +0000
Received: from mail-lj1-x231.google.com (unknown [2a00:1450:4864:20::231])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b1422efb-cf25-4577-8374-318002e396a2;
 Tue, 29 Jun 2021 12:10:39 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id x20so24009145ljc.5
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jun 2021 05:10:38 -0700 (PDT)
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
X-Inumbo-ID: b1422efb-cf25-4577-8374-318002e396a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rs82UyLdVHwbHp5EGtmjg4YLEYEQMKjkbyh4jFYg30s=;
        b=J0AysvdDxQQjXCWW0NKd8lD5brA+DKwlhfL27oDxmPkP4mI5NVKQeYRilGryzP6QWF
         gvpY37u08aiP6uxzrIzf7PdcYvm06abwnVk1lGKQU5vJU7YsiJsRoo3Uj2CwxYY+k6Lg
         xNiuqUNc8PGyQ1YpaHbwaZrBbtrbnkPijj/CBNqIYGiUlx6xR/dqknGfbvDT+4tGV4+6
         deV4UR4EEiKQGs7bpNsqqEbpoMpqN8h4dFVrYaOjfwJgiQfq0yj5cDNqFhLW4GVpWE2t
         ImGc6jSHZnsAvUIq42Ni/EXOF/YKV4D1FnHTPbGEn4UROUw5zHJjYnRvMxlAtdTN29B/
         4DTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rs82UyLdVHwbHp5EGtmjg4YLEYEQMKjkbyh4jFYg30s=;
        b=oKsrnA8pr54bG6odJWoZhDErpvG07BC0vdO1c6MmJW5Jmib6V/AY8fXSVhO1YwhHJZ
         RzDedHnNtQnDmJaRkZLcgE5zFHszf42F3qPLr74KbDKv+D71ThOaxren4YJee9nC5Ktn
         xpvEccizX68yarMbP/d4b307nVVpm2cgYcYDe8TJttU+veFQtdl7Ht01F1D2qGFB/FBa
         nNLeIUqDnsyOtFUgPNpFHTZthu4WsYOGdSfPHVPJMIAqOAxgA3FzkNiWrF6XXjEr6ojJ
         irsaN1KAb5cv55VPXWoLg0giXfHzxOX7U5J4YH2MhxWYxUe3mLJvXZ1oqsUw3Hr0RQ4A
         0vbQ==
X-Gm-Message-State: AOAM531clc5N3sBCiTpmksfEKuJ0Y8eME8lcIb9etwQ99YtGnzP717uG
	AUXfx/AiCIcLEgLHEMYjqjM1aieF6ssfAsrSuAg=
X-Google-Smtp-Source: ABdhPJwP5O1co0J/ArqCTd8/xF/Wlo9XbK7a4wyDJMW4a1Oqgr1D5sqo2jhUrHV6MGmARZAtn95xZrgsDSuIY1O6VlM=
X-Received: by 2002:a2e:2a85:: with SMTP id q127mr3714856ljq.77.1624968637938;
 Tue, 29 Jun 2021 05:10:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210628100157.5010-1-anthony.perard@citrix.com> <20210628100157.5010-3-anthony.perard@citrix.com>
In-Reply-To: <20210628100157.5010-3-anthony.perard@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 29 Jun 2021 08:10:26 -0400
Message-ID: <CAKf6xpvO8y-kfVcm+d2NnTSvfkPESHo6fsWBbPsZK=iXvt4u1A@mail.gmail.com>
Subject: Re: [XEN PATCH 2/2] libxl: Fix QEMU cmdline for scsi device
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, 
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 28, 2021 at 6:02 AM Anthony PERARD
<anthony.perard@citrix.com> wrote:
>
> Usage of 'scsi-disk' device is deprecated and removed from QEMU,
> instead we need to use 'scsi-hd' for hard drives.
> See QEMU 879be3af49 (hw/scsi: remove 'scsi-disk' device)
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Looks like scsi-hd is really old - qemu v0.15.

Regards,
Jason

