Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525DDC79F82
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 15:36:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412217.1642743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3xsA-0003Ck-LD; Tue, 08 Sep 2026 15:36:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412217.1642743; Tue, 08 Sep 2026 15:36:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3xsA-0003Cd-IY; Tue, 08 Sep 2026 15:36:34 +0000
Received: by outflank-mailman (input) for mailman id 1412217;
 Tue, 08 Sep 2026 15:36:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3xs9-0003CX-Fb
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 15:36:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3xs8-00H12z-SW
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 17:36:32 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa02b5e-e002-0a2a0a5209dd-0a2a45028040-32
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 17:36:32 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa02b80-6ca4-0a2a45020019-d155dd31a8df-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 17:36:32 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-48431648f33so3801247f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 08:36:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883c074asm35967770f8f.23.2026.09.08.08.36.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 08:36:31 -0700 (PDT)
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
        d=suse.com; s=google; t=1788881792; x=1789486592; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eHZqF9+F1KWCj3lF8faY6w+JvEdXiNbJY2NR6FAt3RY=;
        b=GyzLBpv+Djiy2Gh97VZ2a/CPCgVVkYPS7GJ9xjOvU48UWYizyc4SA+o+V0XFN0MlFb
         HZdNF1obxA9S7qcaRWvJFcanZ7gRuK1E7L7nM4EKQarQAxd6wIZp/U/cDZXfa5NaP1zj
         IUBRBxmb+UQONBmMw+izodne+qVSezB0engYfAOwwdq5LsdIFURDmkliVUeEMI+81myd
         nAdqwP1hSJOUIZveDhdmSAuiTKAcbwrQtQnNQ2gdsWYuSIsaRGWY+HwUROCta+sKurRR
         sI+UPBoJkBGSTCKFvRmv4Tm/KG0oNjR/07Sef2pW+Cq9tpzKQAT1mqHbpfgCpKLwCXif
         PPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788881792; x=1789486592;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eHZqF9+F1KWCj3lF8faY6w+JvEdXiNbJY2NR6FAt3RY=;
        b=AjN4cb1INr7DdJUG5zT9Q/Q53E/GqwSZwdJ1kjYtHetK7C6+c4xLASUiNYdCXMTBOQ
         j8JWTzhYelSq4INftjyTHXi4RQm+iFs9+1EiL6iDSbzOzf3qbeFOTg1RDjpTvbxLYpeA
         l0Zumpw/mn+QZmC9uh501jtFjKXVX8mZ/zntYYg2RjoLVv99ZJ9x2+Se0eT5Y8v5E4/C
         /BTvkjEHNtsxbrh1QejYXibMkL4+tLROKQBqawaWRIEy//ZkP785GiPvyH4Ulx/AW1Gx
         RBYTCQ9bKEeq7IpEo0Jd4d8ecSMrgwlqdiqXg2ar5oP+p6m2+lqDFv8MvC3ieeFpSEmf
         m5kg==
X-Forwarded-Encrypted: i=1; AKwUvBwFDyNooXhMBLu13I03BhPZaYak+BWSbcg9penaF/LaoaFDoPGP/kRgUP0ENTWJbfyMKSbGezN72aE=@lists.xenproject.org
X-Gm-Message-State: AFuF++m3qVuFn/bJq03D/Gp7OwDhvjQHJlMW6t0PA6BLb9rcAJQfeA6F
	fGRBczBtcRVkq41otMaKQNcGu+5BxsSXeGXROQ25pzPfUhUKyJCkXWRqBlzeeRm3zQ==
X-Gm-Gg: AYBFou3R+xoJ0+ArfuU+kKUUbcfz4dwLxV5tKynBdVURdaPz5m0jIZO3hb0ZwvKUA+t
	u9vNMprG2lRC3ocpoCFwhcS4Qz8PzNQ3m1vJ2NFGIsG2dnQdGmLIcZY1x5GvQhWewCNI6gsjatY
	rmog+xX9eZnnruMcAMRHfISE65CDJYftZgeGyh5NfrxXWfgbn6TMsiCYcon1cYmyUxZBSB+NSe2
	AAnaprn3ZeV/luuvbFny6BzwgxqzXKsBmUHjlYpUTr/j8spsvx/GGaI2Z/wWKQXAUjzUF26bZ8S
	J7C8a2pd5b+M4uB6Elj7cOxQMRSJSCeqvdrZrx1HFrbz2O0P9Vbwl622kcvZO26tksuQ6zmc+0W
	1k4jRhhdEdLO+NfPDYawRFSDvakplM4MrKuAzXyTVb3dufBrhqeWia6OTEyD29qH94pwaWxWG8q
	RxJxYP216x8WrXSCugx+bjy9r57JGw+731B1iavvWpW//mD141f5MFUFRlJo1uTPh6sLq2gAd3I
	eVPuOP0PU+XM5UdBpvPG5I25dQNDAWwAHW5hIcofel+C9jlY4QY
X-Received: by 2002:a05:6000:2008:b0:485:8226:c69d with SMTP id ffacd0b85a97d-4858226c991mr37825225f8f.28.1788881792212;
        Tue, 08 Sep 2026 08:36:32 -0700 (PDT)
Message-ID: <97a420e4-87d3-4600-b169-8ec7e5f62a21@suse.com>
Date: Tue, 8 Sep 2026 17:36:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/14] x86/mm: prepare destroy_perdomain_mapping() for
 per-vCPU perdomain areas
To: George Dunlap <dunlapg@umich.edu>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Alejandro Vallejo <agarciav@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
 <20260901-asi-part2-9-ecc269f268b7@xenproject.org>
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
In-Reply-To: <20260901-asi-part2-9-ecc269f268b7@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1788881792-F3CBA2AC-4DB3A1A3/0/0
X-purgate-type: clean
X-purgate-size: 3077

On 02.09.2026 11:43, George Dunlap wrote:
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -6456,10 +6456,11 @@ void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
>      local_irq_restore(irq_flags);
>  }
>  
> -void destroy_perdomain_mapping(struct domain *d, unsigned long va,
> +void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
>                                 unsigned int nr)
>  {
>      const l3_pgentry_t *l3tab, *pl3e;
> +    const struct domain *d = v->domain;
>  
>      ASSERT(va >= PERDOMAIN_VIRT_START &&
>             va < PERDOMAIN_VIRT_SLOT(PERDOMAIN_SLOTS));
> @@ -6468,6 +6469,26 @@ void destroy_perdomain_mapping(struct domain *d, unsigned long va,
>      if ( !d->arch.perdomain_l3_pg )
>          return;
>  
> +    if ( likely(this_cpu(pgtable_vcpu) == v) )

Right now this looks to be relevant only to some of the call sites of
pv_destroy_ldt(). I expect this is going to change down the road?

> +    {
> +        l1_pgentry_t *pl1e;
> +
> +        /*
> +         * Fast path: v's page-tables are loaded on this pCPU, so the L1
> +         * entries can be zapped using the recursive linear mappings.
> +         */
> +        pl1e = &__linear_l1_table[l1_linear_offset(va)];
> +
> +        for ( ; nr--; pl1e++ )
> +        {
> +            if ( perdomain_l1e_needs_freeing(*pl1e) )
> +                free_domheap_page(l1e_get_page(*pl1e));
> +            l1e_write(pl1e, l1e_empty());
> +        }
> +
> +        return;
> +    }
> +
>      l3tab = __map_domain_page(d->arch.perdomain_l3_pg);
>      pl3e = l3tab + l3_table_offset(va);

The slow path is resilient against an area never having been mapped. This
fast path looks like it would crash on a missing L2 or L1 table. I.e. for
domain cleanup (and error handling during domain creation) we'd
implicitly rely on those never taking the fast path. May be worth making
explicit in the description.

> --- a/xen/arch/x86/pv/domain.c
> +++ b/xen/arch/x86/pv/domain.c
> @@ -319,8 +319,7 @@ static int pv_create_gdt_ldt_l1tab(struct vcpu *v)
>  
>  static void pv_destroy_gdt_ldt_l1tab(struct vcpu *v)
>  {
> -    destroy_perdomain_mapping(v->domain, GDT_VIRT_START(v),
> -                              1U << GDT_LDT_VCPU_SHIFT);
> +    destroy_perdomain_mapping(v, GDT_VIRT_START(v), 1U << GDT_LDT_VCPU_SHIFT);
>  }

Considering what patch 08 does - is this explicit call really needed?
There are no pages to free here, unlike ...

> --- a/xen/arch/x86/x86_64/mm.c
> +++ b/xen/arch/x86/x86_64/mm.c
> @@ -738,7 +738,7 @@ int setup_compat_arg_xlat(struct vcpu *v)
>  
>  void free_compat_arg_xlat(struct vcpu *v)
>  {
> -    destroy_perdomain_mapping(v->domain, ARG_XLAT_START(v),
> +    destroy_perdomain_mapping(v, ARG_XLAT_START(v),
>                                PFN_UP(COMPAT_ARG_XLAT_SIZE));
>  }

... here. Then again even the freeing is taken care of by
free_perdomain_mappings(), so even for this one the question arises
whether it's actually needed.

Jan

