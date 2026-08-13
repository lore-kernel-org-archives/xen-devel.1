Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9D8C5CFDB
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 09:50:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389685.1630327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuS4Z-0002cZ-Q3; Thu, 13 Aug 2026 09:50:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389685.1630327; Thu, 13 Aug 2026 09:50:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuS4Z-0002c6-LT; Thu, 13 Aug 2026 09:50:03 +0000
Received: by outflank-mailman (input) for mailman id 1389685;
 Thu, 13 Aug 2026 09:50:02 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wuS4Y-0002Ej-ED
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 09:50:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuS4X-00CbGr-EW
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 11:50:01 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ffa87495f000c4f3@swg.vates.tech>)
 id 6a7d933f-e002-0a2a0a5209dd-0a2a4502b2c4-30
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 11:50:01 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ffa87495f000c4f3@swg.vates.tech>)
 id 6a7d9349-6ca4-0a2a45020019-b9ff1c239e5f-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 11:50:01 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ffa87495f000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 13 Aug 2026 09:49:57 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 2089B80272;
 Thu, 13 Aug 2026 11:49:57 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=NPqZPX6/ZqPWIGR3WctQKZt5kCZfDYrnw4Tq7Z4I7J0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=IHaaPEpwmtub9ej4gdnnVcGlFfy03hajeSqa8x/KslKYIGBEb4cMxeNCvCdJeh9U2/TW7a+Pb
 DOULLUjktRE34TYoq7GeZXAtHhH5T0tD9RYmGYpU/wXcjjybF4Xijeyd7LkcVnjHis7HYKt/dx9
 AMmaDkmUq045/obsL5tTPreqixdf6B8Rkk0Jl23EFg7xgkofMVSUPquShPoZ68NqR5rdxXVyy2d
 LYC4+tH3FXZivE8Rcg638ce5YiycH6YvmxXKUgnY2ZXqxT4f6OKTy39AIghJpyIL9qbYsck/Wev
 5wzsC2m/F0xNHYqP7B1Rv2w+X7VpyoRD9ubHarQJfPJg==
X-Zone-Loop: a870f0d987d863c2df42a265577ec54076a38534070c
x-campaign-type: default
x-transaction-id: d5dd0a3f-ac19-4824-88cc-1fdddf2da98b
x-swg-uid: 01-5b564f3a-9c35-4972-a9e9-7d19f14c3f4a
X-Mailer: Sweego
Message-ID:
 <1786614598.8631fc262581453bbf619ec5b2062170.19ffa87495f000c4f3@vates.tech>
x-swg-bid: 1786614598.8631fc262581453bbf619ec5b2062170.19ffa87495f000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v1 06/17] xen/riscv: map IMSIC interrupt file for vCPUs
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <5ea1202d-7635-46f7-8238-e3d54b588afd@gmail.com>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <254f470ae2e2b2a4affa7c405be8c07a7d8b300e.1784560663.git.oleksii.kurochko@gmail.com>
 <1786612004.8631fc262581453bbf619ec5b2062170.19ffa5fb46a000c4f3@vates.tech>
 <5ea1202d-7635-46f7-8238-e3d54b588afd@gmail.com>
Date: Thu, 13 Aug 2026 11:49:51 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786614597; l=5411;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=MIDT3TxqJ+iHOmwxSTp6i9jHP/P7WauNQOtPNS2v7dw=;
 b=aKMzpNzXKSg2aq8NgQIplIYBgPiNO6OLZ3IEJTCfCkGDXGoetxva+f9diYjWtEfQhccWUsqU+
 k9pcmIXwAvsAq1FCJOGW54XTC8iogX7coFoCjDzAk35RicFbb/imFuE
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1786614597434
X-purgate-ID: tlsNG-720697/1786614601-F2EB32AC-BF15E589/10/73395122804
X-purgate-type: spam
X-purgate-size: 5415

On 2026-08-13 11:42 +0200, Oleksii Kurochko wrote:
> 
> 
> On 8/13/26 11:06 AM, Baptiste Le Duc wrote:
> >> A guest running in VS-mode expects its own IMSIC S-file at offset 0 of its
> >> guest-physical IMSIC block. Physically, the guest-file (G-file) assigned to
> >> this vCPU lives at a hart-relative offset given by guest_file_id (assigned
> >> via the vGEIN allocator). Therefore, imsic_map_guest_file() uses stage-2
> >> translation to redirect the guest's fixed per-vCPU GPA page (offset 0) to
> >> the specific physical guest-file page.
> >>
> >> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > 
> > 
> >>
> >> diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
> >> index ffce77209c..c5ae74e456 100644
> >> --- a/xen/arch/riscv/imsic.c
> >> +++ b/xen/arch/riscv/imsic.c
> >> @@ -25,7 +25,9 @@
> >>   #include <xen/spinlock.h>
> >>   #include <xen/xvmalloc.h>
> >>   
> >> +#include <asm/aia.h>
> >>   #include <asm/imsic.h>
> >> +#include <asm/p2m.h>
> >>   
> >>   #define IMSIC_HART_SIZE(guest_bits) (BIT(guest_bits, U) * IMSIC_MMIO_PAGE_SZ)
> >>   
> >> @@ -342,6 +344,67 @@ static int __init imsic_parse_node(const struct dt_device_node *node,
> >>       return 0;
> >>   }
> >>   
> >> +/*
> >> + * Map the physical IMSIC guest interrupt file (G-file) assigned to vCPU v
> > Nit: What is this `v`?
> 
> A function argument. But I will just drop v from the comment.
> 
> >> + * into the domain's stage-2 guest-physical address space.
> >> + *
> >> + * In the machine's physical address space (SPA), each hart's IMSIC
> >> + * supervisor-level file (S-file) is located at offset 0 of its address block,
> >> + * followed contiguously by GEILEN guest files at offsets of 1, 2, ..., N pages.
> >> + *
> >> + * Because a guest OS running in VS-mode expects its own supervisor-level
> >> + * interrupt file to be at offset 0 of its guest-physical IMSIC block, the
> >> + * hypervisor must use stage-2 address translation to map the vCPU's
> >> + * guest-physical "supervisor" page (GPA offset 0) to the specific
> >> + * physical guest file page (SPA offset guest_file_id) on the physical hart.
> >> + *
> >> + * Xen pins each vCPU to a pCPU (v->processor) and assigns it a physical
> > 
> > 
> >> + * guest file index (guest_file_id) from the vGEIN allocator. A guest_file_id
> >> + * of 0 indicates that no hardware guest file is selected (matching the
> >> + * architectural behavior where vGEIN = 0 in the hstatus CSR selects no
> >> + * guest external interrupt source), requiring the VS-file to be emulated
> >> + * in software.
> >> + *
> >> + * The base guest-physical address advertised to the guest in the device
> >> + * tree matches offset 0 of the vCPU's virtual IMSIC block. Stage-2
> >> + * translation ensures that guest supervisor accesses to this page are
> >> + * transparently routed to the real hardware VS-file granted to it on
> >> + * the current pCPU.
> >> + */
> >> +int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id)
> >> +{
> >> +    int res = 0;
> >> +    struct domain *d = v->domain;
> >> +    unsigned int cpu = v->processor;
> >> +    vaddr_t gaddr = imsic_cfg.base_addr + (IMSIC_MMIO_PAGE_SZ * v->vcpu_id);
> > 
> > The variable holds a guest-physical address, so vaddr_t is the wrong
> > type should be either paddr_t or gaddr_t.
> 
> Agree, paddr_t will be better what was mentioned in thread with Jan B.
> 
> > 
> >> +    paddr_t paddr;
> >> +    unsigned long guest_stride;
> >> +
> >> +    /* Nothing to map in the case of sw interrupt file. */
> > 
> > There is no software interrupt file implementation in this series, patch 11
> > turns the non-MSI path into a BUG_ON(). So "vsfile_id == 0" today means "this
> > vCPU gets no external interrupts at all and nothing tells anybody". Worth
> > saying so plainly here rather than implying a fallback exists.
> 
> I would ask then different question will this function change when IMSIC 
> interrupt file support will be added? I think - no as in the case of 
Did you forget s/w word? If not it's weird as IMSIC interrupt file is
the current topic of this patch series.
> IMSIC interrupt file we don't need any stage-2 mapping. So here it is 
here too.
> just a check that nothing should be mapped for non-hw-assisted interrupt 
> files.
> 
> > 
> >> +    if ( !vsfile_id )
> >> +        return res;
> >> +
> >> +    guest_stride = vsfile_id * IMSIC_MMIO_PAGE_SZ;
> > 
> > 
> >> +
> >> +    paddr = imsic_cfg.msi[cpu].base_addr + imsic_cfg.msi[cpu].offset +
> >> +            guest_stride;
> > 
> > 
> >> +
> >> +#ifdef IMSIC_DEBUG
> > 
> >> +    printk("%s: %pv: ga(%#lx) -> pa(%#lx), cpu(%#x), guest_file_id(%d) "
> >> +           "base_addr(%#lx) offset(%#lx)\n", __func__, v, gaddr, paddr, cpu,
> >> +           vsfile_id, imsic_cfg.msi[cpu].base_addr, imsic_cfg.msi[cpu].offset);
> >> +#endif
> >> +
> >> +    res = map_regions_p2mt(d, gaddr_to_gfn(gaddr),
> >> +                           PFN_DOWN(IMSIC_MMIO_PAGE_SZ), maddr_to_mfn(paddr),
> >> +                           arch_dt_passthrough_p2m_type());
> >> +    if ( res )
> >> +        printk("%s: Failed to map %#lx to the guest at %#lx\n",
> > 
> > Maybe a use of dprintk() would be more appropriate?
> > 
> Agree, dprintk() will be better.
> 
> Thanks.
> 
> ~ Oleksii
> 
> 
> 



