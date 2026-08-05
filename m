Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2AEC55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 11:43:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383311.1626561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wra1f-0000Ub-UH; Wed, 05 Aug 2026 11:43:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383311.1626561; Wed, 05 Aug 2026 11:43:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wra1f-0000UU-R4; Wed, 05 Aug 2026 11:43:11 +0000
Received: by outflank-mailman (input) for mailman id 1383311;
 Wed, 05 Aug 2026 11:43:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wra1e-0000UL-SU
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 11:43:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wra1e-006zTo-2D
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 13:43:10 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7321c8-e002-0a2a0a5209dd-0a2a450a9cfe-20
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 13:43:09 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7321cd-f2d2-0a2a450a0019-d155802ee1a7-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 13:43:09 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-49554ebb87dso8042765e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 04:43:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4994dfda45asm102990935e9.4.2026.08.05.04.43.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 04:43:08 -0700 (PDT)
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
        d=suse.com; s=google; t=1785930189; x=1786534989; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1MMNEWYOK+POe4jOwV1jz677BcJ7a9OOCBTCoAEQmRw=;
        b=Nn/DxF1P5Dvt/wYGdJ1rO/LTjj0Ufa5cZrEdokwm1wBltHrRuCjnXWaO5Jvc0KcmGj
         fT3JoJKmWytKjqNV2KUog+m/7UrfKHHobJfX4/FL33s5vld8LwBMTK0QLqKgcTEZmTq3
         2cXFjSiKW45IQvmNLW9y1sjgLoSIbA37L7dg+RziZRYJiM2GWMEP+BWW4hRGRg5MIuWf
         Iz/nj+PjDe/+dsqDwk1Vv+4tKjOR6p8sOIPpfR+6oB7PfGKGAbwZSTrVC1FKJnlOVg7+
         P89TWlgO7pKsF/Z3edCTE12AiZdT9i45i/afBRre2HQSsJA1r8cIpG2lryuNKBWq8RdP
         /6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785930189; x=1786534989;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1MMNEWYOK+POe4jOwV1jz677BcJ7a9OOCBTCoAEQmRw=;
        b=laRIUlQhhFPgJueAJfUWEQ27MLkOxEtGNye5iR5LYbcnD675KNbTxWbExXOqYqDbNm
         Fd+yd/AW6Ctc80pFYbWUECtx02xHaHIJHKsYhEcgjt1IEtwYd7vZig4k4EW6duxw+d0b
         DHQWjyTwd/dW//dT/Co55k+MpvoHp7GeGr4+2qJdfqaSpgxNxzsMBid5WNIdbV+C8m/P
         CnMZY2JsJb3bMzPHlN5ygob5G5IQmRoqdHYYHsmW6pd9U7pf+Zx5OB4K52QK6YEWC7zJ
         c0mLAMElh6Zns2AmcEciknriLyon5g9f+GOh57NbFcHT0ccbbR3euq7pyU/vbiR74T1T
         xKhw==
X-Forwarded-Encrypted: i=1; AHgh+RqVQ/SB860RTHBVelZBly3YJECEA7OoYdXu5wg1avkgDBSdCKKpc0Ed+ee2zdDIrIhxqv9l/et7kYU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5ainJqPg/Ermt7xs9UCE6xfl7lbSZg30ltRgvggeVDcOwGtk0
	32imtU9lCSytiGd2hvLNnYIfy+90E3eZjLffnXZMlO4D0G+fOetNCPs88SV8baSY9Q==
X-Gm-Gg: AR+sD130IJHhl68CpdLXfzuuqkKPPV3V5Uh+pHskal8s9Shc72fp0PXHaotP9I4N/pX
	C+uVp/4rnpBQJywy/XazPUKy/v8lpIpBchARzBnGXfzM2WR2L3LM3gIGriYY3628UI7yGtDvwHH
	Z5ffteMZA3R23iHTMctBXraK2ILZ98XF3jLgrYR1ymxaUoSfAUhTus3LdUHof8mhyugiiAA2Oz6
	ReRyKTeKVq0cOlFWQoZhfaUDD0iOpjV78FoFQhQTeu2Z7igrys3ViZcIbEH/vi5dDscfs6PpDSQ
	R6Y9hPuxUNy5OH5PpDlYc8OzbfzOCQfGrSAJXWPTQ/CNoTGzwa/EUSgF7X1tBUv9CNXAJPwEhNV
	UH7FKaadrI/86gVJpysE4fth8jBqo7dw1g9GwSPGtjvBpxRk3H/Pk7tn1vf4BP3vu9Ok7TCJZqv
	PnTG7TxN46gTHHpCJIe9HG5MIeWOvZKBDwJEJw6i7ZWe4VCLvxVHMmXhLfohvtbBoP88LVyt39c
	Az74krFgNLAddWrol+Fy1Y/07/ibMYJ0Omw7y7fI1wTQhXfl5Zq
X-Received: by 2002:a05:600c:8b23:b0:495:4d00:2fc0 with SMTP id 5b1f17b1804b1-4994e7bb12dmr64911675e9.12.1785930188902;
        Wed, 05 Aug 2026 04:43:08 -0700 (PDT)
Message-ID: <14dd261f-8d78-4c24-b927-f7f2c01dbdf8@suse.com>
Date: Wed, 5 Aug 2026 13:43:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/sched: rename scheduler registration symbols
To: Furkan Caliskan <frn1furkan10@gmail.com>
Cc: andrew.cooper3@citrix.com, jgross@suse.com, gwd@xenproject.org,
 dfaggioli@suse.com, stewart.hildebrand@amd.com,
 nathan.studer@dornerworks.com, roger@xenproject.org,
 anthony.perard@vates.tech, julien@xen.org, sstabellini@kernel.org,
 michal.orzel@amd.com, bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com,
 teddy.astie@vates.tech, tpearson@raptorengineering.com,
 alistair.francis@wdc.com, connojdavis@gmail.com,
 xen-devel@lists.xenproject.org
References: <20260804055327.22119-1-frn1furkan10@gmail.com>
 <20260804055327.22119-3-frn1furkan10@gmail.com>
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
In-Reply-To: <20260804055327.22119-3-frn1furkan10@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1785930189-4B6D6CFC-18D1B315/0/0
X-purgate-type: clean
X-purgate-size: 1311

On 04.08.2026 07:53, Furkan Caliskan wrote:
> REGISTER_SCHEDULER(), schedulers[], NUM_SCHEDULERS, and the
> per-arch SCHEDULER_ARRAY linker macro now register and hold
> struct sched_ops instances rather than struct scheduler ones,
> but still carry names describing the old type.
> 
> Rename them to match the current behaviour.
> No functional change.
> 
> Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
> ---
>  xen/arch/arm/xen.lds.S      |  2 +-
>  xen/arch/ppc/xen.lds.S      |  2 +-
>  xen/arch/riscv/xen.lds.S    |  2 +-
>  xen/arch/x86/xen.lds.S      |  2 +-
>  xen/common/sched/arinc653.c |  2 +-
>  xen/common/sched/core.c     | 33 +++++++++++++++++----------------
>  xen/common/sched/credit.c   |  2 +-
>  xen/common/sched/credit2.c  |  2 +-
>  xen/common/sched/null.c     |  2 +-
>  xen/common/sched/private.h  |  4 ++--
>  xen/common/sched/rt.c       |  2 +-
>  xen/include/xen/xen.lds.h   | 10 +++++-----
>  12 files changed, 33 insertions(+), 32 deletions(-)

I'm not quite sure if all of this is really useful. In many (all?) places
I think "scheduler" as a term is still quite applicable.

One (general) nit though: if already you touch malformed lines (overlong
ones is which prompted this comment), please adjust them to be style-
conformant.

Jan

