Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE3BC5DF87
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2026 15:18:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1396691.1634431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx4WV-0004X5-Du; Thu, 20 Aug 2026 15:17:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1396691.1634431; Thu, 20 Aug 2026 15:17:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx4WV-0004Wy-9o; Thu, 20 Aug 2026 15:17:43 +0000
Received: by outflank-mailman (input) for mailman id 1396691;
 Thu, 20 Aug 2026 15:17:41 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wx4WT-0004Vf-E1
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 15:17:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wx4WS-006MjR-Qp
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 17:17:40 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a871a92-e002-0a2a0a5209dd-0a2a4507e1ac-8
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 17:17:40 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a871a94-b4ea-0a2a45070019-d155802fc96a-3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 17:17:40 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-493b966dd74so15931185e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 08:17:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aa1755b2sm150805015e9.11.2026.08.20.08.17.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 08:17:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1787239060; x=1787843860; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rl5QcO73K5cmGbV3jP4c1s1CL404p5yxt0emdniJZis=;
        b=eCPos1He0Vl8OKd6r4cuK4zi7Chd45Y0X+G8T59TDk2jfkfJtjHxkoEH4+ibmV8HAf
         Ol0RHZx0ZXhiuLc+ij+S6xMVS2AX3T8YhWIQHo6j8x9evSE7HXdsPAfwQmXk6ov91DWY
         OEN571REklVhZ7PSCmNeHH/eRjUI2qDju7x0d/ppWu4FpG3T8T6OHmGD0Y6DuHakE4gG
         3owwtGYX0AUdfLEYd2sC+4NUY+Sa84vOq4q+RZ3yL80uGHZRMFjZWwYzIegyCRHKGvYK
         MfTIDsk5y6C/QfhmF+jLwprkU2sCTCkyAYpNE1PALkOmaXHFluBb3lj/digbaXS0O3n4
         TOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787239060; x=1787843860;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rl5QcO73K5cmGbV3jP4c1s1CL404p5yxt0emdniJZis=;
        b=VB4IMr8m9OO57L2UowaZNS1ZLhNiyxOi4uM8wwBbbdZb7TKt7CT+ZRN3hWdXFzcQ9v
         u3cZOvX5lWpUpFJiyA8KqU2wM1tB7zEW4tWr10cYpLIOWwTF9FT6zZvZ/ZBfA8egvpT1
         fRd6l+qIX861566pPNJ8IOa2SIh1nNDGxAy138vidPUH3EDYxQns+n6znAypJH8yDw5E
         XUbmtK/cl7HFcxiwayQHjk4sQqtIdd3rFxGbh8kqve9vTjIbOtst7Dis9Ch/DkQn1STy
         Ekmt6a5rWLjVe95P7mTDJx7v15BnSd4GRhJtnf1i8JT+qspoB4snDwppV5sl9AqfEvAR
         Uu0w==
X-Forwarded-Encrypted: i=1; AHgh+Rq1UZ0Ab/k1hb5yK21HDPeAm6z55mahsI74YhJWwCsmysTRO0yFfTJkZq8oAAJbvuDncPmR051U9WY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxlE/dzGuNeW81udaCsyfTfOsg/Tv4CvM8W6eL5V2QTCWo0bOy0
	rEXlrZz4XpeJNbqHBR8ib93ekvzlG4TYd8apDCYrZ46wHaajocESAgwVB6/6q/4dNw==
X-Gm-Gg: AR+sD10nNNBUuWuqiApdI4DVXFhH39Ek31SC95NwVoQpC1qkrS+wqq1hfiUhkJ8vmq/
	EEPloTC1IdzpO2ht11P6Js3DpeC7OiNbrdEoDQROCz6CkkhX2ZmB9sgCZK2EXu0RvBV37rgqCIj
	Sc1Yd3O1lI/6OM5P7Q/L6rURRsqotsbn5YCyiTec5IZQPu/U3v4Rchif2MFaPcvEtv/Hjo9wpzm
	qW1UVw0ddih3/TnnSTaabiQ8aRxOm3ZaW0FaDfwnz0laZoiNQdYDQ490ncyRgI1qhZKWEFpJNj0
	Z8g0IndO5/wSCb8Yoamf5zqkrOJHR3GWSh30PecZLwLoIBy5re6wikFBRRsgXq52rFJyj25bMwr
	DEhE3UOMCChA5YzaH4s+MO2G5MLb6tdC0pvX+56TijHXWI4XoZ6jtZEpF4XY0XgP960NAordVwi
	uISoggQTXmkjLQK2XiBLwGRJ7aSfQzMgevjcZhXVHwjZZLbTd3HeHBe+F6ayR+Lov3ywV/txgJG
	xmQVSu5RpFLVxfAftOx7J+EVCeg/kqK1Rjn27l7uoSlZwozsLWU
X-Received: by 2002:a05:600c:1908:b0:499:5210:c537 with SMTP id 5b1f17b1804b1-499aa17d6d8mr215467635e9.1.1787239060097;
        Thu, 20 Aug 2026 08:17:40 -0700 (PDT)
Message-ID: <42521391-885c-4b96-96e9-5da2e4b5efa1@suse.com>
Date: Thu, 20 Aug 2026 17:17:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools/hvmloader: implement Intel IGD extended VBT
 support
To: Chuck Zmudzinski <brchuckz@aol.com>
Cc: qemu-devel@nongnu.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, Tomita Moeko <tomitamoeko@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <20260802050824.10554-1-brchuckz.ref@aol.com>
 <67579eba-e222-41dd-84bf-8440d2eaf2a9@netscape.net>
 <da2200cd-def7-4cce-a6c2-9f9ac9e202ce@suse.com>
 <de56c8bd-f0e8-4fe9-8cf5-f6807698176c@aol.com>
 <02a7dc18-4184-4e86-84cb-121769187f71@suse.com>
 <1858e8e6-73fa-4017-93e2-c733fbf0ec8d@aol.com>
 <d6e603bf-8dc5-4ac7-842f-ff9d1f67b98f@suse.com>
 <fdec0b6b-eddf-4a36-a755-c67963daa9ea@aol.com>
 <6ecf80ef-2f0e-44fb-beab-dbcf065a4431@suse.com>
 <bb44067c-6739-4e83-a0fd-cc7ea797048f@aol.com>
 <4c58bda6-e9ed-438d-b96e-feda74a6c4c7@suse.com>
 <31a5870f-2a4d-4dc0-af9c-f0567e0f6fb3@aol.com>
 <db8fd04d-bbc7-41c7-8473-b821d7f77d5f@aol.com>
 <302ed12f-40ca-405c-80ca-ac4f2785d754@suse.com>
 <cdae1785-4d9a-4aab-929e-de55c26b7b94@aol.com>
 <10cd9f6b-678b-407b-a51e-70e9ed7a35fd@aol.com>
 <131b1252-b108-4b4c-8457-673ff0d20d5e@suse.com>
 <b14969c8-9676-404e-b7cc-ce13a6d7ff94@aol.com>
 <92022f85-9a53-4db8-b489-fc91c86b413c@suse.com>
 <fa497825-c8f0-4caf-94f5-b37108e31952@aol.com>
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
In-Reply-To: <fa497825-c8f0-4caf-94f5-b37108e31952@aol.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1787239060-A4AC8AE4-69D3739C/0/0
X-purgate-type: clean
X-purgate-size: 3099

On 20.08.2026 13:47, Chuck Zmudzinski wrote:
> On 8/20/2026 3:51 AM, Jan Beulich wrote:
>> On 19.08.2026 19:13, Chuck Zmudzinski wrote:
>>> On 8/19/2026 9:51 AM, Jan Beulich wrote:
>>>> On 19.08.2026 14:36, Chuck Zmudzinski wrote:
>>>>> On 8/19/2026 8:16 AM, Chuck Zmudzinski wrote:
>>>>>> Yes, I agree that v3 of the patch to hvmloader should presume that the DM can get
>>>>>> a copy of the OpRegion and read its contents so most of this can be done in the
>>>>>> DM instead of in hvmloader. So from hvmloader's perspective, the patch will be more
>>>>>> about avoiding the layering violation than anything else.
>>>>>
>>>>> However, there is one advantage, from the viewpoint of the Xen virtualization platform
>>>>> as a whole, to do the patching of the OpRegion in hvmloader instead of in the DM.
>>>>>
>>>>> If we patch the OpRegion in hvmloader as v2 of this patch does, we provide a common
>>>>> solution for extended VBT support for Intel IGD devices that would be compatible with
>>>>> all DM implementations, not just with Qemu. So why not do the patching of the OpRegion
>>>>> in hvmloader?
>>>>
>>>> As indicated before: If the OpRegion holds data that is needed to drive the
>>>> device, and if the OpRegion is exposed writable to guests, then guest can
>>>> screw up that data such that subsequent guests won't work anymore. Hence
>>>> exposing to guests (which includes hvmloader) needs to be stopped, or at
>>>> least be limited to r/o. That, in fact, includes exposing to any privilege-
>>>> restricted DM as well.
>>>>
>>>> Exposing r/o may be entirely okay (i.e. may not be a layering violation),
>>>> depending how exactly an OpRegion surfaces for a device (on the host). Aiui
>>>> it's not addressed by any of the BARs, yet it looks like it needs similar
>>>> treatment.
>>>
>>> Yes, the OpRegion is not one of the BARs as specified by the PCI specs, but
>>> it functions more or less like a BAR region with the devices's ASLS register
>>> at offset 0xfc in the PCI device config space of the device acting like the
>>> BAR for that region.
>>
>> That is, on real hardware a write to that register moves the OpRegion? That
>> would need following by the DM then, i.e. the DM would need to indicate the
>> original position in the register, and the guest (incl hvmloader) would
>> then be free to relocate it.
> 
> Why would that "need following by the DM" when the register in the guest is
> fully emulated, [1] which means that when the guest (incl hvmloader) writes to the
> register, the register on the real hardware is not touched, nor is the OpRegion
> in the host address space moved?

You said it's BAR-like. If the guest writes to a BAR, the referenced MMIO
region moves accordingly.

> Here is how I understand how this works in the current implementation and how
> this should be done:

I'm sorry, but this is getting out of hand, at least as far as I'm concerned.
I've been trying to help, but even just reading your replies has already been
taking way more time than I would have wanted to spend here.

Jan

