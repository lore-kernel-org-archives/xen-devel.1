Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A4C606A31B
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 09:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Azi6GfTP
Received: from list by lists.xenproject.org with outflank-mailman.1461000.1671902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLH3z-0006sX-3j; Mon, 26 Oct 2026 09:32:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461000.1671902; Mon, 26 Oct 2026 09:32:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLH3z-0006sQ-0t; Mon, 26 Oct 2026 09:32:19 +0000
Received: by outflank-mailman (input) for mailman id 1461000;
 Mon, 26 Oct 2026 09:32:18 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLH3y-0006sK-L1
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 09:32:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLH3x-00HHrn-OT
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 10:32:17 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf1e1d-2eae-0a2a0a5409dd-0a2a450aae2a-18
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:32:17 +0100
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf1e21-f2d2-0a2a450a0019-d155dd31e969-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:32:17 +0100
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-48bbb06e746so1367119f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 02:32:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ece5e4asm15092766f8f.59.2026.10.26.02.32.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 02:32:16 -0700 (PDT)
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
        d=suse.com; s=google; t=1793007137; x=1793611937; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qHZ4nHZIxY5bOG20vVfClMtLKxpG5JqFZuL2RP/Af00=;
        b=Azi6GfTP5YiFNWzh28QdnaudM2z3X61Jnk2+hjp6R7HKssIrVDm7ILPkPmSEFUznF/
         sTso11ZVNk2jywKUMb4qwbj9C+64BNAB/WdBytotKVIWBNOeKyVYsoo7vHwE4/A1c9ob
         SsoY0+MVWA3tvUNE0t4Z9EpMFzzySyAcm+cEQfQSXkmXIGqKXtSmgg3whlP/MQszhSLE
         tbn2VVOZLwQp9onM7LmzKzUGVBbvAOB/Z2LXjuIg6y0pmli1vkVW8VLprB2tnnwwIEF5
         ST+IoOnux38S0gaqdhUYdyzwOqXJ/k+iYbB7LMI+wbyg2x7iuok9BrQVnEhqHq7u39YD
         d6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007137; x=1793611937;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qHZ4nHZIxY5bOG20vVfClMtLKxpG5JqFZuL2RP/Af00=;
        b=Gui8IdjTdPXdP9Yog4JNBZfRX6T0BuUm+1qmi/OvXVKEoqGmgbaDV9yJMlHoxjXouN
         F5lnl4vtKV22/wVzXYCoYZ/e7vp6e1263YSOg72eAigg1qXIFt3EJUanU0DcYdb0gAyr
         ZCVB1Nu1mS1aev31+N4Ut9o0l+XTw4fIfd+NhkhL7siGMEJ5U2m5EzTlJlotKZvL0ave
         oOBz5wffEbtdMZgxoswlZrxWPPZ27EbgR4tRn9xiT3GiwI9ykZ8iOA2+mX0SQGSY507H
         4hrywwVRY3PHVGOS0pUxmaI8libMm8QcOtvFqmFRR2+NcYrDFHO8GB4GejNo0wfbnrvU
         E3HA==
X-Forwarded-Encrypted: i=1; AKwUvBwOAE4DTH9jZS39OaRZHT0+ol438jkV/Lh154nKtDxleJ4TJLqb28RJDdvDjFPpX6dNqGmSVQoisfU=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLLNWIPPe59ZJf6JiDQWDJ9aY1mY80GjCCSZuY1TvBozIesb3JV
	6QlkcsQPnuPd78Rwn04shlUSoI8V//8mZ3inF0okMtdxT9i3eMozf4iRSEhoIK6oPw==
X-Gm-Gg: AYBFou0uK+npCDPgbmEzxAFV0q78awMz4KqoUR7d6o7v/E3GcUgWPQ8LwhIw9MHcpWE
	8mErRQv+IshC1QPYZPnxZADwP+8Soazzu7p9ip4dO6HcqnTtgjzI2mMwJh119zxsbxM/hjLGHwm
	nNLkqFQj2J57EFkz1h4N+kTXu7CAAtXGk3OKCjrMOdLFrfk/rT1eJOZTRctE+A5N8UnlZZnQrUX
	4g4uCCMy+uanl2qEnStZ3KfylVbRC+mLc+pz0zOqdZrfRUP4dKe/0ElbVhsVhd1kaiU01/xs6CB
	iYL2GqbYzrc2zOt6rcNYOXEM+bSoWWsvBXzwAVBxagE1h11VilLBnph7bz4fWk0AmPJ5CYvZy+Z
	PQ+yO2lnA0mFa15YHJ1Oqsz1NXJqCqJ/HNjLxYVvvn9wIleS0L9AKxxSnCrFg0rOfrc7OC6sHkz
	hlUn/+lo7sPv2ko+WPTopltu866nB8rbkCixDWHQ2BCL+mfiRfo0rb553vskyIEaqef3hvkoBkL
	LPNNH3gHc6jDk/H/ZTebptjAsz+kExqz/QoT08vFheQgMY9aehjGJTHXqheXl5LszEcgQoLIlDp
	i5VGdz5duEPxA1CPC9PGSyNJFQiLi6AK5kJTNEYJz4X0Q8VYJYSIenchmJYUwDQy
X-Received: by 2002:a05:6000:2c0f:b0:48d:b940:af7a with SMTP id ffacd0b85a97d-48e3eba36d3mr11605824f8f.55.1793007137015;
        Mon, 26 Oct 2026 02:32:17 -0700 (PDT)
Message-ID: <4526ac23-ca7c-40e2-a9d6-9d366369d3bb@suse.com>
Date: Mon, 26 Oct 2026 10:32:15 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/4] xen/riscv: panic if the device tree advertises
 neither Svade nor Svadu
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
References: <1792164706.8631fc262581453bbf619ec5b2062170.1a14557373c0008425@vates.tech>
 <1792164867.8631fc262581453bbf619ec5b2062170.1a14559ab900008425@vates.tech>
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
In-Reply-To: <1792164867.8631fc262581453bbf619ec5b2062170.1a14559ab900008425@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1793007137-518C5CFC-CAA5D9BC/10/78276251493
X-purgate-type: spam
X-purgate-size: 2737
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16.10.2026 17:34, Baptiste Le Duc wrote:
> p2m_set_pte_flags() presets the A/D bits of G-stage PTEs only when
> RISCV_ISA_EXT_svade is set, which is correct only if the device tree is.
> 
> The privileged spec allows exactly two schemes for updating the PTE A and D
> bits: hardware sets them on access and on write, or accessing a page whose
> A and/or D bit is clear raises a page fault so that software can set them
> (ratified as Svade). Every implementation uses one of them, but platforms
> designed before Svade and Svadu were ratified, such as the HiFive Premier
> P550, may advertise neither. Xen then cannot tell which scheme is in
> effect, so rather than guess, panic in riscv_fill_hwcap() when the device
> tree advertises neither Svade nor Svadu, so that the device tree gets
> fixed.
> 
> Add Svadu to the known ISA extensions so it can be told apart from Svade.
> The comment above the enum asks for new extensions to go at the bottom to
> avoid shuffling, a leftover from Linux where the IDs were macros with
> explicit values. Nothing depends on the enum values, so have the comment
> say that multi-letter extensions follow the order of riscv_isa_ext[].
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>

Did I, really? Iirc I left open whether to go the panic() route or the
alternative one. Based on Andrew's clarification as to pre-Svad{e,u}
behavior, I think I further tried to indicate that synthesizing the
correct extension may be preferable, to allow older systems' DTs to be
used as-is. In any event ...

> @@ -674,6 +675,22 @@ void __init riscv_fill_hwcap(void)
>                 "Zihintpause unavailable: cpu_relax() gives the CPU no hint; "
>                 "wire up this platform's pause equivalent in cpu_relax()\n");
>  
> +    /*
> +     * The privileged spec allows exactly two schemes for updating the PTE A
> +     * and D bits:
> +     *  1) hardware sets them on access and on write;
> +     *  2) accessing a page whose A and/or D bit is clear raises a page fault,
> +     *     so that software can set them (ratified as Svade).
> +     *
> +     * Every implementation uses one of them, but may predate the extensions
> +     * and advertise neither. The device tree is then ambiguous: Xen cannot
> +     * tell which scheme is in effect, so panic and have the device tree
> +     * fixed.
> +     */
> +    if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) &&
> +         !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu) )
> +        panic("Device tree advertises neither Svade nor Svadu, A/D bits update scheme unknown\n");

... this message leaves the observer to figure out what to do about the
situation.

Jan

