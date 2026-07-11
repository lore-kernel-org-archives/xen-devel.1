Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5572AC44506
	for <xen-devel@archiver.kernel.org>; Sat, 11 Jul 2026 17:10:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1360487.1613339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wibDK-0008N2-To; Sat, 11 Jul 2026 17:10:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1360487.1613339; Sat, 11 Jul 2026 17:10:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wibDK-0008MM-Ps; Sat, 11 Jul 2026 17:10:06 +0000
Received: by outflank-mailman (input) for mailman id 1360487;
 Sat, 11 Jul 2026 17:10:05 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ljs@kernel.org>) id 1wibDJ-0008BO-LV
 for xen-devel@lists.xenproject.org; Sat, 11 Jul 2026 17:10:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wibDI-009LgX-L6
 for xen-devel@lists.xenproject.org; Sat, 11 Jul 2026 19:10:04 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ljs@kernel.org>)
 id 6a5278c2-e002-0a2a0a5209dd-0a2a450590ba-24
 for <xen-devel@lists.xenproject.org>; Sat, 11 Jul 2026 19:10:04 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <ljs@kernel.org>)
 id 6a5278eb-4f1d-0a2a45050019-ac6904feb00a-3
 for <xen-devel@lists.xenproject.org>; Sat, 11 Jul 2026 19:10:04 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 3878D6111A;
 Sat, 11 Jul 2026 17:10:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6F71F000E9;
 Sat, 11 Jul 2026 17:09:44 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:Cc:Subject:References:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783789801;
	bh=AvtNjMXUVGcPIUxCxCfqbdEtpU8jR9HOTGYaAlW6IJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k3fNhKS66r/p/o8Bc1xI7ewhTioGM5eE5UxTbAfHwiEEG5NZOQoHjazK2cWX+6/SE
	 v+U9r2rkD4VP0CNSplf/nSgPr33pdrLmGKOrJy6x0c8Xsnfudte+l8CuZRkvsJHzhL
	 2xzdkO2v+Q+2PPXWrMuMSvbGqEw9CmT9+ZHMiG1WT8jUC5NdwLiZsm50xu5zeD+/aW
	 zvImcxhwsTnEPAUhEbcG4TpZeBj1kqZVb6dm8VWTrMRJu36W2lybHuDy0lpFg0MMPF
	 ANsT8GKLEgijBVcxkcvqBp+1nPOUHmAwPtV+5/DPz8eLqjTPOJ42AuY6RZqVPq55n+
	 bc2Qco/fVIOQQ==
Date: Sat, 11 Jul 2026 18:09:35 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Zi Yan <ziy@nvidia.com>
Cc: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org, 
	tsbogend@alpha.franken.de, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, l.stach@pengutronix.de, inki.dae@samsung.com, 
	sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org, 
	peter.griffin@linaro.org, jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, 
	rodrigo.vivi@intel.com, tursulin@ursulin.net, robin.clark@oss.qualcomm.com, 
	lumag@kernel.org, lyude@redhat.com, dakr@kernel.org, 
	tomi.valkeinen@ideasonboard.com, hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, 
	thierry.reding@kernel.org, mperttunen@nvidia.com, jonathanh@nvidia.com, kraxel@redhat.com, 
	dmitry.osipenko@collabora.com, zack.rusin@broadcom.com, matthew.brost@intel.com, 
	thomas.hellstrom@linux.intel.com, oleksandr_andrushchenko@epam.com, deller@gmx.de, bcrl@kvack.org, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, muchun.song@linux.dev, osalvador@suse.de, 
	david@kernel.org, baolin.wang@linux.alibaba.com, liam@infradead.org, 
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, 
	hughd@google.com, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, jannh@google.com, pfalcato@suse.de, kees@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
	etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, 
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org, linux-fbdev@vger.kernel.org, 
	linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 13/13] mm/mremap: convert mremap code to use vma_flags_t
Message-ID: <alJ4VPr7Igk3SJYt@lucifer>
References: <380f761d35a3faa4370f8b3f92e3d4af3d4c7110.1782760670.git.ljs@kernel.org>
 <20260702134947.25189-1-lance.yang@linux.dev>
 <akaJx8Zt8kazlrjq@lucifer>
 <DJTOP760MDDG.2KUSKD8WVVKJ5@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJTOP760MDDG.2KUSKD8WVVKJ5@nvidia.com>
X-purgate-ID: tlsNG-c201ff/1783789804-D8D5012E-9AF9A4ED/0/0
X-purgate-type: clean
X-purgate-size: 1592

On Wed, Jul 08, 2026 at 10:28:00PM -0400, Zi Yan wrote:
> On Thu Jul 2, 2026 at 12:07 PM EDT, Lorenzo Stoakes wrote:
> > On Thu, Jul 02, 2026 at 09:49:47PM +0800, Lance Yang wrote:
> >>
> >> On Mon, Jun 29, 2026 at 08:25:36PM +0100, Lorenzo Stoakes wrote:
> >> >Replace use of the legacy vm_flags_t flags with vma_flags_t values
> >> >throughout the mremap logic.
> >> >
> >> >Additionally update comments to reflect the changes to be consistent.
> >> >
> >> >No functional change intended.
> >> >
> >> >Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> >> >---
> >>
> >> The vm_flags_set() cases below spell out vma_start_write(), but the
> >> vm_flags_clear() cases don't?
> >
> > Yep as I said elsewhere, implicitly taking the lock is terrible and me doing
> > this is completely on purpose to get rid of that :)
> >
> > But I haven't been clear enough clearly, so I should put the argument as to why
> > that's ok in the commit message.
> >
> > Will do so on respin.
>
> How about also add a comment to vma_clear*() telling us a lock is not
> needed and why like you explained a lock is needed for vma_set*()?
> This asymmetry could confuse people.

Well you do absolutely have to hold the lock once the VMA is initialised when
using any VMA flags API that manipulates flags (apart from the explicitly atomic
case).

The argument here is that the VMA was _already locked_ at the point of clearing
:)

>
> This patch looks good to me.
>
> Reviewed-by: Zi Yan <ziy@nvidia.com>

Thanks!

>
> --
> Best Regards,
> Yan, Zi
>

Cheers, Lorenzo

