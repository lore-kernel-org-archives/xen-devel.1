Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB6ACC6B34
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 12:30:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450445.1665912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHKb0-0003Xx-F5; Thu, 15 Oct 2026 12:30:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450445.1665912; Thu, 15 Oct 2026 12:30:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHKb0-0003Xq-Bs; Thu, 15 Oct 2026 12:30:06 +0000
Received: by outflank-mailman (input) for mailman id 1450445;
 Thu, 15 Oct 2026 12:30:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xHKay-0003G9-CN
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 12:30:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xHKay-00000006hin-2CXJ
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 12:30:04 +0000
Received: from mail-lj1-f179.google.com ([209.85.208.179])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xHKax-00000005e0z-3FhW
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 12:30:04 +0000
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-3a980c01033so15622331fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 05:30:04 -0700 (PDT)
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
	bh=3vBMeMWiS3ioV1NAkGSXr5rYMbTFgaV/MezvaVgnb9c=; b=cQ5uqwtl8Fy3KOG4dwN+bhC52o
	mst7Sj4ACRRzy/EvWUcpEL4dRfMgX+0RVBMpT/OgtkGEUVtI9izenQUtU8lTRDdzIBlkuGapaQjVS
	e2UwzX1X9ioxlEMxBZyXQk+sSh1h+f9HD3TDt+AiAOf34FOk7mczSpCkJPKXkIw3sbjU=;
X-Gm-Message-State: AFq9FYKrWp/NLfo/ikxxSqHfgf896yt347y7fPhOdELoFYwDcYYaN26e
	w5JJQf/iGff5OT30A9gXRbmmz15gSCXs7qWQfa7nai1G0e4b5awhHGvFa++Jgrf7cPhsjS2S0i7
	+gI19wa7ZW+hSHN9Au9dVDFvB0k6cI3g=
X-Received: by 2002:a2e:a9a3:0:b0:3a2:f233:5c6e with SMTP id
 38308e7fff4ca-3a9c515d16dmr45999451fa.6.1792067403076; Thu, 15 Oct 2026
 05:30:03 -0700 (PDT)
MIME-Version: 1.0
References: <20261007104051.48841-1-gwd@xenproject.org> <20261007104051.48841-18-gwd@xenproject.org>
 <asietfC0LX4Z7xI7@Mac.lan>
In-Reply-To: <asietfC0LX4Z7xI7@Mac.lan>
From: George Dunlap <gwd@xenproject.org>
Date: Thu, 15 Oct 2026 13:29:51 +0100
X-Gmail-Original-Message-ID: <CAFLBxZZ-=8oHobSn-Dwd-zE_DLstrkxz3cSuu2p9eOPoEFdJ+Q@mail.gmail.com>
X-Gm-Features: AclHuK_ShVXtfeidRAr9_-zrO0gTonddJQSrHPAbFi4M-kgGKW745GrxRiBLh_o
Message-ID: <CAFLBxZZ-=8oHobSn-Dwd-zE_DLstrkxz3cSuu2p9eOPoEFdJ+Q@mail.gmail.com>
Subject: Re: [PATCH v3 17/18] x86/mm: run guest contexts on the sparse
 directmap view
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 8:58=E2=80=AFAM Roger Pau Monn=C3=A9 <roger@xenproje=
ct.org> wrote:
> On Wed, Oct 07, 2026 at 11:40:50AM +0100, George Dunlap wrote:
> > In init_xen_l4_slots(), if d->arch.sparse_dmap is set, point the
> > directmap L3 at the sparse view.
> >
> > d->arch.sparse_dmap is decided at domain creation: PV domains all have =
a
> > mapcache, HVM domains need per-vCPU page-tables for one.  No option ask=
s
> > for the sparse view yet.
>
> Is it strictly needed to tie the sparse directmap to having a per-vCPU
> mapcache on HVM?  AFAICT HVM domains could also use the classic
> per-domain mapcache.

They could, if it were implemented.  I haven't implemented it, and
didn't plan to; so until it's implemented, the sparse view needs
vcpu_pt on HVM domains.

> > The sparse view becomes active once dom0 is built, before it first runs=
:
> > dom0's construction runs on the full directmap, which it needs, and its
> > root page-tables so far (a PV dom0's first L4s, a PVH dom0's monitor
> > tables) are switched over then.  A PV dom0 booted with dom0=3Dshadow is
> > switched as well: shadow mode is enabled only later, from a tasklet, an=
d
> > its shadow L4s then get the sparse view from init_xen_l4_slots(), as fo=
r
> > any PV domain entering shadow mode.  Anything built later gets the
> > sparse view from init_xen_l4_slots().  The sparse view's slots are
> > marked NX at activation, as the full directmap's slots are.
>
> Is NX worth mentioning here?  The expectation is that the sparse dmap
> slots will use the same attributes as the full dmap, and hence I
> would focus on the differences (if any).

Sure, we can drop that.

> > @@ -1743,6 +1744,10 @@ void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t =
l4mfn,
> >                 (ROOT_PAGETABLE_FIRST_XEN_SLOT + slots -
> >                  l4_table_offset(XEN_VIRT_START)) * sizeof(*l4t));
> >      }
> > +
> > +    /* The domain's contexts may run on the sparse view of the directm=
ap. */
> > +    if ( sparse_dmap_active && d->arch.sparse_dmap )
> > +        sparse_dmap_install(l4t, short_directmap);
>
> Instead of doing the copy of the full directmap from the idle page
> tables, and then rewriting, won't it be simpler if the copied
> directmap was the correct one right away rather than doing a fixup
> afterwards?

Yes; I'll rewrite this.

> > @@ -437,3 +439,130 @@ void __init sparse_dmap_init(void)
> >
> >      printk(XENLOG_INFO "Sparse directmap: %lu pages mapped\n", mapped)=
;
> >  }
> > +
> > +/*
> > + * Point the directmap slots of the root page-table @l4t at the sparse=
 view.
> > + * Every slot it covers gets its L3, whatever the full directmap has t=
here,
> > + * so that memory added later is covered too.  A PV root has guest slo=
ts
> > + * above; any other root loses the rest of the directmap, which the sp=
arse
> > + * view does not cover.
> > + *
> > + * Directmap mappings may be global, in either hierarchy.  Translation=
s of
> > + * the full directmap must not remain usable on a root carrying the sp=
arse
> > + * view: every CR3 write which can move a CPU from the one to the othe=
r goes
> > + * through switch_cr3_cr4(), which flushes what the old root left in t=
he TLB,
> > + * global entries included, before it returns.  The other CR3 writes, =
which
> > + * may keep global or PCID-tagged entries (_toggle_guest_pt(), XPTI's =
entry
> > + * and exit paths), switch between one vCPU's roots, which carry the s=
ame
> > + * directmap, or to XPTI's per-CPU root, which maps only this CPU's st=
ack,
> > + * IDT and TSS there.  Removals from the sparse view flush all CPUs, g=
lobal
> > + * entries included.
>
> IMO parts of this comment are likely out of scope here.  It's fine to
> discuss about the flushing strategy in the commit message, however
> doing so in a comment here, that's disconnected from the definitions
> of switch_cr3_cr4() and _toggle_guest_pt() seems out of place.
>
> I would also avoid referencing function names in code comments: it's
> fine to do so in the commit message, but it's likely those references
> in comments will go stale as functions change names or disappear.
> Commit messages are otherwise tied to a specific point in time, so the
> context and the referenced functions are always accurate and it will
> never go stale in the context is was committed.

Yes, I've done a general pass to trim down comments.

> > + */
> > +void sparse_dmap_install(l4_pgentry_t *l4t, bool pv)
> > +{
> > +    unsigned int i;
> > +
> > +    ASSERT(sparse_dmap_root);
> > +
> > +    for ( i =3D l4_table_offset(SPARSE_DMAP_START);
> > +          i < l4_table_offset(SPARSE_DMAP_END); i++ )
> > +        l4t[i] =3D sparse_dmap_root[i];
> > +
> > +    if ( !pv )
> > +        for ( ; i < l4_table_offset(DIRECTMAP_VIRT_END); i++ )
> > +            l4t[i] =3D l4e_empty();
> > +}
> > +
> > +static void __init sparse_dmap_install_mfn(mfn_t mfn, bool pv)
> > +{
> > +    l4_pgentry_t *l4t =3D map_domain_page(mfn);
> > +
> > +    sparse_dmap_install(l4t, pv);
> > +    unmap_domain_page(l4t);
> > +}
> > +
> > +/*
> > + * Let guest contexts run on the sparse view.  Root page-tables built =
from
> > + * here on carry it (init_xen_l4_slots()); those of the domains built =
so far
> > + * (dom0, which has not run yet) are switched over here.  Its construc=
tion ran
> > + * on the full directmap, and needed to.
> > + */
> > +void __init sparse_dmap_activate(void)
> > +{
> > +    struct domain *d;
> > +    struct vcpu *v;
> > +    unsigned long va, mapped =3D 0;
> > +    unsigned int i, switched =3D 0;
> > +
> > +    if ( !sparse_dmap_root )
> > +        return;
> > +
> > +    /*
> > +     * Nothing in the directmap is executed: as subarch_init_memory() =
does
> > +     * for the full directmap, mark the sparse view's slots NX, before=
 any
> > +     * root page-table takes a copy of them.
> > +     */
> > +    if ( cpu_has_nx )
> > +        for ( i =3D l4_table_offset(SPARSE_DMAP_START);
> > +              i < l4_table_offset(SPARSE_DMAP_END); i++ )
> > +            l4e_add_flags(sparse_dmap_root[i], _PAGE_NX_BIT);
>
> Shouldn't this be done when the sparse directmap L4 are populated,
> instead of here?

In the meantime, this function has been removed; NX bit is now set in
sparse_dmap_init(), and the rest of the code you comment in this
function has been removed.

 -George

