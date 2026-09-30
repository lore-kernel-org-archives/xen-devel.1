Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3D3CA5FC1
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 08:34:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436927.1655606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBplT-0002Sh-2Z; Wed, 30 Sep 2026 08:34:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436927.1655606; Wed, 30 Sep 2026 08:34:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBplS-0002Sa-Va; Wed, 30 Sep 2026 08:34:10 +0000
Received: by outflank-mailman (input) for mailman id 1436927;
 Wed, 30 Sep 2026 08:34:09 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBplR-0002SS-Js
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 08:34:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBplR-00AGIk-04
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 10:34:09 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abcc974-8faa-0a2a0a5109dd-0a2a4503c0c4-36
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 10:34:04 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abcc97b-fae8-0a2a45030019-4a7de18cd0a0-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 10:34:04 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b912d8239so41109545e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 01:34:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01751693bsm38661945e9.5.2026.09.30.01.34.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 01:34:03 -0700 (PDT)
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
        d=suse.com; s=google; t=1790757243; x=1791362043; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ua74aYhrEbxV8JEoEvm+m2U8cDsQnkbJti3U8i4aieA=;
        b=PyCPNezQapoztPjv2qFZ9dNE0OfPM1HHWF45tjI+Smo+ZIyRESn4aoPUDcWNNTFb0T
         uooIDdSIByKSbxdWc5A6NTM/yIKycONvpkt5+3INT1iup8QxSWqvrp7l6VkZRzdEWvKj
         hWoBdjqDpQsUXi7UlyCASdRMawS3tZqgfv760J7347OttfM6NXCV+SsfKuD6HWJbW+Bn
         BcffJu6yXUY3UkeiPcSFXamqEZTQteBtSP533gHg9EKPKY+yHscbURrNOAlNIndW4pXr
         qFC1ufUIJgQAg9fnYp5A+krHtUmCgbcDWaninL+aSAiugrYeLWdy8nO9e/aNOEEQu8iM
         MfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790757243; x=1791362043;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ua74aYhrEbxV8JEoEvm+m2U8cDsQnkbJti3U8i4aieA=;
        b=j+hOiR7/iAVjHjX/vJEC+bePvKTqCpiUdb63LXfBbrBmN1hbuBLDi1h/vyr8wQ2AZB
         f+8WSpIG16Qq2N7BZNxThktQbNnVt1aptf9dPdty2XwT8P73EeYbe9YyrJ7UjsYwlurk
         amkCJZ724KzWXBvt1dH/Gf4ieojFcjfe+vj7wOWzFfQty5A18+LmpoPfdYazapy7NqRO
         IYeiyr6IeL8FeaceP0J5pGbO7bEGqEqrrNeA9Gatzyf5wf7R3bnSW6N8O0sIqsCgpo8n
         X6m2WFfyKIRJ2Iz7bmtBJ/c1MrcJFfHe1qXuuXtZglRWYDmDfhDfsbJGmknJCyH9AQlB
         WrXA==
X-Forwarded-Encrypted: i=1; AKwUvBz5uv/l4Nm3W3BRNRyloPILmQiKYGjwm3+lz6LNZws0yLSh9BQcSWVZes4+ICQxr5TI8k9/iEJrrKc=@lists.xenproject.org
X-Gm-Message-State: AFuF++ncqVgQJrTrPMj5dy4J/QajStsV1hTfDrVhcnV4qzxpQjQlVgff
	Yvu9x6RewcJxVvoz2E/eEW4MkHIXxJkR8cPOdquhw0kiULSnJksplsn29/PVa3ZBLw==
X-Gm-Gg: AYBFou17On2jjgIDuf9k9qnsHAZhJx6ycGwewcUM+dt4RURWi01jjd8PkAdqkK2Pznu
	7u1aGXwxwoJbc5w+3NY2km2vyNzSdEnXZG9x0bcO+ZZ530Fh58vsFJA1llghfKz2/K8X0waDGRq
	SzgqFqqhNlPAjaKpYMA7BK4ozpWNOq7E4kIjfBb/8yGkQldViFasuB0zaY8+lIKjGq875Fx3YU0
	O8RBAf9UxaWSMYKPgOkDi5KKU1zj7+JL5y7GYXi1H+Qot3wUP5tBXkHrqo88zJ8O5vl5liK9DOT
	o/UZFH/y9arrh/4FNrDGmRxOVNBoINNnlcDGHgFKVIjhl/Q4r8GaWYuXyeUlhQM9d78PTFw75y3
	2JfyBJbVckKh4nh61jZkOvbMoq7u0m8NkhSWaQcagiNg8Ds1q/3+eKZbv+aJXX4d/9npyBbQBfU
	e6NWs9wQCUJBw3Hq1Dn3zqHtjsIa3ptW5aLPL7jWdNSwlPKnB59uhxHZF+TaqODXlg3K45GYKVR
	riu/h+yHLLV5eCH/VE7kp3g/IKym87BTm/g/1DzpN/rwgaQYrX2XQnTx0T1Fw==
X-Received: by 2002:a05:600c:5391:b0:49d:2562:d670 with SMTP id 5b1f17b1804b1-4a01afdcef8mr10294435e9.14.1790757243469;
        Wed, 30 Sep 2026 01:34:03 -0700 (PDT)
Message-ID: <3e2b41a5-5c85-4a6a-8f91-c2b979f87b86@suse.com>
Date: Wed, 30 Sep 2026 10:34:02 +0200
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
In-Reply-To: <arzDzQMP5rGz1-QJ@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1790757244-6D2D84E9-51680E52/10/78276251493
X-purgate-type: spam
X-purgate-size: 3195

On 30.09.2026 10:09, Roger Pau Monné wrote:
> On Wed, Sep 30, 2026 at 07:58:55AM +0200, Jan Beulich wrote:
>> On 30.09.2026 00:14, Alejandro Vallejo wrote:
>>> On Tue Sep 29, 2026 at 4:52 PM CEST, Jan Beulich wrote:
>>>> On 29.09.2026 16:20, Roger Pau Monné wrote:
>>>>> On Mon, Sep 28, 2026 at 10:24:04AM +0200, Alejandro Vallejo wrote:
>>>>>> On Fri Sep 25, 2026 at 6:30 PM CEST, Roger Pau Monne wrote:
>>>>>>>  static inline void rcu_quiesce_disable(void)
>>>>>>>  {
>>>>>>> +    unsigned int cpu = smp_processor_id();
>>>>>>> +
>>>>>>>      preempt_disable();
>>>>>>> -    this_cpu(rcu_lock_cnt)++;
>>>>>>> -    barrier();
>>>>>>> +    if ( !ACCESS_ONCE(per_cpu(rcu_lock_cnt, cpu))++ )
>>>>>>> +        ACCESS_ONCE(per_cpu(rcu_lock_epoch, cpu)) = ACCESS_ONCE(rcu_epoch);
>>>>>>
>>>>>> I'm not terribly convinced about using ACCESS_ONCE() for atomic
>>>>>> accesses. In particular...
>>>>>>
>>>>>>> +    smp_mb();
>>>>>>>  }
>>>>>>>  
>>>>>>>  static inline void rcu_quiesce_enable(void)
>>>>>>>  {
>>>>>>> -    barrier();
>>>>>>> -    this_cpu(rcu_lock_cnt)--;
>>>>>>> +
>>>>>>> +    smp_mb();
>>>>>>> +    ACCESS_ONCE(this_cpu(rcu_lock_cnt))--;
>>>>>>
>>>>>> ... this variable is to be read by remote CPUs and autodecrement seems
>>>>>> like the wrong tool for an atomic decrement.
>>>>>
>>>>> I can use {read,write}_atomic() instead, but there's been a tendency
>>>>> to phase out the usage of those functions.  On x86 this should be a
>>>>> plain `addl` or `subl` instruction (the non-locked version of
>>>>> atomic_{inc,dec}()).
>>>
>>> I don't think the compiler can merge volatile reads and writes. It can
>>> shatter them (thus my fear), but they are meant to be distinct because
>>> each might have different side effects. Jan already mentioned this in
>>> other words.
>>>
>>> You don't need an atomic decrement though, just an atomic write. Note
>>> IRQs restore it on exit and other CPUs don't write to it.
>>>
>>>   unsigned int *lock_cnt = &this_cpu(rcu_lock_cnt);
>>>   write_atomic(lock_cnt, *lock_cnt - 1);
>>>
>>> and this yields a plain mov, through a static inline stub (plus the
>>> mov from the read access + dec)
>>>
>>> The problem with ACCESS_ONCE() is that the write isn't guaranteed to be
>>> atomic.
>>
>> It may not be properly written down anywhere, but at least the compilers
>> we use are known to not tear aligned accesses up to a machine word in
>> width.
> 
> Then I possibly don't need the ACCESS_ONCE() at all, as I was using it
> to guarantee unshattered accesses.  However this should be written
> somewhere, maybe in docs/process/coding-best-practices.pandoc?

To write it down in any of our docs, we'd first need a proper reference
to somewhere. "Known to" isn't quite sufficient imo to actually nail
things down. There's still the possibility of compiler bugs, and there's
also the possibility that volatile accesses have better guarantees than
non-volatile ones. (Recall that in prior discussions it was actually said
that we may need to make far more use of ACCESS_ONCE(), which wouldn't be
warranted if collectively we were certain aligned accesses cannot be
torn.)

Jan

