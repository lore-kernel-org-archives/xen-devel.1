Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8328CA5FBA
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 10:32:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437013.1655701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBrbP-0006HE-Un; Wed, 30 Sep 2026 10:31:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437013.1655701; Wed, 30 Sep 2026 10:31:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBrbP-0006H6-S9; Wed, 30 Sep 2026 10:31:55 +0000
Received: by outflank-mailman (input) for mailman id 1437013;
 Wed, 30 Sep 2026 10:31:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBrbO-0006Gy-CM
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 10:31:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBrbN-005yzy-PC
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 12:31:53 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abce50c-e002-0a2a0a5209dd-0a2a4509ae78-40
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 12:31:53 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abce519-be1a-0a2a45090019-4a7de18ca1ca-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 12:31:53 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b912d3920so38730375e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 03:31:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b02a0dd0dsm2185537f8f.35.2026.09.30.03.31.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 03:31:52 -0700 (PDT)
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
        d=suse.com; s=google; t=1790764313; x=1791369113; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9VbclFBunZbOqyEL79Qu1r+gVxjSWvNCspus6ReQ0r8=;
        b=aa8LDI6J793k7SrVxVpNRqjTMnjgy17OYWNKrQZD5EffEJC4+Wd2t619o1pQZSxPCd
         bs5gvxAPneA2svCgGOkUtQ8f5mtyA0olIYHIBMaT+dOEe8OYoIDFA2ybK/4I72QgmCNE
         SApTJYR7tgdA9XRQqE50llvk3C+jY7byJTfrL6mdni5KAxaFLuf226QfU09FMxQfQ38X
         +8FQdVvS6hzHWVT6mt6w9ZQ+M904CO7MSeXffWeluI7Qw7n9jFEtIv0jhnq58SKiYRwg
         NJ5aBIOls5xKBeV1HS1JayZMv+qipA+rlPmpnYff9N/rYv4dT5bweAj7sCD9XpUEWmwb
         eXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790764313; x=1791369113;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9VbclFBunZbOqyEL79Qu1r+gVxjSWvNCspus6ReQ0r8=;
        b=YXOVQlBlwtwjMc2PqJZVa2nRxhscmFrEz9sI0vreqnCjuGv164xVMSaWVTNnaOv44o
         r3RsDgTr3bg9Fo7mfOQNFDeuZWM/1mUo2tBty5gRDC1uS1WLI8ZuB5nET6i3jXdzN++i
         IoDHCtswGlLkSUoJJrWz1DiwZgBwLWQXDhWx1RyliyPr32DSQAxVLWOGJ6/OoL3krI6q
         mY1TDxMFpLBXMb8xCmlNvI/eGxvH3+LXlDcqdXjjAsTpdcnUfVZbuHb6YU0IQvMUfueG
         vw9HUTbGxgKhnRi2IfiQFLFDa+EHo5e7w4LJQYfysdeQa6keNSW/4U//kZ1l5CW3rDZE
         p86w==
X-Forwarded-Encrypted: i=1; AKwUvBy8g2SF7NrD4Sw9OWC0ZLxlV+KRt5jX+tmZirolWxTsg7HOK2X3lzlHpX1EG9OEdRGNWNk+hDPIoMM=@lists.xenproject.org
X-Gm-Message-State: AFuF++lD+7ixQTRwkCjhKddDEMEubcvnmdnDJf92P9tO4l/6ciwzYd59
	xJ9EGU1czJM0zyLOYuYA3MM8sPh/9KvP52WW/gSTs+5jOY4Wik0oV92u9bDxRxzB3g==
X-Gm-Gg: AYBFou3slCB8S3sb4PtOyuecp2wd7WZX07FX7vnop5adEEP47sT1lYct/PA4O5Kz/qK
	X4GEnr8XVl3GbZp9/qMKQXpt5NWfq/K8ni+NogJkwy6wlrZo2Y0Q5lbS7Ic3h1KkhC2yAhTETdB
	HELoyNrsQWjGA9Mtnrp66YyESKfKV7VV4GWIEio18eoBCstpZgTTZ4Jh3QW8A9K9c4BbyXGPtFK
	MNM7eqyWi4QJy/jTMzfjGWipPuv8XmRX/l3zpicSMoF3ZiN0KhkKDfkXfR4VceXBnZGmgTn4VI5
	Lx9x1bbBX1n74/TQfeqT2RIbIfaaTQi6eYw08r3we1QHlpec+Z1WSOpX4kCke0f5GnUukPfkc2A
	5nd3wC8+zY/+8l4qsfgbVLb6w4g/V/W/PuGh41GXtvI2REcRumypH+33pkKE7t5u1VboKR6MX51
	0+Ql+YeLCpP4EC23Gs0QoGFmg+W6TnrFjUJ0hF1k5Fg53jaYMHi5e4fV90ntq3foy4mgObUrmhy
	sw4UPNxC6DcXzACog/sBS/Mg7qlKC02AD76lJjrBdGnpTmyLM7I6LsiL2rIBg==
X-Received: by 2002:a05:600c:83c3:b0:49c:edd8:ba35 with SMTP id 5b1f17b1804b1-4a01aff3c4emr16671425e9.6.1790764313113;
        Wed, 30 Sep 2026 03:31:53 -0700 (PDT)
Message-ID: <6b39876f-bc9d-428d-ae5a-d24f80ef2677@suse.com>
Date: Wed, 30 Sep 2026 12:31:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] xen/rcu: introduce the concept of RCU epoch
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20260925163025.65217-1-roger@xenproject.org>
 <20260925163025.65217-2-roger@xenproject.org>
 <DLQSZY2KSYDH.1YSCWGQIQYP0H@amd.com> <arvJQSDecSSAU1WC@macbook.local>
 <50d1df6c-d969-470b-9b40-ca171c60618d@suse.com>
 <DLS5A4YDJ8ET.28ZIPQ6QEN2K4@amd.com>
 <3e600ac0-3096-4cfb-967b-c6d87d8c04e6@suse.com>
 <arzDzQMP5rGz1-QJ@macbook.local>
 <3e2b41a5-5c85-4a6a-8f91-c2b979f87b86@suse.com>
 <arzfW8dQgcfISTWE@macbook.local>
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
In-Reply-To: <arzfW8dQgcfISTWE@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1790764313-3A6DA034-DC17877A/10/78276251493
X-purgate-type: spam
X-purgate-size: 3348

On 30.09.2026 12:07, Roger Pau Monné wrote:
> On Wed, Sep 30, 2026 at 10:34:02AM +0200, Jan Beulich wrote:
>> On 30.09.2026 10:09, Roger Pau Monné wrote:
>>> On Wed, Sep 30, 2026 at 07:58:55AM +0200, Jan Beulich wrote:
>>>> On 30.09.2026 00:14, Alejandro Vallejo wrote:
>>>>> On Tue Sep 29, 2026 at 4:52 PM CEST, Jan Beulich wrote:
>>>>>> On 29.09.2026 16:20, Roger Pau Monné wrote:
>>>>>>> On Mon, Sep 28, 2026 at 10:24:04AM +0200, Alejandro Vallejo wrote:
>>>>>>>> On Fri Sep 25, 2026 at 6:30 PM CEST, Roger Pau Monne wrote:
>>>>>>>>> +    ACCESS_ONCE(this_cpu(rcu_lock_cnt))--;
>>>>>>>>
>>>>>>>> ... this variable is to be read by remote CPUs and autodecrement seems
>>>>>>>> like the wrong tool for an atomic decrement.
>>>>>>>
>>>>>>> I can use {read,write}_atomic() instead, but there's been a tendency
>>>>>>> to phase out the usage of those functions.  On x86 this should be a
>>>>>>> plain `addl` or `subl` instruction (the non-locked version of
>>>>>>> atomic_{inc,dec}()).
>>>>>
>>>>> I don't think the compiler can merge volatile reads and writes. It can
>>>>> shatter them (thus my fear), but they are meant to be distinct because
>>>>> each might have different side effects. Jan already mentioned this in
>>>>> other words.
>>>>>
>>>>> You don't need an atomic decrement though, just an atomic write. Note
>>>>> IRQs restore it on exit and other CPUs don't write to it.
>>>>>
>>>>>   unsigned int *lock_cnt = &this_cpu(rcu_lock_cnt);
>>>>>   write_atomic(lock_cnt, *lock_cnt - 1);
>>>>>
>>>>> and this yields a plain mov, through a static inline stub (plus the
>>>>> mov from the read access + dec)
>>>>>
>>>>> The problem with ACCESS_ONCE() is that the write isn't guaranteed to be
>>>>> atomic.
>>>>
>>>> It may not be properly written down anywhere, but at least the compilers
>>>> we use are known to not tear aligned accesses up to a machine word in
>>>> width.
>>>
>>> Then I possibly don't need the ACCESS_ONCE() at all, as I was using it
>>> to guarantee unshattered accesses.  However this should be written
>>> somewhere, maybe in docs/process/coding-best-practices.pandoc?
>>
>> To write it down in any of our docs, we'd first need a proper reference
>> to somewhere. "Known to" isn't quite sufficient imo to actually nail
>> things down.
> 
> Fair enough, I also assume compilers would never like to write
> this down anywhere in the documentation.
> 
>> There's still the possibility of compiler bugs,
> 
> Compiler bugs could apply to anything that a compiler generates, and
> hence is not likely relevant to mention for each compiler feature or
> behavior we rely upon.
> 
>> and there's
>> also the possibility that volatile accesses have better guarantees than
>> non-volatile ones. (Recall that in prior discussions it was actually said
>> that we may need to make far more use of ACCESS_ONCE(), which wouldn't be
>> warranted if collectively we were certain aligned accesses cannot be
>> torn.)
> 
> OK, so are we in agreement that ACCESS_ONCE(this_cpu(rcu_lock_cnt))--
> ensures accesses to the variable are always non-torn?

Yes, to the best of our knowledge.

>  Splitting
> the access as a RMW is fine, as long as the accesses are not torn.

Oh, okay. Then the earlier reference to atomic_{inc,dec}() was somewhat
misleading.

Jan

