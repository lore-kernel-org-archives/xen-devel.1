Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA265C5B572
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 14:03:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390073.1630613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuW1g-0003RE-2l; Thu, 13 Aug 2026 14:03:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390073.1630613; Thu, 13 Aug 2026 14:03:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuW1g-0003R7-01; Thu, 13 Aug 2026 14:03:20 +0000
Received: by outflank-mailman (input) for mailman id 1390073;
 Thu, 13 Aug 2026 14:03:18 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wuW1e-0003R1-5n
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 14:03:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuW1d-00HZiu-3n
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 16:03:17 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a7dce9f-bab6-0a2a0a5309dd-0a2a45099be2-28
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 16:03:16 +0200
Received: from [209.85.128.172] (helo=mail-yw1-f172.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a7dcea3-be1a-0a2a45090019-d15580acc893-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 16:03:16 +0200
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-81f36179dd5so10605467b3.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 07:03:16 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1786629795; cv=none;
        d=google.com; s=arc-20260327;
        b=igB5IDyzr93WiYxNuj293fS883n6MSY0S382ujMN4ATe1J5O3L480z1og1u4hwQcSL
         X26CsN4luZ0qWFsLBtsLwqjgFmJF2BypdWNPAB23aSEVe9/Ht0XmzyBTA6ETHNYcrpIp
         5c8sDXi5F20UWV96YvggRoyqKZA/rpsBIpnPX+liLsv//BNJ5tu0Dr/Twc+xGsuNWlYM
         4486zZAaoeoaV9+D9QJJofR+OR6t+9ZbWZYJgDDmyqBK+Thq39YBTWcGJdOfNywXrpKS
         awxAnebrQ3ovr3EcDXY+vT1zvTJPFv5Te0LUiCZ8djkY+B2Rj9+5Q7Yz92P9q8l6dDdf
         kd5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Of5rvemQeCFqBmvYnQWhIYlZsk0aVpfQH25dAfabLow=;
        fh=hGIdO2/3uysETl3h1Zw8zyADHc9dFoxunl2fWgcPhGY=;
        b=lwrrDXZTX9f+XqIPLNSvpxY9vgofBuietpFfC3JFu/3Jn28+AvC0WUWK8/i5EpGig4
         F42Rt9GqIJ3infxjvmlnPQLiTn9MS3a8RCXW6Xw8DDcWVKOQuBQO4Mtn5ZCtRNid01ld
         tT0kAs3M1jfPQ+tdf5UOoTcMZDVPCiuyfVHAsL2ut6jsJVKlPYd52SGhKE1T11RGrcnC
         RvEvMPSQcaXQlJl2lH0RXIv4XG2wGBxnCZD/yknE0aAniE/BoZfpRJ3lgib3N3VonTWP
         h3b6Z2JJIBPRSWa5YXxs42ElyVasOKmqDPDRV44OLz9u5GZ7pqgXDXVBbe5YHhrczJm+
         E7cA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786629795; x=1787234595; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Of5rvemQeCFqBmvYnQWhIYlZsk0aVpfQH25dAfabLow=;
        b=fAEesbBpIKJQyybFwNR/h3m67r8ObxjTEWXy1C8p3soDJyYZDnFWjoiMFrDwyqi+4j
         RodIWmqDX0Zpg/iAPKTEm7TAUP/Cwzb2Gb0c/H8R3zIWU3JU6fKsnNbsX4mxVGb285Mo
         tEcEU1JKzgqgq4Foa4ijbd2qpKkmsS7M8z0nYiqfrGHupdbSDOWH4/kbsFjdNmX1QTWF
         oPrO/ETTnxS1eku70fKzF3bg+A9kpS2rySHdfUz0O6GsGSfaxHqqTQv5vqw0Pm2H1zep
         VvZsYu2s2sZ3UfzX6KiViRjm8peODoLVvYx46lcX1b5JtLZM13xXUNRW1YxqsyfQHna7
         MozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786629795; x=1787234595;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Of5rvemQeCFqBmvYnQWhIYlZsk0aVpfQH25dAfabLow=;
        b=KJph3d3qAFabqQR1eWvJQGv6V13UIddo8/3b3b0JACEHcxoIyfSx3Qf+9HVb+GPuxI
         Op5YnLOCWWuWuUpOnLWVZKBB9YgZ1WWz1kdV/9ggOvjBEtcRwaY/DkkuXhebSnRnxPwv
         c9FkBdAJClNpONwlDbjIKI5njurPDarF1Cdh8N6IA01KNa04gnqMDvxZ7Saj26bHQEx3
         +5Uj8r+7k1Q7hMfZpGc/1PzCchCxVKnxiBAn2YpNNR5nK9gbKMVBx73+ImB1WuVtC1kb
         nstkufOPVEPf0VctV/HMK2iYd0gz7C9+uibUw2lQZ3FRtwAnA7G+QpTx4ShpkWxAKDnT
         T6fQ==
X-Forwarded-Encrypted: i=1; AHgh+RpdUKtw6/wqicjRPYNnaGjHD1h/+LCgE7X4llunyhBtAoYj1aW+oAXPqL/r9DJo2/x0lE3UFKLnoks=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyt/7YEtVsQYHOteYoyIm2Tpe0XHKB3E1b20X69zqg4DXSRfpTJ
	IQtyqvl8jscwnhQ2mP+z00Eu142eWGXxApp56CkJVcmvZC3jXV4S9ZbYM1bkrRGAR9ev9mxE2Vo
	2Yko+FIRBTW5UMn8cvVBv1GskyWuPQD8=
X-Gm-Gg: AR+sD104hUf/BIY/nEI21rQP0mpHhjksLvS6MpJf1keaoBPkLEKmTtFs9LZNsM0PFoK
	o0CJc1xIFaGXBL1DUIa08XF9tQOiwl4hxmkOjhXRUu9Zf/yV65TyJ6wKBgWvbWAo5YhJfit+32l
	as+9bXSjGrzYP9bv8vUTCj7LhEkIBe6HXxA3d3ymDZ5TZF4hf9AwsDruNvLhPSxmaidHd8lCPln
	dewuof2bfSrkxSqjS9XbqYbhgP2/Kb8BJCWt9uKWkRfh/n1iyaXwY7EKdCoFEb0lPWqL8yWd97w
	kRkZgZno7tbzvecJE8ndljejguItj3JZisk2IYOjpmymISOzpWiEodR8uHk1qsJh29lRtyUjdR4
	f
X-Received: by 2002:a05:690c:60c5:b0:81e:8d96:a64 with SMTP id
 00721157ae682-83471fe8113mr32081087b3.13.1786629793581; Thu, 13 Aug 2026
 07:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260810103018.54564-1-frediano.ziglio@citrix.com>
 <20260810103018.54564-8-frediano.ziglio@citrix.com> <43d1ce4a-3a49-42c9-b277-47a89698513f@suse.com>
In-Reply-To: <43d1ce4a-3a49-42c9-b277-47a89698513f@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Thu, 13 Aug 2026 15:03:01 +0100
X-Gm-Features: AUfX_mzgHJiRrj_LcYCGgnUsfNRft_1T6cArPcQpli6QahfyG6F8nZA_51o4DCA
Message-ID: <CAHt6W4enamC9rVMK98+q=pWCuXQL1DPgNTCGWMVR-Q2NvX8uTw@mail.gmail.com>
Subject: Re: [PATCH v10 7/10] xen: implement new foreign copy hypercall
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, 
	Juergen Gross <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-bad1c0/1786629796-FC212034-A10C5EA6/0/0
X-purgate-type: clean
X-purgate-size: 14403

On Thu, 13 Aug 2026 at 10:41, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 10.08.2026 12:30, Frediano Ziglio wrote:
> > Add a sub hypercall to __HYPERVISOR_memory_op to allow to read/write
> > memory from/to a foreign domain.
> >
> > Extending MMUEXT_COPY_PAGE seems better on first sight but considering
> > that MMUEXT is meant for PV only and trying to change that sub-op this
> > solution is better.
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
>
> First: Can you please update your recipient list before sending a new version?
> Roger's move pre-dates this submission by quite a few days.
>

Yes, updated, I realized it after sending it.

> Then: The asymmetry of the new sub-op also continues to have no justification
> at all. If you insist on not using two (domid,list-of-gfns) tuples to describe
> the buffers, despite multiple maintainers having asked you to do so, please
> put down a word explaining that decision.
>

All other maintainers, after replying to their comments didn't
disagree with me, and this was different versions before, so stop
counting them, it's only you that don't like this at the moment.
I already explained why this is consistent with all other current hypercall.
I asked for a practical change to the API and nobody (including you)
has a proposal. I made a proposal and nobody replied to it.
If the issue is just adding a comment in the commit message I can do it.

> > ---
> >  xen/common/memory.c         | 149 ++++++++++++++++++++++++++++++++++++
> >  xen/include/public/memory.h |  45 ++++++++++-
> >  xen/include/xsm/dummy.h     |  14 ++++
> >  xen/include/xsm/hooks.h     |   2 +
> >  xen/xsm/flask/hooks.c       |  10 +++
> >  5 files changed, 219 insertions(+), 1 deletion(-)
>
> As before: If you insist on not implementing the compat case, that decision
> wants justifying in the description. Without that it'll look like an
> oversight.
>

Yes, I was just going to reply.
I spent multiple days trying to implement the compat case or simply
HVM support with an issue after the other:
- multiple distributions removed the 32 bit support so it was hard to
have a setup;
- the original hypercall this PR is trying to optimise is supported
only in PV (so no HVM or compat guests);
- migration and other operations can work only on PV (like dm_op
operation) due to the usage of userspace handles used.
I tried to bypass the above limitations to have the new hypercall
tested and I manage to have 64 bit HVM working but the result is a
collection of nasty hacks and supporting them properly is a different
bigger task.
Surely a comment in the commit message on this is worth it.

> > --- a/xen/common/memory.c
> > +++ b/xen/common/memory.c
> > @@ -1548,6 +1548,141 @@ static int acquire_resource(
> >      return rc;
> >  }
> >
> > +/*
> > + * The "noinline" qualifier avoids the compiler to create a large function
> > + * consuming quite a lot of stack.
> > + */
> > +static int noinline mem_foreigncopy(
>
> I'm wondering: Is the "mem" prefix really meaningful for a static function in
> a file named memory.c?
>

Changed

> > +    XEN_GUEST_HANDLE_PARAM(xen_foreigncopy_t) arg)
> > +{
> > +    struct domain *d, *const currd = current->domain;
>
> With the comment on the new XSM hooks (below) in mind: currd wants to be
> pointer-to-const.
>

Just rebased on master, all XSM hooks accept no-const pointers to domains.
So the suggested change would create warnings.

> > +    xen_foreigncopy_t copy;
> > +    int rc, direction;
>
> Plain int for rc is fine of course, but direction can't go negative, can it?
>

No, but the default type for constants is int and "flags" is promoted to int.

> > +    if ( copy_from_guest(&copy, arg, 1) )
> > +        return -EFAULT;
> > +
> > +    if ( copy.flags & ~XENMEM_foreigncopy_direction )
> > +        return -EINVAL;
> > +
> > +    direction = copy.flags & XENMEM_foreigncopy_direction;
> > +
> > +    d = rcu_lock_domain_by_any_id(copy.domid);
> > +    if ( !d )
> > +        return -ESRCH;
> > +
> > +    /*
> > +     * Check we are allowed to map and access these foreign pages.
> > +     */
>
> This really means to be a single-line comment.
>

Changed.

> > +    if ( direction == XENMEM_foreigncopy_from )
> > +        rc = xsm_foreigncopy_from(XSM_TARGET, currd, d);
> > +    else
> > +        rc = xsm_foreigncopy_to(XSM_TARGET, currd, d);
> > +    if ( rc )
> > +        goto out;
> > +
> > +    while ( copy.nr_frames )
> > +    {
> > +        /*
> > +         * Arbitrary size.  Not too much stack space, and a reasonable stride
> > +         * for continuation checks.
> > +         */
> > +        xen_pfn_t gfn_list[32];
> > +        unsigned int todo = MIN(ARRAY_SIZE(gfn_list), copy.nr_frames);
> > +
> > +        rc = -EFAULT;
> > +        if ( copy_from_guest(gfn_list, copy.frame_list, todo) )
> > +            goto out;
> > +
> > +        for ( unsigned int i = 0; i < todo; i++ )
> > +        {
> > +            struct page_info *foreign_page;
> > +            mfn_t foreign_mfn;
> > +            void *foreign;
> > +            p2m_type_t p2mt;
> > +            p2m_query_t q = (direction == XENMEM_foreigncopy_to) ?
> > +                            P2M_ALLOC | P2M_UNSHARE : P2M_ALLOC;
> > +
> > +            foreign_page = get_page_from_gfn(d, gfn_list[i], &p2mt, q);
>
> Is there a reason check_get_page_from_gfn() can't or shouldn't be used here?
> That would then also make this code properly deal with shared pages, and
> refuse use against MMIO ones.
>

It seems sensible, I didn't know it, I'll try it.

> > +            if ( unlikely(p2m_is_paged(p2mt)) )
> > +            {
> > +                if ( foreign_page )
> > +                    put_page(foreign_page);
> > +                p2m_mem_paging_populate(d, _gfn(gfn_list[i]));
> > +                p2mt = p2m_ram_paging_in;
> > +                foreign_page = NULL;
> > +            }
> > +
> > +            if ( unlikely(!foreign_page) )
> > +            {
> > +                rc = -ENOENT;
> > +                if ( p2mt != p2m_ram_paging_in )
> > +                {
> > +                    gdprintk(XENLOG_WARNING,
> > +                             "Error accessing foreign gfn %" PRI_gfn "\n",
> > +                             gfn_list[i]);
> > +                    rc = -EINVAL;
> > +                }
> > +                copy.nr_frames -= i;
> > +                guest_handle_add_offset(copy.frame_list, i);
> > +                goto out;
> > +            }
> > +
> > +            foreign_mfn = page_to_mfn(foreign_page);
> > +
> > +            /* A page is dirtied when it's being copied to. */
> > +            if ( direction == XENMEM_foreigncopy_to )
> > +                paging_mark_dirty(d, foreign_mfn);
>
> This may better be folded into the "else" below.
>

Changed

> > +            foreign = map_domain_page(foreign_mfn);
> > +            if ( direction == XENMEM_foreigncopy_from )
> > +                rc = copy_to_guest(copy.buffer, foreign, PAGE_SIZE);
> > +            else
> > +                rc = copy_from_guest(foreign, copy.buffer, PAGE_SIZE);
>
> What I continue to be missing prior to this is the obtaining of a writable
> page ref. That's, as previously said, imperative for PV guests and at the
> very least advisable for HVM ones. (I really wonder how many more times I
> need to comment on this.)
>

Unfortunately that does not work.
The code is coherent with MMU_UPDATE.
I'll write a comment.

> > +            unmap_domain_page(foreign);
> > +            put_page(foreign_page);
> > +
> > +            if ( unlikely(rc) )
> > +            {
> > +                gdprintk(XENLOG_WARNING,
> > +                         "Error %d copying gfn %" PRI_gfn "\n",
> > +                         rc, gfn_list[i]);
> > +                copy.nr_frames -= i;
> > +                guest_handle_add_offset(copy.frame_list, i);
> > +                goto out;
>
> rc at this point holds the number of bytes which could not be copied. That's
> not suitable as a return value from this function. (Strictly speaking this
> is also an abuse of rc, as copy_{to,from}_*() return unsigned quantities.)
>

Yes, add an "uncopied" variable and return -EFAULT.

> > +            }
> > +
> > +            guest_handle_add_offset(copy.buffer, PAGE_SIZE);
> > +        }
> > +
> > +        copy.nr_frames -= todo;
> > +        guest_handle_add_offset(copy.frame_list, todo);
> > +
> > +        if ( copy.nr_frames && hypercall_preempt_check() )
> > +        {
> > +            rc = hypercall_create_continuation(
> > +                __HYPERVISOR_memory_op, "lh", XENMEM_foreigncopy, arg);
>
> Nit: Indentation (the anchor point is the start of the function name, not
> the start of the statement).
>

Changed.

> > --- a/xen/include/public/memory.h
> > +++ b/xen/include/public/memory.h
> > @@ -740,7 +740,50 @@ struct xen_vnuma_topology_info {
> >  typedef struct xen_vnuma_topology_info xen_vnuma_topology_info_t;
> >  DEFINE_XEN_GUEST_HANDLE(xen_vnuma_topology_info_t);
> >
> > -/* Next available subop number is 29 */
> > +/*
> > + * Copy memory from/to a given domain.
> > + * This calls is meant to replace expensive operations during migration which
>
> Nit: "This call is ..." However, is ...
>
> > + * are only supported for PV guests.
>
> ... this entire sentence really worth to have here (it looks more like
> something to have in the description)? For it to be possible to find if
> someone considered using those "expensive operations", I think it would need
> to be less vague and name those operations. Furthermore, if those other
> operations were supported only for PV guests, how would migration work for
> non-PV ones?
>

Maybe:
    This call is meant to replace expensive operations (mmap/copy/munmap) during
    migration which can only be issued from PV guests.

You can migrate any domain. Just from a PV guest (this is not a regression).

> > + */
> > +#define XENMEM_foreigncopy 29
> > +struct xen_foreigncopy {
> > +    /* IN - The domain whose memory is to be copied. */
> > +    domid_t domid;
> > +
> > +    /* IN - Flags. */
> > +#define XENMEM_foreigncopy_from 0
> > +#define XENMEM_foreigncopy_to 1
> > +#define XENMEM_foreigncopy_direction 1
> > +    uint16_t flags;
> > +
> > +    /*
> > +     * IN/OUT
> > +     *
> > +     * As an IN parameter number of frames of the domain to be copied.
>
> I think there's a comma wanted after "parameter".
>
> > +     * On output updated number of frames left (0 if success).
>
> I further think that adding "to" after "updated" would help here.
>

Updated to

    /*
     * IN/OUT
     *
     * As an IN parameter, number of frames of the domain to be copied.
     * On output updated to the number of frames left (0 if successful).
     */
    uint32_t nr_frames;

    /*
     * IN/OUT
     *
     * Frames to be copied.
     * On output updated to the point to the first frame unhandled, if any.
     */
    XEN_GUEST_HANDLE(xen_pfn_t) frame_list;

    /*
     * IN/OUT
     *
     * Guest buffer to read/write from.
     * On output updated to point to the first page pointer unhandled.
     */
    XEN_GUEST_HANDLE(uint8) buffer;


> > --- a/xen/include/xsm/dummy.h
> > +++ b/xen/include/xsm/dummy.h
> > @@ -569,6 +569,20 @@ static XSM_INLINE int cf_check xsm_map_gmfn_foreign(
> >      return xsm_default_action(action, d, t);
> >  }
> >
> > +static XSM_INLINE int cf_check xsm_foreigncopy_from(
> > +    XSM_DEFAULT_ARG struct domain *d, struct domain *t)
>
> I think these and ...
>
> > +{
> > +    XSM_ASSERT_ACTION(XSM_TARGET);
> > +    return xsm_default_action(action, d, t);
> > +}
> > +
> > +static XSM_INLINE int cf_check xsm_foreigncopy_to(
> > +    XSM_DEFAULT_ARG struct domain *d, struct domain *t)
>
> ... want to be pointer-to-const right away, requiring to re-base over "XSM:
> make Argo hooks well-formed ones" (or alternatively requiring to split out
> the change there to xsm_default_action()). We really should avoid gaining
> ...
>
> > --- a/xen/include/xsm/hooks.h
> > +++ b/xen/include/xsm/hooks.h
> > @@ -58,6 +58,8 @@ XSM_HOOK(int, add_to_physmap, struct domain *, struct domain *)
> >  XSM_HOOK(int, remove_from_physmap, struct domain *, struct domain *)
> >  XSM_HOOK(int, map_gmfn_foreign, struct domain *, struct domain *)
> >  XSM_HOOK(int, claim_pages, struct domain *)
> > +XSM_HOOK(int, foreigncopy_from, struct domain *, struct domain *);
> > +XSM_HOOK(int, foreigncopy_to, struct domain *, struct domain *);
>
> ... new hooks with non-const-correct parameters.
>

It would honestly make sense if they were all const.
However at the moment this would not be coherent with the current code.
For instance these functions call "xsm_default_action" which does not
accept constant domains (xen/include/xsm/dummy.h).
I think the most clean thing would be first to change xsm arguments to
const first.
But it looks a bit out of scope with this PR.

> Further: Why two new hooks? See e.g. "XSM: fold xsm_{,un}map_domain_pirq()
> hooks", "XSM: fold xsm_{,un}map_domain_irq() hooks", or "XSM: fold
> xsm_{,un}bind_pt_irq() hooks": We'd like to reduce the number of hooks, to
> reduce (when non-dummy XSM is in use) the number of cf_check entry points.
>

It was a comment from Daniel.

> > --- a/xen/xsm/flask/hooks.c
> > +++ b/xen/xsm/flask/hooks.c
> > @@ -1368,6 +1368,16 @@ static int cf_check flask_map_gmfn_foreign(struct domain *d, struct domain *t)
> >      return domain_has_perm(d, t, SECCLASS_MMU, MMU__MAP_READ | MMU__MAP_WRITE);
> >  }
> >
> > +static int cf_check flask_foreigncopy_from(struct domain *d, struct domain *t)
> > +{
> > +    return domain_has_perm(d, t, SECCLASS_MMU, MMU__MAP_READ);
> > +}
> > +
> > +static int cf_check flask_foreigncopy_to(struct domain *d, struct domain *t)
> > +{
> > +    return domain_has_perm(d, t, SECCLASS_MMU, MMU__MAP_READ | MMU__MAP_WRITE);
>
> Why both READ and WRITE?
>

Usually for memory you don't have write-only due to cache reasons.
But I suppose in this case only writint can work.
I'll change and test.

> Jan

Frediano

