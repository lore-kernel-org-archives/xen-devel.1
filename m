Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D563BC54FDF
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 07:54:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1377237.1623404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpLaX-0005Sh-1L; Thu, 30 Jul 2026 07:53:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1377237.1623404; Thu, 30 Jul 2026 07:53:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpLaW-0005Sa-S1; Thu, 30 Jul 2026 07:53:56 +0000
Received: by outflank-mailman (input) for mailman id 1377237;
 Thu, 30 Jul 2026 07:53:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wpLaV-0005ST-W8
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 07:53:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpLaV-00Gg0V-Cp
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 09:53:55 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6b0307-5cb7-0a2a0a5109dd-0a2a450683ea-38
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 09:53:55 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6b0313-195a-0a2a45060019-d155802ee967-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 09:53:55 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4955de8797cso11838665e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 00:53:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-498011fd5fesm35279715e9.7.2026.07.30.00.53.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2026 00:53:54 -0700 (PDT)
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
        d=suse.com; s=google; t=1785398035; x=1786002835; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MYxDa/UJ7hji7HRRrnmGtEq3iH4gQzyixMSf/mFboaY=;
        b=KI09sLm+3FaJvf+wmxZNRauZLQIDueORcH/l2879n9kYCp2zyDsVawICWCsd7CmWAb
         SEJCMpserbgMSvmaAD5QUr1HiOJWIMa9AK6Y8SrLJp6BtAv3cvroPWQXNO4FtrT1dzvI
         YC99qhWHP9wWWUIvwDCRnremvbzaUlBqPbcp/pEvCC1JC5ydQn5kJc4Ql2/PFvQxlArd
         Y+NWhARyM/YC2iOAXLDwqpP7DLaB9yhIf6m76BN/aA9W/yvqWG97IXBX1w3N+qO1X1t6
         WwdXNtRppBnbQbFhZ+Bb77dDA27BQcvu3J03MDFeuhd2UWOxH1wQDlIqmKI0TpfLIlJ5
         iraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785398035; x=1786002835;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MYxDa/UJ7hji7HRRrnmGtEq3iH4gQzyixMSf/mFboaY=;
        b=BaG72rX6/dQ+aCo5slFOTxVbSeqGP/gOFV8MgG3tq7mMtu0am6XUKMtXijlmgJLpCi
         I5/RfK16ngHRULf7XVaYxK1wmEGzIzOrJADWbmmoq6AhmUtHyJmAxEB/+BV5RNWQUI7n
         rncHs0iA2PyfRD/WlnISd+KS8x88Kud0MmnhxiKlfpNZDf78pqidBQkjKFXEleXicqT4
         itKHHGJm4Fu5riMaIifsn9hVlNhJAQGbkwGUO8f4hAZdcw1o1af2qoPGGEcvW4r/pm+C
         zJqsqSj5sfc6ssX84OoHm3b9vvdOKLr7TI+wzLCTt0Mv+miKviPqo1RO60Wz3B9eGMra
         HPdw==
X-Forwarded-Encrypted: i=1; AHgh+Ro0hPt04OfG+R5HxvdJAvetNx5nttGMRcDRt8U0hmZ+r0GH0ztJ0+bvzuTnn9rSXTG2FjwGugia3dg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyepYjhPMJNnpoFgjX9kFKwVB/tsFeKeefZAL7qlr2+VQVnj8Pg
	p7jApALu2XgUIc0IjwBPbqXIOb24TfyH+eV1l20uO00l8+ZWwi/WViqYL+/6KNqwzg==
X-Gm-Gg: AR+sD13f59dEktURtdh3Gs+BUv3ay+WcR2i/ehdwTpQ3+cdOcjbbCITbHCaL633oSlx
	AvBGNpDADFHHye/bGVazE/G4Ky+Y89ZqujNyLkjk9tItlSs5ZlZWT7XZVxpdn9JUIoorXrFIyEt
	orPIEQo1S92Qzz62dgNegSh0Jejb5LZDMRx4nEc2RKLGakzPmXU4g5/QHufXtg7NKjUXk4CcI6e
	VJkJQc0ZIJfw6ok+EkN6IOedQL9B8BkKADX8mgboWXsA7aNj1YkW7gup1udyAEH3EXgcnzOWuMe
	kXTpluajnb3QhqN+UOP94+84gr3DOjW/ywp6sJsEJzqTjjpHlrAVNJ72bEqAy0V9xwIBiwV9ABV
	mZRaOfk9xVNe/kmDPT3slapiUV3YT49pccmYid2LnY8ASveW5iGbqrN4koBlXcpSJ90gxPuGfKh
	zVLMFg+XqjjnPKQiefTwjZ+1/onsBjWWAVH03Pcal96A0m/NGeSGta2jB43blVbX0osSbB4aejX
	S6fwcnj1/wv3tdniyqxVI9pgRzeR3/12x4HAxg2vxQg4tyKwib/
X-Received: by 2002:a05:600c:1150:b0:493:e79e:da98 with SMTP id 5b1f17b1804b1-49800eb9dcbmr11984515e9.39.1785398034794;
        Thu, 30 Jul 2026 00:53:54 -0700 (PDT)
Message-ID: <7f77c37f-beae-4740-922c-9afb525fb042@suse.com>
Date: Thu, 30 Jul 2026 09:53:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/17] xen/riscv: add missing APLIC register offsets,
 masks to asm/aplic.h
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
 <ee3825adfd0012437a594f6a0e51c6ee71175cc4.1784560663.git.oleksii.kurochko@gmail.com>
 <a9725508-7660-4960-88ef-8e5b324f8f08@suse.com>
 <0fea0d33-b25d-420f-acf0-3c65368f0bac@gmail.com>
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
In-Reply-To: <0fea0d33-b25d-420f-acf0-3c65368f0bac@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1785398035-F76C877B-249FCDDA/0/0
X-purgate-type: clean
X-purgate-size: 2524

On 29.07.2026 17:26, Oleksii Kurochko wrote:
> 
> 
> On 7/28/26 2:02 PM, Jan Beulich wrote:
>> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>>> @@ -25,6 +27,7 @@
>>>   #define APLIC_DOMAINCFG_DM      BIT(2, U)
>>>   #define APLIC_DOMAINCFG_BE      BIT(0, U)
>>>   
>>> +/* sourcecfg register fields */
>>>   #define APLIC_SOURCECFG_SM_INACTIVE     0x0
>>>   #define APLIC_SOURCECFG_SM_DETACH       0x1
>>>   #define APLIC_SOURCECFG_SM_EDGE_RISE    0x4
>>> @@ -32,7 +35,39 @@
>>>   #define APLIC_SOURCECFG_SM_LEVEL_HIGH   0x6
>>>   #define APLIC_SOURCECFG_SM_LEVEL_LOW    0x7
>>>   
>>> +/* target register fields */
>>>   #define APLIC_TARGET_HART_IDX_SHIFT 18
>>> +#define APLIC_TARGET_EIID_MASK      0x7ff
>>
>> So why would these live here, far ahead of ...
>>
>>> +#define APLIC_DOMAINCFG         0x0000
>>> +#define APLIC_SOURCECFG_BASE    0x0004
>>> +#define APLIC_SOURCECFG_LAST    0x0ffc
>>> +
>>> +#define APLIC_SMSICFGADDR       0x1bc8
>>> +#define APLIC_SMSICFGADDRH      0x1bcc
>>> +
>>> +#define APLIC_SETIP_BASE        0x1c00
>>> +#define APLIC_SETIP_LAST        0x1c7c
>>> +#define APLIC_SETIPNUM          0x1cdc
>>> +
>>> +#define APLIC_CLRIP_BASE        0x1d00
>>> +#define APLIC_CLRIP_LAST        0x1d7c
>>> +#define APLIC_CLRIPNUM          0x1ddc
>>> +
>>> +#define APLIC_SETIE_BASE        0x1e00
>>> +#define APLIC_SETIE_LAST        0x1e7c
>>> +#define APLIC_SETIENUM          0x1edc
>>> +
>>> +#define APLIC_CLRIE_BASE        0x1f00
>>> +#define APLIC_CLRIE_LAST        0x1f7c
>>> +#define APLIC_CLRIENUM          0x1fdc
>>> +
>>> +#define APLIC_SETIPNUM_LE       0x2000
>>> +
>>> +#define APLIC_GENMSI            0x3000
>>> +
>>> +#define APLIC_TARGET_BASE       0x3004
>>> +#define APLIC_TARGET_LAST       0x3ffc
>>
>> ... the register definition itself. Would you mind taking a look at the top
>> third (or so) of arch/x86/include/asm/msr-index.h? There you'll find MSR
>> index values of MSRs we use, immediately followed by field definitions (of
>> course only where applicable). With such an arrangement, the extra comments
>> you add can easily be omitted.
> 
> I'll move the definitions mentioned above to the suggested location and 
> follow this pattern in future changes. I just thought it would be better 
> to keep the APLIC register definitions together in memory layout order.

Retaining that order is certainly wanted. Keeping them together is also wanted,
just with the bit/field definitions inserted accordingly.

Jan

