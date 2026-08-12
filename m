Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38561C5B56A
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 15:48:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389196.1630086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuBBt-0005VS-Io; Wed, 12 Aug 2026 15:48:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389196.1630086; Wed, 12 Aug 2026 15:48:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuBBt-0005VK-FJ; Wed, 12 Aug 2026 15:48:29 +0000
Received: by outflank-mailman (input) for mailman id 1389196;
 Wed, 12 Aug 2026 15:48:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wuBBr-0005VE-Q6
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 15:48:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuBBq-003o9Z-Pn
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 17:48:26 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c95ca-2eae-0a2a0a5409dd-0a2a4505b826-0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 17:48:26 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c95ca-4cb1-0a2a45050019-d155802bdd57-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 17:48:26 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-49802c418b5so10532725e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 08:48:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4997ada79a3sm82551175e9.1.2026.08.12.08.48.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 08:48:25 -0700 (PDT)
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
        d=suse.com; s=google; t=1786549706; x=1787154506; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Y2t0eAdOGCQ68XOTF98/prJiMtMY13yhQEN9YiCxYI=;
        b=RC2zxXQQCHbACFwtBtAa5+aubVJ6FuwhPlJ/CxIvsgt6jg9HXAUfCFQs4RIWSg78Rg
         gpcCqq6ZlBfp9ngZ0KDb5kk4qSiWKXlUCD4W+bjUlhsygXnQfGEYYnBk4JNwk6edZQ8C
         5xARTVyUJjzN7QZykJGlYzdDOQWd4qqVOrYJp0DYRJBiXjqizYhUEMLJBkTxi805K6Sw
         5mGF9x8ldT5Sa2DCNlbqjV77bnYk2Rl50zbWrB4aWKoxAHDQcCmuKIRieGTritfABgh1
         FEGGCKlwXURktYe75IxLytzXRjxzOxQaBl1ulZGzy4lsYE4iSDTrqczDeocBYiVJz9Sz
         9sqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786549706; x=1787154506;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Y2t0eAdOGCQ68XOTF98/prJiMtMY13yhQEN9YiCxYI=;
        b=Vu3h3q9PVyADHXUSAKV4Y1wUYulDlDUu26rpecF1t5INH58uuWSOSUkE/uA0RB1Gw0
         0PAPpruv0Z7IfHsRRUB6If9d9Haxv1VY+ED9U03Wief9JRQAIWpd1XliUX77404P6FQv
         bhW0AyBowpkKkIzDkhZva2bVYkEtIc54dhxFDWSlkIOrem+hh7wVCpiXYh1jdLZ0df34
         JADPUaz7fBu3qLusXAjvpIeI8+2lkMDT/3V6RlJMK9erZ/2Nft9puoB0v4ZkhWIBOVkN
         mrJoVjdYnuOaFppyTxAb3+331Zz+L+AaoOEqUS28LyPhPtn/V1iAnR+d2M6jqvxmcFd8
         0osQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpo7+7DYi2Pc6RQNfUge4o/WVweyvK2LLHbXZdu/035F3vtowtAaK9zsDRKnRc2sW1eCa6EmcLOM98=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzhg8ZLTZFJwFpjnmaWy4NMxIEpEBFb1S2WE5BJnPQI8Ar1rbGC
	ZXqGUSHqJansQVd0P/DpjJS5fgbUaqpd+FVPyo/srz3Jk0DQFeSZzuhmhNWRc42mNw==
X-Gm-Gg: AR+sD10hOccuuaiB6WnRRFe6qg2E7dMnCTs7cpumrS6pcUaD+5XdD1+1tgyzrIJpZI5
	Aavq3erEyktTYyqu5NXdytci+M7jOvyw+JUGLC9HHJi6ex4pzTkdJ8GkJRjBk7Om57rwI2E67ku
	AHYc6laEJl4bkIuUH/z+F5xnMLRoXbtTXOuaXzTtrgqc7nF8Ta6cHCzFfM0QjzhWTqpnL5OI7n9
	PqS2X4/CaNHNnjB8fwrXyZ4G5q+jH4n0pWYrRUvwH6ksflbutFWQRHs+9+G0WfDnM4J2BdGmVcI
	4CLbNE2hZa6xL9zPnEzLVuKwSc7uz2Y0rjRsSvYjQGSyXIFas9wT9evE/VNx/Rj8qFwtfZlSEWt
	ud53BQNw+n3B/XoD9eyvugwcFcZid2mBZZE3JPL5vJL/y3T2Vff2PLPMZY1BFuudPiJnB/kpd1r
	UtGF7luhJQK62Z92g9rTmFl1pnUGx/RUvjHWL4NInaOjcYhL+viu+87hdkxCIwko4E9INMT+PPv
	JfJkhUNIAcGRUncJ0zwBxMPHfcKbbHuv7OVRj8pJl0zmKPkr+sG
X-Received: by 2002:a05:600c:68d4:b0:499:49f2:bb86 with SMTP id 5b1f17b1804b1-4997c0f2251mr64846375e9.6.1786549706138;
        Wed, 12 Aug 2026 08:48:26 -0700 (PDT)
Message-ID: <ab3eb1be-ec62-42ae-8966-e2801752ce4f@suse.com>
Date: Wed, 12 Aug 2026 17:48:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 14/17] xen/riscv: add guest page fault handling stub
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
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <7ef8919f12c269d180a2b56a83218cc54e0e357c.1784560663.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <7ef8919f12c269d180a2b56a83218cc54e0e357c.1784560663.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1786549706-F74BC2A1-71D390D8/0/0
X-purgate-type: clean
X-purgate-size: 2056

On 20.07.2026 18:02, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/traps.c
> +++ b/xen/arch/riscv/traps.c
> @@ -191,6 +191,67 @@ static void timer_interrupt(void)
>      raise_softirq(TIMER_SOFTIRQ);
>  }
>  
> +static always_inline unsigned long get_faulting_gpa(void)

May I suggest to use always_inline only when inlining is _functionally_
required?

> +{
> +    /*
> +     * According to RISC-V spec:
> +     *  18.2.8. Hypervisor Trap Value Register (htval)
> +     *   ...
> +     *   A guest physical address written to htval is shifted right by 2 bits
> +     *   to accommodate addresses wider than the current XLEN.
> +     *   ...
> +     *   If the least-significant two bits of a faulting guest physical address
> +     *   are needed, these bits are ordinarily the same as the
> +     *   least-significant two bits of the faulting virtual address in stval.
> +     *   For faults due to implicit memory accesses for VS-stage address
> +     *   translation, the least-significant two bits are instead zeros. These
> +     *   cases can be distinguished using the value provided in register htinst.
> +     */
> +    return (csr_read(CSR_HTVAL) << 2) | (csr_read(CSR_STVAL) & 0x3);

Well, okay, but instead of not losing the bottom two bits you're now losing
the top two ones.

Also the spec reads as if htval only _may_ hold the original address of the
faulting access. What if htval ends up 0?

Further, nit: There's (once again) no real value in the 0x prefix, I don't
think.

> +static int emulate_load(unsigned long fault_addr, unsigned long htinst)
> +{
> +    return -EOPNOTSUPP;
> +}
> +
> +static int emulate_store(unsigned long fault_addr, unsigned long htinst)
> +{
> +    return -EOPNOTSUPP;
> +}
> +
> +static void handle_guest_page_fault(unsigned long cause,
> +                                    struct cpu_user_regs *regs)
> +{
> +    unsigned long addr;
> +    int rc;
> +
> +    addr = get_faulting_gpa();

Can't this become the initializer of the variable?

Jan

