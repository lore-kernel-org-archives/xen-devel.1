Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482D9C43458
	for <xen-devel@archiver.kernel.org>; Tue, 14 Jul 2026 07:32:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1362011.1614014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjXcm-0007SY-GU; Tue, 14 Jul 2026 07:32:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362011.1614014; Tue, 14 Jul 2026 07:32:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjXcm-0007SR-DQ; Tue, 14 Jul 2026 07:32:16 +0000
Received: by outflank-mailman (input) for mailman id 1362011;
 Tue, 14 Jul 2026 02:25:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <akpm@linux-foundation.org>) id 1wjSpq-0004WD-RK
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 02:25:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjSpq-008ZYB-4d
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 04:25:26 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <akpm@linux-foundation.org>)
 id 6a559dab-bab6-0a2a0a5309dd-0a2a4502ae2e-34
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 04:25:25 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <akpm@linux-foundation.org>)
 id 6a559e13-64c6-0a2a45020019-aceafc1fadea-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 04:25:24 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 821A641877;
 Tue, 14 Jul 2026 02:25:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93DE31F000E9;
 Tue, 14 Jul 2026 02:25:19 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=korg header.d=linux-foundation.org header.i="@linux-foundation.org" header.h="Date:From:To:Cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783995922;
	bh=dxhqIlF4Nmwz7Dc6V0zHplATkq8zPUSt2q/Zds9EZa8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=b48cJk93FtKmn41eVdolAVE/uzQX6EHo01Pnkn0OgnY1vIvJtpHyTyl3C+S0onbuL
	 GGMGjmfE2JKefejiLP1J3PzT6MIi/Ch6j4XkBShkTRk15H8PEW9ZSYVvQQ/3WhTIGU
	 P9nMjGwkFSOLhnsQCjHUwc7HZ389d5X722tVvR6w=
Date: Mon, 13 Jul 2026 19:25:19 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, "Liam R. Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Benjamin LaHaise <bcrl@kvack.org>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara
 <jack@suse.cz>, Hugh Dickins <hughd@google.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Jann Horn <jannh@google.com>, Pedro
 Falcato <pfalcato@suse.de>, Muchun Song <muchun.song@linux.dev>, Oscar
 Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>, Nico Pache
 <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain
 <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang
 <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, Inki Dae <inki.dae@samsung.com>, Seung-Woo
 Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Jani
 Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Lyude Paul <lyude@redhat.com>, Danilo
 Krummrich <dakr@kernel.org>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Sandy Huang <hjc@rock-chips.com>, Heiko
 =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Andy Yan
 <andy.yan@rock-chips.com>, Thierry Reding <thierry.reding@kernel.org>,
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Gurchetan Singh
 <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, Zack Rusin
 <zack.rusin@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Matthew Brost
 <matthew.brost@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oleksandr Andrushchenko
 <oleksandr_andrushchenko@epam.com>, Helge Deller <deller@gmx.de>, Kees Cook
 <kees@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Boris Brezillon <boris.brezillon@collabora.com>, Steven
 Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-aio@kvack.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 xen-devel@lists.xenproject.org, linux-fbdev@vger.kernel.org,
 linux-sound@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 00/13] mm: convert more vm_flags_t users to
 vma_flags_t
Message-Id: <20260713192519.58113fa69c169d3f5f82e453@linux-foundation.org>
In-Reply-To: <20260711-b4-vma-flags-mm-v2-0-0fa2357d5431@kernel.org>
References: <20260711-b4-vma-flags-mm-v2-0-0fa2357d5431@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1783995925-3CF53A87-16AC031A/0/0
X-purgate-type: clean
X-purgate-size: 689

On Sat, 11 Jul 2026 19:44:57 +0100 Lorenzo Stoakes <ljs@kernel.org> wrote:

> This series makes further progress in converting usage of the deprecated
> vm_flags_t type to its replacement, vma_flags_t.
> 
> It focuses on mm, though updates some users of mm APIs also.
> 
> It updates:
> 
> * The core do_mmap() code path for VMA mapping.
> * Unmapped area logic.
> * The usage of mm->def_vma_flags.
> * VMA page protection bit logic.
> * General usage of VMA flags in core mm code, mlock, mprotect, mremap.

Added to mm-new, thanks.

And oh my, what a lot of pre-existing issues:
	https://sashiko.dev/#/patchset/20260711-b4-vma-flags-mm-v2-0-0fa2357d5431@kernel.org



