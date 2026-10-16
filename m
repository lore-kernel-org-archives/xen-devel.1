Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5548CC6B38
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 06:35:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451278.1666370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHbXG-0008Tb-QV; Fri, 16 Oct 2026 06:35:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451278.1666370; Fri, 16 Oct 2026 06:35:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHbXG-0008TT-N5; Fri, 16 Oct 2026 06:35:22 +0000
Received: by outflank-mailman (input) for mailman id 1451278;
 Fri, 16 Oct 2026 06:35:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHbXF-0008TM-N0
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 06:35:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHbXF-00A6wH-3S
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 08:35:21 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad1c5a8-8faa-0a2a0a5109dd-0a2a4503de6e-4
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 08:35:21 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad1c5a8-fae8-0a2a45030019-d155dd2ce4df-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 08:35:20 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-48df54150dfso875922f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 23:35:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd510ba3sm2868618f8f.56.2026.10.15.23.35.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2026 23:35:15 -0700 (PDT)
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
        d=suse.com; s=google; t=1792132520; x=1792737320; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kLKAClVa90k6t9rFwCAPsMDfTA3kNX7K/zab3T8u0dI=;
        b=C4m86HzrBiIo6nF1o5rw9Bl8/yifhBArDiXR8mLTTdaa2SiYgAaPJYDlNTM9FEfr1u
         k7Rotc4pUostLO5GGHqNTTjwwltBt2yKsbFZoPmQja3ULM0wXBy3oz2pqgSHsixYdJtN
         TdrMVsaWb9lKMmSD5tQE1k7pTUnmK1Eam2SJ36ZhamAGzMGP2lyyE6yYj/RKt3KSnbKh
         dsE+3w9FZnQnuH5ROjrDoTnR0TQMQzGOL1uCfUVaQoXXOn7HeCEphF1UKVfqWq7MXO5B
         0vb/2HIfZolEYB+OwKvr8BX2JgoIFto8L0KHYI4Y/w89VGA1CE9szZ6Z83XjFFeZSjqs
         nGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792132520; x=1792737320;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kLKAClVa90k6t9rFwCAPsMDfTA3kNX7K/zab3T8u0dI=;
        b=i5xpgZyOqACXWYcWxrvon4zqoOQk02BAeLpH0RLJVkrlVUEY0SWYfPbB1zC/Y+v2qg
         q5gPMK6xaOlVNcdoUQHHa/TFF6Od+XUKV3NyITVYKpGysht9qAlOOkmmNa8xbK5NGTbu
         NMU4VvdzT9cnfEYQ7L09R54TQu8R80gLUSNFCuFc+zSe+nTWHMrXmjTwR1P7T+kafKFa
         rjty2PFTXxYyn2HFKL8m2hTF3mxeODdUesb4s7CHnlQr0Eie2m3rUv/pXQhnv6PzKfNv
         JU+HR/HUEHNMdn1oh82nbJ3lbnkNs7jznLUJKJr9q0cSvUFP4zsPe8oZ80Kt0VOZ48sQ
         0Paw==
X-Forwarded-Encrypted: i=1; AKwUvByTD9VdYl3XYWOZipzBNe7Pdx1u8l1EUc0YutIH4QeFxSLZAMnMuilcl17uLXOQvEBCvjdBzh2iiRs=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLQu77XqQcYAuxSSxdUxYyDoZXanOGo6z3NHDKwZV0KNsi4vdbn
	VmIBkmiKRSn70+8hJAT3z2RUToJlHLiR0zuUEfYdFy5vl5sHzJHWHNldXrV2AZmQTw==
X-Gm-Gg: AYBFou25+CNmGpTQROpiUI9vlerUIAT3QmwDZI2Zk7T87uZ6gUI0wu2KNC9qvyjNxSF
	RUoo66Nm1YWniP688TQuDCVJws9dUBDyMqPukUET+QzpCcOxq+0v1JF2GzgPaMWVL6qFQUWySor
	seQjHBUikn4mzoMQqbr6+AYqPsPoizK5/ntBAXMh1O6xX8wzLmUmAgcufCT44Ni6sfMqWjk3wEX
	g2hNg+RLZlwoRFLyG2EkfFwryg+KGxbJU37tqNYqheZQ/D+fMdrKPkVJ8ikfJVcNhymY45uN5cT
	uVNM0CnVpWg5O4Mnw0GySJr4doV7Bjv81HUcEn937oEeYQJ0ogyaBKniEkEm7AWGB8iGhwYNaG9
	i2sa7y321Tj/GG+pYdqPOf2ndJV+QCrcdSGTg1BKvnZ0Arqv73O8O9YcEOJnQAWNKemTA201Fki
	wFZeaEzWUq3wLz5tVdCAzaLwBnVkx4XqF2Boi8BLuqEwdnqOb2Gntw9pnWEcjIc0W52vu3SnX1h
	Hx1in6cjSdHMqWCzW5Zsc446l8aE48MFN7vPArGZd2//Qaexkb1UayFIMZYY4WMFRVJdAD8
X-Received: by 2002:a05:6000:2586:b0:48d:f3a4:a6aa with SMTP id ffacd0b85a97d-48df3a4a78cmr10672846f8f.35.1792132515662;
        Thu, 15 Oct 2026 23:35:15 -0700 (PDT)
Message-ID: <c1c7fc9c-d370-4248-9906-46b5fef91b5e@suse.com>
Date: Fri, 16 Oct 2026 08:35:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] SUPPORT.md: State that ATS is unsupported
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20261014135143.34220-1-jason.andryuk@amd.com>
 <20261014135143.34220-3-jason.andryuk@amd.com>
 <d9ae0ea1-912f-4533-b50b-839eda7b5f80@suse.com>
 <960380be-818d-4699-b273-1fd7ebf0d11a@amd.com>
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
In-Reply-To: <960380be-818d-4699-b273-1fd7ebf0d11a@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1792132521-764FC4E9-32E0A431/10/78276251493
X-purgate-type: spam
X-purgate-size: 860

On 15.10.2026 16:33, Jason Andryuk wrote:
> On 2026-10-15 08:33, Jan Beulich wrote:
>> On 14.10.2026 15:51, Jason Andryuk wrote:
>>> --- a/SUPPORT.md
>>> +++ b/SUPPORT.md
>>> @@ -96,6 +96,9 @@ For the Cortex A77 r0p0 - r1p0, see Errata 1508412.
>>>       Status, ARM SMMUv3: Tech Preview
>>>       Status, Renesas IPMMU-VMSA: Supported, not security supported
>>>   
>>> +PCI Address Translation Services (ATS), enabled by the ats= command line
>>> +option, is not security supported.
>>> +
>>>   ### ARM/GICv3
>>>   
>>>   GICv3 is an interrupt controller specification designed by Arm.
>>
>> Wouldn't this better go in the "x86/PCI Device Passthrough" section?
> 
> I guess I thought of ATS as more of an IOMMU feature, but PCI is in the 
> name.  I'm happy to move it.

I wonder what others think; it's certainly not clear cut.

Jan

