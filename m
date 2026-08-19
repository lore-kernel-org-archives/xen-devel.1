Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74FEC5DF81
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 15:08:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1395541.1633866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwhu8-0006kS-DL; Wed, 19 Aug 2026 15:08:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1395541.1633866; Wed, 19 Aug 2026 15:08:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwhu8-0006kL-AQ; Wed, 19 Aug 2026 15:08:36 +0000
Received: by outflank-mailman (input) for mailman id 1395541;
 Wed, 19 Aug 2026 15:08:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwhu7-0006j9-6a
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 15:08:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwhu4-00GxnJ-1q
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 17:08:32 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a85c6e8-2eae-0a2a0a5409dd-0a2a45039b50-14
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 17:08:31 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a85c6ef-fae8-0a2a45030019-d155dd29b4c6-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 17:08:31 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-4815b8781c7so556227f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 08:08:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499a9e00bddsm54561765e9.3.2026.08.19.08.08.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 08:08:29 -0700 (PDT)
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
        d=suse.com; s=google; t=1787152111; x=1787756911; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CB6iquoH6KbE/idsuqAY9deu2VeImI5opQQKnqZffLw=;
        b=MAd8or4iIEPpE/HJ1QweV4149qUm5LGoMNdqsQXfjrsn8jyV80EoiUE8b30BGXMD3z
         3wVvxW2Jt/dq0QzaQd382tiS4p7iaJv7Pdfp97THlKiaWtK4nuOHo+5MIylfNaxzZyJK
         K3U59NcSadXX7fyK+I508KRO004ferv9vUhRUeFUllztfcEJwzng+3+ouZH0v+7grAtv
         +uCdaGJuk2xkTdnu/zOK0dvIX4Zt3ZZHrBw21xgA8E0GG8PzPNSNE8BFLLgX204qP/nA
         66xQRSosAEbT3H+Mq+yMiZnXYqGh3HoP3H9tlgmjdlmtXETP3fD0OA3FYywJk5w4Mxb4
         q/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787152111; x=1787756911;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CB6iquoH6KbE/idsuqAY9deu2VeImI5opQQKnqZffLw=;
        b=ku8ZOtl4YhWwxkbIu25E38Wc1AA+dtqLcm8YG+i0yIF0ylsLpIVESOEaLLB9lohIMe
         M0jetSNlHFNbBqmBtxheGOfTaq2JsoJRFsB7PDRCffpsXzqQNeKANbP36PsxosZNeLFE
         nQ+y2N8qSGYIy53ViFR4kGN7MskouMCbT0SgE8slFBfEGxUzL8qceWQDxF1OOjekPdDb
         vXffq67gqD7bZiVWlJ4gkfuM5/iLw4wAF/KneY6YctnV0QC4U2TjB5JnCCpO+UZgiE0H
         9GQ+RqcVdC+JYQThkDgqaIFntKjspyl5qC7aw+0l9RDPyAtnhoEPDPlySlue5YQGAaya
         GXCg==
X-Forwarded-Encrypted: i=1; AHgh+RosVg14BqxVRVmC2K6cO3soMvHucYcP6hYnJUixCLJEmmcEO3ojODQ9zQ1YzbLlgkkK9y0IN+4o2lU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZ/wRv5oBuJbjFfPjRGZzKJNO/Akve7aOcbXS6X27IfQY8odnK
	M0Q2OAKP11AWgNc1m0ngbBW6z+QGbnAr+FcgPMDRhFn/RvUfxRle9VjPG4DZGnQtrQ==
X-Gm-Gg: AR+sD13rUd+EAjZ9zUWtFZ8oaGnqZQFlmLf/IUowlBQ1bpjBGBIabuWjBZvZzJtuXD3
	OI/ubwHOu01B3UemIogcMLAFREqq6BUnZwWTx5YzxprEuaQIp8t+IeWLw43SZWLC6lCGVYKIzLM
	sL80kqcgID9tdXnmHEXAisQXcFlsfxoAMzxDpYZnLDWR0xufzm4SFQ3p2hGLEeSkXem9opm+CR6
	1ZewH7AcyNQMdVNchcKTkNr73apMFpmgIQgJI0BNMVvVxhLy6S82kG+CQdoslw5TwWZD9XLA2Rm
	q9lRlFArKoZtzun8ZUZhKUS/a++ASyvZDpQl8NMXxH0yypY6vrLQ1OY8yGrAirbnsKVVsZNg+DD
	ML2ZkVeByiyh01r3ddRv4U8u3lYZtwURn97XJsZVoEOOvuHepKV17uUimvYJk1Idv/j3w17z6U9
	BcnLsMswYV9SwvLo+1xNInkhe1mgkuz9WPL36/vh1EjYfa+Y9qie3nj1h7//WWVtJ810vg6LTab
	trg7955hwFoBKEmjGLgI6/5JxYUFi4MMfrRyzM6cFQA9dGrGaGY
X-Received: by 2002:a05:600c:4f52:b0:499:7a15:fcec with SMTP id 5b1f17b1804b1-499aa1fdfb3mr87422285e9.13.1787152111443;
        Wed, 19 Aug 2026 08:08:31 -0700 (PDT)
Message-ID: <4fed56c0-b8b1-408b-bc60-7a1afe05ffa2@suse.com>
Date: Wed, 19 Aug 2026 17:08:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v7 03/14] x86/domain: Defer domain iommu
 initialization.
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <cover.1763569135.git.teddy.astie@vates.tech>
 <c4a81e284ec202a34b8e983679dead4dc2ae248a.1763569135.git.teddy.astie@vates.tech>
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
In-Reply-To: <c4a81e284ec202a34b8e983679dead4dc2ae248a.1763569135.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1787152111-77AF14E9-7E09EDBE/0/0
X-purgate-type: clean
X-purgate-size: 1139

On 20.11.2025 12:09, Teddy Astie wrote:
> For the IOMMU redesign, the iommu context pagetable is defined once during
> initialization. When reusing P2M pagetable, we want to ensure that this
> pagetable is properly initialized.
> 
> Signed-off-by Teddy Astie <teddy.astie@vates.tech>

From what is said, I for one cannot deduce why the move is (a) necessary and
(b) correct / safe to do.

Jan

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -927,9 +927,6 @@ int arch_domain_create(struct domain *d,
>      if ( (rc = init_domain_irq_mapping(d)) != 0 )
>          goto fail;
>  
> -    if ( (rc = iommu_domain_init(d, config->iommu_opts)) != 0 )
> -        goto fail;
> -
>      psr_domain_init(d);
>  
>      if ( is_hvm_domain(d) )
> @@ -948,6 +945,9 @@ int arch_domain_create(struct domain *d,
>      else
>          ASSERT_UNREACHABLE(); /* Not HVM and not PV? */
>  
> +    if ( (rc = iommu_domain_init(d, config->iommu_opts)) != 0 )
> +        goto fail;
> +
>      if ( (rc = tsc_set_info(d, XEN_CPUID_TSC_MODE_DEFAULT, 0, 0, 0)) != 0 )
>      {
>          ASSERT_UNREACHABLE();


