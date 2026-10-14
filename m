Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51817CC6B1A
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 10:04:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448667.1664708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGvqT-0005TV-4y; Wed, 14 Oct 2026 10:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448667.1664708; Wed, 14 Oct 2026 10:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGvqT-0005TN-1W; Wed, 14 Oct 2026 10:04:25 +0000
Received: by outflank-mailman (input) for mailman id 1448667;
 Wed, 14 Oct 2026 10:04:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xGvqR-0005TH-3P
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 10:04:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xGvqR-00000004zsg-0hB6
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 10:04:22 +0000
Received: from mail-lf1-f50.google.com ([209.85.167.50])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xGvqQ-00000001NCQ-1mjt
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 10:04:22 +0000
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5ba3b1199f6so3519212e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 03:04:22 -0700 (PDT)
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
	bh=lVXr+Y5h+UxL9oAD7lAjVkU/fK4+zwKXtYToq+b5Ysc=; b=eugLahXt5Tv++s7ohn1yH+e4zF
	2Q6cLcTpeXG7YsECYc6fd22pVIo4OGrg4m3SX9rWA86wvaRVHhnxqC96foRfZoYBzGLPqyoN9S44B
	cJuNFmqvXwMTx/2GmPpbBY12yszIbCHxvWoPmpM+keo09yxPEejqNO+bZqg8TvgO3q0U=;
X-Gm-Message-State: AFq9FYIbU89Mfm7gHzZoS6AHdiCWJuGaKBW0v0nJIzKlwq9BhbTJFU9f
	JSJ1xoSLpCQT2DiEaE/iT47XPIgQ5B6D1SVLiYXIRw8TOBMp8x2Ste/kOhnGDe3ZLPHPCEZZb9d
	NLN6ODqlvorOk2NoUL/pAaJivBtlids0=
X-Received: by 2002:a05:6512:10d3:b0:5b8:99b1:fa26 with SMTP id
 2adb3069b0e04-5bcde6c08b5mr6248030e87.30.1791972261673; Wed, 14 Oct 2026
 03:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <20261007104051.48841-1-gwd@xenproject.org> <20261007104051.48841-14-gwd@xenproject.org>
 <asfapF7EdrW6t5RZ@Mac.lan>
In-Reply-To: <asfapF7EdrW6t5RZ@Mac.lan>
From: George Dunlap <gwd@xenproject.org>
Date: Wed, 14 Oct 2026 11:04:09 +0100
X-Gmail-Original-Message-ID: <CAFLBxZZvRA-60zreNOcnDvfP+O4a0=9B2mR1egyosu_H=tcN+A@mail.gmail.com>
X-Gm-Features: AclHuK8jBD1CXRqHTTU1zizhSob1lZUzhYClMG0wecr_hpkWdKahJHqhi3c86JE
Message-ID: <CAFLBxZZvRA-60zreNOcnDvfP+O4a0=9B2mR1egyosu_H=tcN+A@mail.gmail.com>
Subject: Re: [PATCH v3 13/18] x86/mm: build and maintain a sparse view of the directmap
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 7:02=E2=80=AFPM Roger Pau Monn=C3=A9 <roger@xenproje=
ct.org> wrote:
> >  - xenheap allocations are added, and taken out again before the pages
> >    are freed.  If that fails the pages stay mapped, and are leaked with
> >    a warning rather than reused (the same reasoning as in "xen/page_all=
oc:
> >    Add a path for xenheap when there is no direct map" of the directmap
> >    removal series);
>
> I would probably remove this last sentence, it doesn't add any
> meaningful information.

I assume you mean the parenthetical referring to the other patch -- I agree=
.

> >  - memory handed to the heap later (boot modules, .init, memory
> >    hot-add) is taken out, and is not handed over if that fails;
> >  - a PV dom0's initrd, assigned to dom0 in place, is taken out;
>
> I assume dom0 kernel memory is freed, and it doesn't need the same
> kind of special handling the initrd needs due to it being assigned in
> place.

Yes, that's correct.

> > alloc_xenheap_pages() accepts pages still awaiting scrubbing
> > (MEMF_no_scrub).  That is harmless while the directmap maps all memory
> > anyway, but the sparse view would make such a page's contents, a dying
> > domain's data for instance, reachable from every context on it until
> > overwritten.  With a sparse view configured, arch_xenheap_needs_scrub()
> > makes xenheap allocations scrub those pages first, as domain heap
> > allocations do; clean pages need nothing extra.
>
> There's another possible issue here I think: even when requesting
> scrubbed pages the allocator can decide to scrub them in-place,
> mapping them using map_domain_page().  Could this also cause concern,
> as Xen is mapping possibly sensitive data in a context that's not
> supposed to access it, even if just for the scrubbing.

But for HVM domains with per-vCPU mappings, it's only mapped on the
pCPU that's doing the scrubbing, which is in the Xen context; no other
vCPU of the domain can access it, and by the time we return to the
guest, it's been scrubbed.

So this is only a limitation for PV domains with ASI enabled; and the
real solution there is to give them per-vCPU mapcaches as well.
Probably is worth noting the limitation somewhere; the only reliable
solution apart from vcpu_pt would be to scrub on free.

I'll add a note here.

> > arch_mfns_in_directmap() says whether an MFN range is reachable through
> > the directmap; it now answers for every context, so false once a sparse
> > view is configured.  Its one caller, init_node_heap(), then keeps a NUM=
A
> > node's heap metadata in the xenheap instead of carving it out of the
> > node's memory through the directmap: carved out of a range handed to th=
e
> > heap, it would be left out of the sparse view, which every heap
> > allocation needs it in.
> >
> > The sparse view is built only when some guest type is to use it, which
> > nothing can request yet: this patch changes nothing on its own.
>
> Is it worth mentioning that modify_xen_mappings_lite() doesn't need
> adjustment because it only deals with virtual addresses in the
> XEN_VIRT_{START,END} range, and those are cloned in the sparse
> directmap view?

Yes, I think so; I'll add a sentence to that effect.

> > Assisted-by: Claude Code:claude-opus-5-5
> > Signed-off-by: George Dunlap <gwd@xenproject.org>
> > ---
> > Changes in v3:
> > - New in this version.
> > ---
> >  xen/arch/x86/Kconfig                        |   1 +
> >  xen/arch/x86/Makefile                       |   1 +
> >  xen/arch/x86/include/asm/mm.h               |  17 +-
> >  xen/arch/x86/include/asm/sparse-directmap.h |  63 +++
> >  xen/arch/x86/mm.c                           | 128 +++++-
> >  xen/arch/x86/pv/dom0_build.c                |   4 +
> >  xen/arch/x86/setup.c                        |   4 +
> >  xen/arch/x86/sparse-directmap.c             | 424 ++++++++++++++++++++
> >  xen/common/Kconfig                          |  18 +
> >  xen/common/page_alloc.c                     |  41 +-
> >  xen/include/xen/mm.h                        |  35 ++
> >  11 files changed, 722 insertions(+), 14 deletions(-)
> >  create mode 100644 xen/arch/x86/include/asm/sparse-directmap.h
> >  create mode 100644 xen/arch/x86/sparse-directmap.c
>
> I have to admit reviewing this 1K line diff is challenging.  I've
> tried my best, but it's likely I've missed stuff.

We could try to break it down, but it's already pretty well broken
down: That is, there are three logical changes (Introduce hooks and
their stubs, add mm.c helpers, add sparse-directmap.c with the real
hooks) , but they're not intermingled.  A series of three patches
would be basically exactly the same hunks as the single patch, just
spread out.

I think the main thing that makes this hard to read in patch form is
having a full file, sparse-directmap.c, introduced:  You're not used
to reading source code like that with no highlighting and plusses in
front of it.  Applying the series to a tree and looking at the file in
your normal editor might make it easier.

But for the same reason, breaking it down into three would be pretty
easy; let me know if you want me to do that.

> > +bool __ro_after_init opt_sparse_dmap_pv;
> > +bool __ro_after_init opt_sparse_dmap_hvm;
>
> Do we need an extra opt_sparse_dmap_dom0?  So that dom0 can opt-out
> independently of everything else?

Yes; as you noted, this is currently added in patch 18.  I'll add all
the knobs here.

> > +/* Root of the sparse view: only ever walked and copied from, never lo=
aded. */
> > +static l4_pgentry_t __aligned(PAGE_SIZE) sparse_l4[L4_PAGETABLE_ENTRIE=
S];
> > +l4_pgentry_t *__ro_after_init sparse_dmap_root;
> > +
> > +/*
> > + * Before the sparse view is built: the MFN ranges handed to the heap,=
 which
> > + * it leaves out, and the xenheap allocations made meanwhile (heap met=
adata of
> > + * NUMA nodes), which it puts back.
>
> Explicitly mentioning NUMA node metadata is likely to go out of date,
> as changing that logic will most likely forget to update the comment
> here.

Yes, this comment has already been cut down for the next version.

> > +static int add_to_sparse_view(l4_pgentry_t *root, unsigned long mfn,
> > +                              unsigned long nr)
> > +{
> > +    unsigned long va =3D (unsigned long)mfn_to_virt(mfn);
> > +    unsigned long end =3D va + (nr << PAGE_SHIFT);
> > +
> > +    while ( va < end )
> > +    {
> > +        pte_attr_t flags;
> > +        unsigned long n;
> > +        mfn_t m =3D xen_mapping_lookup(idle_pg_table, va, &flags, &n);
> > +        int rc;
>
> Since you are fetching the mfn from the idle (non-sparse) page-tables,
> don't you want to check it matches the mfn passed as the function
> parameter?

Hmm, if the PTE for mfn_to_virt(mfn) in the full directmap doesn't
contain mfn, something's gone terribly wrong; definitely not safe to
continue executing Xen.  We could certainly add an ASSERT(); if it
actually happened in production, we'd want to BUG(), but that seems so
unlikely, I'm not sure it's worth the extra conditional.

I'll add an ASSERT() here; it's easy enough to change to a BUG_ON() if
we decide we want it there.

> > +static int __init cf_check cmp_mfn_range(const void *a, const void *b)
> > +{
> > +    const struct mfn_range *l =3D a, *r =3D b;
> > +
> > +    return l->s < r->s ? -1 : l->s > r->s;
>
> The last arm of this ternary operator is doing an implicit conversion
> from boolean to integer, I think that's not fine MISRA-wise?

Yes, I'll change it to return explicit integers, as cmp_node() does.

> > +    /*
> > +     * The full directmap, leaf by leaf, minus the ranges added to the
> > +     * heap.  Leaves come in address order, which is MFN order in the
> > +     * directmap, so the cursor into the sorted (and disjoint) heap
> > +     * ranges only moves forward.
> > +     */
> > +    for ( va =3D SPARSE_DMAP_START, j =3D 0; va < SPARSE_DMAP_END; )
> > +    {
> > +        pte_attr_t flags;
> > +        unsigned long n, s, e;
> > +        mfn_t m =3D xen_mapping_lookup(idle_pg_table, va, &flags, &n);
> > +
> > +        n =3D min(n, (SPARSE_DMAP_END - va) >> PAGE_SHIFT);
> > +        if ( mfn_eq(m, INVALID_MFN) )
> > +        {
> > +            va +=3D n << PAGE_SHIFT;
> > +            continue;
> > +        }
> > +
> > +        for ( s =3D mfn_x(m), e =3D s + n; s < e; )
> > +        {
> > +            unsigned long upto =3D e;
> > +
> > +            while ( j < nr_early_heap && early_heap[j].e <=3D s )
> > +                j++;
> > +            if ( j < nr_early_heap && early_heap[j].s <=3D s )
> > +            {
> > +                s =3D min(e, early_heap[j].e);
> > +                continue;
> > +            }
> > +            if ( j < nr_early_heap )
> > +                upto =3D min(e, early_heap[j].s);
> > +
> > +            if ( map_pages_in(sparse_l4, va + ((s - mfn_x(m)) << PAGE_=
SHIFT),
> > +                              _mfn(s), upto - s, flags) )
>
> Why use map_pages_in() directly here, instead of add_to_sparse_view()?

Because add_to_sparse_view() does a PT walk to get the flags; but we
already have the flags.

>
> > +                panic("Sparse directmap: out of memory\n");
> > +            mapped +=3D upto - s;
> > +            s =3D upto;
>
> The above logic is complicated to follow, maybe some simple comments
> will help.

I didn't comment it because IME this sort of tight algorithmic data
structure walk isn't really made much better with comments; there's no
getting around the need to brute-force grok what's happening.  I'll
see what I can do though.

It's worth saying that 1) this is the *sort* of bug that Claude is
good at catching, and this patch has had multiple rounds of review 2)
a bug here has a high probability of causing a crash later, and none
have been observed.

One thing on the TODO list was to add a sparse-directmap audit debug
key, to make sure that nothing in the heap (and not the xenheap) is in
the sparse directmap.

> > +    /*
> > +     * Now add back in ranges from the heap which were allocated to
> > +     * the xenheap.
> > +     */
> > +    for ( i =3D 0; i < nr_early_xenheap; i++ )
> > +    {
> > +        unsigned long nr =3D early_xenheap[i].e - early_xenheap[i].s;
> > +
> > +        if ( add_to_sparse_view(sparse_l4, early_xenheap[i].s, nr) )
> > +            panic("Sparse directmap: out of memory\n");
> > +        mapped +=3D nr;
> > +    }
> > +
> > +    sparse_dmap_root =3D sparse_l4;
>
> This logic involves a fair amount of calls to map_pages_in(), I think
> there will be no flushes in this case, because we are strictly
> populating the page-tables, and hence the old PTE will always be
> non-present.  Worth confirming, otherwise we might need some TLB flush
> avoidance, as doing TLB flushes makes no sense here, the page-tables
> are not in use.

At this point the other CPUs are not up, so there are no IPIs; at most
a local flush when a table collapses into a superpage.

 -George

