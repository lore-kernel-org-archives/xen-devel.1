Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBB0CC6B2F
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 07:14:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449938.1665454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHFfp-0006Mr-28; Thu, 15 Oct 2026 07:14:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449938.1665454; Thu, 15 Oct 2026 07:14:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHFfo-0006Lf-VL; Thu, 15 Oct 2026 07:14:44 +0000
Received: by outflank-mailman (input) for mailman id 1449938;
 Thu, 15 Oct 2026 07:14:43 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHFfn-0006LZ-N1
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 07:14:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHFfn-007oYi-3f
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 09:14:43 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad07d5e-2eae-0a2a0a5409dd-0a2a4509b1f2-40
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 09:14:43 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad07d62-be1a-0a2a45090019-d155dd29c5a9-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 09:14:43 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-48b042c0728so1145628f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 00:14:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd6834dasm45027065e9.4.2026.10.15.00.14.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2026 00:14:42 -0700 (PDT)
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
        d=suse.com; s=google; t=1792048482; x=1792653282; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1mRqXZJUKpeeawjkn1wQSZdVK5Twfog5vr8bsXD4zME=;
        b=QwwfnUj1J9rTrCWl2CzNajVUJtIGj93Gw4qftG/vkqRBbktMna44ofx6cH28tZ7LTx
         pgHfMuRpMgwBXCPeR86Eiy0K4Cu7StU6sLvpp29MIKdv8YarEHEVrFKu1ir319KCRfNv
         RnxENvaj23uWQaAw0QhXw5Yz/+nj24G5ZLuPTl9/0iWVfehjujM7cga+CDSf3dwjjLij
         1AQVGZqBw0WqrUjGHzoXuRt4edEyfV8xPJzA+6ndNTxoh8nfwkmTJq9pGMsjQl3pNO5c
         p6xCR1eGfp0TfjOh8CjwNbqRbY8B+b+xMRklw/sqZz7e+3gRsW1MQbt2Pvv4ABk0O9F7
         7hFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048482; x=1792653282;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1mRqXZJUKpeeawjkn1wQSZdVK5Twfog5vr8bsXD4zME=;
        b=Si3K4fRpQ7/WjhW5X/teqmw9kvYjLUZvXY6/Pex6ZXneW70ZKRNDETZKYIElRzD5Il
         ZKITJvCmzChT/2DR4pKJzY/KhMn7l9J0Z6vr0eLz68c0BORr5XsNCQUdYCU32XgQSWCQ
         fYNwqoUEyswadX/sWyeHZqqmUxAxEjMflXcLgtnWlBYewRRJHoCNAi+Ac0MdPeLNOX5L
         M3P4lwV6hlh28vRF2+pSIlgcdyLz7mSXooqrG04b0xG3PNCSny8lU4jNqznbpDQx8Lbw
         1pxoLZWsvbioZzOG341KGcBTo7M3051vMX122CEtkgGwhVWjA1r99d5ldszw1fFrm/UF
         qZBg==
X-Forwarded-Encrypted: i=1; AKwUvBxPC0UdKtiuoIeUo6i2A1LChqsUXDPovcRUvZcLE8rV/6l81gWP19k+pCVb4xSw0Ik0ZDOu7lIbMNM=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJiCz+McAa0zjt1dMaTMQzcKrPniJGhy7IL9hLzGa1Yiothhm8x
	x3zR96jBdMdrA3nRCUiJ0tJ1tF+yR5D35m5d0/26Br1I+fHv0oJnTjOIY9t0tzV9Tg==
X-Gm-Gg: AYBFou2oq7Nt1Rx8jEkAeVMGWdobC8ZiU3CQNV6DWWWAqO/BqEmNgBYAVxFd6nAgN/o
	Quw/dCkumFbw5myZL7nl2baUPWRKQjrjJgt72PpUmoI8xAXxY/5jAxqC37Px43eIa8GL9JTmkJt
	eZk1/+h8zqcU8Kv9P5hgaZdF8gj5hnVOUYBpbgFDhn/2cFQXrm3QcKVeOhRY+O9SemshqVdH1V2
	I1ToCWHCjdDzN/tzOskf2W9yfhnvZR38LHUM6qN1f6VY0rJkPeYUhlkpi9hvoc1sEBBWdbIlfI3
	b8ubpSWHZRr8a0UHNP9lG7ZHNYqaHoVnc+mMjdXnYkODLSspQwvw0n+Dyd5v94RhqCVojNPW+10
	rLkJe06iac1v9yX52D1NWCJ60ilixiXSPHWfcSpXUPdI7Tw2terwJhcCDELzc9dmDvCoaqlL/J/
	+vfKFOmOAAOK6FCd3/U3PKsMMNQbKXhNYMyZ4mIQrEi1foftdihJ9slTiXMGWyLoNPdcdHN6jFQ
	Tqulx0NSsgE7EzhklRYP5CR9+tBugEkCAyPNhzmD3TyeptUnCEYI5WqEMuTXyRC
X-Received: by 2002:a05:600c:8b58:b0:49f:bcce:13f5 with SMTP id 5b1f17b1804b1-4a18e4ca287mr333364615e9.24.1792048482424;
        Thu, 15 Oct 2026 00:14:42 -0700 (PDT)
Message-ID: <4e914f14-50ff-48a5-9f56-836913e487fb@suse.com>
Date: Thu, 15 Oct 2026 09:14:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] xen/riscv: probe the PTE A/D bits update scheme at
 boot
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>, xen-devel@lists.xenproject.org
References: <1791885904.8631fc262581453bbf619ec5b2062170.1a134b909b40008425@vates.tech>
 <1791886038.8631fc262581453bbf619ec5b2062170.1a134bb169d0008425@vates.tech>
 <21a48f53-385b-4f36-958c-cc82bf390c89@suse.com>
 <1791901979.8631fc262581453bbf619ec5b2062170.1a135ae53690008425@vates.tech>
 <7ed5d117-80d5-4862-af60-c3e0143564ea@suse.com>
 <1791968412.8631fc262581453bbf619ec5b2062170.1a139a403a30008425@vates.tech>
 <db0d448a-ff1f-4549-84f1-c53e3e4a711e@suse.com>
 <1791996314.8631fc262581453bbf619ec5b2062170.1a13b4dc2b50008425@vates.tech>
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
In-Reply-To: <1791996314.8631fc262581453bbf619ec5b2062170.1a13b4dc2b50008425@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1792048483-BD8C1034-FAE50432/10/78276251493
X-purgate-type: spam
X-purgate-size: 2138

On 14.10.2026 18:45, Baptiste Le Duc wrote:
> On 2026-10-14 11:09:58+02:00, Jan Beulich wrote:
>> On 14.10.2026 11:00, Baptiste Le Duc wrote:
>>
>> In which case it would need to be
>>
>>     if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) ||
>>          !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu) )
>>         e->pte |= PTE_ACCESSED | PTE_DIRTY;
>>
>> albeit I have to admit that permitting two contradicting extensions to
>> be exposed at the same time is irritating.
>>
>>> I see two ways to address this:
>>>
>>> 1) Keep checking Svade:
>>>
>>>     if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
>>>         e->pte |= PTE_ACCESSED | PTE_DIRTY;
>>>
>>>     After resolve_ad_scheme(), the Svade bit is set in every case where
>>>     software has to preset the A/D bits. The only imprecise case is both
>>>     extensions advertised with hardware updating already enabled by
>>>     firmware, where presetting A/D is unnecessary but harmless.
>>>
>>> 2) Record the probe result in a global, e.g.
>>>
>>>     static bool __ro_after_init hw_ad_update;
>>>
>>>     and use:
>>>
>>>     if ( !hw_ad_update )
>>>         e->pte |= PTE_ACCESSED | PTE_DIRTY;
>>>
>>>     This is exact in all cases, at the cost of a new global that mostly
>>>     duplicates what resolve_ad_scheme() already records in the ISA bitmap.
>>>
>>> I discussed with Oleksii and we are fine with either. What do you prefer?
>>
>> As to 1), see above. For 2), while maybe okay, I think we're better off
> Sorry, I don't fully follow the issue with 1). Compared to what you proposed,
> it only differs when neither Svade nor Svadu is recorded, which cannot
> happen as resolve_ad_scheme() runs before and always records one of the
> two.

Yet previously we said that recording extensions (as such, i.e. later also
possibly exposing them to guests) when they weren't really advertised may
not be the right thing to do. I.e. imo the probing may be used to drive
Xen's internal behavior, but I'm unconvinced that it should also lead to
marking extensions as available.

Jan

