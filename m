Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC181C982FA
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 08:04:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429814.1652457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Hxm-0007aU-Pa; Wed, 23 Sep 2026 08:04:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429814.1652457; Wed, 23 Sep 2026 08:04:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Hxm-0007aM-MW; Wed, 23 Sep 2026 08:04:22 +0000
Received: by outflank-mailman (input) for mailman id 1429814;
 Wed, 23 Sep 2026 08:04:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1x9Hxk-0007aG-LI
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 08:04:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9Hxj-0029f1-TA
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 10:04:19 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6ab38800-2eae-0a2a0a5409dd-0a2a4507c15a-28
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 10:04:19 +0200
Received: from [74.125.230.99] (helo=mail-lr2-f35.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6ab38803-b4ea-0a2a45070019-4a7de663812a-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 10:04:19 +0200
Received: by mail-lr2-f35.google.com with SMTP id
 38308e7fff4ca-3a47f740839so5560281fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 01:04:19 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1790150659; cv=none;
        d=google.com; s=arc-20260327;
        b=VD5snWgQLThyOzsvFyIm0KJnX1dZogNkuziUIvv6Sj9cruMw4zKLxl9WBlmEYGQmyu
         jlhWbBc6EdwzqGWaD/uKbK5o0QWnZ9tKVtE+qVKv/tRuL5zaafRSKqd8lci4nXvPwT4+
         3M3qN78sw9ynyAa5BXi0DyGju0F3EezEIEZZFQNNzuMwvXR8FERsh4ihnfis7yWeuXmH
         mCVX5Yptlvh5VV2dbNpwoYAASPxFoeAjUswISEEfirceQ+v/1Dcmh0gAWHu4b+kGnm1d
         KiKkzgLxwQw2EqrxIqTBPqVwBZDk4l/Hif3H6xw2jqtuHII6MX9sYgwXEpoDKcH43bPk
         947g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/sGE1cWKRddn9BumVRWlGmuOGXI1Suk6ksjIkhQj8eU=;
        fh=WIBsbU94tzJ4cDiE2U1nGSEGZUKQH+ugjEkhmxI8Bgo=;
        b=N6TLUse4cVGrk4NfeFU//BiAeKJZBS8WV0/RYexNEMEX/sY2pxDO4q0LSlbcBFPtYj
         louWgIYOzL+ZoIQw/jrhrmo4pAg3nsY6MUroCHZcNK3vFBOZHgQuaZdcgMLLA5kxNcew
         YUQxypKSHZ4XDcU3GJhrxO1wGR6UHK6FqPUvwCKgPeqB4zGGr9iZGCm2y4jAV5/4Cgcj
         qMR7nI3nMGAWi11uZWCr84weN2E51kOHqKo3GcPdRmuiYBowa4VsjqPRJ43ShqN3nq66
         Pqq3PYQNuoJEInKDXo1vDnN2DpkdLgsNljIWzIe6D2oUf2bErCPFG8MRvy55oRXXFyXr
         s9yA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790150659; x=1790755459; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/sGE1cWKRddn9BumVRWlGmuOGXI1Suk6ksjIkhQj8eU=;
        b=aD4fcS99XIJJEeA1gEkVKc3v2mZqL3teuL139J/o/CtEdiHVeuLjddLtgYaoW/jrRl
         33LisIdirbfVdf2FTilJLdP7g4PDHavUtFV8aZ+I9E91fMOmH/Z2QTrqPnPBs1uMHW83
         Gs8tn2gmK7ziroUeCJnJPcSSr3oKg3ju2b0gpnfGBro/YX9WgRq/su9bZT1atbKylkw7
         w9RyqKl2iU0pVBRkfpzqa4Es5rkUV6x9HYusZcc4puXGroi/NlnMUpZhdLczXfCaajB0
         XStfpMjZCwJpkyNXFQHZT4QzlPX344dx0q6mFIwlZwCeRdHBDjy1bZUH6nnJZ3QwTpvg
         lTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790150659; x=1790755459;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/sGE1cWKRddn9BumVRWlGmuOGXI1Suk6ksjIkhQj8eU=;
        b=Cia9XrrrID2mK5by/NDC1EALHUB//gpO8nbWuzOcJjhj/EGTwGnLWRiaoFyqbJtJBb
         6N+MFEut12aB5Rr9wqOn6H7tHpzgw3eAwIVl9xvz97FSs2l/EpY8aIfv57RQJb8FSS2S
         MLWCInqnQEmUEA/QzNWRbDNDOE5cbWRK6U8DzEaYrVTwpI3i5nGStPf5AwbDi8KXXAwe
         kCqox17s+aFMcJd02f4Zozfyiddj+S8/j0kgKO4mNAzcCUJIF4Bq6hvZW2bxASqHcnp1
         89vI8pF8MgIHJH1JU97iIUVahztdW56Ful5NQmVsJRDFGayyH3uTI3FqGHM+Or0HMN+k
         OvOg==
X-Gm-Message-State: AFuF++nHQoqvz8GzVuKl/VbuOwvIAHNN4XBhqubKtdP3WpovqU6fMImm
	jMZBoBYsCMDB4uldEDf5TQEYBfaIO/i5NtjIaknq8KGyVTNVqQ1uKVRx30wtNDJRkwtcxwopK+5
	R7b4AfIN6MD4rMeJgB2nj8oBRMaDql/c=
X-Gm-Gg: AYBFou2sprlbZwPky6+jSaLXPUAPI1A3h6lbKOG9Wyjr1Fy2FW5ETXdQ3HeML36aZ70
	9yAuPosYYt31omXxFXUI9BZR6WdEp1np19DWgotFkd/cdTHItIjrLJ2tQlBonV6sAwU3m7f8N85
	LDr6q6ckyqk0Iojre6vyNSzgfkd3VJqlypTn6NJNERMupZdHFn9btxy8mnyjaIUz7XWMO87ozX9
	gyiqBa6mYSKuCaiPLBpjXbrGSdtyVhPjgLk571op4cM/VUvSiZIU/C8rnbSRbbiQM9+nGTouilo
	TNpTTuQOiBfiQgPAah/FYiYnUxU+NZbttHjymPeck7jUaU2YJOxUNA==
X-Received: by 2002:a2e:be90:0:b0:3a3:749e:319d with SMTP id
 38308e7fff4ca-3a630649c2fmr3671191fa.17.1790150658338; Wed, 23 Sep 2026
 01:04:18 -0700 (PDT)
MIME-Version: 1.0
References: <13181424f9be3f5e31977fbd505209cd0508571b.1790102501.git.leonid_komarianskyi@epam.com>
In-Reply-To: <13181424f9be3f5e31977fbd505209cd0508571b.1790102501.git.leonid_komarianskyi@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 23 Sep 2026 11:04:07 +0300
X-Gm-Features: AcwNN1ULFoLO3WCAA7Hn7gboN_yxL5eiKc6W-Kgs4eI3OOrAoTmbVCHd-4ivzSo
Message-ID: <CAGeoDV8sN2P9nqHwxcYz72u+L-DEQDbOcHENvX=jpzJ2=Z-gNQ@mail.gmail.com>
Subject: Re: [PATCH v2] xen/arm: gicv3: initialize eSPI unconditionally
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Julien Grall <jgrall@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ef75cf/1790150659-A70DDAE4-3485C89B/0/0
X-purgate-type: clean
X-purgate-size: 3872

Hi Leonid,

Thank you for the patch.

On Tue, Sep 22, 2026 at 9:59=E2=80=AFPM Leonid Komarianskyi
<Leonid_Komarianskyi@epam.com> wrote:
>
> Since the firmware may initialize eSPIs before Xen, and without
> CONFIG_GICV3_ESPI enabled, Xen would not reinitialize them properly
> during boot. In such cases, once the GIC is re-enabled in Xen,
> interrupts may be received that cannot be handled.
>
> To ensure proper operation on hardware with eSPI feature, even when the e=
SPI
> config is disabled, gicv3_dist_espi_common_init() should be invoked
> regardless of whether CONFIG_GICV3_ESPI is enabled or not. This will not
> affect hardware without eSPI support, as the function checks if the
> hardware supports eSPIs by reading the GICD_TYPER.ESPI field (using
> GICD_TYPER_ESPIS_NUM macro), which indicates whether the extended SPI
> range is supported. If the hardware does not support eSPI, the function
> will not perform any actions.
>
> There are no functional changes for setups where CONFIG_GICV3_ESPI=3Dy.
>
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
> Acked-by: Julien Grall <jgrall@amazon.com>
> ---
> Changes in v2:
> - rebased on the current staging
> - placed Suggested-by tag first to keep tags in chronological order
> - added Acked-by from Julien Grall
>
> This is a follow-up patch related to the discussion:
> https://lore.kernel.org/xen-devel/820704d0-4047-4f02-a058-01daba2765f1@xe=
n.org/
>
> Sending v2 with the requested changes, as I only now noticed
> that this patch has not been merged yet.
> ---
>  xen/arch/arm/gic-v3.c                  | 32 ++++++++++++++------------
>  xen/arch/arm/include/asm/gic_v3_defs.h |  2 --
>  2 files changed, 17 insertions(+), 17 deletions(-)
>
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index acdac22953..463769d77b 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -703,17 +703,32 @@ unsigned int gic_number_espis(void)
>      return gic_hw_ops->info->nr_espi;
>  }
>
> +static void __init gicv3_dist_espi_init_aff(uint64_t affinity)
> +{
> +    unsigned int i;
> +
> +    for ( i =3D 0; i < gicv3_info.nr_espi; i++ )
> +        writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTERnE + i * =
8);
> +}
> +#else
> +
> +static void __init gicv3_dist_espi_init_aff(uint64_t affinity) { }
> +#endif
> +
>  static void __init gicv3_dist_espi_common_init(uint32_t type)

I think the ordering in gicv3_dist_espi_common_init() needs to be
revisited now that this function is also called with
CONFIG_GICV3_ESPI=3Dn.

The motivation for this patch is that firmware may have left an eSPI
enabled. However, we currently program GICD_ICFGRnE before clearing
the corresponding enable bit in GICD_ICENABLERnE.

The GIC architecture requires an interrupt to be individually disabled
before changing Int_config; otherwise the behavior is UNPREDICTABLE.
See Arm IHI 0069H.b, section 12.9.9 (GICD_ICFGR<n>).

We also rely on the same requirement in gic_set_irq_type().

So shouldn't we disable/deactivate all eSPIs before programming
GICD_ICFGRnE? Linux also initializes the extended SPI range in this
order: ICENABLERnE/ICACTIVERnE first, followed by IGROUPRnE,
ICFGRnE and IPRIORITYRnE.

This issue already seems to exist for the CONFIG_GICV3_ESPI=3Dy path,
but this patch makes it relevant to the newly added CONFIG=3Dn path,
where an eSPI left enabled by firmware is precisely the case we are
trying to handle.

Also, we could disable/deactivate eSPIs for all builds, while keeping
the rest of the eSPI configuration under CONFIG_GICV3_ESPI. This would
avoid accessing the other eSPI registers in builds without eSPI
support, unless there is a particular reason to initialize them there.

Best regards,
Mykola

