Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2079C61DB9
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2026 14:41:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399286.1635440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wysKm-00069N-CW; Tue, 25 Aug 2026 14:41:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399286.1635440; Tue, 25 Aug 2026 14:41:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wysKm-00069G-9i; Tue, 25 Aug 2026 14:41:04 +0000
Received: by outflank-mailman (input) for mailman id 1399286;
 Tue, 25 Aug 2026 14:41:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1wysKl-00069A-0e
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 14:41:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wysKk-004zYK-37
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 14:41:02 +0000
Received: from mail-yx1-f41.google.com ([74.125.224.41])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wysKk-009gMc-21
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 14:41:02 +0000
Received: by mail-yx1-f41.google.com with SMTP id
 956f58d0204a3-66d07ddf077so3622624d50.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 07:41:02 -0700 (PDT)
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
	bh=zZqurIMiQ8XRcdYQqTxXeKAok7x6pdmHT8SXFDedHMo=; b=ceVLHMHEZUYiykGAZxyClZrtEN
	8u6NKuRr2xeNVOCm8sNHnN3Dx4Zo9hk9S3zZLqZBSh0e7TEzG2adHDFwhyL1dpr6Dt7tRmI5Pm//X
	uB+Kiwxyn++xzI+u8J+CeXXCFAawPGzf7ypvlS+5GsQ+cCwDFPwgkwF7cj2lWD5I1vEg=;
X-Forwarded-Encrypted: i=1; AHgh+RrkelFwstXg97omnpUe/0qQ6KTXrGkAj+LguPer+ag5CwVQO0bmQzyi1nxeARPWl/8im+2UyeHfMDk=@lists.xenproject.org
X-Gm-Message-State: AFuF++lkyelrxD0BnCIdgAeIByAgY7sHDbUe39pnRvnaxaVMhJZgNiTH
	NRLm/Ik9oaQWYvvMQ088cgsAUenVOqtqUWHH8Hsbj8VE6UqXsFtPFhsZtNwdEvNkTutCrG4I7WG
	YcS/0I1N4ZJc/5SwvLruegKOM2uCSL0k=
X-Received: by 2002:a05:690e:120c:b0:66d:1a5a:1d27 with SMTP id
 956f58d0204a3-66d1a5a1ecdmr1885941d50.12.1787668862196; Tue, 25 Aug 2026
 07:41:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260820-asi-part1-0-f2dbd92b8459@xenproject.org>
 <ec040560-4377-474d-a929-3080b74bb0af@suse.com> <CAFLBxZbQD7HgdYK3-yzaMOt4P2geO2PSOSDi4-c3KHZ96DDifg@mail.gmail.com>
 <044095b7-3c8d-40da-9d21-281c522a49ae@suse.com> <CAFLBxZa0Fmmic1JLwHOdFCn1=rGP6Un2q1ZxBa1DpsO_AAmD6A@mail.gmail.com>
 <f34b38e3-4f77-49e2-a69f-aea153f53787@suse.com>
In-Reply-To: <f34b38e3-4f77-49e2-a69f-aea153f53787@suse.com>
From: George Dunlap <gwd@xenproject.org>
Date: Tue, 25 Aug 2026 15:40:48 +0100
X-Gmail-Original-Message-ID: <CAFLBxZZKyuXc0j08Q9wqsHXVGD1LPSLB=Fxx6XLFsBQgzjrOmw@mail.gmail.com>
X-Gm-Features: AcwNN1Wc9W-MLBwND-XdCKd5XmrEINpG2L0AcF0qEOn3XZC3C8UxPLggJ6PUilU
Message-ID: <CAFLBxZZKyuXc0j08Q9wqsHXVGD1LPSLB=Fxx6XLFsBQgzjrOmw@mail.gmail.com>
Subject: Re: [PATCH 0/7] x86: Address Space Isolation, part 1: per-domain area
 mapping rework
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 2:28=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 25.08.2026 13:42, George Dunlap wrote:
> > On Mon, Aug 24, 2026 at 10:02=E2=80=AFAM Jan Beulich <jbeulich@suse.com=
> wrote:
> >> While these percentiles in particular of course look very tiny, they a=
re
> >> applicable only on systems having no meaningful gaps in the physical
> >> address map. And even more generally I find all of these calculations
> >> only partly convincing, not the least because you start out from numbe=
rs
> >> which look pretty contrived when comparing to actual systems which wou=
ld
> >> run the new code. (Using more realistic real-system values may end up
> >> going in favor of what you want to convey, or it may not.)
> >
> > To be honest, I'm inclined to think that they're not very convincing
> > because you don't actually have an idea what the problem is.  You
> > didn't specify what you were worried about, so I tried to guess a
> > scenario that I considered 95th-percentile worse case.  I don't know
> > what kinds of sparse memory layout machines you have in mind -- are
> > they written down anywhere, so that contributors can read and
> > understand what they need to consider *before* implementing?  Even now
> > you haven't even said what about my scenario you consider unrealistic,
> > much less told me parameters you think are more realistic.
>
> What I specifically considered unrealistic is that you use huge pCPU and
> vCPU counts. Yes, you're trying to do a worst case estimate, yet at the
> same time you're assuming huge amounts of memory to be available (which
> doesn't represent a "worst case").

Let me point out that you still haven't named exact numbers -- you're
still offloading that to me to try to guess or imagine.

The v1 series I posted adds a few pages per vCPU and a few pages per
pCPU into the xenheap. The problem is using up too much of the xenheap
address space.  So obviously to make a reasonable worst-case that
you're not going to dismiss as contrived, I need to maximize my pCPU
count and vCPU count.  pCPUs is easy -- we're documented as supporting
4096.  How many is a reasonable number of domains and vcpus?  Well, in
general, pCPUs are an effective limit to how many vCPUs you have total
on the system; an 8:1 vCPU overcommit is high, but not preposterously
high.

I don't understand your point about huge amounts of memory.  If you're
talking about *total RAM used*, it doesn't matter whether it comes
from the domheap or the xenheap.  The only possible reason to say
domheap is OK but xenheap is not is if you're concerned about RAM
above the 4TiB boundary.  Which can only happen on system with large
amounts of RAM, or systems with really sparse memory layouts.  Does
the analysis really change at all whether you're using 12TiB or 6TiB?

> As to sparse layouts - ones which have led to the two forms of PDX
> compression are well known (I think). The need for more recent (offset)
> form is a good example of what could go wrong here: New machines can
> always come with new layouts, potentially requiring new compressions
> approaches. So what I'm concerned about is effectively _any_ sparse
> layout that we may encounter without having a suitable PDX compression
> method readily available.

"There may be some new layout that doesn't compress well" -- it's not
uncommon for random bits of new hardware not to work well until we
supply a patch to fix it.  The position you're supporting is
effectively: "We must absolutely avoid a situation where some unknown
system is temporarily restricted in how many vCPUs it can create due
to a sparse address space, even if it means making the context switch
4x as expensive for every single current user."  I just don't think
that's a reasonable position in any shape or form.

> > I don't even know exactly what failure mode you're worried about.  Two
> > kinds of potential failures I know about:
> >  - Performance impacted because pages can't be NUMA-local
> >  - Toolstack operations (including domain creation) fail because
> > xenheap has been exhausted.
>
> One thing I can't help thinking you keep overlooking throughout your
> reply: xenheap and domheap aren't separate. There being only a
> relatively small part of it needed for the worst case estimate you did
> means nothing as to exhausting the xenheap in practice: Almost the
> entirety of it (with the DMA reserve being somewhat protected) can be
> used to build domains. Once in that state, allocations would fail no
> matter that large swathes of domheap might (have become) available
> (again).

Right, so if Xen allocates too much domheap from the directmap region,
the xenheap may be not be able to allocate any more, even if there's
plenty of memory.

So something like the following:

We have 8TiB of RAM, 4 nodes, 2TiB per node.  The user wants to start
4 2TiB guests, one pinned to each node; so she starts d1 on node 1, d2
on node 2, then tries d3 and can't start it because although there's
still 4TiB of RAM left, all the memory below 4TiB was handed out to
guests already.

Is that what you had in mind?

If I didn't agree that the xenheap represents technical debt that
needs to be removed anyway, I'd say a simpler solution would be to do
do some simple xenheap reservation, based on various factors
(including number of pCPUs, and the total amount of RAM).  Reserving
6GiB on an 8TiB system would have very little impact (the first guest
would either need to be a bit smaller, or have, and would make the
whole problem go away essentially.  The first guest would either need
to be less than 0.1% smaller, or have 0.1% of its pages on a different
node.

> That said, with what you indicated at the very bottom of your reply,
> it looks like this part of the discussion has become largely moot.

Yes, but I also want to challenge your operating principles -- to get
you to state more clearly what you're concerned about.  Also, in order
to either get you to relax a bit about the xenheap growing, or to help
you articulate more clearly what problems which contributors need to
address.

 -George

