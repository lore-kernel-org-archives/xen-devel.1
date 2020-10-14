Return-Path: <SRS0=XJfI=DV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60139C433DF
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2020 01:38:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C225621D7B
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2020 01:38:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C225621D7B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.6427.17124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSVjM-0004kb-IJ; Wed, 14 Oct 2020 01:37:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6427.17124; Wed, 14 Oct 2020 01:37:28 +0000
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
	id 1kSVjM-0004kU-Db; Wed, 14 Oct 2020 01:37:28 +0000
Received: by outflank-mailman (input) for mailman id 6427;
 Wed, 14 Oct 2020 01:37:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qloZ=DV=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kSVjL-0004kP-TH
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 01:37:27 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6fdb012f-978f-4f81-8b27-e75e994412a8;
 Wed, 14 Oct 2020 01:37:26 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09E1b7TA098708
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 13 Oct 2020 21:37:13 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 09E1b6tR098707;
 Tue, 13 Oct 2020 18:37:06 -0700 (PDT) (envelope-from ehem)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qloZ=DV=m5p.com=ehem@srs-us1.protection.inumbo.net>)
	id 1kSVjL-0004kP-TH
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 01:37:27 +0000
X-Inumbo-ID: 6fdb012f-978f-4f81-8b27-e75e994412a8
Received: from mailhost.m5p.com (unknown [74.104.188.4])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 6fdb012f-978f-4f81-8b27-e75e994412a8;
	Wed, 14 Oct 2020 01:37:26 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09E1b7TA098708
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 13 Oct 2020 21:37:13 -0400 (EDT)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.15.2/8.15.2/Submit) id 09E1b6tR098707;
	Tue, 13 Oct 2020 18:37:06 -0700 (PDT)
	(envelope-from ehem)
Date: Tue, 13 Oct 2020 18:37:06 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        xen-devel@lists.xenproject.org, Alex Benn??e <alex.bennee@linaro.org>,
        bertrand.marquis@arm.com, andre.przywara@arm.com,
        Julien Grall <jgrall@amazon.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 0/4] xen/arm: Unbreak ACPI
Message-ID: <20201014013706.GA98635@mattapan.m5p.com>
References: <20200926205542.9261-1-julien@xen.org>
 <CAA93ih3-gTAEzV=yYS-9cHGyN9rfAC28Xeyk8Gsmi7D2BS_OWQ@mail.gmail.com>
 <1a7b5a14-7d21-b067-a80b-27d963f9798a@xen.org>
 <alpine.DEB.2.21.2010121157350.10386@sstabellini-ThinkPad-T480s>
 <20201012213451.GA89158@mattapan.m5p.com>
 <alpine.DEB.2.21.2010131759270.10386@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2010131759270.10386@sstabellini-ThinkPad-T480s>

On Tue, Oct 13, 2020 at 06:06:26PM -0700, Stefano Stabellini wrote:
> On Mon, 12 Oct 2020, Elliott Mitchell wrote:
> > I'm on different hardware, but some folks have setup Tianocore for it.
> > According to Documentation/arm64/acpi_object_usage.rst,
> > "Required: DSDT, FADT, GTDT, MADT, MCFG, RSDP, SPCR, XSDT".  Yet when
> > booting a Linux kernel directly on the hardware it lists APIC, BGRT,
> > CSRT, DSDT, DBG2, FACP, GTDT, PPTT, RSDP, and XSDT.
> > 
> > I don't know whether Linux's ACPI code omits mention of some required
> > tables and merely panics if they're absent.  Yet I'm speculating the list
> > of required tables has shrunk, SPCR is no longer required, and the
> > documentation is out of date.  Perhaps SPCR was required in early Linux
> > ACPI implementations, but more recent ones removed that requirement?
> 
> I have just checked and SPCR is still a mandatory table in the latest
> SBBR specification. It is probably one of those cases where the firmware
> claims to be SBBR compliant, but it is not, and it happens to work with
> Linux.

Is meeting the SBBR specification supposed to be a requirement of running
Xen-ARM?

I don't seen any mention of such.
`find docs xen/arch/arm -type f -print0 | xargs -0 grep -eSBBR` produces
no output.

Perhaps you've been adding this as a presumptive requirement since
previously the only hardware capable of running Xen due to an
appropriately unlocked bootloader was SBBR compliant?  If so, it seems
time to either add this as an explicit requirement and document it, or
else remove this implicit requirement and start acting as such.

The Raspberry PI 4B has a UEFI implementation available which is based on
Tianocore.  No statement has been made of it qualifying as SBBR.  Yet it
is clearly mostly able to boot Xen, just this is exposing issues.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



