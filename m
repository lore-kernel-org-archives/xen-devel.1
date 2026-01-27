Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C68D34084
	for <xen-devel@archiver.kernel.org>; Tue, 27 Jan 2026 15:28:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1214959.1525204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkkzI-000644-FL; Tue, 27 Jan 2026 15:28:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214959.1525204; Tue, 27 Jan 2026 15:28:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkkzI-00063x-BF; Tue, 27 Jan 2026 15:28:16 +0000
Received: by outflank-mailman (input) for mailman id 1214959;
 Tue, 27 Jan 2026 15:28:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y9JO=AA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vkkzH-00063o-7j
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 15:28:15 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9f8b88d-fb94-11f0-9ccf-f158ae23cfc8;
 Tue, 27 Jan 2026 16:28:11 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48068ed1eccso7834125e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jan 2026 07:28:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1c02f71sm38847980f8f.6.2026.01.27.07.28.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 07:28:10 -0800 (PST)
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
X-Inumbo-ID: c9f8b88d-fb94-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769527690; x=1770132490; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NnJ5+1MsVwG+j0N54OBzgoK2GuKB33EihIj3f1iWkgM=;
        b=YxXJaNJor8YL8UebH1ojPIilhWBI/wjBTMYLD+YSvCTAMkKVJTjtivjqSQpIKA77lH
         99ObToa/LskKRZHqa6JBkwzaNnZO0Z92I7sDowHoYcz/6i3+k2MU5RXIkbxTmEUgUmSV
         tmNUh42O6zZi7Rvat6Q7AeJa840gxiebeIi4CqBTO5QewDgxQcGJCTeJ+Lhj0rqQQrlh
         UXNcIk4LZYYI1NM6Tn2JR/LIZIOqmZgc5CPbiOsUZ0kzmrK3qm9hbghRaJtGcBft4RgY
         VHLM5T5HpqONd/ILGxHukknKv/c0kegyevCbitaeSLR9L7AVx+7XPEYe5mt+WTNhNVqM
         X72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769527690; x=1770132490;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NnJ5+1MsVwG+j0N54OBzgoK2GuKB33EihIj3f1iWkgM=;
        b=bMdjlHx7NR6W4oAVoBO0gOGY/6kCUePlPn71cHXaTvvIJN7tNguF2VGrdXziWJRI9/
         EKP49pCZ/sIGjjfAWFXJfuj/OPAmzLagAehYUM2B8/wOwVEzIdndLPqIH4CwufQ5iM7Q
         dIYP87+4prMKeiPpBpxJ+mnHYosf1W7IKd4s9KbOIJS3zGKI1eV49VJDYAJKrbi3sdwi
         BkpPnS1okhSHomOyqAUydEmiIZPIPktgiIDlm8O84i+0X6hf4EaeTdi41RoFq+8hnrDH
         VIEKqqPe27IaO9ItAlyHXL/VNpadEw0pMvMnLqnz0/8YiRPQoT9/xxqhl1UDFbC1SHak
         u7SA==
X-Forwarded-Encrypted: i=1; AJvYcCUR1/X8Xqcat+fRdFeRnkiervmuJAObww2EzWekYYk6zSf+gVLps1IstfIPsEnjnOgv5LdWcMa92Y0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx4JzZ3yF1ogOhjqpR6kW13hRFJMBtYkVr07hchxqY8B8B7iySs
	p6KHEnjat+BleFWRo94Kk6vXCoOSNt4VWOgUrOvI9A4cT3npAs+WY86+5LbslyYAow==
X-Gm-Gg: AZuq6aK1PdyecdTWDCCPl0HBU4WAL7Mc6vkz6RQ4zfcjptRKmrjdiA5wAZlZa5umu5D
	tTuW3u+SIrnZ6xd40SV/clRJLV0GZfZz5aed5b2O+2XT7w/QRh/koKvxZowh8hHTgeNAWshb3J/
	Q5WTetmJ9nsinFtJAeyiVNJdRZkar0+CwP93O7R35chdcZk9MKACn8l3J/8Ei6nvDPM3oWBiSUy
	Ihx0ZQUpT2orW7qG+7KtHZAQsw4cjfhnGWe8ahfCxdgeXSnhGr5jAKZDYQ7XtqsM93NAz+Msyyu
	SJSoagKYOj6T6V1Oy3aL9jMD0VK2alv2Z6NW50RSiZiRJjWPxNGBzH3UslHwPerpM1fYRaoCa4E
	JcmiVKbV+RIQZMhUPhH9BZ7Oc88B+1/1dJ6U/A2EsqIPjJn9QilrM3XKRgJVJZQXxmbYujBHkIm
	lrYznqPf0uh7HnwykDYpo+I0L2onnQYbm5zP2msJchnlJesNXpu+Vm5XLR5h8JRIeolVtyCZIYh
	mtoijVQ1qZBmQ==
X-Received: by 2002:a05:600c:458a:b0:46f:c55a:5a8d with SMTP id 5b1f17b1804b1-48069c0fdafmr27031075e9.4.1769527690534;
        Tue, 27 Jan 2026 07:28:10 -0800 (PST)
Message-ID: <599b0534-9cbe-4836-8b9e-f43ad8609fa7@suse.com>
Date: Tue, 27 Jan 2026 16:28:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/16] x86/amd: Always probe and configure the masking
 MSRs
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julian Vetter <julian.vetter@vates.tech>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
 <20260126175345.2078371-11-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260126175345.2078371-11-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.01.2026 18:53, Andrew Cooper wrote:
> This allows the infrastructure to reused for system-wide quirk/errata
> adjustments.
> 
> Replace the call to ctxt_switch_levelling() with amd_ctxt_switch_masking()
> instead.  The CPUID Faulting aspect is not interesting at this point in boot,
> and we want to explicitly propagate the masking MSR defaults into APs.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with two comment nits:

> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -162,7 +162,7 @@ static void __init noinline probe_masking_msrs(void)
>   * parameter of NULL is used to context switch to the default host state (by
>   * the cpu bringup-code, crash path, etc).
>   */
> -static void cf_check amd_ctxt_switch_masking(const struct vcpu *next)
> +void cf_check amd_ctxt_switch_masking(const struct vcpu *next)
>  {
>  	struct cpuidmasks *these_masks = &this_cpu(cpuidmasks);
>  	const struct domain *nextd = next ? next->domain : NULL;
> @@ -242,9 +242,12 @@ static void __init amd_init_levelling(void)
>  	    boot_cpu_has(X86_FEATURE_CPUID_USER_DIS)) {
>  		expected_levelling_cap |= LCAP_faulting;
>  		levelling_caps |= LCAP_faulting;
> -		return;
>  	}
>  
> +	/*
> +	 * Always probe for the MSRs too.  We reuse the infrastruture for
> +	 * quirks/errata/etc during boot.
> +	 */
>  	probe_masking_msrs();

This isn't just about boot, but also soft-onlining of CPUs and S3 resume.

> @@ -1015,7 +1018,11 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
>  	u32 l, h;
>  	uint64_t value;
>  
> -	ctxt_switch_levelling(NULL);
> +	/*
> +	 * Reuse amd_ctxt_switch_masking() explicitly.  This propagates
> +	 * quirk/errata adjustments made duing early_init_amd() into the APs.
> +	 */
> +	amd_ctxt_switch_masking(NULL);

Have the same comment also ...

> --- a/xen/arch/x86/cpu/hygon.c
> +++ b/xen/arch/x86/cpu/hygon.c
> @@ -32,7 +32,7 @@ static void cf_check init_hygon(struct cpuinfo_x86 *c)
>  {
>  	unsigned long long value;
>  
> -	ctxt_switch_levelling(NULL);
> +	amd_ctxt_switch_masking(NULL);

... here?

Jan

