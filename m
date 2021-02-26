Return-Path: <SRS0=mA2z=H4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F05C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 26 Feb 2021 04:48:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17E5D64EC8
	for <xen-devel@archiver.kernel.org>; Fri, 26 Feb 2021 04:48:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17E5D64EC8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.90058.170307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFV2i-0003fS-H4; Fri, 26 Feb 2021 04:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90058.170307; Fri, 26 Feb 2021 04:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFV2i-0003fL-Da; Fri, 26 Feb 2021 04:47:56 +0000
Received: by outflank-mailman (input) for mailman id 90058;
 Fri, 26 Feb 2021 04:47:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WYNV=H4=gmail.com=akihiko.odaki@srs-us1.protection.inumbo.net>)
 id 1lFV2h-0003fG-FK
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 04:47:55 +0000
Received: from mail-ej1-x636.google.com (unknown [2a00:1450:4864:20::636])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29902a70-2c87-474d-8198-d6b751e1a7e7;
 Fri, 26 Feb 2021 04:47:54 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id b21so1589377eja.4
 for <xen-devel@lists.xenproject.org>; Thu, 25 Feb 2021 20:47:54 -0800 (PST)
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
X-Inumbo-ID: 29902a70-2c87-474d-8198-d6b751e1a7e7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=eSegB5Tn100fjF6cMx01sLj7QAzt6mWuluXvHTB2+fo=;
        b=NdrDvZLAm+S+WbPm1+SkWGTWzukLJOHiAt/bPonkTB36VLmZRFCeyvW9oYX0NCxm3K
         Yk6LsUGmgndTGDv+ViVAjvcfIhn7yLqrD5yFYiUBkR5W6m08QKnXpb6lEL/1R+OgBFKT
         +Ui8rmv13ofNMtpZnlkBFFfTKe51pzhx6yC31AfisA5y6Ed6ynD6qYDVcHsI/MxSN7M3
         lZQIYQSIRmCbc9FnyiRNjmoS7wEfpxjzRQzujI6msHfDgqIAvfNWs9tjGR1e8Bq25W9o
         no8lfdwja4+nvU999f0DrSo/ErrUrOsohXkfwL6fbU1OfKyd03ySNqqXLeLlqf3Zqz7e
         VvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=eSegB5Tn100fjF6cMx01sLj7QAzt6mWuluXvHTB2+fo=;
        b=F66C2K+kTXej5xSD5A1rbZnkj/6a0Bj9NBUHSqbMq28c/f+lCPZH2FU0Fj6QwH2vej
         +6X6I9Ei+lKqHXbDShXmkRJz18C7P46iSPt8g04KGJyajLY6AsYFT05BGfa6MqgjWq/p
         kelK5RjJIOUAObkpAQcoy2AByk83KO+cI6xSNx9ckLHbzaQMNa9ROF9Lozo471uwz9A1
         egHo2sYQd2ONhWhZEbcGYfSfGZt/X/+wh+xLXoFTsSkKk7y81NAAkcLaMfXZNO9rgomw
         4EnflO2cuA1fywp8imLkbeij0JanslPGRxs96hoO4pBLHifGizEBQ4yWeqxO/GMWgKVB
         RlMQ==
X-Gm-Message-State: AOAM531e0aWUBJFbT0zFaJk6jkAEixaNPf7liMDjpqVNxDeCaHdM+L7f
	mFuCYDsp/9EpaWsS5VJ1B4X/jhtXmABu/aG+3dA=
X-Google-Smtp-Source: ABdhPJyVniYDvxXKn4lUYlhspOSbMbOOaPMZpGpQWzR0w7eap/HgCB4YP5247R22V8cQ2QJbAVjw+VDjDrVN9B4OBvM=
X-Received: by 2002:a17:907:778d:: with SMTP id ky13mr397591ejc.291.1614314873688;
 Thu, 25 Feb 2021 20:47:53 -0800 (PST)
MIME-Version: 1.0
References: <20210221133414.7262-1-akihiko.odaki@gmail.com>
 <20210222105738.w2q6vp5pi4p6bx5m@sirius.home.kraxel.org> <CAMVc7JVo_XJcGcxW0Wmqje3Y40fRZDY6T8dnQTc2=Ehasz4UHw@mail.gmail.com>
 <20210224111540.xd5a6yszql6wln7m@sirius.home.kraxel.org> <CAMVc7JXUXnrK_amhQsy=paMeqjMU_8r86Hj4UF5haZ+Oq15JkA@mail.gmail.com>
 <20210225114626.dn7wevr3fozp5rcu@sirius.home.kraxel.org>
In-Reply-To: <20210225114626.dn7wevr3fozp5rcu@sirius.home.kraxel.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Fri, 26 Feb 2021 13:47:38 +0900
Message-ID: <CAMVc7JX-E_3fE9SCOaYFAtDBRHNmHxmHWiqcJDPE-4zq-QHJbQ@mail.gmail.com>
Subject: Re: [PATCH] virtio-gpu: Respect graphics update interval for EDID
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu Developers <qemu-devel@nongnu.org>, xen-devel@lists.xenproject.org, 
	"Michael S. Tsirkin" <mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2021=E5=B9=B42=E6=9C=8825=E6=97=A5(=E6=9C=A8) 20:46 Gerd Hoffmann <kraxel@r=
edhat.com>:
>
>   Hi,
>
> > > Because of the wasted frames I'd like this to be an option you can
> > > enable when needed.  For the majority of use cases this seems to be
> > > no problem ...
> >
> > I see blinks with GNOME on Wayland on Ubuntu 20.04 and virtio-gpu with
> > the EDID change included in this patch.
>
> /me looks closely at the patch again.
>
> So you update the edid dynamically, each time the refresh rate changes.
> Problem with that approach is software doesn't expect edid to change
> dynamically because on physical hardware it is static information about
> the connected monitor.
>
> So what the virtio-gpu guest driver does is emulate a monitor hotplug
> event to notify userspace.  If you resize the qemu window on the host
> it'll look like the monitor with the old window size was unplugged and
> a new monitor with the new window size got plugged instead, so gnome
> shell goes adapt the display resolution to the new virtual monitor size.
>
> The blink you are seeing probably comes from gnome-shell processing the
> monitor hotplug event.
>
> We could try to skip generating a monitor hotplug event in case only the
> refresh rate did change.  That would fix the blink, but it would also
> have the effect that nobody will notice the update.
>
> Bottom line:  I think making the edid refresh rate configurable might be
> useful, but changing it dynamically most likely isn't.
>
> take care,
>   Gerd
>

The "hotplug" implementation is probably what other combinations of
devices and guests will do if they want to respond to the changes of
the refresh rate, or display mode in general. That makes telling the
dynamic refresh rate to guests infeasible.

As you wrote, making the refresh rate configurable should be still
useful, and I think matching it to the backend physical display is
even better. GTK, the sole implementer of gfx_update_interval in my
patch reports the refresh rate of the physical display the window
resides in. It means the value may change when the physical display
changes its refresh rate, which should be rare if it does, or the
window moves to another physical display.

In the former case, there is nothing different from implementing a
physical display driver for guests so there should be no problem. The
latter case is similar to how the changes of the window size, which is
also part of display mode, is delivered to guests and they should be
consistent. The only inconsistency I see in my patch is that the
refresh rate change has no throttling while the window size change
has. I don't think it is problematic because it should be rare to move
the window across physical displays, but I can implement one if you
don't agree or know other cases the refresh rate frequently changes.

Regards,
Akihiko Odaki

