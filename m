Return-Path: <SRS0=1OSo=HD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1538C433DB
	for <xen-devel@archiver.kernel.org>; Mon,  1 Feb 2021 02:44:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ACB064E25
	for <xen-devel@archiver.kernel.org>; Mon,  1 Feb 2021 02:44:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7ACB064E25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.79507.144717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6PBw-0005gn-N7; Mon, 01 Feb 2021 02:43:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79507.144717; Mon, 01 Feb 2021 02:43:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6PBw-0005gg-KB; Mon, 01 Feb 2021 02:43:52 +0000
Received: by outflank-mailman (input) for mailman id 79507;
 Mon, 01 Feb 2021 02:43:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WfTc=HD=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1l6PBv-0005gb-Ji
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 02:43:51 +0000
Received: from mail-wm1-x333.google.com (unknown [2a00:1450:4864:20::333])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ec56cf1-978d-46a7-bcef-e079fbb477c1;
 Mon, 01 Feb 2021 02:43:50 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id j18so11305463wmi.3
 for <xen-devel@lists.xenproject.org>; Sun, 31 Jan 2021 18:43:50 -0800 (PST)
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
X-Inumbo-ID: 0ec56cf1-978d-46a7-bcef-e079fbb477c1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zYtaXle1N7QvSDr4hJgeFHILKHlGu6PfUoeF5ITSgaQ=;
        b=jHEmgEcidd9GH8IM4+fZS/DtEjSWUJTUGfL+9M/Z0QuCNIVu8K8zecPtQMbxz29kdN
         H72ycERPi+f6RJRoUlCZV2SYjsPpj601PYCvSyBqGbpXXyxGsdZs14jVLBMOBkGAjD3X
         zR9AsYH1vNSSIc/7qIS579yeOd1Eblp1Sb0jAn4tpfKGCjda1fXpFvDJL74uDHO/7FKX
         CB4prHbFM90udAlFYV/Z0S2CkWVLjvKunwL4BQeWBagkyFRfVVy6l/kam0mYriiTqzyH
         M2KQ47Qdp7O02MFD7rfiCsAi2RsE/cFxobVBxXaevK9y8KDro9J6ex4jBKWuLKpS+cPN
         PHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zYtaXle1N7QvSDr4hJgeFHILKHlGu6PfUoeF5ITSgaQ=;
        b=Y4lKo8MqwRXBgp2LIbTT1tCkMDmuRsDOIkMT9imKrazoMtlYT1jM1TDnG4dYX5V/1P
         nUojgr/4bTb5GFFTt+INPf3j9urkcKPOo8UC7FampIg/zj1wP2rSPf3L09CMKpBYZce2
         gROzT8ni+V66UGlYXWiE7epmd1IIcv75ARBgKvy466+LvPuoq63ZRqZ71OewDebcylbo
         jyM9y+5Rkwbt7vMHCHIc/a51YWbND1geyb5xoA/KCTcB1X5moE4XdnlH8Pnz14SJqpSm
         +rbZzeXrC6ei9JC5pgzeO7azXqmK6GQUm2gtg5DZF4Cla7BJ0FqNOw0c18bDx2/aIj7G
         z1OQ==
X-Gm-Message-State: AOAM5310494wmJpds6LXF7TLFP7YyiPulqm8fJICy6+vFgFcpGNMy8zS
	X13XJlKApvjBoIei+fM2tCuygKLyUz/1SILzIWA=
X-Google-Smtp-Source: ABdhPJy7uVSLphV+lUd6ZFLjYJwQl6VWhcIDm02YzLPNZJwlWv2CYxt3midZHKhAF9MpmSwqyVpe6yrMc4KFb1nWJPg=
X-Received: by 2002:a1c:e905:: with SMTP id q5mr13088536wmc.84.1612147429482;
 Sun, 31 Jan 2021 18:43:49 -0800 (PST)
MIME-Version: 1.0
References: <CABfawhnvgFLU=VmaqmKyf8DNeVcXoXTD2=XpiwnL0OikC1_z4w@mail.gmail.com>
 <YBc+Iaf1CCgXO0Aj@mattapan.m5p.com> <CABfawhncPyDKy_G2Lz7MaEb_ZoPadHef7S7KAj-fbCbQq6YNGA@mail.gmail.com>
 <YBdgf4KKcDn0SCOw@mattapan.m5p.com>
In-Reply-To: <YBdgf4KKcDn0SCOw@mattapan.m5p.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Sun, 31 Jan 2021 21:43:13 -0500
Message-ID: <CABfawhmrWX6tO-bESuF5oGec5cLbkHdyjdCGsfwX5AVrwQBsKA@mail.gmail.com>
Subject: Re: Xen 4.14.1 on RPI4: device tree generation failed
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 31, 2021 at 8:59 PM Elliott Mitchell <ehem+xen@m5p.com> wrote:
>
> On Sun, Jan 31, 2021 at 06:50:36PM -0500, Tamas K Lengyel wrote:
> > On Sun, Jan 31, 2021 at 6:33 PM Elliott Mitchell <ehem+undef@m5p.com> wrote:
> > >
> > > On Sun, Jan 31, 2021 at 02:06:17PM -0500, Tamas K Lengyel wrote:
> > > > (XEN) Unable to retrieve address 0 for /scb/pcie@7d500000/pci@1,0/usb@1,0
> > > > (XEN) Device tree generation failed (-22).
> > >
> > > > Does anyone have an idea what might be going wrong here? I tried
> > > > building the dtb without using the dtb overlay but it didn't seem to
> > > > do anything.
> > >
> > > If you go to line 1412 of the file xen/arch/arm/domain_build.c and
> > > replace the "return res;" with "continue;" that will bypass the issue.
> > > The 3 people I'm copying on this message though may wish to ask questions
> > > about the state of your build tree.
> >
> > I'll try that but it's a pretty hacky work-around ;)
>
> Actually no, it simply causes Xen to ignore these entries.  The patch
> I've got ready to submit to this list also adjusts the error message to
> avoid misinterpretation, but does pretty well exactly this.
>
> My only concern is whether it should ignore the entries only for Domain 0
> or should always ignore them.
>
>
> > > Presently the rpixen script is grabbing the RPF's 4.19 branch, dates
> > > point to that last being touched last year.  Their tree is at
> > > cc39f1c9f82f6fe5a437836811d906c709e0661c.
> >
> > I've moved the Linux branch up to 5.10 because there had been a fair
> > amount of work that went into fixing Xen on RPI4, which got merged
> > into 5.9 and I would like to be able to build upstream everything
> > without the custom patches coming with the rpixen script repo.
>
> Please keep track of where your kernel source is checked out at since
> there was a desire to figure out what was going on with the device-trees.
>
>
> Including "console=hvc0 console=AMA0 console=ttyS0 console=tty0" in the
> kernel command-line should ensure you get output from the kernel if it
> manages to start (yes, Linux does support having multiple consoles at the
> same time).

No output from dom0 received even with the added console options
(+earlyprintk=xen). The kernel build was from rpi-5.10.y
c9226080e513181ffb3909a905e9c23b8a6e8f62. I'll check if it still boots
with 4.19 next.

Tamas

