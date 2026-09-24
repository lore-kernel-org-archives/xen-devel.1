Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69689C98310
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 06:49:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1431795.1653547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9dGM-0003n9-0l; Thu, 24 Sep 2026 06:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1431795.1653547; Thu, 24 Sep 2026 06:48:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9dGL-0003n2-UP; Thu, 24 Sep 2026 06:48:57 +0000
Received: by outflank-mailman (input) for mailman id 1431795;
 Thu, 24 Sep 2026 06:48:56 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1x9dGK-0003mw-Gj
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 06:48:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9dGJ-004FBg-Jq
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 08:48:55 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6ab4c7b7-2eae-0a2a0a5409dd-0a2a450beb4a-46
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 08:48:55 +0200
Received: from [74.125.229.204] (helo=mail-lf2-f12.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6ab4c7d7-b7e8-0a2a450b0019-4a7de5ccbeaf-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 08:48:55 +0200
Received: by mail-lf2-f12.google.com with SMTP id
 2adb3069b0e04-5b79784a6edso1623657e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 23:48:55 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1790232535; cv=none;
        d=google.com; s=arc-20260327;
        b=aLv/zUY+BCYawXuQlZNwi/tV6BmziHZNIW7NXtf5O5kFyk1I9Cw+5EVjtGWmIbIeiJ
         i+dDYw8jAiCXsD2JdY9KuvY3w0ksSYz8NjFZPIVO+RugNIxJI1qT04irxTw1BcUdyW2C
         V2revzrJEnZmNpORp2NWqwrFNNLaY0I/KIphPvIVDyE6a2htr7tjwHo7iUfPNSinGL/8
         IlrCTkTaHRYLFEFE9W+U+xnZR21iALVE3lvE/N5osWBMlHlLMPkB/c4EWQYXBU0WmSxP
         h36w4+h9DJ9RCwjknj64xxOfmGnozBb0h7s9ULER8UcTobq5JSRc4PKi+gRY8L9kC1gQ
         HyZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nV0Gg6TO0aRbcsCOon3fJLQf0ueAKJ9vn9vU0D/FZFE=;
        fh=S0lixzhbrrbRqCv1owUgzGFfDmLcTjVJXgrnOWYFryQ=;
        b=gkXZLT7VkQbq7SsX8mjNanGMz4NRgWcRpR0tUHVaDk/AZabs7Nc687N/JES+C73VVs
         QFMAXsR9RPCDUe50jQgRSPQQTpDUEWu9Gup8sHHmwdybaHDk3Wmpy8/5qEEygVyGt7an
         03MJKdoi8dxr6qzFSmOxmrYfYQPpJfGNDtZ419YAq6L+Jes6fXO6JE12mzH2oRxKm18l
         DbJtPH3W70Au0xC+VdahreTL/bNDiyfKn0jjHwQv17CTQRNgYPAX5yA1aG7g/ZgnzPf7
         XXW/N9jlkeopPD4niYClJv/3TZg5rpDgn2CaiSkKitWKm9NeGOuj0fyhAXb7X/UqQCIy
         e9UA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790232535; x=1790837335; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nV0Gg6TO0aRbcsCOon3fJLQf0ueAKJ9vn9vU0D/FZFE=;
        b=UyhDY0b+1mKFktYV05UPfGvqlxlDdYl38JqSw1CsFnswGxz5cHWu+3izqIlFXFISLD
         Y/S8H1q7YfowXQ4+s7Nra6vhCEusxEqHGJuQQIvNRMgy/nSWJrTb53pEeM8oGPLdB1PI
         BAySFWQdHS7YEdL8pcjX91mvwue17r4znp58cbBB55n2Cp35jZTo+KEkbXai1nMU/Bkf
         GVmNRXKKPdfkok1IE0Ef0n4y4pGyfHiN4fp+GwYLDPOjnSkFR4D2T2l0jFAFy6nKCyFV
         nT8OWRWeOAk0SNjBFzM8Lkd5GQ1HteLrGf9uzYeUZzBko/rqYFcav1YcZzpTDm0PlUs2
         IV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790232535; x=1790837335;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nV0Gg6TO0aRbcsCOon3fJLQf0ueAKJ9vn9vU0D/FZFE=;
        b=pPdfX0a0GmNaKj2/d9W/DwAuLy/Hx3GHk0kzvGvrQH/+cpJoR6923HaQYm0rd+7wcb
         u3e8xCf4/F2SSYjIt0C4dakFLJ8nv28uaFcc1f8XQLMQNhCk4HZgoXJsAUaMf5delZ+v
         t5gkP/uZKGK10SAGsraQ9mkaye4kw3o83sA4fUD5PKDhx2Q6CQmsAnHiBV8UU2qTrFB9
         KLIDd8qDzhDWMhzKGI9y7njiA54wJG8ylPVzk/aMTX3jH91UEAt0Ce2zSDOqi8K5V44b
         SyWEW/UhusRbZqnyLjUzv0LG7OOQix7HFJaTXNIz4J7D6wyUoqTm2jUSm/GS+u1U9XGc
         TWLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgN48N9WdoN6C05HiAqRgKEzVVJIGv/pSvc+10tQLjHedP5ZGlu4p4OdLzPi9vTgxkU5XRQ5jFoJ8=@lists.xenproject.org
X-Gm-Message-State: AFuF++njr0YCqP+HxRPn8QW2u9iwoHSuu881C4+r3mqKfXBgJ9/PRv9u
	FZv8d49Ag5dkh3GE0Tp/y1iaG5UZkfy0hbOAdarrsd2S0gVCm8ied17WTRcw5pW0L7pHaAjLBgu
	jqokTnbshgBbz7fYquVP4F5aAt4ge7tNU4c9Krh8=
X-Gm-Gg: AYBFou2bm0mV0f6M1oqdPpP0COs01hOtw3TJD0JxvSnOoCDQh6cCx7ufnX3T7BtAi6L
	60153Al5SZ71AHciLJqHZAplF/h4qGlYTzqn8GBScbMPAs5Vu32YcwW0kq+Jxa2h6E3ZToBjCSt
	Cqru8ghKolcuyywNlox0QgKUDlwEvILYQj5a8vSXa8/IY2RlRj2eDleXsqb8fbXPt7MnJeozBfG
	XQswQdqwE64RYDlm3vorrbT/ZfjVcVAWbQFDsj6DkseENK9TWvtAmFU61aM4lO2K0FSdA68uZZO
	yzOW9o2ulhJJ7/4uwmvLSug7WgMS/loLMXuv0KaJT6vhxNgdqIldZg==
X-Received: by 2002:a05:6512:2248:b0:5b4:5f6b:d43e with SMTP id
 2adb3069b0e04-5b8df06a3afmr527530e87.14.1790232534537; Wed, 23 Sep 2026
 23:48:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1790089161.git.mykola_kvach@epam.com> <cefba96267535739ecb851e6080da51a3d745e3f.1790089161.git.mykola_kvach@epam.com>
 <874ifg4xoq.fsf@epam.com>
In-Reply-To: <874ifg4xoq.fsf@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 24 Sep 2026 09:48:42 +0300
X-Gm-Features: AclHuK-E17t3rxcpD-vFN4icp4iF4fj1FBG2Fi5P9Pf76fG-rmrqf4yjrOPMWSc
Message-ID: <CAGeoDV8dv9c2mz7zLKc_e4NveXW9t2sKhUqrp_wtL+pvhFcEdA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] xen/arm: its: handle dma-noncoherent on GIC and
 ITS nodes
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Mykola Kvach <Mykola_Kvach@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-42698a/1790232535-AB8D19EA-3041BBDC/0/0
X-purgate-type: clean
X-purgate-size: 5131

On Wed, Sep 23, 2026 at 3:30=E2=80=AFAM Volodymyr Babchuk
<Volodymyr_Babchuk@epam.com> wrote:
>
> Hi,
>
> Mykola Kvach <mykola_kvach@epam.com> writes:
>
> > The DT dma-noncoherent property describes the bus coherency of the
> > device represented by the node. On an ITS subnode, that is memory
> > accessed by that ITS. Add GICV3_QUIRK_MEM_NC_NS to the corresponding
> > host_its and use it when programming GITS_CBASER and GITS_BASER<n>.
> >
> > On the top-level GIC node, the property describes the Redistributor sid=
e
> > of the LPI path. Collect it in gicv3_lpi_init_host_lpis() and apply it
> > only to the host LPI policy used when allocating the property and
> > pending tables and when programming GICR_PROPBASER and GICR_PENDBASER.
> > Mark the function init-only because firmware attributes are collected
> > only during boot.
> >
> > Do not inherit the property between parent and child nodes: ITS-node
> > non-coherency does not change the global host LPI policy, and GIC-node
> > non-coherency does not change per-ITS quirk_flags.
> >
> > ACPI is unchanged; this patch only consumes the DT dma-noncoherent
> > property.
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in v3:
> > - Keep the ITS init annotations with the earlier initialization patch.
> > - Drop the redundant aggregate host-LPI-flags message.
> >
> > Changes in v2:
> > - Split v1's dma-noncoherent handling into explicit ITS-node and GIC-no=
de
> >   scopes.
> > - Apply an ITS subnode property only to the matching host_its
> >   quirk_flags.
> > - Collect the top-level GIC property from gic-v3-lpi.c before host LPI
> >   allocations use host_lpi_flags.
> > ---
> >  xen/arch/arm/gic-v3-its.c | 17 +++++++++++++++++
> >  xen/arch/arm/gic-v3-lpi.c | 20 +++++++++++++++++++-
> >  2 files changed, 36 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> > index f52232ca40..6734f94e7c 100644
> > --- a/xen/arch/arm/gic-v3-its.c
> > +++ b/xen/arch/arm/gic-v3-its.c
> > @@ -139,6 +139,21 @@ static const struct its_quirk *__init gicv3_its_fi=
nd_quirk(
> >      return NULL;
> >  }
> >
> > +static void __init gicv3_its_collect_fw_attrs(struct host_its *hw_its)
> > +{
> > +    /*
> > +     * An ITS subnode property describes memory transactions made by t=
hat ITS.
> > +     * Do not inherit it into the global host LPI/Redistributor policy=
.
> > +     */
> > +    if ( !hw_its->dt_node ||
> > +         !dt_property_read_bool(hw_its->dt_node, "dma-noncoherent") )
> > +        return;
> > +
> > +    hw_its->quirk_flags |=3D GICV3_QUIRK_MEM_NC_NS;
> > +    printk("GICv3: ITS @%#"PRIpaddr" marked dma-noncoherent\n",
> > +           hw_its->addr);
> > +}
> > +
> >  static void __init gicv3_its_collect_quirks(struct host_its *hw_its)
> >  {
> >      const struct its_quirk *quirk =3D gicv3_its_find_quirk(hw_its);
> > @@ -149,6 +164,8 @@ static void __init gicv3_its_collect_quirks(struct =
host_its *hw_its)
> >          gicv3_lpi_update_host_flags(quirk->lpi_flags);
> >          printk("GICv3: enabling workaround for ITS: %s\n", quirk->desc=
);
> >      }
> > +
> > +    gicv3_its_collect_fw_attrs(hw_its);
> >  }
> >
> >  uint64_t gicv3_mem_get_cacheability(uint32_t flags)
> > diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
> > index accfd48a74..1cf49430ea 100644
> > --- a/xen/arch/arm/gic-v3-lpi.c
> > +++ b/xen/arch/arm/gic-v3-lpi.c
> > @@ -7,7 +7,9 @@
> >   * Copyright (C) 2016,2017 - ARM Ltd
> >   */
> >
> > +#include <xen/acpi.h>
> >  #include <xen/cpu.h>
> > +#include <xen/device_tree.h>
> >  #include <xen/init.h>
> >  #include <xen/lib.h>
> >  #include <xen/mm.h>
> > @@ -102,6 +104,20 @@ void __init gicv3_lpi_update_host_flags(uint32_t f=
lags)
> >      host_lpi_flags |=3D flags;
> >  }
> >
> > +static void __init gicv3_lpi_collect_fw_attrs(void)
> > +{
> > +    /*
> > +     * A top-level GIC node property describes the Redistributor side =
of the
> > +     * LPI path. Do not inherit it into per-ITS policy.
> > +     */
> > +    if ( !acpi_disabled ||
> > +         !dt_property_read_bool(dt_interrupt_controller, "dma-noncoher=
ent") )
> > +        return;
> > +
> > +    gicv3_lpi_update_host_flags(GICV3_QUIRK_MEM_NC_NS);
> > +    printk("GICv3: Redistributors marked dma-noncoherent\n");
> > +}
> > +
> >  static union host_lpi *gic_get_host_lpi(uint32_t plpi)
> >  {
> >      union host_lpi *block;
> > @@ -443,7 +459,7 @@ integer_param("max_lpi_bits", max_lpi_bits);
> >   * to the page with the actual "union host_lpi" entries. Our LPI limit
> >   * avoids excessive memory usage.
> >   */
> > -int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits)
> > +int __init gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits)
>
> Spurious change?

This is intentional. This patch adds a call to the __init helper
gicv3_lpi_collect_fw_attrs(). gicv3_lpi_init_host_lpis() is only
called during boot, from gicv3_its_init(), so I marked it __init
as well.

Best regards,
Mykola

