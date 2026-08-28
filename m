Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1093C61DCB
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 15:58:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1402203.1637528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzyyA-00069O-Qe; Fri, 28 Aug 2026 15:58:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1402203.1637528; Fri, 28 Aug 2026 15:58:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzyyA-00069H-O1; Fri, 28 Aug 2026 15:58:18 +0000
Received: by outflank-mailman (input) for mailman id 1402203;
 Fri, 28 Aug 2026 15:58:17 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzyy9-000686-98
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 15:58:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzyy8-007oM7-M3
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 17:58:16 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a91b00e-2eae-0a2a0a5409dd-0a2a4503b0d4-6
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 17:58:16 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a91b018-fae8-0a2a45030019-d155802ee45e-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 17:58:16 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-49cca4ffdcfso687965e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 08:58:16 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b468009f8sm137344905e9.0.2026.08.28.08.58.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2026 08:58:15 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787932696; x=1788537496; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L8gBF7uQwy8abryU7XLAGNsW8Qs7n9iHctdipMKdDew=;
        b=m6LiT0vIX0YfSiY5Ltlk2CUOeWlRRBl/ZX13BIafuY+sQd0kKhOR5Y1JKqzzHdNmNH
         nNzInEm/dKpz/QJBdcHydHcE5KypNqQJ3aWS+4iKqtDxgNufUV9Dy5NPb+6F2n9ma26V
         BxHpT7eFGXRpofnJChTzDkrDLQ0rnvKBpKxISzMscf/ys0AiDna/KibQ9dMX/zeR3jUp
         m3IUv5qYa/SPIIiuxHH3cGtxyP7tQrVf0pssM2Cqvx+HKjk51o7Q/BE/VltlgjWLUQq3
         x49G2fqNh16JRVpRuEQnaCqpKvJ+fOge6RR8y0Jm3uxO9/pgwn9HGxQ9juXVFvIrjLZy
         Xg6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787932696; x=1788537496;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L8gBF7uQwy8abryU7XLAGNsW8Qs7n9iHctdipMKdDew=;
        b=iTzjO84arppu6t5Ry7myajiXMtE+Gc+Wmhhs74T2vvdZvbWMrZSOKbCg9ymG84TK7x
         62T70r/1MYBYm/CS6b3RLNgTGwun0BzIqnJGTspLBLSZ/YjMQBEhy2CYfLSR7EdIegdm
         vkYl0Xpb5jOHdIjkZ5MQauG07k2hUpChwQNXwRgA8sJ+ykXWGzQQ2aFwtKEAAeWY2LtG
         XookEXOB5SnPR5yBzJHdSbaJ0N4JJ/j8r5hk6SmzFgm3hJ+FFeuPpt6szVCsrUo3HhHP
         yvusWCwqXISXkRIkOeZR6OUPg7i9hl1L2x4k9bv2sWCQIumMX38fl5vy3TuO90pgHH4L
         BCsg==
X-Forwarded-Encrypted: i=1; AHgh+Rp2wliJTr0W6ZJNvnsVJ78gcj+I/CJIfw6PNKbFhldOswKSa3SGETgfShasm3pk8JSK118EOqmocsc=@lists.xenproject.org
X-Gm-Message-State: AFuF++nYMa42SbmzRG+EyfV4K3dy+tza307UnwalintjLjLwVWOhkhzI
	1JnmsDMm1D2ZwVRMNZiVVDZnzvWk5OBIKrcKIQIjnCVQXAzsi5HE6T0S
X-Gm-Gg: AR+sD11ZF33mp+guSUxCYHeT/O3sZTyfFluV+8vtnXMSuRIq0vh/QPoisAR6Dhx/4Se
	1yeNU1NYY4fGbOn+Dbb3n695GD8JcOKGBAUba91ymNTUoPKbF8lDrRA0aVRsadjIqHYbuw9omfV
	ZSVOEWqOVz6pDTHX9O/xoxu3zJ/ke/S3tLsVRiHsAkmBSLtKGru+PpsT8g/jGUcKvz8SP5PZxLJ
	peYWtdx2ukSWKeJ6vi1siaMKFt0WWQR7HdHk0OqkUnUAq880MY/3cjs0EW5VQwjXf4TaPtewsiO
	Ru6U7+JehLX4UQdy6K235sxNzXGx74yYLK+w5HBZBcFtHM7pJwv5gbGLM/OATBZ5b6w9HMsyE0k
	SEblVtufgGvPPdamavLa5mXiC14jMc5T1GQyKLuiKpYTFJuMq2pNGPTrfvGMaCX9Uz4QqdxeW6R
	AqTcfysBXuADBXDjNNhEVLPZF6B4VoG2QqLevDzqGLvWYOC/LacvoHucJBZcx3nEvSwlUUxlNgx
	QZZE41adsqFyuMOio9UTnH/dZ9GZIosNRuZegVWkA==
X-Received: by 2002:a05:600c:a02:b0:499:da8b:1476 with SMTP id 5b1f17b1804b1-49b91c52579mr101887535e9.14.1787932695547;
        Fri, 28 Aug 2026 08:58:15 -0700 (PDT)
Message-ID: <59555237-425d-47f0-80b6-b7273cc8d6ec@gmail.com>
Date: Fri, 28 Aug 2026 17:58:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] xen/riscv: make Svpbmt no longer a required extension
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: zhangzheng@iscas.ac.cn, Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <1787844438.8631fc262581453bbf619ec5b2062170.1a043d52a06000c4f3@vates.tech>
 <1787844809.8631fc262581453bbf619ec5b2062170.1a043dad34e000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1787844809.8631fc262581453bbf619ec5b2062170.1a043dad34e000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1787932696-6CCDB4E9-BA72E400/10/73395122804
X-purgate-type: spam
X-purgate-size: 7590



On 8/27/26 5:33 PM, Baptiste Le Duc wrote:
> required_extensions[] panics at boot if Svpbmt is missing, which is a
> problem on hardware that doesn't implement it.

Based only on this sentence it isn't clear why it is safe to have SvPBMT 
= n and what guarantees that if some memory for a device dma for example 
should be non-cachable and strongly ordered what will guarantee that.

So basically something like that should be added to the commit message:
```
Without the Svpbmt extension, memory attributes (such as cacheability 
and ordering) are strictly tied to physical address ranges and enforced 
by the hardware's Physical Memory Attributes (PMA) checker.

In this configuration, supervisor software relies on the platform's 
memory map: peripheral device registers (MMIO) are physically mapped 
into hardware-defined I/O regions (which are implicitly non-cacheable 
and strongly-ordered), while regular RAM is mapped as cacheable main 
memory.

S-mode paging can safely map these physical ranges without specifying 
page-based memory types in the PTEs, as the hardware MMU and PMA 
pipeline will correctly bypass caches for MMIO accesses based on the 
target physical address. Furthermore, on platforms that either feature 
fully hardware-coherent DMA or do not expose non-coherent DMA agents to 
the OS, page-level programmatic cache control via Svpbmt is not 
required, making it safe to boot and run when Svpbmt is absent.
```

  Xen already checks Svpbmt at
> runtime in some places (vcpu_csr_init()), but not everywhere:

This part sounds like there are additional places where you think the 
Svpbmt related bits should be set but I don’t see in this patch (or in 
others in this patch series_ where you are adding Svpbmt related bits to 
places where they weren’t added before. Am I missing something or did I 
misunderstand your message? If the latter then could you please re-word 
this part of the sentence.

> p2m_pte_from_mfn() and the PAGE_HYPERVISOR_NOCACHE/WC macros still set the
> raw PTE_PBMT* encoding unconditionally.
> 
> Drop Svpbmt from required_extensions, and introduce pte_pbmt(), which masks
> the requested PBMT encoding down to 0 when Svpbmt is unavailable, using it
> in both remaining unguarded spots.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> ---
>   xen/arch/riscv/cpufeature.c       | 1 -
>   xen/arch/riscv/include/asm/page.h | 8 ++++++--
>   xen/arch/riscv/p2m.c              | 2 +-
>   3 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
> index 92235fdfd5..900cb9d772 100644
> --- a/xen/arch/riscv/cpufeature.c
> +++ b/xen/arch/riscv/cpufeature.c
> @@ -157,7 +157,6 @@ static const struct riscv_isa_ext_data __initconst required_extensions[] = {
>       RISCV_ISA_EXT_DATA(zifencei),
>       RISCV_ISA_EXT_DATA(zihintpause),
>       RISCV_ISA_EXT_DATA(zbb),
> -    RISCV_ISA_EXT_DATA(svpbmt),
>   };

Also, please update docs/misc/riscv/booting.txt.

>   
>   static bool __init is_lowercase_extension_name(const char *str)
> diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
> index 5c02f64a17..6a3749526d 100644
> --- a/xen/arch/riscv/include/asm/page.h
> +++ b/xen/arch/riscv/include/asm/page.h
> @@ -11,6 +11,7 @@
>   #include <xen/types.h>
>   
>   #include <asm/atomic.h>
> +#include <asm/cpufeature.h>
>   #include <asm/page-bits.h>
>   
>   #define VPN_MASK                    (PAGETABLE_ENTRIES - 1UL)
> @@ -54,6 +55,9 @@
>   #define PAGE_HYPERVISOR_RX          (PTE_LEAF_DEFAULT | PTE_EXECUTABLE)
>   
>   #define PAGE_HYPERVISOR             PAGE_HYPERVISOR_RW
> +
> +#define pte_pbmt(pbmt) \
> +    (riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svpbmt) ? (pbmt) : 0UL)

Checking the ISA string alone isn't sufficient.

Svpbmt in HS-mode is gated by menvcfg.PBMTE. If M-mode firmware hasn't 
set it, the hardware behaves as though Svpbmt were not implemented: bits 
[62:61] become reserved again, and a non-zero encoding raises a page 
fault (even though the DT ISA string advertises svpbmt). The same 
applies to the G-stage mappings built by p2m_pte_from_mfn() below.

menvcfg isn't readable from S-mode, but the spec gives an indirect 
probe: when menvcfg.PBMTE is 0, henvcfg.PBMTE is read-only zero. Xen 
already relies on exactly this in vcpu_csr_init() (ENVCFG_PBMTE & 
csr_masks.henvcfg). So it would be more robust to compute a single flag 
in init_csr_masks():

pbmt_enabled = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svpbmt) 
&& (csr_masks.henvcfg & ENVCFG_PBMTE);

and have pte_pbmt() test that instead. This makes the check reflect what 
the hardware will actually honour rather than what the DT claims, and it 
also collapses the condition in vcpu_csr_init() to a single test.

 > +
 > +#define pte_pbmt(pbmt) \
 > +    (riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svpbmt) ? 
(pbmt) : 0UL)

PAGE_HYPERVISOR_NOCACHE / PAGE_HYPERVISOR_WC are no longer constant 
expressions, they are now evaluated at each use site. riscv_fill_hwcap() 
runs fairly late in start_xen(), after setup_fixmap_mappings(), 
early_fdt_map() and setup_mm(). All current ioremap() callers (aplic.c, 
kernel.c) run after it, so the code is correct today, but this is an 
implicit dependency: any ioremap introduced earlier in boot would 
silently get PBMT=0 with no diagnostic. I don't know honestly speaking 
if it is a real issue.

Worth either documenting this with a comment next to pte_pbmt(), or 
adding an ASSERT() on the initialisation state. Switching to the 
__ro_after_init flag suggested above makes the dependency explicit, 
since the flag can be set alongside csr_masks, which is also populated 
after riscv_fill_hwcap().

 > +
 > +#define pte_pbmt(pbmt) \
 > +    (riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svpbmt) ? 
(pbmt) : 0UL)

pte_pbmt(pbmt) reads like a PTE accessor, i.e. something with the 
signature pte_pbmt(pte) -> enum pbmt_type, especially given that enum 
pbmt_type is declared just below in the same header. What it actually 
does is convert a requested PBMT encoding into the encoding that may 
safely be written to a PTE on this hardware.

Something like PTE_PBMT() (matching the PTE_* naming of the values it 
takes) or pbmt_encoding() would convey that better.

~ Oleksii

>   /*
>    * PAGE_HYPERVISOR_NOCACHE is used for ioremap().
>    *
> @@ -61,8 +65,8 @@
>    * is that IO is non-idempotent and strongly ordered, which makes it a good
>    * candidate for mapping IOMEM.
>    */
> -#define PAGE_HYPERVISOR_NOCACHE     (PAGE_HYPERVISOR_RW | PTE_PBMT_IO)
> -#define PAGE_HYPERVISOR_WC          (PAGE_HYPERVISOR_RW | PTE_PBMT_NOCACHE)
> +#define PAGE_HYPERVISOR_NOCACHE     (PAGE_HYPERVISOR_RW | pte_pbmt(PTE_PBMT_IO))
> +#define PAGE_HYPERVISOR_WC          (PAGE_HYPERVISOR_RW | pte_pbmt(PTE_PBMT_NOCACHE))
>   
>   /*
>    * The PTE format does not contain the following bits within itself;
> diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
> index 11dc289f0f..f6e635ec1d 100644
> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -683,7 +683,7 @@ static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t,
>           switch ( t )
>           {
>           case p2m_mmio_direct_io:
> -            e.pte |= PTE_PBMT_IO;
> +            e.pte |= pte_pbmt(PTE_PBMT_IO);
>               break;
>   
>           default:


