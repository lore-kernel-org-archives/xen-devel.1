Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F71C5DF81
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 06:36:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394629.1633306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwZuN-0004UX-5L; Wed, 19 Aug 2026 06:36:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394629.1633306; Wed, 19 Aug 2026 06:36:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwZuN-0004UQ-2R; Wed, 19 Aug 2026 06:36:19 +0000
Received: by outflank-mailman (input) for mailman id 1394629;
 Wed, 19 Aug 2026 06:36:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwZuL-0004UK-J6
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 06:36:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwZuK-004Wsb-5J
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 08:36:16 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a854eca-2eae-0a2a0a5409dd-0a2a4505a6b6-46
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 08:36:16 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a854edf-4cb1-0a2a45050019-d1558034e4c4-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 08:36:15 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4953de5be0aso4699215e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 23:36:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aa0fda98sm56248705e9.1.2026.08.18.23.36.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 23:36:14 -0700 (PDT)
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
        d=suse.com; s=google; t=1787121375; x=1787726175; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NaC35gYbS2pr7tA6g+3JbYO7R+Xiuc2IAZlQ8nbOeqk=;
        b=KEtmB90xiLPRnECStVvj1pgsgut5rUpdlo+2BxYt7Rc6la/A4bfLLkfJfpvYnFGkg2
         11Oy87SXTJ5iuzwOD9yVWYbxhDdtQKBSqx+deFGoIP90PPomhfL4IyyM9tt5fBMFmaHD
         7ZTJQhbVeJbH1AsJOM41kozDxrAEEbb0jqF2ofSt1lDCaLXKSW+7o1lV/FJ8WsrqX7wy
         zqPV4/WKmFaj/lERLMOub6JWbO+0rTZUzHDeiZvMCTSvisjfxMqwbPhfIFdu3n0I5wc8
         SQYY07KsBMbIb8y90Llk6LtDS6bjBnVGtemNiuUD6JQZQ9FXydA1D6IoKzEcUOUy+KHs
         hEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787121375; x=1787726175;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NaC35gYbS2pr7tA6g+3JbYO7R+Xiuc2IAZlQ8nbOeqk=;
        b=RnqTUWDP+VOnMltTHgn3e0rjODQ/InwVcNcUvyRuXrqRR9zEh6+LxyJNAVuYIJ+b4T
         AMu2X5wuV8vTfzE3uF+voxUj7KutllH4wiKYZAvuMgUSKnKpRaOjM2G+RFnRHYujduuT
         1isSeDwlomCOOanz6RPTIsm4E1gBGuI+F9Io6rDKzQADKpWmefvrklZn6e2fTnRb6A9a
         A7oMGUcxaE048ZEv1nlI1qSrZF3FnpUWhh9vapxtgzBFlOCsqsWMtXOlzz6W9qnCJX0B
         mxwuaB+pwAsXlTun3q8a6SfqFb15eeWDyezM008YfiGc9u6LdMLs0x4U1ixe03bO5y7p
         9MVQ==
X-Forwarded-Encrypted: i=1; AHgh+RpFaPnyU6BE62+K3EDfiSOk68ZOSZy6eUvf3/63X78daI6O1W+/ul/NoB1rFsk8XRY5zMyM+ntxxZ8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz4jZcGfVT99bN7x2ijuhfHYx5gAtcrr0oHZ8/VMek+6ZMNt1VK
	clk56l+g3u04d89cdJpHYs9lMYWMbUuIsQlQ+37WbpF/rGTlXj/yPzlUpJsN5vzPAQ==
X-Gm-Gg: AR+sD13zwvTMG8Vj57mnh3pxQ+WM4s1UCkpTcJ6hgo5cnLQsxyHBB5JVO1ChwlcbSp5
	znYc4PbVWUuOJoYMqJPlK+Gn9Nz+o078t3OmXYFXrkAmVLaw5lQBFX2vrnFGh2YPHFeT3AAK+ko
	MoLSUPaGnuOFIsXQ3DkxEx/bdIUmn3BY5783p1ub+XYFl881UY9R4NIR/pJJ651OF84PnTWbq26
	TLLBhTgX7MwU3kGD4R1i2SF5cgc420Bka5tDfcbKIV2UqyBT1t95wrkCLaNKwazaFhS14lzjpeL
	aLTk6WnZAo4HhTPV/MvrhUswkhsTbDEaLvrDWE3bNVnWbSaaBzXm/Rqdz8vUCIxsIq35+3a0bfb
	TafTcnFgjl+Rabdlj/Vi0O80pr6NXWiPf7w8RIIJXwImJiuiUSXTIZj1avIlJsepKvsPEZ4LBOX
	gfQNMl518UxwUQIt/dyKXEjTnSxw2odSrSq5RH/yhroA+5UkIGSonKQD1srGugkHmpwplsP7rxV
	KbcjnjQA5y03I6OC028NAeXZX5rBXKRm9ZpQm65+cEbraB6ShFi
X-Received: by 2002:a05:600c:a05:b0:495:3da3:beb with SMTP id 5b1f17b1804b1-499aa1b6a02mr33406285e9.10.1787121375452;
        Tue, 18 Aug 2026 23:36:15 -0700 (PDT)
Message-ID: <41b21e6f-0049-45f8-afae-8116f09fbf22@suse.com>
Date: Wed, 19 Aug 2026 08:36:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] stubdom: remove pciutils
To: Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20260817071843.114898-1-jgross@suse.com>
 <20260817071843.114898-3-jgross@suse.com> <aoK8zVAP0C0ksD_0@end>
 <2e8b1f56-6447-44c9-9555-4f1b3f0a00e8@suse.com> <aoM4ufGg8QO51XB9@end>
 <e47cf430-dc06-4e9d-9a3b-82ed8c081a70@suse.com> <aoTRPKeD6__D7Qra@end>
Content-Language: en-US
Cc: Juergen Gross <jgross@suse.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
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
In-Reply-To: <aoTRPKeD6__D7Qra@end>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1787121376-251182A1-88EEBE1A/0/0
X-purgate-type: clean
X-purgate-size: 1888

On 18.08.2026 23:40, Samuel Thibault wrote:
> Jan Beulich, le mar. 18 août 2026 08:03:51 +0200, a ecrit:
>> On 17.08.2026 18:37, Samuel Thibault wrote:
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
>>
>> Question is - does this matter in the first place? If someone wanted to
>> drive e.g. a USB device, would we include USB code?
> 
> Why not? I mean, better centralize the maintenance of such code instead
> of possibly several people having to maintain their own USB layer each.

Well, but where would you stop then? We can't provide for everything. And
apart from "everything", "nothing" is the only other clear boundary to
possibly use.

>> I'm with Jürgen that we should have in the upstream tree only what is
>> also used in-tree.
> 
> But then there's probably quite a few things that could be dropped
> from mini-os because the mini-os and xen trees don't use them, e.g.
> the fbfront. But is that really a service to make to people using this
> infrastructure, or planning to?

fbfront is local code of ours, not something we pull in. IOW I don't think
that's valid to use for comparison here.

Jan

