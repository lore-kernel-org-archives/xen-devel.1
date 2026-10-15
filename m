Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD17CCA462
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 21:40:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451166.1666351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHTBV-0002HU-Fe; Thu, 15 Oct 2026 21:40:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451166.1666351; Thu, 15 Oct 2026 21:40:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHTBV-0002HN-Ct; Thu, 15 Oct 2026 21:40:21 +0000
Received: by outflank-mailman (input) for mailman id 1451166;
 Thu, 15 Oct 2026 21:40:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xHTBU-0002HG-Sh
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 21:40:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xHTBV-00000006skK-01w4
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 21:40:20 +0000
Received: from mail-lj1-f172.google.com ([209.85.208.172])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xHTBU-00000001xcY-1Bz1
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 21:40:20 +0000
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-3a20f06cce6so4636541fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 14:40:20 -0700 (PDT)
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
	bh=Au3j75gVr9B0AS7vjzh5COb5tkOgOOJ7meSRvMKfXUI=; b=EWOwaFGD/6XffwZYVBTg5n1GD4
	yJEeDwtrkIXR89YL3C/qC9qRzF+Ga640EqaT9hEWynLre6rDWrGhE9i3G/ytgXy0JBidRagkiJabv
	+dl6N/nrTcj+shW0wXVpfEAwlNKHGSA8sLmuii12WBnT9DlEdHAsJv+slEPruJp4e8NI=;
X-Gm-Message-State: AFq9FYKRwXkqsj5dP3ro7IwdyXi0BRHuW7mFaPM+hqQ/fwoHIBgN+URD
	VtuR9EaP1uF1/+ikmUszoW8dn1u/klkRXpMp/ammQOZg52ZPJOvEonQjrMDRvCa6N+76sUCvsEc
	tw3XLH9/N2Cy2oid+BgIo4kzeL2BuAnM=
X-Received: by 2002:a05:651c:b29:b0:3a9:dba6:ae7d with SMTP id
 38308e7fff4ca-3ab147d86c1mr3079061fa.15.1792100419594; Thu, 15 Oct 2026
 14:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <20261007104051.48841-1-gwd@xenproject.org> <20261007104051.48841-16-gwd@xenproject.org>
 <asfoWIoeqPRX9SC-@Mac.lan> <CAFLBxZajMZSo6JP-Ui3Vpk8wdnWX1RtTULbYWsWPY5TjSs3JGQ@mail.gmail.com>
 <atEDXIYFICPlsMVl@Mac.lan>
In-Reply-To: <atEDXIYFICPlsMVl@Mac.lan>
From: George Dunlap <gwd@xenproject.org>
Date: Thu, 15 Oct 2026 22:40:07 +0100
X-Gmail-Original-Message-ID: <CAFLBxZZh4U425AYiJAkHA7NQ0A8=ptbvY7kstFiaz0V1K1SZUw@mail.gmail.com>
X-Gm-Features: AclHuK9YIGhjTbUsn3OPHbyVaBN26OezSSt4hAvpPkMl6fw7zbvVlVZDevvvMQ4
Message-ID: <CAFLBxZZh4U425AYiJAkHA7NQ0A8=ptbvY7kstFiaz0V1K1SZUw@mail.gmail.com>
Subject: Re: [PATCH v3 15/18] x86/mm: flush owned pages before reuse with the
 sparse directmap view
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 5:46=E2=80=AFPM Roger Pau Monn=C3=A9 <roger@xenproj=
ect.org> wrote:
>
> On Wed, Oct 14, 2026 at 04:34:54PM +0100, George Dunlap wrote:
> > On Thu, Oct 8, 2026 at 8:00=E2=80=AFPM Roger Pau Monn=C3=A9 <roger@xenp=
roject.org> wrote:
> > >
> > > On Wed, Oct 07, 2026 at 11:40:48AM +0100, George Dunlap wrote:
> > > > Since d7bf1b8ea275 ("x86/mm: limit deferred TLB flushing to PV doma=
in
> > > > support") a page freed by its owner is flushed from TLBs before it =
is
> > > > handed out again only in builds with PV support, on the premise tha=
t PV
> > > > domains, with their (limited) control over the host MMU and over wh=
en
> > > > flushes happen, are the only ones to leave stale entries behind.
> > > >
> > > > Xen's transient mappings of domain pages are another source.  The
> > > > mapcache zaps a slot when it is unmapped but defers the flush: the
> > > > slot's translation can stay in the TLB of the CPU which used it unt=
il
> > > > that CPU next flushes, by which time the page may have been freed a=
nd
> > > > handed to another domain.  Before "x86/hvm: introduce per-vCPU
> > > > mapcache for vCPU-PT domains", only PV vCPUs use the mapcache, so t=
he
> > > > PV condition covers it.  Now that the vCPUs of an HVM domain with
> > > > per-vCPU page-tables have one as well.
> > > >
> > > > While the full directmap is loaded in every context, stale transien=
t
> > > > mappings only map what's already mapped in the full directmap.  On =
the
> > > > sparse view of the directmap, a stale translation of a page handed =
to
> > > > another domain would keep it reachable from a context which has
> > > > nothing to do with it.
> > >
> > > But if it's handed to another domain, then it also hasn't gone throug=
h
> > > a free cycle, which is what pg->u.free.need_tlbflush covers?
> >
> > Sorry, the wording there is a bit imprecise; it should be "a stale
> > translation of a page *freed and then* handed to another domain".
> >
> > Apart from things like steal_page(), which doesn't apply to HVM guests
> > AFAIK, there isn't any way to hand a page to another domain, is there?
> >
> > I guess there's dom_cow for memory sharing; but that's experimental.
> > We should just document that ASI + memory sharing isn't supported at
> > the moment, and work out the details when that's wanted.
> >
> > > > So flush owned pages before reuse wherever a sparse view is
> > > > configured, as before d7bf1b8ea275.  In builds without PV support,
> > > > mark_page_free() now also asks a new hook,
> > > > arch_freed_pages_need_tlbflush(), declared with the xenheap hooks t=
he
> > > > sparse view already uses.  x86 answers with sparse_dmap_configured(=
);
> > > > without CONFIG_SPARSE_DIRECTMAP, and on other architectures, the
> > > > answer is no.  Builds with PV support flush as before, and HVM-only
> > > > builds keep d7bf1b8ea275's saving unless a sparse view is configure=
d,
> > > > which nothing does until a later patch.
> > >
> > > I think this is not fully correct, in fact I think we need to flush
> > > the map cache on every return to guest, otherwise you risk leaking
> > > contents between processes running on the same vCPU (and by extension
> > > the same physical CPU).
> > >
> > > We either need a flush flush before returning to guest, or we need to
> > > invalidate every page that unmapped from the mapcache.
> >
> > This is a good point, but it's raising the bar significantly in terms
> > of what kinds of attacks we're trying to defend against.  Stack rubble
> > could technically contain sensitive guest data, but is much harder to
> > take advantage of than the full direct map, and XSAVE registers in the
> > xenheap; so it's delayed until later.  I think this is the same kind
> > of thing: Yes, pages mapped by a hypercall may contain sensitive data
> > relevant to other processes, but it's kind of like stack rubble: much
> > less useful.
> >
> > My recommendation is that we put this off, past moving XSAVE out of
> > the xenheap, and treat it as another level of safety.
>
> Up to a degree there's also a performance aspect here: when you set
> pg->u.free.need_tlbflush that triggers a host-wide flush on the next
> allocation (if needed, which is likely the case for systems running
> HVM-only domains).  However if we do the flush on mapcahce unmap,
> that can be a single invlpg on the local CPU.  As systems grow larger,
> a host-wide TLB flush is quite a bottleneck, and it also introduces
> interference to remote CPUs.
>
> I would rather not re-enable the usage of pg->u.free.need_tlbflush, as
> I think for a complete ASI solution we will need to solve this
> flushing TLB entries when pages are unmapped from the mapcache.  I
> would possibly leave this with a TODO or comment somewhere.

Well leaving this undone leaves potential cross-domain data windows open.

You're right, avoiding IPIs on free, is a big win; the cost is the
INVLPG, and a TLB re-walk on repeated references.

I'll give it a think, but probably go with your suggestion.

 -George

