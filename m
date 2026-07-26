Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C811C53219
	for <xen-devel@archiver.kernel.org>; Sun, 26 Jul 2026 19:46:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371213.1618873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wo4nX-0005zp-4V; Sun, 26 Jul 2026 19:46:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371213.1618873; Sun, 26 Jul 2026 19:46:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wo4nX-0005zg-1P; Sun, 26 Jul 2026 19:46:07 +0000
Received: by outflank-mailman (input) for mailman id 1371213;
 Sun, 26 Jul 2026 19:46:06 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ze.huang@oss.qualcomm.com>) id 1wo4nW-0005wI-4H
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2026 19:46:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wo4nV-00Bkl9-HN
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2026 21:46:05 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a6663cc-e002-0a2a0a5209dd-0a2a4502d81e-32
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 21:46:05 +0200
Received: from [205.220.168.131] (helo=mx0a-0031df01.pphosted.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a6663fb-6ca4-0a2a45020019-cddca883515e-3
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 21:46:05 +0200
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66QH8IcX1527745
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 19:46:03 GMT
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmm3sbp2r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 19:46:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-38e7b87ce77so5058583a91.0
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 12:46:02 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38f03b0eaa8sm4105998a91.8.2026.07.26.12.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2026 12:46:00 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=qcppdkim1 header.d=qualcomm.com header.i="@qualcomm.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-Id:MIME-Version:References:Subject:To"; dkim=pass header.s=google header.d=oss.qualcomm.com header.i="@oss.qualcomm.com" header.h="Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SZXoBChzns6xQdNb4HgZdv4bepAswU/wjM3061XMqlo=; b=O82oYMACwKC0mT9h
	woXRMDLyHeliuxVcUGvUxVvOwEsT6m+/ZqnHT01/XQUDRllrdyST0RVM6BgSdgTb
	3WNWchYfO+bqEH6TdtwTt268lP1N7ns6aiASsHgdzdNujircUG2vLpayIV9Qjek7
	+HGxn/BRlmAEXoqWaHW3sR9Oq62wnupkx68EYs7xvm8X88W1Wzgj0xC/VIsovHzK
	nkUtYsZIKzR+zT3PxPPxvK+LvaLg5e8ar29lnKgKMI9AUdGC5TbSfyHvbSAzUzNb
	JbjO6jMgdRCaVCPbaNi5/Juwd/jQGbDJ2O0Gm5rJEsV8rsJUyLm8gwqM/B/KSUR9
	7Cgd6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785095162; x=1785699962; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SZXoBChzns6xQdNb4HgZdv4bepAswU/wjM3061XMqlo=;
        b=G8vCOPyNplFi7fQt6r8ctK8OnZ7vGsqjjYuC9JcGtGldWiMO2VanVJ7FzqknnnKHoI
         Vde49Ys+Vfutpon0FqEzvcdMvE/+0iP7uBYkZ5ojK5dE2mSGn62P5WvwyixeK7T6WtzD
         ON9CrhTrNvwQBrAsYO9z4cI58hGYFY9Y3dlQTD+OmuIn7ikRzq17LN1Ift3AiUPT4TTx
         nuFWzkj8aOPg5nCNjV7KE8U3zwwlc24hF+BAGo8AxBWLCY75JGdbn9k/eFIdl2zr8zdq
         pTzeEHOAY1VVKgZGwo4Kfoyy+dSuLeKqMZgln57wGpEtLv1UZ5Db70JjaNLY5b+vmzB8
         96vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785095162; x=1785699962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SZXoBChzns6xQdNb4HgZdv4bepAswU/wjM3061XMqlo=;
        b=sjQFZlhkyI+3eKbnzGtNcctSkNTxyNCF+b8VzhQnbmmJCBSB7kQ6sJ0gkdMVEho/Ls
         l8O/ZqeTRf5vYoFuiZJ5giiboCHLVpS4Kn3wgzV5EWvVNCWWAg+LGGelyzl1PMI9feJm
         yqf1OiPDCF52/BJtMzqhoFjvZUhAb40BOKX9t58qpH0iPIx79ARkBLHErP/KVEf5VTrM
         +Z68paby1hWtBSj6EnFFQSz/BTQnTETpoeMNynTVPxyEfNQ9Gfab8EJsGzY/S2KbgD4+
         I7RiNsp8h2aH4eLmcs+qNMmmKqJqEa2C2xqsTe3YLixT/0qWY0gb4uwjNEjnHjBDLLph
         7gRQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq+0n5wei1vwLmuEq/HiigfkQUVhVqWlA+fik/z5g+Sw5nOtcT3ylRusTwekCMX8xZrGScywuiWS8Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyvHkRx7woS21JUQ3WnWaucxIgs6qHugJIwCuujm+jkIljGrZBf
	oAW6rjb47SY957VezXZ+7PVQxARjq1cp0vv6dV5Wqq3JbGdZkfgQ4AzchPouAMaBzi1lcvgWvW0
	wCEt7rDIZQGDge/sknYYjOm0KbcaQEWr/Lf5HtZxZHLucb2yXslKx2eJnKxECGzpsP5JR6g==
X-Gm-Gg: AR+sD101jJjMLQ0tjANcH8d+2+AYPYJ8Pi+a1wglD8n0H19AHIdN8XThN6JMghE7KHN
	jtGvBPr7N92QeALBoResG0Z+g1C9q6BFqsZlfQ7/T8vc6PfEOVYl3iOnx5T/dfbWZfZ+eQofSSg
	+aplP18qj/RJQOcQBPKU9Or7Sy037TiqGgnnluAr5DhgXvleBUwInVvh3GcIr1aJH/inY1fAYfS
	oY/KWNr9Pk+0kxgW7Tw4kkhO3R7Tvopx6ZOhYBleh/14DY/Mk6Qofp5zsh6dirHuftJMLHmdOEN
	MqjRasb4JF4AcoFoxvr9R5Rwg2bEZoG1pmP1E1jjHONLWL3rF+yvo5HObHbiADUd475tlWcnKP6
	4Rk3UNoJFO3kiQE0P2a+D
X-Received: by 2002:a17:90b:2604:b0:37f:9ce1:cda8 with SMTP id 98e67ed59e1d1-38f297802c7mr5136056a91.30.1785095161865;
        Sun, 26 Jul 2026 12:46:01 -0700 (PDT)
X-Received: by 2002:a17:90b:2604:b0:37f:9ce1:cda8 with SMTP id 98e67ed59e1d1-38f297802c7mr5136018a91.30.1785095161243;
        Sun, 26 Jul 2026 12:46:01 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 03:45:16 +0800
Subject: [PATCH v3 3/8] drm/mcde: replace struct drm_simple_display_pipe
 with regular atomic helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-drm-simple-kms-removal-v3-3-cd5dc89858c6@oss.qualcomm.com>
References: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com>
In-Reply-To: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com>
To: Alexey Brodkin <abrodkin@synopsys.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        Alex Lanzano <lanzano.alex@gmail.com>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, xen-devel@lists.xenproject.org,
        Ze Huang <ze.huang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785095128; l=15608;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=cG5eqORbwgLjytGSt4bgAB7iRWGJSRJOK/O7QjULDRQ=;
 b=dUv1z+8IsrXCEJL6IHnCBSpQNODfXvTKqNt5CIq2WKVnxYyxmosBGI+eSjoRCN3YWUn8RIHt+
 hGEPH0SXwp+CbxHEcC0emaV04jGmPMLiA/haus+5DmswysajzWCM2NM
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfX0xrjaJh7rG2U
 7c5DZ+0FE8y98IJD5IfWk7Pqlu0RJgZvZVNCcBVFDhFZ3ZIk0T7Zm03DU+DhrQ87wnt+AOIq5tQ
 gYqNontFV5Pc5LF2iuHOcYWH+Qz7mwdButZ1wo8K6HumY8WTzxcu1Q/IkHV6/sxMBBe7HnBZ9fc
 q3NkseIaZfWt0+rhZOGgRIhN94maAxj+y+GERkb0Vef8IfpIE7ShsS0OihR5NWxo7IoHhCZ5b+J
 lPdQ2isjcJ/xsGOB0i5+cg+3hpyGbfYuOtvnQasktq6glWki2WJXW0RAxunp389rfsJB9Gw2EWE
 U5+tm+/WCHg15sUShE4rTqAXVFnzEjDrPzmylgGDKFZ+Au0lAnipdwOcqEz267FEGqg+D+ltUUO
 JfoPzaIDC8vPuK9MPUbhpGjF3i2uDSZutcfu79Belav565VDCsaKQRHucbWZYEKjQ2zqaKU83hZ
 IbiurFJmqeVOZPY/SAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfX+5gPvo/OfxmQ
 xahhuLYGE47cpV/UTsTeqNSmbJRoT5nqYCyutHQIW+POZnLtWoDft/W2IYySNUDLkmsOfCtRMpK
 pfkK86mJQchIX2ju/dy0FrxglbcVxpo=
X-Proofpoint-ORIG-GUID: 1-N1iiWn0mgzCnxzCWx7f94bgupmZ16U
X-Proofpoint-GUID: 1-N1iiWn0mgzCnxzCWx7f94bgupmZ16U
X-Authority-Analysis: v=2.4 cv=KanidwYD c=1 sm=1 tr=0 ts=6a6663fa cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=CXBmYrQIWaHMVGb9AFMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260200
X-purgate-ID: tlsNG-720697/1785095165-F3CBA2AC-082AF708/0/0
X-purgate-type: clean
X-purgate-size: 15610

Convert MCDE to explicit plane, CRTC and encoder objects.

Handle pending page-flip events from the CRTC atomic flush path using the
commit-local CRTC state, and avoid manual connector/encoder attachment
before the connector has been created by the bridge path.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>

---
Changes in v3:
- Move the one-shot flow start to CRTC atomic_flush(), after pending event
  handling.
- Move the MCDE container helper to the header as static inline.
---
 drivers/gpu/drm/mcde/mcde_display.c | 248 +++++++++++++++++++++++-------------
 drivers/gpu/drm/mcde/mcde_drm.h     |  12 +-
 drivers/gpu/drm/mcde/mcde_drv.c     |   3 +-
 3 files changed, 172 insertions(+), 91 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
index 257a6e84dd58..50c90cf84a9a 100644
--- a/drivers/gpu/drm/mcde/mcde_display.c
+++ b/drivers/gpu/drm/mcde/mcde_display.c
@@ -10,6 +10,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/media-bus-format.h>
 
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_device.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
@@ -18,7 +19,6 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_print.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_vblank.h>
 #include <video/mipi_display.h>
@@ -132,7 +132,7 @@ void mcde_display_irq(struct mcde *mcde)
 	writel(mispp, mcde->regs + MCDE_RISPP);
 
 	if (vblank)
-		drm_crtc_handle_vblank(&mcde->pipe.crtc);
+		drm_crtc_handle_vblank(&mcde->crtc);
 
 	if (misovl)
 		dev_info(mcde->dev, "some stray overlay IRQ %08x\n", misovl);
@@ -157,40 +157,59 @@ void mcde_display_disable_irqs(struct mcde *mcde)
 	writel(0xFFFFFFFF, mcde->regs + MCDE_RISCHNL);
 }
 
-static int mcde_display_check(struct drm_simple_display_pipe *pipe,
-			      struct drm_plane_state *pstate,
-			      struct drm_crtc_state *cstate)
+static int mcde_plane_helper_atomic_check(struct drm_plane *plane,
+					  struct drm_atomic_commit *commit)
 {
-	const struct drm_display_mode *mode = &cstate->mode;
-	struct drm_framebuffer *old_fb = pipe->plane.state->fb;
+	struct drm_plane_state *pstate = drm_atomic_get_new_plane_state(commit, plane);
+	struct drm_plane_state *old_pstate = drm_atomic_get_old_plane_state(commit, plane);
+	struct drm_crtc_state *cstate = NULL;
+	const struct drm_display_mode *mode;
+	struct drm_framebuffer *old_fb = old_pstate->fb;
 	struct drm_framebuffer *fb = pstate->fb;
+	int ret;
 
-	if (fb) {
-		u32 offset = drm_fb_dma_get_gem_addr(fb, pstate, 0);
+	if (pstate->crtc) {
+		cstate = drm_atomic_get_crtc_state(commit, pstate->crtc);
+		if (IS_ERR(cstate))
+			return PTR_ERR(cstate);
+	}
 
-		/* FB base address must be dword aligned. */
-		if (offset & 3) {
-			DRM_DEBUG_KMS("FB not 32-bit aligned\n");
-			return -EINVAL;
-		}
+	ret = drm_atomic_helper_check_plane_state(pstate, cstate,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  false, false);
+	if (ret)
+		return ret;
 
-		/*
-		 * There's no pitch register, the mode's hdisplay
-		 * controls this.
-		 */
-		if (fb->pitches[0] != mode->hdisplay * fb->format->cpp[0]) {
-			DRM_DEBUG_KMS("can't handle pitches\n");
-			return -EINVAL;
-		}
+	if (!pstate->visible || !fb)
+		return 0;
 
-		/*
-		 * We can't change the FB format in a flicker-free
-		 * manner (and only update it during CRTC enable).
-		 */
-		if (old_fb && old_fb->format != fb->format)
-			cstate->mode_changed = true;
+	mode = &cstate->mode;
+
+	u32 offset = drm_fb_dma_get_gem_addr(fb, pstate, 0);
+
+	/* FB base address must be dword aligned. */
+	if (offset & 3) {
+		DRM_DEBUG_KMS("FB not 32-bit aligned\n");
+		return -EINVAL;
 	}
 
+	/*
+	 * There's no pitch register, the mode's hdisplay
+	 * controls this.
+	 */
+	if (fb->pitches[0] != mode->hdisplay * fb->format->cpp[0]) {
+		DRM_DEBUG_KMS("can't handle pitches\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * We can't change the FB format in a flicker-free
+	 * manner (and only update it during CRTC enable).
+	 */
+	if (old_fb && old_fb->format != fb->format)
+		cstate->mode_changed = true;
+
 	return 0;
 }
 
@@ -1149,16 +1168,15 @@ static void mcde_setup_dsi(struct mcde *mcde, const struct drm_display_mode *mod
 	*dsi_formatter_frame = formatter_frame;
 }
 
-static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
-				struct drm_crtc_state *cstate,
-				struct drm_plane_state *plane_state)
+static void mcde_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					   struct drm_atomic_commit *commit)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_plane *plane = &pipe->plane;
 	struct drm_device *drm = crtc->dev;
 	struct mcde *mcde = to_mcde(drm);
+	struct drm_crtc_state *cstate = drm_atomic_get_new_crtc_state(commit, crtc);
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(commit, &mcde->plane);
 	const struct drm_display_mode *mode = &cstate->mode;
-	struct drm_framebuffer *fb = plane->state->fb;
+	struct drm_framebuffer *fb = plane_state->fb;
 	u32 format = fb->format->format;
 	int dsi_pkt_size;
 	int fifo_wtrmrk;
@@ -1298,9 +1316,10 @@ static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
 	dev_info(drm->dev, "MCDE display is enabled\n");
 }
 
-static void mcde_display_disable(struct drm_simple_display_pipe *pipe)
+static void mcde_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+					    struct drm_atomic_commit *commit)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
+	struct drm_crtc_state *cstate = drm_atomic_get_new_crtc_state(commit, crtc);
 	struct drm_device *drm = crtc->dev;
 	struct mcde *mcde = to_mcde(drm);
 	struct drm_pending_vblank_event *event;
@@ -1318,9 +1337,9 @@ static void mcde_display_disable(struct drm_simple_display_pipe *pipe)
 		mcde_dsi_disable(mcde->bridge);
 	}
 
-	event = crtc->state->event;
+	event = cstate->event;
 	if (event) {
-		crtc->state->event = NULL;
+		cstate->event = NULL;
 
 		spin_lock_irq(&crtc->dev->event_lock);
 		drm_crtc_send_vblank_event(crtc, event);
@@ -1381,24 +1400,46 @@ static void mcde_set_extsrc(struct mcde *mcde, u32 buffer_address)
 	writel(buffer_address + mcde->stride, mcde->regs + MCDE_EXTSRCXA1);
 }
 
-static void mcde_display_update(struct drm_simple_display_pipe *pipe,
-				struct drm_plane_state *old_pstate)
+static void mcde_plane_helper_atomic_update(struct drm_plane *plane,
+					    struct drm_atomic_commit *commit)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_device *drm = crtc->dev;
-	struct mcde *mcde = to_mcde(drm);
-	struct drm_pending_vblank_event *event = crtc->state->event;
-	struct drm_plane *plane = &pipe->plane;
-	struct drm_plane_state *pstate = plane->state;
+	struct drm_plane_state *pstate = drm_atomic_get_new_plane_state(commit, plane);
+	struct mcde *mcde = to_mcde(plane->dev);
 	struct drm_framebuffer *fb = pstate->fb;
 
+	/*
+	 * We do not start sending framebuffer updates before the
+	 * display is enabled. Update events will however be dispatched
+	 * from the DRM core before the display is enabled.
+	 */
+	if (fb) {
+		mcde_set_extsrc(mcde, drm_fb_dma_get_gem_addr(fb, pstate, 0));
+		dev_info_once(mcde->dev, "first update of display contents\n");
+	} else {
+		/*
+		 * If an update is receieved before the MCDE is enabled
+		 * (before mcde_display_enable() is called) we can't really
+		 * do much with that buffer.
+		 */
+		dev_info(mcde->dev, "ignored a display update\n");
+	}
+}
+
+static void mcde_crtc_helper_atomic_flush(struct drm_crtc *crtc,
+					  struct drm_atomic_commit *commit)
+{
+	struct mcde *mcde = to_mcde(crtc->dev);
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(commit, &mcde->plane);
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(commit, crtc);
+	struct drm_pending_vblank_event *event = crtc_state->event;
+
 	/*
 	 * Handle any pending event first, we need to arm the vblank
 	 * interrupt before sending any update to the display so we don't
 	 * miss the interrupt.
 	 */
 	if (event) {
-		crtc->state->event = NULL;
+		crtc_state->event = NULL;
 
 		spin_lock_irq(&crtc->dev->event_lock);
 		/*
@@ -1408,7 +1449,7 @@ static void mcde_display_update(struct drm_simple_display_pipe *pipe,
 		 * until we get an update. If MCDE output isn't yet enabled,
 		 * we just send a vblank dummy event back.
 		 */
-		if (crtc->state->active && drm_crtc_vblank_get(crtc) == 0) {
+		if (crtc_state->active && drm_crtc_vblank_get(crtc) == 0) {
 			dev_dbg(mcde->dev, "arm vblank event\n");
 			drm_crtc_arm_vblank_event(crtc, event);
 		} else {
@@ -1419,33 +1460,12 @@ static void mcde_display_update(struct drm_simple_display_pipe *pipe,
 		spin_unlock_irq(&crtc->dev->event_lock);
 	}
 
-	/*
-	 * We do not start sending framebuffer updates before the
-	 * display is enabled. Update events will however be dispatched
-	 * from the DRM core before the display is enabled.
-	 */
-	if (fb) {
-		mcde_set_extsrc(mcde, drm_fb_dma_get_gem_addr(fb, pstate, 0));
-		dev_info_once(mcde->dev, "first update of display contents\n");
-		/*
-		 * Usually the flow is already active, unless we are in
-		 * oneshot mode, then we need to kick the flow right here.
-		 */
-		if (mcde->flow_active == 0)
-			mcde_start_flow(mcde);
-	} else {
-		/*
-		 * If an update is receieved before the MCDE is enabled
-		 * (before mcde_display_enable() is called) we can't really
-		 * do much with that buffer.
-		 */
-		dev_info(mcde->dev, "ignored a display update\n");
-	}
+	if (crtc_state->active && plane_state && plane_state->fb && mcde->flow_active == 0)
+		mcde_start_flow(mcde);
 }
 
-static int mcde_display_enable_vblank(struct drm_simple_display_pipe *pipe)
+static int mcde_crtc_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_device *drm = crtc->dev;
 	struct mcde *mcde = to_mcde(drm);
 	u32 val;
@@ -1462,9 +1482,8 @@ static int mcde_display_enable_vblank(struct drm_simple_display_pipe *pipe)
 	return 0;
 }
 
-static void mcde_display_disable_vblank(struct drm_simple_display_pipe *pipe)
+static void mcde_crtc_disable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_device *drm = crtc->dev;
 	struct mcde *mcde = to_mcde(drm);
 
@@ -1474,13 +1493,55 @@ static void mcde_display_disable_vblank(struct drm_simple_display_pipe *pipe)
 	writel(0xFFFFFFFF, mcde->regs + MCDE_RISPP);
 }
 
-static struct drm_simple_display_pipe_funcs mcde_display_funcs = {
-	.check = mcde_display_check,
-	.enable = mcde_display_enable,
-	.disable = mcde_display_disable,
-	.update = mcde_display_update,
-	.enable_vblank = mcde_display_enable_vblank,
-	.disable_vblank = mcde_display_disable_vblank,
+static int mcde_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_commit *commit)
+{
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(commit, crtc);
+	int ret;
+
+	if (crtc_state->enable) {
+		ret = drm_atomic_helper_check_crtc_primary_plane(crtc_state);
+		if (ret)
+			return ret;
+	}
+
+	return drm_atomic_add_affected_planes(commit, crtc);
+}
+
+static const struct drm_crtc_funcs mcde_crtc_funcs = {
+	.reset			= drm_atomic_helper_crtc_reset,
+	.destroy		= drm_crtc_cleanup,
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+	.enable_vblank		= mcde_crtc_enable_vblank,
+	.disable_vblank		= mcde_crtc_disable_vblank,
+};
+
+static const struct drm_crtc_helper_funcs mcde_crtc_helper_funcs = {
+	.atomic_check	= mcde_crtc_helper_atomic_check,
+	.atomic_enable	= mcde_crtc_helper_atomic_enable,
+	.atomic_disable	= mcde_crtc_helper_atomic_disable,
+	.atomic_flush	= mcde_crtc_helper_atomic_flush,
+};
+
+static const struct drm_plane_funcs mcde_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.reset			= drm_atomic_helper_plane_reset,
+	.destroy		= drm_plane_cleanup,
+	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+};
+
+static const struct drm_plane_helper_funcs mcde_plane_helper_funcs = {
+	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
+	.atomic_check	= mcde_plane_helper_atomic_check,
+	.atomic_update	= mcde_plane_helper_atomic_update,
+};
+
+static const struct drm_encoder_funcs mcde_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
 };
 
 int mcde_display_init(struct drm_device *drm)
@@ -1510,14 +1571,29 @@ int mcde_display_init(struct drm_device *drm)
 	if (ret)
 		return ret;
 
-	ret = drm_simple_display_pipe_init(drm, &mcde->pipe,
-					   &mcde_display_funcs,
-					   formats, ARRAY_SIZE(formats),
-					   NULL,
-					   mcde->connector);
+	ret = drm_universal_plane_init(drm, &mcde->plane, 0,
+				       &mcde_plane_funcs,
+				       formats, ARRAY_SIZE(formats),
+				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+
+	drm_plane_helper_add(&mcde->plane, &mcde_plane_helper_funcs);
+
+	ret = drm_crtc_init_with_planes(drm, &mcde->crtc, &mcde->plane,
+					NULL, &mcde_crtc_funcs, NULL);
 	if (ret)
 		return ret;
 
+	drm_crtc_helper_add(&mcde->crtc, &mcde_crtc_helper_funcs);
+
+	ret = drm_encoder_init(drm, &mcde->encoder, &mcde_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ret;
+
+	mcde->encoder.possible_crtcs = drm_crtc_mask(&mcde->crtc);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mcde_display_init);
diff --git a/drivers/gpu/drm/mcde/mcde_drm.h b/drivers/gpu/drm/mcde/mcde_drm.h
index ecb70b4b737c..edbb4580a7d8 100644
--- a/drivers/gpu/drm/mcde/mcde_drm.h
+++ b/drivers/gpu/drm/mcde/mcde_drm.h
@@ -4,7 +4,7 @@
  * Parts of this file were based on the MCDE driver by Marcus Lorentzon
  * (C) ST-Ericsson SA 2013
  */
-#include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_encoder.h>
 
 #ifndef _MCDE_DRM_H_
 #define _MCDE_DRM_H_
@@ -72,7 +72,9 @@ struct mcde {
 	struct drm_panel *panel;
 	struct drm_bridge *bridge;
 	struct drm_connector *connector;
-	struct drm_simple_display_pipe pipe;
+	struct drm_plane plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
 	struct mipi_dsi_device *mdsi;
 	bool dpi_output;
 	s16 stride;
@@ -95,7 +97,11 @@ struct mcde {
 	struct regulator *vana;
 };
 
-#define to_mcde(dev) container_of(dev, struct mcde, drm)
+static inline struct mcde *to_mcde(struct drm_device *dev)
+{
+	return container_of(dev, struct mcde, drm);
+}
+
 
 static inline bool mcde_flow_is_video(struct mcde *mcde)
 {
diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 5f2c462bad7e..401cf8ab83bc 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -186,8 +186,7 @@ static int mcde_modeset_init(struct drm_device *drm)
 	}
 
 	/* Attach the bridge. */
-	ret = drm_simple_display_pipe_attach_bridge(&mcde->pipe,
-						    mcde->bridge);
+	ret = drm_bridge_attach(&mcde->encoder, mcde->bridge, NULL, 0);
 	if (ret) {
 		dev_err(drm->dev, "failed to attach display output bridge\n");
 		return ret;

-- 
2.43.0


