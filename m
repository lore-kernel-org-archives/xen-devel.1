Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421A0C5B56A
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 13:58:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389094.1630021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu9Sj-0002zV-My; Wed, 12 Aug 2026 13:57:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389094.1630021; Wed, 12 Aug 2026 13:57:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu9Sj-0002zO-K7; Wed, 12 Aug 2026 13:57:45 +0000
Received: by outflank-mailman (input) for mailman id 1389094;
 Wed, 12 Aug 2026 13:57:44 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wu9Si-0002yT-5E
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 13:57:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wu9Sf-00Ciex-Eu
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 15:57:41 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c7bca-bab6-0a2a0a5309dd-0a2a450ad2e4-30
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 15:57:41 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c7bd5-f2d2-0a2a450a0019-d1558032e50c-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 15:57:41 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4957eefd361so7480865e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 06:57:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4997c946ce1sm48434765e9.5.2026.08.12.06.57.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 06:57:40 -0700 (PDT)
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
        d=suse.com; s=google; t=1786543061; x=1787147861; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KLVVAA1PM5afo/V1q2fX765yKgxPYKydsPta32vbjmY=;
        b=Tf1AUQCju5aqFW+8CakslmVhAYQh1K0/l7N1Wb1mgKucXMoslqQ+kq+pw+kB7M7PS/
         veqJNaHzwxIYkJaqi1KA1feHLZ/iNLlUZdOhtcd5OtDiZ4MhDypNSsym7anifLmh8pGx
         z5057rCcWLRjk/xPziR+4o8N/2O9M5qaTr47UmnCYx82clHCapCWrozp5++crNT0vF9Q
         oXpcaldinMURnukB7hpDSCW4unI3sKpl10w0LwV//UPcMSJywNdkHvBGpJKI74cIfXel
         u+Y3Kgl+c8eR0SjVwAD6lxv4YzYcw8+j4dO01QIWCmZbsz892N/Qo/VUH+BrvzSrPcGz
         MHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786543061; x=1787147861;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KLVVAA1PM5afo/V1q2fX765yKgxPYKydsPta32vbjmY=;
        b=c51ukYieTC46INBZmHEIBdmiYar97J7v45ij4KsqPmIVY2h4sjr6j7I1/TlhddvXvf
         u5dvXAO75tbEVMjUjzrb+vmJt1V+6PaOu+Cb7+CreToaHdomNkGwToplkK8buBY5jI9G
         zm5EubevDyNUho0gh9eSoXVE1EQ8+SfDzuqbxbOZx44+egTn4GdXQoXp3NesIuF17/cX
         LaWsGDH21r9mVjSh1nOKUHMdeeLkbm+7zuyCvAIjK+vmyiZjcNqaMrS0ewDZF8JoNgQn
         6PdPzpLLgDZdYx/dhXESIxh5OnRSxNb4c43i/c0mkNhr1LvtzhDF/NnwQ/yd749hlMqs
         eQkw==
X-Forwarded-Encrypted: i=1; AHgh+Rosymsu3t+1f7rVLGohwJmMqTVflJ6vJ0IZos2GlNIDLY5DNH+c7kNQJ7cu7Zb2pTMHKOeP3B0I0lk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1ehxpkaEw3zC4gQEkxKszglJt9XYskK9cTRNOirJRjeq3Lcr3
	G41PK4fB/sAiiIjNDsfWins5rUQxADVS5IGgAY4gvPEtB25m/3RTS2Yee5UI2T74dA==
X-Gm-Gg: AR+sD12RLQVYPP8P36yJuo7Pq4udSR9Nyb0jXIdVKZEhRUOc73PLszzgEMR6sTI7D9Q
	9pBz6Zc9vmhbbldy7UtoStcNRdsM4kshTGsa/VLstgpgb0izl4l9PWQeJe8DVmQjWdGl2zEIsLd
	hEnQZ3y0FpwD9Zv+so0nt2fdGFiYQYeF80eeajm2CGlb/+hsIgPPi/xfgTnee588nyNeUzKSwSv
	0dO+SPHWm5+bHjE0G9P8uza0XDaC69y1ffBdzJO0nSbVtdfTb4yi/36YJfWNxwoICu5DsRbWy/p
	qaAXB3VTGX88Lmm1HGeN6PLdK5ye7GUcvOCzFBsiLRqE/ux1sFRzHA8Ms70vnGo6kGI8gP8zFxd
	UE+kFexRKc1728X/4SgF7/s+w6SD0cnyj95AgBOgWPwpsXzWOfHsyIlFwn4sVGznKvQiQeVS56R
	7+C/tBrHq9tn7L6bdNAe/uKiLFbEm7y+2IBXFzJzRy/WbYma0H/1xN1G+MR1SGKP+ZPM2cnQzyf
	wddQWPIVk66IYTerLUAvAf6VxoELFxRLoB1yr3v2/l2sRHG8Z73
X-Received: by 2002:a05:600c:620b:b0:499:80d0:8b73 with SMTP id 5b1f17b1804b1-49980d08bbdmr19865025e9.4.1786543060836;
        Wed, 12 Aug 2026 06:57:40 -0700 (PDT)
Message-ID: <698b5cf4-b383-452b-b6b8-fd5c09e41f51@suse.com>
Date: Wed, 12 Aug 2026 15:57:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/17] xen/riscv: add IMSIC state save/restore
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
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <5e3df9ea4bafc5666d1885dfd40f534f8349879e.1784560663.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <5e3df9ea4bafc5666d1885dfd40f534f8349879e.1784560663.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1786543061-58FC6CFC-84BF39E3/0/0
X-purgate-type: clean
X-purgate-size: 1358

On 20.07.2026 18:02, Oleksii Kurochko wrote:
> @@ -418,6 +419,28 @@ int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id)
>      return res;
>  }
>  
> +void imsic_state_save(struct vcpu *v)
> +{
> +    struct vimsic_state *imsic_state = v->arch.vimsic_state;
> +    unsigned long flags;
> +
> +    /*
> +     * SW interrupt file always has ->vsfile_pcpu = NR_CPUS so nothing specific
> +     * should be done in this case.
> +     */
> +    if ( !vcpu_guest_file_id(v) )
> +        return;

How does the ->vsfile_pcpu sentinel value matter here, when you're checking
->guest_file_id?

And anyway, there being dependencies like this one on the other big series
makes it rather hard to review things.

> +    write_lock_irqsave(&imsic_state->vsfile_lock, flags);
> +    imsic_state->vsfile_pcpu = cpuid_to_hartid(v->processor);

As discussed for another patch in this series, this will need to change then
as well.

> +    write_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
> +}
> +
> +void imsic_state_restore(struct vcpu *v)
> +{
> +    /* Nothing to do */
> +}

"save" and "restore" have meaning other than what you intend here, aiui. Once
again without call sites it remains unclear when exactly these functions would
be called. Which makes it close to impossible to suggest better names.

Jan

