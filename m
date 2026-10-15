Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55D3CC6B2F
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 08:41:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450040.1665542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHH1n-0007N8-CR; Thu, 15 Oct 2026 08:41:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450040.1665542; Thu, 15 Oct 2026 08:41:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHH1n-0007N1-9g; Thu, 15 Oct 2026 08:41:31 +0000
Received: by outflank-mailman (input) for mailman id 1450040;
 Thu, 15 Oct 2026 08:41:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHH1l-0007Mv-SW
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 08:41:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHH1l-006XZQ-4u
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 10:41:29 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad091b0-bab6-0a2a0a5309dd-0a2a45019b42-42
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 10:41:28 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad091b8-5984-0a2a45010019-d1558036bc19-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 10:41:28 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a171b677d2so31281085e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 01:41:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd993caesm110515955e9.12.2026.10.15.01.41.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2026 01:41:27 -0700 (PDT)
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
        d=suse.com; s=google; t=1792053688; x=1792658488; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QHnVS1PV+1kITi3vkJHQMq0po9DSd1J20l+xScx9FwM=;
        b=SIefwWY+VWXpVrd3vG0NSlKwjHXAiuWQA6K3KqITbQ4xCVPcicPoPQp39/txKN87nh
         scKTcq0+jd9oB4TCJVXbZHOq/j9mbfakL4r6MBrekzQAn5uFJXs/L40ID7CXq4Si3Rcb
         RO2vyo6MlGot+Q7Tau7e0MpuynEVE04ErVFfsmVvKjvsodneJEg4pjYE1n3VjpCwtuWt
         aZY6fVs45UaSX86h5aMdBeW7JaRiz5B4qClHifyrNcmjJPSID9YEIGYqf0i3W5/uW5TF
         9QO5SClz0SbD11V3yCZTg9Nv2NJfcxB6Ci5IUqrMdGIRuo2LbZi3VQl/W4pCePMtApRI
         5Htg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792053688; x=1792658488;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QHnVS1PV+1kITi3vkJHQMq0po9DSd1J20l+xScx9FwM=;
        b=U7OzLKl2LRARhas27H0oraGLHKiFlLBClfMrufaNitE400EBN/b6zX9jQs1hs82LOc
         rQc0eVUUXFQWnmnd70VbrSAA9GtvPXrCmByPZUdNTi30yLgwJ3mTjK/fatBv1+pwdpRv
         /wrUmYbhZQ9R7dKBmtUifhct4RMri0ZXOh5MN2QCfEzbQ6FYm9ScYsfS5w5tEIJ5+ZD8
         oH+E2y3/26DNixZ+QRPnbAt3mfuL2gyxspFHr5e5cwHFduS531WYduCI5UEx4dXjcGx0
         NilnSNf68UqY3Rakckl0b7LxFn95vseeiSDhFcwA3hpADMBwO9JivwGGVCj9duqFEB3p
         AGYg==
X-Forwarded-Encrypted: i=1; AKwUvBxqKOceR2MZgni6dtwCorAp18oTraO4VGVdTxlT2oMo189XwfQ1lp4sDYLtrxl6Ih3GQs0nCNGq7eg=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIOl9d6RuxcMC+ZrxpRtfiSxaTGDZuYCDiZgT4bb/5OTwZp8lkg
	1iQ9S0pV4dtkztgHYgD25h6NLyVxlcnN5XkwTofeyKf9KU31zxebjphbeOkJqyc9ww==
X-Gm-Gg: AYBFou3cJFRAKvZMdMit1iLJ6MezgAk2oEVChci/mRMEDRs5K2rDXlXlTSgTWKQSJt+
	cnlSgwgr+ArUHRlaktxe0vNNfucupc2et6KArLsJhHpHV8RUxYBqYRmKEVlH43SJGiS9lBD3zNv
	OJlHJv9auL1KSHCfSRefUJR6f2BdLgQw9SW9rTpq7k1QtFFAYR2sbOYQHMNpVPIOGeCxZ+qKH6+
	d8pHIyUC00UoDckKFDINIxUZbkPgHrKSvQPXg5Crpo1pa0JKHx9g9g3KehefXhzgRBMNkriMg0d
	xkfKBzU+R1Qd7a369z4GrH7pHAAqOkCbp15PxVDhtFF5XQ0P7XdGwjc6daSlkFe4gj+7m6ev7E6
	TQ26HJJQiFDjG3iX5U5tE0Fk8/0uEQ37TdT5zrWAGdZ0MnnFe01TUpO1Y3GnAk1EAr795RMS4kI
	pUlq9n7kaZEQe8E701xWqCnTdcCrqiD8JtVpch5rzD122CvRq3Xrn7LP5g3cmQFlDMT1k5r4TSt
	4khDC0UcWv1zDG4YDY/IlnKxnIl6QbGbw6InbInZVKYyK5TZUvsHj7Fl0K1Z5Q=
X-Received: by 2002:a05:600c:4ecc:b0:49c:fa21:e749 with SMTP id 5b1f17b1804b1-4a18e4d55f2mr408060295e9.31.1792053688137;
        Thu, 15 Oct 2026 01:41:28 -0700 (PDT)
Message-ID: <7f5da80c-424f-49dc-8ce3-10ca2fae9f55@suse.com>
Date: Thu, 15 Oct 2026 10:41:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] xen/riscv: probe the PTE A/D bits update scheme at
 boot
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>, xen-devel@lists.xenproject.org
References: <1791885904.8631fc262581453bbf619ec5b2062170.1a134b909b40008425@vates.tech>
 <1791886038.8631fc262581453bbf619ec5b2062170.1a134bb169d0008425@vates.tech>
 <21a48f53-385b-4f36-958c-cc82bf390c89@suse.com>
 <1791901979.8631fc262581453bbf619ec5b2062170.1a135ae53690008425@vates.tech>
 <7ed5d117-80d5-4862-af60-c3e0143564ea@suse.com>
 <1791968412.8631fc262581453bbf619ec5b2062170.1a139a403a30008425@vates.tech>
 <db0d448a-ff1f-4549-84f1-c53e3e4a711e@suse.com>
 <1791996314.8631fc262581453bbf619ec5b2062170.1a13b4dc2b50008425@vates.tech>
 <4e914f14-50ff-48a5-9f56-836913e487fb@suse.com>
 <1792052907.8631fc262581453bbf619ec5b2062170.1a13ead4e580008425@vates.tech>
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
In-Reply-To: <1792052907.8631fc262581453bbf619ec5b2062170.1a13ead4e580008425@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1792053688-C5540757-65C78283/10/78276251493
X-purgate-type: spam
X-purgate-size: 3457

On 15.10.2026 10:28, Baptiste Le Duc wrote:
> On 2026-10-15 09:14 +0200, Jan Beulich wrote:
>> On 14.10.2026 18:45, Baptiste Le Duc wrote:
>>> On 2026-10-14 11:09:58+02:00, Jan Beulich wrote:
>>>> On 14.10.2026 11:00, Baptiste Le Duc wrote:
>>>>
>>>> In which case it would need to be
>>>>
>>>>     if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) ||
>>>>          !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu) )
>>>>         e->pte |= PTE_ACCESSED | PTE_DIRTY;
>>>>
>>>> albeit I have to admit that permitting two contradicting extensions to
>>>> be exposed at the same time is irritating.
>>>>
>>>>> I see two ways to address this:
>>>>>
>>>>> 1) Keep checking Svade:
>>>>>
>>>>>     if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
>>>>>         e->pte |= PTE_ACCESSED | PTE_DIRTY;
>>>>>
>>>>>     After resolve_ad_scheme(), the Svade bit is set in every case where
>>>>>     software has to preset the A/D bits. The only imprecise case is both
>>>>>     extensions advertised with hardware updating already enabled by
>>>>>     firmware, where presetting A/D is unnecessary but harmless.
>>>>>
>>>>> 2) Record the probe result in a global, e.g.
>>>>>
>>>>>     static bool __ro_after_init hw_ad_update;
>>>>>
>>>>>     and use:
>>>>>
>>>>>     if ( !hw_ad_update )
>>>>>         e->pte |= PTE_ACCESSED | PTE_DIRTY;
>>>>>
>>>>>     This is exact in all cases, at the cost of a new global that mostly
>>>>>     duplicates what resolve_ad_scheme() already records in the ISA bitmap.
>>>>>
>>>>> I discussed with Oleksii and we are fine with either. What do you prefer?
>>>>
>>>> As to 1), see above. For 2), while maybe okay, I think we're better off
>>> Sorry, I don't fully follow the issue with 1). Compared to what you proposed,
>>> it only differs when neither Svade nor Svadu is recorded, which cannot
>>> happen as resolve_ad_scheme() runs before and always records one of the
>>> two.
>>
>> Yet previously we said that recording extensions (as such, i.e. later also
>> possibly exposing them to guests) when they weren't really advertised may
>> not be the right thing to do. I.e. imo the probing may be used to drive
> But we also said that platforms (such as the P550) may implement an
> extension without advertising it, as a RISC-V spec maintainer
> confirmed in [1].
> 
> [1] https://github.com/riscv/riscv-isa-manual/issues/3450#issuecomment-6076851535

What Andrew says there suggests to me that the behavior you observe on P550
is against the spec. That shouldn't really be the case though, as nothing
was said in the spec at all until Svade and Svadu were actually introduced.
An update to the spec should imo never invalidate previously conforming
implementations. I guess I'll comment there.

>> Xen's internal behavior, but I'm unconvinced that it should also lead to
>> marking extensions as available.
> 
> Therefore, as far as I understood, you're not convinced of this:
> 
>     /* Neither advertised: trust the probe. */
>     __set_bit(has_hw_update ? RISCV_ISA_EXT_svadu : RISCV_ISA_EXT_svade,
>               riscv_isa);
> 
> If so, then, the only solution I have in mind in what I proposed in 2)
> with the global variable that store the result of the real probe.
> Am I correct?

Possibly. What I'm missing is some clarification towards the underlying
principle which we want to follow not just here. 

Jan

