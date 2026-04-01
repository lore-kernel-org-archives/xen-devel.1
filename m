Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5553107636D
	for <xen-devel@archiver.kernel.org>; Wed,  1 Apr 2026 05:59:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1269668.1558589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7ocD-0000mq-K5; Wed, 01 Apr 2026 05:59:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269668.1558589; Wed, 01 Apr 2026 05:59:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7ocD-0000mj-Gi; Wed, 01 Apr 2026 05:59:45 +0000
Received: by outflank-mailman (input) for mailman id 1269668;
 Wed, 01 Apr 2026 05:59:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7ocC-0000md-4k
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 05:59:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7ocB-0001Ze-H0
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 07:59:43 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ccb44b-e002-0a2a0a5209dd-0a2a4501e11c-8
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 07:59:43 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69ccb44f-6fc9-0a2a45010019-d155dd29e4d3-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 07:59:43 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-43cf906b007so1849477f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 22:59:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf257b72dsm33363865f8f.34.2026.03.31.22.59.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 22:59:42 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775023183; x=1775627983; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ME3AW82qZDw/pfDlCDyK6nh4Ak9vBhwCI9g2zYdnqvE=;
        b=EjrF4L2o/Ffz1sf4x+0OdOlCjJAxmbm81xyST/kY6QHvs3Wqy6C69vGZyreunBEvsD
         JqNxJ9p2+JoXEf79ExjSNlANpxFcMSpDsq5aKFYo3wZUCvlwNGcxYnRlwMozQK18BcPr
         ZcRPUfgHXnkavZzUNyCMaWxFBqCB97lQ5LkzGOPVLwi5al5T08qbOiXaGnmT7eO0t/pH
         jA+1t5Br1MX7FSwnM0GB0FMHJR51x9bgKWlUnUvfmpUIY1WyxT5N4w8LhFEXhjPvzhQc
         +Vs5g44XEQ+5V/hNsmyhvUDgo9XxNvZ9RAN17lWvbfSehtA9r29TN6yec0QFZRLIe85U
         iJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775023183; x=1775627983;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ME3AW82qZDw/pfDlCDyK6nh4Ak9vBhwCI9g2zYdnqvE=;
        b=jH7q2vpArxUJ1sqMlGZxgs4ugc1p+s3VAoC5DiEshyGT/Det+1qz1EdZhBmL82GD2m
         QcO/IXI5azREOG+3BDLjTt8ALUw3bqTjqBMGOeJSzg1llWe4TxIxyRUDa6eFh5GdHXAw
         pv++PXW/x8fmXgwsSDoyHl6eS0R/5Ex4epCPXaFfYksMNkCjH6bCVAZxPdT8w7xAI5ro
         jEa2TaY9Nnc3BifPI+Nrrk37kXdSoCiya4cDY6h8YzLB3HEONBkAqgUquNbiWWYQNsxC
         aoaEF65vG0C8x7SvqGTY0yJIAQ4ZXI8DS+FCkeBQSlKCZFGetaiIQ073Md1SwpnQcl9U
         6qew==
X-Forwarded-Encrypted: i=1; AJvYcCUbS5wWEIzEXtUnGzNCUZyN+t9ENkxaGYBRGZEDkaxzoHtM7ygSyfJ5zZuOLWjTh5pMb5qIR29+nuk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzvEHwM7it5dNt6U0AdtvGLNtQtslMT0U7at3RetKakwRiphoxc
	77qesr6TQtuPuFlkPFWZwzM+y+cETGVteCVn9PT5V4dWSCF0hfFv3jfQbVbQBJxhNw==
X-Gm-Gg: ATEYQzw45G22iAqrVCnHPxbLzQ81kzf/PaiOuFd6j19ZTQRfgWP8t2U1UEIQN9QDPrR
	UupCZ3kjstXqvxDCq6Ol8nHGX/S98kCTUitoOPLcWFK2UjL4Ylh1QQAuTkKBieeVXVVs7unDLWS
	kWxmXoXMMR4dQ+t30PM6yyP0rqeol+wIRKPmfls+VqHGAruWYMkke35ctVWHowzMeBlRmp8cWAk
	ZPJZk2NE2jqRvGOIvjcWYxo+VuL36WmJL6kuj1u+vGT9zpEExJOcruF7z1x0lyt5xHXCTs2j1Yy
	S6l/MgFRRuhsA+oOY76NJgoIHyoaiGDG7s7V2ZQWMJ5dqqZYqIexS6b+fHlfov39uoG/Mawwv6F
	eBmqXnGg9oeZ0PIWSVQG+dPrgPK/5Lg1IKxwD/4dVxCoZwwF1IMHs2vsczfCcy/dbw12k5WNp0K
	NwZJjHhNOQ9fQatHvCUIuQ+6Fk3OmiwSN1DsdV7FZ7SwyN51x480zgQ13RWKFiCU9qT97iH4mKb
	EoLqxRWKPNvTvE=
X-Received: by 2002:a05:6000:4008:b0:43b:8858:1146 with SMTP id ffacd0b85a97d-43d150f0ae4mr3961824f8f.41.1775023182895;
        Tue, 31 Mar 2026 22:59:42 -0700 (PDT)
Message-ID: <a57b4cee-e230-4fc5-a7a6-a62635b54a76@suse.com>
Date: Wed, 1 Apr 2026 07:59:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] xen: move domain_use_host_layout() to common
 code
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
 <533d01db2b36b8357cd87e99a64a6e66dbdd1db4.1774281309.git.oleksii.kurochko@gmail.com>
 <6df9470e-4969-48d1-bf0c-c6569a5e5577@suse.com>
 <57581b7d-cb9f-444c-9321-63b2fc3d09f0@gmail.com>
 <d1288db4-2001-4914-919f-b613fd607bcc@suse.com>
 <d67b2856-bf93-4254-afa1-745dc37e0623@gmail.com>
 <38d93a26-dfce-4d4e-a1d2-c4e8d13c4ead@gmail.com>
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
In-Reply-To: <38d93a26-dfce-4d4e-a1d2-c4e8d13c4ead@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1775023183-BCD65185-790A1592/0/0
X-purgate-type: clean
X-purgate-size: 1660

On 31.03.2026 21:49, Oleksii Kurochko wrote:
> On 3/31/26 6:32 PM, Oleksii Kurochko wrote:
>>>>>> @@ -2544,6 +2544,12 @@ void thaw_domains(void)
>>>>>>    #endif /* CONFIG_SYSTEM_SUSPEND */
>>>>>> +bool domain_use_host_layout(struct domain *d)
>>>>>> +{
>>>>>> +    return is_domain_direct_mapped(d) ||
>>>>>> +           (paging_mode_translate(d) && is_hardware_domain(d));
>>>>>> +}
>>>>>
>>>>> The placement of paging_mode_translate() doesn't match ...
>>>>>
>>>>>> --- a/xen/include/xen/domain.h
>>>>>> +++ b/xen/include/xen/domain.h
>>>>>> @@ -62,6 +62,22 @@ void domid_free(domid_t domid);
>>>>>>    #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
>>>>>>    #define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
>>>>>> +/*
>>>>>> + * Is the auto-translated domain using the host memory layout?
>>>>>> + *
>>>>>> + * domain_use_host_layout() is always False for PV guests.
>>>>>
>>>>> ... the description of the function.
>>>>
>>>> But why the placement should be different?
>>>
>>> If you focus on auto-translated, then imo paging_mode_translate()
>>> better would guard everything.
>>
>> Then it make sense to do in the following way:
>>   bool domain_use_host_layout(struct domain *d)
>>   {
>> -    return is_domain_direct_mapped(d) ||
>> -           (paging_mode_translate(d) && is_hardware_domain(d));
>> +    return paging_mode_translate(d) &&
>> +           (is_domain_direct_mapped(d) || is_hardware_domain(d));
>>   }
> 
> This is not really correct.

... because of ... ? (After all, then the comment isn't correct either.)

Jan

