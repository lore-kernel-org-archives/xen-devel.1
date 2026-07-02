Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1C7C43458
	for <xen-devel@archiver.kernel.org>; Thu,  2 Jul 2026 15:46:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1352104.1609023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfJcW-0006mo-2k; Thu, 02 Jul 2026 15:46:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1352104.1609023; Thu, 02 Jul 2026 15:46:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfJcV-0006mh-VV; Thu, 02 Jul 2026 15:46:31 +0000
Received: by outflank-mailman (input) for mailman id 1352104;
 Thu, 02 Jul 2026 15:46:30 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ljs@kernel.org>) id 1wfJcU-0006mb-LN
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 15:46:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfJcU-00EUhV-2M
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 17:46:30 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ljs@kernel.org>)
 id 6a4687c2-bab6-0a2a0a5309dd-0a2a4506ec10-28
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 17:46:29 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ljs@kernel.org>)
 id 6a4687d4-08de-0a2a45060019-ac6904feedd0-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 17:46:29 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 2EBA4601EE;
 Thu,  2 Jul 2026 15:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90EC61F000E9;
 Thu,  2 Jul 2026 15:46:11 +0000 (UTC)
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
	s=k20260515; t=1783007187;
	bh=jvE9wSqWBUCbGMsJG9svgBUezevNvrm1MrcHHSCChso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mynx6GD6LkebsGmUnF9MjOYGoc5t/kjVRBAa3y4hDMiI7/vl1tQdkpNYaMYBglDKt
	 PpjOhV7WkyGWbA6148JfY40EHSUewPFem4EcHLSNtrDL52P+m6uRZFhhXV+p8drDP5
	 krlXhtnXXcRAzWJ2KFYq3Hh8rhTgMNWOvfDO5ubcScHxjko5fhA5/oYXfBSBTm3FYZ
	 q91+d//PbttUXOxvDyYYUNz2FFsT7LJ6pIAF99pcS/rpWlpmF6qsZCGqK6q0R7Cu6u
	 A7jMMvK5AtByO3p0pYtd9gulxJxBI42o3AQ7j7VXEvArqPbpGQYUH4EuymRAwVZamK
	 6IrFtw9w61Ysg==
Date: Thu, 2 Jul 2026 16:46:04 +0100
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
Subject: Re: [PATCH 10/13] mm/vma: convert miscellaneous uses of VMA flags in
 core mm
Message-ID: <akaGxiTaJreEQn8T@lucifer>
References: <1e7d834c887b6a65627d730addcff13d458c6268.1782760670.git.ljs@kernel.org>
 <20260702131233.59026-1-lance.yang@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702131233.59026-1-lance.yang@linux.dev>
X-purgate-ID: tlsNG-16d1c6/1783007189-C4D3568D-248080DD/0/0
X-purgate-type: clean
X-purgate-size: 2543

On Thu, Jul 02, 2026 at 09:12:33PM +0800, Lance Yang wrote:
>
> On Mon, Jun 29, 2026 at 08:25:33PM +0100, Lorenzo Stoakes wrote:
> >Update various uses of legacy flags in vma.c and mmap.c to the new
> >vma_flags_t type, updating comments alongside them to be consistent.
> >
> >Also update __install_special_mapping() to rearrange things slightly to
> >accommodate the changes.
> >
> >Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> >---
> [...]
> >diff --git a/mm/vma.c b/mm/vma.c
> >index b81c05e67a61..ab2ef0f04420 100644
> >--- a/mm/vma.c
> >+++ b/mm/vma.c
> >@@ -3417,23 +3417,27 @@ struct vm_area_struct *__install_special_mapping(
> > 	vm_flags_t vm_flags, void *priv,
> > 	const struct vm_operations_struct *ops)
> > {
> >-	int ret;
> >+	vma_flags_t vma_flags = legacy_to_vma_flags(vm_flags);
> > 	struct vm_area_struct *vma;
> >+	int ret;
> >
> > 	vma = vm_area_alloc(mm);
> >-	if (unlikely(vma == NULL))
> >+	if (unlikely(!vma))
> > 		return ERR_PTR(-ENOMEM);
> >
> >-	vma_set_range(vma, addr, addr + len, 0);
> >-	vm_flags |= vma_flags_to_legacy(mm->def_vma_flags) | VM_DONTEXPAND;
> >+	vma_flags_set_mask(&vma_flags, mm->def_vma_flags);
> >+	vma_flags_set(&vma_flags, VMA_DONTEXPAND_BIT);
> > 	if (pgtable_supports_soft_dirty())
> >-		vm_flags |= VM_SOFTDIRTY;
> >-	vm_flags_init(vma, vm_flags & ~VM_LOCKED_MASK);
> >+		vma_flags_set(&vma_flags, VMA_SOFTDIRTY_BIT);
> >+	vma_flags_clear_mask(&vma_flags, VMA_LOCKED_MASK);
> >+	vma->flags = vma_flags;
>
> Maybe worth a vma_flags_init() helper here to mirror vm_flags_init()?
> With this open-coded, we lose the soft-dirty WARN_ON_ONCE sanity check.
>
> Might be nicer to keep that check in one place ;)

I really hate all the VMA flag accessors, they conflate things horribly - we
should be explicitly taking VMA write locks when we need to (and often killable
ones actually) not assuming that a VMA flags accessor does (they should at most
assert).

This case is even more terribly egregious - you are setting flags at an
arbitrary time, why are we asserting something about softdirty?

You may update them as part of initialisation, maybe not. It's far from a
guarantee and feels like a lazy place to put it.

BUT obviously it's an oversight not to open code that here, so I'll update the
patch to do that!

I want VMA flags to be a clean stateless thing, other than the flags
themselves. Implicit, unrelated, asserts or lock acquisitions in general should
be done separately IMO.

>
> [...]

Thanks, Lorenzo

