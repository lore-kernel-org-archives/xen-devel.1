Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDC4CC6B00
	for <xen-devel@archiver.kernel.org>; Thu,  2 Apr 2026 06:30:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1271111.1559399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8BZT-0002oB-S7; Thu, 02 Apr 2026 06:30:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271111.1559399; Thu, 02 Apr 2026 06:30:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8BZT-0002o4-OW; Thu, 02 Apr 2026 06:30:27 +0000
Received: by outflank-mailman (input) for mailman id 1271111;
 Thu, 02 Apr 2026 06:30:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w8BZS-0002ny-Md
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 06:30:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8BZS-000iIe-2h
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 08:30:26 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ce0d00-2eae-0a2a0a5409dd-0a2a450adba8-6
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 08:30:25 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69ce0d01-ee98-0a2a450a0019-d155802ae8c9-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 08:30:25 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4853c1ca73aso4168135e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 23:30:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4888a66c766sm42807645e9.8.2026.04.01.23.30.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 23:30:24 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775111425; x=1775716225; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PnHnPivMYhqkCaCgYVM251gRAV0D5haFazOmw5q5iWM=;
        b=atyAXFw5w7wZuIpSOrCay5AOxY+1OS3y1Q8sBe+PI5dXNIUWZVi3k9v2O6UY1M9pLM
         RfUngTHoLlAvFFx/Se6W1hF0d1aeDhSqSWUHfEKqMLIn4ZLjUnhdF/F/GIDt3Mw4PTha
         ECBAiKF8AIllnt5kZzhXum0XxQoy4J4bo58kwNcAlfl/dPP8HU3F0S+uKTIjvcznjci1
         CFEtTW0hhRKVhQA4ASH6CPVH/zKSvyc5V0ajFy1R+ix/e4O9KlgKCVA8C4lnZxaU6abB
         upOootCUT28iIePt2B47gz0jEL7+6MC54aWKAmQEE2Zl0P6iABNw0Y5Ty2qcnD/BQNL4
         YHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775111425; x=1775716225;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PnHnPivMYhqkCaCgYVM251gRAV0D5haFazOmw5q5iWM=;
        b=d2K+sfpFQq8q4mki3owLnZpxlER8m60r2xwSwhMoa/j2nM9eJUwFQtZMMcH51h2wbc
         oz77k3WQMr02TGSKkBMtsGm2UxxyG4aZ3amNUJJM9VevLhs+V+eu0aPqgLZ1lFEr339B
         jS18p3O5ztCtifdueaBjEI57VKpRwWGqAkw5pZV6aATseLK0SZL3NQVjs9HToaPrCZZ1
         qEnRQf4OVNHm/oLplIWpbONPaIhoLJcV4zw+RNroKnhef7Ora4Nsx/HDwVaW3SFt0v3k
         liXEqtbj/Py5UfVC3aJAhYlLWxrT7qvKlNQRXdTpeOwyAapK6w3SBJxlvKRk+do2TmN7
         a7qA==
X-Forwarded-Encrypted: i=1; AJvYcCX2EAlg5s0Bkl7P9iQWIi1P369zgDJJfTxhksKOe6E64uGQ63QpPxrHNGpCcC9NmOieMzUWcXZRlBc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzGb5uZ2uv3zI8FyNdrsUC/6k/5b0IwuP08pnoaOqhY0cJ/bJ0u
	mCCBP8DuVUMXdNWIgNTQeg0NrHQLilkmnw2CJxZzFu2Wieq6mpLBwym/tT6HkH9/lg==
X-Gm-Gg: ATEYQzxUL4ACqnIsGMm9tJsX90rTTM9u/t674P9vMfiKO1MGagp8+olW9SbMIStTU2t
	GDLezoCO04fxi/aDMRwl3bYi5ngJqtSLPjhBxOi+++a2qKTTD97IVS15o0SnrGAOY1C0Je/oZEC
	MtbJFvAx4dU1OJcW1L2Gc2AbV4yen51SLf8b+QV7wqR6Qr4snBlLYZiibjOr7dzJ9ANfUrgZwMJ
	WdVEzqaY3L5zu74IntKE5izn01AHiX7SYPPwXWK5ErbmYHVb4eXNzfChJ21ZtT7ZEsNYeyo/0/e
	WBjfgAaWoxEz2g7mFVMCqidi8951KYbRRdRVH4SkZAyPhHge7Iw+eTxXfrikQWQwZpykPjiIEn+
	qEMnLvFcBGxpsb642UxYru8kmDoXC5kP3D4YfGR0O0rmVPHGglFPLkSf1XCMh3Y0UBt8IzddE2z
	8CYeFxnYE0ll0889NawwmPeNu43ukWqfeNk6qbElxpKcF/y+/BCDlZNISEJA/8cwEsCDSE7ns8q
	4PavlCsimii7Bk=
X-Received: by 2002:a05:600c:4f91:b0:483:64b4:79da with SMTP id 5b1f17b1804b1-488835b7582mr99390035e9.26.1775111425231;
        Wed, 01 Apr 2026 23:30:25 -0700 (PDT)
Message-ID: <f28b1c99-9d84-4338-9278-b85cf283e7ef@suse.com>
Date: Thu, 2 Apr 2026 08:30:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] xen/riscv: add csr_read_safe() helper
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1774863161.git.oleksii.kurochko@gmail.com>
 <f870d5def964ee06471d6dde0f66d6585eb5ca36.1774863161.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <f870d5def964ee06471d6dde0f66d6585eb5ca36.1774863161.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1775111425-0F3490B1-FC35DB84/0/0
X-purgate-type: clean
X-purgate-size: 1113

On 31.03.2026 21:04, Oleksii Kurochko wrote:
> @@ -78,6 +80,38 @@
>                             : "memory" );                        \
>  })
>  
> +static always_inline bool csr_read_safe(unsigned long csr,
> +                                        unsigned long *val)
> +{
> +#ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
> +    asm_inline goto (
> +        "1: csrr %[val], %[csr]\n"
> +        ASM_EXTABLE(1b, %l[fault])
> +        : [val] "=&r" (*val)

Why the & when there's only a single insn?

> +        : [csr] "i" (csr)
> +        :
> +        : fault );
> +
> +    return true;
> +
> + fault:
> +    return false;
> +#else
> +    bool allowed = false;
> +
> +    asm_inline volatile (
> +        "1: csrr %[val], %[csr]\n"
> +        "   li %[allowed], 1\n"
> +        "2:\n"
> +        ASM_EXTABLE(1b, 2b)
> +        : [val] "=&r" (*val), [allowed] "+r" (allowed)
> +        : [csr] "i" (csr)
> +        : );

Why the excess colon?

With these adjusted (again happy to do so while committing, so long
as you agree):
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

