Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74486606D801
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 08:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=awIrjvQO
Received: from list by lists.xenproject.org with outflank-mailman.1474160.1681340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOseo-0002pU-Px; Thu, 05 Nov 2026 08:17:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474160.1681340; Thu, 05 Nov 2026 08:17:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOseo-0002pN-NA; Thu, 05 Nov 2026 08:17:14 +0000
Received: by outflank-mailman (input) for mailman id 1474160;
 Thu, 05 Nov 2026 08:17:14 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOsen-0002pF-U7
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 08:17:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOsen-001tVb-AW
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 09:17:13 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec3b83-e002-0a2a0a5209dd-0a2a450c8d26-12
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 09:17:13 +0100
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec3b88-f479-0a2a450c0019-d155dd2ded5f-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 09:17:12 +0100
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-49134c8509fso383623f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 00:17:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fec9cd43bsm8367175f8f.14.2026.11.05.00.17.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 00:17:11 -0800 (PST)
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
        d=suse.com; s=google; t=1793866632; x=1794471432; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XtKnvmgSDaqlQwQ2TRsG1iT3rywgtoX+h12yW3Ak9ug=;
        b=awIrjvQOelgSBWHSNx6oG8AK09A/RxT9sfPIaHTHmxTiWsWPAJ8bJ8+q71fxVpyRIT
         EmRrx5uAXleE3RTry0E0YkmJghRY4tH5hwwIHKT06bu+XHFPPVcfgs02KAQLgXhfXpFV
         oltjIAWeOBwv0OKHzCa5lH+4nIVmHRGEp9Lmk6Mp/C9J04oNC1wZEXL9bYp10ga4pxm7
         wrhn8UgbY21tSD3tZfJsS1Dxx05HC/VLArs66eO/0wSXxziBNroDluG/ftUkJrGbx3bv
         8hMfsQzvKfwYPdb/nzsBl5wp2092XEMiGlW9C0uHNFFKGB4004eyv6iEZPHm1qaqH8g8
         4MPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866632; x=1794471432;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XtKnvmgSDaqlQwQ2TRsG1iT3rywgtoX+h12yW3Ak9ug=;
        b=Bz20YENjoAQYhd2krpZgNBsZKk0ywk4/leU0r2MZAdY3bHh49rjdTAf+20efRtB2R4
         8cLaXKFu+w/Lhup8/l4DQMKwssKVulUJhBZTBT7/N3HasXI7p3AU156o1dgy/vDHVctc
         z1KM2HpsZtQaNd8p8LmOuyB/sYuR3XnIU0X8JA7M6U4NMIRpEUcDIFn5IHJzvnpKyNiz
         FCFp4fK2hv8POrom9R1iF+OHuc5zAOYC9iHStEUv0e/4OE1eQucmJq9W3mUpiaSy+Jg7
         NIgtkVNVRWivmj6wgtHPepcZD7G3Ud5y81TAXe9yf9V9QWN6+9zegqRe0D1mdSakG79W
         IXzg==
X-Gm-Message-State: APuU4Z8NNMTEVTRvTtK3s/rvH0S9uLb/IsBD8XgoS0rGN4e2enAxf6P4
	e9SvRaJGzA8TGlyY8Cc3ljQwT7C3PiryooxAtDtCjn58P+51aVs6toDqt+dhuGzARQ==
X-Gm-Gg: AYBFou3R+ShBdOt6d4icRHt1S/slKbjgw7Hf0LvRkkEhIUczN7sWxgVHNNwfBjlxv9t
	7Kzib+q1GHwPqcXqm7VZsxOqoiCC8u6dm2rX5zk/amkkbjzA8ZasNQzZ4gA47+HuKHq66otqyeb
	AfNTY9B2LtJvbxSkb4wu3VguqYPcQG+F8Fcv4jm4ukgc1FafZkWQb0Yh1bQfGGu1gSCHq1RX0am
	nN0porJdJ7bOcgSzM056lnZETHtitwLdj0+VWtdk4Rd/p0Ue0EhGHbH2OwUvB977O8dBqFamK7e
	enderU60M0o7O0PAgK8608J+NErOw6yH3uHTC7+PKSCYgz48BinQL/q0Nf+TXWKDPEkCzIyOeek
	OX2wRwpsrWM6uYKpC03PvUsSE9KDD32HgEUKHvqN/Xqcqze/Y7ye8pFy86b0Z6n4manReTdMTHC
	SXd8kRSlxztSH3bi2pxWUJ/egqLMAcJyIDMMgwl+YcXlIuHj9dp3ei1gxqov/hryG/KLT2QEe+B
	zcq6+HxJ/xrGIMqfAQc8VsgnidwCpFXvN1mLjT+pPb48+DwgrgMJ13yl2raVBVjQIrasCJqXYPj
	xR28fHb0SvWHLDklpnonmYMvPJMCoBV8BTCraYcoXMrgn4ljYL8ueVdUoX7ZJewvnt50XLfBt5p
	NAKv0ybYfAIRlGMjl
X-Received: by 2002:a05:6000:616:b0:48b:108:48cf with SMTP id ffacd0b85a97d-48e6e30ba2cmr41055651f8f.25.1793866632088;
        Thu, 05 Nov 2026 00:17:12 -0800 (PST)
Message-ID: <c121b7cc-30c2-4ba9-b9c9-a52076d25f22@suse.com>
Date: Thu, 5 Nov 2026 09:17:10 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 23/39] xen/riscv: add helpers for decoding a trapped
 load or store
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <bac190288e65f82ef51d85e32c939558c21776d0.1790779209.git.oleksii.kurochko@gmail.com>
 <1792663384.8631fc262581453bbf619ec5b2062170.1a1631070d2000f79f@vates.tech>
 <8f6c0cd1-f5fc-4a1d-8752-3da42a52a710@gmail.com>
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
In-Reply-To: <8f6c0cd1-f5fc-4a1d-8752-3da42a52a710@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1793866632-02ADCA5B-063681BB/10/78276251493
X-purgate-type: spam
X-purgate-size: 2272
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 04.11.2026 17:38, Oleksii Kurochko wrote:
> On 10/22/26 12:02 PM, Baptiste Le Duc wrote:
>>> + * It is needed to decode a trapped instruction: the encodings which exist only
>>> + * for XLEN=64 must not be recognized for a 32-bit guest. Besides those simply
>>> + * being reserved there, the compressed ones are ambiguous: C.LD and C.FLW
>>> + * share the encoding 0x6000 (mask 0xe003), and likewise C.SD/C.FSW,
>>> + * C.LDSP/C.FLWSP and C.SDSP/C.FSWSP.
>>> + *
>>> + * IS_ENABLED() can't be used here as HSTATUS_VSXL is defined for
>>> + * __riscv_xlen == 64 only, the field not existing on RV32 in the first place.
>>> + */
>>> +static unsigned int guest_xlen(const struct cpu_user_regs *regs)
>>> +{
>>> +#ifdef CONFIG_RISCV_32
>>> +    return 32;
>>> +#else
>>> +    unsigned long xl = MASK_EXTR(regs->hstatus, HSTATUS_VSXL);
>> xl only ever holds a 2-bit field, so unsigned int would be better here.
> 
> MASK_EXTR() yields the type of its operands, unsigned long here (and 
> unsigned long long for the UXL extraction), as do the XLEN_FIELD_* 
> constants xl is compared against. Making xl unsigned int would add an 
> implicit narrowing conversion: harmless value-wise but I think it will 
> violate one of MISRA rules at least if build everything with 
> -Wconversion then it will tell: conversion from 'long unsigned int' to 
> 'unsigned int' may change value.

If we were to follow that Misra rule, we'd have violations all over the
place. Hence imo where unsigned int is sufficient for a value, that's
what should be used.

>>> [ ... 49 lines skipped ... ]
>>> +static unsigned long *guest_gpr(struct cpu_user_regs *regs,
>>> +                                const struct decoded_insn *di)
>>> +{
>>> +    /*
>>> +     * decode_ldst_insn() is what fills @di in, and it rejects an access
>>> +     * wider than a guest register.
>>> +     */
>>> +    ASSERT(di->len <= (guest_xlen(regs) / BITS_PER_BYTE));
>> Nit: the parentheses around the division aren't needed.
> 
> I can drop them but I think it improves readability here a little bit.

That's subjective. Personally I agree with Baptiste, yet project-wide
we don't do things consistently in this regard, and hence either form
is (supposedly) okay.

Jan

