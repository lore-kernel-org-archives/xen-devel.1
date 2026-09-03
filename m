Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B61C61DD3
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 15:58:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407502.1640561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x29pU-0008JG-NA; Thu, 03 Sep 2026 15:58:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407502.1640561; Thu, 03 Sep 2026 15:58:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x29pU-0008J9-KO; Thu, 03 Sep 2026 15:58:20 +0000
Received: by outflank-mailman (input) for mailman id 1407502;
 Thu, 03 Sep 2026 15:58:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x29pT-0008Im-FI
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 15:58:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x29pS-00FLIa-S3
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 17:58:18 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a999918-e002-0a2a0a5209dd-0a2a4506db6e-2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 17:58:18 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a99991a-195a-0a2a45060019-d155dd31a55f-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 17:58:18 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-4843e397f74so1751720f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 08:58:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e13db0sm14850892f8f.0.2026.09.03.08.58.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 08:58:17 -0700 (PDT)
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
        d=suse.com; s=google; t=1788451098; x=1789055898; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zT+lnRImIClZY0CrauXo1P1azhwsOPz9dB84sG3Ivg4=;
        b=DF/9RMM9G7+JfOd/DOJMztRY5htQ+h0598d4kqzhXg7dpBNMP5J2OPk8oDRMvgHW6p
         lfo/uz14lNd5D/DRQzA3u1u8Ypm82YvZZwbYYejErBlO1ycjFQWeVWdeTZYNxHIQIdIu
         KQg0Sr88OmhFE+r71Gxpy3oWkkAQEAOd/KkM589yKmxzaqO9kc+dTzuA0F0jkD6FwrpB
         bex9rX9ftXgY+eoifdlmJteOVrj0+z9/0PcQSpu+T/F0sXWggzFmXjuBWZD1qQLoKHb+
         mJ5KJgjKBguwdm72C3m1Z3enYo8FrwZpRK7pjNIB+p22ShXsknvdo7nfcZytw8QLZImG
         r8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788451098; x=1789055898;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zT+lnRImIClZY0CrauXo1P1azhwsOPz9dB84sG3Ivg4=;
        b=dCjHGiiWX48Bg8ndv5MeV2aadkCnXRknC6yFOZFge5VkBQ7ScXu5ci+5XZQRwM6wKe
         tO72SzzLSvNGueJaWf1NHu9gAnXc+87CWCsufoXmB0YATNiDQ54W+MquWC7LyvpsWLvj
         bldhnOIg+PqHRmkgEJmx3iOR+xzSlfFEz2zUwtGQrSzqtq/CXL8ho3E9xdWIRtxG7Uvh
         5LC08nbRLlYnzCO4AyhWGauKHWb8joLxsvQupC3Va1jnD0sn/XwYVZ0XDkQa+yMfQAn9
         EVFOKsXsgUXnb5KVI5SHCULn2qkYrBzD8SDmOYwPaz/ia0hY3NW0MrpF1fhe993OiazW
         krag==
X-Forwarded-Encrypted: i=1; AKwUvBzfcFwd2/vdcMIjB6/vtyfMQrWfcwM3LgQkvgLT0D0k96HS0FDkArGkU+udfe2D+MDsVs1gn9Z4Dmw=@lists.xenproject.org
X-Gm-Message-State: AFuF++mgotRaOo9hrjiKBdIUOel/olozbhIRxd6l03PfzUsr3hzNEFRM
	E2Ys4RMVE77zrc7L2dkUdwlNgTrzhDTCbnhiD5jV8bScqaK40ggWnXHJt6YMGgxzIQ==
X-Gm-Gg: AYBFou18PJ6v5MpGdsvP3WguUCWBDI+EArKoRWRWy1wTrDKdEqKT2PXFF6GXGaYvjo1
	qoDS+F8PTN4Gq/EuXc77/VMX6QGl5ngPyVcv6OlH4Z1i2pGf5GjbXxdpnIn6+/cKe8zZ9y4iK1b
	zjE1XieR3wEz5hJw8tz+StSbXSLw4X1QCLVF/RfuNnL10EbMlfn8/5Xw9oqdbWdFKY/LiA+MZU1
	GLC8hTwHYwO8aIxVksDOGenP39c6yyPw4hmLVuhmK0nwnETkYNYYPl2ALqj80KxnrD6RlD0oSit
	ZZ32Og1Uw8MBJQENjgnKKb35YJQ5BTabuPGNN3L3dZz4JZ+XCPo3yen7NIDwrgzrWHCp5ExtFNH
	KyOZbj24EFbjH/LdUJdE/n1rKdVffCFok79dVyB4oYJclAKX8AuLvgAeYyRgN9f0+H4clxX81Nb
	53Gc6Wm2lm4BnGRFqCQFgAlMX+g1J2z+vr3njy7sHnKYQtytyH6JJV5lCBmouMk5yABLCFMYwlQ
	c+4TIvem0Ar+De8Yz85pUJ9tfjO12hZwaTz0cIRTChs5BsQMft3
X-Received: by 2002:a05:6000:64e:b0:485:8226:c69c with SMTP id ffacd0b85a97d-4858226cab5mr6427693f8f.27.1788451098172;
        Thu, 03 Sep 2026 08:58:18 -0700 (PDT)
Message-ID: <bf585fd5-018f-4829-a2ac-742915a7e41b@suse.com>
Date: Thu, 3 Sep 2026 17:58:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/riscv: fix out-of-range indexing of the IMSIC
 per-CPU MSI array
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
References: <20260903150521.29804-1-oleksii.kurochko@gmail.com>
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
In-Reply-To: <20260903150521.29804-1-oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1788451098-F540B77B-3F457781/10/73395122804
X-purgate-type: spam
X-purgate-size: 1007

On 03.09.2026 17:05, Oleksii Kurochko wrote:
> imsic_init() indexes msi[] by the Xen CPU id hartid_to_cpuid() returns,
> but that array is allocated with one entry per parent IRQ of the IMSIC
> node, and the only range check compares the index against
> num_possible_cpus(). Neither matches the array, and the check comes
> after the first access:
> 
> - hartid_to_cpuid() returns NR_CPUS when the hart isn't one Xen brought
>   up, and msi[NR_CPUS].base_addr is read before that is noticed;
> - an IMSIC node listing fewer parents than Xen has CPUs makes every
>   index past nr_parent_irqs go past the end of the allocation, which the
>   num_possible_cpus() check lets through.
> 
> Size the array by nr_cpu_ids, which is what it is indexed by,
> and move the range check ahead of the first msi[] access.
> 
> Fixes: c9bd8b322ecb ("xen/riscv: imsic_init() implementation")
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


