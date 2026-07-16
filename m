Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EA1C4450A
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 10:27:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1363745.1615279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkJIr-00057S-LE; Thu, 16 Jul 2026 10:26:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363745.1615279; Thu, 16 Jul 2026 10:26:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkJIr-00057J-IG; Thu, 16 Jul 2026 10:26:53 +0000
Received: by outflank-mailman (input) for mailman id 1363745;
 Thu, 16 Jul 2026 10:26:52 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wkJIq-000573-9D
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 10:26:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkJIp-000F2N-ED
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 12:26:51 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a58b1e9-2eae-0a2a0a5409dd-0a2a45079c60-6
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 12:26:51 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a58b1eb-b4ea-0a2a45070019-d155dd34b910-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 12:26:51 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-47f3e6cc44aso3753840f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 03:26:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f4634e5c3sm22887358f8f.1.2026.07.16.03.26.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jul 2026 03:26:50 -0700 (PDT)
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
        d=suse.com; s=google; t=1784197611; x=1784802411; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MpO4sIbuNKtAMFn/koUavB7k3+D+/ztIwPaEXdYtvps=;
        b=EqbmHrC2tdgDAmqOk1dXRbJdMPd2pttjFGv9tEXg7Kz98oW9s6VcGkBzrWFNbuIhWN
         1xeSR3veCPj+4Flbqkf6kdKO2VyNjJnKFj7whKBhJdmrGqb2wfG4qleoa1mcLGmnUgc9
         opql0Fzsv7j4PzYuf/158Nzi0xmri1v0tBKawZIiyXzuY0uf55oqAFw85qADatqOxkLL
         qMuL7GR44Wz7waOA3HkuwghrFIMBl1dhCpuBRNzTpDS5jjQHb0AuuOTmEaX8thXCBGK4
         065K809I+1u51YFxOuSGY5uv7bkpzORwMPY1H+r2mEuwgkMKUQIbeBagxIOPVEOJZRuF
         YJ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784197611; x=1784802411;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MpO4sIbuNKtAMFn/koUavB7k3+D+/ztIwPaEXdYtvps=;
        b=K+kU/MICnu0/6w0TmEaECNdJkOVczxA01DMEek4fqJeDhGCAmv067HqP+shebpBXLj
         Q3EdzN6Wibt0XuRbU2pxnh6hQ2jlvROn3sd+xgEcnwmejDKcEHeHx1CRt8vsYYmDUSWY
         xKNSVqpNSaq9ouNqZeO26ZT2hgyRgC/4267JyN01xgW/caCSxSbfloo8T9oD1YhQtmMV
         ZvMzlt8IypLvL0hWylLK0ng32NsX7gk50YimQ3aJZr6JraWjjs+OcbfBy5rWUmZfhiUS
         PrIKupsA3MC299UTfAv7wvknqOVlnBbCk2Q+Ej2pVY23NvZWrkLynNo3M85jIbrtDQTP
         vxsA==
X-Forwarded-Encrypted: i=1; AHgh+RphkVsARht+5YlI5fRgJktvuHN56OAQTf8TFOu0rEkxxgtgtjQzr3awJUS6TyGsjgaXnAnM1IxLvLA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyc9xuudDro3Lib8WyZ0Vjznzvv5+WaYl8H5J+gGBO5qX8DlYOy
	q1Ov1eC2SjYIn1xcz6lq0i1Wkh4OZSUGYTAAh5Gs6B/I23jK5jeglmiJDLtCHYGA/w==
X-Gm-Gg: AfdE7cn4yBNopZiHOkrad4XFverCAhr0AdreLX7FLB6AQfZgtxuiqyYm6f8V1Msio/e
	JGEQvnvIzzJ5fY7/ovAUiwkvZ5LoXpWnxTZdR2Y07pSEiQ0Hwa+2fRPKXbq+vJ5Ws2OsekUow8Z
	aK0Jh/wDgoes1O6tKOxzYK/qDXgeZ5eAKKVg9BVcrIzpBxdIrCoeX8XhPSYOsr/n5gWo8Cmfvv5
	VRHhMVaNkow4+T7U/X211w3W8c9klv6YNf0v8LhmLkbZae0zNBTFL0eofP3+CnQwn1b8XDxDi2M
	Mi3oZ7twTTk2lC+9lc5aTXM85TWSd9yCvFMMq68PAXp7i7I1BhlLkk4rOMRt/zWm7AMlY9e2ZIJ
	kHlNTyKkNoMPv17/ANFuu5hQC9JZ0+dT2sI8P0qIcpq+UnRU4RezFm3GKaj4bRcZfS2XHFz6GEv
	hY4xqoAtOZmA85incYuo/VU1Xh7L+gW6+6uen0kGWxbwvacZL9vykSVyhPy6+h2tAMiQ==
X-Received: by 2002:a05:6000:248a:b0:47d:ec60:6581 with SMTP id ffacd0b85a97d-47f487e3259mr12510373f8f.0.1784197610876;
        Thu, 16 Jul 2026 03:26:50 -0700 (PDT)
Message-ID: <beb2cccb-727c-4626-bf17-97d0801cb153@suse.com>
Date: Thu, 16 Jul 2026 12:26:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] xen/console: correct leaky-bucket rate limiter
To: Teddy Astie <teddy.astie@vates.tech>, dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org
References: <20260715201902.2984407-1-dmukhin@ford.com>
 <20260715201902.2984407-3-dmukhin@ford.com>
 <1784195449.8631fc262581453bbf619ec5b2062170.19f6a5603fd000edb5@vates.tech>
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
In-Reply-To: <1784195449.8631fc262581453bbf619ec5b2062170.19f6a5603fd000edb5@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1784197611-A44CBAE4-1C85FA24/0/0
X-purgate-type: clean
X-purgate-size: 2379

On 16.07.2026 11:50, Teddy Astie wrote:
> Le 15/07/2026 à 22:24, dmukhin@ford.com a écrit :
>> From: Denis Mukhin <dmukhin@ford.com>
>>
>> Use existing printk_ratelimit_ms and printk_ratelimit_burst variables in
>> do_printk_ratelimit() instead of hardcoded values 5000 and 10 respectively.
>>
>> Ensure rate limiter is disabled if either printk_ratelimit_ms or
>> printk_ratelimit_burst is 0. Make sure no unnecessary initialization is done
>> in the corner case.
>>
>> Also, simplify the limiter code by using min().
>>
>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>> ---
>> Changes since v2:
>> - fixed typing and 32-bit integer overflow problem
>> ---
>>   xen/drivers/char/console.c | 21 +++++++++++++--------
>>   1 file changed, 13 insertions(+), 8 deletions(-)
>>
>> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
>> index 5d395f882e08..de9f2432445d 100644
>> --- a/xen/drivers/char/console.c
>> +++ b/xen/drivers/char/console.c
>> @@ -1274,21 +1274,26 @@ bool __printk_ratelimit(unsigned int ratelimit_ms,
>>                           unsigned int ratelimit_burst)
>>   {
>>       static DEFINE_SPINLOCK(ratelimit_lock);
>> -    static unsigned long toks = 10 * 5 * 1000;
>> -    static unsigned long last_msg;
>> +    static unsigned long long toks, last_msg;
>>       static unsigned int missed;
>> +    unsigned long long now, limit;
>>       unsigned long flags;
>> -    unsigned long long now = NOW(); /* ns */
>> -    unsigned long ms;
>> +    s_time_t ms;
>>   
>> -    do_div(now, 1000000);
>> -    ms = (unsigned long)now;
>> +    if ( !ratelimit_burst || !ratelimit_burst )
> 
> Do you intend here ( !ratelimit_ms || !ratelimit_burst ) ?
> 
>> +        return true;
>> +
>> +    limit = min(ratelimit_burst * ratelimit_ms, UINT_MAX);
> 
> That looks no-op (at least at first stance), as UINT_MAX is the largest 
> unsigned int value; hence `ratelimit_burst * ratelimit_ms` (both 
> unsigned int) can't be larger than it; even if it overflows.
> 
> I think we need to cast both ratelimit_ms and ratelimit_burst to 
> unsigned long long before doing the multiply, so that the multiply can't 
> overflow (not sure exactly how to write it without being too verbose 
> though).

No such casting please. __builtin_umul_overflow() is what wants using
for such purposes.

Jan

