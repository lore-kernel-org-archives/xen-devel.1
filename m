Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52266C44501
	for <xen-devel@archiver.kernel.org>; Sat, 11 Jul 2026 16:53:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1360464.1613322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiawh-0004gN-6V; Sat, 11 Jul 2026 16:52:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1360464.1613322; Sat, 11 Jul 2026 16:52:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiawh-0004gG-2z; Sat, 11 Jul 2026 16:52:55 +0000
Received: by outflank-mailman (input) for mailman id 1360464;
 Sat, 11 Jul 2026 16:52:54 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ljs@kernel.org>) id 1wiawf-0004gA-V0
 for xen-devel@lists.xenproject.org; Sat, 11 Jul 2026 16:52:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiawf-00AC8x-8N
 for xen-devel@lists.xenproject.org; Sat, 11 Jul 2026 18:52:53 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ljs@kernel.org>)
 id 6a52739e-5cb7-0a2a0a5109dd-0a2a450ca8f4-24
 for <xen-devel@lists.xenproject.org>; Sat, 11 Jul 2026 18:52:53 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <ljs@kernel.org>)
 id 6a5274e3-e897-0a2a450c0019-ac6904fe9024-3
 for <xen-devel@lists.xenproject.org>; Sat, 11 Jul 2026 18:52:52 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id D2F3560052;
 Sat, 11 Jul 2026 16:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A36CE1F000E9;
 Sat, 11 Jul 2026 16:52:33 +0000 (UTC)
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
	s=k20260515; t=1783788770;
	bh=5+Xf1bMSkXIMJTYDDjXYIpGx0jZ6tuDdRsUChLmc1jA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GD5EgXpQxjlS4BgytXhuu0DKNfOXI95UIBmT8u8vTWLN8KV7KhFG3Zmjlk9IZStJ0
	 KR/rJOljXFdanDu2Ju/DptezzsTHKy80EcuHZM39Fei1b18GfZiY34ebY3hxctopz9
	 gvnFSjPShteSKooY0iw+x0xgR3Cf925KQiGVWg1A4rsZHwFxfm3bgQE5xX0JwdPBlB
	 +Tg/A3vkLuFYGTa7kkL8I1wMAy+xlY3+uuAHgvr+ArjH3xFFNogvxDp8/tF7Nnmmoy
	 dKpnRq6aW4iMGj9i3sLe5ohAdOH0LwKPvhoh09eZddiNuSwIe2yzxsxY57f7rVk8Lk
	 0S/jqug0BXp3A==
Date: Sat, 11 Jul 2026 17:52:24 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Lucas Stach <l.stach@pengutronix.de>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, Zack Rusin <zack.rusin@broadcom.com>, 
	Matthew Brost <matthew.brost@intel.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Helge Deller <deller@gmx.de>, Benjamin LaHaise <bcrl@kvack.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	David Hildenbrand <david@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	"Liam R . Howlett" <liam@infradead.org>, Nico Pache <npache@redhat.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, Kees Cook <kees@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org, 
	linux-fbdev@vger.kernel.org, linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 11/13] mm/mlock: convert mlock code to use vma_flags_t
Message-ID: <alJ0K9JlFBP7KC2u@lucifer>
References: <cover.1782760670.git.ljs@kernel.org>
 <2db16db81538355ca65f778c246d2381c673cad4.1782760670.git.ljs@kernel.org>
 <DJTO4SXFAKEV.1GVVCX3LZ6R0M@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJTO4SXFAKEV.1GVVCX3LZ6R0M@nvidia.com>
X-purgate-ID: tlsNG-d25034/1783788773-46CEF6B2-C96E8C39/0/0
X-purgate-type: clean
X-purgate-size: 1292

On Wed, Jul 08, 2026 at 10:01:22PM -0400, Zi Yan wrote:
> On Mon Jun 29, 2026 at 3:25 PM EDT, Lorenzo Stoakes wrote:
> > Replace use of the legacy vm_flags_t flags with vma_flags_t values
> > throughout the mlock logic.
> >
> > Additionally update comments to reflect the changes to be consistent.
> >
> > No functional change intended.
> >
> > Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> > ---
> >  mm/mlock.c | 86 +++++++++++++++++++++++++++++-------------------------
> >  1 file changed, 46 insertions(+), 40 deletions(-)
> >
>
> LGTM. What confused me when I was reading the code is VMA_LOCKED_MASK
> and VMA_LOCKED_BIT, since both share the same prefix VMA_LOCKED. Before
> looking at the definition of VMA_LOCKED_MASK, I was wondering when to
> use _BIT or _MASK. But it is just a naming thing.

Yeah, indeed, not great naming there. Was a pre-existing though, and previously
was VM_LOCKED_MASK (also not great :)

The whole VMA_LOCKED_BIT and VMA_LOCK_ON_FAULT_BIT thing is a bit weird anyway,
since you set both and then just use the latter to know not to fault in in
GUP... anyway, can revisit that one later...! :)

>
> Anyway,
>
> Reviewed-by: Zi Yan <ziy@nvidia.com>

Thanks!

>
>
> --
> Best Regards,
> Yan, Zi
>

Cheers, Lorenzo

