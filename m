Return-Path: <SRS0=1OSo=HD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B688DC433E0
	for <xen-devel@archiver.kernel.org>; Mon,  1 Feb 2021 21:25:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C1D164EC8
	for <xen-devel@archiver.kernel.org>; Mon,  1 Feb 2021 21:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C1D164EC8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.80153.146371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6ggz-0003dL-9O; Mon, 01 Feb 2021 21:25:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80153.146371; Mon, 01 Feb 2021 21:25:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6ggz-0003dE-5K; Mon, 01 Feb 2021 21:25:05 +0000
Received: by outflank-mailman (input) for mailman id 80153;
 Mon, 01 Feb 2021 21:25:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ttS=HD=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1l6ggx-0003d9-T1
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 21:25:03 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d886e01-5ac5-4c6c-9e7f-f4232cca3192;
 Mon, 01 Feb 2021 21:24:58 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 111LOi9v017556
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 1 Feb 2021 16:24:50 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 111LOgTQ017555;
 Mon, 1 Feb 2021 13:24:42 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 3d886e01-5ac5-4c6c-9e7f-f4232cca3192
Date: Mon, 1 Feb 2021 13:24:42 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: Xen 4.14.1 on RPI4: device tree generation failed
Message-ID: <YBhxmo5sFyTs/XTr@mattapan.m5p.com>
References: <CABfawhnvgFLU=VmaqmKyf8DNeVcXoXTD2=XpiwnL0OikC1_z4w@mail.gmail.com>
 <YBc+Iaf1CCgXO0Aj@mattapan.m5p.com>
 <CABfawhncPyDKy_G2Lz7MaEb_ZoPadHef7S7KAj-fbCbQq6YNGA@mail.gmail.com>
 <YBdgf4KKcDn0SCOw@mattapan.m5p.com>
 <CABfawhmrWX6tO-bESuF5oGec5cLbkHdyjdCGsfwX5AVrwQBsKA@mail.gmail.com>
 <YBeXfWf8lQ2nwMtI@mattapan.m5p.com>
 <CABfawhn74W88nJz5bCvA=VMxX_QqKv1ZaDQxOEtNZu5Pr8mFag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABfawhn74W88nJz5bCvA=VMxX_QqKv1ZaDQxOEtNZu5Pr8mFag@mail.gmail.com>

On Mon, Feb 01, 2021 at 10:23:34AM -0500, Tamas K Lengyel wrote:
> On Mon, Feb 1, 2021 at 12:54 AM Elliott Mitchell <ehem+xen@m5p.com> wrote:
> > On Sun, Jan 31, 2021 at 09:43:13PM -0500, Tamas K Lengyel wrote:
> > > No output from dom0 received even with the added console options
> > > (+earlyprintk=xen). The kernel build was from rpi-5.10.y
> > > c9226080e513181ffb3909a905e9c23b8a6e8f62. I'll check if it still boots
> > > with 4.19 next.
> >
> > So, their current HEAD.  This reads like you've got a problematic kernel
> > configuration.  What procedure are you following to generate the
> > configuration you use?
> >
> > Using their upstream as a base and then adding the configuration options
> > for Xen has worked fairly well for me (`make bcm2711_defconfig`,
> > `make menuconfig`, `make zImage`).
> >
> > Notably the options:
> > CONFIG_PARAVIRT
> > CONFIG_XEN_DOM0
> > CONFIG_XEN
> > CONFIG_XEN_BLKDEV_BACKEND
> > CONFIG_XEN_NETDEV_BACKEND
> > CONFIG_HVC_XEN
> > CONFIG_HVC_XEN_FRONTEND
> >
> > Should be set to "y".
> 
> Yes, these configs are all set the same way for all Linux builds by the script:
>         make O=.build-arm64 ARCH=arm64
> CROSS_COMPILE=aarch64-none-linux-gnu- bcm2711_defconfig xen.config
> 
> I tried with both the rpi-5.10.y and rpi-5.9.y, neither boot up as
> dom0. So far only 4.19 boots.

So you're using a scripted procedure to generate the configuration.  The
actual kernel configuration is saved in the file ".config" in the build
directory.  Could you confirm whether those are actually being set?

Try running `grep -eCONFIG_PARAVIRT -eCONFIG_XEN_DOM0 -eCONFIG_XEN
-eCONFIG_HVC_XEN -eCONFIG_HVC_XEN_FRONTEND .config`, those 5 must
be "=y".  Various kernel configuration options depend upon others, so
there could be potential you need to set one before those get enabled.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



