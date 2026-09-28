Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203D5C9833E
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 08:02:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1435730.1654517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB6JO-0007ot-3I; Mon, 28 Sep 2026 08:02:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1435730.1654517; Mon, 28 Sep 2026 08:02:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB6JN-0007ol-UE; Mon, 28 Sep 2026 08:02:09 +0000
Received: by outflank-mailman (input) for mailman id 1435730;
 Mon, 28 Sep 2026 08:02:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1xB6JL-0007oZ-L5
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 08:02:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xB6JK-004lIh-Gk
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 10:02:06 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6aba1efd-e002-0a2a0a5209dd-0a2a4508e8ae-8
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 10:02:06 +0200
Received: from [74.125.229.204] (helo=mail-lf2-f12.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6aba1efe-f659-0a2a45080019-4a7de5cceca7-3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 10:02:06 +0200
Received: by mail-lf2-f12.google.com with SMTP id
 2adb3069b0e04-5b8e820df9dso2410666e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 01:02:06 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1790582526; cv=none;
        d=google.com; s=arc-20260327;
        b=A487BrtTrzusUQTHtJNsKlfvm+q+SWjyi5SE2H1xGFOAmAo+nBDg6xkH6H6NIuA2h4
         3QZEBxgxuciX7Dct6Mohn8oMbEAlGHbADNdfhNKgiXCmNhDKuy6N2vss3vLM06YmqgtI
         xKerQ0Egz1ivfKlnOeIh161tkjwy/JY/kfqojNref4PZrUJrN0eRL6XsIj1OYLPKmLDv
         Ds5m3R+V7CsfGViqnPOSNUMNIuNGtVR4irjk4srwx2dB2ESFuufhfGVGQTOVvBZ/krt7
         tFZx7eXQUtaBVSYiSxKRNEYXi5oY6zruTKszgiiFb2ekCUJV9EQ7KnHWdjdzVY7wlrht
         gBHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Py8n8iDBXaL82ssdail2oL8R19r1yPS4ZKTRmaNWeuw=;
        fh=wRRAxjw+I7nT0k2ZHMfftQJU7E4OZsJ3+24v/lSMYnA=;
        b=gry8Vudh4zYPvLkpUzOrrAi8amHkpb3geVIuFOJFF9zafWyobpwQ5R18IOF5ajwQOM
         3UjaOb3wN2OIaDqWPjWQ2lI4GrtURNN3j3LDgGMbQyts9ZJ4e8uCqX4iLsuvkk36SdEQ
         FZbWckJPH2Tz6g3eiX28R/ju0SP/xowkJ3pYLh/o4MRUpi1eLxhHuXDeJ6T/rJ3P7LRQ
         +5fV8Mn14Yj5gggaLNHUX7+bhWDnzFRpZcFC6kEyC5BV8atv8OgyW9Ackh6ROcdYmvYV
         yd4IoHKljdEToOcu2Z8wUGeKh5haf+NwcI9pcetfBQbVMoYgnlcb+TjwEsx7/IPj2/1Y
         y2+w==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790582526; x=1791187326; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Py8n8iDBXaL82ssdail2oL8R19r1yPS4ZKTRmaNWeuw=;
        b=av4/CAIWEBYC/Kw1hcTMJykY8bb3Ek1/RseMMKFCxU0A/Q2KxzQQYbbk+rLezQF2iZ
         TciCpCtcKlz9lqGThR8sFCTxTLo2HKAOFlR/n0/LniKY+q+7sspsstMp5kO2iuzjPUvj
         A1NCBdvu2sEhotdmxpEL9XvSC7qHsR454H4m7btsDDnJNHotP1rA0LGs7U805zfE3nw7
         5lNUMBO92yTrwuCzkK3BBga38uAsdnlqqILSioOemw+fOpHfXprs/F7sUqS7ebr25rq8
         gavVp7vVSpW832NvKE2TmiBqxX1tmaiF1mlneusJBjKkEqdPoPWJ53618YV+EVgudacM
         PhAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790582526; x=1791187326;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Py8n8iDBXaL82ssdail2oL8R19r1yPS4ZKTRmaNWeuw=;
        b=CxHBBnOl6mQ7ohtyXaB+1T+J2tHBXgUDdL29mmle2LokM+tK0CxifoTDZsrvWXX1Ba
         e1ZQu8lUfkMPDWc0YnHvp1JTehW0rf+5Guo5jHgKsUKEvk3K4IUH5GLdJ3G9l943RTz2
         cW/M/skCeAl4CsTzu1+LtBVttEFIegj12aHpxB7XLfIl4NUjLGkkBFOEXCuxfT8PRdlm
         GQAjSTh3g9FjIVTBA0ctr76H+hUVdAARNo87W8NDuVLgexG548iSDehi73NBt7Jlbh1w
         XJcO+XDjqYSnd1C/zLn4Rly6ADhycGfeWzA2FISbwDVEhy1qglTn5gC96e7cF+3A5fgH
         yAGg==
X-Gm-Message-State: AFq9FYLwebgAYlXqgvH6uykw1iJGg68eD9I4htMR/PQEZ5IrZaoHlE9/
	OotjotZkqS6wEh8VOBmji9G8rZ2GLw1Yw/kIZ720ee3fpUzCQOu1MnOi5aEEmGnlWDlIF9mrKKm
	UCnzRKvl8HNZ7OUlRb8+jWdcnOhsDUf8=
X-Gm-Gg: AYBFou0ozYmMTGSjKdcSYD1YclTkUCfDpHXNjWOxpVVvOPsT2ulh6AdtE5HriiA9v4p
	dtwMMtRzKDIGPe4pdfrPQDXF7oEvbTBKxZS1YsxskqPlibf9Nmxyfb+Uc1c3QcvsseLvHji/0Bt
	uVltWiRO/V1WW7uREpaWwCSVzkCvQ6oy1u49M0IBsu3b4ZHYpzW7g0pK0TP8Axrf0oLlUrCQ+/C
	VM7U98DFZyBpbSwus+nINMy6dtVScT2FLSf6NnCqdy1vR/bNJ8S4frb3IEsBcBkdC9AnPR58RBb
	aQP2Bv0DsZ8aF+IpKplkYlKB1rWrqAN/Yp5WoBRE3OMMI8movHXKaQ==
X-Received: by 2002:a05:6512:b07:b0:5b2:f426:9c63 with SMTP id
 2adb3069b0e04-5b8df093006mr4468582e87.22.1790582525271; Mon, 28 Sep 2026
 01:02:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1787838455.git.mykola_kvach@epam.com> <1f036e7ad5ad6efba635ca029b0fab133300603a.1787838455.git.mykola_kvach@epam.com>
In-Reply-To: <1f036e7ad5ad6efba635ca029b0fab133300603a.1787838455.git.mykola_kvach@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 28 Sep 2026 11:01:53 +0300
X-Gm-Features: AclHuK8shQ5US8U3u0ABVDkAVoSt43igmyLiVv8AJtOUQapCokSJmdwgxwzBl2c
Message-ID: <CAGeoDV8wSQo9NLD-P5+mm7R9TkkBpxdE1W0wAKawgGBnXgMdmg@mail.gmail.com>
Subject: Re: [PATCH v12 08/13] iommu/ipmmu-vmsa: Implement suspend/resume callbacks
To: Mykola Kvach <mykola_kvach@epam.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Luca Fancellu <luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1790582526-DF8D587B-F825FE7C/0/0
X-purgate-type: clean
X-purgate-size: 16941

Hi all,

I have one more thing to check here regarding the R-Car Gen4 PCIe
BDF-to-OSID mappings across system suspend/resume.

The mappings are programmed in the PCIe APP CNVID/CNVIDMSK registers,
while CNVOSIDCTRL provides the default OSID. If this state is lost
during SYSTEM_SUSPEND, PCI DMA could potentially use the default OSID
after resume instead of the OSID assigned to the device.

I also found a recent Linux rcar-gen4 PCIe PM patch which notes that
S4 and V4H use an always-on PCIe power domain, while on V4M the PCIe
controller loses state during suspend. However, I have not found an
explicit guarantee that these particular APP registers are retained
on S4.

The Linux BSP is not a direct reference for this case, as its current
R-Car S4 IPMMU setup does not use the per-BDF OSID mappings programmed
through these registers.

This series has not previously been tested on R-Car S4 Spider. I have
tested the suspend/resume path on several other platforms (R-Car H3ULCB,
R-Car Gen5 and Orange Pi 5), but not this particular PCIe state.

I will also try to check this on a real R-Car S4 board by comparing
the PCIe APP register state before and after SYSTEM_SUSPEND.

So please consider this patch as needing some further investigation
from my side for now.

Thanks,
Mykola

On Thu, Aug 27, 2026 at 6:45=E2=80=AFPM Mykola Kvach <mykola_kvach@epam.com=
> wrote:
>
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> Store and restore active context and micro-TLB registers.
>
> On resume, restore Root IPMMU context state before restoring Cache IPMMU
> micro-TLB state. Cache IPMMUs select Root contexts through their micro-TL=
B
> configuration, so restoring Cache micro-TLBs before the Root context
> registers are restored can expose stale or uninitialized context state.
>
> Tested on R-Car H3 Starter Kit.
>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> Changes in V10:
> - Iterate over registered IPMMUs in reverse order during resume so Root I=
PMMU
>   context state is restored before Cache IPMMU micro-TLB state.
>
> Changes in V9:
> - set dt_device_set_protected() only after ipmmu_alloc_ctx_suspend()
>   succeeds, so DT devices do not remain protected on allocation failure.
>
> Changes in V7:
> - moved suspend context allocation before pci stuff
> ---
>  xen/drivers/passthrough/arm/ipmmu-vmsa.c | 323 +++++++++++++++++++++--
>  1 file changed, 308 insertions(+), 15 deletions(-)
>
> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passt=
hrough/arm/ipmmu-vmsa.c
> index fa9ab9cb13..2e54fa63d6 100644
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -71,6 +71,8 @@
>  })
>  #endif
>
> +#define dev_dbg(dev, fmt, ...)    \
> +    dev_print(dev, XENLOG_DEBUG, fmt, ## __VA_ARGS__)
>  #define dev_info(dev, fmt, ...)    \
>      dev_print(dev, XENLOG_INFO, fmt, ## __VA_ARGS__)
>  #define dev_warn(dev, fmt, ...)    \
> @@ -130,6 +132,24 @@ struct ipmmu_features {
>      unsigned int imuctr_ttsel_mask;
>  };
>
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +struct ipmmu_reg_ctx {
> +    unsigned int imttlbr0;
> +    unsigned int imttubr0;
> +    unsigned int imttbcr;
> +    unsigned int imctr;
> +};
> +
> +struct ipmmu_vmsa_backup {
> +    struct device *dev;
> +    unsigned int *utlbs_val;
> +    unsigned int *asids_val;
> +    struct list_head list;
> +};
> +
> +#endif
> +
>  /* Root/Cache IPMMU device's information */
>  struct ipmmu_vmsa_device {
>      struct device *dev;
> @@ -142,6 +162,9 @@ struct ipmmu_vmsa_device {
>      struct ipmmu_vmsa_domain *domains[IPMMU_CTX_MAX];
>      unsigned int utlb_refcount[IPMMU_UTLB_MAX];
>      const struct ipmmu_features *features;
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    struct ipmmu_reg_ctx *reg_backup[IPMMU_CTX_MAX];
> +#endif
>  };
>
>  /*
> @@ -547,6 +570,249 @@ static void ipmmu_domain_free_context(struct ipmmu_=
vmsa_device *mmu,
>      spin_unlock_irqrestore(&mmu->lock, flags);
>  }
>
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +static DEFINE_SPINLOCK(ipmmu_devices_backup_lock);
> +static LIST_HEAD(ipmmu_devices_backup);
> +
> +static struct ipmmu_reg_ctx root_pgtable[IPMMU_CTX_MAX];
> +
> +static uint32_t ipmmu_imuasid_read(struct ipmmu_vmsa_device *mmu,
> +                                   unsigned int utlb)
> +{
> +    return ipmmu_read(mmu, ipmmu_utlb_reg(mmu, IMUASID(utlb)));
> +}
> +
> +static void ipmmu_utlbs_backup(struct ipmmu_vmsa_device *mmu)
> +{
> +    struct ipmmu_vmsa_backup *backup_data;
> +
> +    dev_dbg(mmu->dev, "Handle micro-TLBs backup\n");
> +
> +    spin_lock(&ipmmu_devices_backup_lock);
> +
> +    list_for_each_entry( backup_data, &ipmmu_devices_backup, list )
> +    {
> +        struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(backup_data=
->dev);
> +        unsigned int i;
> +
> +        if ( to_ipmmu(backup_data->dev) !=3D mmu )
> +            continue;
> +
> +        for ( i =3D 0; i < fwspec->num_ids; i++ )
> +        {
> +            unsigned int utlb =3D fwspec->ids[i];
> +
> +            backup_data->asids_val[i] =3D ipmmu_imuasid_read(mmu, utlb);
> +            backup_data->utlbs_val[i] =3D ipmmu_imuctr_read(mmu, utlb);
> +        }
> +    }
> +
> +    spin_unlock(&ipmmu_devices_backup_lock);
> +}
> +
> +static void ipmmu_utlbs_restore(struct ipmmu_vmsa_device *mmu)
> +{
> +    struct ipmmu_vmsa_backup *backup_data;
> +
> +    dev_dbg(mmu->dev, "Handle micro-TLBs restore\n");
> +
> +    spin_lock(&ipmmu_devices_backup_lock);
> +
> +    list_for_each_entry( backup_data, &ipmmu_devices_backup, list )
> +    {
> +        struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(backup_data=
->dev);
> +        unsigned int i;
> +
> +        if ( to_ipmmu(backup_data->dev) !=3D mmu )
> +            continue;
> +
> +        for ( i =3D 0; i < fwspec->num_ids; i++ )
> +        {
> +            unsigned int utlb =3D fwspec->ids[i];
> +
> +            ipmmu_imuasid_write(mmu, utlb, backup_data->asids_val[i]);
> +            ipmmu_imuctr_write(mmu, utlb, backup_data->utlbs_val[i]);
> +        }
> +    }
> +
> +    spin_unlock(&ipmmu_devices_backup_lock);
> +}
> +
> +static void ipmmu_domain_backup_context(struct ipmmu_vmsa_domain *domain=
)
> +{
> +    struct ipmmu_vmsa_device *mmu =3D domain->mmu->root;
> +    struct ipmmu_reg_ctx *regs =3D mmu->reg_backup[domain->context_id];
> +
> +    dev_dbg(mmu->dev, "Handle domain context %u backup\n", domain->conte=
xt_id);
> +
> +    regs->imttlbr0 =3D ipmmu_ctx_read_root(domain, IMTTLBR0);
> +    regs->imttubr0 =3D ipmmu_ctx_read_root(domain, IMTTUBR0);
> +    regs->imttbcr  =3D ipmmu_ctx_read_root(domain, IMTTBCR);
> +    regs->imctr    =3D ipmmu_ctx_read_root(domain, IMCTR);
> +}
> +
> +static void ipmmu_domain_restore_context(struct ipmmu_vmsa_domain *domai=
n)
> +{
> +    struct ipmmu_vmsa_device *mmu =3D domain->mmu->root;
> +    struct ipmmu_reg_ctx *regs =3D mmu->reg_backup[domain->context_id];
> +
> +    dev_dbg(mmu->dev, "Handle domain context %u restore\n", domain->cont=
ext_id);
> +
> +    ipmmu_ctx_write_root(domain, IMTTLBR0, regs->imttlbr0);
> +    ipmmu_ctx_write_root(domain, IMTTUBR0, regs->imttubr0);
> +    ipmmu_ctx_write_root(domain, IMTTBCR,  regs->imttbcr);
> +    ipmmu_ctx_write_all(domain,  IMCTR,    regs->imctr | IMCTR_FLUSH);
> +}
> +
> +/*
> + * Xen: Unlike Linux implementation, Xen uses a single driver instance
> + * for handling all IPMMUs. There is no framework for ipmmu_suspend/resu=
me
> + * callbacks to be invoked for each IPMMU device. So, we need to iterate
> + * through all registered IPMMUs performing required actions.
> + *
> + * Also take care of restoring special settings, such as translation
> + * table format, etc.
> + */
> +static int __must_check ipmmu_suspend(void)
> +{
> +    struct ipmmu_vmsa_device *mmu;
> +
> +    if ( !iommu_enabled )
> +        return 0;
> +
> +    printk(XENLOG_DEBUG "ipmmu: Suspending...\n");
> +
> +    spin_lock(&ipmmu_devices_lock);
> +
> +    list_for_each_entry( mmu, &ipmmu_devices, list )
> +    {
> +        if ( ipmmu_is_root(mmu) )
> +        {
> +            unsigned int i;
> +
> +            for ( i =3D 0; i < mmu->num_ctx; i++ )
> +            {
> +                if ( !mmu->domains[i] )
> +                    continue;
> +                ipmmu_domain_backup_context(mmu->domains[i]);
> +            }
> +        }
> +        else
> +            ipmmu_utlbs_backup(mmu);
> +    }
> +
> +    spin_unlock(&ipmmu_devices_lock);
> +
> +    return 0;
> +}
> +
> +static void ipmmu_resume(void)
> +{
> +    struct ipmmu_vmsa_device *mmu;
> +
> +    if ( !iommu_enabled )
> +        return;
> +
> +    printk(XENLOG_DEBUG "ipmmu: Resuming...\n");
> +
> +    spin_lock(&ipmmu_devices_lock);
> +
> +    /*
> +     * IPMMUs are registered with list_add(), with Root IPMMU probed fir=
st.
> +     * Walk backwards to restore Root contexts before Cache micro-TLBs.
> +     */
> +    list_for_each_entry_reverse( mmu, &ipmmu_devices, list )
> +    {
> +        uint32_t reg;
> +
> +        /* Do not use security group function */
> +        reg =3D IMSCTLR + mmu->features->control_offset_base;
> +        ipmmu_write(mmu, reg, ipmmu_read(mmu, reg) & ~IMSCTLR_USE_SECGRP=
);
> +
> +        if ( ipmmu_is_root(mmu) )
> +        {
> +            unsigned int i;
> +
> +            /* Use stage 2 translation table format */
> +            reg =3D IMSAUXCTLR + mmu->features->control_offset_base;
> +            ipmmu_write(mmu, reg, ipmmu_read(mmu, reg) | IMSAUXCTLR_S2PT=
E);
> +
> +            for ( i =3D 0; i < mmu->num_ctx; i++ )
> +            {
> +                if ( !mmu->domains[i] )
> +                    continue;
> +                ipmmu_domain_restore_context(mmu->domains[i]);
> +            }
> +        }
> +        else
> +            ipmmu_utlbs_restore(mmu);
> +    }
> +
> +    spin_unlock(&ipmmu_devices_lock);
> +}
> +
> +static int ipmmu_alloc_ctx_suspend(struct device *dev)
> +{
> +    struct ipmmu_vmsa_backup *backup_data;
> +    unsigned int *utlbs_val, *asids_val;
> +    struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
> +
> +    utlbs_val =3D xzalloc_array(unsigned int, fwspec->num_ids);
> +    if ( !utlbs_val )
> +        return -ENOMEM;
> +
> +    asids_val =3D xzalloc_array(unsigned int, fwspec->num_ids);
> +    if ( !asids_val )
> +    {
> +        xfree(utlbs_val);
> +        return -ENOMEM;
> +    }
> +
> +    backup_data =3D xzalloc(struct ipmmu_vmsa_backup);
> +    if ( !backup_data )
> +    {
> +        xfree(utlbs_val);
> +        xfree(asids_val);
> +        return -ENOMEM;
> +    }
> +
> +    backup_data->dev =3D dev;
> +    backup_data->utlbs_val =3D utlbs_val;
> +    backup_data->asids_val =3D asids_val;
> +
> +    spin_lock(&ipmmu_devices_backup_lock);
> +    list_add(&backup_data->list, &ipmmu_devices_backup);
> +    spin_unlock(&ipmmu_devices_backup_lock);
> +
> +    return 0;
> +}
> +
> +#ifdef CONFIG_HAS_PCI
> +static void ipmmu_free_ctx_suspend(struct device *dev)
> +{
> +    struct ipmmu_vmsa_backup *backup_data, *tmp;
> +
> +    spin_lock(&ipmmu_devices_backup_lock);
> +
> +    list_for_each_entry_safe( backup_data, tmp, &ipmmu_devices_backup, l=
ist )
> +    {
> +        if ( backup_data->dev =3D=3D dev )
> +        {
> +            list_del(&backup_data->list);
> +            xfree(backup_data->utlbs_val);
> +            xfree(backup_data->asids_val);
> +            xfree(backup_data);
> +            break;
> +        }
> +    }
> +
> +    spin_unlock(&ipmmu_devices_backup_lock);
> +}
> +#endif /* CONFIG_HAS_PCI */
> +
> +#endif /* CONFIG_SYSTEM_SUSPEND */
> +
>  static int ipmmu_domain_init_context(struct ipmmu_vmsa_domain *domain)
>  {
>      uint64_t ttbr;
> @@ -559,6 +825,9 @@ static int ipmmu_domain_init_context(struct ipmmu_vms=
a_domain *domain)
>          return ret;
>
>      domain->context_id =3D ret;
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    domain->mmu->root->reg_backup[ret] =3D &root_pgtable[ret];
> +#endif
>
>      /*
>       * TTBR0
> @@ -615,6 +884,9 @@ static void ipmmu_domain_destroy_context(struct ipmmu=
_vmsa_domain *domain)
>      ipmmu_ctx_write_root(domain, IMCTR, IMCTR_FLUSH);
>      ipmmu_tlb_sync(domain);
>
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    domain->mmu->root->reg_backup[domain->context_id] =3D NULL;
> +#endif
>      ipmmu_domain_free_context(domain->mmu->root, domain->context_id);
>  }
>
> @@ -1338,10 +1610,11 @@ static int ipmmu_add_device(u8 devfn, struct devi=
ce *dev)
>      struct iommu_fwspec *fwspec;
>
>  #ifdef CONFIG_HAS_PCI
> +    int ret;
> +
>      if ( dev_is_pci(dev) )
>      {
>          struct pci_dev *pdev =3D dev_to_pci(dev);
> -        int ret;
>
>          if ( devfn !=3D pdev->devfn )
>              return 0;
> @@ -1358,17 +1631,24 @@ static int ipmmu_add_device(u8 devfn, struct devi=
ce *dev)
>      if ( !to_ipmmu(dev) )
>          return -ENODEV;
>
> -    if ( !dev_is_pci(dev) )
> +    if ( !dev_is_pci(dev) && dt_device_is_protected(dev_to_dt(dev)) )
>      {
> -        if ( dt_device_is_protected(dev_to_dt(dev)) )
> -        {
> -            dev_err(dev, "Already added to IPMMU\n");
> -            return -EEXIST;
> -        }
> +        dev_err(dev, "Already added to IPMMU\n");
> +        return -EEXIST;
> +    }
>
> -        /* Let Xen know that the master device is protected by an IOMMU.=
 */
> -        dt_device_set_protected(dev_to_dt(dev));
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    if ( ipmmu_alloc_ctx_suspend(dev) )
> +    {
> +        dev_err(dev, "Failed to allocate context for suspend\n");
> +        return -ENOMEM;
>      }
> +#endif
> +
> +    /* Let Xen know that the master device is protected by an IOMMU. */
> +    if ( !dev_is_pci(dev) )
> +        dt_device_set_protected(dev_to_dt(dev));
> +
>  #ifdef CONFIG_HAS_PCI
>      if ( dev_is_pci(dev) )
>      {
> @@ -1377,26 +1657,28 @@ static int ipmmu_add_device(u8 devfn, struct devi=
ce *dev)
>          struct pci_host_bridge *bridge;
>          struct iommu_fwspec *fwspec_bridge;
>          unsigned int utlb_osid0 =3D 0;
> -        int ret;
>
>          bridge =3D pci_find_host_bridge(pdev->seg, pdev->bus);
>          if ( !bridge )
>          {
>              dev_err(dev, "Failed to find host bridge\n");
> -            return -ENODEV;
> +            ret =3D -ENODEV;
> +            goto free_suspend_ctx;
>          }
>
>          fwspec_bridge =3D dev_iommu_fwspec_get(dt_to_dev(bridge->dt_node=
));
>          if ( fwspec_bridge->num_ids < 1 )
>          {
>              dev_err(dev, "Failed to find host bridge uTLB\n");
> -            return -ENXIO;
> +            ret =3D -ENXIO;
> +            goto free_suspend_ctx;
>          }
>
>          if ( fwspec->num_ids < 1 )
>          {
>              dev_err(dev, "Failed to find uTLB");
> -            return -ENXIO;
> +            ret =3D -ENXIO;
> +            goto free_suspend_ctx;
>          }
>
>          rcar4_pcie_osid_regs_init(bridge);
> @@ -1405,7 +1687,7 @@ static int ipmmu_add_device(u8 devfn, struct device=
 *dev)
>          if ( ret < 0 )
>          {
>              dev_err(dev, "No unused OSID regs\n");
> -            return ret;
> +            goto free_suspend_ctx;
>          }
>          reg_id =3D ret;
>
> @@ -1420,7 +1702,7 @@ static int ipmmu_add_device(u8 devfn, struct device=
 *dev)
>          {
>              rcar4_pcie_osid_bdf_clear(bridge, reg_id);
>              rcar4_pcie_osid_reg_free(bridge, reg_id);
> -            return ret;
> +            goto free_suspend_ctx;
>          }
>      }
>  #endif
> @@ -1429,6 +1711,13 @@ static int ipmmu_add_device(u8 devfn, struct devic=
e *dev)
>               dev_name(fwspec->iommu_dev), fwspec->num_ids);
>
>      return 0;
> +#ifdef CONFIG_HAS_PCI
> + free_suspend_ctx:
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    ipmmu_free_ctx_suspend(dev);
> +#endif
> +    return ret;
> +#endif
>  }
>
>  static int ipmmu_iommu_domain_init(struct domain *d)
> @@ -1490,6 +1779,10 @@ static const struct iommu_ops ipmmu_iommu_ops =3D
>      .unmap_page      =3D arm_iommu_unmap_page,
>      .dt_xlate        =3D ipmmu_dt_xlate,
>      .add_device      =3D ipmmu_add_device,
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    .suspend         =3D ipmmu_suspend,
> +    .resume          =3D ipmmu_resume,
> +#endif
>  };
>
>  static __init int ipmmu_init(struct dt_device_node *node, const void *da=
ta)
> --
> 2.43.0
>
>

