Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920CBC61DE2
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2026 08:52:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1403842.1637797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0xkp-0006kZ-Je; Mon, 31 Aug 2026 08:52:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1403842.1637797; Mon, 31 Aug 2026 08:52:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0xkp-0006kS-H5; Mon, 31 Aug 2026 08:52:35 +0000
Received: by outflank-mailman (input) for mailman id 1403842;
 Mon, 31 Aug 2026 08:52:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a057052c8f000c4f3@swg.vates.tech>)
 id 1x0xko-0006kM-UG
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 08:52:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x0xko-00HOg5-0I
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 10:52:34 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a057052c8f000c4f3@swg.vates.tech>)
 id 6a9540c8-2eae-0a2a0a5409dd-0a2a45018490-38
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 10:52:33 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a057052c8f000c4f3@swg.vates.tech>)
 id 6a9540d1-5984-0a2a45010019-b9ff1c22b5cf-3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 10:52:33 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a057052c8f000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 31 Aug 2026 08:52:32 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 591BF81C20;
 Mon, 31 Aug 2026 10:52:31 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=wN4oI1pqSSmZevyRRnWvcJyhDznAEdGSpuUaffv3wmw=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=Pd2bliEne2MqW9XHs9TeWLHhJkwZvkXoDfQ8gWuKY4yWGevQ6Voro+IST7zUNadMbSPe6+Cxk
 aQxNFDt3YX9qqUEF/ezJqljP6jLyVHOual4A8EsX6HhRafzm3D7gfzR3Ozad+ygDI1plQdu48ES
 bk1ndkjFz8tpvUeW2NVTqii6UcioPvKqF/ZdL3uQIMxw//odFn/3itc98/TRHu4rIaelDtu8Un2
 bX7C1huC734ZWu5yjfjZeAhEn4PXc36mJ38FELmukz97la2brFv4SaDdgaidqBkpSXCGDs3uzvU
 38Hvh3We0XYlwtbaIO0lEDFIdhSghZMcReTsconnQI+g==
X-Zone-Loop: 77bef7a25afbb8c1c271140f68a267aa421f1c1cd451
x-campaign-type: default
x-transaction-id: 759c395a-9d1a-4f8f-b2d7-4eea986510c0
x-swg-uid: 01-8e5f51f7-83f5-42e7-b83c-eab78d885aef
X-Mailer: Sweego
Message-ID:
 <1788166352.8631fc262581453bbf619ec5b2062170.1a057052c8f000c4f3@vates.tech>
x-swg-bid: 1788166352.8631fc262581453bbf619ec5b2062170.1a057052c8f000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/5] xen/riscv: preset A/D bits in Xen's own page-table
 mappings
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
In-Reply-To: <ec69b941-2648-4c3f-bbee-95d4d56fb543@gmail.com>
References: <1787844438.8631fc262581453bbf619ec5b2062170.1a043d52a06000c4f3@vates.tech>
 <1787844809.8631fc262581453bbf619ec5b2062170.1a043dad225000c4f3@vates.tech>
 <ec69b941-2648-4c3f-bbee-95d4d56fb543@gmail.com>
Date: Mon, 31 Aug 2026 10:52:25 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788166351; l=6991;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=hRP6UFdLtn4+d3XHYIuVBgH7BQrTA6/VZs1SM9O2+RE=;
 b=SJOS/PMIUSgyDIsw4RVcN/0dn0eNDunjh7/G2N79YTKpO89HqOk4uP69MGLV/vh6tPfiqlFaU
 a5ZVauZdA/xA4qWu5iqpXclnHEtLxWdrQebOzcJzAgBea0NptSepSqv
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788166351555
X-purgate-ID: tlsNG-d62444/1788166353-BF86F757-24F670EE/0/0
X-purgate-type: clean
X-purgate-size: 6995

On 2026-08-28 15:34 +0200, Oleksii Kurochko wrote:
> 
> 
> On 8/27/26 5:33 PM, Baptiste Le Duc wrote:
> > The previous patch made p2m_set_permission() always set the PTE A/D bits to
> > map pages in G-stage, to avoid a page fault on platforms that implement
> > neither Svade nor Svadu, or that declare both in the device tree. Xen's own
> > page tables, built by setup_initial_mapping(), never go through
> > p2m_set_permission() and need the same fix.
> > 
> > Add PTE_ACCESSED to PTE_LEAF_DEFAULT and make it the minimal common leaf
> > permission set by dropping PTE_WRITABLE. Rebuild PAGE_HYPERVISOR_RO,
> > PAGE_HYPERVISOR_RW and PAGE_HYPERVISOR_RX from that common base, with
> > PAGE_HYPERVISOR_RW also adding PTE_DIRTY. Switch setup_initial_mapping() to
> > use these macros for its default, text, and rodata permissions instead of
> > the equivalent raw bit lists.
> > 
> > A PTE is a table entry iff PTE_VALID is set and R/W/X are all clear, so
> > update pte_is_table() accordingly.
> > 
> > Assisted-by: Claude:claude-opus-5
> > Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> > ---
> >   xen/arch/riscv/include/asm/page.h | 14 ++++++++------
> >   xen/arch/riscv/mm.c               |  7 +++----
> >   2 files changed, 11 insertions(+), 10 deletions(-)
> > 
> > diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
> > index b465a90325..5c02f64a17 100644
> > --- a/xen/arch/riscv/include/asm/page.h
> > +++ b/xen/arch/riscv/include/asm/page.h
> > @@ -46,12 +46,12 @@
> >   #define PTE_PBMT_NOCACHE            BIT(61, UL)
> >   #define PTE_PBMT_IO                 BIT(62, UL)
> >   
> > -#define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
> > +#define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE | PTE_ACCESSED)
> 
> Dropping PTE_WRITABLE here silently changes the permissions of an 
> existing user of this macro that the patch doesn't touch.
> 
> check_pgtbl_mode_support() in mm.c still builds its temporary root entry as:
>   index = pt_index(page_table_level, aligned_load_start);
>   stage1_pgtbl_root[index] = paddr_to_pte(aligned_load_start,
>                                       PTE_LEAF_DEFAULT | PTE_EXECUTABLE);
> 
> Before this patch that evaluated to V|R|W|X (RWX); afterwards it is 
> V|R|A|X (RX). So the mapping loses write permission.
> 
> I believe that is harmless in practice: the entry is only alive between 
> the csr_write(CSR_SATP, ...) that turns the MMU on and the 
> csr_write(CSR_SATP, 0) a few lines below, it only has to make the 
> current instruction stream fetchable so that the SATP mode probe can 
> complete, and nothing writes through it. Arguably RX is the better 
> permission set for it anyway. But it is still a behavioural change 
> rather than a cosmetic one, and the commit message doesn't mention it(it 
> only talks about setup_initial_mapping()).
> Please call it out explicitly there.
> 
> While at it, this site should be converted too:
> 
>      stage1_pgtbl_root[index] = paddr_to_pte(aligned_load_start,
>                                              PAGE_HYPERVISOR_RX);
> 
>
Sorry I didn't see this call site, you're right, it'll be better.
I will also explain why it goes from RWX to RX in the commit message.

> Otherwise the patch converts three sites in setup_initial_mapping() to 
> the new PAGE_HYPERVISOR_* macros while leaving a fourth one open-coding 
> the redefined PTE_LEAF_DEFAULT, which is exactly the kind of asymmetry 
> that makes the redefinition easy to miss on the next change.
> 
> After that conversion PTE_LEAF_DEFAULT has no users left
> outside page.h itself, so it could either be dropped entirely in favour 
> of PAGE_HYPERVISOR_{RO,RW,RX}, or renamed to something that reflects its 
> new meaning (PTE_LEAF_COMMON or similar). "DEFAULT" now names a set that 

I think, as every leaf pages could be read, it makes sense to rename it
to PTE_LEAF_COMMON, to make it clear it provides the minimal set of access.

> is not a usable permission on its own, which is misleading.
> 
> >   #define PTE_TABLE                   (PTE_VALID)
> >   
> > -#define PAGE_HYPERVISOR_RO          (PTE_VALID | PTE_READABLE)
> > -#define PAGE_HYPERVISOR_RW          (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
> > -#define PAGE_HYPERVISOR_RX          (PTE_VALID | PTE_READABLE | PTE_EXECUTABLE)
> > +#define PAGE_HYPERVISOR_RO          (PTE_LEAF_DEFAULT)
> > +#define PAGE_HYPERVISOR_RW          (PTE_LEAF_DEFAULT | PTE_WRITABLE | PTE_DIRTY)
> > +#define PAGE_HYPERVISOR_RX          (PTE_LEAF_DEFAULT | PTE_EXECUTABLE)
> 
> Adding A/D to PAGE_HYPERVISOR_RW fixes a second site beyond the ones the
> commit message mentions, and I think it deserves to be spelled out.
> 
> arch_pmap_map() in asm/pmap.h writes the fixmap leaf entry directly:
>      pte = pte_from_mfn(mfn, PAGE_HYPERVISOR_RW);
>      write_pte(entry, pte);
> i.e. it bypasses pt_update_entry(), which is the place that ORs in
> PTE_ACCESSED | PTE_DIRTY for everything going through map_pages_to_xen().
> So before this patch every pmap mapping was installed with A=D=0 and 
> would fault on first access under Svade, in exactly the same way the 
> boot page tables did.
> 
> The commit message currently frames the problem as "Xen's own page 
> tables, built by setup_initial_mapping()", which undersells the fix. 
> Please extend it to say that arch_pmap_map() is affected as well, and 
> that it is fixed by the PAGE_HYPERVISOR_RW change rather than by the 
> mm.c conversion.
Right, I will do that in v2.
> 
> FWIW I checked the remaining leaf-PTE construction sites (paddr_to_pte() 
> /pte_from_mfn() callers) and with these two the series covers all of 
> them: everything else either builds table entries (PTE_TABLE) or goes 
> through pt_update_entry() / p2m_set_permission(), both of which set A/D 
> themselves.
> 
> >   
> >   #define PAGE_HYPERVISOR             PAGE_HYPERVISOR_RW
> >   /*
> > @@ -177,7 +177,8 @@ static inline bool pte_is_table(pte_t p)
> >        *
> >        * PAGE_HYPERVISOR_RW contains PTE_VALID too.
> >        */
> > -    ASSERT(((p.pte & PAGE_HYPERVISOR_RW) != (PTE_VALID | PTE_WRITABLE)));
> > +    ASSERT((p.pte & (PTE_VALID | PTE_READABLE | PTE_WRITABLE)) !=
> > +           (PTE_VALID | PTE_WRITABLE));
> 
> Please drop the last line of the comment above it:
Ok I'll do that.
> 
>       * PAGE_HYPERVISOR_RW contains PTE_VALID too.
> 
> That sentence existed only to explain why the old mask was written as
> PAGE_HYPERVISOR_RW, i.e. that the macro is not just R|W but carries
> PTE_VALID as well, which is what made the comparison against V|W work.
> With the mask now written out literally, the macro is no longer 
> referenced anywhere in the function, so the line dangles. It is also 
> inaccurate now, since PAGE_HYPERVISOR_RW carries A and D in addition to V.
> 
> ~ Oleksii
> 
> 



