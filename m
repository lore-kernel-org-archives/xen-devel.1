Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D493C43327
	for <xen-devel@archiver.kernel.org>; Thu,  2 Jul 2026 11:38:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1351736.1608806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfFjz-0006AX-Gq; Thu, 02 Jul 2026 11:37:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351736.1608806; Thu, 02 Jul 2026 11:37:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfFjz-0006AQ-E9; Thu, 02 Jul 2026 11:37:59 +0000
Received: by outflank-mailman (input) for mailman id 1351736;
 Thu, 02 Jul 2026 11:37:58 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <lance.yang@linux.dev>) id 1wfFjx-0006AK-QL
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 11:37:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfFjx-00EP7D-6z
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 13:37:57 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <lance.yang@linux.dev>)
 id 6a464d88-5cb7-0a2a0a5109dd-0a2a4507bff4-28
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 13:37:56 +0200
Received: from [95.215.58.183] (helo=out-183.mta1.migadu.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <lance.yang@linux.dev>)
 id 6a464d93-9c8e-0a2a45070019-5fd73ab7ff0b-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 13:37:55 +0200
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
	t=1782992273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s4zTiOPxPEEvh+Z2LMv+6gqe9ZZvh+3yTK3Yc5UnT/U=;
	b=AkD1PO3EYh/hmuzqNyG5+F4iFU+xRbougp+bY+xotWctIjwUQvMKpAwXsjPb5kG+NxyY12
	mV0mEGNoe2Czu7JdCtguHySTk1KxuHzjRfZnXIBhIe71SSOqRiI6wOFZz62JhxqVX83KFA
	KhWu2A9hV9btjfbdFeq0dyXUttdl5PQ=
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
Subject: Re: [PATCH 03/13] mm: convert __get_unmapped_area() to use vma_flags_t
Date: Thu,  2 Jul 2026 19:37:22 +0800
Message-Id: <20260702113722.97837-1-lance.yang@linux.dev>
In-Reply-To: <b1ad7c4443f5cba622e4c48c5a9ef15427001a93.1782760670.git.ljs@kernel.org>
References: <b1ad7c4443f5cba622e4c48c5a9ef15427001a93.1782760670.git.ljs@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-purgate-ID: tlsNG-ef75cf/1782992276-FCD2C25E-E5F13D92/0/0
X-purgate-type: clean
X-purgate-size: 622


On Mon, Jun 29, 2026 at 08:25:26PM +0100, Lorenzo Stoakes wrote:
>Update __get_unmapped_area() to be parameterised by vma_flags_t rather than
>vm_flags_t as part of the effort to move VMA flags from a system word to a
>bitmap.
>
>We cascade the changes up to arch_get_unmapped_area_topdown() and
>arch_get_unmapped_area(), where, for now, we use vma_flags_to_legacy() in
>order to propagate the VMA flags.
>
>No functional change intended.
>
>Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
>---

Nothing suspicious that I could spot :) Feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>

