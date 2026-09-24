Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E83C9831E
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 23:23:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1433169.1653980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9slz-0005wp-3K; Thu, 24 Sep 2026 23:22:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1433169.1653980; Thu, 24 Sep 2026 23:22:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9sly-0005wi-Va; Thu, 24 Sep 2026 23:22:38 +0000
Received: by outflank-mailman (input) for mailman id 1433169;
 Thu, 24 Sep 2026 23:22:37 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1x9slx-0005wa-QT
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 23:22:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9slw-000vrm-HF
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 01:22:36 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6ab5b089-2eae-0a2a0a5409dd-0a2a4504ab0c-16
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 01:22:36 +0200
Received: from [74.125.229.205] (helo=mail-lf2-f13.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6ab5b0bc-b57f-0a2a45040019-4a7de5cdddd3-3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 01:22:36 +0200
Received: by mail-lf2-f13.google.com with SMTP id
 2adb3069b0e04-5b8e6ec4dc0so122531e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 16:22:36 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1790292156; cv=none;
        d=google.com; s=arc-20260327;
        b=CQY3rvAfqLEmkStyqSeYWVic9qUZbqrOYCcjs9hGSIiKG2/HW1JqQXZmHGKUJqTeq2
         rzVenNP4OmTyCc4LEppbHP8l0FMAcW8zMepxSTLyj7spRM7lmc6EzBbnChyDafsmXrl0
         1rPhSfEk8krhjfV8G92qZAWeKv2w1hukV5A2i9BP90h3a+ADBBfCrqY6hplltP1Pr+ex
         lVfNr0N9H+GhJp7tmEbjuoGTm6TzXlizeu56RhpdLFxhBOXtaMEyKZaPpKsflIDWHMkY
         stDzmEO8hPiX4wAgewj1jDON0QwnaCXakgI9H30KerPRPb9Aj2H1DAasNhGa2GxjT9A3
         2YCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wTpbY3cPkJZfs70nxAC+hwTt+X0fXJ5NaVXkEloTFzk=;
        fh=0mnl6dKJ1iafBcu/Ao9u89lhPK5T+/Xj8TDjMOiG+nk=;
        b=F48qPWTW4Fw3qOgKAEcF5OZczqPLyHRiWRs0tBvAZ1Wni7IvAAuzJqARCyG/Y0u9yA
         EwOPGHuwZh0HZwPfaKJoic5XX0bdBpsiTuWUoaQ0R8MCK6J5u66+eT8hkX3x5T5ozyRU
         1b2yVRzqwqDI7WXfzqGt1yIvJe1qGUp7AOCqz3F+Neaqx53Xa5u5pr1np/QtCK5oe66l
         6PdKm/TktGIeueAttZvDUwFMnQBJhRed0IFYRgo6kq5Pllo0Jv3FCyoXtNl5+PmONTI8
         FRR41guh2sokVkauAQFbNJQ/0f/Q2iLx5hDxcUaEI3+B4UQqEOvs7Gv5Uj6K3zwTApRl
         4jDA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790292156; x=1790896956; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wTpbY3cPkJZfs70nxAC+hwTt+X0fXJ5NaVXkEloTFzk=;
        b=S73DFXtRM2jNvUT87XjpvzHuNpylKoOpbdkS/QHnmL5OjTd9xyfX24nmWFv0xKsDDD
         cBoO6i5oJLMPFdR6T3yYdUcHXB9qf5OVAiphe3dzBdbyaNPIyxJkp/gZfownbPnyRZTQ
         XbWGJVFusJEhcFV4NzT6KTnb6L3mI4gDl01cAYH9gZmK1VEJdwlBD/0n7Dj11V0lZp7m
         hoXqJbHXseM05jy7M+SXA0Huf4VkHSUPgyjjk68hFTw41ye3sBXoVGaPxBOP0J7Pbdcp
         VZkQgW95xsmKjvmfMUM1o+GEvF96q57lN1OP4y2DV0BM+Aw/c5sXrUDqfS+3ZUuEEWIu
         kp+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790292156; x=1790896956;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wTpbY3cPkJZfs70nxAC+hwTt+X0fXJ5NaVXkEloTFzk=;
        b=U+vy2Pe6+E/7g9Gz2wXfDlXVofqf77os32zIDNlSEFH8mjKg9XtCKyv6LHAjAM3mrX
         nBiTKQQCcmouOvJeXa34s292ubEVSTPXA8YU5EAE/beA6gdQ9sWnPwUSJZ960PcPQZLQ
         3ZU835LRxyyPb94A4VAQmpgViz7zOsCx6HEHqud+kZqa4SFj11BxeVRBRPWuuhMmyTBv
         1G3f0UnW6U4MOVhO/0Lmd3csE54H6+kXH3bRqZ70xMjEuSLS8/4V3CekbGrifZnJ3C87
         rgGaYmlzFR7xmmLoxRQk7NiHLnbAWSn7Vb2fQg5582Y25yTXoGS9oHSHuSsbM6iHJ0Lo
         8IVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzMNyElbC/oVSRvth6i52vFSV7dUoG6YkbusU95QH+YP5+nRCV12a7NpuSEgPPQY9d5l3csJsgpIQ=@lists.xenproject.org
X-Gm-Message-State: AFuF++lnHY4Ne/T2hmbvR/Ti04YC26x8ik4Fsb68EkeN1KPGRq3LTJnQ
	Bfh8swojkrSqxjkQmkVdXZ2H7F6zaHi6h8rG1gsSZS/v2YwLv34hO/cGo2RQIX0Wcbfl79A4yKb
	s1xBNrpWB/+M3QuwopCgXoCO+9TSB7KM=
X-Gm-Gg: AYBFou3MNXn7UbmPRMVWdNfhT+XGAd1zy9pWqxaJ5g743I0UYK5nrRb2zdY62SQ/HQH
	eHov/2Cc1gUtWnLOUl9UaQc9ypVLRMsl5Dj7Q+24UGBqjG8SuP+n56d0iksG8fHfn2J2RKfUoZP
	dGYuFI8Xhcekql/fqaPsY4ELFWhQGFKmZ5kpOXIcv93Mf7d5IxvvK8R2egPtgxm+XT2D8qev1AC
	XYgWutqmlnSvK9mvMSvfYWSeMGEPVwhsNe8pritwl+Of3BwP7Popcb0txTeYZ1WepMc5OGcyj1N
	aMSLt7DpNCvIRk6l8wzrxaLQ1/AUfkFF/yLUofiZgHlI//e10kZhGw==
X-Received: by 2002:ac2:4304:0:b0:5ae:b7ca:33ec with SMTP id
 2adb3069b0e04-5b8df09bd0amr987494e87.9.1790292155526; Thu, 24 Sep 2026
 16:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1787838455.git.mykola_kvach@epam.com> <54a655ad51d994b46dff43e67c969a31772cec4b.1787838455.git.mykola_kvach@epam.com>
 <427F337F-4D3C-4DEE-9978-5B1AD3AB23D5@arm.com>
In-Reply-To: <427F337F-4D3C-4DEE-9978-5B1AD3AB23D5@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 25 Sep 2026 02:22:24 +0300
X-Gm-Features: AclHuK_lHHH6mri1YnQg0j2dw-bGqw1E02spCDzRJGb1L0IeFagr7eA7krbyV1w
Message-ID: <CAGeoDV_-vqbCKAcBRXuNNGVKOQ43qkjze_Rh+HyR+Tvo=3NdxQ@mail.gmail.com>
Subject: Re: [PATCH v12 03/13] xen/arm: gic-v3: tolerate retained
 redistributor LPI state across CPU_OFF
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Luca Fancellu <Luca.Fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ebf023/1790292156-532CCB50-43BFEF17/0/0
X-purgate-type: clean
X-purgate-size: 9669

Hi Bertrand,

Thank you for the review.

On Wed, Sep 23, 2026 at 6:36=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Mykola,
>
> > On 27 Aug 2026, at 16:31, Mykola Kvach <mykola_kvach@epam.com> wrote:
> >
> > PSCI does not guarantee that a GICv3 redistributor is powered down acro=
ss
> > CPU_OFF -> CPU_ON.
> >
> > DEN0022F.b says CPU_OFF powers down the calling core (5.5) and CPU_ON
> > brings the core back with a defined initial CPU state (5.6, 6.4).
> > However, PSCI leaves interrupt migration and GIC re-initialization to t=
he
> > supervisory software/firmware stack: the caller must migrate interrupts
> > away before CPU_OFF (5.5.2), and the execution context that is lost in =
a
> > powerdown state must be saved and restored by software (6.8). PSCI also
> > calls out GIC management explicitly in 6.8, including retargeting SPIs,
> > preventing PPIs/SGIs from targeting a powered down CPU, and reinitializ=
ing
> > the CPU interface after CPU_ON.
> >
> > This matches the GIC architecture. IHI0069H.b Chapter 11.1 requires the=
 PE
> > and CPU interface to share a power domain, but explicitly allows the
> > associated redistributor, distributor, and ITS to remain powered while =
the
> > PE and CPU interface are off. All other GIC power-management behavior i=
s
> > IMPLEMENTATION DEFINED. DEN0050D Chapter 4.2, "Generic Interrupt
> > Controller (GIC)", says the GICv3 redistributor may live either in the =
AP
> > core power domain or in a relatively always-on parent domain. So after
> > CPU_OFF -> CPU_ON a secondary CPU can legitimately come back to a live
> > redistributor with GICR_CTLR.EnableLPIs still set.
> >
> > Handle that case in the LPI setup path instead of assuming a fully rese=
t
> > redistributor.
> >
> > The LPI path needs special care because the GIC spec makes redistributo=
r
> > LPI state sticky and partially implementation defined. IHI0069H.b 5.1.1
> > and 5.1.2 say that changing GICR_PROPBASER or GICR_PENDBASER while
> > GICR_CTLR.EnableLPIs =3D=3D 1 is UNPREDICTABLE. After clearing EnableLP=
Is,
> > software must wait for GICR_CTLR.RWP =3D=3D 0 before touching the pendi=
ng
> > table. The architecture also permits implementations where, once
> > EnableLPIs has been set, clearing it again is not guaranteed to work.
> > Where an ITS is present, the spec strongly recommends moving LPIs to
> > another redistributor before clearing EnableLPIs.
> >
> > Because of that, treat a retained EnableLPIs state as valid when the
> > redistributor still points at Xen's expected PROPBASER/PENDBASER tables=
.
> > Only try to clear EnableLPIs when the retained configuration does not
> > match Xen's state, and wait for RWP before reprogramming the tables.
> >
> > This is also consistent with platform firmware reality: PSCI and the GI=
C
> > architecture allow platform-specific redistributor power handling, and =
not
> > all platform firmware implementations force a full redistributor power-=
off
> > through implementation-defined controls during CPU_OFF. Xen therefore n=
eeds
> > to tolerate retained redistributor state on secondary CPU bring-up.
> >
> > Keep gicv3_populate_rdist() resident as well, because gicv3_cpu_init()
> > reuses it on secondary CPU bring-up after init.
> >
> > Tested using Xen's non-boot CPU disable/enable path on Arm
> > FVP_Base_RevC-2xAEMvA, both with and without:
> > -C gic_distributor.allow-LPIEN-clear=3D1
> > -C gic_distributor.GICR-clear-enable-supported=3D1
> > and on Orange Pi 5.
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> > ---
> > Changes in v10:
> > - Drop unrelated gicv3_populate_rdist() printk() format cleanups to kee=
p
> >  the patch focused on retained redistributor LPI state.
> >
> > Changes in v9:
> > - move gicv3_do_wait_for_rwp prototype from its related header to gic.h
> > - drop __init from gicv3_populate_rdist(), which is reused on secondary
> >  CPU bring-up after boot
> > - changed print format for smp_processor_id in gicv3_populate_rdist fun=
c
> > - cosmetic changes
> > ---
> > xen/arch/arm/gic-v3-lpi.c      | 77 +++++++++++++++++++++++++++++++++-
> > xen/arch/arm/gic-v3.c          | 15 ++++---
> > xen/arch/arm/include/asm/gic.h |  4 ++
> > 3 files changed, 90 insertions(+), 6 deletions(-)
> >
> > diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
> > index 9ee338edc2..847da26ff7 100644
> > --- a/xen/arch/arm/gic-v3-lpi.c
> > +++ b/xen/arch/arm/gic-v3-lpi.c
> > @@ -81,6 +81,13 @@ static DEFINE_PER_CPU(struct lpi_redist_data, lpi_re=
dist);
> > #define MAX_NR_HOST_LPIS   (lpi_data.max_host_lpi_ids - LPI_OFFSET)
> > #define HOST_LPIS_PER_PAGE      (PAGE_SIZE / sizeof(union host_lpi))
> >
> > +#define GICR_PROPBASER_XEN_MASK  GENMASK_ULL(51, 12)
> > +/*
> > + * For retained redistributor state, match the pending table by addres=
s only.
> > + * Attribute bits such as PTZ may not read back with the programmed va=
lue.
> > + */
> > +#define GICR_PENDBASER_XEN_MASK  GENMASK_ULL(51, 16)
> > +
> > static union host_lpi *gic_get_host_lpi(uint32_t plpi)
> > {
> >     union host_lpi *block;
> > @@ -296,6 +303,60 @@ static int gicv3_lpi_set_pendtable(void __iomem *r=
dist_base)
> >     return 0;
> > }
> >
> > +static uint64_t gicv3_lpi_expected_proptable(void)
> > +{
> > +    return virt_to_maddr(lpi_data.lpi_property);
> > +}
> > +
> > +static uint64_t gicv3_lpi_expected_pendtable(void)
> > +{
> > +    return virt_to_maddr(this_cpu(lpi_redist).pending_table);
> > +}
> > +
> > +static bool gicv3_lpi_tables_match(void __iomem *rdist_base)
> > +{
> > +    uint64_t propbase, pendbase;
> > +
> > +    if ( !lpi_data.lpi_property || !this_cpu(lpi_redist).pending_table=
 )
> > +        return false;
> > +
> > +    propbase =3D readq_relaxed(rdist_base + GICR_PROPBASER);
> > +    pendbase =3D readq_relaxed(rdist_base + GICR_PENDBASER);
> > +
> > +    return ((propbase & GICR_PROPBASER_XEN_MASK) =3D=3D
> > +            (gicv3_lpi_expected_proptable() & GICR_PROPBASER_XEN_MASK)=
) &&
> > +           ((pendbase & GICR_PENDBASER_XEN_MASK) =3D=3D
> > +            (gicv3_lpi_expected_pendtable() & GICR_PENDBASER_XEN_MASK)=
);
> > +}
> > +
> > +static int gicv3_lpi_disable_lpis(void __iomem *rdist_base)
> > +{
> > +    uint32_t reg =3D readl_relaxed(rdist_base + GICR_CTLR);
> > +    int ret;
> > +
> > +    if ( !(reg & GICR_CTLR_ENABLE_LPIS) )
> > +        return 0;
> > +
> > +    writel_relaxed(reg & ~GICR_CTLR_ENABLE_LPIS, rdist_base + GICR_CTL=
R);
> > +
> > +    /*
> > +     * The spec only guarantees programmability when we have observed =
the bit
> > +     * cleared. Where clearing is supported, RWP must reach 0 before t=
ouching
> > +     * PROPBASER/PENDBASER again.
> > +     */
> > +    wmb();
> > +
> > +    ret =3D gicv3_do_wait_for_rwp(rdist_base, GICR_CTLR_RWP);
> > +    if ( ret )
> > +        return ret;
> > +
> > +    reg =3D readl_relaxed(rdist_base + GICR_CTLR);
> > +    if ( reg & GICR_CTLR_ENABLE_LPIS )
> > +        return -EBUSY;
> > +
> > +    return 0;
> > +}
> > +
> > /*
> >  * Tell a redistributor about the (shared) property table, allocating o=
ne
> >  * if not already done.
> > @@ -374,7 +435,21 @@ int gicv3_lpi_init_rdist(void __iomem * rdist_base=
)
> >     /* Make sure LPIs are disabled before setting up the tables. */
> >     reg =3D readl_relaxed(rdist_base + GICR_CTLR);
> >     if ( reg & GICR_CTLR_ENABLE_LPIS )
> > -        return -EBUSY;
> > +    {
> > +        if ( gicv3_lpi_tables_match(rdist_base) )
> > +            return -EBUSY;
>
> I am wondering if there is a corner case when a CPU is unplugged and then
> plugged back in. free_percpu_area() eventually frees the per-CPU area
> containing lpi_redist.pending_table, but not the table itself. On the nex=
t
> cpu_up(), gicv3_lpi_allocate_pendtable() allocates a new table, and I can=
not
> find where the old one is freed.
>
> If the redistributor kept EnableLPIs=3D1 and GICR_PENDBASER pointing to t=
he
> old table, wouldn't gicv3_lpi_tables_match() fail?
>
> What will happen if EnableLPIs cannot be cleared ? (i think this is somet=
hing
> possible in the hardware).

The sequence you describe would need to be handled when adding
CPU hotplug support on Arm. There is currently no runtime caller
for such an offline/online cycle outside system suspend/resume.

During system suspend, the common code preserves the per-CPU area.
The following GICv3 suspend/resume patch also skips pending-table
allocation on resume, so the existing table and pointer are
reused.

The pending-table lifetime across normal CPU hotplug should be
handled by the CPU hotplug series.
---

While checking CPU bring-up failures during resume, I found a
separate issue in the common cleanup code. Both CPU_UP_CANCELED
and CPU_RESUME_FAILED can call free_percpu_area() for the same CPU
during resume. The release metadata, including the rcu_head, is
itself stored in that CPU's per-CPU area.

If the first release has completed, another call would access
invalid per-CPU state. Otherwise, it can queue the same rcu_head
again. The timer and CPU-pool callbacks on CPU_RESUME_FAILED also
still need the per-CPU area.

On x86, park_offline_cpus prevents this particular release path.

I plan to address this in a separate preparatory patch in this
series, keeping the per-CPU area available until the final
CPU_RESUME_FAILED cleanup and releasing it only once.

Best regards,
Mykola

