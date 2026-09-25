Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CE5C9831E
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2026 00:04:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1433207.1653988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9tPx-0004HE-Vd; Fri, 25 Sep 2026 00:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1433207.1653988; Fri, 25 Sep 2026 00:03:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9tPx-0004H7-So; Fri, 25 Sep 2026 00:03:57 +0000
Received: by outflank-mailman (input) for mailman id 1433207;
 Fri, 25 Sep 2026 00:03:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1x9tPv-0004H1-MS
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 00:03:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9tPu-006gpl-RV
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 02:03:54 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6ab5ba3d-8faa-0a2a0a5109dd-0a2a4502b700-30
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 02:03:54 +0200
Received: from [74.125.229.205] (helo=mail-lf2-f13.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6ab5ba6a-6ca4-0a2a45020019-4a7de5cd8c2d-3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 02:03:54 +0200
Received: by mail-lf2-f13.google.com with SMTP id
 2adb3069b0e04-5b8b402f4e3so435974e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 17:03:54 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1790294634; cv=none;
        d=google.com; s=arc-20260327;
        b=Rwz7jEHUlNgwyXOyjNjjWxK0IAPHryfB80CKmaeEZJnN3bhn6AiX/4VAAeDnJZH3vy
         cJvtwDlcuOt2dPFXJe+6KuSyHTyZL987cG0BRd2EWLq7BhrIcrvtyzK5RIv5NkOpHnar
         46fgsOXZpf7/mnWOuBQA9VWvycISUQXnx5KffyFyBon6ABaC+xkF8g06VMHVyiXIZNH2
         k/9BoAb5UCm8ge6dcdClGf+ZOneqGrSCGiQ9b+pc4zlsDbq44YpADg+Ds6tRTzALqE23
         EklKzloe6JM1MFOUrJCconPoW83U7HIVweiay0wXWMHA62mI/cECxhhiLouWRdUV4nq1
         St/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LAtR1MU7pBboArztGT2RTnp5s5hhpc9quEKm+QDeBo8=;
        fh=VVygVqEKqxbSkkpG2KWHkBBqFKK3JTiOtCO4AzPSZ7s=;
        b=UcsLRsbJ1Gimfbvb2AA7aKscdajhkGQwU6yFlj1/X6vyA7IR8lLGShm8VFz5nztxKT
         KNfLWCnRE9HWBcE/rXjaLfqwaNnbYAl3z7yqBT79Cm2DG3wTwInARLvfVBWufx64LS6H
         kSdlm/Me6yipnkStLCXPqEkplbPeHtaB/77Xo1QfT0sKG2cMwhbYGBVYkWFoX57UBF9i
         U5XqEm2rkyhq7PjNux9oGTs2Jyf25tGTEpk1RMurVArZ+369euR5Yf29+D20rkFf7pNC
         oCoC/+NuamDIF+uhhG8uFUGG7Oz4OdBT7qxh8lca/FKvMLgHH/V376GeVF9tHBwkpR+Y
         G61Q==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790294634; x=1790899434; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LAtR1MU7pBboArztGT2RTnp5s5hhpc9quEKm+QDeBo8=;
        b=Rt/J/0UcLgGbxCjXb0totUinJQvGld30wnoEIS6qC6R0zgayyF39xj4ZcXJr1QJyug
         N3f47N+V/K+8HqEt+Ew+nEylrl62B70XdSBIEtw2kJvuP5INi+QeNKlotIpaLLvreFl3
         CMn3jEQV6zfFAs1H3bF6TypjvkyB4eAxJDebjliuGokUlR2vVuJWPnhQK59xQJ11f1I8
         jPWFtpBtvVCh6hfzRDALx3BvdVXrKkgtk7kWYis7ge/De9BRmHB2qUdBWCfSdgSesqas
         YLzs56oWWTCyjDWDj1HUB7APck28xG9a2w59YFtIm3YyjdWlS9DRaZywIU2ayyoQuvgz
         NAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790294634; x=1790899434;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LAtR1MU7pBboArztGT2RTnp5s5hhpc9quEKm+QDeBo8=;
        b=tFRWEmazzIwuOv57Ao24WV8dscGKik2tYTer3PhTdkVFtaP3j/ORfZXLZDCG0It4NH
         mq/bXV/8LCGxt+I6Hb9wuccA6V/daKqYgDD+NpfZZRDNWcKZvr7x53maFK0EYicPPuCc
         T7e3SAzHFyaJnh2skxyIEITI1SoPQ8We+Kaz1fWkn4t/CJlrK390gPIDRiE/SKP316gu
         DWqydVz8TRt6C0knlQxonJoi8NnIrR+0Jwl/TWSH3n5BnAlL6MEfyPd6pIn0Xu9Eucg4
         zotgdmASLmFpn174iuDu0j8y3nsR1njzIg5dkhdOsEASToybM9Qw0EYFYJAEAus3T7pe
         altg==
X-Forwarded-Encrypted: i=1; AKwUvBzMQaq/9oURn+JiDRzqXkbz6+bIu2YyIAAlA8UOUlxqYr8AuIYAs92h7/eo2FvkN0GqXX4PoVwuHy0=@lists.xenproject.org
X-Gm-Message-State: AFuF++kBnPCQb+p1s3GsJ6ikEpGx0ANzKZnAqtF1FwODMHiCHo42oAAf
	Fw9n0f+79g5OGo7xGnFScRPL2/8hJA7eAtoF1LIap5Nij9u0zowEjy1MZQhYckEp/ox01K9O7mp
	qa0ZqBI0lGjsApYyJlWqFtQeb/dysFO8=
X-Gm-Gg: AYBFou1OblPgjH8ELcHf4vT+7fa0d3hA0G6ccgB3Pwy66tnNhiF+EOiA5zYcz0hUeeF
	oUpE/cNoZxSXK2AjS54zUclk3LXoSVHZyeid8aha9XTt7X+uLoRt0W+CVkQ8tUuEe7mUsBPCG7o
	/jjL5rLXzqdnVj0kdZqc+UhYq8F9GY0RMkZ6kGSVBu3oJc2gCtrzqgS4dVPHvQ5WhafwknRbLBg
	rgO172++pNoUYVMz1pt0dRHlQ+AlAa0K9n9o3IW71ruItrd1BIsljT3zl4Sv1CmG5pwhROxbZ38
	RDq/hKHVWpwOvkvVsnC8oGQooXhKRKoYlAbFN5hEMynIQQL3SgWaBw==
X-Received: by 2002:a05:6512:3f22:b0:5b6:7fa:e96b with SMTP id
 2adb3069b0e04-5b8df06b2c0mr1295904e87.14.1790294633838; Thu, 24 Sep 2026
 17:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1787838455.git.mykola_kvach@epam.com> <1f311886ad3162f59749210c7dce26f9d089d010.1787838455.git.mykola_kvach@epam.com>
 <FFAA90D5-0507-44D5-AE59-127955BD4586@arm.com>
In-Reply-To: <FFAA90D5-0507-44D5-AE59-127955BD4586@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 25 Sep 2026 03:03:42 +0300
X-Gm-Features: AclHuK-PiGzB3vwsrjjkOXLvqVETll3LrDDm_gOSzIxnRtvgH9ry2XIbZIuLHR8
Message-ID: <CAGeoDV-F-mDvWaTcd4Tz_1EMmfYJir1CXQOLm1K5mCMTWWNN=g@mail.gmail.com>
Subject: Re: [PATCH v12 04/13] xen/arm: gic-v3: Implement GICv3 suspend/resume functions
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Luca Fancellu <Luca.Fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1790294634-678BC2AC-578E348F/0/0
X-purgate-type: clean
X-purgate-size: 20833

Hi Bertrand,

Thank you for the review.

On Wed, Sep 23, 2026 at 6:58=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Mykola,
>
> > On 27 Aug 2026, at 16:31, Mykola Kvach <mykola_kvach@epam.com> wrote:
> >
> > System suspend may lead to a state where GIC would be powered down.
> > Therefore, Xen should save/restore the context of GIC on suspend/resume=
.
> >
> > Note that the context consists of states of registers which are
> > controlled by the hypervisor. Other GIC registers which are accessible
> > by guests are saved/restored on context switch.
> >
> > Before continuing suspend, also verify that the physical CPU interface
> > has no Group 1 active-priority state left. Use ICC_CTLR_EL1.PRIbits to
> > decide which ICC_AP1R<n>_EL1 registers are implemented, so Xen does not
> > read an unimplemented AP1R register.
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> > ---
> > Changes in V10:
> > - abort suspend when the physical Group 1 active-priority state is stil=
l
> >  present, deriving accessible ICC_AP1R<n>_EL1 registers from
> >  ICC_CTLR_EL1.PRIbits;
> > - re-enable the redistributor before restoring CPU and virtual interfac=
e
> >  state on the suspend abort path;
> > - panic if the redistributor cannot be re-enabled on the suspend abort =
path;
> > - avoid saving/restoring reserved GICD_IPRIORITYR and GICD_IROUTER entr=
ies
> >  for a partially populated last SPI block;
> > - disable Distributor group forwarding while preserving affinity routin=
g
> >  state before restoring Distributor configuration;
> > - disable SPI/eSPI forwarding and wait for RWP before restoring
> >  GICD_ICFGR<n>.Int_config.
> >
> > Changes in V9:
> > - fix the suspend-context comment typo and split dist_ctx declarations;
> > - restore ICC_IGRPEN1_EL1 on the suspend error path;
> > - re-initialize GICD_IGROUPRnE during resume;
> > - restore GICD_IROUTER only after re-enabling ARE_NS during resume.
> >
> > Changes in V8:
> > - use right rdist base for prop/pend baser and ctrl
> >
> > Changes in V7:
> > - restore LPI regs on resume
> > - add timeout during redist disabling
> > - squash with suspend/resume handling for GICv3 eSPI registers
> > - drop ITS guard paths so suspend/resume always runs; switch missing ct=
x
> >  allocation to panic
> > - trim TODO comments; narrow redistributor storage to PPI icfgr
> > - keep distributor context allocation even without ITS; adjust resume
> >  to use GENMASK(31, 0) for clearing enables
> > - drop storage of the SGI configuration register, as SGIs are always
> >  edge-triggered
> > ---
> > xen/arch/arm/gic-v3-lpi.c                |   3 +
> > xen/arch/arm/gic-v3.c                    | 458 ++++++++++++++++++++++-
> > xen/arch/arm/include/asm/arm64/sysregs.h |   5 +
> > xen/arch/arm/include/asm/gic_v3_defs.h   |   3 +
> > 4 files changed, 466 insertions(+), 3 deletions(-)
> >
> > diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
> > index 847da26ff7..a63c8c4979 100644
> > --- a/xen/arch/arm/gic-v3-lpi.c
> > +++ b/xen/arch/arm/gic-v3-lpi.c
> > @@ -467,6 +467,9 @@ static int cpu_callback(struct notifier_block *nfb,=
 unsigned long action,
> >     switch ( action )
> >     {
> >     case CPU_UP_PREPARE:
> > +        if ( system_state =3D=3D SYS_STATE_resume )
> > +            break;
> > +
> >         rc =3D gicv3_lpi_allocate_pendtable(cpu);
> >         if ( rc )
> >             printk(XENLOG_ERR "Unable to allocate the pendtable for CPU=
%lu\n",
> > diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> > index b16888ad84..038bf41142 100644
> > --- a/xen/arch/arm/gic-v3.c
> > +++ b/xen/arch/arm/gic-v3.c
> > @@ -1078,12 +1078,12 @@ out:
> >     return res;
> > }
> >
> > -static void gicv3_hyp_disable(void)
> > +static void gicv3_hyp_enable(bool enable)
> > {
> >     register_t hcr;
> >
> >     hcr =3D READ_SYSREG(ICH_HCR_EL2);
> > -    hcr &=3D ~GICH_HCR_EN;
> > +    hcr =3D enable ? (hcr | GICH_HCR_EN) : (hcr & ~GICH_HCR_EN);
> >     WRITE_SYSREG(hcr, ICH_HCR_EL2);
> >     isb();
> > }
> > @@ -1190,7 +1190,7 @@ static void gicv3_disable_interface(void)
> >     spin_lock(&gicv3.lock);
> >
> >     gicv3_cpu_disable();
> > -    gicv3_hyp_disable();
> > +    gicv3_hyp_enable(false);
> >
> >     spin_unlock(&gicv3.lock);
> > }
> > @@ -1926,6 +1926,450 @@ static bool gic_dist_supports_lpis(void)
> >     return (readl_relaxed(GICD + GICD_TYPER) & GICD_TYPE_LPIS);
> > }
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +
> > +/* This struct represents a block of 32 IRQs */
> > +struct dist_irq_block {
> > +    uint32_t icfgr[2];
> > +    uint32_t ipriorityr[8];
> > +    uint64_t irouter[32];
> > +    uint32_t isactiver;
> > +    uint32_t isenabler;
> > +};
> > +
> > +struct redist_ctx {
> > +    uint32_t ctlr;
> > +    uint32_t icfgr; /* only PPIs stored */
>
> Can you capitalize first comment letter ?
> s/only/Only/
>
> > +    uint32_t igroupr;
> > +    uint32_t ipriorityr[8];
> > +    uint32_t isactiver;
> > +    uint32_t isenabler;
> > +
> > +    uint64_t pendbase;
> > +    uint64_t propbase;
> > +};
> > +
> > +/* GICv3 registers to be saved/restored on system suspend/resume */
> > +struct gicv3_ctx {
> > +    struct dist_ctx {
> > +        uint32_t ctlr;
> > +        struct dist_irq_block *irqs;
> > +        struct dist_irq_block *espi_irqs;
> > +    } dist;
> > +
> > +    /* have only one rdist structure for last running CPU during suspe=
nd */
>
> Same here
> s/have/Have/
>
> > +    struct redist_ctx rdist;
> > +
> > +    struct cpu_ctx {
> > +        uint32_t ctlr;
> > +        uint32_t pmr;
> > +        uint32_t bpr;
> > +        uint32_t sre_el2;
> > +        uint32_t grpen;
> > +    } cpu;
> > +};
> > +
> > +static struct gicv3_ctx gicv3_ctx;
> > +
> > +static void __init gicv3_alloc_context(void)
> > +{
> > +    uint32_t blocks =3D DIV_ROUND_UP(gicv3_info.nr_lines, 32);
> > +
> > +    /* The spec allows for systems without any SPIs */
> > +    if ( blocks > 1 )
> > +    {
> > +        gicv3_ctx.dist.irqs =3D xzalloc_array(struct dist_irq_block, b=
locks - 1);
> > +        if ( !gicv3_ctx.dist.irqs )
> > +            panic("Failed to allocate memory for GICv3 suspend context=
\n");
> > +    }
> > +
> > +#ifdef CONFIG_GICV3_ESPI
> > +    if ( !gic_number_espis() )
> > +        return;
> > +
> > +    blocks =3D gic_number_espis() / 32;
> > +    gicv3_ctx.dist.espi_irqs =3D xzalloc_array(struct dist_irq_block, =
blocks);
> > +    if ( !gicv3_ctx.dist.espi_irqs )
> > +        panic("Failed to allocate memory for GICv3 eSPI suspend contex=
t\n");
> > +#endif
> > +}
> > +
> > +static int gicv3_disable_redist(void)
> > +{
> > +    void __iomem *waker =3D GICD_RDIST_BASE + GICR_WAKER;
> > +    s_time_t deadline;
> > +
> > +    /*
> > +     * Avoid infinite loop if Non-secure does not have access to GICR_=
WAKER.
> > +     * See Arm IHI 0069H.b, 12.11.42 GICR_WAKER:
> > +     *     When GICD_CTLR.DS =3D=3D 0 and an access is Non-secure acce=
sses to this
> > +     *     register are RAZ/WI.
> > +     */
> > +    if ( !(readl_relaxed(GICD + GICD_CTLR) & GICD_CTLR_DS) )
> > +        return 0;
> > +
> > +    deadline =3D NOW() + MILLISECS(1000);
> > +
> > +    writel_relaxed(readl_relaxed(waker) | GICR_WAKER_ProcessorSleep, w=
aker);
> > +    while ( (readl_relaxed(waker) & GICR_WAKER_ChildrenAsleep) =3D=3D =
0 )
> > +    {
> > +        if ( NOW() > deadline )
> > +        {
> > +            printk("GICv3: Timeout waiting for redistributor to sleep\=
n");
> > +            return -ETIMEDOUT;
> > +        }
> > +        cpu_relax();
> > +        udelay(10);
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +#define GET_SPI_REG_OFFSET(name, is_espi) \
> > +    ((is_espi) ? GICD_##name##nE : GICD_##name)
> > +
> > +static void gicv3_store_spi_irq_block(struct dist_irq_block *irqs,
> > +                                      unsigned int i, unsigned int nr_=
irqs,
> > +                                      bool is_espi)
> > +{
> > +    void __iomem *base;
> > +    unsigned int irq, nr_priority_regs;
> > +
> > +    ASSERT(nr_irqs && nr_irqs <=3D 32);
> > +    nr_priority_regs =3D DIV_ROUND_UP(nr_irqs, 4);
> > +
> > +    base =3D GICD + GET_SPI_REG_OFFSET(ICFGR, is_espi) + i * sizeof(ir=
qs->icfgr);
> > +    irqs->icfgr[0] =3D readl_relaxed(base);
> > +    irqs->icfgr[1] =3D readl_relaxed(base + 4);
> > +
> > +    base =3D GICD + GET_SPI_REG_OFFSET(IPRIORITYR, is_espi);
> > +    base +=3D i * sizeof(irqs->ipriorityr);
> > +    for ( irq =3D 0; irq < nr_priority_regs; irq++ )
> > +        irqs->ipriorityr[irq] =3D readl_relaxed(base + 4 * irq);
> > +
> > +    base =3D GICD + GET_SPI_REG_OFFSET(IROUTER, is_espi);
> > +    base +=3D i * sizeof(irqs->irouter);
> > +    for ( irq =3D 0; irq < nr_irqs; irq++ )
> > +        irqs->irouter[irq] =3D readq_relaxed_non_atomic(base + 8 * irq=
);
> > +
> > +    base =3D GICD + GET_SPI_REG_OFFSET(ISACTIVER, is_espi);
> > +    base +=3D i * sizeof(irqs->isactiver);
> > +    irqs->isactiver =3D readl_relaxed(base);
> > +
> > +    base =3D GICD + GET_SPI_REG_OFFSET(ISENABLER, is_espi);
> > +    base +=3D i * sizeof(irqs->isenabler);
> > +    irqs->isenabler =3D readl_relaxed(base);
> > +}
> > +
> > +static void gicv3_restore_spi_irq_config(struct dist_irq_block *irqs,
> > +                                         unsigned int i, unsigned int =
nr_irqs,
> > +                                         bool is_espi)
> > +{
> > +    void __iomem *base;
> > +    unsigned int irq, nr_priority_regs;
> > +
> > +    ASSERT(nr_irqs && nr_irqs <=3D 32);
> > +    nr_priority_regs =3D DIV_ROUND_UP(nr_irqs, 4);
> > +
> > +    base =3D GICD + GET_SPI_REG_OFFSET(ICFGR, is_espi) + i * sizeof(ir=
qs->icfgr);
> > +    writel_relaxed(irqs->icfgr[0], base);
> > +    writel_relaxed(irqs->icfgr[1], base + 4);
> > +
> > +    base =3D GICD + GET_SPI_REG_OFFSET(IPRIORITYR, is_espi);
> > +    base +=3D i * sizeof(irqs->ipriorityr);
> > +    for ( irq =3D 0; irq < nr_priority_regs; irq++ )
> > +        writel_relaxed(irqs->ipriorityr[irq], base + 4 * irq);
> > +}
> > +
> > +static void gicv3_restore_spi_irq_routing(struct dist_irq_block *irqs,
> > +                                          unsigned int i, unsigned int=
 nr_irqs,
> > +                                          bool is_espi)
> > +{
> > +    void __iomem *base;
> > +    unsigned int irq;
> > +
> > +    ASSERT(nr_irqs && nr_irqs <=3D 32);
> > +
> > +    base =3D GICD + GET_SPI_REG_OFFSET(IROUTER, is_espi);
> > +    base +=3D i * sizeof(irqs->irouter);
> > +    for ( irq =3D 0; irq < nr_irqs; irq++ )
> > +        writeq_relaxed_non_atomic(irqs->irouter[irq], base + 8 * irq);
> > +}
> > +
> > +static void gicv3_disable_spi_irq_block(unsigned int i, bool is_espi)
> > +{
> > +    void __iomem *base;
> > +
> > +    base =3D GICD + GET_SPI_REG_OFFSET(ICENABLER, is_espi) + i * 4;
> > +    writel_relaxed(GENMASK(31, 0), base);
> > +}
> > +
> > +static void gicv3_restore_spi_irq_state(struct dist_irq_block *irqs,
> > +                                        unsigned int i, bool is_espi)
> > +{
> > +    void __iomem *base;
> > +
> > +    base =3D GICD + GET_SPI_REG_OFFSET(ISENABLER, is_espi);
> > +    base +=3D i * sizeof(irqs->isenabler);
> > +    writel_relaxed(irqs->isenabler, base);
> > +
> > +    base =3D GICD + GET_SPI_REG_OFFSET(ICACTIVER, is_espi) + i * 4;
> > +    writel_relaxed(GENMASK(31, 0), base);
> > +
> > +    base =3D GICD + GET_SPI_REG_OFFSET(ISACTIVER, is_espi);
> > +    base +=3D i * sizeof(irqs->isactiver);
> > +    writel_relaxed(irqs->isactiver, base);
> > +}
> > +
> > +static int gicv3_check_ap1r(unsigned int n, register_t apr)
> > +{
> > +    if ( !apr )
> > +        return 0;
> > +
> > +    printk(XENLOG_ERR "GICv3: suspend aborted: ICC_AP1R%u_EL1=3D%#"
> > +           PRIregister"\n", n, apr);
> > +
> > +    return -EBUSY;
> > +}
> > +
> > +static int gicv3_check_active_priorities(register_t ctlr)
> > +{
> > +    unsigned int pribits =3D MASK_EXTR(ctlr, ICC_CTLR_EL1_PRIBITS_MASK=
) + 1;
> > +    int ret;
> > +
> > +    /*
> > +     * Xen enables physical Group 1 interrupts through ICC_IGRPEN1_EL1=
,
> > +     * so only the physical Group 1 active-priority registers are rele=
vant
> > +     * here. Use ICC_CTLR_EL1.PRIbits for the physical CPU interface, =
not
> > +     * ICH_VTR_EL2, which describes the virtual interface. ICC_AP1R1_E=
L1 is
> > +     * only implemented with at least 6 physical priority bits, and
> > +     * ICC_AP1R2_EL1/ICC_AP1R3_EL1 with at least 7.
> > +     */
> > +    switch ( pribits )
> > +    {
> > +    case 8:
> > +    case 7:
> > +        ret =3D gicv3_check_ap1r(3, READ_SYSREG(ICC_AP1R3_EL1));
> > +        if ( ret )
> > +            return ret;
> > +        ret =3D gicv3_check_ap1r(2, READ_SYSREG(ICC_AP1R2_EL1));
> > +        if ( ret )
> > +            return ret;
> > +        /* Fall through */
> > +    case 6:
> > +        ret =3D gicv3_check_ap1r(1, READ_SYSREG(ICC_AP1R1_EL1));
> > +        if ( ret )
> > +            return ret;
> > +        /* Fall through */
> > +    default:
> > +        return gicv3_check_ap1r(0, READ_SYSREG(ICC_AP1R0_EL1));
> > +    }
> > +}
> > +
> > +static int gicv3_suspend(void)
> > +{
> > +    unsigned int i, nr_irqs;
> > +    void __iomem *base;
> > +    int ret;
> > +    struct redist_ctx *rdist =3D &gicv3_ctx.rdist;
> > +
> > +    /* Save GICC configuration */
> > +    gicv3_ctx.cpu.ctlr     =3D READ_SYSREG(ICC_CTLR_EL1);
> > +    gicv3_ctx.cpu.pmr      =3D READ_SYSREG(ICC_PMR_EL1);
> > +    gicv3_ctx.cpu.bpr      =3D READ_SYSREG(ICC_BPR1_EL1);
> > +    gicv3_ctx.cpu.sre_el2  =3D READ_SYSREG(ICC_SRE_EL2);
> > +    gicv3_ctx.cpu.grpen    =3D READ_SYSREG(ICC_IGRPEN1_EL1);
> > +
> > +    gicv3_disable_interface();
> > +
> > +    ret =3D gicv3_check_active_priorities(gicv3_ctx.cpu.ctlr);
> > +    if ( ret )
> > +        goto out_enable_iface;
> > +
> > +    ret =3D gicv3_disable_redist();
> > +    if ( ret )
> > +        goto out_enable_iface;
>
> I am wondering about the timeout case here.
>
> gicv3_disable_redist() has set ProcessorSleep to 1, but returns while
> ChildrenAsleep is still 0.
> This new error path then calls gicv3_enable_redist(), which clears
> ProcessorSleep.
>
> Could that happen before ChildrenAsleep reaches 1?
> The GIC specification says that transition is UNPREDICTABLE.
> How should we handle the timeout?

Yes, ChildrenAsleep may still be 0 when the error path calls
gicv3_enable_redist(). Clearing ProcessorSleep in that state is
UNPREDICTABLE.

I propose calling panic() if waiting for ChildrenAsleep to become
1 times out, before entering the rollback path. We cannot safely
restore the CPU interface without completing the redistributor
sleep/wake sequence.

>
> > +
> > +    /* Save GICR configuration */
> > +    gicv3_redist_wait_for_rwp();
> > +
> > +    base =3D GICD_RDIST_BASE;
> > +
> > +    rdist->ctlr =3D readl_relaxed(base + GICR_CTLR);
> > +
> > +    rdist->propbase =3D readq_relaxed(base + GICR_PROPBASER);
> > +    rdist->pendbase =3D readq_relaxed(base + GICR_PENDBASER);
> > +
> > +    base =3D GICD_RDIST_SGI_BASE;
> > +
> > +    /* Save priority on PPI and SGI interrupts */
> > +    for ( i =3D 0; i < NR_GIC_LOCAL_IRQS / 4; i++ )
> > +        rdist->ipriorityr[i] =3D readl_relaxed(base + GICR_IPRIORITYR0=
 + 4 * i);
> > +
> > +    rdist->isactiver =3D readl_relaxed(base + GICR_ISACTIVER0);
> > +    rdist->isenabler =3D readl_relaxed(base + GICR_ISENABLER0);
> > +    rdist->igroupr   =3D readl_relaxed(base + GICR_IGROUPR0);
> > +    rdist->icfgr     =3D readl_relaxed(base + GICR_ICFGR1);
> > +
> > +    /* Save GICD configuration */
> > +    gicv3_dist_wait_for_rwp();
> > +    gicv3_ctx.dist.ctlr =3D readl_relaxed(GICD + GICD_CTLR);
> > +
> > +    for ( i =3D 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
> > +    {
> > +        nr_irqs =3D min(32U, gicv3_info.nr_lines - i * 32);
> > +        gicv3_store_spi_irq_block(gicv3_ctx.dist.irqs + i - 1, i, nr_i=
rqs,
> > +                                  false);
> > +    }
> > +
> > +#ifdef CONFIG_GICV3_ESPI
> > +    for ( i =3D 0; i < gic_number_espis() / 32; i++ )
> > +        gicv3_store_spi_irq_block(gicv3_ctx.dist.espi_irqs + i, i, 32,=
 true);
> > +#endif
> > +
> > +    return 0;
> > +
> > + out_enable_iface:

I also noticed that this label should be immediately before
gicv3_hyp_enable(true).

> > +    if ( gicv3_enable_redist() )
> > +        panic("GICv3: Failed to re-enable redistributor after suspend =
abort\n");
> > +
> > +    gicv3_hyp_enable(true);
> > +    WRITE_SYSREG(gicv3_ctx.cpu.grpen, ICC_IGRPEN1_EL1);
> > +    isb();
> > +
> > +    return ret;
> > +}
> > +
> > +static void gicv3_resume(void)
> > +{
> > +    int ret;
> > +    unsigned int i, nr_irqs;
> > +    uint32_t dist_ctlr;
> > +    void __iomem *base;
> > +    struct redist_ctx *rdist =3D &gicv3_ctx.rdist;
> > +
> > +    dist_ctlr =3D gicv3_ctx.dist.ctlr & GICD_CTLR_ARE_NS;
> > +
> > +    /* Disable group forwarding while preserving affinity routing stat=
e. */
> > +    writel_relaxed(dist_ctlr, GICD + GICD_CTLR);
> > +    gicv3_dist_wait_for_rwp();
> > +
> > +    /*
> > +     * IHI0069H.b 12.9.9 says changing GICD_ICFGR<n>.Int_config
> > +     * while the interrupt is individually enabled is UNPREDICTABLE.
> > +     * Disable SPIs first; 4.7.1 defines GICD_ICENABLER<n>, n > 0,
> > +     * as the per-SPI disable mechanism.
> > +     */
> > +    for ( i =3D 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
> > +        gicv3_disable_spi_irq_block(i, false);
> > +
> > +#ifdef CONFIG_GICV3_ESPI
> > +    for ( i =3D 0; i < gic_number_espis() / 32; i++ )
> > +        gicv3_disable_spi_irq_block(i, true);
> > +#endif
> > +
> > +    gicv3_dist_wait_for_rwp();
> > +
> > +    for ( i =3D NR_GIC_LOCAL_IRQS; i < gicv3_info.nr_lines; i +=3D 32 =
)
> > +        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPR + (i / 32) =
* 4);
> > +
> > +    for ( i =3D 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
> > +    {
> > +        nr_irqs =3D min(32U, gicv3_info.nr_lines - i * 32);
> > +        gicv3_restore_spi_irq_config(gicv3_ctx.dist.irqs + i - 1, i, n=
r_irqs,
> > +                                     false);
> > +    }
> > +
> > +#ifdef CONFIG_GICV3_ESPI
> > +    for ( i =3D 0; i < gic_number_espis() / 32; i++ )
> > +    {
> > +        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPRnE + i * 4);
> > +        gicv3_restore_spi_irq_config(gicv3_ctx.dist.espi_irqs + i, i, =
32,
> > +                                     true);
> > +    }
> > +#endif
> > +
> > +    if ( dist_ctlr )
> > +    {
> > +        for ( i =3D 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ =
)
> > +        {
> > +            nr_irqs =3D min(32U, gicv3_info.nr_lines - i * 32);
> > +            gicv3_restore_spi_irq_routing(gicv3_ctx.dist.irqs + i - 1,=
 i,
> > +                                          nr_irqs, false);
> > +        }
> > +
> > +#ifdef CONFIG_GICV3_ESPI
> > +        for ( i =3D 0; i < gic_number_espis() / 32; i++ )
> > +            gicv3_restore_spi_irq_routing(gicv3_ctx.dist.espi_irqs + i=
, i,
> > +                                          32, true);
> > +#endif
> > +    }
> > +
> > +    for ( i =3D 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
> > +        gicv3_restore_spi_irq_state(gicv3_ctx.dist.irqs + i - 1, i, fa=
lse);
> > +
> > +#ifdef CONFIG_GICV3_ESPI
> > +    for ( i =3D 0; i < gic_number_espis() / 32; i++ )
> > +        gicv3_restore_spi_irq_state(gicv3_ctx.dist.espi_irqs + i, i, t=
rue);
> > +#endif
> > +
> > +    writel_relaxed(gicv3_ctx.dist.ctlr, GICD + GICD_CTLR);
> > +    gicv3_dist_wait_for_rwp();
> > +
> > +    ret =3D gicv3_lpi_init_rdist(GICD_RDIST_BASE);
> > +    /*
> > +     * If LPIs are already enabled, assume firmware or the still-power=
ed
> > +     * redistributor has valid PROPBASER/PENDBASER and skip reprogramm=
ing.
> > +     * Return -EBUSY so callers can ignore this case.
> > +     */
> > +    if ( ret && ret !=3D -ENODEV && ret !=3D -EBUSY )
> > +        panic("GICv3: Failed to re-initialize LPIs during resume\n");
> > +    else if ( ret =3D=3D -EBUSY ) /* extra checks, just to be sure */
>
> Comment first letter capitalize:
> s/extra/Extra/

I will also fix all the capitalization issues you pointed out.

Thanks,
Mykola

