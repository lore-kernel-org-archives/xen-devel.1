Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D094FCA5FA2
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 13:21:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436024.1654774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBBIF-0005P6-LJ; Mon, 28 Sep 2026 13:21:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436024.1654774; Mon, 28 Sep 2026 13:21:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBBIF-0005Oz-IG; Mon, 28 Sep 2026 13:21:19 +0000
Received: by outflank-mailman (input) for mailman id 1436024;
 Mon, 28 Sep 2026 13:21:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0e82d3cf5000b504@swg.vates.tech>)
 id 1xBBIE-0005Os-CR
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 13:21:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBBID-00GLgA-8W
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 15:21:17 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0e82d3cf5000b504@swg.vates.tech>)
 id 6aba69cc-2eae-0a2a0a5409dd-0a2a4505c88a-8
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 15:21:17 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0e82d3cf5000b504@swg.vates.tech>)
 id 6aba69cc-4cb1-0a2a45050019-b9ff1c2295f3-3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 15:21:17 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0e82d3cf5000b504.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 28 Sep 2026 13:21:13 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 1F59982838;
 Mon, 28 Sep 2026 15:21:13 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=dhLRlieuAI+L0j4lzXyZc74iq21W1XyxqAGnlA8C30g=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=iByqBzwYNoZBYMXlwxCp/l1485j252imSOgNzgFzWL1YnbyKGvvgi9oeJox44NN4MtsCb97SK
 0XEFDeXhy2rayjfOAMbgAokhY4XS5X4mghk/DFeEdnCwZ2v0AsCwaxtUl8CoR/UwIypDqBjl0q0
 7OpJB11npKH9P/Gu8d5FHqDXHIrOGXyRNH/lHPYvrtmhNBHJWIYMm2zaOvGRbwXfETuJoLkJdvg
 K7cBja1EiFHur3sw/cNki3yse70RYgTXrfeQeoMkuci22ol33aLfEMAqNpmTIPWiHQTGeE4wD+J
 pYxxGkNBFkyruGWLGi1haEBA8H8qXgIfn3QrpaRohRog==
X-Zone-Loop: ed8fdf3b49db407ddf138a3e0ae7e496d437d730ff0e
x-campaign-type: default
x-transaction-id: e2bcc86f-30a8-41bc-b4eb-46023a37d0d0
x-swg-uid: 01-e8882fc0-9b24-45a9-9bb3-5b8132b8d017
X-Mailer: Sweego
Message-ID:
 <1790601674.8631fc262581453bbf619ec5b2062170.1a0e82d3cf5000b504@vates.tech>
x-swg-bid: 1790601674.8631fc262581453bbf619ec5b2062170.1a0e82d3cf5000b504
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 3/6] xen/riscv: make Svpbmt no longer a required
 extension
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 xen-devel@lists.xenproject.org, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <9ea9edfc-be76-4507-8b71-a483daa9e7d5@suse.com>
References: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
 <1789032898.8631fc262581453bbf619ec5b2062170.1a08aab9fe1000c4f3@vates.tech>
 <9ea9edfc-be76-4507-8b71-a483daa9e7d5@suse.com>
Date: Mon, 28 Sep 2026 15:21:07 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790601667; l=6427;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=joA3DSXJl4XNFVm+42bhVLW8aPXgNJ4DOxK+o7LXT0o=;
 b=PcHLGM5R21Gt19d32KUDzLMw2Cig8DyjT7A8ZrX1cJe4NtZGsv1Z7wJMkcS6W/uIVlsQ5Rf4n
 2oOQpO2mQ2hBDczAwO46rVWNT3K9p7Cz6uvwYRSkKfyLMN8sDGJRSyf
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790601673311
X-purgate-ID: tlsNG-c201ff/1790601677-24F1F2A1-9B730ECA/0/0
X-purgate-type: clean
X-purgate-size: 6429

On 2026-09-21 17:57:05+02:00, Jan Beulich wrote:
> On 10.09.2026 11:34, Baptiste Le Duc wrote:
>
> > Without the Svpbmt extension, memory attributes (such as cacheability and
> > ordering) are strictly tied to physical address ranges and enforced by the
> > hardware's Physical Memory Attributes (PMA) checker.
> >
> > In this configuration, supervisor software relies on the platform's memory
> > map:
> >     - peripheral device registers (MMIO) are physically mapped into
> >       hardware-defined I/O regions (which are implicitly non-cacheable and
> >       strongly-ordered)
> >     - regular RAM is mapped as cacheable main memory.
> >
> > S-mode paging can safely map these physical ranges without specifying
> > page-based memory types in the PTEs, as the hardware MMU and PMA pipeline
> > will correctly bypass caches for MMIO accesses and use caches for RAM
> > accesses, based on the target physical address.
>
> Provided firmware got absolutely everything right.

Agreed, but that dependency isn't new. Even with Svpbmt, all RAM mappings
(and most of Xen's own) use PBMT=PMA, so we already rely on the PMAs being
correct there; Svpbmt only lets us override them for ioremap() and
p2m_mmio_direct_io. I'll say this explicitly in v3 rather than claiming
it's "safe" unconditionally.

> > Furthermore, on platforms that either feature fully hardware-coherent DMA
> > or don't expose non-coherent DMA agents to the OS, page-level programmatic
> > cache control via Svpbmt is not required, making it safe to boot and run
> > when Svpbmt is absent.
>
> Yet a fully coherent platform should also be possible to somehow identify?

Yes, through the device tree: a device (or one of its parents) can be
marked "dma-noncoherent", with DMA being coherent by default, which is also
how Linux handles it on RISC-V (ARCH_DMA_DEFAULT_COHERENT).

Xen itself doesn't drive any DMA-capable device on RISC-V at this point, so
the only affected devices are those passed through to guests. In v3 I'm
adding a check in arch_handle_passthrough_prop() which warns when a device
marked "dma-noncoherent" is assigned while Svpbmt is unavailable. I went
for a warning rather than a refusal, like Linux does (WARN_TAINT()) for a
non-coherent device it has no means to handle.

> > Drop Svpbmt from required_extensions. Introduce svpbmt_enabled, a
> > __ro_after_init flag computed once in init_csr_masks() from ISA
> > availability and the henvcfg.PBMTE bit. Xen cannot read menvcfg.PBMTE
> > directly, since menvcfg is M-mode-only and unreadable from HS-mode, but the
> > spec guarantees henvcfg.PBMTE reads as zero whenever menvcfg.PBMTE is zero,
> > so checking henvcfg.PBMTE alone is sufficient.
>
> I don't understand this logic. If menvcfg.PBMTE is non-zero, we know
> nothing about (or from) henvcfg.PBMTE's setting.

I explained this badly. What's checked isn't the current value of
henvcfg.PBMTE but whether the bit is writable: init_csr_masks() identifies
which bits of henvcfg (and of other CSRs) are writable, by setting them,
reading the register back into csr_masks and restoring the original value.

As per the menvcfg description in the privileged spec ("for
implementations with the hypervisor extension, henvcfg.PBMTE is
read-only zero if menvcfg.PBMTE is zero"), the contrapositive is that
if henvcfg.PBMTE is writable (ENVCFG_PBMTE being present in
csr_masks.henvcfg), then menvcfg.PBMTE is set, i.e. firmware has enabled
Svpbmt for S-mode and G-stage address translation. I'll reword the
description accordingly.

> > --- a/xen/arch/riscv/domain.c
> > +++ b/xen/arch/riscv/domain.c
> > @@ -47,6 +47,8 @@ static struct csr_masks __ro_after_init csr_masks;
> >  #define HENVCFG_VALID_MASK 0xe0000003000000ffUL
> >  #define HSTATEEN0_VALID_MASK 0xde00000000000007UL
> >
> > +bool __ro_after_init svpbmt_enabled;
> > +
> >  void __init init_csr_masks(void)
> >  {
> >      /*
> > @@ -79,6 +81,10 @@ void __init init_csr_masks(void)
> >          INIT_RO_ONE_MASK(HSTATEEN0, hstateen0);
> >      }
> >
> > +    svpbmt_enabled = (riscv_isa_extension_available(NULL,
> > +                RISCV_ISA_EXT_svpbmt)) && (ENVCFG_PBMTE &
> > +                csr_masks.henvcfg);
>
> Line wrapping wants doing entirely differently here. One of the style-
> conforming options is
>
>     svpbmt_enabled =
>         riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svpbmt) &&
>         (csr_masks.henvcfg & ENVCFG_PBMTE);

Will do, thanks.

> > --- a/xen/arch/riscv/include/asm/page.h
> > +++ b/xen/arch/riscv/include/asm/page.h
> > @@ -11,6 +11,7 @@
> >  #include <xen/types.h>
> >
> >  #include <asm/atomic.h>
> > +#include <asm/cpufeature.h>
> >  #include <asm/page-bits.h>
> >
> >  #define VPN_MASK                    (PAGETABLE_ENTRIES - 1UL)
> > @@ -42,7 +43,21 @@
> >   *  01 - NC     Non-cacheable, idempotent, weakly-ordered Main Memory
> >   *  10 - IO     Non-cacheable, non-idempotent, strongly-ordered I/O memory
> >   *  11 - Rsvd   Reserved for future standard use
> > + *
> > + * These bits are only meaningful when Svpbmt is enabled. Otherwise they must
> > + * stay 0 (PMA).
> >   */
> > +extern bool svpbmt_enabled;
> > +static inline unsigned long pte_pbmt_nocache(void)
> > +{
> > +    return svpbmt_enabled ? BIT(61, UL) : 0;
> > +}
> > +
> > +static inline unsigned long pte_pbmt_io(void)
> > +{
> > +    return svpbmt_enabled ? BIT(62, UL) : 0;
> > +}
>
> Why open-code ...
>
> >  #define PTE_PBMT_NOCACHE            BIT(61, UL)
> >  #define PTE_PBMT_IO                 BIT(62, UL)
>
> ... what is still available here?

No good reason, v3 uses PTE_PBMT_NOCACHE / PTE_PBMT_IO.

> > @@ -53,6 +68,7 @@
> >  #define PAGE_HYPERVISOR_RX          (PTE_VALID | PTE_READABLE | PTE_EXECUTABLE | PTE_ACCESSED)
> >
> >  #define PAGE_HYPERVISOR             PAGE_HYPERVISOR_RW
> > +
> >  /*
> >   * PAGE_HYPERVISOR_NOCACHE is used for ioremap().
> >   *
>
> Stray change?

Yes, will drop.

> > @@ -82,7 +98,7 @@ enum pbmt_type {
> >
> >  #define PTE_ACCESS_MASK (PTE_READABLE | PTE_WRITABLE | PTE_EXECUTABLE)
> >
> > -#define PTE_PBMT_MASK   (PTE_PBMT_NOCACHE | PTE_PBMT_IO)
> > +#define PTE_PBMT_MASK   (BIT(61, UL) | BIT(62, UL))
>
> I don't understand the need for this change.

There's none, it's a leftover from an earlier iteration. Will drop.

Thanks,
Baptiste


