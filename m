Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABD8C44500
	for <xen-devel@archiver.kernel.org>; Mon, 29 Jun 2026 19:33:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1348114.1606017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weHjh-0004YU-J8; Mon, 29 Jun 2026 19:33:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348114.1606017; Mon, 29 Jun 2026 19:33:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weHjh-0004Vu-4h; Mon, 29 Jun 2026 19:33:41 +0000
Received: by outflank-mailman (input) for mailman id 1348114;
 Mon, 29 Jun 2026 19:26:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ljs@kernel.org>) id 1weHcn-0001XP-J1
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 19:26:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weHcm-00360l-WE
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 21:26:33 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ljs@kernel.org>)
 id 6a42c6db-bab6-0a2a0a5309dd-0a2a4506dbf6-8
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 21:26:32 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ljs@kernel.org>)
 id 6a42c6e7-08de-0a2a45060019-aceafc1fafa6-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 21:26:32 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 1543A43A16;
 Mon, 29 Jun 2026 19:26:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21CD81F00A3E;
 Mon, 29 Jun 2026 19:26:30 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="From:To:Cc:Subject:Date:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782761191;
	bh=7iylMldrhSOO1IEZlbk7MTKXM0GrQcJsQB4ToBzrfcg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fdO1PP2gxmsSJuRPnWwcheJxMiMKiZBWn90xI79zJaMiV/YAWbO2W0UnkIARGEFmJ
	 bUUypPCeo0RpYETiZpTVAWC1ZJgInCqeTo7CPwT1NJ+iAS/OA2fkIDIiwkzF2IdCxJ
	 H1jkYqazpwvk7cCzjQ8KC3Eq3OzDzM19YONhlNaTINb3vxc5OIdkaX0FQvTizRIsMV
	 fFHMoQDX/6bV24SU/j+ksLGs/hI3k+hEd9nomwhzobiDnGLxs0IIuDY4YCRVYktHIy
	 Ns0cVUa1HvnaEuLjD4poIn0XFh/n+4WbEqsH7icPumiQlF5blcflwYpgekG7KvEtiI
	 s5/n6ZeMI4APw==
From: Lorenzo Stoakes <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Lucas Stach <l.stach@pengutronix.de>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Helge Deller <deller@gmx.de>,
	Benjamin LaHaise <bcrl@kvack.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Hugh Dickins <hughd@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Kees Cook <kees@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
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
Subject: [PATCH 12/13] mm/mprotect: convert mprotect code to use vma_flags_t
Date: Mon, 29 Jun 2026 20:25:35 +0100
Message-ID: <7ef626d8a12dc742cfc09d080be5dc09850e873a.1782760670.git.ljs@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782760670.git.ljs@kernel.org>
References: <cover.1782760670.git.ljs@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1782761192-4312768D-57682669/0/0
X-purgate-type: clean
X-purgate-size: 2987

Replace use of the legacy vm_flags_t flags with vma_flags_t values
throughout the mprotect logic.

Note that we retain the legacy vm_flags_t bit shifting code in
do_mprotect_key(), deferring a vma_flags_t approach to this for the time
being.

Additionally update comments to reflect the changes to be consistent.

No functional change intended.

Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
 mm/mprotect.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/mm/mprotect.c b/mm/mprotect.c
index 9cbf932b028c..c9504b2a2525 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -40,7 +40,7 @@
 
 static bool maybe_change_pte_writable(struct vm_area_struct *vma, pte_t pte)
 {
-	if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE)))
+	if (WARN_ON_ONCE(!vma_test(vma, VMA_WRITE_BIT)))
 		return false;
 
 	/* Don't touch entries that are not even readable. */
@@ -97,7 +97,7 @@ static bool can_change_shared_pte_writable(struct vm_area_struct *vma,
 bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
 			     pte_t pte)
 {
-	if (!(vma->vm_flags & VM_SHARED))
+	if (!vma_test(vma, VMA_SHARED_BIT))
 		return can_change_private_pte_writable(vma, addr, pte);
 
 	return can_change_shared_pte_writable(vma, pte);
@@ -194,7 +194,7 @@ static __always_inline void set_write_prot_commit_flush_ptes(struct vm_area_stru
 {
 	bool set_write;
 
-	if (vma->vm_flags & VM_SHARED) {
+	if (vma_test(vma, VMA_SHARED_BIT)) {
 		set_write = can_change_shared_pte_writable(vma, ptent);
 		prot_commit_flush_ptes(vma, addr, ptep, oldpte, ptent, nr_ptes,
 				       /* idx = */ 0, set_write, tlb);
@@ -811,8 +811,8 @@ mprotect_fixup(struct vma_iterator *vmi, struct mmu_gather *tlb,
 		vm_unacct_memory(nrpages);
 
 	/*
-	 * Private VM_LOCKED VMA becoming writable: trigger COW to avoid major
-	 * fault on access.
+	 * Private VMA_LOCKED_BIT VMA becoming writable: trigger COW to avoid
+	 * major fault on access.
 	 */
 	if (vma_flags_test(&new_vma_flags, VMA_WRITE_BIT) &&
 	    vma_flags_test(&old_vma_flags, VMA_LOCKED_BIT) &&
@@ -886,7 +886,7 @@ static int do_mprotect_pkey(unsigned long start, size_t len,
 			goto out;
 		start = vma->vm_start;
 		error = -EINVAL;
-		if (!(vma->vm_flags & VM_GROWSDOWN))
+		if (!vma_test(vma, VMA_GROWSDOWN_BIT))
 			goto out;
 	} else {
 		if (vma->vm_start > start)
@@ -894,7 +894,7 @@ static int do_mprotect_pkey(unsigned long start, size_t len,
 		if (unlikely(grows & PROT_GROWSUP)) {
 			end = vma->vm_end;
 			error = -EINVAL;
-			if (!(vma->vm_flags & VM_GROWSUP))
+			if (!vma_test(vma, VMA_GROWSUP_BIT))
 				goto out;
 		}
 	}
@@ -918,7 +918,7 @@ static int do_mprotect_pkey(unsigned long start, size_t len,
 		}
 
 		/* Does the application expect PROT_READ to imply PROT_EXEC */
-		if (rier && (vma->vm_flags & VM_MAYEXEC))
+		if (rier && vma_test(vma, VMA_MAYEXEC_BIT))
 			prot |= PROT_EXEC;
 
 		/*
-- 
2.54.0


