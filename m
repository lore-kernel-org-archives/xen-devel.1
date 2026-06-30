Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49EEC43327
	for <xen-devel@archiver.kernel.org>; Tue, 30 Jun 2026 10:24:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1348641.1606376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weVdV-0007PT-GW; Tue, 30 Jun 2026 10:24:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348641.1606376; Tue, 30 Jun 2026 10:24:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weVdV-0007PM-Dj; Tue, 30 Jun 2026 10:24:13 +0000
Received: by outflank-mailman (input) for mailman id 1348641;
 Tue, 30 Jun 2026 10:24:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jani.nikula@intel.com>) id 1weVdT-0007PG-9K
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 10:24:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weVdR-006ehC-Ls
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 12:24:10 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jani.nikula@intel.com>)
 id 6a439940-e002-0a2a0a5209dd-0a2a4502ce44-22
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 12:24:07 +0200
Received: from [192.198.163.14] (helo=mgamail.intel.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jani.nikula@intel.com>)
 id 6a439945-5a27-0a2a45020019-c0c6a30e14eb-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 12:24:06 +0200
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 03:24:04 -0700
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.148])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 03:23:47 -0700
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=Intel header.d=intel.com header.i="@intel.com" header.h="From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:MIME-Version"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782815047; x=1814351047;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=ktunQaDDS5EVOVO47fVPmptPD5p+avnAGjEgEXLkbp0=;
  b=F6AsC/aT90NURy+nIBMPDQ9d0+/chwhGF8cLyA69gB2+vHBgThgQS5du
   MwRBomZ51VBPfWj1CxiGTHW18hBmuypZ3BLzMmM26hr2eYoXtWdzH2vp9
   9zp93Fl+V0HKnr4X4xhBX3Do8oxDL+p/jvap4t7FwWAiZVyvG9mwDrY1K
   IonbJKHpRX7ltJuM2U9GR2bRsjSQ88+pzQwCllfbu0/VSTwOgvNFBI2H7
   UTmuL54fZswHci0/P3xqEPXp5XuVwMrqDvtiagKyRUmm08juW+ThebUV6
   sLm7OgAbVyzwtQjQc9BfBG6oBfARZzzXDlQqPNIf4Oq4OnR3r3pSOnBRg
   A==;
X-CSE-ConnectionGUID: OSxs7YQ3Qdeuun+y2MqK/w==
X-CSE-MsgGUID: 4MhOWVQqTy+E9tL5ywZQfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83581382"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="83581382"
X-CSE-ConnectionGUID: jgq2xSQuTZCC6QLcUYS3Dw==
X-CSE-MsgGUID: Tgh3e1tLRQ2N4h0xSzOsDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="245877673"
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lorenzo Stoakes <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Lucas Stach
 <l.stach@pengutronix.de>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim
 <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Lyude
 Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, Tomi
 Valkeinen <tomi.valkeinen@ideasonboard.com>, Sandy Huang
 <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan
 <andy.yan@rock-chips.com>, Thierry Reding <thierry.reding@kernel.org>,
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Zack Rusin <zack.rusin@broadcom.com>,
 Matthew Brost <matthew.brost@intel.com>, Thomas Hellstrom
 <thomas.hellstrom@linux.intel.com>, Oleksandr Andrushchenko
 <oleksandr_andrushchenko@epam.com>, Helge Deller <deller@gmx.de>, Benjamin
 LaHaise <bcrl@kvack.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Muchun Song
 <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, David
 Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, "Liam R . Howlett" <liam@infradead.org>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>, Dev
 Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang
 <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>, Vlastimil Babka
 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jann Horn
 <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, Kees Cook
 <kees@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 xen-devel@lists.xenproject.org, linux-fbdev@vger.kernel.org,
 linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH 08/13] mm: introduce vma_get_page_prot() and use it
In-Reply-To: <3bb8bdc4788230c33102166d56cbc5abfad9d4cb.1782760670.git.ljs@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1782760670.git.ljs@kernel.org>
 <3bb8bdc4788230c33102166d56cbc5abfad9d4cb.1782760670.git.ljs@kernel.org>
Date: Tue, 30 Jun 2026 13:23:44 +0300
Message-ID: <d6d75626287ddd46d7da136cf013f7b21b1afc06@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-purgate-ID: tlsNG-720697/1782815047-7791E7C5-575F9440/0/0
X-purgate-type: clean
X-purgate-size: 221

On Mon, 29 Jun 2026, Lorenzo Stoakes <ljs@kernel.org> wrote:
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c    | 12 ++++++------

For i915,

Acked-by: Jani Nikula <jani.nikula@intel.com>



-- 
Jani Nikula, Intel

