Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7907EC88E4C
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 07:50:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1415901.1645103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4w24-0005kR-Kk; Fri, 11 Sep 2026 07:50:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415901.1645103; Fri, 11 Sep 2026 07:50:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4w24-0005kK-Hb; Fri, 11 Sep 2026 07:50:48 +0000
Received: by outflank-mailman (input) for mailman id 1415901;
 Fri, 11 Sep 2026 07:50:47 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4w22-0005kD-VW
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 07:50:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4w22-004snG-8K
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 09:50:46 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa3b2cf-e002-0a2a0a5209dd-0a2a4507c8f2-18
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 09:50:46 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa3b2d6-b4ea-0a2a45070019-d155dd35cd74-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 09:50:46 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-486e835acacso499148f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 00:50:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486f0403125sm1955286f8f.8.2026.09.11.00.50.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2026 00:50:45 -0700 (PDT)
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
        d=suse.com; s=google; t=1789113045; x=1789717845; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c2vLgPFKXyyrMXYsnigpCGdDaKtmRW6w5A9CKZTiR9M=;
        b=D2p5m08GojCCUlIqZgInRzXqlliVXWk/Sp7MCIjxZzYqNdcipGqbrcZcUlm0Ar9hYS
         iNRiITdAQwHFOpkhbfmjVWqTqef6JDVdEivzKIf5G3MXEuMOKVtv3tC9T6odieJtZWse
         Qi4pQA5/+DZEtBZejx5uVo+i7RGBl3evxAXgN8FlaP3xq2PTe4SheFAOwHkzDJ29I2r6
         6SzcDtretKkkq9AZV1MgWrLv4dbZUZ9ENTfClqsYZyaaqeBrZoc4+2W0dxjjvKmv59Ms
         +4SMokJ9sia7/RUIYkRJAVajAAaWzukIcQh+VY63ASNqsIbfmQ72muCEwlRXdfEguPvs
         Y0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789113045; x=1789717845;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c2vLgPFKXyyrMXYsnigpCGdDaKtmRW6w5A9CKZTiR9M=;
        b=pWqj03UWdiMTPO8y1mdBmW0p1HnWxzotcmaLrPOFp+i+hsNOXp1LQFZx/VLcnvi4kS
         C2DwCZmyYqN1CfApBaOzI7wT5slcVnMEL6mnY5Mkww1Qw1n97PUt2FofniruUycAeDgn
         jmDIUJi8jV0LuTz3ZJds4vSaUoxQQu88foxAuqlmq37akDvoxTLy2HfgPAE3XNErpf8O
         XbQ5brPeDu8QYXkD+7epFj6rOhN8t8QvKD4PLF4xniGzWkNxVYTo8TdsZL02FXuJ4tGe
         oWfcxtWKeapwSLHZHj3d7lvT6r5cVLZ2zYDxEtXlUu51LtQ0XxqI1Kmp6KVUlRYKeGzW
         YrFA==
X-Forwarded-Encrypted: i=1; AKwUvByyZuhDNdcO9KiJE2rT32/hOIP9y1GJLS+2iydJBQz21BS7dX4zMvpYKi73+icRbPi2vS4WnF6bOZc=@lists.xenproject.org
X-Gm-Message-State: AFuF++lP8iCe+3zKg6ZoLhuW8WTwTlCmCH0WB6HBDpbYaXBxyDKMsizU
	x6K2kCMMZiU5pxmZf9YDm3TuQET48c+pDIRo/az62SJ2yfY8apJcoBIGLPKGa4FtkA==
X-Gm-Gg: AYBFou1sJgErcBDD4nopoQ2eEPCtfw1d3sMGwe0Firz5fNhbdaGWkNNl1N+ZzZ5AA0H
	7hrVjAmN+OCV2cWcoiB4WT/JgwM4sq6WyoE+g5YlxPxQn36ej0aJczol3RTPTj2NUr3UpnLCsvj
	waGF219HyEwUKNh6hoYYO7+jrJV2vkLBZ6q3NUlVXq6WEvCQtMqMEqmj8NQChvzUMl/pUJrMhTL
	8uls6kMu9Calr1CaW4ZpN7v527lk9qzfAQswUTc58XnjCYfBMMfMjtiSax/aLG8ZqOJ+Qm+dRSu
	hgU9gHDLFGZ7jjnsnSB5ZoE2lRrfVVg6npWIQ2iEI1+ive2/eJ5SMtG1UWtgvizjpvlbPxSY8PR
	MNgitwqve+HffDQLykHA2F3lJBXogd8NWK6q1/wjP/fNMPYwOKdF6dNFucTx2HAE2UUhtxWszDT
	bMORm2ohyPiJ/+W7whDjO8ineu6DCme5c/sn8JVf+ivb2LdHd3FKD+QALKqpuBNmO/+F6X9/9wD
	yLjbPk8Ievy3S3QCHHxf84Kif8w9Dq7bOpnAmfX0M8YQWld0JVSKcixpOZdBIsY
X-Received: by 2002:a05:6000:2005:b0:486:e8ff:90f4 with SMTP id ffacd0b85a97d-486eb2e3b62mr3529822f8f.3.1789113045540;
        Fri, 11 Sep 2026 00:50:45 -0700 (PDT)
Message-ID: <1d8be2c2-a56d-4b81-8e36-c4f97099c879@suse.com>
Date: Fri, 11 Sep 2026 09:50:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/6] lib/arm: Add I/O memory copy helpers
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1789055542.git.oleksii_moisieiev@epam.com>
 <6bf8f9dd61da4d0fbea096b863f51db08df46c56.1789055542.git.oleksii_moisieiev@epam.com>
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
In-Reply-To: <6bf8f9dd61da4d0fbea096b863f51db08df46c56.1789055542.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1789113046-374D3AE4-8D3D949B/0/0
X-purgate-type: clean
X-purgate-size: 2965

On 11.09.2026 09:26, Oleksii Moisieiev wrote:
> Introduce memcpy_fromio() and memcpy_toio() helpers to copy between
> regular memory and MMIO space on Arm. The generic prototypes live in
> io.h so other architectures can provide their own implementations.
> 
> These helpers handle alignment safely by using ordered byte accesses for
> any leading/trailing unaligned bytes and ordered 32-bit accesses for the
> aligned bulk transfer.

That's over-simplifying things (just like code comments do). If source
and destination are equally misaligned modulo 4, what is said is true. If
they are differently misaligned, the entire copy will be done byte-wise.
Which can easily be a problem when 4-byte accesses are required for
particular MMIO locations (which may e.g. actually represent device
registers).

As said on earlier versions: I think you either want to get misalignment
handling right for all possible cases, or you want to demand aligned
incoming pointers.

(Ftaod, using byte accesses for two or three leading / trailing misaligned
bytes can be equally wrong, when the MMIO location accessed wants to be
accessed with a 16-bit load/store, for being e.g. a 16-bit device register.
Similarly using 32-bit loads/stores can be wrong in the general case. IOW
while some of that is said to a certain degree, I think there are
unmentioned further constraints on when these functions may safely be
used. For example "devices that tolerate 8-bit and 32-bit accesses" is
still ambiguous as to what exactly it means. Not the least because
"tolerate" doesn't mean "work correctly with".)

> Using the ordered `readb/readl` and
> `writeb/writel` accessors avoids unintended endianness conversion while
> respecting device ordering requirements on ARM32/ARM64 hardware that may
> not support 64-bit MMIO atomically.

I'm having trouble making sense of this part. Why's endianness of concern
here? The accessors used don't care about endianness at all, and what may
have (wrongly) been used in earlier versions shouldn't matter here (or it
would need calling out which other accessors would be wrong to use).

> --- a/xen/include/xen/io.h
> +++ b/xen/include/xen/io.h
> @@ -67,4 +67,14 @@ static inline bool write_mmio(volatile void __iomem *mem, unsigned long data,
>      return true;
>  }
>  
> +/*
> + * Copy between regular memory and MMIO space.  Implementations are
> + * architecture-specific and must use appropriate MMIO accessors for
> + * their memory and I/O models.
> + */
> +void memcpy_fromio(void *to, const volatile void __iomem *from,
> +                   size_t count);
> +void memcpy_toio(volatile void __iomem *to, const void *from,
> +                 size_t count);

For somebody wanting to use these functions and merely looking here, how
would they know of all the constraints? That is implementations are not
merely arch-specific, they may also impose arch-specific constraints.

Jan

