Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E702CCA5FB3
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 07:15:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437975.1656859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCB04-0007du-5t; Thu, 01 Oct 2026 07:14:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437975.1656859; Thu, 01 Oct 2026 07:14:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCB04-0007dn-32; Thu, 01 Oct 2026 07:14:40 +0000
Received: by outflank-mailman (input) for mailman id 1437975;
 Thu, 01 Oct 2026 07:14:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xCB02-0007dh-GL
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 07:14:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCB01-008kxM-Pt
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 09:14:37 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abe084f-8faa-0a2a0a5109dd-0a2a4508e28c-32
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 09:14:37 +0200
Received: from [74.125.225.99] (helo=mail-wr2-f35.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abe085d-f659-0a2a45080019-4a7de163963f-3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 09:14:37 +0200
Received: by mail-wr2-f35.google.com with SMTP id
 ffacd0b85a97d-48b0f4efe31so61202f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 00:14:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b06778c3fsm4816891f8f.0.2026.10.01.00.14.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 00:14:36 -0700 (PDT)
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
        d=suse.com; s=google; t=1790838877; x=1791443677; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8rH22Er45wWWjpv0r5L3KNPoam+oZEAngrcd1iyQ00=;
        b=domQUpMQx+S18wCItGbHvPKwXKfB/aa/WwUeZBiMannibNSOalikGCNV3baWdFIFy7
         ZKbNvwa+qY1r1fYdhlhMrgIrqIXVi/cGPXkGnpMxwxDyVjrmNtkDHpWE4YtLidqa7x8I
         uTT4W52GKXZMB7ct8fAo62xIS4Pbbk/QDIwoaFTqAiEJFp2t3MkLEwUU3h5H4B15EvaM
         OH+BCT3YB12jOiHKgU90/xJTHM3OrFMxt20vJJ759B7+bJ2gW1/Iio4H5+KnLngWCjsd
         0kpl0UW6gTXvABxHMmOCfiIRkoJ2KyFOnen+/4J/ofX7m1wTKOAWrBLoPCP28BE1QwhB
         6qWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790838877; x=1791443677;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z8rH22Er45wWWjpv0r5L3KNPoam+oZEAngrcd1iyQ00=;
        b=oCyi61U+kExVCu4C0MR+dPcmlGigTashhEu5EXwD3BIbaXU6fipg72d1TOUw9r7IBT
         W2RJvtwujPBUWmkeLBq1kfQe1nLeaG87ma5MM9tHU9sTy59moZ2KSclZRXmnNPJP5EcO
         PgG60JgHuWlqSMRq7U6neAWIFgztFwKcbGsgeBYDFhml+YCU8RbJFkSSq1z4QqIKm3gL
         FSDx7ypMWB4HvQqDvD3EKlJE2/eM9xaVcHSZvLLbbqtDTOz6b72RJHWfwyLHilJ3rNPm
         P7YpSdZ5eqP3MeHe+jqgzoT3kCwP1wqKeiNh3e+eUovJb+p3oLPY7Pyx95VrAMHlaZ6W
         ZrrA==
X-Forwarded-Encrypted: i=1; AKwUvBxQRiSobDEOznaKM3WCoKL4ebPJDByrvelVRoCzrAOrCYp6IWp1JzrfQNDduiy7whakdwvCV0W2n/E=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIsNdVFqBHaR58IFhSJQPWHefKwgIyOB5Qp08uigVHii40oOmqw
	oTtDfDqzdEXmYwUi2sEf3sIj22H3KamIX7Fg6wvSn4Fhg/qkdKoJQ9vcbrasFM5nZQ==
X-Gm-Gg: AYBFou2fF8PuDpxVbrl0Duv+XkDt7tlxetgA2rMm4+/8jspvt/039IOBk/0Xq6h5bwh
	CEwrtoSQxOF89ON8Buf3ZlPGReFHaILyo/UCrdK43Wy7AaHzNK5OdvW6cRBlBs16flHX9eITX1u
	vQDvbpf8J9qCVr+HnG332tKDA5QGE0G8u+xKhEgN3hOYSdBBC3FT/NxPL8sauLYle4tZpR/jR8B
	HOokr4kGabbGE/j3pFps9BsLhUN2YQX+YAMNBwi74z5Ju8OudFzkxzw3BvMDZiA//as/miPWQsJ
	sXpjAkbJxSroCa8vonWWJeAoPi5zwGjLAFYUjI644EdSkqkfmXtcMttPWbZEqxq54DBi/oPCanW
	WWa30oCMlp7tcEqGwDPLHcsfAxmFNIcqYd6KZwD0FRuJkRV15ED+bkE3xRDJQaLs980WMvXkTn9
	Sp/0rxV2+id5lt4y7DUv+3x0NP9e17ECGmWHpo0Ue6PzHaLMJv/QpOrBwvCqQNAB0FUeBePti5j
	XaJInyA2w65lRWA0LcKGA5mbXNCB57TOkbCnSINiKLtmXoqkKA+Q3B47vmx3rJk/1ycBlam
X-Received: by 2002:a05:6000:26d1:b0:48a:f318:ac02 with SMTP id ffacd0b85a97d-48b024dc638mr7303226f8f.19.1790838876710;
        Thu, 01 Oct 2026 00:14:36 -0700 (PDT)
Message-ID: <332fec64-31f0-48b5-8c86-163e81899310@suse.com>
Date: Thu, 1 Oct 2026 09:14:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] x86/ACPI: optimise C3 entry on AMD CPUs
To: Olivier Lambert <olivier.lambert@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>,
 xen-devel@lists.xenproject.org
References: <1790796643.8631fc262581453bbf619ec5b2062170.1a0f3cc3da00003f66@vates.tech>
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
In-Reply-To: <1790796643.8631fc262581453bbf619ec5b2062170.1a0f3cc3da00003f66@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1790838877-CDB4987B-1C25A00F/10/78276251493
X-purgate-type: spam
X-purgate-size: 3926

On 30.09.2026 21:30, Olivier Lambert wrote:
> All Zen or newer CPU which support C3 shares cache. Its not necessary to
> flush the caches in software before entering C3. This will cause drop in
> performance for the cores which share some caches. ARB_DIS is not used
> with current AMD C state implementation. So set related flags correctly.
> 
> Signed-off-by: Deepak Sharma <deepak.sharma@amd.com>

Shouldn't this be mirrored in a From: tag? (I'll try to remember to attribute
the patch that way when committing.)

> Acked-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Origin: https://git.kernel.org/torvalds/p/a8fb40966f19
> [Port to Xen.  Include Hygon.]
> Assisted-by: Claude-Code:claude-opus-5-5
> Signed-off-by: Olivier Lambert <olivier.lambert@vates.tech>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Why the RFC, btw?

> ---
> 
> Notes:
>     Changes in v2:
>      - Resend with git send-email: my mail client stripped the whitespace from
>        v1, so its diff could not be applied.  No code change.
>      - Picked up Jason's Reviewed-by.
>     
>     Found on XCP-ng 8.3 (Xen 4.17.6) on a Ryzen 5 7600 (Zen 4, family 0x19)
>     whose _CST lists C1 (HLT) plus C2 and C3 as SYSIO states (C3 exit
>     latency 350us).  With bm_check == 0, every C3 entry executes WBINVD.
>     
>     Measured under a VM-to-VM network load, in 25s windows:
>      - ~140 WBINVD/s, 65-69us each on average, 300us at worst.
>      - Spinning on each CPU in turn with IRQs off and reading the TSC shows
>        gaps of up to 222us; none with this change.  The SMI count (PMC event
>        0x2b, validated by counting cycles on the same counter) stayed at 0,
>        and NMIs didn't line up with the gaps.
>      - credit1's do_schedule() occasionally took up to 262us, with IRQs
>        off; at most 4.4us with this change.
>      - xenpm set-max-cstate 1 removes the stalls too, which points at C3
>        entry.
>     
>     This change was booted and measured as a backport on 4.17.6 only.  On
>     staging it is build-tested.  It also covers Hygon, as Linux does today
>     through X86_FEATURE_ZEN; the original Linux commit was AMD-only.
>     
>     This will conflict trivially with Alejandro's pending "x86/acpi: Migrate
>     vendor checks to cpu_vendor()"; happy to rebase on top of it.
>     
>     Possibly a backport candidate.

Perhaps, yes.

> --- a/xen/arch/x86/acpi/cpu_idle.c
> +++ b/xen/arch/x86/acpi/cpu_idle.c
> @@ -1065,6 +1065,24 @@ static void acpi_processor_power_init_bm_check(struct acpi_processor_flags *flag
>       */
>      if ( c->vendor == X86_VENDOR_INTEL )
>          flags->bm_control = 0;
> +
> +    if ( (c->vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) &&
> +         c->family >= 0x17 )
> +    {
> +        /*
> +         * For all AMD Zen or newer CPUs that support C3, caches
> +         * should not be flushed by software while entering C3
> +         * type state. Set bm_check to 1 so that Xen doesn't
> +         * need to execute cache flush operation.
> +         */
> +        flags->bm_check = 1;
> +        /*
> +         * In current AMD C state implementation ARB_DIS is no longer
> +         * used. So set bm_control to zero to indicate ARB_DIS is not
> +         * required while entering C3 type state.
> +         */
> +        flags->bm_control = 0;
> +    }
>  }

Linux also deals with modern Centaur (VIA) and Zhaoxin (Shanghai) CPUs.
We will want to mirror that too, provided we want to continue this
mirroring. Alternatively we could have Linux'es xen-acpi-processor
driver invoke acpi_processor_power_init_bm_check() before passing up
C-state info. That would imo be better overall, with one downside: Non-
Linux Dom0-s would then need to follow suit.

Jan

