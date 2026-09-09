Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201EAC79FB6
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 12:03:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412888.1643176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4H11-0001TN-3h; Wed, 09 Sep 2026 12:02:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412888.1643176; Wed, 09 Sep 2026 12:02:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4H11-0001TG-0u; Wed, 09 Sep 2026 12:02:59 +0000
Received: by outflank-mailman (input) for mailman id 1412888;
 Wed, 09 Sep 2026 12:02:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0860cb11c000c4f3@swg.vates.tech>)
 id 1x4H0y-0001TA-Qb
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 12:02:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4H0y-00CMDP-7F
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 14:02:56 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0860cb11c000c4f3@swg.vates.tech>)
 id 6aa14ae7-e002-0a2a0a5209dd-0a2a4507a2d0-46
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 14:02:56 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0860cb11c000c4f3@swg.vates.tech>)
 id 6aa14aef-b4ea-0a2a45070019-b9ff1c2398ad-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 14:02:56 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0860cb11c000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 09 Sep 2026 12:02:53 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 1F9B281D0C;
 Wed,  9 Sep 2026 14:02:51 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=DRVzdlYg7u+JKQiDIxgiiOYbBBoqBlmWSLoU22CyEik=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=KvxOtDScrYcEi1TLoteRYP727Rd6FAuqbspSfsVGrHP5scf1NeAtlAz0JXunHyt2JV1vwSylF
 qwVxfgAIYkdfWRf10n540ZZy016HuTGyWHwg7qjhJfAsjUEJpT/jhlfVuNBOyFPHb0ehElnTFBy
 nFJRQB3kphDigndXjmd9H7Iz9cM84ctEdm2z6MmqqgpDVoQuDLBCIBgfEu8tzWCBaK0oUytTD46
 tAbuTbpmhSeC9wSp+/yygI42aKDKtOKvyrv+woEjlLXEsbhRQRa1lY5B9eyR5QFqnX1MTqk6NQG
 Ciiw9zzo+IqLLNKrNrPxMT9m10E4qhcXKhOAzgpce4Fw==
X-Zone-Loop: 4e6d492b330297936a2bb5555289a3790e3a09119967
x-campaign-type: default
x-transaction-id: 2d536c37-4874-45e4-a933-bee39f2f27fa
x-swg-uid: 01-3695df48-b236-41b9-abee-bc8e855589b9
X-Mailer: Sweego
Message-ID:
 <1788955373.8631fc262581453bbf619ec5b2062170.1a0860cb11c000c4f3@vates.tech>
x-swg-bid: 1788955373.8631fc262581453bbf619ec5b2062170.1a0860cb11c000c4f3
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
Date: Wed, 09 Sep 2026 14:02:45 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788955371; l=10184;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=q5ozkt96CaE0FinvuF687LELJyNwspS7AGQT+mxY0Ew=;
 b=ESE1eqTvlHs8WeEJ+8wT+7Gqv04SwyJMNoQQtVmdGXcCYChYBXXZ33Jlt2MVEMRB+0wxpVe3K
 X1DafZOF84QA6n9pNEzTHZhKgGvL5+X8HDYbtJwoBZCvEq32kAydMpB
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788955371337
X-purgate-ID: tlsNG-ef75cf/1788955376-A76D2AE4-8818A74E/0/0
X-purgate-type: clean
X-purgate-size: 10188

On 2026-08-28 17:58:14+02:00, Oleksii Kurochko wrote:
> On 8/27/26 5:33 PM, Baptiste Le Duc wrote:
> 
> > required_extensions[] panics at boot if Svpbmt is missing, which is a
> > problem on hardware that doesn't implement it.
> 
> Based only on this sentence it isn't clear why it is safe to have SvPBMT 
> = n and what guarantees that if some memory for a device dma for example 
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
> target physical address. Furthermore, on platforms that either feature 
> fully hardware-coherent DMA or do not expose non-coherent DMA agents to 
> the OS, page-level programmatic cache control via Svpbmt is not 
> required, making it safe to boot and run when Svpbmt is absent.
> ```
> 
>   Xen already checks Svpbmt at
> 
> > runtime in some places (vcpu_csr_init()), but not everywhere:
> 
> This part sounds like there are additional places where you think the 
> Svpbmt related bits should be set but I don’t see in this patch (or in 
> others in this patch series_ where you are adding Svpbmt related bits to 
> places where they weren’t added before. Am I missing something or did I 
> misunderstand your message? If the latter then could you please re-word 
> this part of the sentence.
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
> 
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
What do you think of something like that:

```
diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 2819ff4e7c..1b07d75105 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -47,6 +47,10 @@ static struct csr_masks __ro_after_init csr_masks;
 #define HENVCFG_VALID_MASK 0xe0000003000000ffUL
 #define HSTATEEN0_VALID_MASK 0xde00000000000007UL

+static unsigned int __ro_after_init is_pbmte;
+unsigned long __ro_after_init pte_pbmt_io;
+unsigned long __ro_after_init pte_pbmt_nocache;
+
 void __init init_csr_masks(void)
 {
     /*
@@ -79,6 +83,18 @@ void __init init_csr_masks(void)
         INIT_RO_ONE_MASK(HSTATEEN0, hstateen0);
     }

+    is_pbmte = (riscv_isa_extension_available(NULL,
+                RISCV_ISA_EXT_svpbmt)) && (ENVCFG_PBMTE &
+                csr_masks.henvcfg);
+
+    if (!is_pbmte)
+        pte_pbmt_io = pte_pbmt_nocache = 0;
+
+    else {
+        pte_pbmt_nocache = PTE_PBMT_NOCACHE;
+        pte_pbmt_io = PTE_PBMT_IO;
+    }
+
 #undef INIT_CSR_MASK
 #undef INIT_RO_ONE_MASK
 }
@@ -97,8 +113,8 @@ static void vcpu_csr_init(struct vcpu *v)
      */
     v->arch.hcounteren = HCOUNTEREN_TM;

-    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svpbmt) )
-        v->arch.henvcfg = ENVCFG_PBMTE & csr_masks.henvcfg;
+    if ( is_pbmte )
+        v->arch.henvcfg = ENVCFG_PBMTE;

     if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
     {
diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index 1cc01289a0..2ac2731eda 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -55,8 +55,6 @@

 #define PAGE_HYPERVISOR             PAGE_HYPERVISOR_RW

-#define pte_pbmt(pbmt) \
-    (riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svpbmt) ? (pbmt) : 0UL)
 /*
  * PAGE_HYPERVISOR_NOCACHE is used for ioremap().
  *
@@ -64,8 +62,10 @@
  * is that IO is non-idempotent and strongly ordered, which makes it a good
  * candidate for mapping IOMEM.
  */
-#define PAGE_HYPERVISOR_NOCACHE     (PAGE_HYPERVISOR_RW | pte_pbmt(PTE_PBMT_IO))
-#define PAGE_HYPERVISOR_WC          (PAGE_HYPERVISOR_RW | pte_pbmt(PTE_PBMT_NOCACHE))
+extern unsigned long pte_pbmt_nocache;
+extern unsigned long pte_pbmt_io;
+#define PAGE_HYPERVISOR_NOCACHE     (PAGE_HYPERVISOR_RW | pte_pbmt_io)
+#define PAGE_HYPERVISOR_WC          (PAGE_HYPERVISOR_RW | pte_pbmt_nocache)
```
This avoids having to recompute
PAGE_HYPERVISOR_NOCACHE/PAGE_HYPERVISOR_WC at each call site. However, I
don't like that PTE_PBMT_IO/pte_pbmt_io (resp.
PTE_PBMT_NOCACHE/pte_pbmt_nocache) end up coexisting, that's confusing
as we should not use PTE_PBMT_IO/PTE_PBMT_NOCACHE.

Another solution could be:
```
/* page.h */
extern bool svpbmt_enabled;

static inline unsigned long pte_pbmt_nocache(void)
{
    return svpbmt_enabled ? PTE_PBMT_NOCACHE : 0;
}

static inline unsigned long pte_pbmt_io(void)
{
    return svpbmt_enabled ? PTE_PBMT_IO : 0;
}

/* domain.c */

static unsigned int __ro_after_init svpbmt_enabled;
void __init init_csr_masks(void)
{
    ...

    svpbmt_enabled = (riscv_isa_extension_available(NULL,
                RISCV_ISA_EXT_svpbmt)) && (ENVCFG_PBMTE &
                csr_masks.henvcfg);
}
```
What do you think?

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
> 
> ~ Oleksii



