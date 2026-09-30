Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF11DCA5FAB
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 05:59:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436841.1655497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBnLJ-0002rz-8V; Wed, 30 Sep 2026 05:59:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436841.1655497; Wed, 30 Sep 2026 05:59:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBnLJ-0002rs-51; Wed, 30 Sep 2026 05:59:01 +0000
Received: by outflank-mailman (input) for mailman id 1436841;
 Wed, 30 Sep 2026 05:59:00 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBnLI-0002rm-3e
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 05:59:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBnLH-00Fp0i-1Q
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 07:58:59 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abca520-bab6-0a2a0a5309dd-0a2a4506bac4-4
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 07:58:58 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abca520-195a-0a2a45060019-4a7de18dce63-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 07:58:57 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e7d2bb404so6249785e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 22:58:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a0174f055csm21659335e9.9.2026.09.29.22.58.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2026 22:58:56 -0700 (PDT)
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
        d=suse.com; s=google; t=1790747936; x=1791352736; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P/1kr+oNfk9OMkGhSORIWxyYSxL+iPiey+wqxxzCezA=;
        b=ftiPGJUL4Mxzka1WUDmvbATtwh4vOv8xxsTTDXaM0cEx31xG6LpeHrntkyH26AjbBR
         SRe73KiTghVGiXzRlRw4jrvDpmzPMRfVWCCdygueuIl2/UEc7BEiGLC0tjtBOCbF4QWr
         76/gviztJsDe98ZNNDX9yTQSfAiHVQEcCFFALZWVLHY3N2I9JpaPW1GNds7BoaT7CX5S
         tDv0SZHuHpyViYeQJ89fRw3k/GZW1HQl3FG3hXu2loxYzbYL5qVp0LDKIzxhWbvZHmnQ
         qA4L3RmQ67Cbm78KSKpjm8iEKPhc8W+McUbreRsliLSxQsbtz07TcKaVHLW/bGTwf1DH
         T+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790747936; x=1791352736;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P/1kr+oNfk9OMkGhSORIWxyYSxL+iPiey+wqxxzCezA=;
        b=Zph9ShlOYMLDo+EwnMu+j6gCAssDsTDJTm5IsjvQm2tN3JxrUtFQFLAYdaJjQ7YX8Z
         7H62/kZreQiwprJTiroB80mlXIxnXqZ2o6uEf7UBjLTcm5TH5DhkZ+FuMKYw2gkLnxNM
         9hLDg8XJqMQv/teiGO0bM+tqOFKDkgcg/SMl5yHpfrkm/y6cSNOezFxfTVgoKx8EZ5Rz
         O0eYg9oR/ew4cxeZ9Vv/ptDZ+kBfRst3DKOox2Z6X5M9SYAkBTAMof88mh5GAVqQ0LeA
         ccWsMs1JY8UshzdE4Gojz0oVOqmnUGOcPBTAoQQPEEQ6k34cghN6KeqdDgSsyqUNi/bp
         sslg==
X-Gm-Message-State: AFuF++lCJLXC/fK9gdBFKVgIdcqNe24biGBT1WRIR5TwNgjXFC78piVq
	8m6F/s26JZqu13X1Bkj2qYh0kRcbrlyUvrGs7PLvkpHqTsGlIsxWZC0eUEib52dyJA==
X-Gm-Gg: AYBFou097HOvIwCwknlVVJBJmFdElBeHXmTDSTXBL6QozffgM9GD5350DP/PlMGhK+x
	7qUPnwNvSoPcczp89SEh8NsKCI6eYucL+Q+adFZD5tuGpmSWXI38FIdIC8ALexdrYPC+FSYz5iF
	sglnIR25EyYg/xbTlr0niHJr5GyVof4o3vIAIRVLqV/ahcqP+rW+/zkxYyE/dTHVJrvTK6bXusZ
	gDSu0px2W3GsBxyQJmG/bUp1FQ9lABgYqHDqlbZ/qkAl98NVNNiInNuAbCdkwJbHpEMSTb7ns6b
	iribHjR4yr8BZvy9IDj5dRKQKIJXB51soIyGd6UCaFBUqwvRDflS7qFYhaz+TMzRBH7H9ickpCl
	hETraBc70G9V9Id5KPw8MjF2ngCt7ZUoc/BbfHXbEz8R2ENyti4Y+4VbOPKso8f7lzh39EC8TFA
	sKl/2a1DetpaA3pDAi9t5Oq4xtBcTibggx1aPgr7sFlbDv7LxWN5mjKZqaaeOaz6LfAgG04xXb+
	VfoaM/qTlaiQCzlIMV5ZarrZ2nDt5hmD0vZYh2IR/s0mIpMDl5+BSsSdvs86Q==
X-Received: by 2002:a05:600c:1f95:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a01b1a1138mr2139515e9.8.1790747936603;
        Tue, 29 Sep 2026 22:58:56 -0700 (PDT)
Message-ID: <3e600ac0-3096-4cfb-967b-c6d87d8c04e6@suse.com>
Date: Wed, 30 Sep 2026 07:58:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] xen/rcu: introduce the concept of RCU epoch
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
References: <20260925163025.65217-1-roger@xenproject.org>
 <20260925163025.65217-2-roger@xenproject.org>
 <DLQSZY2KSYDH.1YSCWGQIQYP0H@amd.com> <arvJQSDecSSAU1WC@macbook.local>
 <50d1df6c-d969-470b-9b40-ca171c60618d@suse.com>
 <DLS5A4YDJ8ET.28ZIPQ6QEN2K4@amd.com>
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
In-Reply-To: <DLS5A4YDJ8ET.28ZIPQ6QEN2K4@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1790747937-F7ACA77B-33E700F8/10/78276251493
X-purgate-type: spam
X-purgate-size: 2238

On 30.09.2026 00:14, Alejandro Vallejo wrote:
> On Tue Sep 29, 2026 at 4:52 PM CEST, Jan Beulich wrote:
>> On 29.09.2026 16:20, Roger Pau Monné wrote:
>>> On Mon, Sep 28, 2026 at 10:24:04AM +0200, Alejandro Vallejo wrote:
>>>> On Fri Sep 25, 2026 at 6:30 PM CEST, Roger Pau Monne wrote:
>>>>>  static inline void rcu_quiesce_disable(void)
>>>>>  {
>>>>> +    unsigned int cpu = smp_processor_id();
>>>>> +
>>>>>      preempt_disable();
>>>>> -    this_cpu(rcu_lock_cnt)++;
>>>>> -    barrier();
>>>>> +    if ( !ACCESS_ONCE(per_cpu(rcu_lock_cnt, cpu))++ )
>>>>> +        ACCESS_ONCE(per_cpu(rcu_lock_epoch, cpu)) = ACCESS_ONCE(rcu_epoch);
>>>>
>>>> I'm not terribly convinced about using ACCESS_ONCE() for atomic
>>>> accesses. In particular...
>>>>
>>>>> +    smp_mb();
>>>>>  }
>>>>>  
>>>>>  static inline void rcu_quiesce_enable(void)
>>>>>  {
>>>>> -    barrier();
>>>>> -    this_cpu(rcu_lock_cnt)--;
>>>>> +
>>>>> +    smp_mb();
>>>>> +    ACCESS_ONCE(this_cpu(rcu_lock_cnt))--;
>>>>
>>>> ... this variable is to be read by remote CPUs and autodecrement seems
>>>> like the wrong tool for an atomic decrement.
>>>
>>> I can use {read,write}_atomic() instead, but there's been a tendency
>>> to phase out the usage of those functions.  On x86 this should be a
>>> plain `addl` or `subl` instruction (the non-locked version of
>>> atomic_{inc,dec}()).
> 
> I don't think the compiler can merge volatile reads and writes. It can
> shatter them (thus my fear), but they are meant to be distinct because
> each might have different side effects. Jan already mentioned this in
> other words.
> 
> You don't need an atomic decrement though, just an atomic write. Note
> IRQs restore it on exit and other CPUs don't write to it.
> 
>   unsigned int *lock_cnt = &this_cpu(rcu_lock_cnt);
>   write_atomic(lock_cnt, *lock_cnt - 1);
> 
> and this yields a plain mov, through a static inline stub (plus the
> mov from the read access + dec)
> 
> The problem with ACCESS_ONCE() is that the write isn't guaranteed to be
> atomic.

It may not be properly written down anywhere, but at least the compilers
we use are known to not tear aligned accesses up to a machine word in
width.

Jan

