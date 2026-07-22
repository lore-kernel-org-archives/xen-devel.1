Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86282C4451C
	for <xen-devel@archiver.kernel.org>; Wed, 22 Jul 2026 07:26:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1368164.1617649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmRL4-0007Uw-Dg; Wed, 22 Jul 2026 07:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1368164.1617649; Wed, 22 Jul 2026 07:25:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmRL4-0007Up-An; Wed, 22 Jul 2026 07:25:58 +0000
Received: by outflank-mailman (input) for mailman id 1368164;
 Wed, 22 Jul 2026 07:25:56 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wmRL2-0007Uj-Es
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 07:25:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmRL1-003MA3-Gj
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 09:25:55 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a607076-e002-0a2a0a5209dd-0a2a4505dbee-32
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 09:25:55 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a607083-4cb1-0a2a45050019-d155dd29e953-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 09:25:55 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-47f7027ca11so2530927f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 00:25:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85c67339sm3547028f8f.31.2026.07.22.00.25.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2026 00:25:54 -0700 (PDT)
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
        d=suse.com; s=google; t=1784705155; x=1785309955; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lc3WFYehMRjFDh2jw61gUKjIm9F4rkbF89KNXp20xVw=;
        b=Xdq3oBCDdZFXoe4GyXAqO04jaqWNo4XEP1zkH7txJHFZ+klvGo9WaWbbgokYHe7ESy
         pboqchfIzvMCgLcpGefQ2cltahBAVwn5bGTI/M4y3j64DNIFENe2S9TG3HEQ1G5XTDSz
         P9GXgeT5sFWOXV90W2g4bGTZ4drUY37ozCyta1wahBfXZvyd3h8PVWx49ZpCTBW/368q
         TxtdGrDIrEchYN2gBZ87YU6rtTlyB3RkZbsk0X0w/IO96jkwMuHZF4lA5YWY30XKtGjb
         O7rvFtPbnJgu2dL2lOeXMB+Na5YeAe9KFn2HytLry+yD0BCf3uob75rmODghHStgVQbu
         Vvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784705155; x=1785309955;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lc3WFYehMRjFDh2jw61gUKjIm9F4rkbF89KNXp20xVw=;
        b=Be/eZaj3KiHdKBK4s7PZGU9hteKpNsC1XWuEHi6vDAqucNo9eeqP3BFLUIARgvMs41
         aUN5fvoQcNtp+q58imQUd8/yZHSEOEtYbkauun5w2nsP7erh0MpD/pm76NwgD7ndTxIi
         1NLLCNEIEcF2zq4AUZfvXF6/CBFjBj0VtbzbOR51Ud/z3iG1soF3NGNQUYWZ+8mHb7AF
         A371iklvFCneMmaH4+xvQa4/bbSlGBo4QO7qEMAEAdXUwo+9iAW6hcIzmqPofgmbtb7O
         t5oE7gIaBQuVguEDMQTb7upBQotgUgM2CsvIDH6/2N5kJivSQKdLDNDQwmF+PQTXWhCO
         Nd/w==
X-Forwarded-Encrypted: i=1; AHgh+RqvMkF+hONO7f2vo1wy+mPJ4+Ea89Em0Ot7uPkCGuN0std0sCSOxY+ss3U3k57OwKhGIO2ZfmoIv/0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzczpS08/p49jj5ff7VZWHKQdJFdcepduJomeRmyVXNuKAjNZ4W
	uRsDu3s3c37j/LRWg16i7YFoy/kkBojCrfrpVvNfwRgpLDM2ftDT/+go1ljwR59/+A==
X-Gm-Gg: AR+sD13iq3Jhbtp4sTf24ZLBPOEwhogcUs6BCYcJ2QIJ2tij4DEfol+vie2O/8hNCbM
	/WvR8qL9BGMnm1l8CcToPgu71t4qySRbV8ftYsIOgqEPuj8lU3uk5ZO12M8Tbs7EdIdkld32K6r
	k2nzrpgaPGD5byR3cNVA/RgwsU6WYm3Q9sDcKTFp5iMXdGcGD9QZZA0/nBCJEf/xlrKAX0uO/Nk
	S0m1cXhAhkMbnmlSiY8lz6fyDiNg/WvvWoh+5OY1kSQMGEd9mOIDclpFvZIa+v0zyLons5RAZMF
	WyLmPfzccjv1nwJoTS0CRBwg/+xNVT9VZdsTSA89TGc9qinetXRHYI3GgDutaMgmJ8FyrYlNxXc
	BmbK5oFx4v3WGnVpXG4zbxdv2HkNwLY3dHi/wKPgrpwAM51cIA35P6+M1LMJyMrvW6nYlLDglKs
	YTXv5jGShq8mwd1EvrRdqPeAsZ6wiqu4Nmz4X42YMg1M+lYnAuCAAm6TXUKgQc8VjsJw==
X-Received: by 2002:a05:6000:2208:b0:47f:7736:5485 with SMTP id ffacd0b85a97d-47f7736551dmr16258443f8f.16.1784705154932;
        Wed, 22 Jul 2026 00:25:54 -0700 (PDT)
Message-ID: <d329d1c0-59b1-4aa8-b72d-5aad3e310f07@suse.com>
Date: Wed, 22 Jul 2026 09:25:52 +0200
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
In-Reply-To: <9f5d1005611daa4ba9e4324950fcfe10adbebc32.1784559209.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1784705155-F5CA82A1-A858D65B/10/73395122804
X-purgate-type: spam
X-purgate-size: 2751

On 20.07.2026 17:59, Oleksii Kurochko wrote:
> Introduce build_guest_isa_str() to generate the riscv,isa string to be
> passed to the guest via the Device Tree riscv,isa property.
> 
> Introduce the per-domain guest ISA bitmap, populated during domain
> creation by calling init_guest_isa().
> 
> Introduce struct riscv_isa_ext_entry with a new guest_supported field
> to filter out ISA extensions that should not be exposed to guests:
> 
> - f/d/q/v: FPU and vector context save/restore are not yet implemented
>   for guests.
> - Z*inx are not exposed either: they aren't in riscv_isa_ext[], so they
>   can never be set in riscv_isa and thus never reach a guest, and no
>   current hardware/guest-OS advertises or expects them. Supporting them
>   would be cheaper than F/D/Q (FP values stay in integer registers Xen
>   already context-switches), but is left as future work.
> - h: Nested virtualisation is not supported.
> - sstc: Xen owns the supervisor timer; guests must use SBI.
> - svade: Xen manages hardware A/D bit updates in stage-2 page tables.
> - svpbmt: Page-based memory types are not yet wired up in stage-2 code.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

In principle
Acked-by: Jan Beulich <jbeulich@suse.com>

But see below.

> ---
> Changes in v6:
> - build_guest_isa_str() now takes a `const struct domain *d` instead of a
>   raw `const unsigned long *isa_bitmap`, to leave room for using more than
>   just the bitmap in the future.
> - Compute the guest-visible ISA bitmap once at boot, into a new
>   __ro_after_init `guest_isa` bitmap (compute_guest_isa(), called at the
>   end of riscv_fill_hwcap()), instead of re-deriving it from
>   riscv_isa_ext[] on every domain creation in init_guest_isa(). All guests
>   currently get the same extension set, so this avoids repeating
>   identical work per domain; will need revisiting if/when per-domain ISA
>   policy is introduced.
> - struct arch_domain's `isa` field is now `const unsigned long *isa`
>   instead of an embedded bitmap; init_guest_isa() just points it at the
>   shared `guest_isa` bitmap rather than copying bits into a per-domain
>   array.
> - Mark riscv_isa_ext[] __initconstrel, since its entries hold name pointers
>   and the need for relocations requires that the compiler emit the data to
>   a writable section.
> - Make build_guest_isa_str() __init as it is called during make_cpus_node()
>   which is used only (at least, for now) in build time of domain.

This last item is confusing. For one as there's no call site being added here
in the first place. And then - why would the string need re-calculating when
the bitmap is calculated once at start of day?

Jan

