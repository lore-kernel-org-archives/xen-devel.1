Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422BDC53209
	for <xen-devel@archiver.kernel.org>; Sun, 26 Jul 2026 19:46:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371204.1618855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wo4nH-0005FM-HL; Sun, 26 Jul 2026 19:45:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371204.1618855; Sun, 26 Jul 2026 19:45:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wo4nH-0005FF-EJ; Sun, 26 Jul 2026 19:45:51 +0000
Received: by outflank-mailman (input) for mailman id 1371204;
 Sun, 26 Jul 2026 19:45:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ze.huang@oss.qualcomm.com>) id 1wo4nF-0005EM-RR
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2026 19:45:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wo4nF-005uSP-8R
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2026 21:45:49 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a666361-bab6-0a2a0a5309dd-0a2a4509d402-38
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 21:45:49 +0200
Received: from [205.220.168.131] (helo=mx0a-0031df01.pphosted.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a6663eb-be1a-0a2a45090019-cddca883d942-3
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 21:45:48 +0200
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66QH6eCm955075
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 19:45:46 GMT
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmpeebdxf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 19:45:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2cfca8558d2so28690855ad.2
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 12:45:46 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38f03b0eaa8sm4105998a91.8.2026.07.26.12.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2026 12:45:44 -0700 (PDT)
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
	J6+lcE074QQEAdQOuVNwreBseeGR/lrDSDS0Q2DJm30=; b=E0wlU7aHZ/ViM/pX
	o/1GtHfv72LS8z+4+VritNAV63YhzEuFfvEQoyNnGwisbvxYCGJE/XGwLgb1LVjR
	782G2tn/cV595VBpz1n2Qb0QkXkc7B5+wuVNHdgmZg1b636yJtn7HD+kYP0oXUMe
	mZV5H8rrk2hCSYREdcPOaEereLkgNhZlgLhFVkS8Iy80PO0oDWK3eSZnlOVscyn9
	r56npLDw3QaoRhUBFCRVGSxdJhsYqhw+FTaPYkefM9bxGoNglpQMb/fI+4/K5BFG
	ffCU/M94OqaRu1G0grgJ+P6/hHmC/SWKwMBYsy0pral3OhHLXjKBcQvVArcLJGvC
	901YmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785095146; x=1785699946; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J6+lcE074QQEAdQOuVNwreBseeGR/lrDSDS0Q2DJm30=;
        b=DeT+/T+pvsHQqCO5XzVvWFSGVmv/TM4X3Ki0rs6/yfMEN607NsQGRo+notHdi5ZZFc
         OJwjrEcXms+XpWLz4zx09dYc8RLnQV1k1DqXnnPenMkW/EIyRRkHBQLczZTk/GABc4mN
         EO9riNnfX3lD7pdM4Z7AmO+91zIpVww/rN4sNPQwYK7OOc3pP91WngAm2oaLJYZvs9g0
         tRvf7eXQmNiGf++3RfaiqiWAVJpZ60qyh4yPZGDvraQVaBvqYq09Kt/GgtlBEe0+23XF
         cRiTUcLehMfDW2MlE9ZySYNrgYw07egiGphV5icEuDAxWr4fZO/xrugBda7z0doi4g30
         ANWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785095146; x=1785699946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J6+lcE074QQEAdQOuVNwreBseeGR/lrDSDS0Q2DJm30=;
        b=UJF7T3tLGZ/Czv4zrrcEJ5RtRlyu2Ps+02iB4efhH41X6ADuq0atpJrBh2uR/pU7WM
         xBYCeq39AFD2eEU1VK0UMTMkV8cG9LnPvJe4uNzqSYcRPLb7LuUqjTmJKj+quBMRE97U
         TdOp6wIGhrsjTSuN2w6ivGUVjUraegfS2cR3L6a+V9BxWReBpkIgRgqGoHdD3iUvfgvS
         NjuetQJjb8uMKFF0g6NffqJqDX7vetzd3kLR8ZVMV+tNigXIGc6coTgwieoh7U8ugGhr
         uobtgKTqFfakuEBaV7AnWGShU3g8DB4pYo8eKpDPhFiKaTj+2x/1IjgELh+NFeF7bJFZ
         XDrA==
X-Forwarded-Encrypted: i=1; AHgh+RrHtt4BxfbxukJjpxZD8NDC3dhkbgqaKVHUyj+W7wPsnW3kaPxmiwczY1RY6MDQQ1aw9QnrO80sdNI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJEWMroXozF+6xDkf4uQ2Y13hSGjMHSn1knrkEN7sBUVCL9NvJ
	wYiwWfVAUd+ai6/1igTKv91KfbDtRN2lHqiT7vEDwib+Lgek4f2WPfjUaRMr/mLYJGtb+B6BQcF
	Oh+oYUQi7ov4e4cS0Py1QOevwqrbMkcNk5LzV4qwbAgnugOHOjT3l8SJxwLR3TrxBXfep+lFYBO
	rDqJ/YAno=
X-Gm-Gg: AR+sD11Y1mMg5Lak4OXIKYqtE+ye1De/wKGNyC3yqhSJ6124XodLYFBptbDXFeh9ri3
	Lp9eZOcxxsqxRpT8LW3OttNJpSA33AjtG804rhht5jBPAsx5fLEbZb43MCBNmENukjHWhVvzaBw
	UgzPLEARO7Tb7HjW6J4cdqPTSRpa+Sg+KkZU9oVhlZOQ9+arABTzrUQPpkPVT45pwbThNJz6xgt
	SIGsyiClAF6Q3iUgvujWLZaLIxbYTHSLh+qtcitkdCa9jQ1onMZx3N2kNshLAh3I7dm2M7VPqDz
	bus03UDEH9BLHCbLDT7QPY4KzigMbMvY0bWMHaDEja/VyY2huhaiPGIJPamQHFkI4azy1IiUGe3
	418Ru42gD19/pBKCesRxl
X-Received: by 2002:a17:90b:57e3:b0:38e:9279:468c with SMTP id 98e67ed59e1d1-38f296091e5mr5566784a91.25.1785095145655;
        Sun, 26 Jul 2026 12:45:45 -0700 (PDT)
X-Received: by 2002:a17:90b:57e3:b0:38e:9279:468c with SMTP id 98e67ed59e1d1-38f296091e5mr5566754a91.25.1785095145112;
        Sun, 26 Jul 2026 12:45:45 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 03:45:14 +0800
Subject: [PATCH v3 1/8] drm/arcpgu: replace struct drm_simple_display_pipe
 with regular atomic helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-drm-simple-kms-removal-v3-1-cd5dc89858c6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785095128; l=13083;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=u7exUdyCprg8S9F0jxX38ipcgKHv/vnrTEoFU9vPkn0=;
 b=ZZ9Plhe5vhdeps49o98fJZwGYMXe7qfovRpPLQtu3Ndk8ZaA/xZ5h5iF+eVEKTBGql3NdYneD
 e8qZB80aBZwDC1tqIMZQu2S2jeS6nDQM6Y2Hd/QRPAINQ4pNhlPy2B5
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Authority-Analysis: v=2.4 cv=Jr3Bas4C c=1 sm=1 tr=0 ts=6a6663ea cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=f2ANGF4ctf8G8blR-OgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfX2dvnC/dk9Jr3
 knbRY46gf6DgHWqRZCVUdycQq+g+a4ORVnr+fPMMA0T3ELLJofe4asNaRNokUJIp4BFi14Ggrgd
 8EUBhQahCbIYJAOR7262y5fCNR1YsVU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfXywKQqReuKmHK
 tkE9NlH8numOLQLTcNg/1FsD260kuIfB93CEr7tiCT2gB6/1HWCYnEW4WapljuMJspZWVTPsgLP
 nnQuwaIqV2G/DiaP9fV6iCrGq947pyVr3lPm5BLhpeLr0s3J5bNtcfklOIYQ3C67nVk0lhXYd6F
 yA09U2v7txwChbBd6/wLdLPv4Y9pBupZzQ1NZoqx6qkyjbKyOf+eLIt1FnAvMStJIwQQDoQdSsq
 81MXtbTlOmiFBZQQkDO2NvBAQiB5dQx0oWYCmQokPMKUGK9/T10p/eXgfdDchKvMeFRKEeadW7K
 nsq8l1yo9KSmdTihu5wx+WTG/zY+rA06AML2elnqqWDrK6Syp9+Wwb73jVb8GwLOkhibfWGH+Id
 uUYUgasaswmdYY+NQSUxcNEeuE1h4k094/v3JhJsWFS5creTJ3eGuh2hoa4hGZeatRmlZVUIRb4
 xWOrdNKNtJhK+1gw03g==
X-Proofpoint-ORIG-GUID: VRCMqVrlbJxXh_ti9MtkMi7glgiwHziF
X-Proofpoint-GUID: VRCMqVrlbJxXh_ti9MtkMi7glgiwHziF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260200
X-purgate-ID: tlsNG-bad1c0/1785095149-BCECE034-5D14B0E9/0/0
X-purgate-type: clean
X-purgate-size: 13085

Instantiate the primary plane, CRTC and encoder directly and wire them up
with standard atomic helpers.

Move the simple-pipe callbacks into explicit plane and CRTC helper
callbacks. Use commit-local CRTC and plane state in the CRTC enable path
for mode and pixel-format programming.

Handle missing remote encoder nodes explicitly and take the CRTC modeset
lock while reading CRTC state from debugfs.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>

---
Changes in v3:
- Use commit-local CRTC and plane state in the CRTC enable path.
- Handle missing remote encoder nodes explicitly.
- Lock CRTC state access in debugfs.
---
 drivers/gpu/drm/tiny/arcpgu.c | 201 ++++++++++++++++++++++++++++++++----------
 1 file changed, 152 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index c93d61ac0bb7..19a943f5f792 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -8,6 +8,7 @@
 #include <linux/clk.h>
 
 #include <drm/clients/drm_client_setup.h>
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_device.h>
@@ -17,12 +18,13 @@
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_module.h>
 #include <drm/drm_of.h>
+#include <drm/drm_plane.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
 #include <linux/of_reserved_mem.h>
@@ -52,13 +54,16 @@ struct arcpgu_drm_private {
 	struct drm_device	drm;
 	void __iomem		*regs;
 	struct clk		*clk;
-	struct drm_simple_display_pipe pipe;
+	struct drm_plane	plane;
+	struct drm_crtc		crtc;
+	struct drm_encoder	encoder;
 	struct drm_connector	sim_conn;
 };
 
-#define dev_to_arcpgu(x) container_of(x, struct arcpgu_drm_private, drm)
-
-#define pipe_to_arcpgu_priv(x) container_of(x, struct arcpgu_drm_private, pipe)
+static inline struct arcpgu_drm_private *dev_to_arcpgu(struct drm_device *drm)
+{
+	return container_of(drm, struct arcpgu_drm_private, drm);
+}
 
 static inline void arc_pgu_write(struct arcpgu_drm_private *arcpgu,
 				 unsigned int reg, u32 value)
@@ -115,9 +120,10 @@ static const u32 arc_pgu_supported_formats[] = {
 	DRM_FORMAT_ARGB8888,
 };
 
-static void arc_pgu_set_pxl_fmt(struct arcpgu_drm_private *arcpgu)
+static void arc_pgu_set_pxl_fmt(struct arcpgu_drm_private *arcpgu,
+				const struct drm_plane_state *plane_state)
 {
-	const struct drm_framebuffer *fb = arcpgu->pipe.plane.state->fb;
+	const struct drm_framebuffer *fb = plane_state->fb;
 	uint32_t pixel_format = fb->format->format;
 	u32 format = DRM_FORMAT_INVALID;
 	int i;
@@ -139,10 +145,10 @@ static void arc_pgu_set_pxl_fmt(struct arcpgu_drm_private *arcpgu)
 	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL, reg_ctrl);
 }
 
-static enum drm_mode_status arc_pgu_mode_valid(struct drm_simple_display_pipe *pipe,
-					       const struct drm_display_mode *mode)
+static enum drm_mode_status arcpgu_crtc_helper_mode_valid(struct drm_crtc *crtc,
+							  const struct drm_display_mode *mode)
 {
-	struct arcpgu_drm_private *arcpgu = pipe_to_arcpgu_priv(pipe);
+	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(crtc->dev);
 	long rate, clk_rate = mode->clock * 1000;
 	long diff = clk_rate / 200; /* +-0.5% allowed by HDMI spec */
 
@@ -153,9 +159,11 @@ static enum drm_mode_status arc_pgu_mode_valid(struct drm_simple_display_pipe *p
 	return MODE_NOCLOCK;
 }
 
-static void arc_pgu_mode_set(struct arcpgu_drm_private *arcpgu)
+static void arc_pgu_mode_set(struct arcpgu_drm_private *arcpgu,
+			     struct drm_crtc_state *crtc_state,
+			     struct drm_plane_state *plane_state)
 {
-	struct drm_display_mode *m = &arcpgu->pipe.crtc.state->adjusted_mode;
+	struct drm_display_mode *m = &crtc_state->adjusted_mode;
 	u32 val;
 
 	arc_pgu_write(arcpgu, ARCPGU_REG_FMT,
@@ -189,18 +197,19 @@ static void arc_pgu_mode_set(struct arcpgu_drm_private *arcpgu)
 	arc_pgu_write(arcpgu, ARCPGU_REG_STRIDE, 0);
 	arc_pgu_write(arcpgu, ARCPGU_REG_START_SET, 1);
 
-	arc_pgu_set_pxl_fmt(arcpgu);
+	arc_pgu_set_pxl_fmt(arcpgu, plane_state);
 
 	clk_set_rate(arcpgu->clk, m->crtc_clock * 1000);
 }
 
-static void arc_pgu_enable(struct drm_simple_display_pipe *pipe,
-			   struct drm_crtc_state *crtc_state,
-			   struct drm_plane_state *plane_state)
+static void arcpgu_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					     struct drm_atomic_commit *commit)
 {
-	struct arcpgu_drm_private *arcpgu = pipe_to_arcpgu_priv(pipe);
+	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(crtc->dev);
+	struct drm_plane_state *pstate = drm_atomic_get_new_plane_state(commit, &arcpgu->plane);
+	struct drm_crtc_state *cstate = drm_atomic_get_new_crtc_state(commit, crtc);
 
-	arc_pgu_mode_set(arcpgu);
+	arc_pgu_mode_set(arcpgu, cstate, pstate);
 
 	clk_prepare_enable(arcpgu->clk);
 	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL,
@@ -208,9 +217,10 @@ static void arc_pgu_enable(struct drm_simple_display_pipe *pipe,
 		      ARCPGU_CTRL_ENABLE_MASK);
 }
 
-static void arc_pgu_disable(struct drm_simple_display_pipe *pipe)
+static void arcpgu_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+					      struct drm_atomic_commit *commit)
 {
-	struct arcpgu_drm_private *arcpgu = pipe_to_arcpgu_priv(pipe);
+	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(crtc->dev);
 
 	clk_disable_unprepare(arcpgu->clk);
 	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL,
@@ -218,27 +228,21 @@ static void arc_pgu_disable(struct drm_simple_display_pipe *pipe)
 			      ~ARCPGU_CTRL_ENABLE_MASK);
 }
 
-static void arc_pgu_update(struct drm_simple_display_pipe *pipe,
-			   struct drm_plane_state *state)
+static void arcpgu_plane_helper_atomic_update(struct drm_plane *plane,
+					      struct drm_atomic_commit *commit)
 {
+	struct drm_plane_state *pstate = drm_atomic_get_new_plane_state(commit, plane);
 	struct arcpgu_drm_private *arcpgu;
 	struct drm_gem_dma_object *gem;
 
-	if (!pipe->plane.state->fb)
+	if (!pstate->fb)
 		return;
 
-	arcpgu = pipe_to_arcpgu_priv(pipe);
-	gem = drm_fb_dma_get_gem_obj(pipe->plane.state->fb, 0);
+	arcpgu = dev_to_arcpgu(plane->dev);
+	gem = drm_fb_dma_get_gem_obj(pstate->fb, 0);
 	arc_pgu_write(arcpgu, ARCPGU_REG_BUF0_ADDR, gem->dma_addr);
 }
 
-static const struct drm_simple_display_pipe_funcs arc_pgu_pipe_funcs = {
-	.update = arc_pgu_update,
-	.mode_valid = arc_pgu_mode_valid,
-	.enable	= arc_pgu_enable,
-	.disable = arc_pgu_disable,
-};
-
 static const struct drm_mode_config_funcs arcpgu_drm_modecfg_funcs = {
 	.fb_create  = drm_gem_fb_create,
 	.atomic_check = drm_atomic_helper_check,
@@ -247,6 +251,74 @@ static const struct drm_mode_config_funcs arcpgu_drm_modecfg_funcs = {
 
 DEFINE_DRM_GEM_DMA_FOPS(arcpgu_drm_ops);
 
+static int arcpgu_plane_helper_atomic_check(struct drm_plane *plane,
+					    struct drm_atomic_commit *commit)
+{
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(commit, plane);
+	struct drm_crtc_state *crtc_state = NULL;
+
+	if (plane_state->crtc) {
+		crtc_state = drm_atomic_get_crtc_state(commit, plane_state->crtc);
+		if (IS_ERR(crtc_state))
+			return PTR_ERR(crtc_state);
+	}
+
+	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
+						   DRM_PLANE_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
+						   false, false);
+}
+
+static const struct drm_plane_helper_funcs arcpgu_plane_helper_funcs = {
+	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
+	.atomic_check	= arcpgu_plane_helper_atomic_check,
+	.atomic_update	= arcpgu_plane_helper_atomic_update,
+};
+
+static const struct drm_plane_funcs arcpgu_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.destroy		= drm_plane_cleanup,
+	.reset			= drm_atomic_helper_plane_reset,
+	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+};
+
+static int arcpgu_crtc_helper_atomic_check(struct drm_crtc *crtc,
+					   struct drm_atomic_commit *commit)
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
+static const struct drm_crtc_helper_funcs arcpgu_crtc_helper_funcs = {
+	.mode_valid	= arcpgu_crtc_helper_mode_valid,
+	.atomic_check	= arcpgu_crtc_helper_atomic_check,
+	.atomic_enable	= arcpgu_crtc_helper_atomic_enable,
+	.atomic_disable	= arcpgu_crtc_helper_atomic_disable,
+};
+
+static const struct drm_crtc_funcs arcpgu_crtc_funcs = {
+	.reset			= drm_atomic_helper_crtc_reset,
+	.destroy		= drm_crtc_cleanup,
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+};
+
+static const struct drm_encoder_funcs arcpgu_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 {
 	struct platform_device *pdev = to_platform_device(arcpgu->drm.dev);
@@ -254,6 +326,9 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 	struct device_node *endpoint_node = NULL;
 	struct drm_connector *connector = NULL;
 	struct drm_device *drm = &arcpgu->drm;
+	struct drm_plane *plane;
+	struct drm_encoder *encoder;
+	struct drm_crtc *crtc;
 	int ret;
 
 	arcpgu->clk = devm_clk_get(drm->dev, "pxlclk");
@@ -285,6 +360,30 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 	if (dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(32)))
 		return -ENODEV;
 
+	plane = &arcpgu->plane;
+	ret = drm_universal_plane_init(drm, plane, 0,
+				       &arcpgu_plane_funcs,
+				       arc_pgu_supported_formats,
+				       ARRAY_SIZE(arc_pgu_supported_formats),
+				       NULL,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+	drm_plane_helper_add(plane, &arcpgu_plane_helper_funcs);
+
+	crtc = &arcpgu->crtc;
+	ret = drm_crtc_init_with_planes(drm, crtc, plane, NULL,
+					&arcpgu_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+	drm_crtc_helper_add(crtc, &arcpgu_crtc_helper_funcs);
+
+	encoder = &arcpgu->encoder;
+	ret = drm_encoder_init(drm, encoder, &arcpgu_encoder_funcs, DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ret;
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+
 	/*
 	 * There is only one output port inside each device. It is linked with
 	 * encoder endpoint.
@@ -293,29 +392,26 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 	if (endpoint_node) {
 		encoder_node = of_graph_get_remote_port_parent(endpoint_node);
 		of_node_put(endpoint_node);
-	} else {
-		connector = &arcpgu->sim_conn;
-		dev_info(drm->dev, "no encoder found. Assumed virtual LCD on simulation platform\n");
-		ret = arcpgu_drm_sim_init(drm, connector);
-		if (ret < 0)
-			return ret;
-	}
+		if (!encoder_node)
+			return -ENODEV;
 
-	ret = drm_simple_display_pipe_init(drm, &arcpgu->pipe, &arc_pgu_pipe_funcs,
-					   arc_pgu_supported_formats,
-					   ARRAY_SIZE(arc_pgu_supported_formats),
-					   NULL, connector);
-	if (ret)
-		return ret;
-
-	if (encoder_node) {
 		/* Locate drm bridge from the hdmi encoder DT node */
 		struct drm_bridge *bridge __free(drm_bridge_put) =
 			of_drm_find_and_get_bridge(encoder_node);
 		if (!bridge)
 			return -EPROBE_DEFER;
 
-		ret = drm_simple_display_pipe_attach_bridge(&arcpgu->pipe, bridge);
+		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
+		if (ret)
+			return ret;
+	} else {
+		connector = &arcpgu->sim_conn;
+		dev_info(drm->dev, "no encoder found. Assumed virtual LCD on simulation platform\n");
+		ret = arcpgu_drm_sim_init(drm, connector);
+		if (ret < 0)
+			return ret;
+
+		ret = drm_connector_attach_encoder(connector, encoder);
 		if (ret)
 			return ret;
 	}
@@ -342,7 +438,14 @@ static int arcpgu_show_pxlclock(struct seq_file *m, void *arg)
 	struct drm_device *drm = node->minor->dev;
 	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
 	unsigned long clkrate = clk_get_rate(arcpgu->clk);
-	unsigned long mode_clock = arcpgu->pipe.crtc.mode.crtc_clock * 1000;
+	unsigned long mode_clock;
+	int ret;
+
+	ret = drm_modeset_lock_single_interruptible(&arcpgu->crtc.mutex);
+	if (ret)
+		return ret;
+	mode_clock = arcpgu->crtc.state->mode.crtc_clock * 1000;
+	drm_modeset_unlock(&arcpgu->crtc.mutex);
 
 	seq_printf(m, "hw  : %lu\n", clkrate);
 	seq_printf(m, "mode: %lu\n", mode_clock);

-- 
2.43.0


