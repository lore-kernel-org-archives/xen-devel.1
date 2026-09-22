Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A4DC982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 15:29:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429158.1652089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x92R2-000327-PH; Tue, 22 Sep 2026 15:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429158.1652089; Tue, 22 Sep 2026 15:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x92R2-000320-MV; Tue, 22 Sep 2026 15:29:32 +0000
Received: by outflank-mailman (input) for mailman id 1429158;
 Tue, 22 Sep 2026 15:29:31 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x92R0-00031n-SJ
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 15:29:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x92Qz-00Aotb-KT
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 17:29:29 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab29ecf-8faa-0a2a0a5109dd-0a2a4501e7c2-36
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 17:29:29 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab29ed9-5984-0a2a45010019-4a7de18ced81-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 17:29:29 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b912e4ad9so25497845e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 08:29:29 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fddfd158bsm2148465e9.6.2026.09.22.08.29.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 08:29:27 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790090969; x=1790695769; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8PGtmnDxBnGxAZeoBuBu672Y7HTrakHFY0FKpHr3+Vc=;
        b=gv4RdlwFnxdqM9Zd5iM6XmWS8aKHl7xGNmCDaWGfYXrbY1pKva+uuLZy3mhJi+X1y7
         NdnvvTlDD1q4zb8xIfkBbIYhLgSAhoySYxsSwgghJyp6h5zzTxrqRgheA7exJJooP+aa
         lXO/FvHb563JCOPjCZ80+QnAo/fkmqa02KzhC6eNF6V2Mb1Y5+WJKCW9mMh+tARLOmFE
         iJUxh5MtFE8FTJw4Gr0QDuk7MKQvkmXbKd9ndTDbodtMAZFKjH79+IpHHCfWakAJ4EOV
         rbk7Wv9JlsRffAtoiHou1q7YfEPZBg+ghcxZhykRkZ2t3EFxHmcAqrlh1q7H62ua+uDX
         W/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790090969; x=1790695769;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8PGtmnDxBnGxAZeoBuBu672Y7HTrakHFY0FKpHr3+Vc=;
        b=JxDQR8ZkU3kpaFCnIb8cTFdPdkUZsLyOmD5Z0x1/TSRssnm6XhISMUHN+Hr1T+mZrU
         Fv1gQvhjY65a5qrTY8iEUfoiMFLkZvYWQE1wKnpXjQle+JDDUHhK2gupLD9H0NM6taRj
         F77gJxy/SU2lTA9OfTm+rmcRFWo65fItZdrPMs3MlNS83581ISqp8/DtzZ0nbeCARcES
         oIVohWpyNflDKMMWoLmd4N4ibwoMFTzxwl0SaS6yE2HqD1EG43oNYHJf9ow+BFqCfuv2
         TfW7DAoijOno3v0c2BPw5D6xk73CU5xjgy5DnxQi3Gyo0ChP2JaDRN96WCo2a2bV0x3X
         qa4Q==
X-Gm-Message-State: AFuF++nYoIA32dYDkKBV2I9RY3ErR21qd7MMqcG0PCDwxpffIAASHYiX
	AC8YaPsLtebVDHHhkfvfo0eDLDFoR4s5Hf6CH1+ny+Wsd6QN4/7d3CPP
X-Gm-Gg: AYBFou0FSvrB54F0UDh0gZ2vdim5hj5ZCTeQom0mhDMW+Aydp7uYXek9pn6AWFNc6q+
	yUeCendZC1BI8KtuYJ94d8ZxgB5VdhH2XRNY2VGccPeH5V1B1rlrmGvrEch+MdLVDSRbcHlhCSK
	GvlRu/v/mU//eos/203UbeJ2oLfChfum9JMq3F/VtMVCq4Ede8mlOj/HK+CgJBpOdv+SYq4d1ju
	p5rDjCHvlB91YlpN6AXwTv5nh+iE3Cx8BL8UD0/O5N2FslO3ZNLulZOGEzv7RBs6FRnVo6agVyn
	/yvBfr0yhVMxAwmYh527hRSPLrIhsJJL0D8jqvI7H+sDG2U99y7wvmjNeFeixIWaICaTl2MFLAD
	NxpKm5LKacqaU0Lmo3oVsuqecr/2KcjsnqR7lVA4jw2jGR8TBmyfbl/E6Onp1/fUW01/ueVA3LX
	lStET9b8UZiRmuJSFYie2KwAhNV5KKo3H0YKILkWEg1MlNdsibQIzdemuCabUtEU9RPLGZdHM/H
	BYxsYZlz3BTe597tpr/bjlde+/Pjsh0C1o=
X-Received: by 2002:a05:600d:6409:20b0:49f:cbad:eef7 with SMTP id 5b1f17b1804b1-49fcbadef22mr123063165e9.33.1790090967939;
        Tue, 22 Sep 2026 08:29:27 -0700 (PDT)
Message-ID: <ab528209-4a06-4f30-8cd7-af54c7c33e4c@gmail.com>
Date: Tue, 22 Sep 2026 17:29:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] xen/riscv: fix Svade/Svadu A/D bit handling
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
References: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
 <1789032897.8631fc262581453bbf619ec5b2062170.1a08aab9d76000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1789032897.8631fc262581453bbf619ec5b2062170.1a08aab9d76000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1790090969-1FE68757-A0BBB646/10/73395122804
X-purgate-type: spam
X-purgate-size: 13512



On 9/10/26 11:34 AM, Baptiste Le Duc wrote:
> p2m_set_permission() only presets the PTE A/D bits when the Svade extension
> is present in the device tree. This causes an unhandled page fault when
> neither Svade nor Svadu is present (the platform's actual behaviour is then
> unknown), and when both are present in the device tree.

When both are present, RISCV_ISA_EXT_svade is set, so the current code 
does preset the A/D bits and no fault happens. The only broken case is 
when neither extension is present, so shouldn't "both present" be dropped?

> 
> Move the Svade/Svadu resolution out of p2m_set_permission() and into a new
> riscv_resolve_ad_scheme(), called once from riscv_fill_hwcap(). For each of
> the four possible Svade/Svadu combinations (inspired by [1]), it decides
> whether software has to preset the A/D bits and, if so, sets
> RISCV_ISA_EXT_svade to record that decision:
> - neither present: assume Svade, since assuming Svade is harmless on real
>    Svadu hardware, while assuming Svadu on real Svade hardware risks an
>    unhandled page fault
> - only Svade present: assume Svade
> - only Svadu present: leave A/D management to hardware
> - both present: Svade wins until Xen supports the SBI FWFT call needed to
>    enable hardware updating of A/D bits, so assume Svade and warn that
>    dropping 'svade' from the DT is the only way to get Svadu.
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
>    called once from riscv_fill_hwcap().
> - expose sbi_probe_extension() (was static) to probe for SBI FWFT.

sbi_probe_extension() is already non-static in staging, only the prototype
is missing. What base is this patch against?

> - stop presetting A/D bits unconditionally in p2m_set_permission(), do it
>    only when Svade is present.

What is the gain from not presetting them? Presetting A/D is correct 
with both Svade and Svadu: with Svadu it just saves the hardware an 
atomic PTE update on first access. Xen doesn't consume G-stage A/D bits 
(no dirty tracking, no demand paging), and pt.c already presets A/D 
unconditionally for Xen's own mappings. Always setting PTE_ACCESSED | 
PTE_DIRTY in p2m_set_permission() fixes the bug in one line, with no 
need for the resolver, the new ISA bit, FWFT probing or the ASSERT. 
Handling A/D differently only makes sense once Xen actually wants that 
information, and at that point FWFT support and a fault handler are 
needed anyway.

> ---
>   xen/arch/riscv/cpufeature.c             | 59 +++++++++++++++++++++++++++++++++
>   xen/arch/riscv/include/asm/cpufeature.h |  1 +
>   xen/arch/riscv/include/asm/sbi.h        |  8 +++++
>   xen/arch/riscv/p2m.c                    | 47 ++++++++++----------------
>   4 files changed, 86 insertions(+), 29 deletions(-)
> 
> diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
> index 92235fdfd5..19454544a7 100644
> --- a/xen/arch/riscv/cpufeature.c
> +++ b/xen/arch/riscv/cpufeature.c
> @@ -18,6 +18,7 @@
>   
>   #include <asm/cpufeature.h>
>   #include <asm/csr.h>
> +#include <asm/sbi.h>
>   
>   #ifdef CONFIG_ACPI
>   # error "cpufeature.c functions should be updated to support ACPI"
> @@ -468,6 +469,62 @@ static bool __init has_isa_extensions_property(void)
>       return false;
>   }
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

svadu is always false here: the patch doesn't add 
RISCV_ISA_EXT_ENTRY(svadu, NONE) to riscv_isa_ext[], so match_isa_ext()
never sets this bit. Cases 3 and 4 are dead code. Am I missing something?

> +
> +    /* Case 3: leave the A/D bits management to hardware. */
> +    if ( svadu && !svade )
> +        return;
> +
> +    /* Case 4 */
> +    if ( svadu && svade ){
> +        if ( !sbi_probe_extension(SBI_EXT_FWFT) ){
> +          printk(XENLOG_WARNING "RISC-V: Both Svade and Svadu detected, but SBI FWFT is missing.\n"
> +                  "RISC-V: Defaulting to software A/D updates (Svade).\n"
> +                  "RISC-V: To force hardware A/D updates (Svadu), remove 'svade' from DT.\n");
> +        }
> +    }

sbi_probe_extension() returns a negative errno on SBI failure, so
!sbi_probe_extension() is false in that case and an error is treated as
"FWFT present". The existing callers check "> 0", so this should be
"<= 0".

> +
> +    /* Cases 1, 2: Xen assume Svade to be enabled */

s/assume/assumes.

> +    __set_bit(RISCV_ISA_EXT_svade, riscv_isa);

In case 4 RISCV_ISA_EXT_svadu stays set, so both bits are set and the
ASSERT() in p2m_set_permission() fires (once svadu is actually parsed).
This contradicts the "mutually exclusive" statement there.

> +}
> +
>   bool riscv_isa_extension_available(const unsigned long *isa_bitmap,
>                                      enum riscv_isa_ext_id id)
>   {
> @@ -513,6 +570,8 @@ void __init riscv_fill_hwcap(void)
>           __set_bit(RISCV_ISA_EXT_sstc, riscv_isa);
>       }
>   
> +    riscv_resolve_ad_scheme();
> +
>       for ( i = 0; i < req_extns_amount; i++ )
>       {
>           const struct riscv_isa_ext_data ext = required_extensions[i];
> diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
> index 0c48d57a03..74200ce7c9 100644
> --- a/xen/arch/riscv/include/asm/cpufeature.h
> +++ b/xen/arch/riscv/include/asm/cpufeature.h
> @@ -41,6 +41,7 @@ enum riscv_isa_ext_id {
>       RISCV_ISA_EXT_sstc,
>       RISCV_ISA_EXT_svade,
>       RISCV_ISA_EXT_svpbmt,
> +    RISCV_ISA_EXT_svadu,

Please keep the same order as riscv_isa_ext[], i.e. between svade and
svpbmt, and add the matching riscv_isa_ext[] entry there as well.

>       RISCV_ISA_EXT_MAX
>   };
>   
> diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
> index 1952868e96..4f13e8c7a0 100644
> --- a/xen/arch/riscv/include/asm/sbi.h
> +++ b/xen/arch/riscv/include/asm/sbi.h
> @@ -30,6 +30,7 @@
>   #define SBI_EXT_BASE                    0x10
>   #define SBI_EXT_RFENCE                  0x52464E43
>   #define SBI_EXT_TIME                    0x54494D45
> +#define SBI_EXT_FWFT                    0x46574654
>   
>   /* SBI function IDs for BASE extension */
>   #define SBI_EXT_BASE_GET_SPEC_VERSION   0x0
> @@ -138,6 +139,13 @@ int sbi_remote_hfence_gvma(const cpumask_t *cpu_mask, vaddr_t start,
>   int sbi_remote_hfence_gvma_vmid(const cpumask_t *cpu_mask, vaddr_t start,
>                                   size_t size, unsigned long vmid);
>   
> +/**
> + * Check if an SBI extension ID is supported or not.
> + * @extid: The extension ID to be probed.
> + *
> + * @return: 1 or an extension specific nonzero value if yes, 0 otherwise.
> + */

This is incorrect: on failure the function returns a negative errno, not
0. Also, the rest of the file uses /* */ and not kernel-doc /**.

> +int sbi_probe_extension(long extid);

A blank line is missing before the next comment block.

>   /*
>    * Initialize SBI library
>    *
> diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
> index 1cea86512c..22ad4a2aee 100644
> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -586,42 +586,31 @@ static inline void p2m_clean_pte(pte_t *p, bool clean_cache)
>   
>   static void p2m_set_permission(pte_t *e, p2m_type_t t)
>   {
> +    bool svade = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade);
> +    bool svadu = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu);

This runs for every p2m PTE. The second test_bit() exists only for the
ASSERT().

> +
>       e->pte &= ~PTE_ACCESS_MASK;
>   
>       e->pte |= PTE_USER;
>   
>       /*
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

This isn't true, see the comment on riscv_resolve_ad_scheme(): in case 4 
both bits end up set.

> +     * - RISCV_ISA_EXT_svade means that software is responsible for the A/D
> +     *   bits.
> +     * - RISCV_ISA_EXT_svadu means the hardware is responsible for the A/D
> +     *   bits.
>        *
> -     *       To support the more general case and the optimizations mentioned
> -     *       above, it would be better to stop setting the A/D bits here and
> -     *       instead handle page faults that occur due to unset A/D bits.
> +     * Currently, when RISCV_ISA_EXT_svade is set, Xen doesn't track A/D
> +     * bits, so it does not make use of the information that could be
> +     * obtained from handling the resulting page faults, which could
> +     * otherwise be useful for several use cases such as demand paging,
> +     * cache-flushing optimizations, memory access tracking, etc. To avoid
> +     * such a page fault, Xen presets the A and D bits instead.
>        */
> -    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
> +    ASSERT(svade != svadu); /* exactly one of svade/svadu must be set by riscv_fill_hwcap() */

The line is over 80 columns, and the trailing comment just repeats the 
block comment above.

> +    if ( svade )
>           e->pte |= PTE_ACCESSED | PTE_DIRTY;
>   
>       switch ( t )
> 

~ Oleksii


