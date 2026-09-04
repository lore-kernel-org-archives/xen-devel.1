Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB53C79F80
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 05:47:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407844.1640660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Mln-0002Hn-UV; Fri, 04 Sep 2026 05:47:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407844.1640660; Fri, 04 Sep 2026 05:47:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Mln-0002Hf-Pc; Fri, 04 Sep 2026 05:47:23 +0000
Received: by outflank-mailman (input) for mailman id 1407844;
 Fri, 04 Sep 2026 05:47:23 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x2Mln-0002HZ-7e
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 05:47:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2Mll-00Evvm-Pr
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 07:47:21 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9a5b67-8faa-0a2a0a5109dd-0a2a450c85c8-12
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 07:47:21 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9a5b69-f479-0a2a450c0019-d155802ddc7e-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 07:47:21 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-49b965570d7so6680045e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 22:47:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf7710aa5sm41744705e9.7.2026.09.03.22.47.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 22:47:20 -0700 (PDT)
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
        d=suse.com; s=google; t=1788500841; x=1789105641; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=49xhD3ztLT/F9jM3xzEFoV+axbupICEp6pC99szlEjA=;
        b=VMNggHhZk8ODPm50SAzPzoKFBw0HUer4tYd6V2pj+dR7MloKzrvTHSQqTvGGr8JU8Z
         UtXF2jOOaV/ps++HlSgs8+De6v8z7tAz0CzJL6Am6reRpblN3QBvklSR4IiEIlzhANtN
         aUIXk4YImgB5b2bjetCwWs1sc2z9C+Rw9QqOH8DYkU/HKFN1k4F8vhi3ygaX3glTFUDA
         YM/YMmJbRpANuPbd/RFyZFNOxA4lop/STymTYHt6Qm80xsKY2ho5M6udiY2XhZvk5Ik8
         CsH+ZZg6zsbynnVGiFdDnayk5t/RLtO6vndk7wFrnfVuKs7Np0sYQJVrjvDkzuej18az
         GEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788500841; x=1789105641;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=49xhD3ztLT/F9jM3xzEFoV+axbupICEp6pC99szlEjA=;
        b=eJMWAaype2g/r53PPm3VZqsRHDmwK3vCAUigHWk0rjsSri6FBO1vEA8W5ChBgo0QiO
         HmdnNqvQs3tXPXEfqQOoCTPRKs09dzPnWqbmnQFiVyXznDUEvJZplZ45R5h6FO21aXnQ
         rPlnodVy/9Kap8Sy0swqwRowfX1A3amX3xW5qUnZp0PIXrq8vJRiI76mPwt/FPz/GnxA
         R7uQxY2Mw1cqdLXzzBaHhcnTDJHQv/YbZslYcySQW4PSWi2BjQ44jEAu7gZKK5JoJSyd
         Y8q41BXC6jc0RLiQxtw78uifOaIXynmDLLB5UiBaPQMrV3RhhaSbHnB6behWw20icBeP
         K/Ig==
X-Forwarded-Encrypted: i=1; AKwUvBwkcm0wrjnm5XXArhkKy+0tW8rWKlezkgKcr6ZLBxkFto13fLmiMAEz/uiyPJOeneAqCZ9pRfy7ino=@lists.xenproject.org
X-Gm-Message-State: AFuF++m2lr6HTfS063SLyX39Gg367ELC75X3uH3osKtuOHcKMJG85Jh8
	aPVyu9Kk0VeUBjFPgxt0FApOXPF7Un4aKdLqWGw+wkocCqKer+BzB8CTXJX0KAy5xw==
X-Gm-Gg: AYBFou2z6wtZumaFK4vPVP2ptElQ65Z8H98YVv4HFBfPzUPJtNgC3Dpa4VGT/z9o/z6
	QoH+CfZWdnk7wZPYQBIey4y6LN94P8ChobNoMTlJkOSOykIOYhsYnb8ckS4G5Iqj+e1huTS8cPq
	97iygxHCIfT+hqVWN1jNBhOFjl5ymBB+MCh/rqmWZXEcS4P8bbHzdKJm/zmL6CfE2gTfvzB1lXy
	1mBYkS8FwMrnjUe8uNui1Uq8JcL51W8XKoIjfhfp33KJ1A1qrJtg9ul0ZQN+G7QVtFT+zrXZ91H
	OCZbeLDbf9tji8iSD+OwfLVVGJ/b4Vc64fC+aHAnsMR+EyWkwO/HF7JdHHvRsotGVWn2Xf+Hk/+
	BgP0uXklyAaiGDtmnYMDTLW/47go3fnKwyrkAwThniJoPbIBBId0TYCRSmKQNPfV8pUaXlZvRQn
	EUYsmqeZH1s1S6O/M+gbQJKRXieFMK+7j6OaQFTlKXvtU64YO321O+EgY6jXE9vHCwSRlG9Pbkw
	Np7P8AL2kvfNuHPrGwJ4l2lsJaMyvw6LeBISFNL5MRB0Xbs9ZD3
X-Received: by 2002:a05:600c:138a:b0:49c:fc6e:8cba with SMTP id 5b1f17b1804b1-49cfc6e8e34mr7095385e9.30.1788500840961;
        Thu, 03 Sep 2026 22:47:20 -0700 (PDT)
Message-ID: <5d942345-e804-400d-ad4e-e9671d8e9062@suse.com>
Date: Fri, 4 Sep 2026 07:47:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/14] x86/mm: introduce populate_perdomain_mapping()
To: George Dunlap <dunlapg@umich.edu>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Alejandro Vallejo <agarciav@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
 <20260901-asi-part2-2-ecc269f268b7@xenproject.org>
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
In-Reply-To: <20260901-asi-part2-2-ecc269f268b7@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1788500841-50D3CA5B-93E4B1CA/0/0
X-purgate-type: clean
X-purgate-size: 5819

On 02.09.2026 11:43, George Dunlap wrote:
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -6334,6 +6334,130 @@ int create_perdomain_mapping(struct domain *d, unsigned long va,
>      return rc;
>  }
>  
> +/*
> + * Map @nr pages, @mfn[0..nr-1], at consecutive pages from @va in v's view of
> + * the per-domain area, with page-table @flags.  The range must lie within a
> + * single per-domain slot, and must already have been plumbed down to the L1
> + * tables by create_perdomain_mapping(): missing structure is a bug.  A
> + * present entry not owned by the area (no _PAGE_AVAIL0) is silently
> + * replaced, as that is how callers update their mappings; a present
> + * area-owned entry is freed and replaced, which constrains the calling
> + * context (see the comment in the body).  No TLB flushing is done: the
> + * caller decides whether the old translations can still be cached
> + * anywhere.
> + *
> + * When v's page-tables are loaded on this pCPU the L1 entries are reached
> + * through the recursive linear mappings; otherwise the walk maps the
> + * per-domain page-table pages transiently with IRQs off, so it needs
> + * nothing from the current address space and is usable from any context --
> + * including the context switch, before the incoming vcpu's page-tables are
> + * loaded.
> + */
> +void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
> +                                const mfn_t *mfn, unsigned int nr,
> +                                unsigned int flags)
> +{
> +    l1_pgentry_t *l1tab = NULL, *pl1e;
> +    const l3_pgentry_t *l3tab;
> +    const l2_pgentry_t *l2tab;
> +    struct domain *d = v->domain;
> +    unsigned long irq_flags;
> +
> +    ASSERT(va >= PERDOMAIN_VIRT_START &&
> +           va < PERDOMAIN_VIRT_SLOT(PERDOMAIN_SLOTS));
> +    ASSERT(!nr || !l3_table_offset(va ^ (va + nr * PAGE_SIZE - 1)));
> +    /* Area-owned pages are installed by create_perdomain_mapping() only. */
> +    ASSERT(!(flags & _PAGE_AVAIL0));
> +
> +    if ( likely(this_cpu(pgtable_vcpu) == v) )
> +    {
> +        unsigned int i;
> +
> +        /*
> +         * Fast path: v's page-tables are loaded on this pCPU, so the L1
> +         * entries can be reached using the recursive linear mappings.
> +         */
> +        pl1e = &__linear_l1_table[l1_linear_offset(va)];
> +
> +        for ( i = 0; i < nr; i++, pl1e++ )
> +        {
> +            /*
> +             * An area-owned entry (installed by create_perdomain_mapping(),
> +             * marked _PAGE_AVAIL0) holds the only reference to its page, so
> +             * displacing it means freeing it.  Nothing in this series
> +             * replaces area-owned backing, hence the ASSERT_UNREACHABLE();
> +             * any future caller doing so must run where freeing is
> +             * permitted -- IRQs enabled, not in interrupt context (see
> +             * ASSERT_ALLOC_CONTEXT()) -- which the context switch path is
> +             * not.
> +             */
> +            if ( unlikely(perdomain_l1e_needs_freeing(*pl1e)) )
> +            {
> +                ASSERT_UNREACHABLE();
> +                free_domheap_page(l1e_get_page(*pl1e));
> +            }
> +            l1e_write(pl1e, l1e_from_mfn(mfn[i], flags));
> +        }
> +
> +        return;
> +    }
> +
> +    BUG_ON(!d->arch.perdomain_l3_pg);
> +
> +    /*
> +     * Slow path: walk v's per-domain page-table pages.  All mappings are
> +     * local to this function, so disabling interrupts for the duration of
> +     * the walk satisfies the map_domain_page_irqoff() contract.  This in
> +     * turn makes this function usable from the context switch path, where
> +     * a plain map_domain_page() could recurse into __context_switch() via
> +     * sync_local_execstate().
> +     */
> +    local_irq_save(irq_flags);
> +
> +    l3tab = __map_domain_page_irqoff(d->arch.perdomain_l3_pg);
> +
> +    /*
> +     * Missing page-table structure is a hypervisor bug: there is no safe
> +     * continuation, least of all from the context switch, where the next
> +     * descriptor fetch through an unmapped GDT slot would be fatal.
> +     */
> +    BUG_ON(!(l3e_get_flags(l3tab[l3_table_offset(va)]) & _PAGE_PRESENT));
> +
> +    l2tab = map_domain_page_irqoff(l3e_get_mfn(l3tab[l3_table_offset(va)]));
> +
> +    for ( ; nr--; va += PAGE_SIZE, mfn++ )
> +    {
> +        if ( !l1tab || !l1_table_offset(va) )
> +        {
> +            const l2_pgentry_t *pl2e = l2tab + l2_table_offset(va);
> +
> +            BUG_ON(!(l2e_get_flags(*pl2e) & _PAGE_PRESENT));
> +
> +            unmap_domain_page_irqoff(l1tab);
> +            l1tab = map_domain_page_irqoff(l2e_get_mfn(*pl2e));
> +        }
> +
> +        pl1e = &l1tab[l1_table_offset(va)];
> +
> +        /*
> +         * As the fast path -- and the slow path holds IRQs off throughout,
> +         * so replacing area-owned backing here is never permitted.
> +         */
> +        if ( unlikely(perdomain_l1e_needs_freeing(*pl1e)) )
> +        {
> +            ASSERT_UNREACHABLE();
> +            free_domheap_page(l1e_get_page(*pl1e));
> +        }

Just for the possible case of freeing here really becoming necessary: This
could be deferred until ...

> +        l1e_write(pl1e, l1e_from_mfn(*mfn, flags));
> +    }
> +
> +    unmap_domain_page_irqoff(l1tab);
> +    unmap_domain_page_irqoff(l2tab);
> +    unmap_domain_page_irqoff(l3tab);
> +
> +    local_irq_restore(irq_flags);

... here. Easily for the nr == 1 case (just requires a local variable to
hold MFN or struct page_info *), and with a slight change to the contract
with the caller (allowing mfn[] to be altered) also in the general case.

Jan

