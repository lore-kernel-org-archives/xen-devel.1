Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B159DCC6B1A
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 14:03:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449112.1665048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGzZZ-0006Hv-7O; Wed, 14 Oct 2026 14:03:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449112.1665048; Wed, 14 Oct 2026 14:03:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGzZZ-0006Ho-4H; Wed, 14 Oct 2026 14:03:13 +0000
Received: by outflank-mailman (input) for mailman id 1449112;
 Wed, 14 Oct 2026 14:03:11 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGzZX-0006Hi-MU
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 14:03:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGzZW-004p7n-Sb
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 16:03:10 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acf8b9c-e002-0a2a0a5209dd-0a2a45068362-10
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 16:03:10 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acf8b9c-195a-0a2a45060019-d155dd36cc3d-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 16:03:09 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-48c4207ac26so3920471f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 07:03:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0aaaa3fsm12387294f8f.10.2026.10.14.07.03.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2026 07:03:07 -0700 (PDT)
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
        d=suse.com; s=google; t=1791986588; x=1792591388; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MzesA1TjVBQoe30CWqEdg0oqAxt64RgmXVRAhfJfcw0=;
        b=YR/ktzN81uOuTYJCj3i4Fuws/oXfNtwazAF0A3QypaAcMnQQixf74VnLfGdERmPcEl
         W4zezshKenfc6f6JKcWenV71BeKNYJEyrspIpF6KqqC2+lrStjaDSiJ83BBXnR311PVh
         zFZx/knJoGp9GpiCTNGbYRSKoIulhbDeFrFkI3l0qwLSVVs5h5CgqOMtjyNSWYoV06PR
         v/9TnIQDhXiRGNMtnCmBESJ5TqK6VcuJyXveILIXYpJUTaeFeybhawx1Mm7033Sag1gt
         ael5/5ITEubGpNgSQgIlkrgRKHsXSOV5OrhJ5VmP2+Z7YY8MWQ5mGj3Mq/LCmVVVu3Jj
         7v4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791986588; x=1792591388;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MzesA1TjVBQoe30CWqEdg0oqAxt64RgmXVRAhfJfcw0=;
        b=u/gaD3q4kxotJO0e+6oRtyWQAKLl8rSSjY/YX1q16F3MxIqddDIumTmYYCwyOAu14O
         dkH7Bz4e/MzaT7pCey+TpmqEL4Id5UsCpzYAEXG2fVudbPhdzBx8QsmwQIee0SJfWROZ
         vIGpc9uSi0zUvzenAuz5A0UD+AWpzCbJ/P/LCKzms28IIJ4yMlr/m0hNpCXki29cveUW
         fRAtJDtbA4+tFr8evlE4eFvhD/Aa7YCyOJyMIsB+im2hs8UqkOSU1Lf9M0hazfhXPMAi
         zmsUksLqmUGz1TF4Kt1EJjfHG27jIAtEgVGp+ncKg/8/4wWl5rwdBYFVBrftrYBc8h5f
         AiHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjIeYcgLk1xj9bBkdTARssrkXS3ZklJZIj6NI3Fh98bufjZNcGOoekQLCh6NhgAmQPg4P7XOtddO8=@lists.xenproject.org
X-Gm-Message-State: AFq9FYL8ylovMPMaR03lo0nHp7dVZgxr2e+W5eD2hZUCfAyj8YFxn+X/
	oE6xHYAMtwGDPX28FrB1E475zAZkBku8FeXQEayoyDyp9FJ7rT3ixLaJ/Mi/lTobAw==
X-Gm-Gg: AYBFou3yh0aFFjzxxrWrE4ab5gSkt+v4/ucRVbUrEaJBAgxL/DJv+JsTFa849Io2unz
	s76M5wsoyTrh6ryLsMX64OR3LXxeGRxNzAuJZsKlOdLvvN6zDZUaAxEW5Nw8TMWpTzEa7goUYXb
	VVuzy1fLf0FBlZ8PsAcOVM9feGBNKtCFiB5hXFmqMTkH9JzSz8sLRcJE+qVQ/I8EbucXJg9OQUJ
	OruTHPwkLtbCWnu8XbqUdCEDbP3zg6WyywTaiTka4WDnnlegagCGad+W9MfPOgydEf+JoZU3eDl
	zY6W8rgNlC5fkSny+WbE2POHOgi0Ss+zvJ4S3DiNW9ZbaNlIwWHz55WJ6bi+qCQKvWNVo9z00Yc
	4TYAbWRlgBoecgKXEXkb6onYLQfE9htyTt+12ERYsjnZN729FYXX9vSJGKnutUniVo3WwkF+lkY
	prQ6BkF/wFprv6SHkXb5pgxQuVi1xrGcbDez2WGA4La8qwGw2z0GEe0Bc+pOsWLjH5PXzsvQX+g
	MwApR1ur+dUCpuuTBcqSBy1x+sua38F1w2SlN/KLJMuG2engDJpOLcaq5otEk1yTAv6LPmr
X-Received: by 2002:adf:f307:0:b0:48c:54c0:4cf1 with SMTP id ffacd0b85a97d-48dbaadd3e5mr23647661f8f.9.1791986588535;
        Wed, 14 Oct 2026 07:03:08 -0700 (PDT)
Message-ID: <27c8f0bb-4c59-4605-ac61-9a3e5434fc64@suse.com>
Date: Wed, 14 Oct 2026 16:03:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/39] xen/riscv: build the target hart index via
 aplic_hart_index()
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
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <ba71bd0de931eab1205a1139e160f40b72bda421.1790779209.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <ba71bd0de931eab1205a1139e160f40b72bda421.1790779209.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1791986589-FDA0C77B-91848352/10/78276251493
X-purgate-type: spam
X-purgate-size: 1136

On 30.09.2026 18:18, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/aplic.c
> +++ b/xen/arch/riscv/aplic.c
> @@ -335,9 +335,7 @@ static unsigned int aplic_get_cpu_from_mask(const cpumask_t *cpumask)
>  static void cf_check aplic_set_irq_affinity(struct irq_desc *desc, const cpumask_t *mask)
>  {
>      unsigned int cpu;
> -    uint64_t group_index, base_ppn;
> -    uint32_t hhxw, lhxw, hhxs, value;
> -    const struct imsic_config *imsic = aplic.imsic_cfg;
> +    uint32_t value;
>  
>      /*
>       * TODO: Currently, APLIC is supported only with MSI interrupts.
> @@ -350,27 +348,18 @@ static void cf_check aplic_set_irq_affinity(struct irq_desc *desc, const cpumask
>  
>      ASSERT(spin_is_locked(&desc->lock));
>  
> -    cpu = cpuid_to_hartid(aplic_get_cpu_from_mask(mask));
> -    hhxw = imsic->group_index_bits;
> -    lhxw = imsic->hart_index_bits;
> +    cpu = aplic_get_cpu_from_mask(mask);

Any reason this can't be the initializer of the variable? There is a
related assertion in between, but as long as the variable isn't otherwise
used ahead of that, such ordering if fine afaict.

Jan

