Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A67C624D0
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 09:31:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405433.1638929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1hJG-0008Md-H5; Wed, 02 Sep 2026 09:31:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405433.1638929; Wed, 02 Sep 2026 09:31:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1hJG-0008MV-DH; Wed, 02 Sep 2026 09:31:10 +0000
Received: by outflank-mailman (input) for mailman id 1405433;
 Wed, 02 Sep 2026 09:31:09 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1hJF-0008MP-DW
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 09:31:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1hJE-003WvT-9v
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 11:31:08 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97ecd4-bab6-0a2a0a5309dd-0a2a450ab490-26
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:31:08 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97ecdc-f2d2-0a2a450a0019-d155dd30c1e7-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:31:08 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-47fe89fb333so516577f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 02:31:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448ee9cf7sm5369269f8f.25.2026.09.02.02.31.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 02:31:06 -0700 (PDT)
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
        d=suse.com; s=google; t=1788341467; x=1788946267; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2TIbS1LnBwmiA0UE5OsQTmFbDfQo6/nTKpkl8KS1tRM=;
        b=B9GA3XaKXHunrAAuuLtkxdzPndF9G3H+iMlGmi95Bs6vG+QR+tYdKzzCp11FyPN/C6
         zhtAXg4Y1F/hUXLLqfXcV3yQuY/03kbaXkm6X0fca+ONcn7jkL0GGevLnwUb6FJWow/m
         i4HOWS2BbxSRoKfKUzhjKgz7XcaZ55tnisM6rgfghQRZnOn92eMHEA335slqhwZ+r5+L
         otjOgPf5daY18p1KOpSk9wN2om1BhOXtlJ5lJaTjqmNr0O1vHbks1Fh2YKHO1dKwlEwH
         /xFa5cppXgNCbwhWqqNd82vmsEb8hIyr/JLlprS9RWUWNFEFC3RvpvdSI6+KfpqgRdW9
         BptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788341467; x=1788946267;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2TIbS1LnBwmiA0UE5OsQTmFbDfQo6/nTKpkl8KS1tRM=;
        b=eE2X8k5qL+Sdxg4Z2odRi5Pxaob/9P8TjcX4AZ+hFGO8uEhektzg97THpneiWUO3R9
         sExFjwLq/STpxuePWCv2NDbzKlBeiaYOppkK0X3051j0eg1PcvxEd5HKivVyEPX6kqdM
         B9eWI90vn6a9TDpvEPlDbEPINAwWuL4MpxoAOJnYHvJpiD9uMYw1aKX9MKj7AJ19j3dn
         LfJMPylgoL0p44wN0S4KXpzx6DsGnqiWbHEQwbQHooaJ6lEiDHLxFvM5Ph2rpCYFc9h8
         NqXregBeiMrQ8TYE7KaW73MDvzhb03wwXR2dSU/4kSVVIjRV11zBJM1/z5HQ4uTTaKuo
         XjEg==
X-Gm-Message-State: AFuF++l3JdMTWKTPhWsp/trFUE+AbiXS/Ocefenp3cKqkUb6SXoeOijJ
	m0vtru4mRbJW/AbX97ZebUK1xUxt0+yTmcyhJZCDAfnIfHMrIuecg97arOt4u99rUgyl1OFzdXn
	Umg7RWA==
X-Gm-Gg: AYBFou0Nz4DBUtyPBGK8w7rU+i3a5hKoj6c/EKx88hws0HjF9e4LjmsEo5pwIKr+lK6
	HcsjWuBKOrUNtNxMvwMG8UhYpZ2GihQcVa3xq7C46IzckXJUQvUwLqMDusPPgNvbegVaDvLWZkq
	25ArkVKZ5l3XizElRYXcwNLR33ofP/QSsrCu9ElG/0KkoYwpdtU6t1MGHYycETGyXnzKZv0tM2V
	vwVJdJM5ufMHB+XCTlefEouGhT2KPzHp6PJXakKCFLICh8x0+d/c7DPkrco2hwxJnb0kgRJE3g4
	OCUY6+b2SsI4sg1nNJENFKnH1q3QW3wESYIJp3bNB5OY9xdztsz1YCICc/KA0u7fLRTrgFIbViX
	sxsuyMowwgH92oYQNEOliUbUxNpJPZPPZr23w+3BUkH9KOYBg9N2jpxYEEYoG0F48GNP/N5wl8L
	6A+B+NbXcPl51ylBe9e6hlvSi6RYYFv3gyDm7yQtPmyNx58cPcM2hzrC8+Rs1/DFutO1TtAzy9J
	SyUdxgfwnHrHyfQ/lid6zBUgJRiHDpdXRzUGdtXb7SRFVWWxrIN
X-Received: by 2002:a05:6000:4a0a:b0:484:39b4:5bc9 with SMTP id ffacd0b85a97d-484914cba9amr5683036f8f.26.1788341467515;
        Wed, 02 Sep 2026 02:31:07 -0700 (PDT)
Message-ID: <35013b66-0886-4793-8cb6-3056f6f99a3a@suse.com>
Date: Wed, 2 Sep 2026 11:31:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] x86/time: avoid early uses of NOW() to return zero
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <ec25e838-6bf6-496c-abbe-0fd71e2fb0d9@suse.com>
 <cb8d9a90-64ce-4e86-a188-36a32fe02970@suse.com>
 <apfWTzVihQi5LX9x@macbook.local>
 <1047fb1f-87a3-46b9-ad91-904b05d8a637@suse.com>
 <apfpHXG7wMMwerk7@macbook.local>
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
In-Reply-To: <apfpHXG7wMMwerk7@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1788341468-51AC4CFC-3A152B73/0/0
X-purgate-type: clean
X-purgate-size: 2329

On 02.09.2026 11:15, Roger Pau Monné wrote:
> On Wed, Sep 02, 2026 at 10:40:04AM +0200, Jan Beulich wrote:
>> On 02.09.2026 09:54, Roger Pau Monné wrote:
>>> On Wed, Aug 19, 2026 at 01:45:56PM +0200, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/time.c
>>>> +++ b/xen/arch/x86/time.c
>>>> @@ -1664,6 +1664,9 @@ s_time_t get_s_time_fixed(uint64_t at_ts
>>>>      const struct cpu_time *t = &this_cpu(cpu_time);
>>>>      uint64_t tsc, delta;
>>>>  
>>>> +    /* scale_delta() degenerates when the scale wasn't set yet. */
>>>> +    ASSERT(t->tsc_scale.mul_frac);
>>>> +
>>>>      if ( at_tsc )
>>>>          tsc = at_tsc;
>>>>      else
>>>> @@ -1679,6 +1682,20 @@ s_time_t get_s_time_fixed(uint64_t at_ts
>>>>  
>>>>  s_time_t get_s_time(void)
>>>>  {
>>>> +    /*
>>>> +     * Before the TSC scale is set, avoid returning constant 0 (or whatever
>>>> +     * this_cpu(cpu_time).stamp.local_stime is set to).  While the returned
>>>> +     * value is in no way representing time, it at least increases
>>>> +     * monotonically, thus avoiding e.g. waiting loops to degenerate to
>>>> +     * entirely infinite ones.
>>>> +     */
>>>> +    if ( unlikely(!this_cpu(cpu_time).tsc_scale.mul_frac) )
>>>> +    {
>>>> +        static s_time_t counter;
>>>
>>> Not that it matters much, but counter can probably be __initdata?
>>
>> I wanted to play safe here: In get_s_time_fixed(), release builds won't
>> crash if the assertion wasn't there, but would trigger in a
>> corresponding debug build. In that (unexpected) situation, we'd crash
>> here (when .init.* was unmapped) if __initdata was used.
> 
> That's kind of what I was aiming at: we possibly do want to crash hard
> if Xen is still using the fake counter after initialization?  Nothing
> good can come out of running guests without the TSC scaling being set,
> as the PV clock exposed won't be functional either.  Likely resulting
> in guests relying on it also getting stuck because mul_frac == 0?

Crashing because of too late an .init.data access may require more
analysis than necessary though. I.e. if that was really the intention,
I think it should be a BUG_ON(), and I further think I'd prefer to leave
this to a separate patch (which I would likely ack, but which I'm not
sure I would be willing to write).

Jan

