Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30961C531C9
	for <xen-devel@archiver.kernel.org>; Sun, 26 Jul 2026 19:48:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371257.1618900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wo4q6-0008VT-8k; Sun, 26 Jul 2026 19:48:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371257.1618900; Sun, 26 Jul 2026 19:48:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wo4q6-0008VM-62; Sun, 26 Jul 2026 19:48:46 +0000
Received: by outflank-mailman (input) for mailman id 1371257;
 Sun, 26 Jul 2026 19:48:45 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ze.huang@oss.qualcomm.com>) id 1wo4q5-0008VC-5y
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2026 19:48:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wo4q4-006Cnf-4C
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2026 21:48:44 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a66645d-5cb7-0a2a0a5109dd-0a2a4507acf6-10
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 21:48:44 +0200
Received: from [205.220.168.131] (helo=mx0a-0031df01.pphosted.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a666421-b4ea-0a2a45070019-cddca8837034-3
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 21:46:43 +0200
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66QH7IYw721716
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 19:46:41 GMT
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmpajkckx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 19:46:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-38e1118e4abso3439203a91.0
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 12:46:41 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38f03b0eaa8sm4105998a91.8.2026.07.26.12.46.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2026 12:46:39 -0700 (PDT)
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
	wSGeQRwMP4eO9GjmSugudIPnkFmlYP4r8d4tXRAJ/XE=; b=KhyqLUahopd1K+8F
	/i7o6UN4Zy4pvwoukMXxUan1QmeEdB8UIb9Ks8LzYVawYUykG71n98l1/g4JQihk
	zsAB4zh6e/2qkEhaZ/XIaXpbmeevlQ/9AwssdwfNZfZTL8xE70i1bgSpzqNSvVGA
	HEiC9jox5mGm/z3/nHocm7ymikNfv3bMB+nzN9oQLceFfKRH5WE7KehG9KoAucVV
	X1A+rbGBCf2dwZFDvi1gJ8iTE2R/KtK/KrgnYxMpDPG11DrG5ZE0e0pnGcKAJLoL
	yykF0vrX80gwHl2keJetGHSUKwpA2Nfe6p6KfuBq/xXj8lQc2k4WfhcDE+U7jxlR
	7+79yw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785095201; x=1785700001; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wSGeQRwMP4eO9GjmSugudIPnkFmlYP4r8d4tXRAJ/XE=;
        b=Nx/0nPeaERZu9bQA1/FGTQa6Taq/6TADyGpBUBRJMTM8okG6qAyi2/BNX4UvmmJb5j
         Y7JWg2o6j6/JxVYSJ6r/3pCUmknrHwQADnmjHt67dk90XOLtglruadrtcJw4cNRmSa4W
         0CsWKWI08+hXxysWJO3qs2c7qvw7RzxWdv8gOSLQhWcHtzcfXU11YkIu6cI6561Ev8go
         GUJBk0YbE+Da3TzAz9zGVKC6XqxqBIm+6td6fi/U9OGnYnplL15OJ7VWG1et0lpAr1GY
         HyzFOGjRk7QIpOO1DgAPRkdYLef6F4Ivsa+7n4hBdLi9n4fUrzXTbOKTgcwYO62MKP/q
         1RHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785095201; x=1785700001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wSGeQRwMP4eO9GjmSugudIPnkFmlYP4r8d4tXRAJ/XE=;
        b=occle3yfMkGG0jJpPGhyk3D/JYG4e3GCSwLCSil+dre5rOeZP7kHv/w4Rwcqs21h0e
         WDa4/wAOr+Lb+XkMMMtWNjGehPfLJF5Pn2SZ4v93i2WXVPvQS+COi3aeDHGzAkzD5WvA
         f3nMN6PtGpz0WDZiBQjSpOBS75AHPl+Y1kV/yZTBPNFV7j26Gzvymf45DYwDRAD+s5kC
         ktwDk4A4bGlzlPuZYK6nMrySr7uzV84+udaGJo8nOH8v83XtkQJ4lenyvQQpEjdqhbxV
         UMuKgOE60ofrC4szopqvKaWW+HuvqHWtewKY+NJUR11TuOzB3HWyJ+RaOQD9c1w9ww2Y
         S9yQ==
X-Forwarded-Encrypted: i=1; AHgh+RovzHKkgJ9rmqTQa1e0wkMBO7fhNHlXg5iPQjkFkgoAqeKahn6SDYF4o8cv+6dLvOO70GjuXlU0lag=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxDHtpcxJ1QOLlpRs7LwNBMVvAqm7sbTEMbK8PVRjsXjOewq1Mu
	7vQloKpUL8SHm+abRinf30mZXeAX4Ab4VM942iRpYirWFVtILQmcr7VhvgoptUOnHHOFDa0FxGq
	WD1p/p2RrKNzXEqcGabxWabgNxly/uYIwJmxxAbv2C5qt5M4LhHNR3ZIZZRtQF/UtVWp0RA==
X-Gm-Gg: AR+sD11J8EVqtg1/15O42I1m1T0xWX+KWMaWcYWlVhh4W0u4fcC17BsMcsokiNKTtLl
	ZfokWU1JpeXU89hUfO0fEsQ+x/OGV7jsGjywqkUGtLfD6ZdsZoQKRIF9bfsLc3/Mk3L/L6tAbnv
	/u6b0tl+xb6rv07JAFwAgg0RYILZq0SQap+9nO4AehRnNhaNNMN6EPXRiU+AaXstq0HaolNlE2J
	V358DLvGNXqgaNoqGVp69veDMughv0a2ssvcqDYg2+XnkKM8Nwat08cuSzQHH9KlVIjGbDveXZF
	FN29oa40ZZO8hJifJmCsmZMdtc5uGoMVoPA0ZKMA+v2LTFB6bTeelG+QKK3cFWM10JDb8a37C5x
	WtELYMz3FqU+ugs4o6Uei
X-Received: by 2002:a17:90b:1d44:b0:381:28e0:624d with SMTP id 98e67ed59e1d1-38f29613652mr5757545a91.28.1785095200542;
        Sun, 26 Jul 2026 12:46:40 -0700 (PDT)
X-Received: by 2002:a17:90b:1d44:b0:381:28e0:624d with SMTP id 98e67ed59e1d1-38f29613652mr5757521a91.28.1785095200078;
        Sun, 26 Jul 2026 12:46:40 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 03:45:21 +0800
Subject: [PATCH v3 8/8] drm/xen: replace struct drm_simple_display_pipe
 with regular atomic helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-drm-simple-kms-removal-v3-8-cd5dc89858c6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785095129; l=12894;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=PBi4kPXC6bDPKtTGd5qKGiDifkO/iF7Wup738qwpRwk=;
 b=oinILOU2wbGLYnenfbXSKIYuY97ShWRNCMA98C159D9els3KvEJFV0EOtNDjwTl46s7UQU1oH
 AXM4ZR3zIj+Bsp+yxt1D7aR4Bdwl0q4QKSVjC9zIMUkDziqZf2vfXbJ
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Proofpoint-ORIG-GUID: 4p9saFLZ7Zbyib6NO2cC0sMRwcSuqeBz
X-Authority-Analysis: v=2.4 cv=A8Bc+aWG c=1 sm=1 tr=0 ts=6a666421 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ypIeFc3LJoL4UEiODvkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 4p9saFLZ7Zbyib6NO2cC0sMRwcSuqeBz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDIwMSBTYWx0ZWRfX+HJ/VNpxzAZy
 WdEansgk8pNVw4+Fg16kQJ0j5J46Biz53CmCfU7E8PXeve+RjsflSqfaKCTJTTJ4CFeR8NHBgr5
 w8cm1aUIHh1CfQpJErdeRgeKXarTDSG6M6CXamZ6QCCZwqWPuJEINPn0K0jUWy22gczbGHAJNYW
 HQdh5eHv8bmWx88cAUAunxzLnq9ZPC27em07MuUUry5RI2gd4NhnMXKdCpzXAz78zyg8hYafYQz
 h8/VrxhLZnkhhkNDG8BB+idH3M0gzbDeZCFTaLJLQw4ZcZbTxxPhG3UiDSvZEjg+RPmimDqBM7B
 Le9oeNp0E+FTLmu7BjeHY2ZMHx4mCGBUr4Y/mGYDQFZSwGNOmoc0tbMGXl6fPCb6uz8Jo5sWssQ
 YfC1l7FEcriTB5XOwkqDJun4kparURYq4NHTZm9a4fbANqLcFy40RQKuDwoKCuw4KUv+gfFC1YM
 eqTzhT4YcWmZaA5/raA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDIwMSBTYWx0ZWRfX0Q5Kd6CCqNqU
 py7Tt9oYYRiTFeGmUptBdtEqrhak8+0j2GDCtmqqnCEpZ5pF2K4eFaM9IfV//WjbwPJMdIPufD4
 9I868wT8bC4vB/e1cAIGjDCoQsMgPEs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260201
X-purgate-ID: tlsNG-ef75cf/1785095203-35CC7AE4-DF3B5BF5/0/0
X-purgate-type: clean
X-purgate-size: 12896

Replace the Xen frontend simple display pipe with explicit plane, CRTC
and encoder objects for each pipeline.

Keep generic plane-state validation before Xen-specific checks, and
install the GEM framebuffer prepare helper explicitly.

Use commit-local plane state in the CRTC enable path and pass the new
plane source position to the backend mode-set request. Handle pending
page-flip events through the commit-local CRTC state in the plane update
path.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>

---
Changes in v3:
- Use commit-local plane state in the CRTC enable path.
- Pass the new plane source position to the xen_drm_front_mode_set.
- Make the container helpers static inline.
---
 drivers/gpu/drm/xen/xen_drm_front.h     |   6 +-
 drivers/gpu/drm/xen/xen_drm_front_kms.c | 188 +++++++++++++++++++++++---------
 2 files changed, 142 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front.h b/drivers/gpu/drm/xen/xen_drm_front.h
index a987c78abe41..02138b5abef5 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.h
+++ b/drivers/gpu/drm/xen/xen_drm_front.h
@@ -14,7 +14,7 @@
 #include <linux/scatterlist.h>
 
 #include <drm/drm_connector.h>
-#include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_encoder.h>
 
 #include "xen_drm_front_cfg.h"
 
@@ -100,7 +100,9 @@ struct xen_drm_front_drm_pipeline {
 
 	int index;
 
-	struct drm_simple_display_pipe pipe;
+	struct drm_plane plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
 
 	struct drm_connector conn;
 	/* These are only for connector mode checking */
diff --git a/drivers/gpu/drm/xen/xen_drm_front_kms.c b/drivers/gpu/drm/xen/xen_drm_front_kms.c
index 48772b5fe71c..9896ea35b743 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
@@ -30,10 +30,16 @@
  */
 #define FRAME_DONE_TO_MS	(XEN_DRM_FRONT_WAIT_BACK_MS + 100)
 
-static struct xen_drm_front_drm_pipeline *
-to_xen_drm_pipeline(struct drm_simple_display_pipe *pipe)
+static inline struct xen_drm_front_drm_pipeline *
+xen_drm_pipeline_from_crtc(struct drm_crtc *crtc)
 {
-	return container_of(pipe, struct xen_drm_front_drm_pipeline, pipe);
+	return container_of(crtc, struct xen_drm_front_drm_pipeline, crtc);
+}
+
+static inline struct xen_drm_front_drm_pipeline *
+xen_drm_pipeline_from_plane(struct drm_plane *plane)
+{
+	return container_of(plane, struct xen_drm_front_drm_pipeline, plane);
 }
 
 static void fb_destroy(struct drm_framebuffer *fb)
@@ -94,7 +100,7 @@ static const struct drm_mode_config_funcs mode_config_funcs = {
 
 static void send_pending_event(struct xen_drm_front_drm_pipeline *pipeline)
 {
-	struct drm_crtc *crtc = &pipeline->pipe.crtc;
+	struct drm_crtc *crtc = &pipeline->crtc;
 	struct drm_device *dev = crtc->dev;
 	unsigned long flags;
 
@@ -105,24 +111,21 @@ static void send_pending_event(struct xen_drm_front_drm_pipeline *pipeline)
 	spin_unlock_irqrestore(&dev->event_lock, flags);
 }
 
-static void display_enable(struct drm_simple_display_pipe *pipe,
-			   struct drm_crtc_state *crtc_state,
-			   struct drm_plane_state *plane_state)
+static void xen_drm_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					      struct drm_atomic_commit *commit)
 {
-	struct xen_drm_front_drm_pipeline *pipeline =
-			to_xen_drm_pipeline(pipe);
-	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_framebuffer *fb = plane_state->fb;
+	struct xen_drm_front_drm_pipeline *pipeline = xen_drm_pipeline_from_crtc(crtc);
+	struct drm_plane_state *pstate = drm_atomic_get_new_plane_state(commit, &pipeline->plane);
+	struct drm_framebuffer *fb = pstate->fb;
 	int ret, idx;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(crtc->dev, &idx))
 		return;
 
-	ret = xen_drm_front_mode_set(pipeline, crtc->x, crtc->y,
+	ret = xen_drm_front_mode_set(pipeline, pstate->crtc_x, pstate->crtc_y,
 				     fb->width, fb->height,
 				     fb->format->cpp[0] * 8,
 				     xen_drm_front_fb_to_cookie(fb));
-
 	if (ret) {
 		DRM_ERROR("Failed to enable display: %d\n", ret);
 		pipeline->conn_connected = false;
@@ -131,13 +134,13 @@ static void display_enable(struct drm_simple_display_pipe *pipe,
 	drm_dev_exit(idx);
 }
 
-static void display_disable(struct drm_simple_display_pipe *pipe)
+static void xen_drm_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+					       struct drm_atomic_commit *commit)
 {
-	struct xen_drm_front_drm_pipeline *pipeline =
-			to_xen_drm_pipeline(pipe);
+	struct xen_drm_front_drm_pipeline *pipeline = xen_drm_pipeline_from_crtc(crtc);
 	int ret = 0, idx;
 
-	if (drm_dev_enter(pipe->crtc.dev, &idx)) {
+	if (drm_dev_enter(crtc->dev, &idx)) {
 		ret = xen_drm_front_mode_set(pipeline, 0, 0, 0, 0, 0,
 					     xen_drm_front_fb_to_cookie(NULL));
 		drm_dev_exit(idx);
@@ -177,12 +180,13 @@ static void pflip_to_worker(struct work_struct *work)
 	send_pending_event(pipeline);
 }
 
-static bool display_send_page_flip(struct drm_simple_display_pipe *pipe,
+static bool display_send_page_flip(struct xen_drm_front_drm_pipeline *pipeline,
+				   struct drm_atomic_commit *commit,
 				   struct drm_plane_state *old_plane_state)
 {
 	struct drm_plane_state *plane_state =
-			drm_atomic_get_new_plane_state(old_plane_state->state,
-						       &pipe->plane);
+			drm_atomic_get_new_plane_state(commit,
+						       &pipeline->plane);
 
 	/*
 	 * If old_plane_state->fb is NULL and plane_state->fb is not,
@@ -193,8 +197,6 @@ static bool display_send_page_flip(struct drm_simple_display_pipe *pipe,
 	 * sent to the backend as a part of display_set_config call.
 	 */
 	if (old_plane_state->fb && plane_state->fb) {
-		struct xen_drm_front_drm_pipeline *pipeline =
-				to_xen_drm_pipeline(pipe);
 		struct xen_drm_front_drm_info *drm_info = pipeline->drm_info;
 		int ret;
 
@@ -224,10 +226,29 @@ static bool display_send_page_flip(struct drm_simple_display_pipe *pipe,
 	return false;
 }
 
-static int display_check(struct drm_simple_display_pipe *pipe,
-			 struct drm_plane_state *plane_state,
-			 struct drm_crtc_state *crtc_state)
+static int xen_drm_plane_helper_atomic_check(struct drm_plane *plane,
+					     struct drm_atomic_commit *commit)
 {
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(commit, plane);
+	struct drm_crtc_state *crtc_state = NULL;
+	int ret;
+
+	if (plane_state->crtc) {
+		crtc_state = drm_atomic_get_crtc_state(commit, plane_state->crtc);
+		if (IS_ERR(crtc_state))
+			return PTR_ERR(crtc_state);
+	}
+
+	ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  false, false);
+	if (ret)
+		return ret;
+
+	if (!plane_state->visible || !crtc_state)
+		return 0;
+
 	/*
 	 * Xen doesn't initialize vblanking via drm_vblank_init(), so
 	 * DRM helpers assume that it doesn't handle vblanking and start
@@ -242,16 +263,17 @@ static int display_check(struct drm_simple_display_pipe *pipe,
 	return 0;
 }
 
-static void display_update(struct drm_simple_display_pipe *pipe,
-			   struct drm_plane_state *old_plane_state)
+static void xen_drm_plane_helper_atomic_update(struct drm_plane *plane,
+					       struct drm_atomic_commit *commit)
 {
-	struct xen_drm_front_drm_pipeline *pipeline =
-			to_xen_drm_pipeline(pipe);
-	struct drm_crtc *crtc = &pipe->crtc;
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(commit, plane);
+	struct xen_drm_front_drm_pipeline *pipeline = xen_drm_pipeline_from_plane(plane);
+	struct drm_crtc *crtc = &pipeline->crtc;
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(commit, crtc);
 	struct drm_pending_vblank_event *event;
 	int idx;
 
-	event = crtc->state->event;
+	event = crtc_state ? crtc_state->event : NULL;
 	if (event) {
 		struct drm_device *dev = crtc->dev;
 		unsigned long flags;
@@ -259,13 +281,13 @@ static void display_update(struct drm_simple_display_pipe *pipe,
 		WARN_ON(pipeline->pending_event);
 
 		spin_lock_irqsave(&dev->event_lock, flags);
-		crtc->state->event = NULL;
+		crtc_state->event = NULL;
 
 		pipeline->pending_event = event;
 		spin_unlock_irqrestore(&dev->event_lock, flags);
 	}
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx)) {
+	if (!drm_dev_enter(crtc->dev, &idx)) {
 		send_pending_event(pipeline);
 		return;
 	}
@@ -278,19 +300,17 @@ static void display_update(struct drm_simple_display_pipe *pipe,
 	 * If this is not a page flip, e.g. no flip done event from the backend
 	 * is expected, then send now.
 	 */
-	if (!display_send_page_flip(pipe, old_plane_state))
+	if (!display_send_page_flip(pipeline, commit, old_plane_state))
 		send_pending_event(pipeline);
 
 	drm_dev_exit(idx);
 }
 
 static enum drm_mode_status
-display_mode_valid(struct drm_simple_display_pipe *pipe,
-		   const struct drm_display_mode *mode)
+xen_drm_crtc_helper_mode_valid(struct drm_crtc *crtc,
+			       const struct drm_display_mode *mode)
 {
-	struct xen_drm_front_drm_pipeline *pipeline =
-			container_of(pipe, struct xen_drm_front_drm_pipeline,
-				     pipe);
+	struct xen_drm_front_drm_pipeline *pipeline = xen_drm_pipeline_from_crtc(crtc);
 
 	if (mode->hdisplay != pipeline->width)
 		return MODE_ERROR;
@@ -301,12 +321,53 @@ display_mode_valid(struct drm_simple_display_pipe *pipe,
 	return MODE_OK;
 }
 
-static const struct drm_simple_display_pipe_funcs display_funcs = {
-	.mode_valid = display_mode_valid,
-	.enable = display_enable,
-	.disable = display_disable,
-	.check = display_check,
-	.update = display_update,
+static int xen_drm_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_commit *commit)
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
+static const struct drm_plane_helper_funcs display_plane_helper_funcs = {
+	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
+	.atomic_check	= xen_drm_plane_helper_atomic_check,
+	.atomic_update	= xen_drm_plane_helper_atomic_update,
+};
+
+static const struct drm_plane_funcs display_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.destroy		= drm_plane_cleanup,
+	.reset			= drm_atomic_helper_plane_reset,
+	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+};
+
+static const struct drm_crtc_helper_funcs display_crtc_helper_funcs = {
+	.mode_valid	= xen_drm_crtc_helper_mode_valid,
+	.atomic_check	= xen_drm_crtc_helper_atomic_check,
+	.atomic_enable	= xen_drm_crtc_helper_atomic_enable,
+	.atomic_disable	= xen_drm_crtc_helper_atomic_disable,
+};
+
+static const struct drm_crtc_funcs display_crtc_funcs = {
+	.reset			= drm_atomic_helper_crtc_reset,
+	.destroy		= drm_crtc_cleanup,
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+};
+
+static const struct drm_encoder_funcs display_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
 };
 
 static int display_pipe_init(struct xen_drm_front_drm_info *drm_info,
@@ -331,10 +392,37 @@ static int display_pipe_init(struct xen_drm_front_drm_info *drm_info,
 
 	formats = xen_drm_front_conn_get_formats(&format_count);
 
-	return drm_simple_display_pipe_init(dev, &pipeline->pipe,
-					    &display_funcs, formats,
-					    format_count, NULL,
-					    &pipeline->conn);
+	ret = drm_universal_plane_init(dev, &pipeline->plane, 0,
+				       &display_plane_funcs,
+				       formats, format_count,
+				       NULL,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+
+	drm_plane_helper_add(&pipeline->plane, &display_plane_helper_funcs);
+
+	ret = drm_crtc_init_with_planes(dev, &pipeline->crtc,
+					&pipeline->plane, NULL,
+					&display_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+
+	drm_crtc_helper_add(&pipeline->crtc, &display_crtc_helper_funcs);
+
+	ret = drm_encoder_init(dev, &pipeline->encoder,
+			       &display_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ret;
+
+	pipeline->encoder.possible_crtcs = drm_crtc_mask(&pipeline->crtc);
+
+	ret = drm_connector_attach_encoder(&pipeline->conn, &pipeline->encoder);
+	if (ret)
+		return ret;
+
+	return 0;
 }
 
 int xen_drm_front_kms_init(struct xen_drm_front_drm_info *drm_info)

-- 
2.43.0


