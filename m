Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E35606A320
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 07:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=E8IcO8HU
Received: from list by lists.xenproject.org with outflank-mailman.1495848.1694564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTwTT-0003jG-Rm; Thu, 19 Nov 2026 07:22:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1495848.1694564; Thu, 19 Nov 2026 07:22:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTwTT-0003j9-Ow; Thu, 19 Nov 2026 07:22:27 +0000
Received: by outflank-mailman (input) for mailman id 1495848;
 Thu, 19 Nov 2026 07:22:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTwTS-0003j3-G9
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 07:22:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTwTR-000iZP-So
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 08:22:25 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afea3a8-bab6-0a2a0a5309dd-0a2a45068f18-20
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 08:22:25 +0100
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afea3b1-195a-0a2a45060019-d155802bb199-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 08:22:25 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4a2153c8525so13764415e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 23:22:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb84e06c73sm29687455e9.2.2026.11.18.23.22.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 23:22:24 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795072945; x=1795677745; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r1eIy+NHtZIsWz7+UBIgmQF6oGn5DoW1vVEdIRlsKFk=;
        b=E8IcO8HU02k/b9lSl5eS5Tm2H6J8mngjATIKliL+WUmcB8JWhQqaq3ZZhSJomYpvBh
         xYSwFBcR7fEELiLGxbfd5XWDLeKbKMSGllNSi26hZfO/7fY/1UAX1Py+a4aVEWCtsgQU
         ZtENEf/3c4RPtrWJB6/MIWyMD0oWVaBZJinOjrAEFB8pInuXCdVPW/TeVJYPo5wzqThT
         cTppL28d0/CvrD/tPnz0yh81dMI/f3m8Qc06AOH6tRnP6xk0xqS93iCboOBB2TEIab5Z
         Fbk31foCWi39uL+pwVrsH2uH0iqmjUVj8Up7Mv82zZqum7ujzYgA7HX5tkLaEReojH63
         BcHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795072945; x=1795677745;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1eIy+NHtZIsWz7+UBIgmQF6oGn5DoW1vVEdIRlsKFk=;
        b=J6rtWGyOg7oZocNbRYwInHwhLSzYN52s+ct26NP7/BZviR/MFiF76GFV1d4vfvCZaR
         MG3R3N6ZCFoKXkBkQGtBpqybqY5zM+ilRM/cOSI4TFTsG8NkpszYFGGk9ufh6VcBbvgK
         ftWzCDJ0LcCammcArO0fCs1AANW6iDxvrG6veGeN8t/gQSThMTWI4xc0R61Ij+ExBoNu
         /KIHz9yadZLPMOtCqWNO/Pn/KsQlG2MkVfJxJuA3gOBefl3L8JMp60w5e1DcHslTEXhn
         0YtCReN7yXuq/E+02hS+BQjByyjm4gsQ7xO+WmnIeBGwcH0XHJGX4vlMie1kX5gT2/N7
         vgPw==
X-Forwarded-Encrypted: i=1; AL+hErFqp98gEAWUFlAquXHRFIcfU3IjG8OHw1RYNR7Nnp0S7sT9MSgrZNpHkZO3dwi8MG5iFekh3Qk2apo=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+T5JKYeYAnlCnlMvnD+1EpQKjWdZHWgfVn2tkUASfyDHai9wjp
	ToblCtRVRihWSzysVYYCbJfiyn0gK9DEciqbY+0Eq2TwN5LUXOsDBA25qv8ax3RO8g==
X-Gm-Gg: AYBFou3sVas/sp6Z+Was85eU4F3rABBEAyYsHp9zDjCWop9VA9R1HjZOYUdKkztTote
	W/z4ChVcFPTxhO6zL9KEgAgDYtjhB+rz2gEH+OOF3lOHUNoSnfXOfMVgtUx/MK03raDrFYcv3WN
	EW8kc+YfviuK2WWU0WDPeqrg/nDKzIgZ6X3Uwm+cZoJKzu4yrYU48Xmsd5CMT/nfeNvxX4NzZpv
	y9cId74wNPYW2yy5Bv87AjA+2eoj1BMjxiD5+QYYKABqIC9qlzdVdPpaznRr2VlLcvY1C5vs9aX
	21THIKw9m46O/HBmfhn81xm8InuHEUdLBnt8k2eyLIJYkr35F423t6udXPYl+Ha+xnr3ylEzs0O
	LjVD1ppA4sDZexS4QqylQeA4SxMl6DXjU1XKV30oVLNfS3F4EIRZ1xdFHensNvHFY5qibfEHoRZ
	bvSLFdgryD7Y245d2zUu7KvpMSM5Asfk5TNMfEMLQdK+M5FVcoPpwyrH2Ugt5RlOnJRJVAWg3sB
	VxWMudKH6lnnVw/5ChWQ3N6TGZQgkaEZxOtufGKQqYd/FwaiEqVMDOkrAfTp4O5hlNstdmMB0o1
	qCBo4QwgEHlhQHa07I+o26FbpyOocmfvyAYb1tSu4UDZu9vFgTJzr+FuGPvCRHaRDSZ9roN3ENC
	aEZBgSUFJevuHxlbXvi61dDP3VupgQMvvB7urbA==
X-Received: by 2002:a05:600c:501f:b0:4bb:6f67:ca0b with SMTP id 5b1f17b1804b1-4bb7da462b2mr98834665e9.29.1795072945190;
        Wed, 18 Nov 2026 23:22:25 -0800 (PST)
Message-ID: <52ab0088-441b-4b9c-a268-462ebd827081@suse.com>
Date: Thu, 19 Nov 2026 08:22:23 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: deviate MISRA R11.8 for capability enable
 callbacks
To: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <74ce8a8150674591c2b0daa672f8e2e00b2a1201.1794950154.git.dmytro_prokopchuk1@epam.com>
 <3d675e31-a31d-4c93-952f-72280dd2f7db@suse.com>
 <2ec208a3-8cb3-4769-a268-46351e22cb11@epam.com>
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
In-Reply-To: <2ec208a3-8cb3-4769-a268-46351e22cb11@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1795072945-F78CB77B-3FFBCD43/10/78276251493
X-purgate-type: spam
X-purgate-size: 1601
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 18.11.2026 21:28, Dmytro Prokopchuk wrote:
> 
> 
> On 11/18/26 09:41, Jan Beulich wrote:
>> On 17.11.2026 22:31, Dmytro Prokopchuk1 wrote:
>>> --- a/docs/misra/safe.json
>>> +++ b/docs/misra/safe.json
>>> @@ -124,6 +124,14 @@
>>>           },
>>>           {
>>>               "id": "SAF-15-safe",
>>> +            "analyser": {
>>> +                "eclair": "MC3A2.R11.8"
>>> +            },
>>> +            "name": "Rule 11.8: cast const capabilities to void * for enable callback",
>>> +            "text": "The Arm CPU capability enable callback takes void * to match the generic callback convention. The cast removes const only to pass a const struct arm_cpu_capabilities * into that signature. Existing enable implementations treat the pointer as const and do not modify the object."
>>> +        },
>>
>> Do we really want to restrict this to Arm CPU cap handling? The same pattern
>> could easily arise elsewhere.
> 
> Hmm, good point.
> 
> Well, the deviation could be generalized to this:
> 
> name: Rule 11.8: cast const pointer to void * for a callback
> 
> text: Generic callbacks take void * by convention. Casting a 
> const-qualified pointer to void * only to pass it into such a signature 
> is safe when the callback implementation treat the pointer as const and 
> do not modify the object.
> 
> If such wording is OK for maintainers, I can prepare v2.

Sounds largely okay to me. (I'm not quite sure whether "generic" is an
appropriate description here. I'd likely use "Callbacks often have void *
parameters, to be type-generic.")

Jan

