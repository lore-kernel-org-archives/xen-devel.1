Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B70606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 00:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RqKTWFij
Received: from list by lists.xenproject.org with outflank-mailman.1493452.1693427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTTzi-0007lf-GX; Wed, 18 Nov 2026 00:57:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493452.1693427; Wed, 18 Nov 2026 00:57:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTTzi-0007lY-Dg; Wed, 18 Nov 2026 00:57:50 +0000
Received: by outflank-mailman (input) for mailman id 1493452;
 Wed, 18 Nov 2026 00:57:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1xTTzh-0007l8-1g
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 00:57:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTTzf-003aVX-Vt
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 01:57:47 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6afcf79a-e002-0a2a0a5209dd-0a2a4504ae34-44
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 01:57:47 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6afcf80a-b57f-0a2a45040019-ac6904fee588-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 01:57:47 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id DEE4C60E1F;
 Wed, 18 Nov 2026 00:57:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C55101F000C4;
 Wed, 18 Nov 2026 00:57:44 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794963465;
	bh=d6YUzrkqlgDPZWL16p5ylNcYkSVpNicrSLe3dybUiJ8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=RqKTWFij4zc8PWBxLSYH6II+U+mtsjTz5eptdP0lhLWUWVAxztpMOmj5YTqTbZaj9
	 jMQyBRd/MIKlE67bM6ASWUcHsER1tgOwHcDbKtI8pmRHAvwgsD2eJSu2gxuXT0lNUF
	 nyLK2OvOFepKrHb4pIymIxG3eRxDbK8gfUJbW+TuezGO7w1vWE1EY0UwzhNu5RWZ5g
	 G1M722wv7uw31RUEcxOqwGLu2yxrYCTL34RoT6xbYeAuTLG0dEzdcQkJsrwT2+LNC0
	 9AXCqPuhqkJnohpxxTQyxGnFT+is26nfIUxHXSeYxiQlXSZQf4GkW0RmLS89uyVe4P
	 cro7Rx7Ri2eXA==
Date: Tue, 17 Nov 2026 16:57:43 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
To: "Grall, Julien" <julien@xen.org>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/4] xen/arm: guest_walk: refuse an address outside both
 halves of the range
In-Reply-To: <52856dac-7f48-4ecb-be5a-5479260f6d03@xen.org>
Message-ID: <56dad23b-4988-5a0d-b722-d934e511aa8e@kernel.org>
References: <20261107021442.253612-1-stefano.stabellini@amd.com> <20261107021442.253612-2-stefano.stabellini@amd.com> <52856dac-7f48-4ecb-be5a-5479260f6d03@xen.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-ebf023/1794963467-50CDFB50-62AD36DC/0/0
X-purgate-type: clean
X-purgate-size: 2641
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 7 Nov 2026, Grall, Julien wrote:
> Hi Stefano,
> 
> On 07/11/2026 02:14, Stefano Stabellini wrote:
> > The bits of an input address from its top bit (bit 63, or bit 55 with
> > the top byte ignored) down to the input address size must be all 0 for
> > TTBR0 and all 1 for TTBR1, else the walk faults (ARM DDI 0487A.k
> > J1.1.5). guest_walk_ld() chose the base from the top bit alone and
> 
> Similar to your first patch, the specification is quite old. Please quote a
> more recent one (e.g. M.d).
> 
> > translated such an address. Refuse it before reading any table.
> > 
> > Fixes: 7d623b358a45 ("arm/mem_access: Add long-descriptor based gpt")
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > Cc: Julien Grall <julien@xen.org>
> > Cc: Bertrand Marquis <bertrand.marquis@arm.com>
> > Cc: Michal Orzel <michal.orzel@amd.com>
> > Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> > ---
> >   xen/arch/arm/guest_walk.c | 9 +++++++++
> >   1 file changed, 9 insertions(+)
> > 
> > diff --git a/xen/arch/arm/guest_walk.c b/xen/arch/arm/guest_walk.c
> > index e23457869b..a8f8530683 100644
> > --- a/xen/arch/arm/guest_walk.c
> > +++ b/xen/arch/arm/guest_walk.c
> > @@ -407,6 +407,15 @@ static bool guest_walk_ld(const struct vcpu *v,
> >           if ( (input_size > TCR_EL1_IPS_48_BIT_VAL) ||
> >                (input_size < TCR_EL1_IPS_MIN_VAL) )
> >               return false;
> > +
> > +        /*
> > +         * The bits of the GVA from the top bit down to the input size must
> > +         * all be 0 for TTBR0 and all 1 for TTBR1, or the translation
> > faults
> > +         * (ARM DDI 0487A.k AArch64.TranslationTableWalk(), J1.1.5).
> > +         */
> 
> Regardless what I wrote above, I checked the algorithm in A.k and I can't find
> the logic suggesting for a fault. Instead it seems to be:
> 
> 
> if inputaddr<top> == '0' then
>   inputsize = 64 - UInt(TCR_EL1.T0SZ);
>   [...]
> else
>   inputsize = 64 - UInt(TCR_EL1.T1SZ);
>   [...]
> 
> And this seems right to me because the be used for tagging. So they are not
> guarantee to be all 1s or all 0s. Can you point me to the part of the
> algorithm that says otherwise?

In M.d this is AArch64.VAIsOutOfRange() D8.2.4

The check comes a few lines later in each branch of
AArch64.TranslationTableWalk()
    
    basefound = ... && IsZero(inputaddr<top:inputsize>);   // TTBR0
    basefound = ... && IsOnes(inputaddr<top:inputsize>);   // TTBR1

and !basefound raises a level 0 Translation fault. top is AddrTop(),
which is 55 when TBI is set, so the tag bits are not checked.

