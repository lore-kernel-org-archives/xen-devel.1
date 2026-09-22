Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF6FC982FE
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 15:37:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429176.1652107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x92YA-0006Qc-Q5; Tue, 22 Sep 2026 15:36:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429176.1652107; Tue, 22 Sep 2026 15:36:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x92YA-0006QV-Mk; Tue, 22 Sep 2026 15:36:54 +0000
Received: by outflank-mailman (input) for mailman id 1429176;
 Tue, 22 Sep 2026 15:36:53 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x92Y9-0006QM-LR
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 15:36:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x92Y8-00Aqez-TL
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 17:36:52 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c9c32ad300072c4@swg.vates.tech>)
 id 6ab2a07b-8faa-0a2a0a5109dd-0a2a4507c23e-48
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 17:36:52 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c9c32ad300072c4@swg.vates.tech>)
 id 6ab2a093-b4ea-0a2a45070019-b9ff1c2387af-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 17:36:52 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0c9c32ad300072c4.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 22 Sep 2026 15:36:46 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 3E73282362;
 Tue, 22 Sep 2026 17:36:45 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=8Ey3zrjI8D0i6oxEP4lWwENQRpC1B+d6F7u4VPCDVbY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=tQqDmq19nwHSxG4uKJYcONpEpqJvjbbhmT/1Nt94mVo7mmZH+EONo8aI99J6k7GflULDZsw2R
 Qy6P3NfMjLy1ZWv30yfLO/PKqIXlIy8ITFnc0d6AhXkGKFVO21pNLiD0okaFK+U+GwAFOJ9IQn1
 n7CeNTvjhFYduMMvONC9Ug2saUxR0w7ljtz6JTqFEO6Zp2YX4TZcr7/g+817083y3XKqetPKQGI
 bB/oNHBNbVn8O0SjQrrBdofV1DkIwZSfYu+w4bTJbacCOt6VGPP3fsN/SS0dZTs4JRvz64vr2JN
 LX1P/zWSZST4qirXdh7mC2703Wko4+C4E6Kz9xUR66rA==
X-Zone-Loop: 7417802adc134c79dc3dc9abfa987440dc040b2f0ddd
x-campaign-type: default
x-transaction-id: 3297e265-725e-44f0-85ef-f576fc4e46ea
x-swg-uid: 01-e66d5b4d-f032-49fd-a992-c3aadaa0c401
X-Mailer: Sweego
Message-ID:
 <1790091406.8631fc262581453bbf619ec5b2062170.1a0c9c32ad300072c4@vates.tech>
x-swg-bid: 1790091406.8631fc262581453bbf619ec5b2062170.1a0c9c32ad300072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 30/39] xen/riscv: prepare new IMSIC VS-file
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Zheng Zhang <zhangzheng@iscas.ac.cn>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <5b70c0d6-12ec-429c-be9c-a96d78d48e68@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <440bc07dfb72d09da72b49ded6f78dc1f54a3ad5.1787838835.git.oleksii.kurochko@gmail.com>
 <1790007309.8631fc262581453bbf619ec5b2062170.1a0c4bff57900072c4@vates.tech>
 <5b70c0d6-12ec-429c-be9c-a96d78d48e68@gmail.com>
Date: Tue, 22 Sep 2026 17:36:39 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790091399; l=10227;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=7eaUhQ0DVeRCoRnrDKsWiD50xCkTNrckjLHxLGNTNrs=;
 b=ZVhBnkmD3CK4Szwe1moI9uQcChVNn/R+z5Pehi4UBAzSoDsPYZboMHkomBLTMKqaMa7zC9ylb
 pgVYDl9c1AvDAR3eW9BxuOwMHxopq9jLRYEC4a6kuGjd+v1A6UTbRfF
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790091405462
X-purgate-ID: tlsNG-ef75cf/1790091412-A70DDAE4-E3D577A9/10/73395122804
X-purgate-type: spam
X-purgate-size: 10231

On 2026-09-22 15:01:02+02:00, Oleksii Kurochko wrote:
> On 9/21/26 6:15 PM, Baptiste Le Duc wrote:
> > 
> > 
> > On 8/27/26 5:24 PM, Oleksii Kurochko wrote:
> >> Implement first steps of migration a vCPU to a different guest 
> >> interrupt file
> >> procedure:
> >> - At the old interrupt file, save to memory the values of registers
> >>    eidelivery and eithreshold, and set eidelivery = 0.
> >> - At the new interrupt file, set eidelivery = 0, and zero all
> >>    implemented interrupt-pending bits (the eip array).
> >>
> >> The following steps will be introduced in follow-up patches.
> >>
> >> Add a BUG_ON("unimplemented") placeholder in imsic_migrate_vcpu() to 
> >> guard
> >> against silent incorrect behaviour or unexpected panics in guest VMs 
> >> until
> >> the function is fully implemented.
> >>
> >> vgein_assign() will be introduced later in a separate patch, for not 
> >> it is
> >> only stub.
> >>
> >> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> >> ---
> >> Changes in v2:
> >>   - New patch.
> >> ---
> >> ---
> >>   xen/arch/riscv/aia.c             |   9 ++
> >>   xen/arch/riscv/imsic.c           | 159 +++++++++++++++++++++++++++++++
> >>   xen/arch/riscv/include/asm/aia.h |   4 +
> >>   xen/include/xen/config.h         |   1 +
> >>   4 files changed, 173 insertions(+)
> >>
> >> diff --git a/xen/arch/riscv/aia.c b/xen/arch/riscv/aia.c
> >> index e31c9c2d24b6..75c82bcfa1b3 100644
> >> --- a/xen/arch/riscv/aia.c
> >> +++ b/xen/arch/riscv/aia.c
> >> @@ -1,8 +1,10 @@
> >>   /* SPDX-License-Identifier: GPL-2.0-only */
> >> +#include <xen/bug.h>
> >>   #include <xen/errno.h>
> >>   #include <xen/init.h>
> >>   #include <xen/sections.h>
> >> +#include <xen/sched.h>
> >>   #include <xen/types.h>
> >>   #include <asm/cpufeature.h>
> >> @@ -21,3 +23,10 @@ void __init aia_init(void)
> >>       _aia_usable = true;
> >>   }
> >> +
> >> +unsigned int vgein_assign(struct vcpu *v)
> >> +{
> >> +    BUG_ON("unimplemented\n");
> >> +
> >> +    return 0;
> >> +}
> >> diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
> >> index ad7fbe708bfd..516f0105352a 100644
> >> --- a/xen/arch/riscv/imsic.c
> >> +++ b/xen/arch/riscv/imsic.c
> >> @@ -26,6 +26,7 @@
> >>   #include <xen/spinlock.h>
> >>   #include <xen/xvmalloc.h>
> >> +#include <asm/aia.h>
> >>   #include <asm/imsic.h>
> >>   #define IMSIC_HART_SIZE(guest_bits) (BIT(guest_bits, U) * 
> >> IMSIC_MMIO_PAGE_SZ)
> >> @@ -77,6 +78,64 @@ do {                            \
> >>       csr_clear(CSR_SIREG, v);    \
> >>   } while (0)
> >> +#define imsic_vs_csr_write(c, v)    \
> >> +do {                                \
> >> +    csr_write(CSR_VSISELECT, (c));  \
> >> +    csr_write(CSR_VSIREG, (v));     \
> >> +} while ( 0 )
> >> +
> >> +/*
> >> + * Generic switchcase expansion pyramid.
> >> + * F is the per-operation leaf macro, ireg is the base register index.
> >> + * Optional extra args (e.g. an operation and/or a value) are 
> >> forwarded to F
> >> + * via __VA_ARGS__.
> >> + *
> >> + * imsic_switchcase_break(ireg, op, v) - emit "case ireg: op(ireg,v); 
> >> break;"
> >> + * imsic_switchcase_ret(ireg, op, ...) - emit "case ireg: return 
> >> op(ireg[,v]);"
> >> + *   The variadic tail is optional so the same leaf works for both 
> >> read (no v)
> >> + *   and swap (with v).
> >> + */
> >> +#define imsic_switchcase_break(ireg, op, v) \
> >> +    case ireg:                              \
> >> +        op(ireg, v);                        \
> >> +        break;
> >> +
> >> +#define imsic_switchcase_ret(ireg, op, ...) \
> >> +    case ireg:                              \
> >> +        return op(ireg, ##__VA_ARGS__);
> >> +
> >> +#define imsic_switchcase_2(F, ireg, ...)    \
> >> +    F(ireg + 0, ##__VA_ARGS__)              \
> >> +    F(ireg + 1, ##__VA_ARGS__)
> >> +#define imsic_switchcase_4(F, ireg, ...)    \
> >> +    imsic_switchcase_2(F, ireg + 0, ##__VA_ARGS__)  \
> >> +    imsic_switchcase_2(F, ireg + 2, ##__VA_ARGS__)
> >> +#define imsic_switchcase_8(F, ireg, ...)    \
> >> +    imsic_switchcase_4(F, ireg + 0, ##__VA_ARGS__)  \
> >> +    imsic_switchcase_4(F, ireg + 4, ##__VA_ARGS__)
> >> +#define imsic_switchcase_16(F, ireg, ...)   \
> >> +    imsic_switchcase_8(F, ireg + 0, ##__VA_ARGS__)  \
> >> +    imsic_switchcase_8(F, ireg + 8, ##__VA_ARGS__)
> >> +#define imsic_switchcase_32(F, ireg, ...)   \
> >> +    imsic_switchcase_16(F, ireg + 0, ##__VA_ARGS__) \
> >> +    imsic_switchcase_16(F, ireg + 16, ##__VA_ARGS__)
> >> +#define imsic_switchcase_64(F, ireg, ...)   \
> >> +    imsic_switchcase_32(F, ireg + 0, ##__VA_ARGS__) \
> >> +    imsic_switchcase_32(F, ireg + 32, ##__VA_ARGS__)
> >> +
> >> +static void imsic_eix_write(unsigned int ireg, unsigned long val)
> >> +{
> >> +    switch ( ireg )
> >> +    {
> >> +    imsic_switchcase_64(imsic_switchcase_break, IMSIC_EIP0,
> >> +                        imsic_vs_csr_write, val)
> >> +    imsic_switchcase_64(imsic_switchcase_break, IMSIC_EIE0,
> >> +                        imsic_vs_csr_write, val)
> >> +    default:
> >> +        ASSERT_UNREACHABLE();
> >> +    }
> >> +}
> >> +
> >>   unsigned int vcpu_guest_file_id(const struct vcpu *v)
> >>   {
> >>       return ACCESS_ONCE(v->arch.vimsic_state->guest_file_id);
> >> @@ -389,6 +448,76 @@ int cf_check vcpu_imsic_init(struct vcpu *v)
> >>       return 0;
> >>   }
> >> +/*
> >> + * Arguments of the imsic_vsfile_local_*() helpers, which are 
> >> executed by the
> >> + * pCPU owning the interrupt file, thereby through imsic_call_on_cpu().
> >> + */
> >> +struct imsic_vsfile_data {
> >> +    unsigned int hgei;
> >> +    unsigned int nr_eix;
> >> +    struct imsic_mrif *mrif;
> >> +};
> >> +
> >> +/*
> >> + * Execute func() on the pCPU which owns the IMSIC interrupt file 
> >> func() is
> >> + * going to work with.
> >> + *
> >> + * An IMSIC VS-file is reachable only through hstatus.VGEIN of the 
> >> hart the
> >> + * file belongs to, and a guest interrupt file index is meaningless 
> >> on any
> >> + * other hart, so such work always has to be done by that very hart.
> >> + *
> >> + * The local case runs with IRQs disabled to provide func() with the 
> >> same
> >> + * environment it is given when it is called from the function call IPI
> >> + * handler.
> >> + */
> >> +static void imsic_call_on_cpu(unsigned int cpu, void (*func)(void *),
> >> +                              void *data)
> >> +{
> >> +    if ( cpu == smp_processor_id() )
> >> +    {
> >> +        unsigned long flags;
> >> +
> >> +        local_irq_save(flags);
> >> +        func(data);
> >> +        local_irq_restore(flags);
> >> +    }
> >> +    else
> >> +        on_selected_cpus(cpumask_of(cpu), func, data, 1);
> >> +}
> >> +
> >> +static void cf_check imsic_vsfile_local_clear(void *data)
> > I think the remark from Jan to direclty pass the type instead of void
> > could be applied here.
> 
> I think it can't because of how function pointer is passed to 
> on_selected_cpus() through imsic_call_on_cpu().
> 
> >> +{
> >> +    unsigned int i;
> >> +    const struct imsic_vsfile_data *idata = data;
> >> +    unsigned long new_hstatus, old_hstatus, old_vsiselect;
> >> +
> >> +    /* We can only zero-out if we have a IMSIC VS-file */
> >> +    if ( !idata->hgei )
> >> +        return;
> >> +
> >> +    old_vsiselect = csr_read(CSR_VSISELECT);
> >> +    old_hstatus = csr_read(CSR_HSTATUS);
> >> +    new_hstatus = old_hstatus & ~HSTATUS_VGEIN;
> >> +    new_hstatus |= MASK_INSR(idata->hgei, HSTATUS_VGEIN);
> >> +    csr_write(CSR_HSTATUS, new_hstatus);
> >> +
> >> +    imsic_vs_csr_write(IMSIC_EIDELIVERY, 0);
> >> +    imsic_vs_csr_write(IMSIC_EITHRESHOLD, 0);
> >> +
> >> +    for ( i = 0; i < idata->nr_eix; i++ )
> >> +    {
> >> +        imsic_eix_write(IMSIC_EIP0 + i * 2, 0);
> >> +        imsic_eix_write(IMSIC_EIE0 + i * 2, 0);
> >> +#ifdef CONFIG_RISCV_32
> >> +        imsic_eix_write(IMSIC_EIP0 + i * 2 + 1, 0);
> >> +        imsic_eix_write(IMSIC_EIE0 + i * 2 + 1, 0);
> >> +#endif
> >> +    }
> >> +
> >> +    csr_write(CSR_HSTATUS, old_hstatus);
> >> +    csr_write(CSR_VSISELECT, old_vsiselect);
> >> +}
> >> +
> >>   void cf_check vcpu_imsic_deinit(struct vcpu *v)
> >>   {
> >>       XVFREE(v->arch.vimsic_state);
> >> @@ -689,6 +818,14 @@ int __init vimsic_make_domu_dt_node(struct 
> >> kernel_info *kinfo,
> >>   void imsic_migrate_vcpu(struct vcpu *v)
> >>   {
> >> +    unsigned int new_vsfile_hgei;
> >> +    unsigned int new_vsfile_cpu;
> >> +    unsigned int nr_hw_eix = DIV_ROUND_UP(imsic_cfg.nr_ids + 1,
> >> +                                          BITS_PER_TYPE(uint64_t));
> > This value appears to remain constant after initialization, since it 
> > depends directly on the hw,
> > so it is not necessary to calculate it each time.
> 
> I will add then:
> 
> --- a/xen/arch/riscv/include/asm/imsic.h
> +++ b/xen/arch/riscv/include/asm/imsic.h
> @@ struct imsic_config {
>       /* Number off interrupt identities */
>       unsigned int nr_ids;
> 
> +    /*
> +     * Number of 64-bit EIx groups needed to cover all the interrupt
> +     * identities, which are 0 (never valid, but it still occupies a 
> bit) up
> +     * to and including nr_ids.
> +     */
> +    unsigned int nr_eix;
> +
Thanks! Maybe use `registers` instead of `groups` wording.
> and init it once in imsic_parse_node().
> 
> Thanks.
> 
> ~ Oleksii



