Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A33CA9ED0
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 11:20:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446150.1662206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGE4L-0007lJ-5z; Mon, 12 Oct 2026 11:19:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446150.1662206; Mon, 12 Oct 2026 11:19:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGE4L-0007lC-3C; Mon, 12 Oct 2026 11:19:49 +0000
Received: by outflank-mailman (input) for mailman id 1446150;
 Mon, 12 Oct 2026 11:19:47 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGE4J-0007l6-GZ
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 11:19:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGE4I-009D5F-HY
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 13:19:46 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6accc252-8faa-0a2a0a5109dd-0a2a4509e0e6-2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 13:19:46 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6accc252-be1a-0a2a45090019-d155802ecc5c-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 13:19:46 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4a168355946so14807445e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 04:19:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf135fasm248107395e9.5.2026.10.12.04.19.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 04:19:45 -0700 (PDT)
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
        d=suse.com; s=google; t=1791803986; x=1792408786; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AeUNAMg5f0KKkFa4a1Jx6LJNV9TtHqGJpEU8RCxMHdo=;
        b=RXO2ddQOJdgwSEeQXtU4msDWOFFsvrZrVGZDJhMKwjPhBkvxUQuhbAlaMP0tRsM0uD
         4Vniqa/8mNLNNpX4O1CmowEYvUqD46H8xpZ4EXlhoT8lftOu3/qSLfOEvZ+CLgLcj/7U
         tGu0KbFTiSAA5qX2w6CUl0kwv1R0Z2UDPJkWQPeXzH7w1XwfTwDfwptJ6677szBRtoUO
         og2qjheztfLPW0zEoCg/LPPBJhHvOT1xc9ey6HcXYfdQVhM1DsRlrW7gJa+U3/avKDVQ
         FMNvO194Trg5qac/63Q+qMZ8HnZsUDZOz0yoC/A7SoI15KNl5HHMLNio3mNbHFTZH9yI
         y9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791803986; x=1792408786;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AeUNAMg5f0KKkFa4a1Jx6LJNV9TtHqGJpEU8RCxMHdo=;
        b=Z5YhnGxQoicP89sPXHsg4KF6z5fqosvAtrQIipBT4FzF7iM+PpTSH1/zhLMQr45tyF
         4g0iXtzEDq9YcdPPtnnrtcvoGsOtj/hA5UOu6c6XxY70mkPPtrf74nDGREaRhN13ftUe
         zMosEvwvj6HpAZikuRFMKnxIYCjIVZiHw6fszmA5c+0teuIdKmNgjYj2tL1ivQiGJFcW
         HKbJCYRA4hMj7Cik7xjBdbzS4H4gOBQ49/kfl7cl672v+iuI0e3OAlEe7cSp95D8E+ek
         /2NVIpMhW/0nenTvs06YI5Mv31LrvyQz3gj3fp9/cPuEXolMzym916l7denE0mGeHqj0
         aJzA==
X-Forwarded-Encrypted: i=1; AKwUvByQZjCk0k709KjXazl2SAHUAQeO0NXrBwAqxWFgHBxoGnC2+F8p0Jcl8bOpJPjSKuWGf9t4quMJtwg=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLDlL+xtSF5UrteggV2lPg8R8oyqoUMluwVP0bSVQOwMReVT24A
	5BooLCfGcfElsxTsSCE++eZtYwCjGMFtXrTXduHnLUWDY76KKuV4QSDB2mYNiuByBA==
X-Gm-Gg: AYBFou3XkI1gWC0Bgfs1V8yXMoHE6/6fYK5EilA1+V+QZASOZRQXavz/b16ovmmpAVx
	IgcQYwAidIdSZL1HBt31l+vKyVbgzpF9fIVY0/ogg+UKuk66111ckcubJO6emmPM3pZ0Kx9TxvC
	HXZHPeeKZtJO0QBlRQTBPDE6MDprNnY8ndMJthU99K6n3ZdS9tub5e2IownNmYnGut33l5eWFV+
	Tkstavd5dLh7gSqlmuWeBJ6xMaESy2hDOZQutXKmJRExjo5nBaVpHbBVGJY2tesIxOZG4D5XzMn
	DJE8EaDeaT7tcBNh9gxh9VY1lJJW4pI36+Ld+qBuD44qLskRs5XiDYVHBp53TtdmLJgExNEZgUo
	zmAO4pA/JDC4xSeKkv+Puq6ZUqQIjI2V2KRQcEq/vEh70GJWw0T+9Uwc3r6hwMwxh6FyQL6gutW
	pqvAXEhNyGhFq1r0/lC+GfFmRs3xBOrbrNlFOFrD0qmmqs8aA1gjLZc0T6Xr5DHMFmzDSlKLNgB
	bVIQTl9vUu0qS1e0x5jbjjyyHZ0HzK+4Z5GrKxcN37sxN+NAUintY1AvzbV7Q==
X-Received: by 2002:a05:600c:a112:b0:4a1:9663:7633 with SMTP id 5b1f17b1804b1-4a1966379f7mr87856115e9.11.1791803985787;
        Mon, 12 Oct 2026 04:19:45 -0700 (PDT)
Message-ID: <7a517bf8-f6bd-4f59-aad0-89425ad65f9e@suse.com>
Date: Mon, 12 Oct 2026 13:19:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] x86: extend mod_l*_entry() to optionally return
 the old PTE value
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: teddy.astie@vates.tech, Kevin Lampis <kevin.lampis@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20261001174749.2275245-1-kevin.lampis@citrix.com>
 <20261001174749.2275245-4-kevin.lampis@citrix.com>
 <c0add70e-b716-46df-85bc-7d2ace35a775@citrix.com>
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
In-Reply-To: <c0add70e-b716-46df-85bc-7d2ace35a775@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1791803986-BDCC7034-57EED32D/10/78276251493
X-purgate-type: spam
X-purgate-size: 3697

On 09.10.2026 18:25, Andrew Cooper wrote:
> On 01/10/2026 6:47 pm, Kevin Lampis wrote:
>> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
>> index 1ddb8b71469a..535a62139cad 100644
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -2154,7 +2154,8 @@ static void l3t_unlock(struct page_info *page)
>>  /* Update the L1 entry at pl1e to new value nl1e. */
>>  static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
>>                          mfn_t gl1mfn, unsigned int update_flags,
>> -                        struct vcpu *pt_vcpu, struct domain *pg_dom)
>> +                        struct vcpu *pt_vcpu, struct domain *pg_dom,
>> +                        l1_pgentry_t *ol1e_out)
>>  {
>>      l1_pgentry_t ol1e = l1e_read(pl1e);
>>      struct domain *pt_dom = pt_vcpu->domain;
>> @@ -2215,7 +2216,12 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
>>          /* Fast path for sufficiently-similar mappings. */
>>          if ( !l1e_has_changed(ol1e, nl1e, ~FASTPATH_FLAG_WHITELIST) )
>>          {
>> -            UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
>> +            if ( ol1e_out )
>> +                *ol1e_out = UPDATE_ENTRY_SWAP(l1, pl1e, ol1e, nl1e, gl1mfn,
>> +                                              pt_vcpu, update_flags);
>> +            else
>> +                UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
>> +
> 
> This is a reoccurring pattern.   Also, from the subsequent patch, this
> is the caller's reoccuring pattern:
> 
>> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c index
>> 535a62139cad..a2d05d6c7113 100644 --- a/xen/arch/x86/mm.c +++
>> b/xen/arch/x86/mm.c @@ -4111,6 +4111,7 @@ long do_mmu_update( case
>> MMU_NORMAL_PT_UPDATE: case MMU_PT_UPDATE_PRESERVE_AD: case
>> MMU_PT_UPDATE_NO_TRANSLATE: + case MMU_PT_UPDATE_SWAP: { p2m_type_t
>> p2mt; @@ -4172,10 +4173,27 @@ long do_mmu_update( update_flags =
>> PTE_UPDATE_PRESERVE_AD; else if ( cmd == MMU_PT_UPDATE_NO_TRANSLATE )
>> update_flags = PTE_UPDATE_NO_TRANSLATE; + else if ( cmd ==
>> MMU_PT_UPDATE_SWAP ) + update_flags = PTE_UPDATE_SWAP; switch (
>> page->u.inuse.type_info & PGT_type_mask ) { case PGT_l1_page_table: +
>> if ( cmd == MMU_PT_UPDATE_SWAP ) + { + l1_pgentry_t ol1e; + rc =
>> mod_l1_entry(va, l1e_from_intpte(req.val), mfn, + update_flags, v,
>> pg_owner, &ol1e); + + if ( !rc ) + { + req.val = ol1e.l1; + if (
>> unlikely(copy_to_guest(ureqs, &req, 1)) ) + rc = -EFAULT; + } + break;
>> + } + rc = mod_l1_entry(va, l1e_from_intpte(req.val), mfn,
>> update_flags, v, pg_owner, NULL); break;
> 
> 
> Both are rather intractable as far as logic goes.   We've got
> MMU_PT_UPDATE_SWAP setting flags=PTE_UPDATE_SWAP which both gets passed
> in flags and expressed through the NULL-ness of of the ol?e_out pointer,
> which then choses UPDATE_ENTRY() or UPDATE_ENTRY_SWAP().
> 
> The only thing UPDATE_ENTRY_SWAP() is doing is wrapping the return
> intpte_t into a typesafe variant.  It doesn't play with PTE_UPDATE_SWAP,
> so the name is misleading.  It's unfortunate that we can't wrap
> UPDATE_ENTRY(), but I think we'll just have to live with that.
> 
> I think the logic in mod_l?_entry() wants to be along these lines:
> 
>     intpte_t old = UPDATE_ENTRY(...);
>     if ( ol1e_out )
>         *ol1e_out = l1e_from_intpte(old);

This would then require that all callers, ...

> and the logic in do_mmu_update() wants to be along these lines:
> 
>     {
>         l1_pgentry_t ol1e;
> 
>         rc = mod_l1_entry(..., &ol1e);

... e.g. the one here, initialize the local variable to 0.

Jan

