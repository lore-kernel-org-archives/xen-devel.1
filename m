Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93575C55184
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 14:52:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381549.1625101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqu19-0001TE-Ee; Mon, 03 Aug 2026 14:51:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381549.1625101; Mon, 03 Aug 2026 14:51:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqu19-0001T7-B9; Mon, 03 Aug 2026 14:51:51 +0000
Received: by outflank-mailman (input) for mailman id 1381549;
 Mon, 03 Aug 2026 14:51:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wqu17-0001Si-MV
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 14:51:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqu16-005i0I-E9
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 16:51:48 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a70aaea-e002-0a2a0a5209dd-0a2a4503e5a6-42
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 16:51:48 +0200
Received: from [74.125.224.44] (helo=mail-yx1-f44.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a70ab03-fae8-0a2a45030019-4a7de02cd8fb-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 16:51:48 +0200
Received: by mail-yx1-f44.google.com with SMTP id
 956f58d0204a3-668c1b780e5so5314004d50.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 07:51:48 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1785768707; cv=none;
        d=google.com; s=arc-20260327;
        b=e0td3MPQbXv/HxNE6lcBu/VK6RXHrwrLYuQ9fkQjIjYvktd9UP8S48TSjWfVp6GR0E
         hD9PasHOvFMEqLl9BQxCC/X7eOlcrlIIzqjZMbkn+aG68V7IgXS2Uf5p7N61z2pHx5wS
         F3myns0I+o8LTOp9T3BjlZpuXT4rQ4bQhr5v1d6W6IlAOTUWDG0v+ef61o0ktaZ52k52
         n7dlCwoX1MHdyCmY+ijfzX5fIUa693A9BHnUNpXjcu64cf5Twt4ISiLDPAtHsCKu0EqZ
         E+NfRlM9nl0WSUSt4uSiPHmf5Nrz+u0CSr9GI3Oqef8pwovp7jxugOpLjanGFJsx4gI4
         aJfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=D9ggXvuJw0OfV/7DwKJBrE2gM6POgD68kCOokV6rNFg=;
        fh=wWTf0SxaJts9rmPnRaimTcgF13vS7beuyeD2+6KhZkk=;
        b=RTgI8l67HilPsDjihHeO69y/3NEc4fwBC5lkIf0sLdVgxMWxsfuBLNRUa6XIRfLXq4
         sCCHjJMGZHSAtPwZdpXbt393je1JVvL1ommbkGIVwo0Vhfsv7MFL1yeq7Ki1FFRwmTkH
         +dL73V+2lNHQyYPyb7BTYXaPnkDLSrb5+QAZ8QtdJUnOTpbEDKZlDwMbxCWLJqOWi43w
         QvPlxAw1f95P9Cf03wAFpMf4ILbtrvbM/SzWYl5/9uqzHlcpg6KlCTyuEMO6CV/GGy7g
         gIq74r+N3qISH0Ck536u2uVAX0dPlTh75xw1/0kzTYAMw1oXvGQpAjHD3WBfp9o1U8+X
         3xRg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785768707; x=1786373507; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D9ggXvuJw0OfV/7DwKJBrE2gM6POgD68kCOokV6rNFg=;
        b=ICyiP5ifAHUUGf/3s9QWw1rwd0ifC1e9FWWH+J4UY9SiDSsavcIvGsAsbd4MlTJIMF
         LTmbL5EYYHixm1WNTXjsNz2EQx6rlxa/ZXWhMtE10g6GSVHdVXOaX3zBw8ZldeD9/1OF
         q4jr1iWb+0QrIVYA8fANUIENP5me9CN82jCjw+1BD/AFwzVttS/HAQiYph4XqvftzkI8
         ahdxr/Eqteq0oN04iCDPVHkG0nBFxbtOYACoGPV7HIaRtWhKolZWlNE0fv3Tcx1n8tlf
         InXCoa2t0D4NWu+YPHd8CAVnJMDtFgZKJH+JPc90iYeUgIg2ribCyKFGyL7cFQK1+n72
         DHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785768707; x=1786373507;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D9ggXvuJw0OfV/7DwKJBrE2gM6POgD68kCOokV6rNFg=;
        b=IjKB6DtOEbSrqU6Pzqi1d9vxIBDO2w469UN5KA0KBA6TNc/ylYCkolfyF+Hk3gC70T
         PGfKyReHOi2ty9ERKnLNnfRgEMX0CAwjjr/OEXsWb0BG+uBPhzAirKLDm3iYGq64pfcN
         4OYWCj4XaoKxH5o8cR2Z815sohqTwByQ86R+jWvd8+/nZbqY+b0Ob+Hn07X1g2eWf1Hr
         KQg3P7dAZoT3xM5Jg/kVN2Pbvdl0w04grcHtCxVLwMeG2u78l1zaHSIKNA2vUWF1/fnN
         dgVbTuEgyofTvefeDp85RdyFoKkO5TNkxaNNzVFIDC8bw3nWv4ea39pkxspGqZ360Ugz
         JJjw==
X-Forwarded-Encrypted: i=1; AHgh+RpMocEp5rzUBiPECuRjpwor1k2Hlweo7VRU6Z2PKHYneDFV8O4KnSC2BTBpZVW/NR5jraMDLJNwcg4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzVpXpxZQqaxA/i0j89x/GWB6uBfNdqMn0FwjnsdjJou0k+DE+G
	9EW9Y5dLKhPnUiVDX4me6OiSIXLxql4/hawaYRBQMG10n8mCl9XgwtRvJB7MayWFUw6Cjx4jGeJ
	/I8CRSYIq5QJgM6gcH18kJWj3wpJrcHE=
X-Gm-Gg: AR+sD10qE6DSMgDXy/kkswYnM353wzBGZOK3DBBh8uTXRZ05eyKhRXHYz1MSicqG/5F
	gpgxW4snF7ZtWiaPU0COnz1ls6OzVMpbeImkTOXRjiTXL2RT96EF/8WW3VC8X+TxNL2Rjjj1qLG
	rVLTqaeSJVp14LZuupxP/XCj7ky3c91LUYhDpwW3pip3KYLcDbTmV1UZcNDJcnQVaFiKxkzC+zE
	0Zs7XePrquOxaHq83G7L+6eKO17pvBC7NQFh8NKGhryloBZEuhwku0EG5FkTgfcwqf8AZNk0dzX
	VvER93Za7ewG1rtT8enS3L/DRxtVYs/45tKV+MaIfOBRQgLIjCIXZyRD2ZAayOekPmZOGSJwUls
	j
X-Received: by 2002:a53:ca4f:0:b0:667:a025:89a4 with SMTP id
 956f58d0204a3-6694f08334emr9042125d50.18.1785768706580; Mon, 03 Aug 2026
 07:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
 <20260619130501.272832-13-frediano.ziglio@citrix.com> <c5f00fa4-4d9e-4227-87a0-6e657fd523e9@suse.com>
 <CAHt6W4c0FDaMZK-4-7CReG_PdV+L=HNxVGNjV5vUjDkKq3EMBA@mail.gmail.com>
 <2889dc4e-33ec-4d8f-b01d-026506a39cbf@suse.com> <CAHt6W4cghz1Rh=MXqmx6ZHA0iOz9xTBDNhFWaqtZ=npd4Hb=GQ@mail.gmail.com>
 <07b3bbb6-ef62-419c-b708-1b9ae2774462@suse.com> <CAHt6W4ckkQOKn9jvNpMG5meFeagY8uFZJsC6CEUsu9tfc17cHQ@mail.gmail.com>
 <46b70e9d-1ade-4ba6-ad5f-87d2c9652a7b@suse.com>
In-Reply-To: <46b70e9d-1ade-4ba6-ad5f-87d2c9652a7b@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Mon, 3 Aug 2026 15:51:34 +0100
X-Gm-Features: AUfX_mzy7nANcnwN3EGkyMZENWLyCWbjND7mD9ySmJskC8tgrgPc-DcdzJDw84U
Message-ID: <CAHt6W4dq+FzgMzC+dU0C4K76X1Pmsf+vEc=P7Htg=jJXDPvRHw@mail.gmail.com>
Subject: Re: [PATCH v6 12/16] xen: implement new foreign copy hypercall
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, 
	Juergen Gross <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-33051d/1785768708-76AF94E9-CBE7C056/0/0
X-purgate-type: clean
X-purgate-size: 8625

On Mon, 29 Jun 2026 at 07:59, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 26.06.2026 16:14, Frediano Ziglio wrote:
> > On Wed, 24 Jun 2026 at 07:44, Jan Beulich <jbeulich@suse.com> wrote:
> >> On 23.06.2026 23:18, Frediano Ziglio wrote:
> >>> On Tue, 23 Jun 2026 at 14:21, Jan Beulich <jbeulich@suse.com> wrote:
> >>>> On 23.06.2026 12:55, Frediano Ziglio wrote:
> >>>>> On Mon, 22 Jun 2026 at 11:34, Jan Beulich <jbeulich@suse.com> wrote:
> >>>>>> On 19.06.2026 15:04, Frediano Ziglio wrote:
> >>>>>>> --- a/xen/common/memory.c
> >>>>>>> +++ b/xen/common/memory.c
> >>>>>>> @@ -1545,6 +1545,139 @@ static int acquire_resource(
> >>>>>>>      return rc;
> >>>>>>>  }
> >>>>>>>
> >>>>>>> +/*
> >>>>>>> + * The "noinline" qualifier avoids the compiler to create a large function
> >>>>>>> + * consuming quite a lot of stack.
> >>>>>>> + */
> >>>>>>> +static int noinline mem_foreigncopy(
> >>>>>>> +    XEN_GUEST_HANDLE_PARAM(xen_foreigncopy_t) arg)
> >>>>>>> +{
> >>>>>>> +    struct domain *d, *const currd = current->domain;
> >>>>>>> +    xen_foreigncopy_t copy;
> >>>>>>> +    int rc, direction;
> >>>>>>> +
> >>>>>>> +    if ( copy_from_guest(&copy, arg, 1) )
> >>>>>>> +        return -EFAULT;
> >>>>>>> +
> >>>>>>> +    if ( copy.flags & ~XENMEM_foreigncopy_direction )
> >>>>>>> +        return -EINVAL;
> >>>>>>> +
> >>>>>>> +    direction = copy.flags & XENMEM_foreigncopy_direction;
> >>>>>>> +
> >>>>>>> +    rc = rcu_lock_remote_domain_by_id(copy.domid, &d);
> >>>>>>
> >>>>>> Iirc I did ask before why this isn't ..._by_any_id().
> >>>>>
> >>>>> I probably was confused by the question about MMUEXT and the 2 domains.
> >>>>> There are different similar hypercalls (like the mentioned MMUEXT but
> >>>>> also hypercalls to map foreign domain memory) that have this check
> >>>>> (not the same domain). Any domain has, obviously, access to its own
> >>>>> memory, so it should not have to use hypercall to access its own
> >>>>> memory. If it does it looks like a mistake causing performance issues
> >>>>> or an attempt to circumvent security; in either case you would like to
> >>>>> avoid it.
> >>>>
> >>>> No. Self-grants are possible as well, for example, and for a good reason.
> >>>> Allowing normally-remote operations on oneself helps with testing, for
> >>>> example. It may also help avoid needing to special-case "self" in code
> >>>> which needs to cover both cases.
> >>>
> >>> But this is not a grant, it's a copy.
> >>
> >> Sure, but the underlying principle is what matters. Plus you don't prevent
> >> self-copy by using ..._by_id(), you only preclude the use of DOMID_SELF.
> >
> > Sure about this?
>
> No, I'm sorry: I (repeatedly) managed to ignore the "remote" in the function
> called. That said, my request stands: No arbitrary restrictions please. If
> you can properly justify a restriction, that's a different thing.
>

Not strong about it.
I'll change to rcu_lock_domain_by_any_id.

> >>>>>>> +    XEN_GUEST_HANDLE(uint8) buffer;
> >>>>>>> +};
> >>>>>>
> >>>>>> What was (again) left unaddressed is the question towards using GFNs on both
> >>>>>> sides of the copy. This would eliminate the need for the flags field, taken
> >>>>>> by a 2nd domid_t one then.
> >>>>>>
> >>>>>
> >>>>> This was addressed in
> >>>>> https://lists.xenproject.org/archives/html/xen-devel/2026-06/msg00567.html
> >>>>
> >>>> Well, yes, but not in a satisfactory way. Back channels tell me that you
> >>>> actually got the same feedback already on internal review. Which makes it
> >>>> all the more puzzling that you insist on doing it differently. Multiple
> >>>> maintainers asking for the same thing may be an indication of something.
> >>>
> >>> Not needing to have backchannel feedback, I already wrote that a
> >>> similar approach was tried and made the code more complicated.
> >>
> >> Even if indeed so: Yet at the same time more flexible.
> >>
> >>> Both maintainers didn't comment on my replies so I assume they were
> >>> fine with it.
> >>> And you are failing to provide positive feedback.
> >>> I asked (that one internally) for examples of guest buffers provided
> >>> as frame numbers but I got no answer (or better the answer was more
> >>> "currently there are not").
> >>> Also note that the location of xen_foreigncopy_t structure is also
> >>> provided using a guest pointer.
> >>> I remember there were some discussions about ABI changes (2/3 years
> >>> ago) to address this and other issues but I cannot see much progress.
> >>
> >> And it's that (very slowly progressing effort) which made me ask. The
> >> fewer virtual addresses we bake into new sub-ops, the better for that
> >> effort. And no, that doesn't go as far as completely eliminating
> >> handles (presently representing virtual addresses) - that needs to be
> >> part of the new ABI.
> >
> > In other words, you want me to code something temporary that you
> > already know that needs to be changed.
>
> What do you mean by "temporary"? We will need to live with the present
> ABI for the foreseeable future. The new ABI's requirements haven't even
> been spelled out yet. Patches to allow use of physical addresses in
> place of virtual ones were actually turned down on the grounds of there
> not having been a write-down of all requirements.
>

Temporary in the sense that there will be new ABIs to deal with not
using virtual addresses.
The second sentence is a bit contradictory. You want me to address the
virtual address complaint but you are telling me that the change will
be turned down if I don't address everything. And this is why this is
out of scope here.

> >> To preempt the argument towards "fewer virtual addresses" not really
> >> being true when changing from handle-to-uint8 to handle-to-pfn: The
> >> former won't be able to express a buffer mapped contiguously in VA
> >> space, but discontiguous in PA space. The latter will, simply be
> >> avoiding buffer VAs in the first place (the array of frame numbers
> >> can e.g. be placed in a dedicated hypercall argument area known to be
> >> physically contiguous).
> >
> > If it's mapped continuously in VA and you pass the VA I don't
> > understand the problem. From the way I see it's more the latter that's
> > the problem.
>
> I'm talking of the future, where VAs wouldn't be used anymore. The
> buffer you use couldn't be described by a single PA, unless the caller
> took specific measures up front.
>

If you read my reply I suggested a way to avoid virtual addresses completely.

> Jan

About the P2M type check it turned out that I was wrong with the
checking. The MMAP way use MMU_UPDATE calls which do not care about
P2M type at all. Changing the code to

...
        for ( unsigned int i = 0; i < todo; i++ )
        {
            struct page_info *foreign_page;
            mfn_t foreign_mfn;
            void *foreign;
            p2m_type_t p2mt;
            p2m_query_t q = (direction == XENMEM_foreigncopy_to) ?
                            P2M_ALLOC | P2M_UNSHARE : P2M_ALLOC;

            foreign_page = get_page_from_gfn(d, gfn_list[i], &p2mt, q);

            if ( unlikely(p2m_is_paged(p2mt)) )
            {
                if ( foreign_page )
                    put_page(foreign_page);
                p2m_mem_paging_populate(d, _gfn(gfn_list[i]));
                p2mt = p2m_ram_paging_in;
                foreign_page = NULL;
            }

            if ( unlikely(!foreign_page) )
            {
                rc = -ENOENT;
                if ( p2mt != p2m_ram_paging_in )
                {
                    gdprintk(XENLOG_WARNING,
                             "Error accessing foreign gfn %" PRI_gfn "\n",
                             gfn_list[i]);
                    rc = -EINVAL;
                }
                copy.nr_frames -= i;
                guest_handle_add_offset(copy.frame_list, i);
                goto out;
            }
...

About the XSM part I have now

...
    /*
     * Check we are allowed to map and access these foreign pages.
     */
    if ( direction == XENMEM_foreigncopy_from )
        rc = xsm_foreigncopy_from(XSM_TARGET, currd, d);
    else
        rc = xsm_foreigncopy_to(XSM_TARGET, currd, d);
    if ( rc )
        goto out;
...

I wrote some code for the compat mode but I need to test it.
Still I think that adding it it's a mistake, it's just a new, probably
unused, ABI that must be maintained till a probable "no virtual
address" ABI will replace it.

Frediano

