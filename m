Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284DACA9ED0
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 16:08:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446477.1662590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGIZ4-0004AV-Pg; Mon, 12 Oct 2026 16:07:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446477.1662590; Mon, 12 Oct 2026 16:07:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGIZ4-0004AO-MG; Mon, 12 Oct 2026 16:07:50 +0000
Received: by outflank-mailman (input) for mailman id 1446477;
 Mon, 12 Oct 2026 16:07:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xGIZ2-0004AI-Qw
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 16:07:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xGIZ2-00000001o3q-3XWr
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 16:07:48 +0000
Received: from mail-lj1-f178.google.com ([209.85.208.178])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xGIZ2-0000000HT88-0WyR
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 16:07:48 +0000
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-3a75f960be3so18594481fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 09:07:48 -0700 (PDT)
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
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:Cc
	:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
	bh=8ncPgslNiNqkxP2CDhkltwMZWX45x9XZsA1CUpG25C0=; b=JvmuYdX03MSWNmw/kbtyIdrpa1
	v2ygCQyXa49JGID7cnhM7fnU+93VZt6ExF2jXfG1qnipZM7CYRShwqTzMufW7JFipod3HJ0TdxQ6d
	EMXjtiBdqwi4H4DTxUCPPkJ4G5McMrwwc3H81wdcx1nN5LIQ8Vm8je6RE8cvTVl3uhCY=;
X-Forwarded-Encrypted: i=1; AKwUvBz1Cyjg/bxMt+F+ecrxFQ8gNHd4c1RYMSQmledDjDTaH+1ngZvdTKp+MLD7ukpj8G2Lo8ZJrjLbKlg=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLo70j3mI9r90pDsHnpcG1X355g/6oYTvc5Lup+wC9BHJgNkpH/
	TD7X81lyiubMXW8cpF0Zaiizay6nufdRIVxYtkgaKYRSGeTOjhgiBHbdG1d0hFMwOcfi2gEJ9JW
	oyTFRSz0F5KX9mo/OkPH1t4a/7M/H2fo=
X-Received: by 2002:a2e:a58d:0:b0:3a9:926c:c276 with SMTP id
 38308e7fff4ca-3a9c53808fcmr22686631fa.17.1791821267291; Mon, 12 Oct 2026
 09:07:47 -0700 (PDT)
MIME-Version: 1.0
References: <20261007104051.48841-1-gwd@xenproject.org> <20261007104051.48841-9-gwd@xenproject.org>
 <8514b7b6-cf1c-44d9-827c-675fd5a6708e@suse.com>
In-Reply-To: <8514b7b6-cf1c-44d9-827c-675fd5a6708e@suse.com>
From: George Dunlap <gwd@xenproject.org>
Date: Mon, 12 Oct 2026 17:07:34 +0100
X-Gmail-Original-Message-ID: <CAFLBxZYOHGDbp_=rBP0aRd9J3LJ-B79zpt4B9LQyjKQiWjb6ig@mail.gmail.com>
X-Gm-Features: AclHuK8XpG1UKDIhUjMyuSao_joQaIosu8BwgX2tQGdNbHdUb4nbW6hz9nsTVyY
Message-ID: <CAFLBxZYOHGDbp_=rBP0aRd9J3LJ-B79zpt4B9LQyjKQiWjb6ig@mail.gmail.com>
Subject: Re: [PATCH v3 08/18] x86/domain_page: prepare the mapcache for
 per-vCPU accounting
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 2:48=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
> > @@ -54,6 +60,55 @@ static inline struct vcpu *mapcache_current_vcpu(voi=
d)
> >      return ACCESS_ONCE(this_cpu(pgtable_vcpu));
> >  }
> >
> > +/*
> > + * The accounting for v's mapcache: the domain's, with *dcache set so =
the
> > + * caller takes the domain-wide lock and TLB-epoch machinery into acco=
unt.
> > + */
> > +static struct mapcache *vcpu_mapcache(struct vcpu *v,
> > +                                      struct mapcache_domain **dcache)
> > +{
> > +    struct domain *d =3D v->domain;
> > +
> > +    *dcache =3D &d->arch.pv.mapcache;
> > +    return &(*dcache)->cache;
> > +}
>
> This function only retrieves data. Can't its first parameter therefore be
> pointer-to-const?

Currently that's true; but in a further patch, it may be
&v->arch.mapcache.cache, which is in the vcpu structure itself,
effectively stripping off the const-ness by pointing to individual
fields in a struct.

>
> > @@ -74,12 +130,12 @@ void *map_domain_page(mfn_t mfn)
> >  #endif
> >
> >      v =3D mapcache_current_vcpu();
> > -    if ( !v || !is_pv_vcpu(v) )
> > +    if ( !v )
> >          return mfn_to_virt(mfn_x(mfn));
>
> I don't quite understand why this is_pv_vcpu() is okay to drop. What
> mapcache_current_vcpu() returns isn't what it ran is_pv_vcpu() on. (Same
> in unmap_domain_page() then, obviously.)

So mapcache_current_vcpu() is a bit weird; the actual invariant is,
"Return the vcpu whose cache structure we should use if present; or
NULL if there's no cache structure to check and no need to sync."  So
if pgtable_vcpu is HVM, return NULL and just use the raw address,
because at this point in the series, both HVM and the idle domain have
full directmaps; if pgtable_vcpu is PV, then maybe sync, and then
return the result of the sync.  That may be a PV domain with a
mapcache, or an idle domain with no mapcache, but in either case you
can then read cache.inuse to see if there's something there.

So yes, it's a different vCPU; but it's still defined in such a way to
be safe to check cache.inuse.  The only possible value *change* after
a sync is the idle domain; I don't think we need to do another check
to make sure it's still a PV domain.

In fact, there's an argument that we should modify
mapcache_current_vcpu() to take pointers to dcache, and vcache, and
return just cache; that gets rid of v as a local variable of
map_domain_page entirely, and makes the logic ("get the cache we
should use") more clean, and gets rid of one mfn_to_virt() instance.
That would require some non-trivial changes, so I'd rather avoid that,
but I can do it if you want.

> > @@ -249,15 +294,23 @@ void mapcache_domain_init(struct domain *d)
> >  int mapcache_vcpu_init(struct vcpu *v)
> >  {
> >      struct domain *d =3D v->domain;
> > -    struct mapcache_domain *dcache =3D &d->arch.pv.mapcache;
> > +    struct mapcache_domain *dcache;
> > +    struct mapcache *cache;
> >      unsigned long i;
> > -    unsigned int ents =3D d->max_vcpus * MAPCACHE_VCPU_ENTRIES;
> > -    unsigned int nr =3D PFN_UP(BITS_TO_LONGS(ents) * sizeof(long));
> > +    unsigned int ents, nr;
> >
> > -    if ( !is_pv_vcpu(v) || !dcache->inuse )
> > +    if ( !has_mapcache(v) )
> >          return 0;
> >
> > -    if ( ents > dcache->entries )
> > +    cache =3D vcpu_mapcache(v, &dcache);
> > +    if ( !cache->inuse )
> > +        /* Domain-wide mapcache disabled (fully direct-mapped build). =
*/
> > +        return 0;
>
> While technically not wrong, this comment appears to be quite a bit
> forward-looking.

Yes; I'll drop the last bit.

>
> > +    ents =3D d->max_vcpus * MAPCACHE_VCPU_ENTRIES;
> > +    nr =3D PFN_UP(BITS_TO_LONGS(ents) * sizeof(long));
>
> Is there a reason these cannot be the initializers of their variables
> anymore?

No reason.  I'll put them back.

 -George

