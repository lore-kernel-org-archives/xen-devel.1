Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C01C56207
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 14:57:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384898.1627629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrzWb-0000fS-2G; Thu, 06 Aug 2026 14:56:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384898.1627629; Thu, 06 Aug 2026 14:56:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrzWa-0000fL-Up; Thu, 06 Aug 2026 14:56:48 +0000
Received: by outflank-mailman (input) for mailman id 1384898;
 Thu, 06 Aug 2026 14:56:47 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrzWZ-0000fF-Ou
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 14:56:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrzWZ-004CAw-5Y
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 16:56:47 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a74a09e-5cb7-0a2a0a5109dd-0a2a4501df4a-32
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:56:47 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a74a0ae-5984-0a2a45010019-d1558030e075-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:56:47 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4956242332dso18106905e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 07:56:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49954206d72sm100063155e9.1.2026.08.06.07.56.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2026 07:56:46 -0700 (PDT)
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
        d=suse.com; s=google; t=1786028206; x=1786633006; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pMXs6HRqpuYzHBhbiGaH5JuzeeH9ysfL+n/X4NDredY=;
        b=AIF5yAQ3fReRo96L/XGDOpQjmUEbWK5rY8eu3+BCbra8lFDmMT7bpGHuB+Se8pvxBc
         IyT/fSihpd/C2Tp8xtynMx152QYkJHmBF3kWF0UhQoZl2dQnlwNglplZgbvNLjJCifXX
         vDdxNQfX/luMGaCSwoepBadlHFXsU68mstnAMPFNkQ5FhWnlmtgYLYv4jtauttyERd56
         mkbKTVaQsHE44lTyeXm+9M2vMM5Rs/Zq8vNYy2z11v+73o7XyA0pBW8sV1OfpVVZlrzL
         0VI1TaaJOMy1bVxdzZkgDGEPKo6q414j2G9ja0vt7/b2lMGpw4Ld6w0JntwXLOExUYxO
         xDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786028206; x=1786633006;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pMXs6HRqpuYzHBhbiGaH5JuzeeH9ysfL+n/X4NDredY=;
        b=SOPX7IssFeNmx69kCIj7q72FTmejQo1Ctr09CU4GKdYZTMEfuR0J6VX62x5oKbosa1
         BDHC9lq0+1XIM3RVx8cNE9Vu1WvBJdlvOF+sEW3a1xYvyT6WuOLM8ENrcwuMdFYtNZcW
         R6ux5hZo/cIF6veMHlafTxyIl7WNjh3YzuOozRxhP1QEt+Uk9ZasU/8qJg9EpuCqxFnv
         GkPA/Wzuv6aTmOHRAEgu4kH3bABGgq0Uo2XA64uqJfEiUNirSJkHhVLwgIxs5rCiFuLY
         vE/EwOutoIn9xWuKQVF+cq517lBUV/tHcJitp2foodlpW8Rz+12ZdMfplUnzvSm8YihF
         VQHg==
X-Forwarded-Encrypted: i=1; AHgh+RrOziqSp3CcH1f/qxP/vbOshbZHAepvgY5m49o9tlCVi5h+xyw1D4YP9E0LFFp29YUCLc4wsEw2JmU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVdxnvoLnaIWWW8xrJkdBz3WwUMlsxkg4GVCdb+RIHmVBo+lTx
	/S2diz4CB+LEUKMR78FAYzp/zacQ/pb3F3ob8USGln2ezSJGXAUcpzgejA9I9xMDAQ==
X-Gm-Gg: AR+sD121w6ZnScminG6oo4o2p0D7vTBl3gv9GJSS9HTl0C2v3mJ+MvUDvolZElZr9wX
	ttjX3zXK+SigkpaItkA6UjHgqsVDvmArBTQBNWn7S/ifEd/kZ0YL2LfwUYNeBKyVcKgHCmgUwnu
	D0SprppXylNN8RPouVRSpWIMqY/3mmCPtzmlpqIuXF4DJ2hoTU5zjbN8mIXVwvrD613t4SjHuV0
	oKW1hj+Q67ZzV7JieJCt+I9dyBLuN9Nzqe3rTCxuOAVy9+LczL5rz44UMvzDVjuXUIJEdc9ud6/
	0E7YIlt+lD9hinEGdL2Jeg4EsVM7gRCYpyk50OKGcdZiBLPdd3F2W0Q9YB15sbgrbvcWz9Lfx77
	4dR4iTxBSO/i2r+Zl/ODRE/fzpV0A0YF7j0C6Nlcn3IUEFbnnEU56XvYxD024kqIu/oMVMlZI6t
	1G/KQDor8cXPDe/aN4XCcVz0tlzV12G0pE7T4fjs4YyPXyXw0ImP2UghXhG2ubZCGVmwDX8KrBT
	bAMy8Y+YRjsdg1oUsToC8G32W2YSbjeCGiBuJdtNKbmBNtjkcL1
X-Received: by 2002:a05:600c:1992:b0:496:c378:6420 with SMTP id 5b1f17b1804b1-4994e71a1c9mr188832845e9.8.1786028206534;
        Thu, 06 Aug 2026 07:56:46 -0700 (PDT)
Message-ID: <f3e14d18-7732-4a34-9ae4-31cdc89e6495@suse.com>
Date: Thu, 6 Aug 2026 16:56:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/17] xen/riscv: introduce vCPU AIA initialization
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
 <b3aca8278dfd70bf6ce888bfcb0a3fbc32bb4971.1784560663.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <b3aca8278dfd70bf6ce888bfcb0a3fbc32bb4971.1784560663.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1786028207-BD146757-FB7EF3BC/0/0
X-purgate-type: clean
X-purgate-size: 3096

On 20.07.2026 18:02, Oleksii Kurochko wrote:
> Introduce vcpu_aia_init() to initialize the AIA-related state needed
> for a vCPU to have a working guest interrupt file.
> 
> A guest (VS) interrupt file must be mapped to one of a pCPU's
> hardware interrupt files (if they exist), so the pCPU a vCPU will actually
> run on needs to be known first. arch_vcpu_create() is therefore not a
> suitable place to call vcpu_aia_init(), since the pCPU assigned to a
> vCPU can still change before it is first scheduled. To avoid
> reassigning the VS interrupt file id and remapping it to a different
> pCPU's hardware interrupt file, vcpu_aia_init() will instead be
> called from a later point in the scheduling path (e.g.
> continue_to_new_vcpu()), to be introduced in a follow-up patch. Since
> it will end up being called from a non-__init context, it is not
> itself marked __init.

If it's called during scheduling, perhaps vcpu_aia_init() simply isn't
an appropriate name, and that issue is then also reflected in a
misleading patch subject?

> @@ -36,6 +37,35 @@ bool aia_usable(void)
>      return _aia_usable;
>  }
>  
> +void vcpu_aia_init(struct vcpu *v)
> +{
> +    unsigned int new_vsfile_id;
> +    int rc;
> +
> +    if ( !aia_usable() )
> +        return;
> +
> +    new_vsfile_id = vgein_assign(v);
> +
> +    /*
> +     * vgein_assign() returns 0 when no free h/w guest interrupt file is
> +     * available (including GEILEN == 0); imsic_map_guest_file() maps nothing
> +     * in that case.
> +     */
> +    rc = imsic_map_guest_file(v, new_vsfile_id);
> +    if ( rc )
> +    {
> +        /* Can't continue w/o correctly mapped IMSIC interrupt file */
> +        domain_crash(v->domain);
> +        return;
> +    }
> +
> +    vcpu_guest_cpu_user_regs(v)->hstatus |=
> +        MASK_INSR(new_vsfile_id, HSTATUS_VGEIN);

Looks like you're assuming that no other ID was previously stored in that
field. That can't be quite right when the function is called after the
vCPU moved to a different pCPU.

> --- a/xen/arch/riscv/imsic.c
> +++ b/xen/arch/riscv/imsic.c
> @@ -83,6 +83,19 @@ unsigned int vcpu_guest_file_id(const struct vcpu *v)
>      return ACCESS_ONCE(v->arch.vimsic_state->guest_file_id);
>  }
>  
> +void imsic_update_state(struct vcpu *v, unsigned int guest_file_id)
> +{
> +    unsigned long flags;
> +    struct vimsic_state *vimsic_state = v->arch.vimsic_state;
> +    unsigned long pcpu = ( !guest_file_id ) ?
> +                         NR_CPUS : cpuid_to_hartid(v->processor);

"pcpu" as a name is misleading when what you store is a hart ID. NR_CPUS
then also isn't a suitable sentinel.

Also, style nit: The parentheses aren't really needed around the conditional.
But what's definitely wrong are the blanks immediately inside them.

> +    write_lock_irqsave(&vimsic_state->vsfile_lock, flags);
> +    vimsic_state->guest_file_id = guest_file_id;
> +    vimsic_state->vsfile_pcpu = pcpu;

By implication from the remark above, the field name stored into then also
is misnamed.

Jan

