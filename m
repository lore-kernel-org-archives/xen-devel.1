Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 479C7C982E6
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 15:26:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427665.1650469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8ful-0002Lk-UY; Mon, 21 Sep 2026 15:26:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427665.1650469; Mon, 21 Sep 2026 15:26:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8ful-0002Ld-RV; Mon, 21 Sep 2026 15:26:43 +0000
Received: by outflank-mailman (input) for mailman id 1427665;
 Mon, 21 Sep 2026 15:26:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x8ful-0002LX-8h
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 15:26:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8fuk-002qWR-Lu
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 17:26:42 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab14ca3-bab6-0a2a0a5309dd-0a2a45078188-18
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 17:26:42 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab14cb2-b4ea-0a2a45070019-d155dd2ea446-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 17:26:42 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-48586861639so4460f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 08:26:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-487244608a3sm22580081f8f.8.2026.09.21.08.26.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 08:26:41 -0700 (PDT)
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
        d=suse.com; s=google; t=1790004402; x=1790609202; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DdX4buUzE3yjIfRsl+nmkTj/01kjnaaILXJBm0HCW1E=;
        b=beMWcwYO5I/DfFnlfsSk1j7uzhYIepA6hUYZR7AsM7CV/SdTXf9+VOFyP5pEs+kqVv
         cNfWjLMUj0r21OUBeBUJy6WK3qWB1qE6jWuDYB0z59FL5GVZXbwhJxs8sAyWDqVa7e3M
         gYNDZzxOZrAn8Bep5uX7msqqcXll07U12GRMk6jP51MxR8gaQtDYJX9v98hnYv+A3R1v
         oljIaZEtik84UMQVtBFBXa+MCCBJ1Q65v2m5zUR9VR785Mv1hOig2vWADmvp0ijmUYAZ
         +GGNUPy9RNSBglieXLWyhQtccXFXsqlwiAKcss1PaDfIUzhbCHcioHHyhp/k1wOvd1Xq
         YguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004402; x=1790609202;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DdX4buUzE3yjIfRsl+nmkTj/01kjnaaILXJBm0HCW1E=;
        b=vXZ2XqmUcQ2IwOJ38wdm3DZLWcTEVXsJB0pGXL6qE7hZ+uA++nfKswd1TZfWKKPAwg
         a996ccqXttQCfPx6G8XiyQ79JgZ5ggi3I3RK4J46LCQseWrXJGpDcg9Ek+p2Ym29DkCU
         Aqg30TP2A/m9V7UnpHBMDeLqtwTfSoY/bWc+7ckELwUWEozUDWpdj3sjJj6P0JDPO4CL
         eRDf0Cc8URv3nZZtZYQbtn6vjhcTXLN+8Yx/1eoeFQKKDzSsBuNvyJ1oKh5g11BFO0Hx
         uJZsac+zY0oypF+qcsiJxJT4VCbdrNC2vXMT6D3WdQLfnJc9WXZfoGSCOL/58WqjyTi2
         h+ug==
X-Gm-Message-State: AFuF++k6has4capiCvwHKl4ryE6TBObPtEHeTGR8SHLxbJhlkLScngdv
	lWnvdmGqzTf6miEZ4HnYVX6ZXckffhZhn2kR1RMlliArUjpk8rTqrjco7tWfjzkR2w==
X-Gm-Gg: AYBFou3KcckqqCzuqL1bZs1ttJAhuOuYWKhAFcFTI91OuY82JcVuIzC73ppPyJ08u2C
	TzjUrSrcdcqq7k4tN4bv/IpOxrBzdyO6cA2nOvckb3y0wGQekw9IVVvisRoTcJnFR/3budAViyp
	wr24ld6zrCuArSS+ob7BbfEk9J9IyyI8Z3VgOJguFnb+pgrTTA8ZTFGvisMSZuh9uM15bRkHhW+
	EZXYH+Rj75RTvf1hHDYFKS/6i0KhAAaTIcy9kvCdq/M8XXXg400qMNrrhHJZMJcruC1PCLpXLyp
	blzvDiAExbGJjUhB5d7jMD/I5HDhMFW4nKarTL9C2j/XxeKUOKGmUKK/kY+FwZCTDGIJjAiL0UX
	hls4bMp9szHS2nPks71NHaKyuExfFoSJhZyz8Yuf1VozmKx4G9z8mEyNCvi+tJh2EXHUY+aUeL2
	OLzI8TSGmjS753couUlr2h+KUhhSaqNMzrZW7VAJ9qtM8QUQli6nK6pqxSHbp8agVJTwoVR+PMf
	k823uyL2Vp0okb7WKvES8e4NMOYva37w8YerEaNn2IG5XiKLGNM9anPDAHO1A==
X-Received: by 2002:a05:6000:41ce:b0:487:462:d85d with SMTP id ffacd0b85a97d-48713c47239mr22961648f8f.18.1790004401859;
        Mon, 21 Sep 2026 08:26:41 -0700 (PDT)
Message-ID: <450d0c5e-2101-4b1c-98fd-2f438bd0ccf3@suse.com>
Date: Mon, 21 Sep 2026 17:26:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] xen/riscv: fix Svade/Svadu A/D bit handling
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
 <1789032897.8631fc262581453bbf619ec5b2062170.1a08aab9d76000c4f3@vates.tech>
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
In-Reply-To: <1789032897.8631fc262581453bbf619ec5b2062170.1a08aab9d76000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1790004402-368D9AE4-6A015826/0/0
X-purgate-type: clean
X-purgate-size: 10629

On 10.09.2026 11:34, Baptiste Le Duc wrote:
> p2m_set_permission() only presets the PTE A/D bits when the Svade extension
> is present in the device tree. This causes an unhandled page fault when
> neither Svade nor Svadu is present (the platform's actual behaviour is then
> unknown), and when both are present in the device tree.
> 
> Move the Svade/Svadu resolution out of p2m_set_permission() and into a new
> riscv_resolve_ad_scheme(), called once from riscv_fill_hwcap(). For each of
> the four possible Svade/Svadu combinations (inspired by [1]), it decides
> whether software has to preset the A/D bits and, if so, sets
> RISCV_ISA_EXT_svade to record that decision:
> - neither present: assume Svade, since assuming Svade is harmless on real
>   Svadu hardware, while assuming Svadu on real Svade hardware risks an
>   unhandled page fault
> - only Svade present: assume Svade
> - only Svadu present: leave A/D management to hardware
> - both present: Svade wins until Xen supports the SBI FWFT call needed to
>   enable hardware updating of A/D bits, so assume Svade and warn that
>   dropping 'svade' from the DT is the only way to get Svadu.
> 
> [1] https://lwn.net/Articles/980016/
> 
> Fixes: ff14053983b0 ("xen/riscv: Implement p2m_pte_from_mfn() and support PBMT configuration")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> ---
> Changes since v1:
> - change commit title
> - expose RISCV_ISA_EXT_svadu so the two extensions can be told apart.
> - move the Svade/Svadu resolution to a new riscv_resolve_ad_scheme(),
>   called once from riscv_fill_hwcap().
> - expose sbi_probe_extension() (was static) to probe for SBI FWFT.
> - stop presetting A/D bits unconditionally in p2m_set_permission(), do it
>   only when Svade is present.
> ---
>  xen/arch/riscv/cpufeature.c             | 59 +++++++++++++++++++++++++++++++++
>  xen/arch/riscv/include/asm/cpufeature.h |  1 +
>  xen/arch/riscv/include/asm/sbi.h        |  8 +++++
>  xen/arch/riscv/p2m.c                    | 47 ++++++++++----------------
>  4 files changed, 86 insertions(+), 29 deletions(-)
> 
> diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
> index 92235fdfd5..19454544a7 100644
> --- a/xen/arch/riscv/cpufeature.c
> +++ b/xen/arch/riscv/cpufeature.c
> @@ -18,6 +18,7 @@
>  
>  #include <asm/cpufeature.h>
>  #include <asm/csr.h>
> +#include <asm/sbi.h>
>  
>  #ifdef CONFIG_ACPI
>  # error "cpufeature.c functions should be updated to support ACPI"
> @@ -468,6 +469,62 @@ static bool __init has_isa_extensions_property(void)
>      return false;
>  }
>  
> +/*
> + * Svade and Svadu extensions represent two schemes for managing the PTE A/D
> + * bits. When the PTE A/D bits need to be set, the Svade extension indicates
> + * that a page fault will be raised. In contrast, the Svadu extension supports
> + * hardware updating of the PTE A/D bits.
> + *
> + * There are 4 possible combinations of these extensions in the device tree.
> + * The default hardware behavior for each is:
> + *
> + * 1) Neither Svade nor Svadu present in DT => It is technically unknown
> + *    whether the platform uses Svade or Svadu. Xen should be prepared to
> + *    handle either hardware updating of the PTE A/D bits or page faults when
> + *    they need updating. In that case, Xen assumes Svade because it's
> + *    harmless if the platform is actually Svadu, while assuming Svadu on real
> + *    Svade hardware risks an unhandled page fault.
> + *
> + * 2) Only Svade present in DT => Xen must assume Svade to be always enabled.
> + *
> + * 3) Only Svadu present in DT => Xen must assume Svadu to be always enabled.
> + *
> + * 4) Both Svade and Svadu present in DT => Xen must assume Svadu is turned off
> + *    at boot time by setting A/D bits. To use Svadu, the supervisor must
> + *    explicitly enable it using the SBI FWFT extension.
> + *
> + * The Svade extension is mandatory and the Svadu extension is optional in the
> + * RVA23 profile. Platforms wanting to take advantage of Svadu can choose
> + * option 3. Platforms aware of the profile can choose option 4, and Xen won't
> + * get the benefit of Svadu until the SBI FWFT extension is available.
> + *
> + * In other words, hardware manages the A/D bits on its own only in case 3, in
> + * all the other cases software has to preset them. Instead of open coding this
> + * in every A/D bits user, RISCV_ISA_EXT_svade is used to mean "software is
> + * responsible for the A/D bits" and is set here for the cases 1, 2 and 4.
> + */
> +static void __init riscv_resolve_ad_scheme(void)
> +{
> +    bool svade = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade);
> +    bool svadu = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu);
> +
> +    /* Case 3: leave the A/D bits management to hardware. */
> +    if ( svadu && !svade )
> +        return;
> +
> +    /* Case 4 */
> +    if ( svadu && svade ){
> +        if ( !sbi_probe_extension(SBI_EXT_FWFT) ){

Nit (style): Brace placement.

Furthermore this is written in a way which Misra would call "dead code". I'd
like to suggest (leaving out comments):

    if ( svadu )
    {
        if ( !svade )
            return;

        if ( !sbi_probe_extension(SBI_EXT_FWFT) )
            printk(...);
    }


> +          printk(XENLOG_WARNING "RISC-V: Both Svade and Svadu detected, but SBI FWFT is missing.\n"
> +                  "RISC-V: Defaulting to software A/D updates (Svade).\n"
> +                  "RISC-V: To force hardware A/D updates (Svadu), remove 'svade' from DT.\n");

Nit (style): Indentation (in multiple ways). Furthermore XENLOG_* needs
repeating after every newline.

> +        }
> +    }
> +
> +    /* Cases 1, 2: Xen assume Svade to be enabled */
> +    __set_bit(RISCV_ISA_EXT_svade, riscv_isa);

Isn't this a lie (to ourselves) then?

> --- a/xen/arch/riscv/include/asm/sbi.h
> +++ b/xen/arch/riscv/include/asm/sbi.h
> @@ -30,6 +30,7 @@
>  #define SBI_EXT_BASE                    0x10
>  #define SBI_EXT_RFENCE                  0x52464E43
>  #define SBI_EXT_TIME                    0x54494D45
> +#define SBI_EXT_FWFT                    0x46574654
>  
>  /* SBI function IDs for BASE extension */
>  #define SBI_EXT_BASE_GET_SPEC_VERSION   0x0
> @@ -138,6 +139,13 @@ int sbi_remote_hfence_gvma(const cpumask_t *cpu_mask, vaddr_t start,
>  int sbi_remote_hfence_gvma_vmid(const cpumask_t *cpu_mask, vaddr_t start,
>                                  size_t size, unsigned long vmid);
>  
> +/**
> + * Check if an SBI extension ID is supported or not.
> + * @extid: The extension ID to be probed.
> + *
> + * @return: 1 or an extension specific nonzero value if yes, 0 otherwise.
> + */
> +int sbi_probe_extension(long extid);
>  /*

Nit (style): Also add a blank line.

> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -586,42 +586,31 @@ static inline void p2m_clean_pte(pte_t *p, bool clean_cache)
>  
>  static void p2m_set_permission(pte_t *e, p2m_type_t t)
>  {
> +    bool svade = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade);
> +    bool svadu = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu);
> +
>      e->pte &= ~PTE_ACCESS_MASK;
>  
>      e->pte |= PTE_USER;
>  
>      /*
> -     * Two schemes to manage the A and D bits are defined:
> -     *   • The Svade extension: when a virtual page is accessed and the A bit
> -     *     is clear, or is written and the D bit is clear, a page-fault
> -     *     exception is raised.
> -     *   • When the Svade extension is not implemented, the following scheme
> -     *     applies.
> -     *     When a virtual page is accessed and the A bit is clear, the PTE is
> -     *     updated to set the A bit. When the virtual page is written and the
> -     *     D bit is clear, the PTE is updated to set the D bit. When G-stage
> -     *     address translation is in use and is not Bare, the G-stage virtual
> -     *     pages may be accessed or written by implicit accesses to VS-level
> -     *     memory management data structures, such as page tables.
> -     * Thereby to avoid a page-fault in case of Svade is available, it is
> -     * necessary to set A and D bits.
> -     *
> -     * TODO: For now, it’s fine to simply set the A/D bits, since OpenSBI
> -     *       delegates page faults to a lower privilege mode and so OpenSBI
> -     *       isn't expect to handle page-faults occured in lower modes.
> -     *       By setting the A/D bits here, page faults that would otherwise
> -     *       be generated due to unset A/D bits will not occur in Xen.
> -     *
> -     *       Currently, Xen on RISC-V does not make use of the information
> -     *       that could be obtained from handling such page faults, which
> -     *       could otherwise be useful for several use cases such as demand
> -     *       paging, cache-flushing optimizations, memory access tracking,etc.
> +     * riscv_fill_hwcap() sets either RISCV_ISA_EXT_svade or
> +     * RISCV_ISA_EXT_svadu (mutually exclusive) depending on the Svade/Svadu
> +     * device tree combination (see riscv_resolve_ad_scheme()):
> +     * - RISCV_ISA_EXT_svade means that software is responsible for the A/D
> +     *   bits.
> +     * - RISCV_ISA_EXT_svadu means the hardware is responsible for the A/D
> +     *   bits.
>       *
> -     *       To support the more general case and the optimizations mentioned
> -     *       above, it would be better to stop setting the A/D bits here and
> -     *       instead handle page faults that occur due to unset A/D bits.
> +     * Currently, when RISCV_ISA_EXT_svade is set, Xen doesn't track A/D
> +     * bits, so it does not make use of the information that could be
> +     * obtained from handling the resulting page faults, which could
> +     * otherwise be useful for several use cases such as demand paging,
> +     * cache-flushing optimizations, memory access tracking, etc. To avoid
> +     * such a page fault, Xen presets the A and D bits instead.
>       */
> -    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
> +    ASSERT(svade != svadu); /* exactly one of svade/svadu must be set by riscv_fill_hwcap() */

Here I'm lost: riscv_resolve_ad_scheme() specifically handles the "both set"
case. How can you then assert that exactly one of them is set?

Apart from this the line is also too long and the comment doesn't match our
style.

Jan

