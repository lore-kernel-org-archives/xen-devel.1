Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F683C9832A
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 15:15:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436515.1655166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBZXt-0001Ky-2G; Tue, 29 Sep 2026 15:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436515.1655166; Tue, 29 Sep 2026 15:15:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBZXs-0001Kr-Vh; Tue, 29 Sep 2026 15:15:04 +0000
Received: by outflank-mailman (input) for mailman id 1436515;
 Tue, 29 Sep 2026 15:15:04 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1xBZXs-0001Kl-3C
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 15:15:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBZXr-002kpQ-FY
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 17:15:03 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6abbd5d8-2eae-0a2a0a5409dd-0a2a450598f8-36
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 17:15:03 +0200
Received: from [74.125.229.204] (helo=mail-lf2-f12.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6abbd5f7-4cb1-0a2a45050019-4a7de5cccd33-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 17:15:03 +0200
Received: by mail-lf2-f12.google.com with SMTP id
 2adb3069b0e04-5ba31af822cso883143e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 08:15:03 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1790694903; cv=none;
        d=google.com; s=arc-20260327;
        b=eMS+cLlvWplw6vT/ieOM5xqMwFC1LEX1WeX7VAaXPyG4zi/5YKZInmoHo91JVaMzsL
         J/GtVaz5whem1Am6sk/M2yem0f+s+MN5W/i20XiXkxsVnrSQGTE2NMPqVQexQXuhyzhp
         VqR+fZY3wQZTxNpIfjul9bPdZkxlfZv5aRx5aNg+P6O9jM5TzmsJoKRWUKUTuGWvOrtd
         SqQJ+lpcjUomk9AXLxMo7CQVYWYAbMMIuccKhwRmTtwGt3Rz/ouOXXllvsyFyMkJiI45
         Mwy9yq7jGPA47QavlQQ6dOWYBIVH3bff/iBlgAf2zFHaW5K1nlpDSmhfHBkrgkQ12QvK
         mU3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oI51A4n41bP5Q2icrJYl3VQqc1gPXhJxzBkDYd01Pu8=;
        fh=WIBsbU94tzJ4cDiE2U1nGSEGZUKQH+ugjEkhmxI8Bgo=;
        b=IU8kEz8pR24xujO5+K0LULKLAVzSnVPBToET71IbHHV5n6PzTId3oUtv9jpYmqc9lv
         6UxFGZ1KawBTp+Csj+u1QHAmnECNhR0eckvNuzfDpXXuvC6MG+iDKkfDkNLAZVkQ4CQm
         MDDw/0vJ44KaFa3dgG6rsHw+EuZYvS+Y/dO3TlOSm+c6Ymz7fTKNnedHzi7R7wN6wABQ
         VC3kRIYrMg4RWqzBYrde7lL9iO9Bz0Y1TJ4faEMOWqh3xMDb3ZOYkw6CrpT8dnT4NGMA
         SoWGTG9GxsKyOMItGjwzAWzFrA3/zrxc6e3HOLVp0L4tRxw1e2PfladNkviRf/JisB6K
         RGcA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790694903; x=1791299703; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oI51A4n41bP5Q2icrJYl3VQqc1gPXhJxzBkDYd01Pu8=;
        b=Rm/Ei5UAf3s0+cYd/50DCqMnSZMtWfDM3m1fuw4NYMQ30BVZzKebdPGRd789vb8HeO
         sLWLLx35YK3LCnmxGRg7aNgHHE2jvkdD9AEdE7b40m05FDmaPpHS2M9VLJho4Ie8lurQ
         yqtBp5Q6XuLEjdwCCWZ/7WuH3RcQ+KPkVDw2Ioq4gbA/z7pmu7xuGy2X9rX1ajRVwOeD
         8JktXgwLEZsIaTfD+293HnatxSJYq1dzv4NmYNDyW1aR4D1arvRdPABc4D/2hVapdLXq
         4vrr8aLrX5E2oZPzd0beZqw5YKlBFp/zc/laK0S+0GO+cpSczzS/Vkim2E5UDfvNjjAJ
         QAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790694903; x=1791299703;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oI51A4n41bP5Q2icrJYl3VQqc1gPXhJxzBkDYd01Pu8=;
        b=W+b9EBsNc4a/9BrwGHD0jayWpC+IvpgdjYyacIIc4t0gX3KRoH1zPglTWiiFfdFIjs
         B2TVxmvOdDaiBRyZf1pHo9Rz0mVYDZ9VXDprr24g9GJhxVU9XvLBCU2jxuPmt6snhZqd
         9P4CaCi/4ecnn5Zmn5CDNyZDLi19zPU/9kLIm3EIlGDNDqnbiNpxLAVB/CFHpTjQz1rS
         W/yTOB7TEU3+kZjMr2baLFimMAceX+jZ6TuVVdv5KxAjkkP8c1k6B9oNT37QBeo64Zal
         Uv44dNeO12gTaGtfl206ZOfv/S0aUXFj37bDdVMkBc2dyP5SM247fE5i67MbX0httSC5
         dv8g==
X-Gm-Message-State: AFq9FYKkiYrGc2idHDVdUO3OMYPGMP+QXLlgIJ2OltHxQAuO9ArY39+S
	h+grCWrRzJ6Oz8gOE6ZXyTwXJkHxOmOpw4QIbrtboCGYkzKPtPpywH2+4CLDw/5BmzGlTDJPYCh
	U7flWFIITkRlhgmTnmjPQu0ho6KnUJFo=
X-Gm-Gg: AYBFou1IHAHUhfZyXlfwC2pMbUVqrXfDCD66QojdI3uGg+ZvMV1Qp+O/sG7bqXI65NK
	v2hiKAQiruRKf1e39nPfbHp5sYYfiI87tA00oZv2Pbtqr9GvmqG11Io6YEd3qtDRIRgP4k7cLiF
	TSBeyhtoLrqux5f2mNfLjBinQCPPjDKVuDyW1FjER813v+lHJqd4dj47p+2h3nZ4T5OhE+W/Qco
	4fwqP2fMyc2TOQdpgI5jBp8YmDCeYS1Wl4GxAxjMWjjB4S5h6BUeeWXr5DUs988kZ0oHEKvUbGv
	/DQJ5N661aIochlEm9aT9bELHNzqfDhk12UdilvHoo32wSbnDPrEJw==
X-Received: by 2002:a05:6512:6c2:b0:5b8:c6be:7d58 with SMTP id
 2adb3069b0e04-5b8e6dd0c15mr4034882e87.44.1790694902303; Tue, 29 Sep 2026
 08:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <13181424f9be3f5e31977fbd505209cd0508571b.1790102501.git.leonid_komarianskyi@epam.com>
 <CAGeoDV8sN2P9nqHwxcYz72u+L-DEQDbOcHENvX=jpzJ2=Z-gNQ@mail.gmail.com> <d7f902ed-af19-4d06-8bea-b73b4b385533@epam.com>
In-Reply-To: <d7f902ed-af19-4d06-8bea-b73b4b385533@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 29 Sep 2026 18:14:50 +0300
X-Gm-Features: AclHuK-TVITRrHVCiuyqgizPpVqzBz02_9dE7lruHfpKi3UcMk-SWzaJ8H5kQ_Y
Message-ID: <CAGeoDV_v3DxCNvPQvOs9YQLBg0cgxZsjH8rHyVPCEmYws8nEpA@mail.gmail.com>
Subject: Re: [PATCH v2] xen/arm: gicv3: initialize eSPI unconditionally
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Julien Grall <jgrall@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c201ff/1790694903-726B52A1-F9F26586/0/0
X-purgate-type: clean
X-purgate-size: 6567

Hi Leonid,

On Wed, Sep 23, 2026 at 8:55=E2=80=AFPM Leonid Komarianskyi
<Leonid_Komarianskyi@epam.com> wrote:
>
> Hello Mykola,
>
> Thank you for your review.
>
> On 9/23/26 11:04, Mykola Kvach wrote:
> > Hi Leonid,
> >
> > Thank you for the patch.
> >
> > On Tue, Sep 22, 2026 at 9:59=E2=80=AFPM Leonid Komarianskyi
> > <Leonid_Komarianskyi@epam.com> wrote:
> >>
> >> Since the firmware may initialize eSPIs before Xen, and without
> >> CONFIG_GICV3_ESPI enabled, Xen would not reinitialize them properly
> >> during boot. In such cases, once the GIC is re-enabled in Xen,
> >> interrupts may be received that cannot be handled.
> >>
> >> To ensure proper operation on hardware with eSPI feature, even when th=
e eSPI
> >> config is disabled, gicv3_dist_espi_common_init() should be invoked
> >> regardless of whether CONFIG_GICV3_ESPI is enabled or not. This will n=
ot
> >> affect hardware without eSPI support, as the function checks if the
> >> hardware supports eSPIs by reading the GICD_TYPER.ESPI field (using
> >> GICD_TYPER_ESPIS_NUM macro), which indicates whether the extended SPI
> >> range is supported. If the hardware does not support eSPI, the functio=
n
> >> will not perform any actions.
> >>
> >> There are no functional changes for setups where CONFIG_GICV3_ESPI=3Dy=
.
> >>
> >> Suggested-by: Julien Grall <jgrall@amazon.com>
> >> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
> >> Acked-by: Julien Grall <jgrall@amazon.com>
> >> ---
> >> Changes in v2:
> >> - rebased on the current staging
> >> - placed Suggested-by tag first to keep tags in chronological order
> >> - added Acked-by from Julien Grall
> >>
> >> This is a follow-up patch related to the discussion:
> >> https://lore.kernel.org/xen-devel/820704d0-4047-4f02-a058-01daba2765f1=
@xen.org/
> >>
> >> Sending v2 with the requested changes, as I only now noticed
> >> that this patch has not been merged yet.
> >> ---
> >>   xen/arch/arm/gic-v3.c                  | 32 ++++++++++++++----------=
--
> >>   xen/arch/arm/include/asm/gic_v3_defs.h |  2 --
> >>   2 files changed, 17 insertions(+), 17 deletions(-)
> >>
> >> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> >> index acdac22953..463769d77b 100644
> >> --- a/xen/arch/arm/gic-v3.c
> >> +++ b/xen/arch/arm/gic-v3.c
> >> @@ -703,17 +703,32 @@ unsigned int gic_number_espis(void)
> >>       return gic_hw_ops->info->nr_espi;
> >>   }
> >>
> >> +static void __init gicv3_dist_espi_init_aff(uint64_t affinity)
> >> +{
> >> +    unsigned int i;
> >> +
> >> +    for ( i =3D 0; i < gicv3_info.nr_espi; i++ )
> >> +        writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTERnE + i=
 * 8);
> >> +}
> >> +#else
> >> +
> >> +static void __init gicv3_dist_espi_init_aff(uint64_t affinity) { }
> >> +#endif
> >> +
> >>   static void __init gicv3_dist_espi_common_init(uint32_t type)
> >
> > I think the ordering in gicv3_dist_espi_common_init() needs to be
> > revisited now that this function is also called with
> > CONFIG_GICV3_ESPI=3Dn.
> >
> > The motivation for this patch is that firmware may have left an eSPI
> > enabled. However, we currently program GICD_ICFGRnE before clearing
> > the corresponding enable bit in GICD_ICENABLERnE.
> >
> > The GIC architecture requires an interrupt to be individually disabled
> > before changing Int_config; otherwise the behavior is UNPREDICTABLE.
> > See Arm IHI 0069H.b, section 12.9.9 (GICD_ICFGR<n>).
> >
>
> Section 12.9.9 describes GICD_ICFGR<n>, i.e. the regular SPI range, and
> it indeed contains this requirement. However, the code in
> gicv3_dist_espi_common_init() programs GICD_ICFGR<n>E, which is
> described in 12.9.10, and I could not find an equivalent requirement ther=
e.

Thanks for checking. You're right, the eSPI section does not state
the same requirement. Sorry for the confusion.

>
> The only related rule I found that also covers the extended SPI range is
> in Arm IHI 0069H.b section 4.5:
>
> "Changing the configuration of an interrupt from level-sensitive to
> edge-triggered, or from edge-triggered to level-sensitive, when there is
> a pending interrupt, leaves the interrupt in an UNKNOWN state."
>
> That rule is about the pending state rather than the enable state, though=
.
>
> Also, the current eSPI initialization sequence mirrors the one used for
> regular SPIs in gicv3_dist_init(), where the requirement from 12.9.9
> does apply. So if we decide to reorder the initialization, I think it
> should be done for regular SPIs as well, ideally in a separate
> preparatory patch.

For regular SPIs, let's wait for the maintainers' feedback. I think
any fix there should be a separate patch and should not block this
one.

>
> > We also rely on the same requirement in gic_set_irq_type().
> >
> > So shouldn't we disable/deactivate all eSPIs before programming
> > GICD_ICFGRnE? Linux also initializes the extended SPI range in this
> > order: ICENABLERnE/ICACTIVERnE first, followed by IGROUPRnE,
> > ICFGRnE and IPRIORITYRnE.
> >
> > This issue already seems to exist for the CONFIG_GICV3_ESPI=3Dy path,
> > but this patch makes it relevant to the newly added CONFIG=3Dn path,
> > where an eSPI left enabled by firmware is precisely the case we are
> > trying to handle.
> >
> > Also, we could disable/deactivate eSPIs for all builds, while keeping
> > the rest of the eSPI configuration under CONFIG_GICV3_ESPI. This would
> > avoid accessing the other eSPI registers in builds without eSPI
> > support, unless there is a particular reason to initialize them there.
> >
>
> This is a fair point, but I think it is better to clarify with the Arm
> maintainers first whether the SPI/eSPI initialization order should be
> changed in a separate preparatory patch, as the code for this patch
> depends on the answer. As mentioned above, I could not find such a

My suggestion to skip the extra eSPI configuration when
CONFIG_GICV3_ESPI=3Dn was just a minor cleanup suggestion. Those writes
look unnecessary, but I don't see any harm in keeping them. There is
no need to change this in the current patch. It can be left as is or
cleaned up later.

Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>

> restriction for eSPIs; it applies only to regular SPIs. If the
> maintainers agree to change the sequence for both SPIs and eSPIs, I can
> prepare a separate patch and update this patch accordingly.
>
>
> Best regards,
> Leonid.

Best regards,
Mykola

