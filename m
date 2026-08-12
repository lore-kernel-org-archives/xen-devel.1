Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8090C5B56A
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 14:14:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389125.1630050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu9iM-0007OX-Gk; Wed, 12 Aug 2026 14:13:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389125.1630050; Wed, 12 Aug 2026 14:13:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu9iM-0007OQ-Ce; Wed, 12 Aug 2026 14:13:54 +0000
Received: by outflank-mailman (input) for mailman id 1389125;
 Wed, 12 Aug 2026 14:13:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wu9iL-0007OK-KQ
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 14:13:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wu9iK-006QIO-Ol
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 16:13:52 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c7f8b-2eae-0a2a0a5409dd-0a2a450ad2b8-40
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 16:13:52 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c7fa0-f2d2-0a2a450a0019-d1558032b1a4-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 16:13:52 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-49545ba3d4eso4983095e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 07:13:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48150b78648sm8129426f8f.0.2026.08.12.07.13.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 07:13:51 -0700 (PDT)
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
        d=suse.com; s=google; t=1786544032; x=1787148832; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0M5as0ZLYKx2rxQhPfFiOLAGJ/AKNx0o9ufi3U0ONao=;
        b=URTCZbyBvKpo6XLBUXM4PqaGyDMuMN1p3yrVNiWK54K8ut6HROB65Uu2iWbOTnpT1e
         2nS8bRAl9VkyNIi1tN73Xm7J3CEDdhOgzFu8gkINFUBISU6MZ4ykjxCbwZaN3bzLdxy4
         +GcsiDMze0rDkqctXIBiTYfdP8o3s3zCPc/QMO8Kp0gb8NJUCB0z7VQjyg9n52pvwGMT
         /3ILbVmjPK7F1dNZtOrPbvlOAq9uq3CRFzG9FW20XpumxSmUAorERqwCHy4jf1g1KvKB
         l/wP5+mZUDec7B68sVxQUNCFK57919/rUE7xoBw8kyVLsPoviEcntlLkkucHllmklahw
         FHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786544032; x=1787148832;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0M5as0ZLYKx2rxQhPfFiOLAGJ/AKNx0o9ufi3U0ONao=;
        b=GabEvdJRoi4ExZY96UJWyeFErMM5Y+lTjryXrRMrRZ+v435n4WSQSdTfYGVyaJ0NRc
         reVK0UpjMY+3LyTTWoBtzMoWxXF+f1zrs0LdL9sM1R0o7FeHGHCGiyV0HrlkJHFFFF08
         d2WcEURLgkwhSwqBDFj3ndF50q8ciYqQJSJ4VpI/ZTyp1b+wPw1QtR/SQywWy0I3+N7Y
         6HahTQSFUuJwluaCIQNE02n5EQlfHcFzxakZ0DwGYS5LPxtvZU5KkMiG9FDEuUrQOirz
         8XBohBf9mrciOY41+0Dkhax8KRNvil7gBCj0U5OeetfuXz5ZJtl9lKlkdhy1sU7MWh1l
         vkWg==
X-Forwarded-Encrypted: i=1; AHgh+Rp3mP/f17XsxOsA+jWmuBeqL4UiUSTInHXj1H34GSZ/rOMsZNLRo46f4hX2GtYgVkFGecR2Th5+qro=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHvyNDYJzlozEJJL7zv2CcEKIXKWmAhWzNZ1ROtiA/4IKAGG2v
	3FHH9brT3OY9f2vt6dklIy+nb1h4laERjRY11p3BSHAtw7h47sw9nvGvwMm78WsdEQ==
X-Gm-Gg: AR+sD13WfTsVJ8TeVVpWa6ghJaHbj9bEqD5ULwQBgFMuXDRHgKBl4qbbn/hM09YDR4r
	hWVcc1RNpi0bJFfJLTs+16KFUcumGoxukYKlsg+C2CAr9Cn30AZZ4FRCNDNbJIhf+mColYdScFb
	zWR3IMNU6R2w4hKNof+2Qy0auUMKRatuUfEQhkxKhTLakqDYrE261KHbq+kunM8Rqx4470fTQVJ
	6vYjb/Pg9PMnjPNC9aV6RPXokYYvLb8R6ifg/mqxBUE2sBslyCjV8RnMibY8N1G6CWCKkmczeGv
	I/WnkT+10hFEfuiurATSW21Ml8lxO+GhxDPYEQxlIopYmwv4i6dol1vcoGbJqvI7oKcm23GUdOB
	4OatsN530wiawaroDCaYsXd6AtfDo/MAgRmVt3DFE+kVg5/E1ZHZQMrKsbH/frrkVDPbIvqKvjm
	84KvJdqqys7sbhXKx3GxioU+YivRGiNv1QU6/7ZK/n5SwKle3ZtNjczJdmwwmvRlrmZH/29f+Lu
	vaXUqwQ7KPiLgtNHP2kwOrIrx2w8QT1lF2q2RDV/HqNbh9zjqGZ+SEMCRvI43s=
X-Received: by 2002:a05:600c:4892:b0:499:8174:9f39 with SMTP id 5b1f17b1804b1-49981749f8bmr645865e9.0.1786544032059;
        Wed, 12 Aug 2026 07:13:52 -0700 (PDT)
Message-ID: <9a4af47f-5209-4fd1-94ed-fcc1b11108e5@suse.com>
Date: Wed, 12 Aug 2026 16:13:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/17] xen/riscv: introduce
 vintc_state_{save,restore}()
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
 <e71f53f1165619fabb9f79f34cc931cd4296af67.1784560663.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <e71f53f1165619fabb9f79f34cc931cd4296af67.1784560663.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1786544032-4B6D6CFC-F80BF125/0/0
X-purgate-type: clean
X-purgate-size: 2402

On 20.07.2026 18:02, Oleksii Kurochko wrote:
> Virtual interrupt controller state must be preserved across vCPU context
> switches: for AIA, a vCPU's guest interrupt file lives in the IMSIC of
> the pCPU it runs on, so the related state has to be saved when the vCPU
> is descheduled and re-established when it is scheduled again.
> 
> Introduce vintc_state_save()/vintc_state_restore() wrappers around new
> store_state()/restore_state() hooks in struct vintc_ops, so that the
> context switch path can save/restore this state without knowing which
> vINTC variant a domain uses.

Same issue with naming as mentioned for patch 08.

> No callers are wired up yet: the vAPLIC implementation of the hooks is
> added by the follow-up patch,

Neither "follow-up patch" nor "patch" alone nor "follow-up commit" should
appear in a description. You simply don't know how many other commits are
going to come between the two.

> --- a/xen/arch/riscv/include/asm/intc.h
> +++ b/xen/arch/riscv/include/asm/intc.h
> @@ -64,6 +64,12 @@ struct vintc_ops {
>  
>      /* Deinitialize some vINTC-related stuff for a vCPU */
>      void (*vcpu_deinit)(struct vcpu *v);
> +
> +    /* Store virtual interrupt controller state */
> +    void (*store_state)(struct vcpu *v);
> +
> +    /* Restore virtual interrupt controller state */
> +    void (*restore_state)(struct vcpu *v);
>  };

The parameters are properly named "v" here. Why ...

> @@ -91,4 +97,7 @@ void domain_vintc_deinit(struct domain *d);
>  
>  bool vintc_reserve_virq(const struct domain *d, unsigned int virq);
>  
> +void vintc_state_save(struct vcpu *vcpu);
> +void vintc_state_restore(struct vcpu *vcpu);

... is it "vcpu" here and ...

> --- a/xen/arch/riscv/intc.c
> +++ b/xen/arch/riscv/intc.c
> @@ -163,3 +163,17 @@ bool vintc_reserve_virq(const struct domain *d, unsigned int virq)
>  
>      return !test_and_set_bit(virq, d->arch.vintc->used_irqs);
>  }
> +
> +void vintc_state_save(struct vcpu *vcpu)
> +{
> +    const struct vintc_ops *ops = vcpu->domain->arch.vintc->ops;
> +
> +    ops->store_state(vcpu);
> +}
> +
> +void vintc_state_restore(struct vcpu *vcpu)
> +{
> +    const struct vintc_ops *ops = vcpu->domain->arch.vintc->ops;
> +
> +    ops->restore_state(vcpu);
> +}

... here? Consistent and predictable naming of parameters / variables _is_
important.

Jan

