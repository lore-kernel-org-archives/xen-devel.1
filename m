Return-Path: <SRS0=1OSo=HD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F96C433E0
	for <xen-devel@archiver.kernel.org>; Mon,  1 Feb 2021 05:54:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65C1264DD8
	for <xen-devel@archiver.kernel.org>; Mon,  1 Feb 2021 05:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65C1264DD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.79530.144795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6SAP-0008PU-Sv; Mon, 01 Feb 2021 05:54:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79530.144795; Mon, 01 Feb 2021 05:54:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6SAP-0008PN-Pn; Mon, 01 Feb 2021 05:54:29 +0000
Received: by outflank-mailman (input) for mailman id 79530;
 Mon, 01 Feb 2021 05:54:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ttS=HD=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1l6SAO-0008Oz-Lo
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 05:54:28 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 103d0558-48db-406f-b8e7-e141ab72951c;
 Mon, 01 Feb 2021 05:54:23 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 1115s6B6012636
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 1 Feb 2021 00:54:12 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 1115s5Hj012635;
 Sun, 31 Jan 2021 21:54:05 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 103d0558-48db-406f-b8e7-e141ab72951c
Date: Sun, 31 Jan 2021 21:54:05 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: Xen 4.14.1 on RPI4: device tree generation failed
Message-ID: <YBeXfWf8lQ2nwMtI@mattapan.m5p.com>
References: <CABfawhnvgFLU=VmaqmKyf8DNeVcXoXTD2=XpiwnL0OikC1_z4w@mail.gmail.com>
 <YBc+Iaf1CCgXO0Aj@mattapan.m5p.com>
 <CABfawhncPyDKy_G2Lz7MaEb_ZoPadHef7S7KAj-fbCbQq6YNGA@mail.gmail.com>
 <YBdgf4KKcDn0SCOw@mattapan.m5p.com>
 <CABfawhmrWX6tO-bESuF5oGec5cLbkHdyjdCGsfwX5AVrwQBsKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABfawhmrWX6tO-bESuF5oGec5cLbkHdyjdCGsfwX5AVrwQBsKA@mail.gmail.com>

On Sun, Jan 31, 2021 at 10:06:21PM -0500, Tamas K Lengyel wrote:
> With rpi-4.19.y kernel and dtbs
> (cc39f1c9f82f6fe5a437836811d906c709e0661c) Xen boots fine and the
> previous error is not present. I get the boot log on the serial with
> just console=hvc0 from dom0 but the kernel ends up in a panic down the
> line:

> This seems to have been caused by a monitor being attached to the HDMI
> port, with HDMI unplugged dom0 boots OK.

The balance of reports seem to suggest 5.10 is the way to go if you want
graphics on a RP4 with Xen.  Even without Xen 4.19 is looking rickety on
RP4.


On Sun, Jan 31, 2021 at 09:43:13PM -0500, Tamas K Lengyel wrote:
> On Sun, Jan 31, 2021 at 8:59 PM Elliott Mitchell <ehem+xen@m5p.com> wrote:
> >
> > On Sun, Jan 31, 2021 at 06:50:36PM -0500, Tamas K Lengyel wrote:
> > > On Sun, Jan 31, 2021 at 6:33 PM Elliott Mitchell <ehem+undef@m5p.com> wrote:
> > > > Presently the rpixen script is grabbing the RPF's 4.19 branch, dates
> > > > point to that last being touched last year.  Their tree is at
> > > > cc39f1c9f82f6fe5a437836811d906c709e0661c.
> > >
> > > I've moved the Linux branch up to 5.10 because there had been a fair
> > > amount of work that went into fixing Xen on RPI4, which got merged
> > > into 5.9 and I would like to be able to build upstream everything
> > > without the custom patches coming with the rpixen script repo.
> >
> > Please keep track of where your kernel source is checked out at since
> > there was a desire to figure out what was going on with the device-trees.
> >
> >
> > Including "console=hvc0 console=AMA0 console=ttyS0 console=tty0" in the
> > kernel command-line should ensure you get output from the kernel if it
> > manages to start (yes, Linux does support having multiple consoles at the
> > same time).
> 
> No output from dom0 received even with the added console options
> (+earlyprintk=xen). The kernel build was from rpi-5.10.y
> c9226080e513181ffb3909a905e9c23b8a6e8f62. I'll check if it still boots
> with 4.19 next.

So, their current HEAD.  This reads like you've got a problematic kernel
configuration.  What procedure are you following to generate the
configuration you use?

Using their upstream as a base and then adding the configuration options
for Xen has worked fairly well for me (`make bcm2711_defconfig`,
`make menuconfig`, `make zImage`).

Notably the options:
CONFIG_PARAVIRT
CONFIG_XEN_DOM0
CONFIG_XEN
CONFIG_XEN_BLKDEV_BACKEND
CONFIG_XEN_NETDEV_BACKEND
CONFIG_HVC_XEN
CONFIG_HVC_XEN_FRONTEND

Should be set to "y".


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



