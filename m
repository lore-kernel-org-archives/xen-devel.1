Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40E4C5AD5A
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 11:57:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389015.1629986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu7Zk-0001rN-Ot; Wed, 12 Aug 2026 11:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389015.1629986; Wed, 12 Aug 2026 11:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu7Zk-0001rG-LI; Wed, 12 Aug 2026 11:56:52 +0000
Received: by outflank-mailman (input) for mailman id 1389015;
 Wed, 12 Aug 2026 11:56:51 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wu7Zj-0001rA-Ie
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 11:56:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wu7Zi-00HSv3-8W
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 13:56:50 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c5f7e-e002-0a2a0a5209dd-0a2a450c85ee-16
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 13:56:50 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c5f81-f479-0a2a450c0019-d155802be07e-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 13:56:50 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4956242332dso7672785e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 04:56:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4997c9417bcsm59180305e9.4.2026.08.12.04.56.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 04:56:49 -0700 (PDT)
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
        d=suse.com; s=google; t=1786535809; x=1787140609; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pa29ChL6a2dv9Spb7nqrB7CWUElK/vRgRlZtCll73Hg=;
        b=MhgPWUm+CoRROd8VrZ/ESYOQk2Zc84Qh/ZQokIdUS5cPpC7kUHTWPGRBnFJjDvCSrR
         IERv1RR0ZS/4RW3lZT1EAoifP9F9BEpbD5QPTlzZf9suaO6lk6J+hBwKoMziSBCE9JpE
         1G4umwXlcpZIF/5eFPsC57EBXu3YbUpZlQ6UWS6bTuPuQ5EwNDf/uYbOvy5qo9eryaoV
         3nkjv3BwttA8fxm3eSljE56g66p5rK8NHBD1ZlDDrzpemQI3zDkbDFHKcyu6Tulg7f5m
         JcULEFNuO5a14liIt8hFEt2HhTaTuWo7jv9H/B+tVhqprfD3LMgdNKuyFwqbmGUGytYD
         UdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786535809; x=1787140609;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pa29ChL6a2dv9Spb7nqrB7CWUElK/vRgRlZtCll73Hg=;
        b=iRBnQErQziJo+r+IVCK3imRpW+iG7gK3nra50Q726ZSso7UlwBPXFFiss7RuYC0gYu
         Ty0Ovd6AG2wkeSD1U7cgwdSxUUSBNZXoT44Zu4s0ECy9pcuEGMRpyWPAP6D0iUcKCMcv
         FgEEQv753SK5tNURR6n0fKEMkrtVwv2+3XBGGZ/T6IFA5Soaz5tmymmOunbiBSuh4IPy
         GM8hx57Jqk0lt+MXTFIrQn4YUtKzGh9W9W5408cvK1XwG0fTfQMW4JRHlTraTl6cmwAI
         DTL4gN0bh2VNCPY/VtdaycQ64/+PfmL8zpB2nQKTbxRi+i356NlU3pOj6sogsYfeQGkO
         Pe1g==
X-Forwarded-Encrypted: i=1; AHgh+RrT9kqY1kdPxyEwQJHAT+IRRsOBabyRd3pYfRibLsvCC1Vo76137/LhGoZm0t2UW6XWVv8bItwnvCo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyCJ9YgE8b8KyKZODxjIpJBSLZv0PfqlmVOVcJWALsliOHHt23r
	Fck6aGBg2byE9DWaURuBMbCtrmGSeU+JuI94ruRX68K8G0pn8h2InCyB7hoGv9YfKA==
X-Gm-Gg: AR+sD12Fs7mrP/A6pbBPcDxFTL2f86cVWHFTUTcCN0N/2gnegirBSThAR730U466cWN
	mdlcU2YAjqPf4kot6ueVwJZF+O81thKnQKdBw9JG1zMdBykw1v5WOEWQlZA8qPIqdTQCGfOeihK
	C8SnkKp2rO8H1Rbr/M4aFIfzsD5g6+x3AnjvQhj7tmbk+vonGFC+eVCDdpdBxpb64fMIqb62l12
	6K2AUUAFiWPlKUg/ntuQHB71NqkNQTw0YkBz5KPV+2lDen7Ss5UAxDGvWNoBJ3lGATLnulGVXB+
	AYD6ofJHDexOloqjQZL/6SC1of3Yomd5EtL+Dm+2sZ+2VuZZ6qnx3K0OqCTggqd2ir45XoVGchd
	Kk7+FlgomCyjE5/KVz8YKTiIo1E/w5EW9M0dkRQBmoSFW+oDdM2b3tbeMN6xR0DBMpVWHl5Ar1r
	vF9bPsDo4tTbXS/VeoaQNKMI7nFnoKC4eGKpDVDOeu1GKtUUaLVZVeWOn1kFWN1CYVclSaZkBjc
	KBl7zHbGKIyKw0+ozJ9ExSUJtYtm0Xn2llqItyAV5JapMlYs51J
X-Received: by 2002:a05:600c:8b43:b0:499:51cc:4e57 with SMTP id 5b1f17b1804b1-4997bf76e08mr54715025e9.0.1786535809579;
        Wed, 12 Aug 2026 04:56:49 -0700 (PDT)
Message-ID: <5b25752b-98ba-4610-b362-89f8c78b39ea@suse.com>
Date: Wed, 12 Aug 2026 13:56:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/17] xen/riscv: implement virtual APLIC MMIO
 emulation
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
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <5571644f1d3a4277dc95fe85099563a145d1d935.1784560663.git.oleksii.kurochko@gmail.com>
 <57793423-aadd-4786-90fd-2923925b766d@suse.com>
 <4c62661a-f944-4806-824a-e74bcbaea3df@gmail.com>
 <1415f794-2121-4534-9226-97479aa57623@suse.com>
 <c9b12490-1b2f-4024-967b-65107ed6911d@gmail.com>
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
In-Reply-To: <c9b12490-1b2f-4024-967b-65107ed6911d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1786535810-51339A5B-E84ABC67/0/0
X-purgate-type: clean
X-purgate-size: 1817

On 12.08.2026 13:51, Oleksii Kurochko wrote:
> On 8/12/26 11:10 AM, Jan Beulich wrote:
>> On 07.08.2026 18:08, Oleksii Kurochko wrote:
>>> On 8/6/26 4:28 PM, Jan Beulich wrote:
>>>> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>>>>> +/*
>>>>> + * Convert a byte offset (within a SETIP/CLRIP/SETIE/CLRIE register group) to
>>>>> + * a 32-bit word index into the allocated_irqs bitmap.  Each word covers 32
>>>>> + * interrupt sources.  For SOURCECFG and TARGET groups the same division also
>>>>> + * yields the interrupt number directly, because those arrays store one 32-bit
>>>>> + * register per source.
>>>>> + */
>>>>> +#define regoffset_to_word_idx(reg_val) ((reg_val) / sizeof(uint32_t))
>>>>> +
>>>>> +static inline uint32_t generate_auth_mask(const struct domain *d,
>>>>> +                                          unsigned int word_idx)
>>>>> +{
>>>>> +    unsigned int first_bit = word_idx * sizeof(uint32_t) * BITS_PER_BYTE;
>>>>> +
>>>>> +    if ( word_idx >= DIV_ROUND_UP(d->arch.vintc->nr_virqs,
>>>>> +                                  sizeof(uint32_t) * BITS_PER_BYTE) )
>>>>> +    {
>>>>> +        dprintk(XENLOG_DEBUG, "incorrect word_idx(%u) is passed\n", word_idx);
>>>>
>>>> Is this really meant to stay?
>>>
>>> For debug purpose it could be useful, so I prefer to have it with
>>> changing it to gprintk(XENLOG_DEBUG, ...) to understand which domain is
>>> trying to access something wrong.
>>
>> gdprintk() implies you're on the vCPU that's the subject of the operation.
>> If that's always the case here, the function parameter wants to reflect
>> that as far as possible: "currd" instead of "d".
> 
> I will use currd. Then it also makes sense to add ASSERT(v == current) 
> in vaplic_emulate_{store,load}().

ASSERT(curr == current), that is.

Jan

