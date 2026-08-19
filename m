Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75694C5DF6D
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 06:40:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394649.1633323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwZyb-0006YV-Te; Wed, 19 Aug 2026 06:40:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394649.1633323; Wed, 19 Aug 2026 06:40:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwZyb-0006YO-R9; Wed, 19 Aug 2026 06:40:41 +0000
Received: by outflank-mailman (input) for mailman id 1394649;
 Wed, 19 Aug 2026 06:40:40 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwZya-0006YC-0D
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 06:40:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwZyZ-008ITr-DI
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 08:40:39 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a854fd5-e002-0a2a0a5209dd-0a2a4507d166-40
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 08:40:39 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a854fe6-b4ea-0a2a45070019-d155dd2ebd45-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 08:40:39 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-4798bea72f9so316842f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 23:40:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14d0360sm2994641f8f.33.2026.08.18.23.40.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 23:40:38 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Cc:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787121638; x=1787726438; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bk6nB7NQ9tmfzBrQcoOGA1Uhrr6jhusHNKM5pz/OGpc=;
        b=NOFJVtEbvzSZCVVwiyBUrJ2MYKmFwOnpnwPQsSNdaNrtQyICKXR31KCFkCqpBii4OJ
         8drTzSEFsfJ6Ijdl941c3ay2GD/bYAviGlD7BHbbjNS5ppW/P7NMK5RuQb+cLAblwfRA
         qtEMoGlN3kcSvCfYVW6XTxEe4ynSURZTQ9SOJWuADRq9yRn/39r8Pm+/5euGXra86wra
         gSARd1nA8q1HvkJvnfRfn03XTLri7Wca1k2ytBmd2PR4p7ye1Pom187hjHJIRG27dKYf
         UkB2sT3H4gdD+lIRbzgDqFBwwcUGoBEN01tg3vxGX99aENWkN4MQCB/d/gIbnmxjfbL2
         If7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787121638; x=1787726438;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bk6nB7NQ9tmfzBrQcoOGA1Uhrr6jhusHNKM5pz/OGpc=;
        b=CplGSt1tnycfCDGm9QJ/FYP36FFq4qccIDZM8dZ7/7nNugI/f8JufgyejJe/O/1ISa
         wJ8HobST1TTzxIr+lGTtVwGZiyDVjSu98Mk449lSWAH+hf7/BEB9UlgaqfYTcHFQuDU9
         jDyGXSBKPgePa7gqKTyOdMPOwquzKEqE4WFYfzKHcwZq2dLlAhWKbKMfZB4FaNJ9vbI7
         2cMIs5Y1GR3RyFzqqb3Pp86S1O2h/esi7g6eCLapwuLw0Xo5f0zVdOh4uaL/kTrlkHnD
         +piOVceuL/I7/vxH8bY7gDvGF4pig1eRAEYPvROz4N9jKms1Q22pp983VPKcLVNXPojA
         sOvA==
X-Forwarded-Encrypted: i=1; AHgh+RqoxMYxi3ThWg6zYLCNZQozNi4zNhID/CyFoDfiDIfmnmaJiag9TSwbfupNh05cmx3EYgxzEEeA9y0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyILE4tNoWunG7/tL8wpiZ5Gb+UGJg6UkROPPlTchqAZpMi358r
	uiuQ0SKG/Gvfxqijv7hYDOYtnpMidOfgf5AcTWPTkaPpAFY8VETabF0x2cOcdrRu5A==
X-Gm-Gg: AR+sD10MuihLZVJHm/ZEJkJSIdU04ihJeXcSDBsigB1xhI3ptN7Q49ACkL/1kmbe4DU
	aY8zAA2H2Tiq8M15iNWwrXYntHc8nRhZ8czKTQbIrUO+/jxesu9kBG6ookJfkOXExjNWF7fSVT9
	HJrLYVevyt+ebBtRfW1/sQKaj90QoS9Wx5PPnHrJ2CpujQUVYTzPIjWrStKCV7ijw/nR6H7vd8B
	3TBN6OC17SgZNQaZYUyOhWB9Z1f3jFk30d7DivVno9NFNEAlqOvGK+10fLHfN5gHQOJCszrYdqS
	3X6CzrcCp1zqsuAwfFtcZOPgst6DZ7p+tPPXSl9yB99RU8SyO0uCG6fS0dyFKK7Nb+lEWe7BVk3
	BbpXDeARsY3i1APkAF9ueOaUm5Djihtn5gEMXee+sGh8C9lFRx/pSR9gGqq1ouU3LWVONkXemnx
	rJx4he91DRbJQFYiGT+xB/DC8EfsxU5GvqZQevYDkhPAk7uaf+s0LROd7v2TW78v3Z80RvCknmT
	BQHhev69xvnF/ABiDAkS73Hv1CnzGe2tkET3CuNHt08jtJBpOQCH7fb5mILY3Kz
X-Received: by 2002:a05:6000:1a85:b0:47f:77dc:b066 with SMTP id ffacd0b85a97d-482b1e84864mr3107006f8f.5.1787121638562;
        Tue, 18 Aug 2026 23:40:38 -0700 (PDT)
Message-ID: <dbe4d409-37b9-45b9-ae5e-5bedb5df0bb4@suse.com>
Date: Wed, 19 Aug 2026 08:40:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] stubdom: remove pciutils
To: Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20260817071843.114898-1-jgross@suse.com>
 <20260817071843.114898-3-jgross@suse.com> <aoK8zVAP0C0ksD_0@end>
 <2e8b1f56-6447-44c9-9555-4f1b3f0a00e8@suse.com> <aoM4ufGg8QO51XB9@end>
 <4a9b5ae9-b37b-4a6c-8ee0-7e7571c99fb5@suse.com> <aoTRyxN4gzsEwJa5@end>
Content-Language: en-US
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>
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
In-Reply-To: <aoTRyxN4gzsEwJa5@end>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1787121639-342F4AE4-4239CA7D/0/0
X-purgate-type: clean
X-purgate-size: 1794

On 18.08.2026 23:42, Samuel Thibault wrote:
> Jürgen Groß, le mar. 18 août 2026 07:43:34 +0200, a ecrit:
>> On 17.08.26 18:37, Samuel Thibault wrote:
>>> Juergen Gross, le lun. 17 août 2026 10:24:02 +0200, a ecrit:
>>>> On 17.08.26 09:48, Samuel Thibault wrote:
>>>>> Juergen Gross, le lun. 17 août 2026 09:18:41 +0200, a ecrit:
>>>>>> There is no user of libpci left in stubdoms.
>>>>>>
>>>>>> Remove libpci from the stubdom build system.
>>>>>
>>>>> Wouldn't it be useful to keep this for anybody who would want to drive a
>>>>> PCI card from a stubdomain?
>>>>>
>>>>> I mean, in the zlib case, it's really a mere question of build & link,
>>>>> so we don't need to ship it, people can do it themselves easily like for
>>>>> any other library.
>>>>>
>>>>> But here there is actual porting work, that we'd better not lose but
>>>>> keep shipping.
>>>>
>>>> This is all still available via git.
>>>
>>> No, it is not really.
>>>
>>> I keep reading this argument, but people will not know that something
>>> exists in the git history, and will just assume that it does not exist
>>> and has to be written.
>>
>> What about adding a comment to the stubdom Makefile in a separate patch, like:
>>
>> # pciutils support has been removed with commit <commit-id>, revert that patch
>> # in case it is needed again.
>>
>> I think this would be preferable over unused and probably bit-rotten code in
>> the repository.
> 
> I don't see why it would be bit-rotten, since the pciutils version in
> used is fixed,

Which is one of the problems with it. Why are we forcing people to use a long
outdated version?

Jan

> it's a library that has a quite stable API, and the pci
> xen interface is supposed to keep backward compatibility.
> 
> Samuel
> 


