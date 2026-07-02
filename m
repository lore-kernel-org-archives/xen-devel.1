Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FABAC43458
	for <xen-devel@archiver.kernel.org>; Thu,  2 Jul 2026 07:20:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1351299.1608512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfBi9-0002sv-0B; Thu, 02 Jul 2026 07:19:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351299.1608512; Thu, 02 Jul 2026 07:19:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfBi8-0002rj-TC; Thu, 02 Jul 2026 07:19:48 +0000
Received: by outflank-mailman (input) for mailman id 1351299;
 Thu, 02 Jul 2026 07:19:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wfBi7-0002rd-LL
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 07:19:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfBi5-005hn9-W8
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 09:19:46 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a461111-5cb7-0a2a0a5109dd-0a2a450be308-8
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 09:19:45 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a461109-ac48-0a2a450b0019-d155dd2aa430-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 09:19:37 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-4758bd3731bso178764f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 00:19:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477de3dcf59sm6699044f8f.34.2026.07.02.00.19.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2026 00:19:36 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782976777; x=1783581577; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GFnEOfF4jj8cE+H+zkvtGX3ba5jqVqYD8LMd89m3nVg=;
        b=TA16WlQz8Sr1sOwiyEabhBNmZK3cvXPHnLy+saIFyvoFyEdBNVKCmzM7uwE6zt8cLw
         CAKObjnRzCaUbDbLnpaDjS3q5InpzDOEIyXw8vOniHxzWGp/WPZ+wmm/POK8iBwEvTr+
         uaLrXoiHazwFnVZsmKvgHMj7CpnxWEP9K0ij82cphCJsa1YJpVl72aRSP8bc4Z9ZA/ZN
         h9V7Edm/MBlhIjmbgdAkV5vncvsFOgDq5nAV+FCIwwntKXJkT9mN0fz9xtAsUXAwjP7M
         2QUGaALS1ZGR1k88MuCzy6y0Ab3G8RH9E4omQGPGC/w/uUccAKIcJF/gFLXKP5XPtfSS
         Gssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782976777; x=1783581577;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFnEOfF4jj8cE+H+zkvtGX3ba5jqVqYD8LMd89m3nVg=;
        b=gZigKKzyZmzYGCA85FH+klAdsLDOKEuIqbKQMKAgNfYVp2IobXf3KEtq5DtpgYRJrN
         LYvmnEu5Mb3rxdNTg9FH9A5zmi1soR65VGZ5fAErwlQQy1466X6q/XmrmKWWFhv/nQqD
         55BfnKm2NjnNDGaU8X3vK2SyjivgyUskVnfGIexqy7OFe4S7OZW5RIdeRHtZ9rMvHjCF
         ZlQybe+l8QqLY1JzfbG3Yb241fDZE+X+1nZreAzK2dbl/TxXZEDLgLa7pF0DWrikukbh
         F4SBwSk08P1EhyYbgW8T5MC6QKzsjuwN2BKVVdwD7TwmTZyXPHWIhct/2OqymwFTbMxb
         6Rew==
X-Forwarded-Encrypted: i=1; AHgh+RrK51ZPlUYf6zhPMbp3LTIRNiVpT9I74Dmsr3iET3oz30t7pdqeOI5/NqoL9iw1ou49U3N0U6Q1+S8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzHziKUNvkWTCbEGpOFUzRwN3oL6ViduqHafD26396hprNHG+QR
	fK+J8Q3e23wCDkE4BIK4eGPXiBzMBiMGya58LLgCYbCg2AqX1rgOue2hnZSK7EwZfA==
X-Gm-Gg: AfdE7cl3DOrJ7KRKb/Vg97Wej2JrYZMphSijZz4YPiaFR7M+OVUltw9SCr53MDTdHxb
	P8TLqb+wmkdwkXkvNqjtEAiXUcWG685PyNMTQZN+3OFjWW6YBnu8bjfEMDDWvkBCXH3wB4AYRQ0
	QrBpWX3wL8jbyGHxiuM0YZu8081vWLyEpLOQRMyfPhHVCtTNpPUd4B1P1g+kyE7CAsVb+MdiVVm
	tfumrPeKne3E7rWHJUyVUymc3CAvsnmJ6DbIH0/8Ot6sPHquJ8jTwYiWJTgUuk1uNgWMeLJDW5z
	qLh2sETv15hmOGYdznZB57uRKwQpqzBDn0AcEV6wFFLn7/VjfJMLR3RWMmhNc2i79dtsSC0S3t0
	7lWKQgCJX5V20Tvu5gDK7pAyFQEL747vfr4SBsOR51lFa2Z14PPLyWLRbU3tIk8FfPHhUCDm7AG
	9JhfqcYS0BgIlCGqRpTC/0YqV3x+Xd8jMX5qSOIi6VCojrPk/uIWhnrgSIBnmvArTAzLA6Deq1B
	tUh
X-Received: by 2002:a05:6000:468b:b0:478:3df9:5d8c with SMTP id ffacd0b85a97d-4783df95e6fmr1443116f8f.2.1782976776616;
        Thu, 02 Jul 2026 00:19:36 -0700 (PDT)
Message-ID: <71d8cad5-50cd-41ff-b674-abac64f296e9@suse.com>
Date: Thu, 2 Jul 2026 09:19:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu-policy: set up host policy earlier
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6dccae5f-fe09-4f35-9e4a-7a38fb21e8d1@suse.com>
 <53018bb5-0ad4-449e-adda-6b2d94a0935e@citrix.com>
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
In-Reply-To: <53018bb5-0ad4-449e-adda-6b2d94a0935e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1782976777-A6939220-46E0A658/0/0
X-purgate-type: clean
X-purgate-size: 2109

On 01.07.2026 17:21, Andrew Cooper wrote:
> On 07/04/2026 7:46 am, Jan Beulich wrote:
>> In order to use cpu_has_* expanding to host_cpu_policy.*, the host policy
>> needs setting up alongside boot_cpu_data.x86_capability[]. Arrange for
>> that towards the end of identify_cpu().
>>
>> Fixes: 894bd7617924 ("x86/Intel: use host CPU policy for ARAT checking")
>> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> In the longer run we may need to (also) update the host policy from
>> setup_{force,clear}_cpu_cap().

I'm noticing only while making the change that I did already suggest here
what ...

>> --- a/xen/arch/x86/cpu-policy.c
>> +++ b/xen/arch/x86/cpu-policy.c
>> @@ -359,7 +359,7 @@ void calculate_raw_cpu_policy(void)
>>      /* Was already added by probe_cpuid_faulting() */
>>  }
>>  
>> -static void __init calculate_host_policy(void)
>> +void __init calculate_host_policy(void)
>>  {
>>      struct cpu_policy *p = &host_cpu_policy;
>>      unsigned int max_extd_leaf;
>> @@ -904,6 +904,7 @@ static void __init calculate_hvm_def_pol
>>  
>>  void __init init_guest_cpu_policies(void)
>>  {
>> +    /* Do this a 2nd time to account for setup_{clear,force}_cpu_cap() uses. */
>>      calculate_host_policy();
> 
> I'm sorry, but no.  The cleanup work to CPUID handling is in an attempt
> to purge this antipattern.
> 
> Double-initialising data structures *is* the entire reason we have
> order-of-boot problems in the first place.  Having a structure which is
> initialised but wrong is itself wrong.
> 
> Really, I should insist on a revert of switching cpu_has_* to use
> host_policy.  It was not adequately tested and is not compatible with
> how Xen starts up.
> 
> But as I expect you're going to object to that feedback, I'll tolerate
> setup_*_cpu_cap() keeping the host policy correct as they're called. 
> The easy option is to call x86_cpu_featureset_to_policy() each time. 

... you're effectively (see my earlier reply) asking for here.

Jan

