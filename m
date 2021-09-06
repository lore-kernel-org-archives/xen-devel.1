Return-Path: <SRS0=XIDt=N4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C1DC433F5
	for <xen-devel@archiver.kernel.org>; Mon,  6 Sep 2021 20:47:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B91EC606A5
	for <xen-devel@archiver.kernel.org>; Mon,  6 Sep 2021 20:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B91EC606A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.180262.326841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNLWl-00068Z-8F; Mon, 06 Sep 2021 20:47:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180262.326841; Mon, 06 Sep 2021 20:47:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNLWl-00068S-5F; Mon, 06 Sep 2021 20:47:39 +0000
Received: by outflank-mailman (input) for mailman id 180262;
 Mon, 06 Sep 2021 20:47:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BJbD=N4=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1mNLWj-00068K-VM
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 20:47:37 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e44ad8c3-e821-4c62-9ee6-fe2b280bd656;
 Mon, 06 Sep 2021 20:47:36 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 186KlQcf066300
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 6 Sep 2021 16:47:32 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 186KlQdT066299;
 Mon, 6 Sep 2021 13:47:26 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: e44ad8c3-e821-4c62-9ee6-fe2b280bd656
Date: Mon, 6 Sep 2021 13:47:26 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: HVM/PVH Balloon crash
Message-ID: <YTZ+XsnoKNnV4IOz@mattapan.m5p.com>
References: <YTVAT0CQD9cPyyDF@mattapan.m5p.com>
 <84d9137e-a268-c3d8-57d2-76fb596e00d3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84d9137e-a268-c3d8-57d2-76fb596e00d3@suse.com>

On Mon, Sep 06, 2021 at 09:52:17AM +0200, Jan Beulich wrote:
> On 06.09.2021 00:10, Elliott Mitchell wrote:
> > I brought this up a while back, but it still appears to be present and
> > the latest observations appear rather serious.
> > 
> > I'm unsure of the entire set of conditions for reproduction.
> > 
> > Domain 0 on this machine is PV (I think the BIOS enables the IOMMU, but
> > this is an older AMD IOMMU).
> > 
> > This has been confirmed with Xen 4.11 and Xen 4.14.  This includes
> > Debian's patches, but those are mostly backports or environment
> > adjustments.
> > 
> > Domain 0 is presently using a 4.19 kernel.
> > 
> > The trigger is creating a HVM or PVH domain where memory does not equal
> > maxmem.
> 
> I take it you refer to "[PATCH] x86/pod: Do not fragment PoD memory
> allocations" submitted very early this year? There you said the issue
> was with a guest's maxmem exceeding host memory size. Here you seem to
> be talking of PoD in its normal form of use. Personally I uses this
> all the time (unless enabling PCI pass-through for a guest, for being
> incompatible). I've not observed any badness as severe as you've
> described.

I've got very little idea what is occurring as I'm expecting to be doing
ARM debugging, not x86 debugging.

I was starting to wonder whether this was widespread or not.  As such I
was reporting the factors which might be different in my environment.

The one which sticks out is the computer has an older AMD processor (you
a 100% Intel shop?).  The processor has the AMD NPT feature, but a very
early/limited IOMMU (according to Linux "AMD IOMMUv2 functionality not
available").

Xen 4.14 refused to load the Domain 0 kernel as PVH (not enough of an
IOMMU).


There is also the possibility Debian added a bad patch, but that seems
improbable as there aren't enough bug reports.


> > New observations:
> > 
> > I discovered this occurs with PVH domains in addition to HVM ones.
> > 
> > I got PVH GRUB operational.  PVH GRUB appeared at to operate normally
> > and not trigger the crash/panic.
> > 
> > The crash/panic occurred some number of seconds after the Linux kernel
> > was loaded.
> > 
> > 
> > Mitigation by not using ballooning with HVM/PVH is workable, but this is
> > quite a large mine in the configuration.
> > 
> > I'm wondering if perhaps it is actually the Linux kernel in Domain 0
> > which is panicing.
> > 
> > The crash/panic occurring AFTER the main kernel loads suggests some
> > action by the user domain is doing is the actual trigger of the
> > crash/panic.
> 
> All of this is pretty vague: If you don't even know what component it
> is that crashes / panics, I don't suppose you have any logs. Yet what
> do you expect us to do without any technical detail?

Initially this had looked so spectacular as to be easy to reproduce.

No logs, I wasn't expecting to be doing hardware-level debugging on x86.
I've got several USB to TTL-serial cables (ARM/MIPS debug), I may need to
hunt a USB to full voltage EIA-232C cable.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



