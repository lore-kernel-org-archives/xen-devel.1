Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12FDC982E1
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 14:30:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427611.1650406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8f25-0000Ly-EJ; Mon, 21 Sep 2026 14:30:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427611.1650406; Mon, 21 Sep 2026 14:30:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8f25-0000Lr-BP; Mon, 21 Sep 2026 14:30:13 +0000
Received: by outflank-mailman (input) for mailman id 1427611;
 Mon, 21 Sep 2026 14:30:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <thomas.hellstrom@linux.intel.com>)
 id 1x8f23-0000Ll-Dc
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 14:30:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8f22-002hdr-HW
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 16:30:10 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <thomas.hellstrom@linux.intel.com>)
 id 6ab13f6e-8faa-0a2a0a5109dd-0a2a4509de40-10
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 16:30:09 +0200
Received: from [192.198.163.7] (helo=mgamail.intel.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <thomas.hellstrom@linux.intel.com>)
 id 6ab13f6e-be1a-0a2a45090019-c0c6a307741d-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 16:30:08 +0200
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 07:30:06 -0700
Received: from ettammin-mobl3.ger.corp.intel.com (HELO [10.245.244.155])
 ([10.245.244.155])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 07:30:03 -0700
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=Intel header.d=intel.com header.i="@intel.com" header.h="Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Content-Transfer-Encoding:MIME-Version"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790001008; x=1821537008;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=KEIz1oZeYNGf2W1PHV/FBKWoGPCq3tTSHeCdI8YHNSU=;
  b=HJ4yMHewQXjuw680xaWwAsA24xsPxXxeOZ8wmkWJVoJXdQ4eEHXci6ai
   ZjAhw6j2OIkQxthSe5PPRvNNmAltd2KO7aCoa3GyhQtLUWCps/LszcL3t
   +EgViCxfDiWAk0pRW8pvlyTyqSTlVUZaa31bG35TbN6gjoT8sd/ewtJ2L
   D/ZhjqniAUhvTgYLQVnu62m7slJXuLLd/GuvtnBbZchgTLttUv39mNHVb
   gtKFcdRUhJRuQ+P8DOZTzf/UfV5nooAxMw69F+ji1dpI6DU4m4IbVk9BE
   yU04TjsCs12hubdZLhXZ5KoZipGpeQx8bailT8siOvtAxRNzHWpgi0mCy
   Q==;
X-CSE-ConnectionGUID: ATmBgQN4Q7i0WDqMIDQTbg==
X-CSE-MsgGUID: 9XtS2wy6SVGwLCj9QXG2Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="116042568"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="116042568"
X-CSE-ConnectionGUID: kjkLvVcGQfSuVkimgMKulQ==
X-CSE-MsgGUID: q9iUGYRaTnOT4JEfU+z5Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="298923086"
Message-ID: <466d03e5725bdda886a53b395e102c121e110c1d.camel@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe: Limit sg segment size to PAGE_SIZE on Xen PV
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Szymon =?UTF-8?Q?Aceda=C5=84ski?= <accek@invisiblethingslab.com>, 
	intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, 
	maarten.lankhorst@linux.intel.com, hch@lst.de, bob.beckett@collabora.com, 
	dri-devel@lists.freedesktop.org, marmarek@invisiblethingslab.com, 
	xen-devel@lists.xenproject.org, stable@vger.kernel.org
Date: Mon, 21 Sep 2026 16:30:01 +0200
In-Reply-To: <49da6f28a4ba582d32ac6cdccd6dea65d75eefbf.camel@linux.intel.com>
References: <20260916173030.3223833-1-accek@invisiblethingslab.com>
	 <49da6f28a4ba582d32ac6cdccd6dea65d75eefbf.camel@linux.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-purgate-ID: tlsNG-bad1c0/1790001009-BF2DC034-6AA6D7C7/0/0
X-purgate-type: clean
X-purgate-size: 3329

On Mon, 2026-09-21 at 15:57 +0200, Thomas Hellstr=C3=B6m wrote:
> On Wed, 2026-09-16 at 19:30 +0200, Szymon Aceda=C5=84ski wrote:
> > Fix display corruption on Xen PV dom0, where DMA buffers are not
> > guaranteed machine-contiguous, in which case bounce buffering kicks
> > in, breaking xe's memory coherency assumptions.
> >=20
> > Apply the same workaround i915 carries in i915_sg_segment_size()
> > since
> > commit 78a07fe777c4 ("drm/i915: stop abusing swiotlb_max_segment").
> >=20
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel
> > GPUs")
> > Reported-by: Marek Marczykowski-G=C3=B3recki
> > <marmarek@invisiblethingslab.com>
> > Closes:
> > https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8382
> > Link: https://lore.kernel.org/xen-devel/aYtznP_tT6xNPwf-@mail-itl/
> > Link:
> > https://lore.kernel.org/all/20221020110308.1582518-1-hch@lst.de/=C2=A0#
> > i915 counterpart
> > Cc: Christoph Hellwig <hch@lst.de>
> > Cc: Robert Beckett <bob.beckett@collabora.com>
> > Cc: stable@vger.kernel.org=C2=A0# v6.8+
> > Signed-off-by: Szymon Aceda=C5=84ski <accek@invisiblethingslab.com>
> > ---
> > v2:
> > =C2=A0- Imperative language in the commit message (Thomas Hellstr=C3=B6=
m)
> > =C2=A0- CC the authors of the original i915 workaround (Thomas
> > Hellstr=C3=B6m)
>=20
> Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

Pushed to drm-xe-next. Thanks.

/Thomas


>=20
>=20
> >=20
> > =C2=A0drivers/gpu/drm/xe/xe_bo.h | 19 +++++++++++++++++++
> > =C2=A01 file changed, 19 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h
> > b/drivers/gpu/drm/xe/xe_bo.h
> > index 290ca62..341fa93 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -9,6 +9,8 @@
> > =C2=A0#include <drm/drm_prime.h>
> > =C2=A0#include <drm/ttm/ttm_tt.h>
> > =C2=A0
> > +#include <xen/xen.h>
> > +
> > =C2=A0#include "xe_bo_types.h"
> > =C2=A0#include "xe_ggtt.h"
> > =C2=A0#include "xe_macros.h"
> > @@ -574,6 +576,23 @@ static inline unsigned int
> > xe_sg_segment_size(struct device *dev)
> > =C2=A0	struct scatterlist __maybe_unused sg;
> > =C2=A0	size_t max =3D BIT_ULL(sizeof(sg.length) * 8) - 1;
> > =C2=A0
> > +	/*
> > +	 * For Xen PV guests pages aren't contiguous in DMA
> > (machine) address
> > +	 * space.=C2=A0 The DMA API takes care of that both in
> > dma_alloc_* (by
> > +	 * calling into the hypervisor to make the pages
> > contiguous)
> > and in
> > +	 * dma_map_* (by bounce buffering).=C2=A0 But xe (like i915,
> > see
> > commit
> > +	 * 78a07fe777c4) ignores the coherency aspects of the DMA
> > API and thus
> > +	 * can't cope with bounce buffering actually happening, so
> > add a hack
> > +	 * here to force small allocations and mappings when
> > running
> > in PV
> > +	 * mode on Xen.
> > +	 *
> > +	 * Note this will still break if bounce buffering is
> > required for other
> > +	 * reasons, like confidential computing hypervisors or
> > PCIe
> > root ports
> > +	 * with addressing limitations.
> > +	 */
> > +	if (xen_pv_domain())
> > +		return PAGE_SIZE;
> > +
> > =C2=A0	max =3D min_t(size_t, max, dma_max_mapping_size(dev));
> > =C2=A0
> > =C2=A0	/*
> >=20
> > base-commit: baafc300cd079a5210c1e70e5ea3d93518e40b38

