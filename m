Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFE1EA3F27
	for <xen-devel@archiver.kernel.org>; Wed, 11 Feb 2026 09:45:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1227122.1533452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq6mR-0000FQ-E9; Wed, 11 Feb 2026 09:45:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227122.1533452; Wed, 11 Feb 2026 09:45:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq6mR-0000FJ-Az; Wed, 11 Feb 2026 09:45:07 +0000
Received: by outflank-mailman (input) for mailman id 1227122;
 Wed, 11 Feb 2026 09:45:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vq6mQ-0000FD-Pw
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 09:45:06 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56ffc414-072e-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 10:45:03 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-48327b8350dso43591935e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 01:45:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835a5c0df8sm16549185e9.0.2026.02.11.01.45.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 01:45:01 -0800 (PST)
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
X-Inumbo-ID: 56ffc414-072e-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770803103; x=1771407903; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D9vjWfWOxmMdY6iwXsJOHNNgCOOmWOZgjW8gWaCRK7A=;
        b=WR/dbQRiY5AZTR8W17ejTjuBJL6NzJEfTAGOYtRJJa0uqG9e4KN5NMKz7DZWd0Rp9o
         +FN55Iu9V9au9yWnVPHCXDkYvbA98Kt6II0jQ58ba8TYEhzYOlproJtLdw+o+uLwjT8Z
         mPIkh5y8y7TqAU9RQMNcV6JldF3CyrBhJQ/KPDW185rXKp1Le6Nu1ibUZ57Ag067LKlo
         O10P2+PqefYAK8cXW2LlcD3CktY5v2wRMJfszM9ZDowPQdCV54zmO6K4aVqfOu05jnnd
         GxcEkZovWfMTqJFFVU9QCu9T89UNjJxw2Z8B50RFI07gwGgFw2dQ2i7B4Na9QYrNklfV
         Sn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770803103; x=1771407903;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9vjWfWOxmMdY6iwXsJOHNNgCOOmWOZgjW8gWaCRK7A=;
        b=n6cytknmAeu48t3LfXnxPRVKow6GoUidjVjysqC7T3AuA69rx3fvvsRrabQ7WuVNx9
         Y9zxLMDzxy0NL3o/AuF5e1YcLrXaWlAm27TSniUHlM36xnoK17rcSqkkbFT6+Crk989c
         jSdKpLQgm45qx8WRy1Nt7ibw/FHvmyjicXl2aFFNYiXn3tp9ZZSoEi+VB69ra6UoyRkN
         4tKtgTotoBFlYGUvo4lZux6ES5jkVh28Wc7Xfpo2C1dhFSK39GPF5Vb1oTUFE4H1MChj
         zfhwy9N2cCIN+rqAZpc8SCduS8g2Ap1lPjvNPDAfMZJoCENeM4T+5hNSFMjoefiqVqng
         zDng==
X-Forwarded-Encrypted: i=1; AJvYcCVs0wmD6CDRaGaVwSp3uE9EhT5pnT9jrYxXGjR7CSv3U6eVXV8jhzD1LlVPNuNPwkXD01HjrtdoZlI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyu1OX8EEFYHXm3o//muPamyxUO5FixUmbp8WXRK0zRmYXk/3jJ
	BwpqqxTVrsSZP2oVb3ZLOU1bWr4qiJbFIk6c7a8WpCjD7+QiVSsvZWa4oZWhLan/0Q==
X-Gm-Gg: AZuq6aJDSpPV+Rkgu8jC3a+VJLx8GSFq2QBMuuGBOZWZn0j3HKm46zz+BdxnmdKc9Um
	FQUQ+0RisI+hCeLDgmZnc6Zzj7gQP8Q6j/nMVnL1LD5smLEbF/Oj+V1n4PejKZD34YWkEELOav3
	A+6K9u5JsMUe/eXLOaAeBGmkMhwvaG+TrdlZrRl31sm65ziuhnprhZj7NLutbwsxILG5fS3xm1B
	1j1VzTtmM4GO7Z7HTWwKnliYFSn3roi3eE546FJ791EVjqoMEWWmWblOIP1dJnKs4qdOL2RZT5d
	4Yal/HQum9kLDJ5dcjrB3RVN4aDBd+MKrqPSRVXBqKKDGPKTueY8nbEqI60n9kiACCLajPvsYO5
	Nvml5ET5RE/7ey9dK/ha6MaOBmDzDt3qekkkLjvEQSLR9XQ3cfnzfr/s8d2jn1faXBx4T4XKUcY
	lZhz/Q2Yf0diaWQbm6blNixIOWnoqpxmXAvaeGm+4r/vGin5nD/W1EoxCq3XRP9IqQn1btPOyZV
	dHHp2x6VZPKZ6I=
X-Received: by 2002:a05:600c:4e12:b0:483:54cc:cd97 with SMTP id 5b1f17b1804b1-4835b94a2cemr27715145e9.36.1770803102963;
        Wed, 11 Feb 2026 01:45:02 -0800 (PST)
Message-ID: <fa58fd77-b513-4704-8598-1209b55226a3@suse.com>
Date: Wed, 11 Feb 2026 10:44:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/16] xen/riscv: implement vcpu_csr_init()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770650552.git.oleksii.kurochko@gmail.com>
 <212accf20032cc9cbe6c33752fa45de1c1284e3c.1770650552.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <212accf20032cc9cbe6c33752fa45de1c1284e3c.1770650552.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.02.2026 17:52, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/domain.c
> +++ b/xen/arch/riscv/domain.c
> @@ -5,6 +5,72 @@
>  #include <xen/sched.h>
>  #include <xen/vmap.h>
>  
> +#include <asm/cpufeature.h>
> +#include <asm/csr.h>
> +#include <asm/riscv_encoding.h>
> +#include <asm/setup.h>
> +
> +#define HEDELEG_DEFAULT (BIT(CAUSE_MISALIGNED_FETCH, U) | \
> +                         BIT(CAUSE_FETCH_ACCESS, U) | \
> +                         BIT(CAUSE_ILLEGAL_INSTRUCTION, U) | \
> +                         BIT(CAUSE_BREAKPOINT, U) | \
> +                         BIT(CAUSE_MISALIGNED_LOAD, U) | \
> +                         BIT(CAUSE_LOAD_ACCESS, U) | \
> +                         BIT(CAUSE_MISALIGNED_STORE, U) | \
> +                         BIT(CAUSE_STORE_ACCESS, U) | \
> +                         BIT(CAUSE_USER_ECALL, U) | \
> +                         BIT(CAUSE_FETCH_PAGE_FAULT, U) | \
> +                         BIT(CAUSE_LOAD_PAGE_FAULT, U) | \
> +                         BIT(CAUSE_STORE_PAGE_FAULT, U))
> +
> +#define HIDELEG_DEFAULT (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)
> +
> +static void vcpu_csr_init(struct vcpu *v)
> +{
> +    register_t hstateen0;

There not being an initializer here, ...

> +    v->arch.hedeleg = HEDELEG_DEFAULT & csr_masks.hedeleg;
> +
> +    vcpu_guest_cpu_user_regs(v)->hstatus = HSTATUS_SPV | HSTATUS_SPVP;
> +
> +    v->arch.hideleg = HIDELEG_DEFAULT & csr_masks.hideleg;
> +
> +    /*
> +     * VS should access only the time counter directly.
> +     * Everything else should trap.
> +     */
> +    v->arch.hcounteren = HCOUNTEREN_TM;
> +
> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svpbmt) )
> +        v->arch.henvcfg = ENVCFG_PBMTE & csr_masks.henvcfg;
> +
> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
> +    {
> +         if (riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ssaia))

(Nit: Style.)

> +            /*
> +             * If the hypervisor extension is implemented, the same three
> +             * bitsare defined also in hypervisor CSR hstateen0 but concern

(Nit: "bits are")

> +             * only the state potentially accessible to a virtual machine
> +             * executing in privilege modes VS and VU:
> +             *      bit 60 CSRs siselect and sireg (really vsiselect and
> +             *             vsireg)
> +             *      bit 59 CSRs siph and sieh (RV32 only) and stopi (really
> +             *             vsiph, vsieh, and vstopi)
> +             *      bit 58 all state of IMSIC guest interrupt files, including
> +             *             CSR stopei (really vstopei)
> +             * If one of these bits is zero in hstateen0, and the same bit is
> +             * one in mstateen0, then an attempt to access the corresponding
> +             * state from VS or VU-mode raises a virtual instruction exception.
> +             */
> +            hstateen0 = SMSTATEEN0_AIA | SMSTATEEN0_IMSIC | SMSTATEEN0_SVSLCT;
> +
> +        /* Allow guest to access CSR_ENVCFG */
> +        hstateen0 |= SMSTATEEN0_HSENVCFG;

... doesn't the compiler complain about the use of a possibly uninitialized
variable? The variable also wants to move to the more narrow scope.

> @@ -32,6 +98,8 @@ int arch_vcpu_create(struct vcpu *v)
>      v->arch.xen_saved_context.sp = (register_t)v->arch.cpu_info;
>      v->arch.xen_saved_context.ra = (register_t)continue_new_vcpu;
>  
> +    vcpu_csr_init(v);
> +
>      /* Idle VCPUs don't need the rest of this setup */
>      if ( is_idle_vcpu(v) )
>          return rc;

Do idle vCPU-s really need to have vcpu_csr_init() called for them?

Jan

