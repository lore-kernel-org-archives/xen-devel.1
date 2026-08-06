Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AC2C56208
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 13:21:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384730.1627520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wry1t-0007Fl-KP; Thu, 06 Aug 2026 13:21:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384730.1627520; Thu, 06 Aug 2026 13:21:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wry1t-0007Fe-HC; Thu, 06 Aug 2026 13:21:01 +0000
Received: by outflank-mailman (input) for mailman id 1384730;
 Thu, 06 Aug 2026 13:20:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1wry1r-0007FY-Lt
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 13:20:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wry1r-0080BL-0A;
 Thu, 06 Aug 2026 13:20:58 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wry1q-0077Km-1L;
 Thu, 06 Aug 2026 13:20:58 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=V9I8wN3vFwmrsijFohcDbSfGEb54X0VqpVhd06JB0DM=; b=qbMm5RDrShyacGJPQC/eUzRe/i
	A0EkPoJZYyKhST4ZbttF7Bg4jeSIRTNKG1BAcYpqOb/2PWTkdhip11i1NBGFnypffvhfix1swWVza
	hYJS9BVTMS8mw9oUOJlpD1zDSoSMpDv3uHnE0G/B42cOR9YefLYIVlMIAeHwXCLpTmjA=;
Date: Thu, 6 Aug 2026 15:20:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH] xen/vpci: allow unaligned accesses by the hardware domain
Message-ID: <anSKL_v4KByCgltV@macbook.local>
References: <20260806110401.19615-1-roger@xenproject.org>
 <c510770f-33e5-4b85-a52b-67bb776fb70c@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c510770f-33e5-4b85-a52b-67bb776fb70c@citrix.com>

On Thu, Aug 06, 2026 at 12:48:12PM +0100, Andrew Cooper wrote:
> On 06/08/2026 12:04 pm, Roger Pau Monne wrote:
> > It's possible for domains to generate unaligned PCI config space accesses
> > when using ECAM, and hence vPCI should support those at least for the
> > hardware domain.  Such unaligned accesses to the PCI config space have been
> > reported to come from ACPI logic.
> 
> By this, I presume you mean AML from the DSDT/SSDT ?

That's my understanding yes, I can't confirm whether it's from the
DSDST/SSDT or maybe one of the OEM tables.

> Misaligned ECAM accesses have undefined behaviour.  On a particular
> platform this probably means implementation defined, and for an access
> wholly within a single devices CFG window it might even work.  But,
> misaligning allows you to have one access hitting two devices, and this
> really can't be a good thing.

Well, for the hardware domain I merely wanted to replay the access,
but it's true that for access control (that we still do in the
hardware domain case) an access targeting two different devices would
require extra checking that we don't do.

I think it's possibly best to not relax the check in
vpci_access_allowed() as much as I did, and refuse cross-device
accesses.

> I presume "fix your BIOS" isn't on the cards, even if it would be for
> the greater good?

I don't know really, maybe it's possible to get this one fixed.  But
it's likely Xen would hit this again, and most people would attribute
the issue to Xen, because it works with plain Linux, but doesn't when
running as a hardware domain (as the unaligned access is ignored or
reads all 1s).

We have always said that for the hardware domain we would attempt to
get as less as possible in the way of it interacting with devices. I
think this is just one more instance of such avoidance of interference
from hardware domain accesses.

> >
> > Relax the checking in vpci_access_allowed() to allow such accesses for the
> > hardware domain, and fix the handling in pci_conf_{read,write}{16,32}() to
> > fulfill them using MMCFG.
> >
> > MMCFG regions are identity exposed to the hardware domain, and hence such
> > unaligned accesses can only come as a result of the host having MMCFG in the
> > first place, as otherwise MMCFG won't be exposed to the hardware domain
> > either.
> >
> > Reported-by: Jason Andryuk <jason.andryuk@amd.com>
> > Signed-off-by: Roger Pau Monné <roger@xenproject.org>
> > ---
> >  tools/include/xen-tools/common-macros.h | 2 ++
> >  xen/arch/x86/x86_64/pci.c               | 8 ++++----
> >  xen/drivers/vpci/vpci.c                 | 4 +++-
> >  3 files changed, 9 insertions(+), 5 deletions(-)
> >
> > diff --git a/xen/arch/x86/x86_64/pci.c b/xen/arch/x86/x86_64/pci.c
> > index 8d33429103b9..6298141c3ca7 100644
> > --- a/xen/arch/x86/x86_64/pci.c
> > +++ b/xen/arch/x86/x86_64/pci.c
> > @@ -26,7 +26,7 @@ uint8_t pci_conf_read8(pci_sbdf_t sbdf, unsigned int reg)
> >  
> >  uint16_t pci_conf_read16(pci_sbdf_t sbdf, unsigned int reg)
> >  {
> > -    if ( sbdf.seg || reg > 255 )
> > +    if ( sbdf.seg || reg > 255 || !IS_ALIGNED(reg, 2) )
> >      {
> >          uint32_t value;
> >  
> 
> Personally, I think this is making a bad situation worse.
> 
> Baring quirks (i.e. K10 era), there is never a case where we want to use
> the IO Ports when we've got ECAM.  Furthermore, on AMD systems when
> we're lacking ECAM we can still access Extended Config Space; something
> which Xen currently gets wrong in several ways.
> 
> The IO ports require a global spinlock in Xen, and then a global
> resource in hardware just to be able to translate the IO access back
> into the ECAM access we passed on originally.  i.e. from a safety
> non-interference point of view, you want to veto any use of the IO ports
> by Xen.
> 
> Xen needs to use ECAM, and only fall back to IO Ports if we think there
> isn't ECAM covering the target sbdf.  This will cause (mis)alignment to
> get fixed automatically.  It will also be a substantial perf boost in
> the general case; all the MSI/MSI-X editing we do (far too frequently)
> is in Legacy Config Space just uses IO Ports.

I've wondered the same myself for some time, but I was also a bit
puzzled by Linux using the same approach, and preferring the IO ports
for accesses to the non-extended space.

Overall I think we would widen the hardware domain accesses _before_
ahead of switching PCI accesses to prefer ECAM over IO ports.  So that
the former can be backported without depending on the latter.

Thanks, Roger.

