Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD5A606A32A
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 13:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oI31M9PM
Received: from list by lists.xenproject.org with outflank-mailman.1490886.1691827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSwYU-0001Xt-QY; Mon, 16 Nov 2026 13:15:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490886.1691827; Mon, 16 Nov 2026 13:15:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSwYU-0001Xm-Me; Mon, 16 Nov 2026 13:15:30 +0000
Received: by outflank-mailman (input) for mailman id 1490886;
 Mon, 16 Nov 2026 13:15:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1xSwYT-0001Xg-49
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 13:15:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSwYS-00B5w6-Gl
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 14:15:28 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6afb01e5-bab6-0a2a0a5309dd-0a2a45098edc-34
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 14:15:28 +0100
Received: from [209.85.167.48] (helo=mail-lf1-f48.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6afb01f0-be1a-0a2a45090019-d155a730c97b-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 14:15:28 +0100
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5bcdae234ecso4300720e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 05:15:28 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1794834928; cv=none;
        d=google.com; s=arc-20260327;
        b=SFYKT/c3N8HOEac4WEbhJAfwWe2z2B925vtCWNQ+tJuKfNNqyVLTC3XvKil/Da1cUw
         Rw4CSK20DYTUFFnzAUFWLICKuLwwR9OAXWMkuwqVJdepkX5+P717ziAzAEJjz2gNJ3yP
         YWGVKybhx7YTwaGkKdfvkTE9rezSANYTJuBtErMOTce+Kx2bjjf658kyhpek8pUPB05s
         ITwoAjdfCJwtPa//S0yjAsD7T+85cEKOocbichJZySMpE+uCGMqQknKNkC+Y5jMoWUEg
         WStSitTESlh47NUFWZY1BjElwf5x6Ztfif5Y/pi8qGSFfdvjWi6AEZ1mmImNInQ+px9A
         Wweg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W6W2a+Ik/jzUfwIzhXKNhPoJabT5jGj2MWmKqiZbU68=;
        fh=i3ABgRNNGBlqJn/8o/MJZLdrk0eSz2XaGj/iQxsgdxY=;
        b=XzUHTjV4f9Tl6DO4+lktZLh/yewOoVbydDpubTb5KRt61zVptlLvJnY22ew1jGFih+
         e13FSZM5M0DZqIKnG9p2nSMCfKepXnHy6nzL0hgTCJfb3wmq+WoPjbTrBkw6Psx2B/0i
         1qQsKOowri+Key+51gvkAEJRhE/OwJ3soE4e7neNXaCqt59lEAW7gc7mpoCfuDzV7adH
         rvnW4e93em8vPPTXTfYdLX5pCAxCl1XUX201Yq76RLYXtwrwaPFk5rdFVhzJCMn6xbZ4
         mVBItfUD4djUwZHPTfL5ykHEx924JTyxck9gb4yxXk+BbI1S/zXn3DZBjOX9r2Z3g/I3
         yuiA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794834928; x=1795439728; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W6W2a+Ik/jzUfwIzhXKNhPoJabT5jGj2MWmKqiZbU68=;
        b=oI31M9PMUKjKVuB+gEycYAxe+nrQfOg4TZ80dQtUpTtBI3W037HoPo6JTIM7azc+Ts
         YNoCSGppT2hGLdskxmW74ILVhD8pO1IpBl8cFzFwE8XRpzCrIq5q0FyS3eVpODa2kPsQ
         tMkhlMEDLC3Qh9jQWk8MYiVijV4uaHa3SNRrzOw4seqFQuYHnhGuVI/6kR1GOJjliNr8
         yOoJHjxKyEp3/cln+W2CX3Ti9Oy8OcQeLTBLTeyLAUMKAuVoSJ1dJN43RcVb52mhlrrR
         C2mir/LPWPrnKtxIlaSa008kqAXIXn7D6otjcEZobgOKcOhBktYfQZDSatrVkudSkHwu
         Eb8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794834928; x=1795439728;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W6W2a+Ik/jzUfwIzhXKNhPoJabT5jGj2MWmKqiZbU68=;
        b=L6kzByfA9AE/AuAHa3dJS772vt4bD+XYzeuYkTeMMKXPrh3HZJPjqHVy81A1JowXPa
         YzdTW+SIktQ94YvvZyPkyuiaVh8kXFc6/s/dDIQH79osOsB8CjOKfeinsvZKpsmK2Zhe
         r4jvRcTfwFwE5oQ5x4mE/PENIiwWKkepmgPLG2HIp56FvtXBzEU/72Jqd0rqjoS9St1l
         zUJg3TgDzVnr5i/px3AgdcGmsux+fU7RVQvHISFADNLM6H0giF4Tlp0YQz2Vq0ck7pn5
         uLebfO80OFjUUrwHco9RXVYPCOdGBrU+sxTXB7dySd4HKbnsBUjUgop1Wwvch6L9BTTx
         MZbg==
X-Forwarded-Encrypted: i=1; AL+hErGZPXMd3n6y15Qw5xWn7ix3wGiYcrr+bNSODOUzhQraDQkCCgM4c49+gUTjZYY4EBcGXxVcYRcpmiA=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8jZhJKmzaNP5jO7VgF5rWOvcNk9dhjEfDKgbvAZNdQ9W326I/M
	n2iQBE406TpUIC+pPOMYcfuM6dgzjNe9UnjgWj1efLFTEiLF1vPfTryfhCdRrsmxgMWZSlkGENn
	Z2IdA5lPXmL8tLBG5O3oetxhQgK8N7C0wH7fK
X-Gm-Gg: AYBFou3xFObH5pidG2xy3F8npM8o3NxLUVrs9ymjWCKOmAEdU7IRhfq5vbaXxEEmKAA
	8aVEXhwIKdmPzxZZHH8s4YJMOfgPOrSYb1Q32+/rA5KCfAO53Ux0gNEb/a52Pi0prPpzEVUW+Cw
	j0w9b8MPhWd5+MVGz7jiMygv6z7H5GiljArcRzHOlPnb4ujV5YpQTtmX2APH60VwI1J4v81idD6
	dTbWjE3DDVu2IPCjc2WIgjZiHTRAUL1KYmFdcU+cH1nhuMttcz5cO3o6kIMqB35Rl1BGxVwp84F
	zHIyYxSneSG694BOTKPmS8Rse9bwn/4yot7i/rvkkDdozSzdW7lBMEaGVgJ/QSn/a5d1kOf5wgH
	PlcWA272elDwY0SNFP9fepbLbBnAae0r4oHo=
X-Received: by 2002:a05:6512:b14:b0:5bf:d9bf:6605 with SMTP id
 2adb3069b0e04-5c170b74584mr4544380e87.61.1794834927283; Mon, 16 Nov 2026
 05:15:27 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1793129971.git.mykola_kvach@epam.com> <6b6566eae874fcc3a92a0730f0d0e5b84f7745a1.1793129971.git.mykola_kvach@epam.com>
 <9F13EB77-A262-419C-8D0D-A4190056AA71@arm.com>
In-Reply-To: <9F13EB77-A262-419C-8D0D-A4190056AA71@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 16 Nov 2026 15:15:16 +0200
X-Gm-Features: Aa3M54oqqYWtqpeXNulmH9gssX5H3bxkmis7QXbFnpYaU13EdTfTqqUCxy6372c
Message-ID: <CAGeoDV8de-60O1mZPqe5K_DpBpBXKoxNdigX6OAO7exC032YOg@mail.gmail.com>
Subject: Re: [PATCH v13 10/14] xen/arm: smmu-v3: add suspend/resume handlers
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Rahul Singh <Rahul.Singh@arm.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-bad1c0/1794834928-BCCCF034-F4EB012C/0/0
X-purgate-type: clean
X-purgate-size: 26921
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Bertrand,

Thanks for the review.

On Tue, Nov 10, 2026 at 5:41=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Mykola,
>
> > On 27 Oct 2026, at 22:05, Mykola Kvach <mykola_kvach@epam.com> wrote:
> >
> > Add system suspend/resume callbacks for the Arm SMMUv3 driver.
> >
> > During suspend, set GBPA.ABORT and disable the translation interface an=
d
> > EVTQ/PRIQ, while keeping CMDQ enabled. Save the queue producer indices =
after
> > the disable acknowledgements, then issue CMD_SYNC to wait for all earli=
er
> > commands to complete. Disable interrupt generation before stopping CMDQ=
,
> > and handle any remaining global errors before the SMMU loses power.
> >
> > If the initial GBPA update fails, leave that SMMU enabled and restore o=
nly
> > the previously suspended devices. For later failures, restore the curre=
nt
> > SMMU as well. Before each rollback reset, wait for EVTQ/PRIQ to stop an=
d
> > save their producer indices. This also covers a CR0ACK timeout before t=
he
> > normal suspend path has saved the indices. Failure to stop the queues o=
r
> > to reset during rollback is fatal, since the host suspend error path
> > allows domains to run again. Check GBPA and CMD_SYNC errors in reset so
> > an incomplete restore is not reported as successful.
> >
> > Resume uses arm_smmu_device_reset() to restore the SMMU registers and q=
ueue
> > indices, invalidate cached configuration and translations, and enable t=
he
> > SMMU. Schedule tasklets for unread queue entries: enabling interrupts d=
oes
> > not report events that were recorded before the interrupt source was
> > enabled. Prevent pending GERROR interrupts from accessing CMDQ while it=
 is
> > reset.
> >
> > Probe also changes with CONFIG_SYSTEM_SUSPEND disabled. Request IRQ
> > handlers only after the queues and tasklets are ready. If reset fails
> > during probe, call arm_smmu_device_disable() before freeing resources,
> > since queues may already be enabled. Panic if disabling fails: the SMMU
> > may still access the queue memory. The GERROR guard is also compiled in=
,
> > but is cleared before handlers are registered and stays clear after pro=
be.
> > Reset now returns GBPA and CMD_SYNC errors in these builds too.
> >
> > Clear MSI target addresses on both probe and resume, also without
> > CONFIG_MSI. Arm IHI0070G.b, sections 6.3.21 and 6.3.30, specify that th=
ese
> > addresses reset to UNKNOWN and that zero disables MSIs while allowing
> > wired IRQs. The corresponding IRQ_CTRL and IRQ_CTRLACK enable bits must
> > both be clear before writing these registers. Disable interrupt generat=
ion
> > and wait for IRQ_CTRLACK, as described in section 6.3.16, before cleari=
ng
> > the addresses.
> >
> > Xen currently does not support SMMUv3 MSI interrupts or PCI ATS/PRI. Ac=
tive
> > MSI configuration restore and ATS/PRI endpoint suspend handling remain
> > outside this patch.
> >
> > Link: https://lore.kernel.org/r/20260929034510.2023173-1-praan@google.c=
om/
> > Based-on-patch-by: Pranjal Shrivastava <praan@google.com>
> > Assisted-by: Codex:GPT-6
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in V13:
> > - Rename __init_or_smmu_suspend to init_or_smmu_suspend to avoid a rese=
rved
> >  macro name (MISRA Rule 21.1). No functional change.
> > - Check arm_smmu_device_disable() after a probe reset failure (MISRA Ru=
le
> >  17.7). Panic if disabling fails, before freeing queue memory.
> > - Adapt the relevant fixes from v11 of the Linux SMMUv3 suspend series.
> > - Request IRQs after the queues and tasklets are ready, only during pro=
be.
> > - Disable the SMMU on probe-time reset failure before freeing resources=
.
> > - Check GBPA and CMD_SYNC errors in reset, and make a failed rollback r=
eset
> >  fatal before the host suspend error path can resume domain execution.
> > - Leave the current SMMU enabled if the initial GBPA update fails; rest=
ore
> >  only the previously suspended devices.
> > - Clear MSI target addresses on probe and resume, also when using wired
> >  IRQs, and document the register requirements from IHI0070G.b.
> > - Save EVTQ/PRIQ producer indices after confirming that the queues have
> >  stopped, both during suspend and before rollback reset. Cover a CR0ACK
> >  timeout before the normal snapshot. Schedule tasklets after reset to
> >  process unread entries without waiting for a new interrupt.
> > - Keep GERROR handling available until interrupt generation is disabled=
,
> >  then gate its IRQ handler before stopping CMDQ. Handle remaining globa=
l
> >  errors before power-off and allow the handler again once CMDQ is resto=
red.
> > - Drop Luca's Reviewed-by tag because the patch has changed.
> >
> > Changes in V11:
> > - Keep arm_smmu_update_gbpa() and arm_smmu_device_reset() in init text =
when
> >  CONFIG_SYSTEM_SUSPEND is disabled.
> >
> > Changes in V10:
> > - Disable SMMU interrupt generation during suspend before disabling the
> >  SMMU interface, matching the resume/reset path which re-enables IRQ_CT=
RL.
> >
> > Changes in V9:
> > - Use CMD_SYNC in suspend instead of polling CMDQ_CONS, so the suspend
> >  path waits for command completion rather than only command consumption=
.
> > - Document that arm_smmu_setup_irqs() is probe-only and that future Xen
> >  SMMUv3 MSI support will need to restore SMMU IRQ_CFGn registers on
> >  resume.
> > - Restore the reference to Pranjal's Linux runtime/system sleep series =
and
> >  clarify that MSI/ATS/PRI resume handling is outside the supported Xen
> >  path.
> > - Prefix the subject with xen/arm for consistency with the rest of the
> >  Arm suspend/resume series.
> >
> > Changes in V8:
> > - Honor ARM_SMMU_FEAT_SEV when draining the CMDQ during suspend, matchi=
ng
> >  the existing runtime CMD_SYNC path.
> > - Fold the suspend rollback reset path into a helper and rename the err=
or
> >  reporting to describe suspend rollback rather than resume.
> > - Treat SMMU reset failure during resume as fatal instead of logging an=
d
> >  continuing with a potentially unusable IOMMU.
> > - cosmetic changes
> > ---
> > xen/drivers/passthrough/arm/smmu-v3.c | 308 +++++++++++++++++++++-----
> > xen/drivers/passthrough/arm/smmu-v3.h |   1 +
> > 2 files changed, 258 insertions(+), 51 deletions(-)
> >
> > diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passth=
rough/arm/smmu-v3.c
> > index bf153227db..58530ef2d1 100644
> > --- a/xen/drivers/passthrough/arm/smmu-v3.c
> > +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> > @@ -94,6 +94,12 @@
> >
> > #include "smmu-v3.h"
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +#define init_or_smmu_suspend
> > +#else
> > +#define init_or_smmu_suspend __init
> > +#endif
> > +
> > #define ARM_SMMU_VTCR_SH_IS           3
> > #define ARM_SMMU_VTCR_RGN_WBWA                1
> > #define ARM_SMMU_VTCR_TG0_4K          0
> > @@ -903,10 +909,10 @@ static void arm_smmu_priq_tasklet(void *dev)
> >
> > static int arm_smmu_device_disable(struct arm_smmu_device *smmu);
> >
> > -static void arm_smmu_gerror_handler(int irq, void *dev)
> > +/* The caller must serialize with the IRQ handler. */
> > +static void arm_smmu_handle_gerror(struct arm_smmu_device *smmu)
> > {
> >       u32 gerror, gerrorn, active;
> > -     struct arm_smmu_device *smmu =3D dev;
> >
> >       gerror =3D readl_relaxed(smmu->base + ARM_SMMU_GERROR);
> >       gerrorn =3D readl_relaxed(smmu->base + ARM_SMMU_GERRORN);
> > @@ -948,6 +954,14 @@ static void arm_smmu_gerror_handler(int irq, void =
*dev)
> >       writel(gerror, smmu->base + ARM_SMMU_GERRORN);
> > }
> >
> > +static void arm_smmu_gerror_handler(int irq, void *dev)
> > +{
> > +     struct arm_smmu_device *smmu =3D dev;
> > +
> > +     if (!read_atomic(&smmu->gerror_blocked))
> > +             arm_smmu_handle_gerror(smmu);
> > +}
> > +
> > static void arm_smmu_combined_irq_handler(int irq, void *dev)
> > {
> >       struct arm_smmu_device *smmu =3D dev;
> > @@ -1814,8 +1828,8 @@ static int arm_smmu_write_reg_sync(struct arm_smm=
u_device *smmu, u32 val,
> > }
> >
> > /* GBPA is "special" */
> > -static int __init arm_smmu_update_gbpa(struct arm_smmu_device *smmu,
> > -                                       u32 set, u32 clr)
> > +static int init_or_smmu_suspend
> > +arm_smmu_update_gbpa(struct arm_smmu_device *smmu, u32 set, u32 clr)
> > {
> >       int ret;
> >       u32 reg, __iomem *gbpa =3D smmu->base + ARM_SMMU_GBPA;
> > @@ -1836,6 +1850,20 @@ static int __init arm_smmu_update_gbpa(struct ar=
m_smmu_device *smmu,
> >       return ret;
> > }
> >
> > +static void arm_smmu_clear_msi_cfg(struct arm_smmu_device *smmu)
> > +{
> > +     /*
> > +      * IHI0070G.b, sections 6.3.21 and 6.3.30: ADDR resets to UNKNOWN=
.
> > +      * ADDR =3D=3D 0 disables MSIs while allowing wired IRQs. The cor=
responding
> > +      * IRQ_CTRL and IRQ_CTRLACK enable bits must be clear before writ=
ing.
> > +      */
> > +     writeq_relaxed(0, smmu->base + ARM_SMMU_GERROR_IRQ_CFG0);
> > +     writeq_relaxed(0, smmu->base + ARM_SMMU_EVTQ_IRQ_CFG0);
> > +
> > +     if (smmu->features & ARM_SMMU_FEAT_PRI)
> > +             writeq_relaxed(0, smmu->base + ARM_SMMU_PRIQ_IRQ_CFG0);
> > +}
> > +
> > #ifdef CONFIG_MSI
> > static void arm_smmu_free_msis(void *data)
> > {
> > @@ -1864,13 +1892,7 @@ static void arm_smmu_setup_msis(struct arm_smmu_=
device *smmu)
> >       int ret, nvec =3D ARM_SMMU_MAX_MSIS;
> >       struct device *dev =3D smmu->dev;
> >
> > -     /* Clear the MSI address regs */
> > -     writeq_relaxed(0, smmu->base + ARM_SMMU_GERROR_IRQ_CFG0);
> > -     writeq_relaxed(0, smmu->base + ARM_SMMU_EVTQ_IRQ_CFG0);
> > -
> > -     if (smmu->features & ARM_SMMU_FEAT_PRI)
> > -             writeq_relaxed(0, smmu->base + ARM_SMMU_PRIQ_IRQ_CFG0);
> > -     else
> > +     if (!(smmu->features & ARM_SMMU_FEAT_PRI))
> >               nvec--;
> >
> >       if (!(smmu->features & ARM_SMMU_FEAT_MSI))
> > @@ -1911,7 +1933,8 @@ static void arm_smmu_setup_msis(struct arm_smmu_d=
evice *smmu)
> > static inline void arm_smmu_setup_msis(struct arm_smmu_device *smmu) { =
}
> > #endif /* CONFIG_MSI */
> >
> > -static void __init arm_smmu_free_irqs(struct arm_smmu_device *smmu)
> > +static void init_or_smmu_suspend
> > +arm_smmu_free_irqs(struct arm_smmu_device *smmu)
> > {
> >       int irq;
> >
> > @@ -1995,19 +2018,38 @@ err_free_evtq_irq:
> >       return ret;
> > }
> >
> > -static int __init arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
> > +static int arm_smmu_enable_irqs(struct arm_smmu_device *smmu)
> > {
> > -     int ret, irq;
> > +     int ret;
> >       u32 irqen_flags =3D IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
> >
> > -     /* Disable IRQs first */
> > -     ret =3D arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
> > -                                   ARM_SMMU_IRQ_CTRLACK);
> > -     if (ret) {
> > -             dev_err(smmu->dev, "failed to disable irqs\n");
> > +     if ( smmu->features & ARM_SMMU_FEAT_PRI )
> > +             irqen_flags |=3D IRQ_CTRL_PRIQ_IRQEN;
> > +
> > +     /* Enable interrupt generation on the SMMU */
> > +     ret =3D arm_smmu_write_reg_sync(smmu, irqen_flags,
> > +                                   ARM_SMMU_IRQ_CTRL, ARM_SMMU_IRQ_CTR=
LACK);
> > +     if ( ret )
> > +     {
> > +             dev_warn(smmu->dev, "failed to enable irqs\n");
> >               return ret;
> >       }
> >
> > +     return 0;
> > +}
> > +
> > +static int arm_smmu_disable_irqs(struct arm_smmu_device *smmu)
> > +{
> > +     return arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
> > +                                    ARM_SMMU_IRQ_CTRLACK);
> > +}
> > +
> > +/* Probe-time only; reset has configured the queues and disabled IRQs.=
 */
> > +static int init_or_smmu_suspend
> > +arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
> > +{
> > +     int ret, irq;
> > +
> >       irq =3D smmu->combined_irq;
> >       if (irq) {
> >               /*
> > @@ -2028,22 +2070,7 @@ static int __init arm_smmu_setup_irqs(struct arm=
_smmu_device *smmu)
> >               }
> >       }
> >
> > -     if (smmu->features & ARM_SMMU_FEAT_PRI)
> > -             irqen_flags |=3D IRQ_CTRL_PRIQ_IRQEN;
> > -
> > -     /* Enable interrupt generation on the SMMU */
> > -     ret =3D arm_smmu_write_reg_sync(smmu, irqen_flags,
> > -                                   ARM_SMMU_IRQ_CTRL, ARM_SMMU_IRQ_CTR=
LACK);
> > -     if (ret) {
> > -             dev_warn(smmu->dev, "failed to enable irqs\n");
> > -             goto err_free_irqs;
> > -     }
> > -
> >       return 0;
> > -
> > -err_free_irqs:
> > -     arm_smmu_free_irqs(smmu);
> > -     return ret;
> > }
> >
> > static int arm_smmu_device_disable(struct arm_smmu_device *smmu)
> > @@ -2057,18 +2084,31 @@ static int arm_smmu_device_disable(struct arm_s=
mmu_device *smmu)
> >       return ret;
> > }
> >
> > -static int __init arm_smmu_device_reset(struct arm_smmu_device *smmu)
> > +static int init_or_smmu_suspend
> > +arm_smmu_device_reset(struct arm_smmu_device *smmu, bool resume)
> > {
> >       int ret;
> >       u32 reg, enables;
> >       struct arm_smmu_cmdq_ent cmd;
> >
> > +     ret =3D arm_smmu_disable_irqs(smmu);
> > +     if (ret) {
> > +             dev_err(smmu->dev, "failed to disable irqs\n");
> > +             return ret;
> > +     }
> > +
> > +     /* A pending GERROR IRQ must not access CMDQ while it is reset. *=
/
> > +     write_atomic(&smmu->gerror_blocked, true);
> > +     arm_smmu_clear_msi_cfg(smmu);
> > +
> >       /* Clear CR0 and sync (disables SMMU and queue processing) */
> >       reg =3D readl_relaxed(smmu->base + ARM_SMMU_CR0);
> >       if (reg & CR0_SMMUEN) {
> >               dev_warn(smmu->dev, "SMMU currently enabled! Resetting...=
\n");
> >               WARN_ON(!disable_bypass);
> > -             arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
> > +             ret =3D arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
> > +             if (ret)
> > +                     return ret;
> >       }
> >
> >       ret =3D arm_smmu_device_disable(smmu);
> > @@ -2107,10 +2147,15 @@ static int __init arm_smmu_device_reset(struct =
arm_smmu_device *smmu)
> >               return ret;
> >       }
> >
> > +     /* GERROR handling can use CMDQ again once its registers are rest=
ored. */
> > +     write_atomic(&smmu->gerror_blocked, false);
> > +
> >       /* Invalidate any cached configuration */
> >       cmd.opcode =3D CMDQ_OP_CFGI_ALL;
> >       arm_smmu_cmdq_issue_cmd(smmu, &cmd);
> > -     arm_smmu_cmdq_issue_sync(smmu);
> > +     ret =3D arm_smmu_cmdq_issue_sync(smmu);
> > +     if (ret)
> > +             return ret;
> >
> >       /* Invalidate any stale TLB entries */
> >       if (smmu->features & ARM_SMMU_FEAT_HYP) {
> > @@ -2120,7 +2165,9 @@ static int __init arm_smmu_device_reset(struct ar=
m_smmu_device *smmu)
> >
> >       cmd.opcode =3D CMDQ_OP_TLBI_NSNH_ALL;
> >       arm_smmu_cmdq_issue_cmd(smmu, &cmd);
> > -     arm_smmu_cmdq_issue_sync(smmu);
> > +     ret =3D arm_smmu_cmdq_issue_sync(smmu);
> > +     if (ret)
> > +             return ret;
> >
> >       /* Event queue */
> >       writeq_relaxed(smmu->evtq.q.q_base, smmu->base + ARM_SMMU_EVTQ_BA=
SE);
> > @@ -2163,17 +2210,18 @@ static int __init arm_smmu_device_reset(struct =
arm_smmu_device *smmu)
> >               }
> >       }
> >
> > -     ret =3D arm_smmu_setup_irqs(smmu);
> > -     if (ret) {
> > -             dev_err(smmu->dev, "failed to setup irqs\n");
> > -             return ret;
> > +     /* Register handlers only after their queues and tasklets are rea=
dy. */
> > +     if (!resume) {
> > +             ret =3D arm_smmu_setup_irqs(smmu);
> > +             if (ret) {
> > +                     dev_err(smmu->dev, "failed to setup irqs\n");
> > +                     return ret;
> > +             }
> >       }
> >
> > -     /* Initialize tasklets for threaded IRQs*/
> > -     tasklet_init(&smmu->evtq_irq_tasklet, arm_smmu_evtq_tasklet, smmu=
);
> > -     tasklet_init(&smmu->priq_irq_tasklet, arm_smmu_priq_tasklet, smmu=
);
> > -     tasklet_init(&smmu->combined_irq_tasklet, arm_smmu_combined_irq_t=
asklet,
> > -                              smmu);
> > +     ret =3D arm_smmu_enable_irqs(smmu);
> > +     if (ret)
> > +             goto err_free_irqs;
> >
> >       /* Enable the SMMU interface, or ensure bypass */
> >       if (disable_bypass) {
> > @@ -2190,10 +2238,18 @@ static int __init arm_smmu_device_reset(struct =
arm_smmu_device *smmu)
> >               goto err_free_irqs;
> >       }
> >
> > +     /* IHI0070G.b, section 6.3.16: re-enabling IRQs does not replay e=
vents. */
> > +     if (resume && !queue_empty(&smmu->evtq.q.llq))
> > +             tasklet_schedule(&smmu->evtq_irq_tasklet);
>
> Shouldn't we always schedule the EVTQ tasklet on resume?
>
> The saved indices may indicate an empty queue even if an event arrived
> after EVTQ was enabled but before its IRQ source was enabled. That event
> would not generate an interrupt.
>
> The tasklet already refreshes the producer index, so scheduling it
> unconditionally would cover this case too.

The suspend/resume flow was adapted from the Linux SMMUv3 PM series,
which assumes clients remain quiescent until the SMMU resumes. The
queue-empty check was added in Xen with the same assumption.

I'll remove that check and schedule the EVTQ tasklet unconditionally
on resume. It will then refresh the producer index even when the saved
indices indicate an empty queue.

Best regards,
Mykola


>
> Rest of the code looks ok to me.
>
> Regards
> Bertrand
>
>
> > +     if (resume && (smmu->features & ARM_SMMU_FEAT_PRI) &&
> > +         !queue_empty(&smmu->priq.q.llq))
> > +             tasklet_schedule(&smmu->priq_irq_tasklet);
> > +
> >       return 0;
> >
> > err_free_irqs:
> > -     arm_smmu_free_irqs(smmu);
> > +     if (!resume)
> > +             arm_smmu_free_irqs(smmu);
> >       return ret;
> > }
> >
> > @@ -2558,10 +2614,21 @@ static int __init arm_smmu_device_probe(struct =
platform_device *pdev)
> >       if (ret)
> >               goto out_free;
> >
> > +     /* Initialize tasklets for threaded IRQs*/
> > +     tasklet_init(&smmu->evtq_irq_tasklet, arm_smmu_evtq_tasklet, smmu=
);
> > +     tasklet_init(&smmu->priq_irq_tasklet, arm_smmu_priq_tasklet, smmu=
);
> > +     tasklet_init(&smmu->combined_irq_tasklet, arm_smmu_combined_irq_t=
asklet,
> > +                             smmu);
> > +
> >       /* Reset the device */
> > -     ret =3D arm_smmu_device_reset(smmu);
> > -     if (ret)
> > +     ret =3D arm_smmu_device_reset(smmu, false);
> > +     if (ret) {
> > +             /* Reset may have enabled queues before failing. */
> > +             if (arm_smmu_device_disable(smmu))
> > +                     panic("SMMUv3: %s: Failed to disable during probe=
 cleanup\n",
> > +                           dev_name(smmu->dev));
> >               goto out_free;
> > +     }
> >
> >       /*
> >        * Keep a list of all probed devices. This will be used to query
> > @@ -2575,7 +2642,6 @@ static int __init arm_smmu_device_probe(struct pl=
atform_device *pdev)
> >
> >       return 0;
> >
> > -
> > out_free:
> >       arm_smmu_free_structures(smmu);
> >       if (smmu->page1)
> > @@ -2855,6 +2921,142 @@ static void arm_smmu_iommu_xen_domain_teardown(=
struct domain *d)
> >       xfree(xen_domain);
> > }
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +
> > +static void arm_smmu_save_queue_producers(struct arm_smmu_device *smmu=
)
> > +{
> > +     /*
> > +      * IHI0070G.b, sections 6.3.9.4 and 6.3.9.5: EVTQ/PRIQ disable
> > +      * acknowledgements make committed entries visible. The caller mu=
st
> > +      * wait for these acknowledgements before reading the producer in=
dices.
> > +      */
> > +     if (queue_sync_prod_in(&smmu->evtq.q) =3D=3D -EOVERFLOW)
> > +             dev_warn(smmu->dev, "EVTQ overflow detected during suspen=
d\n");
> > +     if ((smmu->features & ARM_SMMU_FEAT_PRI) &&
> > +         queue_sync_prod_in(&smmu->priq.q) =3D=3D -EOVERFLOW)
> > +             dev_warn(smmu->dev, "PRIQ overflow detected during suspen=
d\n");
> > +}
> > +
> > +static void arm_smmu_reset_for_suspend_rollback(struct arm_smmu_device=
 *smmu)
> > +{
> > +     int ret;
> > +     u32 reg;
> > +
> > +     /*
> > +      * The queues have been requested to stop, but a CR0ACK timeout m=
ay
> > +      * have skipped saving their producer indices. Wait for the queue
> > +      * disable acknowledgements before reset overwrites those indices=
.
> > +      */
> > +     ret =3D readl_relaxed_poll_timeout(smmu->base + ARM_SMMU_CR0ACK, =
reg,
> > +                                      !(reg & (CR0_EVTQEN | CR0_PRIQEN=
)),
> > +                                      1, ARM_SMMU_POLL_TIMEOUT_US);
> > +     if (ret)
> > +             panic("SMMUv3: %s: Queue stop timed out during rollback: =
%d\n",
> > +                   dev_name(smmu->dev), ret);
> > +
> > +     arm_smmu_save_queue_producers(smmu);
> > +     ret =3D arm_smmu_device_reset(smmu, true);
> > +
> > +     /* The host suspend error path allows domains to run again. */
> > +     if ( ret )
> > +             panic("SMMUv3: %s: Failed to reset during suspend rollbac=
k: %d\n",
> > +                   dev_name(smmu->dev), ret);
> > +}
> > +
> > +static int arm_smmu_suspend(void)
> > +{
> > +     struct arm_smmu_device *smmu;
> > +     int ret =3D 0;
> > +
> > +     list_for_each_entry(smmu, &arm_smmu_devices, devices)
> > +     {
> > +             /* Abort all transactions before disable to avoid spuriou=
s bypass */
> > +             ret =3D arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
> > +             if ( ret )
> > +                     goto rollback_previous;
> > +
> > +             /* Disable the SMMU via CR0.EN and all queues except CMDQ=
 */
> > +             ret =3D arm_smmu_write_reg_sync(smmu, CR0_CMDQEN, ARM_SMM=
U_CR0,
> > +                                     ARM_SMMU_CR0ACK);
> > +             if ( ret )
> > +             {
> > +                     dev_err(smmu->dev, "Timed-out while disabling smm=
u\n");
> > +                     goto fail;
> > +             }
> > +
> > +             arm_smmu_save_queue_producers(smmu);
> > +
> > +             /*
> > +              * At this point the translation interface is disabled an=
d the
> > +              * SMMU won't access translation/config structures, even
> > +              * speculatively, as per the IHI0070 spec (section 6.3.9.=
6).
> > +              * CMDQ is still enabled so that a CMD_SYNC can complete =
any
> > +              * previously issued commands.
> > +              */
> > +
> > +             /* Ensure all previously issued commands have completed. =
*/
> > +             ret =3D arm_smmu_cmdq_issue_sync(smmu);
> > +             if ( ret )
> > +             {
> > +                     dev_err(smmu->dev, "Timed-out waiting for pending=
 commands\n");
> > +                     goto fail;
> > +             }
> > +
> > +             /* Stop IRQ generation before gating the handler and disa=
bling CMDQ. */
> > +             ret =3D arm_smmu_disable_irqs(smmu);
> > +             if (ret) {
> > +                     dev_err(smmu->dev, "Timed-out while disabling SMM=
U irqs\n");
> > +                     goto fail;
> > +             }
> > +             write_atomic(&smmu->gerror_blocked, true);
> > +
> > +             /* Disable everything */
> > +             ret =3D arm_smmu_device_disable(smmu);
> > +             if ( ret )
> > +                     goto fail;
> > +
> > +             /* Other CPUs are offline and the IRQ handler is gated ab=
ove. */
> > +             arm_smmu_handle_gerror(smmu);
> > +
> > +             dev_dbg(smmu->dev, "Suspended smmu\n");
> > +     }
> > +
> > +     return 0;
> > +
> > + fail:
> > +     /* Reset the device that failed as well as any already-suspended =
ones. */
> > +     arm_smmu_reset_for_suspend_rollback(smmu);
> > +
> > + rollback_previous:
> > +     /* An initial GBPA failure leaves this SMMU enabled: do not reset=
 it. */
> > +     list_for_each_entry_continue_reverse(smmu, &arm_smmu_devices, dev=
ices)
> > +             arm_smmu_reset_for_suspend_rollback(smmu);
> > +
> > +     return ret;
> > +}
> > +
> > +static void arm_smmu_resume(void)
> > +{
> > +     int ret;
> > +     struct arm_smmu_device *smmu;
> > +
> > +     list_for_each_entry(smmu, &arm_smmu_devices, devices)
> > +     {
> > +             dev_dbg(smmu->dev, "Resuming device\n");
> > +
> > +             /*
> > +              * The reset will re-initialize all the base addresses, q=
ueues,
> > +              * prod and cons maintained within struct arm_smmu_device=
 as well as
> > +              * re-enable the interrupts.
> > +              */
> > +             ret =3D arm_smmu_device_reset(smmu, true);
> > +             if ( ret )
> > +                     panic("SMMUv3: %s: Failed to reset during resume:=
 %d\n",
> > +                           dev_name(smmu->dev), ret);
> > +     }
> > +}
> > +#endif
> > +
> > static const struct iommu_ops arm_smmu_iommu_ops =3D {
> >       .page_sizes             =3D PAGE_SIZE_4K,
> >       .init                   =3D arm_smmu_iommu_xen_domain_init,
> > @@ -2867,6 +3069,10 @@ static const struct iommu_ops arm_smmu_iommu_ops=
 =3D {
> >       .unmap_page             =3D arm_iommu_unmap_page,
> >       .dt_xlate               =3D arm_smmu_dt_xlate,
> >       .add_device             =3D arm_smmu_add_device,
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +     .suspend                =3D arm_smmu_suspend,
> > +     .resume                 =3D arm_smmu_resume,
> > +#endif
> > };
> >
> > static __init int arm_smmu_dt_init(struct dt_device_node *dev,
> > diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passth=
rough/arm/smmu-v3.h
> > index ab07366294..93986886f2 100644
> > --- a/xen/drivers/passthrough/arm/smmu-v3.h
> > +++ b/xen/drivers/passthrough/arm/smmu-v3.h
> > @@ -613,6 +613,7 @@ struct arm_smmu_device {
> >       int                             combined_irq;
> >       u32                             sync_nr;
> >       u8                              prev_cmd_opcode;
> > +     bool                            gerror_blocked;
> >
> >       unsigned long                   ias; /* IPA */
> >       unsigned long                   oas; /* PA */
> > --
> > 2.53.0
> >
>
>

