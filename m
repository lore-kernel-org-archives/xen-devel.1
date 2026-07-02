Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23863C43458
	for <xen-devel@archiver.kernel.org>; Thu,  2 Jul 2026 15:40:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1352092.1609015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfJWs-0005uS-GS; Thu, 02 Jul 2026 15:40:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1352092.1609015; Thu, 02 Jul 2026 15:40:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfJWs-0005uL-CB; Thu, 02 Jul 2026 15:40:42 +0000
Received: by outflank-mailman (input) for mailman id 1352092;
 Thu, 02 Jul 2026 15:40:41 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ljs@kernel.org>) id 1wfJWr-0005uB-Fz
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 15:40:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfJWq-006HWF-T4
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 17:40:40 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ljs@kernel.org>)
 id 6a46866d-2eae-0a2a0a5409dd-0a2a45068534-10
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 17:40:40 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ljs@kernel.org>)
 id 6a468677-08de-0a2a45060019-ac6904fed628-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 17:40:40 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C7EA7601CA;
 Thu,  2 Jul 2026 15:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8E41F00A3E;
 Thu,  2 Jul 2026 15:40:21 +0000 (UTC)
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
	s=k20260515; t=1783006838;
	bh=gNLYS8EYE6bJ5KaXF7DR9fRu4urDF+a7laqqF8q0hcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z8vOAtQOT+iGTiy4xQ3GfxWy9CpR6iieY1qxm1fyBJSvxEFV2aEwGeTLwIZE4UbYF
	 sH6QvDHKQJHBXcc/JYlecYNDNZBJEw63vn2taYjOLxg3iNlePJRLcm76SDX3qcqqpf
	 OAzUHT+NRGQHyZOOfos5EJuVfaKEWfkdr4crDOBp2KFX/hKeIetGWLc1I64/oz6RHQ
	 NC8RA6ivq/IEW4DV1d+3Z0k229cWnviqo6Svky+UHUgnyeaFy3m0xyIovRQ1UfVX8n
	 wqqP9ts5FpBy46j7HS+G+te0/D/3BLeS388iQo+wLiLJCSDRdl7jDwGFy3vdpkllGJ
	 NUUDfmqseIbQg==
Date: Thu, 2 Jul 2026 16:40:15 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, tsbogend@alpha.franken.de, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	l.stach@pengutronix.de, inki.dae@samsung.com, sw0312.kim@samsung.com, 
	kyungmin.park@samsung.com, krzk@kernel.org, peter.griffin@linaro.org, 
	jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, 
	tursulin@ursulin.net, robin.clark@oss.qualcomm.com, lumag@kernel.org, lyude@redhat.com, 
	dakr@kernel.org, tomi.valkeinen@ideasonboard.com, hjc@rock-chips.com, 
	heiko@sntech.de, andy.yan@rock-chips.com, thierry.reding@kernel.org, 
	mperttunen@nvidia.com, jonathanh@nvidia.com, kraxel@redhat.com, 
	dmitry.osipenko@collabora.com, zack.rusin@broadcom.com, matthew.brost@intel.com, 
	thomas.hellstrom@linux.intel.com, oleksandr_andrushchenko@epam.com, deller@gmx.de, bcrl@kvack.org, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, muchun.song@linux.dev, osalvador@suse.de, 
	david@kernel.org, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	liam@infradead.org, npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, 
	baohua@kernel.org, hughd@google.com, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, jannh@google.com, pfalcato@suse.de, 
	kees@kernel.org, perex@perex.cz, tiwai@suse.com, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
	etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, 
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org, linux-fbdev@vger.kernel.org, 
	linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 08/13] mm: introduce vma_get_page_prot() and use it
Message-ID: <akaGOiLz-3Zx6kDs@lucifer>
References: <3bb8bdc4788230c33102166d56cbc5abfad9d4cb.1782760670.git.ljs@kernel.org>
 <20260702123845.95316-1-lance.yang@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702123845.95316-1-lance.yang@linux.dev>
X-purgate-ID: tlsNG-16d1c6/1783006840-C473068D-0B2CF8FD/0/0
X-purgate-type: clean
X-purgate-size: 1835

On Thu, Jul 02, 2026 at 08:38:45PM +0800, Lance Yang wrote:
>
> On Mon, Jun 29, 2026 at 08:25:31PM +0100, Lorenzo Stoakes wrote:
> >There's a large number of vm_get_page_prot(vma->vm_flags) invocations. Make
> >life easier by introducing vma_get_page_prot() parameterised by the VMA.
> >
> >This also makes converting vm_get_page_prot() to vma_flags_t easier.
> >
> >Also update the userland VMA tests to reflect the change.
> >
> >No functional change intended.
> >
> >Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> >---
> > drivers/gpu/drm/drm_gem.c                   |  2 +-
> > drivers/gpu/drm/drm_gem_dma_helper.c        |  2 +-
> > drivers/gpu/drm/drm_gem_shmem_helper.c      |  2 +-
> > drivers/gpu/drm/etnaviv/etnaviv_gem.c       |  2 +-
> > drivers/gpu/drm/exynos/exynos_drm_gem.c     |  6 +++---
> > drivers/gpu/drm/i915/gem/i915_gem_mman.c    | 12 ++++++------
> > drivers/gpu/drm/msm/msm_gem.c               |  2 +-
> > drivers/gpu/drm/nouveau/nouveau_gem.c       |  2 +-
> > drivers/gpu/drm/omapdrm/omap_fbdev.c        |  2 +-
> > drivers/gpu/drm/omapdrm/omap_gem.c          |  6 +++---
> > drivers/gpu/drm/rockchip/rockchip_drm_gem.c |  2 +-
> > drivers/gpu/drm/tegra/gem.c                 |  2 +-
> > drivers/gpu/drm/virtio/virtgpu_vram.c       |  2 +-
> > drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c  |  2 +-
> > drivers/gpu/drm/xe/xe_device.c              |  2 +-
> > drivers/gpu/drm/xe/xe_mmio_gem.c            |  2 +-
> > drivers/gpu/drm/xen/xen_drm_front_gem.c     |  2 +-
> > drivers/video/fbdev/core/fb_io_fops.c       |  2 +-
>
> One missed?
>
> drivers/gpu/drm/panthor/panthor_gem.c still has:
>
> 	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
>
> Can use vma_get_page_prot(vma) too.

Oops! Will respin and update. Good spot!

>
> [...]

Thanks, Lorenzo

