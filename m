Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676B9C5DF81
	for <xen-devel@archiver.kernel.org>; Mon, 24 Aug 2026 09:02:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1398737.1634870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyQZH-000264-9l; Mon, 24 Aug 2026 09:02:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1398737.1634870; Mon, 24 Aug 2026 09:02:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyQZH-00025x-6t; Mon, 24 Aug 2026 09:02:11 +0000
Received: by outflank-mailman (input) for mailman id 1398737;
 Mon, 24 Aug 2026 09:02:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wyQZG-00025r-4L
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 09:02:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wyQZD-001Epp-SN
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 11:02:07 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8c088e-bab6-0a2a0a5309dd-0a2a4502cf2c-2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 11:02:07 +0200
Received: from [209.85.208.53] (helo=mail-ed1-f53.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8c088f-6ca4-0a2a45020019-d155d035a957-3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 11:02:07 +0200
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-6a156627e22so7638100a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 02:02:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c249606b5aasm1154638666b.4.2026.08.24.02.02.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Aug 2026 02:02:05 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787562127; x=1788166927; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WsNyoIyXX9pw8H/0gpGeZi5E86BAgz2aWVDaotX6wYs=;
        b=XarqSKgLfKI26SVijESk7nMQEoEzrYPdIlsS4y5/e8FhDB8Xt6AE18quS66oEz2DP8
         cTWoZVAb+cABM7Sk2pGPmriEMVfmGeA4xejjLUt9aH6RWf9yqlI5Hn8IIPFFlDKEbXFC
         4zV5ScxtgkQ6y20UWm9PKPE7S/fA4GiCQdAvhAOlL8V8WhJjT2SU20IYexCyegO+TmA9
         XBbhFmAXZz56cSkGxxVNcYp4OaeumYY1kWTBT6VGXMT+4PmZKwH1u+ipQUJ6Y/WSI/Ku
         tz7ifR6SfBP2snMWEhHpxMTV5M+hwBEc4xbIbsgFi2ta5PF95CHi0zxeXsIAnpXf3OIF
         BzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787562127; x=1788166927;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WsNyoIyXX9pw8H/0gpGeZi5E86BAgz2aWVDaotX6wYs=;
        b=KORmqhf9zMutK1bDTqi4HeibTDDDqkxulvG2tk2GfoGZYJ/ap8jubM8saw6CdBdTas
         1j1B1yXQ0VoTyJ2jGeaMRugrdHDETFvBiVspdS4GogHqPLaYQdwtIjMLnyALls4N6rTE
         xPLuVALgLxhdwQE200Z3HFEmzoFBjIvI1s8zsjLPHMx1F3l95IueFMwLgHdnBTSHRPT+
         +8/jeQIFllIV2yvUMLn+rMSrJ5D2Yzsf3wOeY/K2+cnZriCHagTMYk6+CpWxym8h71fp
         fLUjiBaEg4HIkwXKxfZOdgOCdH8Z0eVed+VJybb/yKBcyDezymCvz7sUfsLU+8FKy1V0
         di0Q==
X-Forwarded-Encrypted: i=1; AHgh+RopF4s8rR4Lqy7NajfCs2O8A/U8UXcq7kLN46MW0X/C5fDrRtpgjLsK+ktZKurk++hB02YAqS5i4vc=@lists.xenproject.org
X-Gm-Message-State: AFuF++laVkrPXm1yzpmyYZRCmepqJvygWJYQ4mHPkOwQ9sv1+xYVVwHM
	XWQ6HqwFMLzvGWb5qHx6UsxaVZw1m5RuXjr4yviODzXJcWOJxc1Ge2WKZjprw/GJMg==
X-Gm-Gg: AR+sD10xiPEwXegl0a93LfeNa5x2GfzgZ4PKKwdYLjNs+QSD/9gEDMrIe5JpZzn3I0o
	rO0Atr3IPJFsD87adDYH78JMmm4pBB5DwoUoD6zT1ip7VAcEGHaIZMMDaeynvFeBB0c3jGmaUai
	hZG+kQKOUvajGxRBIEFiknV22wsuPITEVD0Lwk9NfPWv/7Pmp6Qahx/vG614fHHk2+bAoR7T77B
	SGYAanNLTbAlr3TJFjC+p+f+cql1RWfVaYpTv33fxDyHEBeoVmObdrHOQh3lF+sXYkryRlcJzBN
	LK4TNneLj7gYHq30B3ZprazfXR+cq++4AnmGLnn5EcURHhDtNMVD0r3rY42y33YU8igFdaJuECS
	CxVex2ysw4aSsAuz9tUDZcve5Y/ch1dJXXvhUKUrLp9O3wLtEcGrGlie/n7ItgSAPsXw47coMub
	v/Cku66mxp4CJo/ots3oDsP64SXEAP+WbMUtSSSDx4f/uL7DhaxcKY3wcUuBniArZYNy42tBYxC
	R/lhAK9Ks6F3L3U4S3/L2nqDYtadNFBSUlWWehzJ4ZR8y+ZiNXn
X-Received: by 2002:a17:907:e1c6:10b0:c24:d6f0:aa0 with SMTP id a640c23a62f3a-c24d6f07ce6mr137547866b.11.1787562125670;
        Mon, 24 Aug 2026 02:02:05 -0700 (PDT)
Message-ID: <044095b7-3c8d-40da-9d21-281c522a49ae@suse.com>
Date: Mon, 24 Aug 2026 11:02:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] x86: Address Space Isolation, part 1: per-domain area
 mapping rework
To: George Dunlap <gwd@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260820-asi-part1-0-f2dbd92b8459@xenproject.org>
 <ec040560-4377-474d-a929-3080b74bb0af@suse.com>
 <CAFLBxZbQD7HgdYK3-yzaMOt4P2geO2PSOSDi4-c3KHZ96DDifg@mail.gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <CAFLBxZbQD7HgdYK3-yzaMOt4P2geO2PSOSDi4-c3KHZ96DDifg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1787562127-319CB2AC-00DA5CA0/0/0
X-purgate-type: clean
X-purgate-size: 12000

On 21.08.2026 17:17, George Dunlap wrote:
> On Fri, Aug 21, 2026 at 9:45 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 20.08.2026 19:43, George Dunlap wrote:
>>> One point reviewers may want to look at specifically: patch 1 changes
>>> where the per-domain page-tables are allocated from, and its commit
>>> message discusses the (minor) NUMA-placement consequence.
>>
>> While I don't recall which recent patch (series) it was, I can't very well
>> say "no new xenheap allocations please" there without also saying so here.
>> I've read over patch 1's description, and while it tries to justify this
>> accordingly, I still remain concerned. I think we simply have to accept
>> the mapping overhead, to avoid allocating from a pool which - over time -
>> is representing a decreasing portion of total memory systems have (on
>> average, and not even considering systems with extremely sparse memory
>> layouts, and with perhaps PDX compression not doing good enough to
>> compensate).
> 
> You should certainly have the same resistance to adding new xenheap
> allocations.  But looking at the numbers, I don't see that we're
> anywhere near the point where we say, "Absolutely no new xenheap
> allocations, regardless of the cost."

Well, that depends, and in part on the longer term plans with ASI. It has
been my (silent) assumption that eventually the directmap would go away
altogether when ASI is in use, with the VA space freed (almost?) all
becoming available for vmap(). With the disappearance of directmap, the
xenheap would naturally disappear as well. Hence putting stuff there in
new work actually adds to our technical debt.

>  domheap+vmap looks like it was
> cheap and easy alternative for Teddy, but the alternatives here
> aren't, compared to the cost of extra xenheap allocations.
> 
> So let's lay everything out.
> 
> My understanding is that we have the following two issues allocating
> things in the xenheap on systems larger than 4T:
> 
> - The total amount of xenheap space is limited to 4 TiB of virtual
>   address space.  On some systems, this may correspond to 4 TiB of
>   actual RAM; but on a machine whose RAM layout is sparser, the
>   actual RAM addressable in this window may be far less
> 
> - It's not symmetric NUMA-wise; so the larger the system, the more of
>   the xenheap will end up being from the same NUMA node.  This will
>   limit Xen's ability to have NUMA-local data structures, and its
>   ability to give NUMA-local data to guests running on node 0.
> 
> Looking at this series as a whole, although the first patch adds pages
> to the xenheap, the end goal of the rest of the work is to remove
> pages from the xenheap. Things added in:
> 
> - Making the perdomain area per-vCPU, with its pagetables allocated
>   from the xenheap, adds a per-vCPU L3 plus an L2+L1 pair for each
>   slot in use.  This totals 5 pages/vCPU for HVM guests and 8 pages/vCPU
>   for PV guests.
> 
>   (Note that the GDT/LDT L1s are already allocated from the xenheap
>   today, but per-domain rather than per-vCPU.)
> 
> Things removed:
> 
> - Per-pCPU stacks -- 8 xenheap pages / pCPU
> 
> - AMD VMCB - one xenheap page / vCPU
> 
> - VMX guest MSR area: 1 page per vCPU
> 
> - sub-page XSAVE areas (~2.7 KiB/vCPU of xmalloc pool today; planned
>   follow-on work aggregating other miscellaneous xmalloc'd guest state
>   should take this to about a page per vCPU)
> 
> To do some math: current security-supported limits for x86 are 4096
> pCPUs on a 12TiB system.  Suppose we have an 8:1 vCPU:pCPU ratio, and
> an average of 8 vcpus per domain.  So 32768 total vCPUs and 4096
> domains.  On a Full ASI system, vcpu-pt on all domains, per-CPU stacks
> on, all Intel HVM domains, we get numbers like the following:
> 
> Added to xenheap:
> 
> - Per-vCPU tables, 5/vCPU (L3; mapcache L2+L1; state-window L2+L1):
>   5 × 32,768 = 163,840 pages = 640 MiB
> - Per-pCPU stack tables, 2/pCPU: 2 × 4,096 = 8,192 pages = 32 MiB
>   (→ 0: these are only written at CPU bring-up and tear-down, so we
>   have already moved them to the domheap in the working branch --
>   which also makes them NUMA-local unconditionally)
> - Per-domain tables: replaced by the per-vCPU sets in vcpu-pt mode → 0
> - Total added: 172,032 pages = 672 MiB
> 
> Removed from xenheap:
> 
> - Stacks, 8/pCPU: 8 × 4,096 = 32,768 pages = 128 MiB
> - XSAVE, ~2.7 KiB/vCPU from the xmalloc pools: 32,768 × 2.7 KiB ≈
>   21,600 pages ≈ 86 MiB (0 if guests get AMX — those areas are domheap
>   today)
> - VMX guest MSR page: lazily allocated, typically absent → 0 (upper
>   bound 128 MiB if every vCPU used one)
> - Total removed: ≈ 54,400 pages ≈ 214 MiB
> 
> Net: +117,600 pages ~ +458 MiB — against a 4 TiB window (0.011%), on
> a 12 TiB host (0.0036%).

While these percentiles in particular of course look very tiny, they are
applicable only on systems having no meaningful gaps in the physical
address map. And even more generally I find all of these calculations
only partly convincing, not the least because you start out from numbers
which look pretty contrived when comparing to actual systems which would
run the new code. (Using more realistic real-system values may end up
going in favor of what you want to convey, or it may not.)

> I have explored a number of other options, to various levels of depth.
> 
> One is map_domain_page_irqoff(): If the caller promises to keep
> interrupts disabled until unmap_domain_page_irqoff(), we can safely
> perform maps in a context switch without having to worry about
> sync_lazy_execstate.  (This was actually implemented and almost sent
> on Tuesday evening, when I noticed your review of Roger's v2 saying,
> "Question is whether it's a good idea in the first place to start
> using map_domain_page() from the context switch path.  Surely there
> are possible alternatives.")  This maps all vcpu pages from the
> domheap, adding nothing to the xenheap *or* the vmap area.  But it
> costs 9 map/unmap pairs *per context switch*.

But why would not using vmap() be a necessary conclusion of my initial
comment? All I'm objecting to are new uses of the xenheap.

> I absolutely reject the idea that because on a 12TiB system with 32k
> PV vCPUs, we take up an extra 0.02% of the xenheap area, that a laptop
> running QubesOS has to do 9 maps and unmaps per context switch.  That
> is not a valid cost/benefits tradeoff.  In the worst case we could
> just add a switch to such a system, allowing people who find their
> xenheap too full to use the mapcache version instead.  (We could even
> turn this on automatically at boot based on projected xenheap
> utilization.)

Maybe, yet extra overhead may be a necessary (but hopefully only
transient) price to pay in the course of the transformation.

> There are other options I've explored:
> 
> - domheap + vmap; basically, allocate from domheap, map in the vmap
>   area.  On paper this sounds like the same thing; the problem is that
>   we don't have a simple MFN -> VA mapping, as we do in the xenheap
>   case, so the walk is a lot harder; we start to have to do lookups,
>   significantly increasing the cost over simple memory reads and math.
>   (This is the difference from the intremap table on the VT-d thread:
>   that's a leaf structure reached from a single pointer, so a
>   permanent vmap costs nothing there.  Pagetable hierarchies are
>   exactly the case where the MFN -> VA step is critical: each entry
>   read yields an MFN, which the walk has to turn into the next VA.)

The pages used here are entirely private to logic handling those page
tables. Hence a struct page_info field can very likely be used to stash
the VA of a permanent mapping. (Feels like similarly I must have
suggested this somewhere else recently, yet I don't recall the context.)

>   And if we're concerned about "xenheap creep", when we have a 4 TiB
>   ceiling, shouldn't we also be worried about "vmap creep", when we
>   have a 64 GiB ceiling?

Absolutely, and I have been mentioning the need to consider growing this
area in a number of situations (one iirc again pretty recently).

> - Stash everything we need; basically, an extension of the current
>   gdt_ldt_l1tab functionality.  Allocate everything from the domheap,
>   map it in the vmap area (moving gdt_ldt_l1tab there as well), keep
>   pointers to all the things we need to modify on context switch, so
>   we don't need to walk the tables.  This would basically be, three
>   pointers per vCPU: a pointer to its GDT/LDT L1, a pointer to its
>   per-vCPU L3, and a pointer to the per-vCPU root_pgt.  (This would
>   put ~384 MiB of mappings into the 64 GiB vmap region -- 0.6%, shared
>   with ioremap and the fixmap -- to avoid 0.02% of the xenheap
>   window.)
> 
> Both the vmap options have two complications, compared to the posted
> option.  One thing to worry about here would be the additional stress
> on the vmap allocator: It's a linear bitmap scan under one global
> lock, designed for dozens-to-hundreds of ioremaps, not ~100k
> long-lived single-page mappings (32k vCPUs x 3 pages per vCPU in the
> "stash everything" case).

Indeed, heavier use of that allocator may require work to be done there.

> The second is that we begin to run into bootstrapping issues.  With
> the xenheap approach, we can begin building and walking pagetables
> very early in boot in the same manner in which they'll be walked
> throughout Xen's lifecycle.  With the vmap approach, we need to deal
> with the fact that the vmap area itself isn't up until later.

Valid concern, yet surely possible to deal with.

> The final option I looked at was mapping the incoming vcpu's linear
> map to edit it ("altlinmap").  That still adds a map/unmap per context
> switch, and requires some additional complication to handle
> ASI/non-ASI systems.
> 
> Xen already consistently allocates its page tables from the xenheap
> whenever it needs to access them during a context switch:
> alloc_xen_pagetable() has allocated from the domheap since Hongyan's
> directmap-removal preparation (those tables are only ever walked in
> contexts where map_domain_page() works), but XPTI's per-CPU root_pgt
> is alloc_xenheap_page(), precisely because it has to be written on the
> context-switch path.  The same for the PV GDT / LDT L1 tables.  The
> series follows the same rule for the same reason.

"Rule" is a strong word. XPTI at the time needed to be done quickly.
The inability to map_domain_page() from the context switch path left
xenheap as the only viable option. Whereas with ASI, as said at the
top, phasing out directmap (and hence xenheap) as a concept is (imo) a
mid- to long-term goal.

> Ultimately, I think there's a lot of wisdom in the saying, "Premature
> optimization is the root of all evil."  As I said, it's certainly
> right to be on our guard against adding things to xenheap, and look at
> alternatives; but we're nowhere near the point where we need to say,
> "Absolutely nothing added, regardless of the cost."  The design here
> is not locking us into the pages long-term; alternate designs have a
> significant cost in terms of authoring, reviewing, code complexity and
> maintenance, and code performance.  At such time as we find systems
> where the xenheap allocations introduced in this series become a
> problem, we have a number of potential ways to mitigate the problem,
> including switching to mapcache *on systems with the problem*, or
> switching to a number of the other more complicated approaches.

I'm a little puzzled by you talking of "optimization" (premature or
not) here. In my initial reply I did point out a functional aspect, and
I made clear that I'm aware that this is going to have a performance
impact. I.e. quite the opposite of "optimization".

Jan

