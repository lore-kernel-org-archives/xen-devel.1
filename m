Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCAFCA5FC5
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 14:45:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437393.1656288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBvYX-0005sa-LZ; Wed, 30 Sep 2026 14:45:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437393.1656288; Wed, 30 Sep 2026 14:45:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBvYX-0005sT-Il; Wed, 30 Sep 2026 14:45:13 +0000
Received: by outflank-mailman (input) for mailman id 1437393;
 Wed, 30 Sep 2026 14:45:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1xBvYW-0005sN-5g
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 14:45:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBvYV-006pm8-BS
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:45:11 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6abd2067-bab6-0a2a0a5309dd-0a2a4504b2ea-38
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 16:45:11 +0200
Received: from [74.125.229.204] (helo=mail-lf2-f12.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6abd2074-b57f-0a2a45040019-4a7de5ccf769-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 16:45:08 +0200
Received: by mail-lf2-f12.google.com with SMTP id
 2adb3069b0e04-5b5e4f15b78so4981182e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 07:45:08 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1790779508; cv=none;
        d=google.com; s=arc-20260327;
        b=kr2uTE1yv3JNiYdnWZc5iAy7HQU0KxMb4AlvYPjPYAWGV+4vkYq6LtDcAwX71x4Txx
         f54ybWIUz2QOaQy+inFJPzzwvbZi7/objDkQAnAHC/87Lw8MGu3MI9Lz6qG6wNe8ptTW
         Sjls7JRHgyTQJETd+mjtt2p/+Qa1Rnuo7G5hhWBB+3hqYvLsFfLS75VGJpLeGS5MeJO+
         6Uub8WX0MRpNTUnE6VlArSxtbRaVDO6suZzjle4uqYLL1C91TMXFTVtcmsJPOwpEwBSA
         C3fgzLyhekjpEeNW4QM+T4IFJpgqS0CKtz21Mr4ZdI53cniKGnov62WnJxNfKY5da8Zc
         btSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Hzs/FAF27LZeP90UZC3MQWGdwRnh0pa67kPM/KT9rAQ=;
        fh=G0Ta35kwc9vobkV055UF01u2wfHMKixWfU+iIeFc12g=;
        b=SAbhhBDY+w72/VrZkH38mfzGNbURrsOqxuptyU2UXEacjwrIYY/UTBcVEcVqs45fya
         aN8xkOfexwm66vKbdhU8pfsDfsybnT+loFgIk1JFJlnf/D/utcUDUfrRQoSDdxJBfxpn
         ZWOpOX7/Rz2yP8DEo0YZEwbAiE3ZjqEHYEuUnCRQG7Dt6fZMl+ztsslRGXL7R7zxwOz5
         qXUfKaX3mLkH6sVPyXb9QRsBkeJ15XGc7Gpx06GBnUTaatGXMlhN7YoJOiJ8sqziHwVD
         AUvsjXXw+dDxFrMvOn+AWlHXsHWV+HtfTkjrlw4d8fi8bRrdGSBL6i6teJXxw/tD/fwM
         ieaQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790779508; x=1791384308; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hzs/FAF27LZeP90UZC3MQWGdwRnh0pa67kPM/KT9rAQ=;
        b=Rf6uQ8QF6gsPKPjRWYZF30H9kWIuF4sPU1SXMpk1U86jVp8Y2e6Qckb0zq9G/N7EK4
         kFL4yejy8pgONgHEuydMKmVA9+/hhzTRI1wc/3fawARkhbq9SQuBawZBLc3aoZM6ty69
         0+L6baI0cubOCSRK0FUWLQ/L4aXn4BfAHcR3+UxGr1zJXOuT29Klu6Nj27/WYznj1sx3
         iME5P427hoWJ+wlsYACuk3A8Z7hpk+pgAfuYVU4Fq6/N72WNyAkL3o1BmE+QJYGnLA2/
         //bB2WEUXgDhAi8d0KLWg7w323lh6n8tMxGRhAS3h+B+fiHGJGUW8z8NYcpYpCvxP1RA
         DydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790779508; x=1791384308;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hzs/FAF27LZeP90UZC3MQWGdwRnh0pa67kPM/KT9rAQ=;
        b=Dnx14Lwni2dtuQgnxx8ytiRAxVhzjpnyn+sq79VFa7Dv33eL2bPLMld7voWObK9azo
         fOnbJKM0q9f32RSgXhNrCsBdb1939kWR4jGnQofiq5YKGDcO/gljvaA5k6i2ydlY+heQ
         HznQVTImGmin/XtPNRqBqUa7aCeqIAJead0vCLKkb6R7kuuh/4PPvd1/xsFtdPQ6ohAC
         hFQmksyGFSji8D8kvlrd5Ja0p+4oLX+wqXbtuLixpvaKjsy4CxMSWyVqN/qtpDVff3Ye
         SIpAf5wyNqK6EsoJgh2brX3Krwv8bJ5zPe1MWnYDcdexiVgDL6v7HK+USS5zwgeLG2+k
         Ag9A==
X-Forwarded-Encrypted: i=1; AKwUvByNzKlaTxNgSxfPBRfcYjmuc6cDW9lDilb8sEO5b3a0p5ZMF421t+B8l1bhdDxPCo9PpmNHSjs8OtA=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLaHtvVkeepYKGinQpE7FX703HSa6h8BMIglnjZaAB80FhkpKXf
	2Upq3AQDgQmKAZw1/1h5KcNmkoCSzarZlmy13TswkQv2eK2+xANF9CvJFBjQC6nvlDB7Dh9lI7m
	Rf/B+Mw8S5y/Ap0XvYWqypAaS7WMlzDs=
X-Gm-Gg: AYBFou3sm34lxtBGrT2Et1iy6iWKRQ72VeTstIi011mh05RmggwzDQIgmFYelN4BLcg
	P5fnRhsclI2sediGson2aOj5h3CiXHSqbYhDVk8N/GZ0Wkp6nEUrvy+btqbSmngxu3xQXu7Naeh
	qCxLoIzzET3f18Tl5qYemq+i7ljCJYWGmHhxEUX3h8/fNjrITmr1JYcsVRRfX3ArJcPV2w6aahU
	fDoS9EK0lmtUnhnf/93xTiO5+o5vNaLvi4HbZpsshweH0vyGwExL0MMw0YSTESkbxRmevNiYFlJ
	Iz9zYoXsy9Y4NFJ5nTgpdpTH0r5yLJbMzwMrtZ75v5Atl/SuticaOPQ=
X-Received: by 2002:ac2:4ac3:0:b0:5b8:bc5e:b56f with SMTP id
 2adb3069b0e04-5ba40611bcbmr581878e87.39.1790779507580; Wed, 30 Sep 2026
 07:45:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1787838455.git.mykola_kvach@epam.com> <388056532b9d11c1db1631c1b8385b317ec46e02.1787838455.git.mykola_kvach@epam.com>
 <0094745D-F00F-4376-9CD7-4EE07ACC6816@arm.com>
In-Reply-To: <0094745D-F00F-4376-9CD7-4EE07ACC6816@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 30 Sep 2026 17:44:55 +0300
X-Gm-Features: AclHuK822Mb1HXlG9cL0RqIrUegyr5hE_w3FA6Bg7hFYgeMd8koDXXKPvzUtxsM
Message-ID: <CAGeoDV8OHkSxUKaZRVX-bH6d_MPws_9o1MG_G8WibQhthO7xWg@mail.gmail.com>
Subject: Re: [PATCH v12 09/13] xen/arm: smmu-v3: add suspend/resume handlers
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Rahul Singh <Rahul.Singh@arm.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Pranjal Shrivastava <praan@google.com>, Luca Fancellu <Luca.Fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ebf023/1790779508-585C7B50-5C15727A/0/0
X-purgate-type: clean
X-purgate-size: 13281

Hi Bertrand,

Thank you for the review.

On Mon, Sep 28, 2026 at 7:18=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Mykola,
>
> > On 27 Aug 2026, at 16:31, Mykola Kvach <mykola_kvach@epam.com> wrote:
> >
> > Add system suspend/resume callbacks for the Arm SMMUv3 driver.
> >
> > During suspend, configure GBPA to abort incoming transactions, disable =
the
> > translation interface while keeping CMDQ enabled, issue CMD_SYNC to ens=
ure
> > all previously issued commands have completed, then disable the SMMU IR=
Qs
> > and SMMU.
> >
> > Resume uses arm_smmu_device_reset() to reprogram the SMMU and re-enable
> > translation and interrupt generation.
> >
> > The IRQ setup split follows the approach from Pranjal Shrivastava's Lin=
ux
> > arm-smmu-v3 runtime/system sleep series: IRQ handlers are requested onc=
e
> > during probe, while reset/resume only restores SMMU hardware state and
> > re-enables IRQ_CTRL.
> >
> > Only the pieces relevant to Xen's currently supported SMMUv3 path are
> > ported here. Xen documents SMMUv3 MSI and PCI ATS as unsupported and no=
t
> > compiled/tested, so this patch does not restore SMMU MSI IRQ_CFGn regis=
ters
> > nor reinitialize ATS/PRI endpoints. If those paths become usable,
> > suspend/resume will need corresponding MSI restore and ATS/PRI
> > quiesce/reinit steps.
> >
> > Link: https://lore.kernel.org/r/20260414194702.1229094-1-praan@google.c=
om/
> > Based-on-patch-by: Pranjal Shrivastava <praan@google.com>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> > ---
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
> > xen/drivers/passthrough/arm/smmu-v3.c | 194 +++++++++++++++++++++-----
> > 1 file changed, 158 insertions(+), 36 deletions(-)
> >
> > diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passth=
rough/arm/smmu-v3.c
> > index bf153227db..7f1d00fb81 100644
> > --- a/xen/drivers/passthrough/arm/smmu-v3.c
> > +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> > @@ -94,6 +94,12 @@
> >
> > #include "smmu-v3.h"
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +#define __init_or_smmu_suspend
> > +#else
> > +#define __init_or_smmu_suspend __init
> > +#endif
> > +
> > #define ARM_SMMU_VTCR_SH_IS 3
> > #define ARM_SMMU_VTCR_RGN_WBWA 1
> > #define ARM_SMMU_VTCR_TG0_4K 0
> > @@ -1814,8 +1820,8 @@ static int arm_smmu_write_reg_sync(struct arm_smm=
u_device *smmu, u32 val,
> > }
> >
> > /* GBPA is "special" */
> > -static int __init arm_smmu_update_gbpa(struct arm_smmu_device *smmu,
> > -                                       u32 set, u32 clr)
> > +static int __init_or_smmu_suspend
> > +arm_smmu_update_gbpa(struct arm_smmu_device *smmu, u32 set, u32 clr)
> > {
> > int ret;
> > u32 reg, __iomem *gbpa =3D smmu->base + ARM_SMMU_GBPA;
> > @@ -1995,10 +2001,35 @@ err_free_evtq_irq:
> > return ret;
> > }
> >
> > +static int arm_smmu_enable_irqs(struct arm_smmu_device *smmu)
> > +{
> > + int ret;
> > + u32 irqen_flags =3D IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
> > +
> > + if ( smmu->features & ARM_SMMU_FEAT_PRI )
> > + irqen_flags |=3D IRQ_CTRL_PRIQ_IRQEN;
> > +
> > + /* Enable interrupt generation on the SMMU */
> > + ret =3D arm_smmu_write_reg_sync(smmu, irqen_flags,
> > +      ARM_SMMU_IRQ_CTRL, ARM_SMMU_IRQ_CTRLACK);
> > + if ( ret )
> > + {
> > + dev_warn(smmu->dev, "failed to enable irqs\n");
> > + return ret;
> > + }
> > +
> > + return 0;
> > +}
> > +
> > +/*
> > + * Probe-time only: request host IRQs and, when available, program the=
 SMMU's
> > + * MSI doorbells. Resume does not restore the SMMU *_IRQ_CFGn MSI regi=
sters,
> > + * so any host suspend support must treat the active MSI IRQ path as
> > + * unsupported until that restore path exists.
> > + */
> > static int __init arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
> > {
> > int ret, irq;
> > - u32 irqen_flags =3D IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
> >
> > /* Disable IRQs first */
> > ret =3D arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
> > @@ -2028,22 +2059,7 @@ static int __init arm_smmu_setup_irqs(struct arm=
_smmu_device *smmu)
> > }
> > }
> >
> > - if (smmu->features & ARM_SMMU_FEAT_PRI)
> > - irqen_flags |=3D IRQ_CTRL_PRIQ_IRQEN;
> > -
> > - /* Enable interrupt generation on the SMMU */
> > - ret =3D arm_smmu_write_reg_sync(smmu, irqen_flags,
> > -      ARM_SMMU_IRQ_CTRL, ARM_SMMU_IRQ_CTRLACK);
> > - if (ret) {
> > - dev_warn(smmu->dev, "failed to enable irqs\n");
> > - goto err_free_irqs;
> > - }
> > -
> > return 0;
> > -
> > -err_free_irqs:
> > - arm_smmu_free_irqs(smmu);
> > - return ret;
> > }
> >
> > static int arm_smmu_device_disable(struct arm_smmu_device *smmu)
> > @@ -2057,7 +2073,8 @@ static int arm_smmu_device_disable(struct arm_smm=
u_device *smmu)
> > return ret;
> > }
> >
> > -static int __init arm_smmu_device_reset(struct arm_smmu_device *smmu)
> > +static int __init_or_smmu_suspend
> > +arm_smmu_device_reset(struct arm_smmu_device *smmu)
> > {
> > int ret;
> > u32 reg, enables;
> > @@ -2163,17 +2180,9 @@ static int __init arm_smmu_device_reset(struct a=
rm_smmu_device *smmu)
> > }
> > }
> >
> > - ret =3D arm_smmu_setup_irqs(smmu);
> > - if (ret) {
> > - dev_err(smmu->dev, "failed to setup irqs\n");
> > + ret =3D arm_smmu_enable_irqs(smmu);
> > + if ( ret )
> > return ret;
> > - }
> > -
> > - /* Initialize tasklets for threaded IRQs*/
> > - tasklet_init(&smmu->evtq_irq_tasklet, arm_smmu_evtq_tasklet, smmu);
> > - tasklet_init(&smmu->priq_irq_tasklet, arm_smmu_priq_tasklet, smmu);
> > - tasklet_init(&smmu->combined_irq_tasklet, arm_smmu_combined_irq_taskl=
et,
> > - smmu);
> >
> > /* Enable the SMMU interface, or ensure bypass */
> > if (disable_bypass) {
> > @@ -2181,20 +2190,16 @@ static int __init arm_smmu_device_reset(struct =
arm_smmu_device *smmu)
> > } else {
> > ret =3D arm_smmu_update_gbpa(smmu, 0, GBPA_ABORT);
> > if (ret)
> > - goto err_free_irqs;
> > + return ret;
> > }
> > ret =3D arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
> >      ARM_SMMU_CR0ACK);
> > if (ret) {
> > dev_err(smmu->dev, "failed to enable SMMU interface\n");
> > - goto err_free_irqs;
> > + return ret;
> > }
> >
> > return 0;
> > -
> > -err_free_irqs:
> > - arm_smmu_free_irqs(smmu);
> > - return ret;
> > }
> >
> > static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
> > @@ -2558,10 +2563,23 @@ static int __init arm_smmu_device_probe(struct =
platform_device *pdev)
> > if (ret)
> > goto out_free;
> >
> > + ret =3D arm_smmu_setup_irqs(smmu);
> > + if ( ret )
> > + {
> > + dev_err(smmu->dev, "failed to setup irqs\n");
> > + goto out_free;
> > + }
> > +
> > + /* Initialize tasklets for threaded IRQs*/
> > + tasklet_init(&smmu->evtq_irq_tasklet, arm_smmu_evtq_tasklet, smmu);
> > + tasklet_init(&smmu->priq_irq_tasklet, arm_smmu_priq_tasklet, smmu);
> > + tasklet_init(&smmu->combined_irq_tasklet, arm_smmu_combined_irq_taskl=
et,
> > + smmu);
> > +
> > /* Reset the device */
> > ret =3D arm_smmu_device_reset(smmu);
> > if (ret)
> > - goto out_free;
> > + goto out_free_irqs;
> >
> > /*
> > * Keep a list of all probed devices. This will be used to query
> > @@ -2575,6 +2593,8 @@ static int __init arm_smmu_device_probe(struct pl=
atform_device *pdev)
> >
> > return 0;
> >
> > +out_free_irqs:
> > + arm_smmu_free_irqs(smmu);
> >
> > out_free:
> > arm_smmu_free_structures(smmu);
> > @@ -2855,6 +2875,104 @@ static void arm_smmu_iommu_xen_domain_teardown(=
struct domain *d)
> > xfree(xen_domain);
> > }
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +
> > +static void arm_smmu_reset_for_suspend_rollback(struct arm_smmu_device=
 *smmu)
> > +{
> > + int ret =3D arm_smmu_device_reset(smmu);
> > +
> > + if ( ret )
> > + dev_err(smmu->dev, "Failed to reset during suspend rollback: %d\n",
> > + ret);
>
> If reset fails here, we only print an error.
>
> Could the SMMU be left disabled with GBPA.ABORT cleared, allowing guest
> DMA to bypass translation when the domains resume?

In Xen, disable_bypass is always true, so reset does not clear
GBPA.ABORT. After a successful ABORT update, the bit stays set
during rollback. If reset then fails with the SMMU disabled,
transactions will still be aborted.

Still, logging a rollback error is not enough. After suspend
fails, the host can let domains run again, so rollback must
restore the SMMU.

In the next version, if the first GBPA update times out, I will
leave the current SMMU enabled and restore only the previously
suspended ones.

The GBPA update may still complete later. This is safe here:
GBPA.ABORT controls transactions only when CR0.SMMUEN is clear
(IHI0070G.b, section 6.3.14). We have not written CR0 at this
point, so translation and queues remain enabled even if the
GBPA update completes after the timeout.

If a later suspend step fails, I will try to restore both the
current SMMU and the previously suspended ones. If any rollback
reset fails, I will call panic(), as we already do when reset
fails during resume.

I will also check the GBPA and both CMD_SYNC return values in
reset, so these errors are passed back to the caller.

A suspend failure will still be recoverable if rollback succeeds.

>
>
> > +}
> > +
> > +static int arm_smmu_suspend(void)
> > +{
> > + struct arm_smmu_device *smmu;
> > + int ret =3D 0;
> > +
> > + list_for_each_entry(smmu, &arm_smmu_devices, devices)
> > + {
> > + /* Abort all transactions before disable to avoid spurious bypass */
> > + ret =3D arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
> > + if ( ret )
> > + goto fail;
> > +
> > + ret =3D arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
> > + ARM_SMMU_IRQ_CTRLACK);
> > + if ( ret )
> > + {
> > + dev_err(smmu->dev, "Timed-out while disabling SMMU irqs\n");
> > + goto fail;
> > + }
> > +
> > + /* Disable the SMMU via CR0.EN and all queues except CMDQ */
> > + ret =3D arm_smmu_write_reg_sync(smmu, CR0_CMDQEN, ARM_SMMU_CR0,
> > + ARM_SMMU_CR0ACK);
> > + if ( ret )
> > + {
> > + dev_err(smmu->dev, "Timed-out while disabling smmu\n");
> > + goto fail;
> > + }
> > +
> > + /*
> > + * At this point the translation interface is disabled and the
> > + * SMMU won't access translation/config structures, even
> > + * speculatively, as per the IHI0070 spec (section 6.3.9.6).
> > + * CMDQ is still enabled so that a CMD_SYNC can complete any
> > + * previously issued commands.
> > + */
> > +
> > + /* Ensure all previously issued commands have completed. */
> > + ret =3D arm_smmu_cmdq_issue_sync(smmu);
> > + if ( ret )
> > + {
> > + dev_err(smmu->dev, "Timed-out waiting for pending commands\n");
> > + goto fail;
> > + }
>
> Could we lose EVTQ events here because we do not check the queue after
> stopping it?

Yes, the old code could lose unread EVTQ entries. The hardware
producer index may be ahead of our cached value. Reset would
then restore the old index and hide those entries.

I will save the producer index after the queue is disabled and
CR0ACK confirms that the change is complete. The queue memory
and consumer index will be kept across suspend.

I will also cover rollback after a timeout while stopping the
queue. I will wait again for the stop acknowledgement, then save
the producer index before reset overwrites it. If this wait also
times out, I will call panic().

After reset, I will schedule the EVTQ tasklet if unread entries
remain. Re-enabling interrupts does not report old events again
(IHI0070G.b, section 6.3.16).

This preserves entries already recorded in the queue. Section
6.3.9.4 allows uncommitted events from terminated faulting
transactions to be discarded when the queue is disabled.

Best regards,
Mykola

