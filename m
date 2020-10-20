Return-Path: <SRS0=M+rI=D3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7BBCC64E8A
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2020 12:21:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A421422409
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2020 12:21:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A421422409
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.9466.24844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUqdV-0004VU-CN; Tue, 20 Oct 2020 12:21:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9466.24844; Tue, 20 Oct 2020 12:21:05 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUqdV-0004VL-7r; Tue, 20 Oct 2020 12:21:05 +0000
Received: by outflank-mailman (input) for mailman id 9466;
 Tue, 20 Oct 2020 12:21:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wemb=D3=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1kUqdU-0004KG-4T
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 12:21:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d64b1c76-3357-4cfc-ac32-c0d5546bfa18;
 Tue, 20 Oct 2020 12:20:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F029AB1D0;
 Tue, 20 Oct 2020 12:20:51 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=wemb=D3=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
	id 1kUqdU-0004KG-4T
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 12:21:04 +0000
X-Inumbo-ID: d64b1c76-3357-4cfc-ac32-c0d5546bfa18
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d64b1c76-3357-4cfc-ac32-c0d5546bfa18;
	Tue, 20 Oct 2020 12:20:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id F029AB1D0;
	Tue, 20 Oct 2020 12:20:51 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@linux.ie,
	daniel@ffwll.ch,
	sam@ravnborg.org,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	kraxel@redhat.com,
	l.stach@pengutronix.de,
	linux+etnaviv@armlinux.org.uk,
	christian.gmeiner@gmail.com,
	inki.dae@samsung.com,
	jy0922.shim@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	kgene@kernel.org,
	krzk@kernel.org,
	yuq825@gmail.com,
	bskeggs@redhat.com,
	robh@kernel.org,
	tomeu.vizoso@collabora.com,
	steven.price@arm.com,
	alyssa.rosenzweig@collabora.com,
	hjc@rock-chips.com,
	heiko@sntech.de,
	hdegoede@redhat.com,
	sean@poorly.run,
	eric@anholt.net,
	oleksandr_andrushchenko@epam.com,
	ray.huang@amd.com,
	sumit.semwal@linaro.org,
	emil.velikov@collabora.com,
	luben.tuikov@amd.com,
	apaneers@amd.com,
	linus.walleij@linaro.org,
	melissa.srw@gmail.com,
	chris@chris-wilson.co.uk,
	miaoqinglang@huawei.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org,
	etnaviv@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	lima@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	spice-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v5 01/10] drm/vram-helper: Remove invariant parameters from internal kmap function
Date: Tue, 20 Oct 2020 14:20:37 +0200
Message-Id: <20201020122046.31167-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020122046.31167-1-tzimmermann@suse.de>
References: <20201020122046.31167-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The parameters map and is_iomem are always of the same value. Removed them
to prepares the function for conversion to struct dma_buf_map.

v4:
	* don't check for !kmap->virtual; will always be false

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Christian König <christian.koenig@amd.com>
Tested-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 7aeb5daf2805..bfc059945e31 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -379,32 +379,22 @@ int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo)
 }
 EXPORT_SYMBOL(drm_gem_vram_unpin);
 
-static void *drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo,
-				      bool map, bool *is_iomem)
+static void *drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo)
 {
 	int ret;
 	struct ttm_bo_kmap_obj *kmap = &gbo->kmap;
+	bool is_iomem;
 
 	if (gbo->kmap_use_count > 0)
 		goto out;
 
-	if (kmap->virtual || !map)
-		goto out;
-
 	ret = ttm_bo_kmap(&gbo->bo, 0, gbo->bo.num_pages, kmap);
 	if (ret)
 		return ERR_PTR(ret);
 
 out:
-	if (!kmap->virtual) {
-		if (is_iomem)
-			*is_iomem = false;
-		return NULL; /* not mapped; don't increment ref */
-	}
 	++gbo->kmap_use_count;
-	if (is_iomem)
-		return ttm_kmap_obj_virtual(kmap, is_iomem);
-	return kmap->virtual;
+	return ttm_kmap_obj_virtual(kmap, &is_iomem);
 }
 
 static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo)
@@ -449,7 +439,7 @@ void *drm_gem_vram_vmap(struct drm_gem_vram_object *gbo)
 	ret = drm_gem_vram_pin_locked(gbo, 0);
 	if (ret)
 		goto err_ttm_bo_unreserve;
-	base = drm_gem_vram_kmap_locked(gbo, true, NULL);
+	base = drm_gem_vram_kmap_locked(gbo);
 	if (IS_ERR(base)) {
 		ret = PTR_ERR(base);
 		goto err_drm_gem_vram_unpin_locked;
-- 
2.28.0


