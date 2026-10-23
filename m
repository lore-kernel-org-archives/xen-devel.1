Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E31606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 16:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=jH6+pz4d
Received: from list by lists.xenproject.org with outflank-mailman.1459497.1671384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKHpO-0001Pe-Ge; Fri, 23 Oct 2026 16:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1459497.1671384; Fri, 23 Oct 2026 16:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKHpO-0001PW-D7; Fri, 23 Oct 2026 16:09:10 +0000
Received: by outflank-mailman (input) for mailman id 1459497;
 Fri, 23 Oct 2026 16:09:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xKHpN-0001PQ-LA
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 16:09:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xKHpN-00000009Fgs-2UOe;
 Fri, 23 Oct 2026 16:09:09 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xKHpN-0000000H3aw-0xLQ;
 Fri, 23 Oct 2026 16:09:09 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=k4NuFaJuMGHlk1YPEjGjLvezdUzxDmoBNx76b7+Ic1g=; b=jH6+pz4dnBUcuIzOJm90aC10Qc
	4mbWWPpj6XPSKEpFvyZBUtIpcO37bOFP1Z2v8MbgPD8vXsJ2ssQfsu+U8eG/jBe9VZj8uYydmaABt
	CwSVyG506ETe4mWQYBDGORIuBkLLkSE4RobdbxKI6/X4BtmxmV3N7xmB79Rh5bL7p7KE=;
Date: Fri, 23 Oct 2026 18:09:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen/vcpu: ensure no write when runstate handler is NULL
Message-ID: <atuGoiwfOHdFUzUx@Mac.lan>
References: <20261023133316.64204-1-roger@xenproject.org>
 <f9ec6214-8c1e-4418-af5d-86d64e940f9e@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f9ec6214-8c1e-4418-af5d-86d64e940f9e@citrix.com>
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 04:46:42PM +0100, Andrew Cooper wrote:
> On 23/10/2026 2:33 pm, Roger Pau Monne wrote:
> > Both the normal and the compat versions of
> > VCPUOP_register_runstate_memory_area allow registering a NULL handler as a
> > way to signal deregistration of the previous area, and
> > update_runstate_area() will skip the update when the handler is NULL.
> >
> > However when handling the VCPUOP_register_runstate_memory_area hypercall
> > itself there's an unconditional attempt to update the newly registered
> > runstate area, without taking into account whether it points to NULL.  Skip
> > such update if the user-provided handle is NULL.
> >
> > Signed-off-by: Roger Pau Monné <roger@xenproject.org>
> > ---
> >  xen/arch/x86/x86_64/domain.c | 4 ++++
> >  xen/common/domain.c          | 4 ++++
> >  2 files changed, 8 insertions(+)
> >
> > diff --git a/xen/arch/x86/x86_64/domain.c b/xen/arch/x86/x86_64/domain.c
> > index a02d4f569ee5..e4d49cbbfeb6 100644
> > --- a/xen/arch/x86/x86_64/domain.c
> > +++ b/xen/arch/x86/x86_64/domain.c
> > @@ -58,6 +58,10 @@ compat_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
> >          rc = 0;
> >          guest_from_compat_handle(v->runstate_guest.compat, area.addr.h);
> >  
> > +        /* NULL handle is deregistering the address. */
> > +        if ( compat_handle_is_null(area.addr.h) )
> > +            break;
> > +
> >          if ( v == current )
> >          {
> >              XLAT_vcpu_runstate_info(&info, &v->runstate);
> > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > index 6b52713518da..30a17b8b7edb 100644
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -2330,6 +2330,10 @@ long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
> >          rc = 0;
> >          runstate_guest(v) = area.addr.h;
> >  
> > +        /* NULL handle is deregistering the address. */
> > +        if ( guest_handle_is_null(area.addr.h) )
> > +            break;
> > +
> >          if ( v == current )
> >          {
> >              __copy_to_guest(runstate_guest(v), &v->runstate, 1);
> 
> This is all horrible.
> 
> I think you ought to add /* Update the newly-registered runstate area,
> best-effort */ to both of these hunks.
> 
> I also think it would be easier to follow with the commit message
> structured in a different order.  I suggest:
> 
> --8<--
> The VCPUOP_register_runstate_memory_area hypercall tries to update the
> newly registered area, even when NULL is being registered.  If the guest
> happens to have memory mapped at 0 in the address space, this write will
> succeed.
> 
> Ever since it's introduction in Xen 3.0, NULL is the initial state of
> the pointer, and guards the update of the runstate area in
> context_switch().  NULL has also been accepted as an input to the hypercall.
> 
> It is unclear whether de-registration of the area was considered at the
> time, but the behaviour of the hypercall has always supported. 
> De-registering using NULL is a common pattern for other hypercalls, so
> formally make this the case for VCPUOP_register_runstate_memory_area by
> skipping the update if the area has been de-registered.
> --8<--
> 
> I think you also want an adjustment to the public header file to say
> that NULL can be used to de-register.
> 
> Thoughts?

LGTM, I will prepare v2 then, thanks a lot for the feedback.

Roger.

