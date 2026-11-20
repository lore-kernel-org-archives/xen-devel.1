Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D878606A698
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 21:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fy5lV18V
Received: from list by lists.xenproject.org with outflank-mailman.1498510.1696208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUWP8-0003KQ-99; Fri, 20 Nov 2026 21:44:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1498510.1696208; Fri, 20 Nov 2026 21:44:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUWP8-0003KJ-69; Fri, 20 Nov 2026 21:44:22 +0000
Received: by outflank-mailman (input) for mailman id 1498510;
 Fri, 20 Nov 2026 21:44:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1xUWP6-0003KD-Jz
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 21:44:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUWP5-006iRO-K7
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 22:44:19 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6b00bf2a-bab6-0a2a0a5309dd-0a2a450caa42-12
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 22:44:19 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6b00bf32-f479-0a2a450c0019-aceafc1fdd18-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 22:44:19 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 52E6A460D7;
 Fri, 20 Nov 2026 21:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DD2F1F000C4;
 Fri, 20 Nov 2026 21:44:16 +0000 (UTC)
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
	s=k20260515; t=1795211057;
	bh=kDISY4VAC5GFRBnSgFwtRVI4dWnmsVhITbm2QNwVPEo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Fy5lV18VzXl4igZ6WZWjuhBgy7XGA5U6v3kbBacMvf2EBoNO1PRQXrAdLRM9WHYH3
	 1A/6XQuVjApCkyAVLLyaoGM3BM4VdWZWLJOKzPwC69QX0/Qmk9rtzV0UIUT4GXOi4S
	 sMLhYO8OdJDKUt5B9QHWtpm/vwzP5DvJcmop7b9oIAWbCCvubPtkqwYLKnXsKER+as
	 MKdwQJEDI0FHGeIb8FqXkQp8uL73KSLT86ZY9037PchVAsgWZcSEKEr1+Cdu5Y3CRY
	 2cqQQbUju3PHMDRR4K00sUuzcpM/72jL1WbBD+ZywdqwSlcMskTtNUeRVNxzFhEax5
	 1g88HV3OO+0tw==
Date: Fri, 20 Nov 2026 13:44:15 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
To: Jan Beulich <jbeulich@suse.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Teddy Astie <teddy.astie@vates.tech>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    sstabellini@kernel.org
Subject: Re: [PATCH] x86/vLAPIC: only accept interrupts on enabled LAPICs
In-Reply-To: <3e566ae4-1a90-4d0f-8edd-2349a40e0b52@suse.com>
Message-ID: <c21c3ecf-4ab5-7efb-b8a3-002d1c1ffc49@kernel.org>
References: <fcf0446e-3511-4dfc-b1dd-1445f29ec815@suse.com> <5458b651-cb26-4b20-b39d-6bb75dfb684b@citrix.com> <3e566ae4-1a90-4d0f-8edd-2349a40e0b52@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-d25034/1795211059-51538A5B-68510E7A/0/0
X-purgate-type: clean
X-purgate-size: 1671
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 19 Nov 2026, Jan Beulich wrote:
> On 19.11.2026 13:49, Andrew Cooper wrote:
> > On 19/11/2026 12:18 pm, Jan Beulich wrote:
> >> --- a/xen/arch/x86/include/asm/hvm/vlapic.h
> >> +++ b/xen/arch/x86/include/asm/hvm/vlapic.h
> >> @@ -136,6 +136,6 @@ struct vlapic *vlapic_lowest_prio(
> >>  
> >>  bool vlapic_match_dest(
> >>      const struct vlapic *target, const struct vlapic *source,
> >> -    int short_hand, uint32_t dest, bool dest_mode);
> >> +    unsigned int short_hand, uint32_t dest, bool dest_mode, unsigned int dm);
> >>  
> > 
> > Even before this change, I was thinking that 3 fragments of ICR were too
> > many parameters to be passing, especially as some are bits as per their
> > ICR position, but dest_mode is shifted down to bit 0.
> > 
> > I think passing a real ICR pair will be an improvement both for
> > legibility and for code generation.
> 
> Are you saying this with just two of the three uses in vlapic.c in mind,
> or did you mean to suggest to have all the other call sites end up more
> complicated to achieve this goal?

Only the IPI paths have an ICR, and even there the destination has to be
decoded in the sender's mode first. The vIO-APIC, MSI and passthrough
callers would have to build a fake ICR.

On the patch itself:


default: needs fallthrough;

In _hvm_dpci_msi_eoi() if the guest EOIs after disabling its LAPIC in
software, the match now fails and the physical EOI is left to eoi_timer.
This is a change compared to existing behavior, was this intended?


This patch is better than my "[PATCH 2/2] x86/passthrough: skip disabled
vLAPICs in vector_hashing_dest()". I'll drop it.

