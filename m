Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24AA0C61DB9
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 13:35:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1402062.1637475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzwjM-0008Cp-WA; Fri, 28 Aug 2026 13:34:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1402062.1637475; Fri, 28 Aug 2026 13:34:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzwjM-0008Ci-Sz; Fri, 28 Aug 2026 13:34:52 +0000
Received: by outflank-mailman (input) for mailman id 1402062;
 Fri, 28 Aug 2026 13:34:52 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzwjL-0008Cc-Tb
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 13:34:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzwjL-00EmIT-2U
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 15:34:51 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a918e79-2eae-0a2a0a5409dd-0a2a4507d586-6
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 15:34:51 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a918e7a-b4ea-0a2a45070019-d155dd31e449-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 15:34:51 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-482ea739de2so701431f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 06:34:50 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482fbac7c01sm4087340f8f.14.2026.08.28.06.34.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2026 06:34:48 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Content-Language:References:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787924090; x=1788528890; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mOYOwqqbnUUvC64wDruE8UCb6JVklIemNUSnXaPcJDA=;
        b=a22/YHfVhHXI/nsLA5av4q7LeIfFOSA4n+FSVhPHiCONwj4pWUGpzldzJjpm/CZZMa
         uU5ZySDfqq38Vpe5OT6R4FGZeQ1YqVISPOcaiSH1mk+vdlZmN6LhUEVFVb/pPMrNgrfs
         PQkqqVsyKgTUe+lUnb+p4sNLFRCj7Oe34johrsVqlG4Pge80kBLi/AD4inCMVXehcbN/
         QTnTzMPEsQx7MPmiDVApgNPXJ8WUsmRAXK523K88GotyBUBdhlfdCpRv7m4CF8WAYTSr
         02dAC3L0PoqivEk/tlU2UsoUc6WFLXZbrDxwLPhEG2UxWP5ud+N8EEiBajApfwoU+xW3
         s0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787924090; x=1788528890;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mOYOwqqbnUUvC64wDruE8UCb6JVklIemNUSnXaPcJDA=;
        b=Kz9DWkTSb0jgch6AikWgDptk0yckkG/lR6Ies3Q9Q6Frabg72ieBMJfQEGAlOdtpQz
         TpvSrMyg58kEKHGbz+DtB0SBC47PdqOFQqn9P8waCrZtdHeELMKf25wKZ6Y67RHwx4lA
         fNJlKnhOMNM74BFMsXTZj5k7Ty3jRzP15mbBLhvD3Xwz8dsv5kqN1ZrEL7rtsbMpjGni
         n2r1aZXGnnx+qAbWk73vauEDwDLv0NN+G+0dPwkc3sGxPqNdFZnVgU5L/710FRRIB0/k
         rlzL21vgG8/x3K/rIaqrnBLdoNiRifoP1vCci4MEplDIBj+Toq9TOmDC7Rf3xdEgBjOV
         MGvg==
X-Forwarded-Encrypted: i=1; AHgh+RqUaSolGjeKRP7Hecvxy2esWWtxqblegNxebnRekP098v7FbHbsLc1bUQb6B9uHH6/ningm7T23e9A=@lists.xenproject.org
X-Gm-Message-State: AFuF++lotOq4MbXWXoyMoXzNAAOIu1qTCx2FHYfY0ttWLYizF3YLrlYL
	Lvpbcgyl48W3htrfpGIHuqHP05RfMjEM/8+H5pXoBR+7ZQ99yhZRDj1y
X-Gm-Gg: AR+sD13IFH4I4eoK6PeSA3JPlrdTbWJqi1JEKt0q83GL58GRHZhJFhUMaaOg9rceleO
	8AFKWJ2IshK3qtDwl+Y5bN9vUuzMl7vXeAetOVTJ2Me0Ud2AY4rCLG3ANZf0a9OgwvIR/4WOvXV
	gfBLBQXBvkVFMivWKkwMPk3QFFQCXvZsqP+MT1jh3nhgLWMMWeEzYIPQxmLGbBHgt/sBpoT/9Nv
	jna28FFf+Ar/GCB8iWjUVcppD7sFIjgl/Rn6AEP1jR1T1+NfgzSDvM2uUR61Jyt5fzyre00Fnpf
	1yBqflCRxaSeHDugiFcLibnq6yVyJcN1d70TbMOtAOWJ589LlKOPdQQD+IVFUUGpOEJzGXTtR6g
	VRPW9HKemkomRDhm4xg6nMdyC432H43ZERxr0V9BHmMLXfBu8RPeIsqQCD+dREDuAgS56Fd5hsX
	7kSUw/ZROQyjibCNKJ3Ueqr+GxELpCjEtvahVXu1Vc2H7R43EUBo0Ds+9GHVJlRfEPxALj+1RyO
	M8kUZWCrGr2l3GyqIUz5pT8uCr4MQGYj9XG+sizdw==
X-Received: by 2002:a05:6000:4810:b0:482:e451:681f with SMTP id ffacd0b85a97d-482f79c9430mr9907281f8f.10.1787924090247;
        Fri, 28 Aug 2026 06:34:50 -0700 (PDT)
Message-ID: <ec69b941-2648-4c3f-bbee-95d4d56fb543@gmail.com>
Date: Fri, 28 Aug 2026 15:34:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 2/5] xen/riscv: preset A/D bits in Xen's own page-table
 mappings
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
 <1787844809.8631fc262581453bbf619ec5b2062170.1a043dad225000c4f3@vates.tech>
Content-Language: en-US
In-Reply-To: <1787844809.8631fc262581453bbf619ec5b2062170.1a043dad225000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1787924091-374D3AE4-6A9EAA8C/10/73395122804
X-purgate-type: spam
X-purgate-size: 6326



On 8/27/26 5:33 PM, Baptiste Le Duc wrote:
> The previous patch made p2m_set_permission() always set the PTE A/D bits to
> map pages in G-stage, to avoid a page fault on platforms that implement
> neither Svade nor Svadu, or that declare both in the device tree. Xen's own
> page tables, built by setup_initial_mapping(), never go through
> p2m_set_permission() and need the same fix.
> 
> Add PTE_ACCESSED to PTE_LEAF_DEFAULT and make it the minimal common leaf
> permission set by dropping PTE_WRITABLE. Rebuild PAGE_HYPERVISOR_RO,
> PAGE_HYPERVISOR_RW and PAGE_HYPERVISOR_RX from that common base, with
> PAGE_HYPERVISOR_RW also adding PTE_DIRTY. Switch setup_initial_mapping() to
> use these macros for its default, text, and rodata permissions instead of
> the equivalent raw bit lists.
> 
> A PTE is a table entry iff PTE_VALID is set and R/W/X are all clear, so
> update pte_is_table() accordingly.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> ---
>   xen/arch/riscv/include/asm/page.h | 14 ++++++++------
>   xen/arch/riscv/mm.c               |  7 +++----
>   2 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
> index b465a90325..5c02f64a17 100644
> --- a/xen/arch/riscv/include/asm/page.h
> +++ b/xen/arch/riscv/include/asm/page.h
> @@ -46,12 +46,12 @@
>   #define PTE_PBMT_NOCACHE            BIT(61, UL)
>   #define PTE_PBMT_IO                 BIT(62, UL)
>   
> -#define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
> +#define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE | PTE_ACCESSED)

Dropping PTE_WRITABLE here silently changes the permissions of an 
existing user of this macro that the patch doesn't touch.

check_pgtbl_mode_support() in mm.c still builds its temporary root entry as:
  index = pt_index(page_table_level, aligned_load_start);
  stage1_pgtbl_root[index] = paddr_to_pte(aligned_load_start,
                                      PTE_LEAF_DEFAULT | PTE_EXECUTABLE);

Before this patch that evaluated to V|R|W|X (RWX); afterwards it is 
V|R|A|X (RX). So the mapping loses write permission.

I believe that is harmless in practice: the entry is only alive between 
the csr_write(CSR_SATP, ...) that turns the MMU on and the 
csr_write(CSR_SATP, 0) a few lines below, it only has to make the 
current instruction stream fetchable so that the SATP mode probe can 
complete, and nothing writes through it. Arguably RX is the better 
permission set for it anyway. But it is still a behavioural change 
rather than a cosmetic one, and the commit message doesn't mention it(it 
only talks about setup_initial_mapping()).
Please call it out explicitly there.

While at it, this site should be converted too:

     stage1_pgtbl_root[index] = paddr_to_pte(aligned_load_start,
                                             PAGE_HYPERVISOR_RX);

Otherwise the patch converts three sites in setup_initial_mapping() to 
the new PAGE_HYPERVISOR_* macros while leaving a fourth one open-coding 
the redefined PTE_LEAF_DEFAULT, which is exactly the kind of asymmetry 
that makes the redefinition easy to miss on the next change.

After that conversion PTE_LEAF_DEFAULT has no users left
outside page.h itself, so it could either be dropped entirely in favour 
of PAGE_HYPERVISOR_{RO,RW,RX}, or renamed to something that reflects its 
new meaning (PTE_LEAF_COMMON or similar). "DEFAULT" now names a set that 
is not a usable permission on its own, which is misleading.

>   #define PTE_TABLE                   (PTE_VALID)
>   
> -#define PAGE_HYPERVISOR_RO          (PTE_VALID | PTE_READABLE)
> -#define PAGE_HYPERVISOR_RW          (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
> -#define PAGE_HYPERVISOR_RX          (PTE_VALID | PTE_READABLE | PTE_EXECUTABLE)
> +#define PAGE_HYPERVISOR_RO          (PTE_LEAF_DEFAULT)
> +#define PAGE_HYPERVISOR_RW          (PTE_LEAF_DEFAULT | PTE_WRITABLE | PTE_DIRTY)
> +#define PAGE_HYPERVISOR_RX          (PTE_LEAF_DEFAULT | PTE_EXECUTABLE)

Adding A/D to PAGE_HYPERVISOR_RW fixes a second site beyond the ones the
commit message mentions, and I think it deserves to be spelled out.

arch_pmap_map() in asm/pmap.h writes the fixmap leaf entry directly:
     pte = pte_from_mfn(mfn, PAGE_HYPERVISOR_RW);
     write_pte(entry, pte);
i.e. it bypasses pt_update_entry(), which is the place that ORs in
PTE_ACCESSED | PTE_DIRTY for everything going through map_pages_to_xen().
So before this patch every pmap mapping was installed with A=D=0 and 
would fault on first access under Svade, in exactly the same way the 
boot page tables did.

The commit message currently frames the problem as "Xen's own page 
tables, built by setup_initial_mapping()", which undersells the fix. 
Please extend it to say that arch_pmap_map() is affected as well, and 
that it is fixed by the PAGE_HYPERVISOR_RW change rather than by the 
mm.c conversion.

FWIW I checked the remaining leaf-PTE construction sites (paddr_to_pte() 
/pte_from_mfn() callers) and with these two the series covers all of 
them: everything else either builds table entries (PTE_TABLE) or goes 
through pt_update_entry() / p2m_set_permission(), both of which set A/D 
themselves.

>   
>   #define PAGE_HYPERVISOR             PAGE_HYPERVISOR_RW
>   /*
> @@ -177,7 +177,8 @@ static inline bool pte_is_table(pte_t p)
>        *
>        * PAGE_HYPERVISOR_RW contains PTE_VALID too.
>        */
> -    ASSERT(((p.pte & PAGE_HYPERVISOR_RW) != (PTE_VALID | PTE_WRITABLE)));
> +    ASSERT((p.pte & (PTE_VALID | PTE_READABLE | PTE_WRITABLE)) !=
> +           (PTE_VALID | PTE_WRITABLE));

Please drop the last line of the comment above it:

      * PAGE_HYPERVISOR_RW contains PTE_VALID too.

That sentence existed only to explain why the old mask was written as
PAGE_HYPERVISOR_RW, i.e. that the macro is not just R|W but carries
PTE_VALID as well, which is what made the comparison against V|W work.
With the mask now written out literally, the macro is no longer 
referenced anywhere in the function, so the line dangles. It is also 
inaccurate now, since PAGE_HYPERVISOR_RW carries A and D in addition to V.

~ Oleksii

