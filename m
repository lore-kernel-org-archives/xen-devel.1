Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5B9C5DF7D
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 12:09:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394070.1632879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwIcf-0006WR-RF; Tue, 18 Aug 2026 12:08:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394070.1632879; Tue, 18 Aug 2026 12:08:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwIcf-0006WK-On; Tue, 18 Aug 2026 12:08:53 +0000
Received: by outflank-mailman (input) for mailman id 1394070;
 Tue, 18 Aug 2026 12:08:51 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwIcd-0006WE-Pg
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 12:08:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwIcd-00BayI-6R
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 14:08:51 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a844b51-2eae-0a2a0a5409dd-0a2a4501a0f2-6
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 14:08:51 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a844b52-5984-0a2a45010019-d1558033d0e4-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 14:08:51 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-495757ccbc1so41578735e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 05:08:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49996100184sm291726575e9.1.2026.08.18.05.08.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 05:08:49 -0700 (PDT)
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
        d=suse.com; s=google; t=1787054930; x=1787659730; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3yPtWQjt4aEfZty2NFG/9vt0uKtE4t9EaGlidQL9Cw8=;
        b=OEqLg1nHqwHfu+XxUWnpP2fYTaJHFnMCBgXIX1AwXMS/xYyyuBuDJqFFKioeh0u4q+
         Z4ZBfR51VeoiovVla5hv9x8qJDI7cUnHkt8BBUBeuWmGEnGyRhUzEpqyH7r2/ryiJ7sU
         OWrb990WaA9u6DhB+3TOEeZp6uk2A91gDZ1jKLdpbsQQPnYG5Q76TAgI/OEgWrv48Wbz
         9KFZPJ9hs57m5wTb2VAX72BgoeRcsGvtBgNiWFvfeh31xnKGgh7j9ZLAsKK6KElDUyvh
         VgIW+/hxNFxJid6mgf+A/nM6hhKYQKHycTA0OYeoWdXCA2+A/zl7G/dTh5NfvpXaMheD
         EALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787054930; x=1787659730;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3yPtWQjt4aEfZty2NFG/9vt0uKtE4t9EaGlidQL9Cw8=;
        b=PC2zmB1IfA/+7nDJpx9U+0EBClwcbI+PEgiTjIv8Blb3kt7HdFKnieuao7QwS3ccy0
         divBx1qW2bVtzRUMRGgylBecf5IREjZvMSqbZte83cKNej1JVwxL+8nDlmi+AS1MvbNS
         ZnjRKYwRnUm/ixw5tMSYfaSE3nL5qJAc3RRjzJV32gQX+LDE7HRzlUUwWbB8fNMEbhbw
         vUmkMsBnfUrbdRkIYMaR5IB1viQis8Kt0mGLYQPGgYcWDvZ4qr2mtOH8YCdlDto17Jfz
         owSTrl7RCRleTte+k1wY5gKTxHWQpa972UpGo9l+QPybdzBh02siDgxs7bpGNfpdyyzX
         Chfg==
X-Forwarded-Encrypted: i=1; AHgh+Rq+bhxfeKPPSVCYNcrGqG8rf2uSNmjo0fzc8Bs6dceWyRExyN0oGFfcWg53hRoCuF6hODWtkHZG7QE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYy/viR/sAgNgbXZ80BRcZaJddbLh/ZKfLl1eyhUxJvEQw4Pr+
	I21ZmIO/NsGEYKzcd1LtaOcCFKql/3ZTAD9zQlaKI8cTlireTQtNLGedc638GqlcdQ==
X-Gm-Gg: AR+sD11fCJFAS9gjs2dpwZfs68+Q/Wx9jYVAwd/kL9w/OX3yo1OcQp/WmJbioavgFYC
	C1lG+RclTZbnAABGVa0FCXvWKkATbO8gQPwe5YhbYAbnMwEe1Bs9IpQISfUomjqav04+j/Honv+
	dhS7/4q12h9mUnNTBf7uZnL+aeFa5cwP/Mj+l7arRLzFXacREozltQ5qJ61+qMPC5djPQ5gWJpk
	oklWCcxW0pED2oSKL4gnuNie5T3YgW3qpifMInyZwxAQ4lAbTmubqugVaeoPF/z7391bqZQSwoa
	dd4NIV9aCo9Ox6RQM3twEOYOgGWil+tDos8YKWK1RSBQp4AWqFvno91TfPtO7EeF6BBCjtjlCGe
	ayqBA1LxLum2BSFcyRZLqS03vDvK79QDU/CwszIfAK0m7Zu4bJVEtLoVc9nIHckxQRkgkrx7zdP
	Vv7U+DgQ+fqpMiL/FebVFkvH/pQ3xoF3wV1n+Sc2L/7V9/sERscuqajWxJh/XZSlKq5lKJUlGMb
	jXi8y52PNyGEasc7P0NoV6ynPPg15VHBEiQIugeLzHNljXDQ2v6
X-Received: by 2002:a05:600c:3398:b0:499:52dd:c1f0 with SMTP id 5b1f17b1804b1-499879298c4mr341784855e9.1.1787054930476;
        Tue, 18 Aug 2026 05:08:50 -0700 (PDT)
Message-ID: <7489d730-6e91-4d6f-a355-4eaa62698c4c@suse.com>
Date: Tue, 18 Aug 2026 14:08:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/23] x86/cpu: report SMX, TXT and SKINIT capabilities
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, trenchboot-devel@googlegroups.com,
 xen-devel@lists.xenproject.org
References: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
 <be993e757550b69a6f94f89476ba71131b434741.1785668458.git.sergii.dmytruk@3mdeb.com>
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
In-Reply-To: <be993e757550b69a6f94f89476ba71131b434741.1785668458.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1787054931-C4F47757-2E336DE1/0/0
X-purgate-type: clean
X-purgate-size: 4068

On 02.08.2026 15:09, Sergii Dmytruk wrote:
> From: Michał Żygowski <michal.zygowski@3mdeb.com>
> 
> Report TXT capabilities so that dom0 can query the Intel TXT or AMD
> SKINIT support information using xl dmesg.

Hmm. I first meant to ask: In how far is this extra logging useful,
especially as long as we don't use the features just yet? And only then
I noticed that I must have paid too little attention here already in v3.
Querying through "xl dmesg" is entirely unreliable. Sooner or later the
boot messages will scroll off of the ring buffer. Making this a
query-able interface also would mean we can't alter any of the messages,
should the want/need arise.

For AMD the situation is easy: It's part of the featureset / CPU policy
exposed via sysctl. The same is true for SMX on Intel, but the further
GETSEC output requires some other means to communicate. I wonder whether
making this part of the CPU policy would make sense, or whether to
introduce a Dom0-only hypervisor-CPUID bit for it, or whether yet
something else would be best here. Likely Andrew will have had thoughts
on this long before ...

Irrespective of the above also a few comments on the patch itself.

> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -617,6 +617,21 @@ void amd_process_freq(const struct cpuinfo_x86 *c,
>  		*low_mhz = amd_parse_freq(c->family, lo);
>  }
>  
> +void amd_log_skinit(const struct cpuinfo_x86 *c)
> +{
> +    /*
> +     * Run only on BSP and not during resume to report the capability only once.
> +     */
> +    if ( system_state == SYS_STATE_resume || smp_processor_id() )
> +        return;

If this is BSP-on-boot only, the function really wants to be __init. For that,
...

> +    printk("CPU: SKINIT capability ");
> +    if ( !test_bit(X86_FEATURE_SKINIT, &boot_cpu_data.x86_capability) )
> +        printk("not supported\n");
> +    else
> +        printk("supported\n");
> +}
> +
>  void cf_check early_init_amd(struct cpuinfo_x86 *c)
>  {
>  	if (c == &boot_cpu_data)

... use this condition ...

> @@ -1325,6 +1340,7 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
>  		setup_force_cpu_cap(X86_FEATURE_XEN_REP_MOVSB);
>  
>  	amd_log_freq(c);
> +	amd_log_skinit(c);

... at the call site (and of course also the other one). Same for the Intel
code, obviously.

> @@ -620,6 +625,49 @@ static void init_intel_perf(struct cpuinfo_x86 *c)
>      }
>  }
>  
> +/*
> + * Print out the SMX and TXT capabilties, so that dom0 can determine if the
> + * system is DRTM-capable.
> + */
> +static void intel_log_smx_txt(void)
> +{
> +    unsigned long cr4_val, getsec_caps;
> +
> +    /*
> +     * Run only on BSP and not during resume to report the capability only once.
> +     */
> +    if ( system_state == SYS_STATE_resume || smp_processor_id() )
> +        return;
> +
> +    printk("CPU: SMX capability ");
> +    if ( !test_bit(X86_FEATURE_SMX, &boot_cpu_data.x86_capability) )
> +    {
> +        printk("not supported\n");
> +        return;
> +    }
> +    printk("supported\n");
> +
> +    /* Can't run GETSEC without VMX and SMX */
> +    if ( !test_bit(X86_FEATURE_VMX, &boot_cpu_data.x86_capability) )
> +        return;
> +
> +    cr4_val = read_cr4();
> +    if ( !(cr4_val & X86_CR4_SMXE) )
> +        write_cr4(cr4_val | X86_CR4_SMXE);
> +
> +    asm volatile ("getsec\n"
> +        : "=a" (getsec_caps)
> +        : "a" (GETSEC_CAPABILITIES), "b" (0) :);

Nit (style): Bad indentation, missing blanks, unnecessary \n, and stray colon.
Overall:

    asm volatile ( "getsec"
                   : "=a" (getsec_caps)
                   : "a" (GETSEC_CAPABILITIES), "b" (0) );

I further question the need for volatile here. (Like for we have for CPUID, we
anyway may want to gain a getsec() wrapper for GETSEC.)

> +    if ( !(cr4_val & X86_CR4_SMXE) )
> +        write_cr4(cr4_val & ~X86_CR4_SMXE);

The clearing of SMXE here is pointless, as the if() already guarantees the bit
to be clear.

Jan

