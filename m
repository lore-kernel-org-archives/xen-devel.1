Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A32C5DF80
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 09:08:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393776.1632594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwFnF-0006hW-30; Tue, 18 Aug 2026 09:07:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393776.1632594; Tue, 18 Aug 2026 09:07:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwFnE-0006hP-VZ; Tue, 18 Aug 2026 09:07:36 +0000
Received: by outflank-mailman (input) for mailman id 1393776;
 Tue, 18 Aug 2026 09:07:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwFnD-0006hJ-LE
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 09:07:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwFnD-006C4g-1s
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 11:07:35 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8420c4-e002-0a2a0a5209dd-0a2a450192c2-40
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 11:07:34 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8420d6-5984-0a2a45010019-d155802ff125-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 11:07:34 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-49800c6a846so51219435e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 02:07:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49993d1b78asm161207275e9.3.2026.08.18.02.07.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 02:07:34 -0700 (PDT)
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
        d=suse.com; s=google; t=1787044054; x=1787648854; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m5NMqaKEMHNMyIIFFQBJe81IxITT7YiCf9WRfA9vfQU=;
        b=QlX72C2xJMjnSTiVfNhJxPNlm9v+SZeNl4gAWjG22cWsQtIOc3NZW2oqLLQmu2030s
         J2TUfnEDigcgNUG4M4935yRFA+afk7L4crDC9CO9xwXBW4UBvPrWyYGJLHPvLRP7qULw
         e3IYQBJl9NHC2MgQPVIG9vS7Qp4murs212ccMe+1KZDrtxsWLcg8dLpk6oWk7BCB8+RZ
         KiXmidlPpql0ulWFWYNazYKB0MRUiqe1lBeMfXmfPqK3BYlYSSHtysKyud4KYbLzOQm4
         2WkqEE2asuK52TW9+py81RrBtCo97Lt5iuYx5PTTMSvSsj/X64pWlEGpScfHCkgOe6KO
         vgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787044054; x=1787648854;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m5NMqaKEMHNMyIIFFQBJe81IxITT7YiCf9WRfA9vfQU=;
        b=eTLCit3cxIpocGSQkgH4fTFCR4OY6a8jT7VR6GTE5BYVoNEUvMli6aebtczUIjzTIg
         7uY+E1Z7YWtU9WuIE+gMulzj1hI3cgNpDnTAOG88eViQPsjb07z/lI5F9i+bDC1L7ILJ
         K6GUtJ+MrQeY0o3gjUwNeNRamJMAforUVORsRsTtgm6tPUFXx9HiotLXakTs0d/l+s7w
         +Jr5Uaz3SI5WfDqGXNIeO7jDKMMOT9S4/Pt1CDZWilqZ/qT4rcerAXjfLjC75v0Lh9Ph
         FcGcyzzZWvIK97msYOO22sMX3xbi9svFUsrlt/zEL+dXGXG1JHZSHEnBrPZc7viliorU
         q70w==
X-Forwarded-Encrypted: i=1; AHgh+Rod/EbuiyZCYXX7Wxy5trUy5AmrVYC+Al2My+m1oPFqpTmYK6QT/Ik2Jqr/5+4Pxlsjy9WzWEpqmP4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxhFQVhdpx9LKyVBPzh7jjxxWhoJQfFNzTexOkomicGGxPKXyhi
	EqCR/UwS5R1h1DRhGgXaf5Q+gr7baUoFjb25I0+SYA9ta6OkbbMFnxfH32QGwijjNA==
X-Gm-Gg: AR+sD13chaZx0/2x+uaKS/jGXywPsA+m6Bv3fxV7XwzyfX52tyrwl+OhGJ78ePghilA
	uau0NOyFQSeixDuSeeylRe+xf8iFuQy3Z68+e8faQ/b5c0m3W8Qx4tC+BFlJrWwI/tmYgT3Nkry
	qVIbxSORr4jyzjANVDKjvlOeDhD2mwiHdBLJOA7qUEqSGuU9NfzwFeT5hnYRgvdJzD2/I6I7GGf
	kgNNGdf70Qd+AxkTg1oGQBX2TY0rtGYdAYoxc2+95ad+3Lj6QNOi8Yb9KZCZfBHu76MHbc3odKD
	U1jzQ8ExDMpth3MI+DStQ/+sr1/kNOVfkh0w9k9VPJJ73OesLvXXpdIOUc+OG9u8QDy4Ly62LRd
	gYVFK6u51COF9HbzwZqpRGCLali/gxL5GDq/Z2LhjGjBdOQEGXhODL9l20hQgqPGTZR9MmdzH2i
	32lTTixFqQ9xuXz3vogKY+s3xWeS6Ux21m1LEAAWtSfELDCk3K+J1fVVBkU9t8fROF6IrU9ozNL
	2zQFeDCxLGkPB84y7FT5CzQy/1wSRGiWhLGY7sOWHW59aXHFeUwLCtpdHhBQysqnWBCIhktGZA=
X-Received: by 2002:a05:600c:c16d:b0:499:8ff5:8ecc with SMTP id 5b1f17b1804b1-4998ff590a6mr428321925e9.15.1787044054444;
        Tue, 18 Aug 2026 02:07:34 -0700 (PDT)
Message-ID: <4784dadc-9485-4a0c-8c93-928e27d21146@suse.com>
Date: Tue, 18 Aug 2026 11:07:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/6] arm/sysctl: Implement cpu hotplug ops
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1787042017.git.mykyta_poturai@epam.com>
 <43447ba62f39a46ceeafca58a4212fb8c07497e1.1787042017.git.mykyta_poturai@epam.com>
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
In-Reply-To: <43447ba62f39a46ceeafca58a4212fb8c07497e1.1787042017.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1787044054-BCB45757-0B62A2A8/0/0
X-purgate-type: clean
X-purgate-size: 2964

On 18.08.2026 10:48, Mykyta Poturai wrote:
> SMT-disable enforcement check is moved into a separate
> architecture-specific function.
> 
> For now this operations only support Arm64. For proper Arm32 support,
> there needs to be a mechanism to free per-cpu page tables, allocated in
> init_domheap_mappings. Also, hotplug is not supported if ITS enabled,
> and partially supported FFA, or TEE is enabled, as they use non-static
> IRQ actions.
> 
> Remove ifdef guards for x86 in flask, as cpu hotplug is now
> supported on more architectures.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
> v8->v9:
> * simplify dependencies of config CPU_ONLINE_OFFLINE again

You must also have re-based over XSA-499. As non-trivial re-basing can go
wrong, I think at least in those cases it wants noting in the revlog.
(Personally I try to remember to always add the remark, even if the re-base
was the trivial resolution of e.g. fuzz.)

> @@ -104,6 +105,40 @@ void smp_call_function_interrupt(void)
>      irq_exit();
>  }
>  
> +#ifdef CONFIG_CPU_ONLINE_OFFLINE
> +long cf_check cpu_up_helper(void *data)
> +{
> +    unsigned int cpu = (unsigned long)data;
> +    int ret = cpu_up(cpu);
> +
> +    /* Have one more go on EBUSY. */
> +    if ( ret == -EBUSY )
> +        ret = cpu_up(cpu);
> +
> +    if ( !ret && !arch_cpu_can_stay_online(cpu) )

I'm sorry, I should have noticed this already before: This isn't "can", at least
on x86. It is a requirement in certain situations that CPUs be kept kind-of-
online. Since arch_cpu_must_stay_online() feels clumsy as a name, and since that
might also conflict with another arch perhaps really meaning "can", not "must",
maybe arch_cpu_keep_online()?

> --- a/xen/common/sysctl.c
> +++ b/xen/common/sysctl.c
> @@ -475,6 +475,40 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>              copyback = 1;
>          break;
>  
> +    case XEN_SYSCTL_cpu_hotplug:
> +    {
> +        unsigned int hp_op = op->u.cpu_hotplug.op;

This variable is used ...

> +        long (*fn)(void *data);
> +        void *hcpu = _p(op->u.cpu_hotplug.cpu);
> +
> +        ret = -EOPNOTSUPP;
> +        if ( !IS_ENABLED(CONFIG_CPU_ONLINE_OFFLINE) )
> +            break;
> +
> +        switch ( hp_op )

... solely here. Is such a variable really warranted?

> +        {
> +        case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
> +            fn = cpu_up_helper;
> +            break;
> +
> +        case XEN_SYSCTL_CPU_HOTPLUG_OFFLINE:
> +            fn = cpu_down_helper;
> +            break;
> +
> +        default:
> +            fn = NULL;
> +            break;
> +        }
> +
> +        if ( fn )
> +        {
> +            ret = continue_hypercall_on_cpu(0, fn, hcpu);

Same (maybe to slightly lesser degree) for "hcpu", used solely here.

For both variables, the situation is/was different in the original code.

Jan

