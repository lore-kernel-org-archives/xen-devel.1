Return-Path: <SRS0=/qc5=AK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A73C433E0
	for <xen-devel@archiver.kernel.org>; Mon, 29 Jun 2020 14:46:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 325EE23E1F
	for <xen-devel@archiver.kernel.org>; Mon, 29 Jun 2020 14:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 325EE23E1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpv3R-0004vK-MJ; Mon, 29 Jun 2020 14:46:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wPAo=AK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jpv3Q-0004vD-8W
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 14:46:40 +0000
X-Inumbo-ID: 56df2604-ba17-11ea-857e-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 56df2604-ba17-11ea-857e-12813bfff9fa;
 Mon, 29 Jun 2020 14:46:39 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: NUIbpoPidLvbe6vd9Hw53G5sKnXaPO9SlrVG3ivZgrzxmTubZlXaYt+Ue0l8qxl1t7rkNYRokF
 B0RItiOwfDndvqCl/JGAn2GDumgPrFC6SMpbUTBNNZqdwe+W5PHV/XmtCYUCaVJ7MWFjqwEmXu
 o0GIuGeCRUSVUzG56d+AgWCIaF/FHMjinkC49eTlPVHZtX3rObNu3SDO084muEpPMUKPcykXVd
 Rmeety77IJaT5eXYl71H7ynqtAPm5yy5y8fY0UC0S3vrb45eV4ZXMygI31Kc4fiT99/+OFGJry
 rJI=
X-SBRS: 2.7
X-MesageID: 21177427
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,295,1589256000"; d="scan'208";a="21177427"
Date: Mon, 29 Jun 2020 16:46:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH for-4.14 8/8] x86/hvm: enable emulated PIT for PVH dom0
Message-ID: <20200629144632.GI735@Air-de-Roger>
References: <20200612155640.4101-1-roger.pau@citrix.com>
 <20200612155640.4101-9-roger.pau@citrix.com>
 <88a91a26-1ad8-bf85-d55e-4fc29afaf554@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <88a91a26-1ad8-bf85-d55e-4fc29afaf554@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, paul@xen.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jun 18, 2020 at 06:05:21PM +0200, Jan Beulich wrote:
> On 12.06.2020 17:56, Roger Pau Monne wrote:
> > Some video BIOS require a PIT in order to work properly, hence classic
> > PV dom0 gets partial access to the physical PIT as long as it's not in
> > use by Xen.
> > 
> > Since PVH dom0 is built on top of HVM support, there's already an
> > emulated PIT implementation available for use. Tweak the emulated PIT
> > code so it injects interrupts directly into the vIO-APIC if the legacy
> > PIC (i8259) is disabled. Make sure the GSI used matches the ISA IRQ 0
> > in the likely case there's an interrupt overwrite in the MADT ACPI
> 
> Same nit again as for the earlier patch (also applicable to a code
> comment below).
> 
> > @@ -578,7 +579,7 @@ int arch_domain_create(struct domain *d,
> >  
> >      emflags = config->arch.emulation_flags;
> >  
> > -    if ( is_hardware_domain(d) && is_pv_domain(d) )
> > +    if ( is_hardware_domain(d) )
> >          emflags |= XEN_X86_EMU_PIT;
> 
> Wouldn't this better go into create_dom0(), where all the other
> flags get set? Or otherwise all of that be moved here (to cover
> the late-hwdom case)?

I've just moved all setting of the emulation_flags to
arch_domain_create so it's done at the same place for PV and PVH.

> > --- a/xen/arch/x86/hvm/vioapic.c
> > +++ b/xen/arch/x86/hvm/vioapic.c
> > @@ -268,7 +268,14 @@ static void vioapic_write_redirent(
> >  
> >      spin_unlock(&d->arch.hvm.irq_lock);
> >  
> > -    if ( is_hardware_domain(d) && unmasked )
> > +    if ( is_hardware_domain(d) && unmasked &&
> > +         /*
> > +          * A PVH dom0 can have an emulated PIT that should respect any
> > +          * interrupt overwrites found in the ACPI MADT table, so we need to
> > +          * check to which GSI the ISA IRQ 0 is mapped in order to prevent
> > +          * identity mapping it.
> > +          */
> > +         (!has_vpit(d) || gsi != hvm_isa_irq_to_gsi(d, 0)) )
> 
> Isn't has_vpit() true now for Dom0, and hence that part of the
> condition is kind of pointless?

Well, yes, but I think we should strive for the code to be prepared to
deal with both vPIT enabled or disabled, and hence shouldn't make
assumptions.

> And shouldn't Dom0 never have seen
> physical IRQ 0 in the first place (we don't allow PV Dom0 to use
> that IRQ either, after all)?

Yes, that will fail in map_domain_pirq, so a PVH dom0 won't be able to
bind IRQ 0 anyway.

Roger.

