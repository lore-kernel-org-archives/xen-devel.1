Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF23DC44514
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 09:03:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1363575.1615174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkI04-0002kq-6C; Thu, 16 Jul 2026 09:03:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363575.1615174; Thu, 16 Jul 2026 09:03:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkI03-0002kR-JG; Thu, 16 Jul 2026 09:03:23 +0000
Received: by outflank-mailman (input) for mailman id 1363575;
 Thu, 16 Jul 2026 09:03:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ze.huang@oss.qualcomm.com>) id 1wkI01-0002bP-7h
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 09:03:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkI00-005ozh-D5
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 11:03:20 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a589e52-bab6-0a2a0a5309dd-0a2a4502d8b4-16
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 11:03:20 +0200
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a589e56-6ca4-0a2a45020019-cddcb4836d0a-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 11:03:20 +0200
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66G8379d2123300
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 09:03:18 GMT
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feuex0754-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 09:03:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2cca5e0a0c9so124162965ad.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 02:03:18 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cf106b271asm16592555ad.64.2026.07.16.02.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2026 02:03:16 -0700 (PDT)
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
	55r0GLq+rjOijTgoMN/kmPKdqc3ccdl0qgtljn8u9eE=; b=C26XvzUVz7hPvlkJ
	dtfVmqDwJbLOkKEWKDJgmb/kIMMISQ55NbZtNXcRWFha+0a6ppGwCUxMU3OW4yOd
	1QXk8NmuQyBs3NkPtLaj70wiPIN06/WzwgCZibnpgfQQauK0UubvNQoG2vwLxS6x
	ZyYywU5gaCL2XvTbQHd/+PvP8nEBEfkAq86FN2YcfDKcAiOuP143fz/ZkgY+nAvn
	sQr1JJ+pUYlXnbIeC8umi3zWhyXNr/FiV14a/0v/xWl3eFByNLlEtKj5xmdOKtkS
	4ynTzP2QAkaUaEZBJNyPLqUJBv/Bk4MbjBinG3nl1N+IT/fsoTRUY5KY/zigyfxv
	N67RLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784192597; x=1784797397; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=55r0GLq+rjOijTgoMN/kmPKdqc3ccdl0qgtljn8u9eE=;
        b=TKupEEaK5nJwWsWnMGmk64/ElIsB2FSFKldS4Kcjvbsz7CVPzhria3ryZs/4YLQpcr
         VO2eumxITj1EUbzveORQsTjevAv3eDEdZUrhXj6nMRsH3TKCyqi78iXKEz27uo9GtCoj
         YlnakQlCj4d3s4luMXj9sQqItt8TvP36UG0CHsdNNctTSjaAamvUY7zr1Zg+VfQId2cZ
         +Cn2hHnlqBEjQz1ggb1kUbUlJF/IKFSwinFdqf+RwH4kE4GZgOprBfbiYzhdndkxr2dX
         iNrMzGwEp64LA0jxD7bgQc88CZ6fCV6DMzcWHx3UdGxHz8gNkjIrkLYYcSTwYdMvYXd9
         DoDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192597; x=1784797397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=55r0GLq+rjOijTgoMN/kmPKdqc3ccdl0qgtljn8u9eE=;
        b=jce1ZbgvMxfx5IeX/ZrBzn2MuOLeKM+omYP0awzdU0sxkaBKwDeCmjFocJZVpat0Da
         UQliwhvQtZv6QkF10iujoKrV+KsK64ZNXtJvwrpc74IpHO+nughHtkOpFtYWt2U6aPiF
         PhkLIHmKGf4S/SqTMXxet6cxkoaRVnI8eI138i+8of0gKo2NbbvMVUcsPHpQ33Mt/g3A
         D/z5lK+x5JdUEm8UO3sqZ/m0QbAQ/uTqmMApPoc26GdR7Y8pF3CsYaQGOAVkd2ieQX6G
         XTdsexzhiuQj4ogwcxU6piNZ4cinYKuQXXx1xa50IGOwX4BYW/ieUdEHpYnRUl7Huwu2
         LRyQ==
X-Forwarded-Encrypted: i=1; AHgh+RrAem3Tpdq6E71/PV1L/n4SzyIv1A4+7RFG+AkJScbkls643ELoW105gKC59XZDrtbEdLVwUkIfe9Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwrNH3NWckpOognOhtG7bvWoSXb9lZe6nAU87FPfvZBEWxFWjqe
	th1YmsdxhpQC71pwGvFxVvd4ZvkacfOhNVNHjaLFKasIOFcTA+qwYTAcjNsiUgdTzHbcsOk4Bzh
	jLOwnMmB02QCVzQXguwom5510zv+vs49j/tq4ARf8S1YqFI5JdZ1O5uYa3PsfZYJzejHhmtTD5j
	p3uOTM
X-Gm-Gg: AfdE7cnauk5ZXpFgdyO2gZ0pJZExif3Wks+LFCr7rei1oRxuwatWCjiSMUSK2Of2iRN
	vnyYns18YES5eZnpRbr/Z7nXBmekkhG8XrcS84rlp4wcrkDQT/1FE7ottMymWpTm9t1IFOqqHoB
	jtO+xFy98VcLgHK2g+xAGHkrWEyXA83UawoFIcP0qJ5cmCRp7gHZOGsCDPg0ssHjT/05Syd6L44
	41GXcMbdK7j/08Fc08RjiEqZKbeHHUzYKGM9ITRCuRb8dGzYAK8btXkw17DusTcQXl5BLoxB1kV
	+aYm/tf7Jv3Rs1IbKrz54Yq2SKxqnIZFJGjYpHB9BtEyzrN7RHKZ5VKWqK9waIRP+fB67cfMm4G
	I46Ci6awwea1hTnrmCUmO
X-Received: by 2002:a17:903:19ec:b0:2c2:be43:39bc with SMTP id d9443c01a7336-2cf03cef84dmr63597495ad.22.1784192597253;
        Thu, 16 Jul 2026 02:03:17 -0700 (PDT)
X-Received: by 2002:a17:903:19ec:b0:2c2:be43:39bc with SMTP id d9443c01a7336-2cf03cef84dmr63596785ad.22.1784192596609;
        Thu, 16 Jul 2026 02:03:16 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 17:01:56 +0800
Subject: [PATCH v2 4/8] drm/pl111: replace struct drm_simple_display_pipe
 with regular atomic helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-drm-simple-kms-removal-v2-4-1133a8fc3785@oss.qualcomm.com>
References: <20260716-drm-simple-kms-removal-v2-0-1133a8fc3785@oss.qualcomm.com>
In-Reply-To: <20260716-drm-simple-kms-removal-v2-0-1133a8fc3785@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784192560; l=12120;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=POjWDqTR7KA6vV+N+6pzc8ko2zyOgyhZdHPtBjStvhg=;
 b=Tofb07iFvogf+FT89l3hQY+BQDy+VIGw+zIPY/135cZWAhoei9Fh06Fxb6+Sn+8KL7yidlrT4
 urA+kbKxQ36AHKQvNj9ESxfXbRWFcD2Tz0ltw26pBD5TXObL2so68S8
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Authority-Analysis: v=2.4 cv=JeeMa0KV c=1 sm=1 tr=0 ts=6a589e56 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=UMw5XeoU1RqEgw99msIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: Shii65TYO64sxWtNoKpXLv4hfG3_qnxG
X-Proofpoint-GUID: Shii65TYO64sxWtNoKpXLv4hfG3_qnxG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfX8fhkYhjzMNL6
 Ps//Ea/qsFdQFxcvFwAsDGYarMw5diH65pBfe2D50HxJBEIm4toKrwJ0UDOtzBFkO5t/HzkVUdc
 7mLNPxXlILa0V4/PCyoGIPit4Cql/sA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfX8j69nRj6oW9J
 Uj4AP5dm8pEKivVQilthWymF28kaFzu8ZdP8O7D8A+np+/JZQeZp70jl/K6vwRyv5A+otmbPSvG
 Ylj1cr/95gp9ogaVIrXqmF/9EnhztA6aoqQz/GBhzJtY+AKIBbs6UaGMSLbJWKnG52Odp02+swf
 TizA1osuWpybF3AOfeaoYInHIDaxc50Lyy3T00uAAXDcaR8BCGDurAL6uciZsZljGHRsv7xAANx
 +JSV/1WTefTyWzVaMJbey+OPVhC+iVvUDIzU8dZycGNsCLa1xoGCiAPjPm/EnG+5L+gAVeBYxDn
 dYkwJluS5AcMuhyn8DgPwnmscmNCtimBMucSWbeb/xDc5042Aa4teBnjMUJ7vuYV4HVap4S+0lh
 BSQ+Km5J2teazxVF2IDkdgJ6GP25xvAEb+WZ7fuhyo5mP6l+FiXYPsmBIWLNPRLcQrOnwlqWz1l
 inAvMt5q8eFEV5Amvzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160091
X-purgate-ID: tlsNG-720697/1784192600-678BC2AC-409A5664/0/0
X-purgate-type: clean
X-purgate-size: 12122

Replace PL111 simple display pipe with explicit plane, CRTC and encoder
objects.

Keep the existing PL111 timing, format and pitch validation, but move it
into the explicit atomic check paths. Move event handling to the CRTC
commit path.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
 drivers/gpu/drm/pl111/pl111_display.c | 202 ++++++++++++++++++++++++----------
 drivers/gpu/drm/pl111/pl111_drm.h     |   5 +-
 drivers/gpu/drm/pl111/pl111_drv.c     |   3 +-
 3 files changed, 150 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
index 5d10bc5fdf1f..beb6423d4d43 100644
--- a/drivers/gpu/drm/pl111/pl111_display.c
+++ b/drivers/gpu/drm/pl111/pl111_display.c
@@ -15,6 +15,7 @@
 #include <linux/media-bus-format.h>
 #include <linux/of_graph.h>
 
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
@@ -37,7 +38,7 @@ irqreturn_t pl111_irq(int irq, void *data)
 		return IRQ_NONE;
 
 	if (irq_stat & CLCD_IRQ_NEXTBASE_UPDATE) {
-		drm_crtc_handle_vblank(&priv->pipe.crtc);
+		drm_crtc_handle_vblank(&priv->crtc);
 
 		status = IRQ_HANDLED;
 	}
@@ -49,10 +50,10 @@ irqreturn_t pl111_irq(int irq, void *data)
 }
 
 static enum drm_mode_status
-pl111_mode_valid(struct drm_simple_display_pipe *pipe,
-		 const struct drm_display_mode *mode)
+pl111_crtc_helper_mode_valid(struct drm_crtc *crtc,
+			     const struct drm_display_mode *mode)
 {
-	struct drm_device *drm = pipe->crtc.dev;
+	struct drm_device *drm = crtc->dev;
 	struct pl111_drm_dev_private *priv = drm->dev_private;
 	u32 cpp = DIV_ROUND_UP(priv->variant->fb_depth, 8);
 	u64 bw;
@@ -83,13 +84,32 @@ pl111_mode_valid(struct drm_simple_display_pipe *pipe,
 	return MODE_OK;
 }
 
-static int pl111_display_check(struct drm_simple_display_pipe *pipe,
-			       struct drm_plane_state *pstate,
-			       struct drm_crtc_state *cstate)
+static int pl111_plane_helper_atomic_check(struct drm_plane *plane,
+					   struct drm_atomic_commit *commit)
 {
-	const struct drm_display_mode *mode = &cstate->mode;
-	struct drm_framebuffer *old_fb = pipe->plane.state->fb;
+	struct drm_plane_state *pstate = drm_atomic_get_new_plane_state(commit, plane);
+	struct drm_plane_state *old_pstate = drm_atomic_get_old_plane_state(commit, plane);
+	struct drm_crtc *crtc = pstate->crtc;
+	struct drm_crtc_state *cstate = NULL;
+	const struct drm_display_mode *mode;
+	struct drm_framebuffer *old_fb = old_pstate->fb;
 	struct drm_framebuffer *fb = pstate->fb;
+	int ret;
+
+	if (crtc)
+		cstate = drm_atomic_get_new_crtc_state(commit, crtc);
+
+	ret = drm_atomic_helper_check_plane_state(pstate, cstate,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  false, false);
+	if (ret)
+		return ret;
+
+	if (!pstate->visible)
+		return 0;
+
+	mode = &cstate->mode;
 
 	if (mode->hdisplay % 16)
 		return -EINVAL;
@@ -117,16 +137,14 @@ static int pl111_display_check(struct drm_simple_display_pipe *pipe,
 	return 0;
 }
 
-static void pl111_display_enable(struct drm_simple_display_pipe *pipe,
-				 struct drm_crtc_state *cstate,
-				 struct drm_plane_state *plane_state)
+static void pl111_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					    struct drm_atomic_commit *commit)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_plane *plane = &pipe->plane;
 	struct drm_device *drm = crtc->dev;
 	struct pl111_drm_dev_private *priv = drm->dev_private;
+	struct drm_crtc_state *cstate = drm_atomic_get_new_crtc_state(commit, crtc);
 	const struct drm_display_mode *mode = &cstate->mode;
-	struct drm_framebuffer *fb = plane->state->fb;
+	struct drm_framebuffer *fb = priv->plane.state->fb;
 	struct drm_connector *connector = priv->connector;
 	struct drm_bridge *bridge = priv->bridge;
 	bool grayscale = false;
@@ -355,9 +373,9 @@ static void pl111_display_enable(struct drm_simple_display_pipe *pipe,
 		drm_crtc_vblank_on(crtc);
 }
 
-static void pl111_display_disable(struct drm_simple_display_pipe *pipe)
+static void pl111_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+					     struct drm_atomic_commit *commit)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_device *drm = crtc->dev;
 	struct pl111_drm_dev_private *priv = drm->dev_private;
 	u32 cntl;
@@ -387,38 +405,47 @@ static void pl111_display_disable(struct drm_simple_display_pipe *pipe)
 	clk_disable_unprepare(priv->clk);
 }
 
-static void pl111_display_update(struct drm_simple_display_pipe *pipe,
-				 struct drm_plane_state *old_pstate)
+static void pl111_plane_helper_atomic_update(struct drm_plane *plane,
+					     struct drm_atomic_commit *commit)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_device *drm = crtc->dev;
-	struct pl111_drm_dev_private *priv = drm->dev_private;
-	struct drm_pending_vblank_event *event = crtc->state->event;
-	struct drm_plane *plane = &pipe->plane;
-	struct drm_plane_state *pstate = plane->state;
+	struct drm_plane_state *pstate = drm_atomic_get_new_plane_state(commit, plane);
+	struct drm_crtc *crtc = pstate->crtc;
+	struct drm_device *drm;
+	struct pl111_drm_dev_private *priv;
 	struct drm_framebuffer *fb = pstate->fb;
 
-	if (fb) {
-		u32 addr = drm_fb_dma_get_gem_addr(fb, pstate, 0);
+	if (!fb)
+		return;
 
-		writel(addr, priv->regs + CLCD_UBAS);
-	}
+	drm = crtc->dev;
+	priv = drm->dev_private;
 
-	if (event) {
-		crtc->state->event = NULL;
+	u32 addr = drm_fb_dma_get_gem_addr(fb, pstate, 0);
 
-		spin_lock_irq(&crtc->dev->event_lock);
-		if (crtc->state->active && drm_crtc_vblank_get(crtc) == 0)
-			drm_crtc_arm_vblank_event(crtc, event);
-		else
-			drm_crtc_send_vblank_event(crtc, event);
-		spin_unlock_irq(&crtc->dev->event_lock);
-	}
+	writel(addr, priv->regs + CLCD_UBAS);
+}
+
+static void pl111_crtc_helper_atomic_flush(struct drm_crtc *crtc,
+					   struct drm_atomic_commit *commit)
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
 }
 
-static int pl111_display_enable_vblank(struct drm_simple_display_pipe *pipe)
+static int pl111_display_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_device *drm = crtc->dev;
 	struct pl111_drm_dev_private *priv = drm->dev_private;
 
@@ -427,21 +454,62 @@ static int pl111_display_enable_vblank(struct drm_simple_display_pipe *pipe)
 	return 0;
 }
 
-static void pl111_display_disable_vblank(struct drm_simple_display_pipe *pipe)
+static void pl111_display_disable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_device *drm = crtc->dev;
 	struct pl111_drm_dev_private *priv = drm->dev_private;
 
 	writel(0, priv->regs + priv->ienb);
 }
 
-static struct drm_simple_display_pipe_funcs pl111_display_funcs = {
-	.mode_valid = pl111_mode_valid,
-	.check = pl111_display_check,
-	.enable = pl111_display_enable,
-	.disable = pl111_display_disable,
-	.update = pl111_display_update,
+static int pl111_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_commit *commit)
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
+static struct drm_crtc_funcs pl111_crtc_funcs = {
+	.reset			= drm_atomic_helper_crtc_reset,
+	.destroy		= drm_crtc_cleanup,
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+};
+
+static const struct drm_crtc_helper_funcs pl111_crtc_helper_funcs = {
+	.mode_valid	= pl111_crtc_helper_mode_valid,
+	.atomic_check	= pl111_crtc_helper_atomic_check,
+	.atomic_enable	= pl111_crtc_helper_atomic_enable,
+	.atomic_disable	= pl111_crtc_helper_atomic_disable,
+	.atomic_flush	= pl111_crtc_helper_atomic_flush,
+};
+
+static const struct drm_plane_funcs pl111_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.reset			= drm_atomic_helper_plane_reset,
+	.destroy		= drm_plane_cleanup,
+	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+};
+
+static const struct drm_plane_helper_funcs pl111_plane_helper_funcs = {
+	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
+	.atomic_check	= pl111_plane_helper_atomic_check,
+	.atomic_update	= pl111_plane_helper_atomic_update,
+};
+
+static const struct drm_encoder_funcs pl111_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
 };
 
 static int pl111_clk_div_choose_div(struct clk_hw *hw, unsigned long rate,
@@ -583,18 +651,40 @@ int pl111_display_init(struct drm_device *drm)
 		return ret;
 
 	if (!priv->variant->broken_vblank) {
-		pl111_display_funcs.enable_vblank = pl111_display_enable_vblank;
-		pl111_display_funcs.disable_vblank = pl111_display_disable_vblank;
+		pl111_crtc_funcs.enable_vblank = pl111_display_enable_vblank;
+		pl111_crtc_funcs.disable_vblank = pl111_display_disable_vblank;
 	}
 
-	ret = drm_simple_display_pipe_init(drm, &priv->pipe,
-					   &pl111_display_funcs,
-					   priv->variant->formats,
-					   priv->variant->nformats,
-					   NULL,
-					   priv->connector);
+	ret = drm_universal_plane_init(drm, &priv->plane, 0,
+				       &pl111_plane_funcs,
+				       priv->variant->formats,
+				       priv->variant->nformats,
+				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+
+	drm_plane_helper_add(&priv->plane, &pl111_plane_helper_funcs);
+
+	ret = drm_crtc_init_with_planes(drm, &priv->crtc, &priv->plane,
+					NULL, &pl111_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+
+	drm_crtc_helper_add(&priv->crtc, &pl111_crtc_helper_funcs);
+
+	ret = drm_encoder_init(drm, &priv->encoder, &pl111_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
 	if (ret)
 		return ret;
 
+	priv->encoder.possible_crtcs = drm_crtc_mask(&priv->crtc);
+
+	if (priv->connector) {
+		ret = drm_connector_attach_encoder(priv->connector,
+						   &priv->encoder);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/pl111/pl111_drm.h b/drivers/gpu/drm/pl111/pl111_drm.h
index d1fe756444ee..ec92a5a180a8 100644
--- a/drivers/gpu/drm/pl111/pl111_drm.h
+++ b/drivers/gpu/drm/pl111/pl111_drm.h
@@ -21,7 +21,6 @@
 #include <drm/drm_encoder.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_panel.h>
-#include <drm/drm_simple_kms_helper.h>
 
 /*
  * CLCD Controller Internal Register addresses
@@ -135,7 +134,9 @@ struct pl111_drm_dev_private {
 	struct drm_connector *connector;
 	struct drm_panel *panel;
 	struct drm_bridge *bridge;
-	struct drm_simple_display_pipe pipe;
+	struct drm_plane plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
 
 	void *regs;
 	u32 memory_bw;
diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index ac7b1d12a0f5..f649c266c33a 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -168,8 +168,7 @@ static int pl111_modeset_init(struct drm_device *dev)
 		goto out_bridge;
 	}
 
-	ret = drm_simple_display_pipe_attach_bridge(&priv->pipe,
-						    bridge);
+	ret = drm_bridge_attach(&priv->encoder, bridge, NULL, 0);
 	if (ret)
 		return ret;
 

-- 
2.43.0


