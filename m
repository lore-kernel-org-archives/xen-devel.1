Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AFA606A330
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 15:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=E5r/GQ0l
Received: from list by lists.xenproject.org with outflank-mailman.1474982.1681821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOzdQ-0001Yl-LY; Thu, 05 Nov 2026 15:44:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474982.1681821; Thu, 05 Nov 2026 15:44:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOzdQ-0001Ye-IS; Thu, 05 Nov 2026 15:44:16 +0000
Received: by outflank-mailman (input) for mailman id 1474982;
 Thu, 05 Nov 2026 15:44:15 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOzdP-0001YY-52
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 15:44:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOzdO-004Ly8-HU
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 16:44:14 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aeca44e-8faa-0a2a0a5109dd-0a2a4509979e-0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 16:44:14 +0100
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aeca44e-be1a-0a2a45090019-d155802fa4e6-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 16:44:14 +0100
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4a549cd7fd2so8958275e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 07:44:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b4104d600fsm132090455e9.0.2026.11.05.07.44.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 07:44:13 -0800 (PST)
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
        d=suse.com; s=google; t=1793893454; x=1794498254; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+swIkPPXGoawDATYkIs9JcJ8iSdxm2UUBR0ghZysPYE=;
        b=E5r/GQ0l2eXo74hFjj7PwLKwlVHES51AGZHMMsS569W9KN15YJSNaA46CPG+5fky6c
         q+vHy56dOe1YHvIibby3RutM4JUqZfD+kGXqUy0mb7Zr6Npo/4PULXxccgp3+SptVsaP
         wWZnxRSLAJVh4/s98O8/eGDpzn9gQ5YF9V/a5bvzd7L0HS9Atlj9UOXiallV7hsJKvGJ
         pzAVSjwjwDnnA68o+j1grwq/ZhuHS4ppmLUkja2HEtRSf6va2fTs+eH6pb5zkArvGIhq
         NygowKNeo88wqWXVeSdqT3Wqzt/hRvdmZlK58C+Ad/1yrBnOLucWfUZojwFQ749/th9S
         3RaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893454; x=1794498254;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+swIkPPXGoawDATYkIs9JcJ8iSdxm2UUBR0ghZysPYE=;
        b=qnzvqo6tb4DV1i8EvFfatVnK3Nj7CAwTMXRoVsp7phxtCvFj6O0vtXYfb3LkQUlFLH
         wKD0TOuCYx2Yq12P17GvkwrnaQbgsdBKf/7l3Ch6cHJTZ2DegtEPQ1Mno8ZrdQF/TuiR
         Cmf4sp6ATek/MLRxvLtDccDXrj2QaygCV1OO3i/8liX+xf8pIXqEKxPBqtXG9lvdaSe/
         cXEHKUQLN5abvGFWgUsve2sVEtG9g0b5n/WCYFafnIckJLJbo6MML9DVkz96/n7N94Lt
         2c3ZGNLh6R0JIoeO/gMHWJgE3S2/ddE697tT2neI7NB2ZUE8l0OxDmBkIDRjQjNzdWb7
         kxXw==
X-Forwarded-Encrypted: i=1; AKwUvBy7t8LdYTx186W+xZYbQ7WzbQubhVgDQjKhQFd5G+kr32LUG/8+j+ROJJyTtankxztFgWnwal/2cyg=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+prqqN3QDlK0ij0d3AbTPV6apfrTih449TLxhYruKCdDgH0XGD
	biPInQqmUxFVoat9+yJ7ta/ex/zRo3iXLeTXt0CwPLgzNvFYXBYfYV+HgIpfUrvDfQ==
X-Gm-Gg: AYBFou035LSQXE08TmAo32W7451NjE1jODvnmnzdHiIWX1fCS87q8doQ+WJ9sqqdhFV
	Y0QhaLE7RCoMxD+MYteannBB5g4c6dm+n3RQ5/FAn+sOoL57/nsYuD4/Q52oYN4v7gEAjxbMm9S
	nXSahuGIaEaeO6zm1MI1Rny6CAUEb0QoW4rgTxrHh/1Z5JKtGQqvGRrg9JCb7uRmIAu4JgSHEhe
	Ommm1JgLMjmMvQVo+0vaNF5qnqtUier3lMx6vBz7/sF+WaFHwtX2YiiMb8cvKKg6CdDg25K8khs
	jfplnKhyUgZHyLDq7zteW53rMt5O/mt8I/JWm0/Li27rPAIKO2yRyTLI4h1ZUwYtzod2Bxamglh
	A1zN0AuivNGJwRBtdoq1SqtwW4yLcJr7KaNztwdsMUft7bnl2R95glDXa1jE2gU05riSmwvDSHp
	gmjnU7Ki0zmbrjK5bUGxuyfNIUOQ8WuTO1yuzM7nIt7fAgDgnR3SzKwj9bXciwABqoZs0zyTPgX
	JUDm+agV3ZexH8O53KDauENAOgjAwx2SkCg5YG2azDEcl+K6CCyewiBsWyVP0wWvl/0nZJADqcq
	ohWbOAJ1PHc8lr4X0ZYnj0VSj2uqaxuToank3a6HpcbZmcUHrDDVzdHOLQcC7OzYYelFgq3YTpm
	EKxrLq4lPAgdF/rE=
X-Received: by 2002:a05:600c:34d2:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4b55e07e6d5mr53150845e9.16.1793893453755;
        Thu, 05 Nov 2026 07:44:13 -0800 (PST)
Message-ID: <573590f0-1a94-4113-a76c-3ae644bebdff@suse.com>
Date: Thu, 5 Nov 2026 16:44:12 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/riscv: align header inclusion guards with
 CODING_STYLE
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Connor Davis <connojdavis@gmail.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 xen-devel@lists.xenproject.org
References: <20261105150336.25751-1-oleksii.kurochko@gmail.com>
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
In-Reply-To: <20261105150336.25751-1-oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1793893454-FC817034-65DE4FA5/10/78276251493
X-purgate-type: spam
X-purgate-size: 1703
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 05.11.2026 16:03, Oleksii Kurochko wrote:
> Commit 7abea85c9f12 ("CODING_STYLE: Updated header guard
> recommendations") changed the recommended naming of inclusion guards
> for arch-specific headers to <arch>_<something>_H. Most RISC-V headers
> still use the ASM__RISCV__<FILENAME>_H form required by the previous
> rules, and a few use ASM_RISCV_<FILENAME>_H, which follows neither.
> 
> Rename the guards to RISCV_<SOMETHING>_H. While doing so, also fix two
> guards which don't match their file names: extable.h used
> ASM__RISCV__ASM_EXTABLE_H and intc.h used the misspelt
> ASM__RISCV__INTERRUPT_CONTOLLER_H. For riscv_encoding.h, don't repeat
> the architecture name and use RISCV_ENCODING_H.

I'd recommend against that. If you want this tag, renamed the file as
well. Otherwise stick to the naming rules.

> No functional change.
> 
> Assisted-by: Claude-Code:claude-opus-5-5
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

With the above (and possibly also the below) adjustment(s)
Acked-by: Jan Beulich <jbeulich@suse.com>
Which way to make the adjustment you will need to indicate. Changing the
tag identifier can be done while committing. If you want to rename the
file, I could drop that one hunk from here while committing. Please
indicate intentions.

> --- a/xen/arch/riscv/include/asm/vsbi.h
> +++ b/xen/arch/riscv/include/asm/vsbi.h
> @@ -1,7 +1,7 @@
>  /* SPDX-License-Identifier:  GPL-2.0-only */
>  
> -#ifndef ASM_RISCV_VSBI_H
> -#define ASM_RISCV_VSBI_H
> +#ifndef RISCV_VSBI_H
> +#define RISCV_VSBI_H
>  
>  struct cpu_user_regs;
>  

I think at this occasion the #endif also wants to gain the usual comment.

Jan

