Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50519C5B572
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 15:43:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390262.1630767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuXaU-00038L-5m; Thu, 13 Aug 2026 15:43:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390262.1630767; Thu, 13 Aug 2026 15:43:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuXaU-00038E-1s; Thu, 13 Aug 2026 15:43:22 +0000
Received: by outflank-mailman (input) for mailman id 1390262;
 Thu, 13 Aug 2026 15:43:20 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wuXaS-000388-Iq
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 15:43:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuXaR-00DZXO-Vi
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 17:43:19 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7de617-e002-0a2a0a5209dd-0a2a45048056-6
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 17:43:19 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7de617-b57f-0a2a45040019-d1558035e8ef-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 17:43:19 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4954f5e8020so299975e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 08:43:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f2c6115sm210937f8f.32.2026.08.13.08.43.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 08:43:18 -0700 (PDT)
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
        d=suse.com; s=google; t=1786635799; x=1787240599; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TWsqFzALJKPZBNysmY/yHO0BLhVYAJqhpdVrSsud/3s=;
        b=Chzw7kgmbD+b2+R9HNwIbEusaNU/Je3oSm40wYwOwyaJIViuqJ+HwxxF6j5m6pvk2o
         Xthuk4jmWk/et+pv4Ru/p4y/4rd9F7Z9TwEP0fPGhguW0nAAGZ/+GNRPBeIBINzIVZIV
         cfesvzT6dnTMIyGRZBrO52NlWaeXF6O7yOvoVqXmQ5yHH20rUbZ8wtefj3dTbeYSQP5G
         sBSVsA4S3/zPMFroExkMflX96XZHnXFaFkkRRk3zEkx4PjJJY/Gza9U4cSuf7IExEeUq
         NtI2SIiSbCvbQX+PmNzvCKPrcC2aEd3w02QxlpJKIGaWR9Nntt6Gt6TsBn3e5LgzziMO
         gd+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635799; x=1787240599;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TWsqFzALJKPZBNysmY/yHO0BLhVYAJqhpdVrSsud/3s=;
        b=q3BhH4l1IM+OYV1sw1TYrmrHyuYEbLRBJBsPnpfq3s9M20bCh/wAJE3ghoFmSrhOjN
         2j61pkdSZV/kta1LjxKXfdIX9cgkNPNrqWvl9UP4Odd4K9ESHOCSzcPRTqLo0zQSD0xN
         GiDdgU+4LigSU9DZOIVbJHv8u0fSXRZd1TQ5fFKDhxJYH7hgXs6FLCUqv16ESC9Npa9p
         vbbofaRPpop8ldslHFGe5W12DhuKpALTUsy74eOgT62AC2uVHlZ8pxJdZD4XvkJrSff8
         IHwrkqQC10oXpnBQf7fVZEchi5tVHR5OJBWXeWP55Hge6B+T+xxslTV7Q9maqGs3pfzB
         B8uQ==
X-Forwarded-Encrypted: i=1; AHgh+RqP2imOficYmU0kakZTnq5WnaGskeDDdv3BZECdWebWsdZcY7CSg70SYZQORP2gPfJ54fZXUccYdtw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzO4ejhG5A9tVQqLqhXl682Hxy691qix9dxlj9kvXNBmWAHhWRK
	4yK+08M+Je0MF0NRj3FstPLwZFyRhROjK1XhL0Yz8Y16EKbKiz2GntKw7xjzsKV2IA==
X-Gm-Gg: AR+sD12WZ2rmi/YaG80RyMvKOgnCymUfIPvOOSRaJxQm8DlVhpBQUSSlqpRxIIt2JRG
	V9HXP+F2rn/Qr13k1IJbZf36YIcS7BXnuyJGnVu2pdpM7Wps31dZ4xsHti7SkvbSYbY3DXBEiw+
	466XujGzdkdVy49JZJngX+cADYw4dVxd3U1bi/yQwzLiaQ73gIGxI1DkJVX0ux/fV7MGbp1F7gw
	ZoKP7uW6js7nRveGaxziziHj+pzWoniYRVXqI0VRc9cKl7xNgUZcsKFVJw7a1LY6dZ4JX3rl7l4
	CUnG0yMDUtRhRQI7vs77XweqSXVbA4r/U1mGvv7JD/TxcmmgnNVC6FrczCCPPXGSMJ9ICiZl3aq
	4rzIHVhA7RFfGQQGFIYEhdTgHJUvCS5Tjn1nD1BVX/thPoD/iit0l8ScB9Ur7CKcxWat5vwSVsx
	AUffs9bFAq8QpsB1WVjWv2pSCwBjnl13Z/MctLQDib2QsG4WauQdBxYQNafm78jESZxEd8ZMaeB
	z/GYRP4/+EAyo6kRzQjmAZ3i2Dn6NnbdP5Iy/rQnqc5Zw4N2NFa
X-Received: by 2002:a7b:cb07:0:b0:499:8743:77c8 with SMTP id 5b1f17b1804b1-4998743785dmr7017325e9.8.1786635799048;
        Thu, 13 Aug 2026 08:43:19 -0700 (PDT)
Message-ID: <1d154b5a-a053-40e6-b0d6-36dc9baa2ade@suse.com>
Date: Thu, 13 Aug 2026 17:43:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/20] xen/riscv: introduce guest riscv,isa string
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1785836421.git.oleksii.kurochko@gmail.com>
 <59b5b69f53ef81d68fd279d9ee0c03f5ffbbc2ae.1785836421.git.oleksii.kurochko@gmail.com>
 <3bb59f64-7ff1-4bdc-b951-cfb78671e8f9@suse.com>
 <9abc0091-43e5-475e-ae61-697f480dda5e@gmail.com>
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
In-Reply-To: <9abc0091-43e5-475e-ae61-697f480dda5e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1786635799-504DBB50-48D81178/0/0
X-purgate-type: clean
X-purgate-size: 4844

On 13.08.2026 17:37, Oleksii Kurochko wrote:
> On 8/13/26 9:19 AM, Jan Beulich wrote:
>> On 04.08.2026 17:47, Oleksii Kurochko wrote:
>>> @@ -120,29 +148,30 @@ static int __init dt_get_cpuid_from_node(const struct dt_device_node *cpu,
>>>    * and strncmp() is used in match_isa_ext() to compare extension names instead
>>>    * of strncasecmp().
>>>    */
>>> -const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
>>> -    RISCV_ISA_EXT_DATA(i),
>>> -    RISCV_ISA_EXT_DATA(m),
>>> -    RISCV_ISA_EXT_DATA(a),
>>> -    RISCV_ISA_EXT_DATA(f),
>>> -    RISCV_ISA_EXT_DATA(d),
>>> -    RISCV_ISA_EXT_DATA(q),
>>> -    RISCV_ISA_EXT_DATA(c),
>>> -    RISCV_ISA_EXT_DATA(h),
>>> -    RISCV_ISA_EXT_DATA(zicntr),
>>> -    RISCV_ISA_EXT_DATA(zicsr),
>>> -    RISCV_ISA_EXT_DATA(zifencei),
>>> -    RISCV_ISA_EXT_DATA(zihintpause),
>>> -    RISCV_ISA_EXT_DATA(zihpm),
>>> -    RISCV_ISA_EXT_DATA(zba),
>>> -    RISCV_ISA_EXT_DATA(zbb),
>>> -    RISCV_ISA_EXT_DATA(zbs),
>>> -    RISCV_ISA_EXT_DATA(smaia),
>>> -    RISCV_ISA_EXT_DATA(smstateen),
>>> -    RISCV_ISA_EXT_DATA(ssaia),
>>> -    RISCV_ISA_EXT_DATA(sstc),
>>> -    RISCV_ISA_EXT_DATA(svade),
>>> -    RISCV_ISA_EXT_DATA(svpbmt),
>>> +static const struct riscv_isa_ext_entry __initconstrel riscv_isa_ext[] = {
>>> +    RISCV_ISA_EXT_ENTRY(i,            true),
>>> +    RISCV_ISA_EXT_ENTRY(m,            true),
>>> +    RISCV_ISA_EXT_ENTRY(a,            true),
>>> +    RISCV_ISA_EXT_ENTRY(f,            false),
>>> +    RISCV_ISA_EXT_ENTRY(d,            false),
>>> +    RISCV_ISA_EXT_ENTRY(q,            false),
>>> +    RISCV_ISA_EXT_ENTRY(c,            true),
>>> +    RISCV_ISA_EXT_ENTRY(v,            false),
>>> +    RISCV_ISA_EXT_ENTRY(h,            false),
>>> +    RISCV_ISA_EXT_ENTRY(zicntr,       true),
>>> +    RISCV_ISA_EXT_ENTRY(zicsr,        true),
>>> +    RISCV_ISA_EXT_ENTRY(zifencei,     true),
>>> +    RISCV_ISA_EXT_ENTRY(zihintpause,  true),
>>> +    RISCV_ISA_EXT_ENTRY(zihpm,        true),
>>> +    RISCV_ISA_EXT_ENTRY(zba,          true),
>>> +    RISCV_ISA_EXT_ENTRY(zbb,          true),
>>> +    RISCV_ISA_EXT_ENTRY(zbs,          true),
>>> +    RISCV_ISA_EXT_ENTRY(smaia,        true),
>>> +    RISCV_ISA_EXT_ENTRY(smstateen,    true),
>>> +    RISCV_ISA_EXT_ENTRY(ssaia,        true),
>>> +    RISCV_ISA_EXT_ENTRY(sstc,         false),
>>> +    RISCV_ISA_EXT_ENTRY(svade,        false),
>>> +    RISCV_ISA_EXT_ENTRY(svpbmt,       false),
>>>   };
>>
>> Just as an independent, up front remark after having looked at patch 16/17 of
>> the other series: Is a mere boolean going to suffice in the longer run? I could
>> see some extensions wanting exposing to only RV32 or only RV64 guests. E.g.
>> Zilsd is RV32-only, while Zqinx quite likely would want restricting to RV64.
> 
> Good point generally.
> 
> Right now the distinction can't be observed: RV32 isn't buildable 
> (#error "RV32 isn't supported" in asm/config.h), and guest XLEN is 
> hard-wired to host XLEN — build_guest_isa_str() emits the rv32/rv64 
> prefix from the Kconfig symbol, and riscv_isa_parse_string() rejects a 
> host ISA string of the other width.
> 
> On top of that, extensions with an architectural XLEN restriction are 
> already filtered out for free: compute_guest_isa() masks the table 
> against the host bitmap, so an RV32-only extension like Zilsd can't have 
> its bit set on an RV64 build regardless of what the table says. The 
> boolean only ever subtracts from what the host actually reports.
> 
> That leaves purely policy-driven per-XLEN restrictions — e.g. exposing 
> Zqinx to RV64 guests but not RV32 ones, since Zqinx is architecturally 
> defined for both.

Is it? Can you point me at a spec, as I wasn't able to find any?

> Those only become meaningful once guest XLEN can 
> differ from host XLEN (i.e. hstatus.VSXL support), and at that point the 
> shared guest_isa bitmap has to become per-domain as well, as the comment 
> above it already notes.

Not necessarily - you could have an RV64 one and an RV32 one.

> So I'd rather keep the plain bool for now and widen it to a flags field 
> when there's an actual case; it's a mechanical change to the struct, the 
> macro and the single test in compute_guest_isa(), all local to 
> cpufeature.c. I can add a comment stating the "guest XLEN == host XLEN" 
> assumption so the reason is on record. If you'd prefer it as flags from 
> the start I don't mind doing it now either. I just don't have a way to 
> give either value a meaning yet. So if to do that now I would suggest 
> the following:

I'm fine with a comment, and I'd also be fine with the more extensive
logic. Main question being whether "guest XLEN < host XLEN" support is
meant to be added within the foreseeable future.

Jan

