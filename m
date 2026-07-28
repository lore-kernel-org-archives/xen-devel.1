Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE49C54F5E
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 15:53:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374955.1622310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wok7k-0000qH-Nu; Tue, 28 Jul 2026 15:53:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374955.1622310; Tue, 28 Jul 2026 15:53:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wok7k-0000qA-Kp; Tue, 28 Jul 2026 15:53:44 +0000
Received: by outflank-mailman (input) for mailman id 1374955;
 Tue, 28 Jul 2026 15:53:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wok7i-0000pE-U0
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:53:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wok7i-005Bzn-At
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 17:53:42 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68d072-bab6-0a2a0a5309dd-0a2a4506d82a-26
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 17:53:42 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68d085-195a-0a2a45060019-d155dd2ae8bf-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 17:53:41 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-47f6609c657so11576f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 08:53:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fb6b0ee81sm69972f8f.17.2026.07.28.08.53.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 08:53:41 -0700 (PDT)
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
        d=suse.com; s=google; t=1785254021; x=1785858821; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1OdBFH3HlFYCCrlRsVNKFtQSCMEDhM+Bng72g8CGjRA=;
        b=HH8RUCvFQl+Ir8N+mMzgdvn1CqCckwo/hDE4AoeCCR8TBFE8ku4TrO4xm/mkF1vM4h
         2PZt0YSDo0wfqkSycYHJmG36bngqLK4FF50Dltn6UbDnhh2YW280K5noeFQNF8+6MiaY
         Sv681pdLwnvIXE05no1NX9K21N1sfDHcbo+b8T4rjNw05mSJP6wjsjEvRp13Bu/Lbk8n
         hyrR7Vxb4TdvMQzC20tCCO4/tk+XKpOweb8/C4BuPZKaSp0X7KcXwVsMGFrk9UAphTWj
         efs4IUUPviEuyrTnmztaKW+ovbmQtliwKqx0weOI4FNa88b1nAgXmLtL9aFCZnM7jWFj
         BeBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785254021; x=1785858821;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1OdBFH3HlFYCCrlRsVNKFtQSCMEDhM+Bng72g8CGjRA=;
        b=E0hP5NiG/0WtiyvLUV3LxZzXfmuMxzNZrraOcZDvj4JZHZb37zPLbBsHxGz1ut2ScH
         472Mpsy8qxxwJTBa+rSGeXLGwhaqvNo9fzt3NZOlPyB2rkXE6RyKo738X3oukeTYbNqt
         gtbydTl58NZeP88txNaT0zmTs9TPGMr29ceC7WyI4cE7Pc9fnmwpY4icX6lT3o0BKCaM
         1RXvbX7Ku0J8twOEQW0DM7hkdLXqZSTrDm30QTnahb84dGXyaNWId9dVB5bwKDRpB7Fi
         rPySjMAJ2H/TRr6Bo1dLQDsYzhIS7lcEfuhIGw45d3yMTV9T+PNuJxBX1KFvxlXMuYU7
         McLA==
X-Forwarded-Encrypted: i=1; AHgh+Rq36WMK5XqIMQaipiDRz32bX+bGM8NtIK7LAPsuE3PLB3zTEqbGUbryTWGBKNk6G/VfSOq30RWzT7Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywbuk6iwG/HqpFncg9oK+RrsonANd3Qyv1OvK0JqaY1WmHTEA/+
	AhI1o6huA6sElW/7fVwx0apWrZKJ8OLhUaswxc3Z1Kgo+w91J3YitkuVn3Gly9XpolFlMbxVdI+
	DBIgkmQ==
X-Gm-Gg: AR+sD12TK1OWLU++BppPNRzGBc949pz1Q5MSZmxDTt5bWzX7neO4FnhWIbsKcuOsW9s
	Xp1bw1pFAmXe/kG5obPlV+8swp0A9knmsFS0UT3Qucw7PoPDhOvH/G/qeYAsZAXlHXrlr4uybl6
	x3JMol1YucWeVVVs0eiw/CQ3X/feX1p1CxMEGO+XwrJopaQEOrF0W0jrubJx5OJmVyj7O5UGYni
	yHXD3ydfvVaIZTdsUNu5WLwly5XrRSsTj+NyQYAc5OXs3X1bxvzeg/7f1494rMC/cY/scQ1ZpPQ
	EaCYTEgSn3KhUMKgrO9VKjQDm+OKIrL/t8cUXNGTgGfddweT8yCNAh9kq8NKIiJa56r7GAuSLkp
	ljovfZXT7SezM9BIeco7FP1pCAZXjt1hXZbU37Hl+gmxJUT53RJMXuMSUlrLYWC2TQgvTy3w4S3
	aywA0tCOpe+EBZKLksrDLeacQ7DhziTPCIfN2bRcow8ofJnWCNQraLpwoNDiTSDqyEFg==
X-Received: by 2002:a05:6000:2908:b0:47f:52e9:3716 with SMTP id ffacd0b85a97d-47fb1eb7108mr3747470f8f.44.1785254021492;
        Tue, 28 Jul 2026 08:53:41 -0700 (PDT)
Message-ID: <1fc062bd-3ae8-4669-9f5a-55595fa93456@suse.com>
Date: Tue, 28 Jul 2026 17:53:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/23] xen/riscv: introduce guest riscv,isa string
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
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
 <9f5d1005611daa4ba9e4324950fcfe10adbebc32.1784559209.git.oleksii.kurochko@gmail.com>
 <d329d1c0-59b1-4aa8-b72d-5aad3e310f07@suse.com>
 <1e6d2cc4-4bf0-4035-b6fa-52bd111f03fd@gmail.com>
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
In-Reply-To: <1e6d2cc4-4bf0-4035-b6fa-52bd111f03fd@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1785254022-F560A77B-F10D2743/10/73395122804
X-purgate-type: spam
X-purgate-size: 3555

On 28.07.2026 17:47, Oleksii Kurochko wrote:
> 
> 
> On 7/22/26 9:25 AM, Jan Beulich wrote:
>> On 20.07.2026 17:59, Oleksii Kurochko wrote:
>>> Introduce build_guest_isa_str() to generate the riscv,isa string to be
>>> passed to the guest via the Device Tree riscv,isa property.
>>>
>>> Introduce the per-domain guest ISA bitmap, populated during domain
>>> creation by calling init_guest_isa().
>>>
>>> Introduce struct riscv_isa_ext_entry with a new guest_supported field
>>> to filter out ISA extensions that should not be exposed to guests:
>>>
>>> - f/d/q/v: FPU and vector context save/restore are not yet implemented
>>>    for guests.
>>> - Z*inx are not exposed either: they aren't in riscv_isa_ext[], so they
>>>    can never be set in riscv_isa and thus never reach a guest, and no
>>>    current hardware/guest-OS advertises or expects them. Supporting them
>>>    would be cheaper than F/D/Q (FP values stay in integer registers Xen
>>>    already context-switches), but is left as future work.
>>> - h: Nested virtualisation is not supported.
>>> - sstc: Xen owns the supervisor timer; guests must use SBI.
>>> - svade: Xen manages hardware A/D bit updates in stage-2 page tables.
>>> - svpbmt: Page-based memory types are not yet wired up in stage-2 code.
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> In principle
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks.
> 
>>
>> But see below.
>>
>>> ---
>>> Changes in v6:
>>> - build_guest_isa_str() now takes a `const struct domain *d` instead of a
>>>    raw `const unsigned long *isa_bitmap`, to leave room for using more than
>>>    just the bitmap in the future.
>>> - Compute the guest-visible ISA bitmap once at boot, into a new
>>>    __ro_after_init `guest_isa` bitmap (compute_guest_isa(), called at the
>>>    end of riscv_fill_hwcap()), instead of re-deriving it from
>>>    riscv_isa_ext[] on every domain creation in init_guest_isa(). All guests
>>>    currently get the same extension set, so this avoids repeating
>>>    identical work per domain; will need revisiting if/when per-domain ISA
>>>    policy is introduced.
>>> - struct arch_domain's `isa` field is now `const unsigned long *isa`
>>>    instead of an embedded bitmap; init_guest_isa() just points it at the
>>>    shared `guest_isa` bitmap rather than copying bits into a per-domain
>>>    array.
>>> - Mark riscv_isa_ext[] __initconstrel, since its entries hold name pointers
>>>    and the need for relocations requires that the compiler emit the data to
>>>    a writable section.
>>> - Make build_guest_isa_str() __init as it is called during make_cpus_node()
>>>    which is used only (at least, for now) in build time of domain.
>>
>> This last item is confusing. For one as there's no call site being added here
>> in the first place. 
> 
> Agree, I have to put that actual call happens in the follow up commit.
> 
> And then - why would the string need re-calculating when
>> the bitmap is calculated once at start of day?
> 
> It isn't re-calculated per call site, only once per domain build. But 
> you're right that today that's still redundant work: the bitmap is 
> shared, so every domain gets the same string. I kept the generation in 
> make_cpus_node() because the string is consumed there and thrown away, 
> and because per-domain ISA policy would put us back to building it per 
> domain anyway.

Which would be true for the bitmap as well. Imo both want treating the
same.

Jan

