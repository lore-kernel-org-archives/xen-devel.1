Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57670C5CFC1
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2026 03:10:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390709.1630895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuiJR-000482-Dh; Fri, 14 Aug 2026 03:10:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390709.1630895; Fri, 14 Aug 2026 03:10:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuiJR-00047u-9n; Fri, 14 Aug 2026 03:10:29 +0000
Received: by outflank-mailman (input) for mailman id 1390709;
 Fri, 14 Aug 2026 03:10:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ehem@m5p.com>) id 1wuiJQ-00047o-Dh
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 03:10:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuiJP-00EgYN-Ne
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 05:10:27 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ehem@m5p.com>)
 id 6a7e8716-8faa-0a2a0a5109dd-0a2a4507ebac-4
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 05:10:27 +0200
Received: from [74.104.188.4] (helo=mailhost.m5p.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ehem@m5p.com>)
 id 6a7e8722-b4ea-0a2a45070019-4a68bc047e80-3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 05:10:27 +0200
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:8ac4:0:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 67E3AHc7064974
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 13 Aug 2026 23:10:22 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 67E3AGgl064973;
 Thu, 13 Aug 2026 20:10:16 -0700 (PDT) (envelope-from ehem)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
Date: Thu, 13 Aug 2026 20:10:16 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger@xenproject.org>
Cc: Cody Zuschlag <cody.zuschlag@xenproject.org>,
        xen-devel@lists.xenproject.org, anthony.perard@vates.tech
Subject: Re: [ANNOUNCE] - Call for agenda items for August 6 Xen Community
 Call @ 15:00 UTC
Message-ID: <an6HGMxZDd-Uv61d@mattapan.m5p.com>
References: <CAJbE=KznNsrNRN=pUaDj7-TVW4uCMVBdrPpei_z5nBdjdHnVag@mail.gmail.com>
 <anqKjwU93bMcttNz@mattapan.m5p.com>
 <anrfqjt69_K900nJ@macbook.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <anrfqjt69_K900nJ@macbook.local>
X-purgate-ID: tlsNG-ef75cf/1786677027-362C4AE4-F438937D/0/0
X-purgate-type: clean
X-purgate-size: 8378

On Tue, Aug 11, 2026 at 10:39:31AM +0200, Roger Pau Monné wrote:
> On Mon, Aug 10, 2026 at 07:35:59PM -0700, Elliott Mitchell wrote:
> > On Tue, Aug 04, 2026 at 05:30:50PM +0200, Cody Zuschlag wrote:
> > > *Preparation*
> > > 
> > > 👉 Please take a few minutes to review and update the agenda before the
> > > call:
> > > 
> > > https://cryptpad.fr/pad/#/2/pad/edit/eqPXghB7GwT4OuySCjSQRyVD/
> > > 
> > > Feel free to:
> > > - Add topics or project updates
> > > - Suggest anything we can drop or defer
> > > - Include links to patches, mailing list threads, or documentation where
> > > helpful
> > > 
> > > The agenda also includes the meeting link and a link to find your local
> > > meeting time.
> > > 
> > > 
> > > *Call Details*
> > > Date: Thursday, 6 August 2026
> > > Time: 15:00 UTC (agenda starts at 15:05 UTC)
> > > Join: https://meet.jit.si/XenProjectCommunityCall
> > > 
> > > We'll open the room at 15:00 UTC and begin the agenda at 15:05 UTC to give
> > > everyone a few minutes to join.
> > 
> > 
> > Took me a bit of time to consider what had been said in order to come up
> > with next responses.
> > 
> > I didn't emphasize it during the community call, but the point was
> > explicit in the most recent posted message:
> > 
> > https://lore.kernel.org/xen-devel/ajr0gN9kmPkLQlGF@mattapan.m5p.com/T/
> > 
> > This was previously allowed by Xen/ARM.  This turned into a bug when the
> > Xen/ARM team decided to disallow multiple mappings of the shared
> > information page.  During approval the Xen/ARM team was explicitly asked
> > to accept the task of updating outside projects to deal with fall-out.
> > 
> > I don't recall the exact wording of the agreement, but this is certainly
> > fall-out from that change.  As such this IS an adjustment the Xen/ARM
> > team agreed to aid.
> > 
> > I've already generated a PoC, I had thought the Xen/ARM team would be
> > better acquainted with whom to ask about getting a patch along those
> > lines in.  That seems a reasonable ask in light of the team having
> > accepted the task.
> 
> I don't know what you mean or imply with "accepted the task".  It
> sounds a bit selfish to me that you refuse to finish the OVMF work.
> It's possible none of us likes the OVMF coding style more than you do,
> yet you seem to assume we have some kind of duty to pick this work and
> finish it.  That's IMO an unacceptable burden to put on developers of
> an open source project.

When the decision was made to disallow mapping the shared information
page multiple times on ARM there was a discussion.  The issue of the
change breaking existing implementations was brought up and there was
some level of agreement the ARM team would do some work on that (though
there may have been an expectation it wouldn't need much).

I recall this being sometime around 2020-2023, but so far search engines
have failed me.  As such I don't have exactly what was typed handy.

Tianocore/EDK2 worked fine with Xen/ARM 4.14 (before the change), but
was broken with 4.17.  It isn't exactly Tianocore/EDK2, but it leaving
its mapping behind breaking the loaded OS.

> > I don't know the Xen developers by voice.  As such I don't know who
> > mentioned 'firmware = "ovmf"' when I was trying to bring up
> > Tianocore/EDK2 as bootloader.  Now that I've checked by notes, whomever
> > brought that up was quite unfamiliar with that I was trying to bring up.
> > 
> > The 'firmware = "ovmf"' setting is part of HVM domain configuration.  In
> > this environment Tianocore/EDK2 is merely setting up some ACPI tables and
> > then handling the task of finding and invoking the OS bootloader.  Since
> > all the hardware is emulated, Tianocore/EDK2-firmware isn't much
> > different from what it normally does.  I should also note this is fairly
> > slow.
> > 
> > Despite sharing the codebase, Tianocore/EDK2 as bootloader is very
> > different from being HVM firmware.  In particular the arm64
> > Tianocore/EDK2 configuration is "ArmVirtPkg/ArmVirtXen.dsc" and the build
> > creates the file "XEN_EFI.fd".  Once built the domain configuration is
> > along the lines of:
> > 
> > type = "pvh"
> > name = "somename"
> > kernel = "XEN_EFI.fd"
> > memory = 256
> > vcpus = 2
> > vif = [ "somenet" ]
> > disk = [ "somedisk" ]
> > 
> > The result is a PVH domain with Tianocore/EDK2 functioning as a pure
> > bootloader.  In particular it is capable of searching for its preferred
> > filesystem, then looking for an appropriate filename and then loading
> > that using the UEFI protocol.  The result is near-ideal.
> > 
> > Of note I'm pretty sure Tianocore/EDK2-bootloader would happily load
> > EFI-GRUB.  More importantly though OS bootloaders which can handle UEFI
> > work perfectly in this setup.  I expect this to be superior for *BSD.
> > 
> > There are two problems with Tianocore/EDK2-bootloader though.  First, is
> > the aforementioned unresolved bug.  Second, this is only implemented for
> > aarch64 (arm64).
> 
> Anthony has done the work for OVMF to work on x86 PVH domains, maybe
> he can provide more information about how to set it up and test.

I've run into mentions of this, but I've yet to see anything working.  I
really hope for something very similar to "ArmVirtXen.dsc" as that is
nearly perfect.

IMNSHO calling all x86 output files "OVMF.fd" was quite unhelpful.
Problem is "OVMF" can refer to any one of 3-5+ build configurations
causes quite a bit of confusion.  I distinctly prefer the "XEN_EFI.fd" as
the filename itself hints at what it is.

> > This is a problem for all the paravirtualized bootloaders.  They're all
> > single-architecture, despite the bootloader supporting multiple
> > architectures.  On that single-architecture they're quite good, but Xen
> > really needs them on *all* their architectures.
> > 
> > 
> > I didn't get the chance to finish my suggestion during the call, so here
> > is what I wanted to suggest:
> > 
> > I think the Xen Project really needs some effort aimed at the
> > paravirtualized bootloaders.  Mostly making them operable on all
> > architectures they support.
> > 
> > Paravirtualized GRUB is needed for ARM, RISC-V and PowerPC.
> > 
> > I don't believe Tianocore/EDK2 supports PowerPC, but I would really hope
> > for it to become available for RISC-V and x86.
> > 
> > While U-Boot is difficult to deal with, it would be valuable as a second
> > paravirtualized bootloader for PowerPC.
> > 
> > Once those 3 were available on their applicable architecture it would be
> > time to purge PyGRUB.  While I imagine this will take a while I think it
> > should be on the roadmap/panciled in for the future.
> 
> In my opinion, it's naive to expect this plan to be realized without
> any developer effort behind it from your side.  Leaving aside whether
> it's the right call from a technical prospective, I don't think it's
> fair to come to an Open Source community, drop a multi-project
> multi-architecture plan, and expect others to simply start crunching
> on it because "it's the right thing to do".
> 
> Most of us already have very thigh deadlines and internal projects by
> our employers, and that's always going to take priority.  And then
> with whatever little "free" time we have, we might have other goals
> and tasks that prefer to pursuit.
> 
> In other words, I think if you want to see this making progress you
> either have to work on it yourself, or pay some developer(s) to do the
> work.

My goal is to provide a recommendation of where effort should be focussed
and provide insight into what most users want.

I'm presently trying to get another OS on Xen/ARM and figure I should
finish that before taking on other things.  Perhaps I may try to see how
difficult being cross-architecture is for GRUB next.  I'm doing what I
can, but my bandwidth is very limited.

(yes, I know everyone says that; just be glad you almost certainly lack
my type of life challenge)


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



