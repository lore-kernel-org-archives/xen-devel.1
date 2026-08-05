Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96071C55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 09:41:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383200.1626459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrY7k-00045p-Ir; Wed, 05 Aug 2026 09:41:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383200.1626459; Wed, 05 Aug 2026 09:41:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrY7k-00045i-FH; Wed, 05 Aug 2026 09:41:20 +0000
Received: by outflank-mailman (input) for mailman id 1383200;
 Wed, 05 Aug 2026 09:41:19 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrY7j-00045c-FK
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 09:41:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrY7i-00EPDH-Rn
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 11:41:18 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a73053a-5cb7-0a2a0a5109dd-0a2a4508c91c-6
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 11:41:18 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a73053e-f659-0a2a45080019-d1558031e553-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 11:41:18 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4957eefd361so5497635e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 02:41:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49949fcb46esm187293975e9.5.2026.08.05.02.41.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 02:41:17 -0700 (PDT)
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
        d=suse.com; s=google; t=1785922878; x=1786527678; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MiIQ7czv9lPQAjuP9ijWUuHHGqlX/VIo/pd5dCsI4+4=;
        b=dfFHuO/qG248KrBOEo4zwyFFRTaJgXvtz6Hohm2mJd2N1qTmFGTbJOx7fwmal8Re/6
         O6pr4b0PJr0pvxjnwBl8BVHe4yNuSMMg0CiMt/4Jj+nGw4aAtHbGC77cjzKdlQuLrvPY
         zFVeoVTmYC6Ne83HjHbD/tf8fkSFm0whLtE/nZS8jX+ayfV6/zlRWryJFBWvgF2VEiYL
         rKz/+IV1QWwURM46Tgsj3m+n4RZBd201n5DixMDOS5R6QedDwX2SqOo/mdlmZ50mGu/0
         nTYfLcyD/eu6xdP0wGahKj9Wr//H9i5b57R5prN3FPSfylQSDpeds6H+4w9BxlIPVJTT
         SVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785922878; x=1786527678;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MiIQ7czv9lPQAjuP9ijWUuHHGqlX/VIo/pd5dCsI4+4=;
        b=dNH2wZGUBRZId8p2l5uOHWMqvZInzWqv07X77v8YlPgPKv27ViTeDFnUgw07r+k9Sx
         7vPZxhvvWFmYbKpo2ov39dbekantc/ie2GSgjoOj4UEY//4gE7cuac6ynTtMADkkWKhF
         /fkKA7jwEqoSIb0Ukw9M5o+gEOsizp3UlT4hajrgKZnlHbcO3fWOBHwt+xL8qOuUL1RE
         7UNMyvkWJYZD5LWSFY0ErJCjgjf3bogxuPlNe/3VY4GZUWXcE1X/Y/K+4OuSIUFQzT/Q
         FTeUnl2RVwf9sUiBUdf1+UVJeXcfLP6QTnwwsUlHEj6w0v73t5/AhVJcCjswuRpmhoOQ
         oKmg==
X-Forwarded-Encrypted: i=1; AHgh+RrE9bkw3Q0bU6n+TNGtd2+xLVtKq6Ne3Ytcde++nV/Yx2yEEUO2x37Q7S24EheNQkW04BMjqBCIxQA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz03Q1M+vljj3tNzRW7vsAW70O9TQr5cECgDVvPhabZKS2wqv4m
	Bj2jm/tfD+aO8KiQt5SZjMjR2xZu/L71BWMqgww1BeqLqkicaEmgRYjRLNzOvRWWZg==
X-Gm-Gg: AR+sD12VBbv3JhRZ5JM3SwBmFinT0ErFClDvK2XIh8UuiOkEB0FcqSm6mjiELQ8giMd
	KTxlfhV7YAjE7ROiwhXWTXEKx48oWPeTO0qOkDO99xqghaJ2jghiUOJdyKcqcPHhRNrXL2tDZ8v
	+ZBbkx040zmcZnCGx+f0GJ9MY3cyZ26XkmbMRKxP6C7YoutVTgoiNd+iqr7OBux1zFoYno+3oFi
	pOIZvTfBZAMOYzCrDcnhFQ0pWlaPCSF/3hdm9L+tf7k2EMB6sXEjQyJZW0gKaUMAcjLJ9feo8yf
	1cCgZ5jU4cW0/i1zaTeEzydQbh5nadRcRgfD6knp3ZFQTKkEKhXSb0sUxW1zF8aCqM6hrzLUw+O
	U0C4/wCf6JcDxyAZnj99GotP3S4MxPHVrufvi870yQuhS/FrUNvLVOGknkKNiZBg9Nixwy0ztQu
	iu9a0ZuIPT/EkdI8Bjeoeg0q0XeA3hh+ckTKKaX/4305DXvAb2UNPITdt6E+/Zy4/WfMu6wgI8U
	VQjmpJ9Q0MqNHN2K5iiR+G7pqoK5PD7VG4DEeXLXPlDqEbHGgyR
X-Received: by 2002:a05:600c:3b29:b0:495:4811:7998 with SMTP id 5b1f17b1804b1-4994e7d389emr49613065e9.17.1785922878278;
        Wed, 05 Aug 2026 02:41:18 -0700 (PDT)
Message-ID: <dfcd2023-7581-4621-9a29-9beaf472c376@suse.com>
Date: Wed, 5 Aug 2026 11:41:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] vtd: Don't disable hwdom passthrough on unhandled
 SAGAW bits
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <1785319236.8631fc262581453bbf619ec5b2062170.19fad51a4be000e099@vates.tech>
 <1785319342.8631fc262581453bbf619ec5b2062170.19fad53421a000e099@vates.tech>
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
In-Reply-To: <1785319342.8631fc262581453bbf619ec5b2062170.19fad53421a000e099@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1785922878-D594A87B-4457EC51/0/0
X-purgate-type: clean
X-purgate-size: 1550

On 29.07.2026 11:59, Teddy Astie wrote:
> On recent VT-d spec, bit 3 indicates support for 5-level pagetables,
> this is currently considered unhandled and causes "hwdom passthrough"
> to be disabled, even though it's unrelated.
> 
> Given these are is capability bits, we don't need to consider unhandled
> bits, but only make sure that the ones we want (e.g 39-bit or 48-bit AGAW)
> are set.
> 
> Fixes: 474fc7d3c652 ("iommu/vt-d: fix SAGAW capability parsing")

The description of that commit explains pretty well why pass-through mode
does need disabling in that case. If there's anything wrong with that
explanation, this would need calling out here.

Additionally I can only repeat my proposal to finally default to strict
mode. In strict mode, pass-through mode is disabled anyway. (IOW there's
the additional question of why you need pass-through mode in the first
place.)

> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -1327,14 +1327,7 @@ int __init iommu_alloc(struct acpi_drhd_unit *drhd)
>      }
>  
>      if ( sagaw >> 3 )
> -    {
> -        printk_once(XENLOG_WARNING VTDPREFIX
> -                    " Unhandled bits in SAGAW %#x%s\n",
> -                    sagaw,
> -                    iommu_hwdom_passthrough ? ", disabling passthrough" : "");
> -
> -        iommu_hwdom_passthrough = false;
> -    }
> +        printk_once(XENLOG_WARNING VTDPREFIX " Unhandled bits in SAGAW %#x\n", sagaw);

Also please adhere to the line length limit.

Jan

