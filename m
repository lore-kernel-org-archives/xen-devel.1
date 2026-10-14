Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BFACC6B1A
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 12:31:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448935.1664915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGy8R-0000cA-CB; Wed, 14 Oct 2026 12:31:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448935.1664915; Wed, 14 Oct 2026 12:31:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGy8R-0000c3-85; Wed, 14 Oct 2026 12:31:07 +0000
Received: by outflank-mailman (input) for mailman id 1448935;
 Wed, 14 Oct 2026 12:31:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xGy8P-0000bx-FI
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 12:31:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xGy8P-000000052VO-1OVv
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 12:31:05 +0000
Received: from mail-lj1-f171.google.com ([209.85.208.171])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xGy8O-00000004lvl-2XPP
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 12:31:05 +0000
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-3a1eb6fa0f4so42032221fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 05:31:04 -0700 (PDT)
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
	bh=1XoQ0iJcWS81MGA7D94FjGmXdVcFN4bgOM97NImPNq4=; b=gSAEHQKQ3SQV6o+2rKkvAdgL/Y
	X4PuhsWsCSEaIuN07pNqhIr0smqh1RqATKhe1tHobISXbe7OoVZ/dUKGooh70rDBs3sW/F4MCwTYl
	cj+DQ12FO/+WjSLs0VtoQ+Yt1Q4QTxYesff5au37qmTkrOjPpFjf0BgUWwVuVPT+ZZgs=;
X-Gm-Message-State: AFq9FYJhTTWnmDRKTeH6zscLRUYr/+76UfDgn5KGMhCPFhUnRvl2/WhB
	5JeSPobfINmNvvnRmhDeJvAqFIReN98+issA3fGkXT4afS0tBiDE9nKRaMIqbMVhCCjfPEz4VM1
	5hKOl/fwIHUVfeQuV/fIiwXqs2MhVCjc=
X-Received: by 2002:a05:651c:198f:b0:3a7:812b:d1c with SMTP id
 38308e7fff4ca-3a9c4844a20mr36797111fa.0.1791981063805; Wed, 14 Oct 2026
 05:31:03 -0700 (PDT)
MIME-Version: 1.0
References: <20261007104051.48841-1-gwd@xenproject.org> <20261007104051.48841-15-gwd@xenproject.org>
 <asfmGUr17vgaXmYk@Mac.lan>
In-Reply-To: <asfmGUr17vgaXmYk@Mac.lan>
From: George Dunlap <gwd@xenproject.org>
Date: Wed, 14 Oct 2026 13:30:51 +0100
X-Gmail-Original-Message-ID: <CAFLBxZZsYZEG1h1A8d4A=i7yK3_R=yMcCEAUwDTeax3Ec4UKUw@mail.gmail.com>
X-Gm-Features: AclHuK9thxVo-ndJBU-izWzLPQObYaEocYNCCH4qOVkts_0e5UsZPX1F1bbgaE8
Message-ID: <CAFLBxZZsYZEG1h1A8d4A=i7yK3_R=yMcCEAUwDTeax3Ec4UKUw@mail.gmail.com>
Subject: Re: [PATCH v3 14/18] x86/domain_page: key the directmap fast paths on
 the loaded view
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 7:51=E2=80=AFPM Roger Pau Monn=C3=A9 <roger@xenproje=
ct.org> wrote:
>
> On Wed, Oct 07, 2026 at 11:40:47AM +0100, George Dunlap wrote:
> > map_domain_page() returns directmap addresses whenever it can: for any
> > MFN the directmap covers in release builds, and for vCPUs without a
> > mapcache.  Once guest contexts may run on the sparse view of the
> > directmap, modify this to take the fast path returning the directmap
> > address only when the full directmap is loaded.
> >
> > The release-build shortcut ahead of the vCPU lookup looks at the vCPU
> > whose page-tables are loaded, without completing a lazy context
> > switch: if that vCPU is not on the sparse view, its page-tables map
> > the page through the directmap, and completing the switch would only
> > move the CPU to the idle vCPU's page-tables, which map it too.
> >
> > mapcache_current_vcpu() may complete the lazy context switch
> > (sync_local_execstate()) and switch us onto the idle vCPU (which has a
> > full view), so check again if we can use the directmap afterwards.
> >
> > A vCPU on the sparse view always has a mapcache: HVM ones through
> > per-vCPU page-tables, PV ones through the domain-wide mapcache, which
> > mapcache_domain_init() now sets up for a domain using the sparse view i=
n
> > release builds too, rather than only when the directmap does not cover
> > all memory.
> >
> > map_domain_page_global() mappings must be valid in every context: use
> > vmap() for all of them once a sparse view is configured, as
> > arch_mfns_in_directmap() then says.
> >
> > Add d->arch.sparse_dmap and sparse_dmap_active for this; nothing sets
> > them yet.
> >
> > No functional change.
> >
> > Assisted-by: Claude Code:claude-opus-5-5
> > Signed-off-by: George Dunlap <gwd@xenproject.org>
> > ---
> > Changes in v3:
> > - New in this version.
> > ---
> >  xen/arch/x86/domain_page.c                  | 44 +++++++++++++++++++--
> >  xen/arch/x86/include/asm/domain.h           |  6 +++
> >  xen/arch/x86/include/asm/sparse-directmap.h |  8 ++++
> >  xen/arch/x86/sparse-directmap.c             |  1 +
> >  4 files changed, 56 insertions(+), 3 deletions(-)
> >
> > diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
> > index 0500bb9dba..48f85b670d 100644
> > --- a/xen/arch/x86/domain_page.c
> > +++ b/xen/arch/x86/domain_page.c
> > @@ -61,6 +61,16 @@ static inline struct vcpu *mapcache_current_vcpu(voi=
d)
> >      return ACCESS_ONCE(this_cpu(pgtable_vcpu));
> >  }
> >
> > +/*
> > + * Whether the directmap in @v's page-tables is the sparse view, which=
 maps
> > + * none of the heap's memory beyond the xenheap: the mapcache must ser=
ve
> > + * every mapping then.
> > + */
> > +static bool on_sparse_dmap(const struct vcpu *v)
> > +{
> > +    return sparse_dmap_active && v->domain->arch.sparse_dmap;
> > +}
> > +
> >  /*
> >   * The accounting for v's mapcache: its own for a vCPU-PT domain, the =
domain's
> >   * otherwise, in which case *dcache is set so the caller takes the dom=
ain-wide
> > @@ -142,17 +152,39 @@ void *map_domain_page(mfn_t mfn)
> >
> >  #ifdef NDEBUG
> >      if ( mfn_x(mfn) <=3D PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
> > -        return mfn_to_virt(mfn_x(mfn));
> > +    {
> > +        const struct vcpu *pt_vcpu =3D this_cpu(pgtable_vcpu);
> > +
> > +        /*
> > +         * The page-tables loaded map @mfn through the directmap, unle=
ss they
> > +         * carry the sparse view.  Don't complete a lazy context switc=
h to
> > +         * find out: it would only move this CPU to the idle vCPU's
> > +         * page-tables, which map @mfn too.
> > +         */
> > +        if ( !pt_vcpu || !on_sparse_dmap(pt_vcpu) )
> > +            return mfn_to_virt(mfn_x(mfn));
> > +    }
> >  #endif
> >
> > +    /* No vCPU (early boot), or no mapcache: the full directmap is loa=
ded. */
> >      v =3D mapcache_current_vcpu();
> >      if ( !v )
> >          return mfn_to_virt(mfn_x(mfn));
> >
> > +#ifdef NDEBUG
> > +    /* The lookup may have completed a lazy switch off the sparse view=
. */
> > +    if ( !on_sparse_dmap(v) &&
> > +         mfn_x(mfn) <=3D PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
> > +        return mfn_to_virt(mfn_x(mfn));
> > +#endif
> > +
> >      cache =3D vcpu_mapcache(v, &dcache);
> >      vcache =3D &v->arch.mapcache;
> >      if ( !cache->inuse )
> > +    {
> > +        ASSERT(!on_sparse_dmap(v));
> >          return mfn_to_virt(mfn_x(mfn));
> > +    }
> >
> >      perfc_incr(map_domain_page_count);
> >
> > @@ -307,7 +339,9 @@ void mapcache_domain_init(struct domain *d)
> >      ASSERT(is_pv_domain(d));
> >
> >  #ifdef NDEBUG
> > -    if ( !mem_hotplug && max_page <=3D PFN_DOWN(__pa(HYPERVISOR_VIRT_E=
ND - 1)) )
> > +    /* Not needed when the directmap loaded for the domain covers ever=
ything. */
> > +    if ( !d->arch.sparse_dmap && !mem_hotplug &&
> > +         max_page <=3D PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
> >          return;
> >  #endif
> >
> > @@ -392,8 +426,12 @@ void *map_domain_page_global(mfn_t mfn)
> >               system_state < SYS_STATE_active) ||
> >              local_irq_is_enabled()));
> >
> > +    /*
> > +     * Global mappings must hold in every context: a sparse view of th=
e
> > +     * directmap rules the directmap out.
> > +     */
> >  #ifdef NDEBUG
> > -    if ( mfn_x(mfn) <=3D PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
> > +    if ( arch_mfns_in_directmap(mfn_x(mfn), 1) )
> >          return mfn_to_virt(mfn_x(mfn));
> >  #endif
> >
> > diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/a=
sm/domain.h
> > index 80415ab2c2..76a22b4040 100644
> > --- a/xen/arch/x86/include/asm/domain.h
> > +++ b/xen/arch/x86/include/asm/domain.h
> > @@ -499,6 +499,12 @@ struct arch_domain
> >       */
> >      bool vcpu_pt;
> >
> > +    /*
> > +     * Root page-tables carry the sparse view of the directmap, once i=
t is
> > +     * active (see asm/sparse-directmap.h).
> > +     */
> > +    bool sparse_dmap;
>
> What do you mean with "once it is active"?  Either a domain is using
> the sparse direct map or not, but it shouldn't have an external
> dependency on anything.  Or maybe I'm reading the comment the wrong
> way.

I've reworded it.

> > +/*
> > + * Set once guest contexts run on the sparse view: from then on, the r=
oot
> > + * page-tables of domains with d->arch.sparse_dmap carry it.
> > + */
> > +extern bool sparse_dmap_active;
>
> Shouldn't sparse_dmap_active be opt_sparse_dmap_pv ||
> opt_sparse_dmap_hvm?  I'm afraid I don't understand the point of
> tracking whether there are domain using the sparse direct map or not,
> that's already tracked by d->arch.sparse_dmap?

Yeah, sparse_dmap_active was originally meant to be used to shortcut
certain things when no domains were using the sparse directmap; but it
hasn't turned out to be needed.  I'll remove it.

 -George

