Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97051CA5FC5
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 13:54:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437307.1656157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBulU-0000u1-Eq; Wed, 30 Sep 2026 13:54:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437307.1656157; Wed, 30 Sep 2026 13:54:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBulU-0000tu-C4; Wed, 30 Sep 2026 13:54:32 +0000
Received: by outflank-mailman (input) for mailman id 1437307;
 Wed, 30 Sep 2026 13:54:31 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBulT-0000te-3m
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 13:54:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBulS-00EakB-1j
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 15:54:30 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abd148b-e002-0a2a0a5209dd-0a2a4508e398-20
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 15:54:29 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abd1495-f659-0a2a45080019-4a7de18caa49-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 15:54:29 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49cd5462b69so30447345e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 06:54:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01e63f574sm1128425e9.3.2026.09.30.06.54.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 06:54:28 -0700 (PDT)
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
        d=suse.com; s=google; t=1790776469; x=1791381269; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pjpga6JD0er0zGD16YUE65FL7GK+rVjJTaCSfBHwxUA=;
        b=D7zDfqn3fpMMfDPoq4/1bUH7ZeCannJz4V8AyvsjA/f0uuA2v5muwKayApmTIBol57
         JSSqAC5trQnW+Q8x3PkpZO4SyIvKGARDubauCIeqcWEsFty91EEE8rSzim4JD8kD0sDt
         ZYyh6HR7xFA5W+ZKjGajp3pmPPfXoNaslSRjCHs1ylR/bP0FgZEF596nCBAvEqYYQ0pF
         Vi4s5BL+BpOnGs3P1oaeME3jtz6dpkdq50eNPybzboKQpaoHtitopsp+J4pRgrdzjYtQ
         guA29eTlQF7wm0YHa6qi1Wusp+eZI19+7Kss+1I/0EZGeLlFqtJWcFn6APHeLaxvYhjM
         tOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790776469; x=1791381269;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pjpga6JD0er0zGD16YUE65FL7GK+rVjJTaCSfBHwxUA=;
        b=ZU3exZ+aWMApcapWSCYrtyIJ3+UBnURoAPZk0W/ZsPWJvRa7v4/7Gtkzs+3VZD7eZk
         7leZh5uVOCkUlpgMEY6sWBG1N91ATRlT8Vx+EWhAQqVP7V7Lgvvv+HsJiXz3ptN3UUlG
         f5NQSnk1L9iibf7waqQpnnBJd53zhbY/YW+mEd0WXZzA5KEIBKP3aUfqZ8w+yZVCVICz
         zJzqWffIqmoh8RiBqHEiepOfVvGGTQRkMALzmVCGERY+5drS5xCYh0GUBL+ZkQeDJyFs
         7k0UCHBMjA4xwl7fcTOP/epeo+3C/pWcHEKZ1/Uwwhubmb/IdNmpjdf/5mp7wCe5T2Hl
         O7Uw==
X-Forwarded-Encrypted: i=1; AKwUvBxxzDy+s1ZNRF3pXJk/zN7GrPDZzAYJq39y48n+ZQqcqRtPUzP9csnLh+5ZHZyD3ec+adZH7QZ5LtY=@lists.xenproject.org
X-Gm-Message-State: AFuF++kF8Y5yOnlY9WvDBroTGRBJPsL5+vqCwwQG5Dacs6w0KQMxpB/E
	Y4AvC5C4ul1eJ6GeuKf8s9qpPESwxvZ2vP8rJCzhjIIzm9atS6KBlWnYMkBfj905tA==
X-Gm-Gg: AYBFou2+i9Ge0WC5JRNe6joZmLZvwNwsBSJNWTbLBgDeqx0WqCrF73a0F4BSLk92Bik
	f9NO2kAWp4NvGaujlNLQTW5a9w4FLeFElOurL39BRiGu1PxUGRLl964GVkYLhTFXae2/YSYwQ2d
	ZPGslBTnHBHgrhf+4A4+kE+gjANiHwlBUFNcCqqb56pOEHhcbA8toKRDY2l1MJ5tCMGscWBzchE
	pclHJ8K0LJlhQqgA+CTkkR+QccYB7dxbVi4hs7DHC63yMYmCRAfWJ/v0ah+vAzjBwPBq0BXYg5C
	b8GtE2Av8PhQQ3kPlsxQQEG8yEta4gsmzV41Hnwg8mOAQqLqTNhki7xjgm1cIQ+19SGM2spp2Y8
	kqjvv/PziEF3GDuTNF9Ncr1cmps4UFypjLPcnamFQucya3J1fNy/qzfqyt4CwxZRZfvUbFSg6qs
	y0h99ZcQWlpVrknoUvjCYsSo1rezKTg7Ft6ESIG2fjHR0hx+iXTvf1N9KBXaV0gn40rXJI3kx4f
	NAHzblaaatWg/6P/49GdCucEhsdp5ouO5UyEfPUZ6wDHx5pXhMzV62zoFh4iV0=
X-Received: by 2002:a05:600d:4448:10b0:49f:ce78:3564 with SMTP id 5b1f17b1804b1-4a01b11bedcmr20405265e9.21.1790776469395;
        Wed, 30 Sep 2026 06:54:29 -0700 (PDT)
Message-ID: <f93e6f0d-0ceb-4db6-91f8-d571503ca58c@suse.com>
Date: Wed, 30 Sep 2026 15:54:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] xen/riscv: rename PTE "permissions" to "pte_flags"
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, xen-devel@lists.xenproject.org
References: <1790699381.8631fc262581453bbf619ec5b2062170.1a0ee00218b000b504@vates.tech>
 <1790699585.8631fc262581453bbf619ec5b2062170.1a0ee033eb9000b504@vates.tech>
 <9f94af4b-f122-46e0-bbc4-7fecd51d4348@gmail.com>
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
In-Reply-To: <9f94af4b-f122-46e0-bbc4-7fecd51d4348@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1790776469-CE14687B-CDA90FD3/10/78276251493
X-purgate-type: spam
X-purgate-size: 2035

On 30.09.2026 15:42, Oleksii Kurochko wrote:
> On 9/29/26 6:32 PM, Baptiste Le Duc wrote:
>> paddr_to_pte()'s "permissions" parameter, the matching local in
> 
> Nit: s/the matching local/the matching local variable?

What else could "local" on its own mean here? I think it's common
shorthand for "local variable".

>> setup_initial_mapping() and p2m_set_permission() don't only deal with
>> permission bits: they also handle PTE_VALID, PTE_USER, PTE_ACCESSED and
>> PTE_DIRTY.
>>
>> Rename them to "pte_flags" and p2m_set_pte_flags() respectively.
>>
>> No functional change.
>>
>> Requested-by: Jan Beulich <jbeulich@suse.com>
>> Assisted-by: Claude:claude-opus-5
>> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
>> ---
>> Changes since v2:
>> - new patch
>> ---
>>   xen/arch/riscv/include/asm/mm.h | 5 +++--
>>   xen/arch/riscv/mm.c             | 8 ++++----
>>   xen/arch/riscv/p2m.c            | 4 ++--
>>   3 files changed, 9 insertions(+), 8 deletions(-)
>>
>> diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
>> index 9e28c24954..1ac66283ec 100644
>> --- a/xen/arch/riscv/include/asm/mm.h
>> +++ b/xen/arch/riscv/include/asm/mm.h
>> @@ -22,9 +22,10 @@ extern vaddr_t directmap_virt_start;
>>   #define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
>>   
>>   static inline pte_t paddr_to_pte(paddr_t paddr,
>> -                                 unsigned int permissions)
>> +                                 unsigned int pte_flags)
>>   {
>> -    return (pte_t) { .pte = (paddr_to_pfn(paddr) << PTE_PPN_SHIFT) | permissions };
>> +    return (pte_t) { .pte = (paddr_to_pfn(paddr) << PTE_PPN_SHIFT) |
>> +                            pte_flags };
> 
> Nit: it could be one line.

Not if all the blanks are to be kept.

> I am okay to go without last two Nit(s):
> 
> Reveiwed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Please clarify whether you insist on the description change for the tag
to be applied.

Jan

