Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6FA606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 14:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VNZw1mbE
Received: from list by lists.xenproject.org with outflank-mailman.1463324.1674211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM4R8-0001mn-GG; Wed, 28 Oct 2026 14:15:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463324.1674211; Wed, 28 Oct 2026 14:15:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM4R8-0001mf-CS; Wed, 28 Oct 2026 14:15:30 +0000
Received: by outflank-mailman (input) for mailman id 1463324;
 Wed, 28 Oct 2026 14:15:29 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xM4R7-0001mZ-2g
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 14:15:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xM4R6-00CqWv-BV
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 15:15:28 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae2037e-bab6-0a2a0a5309dd-0a2a45049af6-18
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 15:15:28 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae20380-b57f-0a2a45040019-d1558030c058-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 15:15:28 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4a5b2be99a8so8915215e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 07:15:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a978795f4dsm42087895e9.9.2026.10.28.07.15.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 07:15:27 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793196928; x=1793801728; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mlEJ3PnBF22KBmNuKmc5iG0oPTUVfRLAWE+gciNaRd0=;
        b=VNZw1mbEkZ5CmO3sLm5AZHQcJo5f8v85qLVOhslCp4CHQIqH0WzHVbIx8Dpw7FMArM
         0qjjTk8HI9xQ8aEQLH+ji3fDQbZ867KwE/YzV9rTSjfCoLCxWeLFZ/qJYinprbjwofMJ
         Xo/MFL6zyUwQapKaScdoetwe/YGN1e+BlOBqYwyH+fAdOx2tVnhEDgHzl3i9rB8BDxtm
         hoLgI4Wb20AKpCY60vmsDqg9JEHY3POxSI3iXl7zdU6e1pjwkdgAGrgQFIwhDq6mnYo9
         7dBPWaLb8ElmRR82Ya04tn+OfUtGXTBOPkMnRBtXOa0qMH0ev3TbSFU6ZtaDJAZGmo78
         22Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793196928; x=1793801728;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mlEJ3PnBF22KBmNuKmc5iG0oPTUVfRLAWE+gciNaRd0=;
        b=o2Z0yo6ZntBtroN/Q6xoLfj832gQc7EK1LfKQYtvvEnt/z+tjU7SS4ajEQ76dDyftr
         +RbqhntblBo2+CHj6/Gj5jiK50bLL3pyCY2HdTh+if609xtROMUX3ieP56A5pxoN1clH
         B6kMGLSX+KmvLYuFjKnb/bA0O8TiZOeyMnHm4GKp9F6pUzmmUF3f6U9DwLLwmBcLYRGu
         aS50jX2bela6FXvOnjJTzfoIZ+8QVFXJOixdbSoIcfC05v8ytsmjqGTL2qFa0GG484dD
         d6s3Y8NpIX2jbCyItGFNCMuHCTfd1WS2jETR0BazCupac4o+yl63sUkEM7lyzQn2qn87
         CwKg==
X-Forwarded-Encrypted: i=1; AKwUvBwOnReL1haXaGBjvlDvZhBd992ZQ5MKJUf1ZPF/ryPoHieh1QXitxGJJ0L6Inck2inUQZfSkBOp3E4=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJX5O0LuFWsRjLcCI5jJLSq//DCEmSt2RPrZ6lQxAbuTDI+vh+b
	YSweGWfh7NFB9EpyFK/UNEqFdmMm0NpGjIIZK46VJBTKTQQ1aWBHMU7o1pex81bNuQ==
X-Gm-Gg: AYBFou0dJIahq/aun4f7U15hE3gZzCA1/vlaA9fX3xC28jvuD74abP4ooIMz1mS7sNX
	QIpqDwLor9IBDzJvf0qdBaXzhC/Tz6rvFKU3xIlIQwRH4iNGC04iW6SRqzQdVn3aWs7eSoFJuDu
	6gdEwixpby0UGcfM4KPWQQUOXO5Oz50slf50i5r7w1nWpXlm8hz/yPvEbbZEMZ/3r2uhDY9HnCk
	zNfzTpuUJsE1CjZkzhg+2c+/fo/+PaIxaAR6Ys23ehXl/F2c7vnM8/RBLh3h+g17uUE4etUMfHd
	P52VGXuTRQmirN9ZZfthLxYgp02DijSndxJqvCDxrcQaHKRusDN+pI48pKwFSVzSvivcV/1FY2B
	kBLWeZuepQdTxQq4Iv6YCV7GLxYwv8o61OGpkW0gxUWsZthhsfkJUBNrpGk0XmvY847ncIc1VSX
	e4bZDuS7yg+tov2vld8rUIFIJVMr2GEQKuYrkiUrcpvbsk/KBHwZev8wvew4oej6V1Qst6XXlny
	RT2qbfDfuKH0uY160FVMCLGH9PBvCQ0AXI3re1Swu8IDnp6710bgVuDv+Ksyo9r8311bXvqgKKv
	uRkU1INqbbdaRBQD0pgu9bfTsZYc6BmHjvkxQ0lBbItmccuzOwlKYLE6BSS42vVJ+3U/WvgRUZ3
	uW3LezlaAomPz58nq
X-Received: by 2002:a05:600c:154a:b0:4a0:1efa:c74a with SMTP id 5b1f17b1804b1-4a9678c26dfmr51155745e9.20.1793196927665;
        Wed, 28 Oct 2026 07:15:27 -0700 (PDT)
Message-ID: <7128c617-9432-4571-9b7a-22d6f6e8d884@suse.com>
Date: Wed, 28 Oct 2026 15:15:25 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/mm: Remove loops in get_order_from_{pages,bytes}()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261028124104.1564435-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20261028124104.1564435-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1793196928-520D5B50-939FBEF8/10/78276251493
X-purgate-type: spam
X-purgate-size: 2687
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 28.10.2026 13:41, Andrew Cooper wrote:
> These two functions are just fls() expressions in disguise.  Furthermore,
> GCC-12 at least won't const-propagate get_order_from_pages() with an input of
> 3 or above, which covers most of the cases it gets used for.
> 
> Rewrite them, and provide some self testing.
> 
> Interesting, unless they are always_inline, GCC has a habit of out-of-lining
> them even when inlining would have been a win.  I expect this is to do with
> the fls() functions being superficially more complex.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger@xenproject.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> 
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2999078934
> 
> I think paddr_t is the wrong type to be using in get_order_from_bytes(), and
> so really is fls64().

What other parameter type would you suggest? size_t is suitable only to express
virtual address region extents.

>  I could add fls_g() which would be slightly nicer on
> builds where paddr_t != uint64_t.

We have ffs_g(), so adding fls_g() would only seem natural. But see also below.
Either form:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -530,26 +530,16 @@ page_list_splice(struct page_list_head *list, struct page_list_head *head)
>      list_for_each_entry_safe_reverse(pos, tmp, head, list)
>  #endif
>  
> -static inline unsigned int get_order_from_bytes(paddr_t size)
> +static always_inline unsigned int get_order_from_bytes(paddr_t size)
>  {
> -    unsigned int order;
> -
>      size = (size - 1) >> PAGE_SHIFT;
> -    for ( order = 0; size; order++ )
> -        size >>= 1;
>  
> -    return order;
> +    return fls64(size);
>  }

Along the lines of what you do below, perhaps simply

    return fls_g(PFN_DOWN(size - 1));

(and nothing else in the function body)? And then even

    return flsl(PFN_DOWN(size - 1));

(eliminating the immediate need for fls_g())?

Jan

> -static inline unsigned int get_order_from_pages(unsigned long nr_pages)
> +static always_inline unsigned int get_order_from_pages(unsigned long nr_pages)
>  {
> -    unsigned int order;
> -
> -    nr_pages--;
> -    for ( order = 0; nr_pages; order++ )
> -        nr_pages >>= 1;
> -
> -    return order;
> +    return flsl(nr_pages - 1);
>  }
>  
>  #ifndef arch_free_heap_page


