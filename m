Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C9BC982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 14:48:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429072.1652009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91nD-00026R-2B; Tue, 22 Sep 2026 14:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429072.1652009; Tue, 22 Sep 2026 14:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91nC-00026K-V3; Tue, 22 Sep 2026 14:48:22 +0000
Received: by outflank-mailman (input) for mailman id 1429072;
 Tue, 22 Sep 2026 14:48:21 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x91nB-000255-OH
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 14:48:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x91nA-008JaI-Sv
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 16:48:20 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab29528-8faa-0a2a0a5109dd-0a2a4504959e-38
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:48:20 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab29534-b57f-0a2a45040019-4a7de14ca655-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:48:20 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-482f63546c3so10237f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 07:48:20 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48862774543sm6162055f8f.11.2026.09.22.07.48.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 07:48:19 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790088500; x=1790693300; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XlMJKnRCM9WsVOoHs8R7g0KyORvdFCPXy8vPf7MCrd0=;
        b=ryws05a5IB+kD7LzUmJ8pU0Z1m4ULVHhFbGiJ5JM1wiip5FUOyI8+eaDEzl+kt9CUh
         NhB4xlk/5Tk43fimTQKzvVMboqUScwQBc0HfyGO1bYVrtihOmekn+DEtC/4FCJvj1VV7
         NMzbwIG/8KHsxJPzP00a8HMgCvOCPWz+GmFU8N0cHlK26kLt1ZqH6AM8z7egK5ttU7Y8
         Balu/vcmNp0NNPAP4+kzF1UqW3f2CYL+je/dNq9OzFVqZjA5GaWUSScjXadyAmlZTKkm
         bRRgOynakpfmaylbLzFpGy05nq02rVzs2dP+Svolv+Ilsr6Y69POP1aenH8z1KkI6m4t
         nazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790088500; x=1790693300;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XlMJKnRCM9WsVOoHs8R7g0KyORvdFCPXy8vPf7MCrd0=;
        b=TXFHMFd8Q+8XCy/u0Yjp8w+yLaZNwuf2WaaBOCgkmV3W1u1WIDSVSR3/Z3YNp/2kyq
         QWqZJ1H3OUzU002uifL+HvHo+fGFFoiSIy0kqOtTMVARZJJu0c9d0JgLclfbxNDISqHW
         SMeI4wdOMngsKqYoTmc904V8SEhfu8I7Var2mJiV/ZhTFcFjLXmQGa4HvABBnU+pceGN
         yXHMoGbGTCfvTtzXD6J8vDhvslNAfgqUg1teHVeVGo6tJrLyuGj1A1zimEXuINDmH8Kz
         g4NFDLoH/BSDqOUwL6v/uB7tVC+OJjrGw623erv8ELxpwe+XxQaldP+OHqLpfiW9nV08
         xpXg==
X-Gm-Message-State: AFuF++n8vsBqQOStXP6to01xFxKL/hH361ytD+Ytw8VwDOZVe2Fk0u7N
	J5QAgL1aKpV11+qU2lv08AUpSux762rGkUVhSsrj0KuHFlBQB1I3PQtA
X-Gm-Gg: AYBFou2xwDpHtglvj7d5aqYKQKp6vNZE3t5zmpj/KEiPC28NnRAEHf+SxYMb7ck3KTT
	xySvFSWT25bwwmtYcopEJ4knmnhIFGxBT/d0BMtA6IX4Nyeph5fC7F7MK38aC3wR2nh1ymlG4Un
	B8SmFbZObpKp6ZteCGs9afOdGolWqqnJrN8h/KXlB9G3vgEHfzVO7r7QkA4MnvA9pKgU/ZWoISw
	th+4uYKg2ujGTDoAPFkG0JSBpjdjx3YYqmZyg9ewzOpVCI3k2zZUyW2nc2zg4rjjI4fcci0Y1TY
	DGpVT8PaEgwmp2dqEZwJJgCh78NiQInmlFTzXHFhEiTbSwctk+9KwbhC56sn8NBYrtkOsV4Q56O
	Ij6O4pDbYdN61/8XOC0Pu0znbZ7Ddj5lQPaskLt+Pwya/oKvzte6qOmJ+AqlwFhts/xm8ldK4GJ
	kNfuJpFHFjJrLezq+cQOa0etleEQS84KyhJ2TR2qIkd1FMfEJ8pQMWhhf+UzgQg55OGXeOrnp9E
	9Ib5IaLb6k/23YTZFGPXDyqaGiyS58CDYTVTJd287082PPV7Q==
X-Received: by 2002:a05:6000:2c0b:b0:487:342:d143 with SMTP id ffacd0b85a97d-4871e269474mr20053433f8f.33.1790088499911;
        Tue, 22 Sep 2026 07:48:19 -0700 (PDT)
Message-ID: <e62b2b80-7fbe-40da-add9-5d7862336ef6@gmail.com>
Date: Tue, 22 Sep 2026 16:48:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] xen/riscv: make Svpbmt no longer a required
 extension
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Alistair Francis <alistair.francis@wdc.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Connor Davis <connojdavis@gmail.com>
References: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
 <1789032898.8631fc262581453bbf619ec5b2062170.1a08aab9fe1000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1789032898.8631fc262581453bbf619ec5b2062170.1a08aab9fe1000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1790088500-C10DDB50-224D5D3A/10/73395122804
X-purgate-type: spam
X-purgate-size: 6414



On 9/10/26 11:34 AM, Baptiste Le Duc wrote:
> Without the Svpbmt extension, memory attributes (such as cacheability and
> ordering) are strictly tied to physical address ranges and enforced by the
> hardware's Physical Memory Attributes (PMA) checker.
> 
> In this configuration, supervisor software relies on the platform's memory
> map:
>      - peripheral device registers (MMIO) are physically mapped into
>        hardware-defined I/O regions (which are implicitly non-cacheable and
>        strongly-ordered)
>      - regular RAM is mapped as cacheable main memory.
> 
> S-mode paging can safely map these physical ranges without specifying
> page-based memory types in the PTEs, as the hardware MMU and PMA pipeline
> will correctly bypass caches for MMIO accesses and use caches for RAM
> accesses, based on the target physical address.
> 
> Furthermore, on platforms that either feature fully hardware-coherent DMA
> or don't expose non-coherent DMA agents to the OS, page-level programmatic
> cache control via Svpbmt is not required, making it safe to boot and run
> when Svpbmt is absent.
> 
> Drop Svpbmt from required_extensions. Introduce svpbmt_enabled, a
> __ro_after_init flag computed once in init_csr_masks() from ISA
> availability and the henvcfg.PBMTE bit. Xen cannot read menvcfg.PBMTE
> directly, since menvcfg is M-mode-only and unreadable from HS-mode, but the
> spec guarantees henvcfg.PBMTE reads as zero whenever menvcfg.PBMTE is zero,
> so checking henvcfg.PBMTE alone is sufficient. Use svpbmt_enabled in
> pte_pbmt_nocache()/pte_pbmt_io(), two new inline helpers that mask the PBMT
> encoding down to 0 when Svpbmt is unavailable.
> 
> Also switch vcpu_csr_init() branch to determine if Svpbmt was enabled to
> svpbmt_enabled as it does the same logic.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> 
> ---
> Changes since v1:
> - Replace the pte_pbmt() macro, which re-checked
>    riscv_isa_extension_available() on every call, with a svpbmt_enabled
>    flag cached once in init_csr_masks().
> - Add pte_pbmt_nocache()/pte_pbmt_io() inline helpers instead, used by
>    PAGE_HYPERVISOR_NOCACHE/WC and p2m_pte_from_mfn().
> - Switch vcpu_csr_init() to the same cached svpbmt_enabled flag instead
>    of re-deriving Svpbmt availability itself.
> ---
>   xen/arch/riscv/cpufeature.c       |  1 -
>   xen/arch/riscv/domain.c           | 10 ++++++++--
>   xen/arch/riscv/include/asm/page.h | 22 +++++++++++++++++++---
>   xen/arch/riscv/p2m.c              |  2 +-
>   4 files changed, 28 insertions(+), 7 deletions(-)

docs/misc/riscv/booting.txt isn't updated.

> 
> diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
> index 19454544a7..986a6dec78 100644
> --- a/xen/arch/riscv/cpufeature.c
> +++ b/xen/arch/riscv/cpufeature.c
> @@ -158,7 +158,6 @@ static const struct riscv_isa_ext_data __initconst required_extensions[] = {
>       RISCV_ISA_EXT_DATA(zifencei),
>       RISCV_ISA_EXT_DATA(zihintpause),
>       RISCV_ISA_EXT_DATA(zbb),
> -    RISCV_ISA_EXT_DATA(svpbmt),
>   };
>   
>   static bool __init is_lowercase_extension_name(const char *str)
> diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
> index 2819ff4e7c..f6f20824e3 100644
> --- a/xen/arch/riscv/domain.c
> +++ b/xen/arch/riscv/domain.c
> @@ -47,6 +47,8 @@ static struct csr_masks __ro_after_init csr_masks;
>   #define HENVCFG_VALID_MASK 0xe0000003000000ffUL
>   #define HSTATEEN0_VALID_MASK 0xde00000000000007UL
>   
> +bool __ro_after_init svpbmt_enabled;

svpbmt_enabled controls Xen's own stage-1 page tables, but it's defined 
in domain.c (guest CSR setup) and declared in page.h. That's defensible, 
because the value is computed in init_csr_masks() from 
csr_masks.henvcfg. It would still read better in cpufeature.c, with the 
declaration in cpufeature.h, or at least with a comment next to the 
definition saying why it's in domain.c.

> +
>   void __init init_csr_masks(void)
>   {
>       /*
> @@ -79,6 +81,10 @@ void __init init_csr_masks(void)
>           INIT_RO_ONE_MASK(HSTATEEN0, hstateen0);
>       }
>   
> +    svpbmt_enabled = (riscv_isa_extension_available(NULL,
> +                RISCV_ISA_EXT_svpbmt)) && (ENVCFG_PBMTE &
> +                csr_masks.henvcfg);
> +

svpbmt_enabled stays false until init_csr_masks() runs in start_xen(). 
Any ioremap(), ioremap_wc() or p2m MMIO mapping created before that 
silently gets PMA instead of IO. Nothing does this today; setup before 
that point only uses PAGE_HYPERVISOR_RW. Consider an ASSERT or a comment 
in pte_pbmt_*(), or setting the flag earlier, e.g. right after 
riscv_fill_hwcap() (if it is possible, considering that you are using 
csr_masks.henvcfg probably it can't) .

>   #undef INIT_CSR_MASK
>   #undef INIT_RO_ONE_MASK
>   }
> @@ -97,8 +103,8 @@ static void vcpu_csr_init(struct vcpu *v)
>        */
>       v->arch.hcounteren = HCOUNTEREN_TM;
>   
> -    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svpbmt) )
> -        v->arch.henvcfg = ENVCFG_PBMTE & csr_masks.henvcfg;
> +    if ( svpbmt_enabled )
> +        v->arch.henvcfg = ENVCFG_PBMTE;
>   
>       if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
>       {
> diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
> index 1977634efc..a7d087ff52 100644
> --- a/xen/arch/riscv/include/asm/page.h
> +++ b/xen/arch/riscv/include/asm/page.h
> @@ -11,6 +11,7 @@
>   #include <xen/types.h>
>   
>   #include <asm/atomic.h>
> +#include <asm/cpufeature.h>

Do we really need this?

The helpers only read extern bool svpbmt_enabled and don't call 
riscv_isa_extension_available(). Adding the include only widens the 
header dependencies.

>   #include <asm/page-bits.h>
>   
>   #define VPN_MASK                    (PAGETABLE_ENTRIES - 1UL)
> @@ -42,7 +43,21 @@
>    *  01 - NC     Non-cacheable, idempotent, weakly-ordered Main Memory
>    *  10 - IO     Non-cacheable, non-idempotent, strongly-ordered I/O memory
>    *  11 - Rsvd   Reserved for future standard use
> + *
> + * These bits are only meaningful when Svpbmt is enabled. Otherwise they must
> + * stay 0 (PMA).
>    */
> +extern bool svpbmt_enabled;

Shouldn't be here an empty line?

Thanks.

~ Oleksii

