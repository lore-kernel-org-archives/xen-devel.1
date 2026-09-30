Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77286CA5FAC
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 13:42:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437291.1656139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBuZU-0006xp-4O; Wed, 30 Sep 2026 13:42:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437291.1656139; Wed, 30 Sep 2026 13:42:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBuZU-0006xi-1V; Wed, 30 Sep 2026 13:42:08 +0000
Received: by outflank-mailman (input) for mailman id 1437291;
 Wed, 30 Sep 2026 13:42:06 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBuZS-0006xc-K0
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 13:42:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBuZR-009skD-Ar
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 15:42:05 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd11a6-bab6-0a2a0a5309dd-0a2a4508cf00-44
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 15:42:05 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd11ad-f659-0a2a45080019-d155802da588-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 15:42:05 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4a01b560392so2237465e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 06:42:05 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b02a0dd0dsm3371117f8f.35.2026.09.30.06.42.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 06:42:04 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790775725; x=1791380525; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yD60bjAB/biUFvOMioAbuRsmOn7GnyMCaf/KIIDAtDY=;
        b=iww7b8ddmj3EStSg0zt3WU2tmZgzBhu9U4fiZAGgS9d1CxSzsF9yFTo0NUj9TmBDcN
         GlgeQzxY4QRhF6xae9LUlWb0gmDFe0BqD3q5MXsDZfR5FvcnuQ69Sm+RDcEIQ6XKKtUJ
         oKAOmn2aIMy3tNTigtEtdVC/3lvsuDV/+RTeDxADStTZjrIStyHOWC390k/hMBLciBnD
         JAsZwAo1NKDxnNfZRIjHoQwVnO+of83snm78F6NvQELBx0i1Rg7NOuZYVxL4R5KqtMrS
         vxohdUupDTfZpM0VJmahpYVyOkYpbY7Q1J8UOy8EUrxlotc5V2GWz4eMSMxTaqkWIzAp
         RG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775725; x=1791380525;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yD60bjAB/biUFvOMioAbuRsmOn7GnyMCaf/KIIDAtDY=;
        b=uDggapmZN7JfHOAhZ+jXkB9EEIRLyWqrp1zCemlTzk1BvL7AZlX/aaJGAWNwW58XlT
         xAlQqe6CTZLrF+DJVLLJuMJ3cFHYymZ0O+KZ+FUZoPWwW7vi2Js6O/JdWbl8Ad9inopG
         JfCWdqo5V7nNIPN4VXkJIMwLXFIjU+MMPjnQqiO3h+SNR51RJqk39MToEOa0NcrdnKat
         fd1uRADOZm2yqutezYPyxbxggGSACRMscvHirLH4pFCtea4up5EVa7RH5DU02X3iADqz
         Wl5vqhHVkqmC89l5ImwGrAYseNHEX0MKJZRtBtTaBxfwvP0BMsM6GdDrzIb31pEOX02x
         qSpQ==
X-Forwarded-Encrypted: i=1; AKwUvByrycgNpEVzQlZ6U/YpDM6l7BsBr809S0f8vu4u5sJfC+mcv10g1bnwavif5fQDQJoOCu4LzWYO024=@lists.xenproject.org
X-Gm-Message-State: AFuF++lV2PTDrxua0Gs+oU7UWGIlvZiF3B340ff1FqRdbYFMjaL2lk0/
	d+E+hTr8O8RuW+79BBnELs6bDzJpDeKRW7wQrkZlxiYDMgQk6IuNBCXf
X-Gm-Gg: AYBFou1GhnWyR2Xsx0hM/7S5QnmAqVzRdtsYykOd777xxQiEOUmCiVc/G0od2GmMUaF
	uwD3bnVTPpi/ATfAdHadeSpQ/Bv3R+NXjIwaEuPzTJLkrK7pSvVUmhO2QVaJPsWG0P1IMOIh8vT
	ZVD5U6YDvGut4knyBmHS2B1uxUv+zNsqTw1ut1pUk864bumUeaDUlkadFa3fBRsGGEEyhyHb+Di
	fka0GQDsi2cwFNqfqNE5sViv606+nyYzJcNxn4rvffmmkO4xM2kMJnWpaqHY2OUefyRUVOMjOeK
	8GcbBU/g6q8EP/6BsZoO/1IFQwIPTwKjGGtmFaUsuU/teZQPwx9VjNe72VQkMwHzAlbjZidyS2l
	tqzvjgUSzEGp/+hlR3nIYj0k0Ppz3QQxf5MYnT7b4OhvW/fVZk2qy0y213U3Huevz9C5SZkxGEV
	4nNIy1E+F1mCcWGFMn0WDf0owpixaMihbp4LhXc6X9r1lPrx+J/2xOmHlYpPY5k5bN3kjvbtnT0
	ZQTbjEV1KIAp+jnuw3I9GoeDuXEq2J9iqlY+nuA4xqjzV2xmQ==
X-Received: by 2002:a05:600c:47c9:b0:4a0:1c92:f989 with SMTP id 5b1f17b1804b1-4a01c92f9c2mr8933875e9.12.1790775724712;
        Wed, 30 Sep 2026 06:42:04 -0700 (PDT)
Message-ID: <9f94af4b-f122-46e0-bbc4-7fecd51d4348@gmail.com>
Date: Wed, 30 Sep 2026 15:42:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] xen/riscv: rename PTE "permissions" to "pte_flags"
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <1790699381.8631fc262581453bbf619ec5b2062170.1a0ee00218b000b504@vates.tech>
 <1790699585.8631fc262581453bbf619ec5b2062170.1a0ee033eb9000b504@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1790699585.8631fc262581453bbf619ec5b2062170.1a0ee033eb9000b504@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1790775725-CEF5F87B-1EF88BF7/10/78276251493
X-purgate-type: spam
X-purgate-size: 4082



On 9/29/26 6:32 PM, Baptiste Le Duc wrote:
> paddr_to_pte()'s "permissions" parameter, the matching local in

Nit: s/the matching local/the matching local variable?

> setup_initial_mapping() and p2m_set_permission() don't only deal with
> permission bits: they also handle PTE_VALID, PTE_USER, PTE_ACCESSED and
> PTE_DIRTY.
> 
> Rename them to "pte_flags" and p2m_set_pte_flags() respectively.
> 
> No functional change.
> 
> Requested-by: Jan Beulich <jbeulich@suse.com>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> ---
> Changes since v2:
> - new patch
> ---
>   xen/arch/riscv/include/asm/mm.h | 5 +++--
>   xen/arch/riscv/mm.c             | 8 ++++----
>   xen/arch/riscv/p2m.c            | 4 ++--
>   3 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
> index 9e28c24954..1ac66283ec 100644
> --- a/xen/arch/riscv/include/asm/mm.h
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -22,9 +22,10 @@ extern vaddr_t directmap_virt_start;
>   #define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
>   
>   static inline pte_t paddr_to_pte(paddr_t paddr,
> -                                 unsigned int permissions)
> +                                 unsigned int pte_flags)
>   {
> -    return (pte_t) { .pte = (paddr_to_pfn(paddr) << PTE_PPN_SHIFT) | permissions };
> +    return (pte_t) { .pte = (paddr_to_pfn(paddr) << PTE_PPN_SHIFT) |
> +                            pte_flags };

Nit: it could be one line.

>   }
>   
>   static inline paddr_t pte_to_paddr(pte_t pte)
> diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
> index 610d111945..0e26c5751f 100644
> --- a/xen/arch/riscv/mm.c
> +++ b/xen/arch/riscv/mm.c
> @@ -140,7 +140,7 @@ static void __init setup_initial_mapping(struct mmu_desc *mmu_desc,
>           case 1: /* Level 0 */
>               {
>                   unsigned long paddr = (page_addr - map_start) + pa_start;
> -                unsigned int permissions = PTE_LEAF_DEFAULT;
> +                unsigned int pte_flags = PTE_LEAF_DEFAULT;
>                   unsigned long addr = is_identity_mapping
>                                        ? page_addr : virt_to_maddr(page_addr);
>                   pte_t pte_to_be_written;
> @@ -149,13 +149,13 @@ static void __init setup_initial_mapping(struct mmu_desc *mmu_desc,
>   
>                   if ( is_kernel_text(addr) ||
>                        is_kernel_inittext(addr) )
> -                        permissions =
> +                        pte_flags =
>                               PTE_EXECUTABLE | PTE_READABLE | PTE_VALID;

Nit: it could be one line now.

>   
>                   if ( is_kernel_rodata(addr) )
> -                    permissions = PTE_READABLE | PTE_VALID;
> +                    pte_flags = PTE_READABLE | PTE_VALID;
>   
> -                pte_to_be_written = paddr_to_pte(paddr, permissions);
> +                pte_to_be_written = paddr_to_pte(paddr, pte_flags);
>   
>                   if ( !pte_is_valid(pgtbl[index]) )
>                       pgtbl[index] = pte_to_be_written;
> diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
> index 1cea86512c..f7b380b90a 100644
> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -584,7 +584,7 @@ static inline void p2m_clean_pte(pte_t *p, bool clean_cache)
>       p2m_write_pte(p, pte, clean_cache);
>   }
>   
> -static void p2m_set_permission(pte_t *e, p2m_type_t t)
> +static void p2m_set_pte_flags(pte_t *e, p2m_type_t t)
>   {
>       e->pte &= ~PTE_ACCESS_MASK;
>   
> @@ -676,7 +676,7 @@ static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t,
>               break;
>           }
>   
> -        p2m_set_permission(&e, t);
> +        p2m_set_pte_flags(&e, t);
>           p2m_set_type(&e, t, ctx);
>       }
>       else
> 

I am okay to go without last two Nit(s):

Reveiwed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii


