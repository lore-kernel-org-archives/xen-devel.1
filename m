Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38511C5CFDB
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 09:41:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389658.1630298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuRw5-0000J8-E2; Thu, 13 Aug 2026 09:41:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389658.1630298; Thu, 13 Aug 2026 09:41:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuRw5-0000J1-BR; Thu, 13 Aug 2026 09:41:17 +0000
Received: by outflank-mailman (input) for mailman id 1389658;
 Thu, 13 Aug 2026 09:41:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wuRw4-0000Iv-1p
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 09:41:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuRw3-000OVo-4G
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 11:41:15 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7d912c-8faa-0a2a0a5109dd-0a2a45018372-42
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 11:41:14 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7d9136-5984-0a2a45010019-d1558031b538-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 11:41:10 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-49557167508so15610835e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 02:41:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4998216cf97sm48143745e9.14.2026.08.13.02.41.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 02:41:09 -0700 (PDT)
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
        d=suse.com; s=google; t=1786614070; x=1787218870; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=235ToJM7LQTx124aPcBAU/l2Xa19Gnprl8aR2ZpGdVM=;
        b=EAF52ZtixKhG2Xd+/xUCQcBFaZ5npMOxNFffZ9pbfiwK7KCSTl00ose37tAPGeIU/n
         JWFrt/rf3+HzK+jBcGqiBki5f4VSqJqo4W5ihM8VMOaUnN7XvE/jmfEiMddSyC8yDkGJ
         y2sWTx0EUQCi8S007AGd6ESBBYsvq/lU7BoE6fqv+LLnwzrwwwVr9d3MPhXrm8eWNRfQ
         AMI/SF5qO9i5e2wwwGsSZlr7LZhCkbvbkxLaFBpOpmdjb3Duw074ZpJmNWDE2ocwES5/
         bgAqm25i8E0AgzfnnAiiSWJ9wFy2Ql3ol7Mfv0OHzeJgGCGZxDH971POGznTP9bF5lna
         TnzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786614070; x=1787218870;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=235ToJM7LQTx124aPcBAU/l2Xa19Gnprl8aR2ZpGdVM=;
        b=FheIBCv0YuIS201PWHqP/WsZhtNwLAYuo7JhGHoudLDBOd1aarEEsLvaPvbgaM0OpG
         oL+DVyYp7t+ZdCNN+GsqAu5j7teH/E+QtkoavyOVCre//d0ZeEcpYVHSwoCEKOV3yCYF
         +jdKEdv9I8IJpeMcOapgSTpwq8Vxh4mtLGpRKNjbchKLXxMZWwpDCzrGzbJ7VVs/Xue8
         pIP5pL3swF3Eccisid1Z++cuhiE+b56m9FzW7i9OSSzHeI+ljU34SdJZhZifJ2l0ymsR
         0a1ane6SzPeK/nMADqzyiicdz6eZLLkVxI/BM8Tl16iCK3WEOCNdsICLfWYiaiptiFWO
         qVSw==
X-Forwarded-Encrypted: i=1; AHgh+Rquujw/GvjtXetxdzoQlFzHAYORtIEgedYwKlNkteoANEC0eV0DHv2sqgD8jJXjMh9nyNjr/+jQFHo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw73LFuS/nx25WXfOz1K1UtMzm/6l48PomCaYY3CLpyVxKzh1/j
	2lbOJ8mrdtKtiYZ5C8XvMKSgJgWGiEupo8jwO0hskjC8PP0yH0XbWJ6PWc1RW5Ui+g==
X-Gm-Gg: AR+sD13pIbst+rSfU08gfFWS3uX1hWxvHLOpXnCJtOHdioYDLYYn39bfXW9NhW9zw2m
	cZ9cDWC+DKlA2WGTPzsL1seJhc4RMMpC+dlsCDni1vgHDzcEAASm5eo1wbk1YKbIjf+b4Dz6vCk
	N/zyEqL6w2gLcRqjQIq3vnpthKkrFjHc5zufgjcosvHc9jaXlBdgnSDbOdZYjKkCoyPNDoX2o+C
	hXiRS/ZpmDwGdRgt0dggjt1eHbEHFLdpSu8NE+i4j6l7r9iNY6uSS7DCOFxQlTSY4mSinWYBcyJ
	kABXFkecVaCJOl6mpoU/YoVwzvfEIA/UhprgPzmi4ORxct5YE2y1KzH5zxvQnw8xZYJOQPqrIN8
	doj4l89KlyQWf9Cd4CB2Hlsds4+jvQBvYlOIfedHO+D14KCebIhLCSbDgpwGf1IfhCGESrKdkXa
	zPJyWoXdXwVL4bRnOKfF1p0J9LXId1XRd81b8JKKuGFBX66Kg22VR2F5P5UcSI1TZvoneLQqIWr
	faVqvKD6M7KAVRo5qkpwceTtC9EiYt7YLBJkFoRnQJCCzmlRktW
X-Received: by 2002:a05:600c:8183:b0:499:50ec:a3fd with SMTP id 5b1f17b1804b1-4998220bca2mr52593085e9.19.1786614069907;
        Thu, 13 Aug 2026 02:41:09 -0700 (PDT)
Message-ID: <43d1ce4a-3a49-42c9-b277-47a89698513f@suse.com>
Date: Thu, 13 Aug 2026 11:41:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 7/10] xen: implement new foreign copy hypercall
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20260810103018.54564-1-frediano.ziglio@citrix.com>
 <20260810103018.54564-8-frediano.ziglio@citrix.com>
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
In-Reply-To: <20260810103018.54564-8-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1786614070-1D272757-6E735CB5/0/0
X-purgate-type: clean
X-purgate-size: 10614

On 10.08.2026 12:30, Frediano Ziglio wrote:
> Add a sub hypercall to __HYPERVISOR_memory_op to allow to read/write
> memory from/to a foreign domain.
> 
> Extending MMUEXT_COPY_PAGE seems better on first sight but considering
> that MMUEXT is meant for PV only and trying to change that sub-op this
> solution is better.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>

First: Can you please update your recipient list before sending a new version?
Roger's move pre-dates this submission by quite a few days.

Then: The asymmetry of the new sub-op also continues to have no justification
at all. If you insist on not using two (domid,list-of-gfns) tuples to describe
the buffers, despite multiple maintainers having asked you to do so, please
put down a word explaining that decision.

> ---
>  xen/common/memory.c         | 149 ++++++++++++++++++++++++++++++++++++
>  xen/include/public/memory.h |  45 ++++++++++-
>  xen/include/xsm/dummy.h     |  14 ++++
>  xen/include/xsm/hooks.h     |   2 +
>  xen/xsm/flask/hooks.c       |  10 +++
>  5 files changed, 219 insertions(+), 1 deletion(-)

As before: If you insist on not implementing the compat case, that decision
wants justifying in the description. Without that it'll look like an
oversight.

> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1548,6 +1548,141 @@ static int acquire_resource(
>      return rc;
>  }
>  
> +/*
> + * The "noinline" qualifier avoids the compiler to create a large function
> + * consuming quite a lot of stack.
> + */
> +static int noinline mem_foreigncopy(

I'm wondering: Is the "mem" prefix really meaningful for a static function in
a file named memory.c?

> +    XEN_GUEST_HANDLE_PARAM(xen_foreigncopy_t) arg)
> +{
> +    struct domain *d, *const currd = current->domain;

With the comment on the new XSM hooks (below) in mind: currd wants to be
pointer-to-const.

> +    xen_foreigncopy_t copy;
> +    int rc, direction;

Plain int for rc is fine of course, but direction can't go negative, can it?

> +    if ( copy_from_guest(&copy, arg, 1) )
> +        return -EFAULT;
> +
> +    if ( copy.flags & ~XENMEM_foreigncopy_direction )
> +        return -EINVAL;
> +
> +    direction = copy.flags & XENMEM_foreigncopy_direction;
> +
> +    d = rcu_lock_domain_by_any_id(copy.domid);
> +    if ( !d )
> +        return -ESRCH;
> +
> +    /*
> +     * Check we are allowed to map and access these foreign pages.
> +     */

This really means to be a single-line comment.

> +    if ( direction == XENMEM_foreigncopy_from )
> +        rc = xsm_foreigncopy_from(XSM_TARGET, currd, d);
> +    else
> +        rc = xsm_foreigncopy_to(XSM_TARGET, currd, d);
> +    if ( rc )
> +        goto out;
> +
> +    while ( copy.nr_frames )
> +    {
> +        /*
> +         * Arbitrary size.  Not too much stack space, and a reasonable stride
> +         * for continuation checks.
> +         */
> +        xen_pfn_t gfn_list[32];
> +        unsigned int todo = MIN(ARRAY_SIZE(gfn_list), copy.nr_frames);
> +
> +        rc = -EFAULT;
> +        if ( copy_from_guest(gfn_list, copy.frame_list, todo) )
> +            goto out;
> +
> +        for ( unsigned int i = 0; i < todo; i++ )
> +        {
> +            struct page_info *foreign_page;
> +            mfn_t foreign_mfn;
> +            void *foreign;
> +            p2m_type_t p2mt;
> +            p2m_query_t q = (direction == XENMEM_foreigncopy_to) ?
> +                            P2M_ALLOC | P2M_UNSHARE : P2M_ALLOC;
> +
> +            foreign_page = get_page_from_gfn(d, gfn_list[i], &p2mt, q);

Is there a reason check_get_page_from_gfn() can't or shouldn't be used here?
That would then also make this code properly deal with shared pages, and
refuse use against MMIO ones.

> +            if ( unlikely(p2m_is_paged(p2mt)) )
> +            {
> +                if ( foreign_page )
> +                    put_page(foreign_page);
> +                p2m_mem_paging_populate(d, _gfn(gfn_list[i]));
> +                p2mt = p2m_ram_paging_in;
> +                foreign_page = NULL;
> +            }
> +
> +            if ( unlikely(!foreign_page) )
> +            {
> +                rc = -ENOENT;
> +                if ( p2mt != p2m_ram_paging_in )
> +                {
> +                    gdprintk(XENLOG_WARNING,
> +                             "Error accessing foreign gfn %" PRI_gfn "\n",
> +                             gfn_list[i]);
> +                    rc = -EINVAL;
> +                }
> +                copy.nr_frames -= i;
> +                guest_handle_add_offset(copy.frame_list, i);
> +                goto out;
> +            }
> +
> +            foreign_mfn = page_to_mfn(foreign_page);
> +
> +            /* A page is dirtied when it's being copied to. */
> +            if ( direction == XENMEM_foreigncopy_to )
> +                paging_mark_dirty(d, foreign_mfn);

This may better be folded into the "else" below.

> +            foreign = map_domain_page(foreign_mfn);
> +            if ( direction == XENMEM_foreigncopy_from )
> +                rc = copy_to_guest(copy.buffer, foreign, PAGE_SIZE);
> +            else
> +                rc = copy_from_guest(foreign, copy.buffer, PAGE_SIZE);

What I continue to be missing prior to this is the obtaining of a writable
page ref. That's, as previously said, imperative for PV guests and at the
very least advisable for HVM ones. (I really wonder how many more times I
need to comment on this.)

> +            unmap_domain_page(foreign);
> +            put_page(foreign_page);
> +
> +            if ( unlikely(rc) )
> +            {
> +                gdprintk(XENLOG_WARNING,
> +                         "Error %d copying gfn %" PRI_gfn "\n",
> +                         rc, gfn_list[i]);
> +                copy.nr_frames -= i;
> +                guest_handle_add_offset(copy.frame_list, i);
> +                goto out;

rc at this point holds the number of bytes which could not be copied. That's
not suitable as a return value from this function. (Strictly speaking this
is also an abuse of rc, as copy_{to,from}_*() return unsigned quantities.)

> +            }
> +
> +            guest_handle_add_offset(copy.buffer, PAGE_SIZE);
> +        }
> +
> +        copy.nr_frames -= todo;
> +        guest_handle_add_offset(copy.frame_list, todo);
> +
> +        if ( copy.nr_frames && hypercall_preempt_check() )
> +        {
> +            rc = hypercall_create_continuation(
> +                __HYPERVISOR_memory_op, "lh", XENMEM_foreigncopy, arg);

Nit: Indentation (the anchor point is the start of the function name, not
the start of the statement).

> --- a/xen/include/public/memory.h
> +++ b/xen/include/public/memory.h
> @@ -740,7 +740,50 @@ struct xen_vnuma_topology_info {
>  typedef struct xen_vnuma_topology_info xen_vnuma_topology_info_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_vnuma_topology_info_t);
>  
> -/* Next available subop number is 29 */
> +/*
> + * Copy memory from/to a given domain.
> + * This calls is meant to replace expensive operations during migration which

Nit: "This call is ..." However, is ...

> + * are only supported for PV guests.

... this entire sentence really worth to have here (it looks more like
something to have in the description)? For it to be possible to find if
someone considered using those "expensive operations", I think it would need
to be less vague and name those operations. Furthermore, if those other
operations were supported only for PV guests, how would migration work for
non-PV ones?

> + */
> +#define XENMEM_foreigncopy 29
> +struct xen_foreigncopy {
> +    /* IN - The domain whose memory is to be copied. */
> +    domid_t domid;
> +
> +    /* IN - Flags. */
> +#define XENMEM_foreigncopy_from 0
> +#define XENMEM_foreigncopy_to 1
> +#define XENMEM_foreigncopy_direction 1
> +    uint16_t flags;
> +
> +    /*
> +     * IN/OUT
> +     *
> +     * As an IN parameter number of frames of the domain to be copied.

I think there's a comma wanted after "parameter".

> +     * On output updated number of frames left (0 if success).

I further think that adding "to" after "updated" would help here.

> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -569,6 +569,20 @@ static XSM_INLINE int cf_check xsm_map_gmfn_foreign(
>      return xsm_default_action(action, d, t);
>  }
>  
> +static XSM_INLINE int cf_check xsm_foreigncopy_from(
> +    XSM_DEFAULT_ARG struct domain *d, struct domain *t)

I think these and ...

> +{
> +    XSM_ASSERT_ACTION(XSM_TARGET);
> +    return xsm_default_action(action, d, t);
> +}
> +
> +static XSM_INLINE int cf_check xsm_foreigncopy_to(
> +    XSM_DEFAULT_ARG struct domain *d, struct domain *t)

... want to be pointer-to-const right away, requiring to re-base over "XSM:
make Argo hooks well-formed ones" (or alternatively requiring to split out
the change there to xsm_default_action()). We really should avoid gaining
...

> --- a/xen/include/xsm/hooks.h
> +++ b/xen/include/xsm/hooks.h
> @@ -58,6 +58,8 @@ XSM_HOOK(int, add_to_physmap, struct domain *, struct domain *)
>  XSM_HOOK(int, remove_from_physmap, struct domain *, struct domain *)
>  XSM_HOOK(int, map_gmfn_foreign, struct domain *, struct domain *)
>  XSM_HOOK(int, claim_pages, struct domain *)
> +XSM_HOOK(int, foreigncopy_from, struct domain *, struct domain *);
> +XSM_HOOK(int, foreigncopy_to, struct domain *, struct domain *);

... new hooks with non-const-correct parameters.

Further: Why two new hooks? See e.g. "XSM: fold xsm_{,un}map_domain_pirq()
hooks", "XSM: fold xsm_{,un}map_domain_irq() hooks", or "XSM: fold
xsm_{,un}bind_pt_irq() hooks": We'd like to reduce the number of hooks, to
reduce (when non-dummy XSM is in use) the number of cf_check entry points.

> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -1368,6 +1368,16 @@ static int cf_check flask_map_gmfn_foreign(struct domain *d, struct domain *t)
>      return domain_has_perm(d, t, SECCLASS_MMU, MMU__MAP_READ | MMU__MAP_WRITE);
>  }
>  
> +static int cf_check flask_foreigncopy_from(struct domain *d, struct domain *t)
> +{
> +    return domain_has_perm(d, t, SECCLASS_MMU, MMU__MAP_READ);
> +}
> +
> +static int cf_check flask_foreigncopy_to(struct domain *d, struct domain *t)
> +{
> +    return domain_has_perm(d, t, SECCLASS_MMU, MMU__MAP_READ | MMU__MAP_WRITE);

Why both READ and WRITE?

Jan

