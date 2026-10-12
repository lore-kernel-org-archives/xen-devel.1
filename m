Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B61CA9ED1
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 13:48:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446378.1662508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGGO7-0003Oi-Df; Mon, 12 Oct 2026 13:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446378.1662508; Mon, 12 Oct 2026 13:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGGO7-0003Ob-AY; Mon, 12 Oct 2026 13:48:23 +0000
Received: by outflank-mailman (input) for mailman id 1446378;
 Mon, 12 Oct 2026 13:48:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGGO5-0003OT-9d
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 13:48:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGGO4-004gvH-1s
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 15:48:20 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acce521-e002-0a2a0a5209dd-0a2a4503a566-8
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 15:48:19 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acce523-fae8-0a2a45030019-d1558033dcc3-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 15:48:19 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4a16aaf2067so23567415e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 06:48:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bb6b3cbsm232843565e9.0.2026.10.12.06.48.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 06:48:18 -0700 (PDT)
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
        d=suse.com; s=google; t=1791812899; x=1792417699; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0JJgzXibs2L8Ozots3TUohDX9JTUp65Qyaj9d4ug+z4=;
        b=de0qNkV7oLOHjpnKRjry7TTmpSajk+l2Ogn7eXQIdYmyLNQRn2olTHaNIxtAKnMsnw
         u6jV+j+gUsKqB5MkIXEIZaRjN7JpAgYvzyk5sY0c2vchWX5V8qmf1uhlMhp4i30CUew0
         eBZbF9S8uzHrgKuN7gfXXtL6RbPAwQUS+GObEQ2TzT/3AzILoYQcfPdvUSzmE6QOpK/b
         g5mT9QJTej713dFV07UU9Y7v/xL6V+qy2hODwq2L2Q800vDUtHzCxaOQsMUp0+Zcb14x
         Im6W9jIPcVliYbQPY+95tiSIN8+KMOtMNCE6xBfnJJKVSZFFaEW5vcizzld+HqLA9mHc
         cA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812899; x=1792417699;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0JJgzXibs2L8Ozots3TUohDX9JTUp65Qyaj9d4ug+z4=;
        b=QhPzSaWkHrppqla5y85euRjyHq7geurU8UITnnldKVQkk3J1qSFsD5S2lOVOI9Wv1/
         WJp9j+hz2irlc1d2ZKiYzib+5VtDeyM7A5GjjSPbH1o/tP3Tj863oj0pOCq6NSUTP8wf
         T9jD41vd4QSWNSPOMhM/uf81iEajx4JJf6Cye+mPjd1v0mdNJ1l0LjRMaH/HTp6RYU/G
         LEKprsp71XeXEiSaD8MOiDrGAFR6915YR9mk1C40XHSwuFEgCwV+UFG5Y8ANSqKLGqYv
         jUaIi5HqP/cnBuxdXmYO6MGYc1XqArNtgmFfn/IqSLGNOdQofQ+qQcXGMqeW4YMyGjQk
         4ciA==
X-Forwarded-Encrypted: i=1; AKwUvBx6ae9YvK+TxbMH0iqBvqwAi0ZSlLZkLrIscgR9jGPDikSN2VVd7r/jIOjEnxZyZTgTk0QtAQ3V+NI=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIBMy42zm+n4olTJfo6rvwKW1xuPNv82HRohb+7652VZ3fh0nL+
	DhlFhvMvaXRQxgiPrFqkrRpMjeB7SMfJtNTebt+cHIvhKnQ8qrwvvNOBlVYyY0gkJQ==
X-Gm-Gg: AYBFou0coHeLt3BWk3PyFf/pk3jM4Rv+3of05RvScK4f1zwd8UG6GrD+ZxB2EZaizH2
	5yK8nbQ/X3AkoXDEbZofevMtL9ZDGUiPD5GgktV4r8PTgmeB/yN1ONgVul87UmjhQNF/ezMw/KK
	I0Nn7Jg0GZWMUizfR4gvHeVdi7qysFHlwwGfEyS15CmWib3SWvsM1zcTpTcqj1tgqWtpLISl0Mm
	Jw8xqYIf9EIiZolilRRcsrO2k6CyNwG6k4atWA81gBTgMG0yPDFhWCVQpjQ09rmGurZrjVo/KZi
	VSbDp+gn2jGdV5Ss67vIu4c4MPzZvXV8CkqAT+t0aneRwZOLaaf1l1vYPMPCNEyda31I2PszKjT
	TciaMKLQH/mali61Vepu2/BmlYn4qfKsTPRTN19mjrXuvXIGUIJ8DA/y+BxxNzA94fBzntlizyG
	kEkFseY1hyRoNKD730jO0E+d+9j4xb8x6phHXWKM3OyNs0L2f318g26b38Tjc9iscGl5XbGEChk
	aIWS4FLXLvUjgyxIfautQs7ARB76rlr7AjZ37BIX4RvaZTD7DFWtG7PquxfkQ==
X-Received: by 2002:a05:600c:4ecb:b0:4a1:76c9:5408 with SMTP id 5b1f17b1804b1-4a18e4a510emr192106875e9.11.1791812899172;
        Mon, 12 Oct 2026 06:48:19 -0700 (PDT)
Message-ID: <8514b7b6-cf1c-44d9-827c-675fd5a6708e@suse.com>
Date: Mon, 12 Oct 2026 15:48:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/18] x86/domain_page: prepare the mapcache for
 per-vCPU accounting
To: George Dunlap <gwd@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261007104051.48841-1-gwd@xenproject.org>
 <20261007104051.48841-9-gwd@xenproject.org>
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
In-Reply-To: <20261007104051.48841-9-gwd@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1791812899-6F6C64E9-E980086C/10/78276251493
X-purgate-type: spam
X-purgate-size: 5285

On 07.10.2026 12:40, George Dunlap wrote:
> From: Roger Pau Monné <roger.pau@citrix.com>
> 
> Currently, only PV domains have a mapcache, which is domain-wide one.
> In preparation for enabling per-vCPU mapcaches for HVM domains, split
> the accounting out into a struct mapcache, embedded in struct
> mapcache_domain.
> 
> Introduce has_mapcache(), for whether a vCPU has a mapcache, and
> vcpu_mapcache(), which returns the accounting for a vCPU's mapcache
> and, in *dcache, the domain-wide mapcache whose lock and TLB epoch the
> caller has to take into account.  For now has_mapcache() is
> is_pv_vcpu(), and vcpu_mapcache() always returns the domain's
> accounting.  map_domain_page() and unmap_domain_page() stop repeating
> the is_pv_vcpu() check mapcache_current_vcpu() has made.
> 
> Move map_domain_page()'s handling of the domain-wide lock and TLB epoch
> into three helpers: mapcache_lock() takes the lock and catches up with
> a wrap another vCPU caused, mapcache_new_epoch() starts a new epoch
> after a wrap, and mapcache_unlock() drops the lock.  A per-vCPU
> mapcache can then skip them without map_domain_page() being
> re-indented.
> 
> struct mapcache_domain keeps its size (40 bytes, x86_64 debug build),
> and so do the structures containing it.
> 
> No functional change.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8, Claude Code:claude-opus-5-5
> Signed-off-by: George Dunlap <gwd@xenproject.org>
> ---
> Changes in v3:
> - New in this version, split out of "x86/hvm: introduce per-vCPU
>   mapcache for vCPU-PT domains" for review.
> ---
>  xen/arch/x86/domain_page.c        | 155 ++++++++++++++++++++----------
>  xen/arch/x86/include/asm/domain.h |  19 ++--
>  2 files changed, 116 insertions(+), 58 deletions(-)
> 
> diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
> index 9119f735f5..5d90f77bed 100644
> --- a/xen/arch/x86/domain_page.c
> +++ b/xen/arch/x86/domain_page.c
> @@ -18,17 +18,23 @@
>  #include <asm/hardirq.h>
>  #include <asm/setup.h>
>  
> +/*
> + * Whether v has a mapcache: PV vCPUs (whose domain-wide mapcache may still be
> + * disabled, see mapcache_domain_init()).  HVM vCPUs reach everything through
> + * the directmap, which covers all physical address space for them.
> + */
> +static bool has_mapcache(const struct vcpu *v)
> +{
> +    return is_pv_vcpu(v);
> +}
> +
>  static inline struct vcpu *mapcache_current_vcpu(void)
>  {
>      struct vcpu *v = this_cpu(pgtable_vcpu);
>      struct vcpu *curr = current;
>  
> -    /*
> -     * During early boot pgtable_vcpu is not set, callers must handle NULL.
> -     * Non-PV domains don't have a mapcache, the directmap covers all physical
> -     * address space.
> -     */
> -    if ( !v || !is_pv_vcpu(v) )
> +    /* During early boot pgtable_vcpu is not set, callers must handle NULL. */
> +    if ( !v || !has_mapcache(v) )
>          return NULL;

(For context below: The replacement of is_pv_vcpu() here is easy to follow.)

> @@ -54,6 +60,55 @@ static inline struct vcpu *mapcache_current_vcpu(void)
>      return ACCESS_ONCE(this_cpu(pgtable_vcpu));
>  }
>  
> +/*
> + * The accounting for v's mapcache: the domain's, with *dcache set so the
> + * caller takes the domain-wide lock and TLB-epoch machinery into account.
> + */
> +static struct mapcache *vcpu_mapcache(struct vcpu *v,
> +                                      struct mapcache_domain **dcache)
> +{
> +    struct domain *d = v->domain;
> +
> +    *dcache = &d->arch.pv.mapcache;
> +    return &(*dcache)->cache;
> +}

This function only retrieves data. Can't its first parameter therefore be
pointer-to-const?

> @@ -74,12 +130,12 @@ void *map_domain_page(mfn_t mfn)
>  #endif
>  
>      v = mapcache_current_vcpu();
> -    if ( !v || !is_pv_vcpu(v) )
> +    if ( !v )
>          return mfn_to_virt(mfn_x(mfn));

I don't quite understand why this is_pv_vcpu() is okay to drop. What
mapcache_current_vcpu() returns isn't what it ran is_pv_vcpu() on. (Same
in unmap_domain_page() then, obviously.)

> @@ -249,15 +294,23 @@ void mapcache_domain_init(struct domain *d)
>  int mapcache_vcpu_init(struct vcpu *v)
>  {
>      struct domain *d = v->domain;
> -    struct mapcache_domain *dcache = &d->arch.pv.mapcache;
> +    struct mapcache_domain *dcache;
> +    struct mapcache *cache;
>      unsigned long i;
> -    unsigned int ents = d->max_vcpus * MAPCACHE_VCPU_ENTRIES;
> -    unsigned int nr = PFN_UP(BITS_TO_LONGS(ents) * sizeof(long));
> +    unsigned int ents, nr;
>  
> -    if ( !is_pv_vcpu(v) || !dcache->inuse )
> +    if ( !has_mapcache(v) )
>          return 0;
>  
> -    if ( ents > dcache->entries )
> +    cache = vcpu_mapcache(v, &dcache);
> +    if ( !cache->inuse )
> +        /* Domain-wide mapcache disabled (fully direct-mapped build). */
> +        return 0;

While technically not wrong, this comment appears to be quite a bit
forward-looking.

> +    ents = d->max_vcpus * MAPCACHE_VCPU_ENTRIES;
> +    nr = PFN_UP(BITS_TO_LONGS(ents) * sizeof(long));

Is there a reason these cannot be the initializers of their variables
anymore?

Jan

