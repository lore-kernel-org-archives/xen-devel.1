Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A20C61DD3
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2026 09:36:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1403874.1637824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0yRS-0005vN-7U; Mon, 31 Aug 2026 09:36:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1403874.1637824; Mon, 31 Aug 2026 09:36:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0yRS-0005vG-4p; Mon, 31 Aug 2026 09:36:38 +0000
Received: by outflank-mailman (input) for mailman id 1403874;
 Mon, 31 Aug 2026 09:36:36 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0572d6c8c000c4f3@swg.vates.tech>)
 id 1x0yRQ-0005vA-LQ
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 09:36:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x0yRP-007mac-UU
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 11:36:35 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0572d6c8c000c4f3@swg.vates.tech>)
 id 6a954b15-bab6-0a2a0a5309dd-0a2a4504b14c-38
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 11:36:35 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0572d6c8c000c4f3@swg.vates.tech>)
 id 6a954b23-b57f-0a2a45040019-b9ff1c23ac5d-3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 11:36:35 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0572d6c8c000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 31 Aug 2026 09:36:29 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 0017C81EAC;
 Mon, 31 Aug 2026 11:36:28 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=V72sOzyfnl3IHLjnqMmWoRQ7+O2JNIDOHwfWGiGLkKQ=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=X0PYdx1YshDqkdeXbHWj2QwVfkzrd5vcodAkYvbxH9qS5a90bL+JIgZFiaKnZKHCtskMHYOgi
 puY+j/ze9Oz/dV941RhbREMyXi0eP2QqxHobqHWOmiYupqAEBRPAjjUrwtGD63zOXj5vrvirtNQ
 AzgyV7G+vLZaSCla6ZSVVOxCtIQLWyPx6tMtlg7qKBfdSJh5HQF5KKyizDBa5a6B25XSCPtM77U
 manwaDtjKF/EFJAFamNOs4trp9KfNOfi+/irRsQ6gZDAIa0OGyYHbt7boR7L7iYj1/xllzeEooH
 NmNC10lUGHKRiJbXYKfUwaDfSP5XjTslj1hwS7q0jgXQ==
X-Zone-Loop: a571ece7896f0d778c25f48f5cffbb25c85490630e6e
x-campaign-type: default
x-transaction-id: df7a2b66-4ff3-481d-bf54-4b2155641ceb
x-swg-uid: 01-3716f76d-3745-43c4-a2b4-9e4a048df7eb
X-Mailer: Sweego
Message-ID:
 <1788168989.8631fc262581453bbf619ec5b2062170.1a0572d6c8c000c4f3@vates.tech>
x-swg-bid: 1788168989.8631fc262581453bbf619ec5b2062170.1a0572d6c8c000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 3/5] xen/riscv: make Svpbmt no longer a required
 extension
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 xen-devel@lists.xenproject.org, zhangzheng@iscas.ac.cn, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <59555237-425d-47f0-80b6-b7273cc8d6ec@gmail.com>
References: <1787844438.8631fc262581453bbf619ec5b2062170.1a043d52a06000c4f3@vates.tech>
 <1787844809.8631fc262581453bbf619ec5b2062170.1a043dad34e000c4f3@vates.tech>
 <59555237-425d-47f0-80b6-b7273cc8d6ec@gmail.com>
Date: Mon, 31 Aug 2026 11:36:23 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788168988; l=9013;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=h3mzsBv6JC+6kUlZ1aQ07VMYT+56kdwcMGAvEw+Kios=;
 b=ivuWgvmD65CZZIdtwALGI3l34PgxghbltLLRejBCm9J5v7uDmgBUvGg+m2fcW9l0UtpLyyYLY
 zEt/tyHZ92wC/8U9oYGSM2RSKgeayOTOnP/rqCKgYEzg3vLdLmlM3Ua
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788168989190
X-purgate-ID: tlsNG-ebf023/1788168995-51AD0B50-E3EE8268/0/0
X-purgate-type: clean
X-purgate-size: 9017

On 2026-08-28 17:58 +0200, Oleksii Kurochko wrote:
> 
> 
> On 8/27/26 5:33 PM, Baptiste Le Duc wrote:
> > required_extensions[] panics at boot if Svpbmt is missing, which is a
> > problem on hardware that doesn't implement it.
> 
> Based only on this sentence it isn't clear why it is safe to have SvPBMT 
> = n and what guarantees that if some memory for a device dma for example 

Sorry I'm not used to this kind of terminology, does Svpbmt = n means that MT
bits ([62:61]) are equal to 0 = PMA?

> should be non-cachable and strongly ordered what will guarantee that.
> 
> So basically something like that should be added to the commit message:
> ```
> Without the Svpbmt extension, memory attributes (such as cacheability 
> and ordering) are strictly tied to physical address ranges and enforced 
> by the hardware's Physical Memory Attributes (PMA) checker.
> 
> In this configuration, supervisor software relies on the platform's 
> memory map: peripheral device registers (MMIO) are physically mapped 
> into hardware-defined I/O regions (which are implicitly non-cacheable 
> and strongly-ordered), while regular RAM is mapped as cacheable main 
> memory.
> 
> S-mode paging can safely map these physical ranges without specifying 
> page-based memory types in the PTEs, as the hardware MMU and PMA 
> pipeline will correctly bypass caches for MMIO accesses based on the 
> target physical address. 
I think this could go in the previous paragraph as it only concerns
of the configuration you mentionned.

> Furthermore, on platforms that either feature 
> fully hardware-coherent DMA or do not expose non-coherent DMA agents to 
> the OS, page-level programmatic cache control via Svpbmt is not 
> required, making it safe to boot and run when Svpbmt is absent.
If we have a platforms that doesn't have both of these feature, what
would happen? Do we need to add a check in Xen code?
> ```
>
> 
>   Xen already checks Svpbmt at
> > runtime in some places (vcpu_csr_init()), but not everywhere:
> 
> This part sounds like there are additional places where you think the 
> Svpbmt related bits should be set but I don’t see in this patch (or in 
> others in this patch series_ where you are adding Svpbmt related bits to 
> places where they weren’t added before. Am I missing something or did I 
> misunderstand your message? If the latter then could you please re-word 
> this part of the sentence.

No I was saying that before this patch, there were some places that
missed to have a Svpbmt availibility check, this patch fix them.
> 
> > p2m_pte_from_mfn() and the PAGE_HYPERVISOR_NOCACHE/WC macros still set the
> > raw PTE_PBMT* encoding unconditionally.
> > 
> > Drop Svpbmt from required_extensions, and introduce pte_pbmt(), which masks
> > the requested PBMT encoding down to 0 when Svpbmt is unavailable, using it
> > in both remaining unguarded spots.
> > 
> > Assisted-by: Claude:claude-opus-5
> > Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> > ---
> >   xen/arch/riscv/cpufeature.c       | 1 -
> >   xen/arch/riscv/include/asm/page.h | 8 ++++++--
> >   xen/arch/riscv/p2m.c              | 2 +-
> >   3 files changed, 7 insertions(+), 4 deletions(-)
> > 
> > diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
> > index 92235fdfd5..900cb9d772 100644
> > --- a/xen/arch/riscv/cpufeature.c
> > +++ b/xen/arch/riscv/cpufeature.c
> > @@ -157,7 +157,6 @@ static const struct riscv_isa_ext_data __initconst required_extensions[] = {
> >       RISCV_ISA_EXT_DATA(zifencei),
> >       RISCV_ISA_EXT_DATA(zihintpause),
> >       RISCV_ISA_EXT_DATA(zbb),
> > -    RISCV_ISA_EXT_DATA(svpbmt),
> >   };
> 
> Also, please update docs/misc/riscv/booting.txt.
> 
Right, I will do that in v2.
> >   
> >   static bool __init is_lowercase_extension_name(const char *str)
> > diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
> > index 5c02f64a17..6a3749526d 100644
> > --- a/xen/arch/riscv/include/asm/page.h
> > +++ b/xen/arch/riscv/include/asm/page.h
> > @@ -11,6 +11,7 @@
> >   #include <xen/types.h>
> >   
> >   #include <asm/atomic.h>
> > +#include <asm/cpufeature.h>
> >   #include <asm/page-bits.h>
> >   
> >   #define VPN_MASK                    (PAGETABLE_ENTRIES - 1UL)
> > @@ -54,6 +55,9 @@
> >   #define PAGE_HYPERVISOR_RX          (PTE_LEAF_DEFAULT | PTE_EXECUTABLE)
> >   
> >   #define PAGE_HYPERVISOR             PAGE_HYPERVISOR_RW
> > +
> > +#define pte_pbmt(pbmt) \
> > +    (riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svpbmt) ? (pbmt) : 0UL)
> 
> Checking the ISA string alone isn't sufficient.
> 
> Svpbmt in HS-mode is gated by menvcfg.PBMTE. If M-mode firmware hasn't 
> set it, the hardware behaves as though Svpbmt were not implemented: bits 
> [62:61] become reserved again, and a non-zero encoding raises a page 
> fault (even though the DT ISA string advertises svpbmt). The same 
> applies to the G-stage mappings built by p2m_pte_from_mfn() below.
> 
> menvcfg isn't readable from S-mode, but the spec gives an indirect 
> probe: when menvcfg.PBMTE is 0, henvcfg.PBMTE is read-only zero. Xen 
> already relies on exactly this in vcpu_csr_init() (ENVCFG_PBMTE & 
> csr_masks.henvcfg). So it would be more robust to compute a single flag 
> in init_csr_masks():
yes right, thanks.
> pbmt_enabled = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svpbmt) 
> && (csr_masks.henvcfg & ENVCFG_PBMTE);
> 
> and have pte_pbmt() test that instead. This makes the check reflect what 
> the hardware will actually honour rather than what the DT claims, and it 
> also collapses the condition in vcpu_csr_init() to a single test.
> 
>  > +
>  > +#define pte_pbmt(pbmt) \
>  > +    (riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svpbmt) ? 
> (pbmt) : 0UL)
> 
> PAGE_HYPERVISOR_NOCACHE / PAGE_HYPERVISOR_WC are no longer constant 
> expressions, they are now evaluated at each use site. riscv_fill_hwcap() 
> runs fairly late in start_xen(), after setup_fixmap_mappings(), 
> early_fdt_map() and setup_mm(). All current ioremap() callers (aplic.c, 
> kernel.c) run after it, so the code is correct today, but this is an 
> implicit dependency: any ioremap introduced earlier in boot would 
> silently get PBMT=0 with no diagnostic. I don't know honestly speaking 
> if it is a real issue.
> 
> Worth either documenting this with a comment next to pte_pbmt(), or 
> adding an ASSERT() on the initialisation state. Switching to the 
> __ro_after_init flag suggested above makes the dependency explicit, 
> since the flag can be set alongside csr_masks, which is also populated 
> after riscv_fill_hwcap().

Agreed, but let's do both, not either/or.

The __ro_after_init flag helps, I agree, but it doesn't guard against calling too early and, so a premature call (e.g. ioremap() before init_csr_masks()) would still
silently read "unavailable" and PBMT=0, same as today.

So I'd keep the flag and add an ASSERT() where it's read, checking init has actually run, so premature use trips a debug build instead of silently
defaulting to PBMT=0.
> 
>  > +
>  > +#define pte_pbmt(pbmt) \
>  > +    (riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svpbmt) ? 
> (pbmt) : 0UL)
> 
> pte_pbmt(pbmt) reads like a PTE accessor, i.e. something with the 
> signature pte_pbmt(pte) -> enum pbmt_type, especially given that enum 
> pbmt_type is declared just below in the same header. What it actually 
> does is convert a requested PBMT encoding into the encoding that may 
> safely be written to a PTE on this hardware.
> 
> Something like PTE_PBMT() (matching the PTE_* naming of the values it 
> takes) or pbmt_encoding() would convey that better.
Ok I'll do that in v2.
> 
> ~ Oleksii
> 
> >   /*
> >    * PAGE_HYPERVISOR_NOCACHE is used for ioremap().
> >    *
> > @@ -61,8 +65,8 @@
> >    * is that IO is non-idempotent and strongly ordered, which makes it a good
> >    * candidate for mapping IOMEM.
> >    */
> > -#define PAGE_HYPERVISOR_NOCACHE     (PAGE_HYPERVISOR_RW | PTE_PBMT_IO)
> > -#define PAGE_HYPERVISOR_WC          (PAGE_HYPERVISOR_RW | PTE_PBMT_NOCACHE)
> > +#define PAGE_HYPERVISOR_NOCACHE     (PAGE_HYPERVISOR_RW | pte_pbmt(PTE_PBMT_IO))
> > +#define PAGE_HYPERVISOR_WC          (PAGE_HYPERVISOR_RW | pte_pbmt(PTE_PBMT_NOCACHE))
> >   
> >   /*
> >    * The PTE format does not contain the following bits within itself;
> > diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
> > index 11dc289f0f..f6e635ec1d 100644
> > --- a/xen/arch/riscv/p2m.c
> > +++ b/xen/arch/riscv/p2m.c
> > @@ -683,7 +683,7 @@ static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t,
> >           switch ( t )
> >           {
> >           case p2m_mmio_direct_io:
> > -            e.pte |= PTE_PBMT_IO;
> > +            e.pte |= pte_pbmt(PTE_PBMT_IO);
> >               break;
> >   
> >           default:
> 
> 
> 



