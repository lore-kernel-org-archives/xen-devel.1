Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C694C79FBF
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 15:29:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414896.1644568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4gi0-0003r8-I0; Thu, 10 Sep 2026 15:29:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414896.1644568; Thu, 10 Sep 2026 15:29:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4gi0-0003r1-EB; Thu, 10 Sep 2026 15:29:04 +0000
Received: by outflank-mailman (input) for mailman id 1414896;
 Thu, 10 Sep 2026 15:29:03 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4ghz-0003qv-4Q
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 15:29:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4ghy-00BFUT-GX
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 17:29:02 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa2cca2-2eae-0a2a0a5409dd-0a2a4507aa56-20
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 17:28:58 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa2ccb9-b4ea-0a2a45070019-d1558031e5d2-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 17:28:58 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4957eefd361so56835165e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 08:28:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d26c300e2sm86166185e9.8.2026.09.10.08.28.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2026 08:28:57 -0700 (PDT)
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
        d=suse.com; s=google; t=1789054137; x=1789658937; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YmRH8clDkwZLuTytZukJgH9gKU+dqVofznq9Me5p3Ag=;
        b=XZ0LR+TA+zOVZmaPSuZObPZu4FEFF3g31USGttIvH92wejGTiX95Iiepb6skPkhN/P
         DC6IxzdrollZ3lmx55LPxuo/ykWbp19s+m212gVuytX/5aCyjiObpQlK4/28fcEdM+7c
         lW2n2+NuRM2/pcXeyFcvAQhr7L7VcciTWQGwloJXGdaMV7/DsOqx3ybmaHi5Eu79kNdv
         qj/cy178+BGnIVbljo1KN9EwdNMflckaT/pmYihvezaZLWPHihUJxAF46EK18qKh/dZ0
         qJgCLED6QNU/IOIBB9JAdSZwc7uPuVnET4SFO0q9MIo4syzo5oV1c/SMvRgJAH61S6sT
         nICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054137; x=1789658937;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YmRH8clDkwZLuTytZukJgH9gKU+dqVofznq9Me5p3Ag=;
        b=nBDSXWMM3nLOlmm9jCoXSkKbF7fNvnKT3gyEXRtA4/EQJqcK1MGuZWl3nkvmGFsyvK
         +ogAnu/T15MxyF0kcybsqerro4xjKz9bfl8D0EuLH1EbeQpNvpdeteVAdOZ3yaftR2aR
         ViKvC6AWuea0dcSQYYS5EeHKkNtcxYvXUyWELbtfZ3alLSdcY+m8x0PQ2rJJ8h50Kc6y
         2e7RuKdICKacXNk35ZBtJluoK5mNLM05Ikzc12O0UURPgRtRncUyFaxwtVjC9DLtvswx
         mc6Ms5ufXIpQMZkWzst+EjdhiBKd7qCVihGJ6+J2acJvu4yB41QIJhOn/QiqsBLHq/BC
         fNMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGgNlyhsgQODcATmuOKU91Oz5wGOq2geOaExf8qBCyujpb1D7l/2aLoKrTYgMPFCSaM4mqiQpy3tY=@lists.xenproject.org
X-Gm-Message-State: AFuF++koutOoPhWQ2lBWur1BbDI2SnZ3G2SgQFmkBtqSJebf7LkhxfvV
	/9Kjt5POCa4KLSo5CYz1HweErepXQoUOq9rwUCdU7cuSrb+pwLPundWHI6oH1B/brg==
X-Gm-Gg: AYBFou0149+79bYunsCHkWgVHHLGkZT8mpgoxxEhtQlMQVcRdMLbe0poYUaHSjK247I
	ON/NPlvW+Ya0FQHyq9HY2dZckInIz0zStS++EvPTks+MIhiqg7/ACVzJeSeUPXWwf/Is+xXAD5g
	gVGD0of5D/0Htqu63Bs2F4h1I47RcY8gYmYmqx1YUCgP7k4z0GmIr5M0BeUww68KXi/mNF/U4Kg
	n+B8V1ql4eWybqMwzjmwMqHdb00qsbbNsQSCGMfZ2CBl2P3aU+8VrOS1WSd6LwiMnbEX5RAgkKb
	V9Or4T3xBTS7ZKAO0w5uqvFWgwLpz5+9r9rd4JqstFPATO3ezfiRVvpkOS6RncxlbCXAGfWHzCr
	oWGc7mcb4m0Zxw3GYiLsfXw/vezDNWucrOkc/ZelNbJsVOP4Wf1y9Fsa4s6wY+uOKIfgCGiyt/l
	f49hFpdvNL0ceX5HPBp1kFX01oJ+ifUKDBQmNfrY2i2iDju3NfvOJoUoBuI0Tc3NcmQfa5Tmd5L
	ARHjK5INAudjtaI4+O2g/yA/IXbh2wjKqPdKSl2yvsK+H9bnvB8IoR6KdagajguQD7gScjxLK0=
X-Received: by 2002:a05:600c:4ec9:b0:49c:fc6e:a3d2 with SMTP id 5b1f17b1804b1-49cfff39708mr375762685e9.17.1789054137446;
        Thu, 10 Sep 2026 08:28:57 -0700 (PDT)
Message-ID: <e1b02a7a-24b4-4500-a690-313c823280f6@suse.com>
Date: Thu, 10 Sep 2026 17:28:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 22/39] xen/riscv: add guest memory read helper
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
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <b68a29b7ef5b2cb83fde405b3854c94a2f44f4d0.1787838835.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <b68a29b7ef5b2cb83fde405b3854c94a2f44f4d0.1787838835.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1789054138-358C1AE4-771919C7/0/0
X-purgate-type: clean
X-purgate-size: 3160

On 27.08.2026 17:21, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/guestcopy.c
> +++ b/xen/arch/riscv/guestcopy.c
> @@ -6,6 +6,7 @@
>  #include <xen/string.h>
>  
>  #include <asm/guest_access.h>
> +#include <asm/traps.h>
>  
>  #define COPY_from_guest     0U
>  #define COPY_to_guest       BIT(0, U)
> @@ -114,3 +115,89 @@ unsigned long copy_to_guest_phys(struct domain *d, paddr_t gpa, void *buf,
>      return copy_guest(buf, gpa, len, GPA_INFO(d),
>                        COPY_to_guest | COPY_gpa);
>  }
> +
> +/*
> + * Read machine word from guest memory
> + *
> + * @guest_addr: Guest address to read
> + * @read_insn: Flag representing whether we are reading instruction
> + * @trap: Output pointer to trap details if something went wrong during read
> + *
> + * The hlv/hlvx instructions translate guest_addr through the live
> + * vsatp/hgatp CSRs, so the read is only meaningful for the address
> + * space of the currently running vCPU.
> + *
> + * At most two halfwords are fetched when @read_insn is true, i.e. encodings
> + * wider than 32 bits are not supported. Such an encoding cannot be completed
> + * by calling this function again at @guest_addr + 4: the length check is
> + * applied to the first halfword read, which would then be a continuation of
> + * the instruction rather than its opcode. It is up to the caller to reject
> + * anything that is neither a 16- nor a 32-bit encoding.
> + */
> +unsigned long riscv_read_guest(unsigned long guest_addr, bool read_insn,
> +                               struct trap_info *trap)
> +{
> +    /*
> +     * Poison the result: if the very first access faults, the fixup skips
> +     * over the loads without writing it. Callers must check trap->scause.
> +     */
> +    unsigned long val = ~0UL, tmp;
> +
> +    /*
> +     * hlv/hlvx use hstatus.SPVP for the privilege of the access, and the
> +     * live vsatp/hgatp for the translation. Xen never installs a value of
> +     * its own in hstatus (it is only saved on trap entry and restored
> +     * before sret) and it doesn't reschedule before returning to the
> +     * guest, so all three still belong to the vCPU which trapped.
> +     *
> +     * Check the saved copy rather than the live CSR: a nested trap taken
> +     * from HS-mode clears hstatus.SPV in the CSR (but leaves SPVP alone).
> +     */
> +    ASSERT(vcpu_guest_cpu_user_regs(current)->hstatus & HSTATUS_SPV);

The first paragraph talks of just hstatus.SPVP. The second paragraph then
starting "Check ..." means that still refers to hstatus.SPVP, when - aiui -
hstatus.SPV is meant.

Furthermore, instead of special casing nested faults here, but otherwise
saying "Xen doesn't modify", wouldn't it be better to word things such
that they remain correct if Xen ends up having a need to touch some other
part of hstatus (including, potentially, SPV)? IOW - I think it is natural
that the original guest value is checked. Question being of how much value
that checking is: vcpu_guest_cpu_user_regs(current)->hstatus can't possibly
have SPV clear, can it? Only nested exception frames could.

Jan

