Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD5D9C44501
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 13:30:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364043.1615414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkMA3-0004Pw-Fu; Thu, 16 Jul 2026 13:29:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364043.1615414; Thu, 16 Jul 2026 13:29:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkMA3-0004Pp-Cp; Thu, 16 Jul 2026 13:29:59 +0000
Received: by outflank-mailman (input) for mailman id 1364043;
 Thu, 16 Jul 2026 13:29:57 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wkMA1-0004Pj-O1
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 13:29:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkMA0-006RpK-QC
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 15:29:56 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a58dcc9-e002-0a2a0a5209dd-0a2a4507db32-30
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 15:29:56 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a58dcd4-b4ea-0a2a45070019-d155802ad9b0-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 15:29:56 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-493f0ae9572so27436385e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 06:29:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4953c70f99dsm97716655e9.2.2026.07.16.06.29.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jul 2026 06:29:55 -0700 (PDT)
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
        d=suse.com; s=google; t=1784208596; x=1784813396; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DyxvjAL/zArsqc3TUV5N43d16kVk+2Z1kZSLtgy9iF0=;
        b=Y/BZ6EN3xmSk3MazOAKXWlW30h3iVibEwntk5TZW8EeM5gBHTEhOqt4gZqMrN8pINc
         S+nmAcQmf3qEWq52oVCqBznfGoT5SyX4dY3siO1QRstwwOjyg3EOyXxx4DO2t8URljvs
         E4ETIGAEL43yxwU2XCrlt9/JcgZPc1ZQK3hjfu9Zwvp4ODCoSlDPkVAlk2qr5iAhcXBW
         c77rM+p2iuCoZJsI7cvncYl/M9zWNcNGRSEEFBY0wXoVpemDKt8/xnUMJUmZuGMuJG3V
         ANig0xOwXoWxavtvvNzRdc65PYDjf3l7KTWOvh6Yb8el/t/Nuxgr8zXYXJ8vYWrn0Ciy
         uYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784208596; x=1784813396;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DyxvjAL/zArsqc3TUV5N43d16kVk+2Z1kZSLtgy9iF0=;
        b=AKT8cCd1WFD/2Gm/MJUYzGHJDUARs/2zIor+4e4/XUe8pCdN28YEQrUJazcstpL7Va
         f2AiKrLudfF7PDNTd5TEvOpWJSmrr+hgWzUMx66arREsecm5aUvYbcJvgryBzgyOQ/xD
         Iufh0ihYoWStFmfjOyOg6E/IOZgj93kV8kjQpAoU9KheQhh2tTTyxsK3f8K3vxOBxnz1
         g9jy3cdiwltoxrqnTDaNaJ28mGP28FrJNzY5cmX7aYvzsF65KWVO1zLnDE/zEp9F38xH
         33RAt6ytlOpab0tqlAXtviQULcbzOMCBsvnuItWNdKrPoXLANOF5mjcqhPUXfD0Vpvdq
         q8nQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro/IKhdCOmdhPLCbOLnxgSI9NqzghrFZO9YLdjv5YK4UE4Tbieo24aQpxB/UxOzCwYyI7XI/Hl8t/w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxvKB1CvqUpYD5Bk5UHmjzIYvg1tvxDKR/9IOItqYIamHYbF0ku
	2c0dm4cF+Hjq+Y9u5Sxt+8i+sEUea02yVsYiZNipqAJQbH1lTn+nj5h5LVou+9gj0g==
X-Gm-Gg: AfdE7cmWdl1Tbq+kxsQ6NnefghS08tKL0i1aAWZUh2gf/bXusvBRta+Y0LK0yrIItgr
	Xij/g/ViaJ/OgbhBSEJTotCsPax1NWhjjDTsQw0PczYwcNcz6nBysry3Wk+r2NmX8ysD1a6JJoL
	vB+WG7b0oHlSWgV3gKYJMh6Ysjiue998RCtaGLeyUK3sgVPVgXSP96/mKJCOZsQQU8zJsh0j7ia
	YBehYDKXULTO2LIL1b7IgsiJ5Y3lcgYAG2tAjUFTiObiLPzWhL83/JfI7N76jEO9B2oNfz+F5W6
	loPi/x9A9PX348LsI+/7jJzFb5VE0V309X99CHrgXuQxDekEGHW1zOsYOmv8izJThBrE84gYrv6
	SAaLliEGr9kCNgACYvAVG6DHlJP1wE0IqdBZ7sFbC520mU65NoGiI/0FcKnON5LtnyxOe9OnD0A
	jyCbFDiKoI/Cy0+Lyy7LjzP4y1aLhsD3BFKqkY+C16bFLaEbX29C71sdWlFkpyKjEdeg==
X-Received: by 2002:a05:600c:3487:b0:493:bacb:1341 with SMTP id 5b1f17b1804b1-4953c144adamr78575885e9.4.1784208596097;
        Thu, 16 Jul 2026 06:29:56 -0700 (PDT)
Message-ID: <f2f3572c-6a77-4f65-bf8e-82298d145a6e@suse.com>
Date: Thu, 16 Jul 2026 15:29:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: Mykyta_Poturai@epam.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20260714104445.919830-1-taka@valinux.co.jp>
 <20260714104445.919830-2-taka@valinux.co.jp>
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
In-Reply-To: <20260714104445.919830-2-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1784208596-A52CCAE4-B2EEDA8C/0/0
X-purgate-type: clean
X-purgate-size: 784

On 14.07.2026 12:44, Hirokazu Takahashi wrote:
> --- /dev/null
> +++ b/xen/include/xen/cpu-topology.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef XEN_CPU_TOPOLOGY_H
> +#define XEN_CPU_TOPOLOGY_H
> +
> +#include <xen/cpumask.h>
> +
> +#ifdef CONFIG_GENERIC_CPU_TOPOLOGY
> +
> +struct cpu_topology {
> +    cpumask_var_t thread_sibling;

Btw, as this aspect becomes more apparent when looking at patch 2: What is the
relationship of this (i.e. cpu_topology[cpu].thread_sibling) to
per_cpu(cpu_sibling_mask, cpu)? The two ought to be identical, but I can't see
this being guaranteed. And if they were identical, why would both be needed?

> +    cpumask_var_t core_sibling;

Same for this vs the per-CPU cpu_core_mask.

Jan

