Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB019CA9EDE
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 15:40:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446445.1662563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGI8i-0007C5-A7; Mon, 12 Oct 2026 15:40:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446445.1662563; Mon, 12 Oct 2026 15:40:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGI8i-0007By-6k; Mon, 12 Oct 2026 15:40:36 +0000
Received: by outflank-mailman (input) for mailman id 1446445;
 Mon, 12 Oct 2026 15:40:35 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGI8h-0007Bs-B2
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 15:40:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGI8g-006fpX-CJ
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 17:40:34 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6accff71-8faa-0a2a0a5109dd-0a2a45059a4a-2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 17:40:34 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6accff71-4cb1-0a2a45050019-d1558032ac0a-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 17:40:33 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4a01933b584so17837455e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 08:40:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a190344032sm299774415e9.15.2026.10.12.08.40.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 08:40:32 -0700 (PDT)
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
        d=suse.com; s=google; t=1791819633; x=1792424433; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OHcbuaX8ZY8NhWtfaUQWJtUiZ5954j21xRi4n3rwmzo=;
        b=ZYfnBBGm5vexkx68h1HSjTVFKjIPj28srzK6gO6W4R4uLiwDZ5zAs7Rv88vRu4+SZK
         bvWPlFA7ZiRxupJXHD+9rnV1ujr2U3evhRuZC2U4gHOKZk8oZaxOCXesrtC7wijCMdhF
         mySw462gwKcCdzq8vYWNafu81zyoKdwyqQUfkIMf6VLdkKff7LGcY3ptk4E2pb0/87VW
         IyC/epPbJwlmXIEvTfA+4nnIuREn6QVQeaEEhAqeVjxtBhHTjzKsyAfsubcsp9fnVVax
         xMh8Wrw2qKGrJtznuXEWmV+hL22kvOoT1k3/Vxi9zBxPX5fSL64/VAU1YcH4eVZ/N6KN
         nS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819633; x=1792424433;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OHcbuaX8ZY8NhWtfaUQWJtUiZ5954j21xRi4n3rwmzo=;
        b=pa5ZCBOQOxdOR38//BqljE5ew4I1hLTLhKP7wBgi4PVo8MIy22gB/H0P1rqTyrIeU5
         31vHq/0SI4IYo/tre/CdVKRM/hhEX+bHb83FkhGc/Fu49UUHOjb70AAaD6CpZsPYq4+N
         JistLmWYJNRmwk5TOei3PdWPZpqfLJ4ENDR6mdCVXRht0H6c2hAK1c+f1BH5cIXh0Puk
         K8OCcxOtg5BUjilcHyNXNnQuhmlnXrGWJcgu5VISHn4IQMCYYNakBGZoYDrkA+ia1KwE
         gwCnKWTWvFZEpFU8dcEK54KkW3o9lT2Se2+3bl6ryUdEvPSlx3p94oYX04a4yWsRTuyL
         /DuQ==
X-Forwarded-Encrypted: i=1; AKwUvByfMwbSVmOcy0oGKdTajIPKaRFFr1GjxuqIfGtTwzp93Cn1rVoLFlA0LQfoURDYbnONw7X0wMuwz30=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKzFzjPAevv3+2rGMdmnOmYihYXA4haCH4xWz8ofhwbFvsjti6y
	x7akNnbC/6yoVgMumqfVN+Ca2c4zMdB3NCPOgTiWS2sOERpfm0slTCTjZ9imqozmDg==
X-Gm-Gg: AYBFou1Ni6RPAnW9r0U0CsBi6Rh4rN8I1/giyejzKvyKhKndcQLD/BD2Sfk9A+MQrPN
	IV+pW8FL3MGh51oee6lwkjeerIXQU6Y3Ixrxe3mvlaSBFDV/cdP6cYkHT2GL8Y5C9U1fVi5VQQA
	nWpbsMVr8Soq97BmmA62P5Or5g9idZDS8VgcrvHmYJvz4XuRahw0qpYZjgyniEr+cRUq5PPoyLV
	yu+/1jRrjfBZdLiER95n+ItG0bZVwWs0/JNqxS3Rs3Rvzbg8xAiiIYEOFXw2ILj2e2N6x8mXwRq
	30AjmTbDwBJiz7Yp3Xv4AvDmYWUNdBcy8Dr5bAR+Q53cQFm4TYcSxgV3jQYFmsw1T66UJyYeRGT
	fzoDTI0jGFJW6I2r3Ie6Ovi3nsPjtY2/COAdBPsxcUE7F970tpuczvHTf4ZVWNi4zSIDnHJfxWH
	5x3/0wiycwTkXijsbmg3v66nn+rfhRpYyFaFLHA9DWl4uKWcPUq/YqSxY1WrBNbnm8YgzYA3PqU
	W0fu775elnPj6BBmPgOpEyv4YEqKFiRCZR4yJrKdREAPESwrdz779EYiAMaXCH+nPSgqRtkXPs=
X-Received: by 2002:a05:600c:3554:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4a18e43a1cemr190157205e9.1.1791819633318;
        Mon, 12 Oct 2026 08:40:33 -0700 (PDT)
Message-ID: <d08b6491-8b87-49ba-80bd-36d4448a59b3@suse.com>
Date: Mon, 12 Oct 2026 17:40:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/39] xen/riscv: introduce CPU_NONE
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
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <d35b280c0bf075a2a730f9cb69ced407e346ebd5.1790779209.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <d35b280c0bf075a2a730f9cb69ced407e346ebd5.1790779209.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1791819633-F56AD2A1-DA91C03D/10/78276251493
X-purgate-type: spam
X-purgate-size: 2134

On 30.09.2026 18:18, Oleksii Kurochko wrote:
> Introduce CPU_NONE, a CPU number which doesn't identify any physical
> CPU, to be used wherever a pCPU has to be recorded but there may be
> none.
> 
> Its first user is vsfile_cpu in struct vimsic_state, which records the
> pCPU whose h/w guest interrupt file backs the vCPU's IMSIC VS-file.
> NR_CPUS has been used there as the value meaning that there is no such
> pCPU, i.e. that the s/w VS-file is in use. NR_CPUS is however an upper
> bound rather than a "no CPU" marker, and it already carries other
> meanings: hartid_to_cpuid() returns it for a hart Xen doesn't know, and
> pcpu_info[] uses it for an entry whose processor_id isn't valid yet.

Yet these could (and imo should, subsequently) entirely plausibly also be
switched to CPU_NONE. IOW I don't think ...

> Use CPU_NONE for vsfile_cpu instead, so that the s/w VS-file case can't
> be mistaken for any of those.

... this is a plausible justification (nor in its re-written form as per
Baptiste's suggestion).

If you want such a distinction, you'll need separate sentinels for every
one such field.

> --- a/xen/arch/riscv/include/asm/config.h
> +++ b/xen/arch/riscv/include/asm/config.h
> @@ -136,6 +136,9 @@
>  #define OPT_CONSOLE_STR "dtuart"
>  #define INVALID_VCPU_ID MAX_VIRT_CPUS
>  
> +/* A CPU number which doesn't identify any physical CPU. */
> +#define CPU_NONE (~0U)
> +
>  /* Linkage for RISCV */
>  #ifdef __ASSEMBLER__
>  #define CODE_FILL /* empty */
> --- a/xen/arch/riscv/include/asm/imsic.h
> +++ b/xen/arch/riscv/include/asm/imsic.h
> @@ -71,7 +71,7 @@ struct vimsic_state {
>       */
>      unsigned int guest_file_id;
>      /*
> -     * s/w IMSIC VS-file -> vsfile_cpu == NR_CPUS
> +     * s/w IMSIC VS-file -> vsfile_cpu == CPU_NONE
>       * h/w IMSIC VS-file -> vsfile_cpu < NR_CPUS
>       */
>      unsigned int vsfile_cpu;

As can be seen from the comment alone, there's now the risk of
CPU_NONE < NR_CPUS, at which point users of the field will be
screwed. I think you want

    BUILD_BUG_ON(CPU_NONE < NR_CPUS);

somewhere.

Jan

