Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F922606A320
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 21:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L3HJ2mXd
Received: from list by lists.xenproject.org with outflank-mailman.1497099.1695372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9dw-00085d-Rn; Thu, 19 Nov 2026 21:26:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497099.1695372; Thu, 19 Nov 2026 21:26:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9dw-00085W-P7; Thu, 19 Nov 2026 21:26:08 +0000
Received: by outflank-mailman (input) for mailman id 1497099;
 Thu, 19 Nov 2026 21:26:07 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xU9dv-00085Q-2z
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 21:26:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU9du-00DOal-8N
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 22:26:06 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6aff6953-e002-0a2a0a5209dd-0a2a450282d0-16
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 22:26:06 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6aff696c-4900-0a2a45020019-ac6904fec646-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 22:26:05 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 4154461D7A;
 Thu, 19 Nov 2026 21:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E714F1F000C6;
 Thu, 19 Nov 2026 21:26:02 +0000 (UTC)
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
	s=k20260515; t=1795123564;
	bh=oOB7NGgwpmXr9XveR+rUam/iyDz8lLON7QSm12+grcA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=L3HJ2mXdKlVMtr7ZQLrPzCzVSbg4ivF4nuno4E1SbmXMtqZbLX8pwfByztec+pgwZ
	 4wj2+uT6KCRioGpB8aGEXPbxbfrj1hszcMBMRVi2kYrFqnSKzDcICjSCFBzXKl1uyO
	 WMt/KG4UagoXERt7HF/o8XiMALihp38b0AY2v9OeKfEi8CtxPzRalGik9cUXIw/Ux4
	 4S7sg0h3DdX4MT4ScsU1uPg7onhRNBPOzLcBBnbKZ3IGbxC5TFgp1m5rCrfrsIVosu
	 JXe4Fxq21IE8O5H1+H5DN10SVsimQa5XfYxBV7gqdO/QXdqSO8h3FHddWk5mJ8WYM8
	 5t0h8VP2MiJsA==
Date: Thu, 19 Nov 2026 13:26:01 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
    Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/vlapic: accept a logical destination of all ones
 as a broadcast
In-Reply-To: <8dade36e-0051-4ecb-8f49-07a156dd8b90@suse.com>
Message-ID: <2bc00e72-edca-29b1-1dcb-229fd618bcfd@kernel.org>
References: <20261117233700.2654525-1-stefano.stabellini@amd.com> <8dade36e-0051-4ecb-8f49-07a156dd8b90@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1409766954-1795123563=:2648157"
X-purgate-ID: tlsNG-720697/1795123566-F9D296C6-96303E89/10/78276251493
X-purgate-type: spam
X-purgate-size: 3327
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1409766954-1795123563=:2648157
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 19 Nov 2026, Jan Beulich wrote:
> On 18.11.2026 00:36, Stefano Stabellini wrote:
> > In logical destination mode, a destination of all ones is a broadcast
> > accepted by every local APIC: 0xff in xAPIC mode, in both the flat and
> > the cluster model (AMD APM vol. 2, "Receiving System and IPI
> > Interrupts"), and 0xffffffff in x2APIC mode (AMD APM vol. 2, "x2APIC
> > Interrupt Command Register (ICR) Operations").
> > 
> > vlapic_match_logical_addr() treated these as ordinary logical
> > destinations, so a broadcast reached only the vLAPICs whose logical ID
> > happened to match it. In particular, a vLAPIC whose logical ID is 0
> > received no logical broadcast at all.
> > 
> > Check for the broadcast in vlapic_match_dest() before telling the two
> > destination modes apart, as was already done for physical destinations.
> > A vLAPIC whose destination format register names neither model now
> > also accepts the broadcast.
> > 
> > Fixes: f9e0cccf7b35 ("x86/HVM: fix ID handling of x2APIC emulation")
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > ---
> > CC: Jan Beulich <jbeulich@suse.com>,
> > CC: Andrew Cooper <andrew.cooper3@citrix.com>,
> > CC: Roger Pau Monné <roger@xenproject.org>,
> > CC: Teddy Astie <teddy.astie@vates.tech>
> > 
> > v2:
> >  - Check for the broadcast once in vlapic_match_dest(), before the two
> >    destination modes are told apart, rather than in each model of
> >    vlapic_match_logical_addr() (Jan). As a result, a logical broadcast
> >    now also matches a vLAPIC whose DFR names neither model.
> >  - Cite the AMD APM by section title (Jan).
> >  - Add Fixes: tags.
> > 
> >  xen/arch/x86/hvm/vlapic.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> > index 6698779e22..50b515d254 100644
> > --- a/xen/arch/x86/hvm/vlapic.c
> > +++ b/xen/arch/x86/hvm/vlapic.c
> > @@ -247,10 +247,12 @@ bool vlapic_match_dest(
> >      switch ( short_hand )
> >      {
> >      case APIC_DEST_NOSHORT:
> > +        /* All ones is a broadcast in either destination mode. */
> > +        if ( dest == _VLAPIC_ID(target, 0xffffffffU) )
> 
> Turns out a very similar patch (referencing the SDM rather than the APM)
> was sent before, and Andrew pointed out an issue there [1]: This needs to
> use the sender, not the receiver, to determine whether broadcast is meant.
> 
> Jan
> 
> [1] https://lore.kernel.org/xen-devel/95e0e0fb-2978-4c87-b723-fb7c30f36883@citrix.com/

I'll send out a new patch to address this



> > +            return true;
> >          if ( dest_mode )
> >              return vlapic_match_logical_addr(target, dest);
> > -        return (dest == _VLAPIC_ID(target, 0xffffffffU)) ||
> > -               (dest == VLAPIC_ID(target));
> > +        return dest == VLAPIC_ID(target);
> >  
> >      case APIC_DEST_SELF:
> >          return (target == source);
> 
--8323329-1409766954-1795123563=:2648157--

