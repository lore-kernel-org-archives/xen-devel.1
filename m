Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538FB606A32D
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2026 20:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O/0RBDlT
Received: from list by lists.xenproject.org with outflank-mailman.1458577.1670726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJzQF-0007L2-PY; Thu, 22 Oct 2026 20:29:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458577.1670726; Thu, 22 Oct 2026 20:29:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJzQF-0007Kv-N3; Thu, 22 Oct 2026 20:29:59 +0000
Received: by outflank-mailman (input) for mailman id 1458577;
 Thu, 22 Oct 2026 20:29:58 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1xJzQE-0007Kp-Nk
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 20:29:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJzQE-00868r-4t
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 22:29:58 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6ada720f-bab6-0a2a0a5309dd-0a2a450ce994-22
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 22:29:57 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6ada7244-f479-0a2a450c0019-aceafc1fa712-3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 22:29:57 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id AAB66415FA;
 Thu, 22 Oct 2026 20:29:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DAE31F01825;
 Thu, 22 Oct 2026 20:29:54 +0000 (UTC)
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
	s=k20260515; t=1792700995;
	bh=v5+K7DRtyEH4BLjRULC+nucWCN08JsEjn4ywlxNdoPM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=O/0RBDlTACAEE0ZZdetxJ44VV27g17aAIDGLkw4l6A268+YjlijdyDflHwt4WYK8Z
	 qhF6H0iQzbZrD5RXk8I1tu+HSgvYjtT+OsXkpuqPHIWrO9GSESd13SkO+YVe+IJTGp
	 DcRdMd3FoyINPIHYVwsagCeRxDYyiWxopPEfFHUHV/RNVs5zheJE8iJRBkl1UPWsKC
	 lBQPEanVYvfT4UWp8lsbPg6wDYkXdsrWLp+ND9+0Yaj7i3r9lQn40z0lvpExNxlUyS
	 egv6zb1jTRk/FC9FNxSqYL09S7lFjZmc1JYaNYDtA6Drgm2mnPyYPsWII9yW64LQxG
	 cdLLTopoaA+rA==
Date: Thu, 22 Oct 2026 13:29:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Ross Lagerwall <ross.lagerwall@citrix.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org, jbeulich@suse.com, roger@xenproject.org, 
    jason.andryuk@amd.com, teddy.astie@vates.tech
Subject: Re: [PATCH] xen/x86/svm: Apply the virtual-8086 IOPL check to INT
 n only
In-Reply-To: <192c430b-565b-4b89-957b-01b80ede9049@citrix.com>
Message-ID: <2f51c577-86b9-2d20-2032-f9d56b344f47@kernel.org>
References: <20261020224123.3710391-1-stefano.stabellini@amd.com> <86d6b7b5-41f2-41b4-8710-7356c78fd15e@citrix.com> <192c430b-565b-4b89-957b-01b80ede9049@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1519767978-1792700995=:4086347"
X-purgate-ID: tlsNG-d25034/1792700997-774D7A5B-E4FCEDFB/0/0
X-purgate-type: clean
X-purgate-size: 4439
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1519767978-1792700995=:4086347
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 22 Oct 2026, Andrew Cooper wrote:
> On 22/10/2026 2:55 pm, Ross Lagerwall wrote:
> > On 10/20/26 11:41 PM, Stefano Stabellini wrote:
> >> In virtual-8086 mode with IOPL < 3, INT n raises #GP(0).  INT1, INT3
> >> and INTO are not affected. They are delivered normally.
> >>
> >> svm_emul_swint_injection() applies the check to all of them, so an ICEBP
> >> raises #GP instead of #DB.  It also reports the IDT entry in the #GP
> >> error code instead of 0.
> >>
> >> Limit the check to INT n and use error code 0.
> >>
> >> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> >> ---
> >>   xen/arch/x86/hvm/svm/svm.c | 5 ++++-
> >>   1 file changed, 4 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> >> index 71e48351f2..df74531d1a 100644
> >> --- a/xen/arch/x86/hvm/svm/svm.c
> >> +++ b/xen/arch/x86/hvm/svm/svm.c
> >> @@ -1153,9 +1153,12 @@ static void svm_emul_swint_injection(struct
> >> x86_event *event)
> >>        * 32bit OS.  Someone with many TUITs can see about reading the
> >> TSS
> >>        * Software Interrupt Redirection bitmap.
> >>        */
> >> -    if ( (regs->eflags & X86_EFLAGS_VM) &&
> >> +    if ( type == X86_ET_SW_INT && (regs->eflags & X86_EFLAGS_VM) &&
> >>            MASK_EXTR(regs->eflags, X86_EFLAGS_IOPL) != 3 )
> >> +    {
> >> +        ec = 0;
> >>           goto raise_exception;
> >> +    }
> >>         /*
> >>        * Read all 8/16 bytes so the idtr limit check is applied
> >> properly to
> >
> > I think this is correct. The check could perhaps move earlier to avoid
> > needing
> > to reset ec to 0.
> >
> > I do wonder though if there are other cases in the function where ec
> > needs to
> > be reset to 0? The pseudocode in the APM seems to have at least one
> > other case.
> 
> I confirmed, and indeed it is #GP[0] not #GP[sel].  Also that
> ICEBP/INT3/INTO are not subject IOPL like this.
> 
> I agree with Ross that this wants moving earlier; between the CR0.PE
> check and deciding idte_size.  The comment also wants adjusting, so I
> think it wants to look like this:
> 
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index 71e48351f22c..c83b28d29727 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -1140,6 +1140,17 @@ static void svm_emul_swint_injection(struct
> x86_event *event)
>      if ( !(vmcb_get_cr0(vmcb) & X86_CR0_PE) )
>          goto raise_exception; /* TODO: support real-mode injection? */
>  
> +    /*
> +     * In vm86 mode, INT $N is subject to IOPL.
> +     *
> +     * TODO: It is also subject to CR4.VME=1, which would require
> reading the
> +     * TSS Software Interrupt Redirection bitmap.
> +     */
> +    if ( type == X86_ET_SW_INT &&
> +         regs->eflags & X86_EFLAGS_VM &&
> +         MASK_EXTR(regs->eflags, X86_EFLAGS_IOPL) != 3 )
> +        goto raise_exception;
> +
>      idte_size   = lm ? 16 : 8;
>      idte_offset = trap * idte_size;
>  
> @@ -1147,16 +1158,6 @@ static void svm_emul_swint_injection(struct
> x86_event *event)
>      ec = (trap << 3) | X86_XEC_IDT |
>           (type == X86_ET_PRIV_SW_EXC ? X86_XEC_EXT : 0);
>  
> -    /*
> -     * TODO: This does not cover the v8086 mode with CR4.VME case
> -     * correctly, but falls on the safe side from the point of view of a
> -     * 32bit OS.  Someone with many TUITs can see about reading the TSS
> -     * Software Interrupt Redirection bitmap.
> -     */
> -    if ( (regs->eflags & X86_EFLAGS_VM) &&
> -         MASK_EXTR(regs->eflags, X86_EFLAGS_IOPL) != 3 )
> -        goto raise_exception;
> -
>      /*
>       * Read all 8/16 bytes so the idtr limit check is applied properly to
>       * this entry, even though we don't look at all the words read.
> 
> 
> I'm happy to adjust this on commit if you're happy?

Yes please, thank you!
--8323329-1519767978-1792700995=:4086347--

