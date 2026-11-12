Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037E8606A333
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 12:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=ICoKO1Mg
Received: from list by lists.xenproject.org with outflank-mailman.1485728.1688863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRTju-0003mE-Km; Thu, 12 Nov 2026 12:17:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485728.1688863; Thu, 12 Nov 2026 12:17:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRTju-0003m7-Hl; Thu, 12 Nov 2026 12:17:14 +0000
Received: by outflank-mailman (input) for mailman id 1485728;
 Thu, 12 Nov 2026 12:17:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xRTjt-0003m1-H9
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 12:17:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xRTjt-0000000Ab9I-0YXE
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 12:17:13 +0000
Received: from mail-lj1-f179.google.com ([209.85.208.179])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xRTjt-0000000B85j-2Swp
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 12:17:13 +0000
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-3adef977ad9so32374891fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 04:17:13 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:Cc
	:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
	bh=/RBDK27rNppXvTIvghtW/9+UMS5eDgasp08AH9LSq4I=; b=ICoKO1MgiPzjWOxYvZkTTKcN+f
	ni+82XxYLDUeItGhBSS5EBUqaz+KiYSgvzNOINKc9UqU/fLJvwLa27vWdDUaWy3KcLIDVOTm3p6kw
	fgVyws2QL4Ppxdjo0IeUFO2N/dbhtc3Y8ggn/2tcJUgEQplDwaL9IxBrM9PB+CWIJpFs=;
X-Gm-Message-State: APuU4Z/M6BSnb0wALq/Wx5jNB5VWXPaWVzedcZEYdlmHDXl5JbnNVYhO
	oIYeROWUa0V8R5X5qoHFaXwO063JLHqbasP07NFj4FwudUDIVPeakLHotpTZG9LpmcAyYAx3IJr
	qMfmQBcpkYQnVbDv+Fuxcy9Hx9qQtDHI=
X-Received: by 2002:a2e:b8c3:0:b0:3ac:a2b0:ac56 with SMTP id
 38308e7fff4ca-3ae126dfdf1mr13678401fa.29.1794485832227; Thu, 12 Nov 2026
 04:17:12 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261007104051.48841-1-gwd@xenproject.org> <20261007104051.48841-16-gwd@xenproject.org>
 <asfoWIoeqPRX9SC-@Mac.lan> <CAFLBxZajMZSo6JP-Ui3Vpk8wdnWX1RtTULbYWsWPY5TjSs3JGQ@mail.gmail.com>
 <atEDXIYFICPlsMVl@Mac.lan>
In-Reply-To: <atEDXIYFICPlsMVl@Mac.lan>
From: George Dunlap <gwd@xenproject.org>
Date: Thu, 12 Nov 2026 12:16:58 +0000
X-Gmail-Original-Message-ID: <CAFLBxZZUrcmOHCDS_Za26o031XiCtWsNK-8Rsi7=JEqTCQF-9Q@mail.gmail.com>
X-Gm-Features: AclHuK-S5iVzWpwuhp1V6fS0MEHBaKZlVODcslY-p5BH9GAxPJ8QWBYPFKBC5zY
Message-ID: <CAFLBxZZUrcmOHCDS_Za26o031XiCtWsNK-8Rsi7=JEqTCQF-9Q@mail.gmail.com>
Subject: Re: [PATCH v3 15/18] x86/mm: flush owned pages before reuse with the
 sparse directmap view
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

BTW, the INVLPG approach is significantly more expensive; a single
copy_from_guest requires walking the guest pagetables, each of which
needs to be mapped and unmapped; so something as simple as EVTCHN_send
requires 5 INVLPG's per hypercall.  Hackbench is a guest-IPI-heavy
workload, whose overhead between v3's approach and v4's appraoch goes
from 5.5% to 14.9% on my local test box.

 -George

