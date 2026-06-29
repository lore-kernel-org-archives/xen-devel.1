Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D64C43458
	for <xen-devel@archiver.kernel.org>; Mon, 29 Jun 2026 14:46:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1347669.1605501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weDFv-0001V0-2J; Mon, 29 Jun 2026 14:46:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347669.1605501; Mon, 29 Jun 2026 14:46:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weDFu-0001Ut-VU; Mon, 29 Jun 2026 14:46:38 +0000
Received: by outflank-mailman (input) for mailman id 1347669;
 Mon, 29 Jun 2026 14:46:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weDFt-0001Un-Gj
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 14:46:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weDFs-000WBb-TH
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 16:46:36 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a428536-e002-0a2a0a5209dd-0a2a4504de7e-40
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 16:46:36 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a42854c-a01d-0a2a45040019-d1558030d121-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 16:46:36 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4926bd21aa1so24374935e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 07:46:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493b124ceeesm65553825e9.11.2026.06.29.07.46.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 07:46:35 -0700 (PDT)
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
        d=suse.com; s=google; t=1782744396; x=1783349196; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2y4sJ3Z3gu/tZOvUhERSXEI0rZ+QhLcevc53CnxfKbY=;
        b=JhZvvW0Kt1EJdbQoXHS4JumXUv8bb3vas/wRnFjxUoAg3ncDEbgRJxaqBgpxAFYW/X
         7/xwImzTtxQsdDSmGHu+NGFnCG3L5RZCfbXtC6wOleS09xPmxvY2KfOKmIQ8rZKKeFTm
         63QMSdsqFMfBwxMRsJarx6lUm3DQKFll5Wfja6w7spxp8Eug3ZkZknrypgUUi8WN1eYs
         i5/ZE5rJslnczCK4uhYYAbsHHcO8D7weyfuCN85O8L5iM9fH1iCQrLTPbrYzH2TRmPub
         xOyUkzgHv1iNQYljypZR3vTJ450DJCJQCocAskSgcZ9vtXyaDSmZOtAK2yEoRbkAQ7t0
         3VmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744396; x=1783349196;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2y4sJ3Z3gu/tZOvUhERSXEI0rZ+QhLcevc53CnxfKbY=;
        b=jFQpx7WSRe2su05DYHDCpq5rB3LfB6vBVjghblS/QI+zIPfEbT8I5bUm8+YL1E5/Xi
         dN3/gmAkwtZxWRb1Q+of8/zDRPy6OX7szZsecsKmnYfGImrVDlQts8PYHikgGAnvxnx4
         N4kehabTzXbW4f+vAPeR9n1D3C48629oXvQndRwk7YhzTISxX91GKU2VxHU6czRfGPFe
         JW9p6dUYckHfyFjo975+WvF/GT9VDclxzo06KxhnXSHbtCo4f0t/+TZgqwBtDDSne6Ae
         cQH1TR1evcPNSJxp5ljCVquxneIlBGKH/+tdKKn14rrD9PbP3BOjXUhcut2If68tX4V/
         XAAA==
X-Forwarded-Encrypted: i=1; AFNElJ8KrAeA5A1XvtAl+kKz6tNfgBB2iK7N1PV0WUU04LARvLtl3GDq+iq07wpKPf8TJlO3kTMx0uWb9Oo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyzO6B5VvMVgBkCnYNbAhLqnU3WuPv8YJRhG2f3vTGi7FtTh3EN
	9ruZ9GPECjjI0kFBiYzldmUWAHs5UvO25oJZrN3AcecV2inOY8F2lFRcfz57efbXgg==
X-Gm-Gg: AfdE7cm0HhRZ5q8bqYhvB5yMoQkcJJj5Pl/IECL5jUMP0XPxcW6RWY0jkFaHTP+9POT
	cLwD1c/62IkqKSmyTypTgxDpKkXITUF/srkFadZWUD3SplKb4tafdB8BooLoiaFX3gIkxzAoECW
	FAcVo0vFdPlTOyC8CWdCrLHRsfm9OCKvIkbJGzIQ69GmSUb9CY33em0TdjMhKETZA4HFVEfOHoQ
	XPxv5QPUKfE7vjp/OVh8Ewj/exgChqbwsgnt2SQxcgs/FKP4uH1IfKUPFjiDuwF0qRrgwidfSnr
	jzDy2fs9wBVCxFNdRYliregXzlqmwwdHBIFJoBv5L0NlxzHcmB7TE9L3bfkthy5Kkh/FpOgDX7L
	SP2hDy1hWxTzMQYj19RRaTBo2e8P6/fS8kyUAgUQJUdCkiUbYfSb6lISqjfM/M0ipqBdvsFgWH6
	xTbUKj9UTjz3AI9paaTGkh1/RMGZwwTSsOV+HaIxrKKOSOyq82oWmglNdCRKzsBPutOKbvz8SE4
	tUL
X-Received: by 2002:a05:600c:3acd:b0:492:6da2:5f0e with SMTP id 5b1f17b1804b1-4926da25f4dmr183370625e9.32.1782744396211;
        Mon, 29 Jun 2026 07:46:36 -0700 (PDT)
Message-ID: <9d082182-394d-40cd-9afe-35369d7bc4bc@suse.com>
Date: Mon, 29 Jun 2026 16:46:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/25] xen/riscv: introduce guest riscv,isa string
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
 <b2678a5697112d3ac16a98b86433da22374324b2.1782487661.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <b2678a5697112d3ac16a98b86433da22374324b2.1782487661.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1782744396-2D7AE1CC-FAE1CE44/0/0
X-purgate-type: clean
X-purgate-size: 2977

On 26.06.2026 17:46, Oleksii Kurochko wrote:
> Changes in v4:
>  - Add an explicit overflow guard in build_guest_isa_str(): return
>    -ENOSPC when buf is non-NULL and total >= size, to avoid the
>    size - total underflow being passed to snprintf().

How does ...

> @@ -480,6 +489,81 @@ bool riscv_isa_extension_available(const unsigned long *isa_bitmap,
>      return test_bit(id, isa_bitmap);
>  }
>  
> +static int build_guest_isa_str(char *buf, size_t size,
> +                               const unsigned long *isa_bitmap)
> +{
> +    int total;
> +
> +#if defined(CONFIG_RISCV_32)
> +    total = snprintf(buf, size, "rv32");
> +#elif defined(CONFIG_RISCV_64)
> +    total = snprintf(buf, size, "rv64");
> +#else
> +#   error "Unsupported RISC-V bitness"
> +#endif
> +
> +    if ( total < 0 )
> +        return total;
> +
> +    if ( buf && ((size_t)total >= size) )
> +        return -ENOSPC;

... this help an underflow ...

> +    for ( unsigned int i = 0; i < ARRAY_SIZE(riscv_isa_ext); i++ )
> +    {
> +        const struct riscv_isa_ext_data *ext = &riscv_isa_ext[i];
> +        int ret;
> +
> +        if ( !riscv_isa_extension_available(isa_bitmap, ext->id) )
> +            continue;
> +
> +        ret = snprintf(buf ? buf + total : NULL,
> +                       buf ? size - total : 0, "%s%s",

... on any but the first iteration here?

> +static void __init init_guest_unsupp(void)
> +{
> +    __set_bit(RISCV_ISA_EXT_f, guest_unsupp);
> +    __set_bit(RISCV_ISA_EXT_d, guest_unsupp);
> +    __set_bit(RISCV_ISA_EXT_q, guest_unsupp);
> +    __set_bit(RISCV_ISA_EXT_v, guest_unsupp);
> +    __set_bit(RISCV_ISA_EXT_h, guest_unsupp);
> +    __set_bit(RISCV_ISA_EXT_sstc, guest_unsupp);
> +    __set_bit(RISCV_ISA_EXT_svade, guest_unsupp);
> +    __set_bit(RISCV_ISA_EXT_svpbmt, guest_unsupp);
> +}

Wouldn't riscv_isa_ext[] better get a prominent reminder that additions there
may need mirroring here (unless guest support is implemented at the same time)?
(As before, yet better would of course be to make sure this is consistent
right from build time, i.e. without the need to have this separate function.
Or minimally have the info right in that array, so that while adding one needs
to think how to set that separate field.)

> --- a/xen/arch/riscv/include/asm/cpufeature.h
> +++ b/xen/arch/riscv/include/asm/cpufeature.h
> @@ -17,6 +17,7 @@
>   */
>  #define RISCV_ISA_EXT_BASE  26
>  
> +
>  enum riscv_isa_ext_id {
>      RISCV_ISA_EXT_a,
>      RISCV_ISA_EXT_c,

???

> @@ -94,6 +95,9 @@ struct arch_domain {
>      struct p2m_domain p2m;
>  
>      struct paging_domain paging;
> +
> +    DECLARE_BITMAP(isa, RISCV_ISA_EXT_MAX);
> +    char *isa_str;
>  };

Why is it again that both the bitmap and its string representation need
storing? In the end they provide two different sources of truth, as there's
no guarantee that they'll remain in sync.

Jan

