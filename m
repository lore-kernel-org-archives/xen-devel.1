Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED6D606A328
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 10:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=H/EBd0bo
Received: from list by lists.xenproject.org with outflank-mailman.1471617.1679876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOXxr-0007tG-B2; Wed, 04 Nov 2026 10:11:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1471617.1679876; Wed, 04 Nov 2026 10:11:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOXxr-0007t9-80; Wed, 04 Nov 2026 10:11:31 +0000
Received: by outflank-mailman (input) for mailman id 1471617;
 Wed, 04 Nov 2026 10:11:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOXxq-0007t3-P8
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 10:11:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOXxp-00GBhM-Te
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 11:11:29 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aeb04ce-8faa-0a2a0a5109dd-0a2a4508e7de-16
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 11:11:29 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aeb04d1-f659-0a2a45080019-d1558036c4ce-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 11:11:29 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a214af2076so3179055e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 02:11:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b43c17ecdasm66418615e9.5.2026.11.04.02.11.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2026 02:11:28 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793787089; x=1794391889; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XlNv9wby1nKD2zqGSHjj/t/EeDOe5xMy1sw4OFFn9q8=;
        b=H/EBd0bo0iXiCskIStlC68Z+H9FND1ujaWxxiXb17PYbeVS9LSoWBqb8RTez6sjj11
         89/vp40GethDxMyT6hH+0KkxsaHaTycDfSEd9pnReUQ5hKWp91NxG+SQ3/dTkZgOUS/y
         qZYMhA+ZeDim6H60yc20QQcutrL3pI5iSga/mo81WL2dELjc1CV7M5qzVKE1qtfaVe0L
         uPhvEa4SsBaEsN4nA3S1qBkNxeRA3lCmEptDU1i/iGzbY8HHQgfI4srRKqQ9aJ1emi5E
         dpbA4cdST4YqHru77094AW3BMNJ/A+K0JqOGcxt8RaiO903hs/050fwxzVnVDeMX0m2U
         3EVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793787089; x=1794391889;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XlNv9wby1nKD2zqGSHjj/t/EeDOe5xMy1sw4OFFn9q8=;
        b=njSGikUc94rD39l8LicXy3VUne5oiH2gxUndUk6++sgk3NIb5rODURg55ILU1TglEY
         HRYJMOU7d3x6pxm8+sUAzAi4eTzgmssLf8Rad7tDx4zqh9nIENCq9bXl90t4ddET6/Xb
         cbMBzQlEXgXEGkqd3S8LYNFUR5fRozaNdn/S71IYsLA3+9sVCv2JM8uJ0rJMzVDV9aDs
         xVQrJ40Q30hGhDAfd3sFQPN4yJUaA4+nmcVr6aVvevLC/zKPZziHpEBTJxAlxlK2KIIQ
         Vv/EmfVlRalgUA9rS6uw+wpfqEJvDTp1qLTTa+PRcg9zGNwcyF2YvwW80q4fldpiKdaw
         JCBg==
X-Gm-Message-State: APuU4Z8yGlCMSi7YgXHu2y5Kh/3tGtpMQuZCZVvAp4FyOCLdjUFM3QP0
	a6Z3MLKAfN1lgabZ2GoZpoN1Y/r2LfC5Xx/TZRHNDv3rvRL9vg7uwgv+5VCKuFUyKw==
X-Gm-Gg: AYBFou3XbTOi1Wdp52iEtMgVCnk9BJ4oCUSPMSlGyFg7pZxu6iwE8wmEUYkzekdq77G
	0X15DY/zkYxPt5HqQ8si218ClUveyeAJWYWPNNhunTUjGve1s6BjP1MEZZECGXslgAWzidL1DHc
	gb2lZU4DQeuPYURhU1sbuuLbBNheGgq3DH2MCZBlywe6JxlSOYj89Zoip5Sq9BxK0rHkULxHdYW
	CUdOX+h33a1k+ANv9yOuoA1mADZG0rZwPqDIe236F8d1TSGZmwuVuEtcnKSffT4nklA5HvFkjEU
	PMswmbSWW66rc9A3hrvFKtzlrE3PjpIwrAeZP1pMuqhHHGBJYoKPooGt+Ht04EKrQdMnrERtk9X
	M3gRnG4s9Xm6bo+B0EIOFivBc1tMJtmsrqKz1SgePLNc3+1v7khMF48N2cqXkAlOnj6wj8soT51
	wxK4oQutQiWa71yp/NDLvsIoXQauUChgJyHbWq1qPHwM+iSecK7y0S/iih9SdlKML5jlyISde2V
	oKPlN7k7Ex9b1Txx20O94SNRFjc3sST0ncUELei8ouwlx16LmfwikVGRTWZ4PdedsXAYCCEEfnJ
	xrlYXZmzpJKiFxw0lCiO3Y36sEr2cIc61m0KC8GCVP4xDRX+8cYikOwb5GVjsgNjqWx11cn9BqE
	s5xNwjffyQ33eGJIRmA==
X-Received: by 2002:a05:600c:e552:b0:4b1:4da2:ca99 with SMTP id 5b1f17b1804b1-4b14da2cb6fmr139256985e9.10.1793787089308;
        Wed, 04 Nov 2026 02:11:29 -0800 (PST)
Message-ID: <721b7eab-3893-4a0a-81b7-e6bde01118e0@suse.com>
Date: Wed, 4 Nov 2026 11:11:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/15] x86/PVH: heed the kernel in pvh_steal_ram()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <032c1cb0-55b8-489d-bcf4-4d4c14a590ae@suse.com> <atHPRLewczIY8Qm1@Mac.lan>
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
In-Reply-To: <atHPRLewczIY8Qm1@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1793787089-CED4087B-56515CC2/10/78276251493
X-purgate-type: spam
X-purgate-size: 2253
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16.10.2026 09:16, Roger Pau Monné wrote:
> On Mon, Oct 12, 2026 at 10:25:40AM +0200, Jan Beulich wrote:
>> While the function working downwards will typically result in no conflict
>> with the kernel range, there's no guarantee of that.
>>
>> Fixes: 1d74282c455f ("x86: setup PVHv2 Dom0 ACPI tables")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -186,8 +186,12 @@ static int __init pvh_populate_memory_ra
>>  /* Steal RAM from the end of a memory region. */
>>  static int __init pvh_steal_ram(struct domain *d, unsigned long size,
>>                                  unsigned long align, paddr_t limit,
>> +                                const struct elf_binary *elf,
>>                                  paddr_t *addr)
>>  {
>> +    paddr_t kernel_start = (paddr_t)elf->dest_base & PAGE_MASK;
>> +    paddr_t kernel_end = ROUNDUP((paddr_t)elf->dest_base + elf->dest_size,
>> +                                 PAGE_SIZE);
>>      unsigned int i = d->arch.nr_e820;
>>  
>>      /*
>> @@ -203,6 +207,11 @@ static int __init pvh_steal_ram(struct d
>>              continue;
>>  
>>          *addr = (entry->addr + entry->size - size) & ~(align - 1);
>> +
>> +        /* Avoid kernel range, if this is the region it lives in. */
>> +        if ( *addr < kernel_end && *addr + size > kernel_start )
>> +            *addr = (kernel_start - size) & ~(align - 1);
>> +
>>          if ( *addr < entry->addr ||
>>               /* Don't steal from the low 1MB due to the copying done there. */
>>               *addr < MB(1) )
> 
> If you clip addr to remove the kernel range for allocation purposes
> you need to restore it before the `entry->size = *addr - entry->addr`
> adjustment.
> 
> Overall I continue to think this will be much simpler if we passed
> around a rangeset.  This series is adding a fair amount of extra code
> to deal with overlaps between kernel/initrd allocations vs everything
> else, which could be solved more easily by using a rangeset.

I've started moving to that approach. With the kernel range removed from
the rangeset early on, the need for this separate patch then disappears.

Jan

