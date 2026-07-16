Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39328C4450E
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 09:03:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1363592.1615192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkI0H-0003e3-86; Thu, 16 Jul 2026 09:03:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363592.1615192; Thu, 16 Jul 2026 09:03:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkI0H-0003du-1e; Thu, 16 Jul 2026 09:03:37 +0000
Received: by outflank-mailman (input) for mailman id 1363592;
 Thu, 16 Jul 2026 09:03:35 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ze.huang@oss.qualcomm.com>) id 1wkI0F-0003Wo-28
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 09:03:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkI0E-00HX3j-EJ
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 11:03:34 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a589e66-bab6-0a2a0a5309dd-0a2a4501bef8-0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 11:03:34 +0200
Received: from [205.220.168.131] (helo=mx0a-0031df01.pphosted.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a589e64-5984-0a2a45010019-cddca8830906-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 11:03:34 +0200
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66G7EDIx1884306
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 09:03:32 GMT
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feehvaxf6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 09:03:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2ccd1958e8fso43046745ad.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 02:03:31 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cf106b271asm16592555ad.64.2026.07.16.02.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2026 02:03:30 -0700 (PDT)
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
	9iNA4KkLXptEcrV9SWqVHRxO4EssLZecMFzgSPlpRjI=; b=jmdPtyHrCF2ywVB5
	hrIupyUZanurfxmEAAZZ9jT2a9GiC7DNBF9beXbCihI0oOgPiHl6BO02ffL65YC3
	Ml8DHtUml5SlEAFpiJH/Dtb/oMSdbQmCltUTV0UCcBQzR6i2nSupZUHzgs53gvpf
	0CuwKKNG6m/2oUZwVF1Fxj0qGjRKn+D5sauSFkjNF3N0YaT04xnKd2NO1uwOBkIi
	7jGDbMssRNsnFvcksJU8BVY0/XvgQQMlH4mgG3CboAdbQk/WVYgn+vnXsWdCZfnv
	1lr0LgmPqqPkzSGIBnWZL8F3BCDLwKEn+Jq16zrFVDveUw8Rq0C7x0JhFggTEvZv
	UBiZwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784192611; x=1784797411; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9iNA4KkLXptEcrV9SWqVHRxO4EssLZecMFzgSPlpRjI=;
        b=LraynV9CKxwW9Xoz2ZRMT+Zq9uH328q1muHLY+W/ghJB3J0F7UJlE+gM+lNKyRm9P9
         gSpb2NsxkE9lojV2HgKb4B8EdST17436SsJvzYJJX388X/7OBF7uWwMqefh9T8D8c10j
         6YkH4hdvBRjPsZxbrKr5wneG9KF/XM1/cJ8BVdNNcMZmKikQKUDR+TRayl7iF/u5xvox
         6ir6qR0EhChTc3u4Mi5a7InnzF6ipIGi0pXaNl03XRe5qXVzZYy+h6fldOQIJw5mFlko
         zPk1ML4wzDbCdLbGism0SuaWWfvQAx5JBwoDq3EXqmWgedQbWTGedA+ShmdhbE+y2KVL
         RmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192611; x=1784797411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9iNA4KkLXptEcrV9SWqVHRxO4EssLZecMFzgSPlpRjI=;
        b=GCKXCEULniLykScMBocTHrdAWrrMsn2WxPIOkyTvyJbTOjp93fQC1wVUvOrTI5ZMFk
         HWZCPV9XyK4mRkvb+SbLylJj0snAAoRWB1QBrNXHsobqwydS7K9mzJOAbtFqPOPt6KJA
         TulWeILQZiCpuUrKJ+cfrWP/UTlsM3pYcg+R/eM6iMae03i3Gt9A8vn+h7MrkQmh+zcb
         y6uNirTfTsstqnXvDWLmN12t63gFL9orFqEfYmXYKTQSM7LpA0n0pjy9wlpKGgh7iVSI
         aSJY/0bv4IgJxRIOJactDDIxTlMlUaGPLDhaR+lyzP+7zrTBcYAZbNoKCFRVSmisn2FE
         2eIg==
X-Forwarded-Encrypted: i=1; AHgh+Rry20qwr7Jt2KPGnLgANt7s8lOVrTfGly+4W/gFgigJvhi9xPibavh7Pc1csUWd6NrGY5ChmPhXxN4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzS0uiPbLNYMm5RWB5B+gqvSvKCnnSpb830hUT9c+BeT4DO6Hzk
	o/uXPA8WU1KxvBFfRy2S32oO2Js6k9GPTH01eTmOoexw8cmn0BPPSViNJxsKqUZdbLsjnNueItm
	pV5MnnZU18/R0Zfd/ezQ6UPQ7Z3V3H+TuP5coCsGWV65+Bo+vwHcYFh3YaMfcMo295XcDuV9Xul
	vD6Vpj
X-Gm-Gg: AfdE7clUKSvt6vTMMVnYzo2uj0plk3PYEDRCgdgUuWnXvy0hwLCmMJenSHoDJwCzwtc
	y14I8C0ths/g4E9z+XKNcVakTMVzq7ka9HYIm3oLNRhQvGqII3TpVD6gqvT8nk3yO1h/Xn/l0BJ
	GlNT9jYdcJrSFFh+UImjYIsd31Xt1fjbPLVaTeAMYnn70jguwqrRLe2TOLDTqrlNPknKuOsU5La
	u6vwTBIaycYUtJXWqj8pP0UuMok5YG6SKYuhFqXcxS+H1JxELA1bqwibWNei84pjBvVY6J/aBnB
	yjiMUkAWrJ3ZbgJk8rFFfiZEGx56aC+Rl22Bo6cvFPDqI1dMSnabhhVpzL0r5cIM2a26fGUAeVN
	sFT5V4BBMpU2grHYE7D4p
X-Received: by 2002:a17:902:fda3:b0:2ca:b4b9:4586 with SMTP id d9443c01a7336-2ce9e9ada87mr215357835ad.19.1784192610938;
        Thu, 16 Jul 2026 02:03:30 -0700 (PDT)
X-Received: by 2002:a17:902:fda3:b0:2ca:b4b9:4586 with SMTP id d9443c01a7336-2ce9e9ada87mr215357475ad.19.1784192610502;
        Thu, 16 Jul 2026 02:03:30 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 17:01:58 +0800
Subject: [PATCH v2 6/8] drm/repaper: replace struct drm_simple_display_pipe
 with regular atomic helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-drm-simple-kms-removal-v2-6-1133a8fc3785@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784192560; l=7829;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=ERhc4h2BzyHq4SLA1KLZmwEBYZNamx9DmYFgd02zfJM=;
 b=BatRP4ZlOB9sgvvfbYOlQ/D1wW3PwwrZ6A1gMipy1O2m71Q4YyK+bKZTb/u3/NYEQiEn6Dhv6
 uZCR4AWmSRVD/lNWPgDwsLkctZsl2PnzSt6mINbJ4PIs6X8p3eiyZg+
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Authority-Analysis: v=2.4 cv=ZpDd7d7G c=1 sm=1 tr=0 ts=6a589e63 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=rSXZLFMjQQqjKu18WoMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfX3E9C4QtpN89a
 K2orUPSZ2TOEGyFY3YBbJaeHGT7ZF0BCyrzIr/IQHKLs7MTj+KvFvndJAJY8pyIgNcnDTGuhJrT
 OmBCWMMaEsql9hFqI61l+Q5Zb2JskX9M4grjaxIlj6PZ05jFnt/q3hc6MbUm6w+vzNSK+wwUYJ4
 bB3T5B6cDxCb5HLiq6YGhnfy4ZhmrwcHIBnXXPv8Fj8U4xjEeUiBEn5teQeHWRwbmnRHp76MBvh
 NNDjVQb3cwfBuV/dbmtRnRMiXKGiwEOrnfkBUJM+rPwzd0SaRcOTheo6rHGIAr/Se2RtDf1qv9y
 iVhdNwdnVg8WA5TsTNeFSd/noabqORaJIBi+s2Do4D5k+YZ/UsCaEK32EMjvGhopatH8cZE6zGj
 T4TiTiCFuUYjK5cXmLqk5wjY0kcEgQX/WDci0LAFUap0fhFWC1UFEyAKuyutuUJaf5eCRFvxMc+
 IK8CAhdfpljzTO3j9DQ==
X-Proofpoint-GUID: RyZPEI-3IHwt0QYDVsr3WOtE6Q3okqni
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfX1/of5ab/smeG
 LZ+A/xiWKNWBAZpw76DA/MvseSQpHBzrFidQYNoncrUWQE3gJfX2GtBjrxrF7UGd6VU8nvr5EmU
 of+rq4fVTF61P63hOupQl6Yi7w/fMBY=
X-Proofpoint-ORIG-GUID: RyZPEI-3IHwt0QYDVsr3WOtE6Q3okqni
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160091
X-purgate-ID: tlsNG-d62444/1784192614-BE27A757-D4041D21/0/0
X-purgate-type: clean
X-purgate-size: 7831

Convert repaper to explicit primary plane, CRTC and encoder objects.

Keep shadow-plane helpers, framebuffer access handling and no-scaling
plane-state validation from simple-KMS path.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
 drivers/gpu/drm/tiny/repaper.c | 132 ++++++++++++++++++++++++++++++++---------
 1 file changed, 104 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index c8270591afc7..7057075161c4 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -22,6 +22,7 @@
 #include <linux/thermal.h>
 
 #include <drm/clients/drm_client_setup.h>
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_damage_helper.h>
@@ -38,7 +39,6 @@
 #include <drm/drm_rect.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #define REPAPER_RID_G2_COG_ID	0x12
 
@@ -65,7 +65,9 @@ enum repaper_epd_border_byte {
 
 struct repaper_epd {
 	struct drm_device drm;
-	struct drm_simple_display_pipe pipe;
+	struct drm_plane plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
 	const struct drm_display_mode *mode;
 	struct drm_connector connector;
 	struct spi_device *spi;
@@ -622,26 +624,24 @@ static void power_off(struct repaper_epd *epd)
 	gpiod_set_value_cansleep(epd->discharge, 0);
 }
 
-static enum drm_mode_status repaper_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
-						    const struct drm_display_mode *mode)
+static enum drm_mode_status repaper_crtc_helper_mode_valid(struct drm_crtc *crtc,
+							   const struct drm_display_mode *mode)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
 	struct repaper_epd *epd = drm_to_epd(crtc->dev);
 
 	return drm_crtc_helper_mode_valid_fixed(crtc, mode, epd->mode);
 }
 
-static void repaper_pipe_enable(struct drm_simple_display_pipe *pipe,
-				struct drm_crtc_state *crtc_state,
-				struct drm_plane_state *plane_state)
+static void repaper_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					      struct drm_atomic_commit *commit)
 {
-	struct repaper_epd *epd = drm_to_epd(pipe->crtc.dev);
+	struct repaper_epd *epd = drm_to_epd(crtc->dev);
 	struct spi_device *spi = epd->spi;
 	struct device *dev = &spi->dev;
 	bool dc_ok = false;
 	int i, ret, idx;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(crtc->dev, &idx))
 		return;
 
 	DRM_DEBUG_DRIVER("\n");
@@ -771,9 +771,10 @@ static void repaper_pipe_enable(struct drm_simple_display_pipe *pipe,
 	drm_dev_exit(idx);
 }
 
-static void repaper_pipe_disable(struct drm_simple_display_pipe *pipe)
+static void repaper_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+					       struct drm_atomic_commit *commit)
 {
-	struct repaper_epd *epd = drm_to_epd(pipe->crtc.dev);
+	struct repaper_epd *epd = drm_to_epd(crtc->dev);
 	struct spi_device *spi = epd->spi;
 	unsigned int line;
 
@@ -827,27 +828,84 @@ static void repaper_pipe_disable(struct drm_simple_display_pipe *pipe)
 	power_off(epd);
 }
 
-static void repaper_pipe_update(struct drm_simple_display_pipe *pipe,
-				struct drm_plane_state *old_state)
+static void repaper_plane_helper_atomic_update(struct drm_plane *plane,
+					       struct drm_atomic_commit *commit)
 {
-	struct drm_plane_state *state = pipe->plane.state;
-	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
+	struct drm_plane_state *old_pstate = drm_atomic_get_old_plane_state(commit, plane);
+	struct drm_plane_state *pstate = drm_atomic_get_new_plane_state(commit, plane);
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(pstate);
 	struct drm_rect rect;
 
-	if (!pipe->crtc.state->active)
+	if (!pstate->fb)
 		return;
 
-	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
-		repaper_fb_dirty(state->fb, shadow_plane_state->data,
+	if (drm_atomic_helper_damage_merged(old_pstate, pstate, &rect))
+		repaper_fb_dirty(pstate->fb, shadow_plane_state->data,
 				 &shadow_plane_state->fmtcnv_state);
 }
 
-static const struct drm_simple_display_pipe_funcs repaper_pipe_funcs = {
-	.mode_valid = repaper_pipe_mode_valid,
-	.enable = repaper_pipe_enable,
-	.disable = repaper_pipe_disable,
-	.update = repaper_pipe_update,
-	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
+static const struct drm_plane_funcs repaper_plane_funcs = {
+	.update_plane	= drm_atomic_helper_update_plane,
+	.disable_plane	= drm_atomic_helper_disable_plane,
+	.destroy	= drm_plane_cleanup,
+	DRM_GEM_SHADOW_PLANE_FUNCS,
+};
+
+static int repaper_plane_helper_atomic_check(struct drm_plane *plane,
+					     struct drm_atomic_commit *state)
+{
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc *crtc = plane_state->crtc;
+	struct drm_crtc_state *crtc_state = NULL;
+
+	if (crtc)
+		crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+
+	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
+						   DRM_PLANE_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
+						   false, false);
+}
+
+static const struct drm_plane_helper_funcs repaper_plane_helper_funcs = {
+	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+	.atomic_check	= repaper_plane_helper_atomic_check,
+	.atomic_update	= repaper_plane_helper_atomic_update,
+};
+
+static int repaper_crtc_helper_atomic_check(struct drm_crtc *crtc,
+					    struct drm_atomic_commit *state)
+{
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	int ret;
+
+	if (crtc_state->enable) {
+		ret = drm_atomic_helper_check_crtc_primary_plane(crtc_state);
+		if (ret)
+			return ret;
+	}
+
+	return drm_atomic_add_affected_planes(state, crtc);
+}
+
+static const struct drm_crtc_helper_funcs repaper_crtc_helper_funcs = {
+	.mode_valid	= repaper_crtc_helper_mode_valid,
+	.atomic_check	= repaper_crtc_helper_atomic_check,
+	.atomic_enable	= repaper_crtc_helper_atomic_enable,
+	.atomic_disable	= repaper_crtc_helper_atomic_disable,
+};
+
+static const struct drm_crtc_funcs repaper_crtc_funcs = {
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.reset			= drm_atomic_helper_crtc_reset,
+	.destroy		= drm_crtc_cleanup,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+};
+
+static const struct drm_encoder_funcs repaper_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
 };
 
 static int repaper_connector_get_modes(struct drm_connector *connector)
@@ -1102,9 +1160,27 @@ static int repaper_probe(struct spi_device *spi)
 	if (ret)
 		return ret;
 
-	ret = drm_simple_display_pipe_init(drm, &epd->pipe, &repaper_pipe_funcs,
-					   repaper_formats, ARRAY_SIZE(repaper_formats),
-					   NULL, &epd->connector);
+	ret = drm_universal_plane_init(drm, &epd->plane, 0,
+				       &repaper_plane_funcs,
+				       repaper_formats, ARRAY_SIZE(repaper_formats),
+				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+	drm_plane_helper_add(&epd->plane, &repaper_plane_helper_funcs);
+
+	ret = drm_crtc_init_with_planes(drm, &epd->crtc, &epd->plane, NULL,
+					&repaper_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+	drm_crtc_helper_add(&epd->crtc, &repaper_crtc_helper_funcs);
+
+	ret = drm_encoder_init(drm, &epd->encoder, &repaper_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ret;
+	epd->encoder.possible_crtcs = drm_crtc_mask(&epd->crtc);
+
+	ret = drm_connector_attach_encoder(&epd->connector, &epd->encoder);
 	if (ret)
 		return ret;
 

-- 
2.43.0


