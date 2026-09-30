Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF69CA5FC5
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 14:21:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437365.1656247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBvAt-0000qE-07; Wed, 30 Sep 2026 14:20:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437365.1656247; Wed, 30 Sep 2026 14:20:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBvAs-0000q7-TZ; Wed, 30 Sep 2026 14:20:46 +0000
Received: by outflank-mailman (input) for mailman id 1437365;
 Wed, 30 Sep 2026 14:20:45 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBvAr-0000q1-EK
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 14:20:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBvAq-009zAn-Qs
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:20:44 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abd1ab8-bab6-0a2a0a5309dd-0a2a4502b450-10
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 16:20:44 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abd1abc-6ca4-0a2a45020019-4a7de18db3c3-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 16:20:44 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-4a00d8bec5aso13139655e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 07:20:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01ccf92d2sm9229245e9.1.2026.09.30.07.20.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 07:20:43 -0700 (PDT)
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
        d=suse.com; s=google; t=1790778044; x=1791382844; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cE0mg24hCqx8U8OZrszMngLXM511YovXSztCqrqJdJk=;
        b=HRe+EM930i8uNlqzbSyk49ZbT/76AS6nNpny7rBRvqTlIR7lrMlVYwuaRmh85ixWbF
         0zcQgztolVLbJ9kfPGiyVU0Yrb+nLm9tHsm99phqs/kEcYj7nH8G0MRCs6m0JzeeSMH3
         tcfmUkP/lnXxUKs0EoNRFZWZy34wsjRYVU9nbz5qhXwRIo5TqbDn5tRxD3JbAmWT7NrJ
         i9VY0UqVtzdghqHCw8dfCtOtzUnH6qv50aYei8aI9AdSYeJTHWZIcfKc4f7G1SnoXGpF
         dDuvPEX+ooEr62M7LkAJTd5ih5MpB2tt2LTGb4hP7afKY9g2qk4BBECXl90K7F+7q6Qb
         iYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790778044; x=1791382844;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cE0mg24hCqx8U8OZrszMngLXM511YovXSztCqrqJdJk=;
        b=HNRvsMVy3m1ixuQRQKFC+7fK7MPkQWpBO75lkqfuxkirSdOqD9ymRk5YUg2NHfV5fa
         1lXhHBp6M0UsyfF2fXrjdwcWpGlYZvsn7sQMStYfLtm28pud8WWgUvKTIkAMQsRNn78U
         rPWF/G7rbOb4krTzi/6/YeXdBT6v/38pVRTC8irzrSQ+2Lj6fyH4LGLAa1eOGmpIpdhm
         SyZtXSaflY9P8hn7cfLK0Oza8SY+HpoIadw2jOqtsF8DF9bOpdM7OrxwWPz0HAvP3qLV
         CO+l/q3nT3hJ4scwCUtFodpEqOAnXuwOeiYmGawTMnnTG1qyj0Y3VX7GfwU/XIUD/8Rh
         FjkQ==
X-Forwarded-Encrypted: i=1; AKwUvByxVM5xFZAWHF4uH8DgD4TJGRNW7RBNUCwfTX1n5hWyN+II5vduEgdrg307Y/f/sM4Uz+9OCVycPkE=@lists.xenproject.org
X-Gm-Message-State: AFuF++mqww8Am03Nvbz+AnOMe0d7a8/VsfI5PQfmmJYyvHyubPK+ILDH
	N5TFH6VOmF1zs+TZ3r1Vh5O3lAQuL1l4NwmZsadYjkPZTrQFNBsiil4dRyfhrueETQ==
X-Gm-Gg: AYBFou2sDuA3p47AqkFmzsvAGPqL6XZCstZkCvqzZX3KlUiRZm5+4eQSRdmmxvlUYDv
	5HZCZmVWF2wm+IRa4bKzPSiuYYr+0S97qZ7iQf9FMI/Y34b6iFCqzUhaSFk5Dk97FPnHblkEw6O
	eifzRiyiICmXVv5zTKvBbTvMtygUhqxkRXcictLVkLTxf5ubJv+pPpTH5bAfObi3xdF5apEaOOR
	GnJaa4nowSAvf6gGsg0aW+xF5GjSQh+Tl35bU6mEcLysyDsuxG4RWBhwc5sOsGGWNNBnRw/9f8a
	YJj5PCkLdOB54NQB/2yWOULc4cDQK15veHrAEj4KfNALEsaztRyacv1CW5DMo3U7kMyZnl4eUdF
	X+6Mf9ZwL5gMQx2Wt/i9pRtRjqtzg4eZ9M8ZCQCJveDpADoDDIHiZh2iqLh7Nh+/uieAvQENO00
	YpwfPqOi4xfPEdFvq7tlwpc8g/bM3RWA2dp0A+Fbh66febw/baNVmGSaynKzPKGRDg7ZOljoseP
	OS0gYVGwtnLZARnvjA/8i69QBn2lsnB/9VWq90bvLzU7I8E0dDmNOBGSI9TOQ==
X-Received: by 2002:a05:600c:4fd5:b0:49f:fed0:fc47 with SMTP id 5b1f17b1804b1-4a01ad90a51mr26868085e9.1.1790778043870;
        Wed, 30 Sep 2026 07:20:43 -0700 (PDT)
Message-ID: <69c0552a-8597-4853-8c03-407a62a68c7b@suse.com>
Date: Wed, 30 Sep 2026 16:20:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/11] x86/vioapic: Add ioapic_check() to validate
 IO-APIC state before restore
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Teddy Astie <teddy.astie@vates.tech>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <1788444605.8631fc262581453bbf619ec5b2062170.1a0679afc0d000c4f3@vates.tech>
 <1788444855.8631fc262581453bbf619ec5b2062170.1a0679ecc95000c4f3@vates.tech>
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
In-Reply-To: <1788444855.8631fc262581453bbf619ec5b2062170.1a0679ecc95000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1790778044-F0AA52AC-96C48BD2/10/78276251493
X-purgate-type: spam
X-purgate-size: 1349

On 03.09.2026 16:13, Julian Vetter wrote:
> @@ -595,6 +596,47 @@ int vioapic_get_trigger_mode(const struct domain *d, unsigned int gsi)
>      return vioapic->redirtbl[pin].fields.trig_mode;
>  }
>  
> +static int cf_check ioapic_check(const struct domain *d, hvm_domain_context_t *h)
> +{
> +    const HVM_SAVE_TYPE(IOAPIC) *s;
> +
> +    if ( !has_vioapic(d) )
> +        return -ENODEV;
> +
> +    s = hvm_get_entry(IOAPIC, h);
> +    if ( !s )
> +        return -ENODATA;
> +
> +    /*
> +     * base_address must be non-zero, page-aligned (hardware constraint), and
> +     * within the guest's physical address space (with room for the full MMIO
> +     * window).
> +     */
> +    if ( !s->base_address ||
> +         !IS_ALIGNED(s->base_address, PAGE_SIZE) ||
> +         s->base_address > (1ULL << hap_paddr_bits) - VIOAPIC_MEM_LENGTH )
> +        return -EINVAL;

->base_address can only ever be VIOAPIC_DEFAULT_BASE_ADDRESS for a DomU (and
that's all we care about here). If we wanted to relax that, further constraints
would need enforcing (like no conflict with the LAPIC page and no conflict
with anywhere that RAM or PCI BARs can live). This not being a constant would
also require changes to the ACPI tables we build for the guest.

I'm sorry for misleading you with a respective v4 comment.

Jan

