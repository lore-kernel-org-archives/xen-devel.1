Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA612C531C9
	for <xen-devel@archiver.kernel.org>; Sun, 26 Jul 2026 19:46:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371206.1618864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wo4nO-0005Zp-Tv; Sun, 26 Jul 2026 19:45:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371206.1618864; Sun, 26 Jul 2026 19:45:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wo4nO-0005Zi-QM; Sun, 26 Jul 2026 19:45:58 +0000
Received: by outflank-mailman (input) for mailman id 1371206;
 Sun, 26 Jul 2026 19:45:58 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ze.huang@oss.qualcomm.com>) id 1wo4nO-0005Xq-3t
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2026 19:45:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wo4nN-00BknP-BW
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2026 21:45:57 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a666320-2eae-0a2a0a5409dd-0a2a450cde20-40
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 21:45:57 +0200
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a6663f3-f479-0a2a450c0019-cddcb4836b62-3
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 21:45:57 +0200
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66QH7Bs51366114
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 19:45:55 GMT
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmmqybn0s-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 19:45:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-38e667368f0so3318947a91.2
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 12:45:54 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38f03b0eaa8sm4105998a91.8.2026.07.26.12.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2026 12:45:52 -0700 (PDT)
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
	mFB+5HFwxjcBF8nxAOBQAVq/5co4FpjrWYEcC8BPX/U=; b=RYq92HbspOx5vU17
	JetxowafCZlDu33IKFNBayiGfASH4BIJAd7ogNrCV48QtcRGjPMV6j7Z2Ck1l8em
	Hl2Kp6HG7maOo13EA/TcCaIaaBAIzaxUmbyyNehNlG8Qv7nruPAhoWqeH5KuyCWg
	8siiNh7/Oh4ax6PSKaDeB9Ggg2CgO5J2g3/yZWVgtEgvYKoAPjbCpHueMQ3eYacg
	G3CC9BgwRJQCu85Zzrvazf0v42Gr1CFogUir5XFlTYSrcrLesOjiAKoyWpMMfhtE
	Ibj+gzFzwqIBBzZQ2lVt18UZisWcVxOSHjOftvOvlxxN2ObJ1jtXqKbV6U7oSZ6H
	xKZ+FQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785095154; x=1785699954; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mFB+5HFwxjcBF8nxAOBQAVq/5co4FpjrWYEcC8BPX/U=;
        b=ix1AWK4pADps6HH5Ea3wB3Jhkn9Dv8apla3v88SeaI1H74ZOSeZNZn9UrbbRRkmxoz
         M7sr17nQUiF6PqkjXoKaXz/FLdwcUXzWO3h4eiJrDkVJI8K03uwl20MYBolPZbJQzJk+
         ORYrU+xEnfXSCzB/eBdn1er8D39gk3GLwpfwzfNkVjKVctuq7AR8uEiPzGJBnz/5nADP
         DNdDQAy2OjKaMUYlBZMzC4yKZys2BJDwSrLpGGZv5F+ybqMNMLiehGelCprwE0yM2z2T
         MHHrjp1/A+O5eqjMvSrVApiYeiXEiHzRvarQ6bGhL8Drb/3J/v0gMwdoE0MEDMtn4X7c
         YuyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785095154; x=1785699954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mFB+5HFwxjcBF8nxAOBQAVq/5co4FpjrWYEcC8BPX/U=;
        b=d49fxz1r2ydogQGwcJote3sB8nezEK/bDK2V6W5YKoU+tyQwsjNRcpGpqtZmW4KY4Z
         B+MW5Y1GSQi8hBOQsKLqZx+e5H361Sjt2scq3/lBiiUlLqqk1r4ShjntIVYk78CMoylQ
         09U/wupp7qJNIQCewLD8Uz88xb2TEOGYsoy49rRmcAfoJMHE24aU8SBui3GMH8fRmKNw
         3n455E2bQHoyrAMKPLs+m6MK3xW5H42kmexnBed/HXd+D8Tom5tw4spLQk54bUNvxEuF
         NFYSlkDRn5H2P4+1TwOGgUAiJO6cpZxXMf1gBGXfHMGeB80815V2l9P2hBDrrwAikmku
         s6UQ==
X-Forwarded-Encrypted: i=1; AHgh+RpflHKy+3aOdE0TbZsg4CYnmx8CWSSy2c83CIT6oYnAKjOQXBe5nKkE9yUXnKs0ryCPyo2g2Ld4SnU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwlO9XbyxMcLFgL2T6gR5nkfHbb0PKcg02itVo7PtKkit/JBKIh
	1tgJOqbMthbpGmDY1pqmIWziv8RXBA8USUwMsJir0Iw/BpTxyRA/cvDxf34pC8nAq9KmRZ8OEuW
	DdkIOLMW2vjJNCf7nwkVGJeBftqvfLz3fGGVWHfr3QRP9vrc64qIZB7M210l3ys389DLjWA==
X-Gm-Gg: AR+sD10SQ9hDyUj0pPWpV+UZ0SV4QBsM08x9YYP7lTfGKaqLdNhxfm9HP2VlUTAbgBX
	gKy0Uwt7jpg7Uhvu2dkZeA+y5piZ9pwO++hC+xfmrrbQpVRiEbfS9uysrGdHcByZsaTmp1M46ob
	v+9OKlFeNmIoOqGevfNJaRXmMHlW4K+hrq8x5L7khTfCjLEVCr1dlCan7KK4vFW/vh62bGncvLR
	j2upXe0edkb6G4HAbpZKSiEB9mgKkgaXKL397UPi0k4xJhO+emauxyOHyIcBQ0DvsPs1emkRVYY
	jw5K2NSYz4YgzAi+VmuadnbrJxNfLlgwWEH1l5JFAws5SXMNuOMJgTjt9+jsA4eqewrFTMvx/bZ
	CxBmLWXDgKPEMo3Y3QwsZ
X-Received: by 2002:a17:90b:518b:b0:381:1fd3:e4ef with SMTP id 98e67ed59e1d1-38f2961f487mr6321261a91.25.1785095153685;
        Sun, 26 Jul 2026 12:45:53 -0700 (PDT)
X-Received: by 2002:a17:90b:518b:b0:381:1fd3:e4ef with SMTP id 98e67ed59e1d1-38f2961f487mr6321239a91.25.1785095153179;
        Sun, 26 Jul 2026 12:45:53 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 03:45:15 +0800
Subject: [PATCH v3 2/8] drm/aspeed: replace struct drm_simple_display_pipe
 with regular atomic helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-drm-simple-kms-removal-v3-2-cd5dc89858c6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785095128; l=13020;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=mji0VO0E5cTKmqauubKhD1v5gmVwNBzHkgYjdhi1xOQ=;
 b=Pdz/RxBliFWW7g2zgcJFAc6JuqVRqfnPXUsLdCSgCusv8bQ4SI/Rs0Jh55oslFypTwzYKc3iq
 qZUWGagBjH2A+Ef54nOdUoqYdodVHwFQkoj/nA5EQoNcQtDkiGZzOpG
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Proofpoint-ORIG-GUID: kx415rq7qlPlM62RTuDcwQivUQd0dxpD
X-Authority-Analysis: v=2.4 cv=drbrzVg4 c=1 sm=1 tr=0 ts=6a6663f3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=x2ZSBtIQfFjOxsfsTs4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: kx415rq7qlPlM62RTuDcwQivUQd0dxpD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfX932VUcc4BDvE
 Jm5E8Xv8eRzAL1hIvIq/loSQUVuFkzmTyzJJKd1Wa0Ooh08npfGParkiVBUTHxr0r/X57X+tChp
 iP9auLP5mUDLGj3bFSCDc6PFXb73sdyL1fMkIhXRv6lfpl7B8Gs898H6XYsAxaXmEAoPQle0ZoX
 3x4v7CMZKUfPTUuFRPxiSjXC+2OJaz+S9Jk1ymoLOf/gjO5Iz2aAz7J347biYPlJunRHBvxuxyC
 NM0fIWItHgLMnyjkC3Nbna9H5tqso0aXjPtH8Ja6JdUVDzgTZ2N5gmBgCoXMXeBrJw/iO0vtXIi
 n51umQWCEkUCQP0J1gGcFQtygSVBg3tctFDV213E+9gNhbdtGPoGK6jvBFlpndus4TyiVXw1zw/
 dD/qgCuxLQSEksm/MmZQXW/9+F2EkC/I+gfzJUcov1z3KuHUL2MjGKlFleal0tCVpp8QUMnutwr
 C3Ri4J/mCO1LDaV+Qfw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfX/HJOprUu9EEb
 +azIgSldQif8/ysd+DAvPeGCY2bdi60pn+vi75DSPQ7IGYJ7Q3hTx7ePZIv6CBIM33bc2HuBXD5
 XJYq2atYkORTyYx9kaxwm0xJKPR3od0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607260200
X-purgate-ID: tlsNG-d25034/1785095157-776D6A5B-E1A7D138/0/0
X-purgate-type: clean
X-purgate-size: 13022

Replace the simple display pipe with explicit plane, CRTC and encoder
objects.

Move callbacks to plane and CRTC helpers, and wire vblank handling
through drm_crtc_funcs. Move page-flip event handling from plane
atomic_update() to CRTC atomic_flush().

Use commit-local CRTC and plane state when programming mode and pixel
format in the CRTC enable path.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>

---
Changes in v3:
- Use commit-local CRTC and plane state in the CRTC enable path.
- Make the aspeed container helper static inline.
---
 drivers/gpu/drm/aspeed/aspeed_gfx.h      |  11 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 203 ++++++++++++++++++++++---------
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  |   3 +-
 3 files changed, 157 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx.h b/drivers/gpu/drm/aspeed/aspeed_gfx.h
index 4e6a442c3886..273528d30b4c 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx.h
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx.h
@@ -2,7 +2,6 @@
 /* Copyright 2018 IBM Corporation */
 
 #include <drm/drm_device.h>
-#include <drm/drm_simple_kms_helper.h>
 
 struct aspeed_gfx {
 	struct drm_device		drm;
@@ -17,10 +16,16 @@ struct aspeed_gfx {
 	u32				throd_val;
 	u32				scan_line_max;
 
-	struct drm_simple_display_pipe	pipe;
+	struct drm_plane		plane;
+	struct drm_crtc			crtc;
+	struct drm_encoder		encoder;
 	struct drm_connector		connector;
 };
-#define to_aspeed_gfx(x) container_of(x, struct aspeed_gfx, drm)
+
+static inline struct aspeed_gfx *to_aspeed_gfx(struct drm_device *drm)
+{
+	return container_of(drm, struct aspeed_gfx, drm);
+}
 
 int aspeed_gfx_create_pipe(struct drm_device *drm);
 int aspeed_gfx_create_output(struct drm_device *drm);
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
index 7877a57b8e26..e8c9a6040d75 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
@@ -5,6 +5,8 @@
 #include <linux/reset.h>
 #include <linux/regmap.h>
 
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_device.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
@@ -12,22 +14,17 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_panel.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 
 #include "aspeed_gfx.h"
 
-static struct aspeed_gfx *
-drm_pipe_to_aspeed_gfx(struct drm_simple_display_pipe *pipe)
+static int aspeed_gfx_set_pixel_fmt(struct aspeed_gfx *priv,
+				    struct drm_plane_state *plane_state,
+				    u32 *bpp)
 {
-	return container_of(pipe, struct aspeed_gfx, pipe);
-}
-
-static int aspeed_gfx_set_pixel_fmt(struct aspeed_gfx *priv, u32 *bpp)
-{
-	struct drm_crtc *crtc = &priv->pipe.crtc;
+	struct drm_crtc *crtc = &priv->crtc;
 	struct drm_device *drm = crtc->dev;
-	const u32 format = crtc->primary->state->fb->format->format;
+	const u32 format = plane_state->fb->format->format;
 	u32 ctrl1;
 
 	ctrl1 = readl(priv->base + CRT_CTRL1);
@@ -77,13 +74,15 @@ static void aspeed_gfx_disable_controller(struct aspeed_gfx *priv)
 	regmap_update_bits(priv->scu, priv->dac_reg, BIT(16), 0);
 }
 
-static void aspeed_gfx_crtc_mode_set_nofb(struct aspeed_gfx *priv)
+static void aspeed_gfx_crtc_mode_set_nofb(struct aspeed_gfx *priv,
+					  struct drm_crtc_state *crtc_state,
+					  struct drm_plane_state *plane_state)
 {
-	struct drm_display_mode *m = &priv->pipe.crtc.state->adjusted_mode;
+	struct drm_display_mode *m = &crtc_state->adjusted_mode;
 	u32 ctrl1, d_offset, t_count, bpp;
 	int err;
 
-	err = aspeed_gfx_set_pixel_fmt(priv, &bpp);
+	err = aspeed_gfx_set_pixel_fmt(priv, plane_state, &bpp);
 	if (err)
 		return;
 
@@ -139,48 +138,35 @@ static void aspeed_gfx_crtc_mode_set_nofb(struct aspeed_gfx *priv)
 	writel(priv->throd_val, priv->base + CRT_THROD);
 }
 
-static void aspeed_gfx_pipe_enable(struct drm_simple_display_pipe *pipe,
-			      struct drm_crtc_state *crtc_state,
-			      struct drm_plane_state *plane_state)
+static void aspeed_gfx_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+						 struct drm_atomic_commit *commit)
 {
-	struct aspeed_gfx *priv = drm_pipe_to_aspeed_gfx(pipe);
-	struct drm_crtc *crtc = &pipe->crtc;
+	struct aspeed_gfx *priv = to_aspeed_gfx(crtc->dev);
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(commit, crtc);
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(commit, &priv->plane);
 
-	aspeed_gfx_crtc_mode_set_nofb(priv);
+	aspeed_gfx_crtc_mode_set_nofb(priv, crtc_state, plane_state);
 	aspeed_gfx_enable_controller(priv);
 	drm_crtc_vblank_on(crtc);
 }
 
-static void aspeed_gfx_pipe_disable(struct drm_simple_display_pipe *pipe)
+static void aspeed_gfx_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+						  struct drm_atomic_commit *commit)
 {
-	struct aspeed_gfx *priv = drm_pipe_to_aspeed_gfx(pipe);
-	struct drm_crtc *crtc = &pipe->crtc;
+	struct aspeed_gfx *priv = to_aspeed_gfx(crtc->dev);
 
 	drm_crtc_vblank_off(crtc);
 	aspeed_gfx_disable_controller(priv);
 }
 
-static void aspeed_gfx_pipe_update(struct drm_simple_display_pipe *pipe,
-				   struct drm_plane_state *plane_state)
+static void aspeed_gfx_plane_helper_atomic_update(struct drm_plane *plane,
+						  struct drm_atomic_commit *commit)
 {
-	struct aspeed_gfx *priv = drm_pipe_to_aspeed_gfx(pipe);
-	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_framebuffer *fb = pipe->plane.state->fb;
-	struct drm_pending_vblank_event *event;
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(commit, plane);
+	struct aspeed_gfx *priv = to_aspeed_gfx(plane->dev);
+	struct drm_framebuffer *fb = new_plane_state->fb;
 	struct drm_gem_dma_object *gem;
 
-	spin_lock_irq(&crtc->dev->event_lock);
-	event = crtc->state->event;
-	if (event) {
-		crtc->state->event = NULL;
-
-		if (drm_crtc_vblank_get(crtc) == 0)
-			drm_crtc_arm_vblank_event(crtc, event);
-		else
-			drm_crtc_send_vblank_event(crtc, event);
-	}
-	spin_unlock_irq(&crtc->dev->event_lock);
-
 	if (!fb)
 		return;
 
@@ -190,9 +176,9 @@ static void aspeed_gfx_pipe_update(struct drm_simple_display_pipe *pipe,
 	writel(gem->dma_addr, priv->base + CRT_ADDR);
 }
 
-static int aspeed_gfx_enable_vblank(struct drm_simple_display_pipe *pipe)
+static int aspeed_gfx_crtc_enable_vblank(struct drm_crtc *crtc)
 {
-	struct aspeed_gfx *priv = drm_pipe_to_aspeed_gfx(pipe);
+	struct aspeed_gfx *priv = to_aspeed_gfx(crtc->dev);
 	u32 reg = readl(priv->base + CRT_CTRL1);
 
 	/* Clear pending VBLANK IRQ */
@@ -204,9 +190,9 @@ static int aspeed_gfx_enable_vblank(struct drm_simple_display_pipe *pipe)
 	return 0;
 }
 
-static void aspeed_gfx_disable_vblank(struct drm_simple_display_pipe *pipe)
+static void aspeed_gfx_crtc_disable_vblank(struct drm_crtc *crtc)
 {
-	struct aspeed_gfx *priv = drm_pipe_to_aspeed_gfx(pipe);
+	struct aspeed_gfx *priv = to_aspeed_gfx(crtc->dev);
 	u32 reg = readl(priv->base + CRT_CTRL1);
 
 	reg &= ~CRT_CTRL_VERTICAL_INTR_EN;
@@ -216,12 +202,93 @@ static void aspeed_gfx_disable_vblank(struct drm_simple_display_pipe *pipe)
 	writel(reg | CRT_CTRL_VERTICAL_INTR_STS, priv->base + CRT_CTRL1);
 }
 
-static const struct drm_simple_display_pipe_funcs aspeed_gfx_funcs = {
-	.enable		= aspeed_gfx_pipe_enable,
-	.disable	= aspeed_gfx_pipe_disable,
-	.update		= aspeed_gfx_pipe_update,
-	.enable_vblank	= aspeed_gfx_enable_vblank,
-	.disable_vblank	= aspeed_gfx_disable_vblank,
+static int aspeed_gfx_plane_helper_atomic_check(struct drm_plane *plane,
+						struct drm_atomic_commit *commit)
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
+static const struct drm_plane_helper_funcs aspeed_gfx_plane_helper_funcs = {
+	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
+	.atomic_check	= aspeed_gfx_plane_helper_atomic_check,
+	.atomic_update	= aspeed_gfx_plane_helper_atomic_update,
+};
+
+static const struct drm_plane_funcs aspeed_gfx_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.destroy		= drm_plane_cleanup,
+	.reset			= drm_atomic_helper_plane_reset,
+	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+};
+
+static int aspeed_gfx_crtc_helper_atomic_check(struct drm_crtc *crtc,
+					       struct drm_atomic_commit *commit)
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
+static void aspeed_gfx_crtc_helper_atomic_flush(struct drm_crtc *crtc,
+						struct drm_atomic_commit *commit)
+{
+	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(commit, crtc);
+	struct drm_pending_vblank_event *event = new_crtc_state->event;
+
+	if (!event)
+		return;
+
+	new_crtc_state->event = NULL;
+
+	spin_lock_irq(&crtc->dev->event_lock);
+	if (drm_crtc_vblank_get(crtc) == 0)
+		drm_crtc_arm_vblank_event(crtc, event);
+	else
+		drm_crtc_send_vblank_event(crtc, event);
+	spin_unlock_irq(&crtc->dev->event_lock);
+}
+
+static const struct drm_crtc_helper_funcs aspeed_gfx_crtc_helper_funcs = {
+	.atomic_check	= aspeed_gfx_crtc_helper_atomic_check,
+	.atomic_enable	= aspeed_gfx_crtc_helper_atomic_enable,
+	.atomic_disable	= aspeed_gfx_crtc_helper_atomic_disable,
+	.atomic_flush	= aspeed_gfx_crtc_helper_atomic_flush,
+};
+
+static const struct drm_crtc_funcs aspeed_gfx_crtc_funcs = {
+	.reset			= drm_atomic_helper_crtc_reset,
+	.destroy		= drm_crtc_cleanup,
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+	.enable_vblank		= aspeed_gfx_crtc_enable_vblank,
+	.disable_vblank		= aspeed_gfx_crtc_disable_vblank,
+};
+
+static const struct drm_encoder_funcs aspeed_gfx_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
 };
 
 static const uint32_t aspeed_gfx_formats[] = {
@@ -232,10 +299,36 @@ static const uint32_t aspeed_gfx_formats[] = {
 int aspeed_gfx_create_pipe(struct drm_device *drm)
 {
 	struct aspeed_gfx *priv = to_aspeed_gfx(drm);
+	struct drm_plane *plane = &priv->plane;
+	struct drm_crtc *crtc = &priv->crtc;
+	struct drm_encoder *encoder = &priv->encoder;
+	int ret;
+
+	ret = drm_universal_plane_init(drm, plane, 0,
+				       &aspeed_gfx_plane_funcs,
+				       aspeed_gfx_formats,
+				       ARRAY_SIZE(aspeed_gfx_formats),
+				       NULL,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+	drm_plane_helper_add(plane, &aspeed_gfx_plane_helper_funcs);
+
+	ret = drm_crtc_init_with_planes(drm, crtc, plane, NULL,
+					&aspeed_gfx_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+	drm_crtc_helper_add(crtc, &aspeed_gfx_crtc_helper_funcs);
+
+	ret = drm_encoder_init(drm, encoder, &aspeed_gfx_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ret;
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+
+	ret = drm_connector_attach_encoder(&priv->connector, encoder);
+	if (ret)
+		return ret;
 
-	return drm_simple_display_pipe_init(drm, &priv->pipe, &aspeed_gfx_funcs,
-					    aspeed_gfx_formats,
-					    ARRAY_SIZE(aspeed_gfx_formats),
-					    NULL,
-					    &priv->connector);
+	return 0;
 }
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index 46094cca2974..b2d805f0c16d 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -21,7 +21,6 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_module.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_drv.h>
 
@@ -130,7 +129,7 @@ static irqreturn_t aspeed_gfx_irq_handler(int irq, void *data)
 	reg = readl(priv->base + CRT_CTRL1);
 
 	if (reg & CRT_CTRL_VERTICAL_INTR_STS) {
-		drm_crtc_handle_vblank(&priv->pipe.crtc);
+		drm_crtc_handle_vblank(&priv->crtc);
 		writel(reg, priv->base + priv->int_clr_reg);
 		return IRQ_HANDLED;
 	}

-- 
2.43.0


