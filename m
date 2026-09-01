Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475B0C61DD6
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2026 15:20:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404796.1638454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1QHj-0005pT-Ev; Tue, 01 Sep 2026 15:20:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404796.1638454; Tue, 01 Sep 2026 15:20:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1QHj-0005pM-C4; Tue, 01 Sep 2026 15:20:27 +0000
Received: by outflank-mailman (input) for mailman id 1404796;
 Tue, 01 Sep 2026 15:20:26 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1QHi-0005pG-3U
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 15:20:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1QHh-001HAa-GO
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 17:20:25 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a96ed2f-e002-0a2a0a5209dd-0a2a4507bd2e-14
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 17:20:25 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a96ed30-b4ea-0a2a45070019-d155802dc16c-3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 17:20:16 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-49b8687630fso35947465e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 08:20:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b9266be71sm782856105e9.2.2026.09.01.08.20.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 08:20:15 -0700 (PDT)
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
        d=suse.com; s=google; t=1788276016; x=1788880816; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AP6ZxMTqU9edZIO7td9qL48Pd2+OlvlwdQotPq61V3Q=;
        b=G5v8iAEUtKkHACWBQ5urHlUnrUDzavpoS81MY8hkOy6SLSPUDFirMKHRJ2s82J4jQv
         xmtx8pY/gUmCIiNsM+IF54wfRi3FY5HaAAPiwdRTj2xj6N56CACJHeUkbfVLR5OlPVly
         9t8AYfkveSjUHWwh6beywqcFP1vkKEt8F01iE21OzOIjRGQ1GzUoKOdllBzOSI72wU4Y
         mcOshy1ETUZQuYkveCOeo1xsgrhtANPXfz1rKnVN4cv5UHFbIU5Mn/Lyvuh4AzIM6PrY
         CvNavj+UGfaRrVzZSf0ph/3HVcbz/XYKg3lPQKNLGbAIjiwCbgVjD9vjb+CnBc0sKerB
         Qrrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788276016; x=1788880816;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AP6ZxMTqU9edZIO7td9qL48Pd2+OlvlwdQotPq61V3Q=;
        b=qtPDT/v2xJOH9JVH9HzdWhUPVqIRnrxIeUZL7QkM4+lkCP+CWe4wtMn5HfS5RuU1Zc
         AxuVSyrEBxHMQgotKB4OddZ6g7fO2I85BZIrWarhuMXS4XwSzQRVa2ucMuZ1tGCClCRb
         yX0+dC1K3N2tTrwCJWHrhlYIZBHwCJXXbfUw/OcGX4FzQinuE0e55FBOiBGvOOrkxtEo
         NfNc+si9dDL94K3x6ufRdeQbx1tzjABg5wBEv5MQWV+MrfqXoYU5qIi+7cuPOjKtgzN+
         I0TUtYg1AKLGGPWS/sNyRBUf9sOu4L9WZY0TJSyNsCaZ5FOUzd8ZYrn6/acBAl4yatkK
         p3wg==
X-Forwarded-Encrypted: i=1; AHgh+RreVTpz6BDDC9S8s3ADYhbKvmVa/Cw7jug6KTrimmYyVjRGqjos4W2rOyBnSKDQR/SGWKQRGBkbnxc=@lists.xenproject.org
X-Gm-Message-State: AFuF++lFSb3gSp78EbogHD4cK+BskggIhN9XX3DYlqtAjSPVics601Ao
	NiOX5RDYP40w9Y/0S7zjhjEfG1LtmTj14DbQtMMA4z2fbIy+0ZQY9sYvy8WMiKQ81g==
X-Gm-Gg: AR+sD13TW2abkVs4my43xmsrcicxgpCndzPYLU6xL6wb5hvgrz5C9P4W6DO0DpzaIp/
	apjDNue04oEAgN1nv7ssIk7XLSqo8BrfKAu0sUpuRg8EJKKT2MIZCw5Ub3kJUhLQ0myBIh5o/7R
	Y9yqWs9MAEAueby6giQ1Ly+uHm8sQpOpjf16suGdZnVdTh9jbV0jedTH5QXW4Trie/xDOnStKEk
	Zzxu1Af+5g1XmuDRZv7eFedCsTchCYnal6pBi2/s1Li1x0mPB5b1y1vSiY76PnCo0aQiCkTUDd5
	oaTiwKBXY0cXiok7agjXmUNJJWgWg/W3UTWKL+Xdy+4dIoV2zVYTosTLa84FuCs/00eAAz5w51z
	3i03qcoMcn+6DnW+uUZwxwKPZtuVvw6ocofAj8MCXDTY9rg4N9zbtv1nDtmm6zJdyUhROToIDZu
	Hyo4LZfSA0gJbNHLZxsvLXLv6UBaQcSHFlBgviSyJ/svKoegTNpUmu8wHQFR2bWmIAzmkEFMDR2
	cDxTMgKDHymEfY8bIqLEkxAt9xyidXyxULHQbV/KWbQjUBgPQIm
X-Received: by 2002:a05:600c:c113:b0:497:fecd:5b00 with SMTP id 5b1f17b1804b1-49cdc435d58mr163998555e9.9.1788276015620;
        Tue, 01 Sep 2026 08:20:15 -0700 (PDT)
Message-ID: <825ea854-5778-4cb6-a9a9-0ff97fa7bee5@suse.com>
Date: Tue, 1 Sep 2026 17:20:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/39] xen/riscv: set the guest's XLEN explicitly in
 hstatus.VSXL
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
 <a3ae79823e24f2e18cef2fac8ffffe7caa608f32.1787838835.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <a3ae79823e24f2e18cef2fac8ffffe7caa608f32.1787838835.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1788276016-34ECEAE4-CF75FF1D/0/0
X-purgate-type: clean
X-purgate-size: 1368

On 27.08.2026 17:20, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/domain.c
> +++ b/xen/arch/riscv/domain.c
> @@ -88,7 +88,13 @@ static void vcpu_csr_init(struct vcpu *v)
>  {
>      v->arch.hedeleg = HEDELEG_DEFAULT & csr_masks.hedeleg;
>  
> -    vcpu_guest_cpu_user_regs(v)->hstatus = HSTATUS_SPV | HSTATUS_SPVP;
> +    /*
> +     * Xen supports 64-bit guests only, so set the guest's XLEN explicitly
> +     * rather than leaving it to the WARL behaviour of hstatus.VSXL, which the
> +     * decoding of a trapped instruction depends on.
> +     */
> +    vcpu_guest_cpu_user_regs(v)->hstatus =
> +        HSTATUS_SPV | HSTATUS_SPVP | MASK_INSR(HSTATUS_VSXL_64, HSTATUS_VSXL);

The comment is correct right now, but the situation better would change
at some point. Can't you arrange for things to be correct here also for
a future where 32- and 128-bit guests would also be supported?

> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
> @@ -68,6 +68,8 @@
>  #if __riscv_xlen == 64
>  #define HSTATUS_VSXL			_UL(0x300000000)
>  #define HSTATUS_VSXL_SHIFT		32
> +#define HSTATUS_VSXL_64			_UL(2)
> +#define HSTATUS_VSXL_32			_UL(1)
>  #endif

While adding the two #define-s, would you mind considering to remove the
unused (and supposed to remain so) HSTATUS_VSXL_SHIFT?

Jan

