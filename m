Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FFEC5DF7D
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 13:58:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394209.1633036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwKK2-0002yr-My; Tue, 18 Aug 2026 13:57:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394209.1633036; Tue, 18 Aug 2026 13:57:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwKK2-0002yk-KB; Tue, 18 Aug 2026 13:57:46 +0000
Received: by outflank-mailman (input) for mailman id 1394209;
 Tue, 18 Aug 2026 13:57:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwKK1-0002xA-0a
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 13:57:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwKK0-0075pT-DY
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 15:57:44 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8464bc-e002-0a2a0a5209dd-0a2a45019a34-46
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 15:57:40 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8464d4-5984-0a2a45010019-d155802da4cf-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 15:57:40 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4994c49f588so12346315e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 06:57:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4999d10b7f6sm131626285e9.12.2026.08.18.06.57.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 06:57:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1787061460; x=1787666260; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cN/JhVLMabK6UpBzze+2jfLaJR/nelh/I66BaRpCVK0=;
        b=ZFstpW0UCFNyW+DKoigJVpIycYVWMuTi1D5pKnimzcyAL5nwWji39bSx+gVGD+EdsZ
         cP1fljsIGbVTkIyheJTjdQMv5KwSL6h90ouQWjqdRUY4f9pv/1cOuRAzzGgkZps1SPmi
         t4CSqLSaPzeaFBdZn8qXOtucO3jzWjJxc8gKuHMt49TklFa6z9HdacnSmW0zbaNkZ4UO
         8NHZb/11aKjTFXHpYdq9oaMDp3HhsgjZBycBL62+Z+cpWXmeQLo7V2hd86cH9r/1RRwd
         hpSnrbfdX6mS2AVJQzIscZEz3lgqAKqS68XgiQCjV55qe5zd3LeD/pDeQ++1v06WvmJV
         pnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787061460; x=1787666260;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cN/JhVLMabK6UpBzze+2jfLaJR/nelh/I66BaRpCVK0=;
        b=hfHD3rigbr4R7KSJFMZFZbYfxMnuWhGzOgr4VoAfz6aWkxsP6kniKIa29wEKmXh3vI
         Gqx+zJB4o//YuJCRGcnlDnyK5lkWG9OcEsMacIhYRPyh16sM6BrJ/0YksXvcEGvHeS82
         /KZm3e0rc3FsNyNNORenKC9SAUQ49pHMilnUX2pCJChwQOBjLCY0JdnV/wQ/SSDoQ9Cp
         CFyfnJjjEM4xK4gxtFQJiKFiLGrI8wMV99F1ZAzFiD0let/gkKLuvtDsuygdah830uaO
         guVc3SboRNT1w6oBipCkyqkdgUinHtISO/+lfV16kFQlZqHYy91is5mM7zrP4x8nwrMB
         ANbg==
X-Forwarded-Encrypted: i=1; AHgh+RqnvTr6NapJasmAIjkwQU3qIVl1bX1Zlsf9rRKvldC4Ypq15qV9ZoPO/RNvdbHQeqJjJ3owIwENo6A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1hHOpQZc+KSvmDGmkiKvOOyR7V7v2l75thldrzxaocBDMHINv
	ilm2WIbvnOp8NmlZWntLEghUiquINLKyOXJ8zGS3dZTvDbWinzMzisZpicySTNOphw==
X-Gm-Gg: AR+sD11OPLj63PAEQjLPevnHG/BDOCZutXK/8kW+dd9LIEiuCztqHVIiTdt9GRMmPp5
	OlwcznhWvg4uQHHfKN1z2ydzTY7DR9KNRYski9U5rwrh6XL2VEy6hM1Xlqm4HglwfwhaP6no03w
	hnDH7GUI76nIgSrLcPqfKFBEFBjQBMxAWuNw17NS1HBYkjRglHPMY6HbnGKSgVpOQLemzXC/WdX
	ViXjKzrpqRfPjwNt2LjZLxxkO9ynktvkiygL1HxM/6OzNT3HZJd/iOVJrUkYDk/7Fw01EU+81M7
	gufexg9BGnB/J30yfhOUcvQDtjtbjXB2322AhOuGSowKlV5sj6EtjLGui/SXvbHbVauehsHYmGE
	TEye4geQ+gTkmypZ3+ARNNAvIhNx/74rTAu/mD2z4ET8W2cGnjgbKWgBjZormFyw74rGUh9ci6J
	Jl+LyUHY6kc3lOSIeQiZN18cG5cMG+2s4rFiIhw1G3MyXAlxuzYkP2gFk2E3FE3Lk99qIQDbV0x
	T0CyYOvbIkWPrnRp4cKzuDzox9tkeJQ5qenS7Y5UvY9HMiooVvO
X-Received: by 2002:a05:600c:35d1:b0:499:a0a5:e13f with SMTP id 5b1f17b1804b1-499a2040313mr94987795e9.2.1787061459685;
        Tue, 18 Aug 2026 06:57:39 -0700 (PDT)
Message-ID: <f72b77f0-155e-4c13-bc36-5376daeb5959@suse.com>
Date: Tue, 18 Aug 2026 15:57:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] x86/ioreq: Extend ioreq server to support multiple
 ioreq pages
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260420093820.825969-1-julian.vetter@vates.tech>
 <20260420093820.825969-4-julian.vetter@vates.tech>
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
In-Reply-To: <20260420093820.825969-4-julian.vetter@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1787061460-BF66C757-A544A0F4/0/0
X-purgate-type: clean
X-purgate-size: 7887

On 20.04.2026 11:38, Julian Vetter wrote:
> As the number of vCPUs grows, a single ioreq page of 128 slots may not
> be sufficient. Add support for allocating and mapping multiple ioreq
> pages so that the ioreq region can scale with d->max_vcpus.
> 
> Introduce nr_ioreq_pages() to compute the number of pages required for
> a given domain, and IOREQ_NR_PAGES_MAX as a compile-time upper bound
> (based on HVM_MAX_VCPUS).
> 
> ioreq_server_alloc_mfn() is updated to allocate nr_ioreq_pages() pages
> and map them contiguously via vmap().
> 
> is_ioreq_server_page() iterates over all ioreq pages when checking
> page ownership. ioreq_server_get_frame() allows callers to retrieve any
> ioreq page by index via the XENMEM_acquire_resource interface.
> 
> On x86, the legacy GFN mapping path (hvm_map_ioreq_gfn) is limited to
> a single ioreq page; device models requiring more ioreq slots must use
> the resource mapping interface (XENMEM_acquire_resource).
> 
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> ---
> Changes in v6:
> - Adapted the comment to not mention the guest, but the device model
> - Replaced the dynamic allocation for the mfns array by a static array
> - Fixed error handling in ioreq_server_alloc_mfn, using an extra
>   nr_alloc variable to track the already allocated pages
> - Dropped unnecessary void casts
> ---
>  xen/arch/x86/hvm/ioreq.c |  8 ++++
>  xen/common/ioreq.c       | 93 ++++++++++++++++++++++++++++------------
>  xen/include/xen/ioreq.h  | 12 ++++++
>  3 files changed, 86 insertions(+), 27 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
> index 3cabec141c..ee679bdf5a 100644
> --- a/xen/arch/x86/hvm/ioreq.c
> +++ b/xen/arch/x86/hvm/ioreq.c
> @@ -166,6 +166,14 @@ static int hvm_map_ioreq_gfn(struct ioreq_server *s, bool buf)
>      if ( d->is_dying )
>          return -EINVAL;
>  
> +    /*
> +     * The legacy GFN path supports only a single ioreq page. Device models
> +     * requiring more ioreq slots must use the resource mapping interface
> +     * (XENMEM_acquire_resource).
> +     */
> +    if ( !buf && nr_ioreq_pages(d) > 1 )
> +        return -EOPNOTSUPP;
> +
>      iorp->gfn = hvm_alloc_ioreq_gfn(s);
>  
>      if ( gfn_eq(iorp->gfn, INVALID_GFN) )
> diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
> index bae9b99c99..3a08e77597 100644
> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -261,8 +261,11 @@ bool vcpu_ioreq_handle_completion(struct vcpu *v)
>  static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
>  {
>      struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
> -    struct page_info *page;
> -    mfn_t mfn;
> +    unsigned int i, nr_alloc = 0, nr_pages = buf ? 1 : nr_ioreq_pages(s->target);
> +    mfn_t mfns[IOREQ_NR_PAGES_MAX] = {};

This is okay to have with the present HVM_MAX_VCPUS, but we need to put in
place something to bound stack usage here. Once the upper bound on the
number of vCPU-s has grown enough, some other mechanism will need to be put
in place, preferably still without runtime allocation. (And no, this isn't
a static array, i.e. the revlog entry isn't quite correct.)

For the moment I'd suggest BUILD_BUG_ON(ARRAY_SIZE(mfns) > 32), with a
clarifying comment.

> +    int rc;
> +
> +    ASSERT(nr_pages <= IOREQ_NR_PAGES_MAX);

Why would this be relevant to check (only) here? Imo this either wants
dropping, or moving into nr_ioreq_pages().

> @@ -277,11 +280,16 @@ static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
>          return 0;
>      }
>  
> +    for ( i = 0; i < nr_pages; i++ )
>      {
> -        page = alloc_domheap_page(s->target, MEMF_no_refcount);
> +        struct page_info *page = alloc_domheap_page(s->target,
> +                                                    MEMF_no_refcount);

This movement of the decl would better also be part of patch 2.

> @@ -290,41 +298,59 @@ static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
>               * here is a clear indication of something fishy going on.
>               */
>              domain_crash(s->emulator);
> -            return -ENODATA;
> +            rc = -ENODATA;
> +            goto fail;
>          }
>  
> -        mfn = page_to_mfn(page);
> +        mfns[nr_alloc++] = page_to_mfn(page);
>      }
> -    iorp->va = vmap(&mfn, 1);
> +
> +    iorp->va = vmap(mfns, nr_pages);
>      if ( !iorp->va )
> +    {
> +        rc = -ENOMEM;
>          goto fail;
> +    }
>  
> -    clear_page(iorp->va);
> +    memset(iorp->va, 0, nr_pages * PAGE_SIZE);

clear_page() is a bit more efficient, so I wonder whether - especially for
small nr_pages - we aren't needlessly losing performance here. Question is
whether there's a reasonable to establish boundary at which memset()
(largely) catches up.

> @@ -337,12 +363,25 @@ bool is_ioreq_server_page(struct domain *d, const struct page_info *page)
>  
>      FOR_EACH_IOREQ_SERVER(d, id, s)
>      {
> -        if ( (s->ioreq.va && vmap_to_page(s->ioreq.va) == page) ||
> -             (s->bufioreq.va && vmap_to_page(s->bufioreq.va) == page) )
> +        unsigned int i;
> +
> +        if ( s->bufioreq.va && vmap_to_page(s->bufioreq.va) == page )
>          {
>              found = true;
>              break;
>          }
> +
> +        for ( i = 0; i < nr_ioreq_pages(d) && s->ioreq.va; i++ )

s->ioreq.va is loop invariant, without the compiler being in the position
to know. The condition therefore wants moving out, preferably as

        if ( !s->ioreq.va )
            continue;

to avoid indentation growing too much.

> +        {
> +            if ( vmap_to_page(s->ioreq.va + i * PAGE_SIZE) == page )
> +            {
> +                found = true;
> +                break;
> +            }
> +        }

It may help readability here if for()'s curly braces were dropped.

> +        if ( found )
> +            break;
>      }
>  
>      rspin_unlock(&d->ioreq_server.lock);
> @@ -816,26 +855,26 @@ int ioreq_server_get_frame(struct domain *d, ioservid_t id,
>      if ( rc )
>          goto out;
>  
> -    switch ( idx )
> +    if ( idx == XENMEM_resource_ioreq_server_frame_bufioreq )
>      {
> -    case XENMEM_resource_ioreq_server_frame_bufioreq:
>          rc = -ENOENT;
>          if ( !HANDLE_BUFIOREQ(s) )
>              goto out;
>  
>          *mfn = vmap_to_mfn(s->bufioreq.va);
>          rc = 0;
> -        break;
> +    }
> +    else if ( idx >= XENMEM_resource_ioreq_server_frame_ioreq(0) &&
> +              idx < XENMEM_resource_ioreq_server_frame_ioreq(nr_ioreq_pages(d)) )
> +    {
> +        unsigned int page_idx = idx - XENMEM_resource_ioreq_server_frame_ioreq(0);
>  
> -    case XENMEM_resource_ioreq_server_frame_ioreq(0):
> -        *mfn = vmap_to_mfn(s->ioreq.va);
> +        ASSERT(page_idx < nr_ioreq_pages(d));

Isn't this redundant with the range check on idx?

> --- a/xen/include/xen/ioreq.h
> +++ b/xen/include/xen/ioreq.h
> @@ -35,6 +35,18 @@ struct ioreq_vcpu {
>      bool             pending;
>  };
>  
> +/*
> + * Maximum number of ioreq pages, based on the maximum number
> + * of vCPUs and the number of ioreq slots per page.
> + */
> +#define IOREQ_NR_PAGES_MAX \
> +    DIV_ROUND_UP(HVM_MAX_VCPUS, PAGE_SIZE / sizeof(ioreq_t))
> +
> +static inline unsigned int nr_ioreq_pages(const struct domain *d)
> +{
> +    return DIV_ROUND_UP(d->max_vcpus, PAGE_SIZE / sizeof(ioreq_t));
> +}

To reduce redundancy, how about

static inline unsigned int nr_ioreq_pages(const struct domain *d)
{
    return DIV_ROUND_UP(d ? d->max_vcpus : HVM_MAX_VCPUS,
                        PAGE_SIZE / sizeof(ioreq_t));
}

#define IOREQ_NR_PAGES_MAX nr_ioreq_pages(NULL)

?

Jan

