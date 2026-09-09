Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68636C79FB7
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 14:53:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413222.1643446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4JfQ-00060j-Pb; Wed, 09 Sep 2026 14:52:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413222.1643446; Wed, 09 Sep 2026 14:52:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4JfQ-00060c-Mw; Wed, 09 Sep 2026 14:52:52 +0000
Received: by outflank-mailman (input) for mailman id 1413222;
 Wed, 09 Sep 2026 14:52:51 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4JfP-00060W-7B
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 14:52:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4JfO-00DlEY-5L
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 16:52:50 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa172b9-8faa-0a2a0a5109dd-0a2a4507ca6a-14
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 16:52:50 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa172c1-b4ea-0a2a45070019-4a7de14cb9bb-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 16:52:50 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-4834977ae75so695894f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 07:52:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883c074asm43508683f8f.23.2026.09.09.07.52.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 07:52:49 -0700 (PDT)
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
        d=suse.com; s=google; t=1788965569; x=1789570369; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7MTDuaKiColxHVcHeUOieknlvsgeaH6ki8cCSq2F2+I=;
        b=c1BTG2g44ZzihEAAX561N4XqmrNrIAdYYFuYJlUBMj6xTSmyJm0x+H6xJq3gBkBdFT
         UI2eBIdCE9f5AM91I1st1/YjY8UTTan99sEht0qloO3w92tbdOVl0cZRr74oGdaaUhzA
         AeKLXBAnXXAcYGF5nksSnltDQ0if6/gIF8opQckUXzsg6NKuMz0fSghfR52arMYDbla9
         2eDjw6h30AwhTEdFf25DkO9bvKngMOstDytEfbAo+s0AD/uXGF9mxYnUGd5EkcXHLLT0
         WcRevn+DkeBy7lCpGyfapWVhxLLKPKo8XHSx93cZ3S0BUcjKZTRS9xgWGu7M/iWFNosr
         1Pmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965569; x=1789570369;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7MTDuaKiColxHVcHeUOieknlvsgeaH6ki8cCSq2F2+I=;
        b=UTT5NYYkerHA526zlK8R4G08dv7nAM8OfQJBzKm4bDsXDLAwK0QR8s1YiDzOeA+chZ
         Ar8awB8HcsaExqFGBGrDKH/epMlfxL0N4jssnhoCClO2gGeUKnLLhg9DpJSwRTv3uecB
         WOSFxLrQfMqsf5ZTIYKsAj3kmAmpa0wEmgqe5IQJLhDtu+3EYHNWpP+pwPaW1PKGuIrq
         efRBIY0jQrtMMZnll25/xIG2dS4vvIQ/+JnyVXFiyKq+XnI7UdGw/gxzEHDk/vFIPgYH
         pSXbY0l3NbPQgV1e4MUxhP8ew5OuImJbHPMohHrruQQAgBLJqY9RTQGOLTnGsT5z/ACU
         jAXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhtXVgJ3fkd73vduQO9V5X8gTyy/uoRPkUtHaGZusmTRIUwLLBV2qx3tB/FcsQ76XeerugO9yq4Yo=@lists.xenproject.org
X-Gm-Message-State: AFuF++k2QCYtBGJXSJBpgthTgj6dErJ9m1XhIZ5RFGj6m8DAVvR62zxa
	hf66oq21zu9qU5ARRyWI8WMb2wPN4ZFnfspsTeiCBRWJO0FNwnnCCxUWsm6qFf5k0A==
X-Gm-Gg: AYBFou0n4yGcrtu2ttbrFL2Fib/0WLGbJgA4di9K+/mJ8o4JOo0/+dLB1z11xWyNxWF
	j0ayR77J36uFanQGrQPxSaxVN8M2wHXMDDsdiNLG50W7zhSum7CN9Jp/jbRFAxfgUofKcdeQMpZ
	gya+hUE+loMV25vLybJ91m2yb7LhMdGSb1gRP/7kk46AkuQOOabz4idq6I/Ovga1oqAA9he6Cy1
	F5plvZtoIezjo5WiXoYyP1L7VuqYymTV9DmU1TzuDUu/Zsih4/q2sGkIm7ByrqH3Gjs9HOTe91D
	JwcONhOtd/NhUGrfGfCUP7bs2e19EHYlP7zw5u3K9XoZ38IEKI34+c1ahvE9LG1ZcQ8wlYb7gex
	IHEZJvryLGV5xwbMhd+Hm1/fHL0OOkkuLA6+QfJiFwjUcqzP2uocNdT0zwzOB2pnwhHAiF6eLM4
	NNjFSDrWJ5IEiLq/I70tHsf7GQB62xggvQoletyWrhpkkuAEmbQn3+fKLmP5lbKcFMshJRm7GAr
	bIVmAacvFhnUL0X8e6hmuNWaqbRHKNWdqZhMvirauODKxZcZkQWAmdhRsoLKH4=
X-Received: by 2002:a05:6000:402c:b0:485:acfd:4fa2 with SMTP id ffacd0b85a97d-485acfd572dmr9381409f8f.28.1788965569410;
        Wed, 09 Sep 2026 07:52:49 -0700 (PDT)
Message-ID: <a7935767-97f3-46b6-a737-b11fa6dcfd33@suse.com>
Date: Wed, 9 Sep 2026 16:52:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/39] xen/riscv: build the target hart index via
 aplic_hart_field()
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
 <3c7418d64a730ec5e4b2cfd0ecfbbbc6fe0bf7d8.1787838835.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <3c7418d64a730ec5e4b2cfd0ecfbbbc6fe0bf7d8.1787838835.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1788965570-A4AC8AE4-E96C8034/0/0
X-purgate-type: clean
X-purgate-size: 1761

On 27.08.2026 17:20, Oleksii Kurochko wrote:
> @@ -340,27 +338,11 @@ static void cf_check aplic_set_irq_affinity(struct irq_desc *desc, const cpumask
>  
>      ASSERT(spin_is_locked(&desc->lock));
>  
> -    cpu = cpuid_to_hartid(aplic_get_cpu_from_mask(mask));
> -    hhxw = imsic->group_index_bits;
> -    lhxw = imsic->hart_index_bits;
> -    /*
> -     * Although this variable is used only once in the calculation of
> -     * group_index, and it might seem that hhxs could be defined as:
> -     *   hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT;
> -     * and then the addition of IMSIC_MMIO_PAGE_SHIFT could be omitted
> -     * when calculating the group index.
> -     * It was done intentionally this way to follow the formula from
> -     * the AIA specification for calculating the MSI address.
> -     */
> -    hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT * 2;
> -    base_ppn = imsic->msi[cpu].base_addr >> IMSIC_MMIO_PAGE_SHIFT;
> -
> -    /* Update hart and EEID in the target register */
> -    group_index = (base_ppn >> (hhxs + IMSIC_MMIO_PAGE_SHIFT)) &
> -                  (BIT(hhxw, UL) - 1);
> -    value = desc->irq;

Hmm, only after sending the ack I noticed that there's no masking here, ...

> -    value |= cpu << APLIC_TARGET_HART_IDX_SHIFT;
> -    value |= group_index << (lhxw + APLIC_TARGET_HART_IDX_SHIFT);
> +    cpu = aplic_get_cpu_from_mask(mask);
> +
> +    /* Update hart index and EIID in the target register */
> +    value = MASK_INSR(aplic_hart_field(cpu), APLIC_TARGET_HART_IDX) |
> +            (desc->irq & APLIC_TARGET_EIID);

... but there is masking here. Chopping off bits doesn't look as if it can
lead to anything good. What's the deal here?

Jan

