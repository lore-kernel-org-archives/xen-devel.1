Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E647DC624DE
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 08:07:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407940.1640696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Ox1-0006cb-Ct; Fri, 04 Sep 2026 08:07:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407940.1640696; Fri, 04 Sep 2026 08:07:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Ox1-0006cU-9z; Fri, 04 Sep 2026 08:07:07 +0000
Received: by outflank-mailman (input) for mailman id 1407940;
 Fri, 04 Sep 2026 08:07:06 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dunlapg@umich.edu>) id 1x2Ox0-0006cM-2J
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 08:07:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2Owz-0065iV-F1
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 10:07:05 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dunlapg@umich.edu>)
 id 6a9a7c1d-e002-0a2a0a5209dd-0a2a4502dcf6-40
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 10:07:04 +0200
Received: from [18.217.159.240] (helo=ghoul.relay-egress.a.mail.umich.edu)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dunlapg@umich.edu>)
 id 6a9a7c26-6ca4-0a2a45020019-12d99ff09478-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 10:07:02 +0200
Received: from top-brounie.authn-relay.a.mail.umich.edu
 (ip-10-0-74-245.us-east-2.compute.internal [10.0.74.245])
 by ghoul.relay-egress.a.mail.umich.edu with ESMTPS
 id 6A9A7C25.2762C025.198CDE89.30540; Fri, 04 Sep 2026 04:07:01 -0400
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by top-brounie.authn-relay.a.mail.umich.edu with ESMTPSA
 id 6A9A7C24.31D04528.71D4968.1389580; Fri, 04 Sep 2026 04:07:01 -0400
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-39c7ed5410bso5535231fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 01:07:00 -0700 (PDT)
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
	s=relay-2; t=1788509221;
	bh=uOLmBmalDx11mFYzo84GxFwO0G+W0jshabbbDFOR/I4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=T5CHeY51BA5T4/aLeeBcRY2HUf3IX2PeKCkXWTk7GLgE/RFKS4HgVq0UOLToWOJwe
	 RFIfJqOhjO/scDsWqB85hj7iBQVsGk5ClbiKrDtl+nnLajUbJRaceVR/knyuDezsAa
	 VZoGrL/qNrHOIaR3BtOE/XnPuEFz+Lii+O0+Wguht3SO5e9HmD/gZriOTPek0d+QpQ
	 TD7THwurCb8X//1DpJhPWBVDBOe4psgkMNbIoBvaFzuyGEPQeZJwraZjSd77JV5u5S
	 j5q7JL4Hn4JnKaGkx1GyoytZEV/ixUh0LMF33AT0AsjLGkcYACSZGBlJf/Yp/0zCku
	 X7T4hYqjjpwoA==
Authentication-Results: top-brounie.authn-relay.a.mail.umich.edu; 
	iprev=pass policy.iprev=209.85.208.171 (mail-lj1-f171.google.com);
	auth=pass smtp.auth=dunlapg
X-Forwarded-Encrypted: i=1; AKwUvByCQNECovKPtlexaXPpgf+nwc3qKgLFwPBWQuAqpkCOaZGBj80MHdHVomtZdwk8KrfCHI1f3AN7bqQ=@lists.xenproject.org
X-Gm-Message-State: AFuF++m+IVE5ow+ydGJkuC6KJ4qbcgYebCWC6YpPzk9nsVBz52L1hZNN
	szWIOlk8vP5XSzKMZ0IF6RRy3C5/5xd9E0+rBsYnefJMr1U/6cUYkbFDIsb0hSvdZ84Lva/XcDM
	smVjTZD2QLEiQVSSmWNa57SLOyRtxVv0=
X-Received: by 2002:a05:651c:15c1:20b0:3a3:476:2e37 with SMTP id
 38308e7fff4ca-3a371b2d735mr3598501fa.6.1788509218697; Fri, 04 Sep 2026
 01:06:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
 <20260901-asi-part2-3-ecc269f268b7@xenproject.org> <554687e3-1fab-4d23-9a4e-0bdc3bc1fc60@suse.com>
 <CAFLBxZYqOWkd60As00ytcNqTZg99Gu220OMrse5MXYgOHfx0Pw@mail.gmail.com>
 <07d332a4-a5a3-44d4-95ce-fc67d86edacf@suse.com> <050f44ec-47e5-4754-b73b-1173458736b0@suse.com>
In-Reply-To: <050f44ec-47e5-4754-b73b-1173458736b0@suse.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Fri, 4 Sep 2026 09:06:45 +0100
X-Gmail-Original-Message-ID: <CAFLBxZZ+-GsTLDMoiBpAda6U-T-M70wHjAK9EqKZCZdK2VAknw@mail.gmail.com>
X-Gm-Features: AcwNN1VO9I1SRc0pAKiewtIDJfNIVNMGpWUrRbmHBGtw0t5nCfdsx0gazpaPtLw
Message-ID: <CAFLBxZZ+-GsTLDMoiBpAda6U-T-M70wHjAK9EqKZCZdK2VAknw@mail.gmail.com>
Subject: Re: [PATCH v2 03/14] x86/pv: use populate_perdomain_mapping() to map
 the Xen GDT
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Alejandro Vallejo <agarciav@amd.com>, Teddy Astie <teddy.astie@vates.tech>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1788509224-F2CB22AC-632F8039/0/0
X-purgate-type: clean
X-purgate-size: 6049

On Fri, Sep 4, 2026 at 7:54=E2=80=AFAM J=C3=BCrgen Gro=C3=9F <jgross@suse.c=
om> wrote:
>
> On 04.09.26 08:00, Jan Beulich wrote:
> > On 04.09.2026 00:35, George Dunlap wrote:
> >> On Thu, Sep 3, 2026 at 5:11=E2=80=AFPM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>>
> >>> On 02.09.2026 11:43, George Dunlap wrote:
> >>>> From: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >>>>
> >>>> Currently, update_xen_slot_in_full_gdt() uses the stashed direct-map
> >>>> pointer in d->arch.pv.gdt_ldt_l1tab to update the incoming vcpu's
> >>>> page tables with Xen's GDT, by writing a stashed per-cpu copy of a
> >>>> pre-baked L1 entry (either 64-bit or compat version).
> >>>>
> >>>> Switch this to using populate_perdomain_mapping(), which doesn't rel=
y
> >>>> on the stashed address of the l1 page in the direct map.  Rather tha=
n
> >>>> also stashing a pre-baked value for the payload, compute the mfn fro=
m
> >>>> the per-cpu GDT pointer at use: the conversion is a handful of cycle=
s
> >>>> on a path costing thousands, and computing at use removes the
> >>>> parallel {,compat_}gdt_l1e bookkeeping along with its boot-ordering
> >>>> constraint (the cached value could only be generated after Xen's
> >>>> physical relocation, and had to be in place before the first context
> >>>> switch; a use-time lookup is correct by construction).  The flags on
> >>>> the final mapping are identical.
> >>>>
> >>>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >>>> Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8
> >>>> Signed-off-by: George Dunlap <gwd@xenproject.org>
> >>>> ---
> >>>> Changes in v2:
> >>>> - Drop the {,compat_}gdt_mfn caching entirely (suggested by Andrew
> >>>>     Cooper): compute virt_to_mfn() from the per-cpu GDT pointer at u=
se.
> >>>>     The PDX lookup behind it measures ~5-10 cycles warm against a
> >>>>     ~1,500-cycle context switch, and this removes the double
> >>>>     bookkeeping and the after-relocation caching constraint.  The
> >>>>     cached-MFN assertion goes with the cache: a use-time computation
> >>>>     from a live pointer needs no staleness check.
> >>>
> >>> This looks to contradict what 564d261687c0 ("x86/ctxt-switch: Documen=
t
> >>> and improve GDT handling") used as justification to put in place the
> >>> caching. Also Cc-ing J=C3=BCrgen, who also was involved there, for po=
ssible
> >>> further insight.
> >>>
> >>> Functionally the change looks okay to me, but the above will need
> >>> sorting, at the very least by specifically discussing why effectively
> >>> undoing that earlier change is okay.
> >>
> >> So looking back at the thread, J=C3=BCrgen measured a 14% improvement =
for
> >> something that might be described as a microbenchmark before and after
> >> the patch (a benchmark purposely trying to set up an unusual scenario
> >> to maximize the effect of context switch overhead, not one to
> >> represent a typical workflow).  But are the numbers really plausible?
> >> Even at an implausible 100k switches/s across the box, saving 100
> >> cycles per switch is about 0.04% of eight 3 GHz cores.
> >>
> >> At any rate, we're already adding several map/unmap operations, and
> >> about to add several more.  Keeping the PTE caching would require
> >> adding a separate path that can write just PTEs, which then will
> >> potentially further complication future paths where we need to make
> >> sure we handle both domain-wide perdomain areas and per-vcpu areas.
> >> If it were easy I would already have been keeping it.
> >>
> >> I'd be inclined to say: Since we're going to be adding more
> >> populate_perdomain_mapping() calls anyway, let's do it the simple
> >> correct way first; and then explore the idea of stashing mfns of
> >> frequently-mapped L1s (rather than having to walk L3 -> L2 -> L1); and
> >> at that time look into stashing baked l1es to avoid conversions.
> >
> > Perhaps; I'd like to have J=C3=BCrgen's and/or Andrew's input here, tho=
ugh.
>
> At that time I implemented core scheduling in Xen. I noticed that very
> subtle changes in the context switch path could result in unexpected larg=
e
> performance differences. As I had the performance test for my purpose
> already set up, I used it for Andrew's patch (which was a result of my
> context switch path performance findings) and really did measure the
> impressive effect of it.
>
> Note that you can't only count instructions, often cache effects and
> branch predictions are dominating the performance.

Right, but:

1. That's going to be very much hardware- and workload- dependent.
Even on the same hardware, if you'd made a slight change in the
workload, you might have seen a very different result; and on
different hardware you're going to see something different again

2. As I said, we're now adding two extra map / unmaps, which is going
to perturb everything again.

If anything, your argument says we should wait until we've stopped
modifying the context switch path (which won't happen until patch 49
at least, guessing from the patch titles), and then measure things
again to see what's actually slow.

I'm sorry Jan, your position here is really inconsistent:  You wave
away a partial pagetable walk with three map/unmap operations on the
context switch path as something we'll have to do in the interim, and
can optimize later, but are now threatening to make me add in
special-case codepaths and run tests to save a few memory reads and
shifts.

I could put back the mfn caching that was present in v1 of the series
(which Andy said was probably not sufficient, on balance, to make the
duplication involved worth it).  Even that I think isn't really
sensible, but it's not too difficult to do.  To isolate the PTE
caching effect I'd have to write an entire duplicate codepath anyway,
and then try to duplicate J=C3=BCrgen's test.  I don't think that's really
a reasonable ask at this point in the series.

 -George

