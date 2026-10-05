Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771EFCA5FF0
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 14:53:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440926.1658461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDk4b-0004ys-2j; Mon, 05 Oct 2026 14:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440926.1658461; Mon, 05 Oct 2026 14:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDk4a-0004yl-Vc; Mon, 05 Oct 2026 14:53:48 +0000
Received: by outflank-mailman (input) for mailman id 1440926;
 Mon, 05 Oct 2026 14:53:47 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xDk4Z-0004y0-JO
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 14:53:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDk4Y-002r38-H5
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 16:53:46 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac3b9ee-2eae-0a2a0a5409dd-0a2a4508b0d2-30
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 16:53:46 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac3b9fa-f659-0a2a45080019-4a7de18cb17a-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 16:53:46 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49fff72474fso13188385e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 07:53:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a02854073csm318301535e9.3.2026.10.05.07.53.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2026 07:53:45 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791212026; x=1791816826; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/zg5WP4q4WzOI6ts6VftupUgXE26i4tuaBfvOcS8VNQ=;
        b=ZnelNsBb12QhWRSiUdSwbDUbsT4fAAn+HbhrMRYdlgdOpffbnPWOIZUNItPLjmM8Ra
         BMWexOxYZ4b6P/RqF5Nyax6+Tg6IpBcD0tuRUzkpY3m/rfKlhYno+JTLc+WHl8ci3H7x
         i0a5oPkNS5ZiJNtxvYs+gdWKvw7umBd370GniyGiovCXhjgyMfTeoyIvNqydWeAy8gFh
         BInSgfFKnucKJTUL0cOBVbRLqUpIaTk2q2HPfGnQzI7HBfCerqzX0TaZNYn62KvbE3IN
         kTOtTiJwmEgYxR3r7sP27cabsnCm6Ltynpo6S7snci5+csfiI73/oWPMW60AHyVwxk+v
         ax8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791212026; x=1791816826;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/zg5WP4q4WzOI6ts6VftupUgXE26i4tuaBfvOcS8VNQ=;
        b=E+BaJ2UkTBrHXXG3ZdwaIZUhR3S8pr4or4eYmbRaRXwtzL0IPJ88KACTtJZNZQNG/Q
         Cd0YM8Ynbg85iME8ttJZnjFcSd8z4EaPgLZ5XFxyl//4su9P+jBRsLHO5DjxBv3G891X
         jxF1DEUw3hvDK8NtSVS081yNbA7pYWksYkWkPr4q60b9pEZwrkGhSYwupvgL27xmncRi
         5vuxo/bBI78D+rreje+QpC++S3aOcqrIi0gQKjbfKJkiBhx/rs4EV55SNPdOVQyVt0ma
         mAjn/oJJqeY68rUjbfMv3Ovb4RRTOVyPUooxD/2NdYAWnXKa/Kd8JZ7DRiRprnwPbrw7
         cMGA==
X-Gm-Message-State: AFuF++kEBHOHqxIOoM+wlBhoP3UVVLpXrrzrVf6U+lhntojp8WUz4s8U
	s2OtG7kUvSeo2D847LLX1XV20JUjjvBKbinuAdfEPME2cA24AaTZO4pxI1OoDFb30w==
X-Gm-Gg: AYBFou29dtg8PoBHa3C1j/2nhpD+uYB9LPmRKsi23K6+p+6qTsY6RTUjaL8BZ9f4qb1
	zHmUo46Y7v3O0oO6hYif/jLZmvkvO2xTIFbsApDMlp+QbLHCf05OnJrKtyF1y59+MaqPH9KFLGZ
	qdzv9B5Qte2oQM2wg6riY8Tk6i/jfczuk6A5uxqisGmSzRM6f4+esSxDQVWXoYCMeopA6w4hUjz
	HQ3HTJphWnkaAfkodJqEiXINqngH59af73uq8nP2mHaQi06UhgEd7W9pQLNWdFYDEKv9aYEB9P3
	Z//dgP6lYj2++P83rxxoG5bAt7GuX7/z0g7iINrwK1qftJBXKTUwwbYZw8Y8pw+kakwS3YDxpFh
	+hu0eESwxWl//B3gw7VeFVvISJEeCj8MoSWc2X9BneMn5Utu8OBi7+ruYwWLNY0aGD45T0bR3v8
	dj56xc0xYwx/20JqJo0OBQq6yTEn+kZ5gppmfPlEtdAmdf0Bb0rrn0PfFOyxVIfcBFh7VPgxZWh
	1tnQ2dKc8R5bU4yCGB1QdtVtBilBj8A0F4yA5kW3B2X35KwQUBCbOwrbN5wD1EPmPi352i216w=
X-Received: by 2002:a05:600c:a011:b0:49f:ce78:356f with SMTP id 5b1f17b1804b1-4a0276b869fmr165154345e9.32.1791212025604;
        Mon, 05 Oct 2026 07:53:45 -0700 (PDT)
Message-ID: <dbdc3fe2-3cda-44cf-9a57-c9b2173d1ad9@suse.com>
Date: Mon, 5 Oct 2026 16:53:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] EFI: refine cfgfile buffer allocation
From: Jan Beulich <jbeulich@suse.com>
To: Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7e332eec-5c5c-4c1b-aeeb-c65e046b1318@suse.com>
Content-Language: en-US
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
In-Reply-To: <7e332eec-5c5c-4c1b-aeeb-c65e046b1318@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1791212026-D4F4F87B-505D3613/10/78276251493
X-purgate-type: spam
X-purgate-size: 2273

On 21.09.2026 11:09, Jan Beulich wrote:
> Use of AllocateMaxAddress requires that the variable pointed to by the
> last argument of ->AllocatePages() is initialized. For cfgfile buffers we
> don't need AllocateMaxAddress though, at which point initialization of
> "addr" also isn't necessary anymore.
> 
> Mirror the lack of address constraint also to the main / central buffer
> allocation in read_file().
> 
> Fixes: df75f77092c1 ("EFI: avoid OOB config file reads")
> Assisted-by: Sashiko + Opus 5.0
> Reported-by: George Dunlap <dunlapg@umich.edu>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

May I please ask for maintainer feedback regarding this patch? If this
small variant is acceptable, I'd like to get it in. If the larger form
Ross suggested is going to be a requirement, I'd like to know so I can
plan the re-work accordingly.

Thanks, Jan

> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -878,8 +878,13 @@ static bool __init read_file(EFI_FILE_HA
>      what = L"Allocation";
>      file->addr = min(1UL << (32 + PAGE_SHIFT),
>                       HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
> -    /* For config files allocate an extra byte to put a NUL there. */
> -    ret = efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
> +    /*
> +     * For config files allocate an extra byte to put a NUL there.  There's
> +     * also no constraint on addresses for them.
> +     */
> +    ret = efi_bs->AllocatePages(file != &cfg ? AllocateMaxAddress
> +                                             : AllocateAnyPages,
> +                                EfiLoaderData,
>                                  PFN_UP(size + (file == &cfg)), &file->addr);
>      if ( EFI_ERROR(ret) )
>          goto fail;
> @@ -931,7 +936,7 @@ static bool __init read_section(const EF
>      if ( file == &cfg && file->size && !iscntrl(file->str[file->size - 1]) )
>      {
>          EFI_PHYSICAL_ADDRESS addr;
> -        EFI_STATUS ret = efi_bs->AllocatePages(AllocateMaxAddress,
> +        EFI_STATUS ret = efi_bs->AllocatePages(AllocateAnyPages,
>                                                 EfiLoaderData,
>                                                 PFN_UP(file->size + 1), &addr);
>  


