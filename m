Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31206C55182
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 12:40:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381453.1625032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqrxd-0005Wo-0D; Mon, 03 Aug 2026 12:40:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381453.1625032; Mon, 03 Aug 2026 12:40:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqrxc-0005Vy-S5; Mon, 03 Aug 2026 12:40:04 +0000
Received: by outflank-mailman (input) for mailman id 1381453;
 Mon, 03 Aug 2026 12:40:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wqrxb-00056b-B4
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 12:40:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqrxa-005Jvb-Fl
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 14:40:02 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a708c1d-bab6-0a2a0a5309dd-0a2a4506e340-20
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 14:40:02 +0200
Received: from [209.85.218.50] (helo=mail-ej1-f50.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a708c22-195a-0a2a45060019-d155da32a49f-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 14:40:02 +0200
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-c15e03c2763so621708866b.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 05:40:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c1fd4662727sm496448466b.59.2026.08.03.05.40.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Aug 2026 05:40:01 -0700 (PDT)
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
        d=suse.com; s=google; t=1785760802; x=1786365602; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Rv9ekgCqFE0xkNpyFLzSLNtbTIiyypWYXYLZoy/njo=;
        b=HgLZAaryCEs0vSZSyglCCysp5cBn168Ke+IThMbuhFHaqCwCgn4BPGsGjsukMRq8Cm
         T0HD1a6TZJexssHtahpC/MyFShAJD9OJJWE58vW3QgPJ/uXTtVzsYLfe1v1bvz+Y62yQ
         guUEG10MYkCi3Zp3uGIRZAT1ik+WgyRJg7Pg/y0k/Xbv6oWZjIktOW/paAEKT0PXs1Op
         CI17u0CAVye8rf4MywTfsTRJ4AqWrZd82BBT7/JUxhYTPuLBG9S8h55hoedyw7BUDrRR
         +kmVKS7agMmopXuDg7KOCt9mzKBZr3UoRVR/Y9EtItPWSBTxjLnWO1dOZfcBs2T0PXYk
         akrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785760802; x=1786365602;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Rv9ekgCqFE0xkNpyFLzSLNtbTIiyypWYXYLZoy/njo=;
        b=dK/BK3m+JZrtOhS1IAElgT7JsaTiIuYJFzuwBoWgJyn6Y+jE8sF130LxWGsN+GKKke
         ce1wrZGbg5HfsbS08YS+UflW/HWNy7SfZD6QasL97n7egz4a+GDFrHq8lfWYsRntyt35
         N9NwsFaYAvu5Y4akPswGw5/YoFWvzAcScoGtTy39Wx5VnCrrdlGfPzTs771StAmr6mWV
         zOb37H34AvLccym5jdLMWCi9PYeaSc9fIR2z4/4+q46bgHBUnry3bDWv/bRwHsHL5/o2
         u01+y16hLHh9kvJ51UC1R/5HjS/lD41APe2i+WcB9Jen80vpiF/jXEUijXlao4Hb7ulN
         sCmg==
X-Forwarded-Encrypted: i=1; AHgh+RpiUqqHy7pXL6MEq4XVp+qgzjShbbU3tmCpmFqjopk+SPOMIMs/862HjZJ+WFtlx/t3DeyvE6u3gvM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxvGQA+egGcyiyg7bjYVOsj+XqtYHjCNzPWFGzuVQWwonoP0OB7
	m3fUWYGK0ChNSU+PcvD5cGDjfpmmVilDebZ7lWXHIJDkrqKUMC+DZ0X08p6WtSo4YQ==
X-Gm-Gg: AR+sD13grdeFxoSsMN765r7+DQtGx3RiROd+afMgpUe6lBtBxn4XZupF43BJeYW2U+F
	ztjEOiMZtzUhE4wda5TvpPEsAVYk/GMkhxzwMm9nA25yK/eXsmeteYlY8k6A/a12TwUVTjIXdBy
	TOOgOSLP0I3xnPyElNYlvXs9dSeS23ePO7xMxZMkR1ttDxib7VF5BC0DUPXuuSGcTUPXAYRO5bZ
	pmC+XWi2lr3bv/WdKFrWy18UKe2pqySFA2tYAc9mTk2niO6KFfJSONmTWuP3VxtiFjBFrXJ+b+0
	bOb0R8WGxGedhWtJ7vS1TRv9rzpOkoCtfdQejY2KTU+EoKJ5AS5M+BDrPjFd9GT8MVi0xthZUz6
	gDbcM/orftdTSlPRMoBu6IpL4/a0kaDwWy52DwyJq1JLFayfz64cONWIfdSJk1aQ3SS2MMj2Nyx
	beHmDTcYNHSzdxoB7N6IsKCBELpRIKQ4JGL43nutWDtu108dKdluLGw/Gv0ZiJ9WHwofBTvK4OS
	OS8RtIan9vLGSG8Np0oVs2I1I4OnOqr0Fy2pJBiIDXNMgk5PBvianUeEeHyeP6N
X-Received: by 2002:a17:906:9c96:b0:c19:7908:c67e with SMTP id a640c23a62f3a-c1fd316d26bmr966117266b.4.1785760801966;
        Mon, 03 Aug 2026 05:40:01 -0700 (PDT)
Message-ID: <166491d8-70f2-4250-9212-e86b002d877a@suse.com>
Date: Mon, 3 Aug 2026 14:40:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/2] xen/mm: Return claim information from
 avail_node_heap_pages()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bernhard Kaindl <bernhard.kaindl@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260803121739.370951-1-andrew.cooper3@citrix.com>
 <20260803121739.370951-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260803121739.370951-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1785760802-F5C0F77B-AA87A6BB/0/0
X-purgate-type: clean
X-purgate-size: 1024

On 03.08.2026 14:17, Andrew Cooper wrote:
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2852,12 +2852,14 @@ unsigned long avail_domheap_pages_region(
>      return avail_heap_pages(zone_lo, zone_hi, node);
>  }
>  
> -unsigned long avail_node_heap_pages(unsigned int nodeid)
> +claim_info_t avail_node_heap_pages(unsigned int nodeid)
>  {
> +    claim_info_t info = {};
> +
>      if ( nodeid < MAX_NUMNODES && node_online(nodeid) )
> -        return node_avail_pages[nodeid];
> +        info.avail = node_avail_pages[nodeid];
>  
> -    return 0;
> +    return info;
>  }

Why would this be? What use is a compound return value consisting of two
pieces, only one of which is ever going to be non-zero? In the form
shown for per-node claims that effect goes away, yet at that point the
function name doesn't really reflect its purpose anymore.

As to the naming of claim_info_t - that's perhaps good enough if really
we want to go with the return-by-value approach.

Jan

