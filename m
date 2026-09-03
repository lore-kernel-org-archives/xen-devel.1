Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944E2C624DB
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 07:33:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406468.1639746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x21wi-0007Hf-3I; Thu, 03 Sep 2026 07:33:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406468.1639746; Thu, 03 Sep 2026 07:33:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x21wi-0007HY-0h; Thu, 03 Sep 2026 07:33:16 +0000
Received: by outflank-mailman (input) for mailman id 1406468;
 Thu, 03 Sep 2026 07:33:15 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x21wh-0007HS-G3
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 07:33:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x21wg-002gb3-M3
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 09:33:14 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9922b6-8faa-0a2a0a5109dd-0a2a450cd6d4-34
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 09:33:14 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9922ba-f479-0a2a450c0019-d155802ced3e-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 09:33:14 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4998b5a63e2so20138525e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 00:33:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e800cfsm11558595f8f.12.2026.09.03.00.33.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 00:33:13 -0700 (PDT)
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
        d=suse.com; s=google; t=1788420794; x=1789025594; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NgXbwmnkoCwVx0ngQYojLIrjhrK77yejae5KALSPGE4=;
        b=PrJfjxaXLpqr0Wp2+ZgfgKLEBvSb0MaIwbeZqikwCNhBs+97uMM0/BhlYpAd+UcQ2c
         reWepdsvqP4Gj2DhUI8ix+HJGeLSIBxg7fzFoJZvhQsT1uE6dYcaKxv+4s0/Rm9SWR4a
         cO31NX7v6abjzJ53xxP32D3jgmluJ4CgIL/wvkRHNx+4qlKX9/LMk0gW/C0GQp69R+ek
         nqeouG4osCEDJsWO5z82b58gJsBhizP1cv94UIxoigskCKopT9AtTbm6ewa5z5VCdIQB
         11KmlqxLP49wY2fjWbgaY2eDKfgvFkb/pbtGm14r2dA/4W74RzpZcVpXBrJJL1QrSOl9
         aMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788420794; x=1789025594;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NgXbwmnkoCwVx0ngQYojLIrjhrK77yejae5KALSPGE4=;
        b=IHXkHs8mlWBagSW8OONhvuwihQnYfQBrwGzqfZw3J72Y/h6A/DGqIGN4RYKfwEiFcL
         z/6ETaWsYz9cFPw3AAO4izDgq/NAVxXxlWOo08SIDyT3oHlgYfdAqb1Dhm7Xw8pJxC7M
         MUow4dJU1EWSQ89XoDyLgwyVXP4UHnhEkl+vGcXRGJ8gu9U/rJSTFfp2sBU1ymR5Z1QM
         JKS6+pvCwj4qWrRLm4dxc3pREc999alNXlvA3unjBCrleHswf2da+GW9xLM/RhUkcrCA
         0AFXadqXQTt+vIEDGz9LzXjnmNtmy6u1x0aEcgVMNJKso85T2MqI4ZyU8k+rE4VXVeNB
         uZgw==
X-Forwarded-Encrypted: i=1; AKwUvByb0ZHcM9uY/2bXJglBOVbGE/Iuq9u43kDmaO1bcp7HfrQ8cq/Fm2h2rp/TMcNxfQPnDGBBjcdElxQ=@lists.xenproject.org
X-Gm-Message-State: AFuF++m57iPOJ3o6O+MWEiOt7d83vVDgGBS7FIE2LX11Iqm1YvS1Ek9Y
	QcBbQCJ+MC2VhQ5H7q7qP0Q+UH4BTm4YTKhWd0syfYuRnYbl+XI8ujI2Xoam01tC8Q==
X-Gm-Gg: AYBFou2En92G6wu/QXupIC8co4BN9WBI3RTN+WuBRkw+YoyvmmJuebqucVHYiFJdsc8
	goUjn0cU2yBQ4teiaee/EC8o5oWCLAlBZKdgvHqANLdiK3ltktDHgg1xYpPmqPqJH/pr1fDY62N
	F6gjN6S6NS4aRe/OyxiMqBC3E8dbf4DpJyN3eUK9k2Urj0SeIxYoQJ4ciIWNiY33QnDAHMgTCi1
	bKHf08E7nvpQ+Xtg5e2MQhBftovwvPeb5VCEQLY7xNQi0c6MMJufE89+Ki55fRWquPvfzDt5Fpj
	XdM9ABzxjH//AyCCMRbVLDqiKCno0j1tdODRFGAUkqUvDOPT0NUXx+4B95mts0aoR/N5mvKWb6G
	8hB6tHrcQeY6rwrQ1PBdtBUhqSV6zrZxbs2s+6pqBIKG9GgWXCUjEmB1lVUUMJYvLnzng6NGl8F
	hDsrAM+iBTzEEsmrxSGfrXSmntGSBZDNTK2CO1aom5GwEtxEO1O+xiVQ2SF4+vdZCFznAbs5JzI
	vQHAC4e+HKNGak7L9iPJh7JuzCf2vD9SMsFDEeGiAR1MHgEPk5b
X-Received: by 2002:a05:600d:19:b0:49c:edd8:ba35 with SMTP id 5b1f17b1804b1-49cedd8ba5emr98467085e9.6.1788420793884;
        Thu, 03 Sep 2026 00:33:13 -0700 (PDT)
Message-ID: <578cefd9-de8d-4a2f-8fb9-778cc5d422b4@suse.com>
Date: Thu, 3 Sep 2026 09:33:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/20] xen/riscv: introduce guest riscv,isa string
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1787836900.git.oleksii.kurochko@gmail.com>
 <2eb660bd05c6bf5946a7eae09406266db0c5108f.1787836900.git.oleksii.kurochko@gmail.com>
 <8520ca5b-d7d6-4e5c-a6f3-2969762fadd3@suse.com>
 <01616191-99a5-48cd-9c3b-e6c00301ec67@gmail.com>
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
In-Reply-To: <01616191-99a5-48cd-9c3b-e6c00301ec67@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1788420794-51538A5B-A3B8D020/0/0
X-purgate-type: clean
X-purgate-size: 2678

On 03.09.2026 09:27, Oleksii Kurochko wrote:
> On 9/2/26 4:58 PM, Jan Beulich wrote:
>> On 27.08.2026 17:18, Oleksii Kurochko wrote:
>>> @@ -34,9 +36,64 @@ struct riscv_isa_ext_data {
>>>       .name = #ext_name,                          \
>>>   }
>>>   
>>> +/*
>>> + * Which guests an extension may be handed out to, by guest XLEN.
>>> + *
>>> + * These flags express Xen's policy, not the ISA's rules: extensions which
>>> + * are architecturally tied to one XLEN (Zilsd on RV32, say) need no special
>>> + * treatment here, as they can only ever appear in the "riscv,isa" of a host
>>> + * of that XLEN, and guest_isa is masked against the host ISA bitmap anyway.
>>> + * They are only of use for extensions Xen chooses not to expose to guests of
>>> + * a given width despite the hardware implementing them.
>>> + */
>>> +#define RISCV_ISA_EXT_GUEST_NONE 0
>>> +#define RISCV_ISA_EXT_GUEST_RV32 (1U << 0)
>>> +#define RISCV_ISA_EXT_GUEST_RV64 (1U << 1)
>>> +#define RISCV_ISA_EXT_GUEST_ANY  (RISCV_ISA_EXT_GUEST_RV32 | \
>>> +                                  RISCV_ISA_EXT_GUEST_RV64)
>>> +
>>> +/*
>>> + * Guests are of the same width as Xen itself for the time being; once guest
>>> + * XLEN can differ from host XLEN (hstatus.VSXL), this becomes a per-domain
>>> + * property, just as guest_isa below does.
>>> + */
>>> +#if defined(CONFIG_RISCV_32)
>>> +#define RISCV_ISA_EXT_GUEST_XLEN RISCV_ISA_EXT_GUEST_RV32
>>> +#elif defined(CONFIG_RISCV_64)
>>> +#define RISCV_ISA_EXT_GUEST_XLEN RISCV_ISA_EXT_GUEST_RV64
>>> +#else
>>> +# error "Unsupported RISC-V bitness"
>>> +#endif
>>> +
>>> +struct riscv_isa_ext_entry {
>>> +    unsigned int id;
>>> +    const char *name;
>>> +    unsigned int guest_flags;
>>> +};
>>> +
>>> +#define RISCV_ISA_EXT_ENTRY(ext_name, guest_flgs)       \
>>> +{                                                       \
>>> +    .id          = RISCV_ISA_EXT_ ## ext_name,          \
>>> +    .name        = #ext_name,                           \
>>> +    .guest_flags = guest_flgs,                          \
>>
>> As you're using token concatenation here already anyway, why not
>>
>>      .guest_flags = RISCV_ISA_EXT_GUEST_ ## guest_flgs,     \
>>
>> helping the use sites quite a bit? (Whether guest_flgs [then] is
>> a good parameter name is a separate question.)
> 
> Good point. I will use token concatenation.
> 
> Regarding parameter name I have several options in mind: guests or 
> guest_xlens.
> 
> I prefer 'guests' at the moment but I am open to adjust to better naming 
> before sending v9.

I'd suggest singular ("guest"), but I don't mind the plural form.

Jan

