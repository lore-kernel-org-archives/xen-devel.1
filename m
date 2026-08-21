Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF09BC5DF94
	for <xen-devel@archiver.kernel.org>; Fri, 21 Aug 2026 15:17:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1397586.1634629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wxQzo-0004a6-Pq; Fri, 21 Aug 2026 15:17:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1397586.1634629; Fri, 21 Aug 2026 15:17:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wxQzo-0004Zz-LS; Fri, 21 Aug 2026 15:17:28 +0000
Received: by outflank-mailman (input) for mailman id 1397586;
 Fri, 21 Aug 2026 15:17:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1wxQzn-0004Zt-Tf
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2026 15:17:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wxQzn-00Ffpw-2B
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2026 15:17:27 +0000
Received: from mail-lf1-f46.google.com ([209.85.167.46])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wxQzn-00BBRT-11
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2026 15:17:27 +0000
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5b29599b81cso1373339e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 21 Aug 2026 08:17:27 -0700 (PDT)
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
	bh=T1PpgdtQwbwMYo5qfX3DzMgUut62FE++zqKeHeljF68=; b=Um7JnCXCxteR0aF45/GlNfgiOU
	q/7OI2ZhIa+IA3pJDbL4UXKjR6tTtnjeYfqUeTIFlgXDN8lO9VViXX9L3XkKjhH+8fBLC0DXbNCsF
	rZ+o/S231MQaET31I9wAnSLz8lXEHSgq43T6DfjF4lYX/3TFtxUulmQQ39vr/Jsyahkc=;
X-Forwarded-Encrypted: i=1; AHgh+RqXWFMDdkDIAKZSEcHtC0y5MxptK3Ovt7gfUjeqTiwl2qmMPL6P8LA29pSJcdDn8QxVFEFWsNofbcs=@lists.xenproject.org
X-Gm-Message-State: AFuF++lh6CY3BO83jgCXv4J2HnSY5OsnUvTuZWb2HPe+koT3RqufDgrt
	WTh5XMzmKWltXfZpsMPgvKjWsaMA+iW594J7LEtnxYMmYGelJF3SX8sr0019sCCmiVt2xCO5iaa
	PeysVAuS34KZS0LcZlBj388GX+yr8n0o=
X-Received: by 2002:a05:6512:12d2:b0:5ae:bf31:54ed with SMTP id
 2adb3069b0e04-5b4841e89cbmr2139198e87.7.1787325446029; Fri, 21 Aug 2026
 08:17:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260820-asi-part1-0-f2dbd92b8459@xenproject.org> <ec040560-4377-474d-a929-3080b74bb0af@suse.com>
In-Reply-To: <ec040560-4377-474d-a929-3080b74bb0af@suse.com>
From: George Dunlap <gwd@xenproject.org>
Date: Fri, 21 Aug 2026 16:17:13 +0100
X-Gmail-Original-Message-ID: <CAFLBxZbQD7HgdYK3-yzaMOt4P2geO2PSOSDi4-c3KHZ96DDifg@mail.gmail.com>
X-Gm-Features: AcwNN1W2W86zxeq2b6bOTUIXo21OgaFUEH1osK008rlWSMtOz2Kn24olPD2OdBc
Message-ID: <CAFLBxZbQD7HgdYK3-yzaMOt4P2geO2PSOSDi4-c3KHZ96DDifg@mail.gmail.com>
Subject: Re: [PATCH 0/7] x86: Address Space Isolation, part 1: per-domain area
 mapping rework
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 9:45=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 20.08.2026 19:43, George Dunlap wrote:
> > One point reviewers may want to look at specifically: patch 1 changes
> > where the per-domain page-tables are allocated from, and its commit
> > message discusses the (minor) NUMA-placement consequence.
>
> While I don't recall which recent patch (series) it was, I can't very wel=
l
> say "no new xenheap allocations please" there without also saying so here=
.
> I've read over patch 1's description, and while it tries to justify this
> accordingly, I still remain concerned. I think we simply have to accept
> the mapping overhead, to avoid allocating from a pool which - over time -
> is representing a decreasing portion of total memory systems have (on
> average, and not even considering systems with extremely sparse memory
> layouts, and with perhaps PDX compression not doing good enough to
> compensate).

You should certainly have the same resistance to adding new xenheap
allocations.  But looking at the numbers, I don't see that we're
anywhere near the point where we say, "Absolutely no new xenheap
allocations, regardless of the cost."  domheap+vmap looks like it was
cheap and easy alternative for Teddy, but the alternatives here
aren't, compared to the cost of extra xenheap allocations.

So let's lay everything out.

My understanding is that we have the following two issues allocating
things in the xenheap on systems larger than 4T:

- The total amount of xenheap space is limited to 4 TiB of virtual
  address space.  On some systems, this may correspond to 4 TiB of
  actual RAM; but on a machine whose RAM layout is sparser, the
  actual RAM addressable in this window may be far less

- It's not symmetric NUMA-wise; so the larger the system, the more of
  the xenheap will end up being from the same NUMA node.  This will
  limit Xen's ability to have NUMA-local data structures, and its
  ability to give NUMA-local data to guests running on node 0.

Looking at this series as a whole, although the first patch adds pages
to the xenheap, the end goal of the rest of the work is to remove
pages from the xenheap. Things added in:

- Making the perdomain area per-vCPU, with its pagetables allocated
  from the xenheap, adds a per-vCPU L3 plus an L2+L1 pair for each
  slot in use.  This totals 5 pages/vCPU for HVM guests and 8 pages/vCPU
  for PV guests.

  (Note that the GDT/LDT L1s are already allocated from the xenheap
  today, but per-domain rather than per-vCPU.)

Things removed:

- Per-pCPU stacks -- 8 xenheap pages / pCPU

- AMD VMCB - one xenheap page / vCPU

- VMX guest MSR area: 1 page per vCPU

- sub-page XSAVE areas (~2.7 KiB/vCPU of xmalloc pool today; planned
  follow-on work aggregating other miscellaneous xmalloc'd guest state
  should take this to about a page per vCPU)

To do some math: current security-supported limits for x86 are 4096
pCPUs on a 12TiB system.  Suppose we have an 8:1 vCPU:pCPU ratio, and
an average of 8 vcpus per domain.  So 32768 total vCPUs and 4096
domains.  On a Full ASI system, vcpu-pt on all domains, per-CPU stacks
on, all Intel HVM domains, we get numbers like the following:

Added to xenheap:

- Per-vCPU tables, 5/vCPU (L3; mapcache L2+L1; state-window L2+L1):
  5 =C3=97 32,768 =3D 163,840 pages =3D 640 MiB
- Per-pCPU stack tables, 2/pCPU: 2 =C3=97 4,096 =3D 8,192 pages =3D 32 MiB
  (=E2=86=92 0: these are only written at CPU bring-up and tear-down, so we
  have already moved them to the domheap in the working branch --
  which also makes them NUMA-local unconditionally)
- Per-domain tables: replaced by the per-vCPU sets in vcpu-pt mode =E2=86=
=92 0
- Total added: 172,032 pages =3D 672 MiB

Removed from xenheap:

- Stacks, 8/pCPU: 8 =C3=97 4,096 =3D 32,768 pages =3D 128 MiB
- XSAVE, ~2.7 KiB/vCPU from the xmalloc pools: 32,768 =C3=97 2.7 KiB =E2=89=
=88
  21,600 pages =E2=89=88 86 MiB (0 if guests get AMX =E2=80=94 those areas =
are domheap
  today)
- VMX guest MSR page: lazily allocated, typically absent =E2=86=92 0 (upper
  bound 128 MiB if every vCPU used one)
- Total removed: =E2=89=88 54,400 pages =E2=89=88 214 MiB

Net: +117,600 pages ~ +458 MiB =E2=80=94 against a 4 TiB window (0.011%), o=
n
a 12 TiB host (0.0036%).

An AMD HVM fleet would include VMCB removal (32,768 pages =3D 128 MiB) =E2=
=86=92
net +330 MiB. A PV fleet is the worst case =E2=80=94 8 tables/vCPU (add
GDT/LDT L2+L1 and the per-vCPU root) =E2=86=92 1,056 MiB added, 214 removed=
,
net +842 MiB.

I have explored a number of other options, to various levels of depth.

One is map_domain_page_irqoff(): If the caller promises to keep
interrupts disabled until unmap_domain_page_irqoff(), we can safely
perform maps in a context switch without having to worry about
sync_lazy_execstate.  (This was actually implemented and almost sent
on Tuesday evening, when I noticed your review of Roger's v2 saying,
"Question is whether it's a good idea in the first place to start
using map_domain_page() from the context switch path.  Surely there
are possible alternatives.")  This maps all vcpu pages from the
domheap, adding nothing to the xenheap *or* the vmap area.  But it
costs 9 map/unmap pairs *per context switch*.

I absolutely reject the idea that because on a 12TiB system with 32k
PV vCPUs, we take up an extra 0.02% of the xenheap area, that a laptop
running QubesOS has to do 9 maps and unmaps per context switch.  That
is not a valid cost/benefits tradeoff.  In the worst case we could
just add a switch to such a system, allowing people who find their
xenheap too full to use the mapcache version instead.  (We could even
turn this on automatically at boot based on projected xenheap
utilization.)

There are other options I've explored:

- domheap + vmap; basically, allocate from domheap, map in the vmap
  area.  On paper this sounds like the same thing; the problem is that
  we don't have a simple MFN -> VA mapping, as we do in the xenheap
  case, so the walk is a lot harder; we start to have to do lookups,
  significantly increasing the cost over simple memory reads and math.
  (This is the difference from the intremap table on the VT-d thread:
  that's a leaf structure reached from a single pointer, so a
  permanent vmap costs nothing there.  Pagetable hierarchies are
  exactly the case where the MFN -> VA step is critical: each entry
  read yields an MFN, which the walk has to turn into the next VA.)
  And if we're concerned about "xenheap creep", when we have a 4 TiB
  ceiling, shouldn't we also be worried about "vmap creep", when we
  have a 64 GiB ceiling?

- Stash everything we need; basically, an extension of the current
  gdt_ldt_l1tab functionality.  Allocate everything from the domheap,
  map it in the vmap area (moving gdt_ldt_l1tab there as well), keep
  pointers to all the things we need to modify on context switch, so
  we don't need to walk the tables.  This would basically be, three
  pointers per vCPU: a pointer to its GDT/LDT L1, a pointer to its
  per-vCPU L3, and a pointer to the per-vCPU root_pgt.  (This would
  put ~384 MiB of mappings into the 64 GiB vmap region -- 0.6%, shared
  with ioremap and the fixmap -- to avoid 0.02% of the xenheap
  window.)

Both the vmap options have two complications, compared to the posted
option.  One thing to worry about here would be the additional stress
on the vmap allocator: It's a linear bitmap scan under one global
lock, designed for dozens-to-hundreds of ioremaps, not ~100k
long-lived single-page mappings (32k vCPUs x 3 pages per vCPU in the
"stash everything" case).

The second is that we begin to run into bootstrapping issues.  With
the xenheap approach, we can begin building and walking pagetables
very early in boot in the same manner in which they'll be walked
throughout Xen's lifecycle.  With the vmap approach, we need to deal
with the fact that the vmap area itself isn't up until later.

The final option I looked at was mapping the incoming vcpu's linear
map to edit it ("altlinmap").  That still adds a map/unmap per context
switch, and requires some additional complication to handle
ASI/non-ASI systems.

Xen already consistently allocates its page tables from the xenheap
whenever it needs to access them during a context switch:
alloc_xen_pagetable() has allocated from the domheap since Hongyan's
directmap-removal preparation (those tables are only ever walked in
contexts where map_domain_page() works), but XPTI's per-CPU root_pgt
is alloc_xenheap_page(), precisely because it has to be written on the
context-switch path.  The same for the PV GDT / LDT L1 tables.  The
series follows the same rule for the same reason.

Ultimately, I think there's a lot of wisdom in the saying, "Premature
optimization is the root of all evil."  As I said, it's certainly
right to be on our guard against adding things to xenheap, and look at
alternatives; but we're nowhere near the point where we need to say,
"Absolutely nothing added, regardless of the cost."  The design here
is not locking us into the pages long-term; alternate designs have a
significant cost in terms of authoring, reviewing, code complexity and
maintenance, and code performance.  At such time as we find systems
where the xenheap allocations introduced in this series become a
problem, we have a number of potential ways to mitigate the problem,
including switching to mapcache *on systems with the problem*, or
switching to a number of the other more complicated approaches.

 -George

