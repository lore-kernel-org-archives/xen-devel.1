Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62093C53200
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 08:57:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375361.1622520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp06G-0000Qu-GZ; Wed, 29 Jul 2026 08:57:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375361.1622520; Wed, 29 Jul 2026 08:57:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp06G-0000Qn-D7; Wed, 29 Jul 2026 08:57:16 +0000
Received: by outflank-mailman (input) for mailman id 1375361;
 Wed, 29 Jul 2026 08:57:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wp06E-0000Qh-T5
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 08:57:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp06D-00Dh8D-Tw
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 10:57:13 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a69c05f-5cb7-0a2a0a5109dd-0a2a450adcb0-26
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 10:57:13 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a69c069-f2d2-0a2a450a0019-d155dd29d8ec-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 10:57:13 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-47f97d310caso641768f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 01:57:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fb6b0f039sm6500319f8f.18.2026.07.29.01.57.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2026 01:57:12 -0700 (PDT)
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
        d=suse.com; s=google; t=1785315433; x=1785920233; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Epn33SfVICC1P+Qrb4Z3SC4fTXuuj32gBmatH2To1hg=;
        b=Jqg2mpybyFAYUX9K1x0ow0g5vcRRM9mcIiM7MVzzZ+G3h1G8SRvlj+wX2uZS9m9R3b
         4WI0ftvC24c+5c7n6HIqmv0jzR+4/7H5LTk6cS9+lC9mF3B8/iGoziSGlEeJo2A/SAMU
         wXjKOSYyQt5SFfLEo2xqDl9n1/6yxqKvfoW9oPt1EJtY2RGMxnHGkTvVVBlGEr0t8GB1
         LCj2lCajIxwwSD1cvtnNGrqmDS7gG5AhJnPLvbSakbT/GkvhuZ1cZbl4SnIdQHQv9Tom
         x5AN8+XtTUmTqrsICrMnfYInX/4g0TyaXtca9WpQtWqSnILyty7KNKQ9t0pJvXM6KOSa
         jW/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785315433; x=1785920233;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Epn33SfVICC1P+Qrb4Z3SC4fTXuuj32gBmatH2To1hg=;
        b=m+axmiLpjs3c/jO27GDf2ssbNcv30zVEMDvwHtmCeo/Ba28Of55hekA1CKGIwD9trE
         TLwATuAzTuY7/cjB1QZQcNMu1vZSGLimGiczVNB6fB23fY2criOCv0VoWD1ROw38CDi8
         VabnW5i9ZUauiU5JxxbriFJClyf6nVR9eUzZuUGq/m7Nf5yMSgskx+Lm6bR84gUY2/AF
         1lVWn4uyoUK4Id1VR61KSzjPILcKsvo/Hlbhx5nxeBYSI+V38blpPwrK6LceADptOIkN
         cIrXsAA7pBgDbAMyce/RZQc9EWC57TBvD84GtJcxdyccMxA9Gn48rfoFxF85k82qvyDs
         e0MA==
X-Gm-Message-State: AOJu0YzU4SS4T9iatrL9Q9qyODUSDAKruAdzPZfKAu5AydBC867EKHVv
	/dtfAJ2LxfDl5uxTl0xjROvH3MEV+MSiJyIai0SxG+gisN2abcpXS2BweVBFlcdG/w==
X-Gm-Gg: AR+sD11egX3VYwnS/+0JsqgR4Yqfg4YMcGUm7xEDWi9198fgyagHVf4ALqoVCqc9ynK
	hI4Kr/m68IX10JJLOdEh0QX78NFvbxV9iZcDZXemOostEeFUof7PiVxHKsm/p+GWlkLyiLSwERG
	XqIolJyrsY/1HTiqmHyfJUnvCqvav2dNklT8Wg3Xo7LuKkoJlNG67QieTrqm9XeX/3teK2w09fL
	ROd5pLHhsm0S5nAQlHV8TMr1gf1lWdCIsxZEIGAe+Enov/Rcf9aQtgubQj0s67PatQCy9p4fvjS
	/+ofmkuLaY7y+A266kRBWyZRi4g0SDfJecdo+sFTp0XljTs2MHYKkAEM4OmnT/jwyiscETxNoUR
	f1dz9DFqIBMzv6u9484Ep466IR0FNWMZXNdnemmyJV5ImxpRo90XcWsCkyv9bGexdKPVUbhkTs2
	J2k+rHPM+bJ8JkkkiWrQuthC95jXyNmk+U49jj/76EE7CDQ2bFSZ3tUd5nROwhfytOLE4PvMyES
	cdgvV1qsC1/5rT162bVEdCzTVDyexKn8EJe6f/pHsmGANZjZbJh
X-Received: by 2002:a05:6000:18a4:b0:47f:9241:12b0 with SMTP id ffacd0b85a97d-47fb1edc968mr6420570f8f.50.1785315433177;
        Wed, 29 Jul 2026 01:57:13 -0700 (PDT)
Message-ID: <bb549739-bbac-4f85-b474-3a4b9f2b282a@suse.com>
Date: Wed, 29 Jul 2026 10:57:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] time: add "NOW() good" indicator
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <f5040939-b166-4050-9a27-117b772547d4@suse.com>
 <b7513795-9e4b-4358-9d46-6c7036d64b81@suse.com>
 <amhlnWAwF-AS_sH7@macbook.local>
 <baddc2f7-deab-4727-a688-a6fe30f7fb89@suse.com>
 <amiFV3IWZUoaT57V@macbook.local>
 <fff1460b-7ec7-44f0-9772-35fb5bc87cb9@suse.com>
 <amm95OSsZ-qfdypo@macbook.local>
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
In-Reply-To: <amm95OSsZ-qfdypo@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1785315433-50CCBCFC-A56F712B/0/0
X-purgate-type: clean
X-purgate-size: 1798

On 29.07.2026 10:46, Roger Pau Monné wrote:
> On Tue, Jul 28, 2026 at 01:37:15PM +0200, Jan Beulich wrote:
>> On 28.07.2026 12:32, Roger Pau Monné wrote:
>>> On Tue, Jul 28, 2026 at 10:24:38AM +0200, Jan Beulich wrote:
>>>> On 28.07.2026 10:17, Roger Pau Monné wrote:
>>>>> On Tue, Jun 30, 2026 at 04:06:00PM +0200, Jan Beulich wrote:
>>>>>> --- a/xen/arch/x86/time.c
>>>>>> +++ b/xen/arch/x86/time.c
>>>>>> @@ -2660,6 +2660,7 @@ void __init early_time_init(void)
>>>>>>  
>>>>>>      set_time_scale(&t->tsc_scale, tmp);
>>>>>>      t->stamp.local_tsc = boot_tsc_stamp;
>>>>>> +    NOW_good = true;
>>>>>
>>>>> Would you need a barrier here to ensure compiler doesn't re-order the
>>>>> writes?  Maybe using ACCESS_ONCE(), or a smp_wmb() like it's used in
>>>>> other arches?
>>>>
>>>> Aiui it isn't needed here. The compiler can't re-order the two writes,
>>>> due to our use of -fno-strict-aliasing. The barrier is there on other
>>>> arch-es to avoid re-ordering in hardware.
>>>
>>> You are the expert in compilers, but it was my understanding that
>>> `no-strict-aliasing` only affects the ordering of pointers accesses,
>>> but not plain variables.  IOW: NOW_good accesses could be reordered
>>> because it's not a pointer.  Does the compiler consider t can point to
>>> &NOW_good and hence it can't be reordered?
>>
>> Yes, that's my understanding of how this work. (Yet no, "expert" surely
>> is going too far.) Things would be different if NOW_good was a function-
>> local variable, I think.
> 
> OK, I wouldn't mind adding a compiler barrier to say on the safe side,
> but I also won't object if you think that's enough.

Okay, I've added one in, even if it feels a little odd.

> Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks, Jan

