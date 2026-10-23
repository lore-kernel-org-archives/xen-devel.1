Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A4A606A31D
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 13:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=PZ/+qbfg
Received: from list by lists.xenproject.org with outflank-mailman.1459295.1671274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKFgJ-0005Lk-E1; Fri, 23 Oct 2026 13:51:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1459295.1671274; Fri, 23 Oct 2026 13:51:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKFgJ-0005Ld-BE; Fri, 23 Oct 2026 13:51:39 +0000
Received: by outflank-mailman (input) for mailman id 1459295;
 Fri, 23 Oct 2026 13:51:38 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xKFgH-0005LX-Pb
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 13:51:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xKFgG-00FOUK-PI
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 15:51:36 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a16907f005000f79f@swg.vates.tech>)
 id 6adb6668-2eae-0a2a0a5409dd-0a2a4504b396-4
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 15:51:36 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a16907f005000f79f@swg.vates.tech>)
 id 6adb6668-b57f-0a2a45040019-b9ff1c228cbb-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 15:51:36 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a16907f005000f79f.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 23 Oct 2026 13:51:30 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 6270F82BC4;
 Fri, 23 Oct 2026 15:51:29 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=pwcayrKNq12XtW4q5rh8elJhLg7t2tXGSuwyzMGCNNc=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=PZ/+qbfglxuj+qUfhGzD2qUEYjb26NjLYgluTbJj9l46c+5b3GB7sUJkh7v/ZcmtU95ZdGwzZ
 gNUO5fZuNGQDXk2goSd1h5krTem4/Y0Y/QFkhL3uyBFW3jAUN1Yn73HBfclytuBq2H27HZAPExT
 wCcBR4H9p98EKdMsd78xrJrfxWXuDR57kqZf8YvDSKDbkzi10kBqMHbjnYUttrOxy6ek8dTiGD+
 1b18bbEZEKns1xbe3Bt2+UC/1wuOBvYhjinWDBHeTapydUYqhLIM2hQUequZ4JlCwfJw3XB6FyK
 veii5ijZKnIraMd8Y9UwX18cH7BCBf2tPQSbzBLGwVoA==
X-Zone-Loop: d990d5e65dc03d8084f0ad9d138d0413aec4d4d253ea
x-campaign-type: default
x-transaction-id: 5e623cdc-d987-4d93-b241-44a7eb8df893
x-swg-uid: 01-c1df5276-8486-48a2-8350-dfe1dfc49b2e
X-Mailer: Sweego
Message-ID:
 <1792763490.8631fc262581453bbf619ec5b2062170.1a16907f005000f79f@vates.tech>
x-swg-bid: 1792763490.8631fc262581453bbf619ec5b2062170.1a16907f005000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 30/39] xen/riscv: implement APLIC-IMSIC-hart sync
 barrier for vCPU migration
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Zheng Zhang <zhangzheng@iscas.ac.cn>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <c77101fe-2505-4cdb-8520-52f92a1c668d@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <2075cb10e5f6df787b29f2f087632c82b787a007.1790779209.git.oleksii.kurochko@gmail.com>
 <c77101fe-2505-4cdb-8520-52f92a1c668d@gmail.com>
Date: Fri, 23 Oct 2026 15:51:23 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792763484; l=14503;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=ByT7kbjI8I1xqiNPT5/Vh3OaQRHptRG0hGjGa9deZ2c=;
 b=mNf6DM6HPXpL/GCJiwW8O1HLel9vGgwoZxIBxQAcvTyOVRJFDXYc9YaNHNa6YZbBKUqAHPoDh
 urFa95trpLXCGRUUzuXIb6yTaAS0V0kM+WV1fjPLxO5BV6dnYQC7Lph
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792763489621
X-purgate-ID: tlsNG-ebf023/1792763496-C32CCB50-AB6CCD32/10/73395122804
X-purgate-type: spam
X-purgate-size: 14503
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-06 16:25:55+02:00, Oleksii Kurochko wrote:
> On 9/30/26 6:23 PM, Oleksii Kurochko wrote:
> > When a vCPU is moved to a different guest interrupt file, MSIs that the
> > APLIC has already sent towards the old file may still be in flight. They
> > must land before the old file's state is saved and the switch is done,
> > otherwise they would be lost.
> > 
> > To wait for them, use the APLIC's genmsi register. Writing it makes the
> > APLIC itself send an MSI (an "extempore" MSI) with a given interrupt
> > identity to a given hart. genmsi can only target the hart's hypervisor-
> > level interrupt file, not a guest one, but the AIA spec guarantees that
> > all MSIs previously sent by the same APLIC to the same hart become
> > visible at the hart's IMSIC before the extempore MSI does. So once the
> > extempore MSI has been delivered, no older MSI from this APLIC to the
> > hart can still be in flight, whichever interrupt file it targets.
> > 
> > genmsi's Busy bit clearing only tells that the APLIC has sent the
> > extempore MSI, not that it has arrived, so the sequence described in the
> > AIA spec under "Synchronizing interactions between a hart and the APLIC"
> > is split in two. aplic_genmsi_barrier() does the APLIC side, while
> > imsic_aplic_sync() does the hart side: it clears the pending bit of the
> > reserved identity before the genmsi write and spins on it afterwards,
> > which is what tells that the extempore MSI, and hence every older MSI
> > from this APLIC to this hart, has really arrived. Keeping the hart side
> > in imsic.c leaves the APLIC code free of the IMSIC local CSR accessors.
> > 
> > The last interrupt identity (nr_ids) is reserved for this purpose.
> > 
> > Migration doesn't use the barrier at this stage, so imsic_migrate_vcpu()
> > only references imsic_aplic_sync() to keep the compiler from complaining
> > about it being unused.
> > 
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in v3:
> >   - Rename from "xen/riscv: implement APLIC-hart sync barrier for vCPU
> >     migration", as the barrier waits for the MSIs to reach the hart's IMSIC.
> >   - Re-word the commit message, describing in it how the sequence is split
> >     between aplic_genmsi_barrier() and imsic_aplic_sync().
> >   - Move imsic_aplic_sync(), imsic_local_is_pending() and imsic_csr_read()
> >     here from "xen/riscv: remap interrupts to new IMSIC VS-file", so that
> >     both halves of the synchronization sequence are introduced together.
> >   - s/aplic_hart_field/aplic_hart_index/ following the rename of the helper
> >     in "xen/riscv: implement virtual APLIC MMIO emulation".
> >   - Drop masking of sync_id with APLIC_TARGET_EIID, which could silently
> >     chop off bits; instead add BUILD_BUG_ON() and ASSERT() to make it
> >     explicit that sync_id always fits into the EIID field.
> >   - Drop the redundant parentheses around the macro argument in
> >     imsic_csr_read().
> >   - Use unsigned int for isel in imsic_local_is_pending() and drop the
> >     redundant !! as the function returns bool.
> >   - Rename the unused argument of imsic_aplic_sync() to unused.
> > ---
> > Changes in v2:
> >   - New patch.
> > ---
> > ---
> >   xen/arch/riscv/aplic.c             | 33 +++++++++++++++++++
> >   xen/arch/riscv/imsic.c             | 52 ++++++++++++++++++++++++++++++
> >   xen/arch/riscv/include/asm/aplic.h |  3 ++
> >   xen/arch/riscv/include/asm/imsic.h |  8 +++++
> >   4 files changed, 96 insertions(+)
> > 
> > diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
> > index 283e5d6046a6..5f9a894b5a76 100644
> > --- a/xen/arch/riscv/aplic.c
> > +++ b/xen/arch/riscv/aplic.c
> > @@ -27,7 +27,9 @@
> >   #include <asm/imsic.h>
> >   #include <asm/intc.h>
> >   #include <asm/io.h>
> > +#include <asm/processor.h>
> >   #include <asm/riscv_encoding.h>
> > +#include <asm/smp.h>
> >   
> >   static struct aplic_priv aplic = {
> >       .lock = SPIN_LOCK_UNLOCKED,
> > @@ -183,6 +185,37 @@ void aplic_hw_write_reg(unsigned int offset, uint32_t value)
> >       spin_unlock_irqrestore(&aplic.lock, flags);
> >   }
> >   
> > +/*
> > + * As needed, synchronize with all IOMMUs and APLICs to ensure that no
> > + * straggler MSIs will arrive at the old interrupt file after this step.
> > + */
> > +void aplic_genmsi_barrier(void)
> > +{
> > +    const struct imsic_config *imsic = imsic_get_config();
> > +    unsigned int cpu = smp_processor_id();
> > +    unsigned long flags;
> > +    uint32_t val;
> > +
> > +    /*
> > +     * sync_id is nr_ids, which imsic_parse_node() limits to IMSIC_MAX_ID,
> > +     * so it always fits into the EIID field.
> > +     */
> > +    BUILD_BUG_ON(IMSIC_MAX_ID > MASK_EXTR(~0U, APLIC_TARGET_EIID));
> > +    ASSERT(imsic->sync_id <= IMSIC_MAX_ID);
> > +
> > +    val = MASK_INSR(aplic_hart_index(cpu), APLIC_TARGET_HART_IDX) |
> > +          imsic->sync_id;
> > +
> > +    spin_lock_irqsave(&aplic.lock, flags);
> > +
> > +    writel(val, &aplic.regs->genmsi);
> > +
> > +    while ( readl(&aplic.regs->genmsi) & APLIC_GENMSI_BUSY )
> > +        cpu_relax();
> > +
> > +    spin_unlock_irqrestore(&aplic.lock, flags);
> > +}
> > +
> >   static void __init aplic_init_hw_interrupts(void)
> >   {
> >       unsigned int i;
> > diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
> > index f1e44dc56bb8..8e0273eab902 100644
> > --- a/xen/arch/riscv/imsic.c
> > +++ b/xen/arch/riscv/imsic.c
> > @@ -27,6 +27,7 @@
> >   #include <xen/xvmalloc.h>
> >   
> >   #include <asm/aia.h>
> > +#include <asm/aplic.h>
> >   #include <asm/imsic.h>
> >   
> >   #define IMSIC_HART_SIZE(guest_bits) (BIT(guest_bits, U) * IMSIC_MMIO_PAGE_SZ)
> > @@ -60,6 +61,12 @@ static unsigned int __ro_after_init guest_num_msis;
> >   #define IMSIC_DISABLE_EITHRESHOLD   1
> >   #define IMSIC_ENABLE_EITHRESHOLD    0
> >   
> > +#define imsic_csr_read(c)       \
> > +({                              \
> > +    csr_write(CSR_SISELECT, c); \
> > +    csr_read(CSR_SIREG);        \
> > +})
> > +
> >   #define imsic_csr_write(c, v)   \
> >   do {                            \
> >       csr_write(CSR_SISELECT, c); \
> > @@ -203,6 +210,15 @@ void imsic_irq_enable(unsigned int irq)
> >        */
> >       ASSERT(!local_irq_is_enabled());
> >   
> > +    if ( irq == imsic_cfg.sync_id )
> > +    {
> > +        printk(XENLOG_WARNING
> > +               "irq%u is reserved for APLIC sync so shouldn't be set by %s\n",
> > +               irq, __func__);
> > +
> > +        return;
> > +    }
> > +
> >       spin_lock(&imsic_cfg.lock);
> >       /*
> >        * There is no irq - 1 here (look at aplic_set_irq_type()) because:
> > @@ -241,6 +257,15 @@ void imsic_irq_disable(unsigned int irq)
> >       spin_unlock(&imsic_cfg.lock);
> >   }
> >   
> > +static bool imsic_local_is_pending(unsigned int id)
> > +{
> > +    unsigned int isel =
> > +        (id / BITS_PER_LONG) * (BITS_PER_LONG / IMSIC_EIPx_BITS) + IMSIC_EIP0;
> > +    unsigned long bit = BIT(id % BITS_PER_LONG, UL);
> > +
> > +    return imsic_csr_read(isel) & bit;
> > +}
> > +
> >   /* Callers aren't intended to changed imsic_cfg so return const. */
> >   const struct imsic_config *imsic_get_config(void)
> >   {
> > @@ -387,6 +412,9 @@ static int __init imsic_parse_node(const struct dt_device_node *node,
> >   
> >       imsic_cfg.nr_eix = DIV_ROUND_UP(imsic_cfg.nr_ids + 1, 64);
> >   
> > +    /* Reserve last identity for APLIC-to-hart synchronization */
> > +    imsic_cfg.sync_id = imsic_cfg.nr_ids;
> > +
> >       /* Compute base address */
> >       *nr_mmios = 0;
> >       rc = dt_device_get_address(node, *nr_mmios, &base_addr, NULL);
> > @@ -497,6 +525,27 @@ static void imsic_call_on_cpu(unsigned int cpu, void (*func)(void *),
> >           on_selected_cpus(cpumask_of(cpu), func, data, 1);
> >   }
> >   
> > +/*
> > + * Ensure that all the MSIs the APLIC has already generated for the hart this
> > + * runs on have really reached the hart's IMSIC.
> > + *
> > + * The barrier is the one described by the AIA specification in
> > + * "Synchronizing interactions between a hart and the APLIC": ask the APLIC to
> > + * send an MSI to the hart itself and wait until it shows up as pending in the
> > + * hart's own interrupt file. As it says nothing about MSIs on their way to
> > + * any other hart, it has to be executed by the pCPU owning the interrupt file
> > + * the MSIs were being sent to.
> > + */
> > +static void cf_check imsic_aplic_sync(void *unused)
> > +{
> > +    imsic_local_eix_update(imsic_cfg.sync_id, 1, true, false);
> > +
> > +    aplic_genmsi_barrier();
> > +
> > +    while ( !imsic_local_is_pending(imsic_cfg.sync_id) )
> > +        cpu_relax();
> > +}
> > +
> >   static void cf_check imsic_vsfile_local_clear(void *data)
> >   {
> >       unsigned int i;
> > @@ -862,5 +911,8 @@ void imsic_migrate_vcpu(struct vcpu *v)
> >       /* Zero-out new IMSIC VS-file */
> >       imsic_call_on_cpu(v->processor, imsic_vsfile_local_clear, &vsfile_data);
> >   
> > +    /* Avoid an unused-function error until the barrier has a user. */
> > +    (void)imsic_aplic_sync;
> > +
> >       BUG_ON("unimplemented");
> >   }
> > diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
> > index 9018936ca95a..bfb510b2ae5e 100644
> > --- a/xen/arch/riscv/include/asm/aplic.h
> > +++ b/xen/arch/riscv/include/asm/aplic.h
> > @@ -94,6 +94,7 @@
> >   #define APLIC_SETIPNUM_LE               0x2000
> >   
> >   #define APLIC_GENMSI                    0x3000
> > +#define APLIC_GENMSI_BUSY               BIT(12, U)
> >   
> >   #define APLIC_TARGET_BASE               0x3004
> >   #define APLIC_TARGET_LAST               0x3ffc
> > @@ -177,4 +178,6 @@ struct aplic_regs {
> >   uint32_t aplic_hw_read_reg(unsigned int offset);
> >   void aplic_hw_write_reg(unsigned int offset, uint32_t value);
> >   
> > +void aplic_genmsi_barrier(void);
> > +
> >   #endif /* ASM_RISCV_APLIC_H */
> > diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
> > index 8130d125f5c3..f86407e21765 100644
> > --- a/xen/arch/riscv/include/asm/imsic.h
> > +++ b/xen/arch/riscv/include/asm/imsic.h
> > @@ -62,6 +62,14 @@ struct imsic_config {
> >        */
> >       unsigned int nr_eix;
> >   
> > +    /*
> > +     * Interrupt identity reserved exclusively for APLIC-to-hart
> > +     * synchronization.
> > +     *
> > +     * Must not be allocated to any interrupt source.
> > +     */
> > +    unsigned int sync_id;
> > +
> >       /* MSI */
> >       const struct imsic_msi *msi;
> >   
> 
> 
> I think it also makes sense here to apply the following fixup patch:
> 
> commit db57e94ed8405c98d7a21f4f88764fa5e0ea2d04 
> (riscv-next-upstreaming-fixups)
> Author: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Date:   Tue Oct 6 15:59:52 2026 +0200
> 
>      fixup! xen/riscv: implement APLIC-IMSIC-hart sync barrier for vCPU 
> migration
> 
>      In MSI delivery mode the MSI of APLIC source N carries identity N, by
>      which Xen recognises it in its own IMSIC interrupt file. A source
>      numbered sync_id or higher can't be told apart: its identity either
>      isn't implemented, so its MSIs are dropped, or is the one reserved for
>      the sync barrier, which it would satisfy early and whose pending bit
>      would swallow its interrupt. Limit the usable sources to those below
>      sync_id, and document how the identities of Xen's interrupt file are
>      allocated.
> 
> diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
> index 96aa4edb3958..86ff3cae984d 100644
> --- a/xen/arch/riscv/aplic.c
> +++ b/xen/arch/riscv/aplic.c
> @@ -246,6 +246,7 @@ static int __init cf_check aplic_init(void)
>       uint64_t size, paddr;
>       const struct dt_device_node *imsic_node;
>       const struct dt_device_node *node = aplic_info.node;
> +    const struct imsic_config *imsic;
>       int rc;
> 
>       /* Check for associated imsic node */
> @@ -270,6 +271,22 @@ static int __init cf_check aplic_init(void)
>           panic("%s: failed to get number of interrupt sources\n",
>                 node->full_name);
> 
> +    /*
> +     * In MSI delivery mode the MSI of source N carries identity N, by 
> which
> +     * Xen recognises it in its own IMSIC interrupt file. Hence the sources
> +     * numbered from sync_id on can't be used: their identities either 
> aren't
> +     * implemented or are the one reserved for the APLIC-IMSIC sync 
> barrier.
> +     */
> +    imsic = imsic_get_config();
> +    if ( aplic_info.num_irqs >= imsic->sync_id )
> +    {
> +        printk(XENLOG_WARNING
> +               "%s: only %u of %u interrupt sources usable with %u 
> IMSIC identities\n",
> +               node->full_name, imsic->sync_id - 1, aplic_info.num_irqs,
> +               imsic->nr_ids);
> +        aplic_info.num_irqs = imsic->sync_id - 1;
> +    }
> +
>       guest_aplic_num_sources = min(GUEST_APLIC_MAX_SOURCES, 
> aplic_info.num_irqs);
> 
>       if ( aplic_info.num_irqs > ARRAY_SIZE(aplic.regs->sourcecfg) )
> diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
> index ca5243826726..408b94b22ee9 100644
> --- a/xen/arch/riscv/imsic.c
> +++ b/xen/arch/riscv/imsic.c
> @@ -533,7 +533,15 @@ static int __init imsic_parse_node(const struct 
> dt_device_node *node,
> 
>       imsic_cfg.nr_eix = DIV_ROUND_UP(imsic_cfg.nr_ids + 1, 64);
> 
> -    /* Reserve last identity for APLIC-to-hart synchronization */
> +    /*
> +     * The identities of Xen's own interrupt file are allocated statically:
> +     *  - the APLIC sources take 1 .. riscv,num-sources, as the MSI of 
> source
> +     *    N carries identity N (aplic_init() drops the sources which 
> don't fit
> +     *    below sync_id);
> +     *  - the last one, nr_ids, is reserved for APLIC-to-hart 
> synchronization.
> +     * Anything else taking identities from this file has to stay clear of
> +     * both.
> +     */
>       imsic_cfg.sync_id = imsic_cfg.nr_ids;
> 
>       /* Compute base address */
> 
> Any thoughts about it?
LGTM, but I wonder why, as I said in the original patch, sync_id is
really needed.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

