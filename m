Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94E8C4450A
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 14:30:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364173.1615504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkN6O-0001Ix-0Q; Thu, 16 Jul 2026 14:30:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364173.1615504; Thu, 16 Jul 2026 14:30:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkN6N-0001Iq-TW; Thu, 16 Jul 2026 14:30:15 +0000
Received: by outflank-mailman (input) for mailman id 1364173;
 Thu, 16 Jul 2026 14:30:14 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wkN6M-0001Ik-6T
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 14:30:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkN6L-0003CF-Bi
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 16:30:13 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a58eae3-bab6-0a2a0a5309dd-0a2a4503afca-46
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 16:30:13 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a58eaf5-fae8-0a2a45030019-d155dd2ae4e1-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 16:30:13 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-470174001a0so1773905f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 07:30:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f4635a63esm25009949f8f.9.2026.07.16.07.30.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jul 2026 07:30:11 -0700 (PDT)
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
        d=suse.com; s=google; t=1784212213; x=1784817013; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QwBftSqCzw1ivw8deBYYtEs5r2oQbMcwrQdlD57rsTs=;
        b=D1pOhITuitnX4Wx8bRSNe5gzZK4cl+GnlcJDkrTKEa8Y1cxuxDF5mKeBhPjOXF5Ksq
         pubp1MydPpcxDcIyNs8LuTIpbBju001mt96Et4V3MPTzQa8uQLh7G0hTEqgl4sUoaiuC
         NYAv8LKgdwNmobYkFVzgm4SsYM22ajJb7hhyZ00lExX1v5hnfo9QKT0vAQuMQm1biAlE
         4Hqbu7b0KRdicne9lJWT3q5rhnnEyfDRiBlU/aKZnHhqKk99E1NgLDdUzVU7oaRJbBl1
         vaS60RAf1KVl8V8T3aloXrbE+aHVrbqkqi3oXZWHQhHp46i9JWuO6Mg7kAdScq3eawYQ
         5L2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784212213; x=1784817013;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QwBftSqCzw1ivw8deBYYtEs5r2oQbMcwrQdlD57rsTs=;
        b=H51mIl+QhiaVPQBr8+tRxBPftejJx/QsbkpU2GMlVESvgWWfQnhsjlCTuHvgh9vUnR
         GwTT4N7Ns5HlErGjqvwRjrTCQl+qn6MZpN25TLAEuBlKUmH7xvcIcxpkakuPSZZI5Lxz
         qyODURpgCBUoynwcCIscsWGNPctmyOPjc10+wu8ddCaahfe4rdrp1eWiSf1W4u86LfhO
         lP68RnPu32yEuyjU9odHgrjbTylqv+ghwjtrLXT8RAn2sweuD0ZPCE6j3vupLOmc4hKw
         5TjrsLZcfxREJH7wMU7j5bdOQYqEkbgtGsqJqrhNSu5sErDzrfmcyHuv73hqjdR/+lOq
         o7Vw==
X-Forwarded-Encrypted: i=1; AHgh+Ro70Vym7qDG5DMojp2tPvKMkvuEWq6vk/zHYl3W9a5cQnHP/x9UjZlgoyfm4wQa+juSyTXP3F3/NbA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwF/6uM/x1yv11UDNJEywC7UXgF8EDbsnGlN0JU7IPFrx3duCkg
	Gkvlb7rLJrrBkLRmd0zMF0X6BBZnx4uwyU1w1hxcWQ5v3RsHCEXZEfO+R1ZTKSQzMA==
X-Gm-Gg: AfdE7clu2tLRJ3AX4QGxKsMQEx2kQRZItsrQMLKXn8TD8RJQHLx/kPf2RM6fHvEM/Kp
	UL46yuJS2H04fCn7ZIzu1n1dYu0KvlRoY7IEP5X+21NelLJ2YFnevRPkAK2Rlm7yKqYne1iY6G0
	BEUg95ne5iosZOP+oN89S20/eOTUb8Hdr1+vG83xRIif7bE0xYa+Eib9Q9gbSWzfuk7nqxYY4d/
	q+fVUppVbP1a/DRicFUt9aSimEOWGChEVWqGwNykkCfJgtETOhs1jU4ZrPaS2za+BvFhatMuCSR
	6uy9sSaYQT5kx39ZQFxZ8uxjowGIxgJIujgiatikVBj29OV+n4nX6O2twkDcj+/U5uFtFn+oGiB
	5gmzKZtW+0cjIyk/9a10+TYCTOFpXV9VBQ7vk7TK1/NxrvxzRvxOr5WMGFJRGftF5THAlxDRe78
	t/apiZ2tH8DAOVsSVEBLfGbm8TfZNUm2cIrETyxob/efvc46hTC8htSNc8V6GIiz4tFUGDd2wkN
	U5x
X-Received: by 2002:a05:6000:41d0:b0:47d:ef95:c4f8 with SMTP id ffacd0b85a97d-47f2dcee1c6mr25715599f8f.54.1784212212586;
        Thu, 16 Jul 2026 07:30:12 -0700 (PDT)
Message-ID: <7a8173b4-f2c1-4ea4-a5a9-d7dfeae403ba@suse.com>
Date: Thu, 16 Jul 2026 16:30:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: V{,P}{COMPRESS,EXPAND}* can (wrongly) trigger
 assertion
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <43b0c3d2-49cb-4759-a111-8fe083c723b6@suse.com>
 <1784208936.8631fc262581453bbf619ec5b2062170.19f6b23cedf000edb5@vates.tech>
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
In-Reply-To: <1784208936.8631fc262581453bbf619ec5b2062170.19f6b23cedf000edb5@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1784212213-752854E9-D6F164C4/0/0
X-purgate-type: clean
X-purgate-size: 1584

On 16.07.2026 15:35, Teddy Astie wrote:
> Le 16/07/2026 à 12:45, Jan Beulich a écrit :
>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>> @@ -6236,9 +6236,11 @@ x86_emulate(
>>               ASSERT(op_bytes == n * elem_bytes);
>>               op_mask &= ~0ULL >> (64 - n);
>>               n = hweight64(op_mask);
>> -            op_bytes = n * elem_bytes;
>>               if ( n )
>> +            {
>> +                op_bytes = n * elem_bytes;
>>                   op_mask = ~0ULL >> (64 - n);
>> +            }
>>           }
>>           goto simd_zmm;
>>   
>>
> 
> That looks like a bit of a hack in my understanding.

It may be looked at it this way, yes. The entire file may be looked at this way,
really.

> Is there anything specific preventing the common SIMD logic from 
> accepting op_bytes being 0 ? Otherwise, we risk seeing similar issues 
> with other instructions (future or current).

Requiring op_bytes to be non-zero is a safe-guard. If any of the cases engaging
common SIMD emulation would fail to set this up correctly, it would be noticed
only if the path was actually taken (to serve a VM, or in the test or fuzzing
harnesses) and if results were checked to be correct. The test harness can't
reasonably guarantee all paths to be taken. Whereas the running fuzzing harness
doesn't prove that execution was actually correct; it only proves that we
didn't crash or hang. Skipping a memory access where one would be needed would
likely go entirely unnoticed there.

Jan

