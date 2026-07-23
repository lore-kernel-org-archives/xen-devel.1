Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5226C531CA
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jul 2026 13:08:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1369122.1618021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmt9h-0005vt-Nj; Thu, 23 Jul 2026 13:08:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1369122.1618021; Thu, 23 Jul 2026 13:08:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmt9h-0005vl-KM; Thu, 23 Jul 2026 13:08:05 +0000
Received: by outflank-mailman (input) for mailman id 1369122;
 Thu, 23 Jul 2026 13:08:04 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wmt9g-0005vf-Ir
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 13:08:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmt9f-007a6B-Oq
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 15:08:03 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a621226-5cb7-0a2a0a5109dd-0a2a4504e060-30
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 15:08:03 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a621233-b57f-0a2a45040019-d155802fe4fd-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 15:08:03 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4953de5be0aso4528995e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 06:08:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956d475e24sm112064885e9.0.2026.07.23.06.08.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2026 06:08:02 -0700 (PDT)
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
        d=suse.com; s=google; t=1784812083; x=1785416883; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KTvd0XfdsApJ0kLzdbwtfFmDzasozlUZn0+6DVqx15Y=;
        b=cOWnZ+Ikupvo0dRf5v5B4So6SV7R5Ar8rL13Sm+rVN7t68zuV2K2Ew23rjkUHxbAZ1
         OqOQnEi4xjatYm775Fcl9iXRyx8QINWGqbGYRz/L6t6/OxAOV/49fSGiHaAZzSwRK2Ld
         ybTG/lSqCK1pLmFYj+6HLY92jn62dWSCuO8rYIV2TZZM2sBOm2vNLgFPP8PMlZ/rb9nN
         Pklt0dYa9MxuQ7vV1RxFktyEjFrk69PpjEyIQdH3yd8FTZXdcG723W/TBBXtL3yD4a0A
         eCKNrXwIcRYWo4vHwXF9f2/u6k5hqEDKaOoyoiKXndgQynFwN54n1fNUlU/oJNyjCafW
         /xAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784812083; x=1785416883;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KTvd0XfdsApJ0kLzdbwtfFmDzasozlUZn0+6DVqx15Y=;
        b=R4aYB23VM/XTXN/BFw4oznabEUYaDaE7nGQauoyPQC33eamfN1Pllye4pDH5uV9bIb
         rb6XQaLUhDqSzUjY0uQviecxGN2rPL3wz+bgomrQ+HR2OLKZ+VdD2lOtYuTEayJ+Qz1h
         j7oN6pfUXWIsV5WBb6eVemel/eO7/A+wKK2XFwZHOrCm40qSeM9rSJ/zlH2TiP47BeFW
         iUeaqXIHaWpgXTr4xKbgkCmlpDqWN5vj1naE/tMxSGgqIBp1epAIv7UYBS0LkwhW5gKZ
         HIUkN3z7HY9VMtf4ULV8gxfoHYUZIRVOV7lSBP1fmt1TwrDIxRIOTjXLiVQSCVu+qXE3
         ZdYQ==
X-Forwarded-Encrypted: i=1; AHgh+RpnCSIPTthG8IGfy79jTvORba6Yycx9Rod0jjWdW+skj8jvIWtAeQC6bvU+CCSKJ0isRJufpGd9JNc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxaRqO0mNbtUZXP1V5Otj3FY/PxAF+ZJ5wg1HgajSXHhLQY3QSM
	hRnwp2LlYky0NCK1GCKZ+rg88IqRWcmnvFM6eWin8cDP+KFIaIp8zCxpscQFv8UyQw==
X-Gm-Gg: AR+sD13+Efl1PIY2Ya7BMwyJoHW8tOU3XzCcpTRpgx6L9DeCh6bKvJLh0MG55Y6XCEr
	kdm0Ro5aVY47iuLzxH7Hk5rs+EqHUPo2GrRBXNF3wAt/O9xKUrIjcixk6HbCTRZmKniJls3R3UK
	HlCjGqr9nZyJdM6BgtG8tIDfwudiwuvaEXQLVRTBEy4Lipy6Iyq8Ngwn4qvQOKcXkzQeRh8TNz2
	nBp2dq79iwXU5RAZ+/mldA6FPZAZE4/Ucbq9JB7deAqbkyaVnkO9cTQFI4zpmgr7+hFoWw45yVy
	VGelnCwX7jaBiJdfVaVI0LDhIdiEYHQMLftW24fuAtqHbGyJJM2AdtMATEkh6EM959wwEexfNE2
	XymBX5sWNG15eH6I4Ji823XfgYZtV3AyHG0UAEEKnbJAsyGgt4eO2FHniI9Jc1ohZQRyAU5Wy6K
	k10p4lGbzVjffik/Zm33WUP5Fs9vy/EipyFQ+zxWQPDDT6BusUkD+lgEQowOue6QmsJA==
X-Received: by 2002:a05:600c:6a07:b0:493:a613:56b2 with SMTP id 5b1f17b1804b1-49573c8d700mr23330985e9.8.1784812082858;
        Thu, 23 Jul 2026 06:08:02 -0700 (PDT)
Message-ID: <c37949ce-5858-4b62-b6c8-5cc17d40c9b4@suse.com>
Date: Thu, 23 Jul 2026 15:08:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 17/23] xen/riscv: create APLIC DT node for guest
 domains
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
 <06c022159e9cf70bacd0c061b7460b99a3dc88ea.1784559209.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <06c022159e9cf70bacd0c061b7460b99a3dc88ea.1784559209.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1784812083-51CD7B50-ACEA01AA/0/0
X-purgate-type: clean
X-purgate-size: 1991

On 20.07.2026 17:59, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/aplic-priv.h
> +++ b/xen/arch/riscv/aplic-priv.h
> @@ -34,4 +34,18 @@ struct aplic_priv {
>      const struct imsic_config *imsic_cfg;
>  };
>  
> +/*
> + * Value is inspired by what QEMU is using for riscv,num-sources property for
> + * APLIC node.
> + */
> +#define GUEST_APLIC_MAX_SOURCES 96U
> +
> +/*
> + * Specifies the number of wired interrupt sources supported by guest APLIC
> + * domain.
> + * Could be limited by host interrupt controller and is identical for every
> + * domain.
> + */
> +extern unsigned int guest_aplic_num_sources;

It being only IMSIC which is supported right now together with APLIC, what
exactly does the word "wired" mean to express in the comment? MSI, as their
name says, aren't "wired interrupts" but messages on the system bus.

You may also want to add "for now" to the latter sentence.

> @@ -29,6 +37,74 @@ static void cf_check vaplic_deinit(struct vcpu *v)
>      return vcpu_imsic_deinit(v);
>  }
>  
> +static int __init cf_check vaplic_make_domu_dt_node(struct kernel_info *kinfo)
> +{
> +    struct domain *d = kinfo->bd.d;
> +    int res;
> +    void *fdt = kinfo->fdt;
> +    unsigned int msi_parent_phandle;
> +    char vaplic_name[32];
> +    unsigned int aplic_size = APLIC_SIZE(d->max_vcpus);
> +    const __be32 reg[] = {
> +        cpu_to_be32(GUEST_APLIC_S_BASE >> 32),
> +        cpu_to_be32(GUEST_APLIC_S_BASE),
> +        cpu_to_be32(0),
> +        cpu_to_be32(aplic_size),
> +    };
> +
> +    BUILD_BUG_ON(APLIC_SIZE(MAX_VIRT_CPUS) > UINT_MAX);
> +
> +    res = snprintf(vaplic_name, sizeof(vaplic_name), "/soc/aplic@%lx",

Well, what should I say? I really expected you to have gone through all of your
pending patches. replacing sizeof() by ARRAY_SIZE() in cases like this one.

With this adjusted and with the question above sorted one way or the other:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

