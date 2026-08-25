Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C59AC61DBD
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2026 11:42:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399183.1635368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wypXv-0005yo-Mk; Tue, 25 Aug 2026 11:42:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399183.1635368; Tue, 25 Aug 2026 11:42:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wypXv-0005yh-Jp; Tue, 25 Aug 2026 11:42:27 +0000
Received: by outflank-mailman (input) for mailman id 1399183;
 Tue, 25 Aug 2026 11:42:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1wypXu-0005yb-Nd
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 11:42:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wypXu-004vzN-1L
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 11:42:26 +0000
Received: from mail-lf1-f47.google.com ([209.85.167.47])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wypXt-00HLmH-3B
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 11:42:26 +0000
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5b0148201fbso4191652e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 04:42:25 -0700 (PDT)
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
	bh=yBQU37hqUoKtbMQ4pVzLFDUBUC8LRb+kRQfwB5YVEgY=; b=n0g9pwH0h50ZRvNAt0qGnWwZpF
	NW0rCaqaihE0uMyCecyT05eUFgG2LDaTkxbELeAETRezjnmdion68pNHRc+KuA/S+iG0BKb4J3tpH
	nU8ZOh8HPDziUApbuoKTKIBWaOAjb3uF+Hatm+mHpQXKrqi6bkys3tsAIp7obqb0/U8M=;
X-Forwarded-Encrypted: i=1; AHgh+RonJcatoAEc2xTqw9v+pHKoUzH753d/znrFLNLhM/aUPNZLJPeOnoy664B8Mye5nH3FvS+SzWQJuqE=@lists.xenproject.org
X-Gm-Message-State: AFuF++mrNyjv4VQUXvTbParL/2CnRNUPAFvjuLtgu6IeMRz49X61nUz0
	vWBKmsfN1N73O/4nCZgEZjUNxe3ZcBPFVRlefYYfHlewaT+EWMRclEkexJ1riz9NMdInjXmKc+G
	ap/xpWFSFZwkmEP9nYKvaoQBAyPf5aLo=
X-Received: by 2002:a05:6512:691:b0:5b2:e5b7:2419 with SMTP id
 2adb3069b0e04-5b49cd606b3mr2094380e87.5.1787658144688; Tue, 25 Aug 2026
 04:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260820-asi-part1-0-f2dbd92b8459@xenproject.org>
 <ec040560-4377-474d-a929-3080b74bb0af@suse.com> <CAFLBxZbQD7HgdYK3-yzaMOt4P2geO2PSOSDi4-c3KHZ96DDifg@mail.gmail.com>
 <044095b7-3c8d-40da-9d21-281c522a49ae@suse.com>
In-Reply-To: <044095b7-3c8d-40da-9d21-281c522a49ae@suse.com>
From: George Dunlap <gwd@xenproject.org>
Date: Tue, 25 Aug 2026 12:42:12 +0100
X-Gmail-Original-Message-ID: <CAFLBxZa0Fmmic1JLwHOdFCn1=rGP6Un2q1ZxBa1DpsO_AAmD6A@mail.gmail.com>
X-Gm-Features: AcwNN1WeBD7-ShqIv6056gt7-SMnWmmHi6BxcaYpkhtmayuSEmOLFoM4ZCCyweI
Message-ID: <CAFLBxZa0Fmmic1JLwHOdFCn1=rGP6Un2q1ZxBa1DpsO_AAmD6A@mail.gmail.com>
Subject: Re: [PATCH 0/7] x86: Address Space Isolation, part 1: per-domain area
 mapping rework
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 10:02=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
> On 21.08.2026 17:17, George Dunlap wrote:
> > On Fri, Aug 21, 2026 at 9:45=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >> On 20.08.2026 19:43, George Dunlap wrote:
> >>> One point reviewers may want to look at specifically: patch 1 changes
> >>> where the per-domain page-tables are allocated from, and its commit
> >>> message discusses the (minor) NUMA-placement consequence.
> >>
> >> While I don't recall which recent patch (series) it was, I can't very =
well
> >> say "no new xenheap allocations please" there without also saying so h=
ere.
> >> I've read over patch 1's description, and while it tries to justify th=
is
> >> accordingly, I still remain concerned. I think we simply have to accep=
t
> >> the mapping overhead, to avoid allocating from a pool which - over tim=
e -
> >> is representing a decreasing portion of total memory systems have (on
> >> average, and not even considering systems with extremely sparse memory
> >> layouts, and with perhaps PDX compression not doing good enough to
> >> compensate).
> >
> > You should certainly have the same resistance to adding new xenheap
> > allocations.  But looking at the numbers, I don't see that we're
> > anywhere near the point where we say, "Absolutely no new xenheap
> > allocations, regardless of the cost."
>
> Well, that depends, and in part on the longer term plans with ASI. It has
> been my (silent) assumption that eventually the directmap would go away
> altogether when ASI is in use, with the VA space freed (almost?) all
> becoming available for vmap(). With the disappearance of directmap, the
> xenheap would naturally disappear as well. Hence putting stuff there in
> new work actually adds to our technical debt.

I do think that makes sense as a long-term goal.  Actually, I asked
Fable to do an audit of xenheap allocations, asking it to classify
them as to whether they needed xenheap's key properties (easy mfn <->
va conversion, available in early boot), and it reckoned only about 4%
of the allocations (by volume) in the example system I did numbers for
needed xenheap-specific properties.  Lots of things just need *some*
global mapping somewhere, and would probably actually overall benefit
from being moved to the vmap, so they wouldn't be restricted to a
single NUMA node.  Grant frames were the biggest chunk.

The xenheap / vmap split is certainly something I would now consider a
large piece of technical debt; moving towards paying that off is
certainly something I think worth achieving, provided the rest of the
maintainers are on board.

(Imagine how differently this conversation would have gone, if in the
first email you had said, "Actually, I thought one of the main goals
of this series was to get rid of the xenheap altogether, so that we
could switch to having a single large vmap area instead?")

> While these percentiles in particular of course look very tiny, they are
> applicable only on systems having no meaningful gaps in the physical
> address map. And even more generally I find all of these calculations
> only partly convincing, not the least because you start out from numbers
> which look pretty contrived when comparing to actual systems which would
> run the new code. (Using more realistic real-system values may end up
> going in favor of what you want to convey, or it may not.)

To be honest, I'm inclined to think that they're not very convincing
because you don't actually have an idea what the problem is.  You
didn't specify what you were worried about, so I tried to guess a
scenario that I considered 95th-percentile worse case.  I don't know
what kinds of sparse memory layout machines you have in mind -- are
they written down anywhere, so that contributors can read and
understand what they need to consider *before* implementing?  Even now
you haven't even said what about my scenario you consider unrealistic,
much less told me parameters you think are more realistic.

I don't even know exactly what failure mode you're worried about.  Two
kinds of potential failures I know about:
 - Performance impacted because pages can't be NUMA-local
 - Toolstack operations (including domain creation) fail because
xenheap has been exhausted.

If you're willing to accept 9 map/unmap operations on *all* systems,
then NUMA-non-local accesses can't be that big of an issue for you.

On the fairly largish system / load that I tried to estimate, the
total xenheap usage was less than 3GiB in the worst case.  Let's
double that just for safety sake: Do there exist systems whose memory
is so sparse that even with PDX compression, they can't even scrounge
together 6GiB below the 4TiB limit?  If so, I think a much better
solution would be to document that such systems may be able to support
a lower degree of oversubscribing than most systems, and leave it at
that.

In short: I can't imagine a scenario where a larger xenheap is an
issue we should be concerned about.

It's not up to me to guess what sorts of numbers would allay your
concern.  If you want me to consider a large xenheap to be a problem
on its own, it is now your job to articulate, first, at least one
target system (hardware and configuration) you think would be
problematic;  and secondly, exactly what bad thing you're worried
about happening.  Only then do I have any hope of addressing your
concerns.  Until that time, I don't consider "the xenheap is getting
too large" objection to be valid.

Objections I will consider:
- xenheap has poorer NUMA locality
- The xenheap/vmap split is a big ugly unnecessary bit of technical
debt; Xen would be far better if we could get rid of the xenheap
altogether.  Every additional user of xenheap is another patch in a
series converting xenheap to vmap.

> > One is map_domain_page_irqoff(): If the caller promises to keep
> > interrupts disabled until unmap_domain_page_irqoff(), we can safely
> > perform maps in a context switch without having to worry about
> > sync_lazy_execstate.  (This was actually implemented and almost sent
> > on Tuesday evening, when I noticed your review of Roger's v2 saying,
> > "Question is whether it's a good idea in the first place to start
> > using map_domain_page() from the context switch path.  Surely there
> > are possible alternatives.")  This maps all vcpu pages from the
> > domheap, adding nothing to the xenheap *or* the vmap area.  But it
> > costs 9 map/unmap pairs *per context switch*.
>
> But why would not using vmap() be a necessary conclusion of my initial
> comment? All I'm objecting to are new uses of the xenheap.

I'm trying to list all the advantages and disadvantages of the various
options I've explored.  You've agreed that growing the vmap region is
*also* something we need to worry about; and that the vmap allocator
may not be ready to become a performance-critical part of the system.
Furthermore, as Roger pointed out privately, regardless of where the
global mapping lives (vmap or sparsely-mapped xenheap), having a
global mapping at all means global TLB flushes whenever we destroy a
vCPU; and in any case, in principle we'd like to avoid exposing any
data whatsoever.  Using the mapcache avoids all those problems, for a
different cost.

> > Ultimately, I think there's a lot of wisdom in the saying, "Premature
> > optimization is the root of all evil."
> > ...
> I'm a little puzzled by you talking of "optimization" (premature or
> not) here. In my initial reply I did point out a functional aspect, and
> I made clear that I'm aware that this is going to have a performance
> impact. I.e. quite the opposite of "optimization".

"Optimize" in the terms of "improve", not necessarily in terms of cycle cou=
nt.

The point of the principle is to say this:  First, build it correctly,
in a way that is simple, clear, robust, and easy to write, review, and
maintain.  *Then*, after you've measured that there is a problem,
where there is a problem, and so on, should you put in extra effort
and add extra complication, only to areas where you know there will be
some material benefit.

You've argued that we should avoid using xenheap because it will have
some negative impacts on large systems with sparse memory layouts; in
other words, you're asking me to *optimize* for those use cases, at
the expense of more typical systems.  In isolation, this principle
would say: take the xenheap option first, as it's clean and fast in
the common case, and measure it on a target systems (or at least,
estimate what the impact would be based on modeling).  Once you have
reason to believe there will be a problem, then introduce code
complications based on the actual issue you find.

> > There are other options I've explored:
> >
> > - domheap + vmap; basically, allocate from domheap, map in the vmap
> >   area.  On paper this sounds like the same thing; the problem is that
> >   we don't have a simple MFN -> VA mapping, as we do in the xenheap
> >   case, so the walk is a lot harder; we start to have to do lookups,
> >   significantly increasing the cost over simple memory reads and math.
> >   (This is the difference from the intremap table on the VT-d thread:
> >   that's a leaf structure reached from a single pointer, so a
> >   permanent vmap costs nothing there.  Pagetable hierarchies are
> >   exactly the case where the MFN -> VA step is critical: each entry
> >   read yields an MFN, which the walk has to turn into the next VA.)
>
> The pages used here are entirely private to logic handling those page
> tables. Hence a struct page_info field can very likely be used to stash
> the VA of a permanent mapping. (Feels like similarly I must have
> suggested this somewhere else recently, yet I don't recall the context.)

This is an interesting idea, particularly for a full xenheap -> vmap
change.  Probably too complicated for this series (see below).

> Absolutely, and I have been mentioning the need to consider growing this
> area in a number of situations (one iirc again pretty recently).
...
> Indeed, heavier use of that allocator may require work to be done there.
...
> Valid concern, yet surely possible to deal with.

One thing you do need to consider:  There are at least 45 patches to
get to the most basic form of extra security (no direct-map, FPU/XSAVE
moved to domheap); and another 13 after that to move to per-cpu
stacks.  I'm engaged until November to work on this.  If we don't have
significant progress by then, there may be no ASI at all (at least for
a long time), and thus no hope of getting rid of the xenheap.  If
every batch of 7 patches takes a month to get through, we're not going
to be anywhere close by November.  So you need to be strategic about
what kinds of additional work you ask me to do: what does a solution
look like that is both technically acceptable, and achieves measurable
progress by November?

If we had all the time in the world, we could consider trying to
convert the entire xenheap to vmap as the first step.  (Even on the
fairly large system I tried to describe, the xenheap was only around
3GiB; still plenty of room in the vmap area to get us by until the
direct map is gone.)  I don't think that's really viable, as there's
quite a long tail of allocations that would probably end up being
haggled over before we even began the ASI series itself.

So let's try to take stock.  We can't safely remove the direct-map
unless we have per-vcpu mapcaches.  We can't really say we've isolated
the system while all pCPU stacks, with random bits of guest state, are
visible to all other pCPUs. We can't have per-vcpu mapcaches or
per-CPU stack maps unless we have per-cpu root pagetables for PV
guests.  Both require modifying per-pCPU bits of pagetables of the
incoming vCPU on a context switch.

We have four ways of mapping in general: xenheap, vmap, mapcache, or
(for the pagetables) the linear map.

For the first three, we have several different ways of arriving at the
entries.  Both Roger's v2 and my v1 start at the top and walk down the
pagetables.  For the mapcache, this seems relatively heavy.  I thought
xenheap would be just simple math, but with PDX on all the time,
that's more expensive than it looks.  vmap would require looking into
stashing a pointer into an unused (by xenheap pages) portion of the
struct page_info.

But the other approach is to stash references to just the page we need
to modify -- basically, rather than get rid of gdt_ldt_l1tab, add two
more instances.  For xenheap or vmap, this would be pointers to the
virtual addresses; but it's also possible to do in the mapcache
version, by stashing the mfn of the exact table we need to map.  In
all cases, for the context switch, it's just three references.

Both global-mapping options expose Xen pagetables.  We've agreed these
are not sensitive, but also in general our posture is that we
shouldn't reveal anything unless it buys us something.  They also both
require host-wide TLB shootdowns on vCPU tear-down.

In the spirit of "measure before optimizing", I did some tests of the
mapcache-walk variant.  On my NUC, at the end of the series, I get:

- baseline: 1480 cycles / context switch
- xenheap-walk: 2460 cycles / context switch
- mapcache-walk: 6440 cycles / context switch

By default Xen has a context switch rate limit of 1ms, so the
difference isn't measurable.  If you disable the ratelimit and do a
"ping flood" microbenchmark, the mapcache-walk reduces performance by
a whopping 70% (41k pings per second -> 12k pings per second).

If it weren't for the general intent to move away form xenheap, I'd
argue more strenuously that we should take the series as I've posted
it.  As it stands, I think the performance of mapcache-walk is
acceptable enough for a first cut, particularly given that we have two
potential optimizations already (caching MFNs rather than walking
pagetables as an easy option, switching to vmap as a slightly more
complicated one).

It's annoying that Tuesday evening I didn't know that you hated
xenheap allocations, and had only a mild distaste for mapping in a
context switch, or I might have implemented vmap instead.  At any
rate, I'll move forward with mapcache-walk, which we can later look at
optimizing by stashing the relevant MFNs so we can avoid the walk.

If anyone doesn't like that, let me know sooner rather than later, so
we can avoid wasting more time.

 -George

 -George

