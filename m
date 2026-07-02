Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAFEC43458
	for <xen-devel@archiver.kernel.org>; Thu,  2 Jul 2026 12:22:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1351781.1608834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfGQY-0005jU-5r; Thu, 02 Jul 2026 12:21:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351781.1608834; Thu, 02 Jul 2026 12:21:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfGQY-0005jN-2Q; Thu, 02 Jul 2026 12:21:58 +0000
Received: by outflank-mailman (input) for mailman id 1351781;
 Thu, 02 Jul 2026 12:21:56 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <lance.yang@linux.dev>) id 1wfGQV-0005jH-4f
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 12:21:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfGQU-006Uvu-He
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 14:21:54 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <lance.yang@linux.dev>)
 id 6a4657e2-bab6-0a2a0a5309dd-0a2a45019d8a-0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 14:21:54 +0200
Received: from [91.218.175.173] (helo=out-173.mta0.migadu.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <lance.yang@linux.dev>)
 id 6a4657e1-400f-0a2a45010019-5bdaafad6efe-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 14:21:53 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=key1 header.d=linux.dev header.i="@linux.dev" header.h="From:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782994911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=flDoJiJgtgGf3x2zlQX9jaS5nhFTdBgmSXvfG9PiFjA=;
	b=lN0+Boa2ASIcCLc47EPvtXVMZuYaw78VJ/wVLmRpCeGudutYAguuVxwIGwqQDa2oDibvGW
	bIpbbgc5ew0Ij3QtFyyGuneAdXTOrpkXqfYfNRMzfKjFKxKgZCy8wM/iRDCenl6trdMYJz
	+LOdf87J+2yAD0n3s3yNqonkzwm6x4w=
From: Lance Yang <lance.yang@linux.dev>
To: ljs@kernel.org
Cc: akpm@linux-foundation.org,
	tsbogend@alpha.franken.de,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	l.stach@pengutronix.de,
	inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	krzk@kernel.org,
	peter.griffin@linaro.org,
	jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com,
	tursulin@ursulin.net,
	robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	lyude@redhat.com,
	dakr@kernel.org,
	tomi.valkeinen@ideasonboard.com,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	thierry.reding@kernel.org,
	mperttunen@nvidia.com,
	jonathanh@nvidia.com,
	kraxel@redhat.com,
	dmitry.osipenko@collabora.com,
	zack.rusin@broadcom.com,
	matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com,
	oleksandr_andrushchenko@epam.com,
	deller@gmx.de,
	bcrl@kvack.org,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	hughd@google.com,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	jannh@google.com,
	pfalcato@suse.de,
	kees@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	etnaviv@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	virtualization@lists.linux.dev,
	intel-xe@lists.freedesktop.org,
	xen-devel@lists.xenproject.org,
	linux-fbdev@vger.kernel.org,
	linux-aio@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 06/13] mm/vma: convert vm_pgprot_modify() to use vma_flags_t and rename
Date: Thu,  2 Jul 2026 20:21:16 +0800
Message-Id: <20260702122116.65642-1-lance.yang@linux.dev>
In-Reply-To: <548ba81b2971734d4d2143237ad1465bd1b2f525.1782760670.git.ljs@kernel.org>
References: <548ba81b2971734d4d2143237ad1465bd1b2f525.1782760670.git.ljs@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-purgate-ID: tlsNG-d62444/1782994914-D04D51E0-39AE9C31/0/0
X-purgate-type: clean
X-purgate-size: 1521


On Mon, Jun 29, 2026 at 08:25:29PM +0100, Lorenzo Stoakes wrote:
>Update vm_pgprot_modify() to use the new VMA flags type vma_flags_t, and
>rename to vma_pgprot_modify() accordingly.
>
>This is part of the ongoing work to convert vm_flags_t to vma_flags_t, in
>order to eliminate the arbitrary limit of the number of bits in a system
>word on available VMA flags.
>
>Update VMA userland tests accordingly, updating vma_set_page_prot() to no
>longer inline vma_pgprot_modify(), rather we can simply define
>vma_pgprot_modify() as a static inline function and the tests will pick it
>up from vma.h.
>
>No functional change intended.
>
>Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
>---
[...]
>diff --git a/mm/vma.h b/mm/vma.h
>index bcf0c2773449..6a8abb8ae937 100644
>--- a/mm/vma.h
>+++ b/mm/vma.h
>@@ -522,9 +522,11 @@ static inline bool vma_wants_manual_pte_write_upgrade(struct vm_area_struct *vma
> }
> 
> #ifdef CONFIG_MMU
>-static inline pgprot_t vm_pgprot_modify(pgprot_t oldprot, vm_flags_t vm_flags)
>+static inline pgprot_t vma_pgprot_modify(pgprot_t oldprot, vma_flags_t vma_flags)
> {
>-	return pgprot_modify(oldprot, vm_get_page_prot(vm_flags));
>+	const pgprot_t prot = vma_get_page_prot(vma_flags);
>+
>+	return pgprot_modify(oldprot, prot);

Nit: could this just stay as a single return? something like:

return pgprot_modify(oldprot, vma_get_page_prot(vma_flags));

Otherwise, LGTM, feel free to add: 

Reviewed-by: Lance Yang <lance.yang@linux.dev>

[...]

