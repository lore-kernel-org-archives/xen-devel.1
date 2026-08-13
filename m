Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57563C5CFEB
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 07:19:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389477.1630184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuPig-0006h0-LV; Thu, 13 Aug 2026 07:19:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389477.1630184; Thu, 13 Aug 2026 07:19:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuPig-0006gt-IP; Thu, 13 Aug 2026 07:19:18 +0000
Received: by outflank-mailman (input) for mailman id 1389477;
 Thu, 13 Aug 2026 07:19:16 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wuPie-0006gn-NI
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 07:19:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuPid-00C8e1-WE
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 09:19:16 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7d6fed-bab6-0a2a0a5309dd-0a2a4504d4c8-24
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 09:19:15 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7d6ff2-b57f-0a2a45040019-d155dd2ba916-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 09:19:14 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-4813ea321cdso379999f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 00:19:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49981e37525sm39494875e9.3.2026.08.13.00.19.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 00:19:13 -0700 (PDT)
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
        d=suse.com; s=google; t=1786605554; x=1787210354; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tg1x7LxiP1yJoKuSPAYkuKrDaCunc0z5kTYlqCAXgVA=;
        b=AaYMH7R1ZctJaa6/XjBMKijtUEFKZXinYTO5GbHuJ75yO+Hzn3Xb8ozU8ZkwV+FzgY
         tY53bqRu3JIgbfAP6JDuv4oIGPURVIiGQkplm89RRMJSinYtGNmLKPdxyv8lsQLNkuMO
         AdXcxNVTLqmSLczzPaGVIvfVViw0I5ZLqV5fc5PULIgwerzcltr5cj5e0LlfH/rhiik4
         e0rzBGyYv1aetUFzh3N/Xo+xujaYDb3JgcEBb6JlZkPIpl/XrQEJkwZW4g9J3dmln+y4
         rImAQKaTeQ74cQdPiMV9q84PdfRHcSzQ55c4O79Lsb63F9aA3b4ygWr804RRoME1/7po
         NhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786605554; x=1787210354;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tg1x7LxiP1yJoKuSPAYkuKrDaCunc0z5kTYlqCAXgVA=;
        b=H+jxs0teEpEQFfYiHIecM7hWV43DlyZcxwF5cTkgWDr4CeanqX+YlEdTVARVE7aphv
         6CvdIO4GoET6trPxmnnAuWQHMwtlIfTbQhqzEq0k8fn6g5K8Dj+xHsQR0KTsjfj7aMW/
         vyESkIgnwvNOvIE6jtWnZ+c0BLWfWulkWl6OspAsY+DRpNQh8T0WVkOBSfNyeW2gHNeu
         xbJRFSAaAhPo4Uwe7FT1Ij0HfzsvCu6Vo36iy74AuNnvqN1vrQs/vK+kXatLqRs2bR0I
         5GesAAbBm9isEf2CO3xtk19PPdToZM2pVglh6ZNGYuA2BtakhaQLJ0s49MbGLk0xR1hw
         XI+Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp40HMMSgSKQjzXq4E6KNEhPu3j5YuY6g3PKLAiCRol/qzuSU30bprKYYSdRSnX7mpI/hyncQ583Dg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxzk/5zGH8a6vkVAU6iSdZ1v5tn4N0A5Ij2qbPXbKCtt6j6hnZU
	U4XR/udPLINCFEiBBY+XTmpHXY+y7MzK2y0MpreZp/guAg26g++LEcX9kaY7zHM5Sw==
X-Gm-Gg: AR+sD12LVECGqbGeD59z8zUh9Ae21ABUTKro+VmVm9Ar7MmDmrgg4AVxl5wjfGSd7Yn
	nWMkv1Agh2jlaB2prLQ7hgPFgcADxuHOu8OuD5oIiOWL9QJUlzcx+nt9p0JQN9d1iWSshJ3YDG+
	aTmFGBztOHyfcKA3RXXeAgiwdjBj0RPu+atMhVQ+VzG6qOFsFu2Y8wQh2aHJVMHdWRWwyplaR1h
	2e2XyvAIb7SDn70klMqH9tlBJOInTMmYb5+pOuu+Oe7/vyyTG8SfHegMazV+GWUnWQCcuH6+hEJ
	yaHlfnhrTOyiQJAJLlTftv07MrvD/SL25IlShVRT0P1dbSZj3UUlgobcw5sc2cCedsWtx3lG+mY
	ITe/BrdElypNWtoYFsqQ7CJh/lL+RzJBUFJQUYyzQ2V6eLOY+sevsl23stQMwDBozFQLPlo4BiP
	GTRJBvNRvpFRCjj33XfYrfhGCZUt7JBWOewlpeUyov7mBNHOUlB9la5LEcG9tA71XtRK90yzB+r
	+PPegNogJc3R12wOfVFRBV5Xd2isLmwONU9+jp2yW2aLmyzCi7k
X-Received: by 2002:a05:600c:1546:b0:499:5f80:83ac with SMTP id 5b1f17b1804b1-4998220bc5fmr27088225e9.7.1786605554432;
        Thu, 13 Aug 2026 00:19:14 -0700 (PDT)
Message-ID: <3bb59f64-7ff1-4bdc-b951-cfb78671e8f9@suse.com>
Date: Thu, 13 Aug 2026 09:19:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/20] xen/riscv: introduce guest riscv,isa string
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1785836421.git.oleksii.kurochko@gmail.com>
 <59b5b69f53ef81d68fd279d9ee0c03f5ffbbc2ae.1785836421.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <59b5b69f53ef81d68fd279d9ee0c03f5ffbbc2ae.1785836421.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1786605554-538C1B50-04E74C1E/0/0
X-purgate-type: clean
X-purgate-size: 2621

On 04.08.2026 17:47, Oleksii Kurochko wrote:
> @@ -120,29 +148,30 @@ static int __init dt_get_cpuid_from_node(const struct dt_device_node *cpu,
>   * and strncmp() is used in match_isa_ext() to compare extension names instead
>   * of strncasecmp().
>   */
> -const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
> -    RISCV_ISA_EXT_DATA(i),
> -    RISCV_ISA_EXT_DATA(m),
> -    RISCV_ISA_EXT_DATA(a),
> -    RISCV_ISA_EXT_DATA(f),
> -    RISCV_ISA_EXT_DATA(d),
> -    RISCV_ISA_EXT_DATA(q),
> -    RISCV_ISA_EXT_DATA(c),
> -    RISCV_ISA_EXT_DATA(h),
> -    RISCV_ISA_EXT_DATA(zicntr),
> -    RISCV_ISA_EXT_DATA(zicsr),
> -    RISCV_ISA_EXT_DATA(zifencei),
> -    RISCV_ISA_EXT_DATA(zihintpause),
> -    RISCV_ISA_EXT_DATA(zihpm),
> -    RISCV_ISA_EXT_DATA(zba),
> -    RISCV_ISA_EXT_DATA(zbb),
> -    RISCV_ISA_EXT_DATA(zbs),
> -    RISCV_ISA_EXT_DATA(smaia),
> -    RISCV_ISA_EXT_DATA(smstateen),
> -    RISCV_ISA_EXT_DATA(ssaia),
> -    RISCV_ISA_EXT_DATA(sstc),
> -    RISCV_ISA_EXT_DATA(svade),
> -    RISCV_ISA_EXT_DATA(svpbmt),
> +static const struct riscv_isa_ext_entry __initconstrel riscv_isa_ext[] = {
> +    RISCV_ISA_EXT_ENTRY(i,            true),
> +    RISCV_ISA_EXT_ENTRY(m,            true),
> +    RISCV_ISA_EXT_ENTRY(a,            true),
> +    RISCV_ISA_EXT_ENTRY(f,            false),
> +    RISCV_ISA_EXT_ENTRY(d,            false),
> +    RISCV_ISA_EXT_ENTRY(q,            false),
> +    RISCV_ISA_EXT_ENTRY(c,            true),
> +    RISCV_ISA_EXT_ENTRY(v,            false),
> +    RISCV_ISA_EXT_ENTRY(h,            false),
> +    RISCV_ISA_EXT_ENTRY(zicntr,       true),
> +    RISCV_ISA_EXT_ENTRY(zicsr,        true),
> +    RISCV_ISA_EXT_ENTRY(zifencei,     true),
> +    RISCV_ISA_EXT_ENTRY(zihintpause,  true),
> +    RISCV_ISA_EXT_ENTRY(zihpm,        true),
> +    RISCV_ISA_EXT_ENTRY(zba,          true),
> +    RISCV_ISA_EXT_ENTRY(zbb,          true),
> +    RISCV_ISA_EXT_ENTRY(zbs,          true),
> +    RISCV_ISA_EXT_ENTRY(smaia,        true),
> +    RISCV_ISA_EXT_ENTRY(smstateen,    true),
> +    RISCV_ISA_EXT_ENTRY(ssaia,        true),
> +    RISCV_ISA_EXT_ENTRY(sstc,         false),
> +    RISCV_ISA_EXT_ENTRY(svade,        false),
> +    RISCV_ISA_EXT_ENTRY(svpbmt,       false),
>  };

Just as an independent, up front remark after having looked at patch 16/17 of
the other series: Is a mere boolean going to suffice in the longer run? I could
see some extensions wanting exposing to only RV32 or only RV64 guests. E.g.
Zilsd is RV32-only, while Zqinx quite likely would want restricting to RV64.

Jan

