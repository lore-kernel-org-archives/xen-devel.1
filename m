Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297BD606A327
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 09:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=S8VjyvTZ
Received: from list by lists.xenproject.org with outflank-mailman.1483223.1686751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR4Bm-0000dq-Nx; Wed, 11 Nov 2026 09:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483223.1686751; Wed, 11 Nov 2026 09:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR4Bm-0000dj-LQ; Wed, 11 Nov 2026 09:00:18 +0000
Received: by outflank-mailman (input) for mailman id 1483223;
 Wed, 11 Nov 2026 09:00:17 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR4Bl-0000dd-Nm
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 09:00:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR4Bl-00GdOK-0A
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 10:00:17 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af42e9e-2eae-0a2a0a5409dd-0a2a4509e7c4-24
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 10:00:16 +0100
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af42ea0-be1a-0a2a45090019-d155dd2ed540-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 10:00:16 +0100
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-48e47347279so1877583f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 01:00:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4983284c9b1sm8997987f8f.6.2026.11.11.01.00.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 01:00:15 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794387616; x=1794992416; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+VsUMPrd4dFHbg3F9yoYK6zg/hlkAV4W86sMGrWMxBM=;
        b=S8VjyvTZMJzewqxWs6tRzM3HuiFIAy9mmf/aqg8FaoEKWqil3tJBG7YZlIw8Kl9htP
         0ccwgf3o/WG9kg0Zl5q8XpOg8XYABc64lAvZphspZgmriq0SN1lg4TtM1OURTMsu9A1m
         bNb7nGv5PxN74yTUGFUpQz7sorPNd59S2fRu+rKZ34kr1yY8MLbpK7GdHL1d5Licres9
         iNdac+DkxJ1tunh5rYtvj4b9mk25eMGfnnjelCTsUe65QFVNC82xq440NChRW3re0xfU
         C58W6+S41Xd4MmIJu7fuumiRmx+lram1pTVNTdCZXV8bKZJ/W2AqINXJ/fkw+FyJ4GRT
         BW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387616; x=1794992416;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+VsUMPrd4dFHbg3F9yoYK6zg/hlkAV4W86sMGrWMxBM=;
        b=YPRhLI0fo0fRfaGqliL301Nh0SpyaL2n3XqrjIdG5K4AS5x560eYLHnB3VF71o1jx2
         1DcgHtIPzZQk/hmwDBQmop9oWYK60xeQ4lm3ivQMZaqfrgohZoKNRXlH6tjet82rrrtb
         J0IAqUO/a1OxFZTBQECX2eZMTtq10RanR9R0k3dseSjoRAd5NlB0AzQIZxB1JI+5LyHf
         KIJ209HJCLtRvk8rRXxi2meFVSNwT98K/Wq5qfrQvcUYrjboMv3O1Oo0dTIyzB1OFxqf
         OQAsFvSes+uQmObMAUxU0xTAD3bKhier4a59CBL3b15VX2m2CV/lYdXMpb35fkZCnxjn
         C5dw==
X-Forwarded-Encrypted: i=1; AL+hErE5ds7EH94RDcMLtFer7lm9ckAE+zqvrNKvGiGbmjVomVt8KXwEQ3VgUWdj9GWM0/KXYD49Y4+xo/0=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8JrEP+I94ZCAMggQJ/Wvvs646O+FXwvuA67poW60Oq5R8OjGCs
	l/7XhKe7zG0rjoW35nytVyJ7wP2f+1SMTk5aKMJcBi9vlFVKFjZj69vYcZ6jDpjbKg==
X-Gm-Gg: AYBFou2gX70jjQVUlGm2bNh3trYhcuktCH+DRWYsNcLPeCDIZ3YLu4p78cbAfX14box
	S6z5/1oFBTpOLKXMe9GH/K5qdWtwEJsxYafohO61WrHpsdFMGHlTFz/xkMY9tZczmQlijEwoEYp
	PTNvzVUw4vbkFSln67/FO6BffTz1hPRCiFya8+vl93Re4dz5T3JBAVMh1YQXrx/EOzQNb+3ByB9
	VmHDHUSIjzGDpE1BtpxyyfhM95k/XqwOJMXwzGmACnLV5iVOcFTsay9QtfRBGbfaTXIDy8OrrS6
	7rHCbsBK2Ly0WMhkUlEWVjF/ZHT/wLFj2/lHwb/xXzf+izfvQG3WSCtzH3dEVivg5hyZ8nJ+QTM
	4mny4tGXz/XTmm3A7kwJWhSNkAM49v7U7qjqyWRt/kje6+5Jy31GjQTjIvm78jUlCJw7G4FPtv+
	8TSigIKbjTQKgStZcQB/Ch3aAegetbaR++F+sKihT+lhv86hfN5y7E5UofEQgHfuiFdur2P58RA
	/c9dCi9uS2HQvwwB3St4kqXobFSRboqD/woshIxQXZ2cbuLmLxVcokl+G1Tq2/RwXS0XebBM4iI
	pYHSPIRLDR0HrUutWJSAuuV9/2KJEKeZ1md5gWiydVFWxiX8PlLfzyy/i2A7NSOjTvA5ovVEwfC
	f+8g=
X-Received: by 2002:a5d:64c7:0:b0:48a:f320:dba0 with SMTP id ffacd0b85a97d-499c89814femr2860357f8f.45.1794387615970;
        Wed, 11 Nov 2026 01:00:15 -0800 (PST)
Message-ID: <5ab51834-72e6-4d52-a9c6-17472add28ed@suse.com>
Date: Wed, 11 Nov 2026 10:00:14 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/nestedhvm: process the MSR-load and MSR-store areas
 of L1's VMCS
To: Mahmoud Abumandour <ma.mandourr@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261110063334.2029620-1-ma.mandourr@gmail.com>
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
In-Reply-To: <20261110063334.2029620-1-ma.mandourr@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1794387616-3A0C5034-A24D556D/10/78276251493
X-purgate-type: spam
X-purgate-size: 2778
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10.11.2026 07:33, Mahmoud Abumandour wrote:
> Nothing in vvmx.c reads the VM-entry MSR-load, VM-exit MSR-store or VM-exit
> MSR-load area of L1's VMCS, so L2 runs with the listed MSRs as the previous
> L2 or L1 left them, and L1 gets neither L2's values stored nor its own
> loaded back. Process each area where the SDM does, with the SDM's checks,
> an entry as a WRMSR or RDMSR at CPL 0 that L1 does not intercept. A bad
> VM-entry entry fails the VM entry with exit reason 34 and leaves the VMCS
> unlaunched, a bad VM-exit entry is a VMX abort, which crashes the domain,
> and IA32_VMX_MISC now recommends the 512 entries an area may hold.
> 
> Fixes: 9390642b7fa5 ("Nested VMX: Switch shadow/virtual VMCS between n1/n2 guests.")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Mahmoud Abumandour <ma.mandourr@gmail.com>

Just a couple of mechanical remarks here for the moment:

> @@ -1212,11 +1214,67 @@ static void nvmx_clear_vmcs_pointer(struct vcpu *v, struct vmcs_struct *vvmcs)
>      __vmwrite(VMWRITE_BITMAP, 0);
>  }
>  
> -static void virtual_vmentry(struct cpu_user_regs *regs)
> +/* The longest MSR list that IA32_VMX_MISC recommends to L1. */
> +#define NVMX_MAX_MSRS 512
> +
> +/* A nonempty MSR area must be 16-byte aligned and within MAXPHYADDR. */
> +static bool msr_area_valid(const struct vcpu *v, unsigned int addr_field,
> +                           unsigned int count_field)
> +{
> +    uint64_t addr = get_vvmcs(v, addr_field);
> +    uint64_t count = get_vvmcs(v, count_field);

Please see ./CODING_STYLE for the use of fixed-width types. "addr" likely
wants to be paddr_t, and for "count" unsigned int looks to suffice. Once
changed that way, ...

> +    unsigned int width = v->domain->arch.cpuid->extd.maxphysaddr;
> +
> +    return !count ||
> +           (!(addr & 0xf) && !(addr >> width) &&
> +            !((addr + count * sizeof(struct vmx_msr_entry) - 1) >> width));

... it'll also become clear that the multiplication here cannot overflow
(if that was possible, your check here would be insufficient).

> +/*
> + * Load or store an MSR area of L1's VMCS, each entry as an unintercepted
> + * WRMSR or RDMSR.  Returns 0, or the 1-based index of the failing entry.
> + */
> +static unsigned int process_msr_area(struct vcpu *v, unsigned int addr_field,
> +                                     unsigned int count_field)

"Load or store ..." in the comment is a little odd; the function name
using "process" better describes the purpose of the function. Maybe
"Process an MSR load or store area ..."?

> +{
> +    paddr_t addr = get_vvmcs(v, addr_field);
> +    unsigned int i, count = get_vvmcs(v, count_field);

Interestingly here you already use unsigned int.

Jan

