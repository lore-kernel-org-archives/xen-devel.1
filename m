Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA18EC79FB9
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 11:39:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414498.1644287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4d6y-0004Rp-EW; Thu, 10 Sep 2026 11:38:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414498.1644287; Thu, 10 Sep 2026 11:38:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4d6y-0004Ri-Av; Thu, 10 Sep 2026 11:38:36 +0000
Received: by outflank-mailman (input) for mailman id 1414498;
 Thu, 10 Sep 2026 11:38:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dunlapg@umich.edu>) id 1x4d6w-0004Rc-8T
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 11:38:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4d6v-008BdD-7I
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 13:38:33 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dunlapg@umich.edu>)
 id 6aa296a7-2eae-0a2a0a5409dd-0a2a45019c48-32
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 13:38:31 +0200
Received: from [13.59.128.245] (helo=basilisk.relay-egress.a.mail.umich.edu)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dunlapg@umich.edu>)
 id 6aa296b5-5984-0a2a45010019-0d3b80f5e31a-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 13:38:30 +0200
Received: from cordial-tupilaq.authn-relay.a.mail.umich.edu
 (ip-10-0-73-96.us-east-2.compute.internal [10.0.73.96])
 by basilisk.relay-egress.a.mail.umich.edu with ESMTPS
 id 6AA296B5.337C4C5.729CAEA9.1701253; Thu, 10 Sep 2026 07:38:29 -0400
Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com
 [74.125.229.204])
 by cordial-tupilaq.authn-relay.a.mail.umich.edu with ESMTPSA
 id 6AA296B4.10DD2037.4E91A78D.2839006;
 Thu, 10 Sep 2026 07:38:28 -0400
Received: by mail-lf2-f12.google.com with SMTP id
 2adb3069b0e04-5b5e4f15b79so1312191e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 04:38:28 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=relay-2 header.d=umich.edu header.i="@umich.edu" header.h="References:In-Reply-To:From:Date:Subject:To:Cc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umich.edu;
	s=relay-2; t=1789040308;
	bh=O1wsA7wGqDjmamx2IH3bm5PBs1QQcrppf5iIAV+mFCo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=i6nDXHhopu45EJSjVXoMHk8QvDdCGhJ5yQKUP+UoBTfv6pi//mMNuA7JmRsjABS1K
	 MwACY4fHv1hG3/OlSBHxQXaeJ1jKSfoNExzKjSQLiAjfoJFwn6OYRtACgl/dQ5Lw9g
	 6QMg05OIZA16kjjU/Tl5mbtzGN9mnGjkYu7AhqBnQEcoM8WdDdCJYngi7KA11AsKp5
	 D92fHMLuVaeBoUkyDb2KjJhc1ZgzcFo314ZAnOZulrFz2NsK8PwlZcwTDQpcr9zG8w
	 aI0rKlQO7D9vrWLXMlXC2jqu3tzsqwpwCgqOasHF6zBIqx53KXFG+IOQ9DpH+U0olK
	 inAcKn7VZam6A==
Authentication-Results: cordial-tupilaq.authn-relay.a.mail.umich.edu; 
	iprev=pass policy.iprev=74.125.229.204 (mail-lf2-f12.google.com);
	auth=pass smtp.auth=dunlapg
X-Forwarded-Encrypted: i=1; AKwUvBwnmVTg33bszZAaSGNcsy7Dl8sqo7AiBiqYOV3oI6FyUiw6jAD/N1Avrg+W+jokCGGMombQSMhTdFM=@lists.xenproject.org
X-Gm-Message-State: AFuF++lMwIWisajZqHjepm4sb5mPl+mz7vX36WGeYPsriDM/L3Ag57//
	lJ8sGYtnxHePQ/XuilD5AHS/sUV8x67zqMsHTASbPYgu/wkk4COA3kvrnqfwjVhtsgIsWrnaDgb
	du2tTrDs37x6d0p4WTa+xtNLAYhmRO/U=
X-Received: by 2002:a05:6512:1382:b0:5b4:74a2:cf2e with SMTP id
 2adb3069b0e04-5b8986f670amr2952889e87.21.1789040306043; Thu, 10 Sep 2026
 04:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
 <20260901-asi-part2-9-ecc269f268b7@xenproject.org> <97a420e4-87d3-4600-b169-8ec7e5f62a21@suse.com>
In-Reply-To: <97a420e4-87d3-4600-b169-8ec7e5f62a21@suse.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Thu, 10 Sep 2026 12:38:13 +0100
X-Gmail-Original-Message-ID: <CAFLBxZY0pRUamfukXd5BewKbft_Rc=Z_y5YxyUqVq8wz-SAAOQ@mail.gmail.com>
X-Gm-Features: AcwNN1WNz44TJK66fHkv25sw9vuf5ft3DR78OsHCnoRoCd9T9va45dBwTa59XmM
Message-ID: <CAFLBxZY0pRUamfukXd5BewKbft_Rc=Z_y5YxyUqVq8wz-SAAOQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/14] x86/mm: prepare destroy_perdomain_mapping() for
 per-vCPU perdomain areas
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Alejandro Vallejo <agarciav@amd.com>, Teddy Astie <teddy.astie@vates.tech>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d62444/1789040311-1DE78757-E79AD0A6/0/0
X-purgate-type: clean
X-purgate-size: 4374

On Tue, Sep 8, 2026 at 4:36=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 02.09.2026 11:43, George Dunlap wrote:
> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -6456,10 +6456,11 @@ void populate_perdomain_mapping(const struct vc=
pu *v, unsigned long va,
> >      local_irq_restore(irq_flags);
> >  }
> >
> > -void destroy_perdomain_mapping(struct domain *d, unsigned long va,
> > +void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
> >                                 unsigned int nr)
> >  {
> >      const l3_pgentry_t *l3tab, *pl3e;
> > +    const struct domain *d =3D v->domain;
> >
> >      ASSERT(va >=3D PERDOMAIN_VIRT_START &&
> >             va < PERDOMAIN_VIRT_SLOT(PERDOMAIN_SLOTS));
> > @@ -6468,6 +6469,26 @@ void destroy_perdomain_mapping(struct domain *d,=
 unsigned long va,
> >      if ( !d->arch.perdomain_l3_pg )
> >          return;
> >
> > +    if ( likely(this_cpu(pgtable_vcpu) =3D=3D v) )
>
> Right now this looks to be relevant only to some of the call sites of
> pv_destroy_ldt(). I expect this is going to change down the road?

It doesn't look like it, actually; I suspect Roger just added it for
consistency's sake (all perdomain functions take a vcpu, so they can
all use the linear pagetable).

> > +    {
> > +        l1_pgentry_t *pl1e;
> > +
> > +        /*
> > +         * Fast path: v's page-tables are loaded on this pCPU, so the =
L1
> > +         * entries can be zapped using the recursive linear mappings.
> > +         */
> > +        pl1e =3D &__linear_l1_table[l1_linear_offset(va)];
> > +
> > +        for ( ; nr--; pl1e++ )
> > +        {
> > +            if ( perdomain_l1e_needs_freeing(*pl1e) )
> > +                free_domheap_page(l1e_get_page(*pl1e));
> > +            l1e_write(pl1e, l1e_empty());
> > +        }
> > +
> > +        return;
> > +    }
> > +
> >      l3tab =3D __map_domain_page(d->arch.perdomain_l3_pg);
> >      pl3e =3D l3tab + l3_table_offset(va);
>
> The slow path is resilient against an area never having been mapped. This
> fast path looks like it would crash on a missing L2 or L1 table. I.e. for
> domain cleanup (and error handling during domain creation) we'd
> implicitly rely on those never taking the fast path. May be worth making
> explicit in the description.

If we keep the fast path, it's probably worth making it resilient
against empty paths, just to save ourselves time in the future.

On the other hand, I'm not terribly attached to the fast path; it can
only really be used for the guest-driven LDT teardown, which isn't a
hot path.  I'm as happy to rip it out.

> > --- a/xen/arch/x86/pv/domain.c
> > +++ b/xen/arch/x86/pv/domain.c
> > @@ -319,8 +319,7 @@ static int pv_create_gdt_ldt_l1tab(struct vcpu *v)
> >
> >  static void pv_destroy_gdt_ldt_l1tab(struct vcpu *v)
> >  {
> > -    destroy_perdomain_mapping(v->domain, GDT_VIRT_START(v),
> > -                              1U << GDT_LDT_VCPU_SHIFT);
> > +    destroy_perdomain_mapping(v, GDT_VIRT_START(v), 1U << GDT_LDT_VCPU=
_SHIFT);
> >  }
>
> Considering what patch 08 does - is this explicit call really needed?
> There are no pages to free here, unlike ...
>
> > --- a/xen/arch/x86/x86_64/mm.c
> > +++ b/xen/arch/x86/x86_64/mm.c
> > @@ -738,7 +738,7 @@ int setup_compat_arg_xlat(struct vcpu *v)
> >
> >  void free_compat_arg_xlat(struct vcpu *v)
> >  {
> > -    destroy_perdomain_mapping(v->domain, ARG_XLAT_START(v),
> > +    destroy_perdomain_mapping(v, ARG_XLAT_START(v),
> >                                PFN_UP(COMPAT_ARG_XLAT_SIZE));
> >  }
>
> ... here. Then again even the freeing is taken care of by
> free_perdomain_mappings(), so even for this one the question arises
> whether it's actually needed.

It looks like this one is needed for the "undo_and_fail" path of
xen/arch/x86/pv/domain.c:switch_compat(); in theory the vcpu could
continue as a 64-bit vcpu afterwards.

But yes, given that we're allowing "free" to subsume "destroy", we
could just make that the policy, and drop a bunch of other redundant
calls as well.  Right now there's only the one, but by the end of the
series there are a handful more that we could refrain to add.

I'm inclined to drop the linear map use, and also drop
pv_destroy_gdt_l1tab().  Any thoughts?

 -George

