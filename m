Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2EEC53209
	for <xen-devel@archiver.kernel.org>; Sun, 26 Jul 2026 20:00:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371274.1618918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wo51b-0004Ms-JM; Sun, 26 Jul 2026 20:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371274.1618918; Sun, 26 Jul 2026 20:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wo51b-0004Ml-GU; Sun, 26 Jul 2026 20:00:39 +0000
Received: by outflank-mailman (input) for mailman id 1371274;
 Sun, 26 Jul 2026 20:00:38 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ze.huang@oss.qualcomm.com>) id 1wo51a-0004Mf-HN
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2026 20:00:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wo51Z-006DgR-By
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2026 22:00:37 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a666763-2eae-0a2a0a5409dd-0a2a4501cbc0-2
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 22:00:37 +0200
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a66641a-5984-0a2a45010019-cddcb483816a-3
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 21:46:35 +0200
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66QH7Xp61192031
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 19:46:34 GMT
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmjgn3yq7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 19:46:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-38dbf293831so5055555a91.3
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 12:46:33 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38f03b0eaa8sm4105998a91.8.2026.07.26.12.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2026 12:46:31 -0700 (PDT)
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
	RIT/YdveRXHCHmeSie5y94xV6nzoryIRKFmpSYIUXRA=; b=ZwaROpRzU254FZLM
	HzwzK+If0tvXkekx9356vkGBxZeSi+2aP3PkGnsgazA0yGr3Puia8PFG0LDlk3E6
	iBS6B31v84DNIKM8duK51OfoEX9GWarY/AQqKQ+yMqe9p/qOc8sXvlD6G+kDO3cy
	Ijo+6Q76t3fV+6PNh+jzUvrNLwbyAXokTrHgXsKP1zI7QH3td3nClwW5tKKvvyuJ
	ffjsuATkANFvm40D6mIKne63oA5+Z837G23rKEr6rOMa69adOFvPSkBBmpAj4IR/
	OmYz5WJm9byJdrx1o3Tw/Qcf3BJ0WK2qGbL97ModtAOInL2FujpfhUmiw/07V7UV
	6+yO+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785095193; x=1785699993; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RIT/YdveRXHCHmeSie5y94xV6nzoryIRKFmpSYIUXRA=;
        b=bVAwj13d0evcd7OCaUEgqyQ5oa98NM77IuffFa+8B1fS1tCtBu2YCpnTYBE4SJis2K
         OqcNPivx9JiNFg3ecUoOBCZCLfNzQyao3vfzGJcDfreAQYujdk6inkGqkDQZ6o+1VQ6N
         xryVhHwjxW26hM+Hv+jQDYcVtEU2AT7Q844hG3w7l9fS5RkwZLQlqmO8TMiunx/46T1k
         VoSUznUFBbE5n3G6HQmlt/6elNTpU9GFTUbwT1sj3INiNtoM01tsokgvltsezHlMZqna
         2m6nzw4Jj4tmRL69G9FBPaAgr5wN5mPNx1ei3GQPo61WgEzA3DrgRNMRpVg2fDOflALK
         x4Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785095193; x=1785699993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RIT/YdveRXHCHmeSie5y94xV6nzoryIRKFmpSYIUXRA=;
        b=ZDfQXig/ENIdUB+CjUUapDliDPXr7BPsIuxlXoPP+/qmpHyC/0mQ3BEsBjkj+Epsh+
         YtZhN9mpNg90iRN1zrJW+mR7ffUyRo5rIgB40dYfK1hnXjSOYhDbDy6/Q1sEO/7H+Cor
         VvAwmTgfqODKRPUGA3FxPSY8qZUSOwQKvNRFyWg69B49X20G4KbNklaE3J96QG4GWgcs
         KGNVU3tiTa3bwmHIRLRl9NsoLTXl53XD0e+3jmu4sHokbf+nMdSbwi0s8rNebUizBGBD
         JEIZW9fx2IaeVE+QOCMIvqQgh5G3zZS76AcrjQYq1hCY9sv/KGsDu1ewa7CI83cCkbNO
         1Tnw==
X-Forwarded-Encrypted: i=1; AHgh+RpM4F39PWlJQi/e8dBaDR5+49WxSDS/8tf/tZFUyDX21oZWLIM3o3b4p8Vvf44vHxpzjqMGuso9jZA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxMuZYEdetlxUnsNyPpVfl9j5jWDxpJoej9MLR10Hvfci+ItZ0d
	xy2Hhd4poao+QKJg/JmBTSWjNUJv8jDNO136967FTFe619NogZAFt869kpVfMe6MxgumAt4HWEJ
	psorfPsu/1lRuQvPA6yqkB7OSpwLjyH4Gcync64m6Tq9LR4e/SFnoFlf8e8Z6hNUmNIWM8g==
X-Gm-Gg: AR+sD10j87scSAM+UqdMSccUoNa/S9VSG+WP11o0pNIi4FfMsi6UM6mzhFBHYg1n9l3
	Ed+9eUNQ3b2Qp4o2202utjEHvEHUB+QPOcCr57bw1Sr7cWQS0S8/bYMLByCnC2wDYY5YsnvBvts
	ZDL4rf/MIJV2auktMk9if2EY2q9Nk47IhR2FROVDS8dxtOrlclvBfHbq+9yi59UwaWBV1IYiEen
	7lJM4X6uHzXchA3lel3xlZkF8dPdQom6WZtc0OTQrkZy4N4ojB4oDWRfRFoHfWZXhNdJawMsZVn
	FHM3jzPlKRW744q+WIghHfzZPXOO4SXoR700sarNfaYmKKaAPjyN5S9fiqjXIGwY35B2Ycozb9D
	Z+XUOU4mS7IqlS9BoJJBu
X-Received: by 2002:a17:90b:3c8f:b0:381:20b:a9ee with SMTP id 98e67ed59e1d1-38f294ea029mr5694008a91.14.1785095192846;
        Sun, 26 Jul 2026 12:46:32 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8f:b0:381:20b:a9ee with SMTP id 98e67ed59e1d1-38f294ea029mr5693998a91.14.1785095192443;
        Sun, 26 Jul 2026 12:46:32 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 03:45:20 +0800
Subject: [PATCH v3 7/8] drm/tve200: replace struct drm_simple_display_pipe
 with regular atomic helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-drm-simple-kms-removal-v3-7-cd5dc89858c6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785095129; l=12903;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=NmucV5CCjzj7Nlqkd8e6k9piLvqw3AS+j5eg74TtwPQ=;
 b=2v+CnN4SAJOjYYvRfoANU7FsIYuqjDhG+R7/Z9COJbJkOsOkf3MOaQYiiFS2Ybx4cazb/WoAQ
 MzjVTJ1EQJAAulixbZFUGSjnMRDfI90HH9C0hpfOzNpi0EHSUOozr1U
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Proofpoint-GUID: vv7qWripOKH2SEDQDUcMldtip1LGzc16
X-Authority-Analysis: v=2.4 cv=HMHz0Itv c=1 sm=1 tr=0 ts=6a666419 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=dgwnEUiFKTnKxPjcC9oA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDIwMSBTYWx0ZWRfX+9FD0XdqLKq6
 42Mb7YKUG8d9OgGjKp0r/rL2qZ3vmpReLTQLsqxJeAB3MVB4F5ox/VLqdBfCfwmBTHTeu/9tm0Z
 7FMDeT7o7OFPrQDRV5nTb0bBmWqnzhEvlWPn859cgIMv0YGK0aCULsWfVECdBvFNbh1Lv/3g4cP
 t3BZkYDlVWcgakE1jPv+8yq1XR9aDrPuj1MSROBNIdPdmF1kc3BAH3kYCb0e7EU74ACZ7PdbprE
 oKADf76h3dAxp+ZtNgylza4CPwiB9IBxkZLJcImjRxw1hbxfLS2aNdj6kn1TeRFcwhhINNYiDs2
 /lXxhkB+UdgYT5JsjVKNZ5kk1emXBXng8Zt7/XrjoPcZ3reAaq4Ai0ai1XpgXgvrYJFb/+CJQfh
 VqjT3ELb5mBx7RYT1YJjqmyYW494ul7occyN2g64dX36LRxripOx3QQWy1cdBfNgNtQg4q6+9Rt
 C7cWGFPX5lXbuGNF6Sg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDIwMSBTYWx0ZWRfXyE0wUJIczysL
 Cxd8qyRQWYlyDv0qegYZ/+9PfvE5bWEoNMBsqFEoYmXyPzAMmybaQOLzgWuNCmFh9SHLMh99kYC
 0xeOM/J7DXHsrYvyZgb2r0IadMk9vaY=
X-Proofpoint-ORIG-GUID: vv7qWripOKH2SEDQDUcMldtip1LGzc16
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260201
X-purgate-ID: tlsNG-d62444/1785095195-1DC79757-F1EA4EEF/13/0
X-purgate-type: clean
X-purgate-size: 12905

Convert TVE200 to explicit plane, CRTC and encoder objects.

Keep generic plane-state validation before TVE200-specific mode,
alignment, pitch and format-change checks. Install the GEM framebuffer
prepare helper explicitly.

Use commit-local plane state in the CRTC enable path when programming
framebuffer format state.

Move page-flip event handling to the CRTC commit path and wire the CRTC
vblank callbacks explicitly.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>

---
Changes in v3:
- Use commit-local plane state in the CRTC enable path.
---
 drivers/gpu/drm/tve200/tve200_display.c | 219 ++++++++++++++++++++++----------
 drivers/gpu/drm/tve200/tve200_drm.h     |   6 +-
 drivers/gpu/drm/tve200/tve200_drv.c     |  12 +-
 3 files changed, 163 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/tve200/tve200_display.c b/drivers/gpu/drm/tve200/tve200_display.c
index 26b6c65ef6fd..beb3a5a63b5d 100644
--- a/drivers/gpu/drm/tve200/tve200_display.c
+++ b/drivers/gpu/drm/tve200/tve200_display.c
@@ -15,6 +15,8 @@
 #include <linux/of_graph.h>
 #include <linux/delay.h>
 
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
@@ -52,7 +54,7 @@ irqreturn_t tve200_irq(int irq, void *data)
 		val = readl(priv->regs + TVE200_CTRL);
 		/* We have an actual start of vsync */
 		if (!(val & TVE200_VSTSTYPE_BITS)) {
-			drm_crtc_handle_vblank(&priv->pipe.crtc);
+			drm_crtc_handle_vblank(&priv->crtc);
 			/* Toggle trigger to start of active image */
 			val |= TVE200_VSTSTYPE_VAI;
 		} else {
@@ -69,13 +71,34 @@ irqreturn_t tve200_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static int tve200_display_check(struct drm_simple_display_pipe *pipe,
-			       struct drm_plane_state *pstate,
-			       struct drm_crtc_state *cstate)
+static int tve200_plane_helper_atomic_check(struct drm_plane *plane,
+					    struct drm_atomic_commit *commit)
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
+
+	if (pstate->crtc) {
+		cstate = drm_atomic_get_crtc_state(commit, pstate->crtc);
+		if (IS_ERR(cstate))
+			return PTR_ERR(cstate);
+	}
+
+	ret = drm_atomic_helper_check_plane_state(pstate, cstate,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  false, false);
+	if (ret)
+		return ret;
+
+	if (!pstate->visible || !cstate)
+		return 0;
+
+	mode = &cstate->mode;
 
 	/*
 	 * We support these specific resolutions and nothing else.
@@ -119,16 +142,72 @@ static int tve200_display_check(struct drm_simple_display_pipe *pipe,
 	return 0;
 }
 
-static void tve200_display_enable(struct drm_simple_display_pipe *pipe,
-				 struct drm_crtc_state *cstate,
-				 struct drm_plane_state *plane_state)
+static void tve200_plane_helper_atomic_update(struct drm_plane *plane,
+					      struct drm_atomic_commit *commit)
+{
+	struct tve200_drm_dev_private *priv = plane->dev->dev_private;
+	struct drm_plane_state *pstate = drm_atomic_get_new_plane_state(commit, plane);
+	struct drm_framebuffer *fb = pstate->fb;
+
+	if (!fb)
+		return;
+
+	/* For RGB, the Y component is used as base address */
+	writel(drm_fb_dma_get_gem_addr(fb, pstate, 0),
+	       priv->regs + TVE200_Y_FRAME_BASE_ADDR);
+
+	/* For three plane YUV we need two more addresses */
+	if (fb->format->format == DRM_FORMAT_YUV420) {
+		writel(drm_fb_dma_get_gem_addr(fb, pstate, 1),
+		       priv->regs + TVE200_U_FRAME_BASE_ADDR);
+		writel(drm_fb_dma_get_gem_addr(fb, pstate, 2),
+		       priv->regs + TVE200_V_FRAME_BASE_ADDR);
+	}
+}
+
+static void tve200_crtc_helper_atomic_flush(struct drm_crtc *crtc,
+					    struct drm_atomic_commit *commit)
+{
+	struct drm_crtc_state *cstate = drm_atomic_get_new_crtc_state(commit, crtc);
+	struct drm_pending_vblank_event *event = cstate->event;
+
+	if (!event)
+		return;
+
+	cstate->event = NULL;
+
+	spin_lock_irq(&crtc->dev->event_lock);
+	if (cstate->active && drm_crtc_vblank_get(crtc) == 0)
+		drm_crtc_arm_vblank_event(crtc, event);
+	else
+		drm_crtc_send_vblank_event(crtc, event);
+	spin_unlock_irq(&crtc->dev->event_lock);
+}
+
+static const struct drm_plane_helper_funcs tve200_plane_helper_funcs = {
+	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
+	.atomic_check	= tve200_plane_helper_atomic_check,
+	.atomic_update	= tve200_plane_helper_atomic_update,
+};
+
+static const struct drm_plane_funcs tve200_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.destroy		= drm_plane_cleanup,
+	.reset			= drm_atomic_helper_plane_reset,
+	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+};
+
+static void tve200_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					     struct drm_atomic_commit *commit)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_plane *plane = &pipe->plane;
 	struct drm_device *drm = crtc->dev;
 	struct tve200_drm_dev_private *priv = drm->dev_private;
+	struct drm_crtc_state *cstate = drm_atomic_get_new_crtc_state(commit, crtc);
 	const struct drm_display_mode *mode = &cstate->mode;
-	struct drm_framebuffer *fb = plane->state->fb;
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(commit, &priv->plane);
+	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_connector *connector = priv->connector;
 	u32 format = fb->format->format;
 	u32 ctrl1 = 0;
@@ -240,9 +319,9 @@ static void tve200_display_enable(struct drm_simple_display_pipe *pipe,
 	drm_crtc_vblank_on(crtc);
 }
 
-static void tve200_display_disable(struct drm_simple_display_pipe *pipe)
+static void tve200_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+					      struct drm_atomic_commit *commit)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_device *drm = crtc->dev;
 	struct tve200_drm_dev_private *priv = drm->dev_private;
 
@@ -255,46 +334,8 @@ static void tve200_display_disable(struct drm_simple_display_pipe *pipe)
 	clk_disable_unprepare(priv->clk);
 }
 
-static void tve200_display_update(struct drm_simple_display_pipe *pipe,
-				 struct drm_plane_state *old_pstate)
+static int tve200_crtc_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_device *drm = crtc->dev;
-	struct tve200_drm_dev_private *priv = drm->dev_private;
-	struct drm_pending_vblank_event *event = crtc->state->event;
-	struct drm_plane *plane = &pipe->plane;
-	struct drm_plane_state *pstate = plane->state;
-	struct drm_framebuffer *fb = pstate->fb;
-
-	if (fb) {
-		/* For RGB, the Y component is used as base address */
-		writel(drm_fb_dma_get_gem_addr(fb, pstate, 0),
-		       priv->regs + TVE200_Y_FRAME_BASE_ADDR);
-
-		/* For three plane YUV we need two more addresses */
-		if (fb->format->format == DRM_FORMAT_YUV420) {
-			writel(drm_fb_dma_get_gem_addr(fb, pstate, 1),
-			       priv->regs + TVE200_U_FRAME_BASE_ADDR);
-			writel(drm_fb_dma_get_gem_addr(fb, pstate, 2),
-			       priv->regs + TVE200_V_FRAME_BASE_ADDR);
-		}
-	}
-
-	if (event) {
-		crtc->state->event = NULL;
-
-		spin_lock_irq(&crtc->dev->event_lock);
-		if (crtc->state->active && drm_crtc_vblank_get(crtc) == 0)
-			drm_crtc_arm_vblank_event(crtc, event);
-		else
-			drm_crtc_send_vblank_event(crtc, event);
-		spin_unlock_irq(&crtc->dev->event_lock);
-	}
-}
-
-static int tve200_display_enable_vblank(struct drm_simple_display_pipe *pipe)
-{
-	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_device *drm = crtc->dev;
 	struct tve200_drm_dev_private *priv = drm->dev_private;
 
@@ -304,22 +345,48 @@ static int tve200_display_enable_vblank(struct drm_simple_display_pipe *pipe)
 	return 0;
 }
 
-static void tve200_display_disable_vblank(struct drm_simple_display_pipe *pipe)
+static void tve200_crtc_disable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_device *drm = crtc->dev;
 	struct tve200_drm_dev_private *priv = drm->dev_private;
 
 	writel(0, priv->regs + TVE200_INT_EN);
 }
 
-static const struct drm_simple_display_pipe_funcs tve200_display_funcs = {
-	.check = tve200_display_check,
-	.enable = tve200_display_enable,
-	.disable = tve200_display_disable,
-	.update = tve200_display_update,
-	.enable_vblank = tve200_display_enable_vblank,
-	.disable_vblank = tve200_display_disable_vblank,
+static int tve200_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_commit *commit)
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
+static const struct drm_crtc_helper_funcs tve200_crtc_helper_funcs = {
+	.atomic_check	= tve200_crtc_helper_atomic_check,
+	.atomic_enable	= tve200_crtc_helper_atomic_enable,
+	.atomic_disable	= tve200_crtc_helper_atomic_disable,
+	.atomic_flush	= tve200_crtc_helper_atomic_flush,
+};
+
+static const struct drm_crtc_funcs tve200_crtc_funcs = {
+	.reset			= drm_atomic_helper_crtc_reset,
+	.destroy		= drm_crtc_cleanup,
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+	.enable_vblank		= tve200_crtc_enable_vblank,
+	.disable_vblank		= tve200_crtc_disable_vblank,
+};
+
+static const struct drm_encoder_funcs tve200_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
 };
 
 int tve200_display_init(struct drm_device *drm)
@@ -346,13 +413,31 @@ int tve200_display_init(struct drm_device *drm)
 		DRM_FORMAT_YUV420,
 	};
 
-	ret = drm_simple_display_pipe_init(drm, &priv->pipe,
-					   &tve200_display_funcs,
-					   formats, ARRAY_SIZE(formats),
-					   NULL,
-					   priv->connector);
+	ret = drm_universal_plane_init(drm, &priv->plane, 0,
+				       &tve200_plane_funcs,
+				       formats, ARRAY_SIZE(formats),
+				       NULL,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
 	if (ret)
 		return ret;
 
+	drm_plane_helper_add(&priv->plane, &tve200_plane_helper_funcs);
+
+	ret = drm_crtc_init_with_planes(drm, &priv->crtc,
+					&priv->plane, NULL,
+					&tve200_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+
+	drm_crtc_helper_add(&priv->crtc, &tve200_crtc_helper_funcs);
+
+	ret = drm_encoder_init(drm, &priv->encoder,
+			       &tve200_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ret;
+
+	priv->encoder.possible_crtcs = drm_crtc_mask(&priv->crtc);
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/tve200/tve200_drm.h b/drivers/gpu/drm/tve200/tve200_drm.h
index 5420b52ea16b..631a9f5d9aa6 100644
--- a/drivers/gpu/drm/tve200/tve200_drm.h
+++ b/drivers/gpu/drm/tve200/tve200_drm.h
@@ -15,8 +15,6 @@
 
 #include <linux/irqreturn.h>
 
-#include <drm/drm_simple_kms_helper.h>
-
 struct clk;
 struct drm_bridge;
 struct drm_connector;
@@ -107,7 +105,9 @@ struct tve200_drm_dev_private {
 	struct drm_connector *connector;
 	struct drm_panel *panel;
 	struct drm_bridge *bridge;
-	struct drm_simple_display_pipe pipe;
+	struct drm_plane plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
 
 	void *regs;
 	struct clk *pclk;
diff --git a/drivers/gpu/drm/tve200/tve200_drv.c b/drivers/gpu/drm/tve200/tve200_drv.c
index 562f3f11812a..0b8096b1e600 100644
--- a/drivers/gpu/drm/tve200/tve200_drv.c
+++ b/drivers/gpu/drm/tve200/tve200_drv.c
@@ -105,16 +105,20 @@ static int tve200_modeset_init(struct drm_device *dev)
 		goto out_bridge;
 	}
 
-	ret = drm_simple_display_pipe_attach_bridge(&priv->pipe,
-						    bridge);
+	priv->panel = panel;
+	priv->bridge = bridge;
+
+	ret = drm_bridge_attach(&priv->encoder, bridge, NULL, 0);
 	if (ret) {
 		dev_err(dev->dev, "failed to attach bridge\n");
 		goto out_bridge;
 	}
 
-	priv->panel = panel;
 	priv->connector = drm_panel_bridge_connector(bridge);
-	priv->bridge = bridge;
+	if (!priv->connector) {
+		ret = -ENODEV;
+		goto out_bridge;
+	}
 
 	dev_info(dev->dev, "attached to panel %s\n",
 		 dev_name(panel->dev));

-- 
2.43.0


