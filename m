Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEDFCF65E1
	for <xen-devel@archiver.kernel.org>; Mon, 26 Jan 2026 11:41:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1213621.1524074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkKyV-0002Sv-5V; Mon, 26 Jan 2026 11:41:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213621.1524074; Mon, 26 Jan 2026 11:41:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkKyV-0002So-2f; Mon, 26 Jan 2026 11:41:43 +0000
Received: by outflank-mailman (input) for mailman id 1213621;
 Mon, 26 Jan 2026 11:41:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fT7M=77=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vkKyT-0002Si-Sx
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 11:41:41 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fae27bb2-faab-11f0-b15f-2bf370ae4941;
 Mon, 26 Jan 2026 12:41:40 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-42fed090e5fso2654393f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 03:41:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1c24b54sm30358393f8f.15.2026.01.26.03.41.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 03:41:39 -0800 (PST)
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
X-Inumbo-ID: fae27bb2-faab-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769427700; x=1770032500; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NzX6jEIUs9cmuvsE+hialT1oG1nBlxW7ukQptAIUJa0=;
        b=b0LdMKobJ58OHeO+s70dy2TJKox/TpOvrwtHPrYEBcvvf+bKg5Ud+/MVHiuZsvod0I
         fDUkbrZDtE9yt2fjvFBfChsHG2lSlA6QuP9tH9yybgabXIE2BTaCVuwRlwGwjF7AZfor
         cBkc9+XXEXxDJFWHaNyHDj0f9Alz8pz8009KiJltiXvDG+kvrBu440iatUkNevhlhRBY
         B+oB/VXmVujcDYUj551HUGJzg95Z+vk0oVcNIcUzjXJBKQKHmr3POO2Hw9lsJ31kFfah
         4dcnFcgd88jKf5WNQYv67Yy3d6blvqbycrCoibHRb+9mJE1KaE1LhNaTJJ0i7vnID3ag
         Qj7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769427700; x=1770032500;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NzX6jEIUs9cmuvsE+hialT1oG1nBlxW7ukQptAIUJa0=;
        b=fjtLaXLwYISTwq2XuEecr/ys92chzDWtXv5jazkzblzZm8rJV4x+1sB5zpmg+c8XBH
         X/8ExWrmf4eG75DvY4R7auFNXn0UR/NWFz0B6ANaTw++zKLAHddS5t+scIP/ZRzThvTy
         kQKB/upwVE3IvdLV/aOXGshc0OjvmAOVny62GfCuj6t6tiVFfh/WK3EuGAx9mxh1Fgsl
         Ty0D9ol4U8OGdgN2J0x3hfwLeiMLOwsb2TtOkPX7UtH1LqQypi6pC/8ap9M+31RCunPt
         3LbRu8nnYY9ZAYJkUIEtetpBO8Xq3ZztjTH+9IWUQXu98XA5RfdmZ5f/LqYhHnE6QgzI
         czFg==
X-Forwarded-Encrypted: i=1; AJvYcCVz3ObK6N7OKjFaqOOfL1CnTWDKTtb9nEgbD549u/1rIzdw1qT8jPWz1+uLGEMUiIM7THNbKhNsSt4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzXylwYeoQ715EkXik8y1stDeLRGfb1da0bq4hE35DTWJ2lWXBi
	dzCncCN3HiJpj7aXm54FO16IH0NKYI9XoHqVq4xq+1j1c3bgMtnW+pLknDtTa1jK0g==
X-Gm-Gg: AZuq6aIXrq+AgzPjBgChqbeKQ4oGZ3dUx26wjFvzf/1nz+8rBTTZ2WFLTfkBVI+/AlY
	FGwIDfccK5y+9DfA0FkZkeCB3r07kKoB1lwomUPIo848yLEgPR+/fLBmAhNtIwYqlkFNP9zi62y
	QYPI3FxYHHdIp6V5vj+IDeuPCBrxSD4xhRlbW+pzcX7CG2sYOR0iEJpcjSxw+vP1tsct1rIFiru
	YFhtgYCdxTSxF1DL5czy8o7/Jv9RSRuGnx+ROfZ8u6b7sFtcMaJKwOV/9R2uQlPlpSICv+M7i+h
	+xjanMy/QwRNwkb+Dt2lFlOB9lk8dPBlQv2Od21GjQKnTYNJIXMw9R8ZueVkpczy3Wp3OZHaiTE
	W/AzDzygDvpBjDkWsno4k5ZLy1+GG8XksTClm3yFg7Dt+k0MQkEJUCtLOXRhXoGUzTXQqN0Xnue
	Bwgaiqxn5R/irQq3r7FGJcXHS48MTDBXabFKkC6UtQLumFUDzveem+IC3zlGExlGGNSSXyh53zb
	dqDdmQLXwH6pw==
X-Received: by 2002:a05:6000:2911:b0:3ec:db87:e5f4 with SMTP id ffacd0b85a97d-435ca122cd9mr6307716f8f.7.1769427699828;
        Mon, 26 Jan 2026 03:41:39 -0800 (PST)
Message-ID: <e4801098-4525-40a7-91e2-7ffeb7a6d859@suse.com>
Date: Mon, 26 Jan 2026 12:41:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/16] xen/riscv: introduce struct arch_vcpu
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <ef706b474a23cb24a7bc119f8206e9df527b7287.1769099885.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <ef706b474a23cb24a7bc119f8206e9df527b7287.1769099885.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.01.2026 17:47, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/domain.h
> +++ b/xen/arch/riscv/include/asm/domain.h
> @@ -22,9 +22,62 @@ struct hvm_domain
>  struct arch_vcpu_io {
>  };
>  
> -struct arch_vcpu {
> +struct arch_vcpu
> +{
>      struct vcpu_vmid vmid;
> -};
> +
> +    /*
> +     * Callee saved registers for Xen's state deep in the callframe used to
> +     * switch from prev's stack to the next's stack during context switch.
> +     */

What is "deep in the callframe" intended to convey? I'm in particular wondering
about ...

> +    struct
> +    {
> +        register_t s0;
> +        register_t s1;
> +        register_t s2;
> +        register_t s3;
> +        register_t s4;
> +        register_t s5;
> +        register_t s6;
> +        register_t s7;
> +        register_t s8;
> +        register_t s9;
> +        register_t s10;
> +        register_t s11;
> +        register_t sp;
> +        register_t gp;
> +        register_t ra;

... sp and ra, which presumably don't live anywhere "deep"?

Also, what about tp? The 't' in there isn't the same as that in "t0", "t1", etc.

> +    } xen_saved_context;
> +
> +    /* CSRs */
> +    register_t hedeleg;
> +    register_t hideleg;
> +    register_t hvip;
> +    register_t hip;
> +    register_t hie;
> +    register_t hgeie;
> +    register_t henvcfg;
> +    register_t hcounteren;
> +    register_t htimedelta;
> +    register_t htval;
> +    register_t htinst;
> +    register_t hstateen0;
> +#ifdef CONFIG_RISCV_32
> +    register_t henvcfgh;
> +    register_t htimedeltah;
> +#endif
> +
> +    /* VCSRs */

Why the V? These are normal CSRs dedicated to VS use, aren't they?

> +    register_t vsstatus;
> +    register_t vsip;
> +    register_t vsie;
> +    register_t vstvec;
> +    register_t vsscratch;
> +    register_t vscause;
> +    register_t vstval;
> +    register_t vsatp;
> +    register_t vsepc;
> +}  __cacheline_aligned;

I continue to question the presence of this attribute.

Jan

