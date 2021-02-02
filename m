Return-Path: <SRS0=EOea=HE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE184C433E0
	for <xen-devel@archiver.kernel.org>; Tue,  2 Feb 2021 02:53:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7522264E8C
	for <xen-devel@archiver.kernel.org>; Tue,  2 Feb 2021 02:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7522264E8C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.80304.146810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6los-00066x-TE; Tue, 02 Feb 2021 02:53:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80304.146810; Tue, 02 Feb 2021 02:53:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6los-00066q-Q8; Tue, 02 Feb 2021 02:53:34 +0000
Received: by outflank-mailman (input) for mailman id 80304;
 Tue, 02 Feb 2021 02:53:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=46ur=HE=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1l6lor-00066l-Lv
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 02:53:33 +0000
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35998ec5-4221-44d3-bb0d-4ab472f4bff1;
 Tue, 02 Feb 2021 02:53:32 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id q7so18780748wre.13
 for <xen-devel@lists.xenproject.org>; Mon, 01 Feb 2021 18:53:32 -0800 (PST)
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
X-Inumbo-ID: 35998ec5-4221-44d3-bb0d-4ab472f4bff1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0DMF/kOzW6VsTETjB9wkPrPZebkGXhjUK4k4jG+hBcU=;
        b=WZ63WUPwN3GWiCeACGQYCWmM+tXZDEw0a8lfKSSXhoa4cJt/Pjz5EStbISMtXUfjU0
         YRyDxsuFnyObDCH6b3Sp+Fmnsx+Djf3DauJtMPyQowM1ZAG6YnoovxvOZ28H1e/Zt9so
         1Mtka1kPCTOuEzGSERj3cWOvwyYS0QE7YQDI4TQ4AeqAzFrlkgZoITvA16y0BM4DEZpx
         pZ9vm+Ww4OiZ9ycRUAYXNwBl/TmV7R8ossdHwkr40BsubBkqCSFKhR4lz/vp/+2WZm7Z
         hmluJ8pjf46lOhcbiOzzEdsW5IY8CMcOERwvkw5Gyq3lOwoSitUDUCz3ebyagbgtkg3O
         ySow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0DMF/kOzW6VsTETjB9wkPrPZebkGXhjUK4k4jG+hBcU=;
        b=tmmxOHN3IgVPtkx2EaboviULb8TKBvIaVE/O0c5RJpJTrLHfrep7GGRf11rLCFPUhQ
         z8rnmZEA3nt6fj2ZhOCwwYZqyV5jCbhY4SgStoM1Fzd8b2RhqVPy7M5e7+y4gVFKMszU
         cNHePQ7zrLZXxcRvxsI09mcdjCqajuJLjZPLT6lBN8WzQeSr6hO5D/GBPzHq9XbVNxgm
         t2d16IAIFksp5AEZ32cVBU+n1gbBoBFz5uDpuLR0P3H3ASXRmWHXyd0XFGWbSXGr5dEv
         baBCwRgN+KRiqwv0wzn3jsxh4klWDNvP+1OzCOqiBWNPdNf1JJ3hI9mh20pxvhCumE/l
         kpvg==
X-Gm-Message-State: AOAM531Uiv95kGrrezEzuvlaPNdZRx2K3wwhBeVSBcnMGTvAezNuXTvb
	DE6D5bFGnHauDY6CdTFumqxd3rhaB14Ckig2E6Q=
X-Google-Smtp-Source: ABdhPJzwCo0WIi3Ucf+KKYiyulT5R5pHWdCdF7by0jioNVDY6kUAEXzhTK/rPiDDm0NeP15YhD1tmIe5lmITD0rcF4o=
X-Received: by 2002:adf:ffce:: with SMTP id x14mr21801322wrs.390.1612234411741;
 Mon, 01 Feb 2021 18:53:31 -0800 (PST)
MIME-Version: 1.0
References: <CABfawhnvgFLU=VmaqmKyf8DNeVcXoXTD2=XpiwnL0OikC1_z4w@mail.gmail.com>
 <YBc+Iaf1CCgXO0Aj@mattapan.m5p.com> <CABfawhncPyDKy_G2Lz7MaEb_ZoPadHef7S7KAj-fbCbQq6YNGA@mail.gmail.com>
 <YBdgf4KKcDn0SCOw@mattapan.m5p.com> <CABfawhmrWX6tO-bESuF5oGec5cLbkHdyjdCGsfwX5AVrwQBsKA@mail.gmail.com>
 <YBeXfWf8lQ2nwMtI@mattapan.m5p.com> <CABfawhn74W88nJz5bCvA=VMxX_QqKv1ZaDQxOEtNZu5Pr8mFag@mail.gmail.com>
 <CABfawhktGwwXNdMrm4uShKSs5MvaUz2hG63wzcDA97z9pGL=Ug@mail.gmail.com>
 <alpine.DEB.2.21.2102011737010.29047@sstabellini-ThinkPad-T480s> <CAMmSBy--93yDWZcfhkDHHPxmydvJ4tyymwTzHCC4apObD4983Q@mail.gmail.com>
In-Reply-To: <CAMmSBy--93yDWZcfhkDHHPxmydvJ4tyymwTzHCC4apObD4983Q@mail.gmail.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Mon, 1 Feb 2021 21:52:53 -0500
Message-ID: <CABfawhkYmFB9Xc+zmvzA6ispiryfX1EgMWzYTSvHxD9Gmu=TUg@mail.gmail.com>
Subject: Re: Xen 4.14.1 on RPI4: device tree generation failed
To: Roman Shaposhnik <roman@zededa.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Elliott Mitchell <ehem+xen@m5p.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 1, 2021 at 9:10 PM Roman Shaposhnik <roman@zededa.com> wrote:
>
> On Mon, Feb 1, 2021 at 5:40 PM Stefano Stabellini
> <sstabellini@kernel.org> wrote:
> >
> > On Mon, 1 Feb 2021, Tamas K Lengyel wrote:
> > > On Mon, Feb 1, 2021 at 10:23 AM Tamas K Lengyel
> > > <tamas.k.lengyel@gmail.com> wrote:
> > > >
> > > > On Mon, Feb 1, 2021 at 12:54 AM Elliott Mitchell <ehem+xen@m5p.com> wrote:
> > > > >
> > > > > On Sun, Jan 31, 2021 at 10:06:21PM -0500, Tamas K Lengyel wrote:
> > > > > > With rpi-4.19.y kernel and dtbs
> > > > > > (cc39f1c9f82f6fe5a437836811d906c709e0661c) Xen boots fine and the
> > > > > > previous error is not present. I get the boot log on the serial with
> > > > > > just console=hvc0 from dom0 but the kernel ends up in a panic down the
> > > > > > line:
> > > > >
> > > > > > This seems to have been caused by a monitor being attached to the HDMI
> > > > > > port, with HDMI unplugged dom0 boots OK.
> > > > >
> > > > > The balance of reports seem to suggest 5.10 is the way to go if you want
> > > > > graphics on a RP4 with Xen.  Even without Xen 4.19 is looking rickety on
> > > > > RP4.
> > > > >
> > > > >
> > > > > On Sun, Jan 31, 2021 at 09:43:13PM -0500, Tamas K Lengyel wrote:
> > > > > > On Sun, Jan 31, 2021 at 8:59 PM Elliott Mitchell <ehem+xen@m5p.com> wrote:
> > > > > > >
> > > > > > > On Sun, Jan 31, 2021 at 06:50:36PM -0500, Tamas K Lengyel wrote:
> > > > > > > > On Sun, Jan 31, 2021 at 6:33 PM Elliott Mitchell <ehem+undef@m5p.com> wrote:
> > > > > > > > > Presently the rpixen script is grabbing the RPF's 4.19 branch, dates
> > > > > > > > > point to that last being touched last year.  Their tree is at
> > > > > > > > > cc39f1c9f82f6fe5a437836811d906c709e0661c.
> > > > > > > >
> > > > > > > > I've moved the Linux branch up to 5.10 because there had been a fair
> > > > > > > > amount of work that went into fixing Xen on RPI4, which got merged
> > > > > > > > into 5.9 and I would like to be able to build upstream everything
> > > > > > > > without the custom patches coming with the rpixen script repo.
> > > > > > >
> > > > > > > Please keep track of where your kernel source is checked out at since
> > > > > > > there was a desire to figure out what was going on with the device-trees.
> > > > > > >
> > > > > > >
> > > > > > > Including "console=hvc0 console=AMA0 console=ttyS0 console=tty0" in the
> > > > > > > kernel command-line should ensure you get output from the kernel if it
> > > > > > > manages to start (yes, Linux does support having multiple consoles at the
> > > > > > > same time).
> > > > > >
> > > > > > No output from dom0 received even with the added console options
> > > > > > (+earlyprintk=xen). The kernel build was from rpi-5.10.y
> > > > > > c9226080e513181ffb3909a905e9c23b8a6e8f62. I'll check if it still boots
> > > > > > with 4.19 next.
> > > > >
> > > > > So, their current HEAD.  This reads like you've got a problematic kernel
> > > > > configuration.  What procedure are you following to generate the
> > > > > configuration you use?
> > > > >
> > > > > Using their upstream as a base and then adding the configuration options
> > > > > for Xen has worked fairly well for me (`make bcm2711_defconfig`,
> > > > > `make menuconfig`, `make zImage`).
> > > > >
> > > > > Notably the options:
> > > > > CONFIG_PARAVIRT
> > > > > CONFIG_XEN_DOM0
> > > > > CONFIG_XEN
> > > > > CONFIG_XEN_BLKDEV_BACKEND
> > > > > CONFIG_XEN_NETDEV_BACKEND
> > > > > CONFIG_HVC_XEN
> > > > > CONFIG_HVC_XEN_FRONTEND
> > > > >
> > > > > Should be set to "y".
> > > >
> > > > Yes, these configs are all set the same way for all Linux builds by the script:
> > > >         make O=.build-arm64 ARCH=arm64
> > > > CROSS_COMPILE=aarch64-none-linux-gnu- bcm2711_defconfig xen.config
> > > >
> > > > I tried with both the rpi-5.10.y and rpi-5.9.y, neither boot up as
> > > > dom0. So far only 4.19 boots.
> > >
> > > rpi-5.4.y boots but ends up in yet another different kernel panic:
> >
> > That's an interesting error. However, I can tell you that I can boot
> > rpi-5.9.y just fine (without a monitor attached) with:
> >
> > cd linux
> > KERNEL=kernel7l
> > make bcm2711_defconfig
> >
> > As mentioned here:
> >
> > https://www.raspberrypi.org/documentation/linux/kernel/building.md
> >
> > and also taking the device tree from arch/arm64/boot/dts/broadcom/.
>
> FWIW: I see the same results with stock upstream 5.10.7 effectively
> following the steps you're doing.
>
> However, as I keep saying -- the combination of firmware and u-boot
> (in my case) is a very sensitive combination -- hence we're relying
> on a very particular set of bits for there in EVE and will refuse to work
> with anything else.
>
> It may be helpful to take that combination outside of EVE's context and
> try it out in your experiments Tamas.

Well, I'm giving up on this for now. I ran out of ideas to try and I
don't see any useful suggestions on how to debug this further. Looks
like it's super fragile and works only under specific conditions
that's not well documented - if documented at all.

Tamas

