Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F50CA9ED1
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 14:19:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446407.1662537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGGsJ-0001nr-6Z; Mon, 12 Oct 2026 14:19:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446407.1662537; Mon, 12 Oct 2026 14:19:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGGsJ-0001ni-39; Mon, 12 Oct 2026 14:19:35 +0000
Received: by outflank-mailman (input) for mailman id 1446407;
 Mon, 12 Oct 2026 14:19:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xGGsI-0001nZ-4m
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 14:19:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xGGsI-00000001ljI-0UOk
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 14:19:33 +0000
Received: from mail-lj1-f170.google.com ([209.85.208.170])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xGGsH-0000000EZpx-1g6J
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 14:19:33 +0000
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-3a76ac0bdafso33213981fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 07:19:33 -0700 (PDT)
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
	bh=OJpYti+KUGIKerN53VbQAQ7qCAsOUc2SuCJoTjHPgh4=; b=rNtrsZe01npOeU34mA2YgAS9gP
	mDgCFKKpSRhK5vZfpgtCzt+qGlxVIJPhbvPjCrcxMAuRGWi2EAO9aXAkaVRnFb2kKKRErHLOPo45m
	5t6YGBzU76Ooh9+ep5pObnMAJsi8220cVh2cnN6qmnXsKCb80lbg3a6Fun/7kkqo4g0M=;
X-Gm-Message-State: AFq9FYJRyh0VHG+PWOaPfs/ebjRbbgFvcBvDTRW5JHRsJzWrWxG02h2U
	62tUvtfs3yyny8eFNvKvj41EhZDosUQ+WF5UE257WdhhsUUVfAsysWcaRnIhxRWchBxlvjaE4G2
	6s/45gtpnTPSRZXnWt0MyJ6gF7iSbuhE=
X-Received: by 2002:a05:651c:2121:b0:3a9:dd56:bc59 with SMTP id
 38308e7fff4ca-3a9dd56c399mr11765121fa.13.1791814772596; Mon, 12 Oct 2026
 07:19:32 -0700 (PDT)
MIME-Version: 1.0
References: <20261007104051.48841-1-gwd@xenproject.org> <20261007104051.48841-9-gwd@xenproject.org>
 <asdSqe9KC_J3OLpv@Mac.lan>
In-Reply-To: <asdSqe9KC_J3OLpv@Mac.lan>
From: George Dunlap <gwd@xenproject.org>
Date: Mon, 12 Oct 2026 15:19:20 +0100
X-Gmail-Original-Message-ID: <CAFLBxZZvxdEKw7kxC3u+gL1-JfY=CZ1Zcha3YX06fecL3snzkw@mail.gmail.com>
X-Gm-Features: AclHuK-NUJ_k07Y-NqxnQI-MFEC6aUQa4nL0z37ZB0XtbYRj00ZdEPBt8zY31uo
Message-ID: <CAFLBxZZvxdEKw7kxC3u+gL1-JfY=CZ1Zcha3YX06fecL3snzkw@mail.gmail.com>
Subject: Re: [PATCH v3 08/18] x86/domain_page: prepare the mapcache for
 per-vCPU accounting
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 9:22=E2=80=AFAM Roger Pau Monn=C3=A9 <roger@xenproje=
ct.org> wrote:
>
> On Wed, Oct 07, 2026 at 11:40:41AM +0100, George Dunlap wrote:
> > From: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >
> > Currently, only PV domains have a mapcache, which is domain-wide one.
> > In preparation for enabling per-vCPU mapcaches for HVM domains, split
> > the accounting out into a struct mapcache, embedded in struct
> > mapcache_domain.
> >
> > Introduce has_mapcache(), for whether a vCPU has a mapcache, and
> > vcpu_mapcache(), which returns the accounting for a vCPU's mapcache
> > and, in *dcache, the domain-wide mapcache whose lock and TLB epoch the
> > caller has to take into account.  For now has_mapcache() is
> > is_pv_vcpu(), and vcpu_mapcache() always returns the domain's
> > accounting.  map_domain_page() and unmap_domain_page() stop repeating
> > the is_pv_vcpu() check mapcache_current_vcpu() has made.
> >
> > Move map_domain_page()'s handling of the domain-wide lock and TLB epoch
> > into three helpers: mapcache_lock() takes the lock and catches up with
> > a wrap another vCPU caused, mapcache_new_epoch() starts a new epoch
> > after a wrap, and mapcache_unlock() drops the lock.  A per-vCPU
> > mapcache can then skip them without map_domain_page() being
> > re-indented.
> >
> > struct mapcache_domain keeps its size (40 bytes, x86_64 debug build),
> > and so do the structures containing it.
> >
> > No functional change.
> >
> > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8, C=
laude Code:claude-opus-5-5
> > Signed-off-by: George Dunlap <gwd@xenproject.org>
> > ---
> > Changes in v3:
> > - New in this version, split out of "x86/hvm: introduce per-vCPU
> >   mapcache for vCPU-PT domains" for review.
> > ---
> >  xen/arch/x86/domain_page.c        | 155 ++++++++++++++++++++----------
> >  xen/arch/x86/include/asm/domain.h |  19 ++--
> >  2 files changed, 116 insertions(+), 58 deletions(-)
> >
> > diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
> > index 9119f735f5..5d90f77bed 100644
> > --- a/xen/arch/x86/domain_page.c
> > +++ b/xen/arch/x86/domain_page.c
> > @@ -18,17 +18,23 @@
> >  #include <asm/hardirq.h>
> >  #include <asm/setup.h>
> >
> > +/*
> > + * Whether v has a mapcache: PV vCPUs (whose domain-wide mapcache may =
still be
> > + * disabled, see mapcache_domain_init()).  HVM vCPUs reach everything =
through
> > + * the directmap, which covers all physical address space for them.
>
> I've been wondering whether there could be a way to write this comment
> so that it doesn't need rewording once we switch to per-vCPU
> mapcaches, as to avoid adding a comment here that will very likely be
> completely re-worded by a later change in the series.  However I
> cannot find anything much better rather than stripping most of the
> comment content.

I think describing it the way it is, then changing it, makes the
series or the state thereof more clear.  But I'm not precious about
it; we could make it something like this:

/*
 * Whether v may use a mapcache rather than the directmap (a PV domain's
 * mapcache may still be disabled, see mapcache_domain_init()).
 */

That said, as a meta-comment: We have a limited amount of time on my
contract, and also a limited amount of time before we want to check
this in to the tree.  Is spending our time changing non-functional
intermittent git tree state really what you want to spend that time
on?

>
> > + */
> > +static bool has_mapcache(const struct vcpu *v)
> > +{
> > +    return is_pv_vcpu(v);
> > +}
> > +
> >  static inline struct vcpu *mapcache_current_vcpu(void)
> >  {
> >      struct vcpu *v =3D this_cpu(pgtable_vcpu);
> >      struct vcpu *curr =3D current;
> >
> > -    /*
> > -     * During early boot pgtable_vcpu is not set, callers must handle =
NULL.
> > -     * Non-PV domains don't have a mapcache, the directmap covers all =
physical
> > -     * address space.
> > -     */
> > -    if ( !v || !is_pv_vcpu(v) )
> > +    /* During early boot pgtable_vcpu is not set, callers must handle =
NULL. */
> > +    if ( !v || !has_mapcache(v) )
> >          return NULL;
> >
> >      /*
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
> > +
> > +/*
> > + * The domain-wide mapcache's lock and TLB-epoch machinery, taken arou=
nd
> > + * allocating a slot: the domain's vCPUs share the mapcache's slots, a=
nd each
> > + * catches up with a wrap another one caused, flushing its TLB if it h=
as not
> > + * been flushed since.
>
> Thinking forward about how this function will end up looking when we
> have per-vCPU map caches, do you maybe want to place this comment
> inside the function body itself?
>
> I expect per-vCPU splitting will add a short-circuit at the top of the
> function that will skip taking the lock or doing the flushing, and
> hence the comment won't need shuffling around?

Yup, we can do this.

> > + */
> > +static void mapcache_lock(struct mapcache_domain *dcache,
>
> Maybe mapcache_enter() would be a better suited name once there's no
> longer a need to take a lock for the mapcache?  Just wondering, no
> strong opinion really (the more that I don't even know how the code
> will end up looking yet).

Yeah, can do that.

> > +/* A wrap has just flushed this CPU's TLB: start a new epoch. */
> > +static void mapcache_new_epoch(struct mapcache_domain *dcache,
> > +                               struct mapcache_vcpu *vcache)
> > +{
>
> Since this is now a function on its own, I would possibly assert that
> dcache->lock is taken on entry.
>
> Let me know what you think of the suggestions above, overall I think
> the logic is fine.

Great, thanks.
 -George

