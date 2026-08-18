Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACBFC5DF7E
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 13:06:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394149.1632982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwJWX-0001vJ-Qx; Tue, 18 Aug 2026 13:06:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394149.1632982; Tue, 18 Aug 2026 13:06:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwJWX-0001vC-Ni; Tue, 18 Aug 2026 13:06:37 +0000
Received: by outflank-mailman (input) for mailman id 1394149;
 Tue, 18 Aug 2026 13:06:36 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwJWW-0001v6-Ij
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 13:06:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwJWV-00976M-Er
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 15:06:35 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8458d4-2eae-0a2a0a5409dd-0a2a4506e102-28
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 15:06:35 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8458db-195a-0a2a45060019-d155dd35b82b-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 15:06:35 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-47362928f65so4426704f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 06:06:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5b77fa3sm11467116f8f.26.2026.08.18.06.06.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 06:06:34 -0700 (PDT)
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
        d=suse.com; s=google; t=1787058395; x=1787663195; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oDjT4BBN1EzoUHulOiaogMyGrmiXXGVI4o1SGJB33yQ=;
        b=U/Bni5iYLhhViOyJ/WZ6xF+4MSof1Qp9um3Z3oSVpSVvQep5JrWPkkJL4VT3eCnuRJ
         yIDTdwYMhrMHD2BPFtAknv9HRzdw0BTKDMDzE5ld+PhnFPvjkntK3lV4XAoK70BtxVqb
         6b9llU4DnjdKYSXY/6mmAbFcDpYDGkBXWJF/1nj0LGG6UwQ+F5f9GjUsCzICHQzmaZPo
         7d38ufR3LHIprIZNFRUQczNTwfCwo+x9PSv+xcDZLGeZfWEWS8WxKAJucmsFJDr9xVPk
         I7U/BWttt89ZNiAuXPobrgcyJge4cpzDZl9/6iSAFHHVIFqRCMAnlIX1hF4kYcdB6kIW
         g6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787058395; x=1787663195;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oDjT4BBN1EzoUHulOiaogMyGrmiXXGVI4o1SGJB33yQ=;
        b=tDNcjo0ljl7xPpgSB6WEAvde6q8cUZtYBcesD1UgKsm9jFDtMpv8ymTWeM52qxrkLA
         ncf8inj+1defqzqUDHqJbZzdRAnoTeRPYmGD8NO7U7y8vGciEBdYzwZSiy+38J2EoNQ2
         4NvRxfdKUo/eBkUG49EXt/pYgvWxV+n6+VYvGq2wov/1+CuMn8EHoK0HmmoKx91NWRrt
         cvzPMflAvyl4SBPpTrwihCNnqgj3Bn4rk5Q0r04wwr8lvcUZW5bBaxlnKPoq2tfrP2dw
         LIoCK0mzNU88DLb2IZCvtZskwiDjvfeQ1qgcyJvhHg83p70SvOSWq7lhGsp5SzA/LXAg
         mikw==
X-Forwarded-Encrypted: i=1; AHgh+Roz0S/g9iexft5pbS4y+pe+qzENKY+HH4fQ5yeNYEy3iwdP+uqXI2e0Wa+Oh7+t9UK0FTAT8Za2z7A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZFCe46+tc72u4dcATBwbfjy8uC6L+v2aNfn//JEUYMweOFjUq
	7jJhqYpPwNFEetpgiFkdFrbtR2bO7WuX5BgkMxLQX8AIKhHOmesyMBro8hKMTBC0hg==
X-Gm-Gg: AR+sD104yCfufzYPz3pj+esoUzSzCCntpkDIRkc6nkLF7WzwdmIkK3laaNboBfm5MwF
	ZbI8iWMLgiR5SgyDRnAxJRXTFQFCSZpeQzjbXLAxr5uuXsee5xMbQNbdiaVDIWIkR1tze7Vlh5d
	vMYBuEU6u32k7fADiXvU7Pqv8GWntfaVdQV9cZgJ+xjGj0+8T7TaBgfjFM0cPFJp+ixLjHT/qUr
	4qxJCvR1Yc+0ouinLAn+kyE1pc0DBcP3gQ2dgGUjJ9ofFDrLIgrTLotjaoR1gv9eyHkDzUhA0TU
	upmFitv90usmjICtF09eZQkOST3el5UGvpnbQa4IzYxPHyFCT779uE6aUl+XAzIpNVu7sb9NmDq
	WY9BU8rDE8hXMGaAUejxVz35rHMOE+eaxgCnqwh0CXMANk6Bn7rH8mtVDd4eAHSRswpLyidWxrS
	KdNBAflESJXZgw56yys58ejvwtJxSe0qJMPS8McMIEnxUbZ9G6XZ/c9+Xyh7BxMosl4Vw8kV4cx
	/TkyN5q+sPAyMEn7792ifBCWNnd+IxOGMx8Ts0RDtxc7qMRKP99
X-Received: by 2002:a05:6000:288f:b0:481:5edd:1b6c with SMTP id ffacd0b85a97d-482a9071f76mr13882448f8f.7.1787058394667;
        Tue, 18 Aug 2026 06:06:34 -0700 (PDT)
Message-ID: <35a08d22-1e95-4e02-a7e9-7f392ef11722@suse.com>
Date: Tue, 18 Aug 2026 15:06:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] ioreq: switch ioreq page allocation to vmap
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260420093820.825969-1-julian.vetter@vates.tech>
 <20260420093820.825969-2-julian.vetter@vates.tech>
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
In-Reply-To: <20260420093820.825969-2-julian.vetter@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1787058395-FD00977B-BF8C582F/0/0
X-purgate-type: clean
X-purgate-size: 4645

On 20.04.2026 11:38, Julian Vetter wrote:
> Switch the Xen-side ioreq page mapping from prepare_ring_for_helper() /
> map_domain_page_global() to explicit vmap(), to ensure vmap_to_page()
> can recover the struct page_info * uniformly during teardown.

What's after the comma isn't really the main reason for this patch, is it?
Describing this aspect ...

> This is a prerequisite for multi-page ioreq support: the non-buf ioreq
> region will need to span multiple pages for domains with more vCPUs than
> fit in a single page, and vmap() is the natural interface for contiguous
> multi-page Xen VA mappings.
> 
> In non-debug builds map_domain_page_global() uses the directmap for low
> MFNs rather than vmap(), so this change has a small overhead in the
> common case. Debug builds already used vmap() indirectly.
> 
> With both paths using vmap(), vmap_to_page() can recover the struct
> page_info * uniformly, so drop the 'page' field from struct ioreq_page
> and update all callers accordingly.

... here (at the bottom) is fully sufficient.

> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> ---
> Changes in v6:
> - Updated commit message to clearly specify why these changes are made
> - Added comment to say that this is {prepare,destroy}_ring_for_helper()
>   just using vmap_to_page() + v{map,unmap}()
> - Kept proper ordering in ioreq_server_free_mfn(), first clearing the va
>   pointer before unmapping

Yet then you didn't extend the same consideration ...

> @@ -128,8 +129,13 @@ static void hvm_unmap_ioreq_gfn(struct ioreq_server *s, bool buf)
>      if ( gfn_eq(iorp->gfn, INVALID_GFN) )
>          return;
>  
> -    destroy_ring_for_helper(&iorp->va, iorp->page);
> -    iorp->page = NULL;
> +    /* Equivalent to destroy_ring_for_helper(), using vmap_to_page(). */
> +    if ( iorp->va )
> +    {
> +        put_page_and_type(vmap_to_page(iorp->va));
> +        vunmap(iorp->va);
> +        iorp->va = NULL;
> +    }

... to here. (Really we should perhaps introduce VUNMAP(), much like we
have XFREE(), XVFREE(), etc.)

Further the ordering doesn't match destroy_ring_for_helper(), which unmaps
first and only then drops the page refs.

> @@ -162,12 +171,40 @@ static int hvm_map_ioreq_gfn(struct ioreq_server *s, bool buf)
>      if ( gfn_eq(iorp->gfn, INVALID_GFN) )
>          return -ENOMEM;
>  
> -    rc = prepare_ring_for_helper(d, gfn_x(iorp->gfn), &iorp->page,
> -                                 &iorp->va);
> -
> +    /*
> +     * Equivalent to prepare_ring_for_helper() using vmap(). Using vmap()
> +     * rather than map_domain_page_global() ensures vmap_to_page() can
> +     * recover the struct page_info * uniformly at teardown, which is
> +     * needed to support multi-page ioreq mappings (see nr_ioreq_pages()).
> +     */

"is needed" is too strong, I think - surely there would be a way to handle
that without vmap_to_page(), by tracking all struct page_info * separately.

> @@ -309,15 +310,16 @@ static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
>  static void ioreq_server_free_mfn(struct ioreq_server *s, bool buf)
>  {
>      struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
> -    struct page_info *page = iorp->page;
> +    struct page_info *page;
> +    void *va;
>  
> -    if ( !page )
> +    if ( !iorp->va )
>          return;
>  
> -    iorp->page = NULL;
> -
> -    unmap_domain_page_global(iorp->va);
> +    va = iorp->va;

Please can this be the initializer of the variable, for the if() above to
then use that local var?

> @@ -333,7 +335,8 @@ bool is_ioreq_server_page(struct domain *d, const struct page_info *page)
>  
>      FOR_EACH_IOREQ_SERVER(d, id, s)
>      {
> -        if ( (s->ioreq.page == page) || (s->bufioreq.page == page) )
> +        if ( (s->ioreq.va && vmap_to_page(s->ioreq.va) == page) ||
> +             (s->bufioreq.va && vmap_to_page(s->bufioreq.va) == page) )
>          {
>              found = true;
>              break;

You mention in the description that some extra overhead is introduced. The
(generally) two page walks done here are particularly concerning. Since we
have a valid struct page_info * available here, I wonder if we shouldn't
aid this lookup by recording the VA in one of struct page_info's fields.
Afaics vmap() doesn't use any of the fields, so it should be relatively
easy to determine a field to use for this purpose. The more involved part
would then be to make sure the field (in other struct page_info instances)
is also properly different from any VA vmap() may return.

Jan

