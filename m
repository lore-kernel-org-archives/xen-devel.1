Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77773C531F7
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jul 2026 15:06:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1369303.1618146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmv0A-0002Te-4g; Thu, 23 Jul 2026 15:06:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1369303.1618146; Thu, 23 Jul 2026 15:06:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmv0A-0002TX-1z; Thu, 23 Jul 2026 15:06:22 +0000
Received: by outflank-mailman (input) for mailman id 1369303;
 Thu, 23 Jul 2026 15:06:20 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wmv08-0002TP-2r
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 15:06:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmv07-007viq-4Y
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 17:06:19 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a622dc5-bab6-0a2a0a5309dd-0a2a45039cec-44
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 17:06:19 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a622dea-fae8-0a2a45030019-d155dd34d490-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 17:06:18 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-47f93b2fe4cso299361f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 08:06:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85c63678sm14919860f8f.29.2026.07.23.08.06.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2026 08:06:17 -0700 (PDT)
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
        d=suse.com; s=google; t=1784819178; x=1785423978; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R4P8vmSdxeRWT1lULMVK7NIjbqCuYx/eXCTVexcFIV0=;
        b=T/v73WdUqLKzlvjO2mxDNvomD0JzHJOVfe0KNbJNS+ULtT4ovI5aIn8oyMedaRF3Qa
         mhgzS+4vYcytAveN5khWpEt2nqTBAMe/lRfpn78mGMdlSj69VPVfWh3WO2lwpv3x3LcF
         fOMLs8X2DboWpQwrppICVPVpHGCej6Aef0PS2AJZMoDajmArSmLyLfOUyCxH2x6TjPqk
         ayiG5vOavMexL39M+v3O1rQckVbhwlKuwz2LmMePvyh5QCABHeywRXVMrgr+jpjov/1q
         rUY+mu8ZePCSVitxVPolt5zH0c+uIlMVu2vDNzVCTgsGwUEgBHO5SVxAaUiGpRd/HXEh
         qRCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784819178; x=1785423978;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R4P8vmSdxeRWT1lULMVK7NIjbqCuYx/eXCTVexcFIV0=;
        b=raaY69FlyMYQI4wJ6tNfK1xTckeX7kr00gD3YLKH8rTQnR++Y2pkqp8TVrH40M8irh
         1C6BR8ZjmkinoKzu6KFvQg+MKZiR2ByYoNJtgQrTipGIMVUpRm5MObkzncKakEDiXF4f
         sLH8OHKjSaR9iQTsAZUXomQbxNBR2Tjp85DzqvRW/mtgpomNe0fsgXMgjFQuRN21M97K
         qRoF06RipnhpuhlEcWc6lSN8a9aMzkBu1KhhpJfuZTJUbPH3+dCX0zRNZ9I+/yJf/xYo
         3n8lb4o/EFqs3gApKA+RH7BXv1C+RKn+GXfUf7pdXD8BH1ZF9p/Ob4OHPa8trvtGBDP3
         eyHg==
X-Forwarded-Encrypted: i=1; AHgh+RrR5kOLn8hIvS4WOwAxmVkThOBmG5mSy1K41Ckv1CybYYwVKvh7GKa0qpUycA0sywJCWymRjvq7w5g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwgprsbM/Myy0eAENqSxMn2Q0qKqHMxt74CwUYiCab7kPzYYzyr
	pWIVQdIm1xlWLmJmR/buhJKX9wg/1xat00SwvHq7AONDIgQmIHELyA5Jl4afPv+Ws1vr/ZyGo7s
	umhP86Q==
X-Gm-Gg: AR+sD13Cn9qmwoGJhDSE7MsyI8IWB38bLNLRh6NFkCmBZvYRpUgoztHi0SbEPeWA21G
	+gr2geI7sOMjzBqJ+q3oB9O3F15QJxaiQUvAg2nNE/u2gkJ3ClILI31BkPqOZub6FUIRxkOcjZK
	oR+iJEzMHoiEbRKyEeRMTO9qUMzVQNGxAFegcbuQCeHPK4nfRx21RXDMwqicTc4n5/WsuIMGhkW
	IQ+KfrWF/849d4XpHGHwvLrG5ya8B1SCLwQvKwDJASBLia9EMPWUa/dRRoJ/Q6/eBXwGw6+bzVB
	I+hmqydcKr8jEvxu1iPKQ/H+XAlNu8X1R4+k6Aby4meq+F8bmSwAtfxCuID9yiVPzyjtzk7mqYx
	WGE/KuKRIjFpvZ01eNb9Pfdhv7q52wB0aYAXSkOYgNo/y4OrHwVpFaz3X4A/v5JRPg0p8cOPwS4
	DVJj7LXx1iCBT4J34XjmvaMr35lsHxd1U02YS6Mll4eOQcDz62bdPJRf/lnzs6+effFjHvFMYmh
	Zg9
X-Received: by 2002:a05:6000:4a1b:b0:472:7dce:d8c7 with SMTP id ffacd0b85a97d-47f8dc9739fmr4481193f8f.36.1784819178267;
        Thu, 23 Jul 2026 08:06:18 -0700 (PDT)
Message-ID: <21e786bb-7ea6-47eb-97de-5b6b25466a83@suse.com>
Date: Thu, 23 Jul 2026 17:06:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/9] vpci: move BAR mapping permissions checks
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20260708210233.922275-1-stewart.hildebrand@amd.com>
 <20260708210233.922275-2-stewart.hildebrand@amd.com>
 <0255d2bf-748e-444b-8c09-f69925ec88c4@suse.com>
 <amIrwLuIdOBaAi9d@macbook.local>
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
In-Reply-To: <amIrwLuIdOBaAi9d@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1784819179-776F34E9-5F49C462/0/0
X-purgate-type: clean
X-purgate-size: 2689

On 23.07.2026 16:57, Roger Pau Monné wrote:
> On Thu, Jul 23, 2026 at 04:44:26PM +0200, Jan Beulich wrote:
>> On 08.07.2026 23:02, Stewart Hildebrand wrote:
>>> --- a/xen/drivers/vpci/header.c
>>> +++ b/xen/drivers/vpci/header.c
>>> @@ -58,24 +58,6 @@ static int cf_check map_range(
>>>           * offset of the current address from the BAR start.
>>>           */
>>>          unsigned long map_mfn = start_mfn + s - start_gfn;
>>> -        unsigned long m_end = map_mfn + size - 1;
>>> -
>>> -        if ( !iomem_access_permitted(map->d, map_mfn, m_end) )
>>> -        {
>>> -            printk(XENLOG_G_WARNING
>>> -                   "%pd denied access to MMIO range [%#lx, %#lx]\n",
>>> -                   map->d, map_mfn, m_end);
>>> -            return -EPERM;
>>> -        }
>>> -
>>> -        rc = xsm_iomem_mapping_vpci(XSM_HOOK, map->d, map_mfn, m_end, map->map);
>>> -        if ( rc )
>>> -        {
>>> -            printk(XENLOG_G_WARNING
>>> -                   "%pd XSM denied access to MMIO range [%#lx, %#lx]: %d\n",
>>> -                   map->d, map_mfn, m_end, rc);
>>
>> I realize you literally only take what's here, but ...
>>
>>> @@ -369,6 +351,28 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>>>              return -EINVAL;
>>>          }
>>>  
>>> +        if ( !iomem_access_permitted(pdev->domain, start, end) )
>>> +        {
>>> +            printk(XENLOG_G_WARNING
>>> +                   "%pd denied access to MMIO range [%#lx, %#lx]\n",
>>> +                   pdev->domain, start, end);
>>> +            if ( !is_hardware_domain(pdev->domain) )
>>> +                domain_crash(pdev->domain);
>>> +            return -EPERM;
>>> +        }
>>> +
>>> +        rc = xsm_iomem_mapping_vpci(XSM_HOOK, pdev->domain, start, end,
>>> +                                    !!(cmd & PCI_COMMAND_MEMORY));
>>> +        if ( rc )
>>> +        {
>>> +            printk(XENLOG_G_WARNING
>>> +                   "%pd XSM denied access to MMIO range [%#lx, %#lx]: %d\n",
>>> +                   pdev->domain, start, end, rc);
>>
>> ... is the logging of rc actually useful? Afaict it's only ever going to be
>> -EPERM.
> 
> I think Flask can also return -EACCES, not that it's very relevant I'm
> afraid.

Hmm, looks like this can indeed happen. Please disregard this comment of
mine then.

>  It's likely too late now, but those XSM checks should instead
> return a bool to avoid this kind of confusion with the returned
> error? (or whether diverse return codes are indeed expected).

Depends on whether having distinct error codes is wanted. Daniel?

Jan

