Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94948606A32A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 12:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WunRt3ss
Received: from list by lists.xenproject.org with outflank-mailman.1461188.1672148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLJbg-0005u5-Jk; Mon, 26 Oct 2026 12:15:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461188.1672148; Mon, 26 Oct 2026 12:15:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLJbg-0005ty-GT; Mon, 26 Oct 2026 12:15:16 +0000
Received: by outflank-mailman (input) for mailman id 1461188;
 Mon, 26 Oct 2026 12:15:14 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLJbe-0005sn-JH
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 12:15:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLJbd-000bdn-Hj
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 13:15:13 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf444d-bab6-0a2a0a5309dd-0a2a4502a08c-2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 13:15:10 +0100
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf444e-6ca4-0a2a45020019-d155802aadf2-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 13:15:10 +0100
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4a2d6cf958bso9669905e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 05:15:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a5ea0df763sm101543055e9.3.2026.10.26.05.15.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 05:15:09 -0700 (PDT)
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
        d=suse.com; s=google; t=1793016910; x=1793621710; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LalU7iE11Nk9uJ1lkqiCjCv4odKPqiVHYWjeF26cbIA=;
        b=WunRt3ss2XhB08VweH7XOhHN9WOlq+fRjrMlTDLJhxT68jVTOh3ovJgozOznX7UaNM
         TParFHjxV8WudN4PMYLasprfO/T8ymwxTtkwGxoOyVBG4lX1iBRWc3hFlVq95AYSQp24
         Nj/j8yvRoTur/ctv9t6pfr/vQoN7UJqa5DC46rdldnfE4WLcriDh8do+sfrvogkxn40t
         p6kPIW5rM6SvepbDUSqK1P7fs1jN03TTS8Q6vcukshIK3VSR+QNXwSXb9V/xQCzq9zvr
         A30SdR2JnUIZx5dm4lTFkRStsFhTyTZ0gFycAZSlXQhsjr31FeoeHN8XiOM75nLhgpFI
         B7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016910; x=1793621710;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LalU7iE11Nk9uJ1lkqiCjCv4odKPqiVHYWjeF26cbIA=;
        b=0m2Tuj9Wnx7wo+8lzLH4UBdJrCtmK2Zu3uMvLlCDAr/WtB91nnfR+Y08oyRpBImBol
         F2S2xXUzSXEPlzbUVMCC3tbqhtxFmCVJvzvgS0m/gF5lOUBuw2jsK4tTEimquoBfxl33
         Uz2f7P5OVyI6YKDFZd1dFjT/5rbGGeJSf7z5lr0+Ol9sa0HevpPouYu5H7+SxJL+Wlnr
         p7yFGGWdJ7JwOTAgUL/U2mPkQcFTR7XHVneAcEvO9yF6Xv8LGu+OQ2oRqHUv30y1efmr
         ZOyDngng1oqbJunRqF9u0cmzh6vjrDGFGiDeJwQSsmnxIRruFyu8YtWLKtdakOX2w9jf
         o6Mg==
X-Forwarded-Encrypted: i=1; AKwUvByRmED/bMC06JnqF/a9PLlhno9eTsNl+pwkdo5QSr032yPkMD5qswnllJYzTqcLK4JC/5yCafiw12g=@lists.xenproject.org
X-Gm-Message-State: AFq9FYK0eohLsiUuGyIwe+F90ySByuQznp1Z3plQWu/q5O6Pg5u6XT1U
	ppJQGAuearbgPZU4bQhNeDq0lLvJoy22oZ0B1DshmOU6Tm9eT/C5RuL1MoATfvM2Lw==
X-Gm-Gg: AYBFou1y7JaCs45dEr6NAvxTKSU3HUeAfCKsufE0uSMqzllTqjNsEtfM+xi3sxh/NzN
	YQCvfzsgjpGe5zIfGoZ1FcwDWZ1/PW2pMlkrqLRoWy0Njdsv9XxIKRvR4L6l5A0+zG4ZcFClalE
	2+XjWK3FyYgJLfWZNesdzt0S0vbPPtC/dy2xKtxSnGkamMs6Q+HtwmlNX/C8AXAebJj3HzwT8ws
	yW3giClZa1ce7K95QoUhtF0Tv+e52Ztu+ceiDJKC868IWkEZ3T6HAngempfBWpjhn6JfS0Kxx3k
	QrtB+Ta1NBfSnKsZmP9Ii8WM/deD7xNAtWyKEw3QSJhE+WNFik7sjK221qsy1Kp1rCwU6zt3CTY
	2LncTa8yH+Wf5rdyddWhQySAYXHGcinBE7qAKU470athQaBhDAL/7jODp9bB/gL0cJqt9AMQBIM
	mxJvgOxKsJyN+r4yANlVmaRC5KmpZea17qTJgvmbBa/E/b+U2MchMfIcPLk9byjHnd67rgFFyiH
	oCMCdViZzeOLJ47a69gS/GPiN87LtcRNt6IE2U+wkPsChI42fvVaYaNpBIXZw9lPuJK/ajspsdd
	c7/hkyu+0hnbzTyk33Cbl8xCELhiT9062LVaGD7MFpsm
X-Received: by 2002:a05:600c:524d:b0:4a3:59c2:b41e with SMTP id 5b1f17b1804b1-4a7444042ecmr15246445e9.4.1793016909457;
        Mon, 26 Oct 2026 05:15:09 -0700 (PDT)
Message-ID: <84fee7e4-ee15-4e56-8db3-f5d2db5ec2e2@suse.com>
Date: Mon, 26 Oct 2026 13:15:07 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/desc: build boot GDT descriptors with a macro
To: Furkan Caliskan <frn1furkan10@gmail.com>
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, teddy.astie@vates.tech,
 xen-devel@lists.xenproject.org
References: <20261020135722.45714-1-frn1furkan10@gmail.com>
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
In-Reply-To: <20261020135722.45714-1-frn1furkan10@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1793016910-319CB2AC-3275584F/10/78276251493
X-purgate-type: spam
X-purgate-size: 3076
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 20.10.2026 15:57, Furkan Caliskan wrote:
> The raw 64-bit constants in boot_gdt[] and boot_compat_gdt[] hide what
> each descriptor actually is.  Replace them with a GDTE() macro, modelled
> on Linux's GDT_ENTRY_INIT(), plus named GDTE_FLAGS_* constants and a
> GDTE_FLAT() helper for flat segments.
> 
> No functional change.

Can this be "upgraded" to "No change in generated code" or some such? Else:
Are there changes in generated code?

> --- a/xen/arch/x86/desc.c
> +++ b/xen/arch/x86/desc.c
> @@ -27,32 +27,67 @@
>  
>  #define SEL2GDT(sel) (((sel) >> 3) - FIRST_RESERVED_GDT_ENTRY)
>  
> +/*
> + * Expands to a brace-enclosed initializer for seg_desc_t; only use it
> + * inside an initializer list.
> + *
> + * flags: bit layout matches its position in the descriptor's high dword
> + *   bits 0-3   : type
> + *   bit  4     : s     (0 = system, 1 = code/data)
> + *   bits 5-6   : dpl
> + *   bit  7     : p     (present)
> + *   bit  12    : avl
> + *   bit  13    : l     (64-bit code segment)
> + *   bit  14    : d/b
> + *   bit  15    : g     (granularity: 0 = byte, 1 = 4KiB)
> + */
> +#define GDTE(flags, base, limit)                                        \
> +    { (((uint64_t)(limit) & 0x0ffffULL)            |                    \
> +       (((uint64_t)(base)  & 0x0ffffffULL)  << 16) |                    \
> +       (((uint64_t)(flags) & 0x0ffULL)      << 40) |                    \
> +       (((uint64_t)(limit) & 0xf0000ULL)    << 32) |                    \
> +       (((uint64_t)(flags) & 0xf000ULL)     << 40) |                    \
> +       (((uint64_t)(base)  & 0xff000000ULL) << 32)) }

As you only ever use this for GDTs, the macro name here is okay. However, ...

> +/* Common flag combinations (same values Linux uses for equivalent segments) */
> +#define GDTE_FLAGS_RING0_CS64   0xa09b   /* P DPL0 S code  RX A, L, G */
> +#define GDTE_FLAGS_RING0_DS32   0xc093   /* P DPL0 S data  RW A,    G */
> +#define GDTE_FLAGS_RING1_CS32   0xc0bb   /* P DPL1 S code  RX A,    G */
> +#define GDTE_FLAGS_RING1_DS32   0xc0b3   /* P DPL1 S data  RW A,    G */
> +#define GDTE_FLAGS_RING3_CS32   0xc0fb   /* P DPL3 S code  RX A,    G */
> +#define GDTE_FLAGS_RING3_DS32   0xc0f3   /* P DPL3 S data  RW A,    G */
> +#define GDTE_FLAGS_RING3_CS64   0xa0fb   /* P DPL3 S code  RX A, L, G */
> +#define GDTE_FLAGS_PERCPU       0x0091   /* P DPL0 S data  RO A       */
> +
> +/* Xen maps every flat segment across all of memory. */
> +#define GDTE_FLAT(flags) GDTE(flags, 0, 0xfffff)

... nothing in any of these constants is GDT-specific, and the FLAGS infix
isn't very useful there either (albeit I probably also wouldn't outright
insist on its dropping).

As to the GDTE_FLAGS_* constants' comments: The P and S bits (which are only
ever set) are mentioned, while the D/B bit (which varies) isn't. For the
constants themselves, there's clearly redundancy with asm/desc.h's _SEGMENT_*
constants. Possibly those could be used here, perhaps eliminating the need
for those comments.

Jan

