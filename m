Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD403CCA462
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 09:02:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451408.1666474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHdox-0004yJ-D5; Fri, 16 Oct 2026 09:01:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451408.1666474; Fri, 16 Oct 2026 09:01:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHdox-0004yC-7o; Fri, 16 Oct 2026 09:01:47 +0000
Received: by outflank-mailman (input) for mailman id 1451408;
 Fri, 16 Oct 2026 09:01:45 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHdov-0004y6-Ku
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 09:01:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHdou-009wen-Qq
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 11:01:44 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad1e7f3-2eae-0a2a0a5409dd-0a2a450ad11e-12
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 11:01:44 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad1e7f8-f2d2-0a2a450a0019-d155dd2fc47c-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 11:01:44 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-48b060ec084so3997248f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 02:01:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1c8de8c58sm42241235e9.15.2026.10.16.02.01.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2026 02:01:43 -0700 (PDT)
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
        d=suse.com; s=google; t=1792141304; x=1792746104; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gMy3fFxT0pnvyU53pkFRWNzK567H81OB9IKHouNp6bg=;
        b=GfYtu9C06xRDTBJES/87JVGFmzTG7Uq6rS0xu9wkHS2NCf+e8Dnsnj0pALx+rNtvDu
         9qMKbVkN6FWuupndYHavO/ntZUg+Rudjr7ts55xZSFmERyun+XWQIPeF8TiqCdaDQcOp
         piaTozL47b5KsIsazTr9NYmHb/9HRxTihRz44ckVxjhfAJEvaav9V+6+5ud5b2Ld+qWn
         g8dqAdx2ThbhRWi5rsDWXUI+Zp/nxQpK1gP05zwj+d/9xmseJBoLmMiOdyNRdHSzz2kV
         UYPeOv8jHpF08Elt5f69EnVkPEA5LFTArFeDedrg7NIWTcz1aeqgBcLsFm1iN9ME0lc9
         vzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141304; x=1792746104;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gMy3fFxT0pnvyU53pkFRWNzK567H81OB9IKHouNp6bg=;
        b=iOzPwmwxvC+/dfXXdCCT8g7MyYEOrchYikg2tOrUstIsLWq1SwevESQ8790+mluEBc
         JWM2aHhdE3oFCJ7TDmMLbK3oB+XHl/9o4fjt9Qozin+zJ10x4YQ750b73J8aUhmN7LaQ
         cezp93O0FAGRmAx/oFJ51PddIWCdwQWcgISn7zQ+6BXhHvwxmFRBt1pWDhXB+212mYz5
         z/t5Enuv1UuaRYBuxoc5ZMvpBIVWhEMCpILzHGCsKnLLJFp1geuzK7X2UdUQvsLjrUZd
         Nqqnqc2OO8k73hN2L6nxso/3BkTKZrFfcD13qKfYZmKQZ2SKJJDfaWTht70J38Lr5Q0P
         hPBQ==
X-Gm-Message-State: AFq9FYKPcDV+jSjltB4BZ6sKAYvvSLQbjyuZfRrNjfu6W91HD0Ep//Pj
	QnRNSAIgL4esZYkhQGMwUT7fbD/EMt9qubv/e4ExrKO8X9iS5D8KYHZ9PN6EuGUZ2A==
X-Gm-Gg: AYBFou0vd18LgG1bP/2VHLdbXylX2rAKlk6b2tpOABHPl7OUc/zRiII5GGlqO17QQKd
	q2GvKVymOEVO2SUI/myLlEDMbdgJ912ILWB6kwxPDaARKcPZnuYpcL+ZRzdJdjOqAGGbWiBC7v8
	E/kz9DHizGO9atwch6VU2K6LAE8IKkWIa6KEgdCtaDuN8muoRnrLYbrNa3or82j85HHNXvQYbGc
	V/XrdN9zQwuuydgaOMH6dU5fUM/nizvgpaPYPgps5iu8msDn5ioeztTu8Zenf91Nq6MIhIY7khy
	CIhzxGlcpHxtkC8P0Ky36HQjudC09j8dkXp/ltjQxwiS/6eNtnAo123CIiCSlAfvTfLFHQwuo9s
	/ED7tCsjkR2RrXJez6RF2XNYyRQAsC3sMHtuchamIO6fyV4GZkJz+mFo1p6d9y4NM3mU+3gyM4Z
	PaVYxPbzPbT6r5AJYrGL788XOaYLphkhTyuw6lx+VzwGd82hciDmN7HNFmozG4B+WMkNbdpgf0n
	MYLsqFyscUhPINLD3KddxZ3CvCuUABjvKtR34eWnJL8+ITdxVxMY2YdU5hi7VQ=
X-Received: by 2002:a05:600c:8184:b0:4a0:1c17:4fb2 with SMTP id 5b1f17b1804b1-4a18e4d854cmr419203925e9.31.1792141303958;
        Fri, 16 Oct 2026 02:01:43 -0700 (PDT)
Message-ID: <4912ef60-b5e9-4f48-8043-97f51359e7a4@suse.com>
Date: Fri, 16 Oct 2026 11:01:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/15] x86/PVH: log Dom0's E820 map earlier
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <f5cb5cdc-17b0-4678-aa0b-36a0a8a00cc3@suse.com> <atHRIjktRnqUGEZd@Mac.lan>
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
In-Reply-To: <atHRIjktRnqUGEZd@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1792141304-593C4CFC-7522B6E8/10/78276251493
X-purgate-type: spam
X-purgate-size: 2144

On 16.10.2026 09:24, Roger Pau Monné wrote:
> On Mon, Oct 12, 2026 at 10:26:24AM +0200, Jan Beulich wrote:
>> Do this as soon as it's final. For debug builds also mark it final, with
>> assertions put in place to make sure it won't further be altered. (For a
>> release build such further altering isn't the end of the world normally,
>> so the situation is left alone there.)
>>
>> Switch to using %pd while moving the code up.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -46,6 +46,9 @@
>>   */
>>  #define HVM_VM86_TSS_SIZE 265
>>  
>> +/* Marker set once Dom0's E820 isn't supposed to change anymore */
>> +static bool __initdata e820_finalized;
>> +
>>  static unsigned int __initdata acpi_intr_overrides;
>>  static struct acpi_madt_interrupt_override __initdata *intsrcovr;
>>  
>> @@ -195,6 +198,8 @@ static int __init pvh_steal_ram(struct d
>>      struct e820entry *good = NULL;
>>      unsigned int i = d->arch.nr_e820;
>>  
>> +    ASSERT(!e820_finalized);
>> +
>>      /*
>>       * Alignment 0 should be set to 1, so it doesn't wrap around in the
>>       * calculations below.
>> @@ -241,6 +246,8 @@ static int __init pvh_add_mem_range(stru
>>      struct e820entry *map;
>>      unsigned int i;
>>  
>> +    ASSERT(!e820_finalized);
>> +
>>      for ( i = 0; i < d->arch.nr_e820; i++ )
>>      {
>>          uint64_t rs = d->arch.e820[i].addr;
>> @@ -1759,6 +1766,13 @@ int __init dom0_construct_pvh(const stru
>>  
>>      pvh_place_initrd(bd, &elf, &initrd, &blob_start, &blob_end);
>>  
>> +    if ( opt_dom0_verbose )
>> +    {
>> +        printk("%pd memory map:\n", d);
>> +        print_e820_memory_map(d->arch.e820, d->arch.nr_e820);
>> +        e820_finalized = true;
> 
> You want to pull setting e820_finalized out of the if body, so it's
> not tied to opt_dom0_verbose being set I think?

Hmm, yes - not quite sure what I was thinking.

> The rest LGTM, so:
> 
> Acked-by: Roger Pau Monné <roger@xenproject.rog>
> 
> With the above change.

Thanks.

Jan

