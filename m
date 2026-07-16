Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9918AC44501
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 09:01:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1363552.1615129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkHyF-0000e9-VJ; Thu, 16 Jul 2026 09:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363552.1615129; Thu, 16 Jul 2026 09:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkHyF-0000e2-QC; Thu, 16 Jul 2026 09:01:31 +0000
Received: by outflank-mailman (input) for mailman id 1363552;
 Thu, 16 Jul 2026 09:01:30 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ze.huang@oss.qualcomm.com>) id 1wkHyE-0000dw-FO
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 09:01:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkHyD-00E1g1-HQ
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 11:01:29 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a589de8-bab6-0a2a0a5309dd-0a2a4505dbf8-8
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 11:01:29 +0200
Received: from [205.220.168.131] (helo=mx0a-0031df01.pphosted.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a589de7-4cb1-0a2a45050019-cddca8839122-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 11:01:28 +0200
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66G7DkqN1734165
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 09:01:26 GMT
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fed063h78-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 09:01:26 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-8482fd61e83so12183846b3a.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 02:01:26 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84a4ff2ea4csm4440058b3a.23.2026.07.16.02.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2026 02:01:23 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=qcppdkim1 header.d=qualcomm.com header.i="@qualcomm.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:Message-Id:MIME-Version:Subject:To"; dkim=pass header.s=google header.d=oss.qualcomm.com header.i="@oss.qualcomm.com" header.h="Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aHe2m5cGxo06ZLsxAqpXbg
	szTtwdgYS+yspxkNVpATQ=; b=nmOsfkrzgYk8dE7WGEHfC+v/aGl7NlojS+X5/m
	H8DLO/nPbeNCHL8dp+qoSQYz938QVV9Qbvcy/+gtd5IJrDzxmpiA9m3+O6Y3nh32
	GpV1JFzfBh1eXTSehRUBXTrWx/eT1hJA2JB09q6mA1obCYbp5GiaZP92oSUA6NPZ
	u9qFB+pj8R3c04MnbEPArseQpipLubQZxDJLlVJS36zJcUxkITNj49E45ss4dK2O
	mlh42d/g+tfaVjsslxG2Oz6hsv3CFqj6Skz7lpUXRQru7yr61Qfu4SCWztYOv8sP
	6S+6bErqhsvIzOjBc67gs9amgTGdFgT1LKfXNY0aNj84/ndA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784192485; x=1784797285; darn=lists.xenproject.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aHe2m5cGxo06ZLsxAqpXbgszTtwdgYS+yspxkNVpATQ=;
        b=JxNcnKvS9wsH6pMTvYKX5UEa+BKcqJHxADg5vw9MNixwgGtk5y9WiUUpUDZYKcwgT0
         QIJoGXX3zvdgcRLiEZe+zTSj0W3OYLKOyZkY+qk1jjG2U2gsI8waINdU7G3LoIWbPKK+
         TY36nfPTdLLPBv1CF9SSyxhCrVN0cnX6BnvPh+nZpD6ydagQdZfZKaFNRTL5ug2yUdGp
         OuxYp1BpDI6IvScLBylXC2UknYEJIMmHlbv739DFP3g9T3b2dOuE+MZzyHWCScAY0k8r
         Zd4QDSDxPPkPQFuNHsVI3cxecqxn4nD/d2oNwP05vKgI4xQKN3M9NgEUDtJsAKKpfkLq
         K9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192485; x=1784797285;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aHe2m5cGxo06ZLsxAqpXbgszTtwdgYS+yspxkNVpATQ=;
        b=KCkzliNhVDkpsDYZjhyttq+q0uzHP4dNNbqeL1/gH1ws++FbVFTkjVIl+xtcpsXX54
         o1dpuR8KG9RoMoQlZumbYFxx5evEU1afmWSKzmbRlA4t37+fPJZ1NkWrMtgHgM3h3h0m
         IvzrzhuCJelGuoe4fNDGp8GYRRw60iN5sPoiCmir0MRzZ/r/OLzlh+vSOBtIxNrw9Xjz
         Jwuu5CsYdHy1976rBbRH4/1CijB9M2Qs14cocoSm6YGGzaJdGIKQBf6FObq9xEqt0XCb
         5om2tbPMvlxYukHJ4v7Gf1runsXNxysRALqiv2xyf8dw6+H9oTyOmfjfhzyp2KkDrhXe
         NlZA==
X-Forwarded-Encrypted: i=1; AHgh+RrgIn83EO+CdMvskh3azWXfpAo2R/Xq/qseBNAm68cjHxOyl81kuO7UGFnLxj1gpGhPRoCFYoixBsY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw7ZdiwkEOfcCv8CsmwrFRMW59+4RU2MPD0bqpNZmG7I1Mrc43H
	aQ3mjHhoy9m2DKr/uPapukfQGoz6tdG+1L/kIKprhr7OzNTpc6jaVlgqcVGUIPnB6q8OIwERaTG
	uanGyRNbD/rPQmjsg4jJKUJ96WJq7RhcuvaNi85+gGW84fvKrbf4jcGJMfJrwfxmz2k7lDg==
X-Gm-Gg: AfdE7cl/ECJ7E1Sn3YrpJadamkAOPFSMdfd+jtSrgA1Ep2lH/Urq+/fgmsM9r2xv5hk
	ljxYWYePBWp8XHZkbPPhvzRlx2FZRA8nAD+I2hsV/oVz7pB2LyVNfxlAo+wpHTBflkAAxjz1Src
	Zqx00vSby6PaIx60zT3pWNHU+UlQOOSb28Z+nzTfCxWjvqzn4Zx+CUr4T9/T3XfOsMhhmDORjLC
	HqUB294S+EInoZ3V1KaaKw1DLl8WaRszSisN939oH24iZoAZl9phkzAMsSG+UUErg+K+q2izMdp
	KZCJ8losv/sP4iKhvc3uw4SdPZX3vfTR+M1+AFvcysQ7FvOrEjnsgTG2NeUTbXKQYfLCDxhlgK4
	s3O78frENzxTagCoX30Vy
X-Received: by 2002:a05:6a00:1943:b0:848:2f73:9000 with SMTP id d2e1a72fcca58-84a5165c6b1mr10202980b3a.73.1784192484348;
        Thu, 16 Jul 2026 02:01:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:1943:b0:848:2f73:9000 with SMTP id d2e1a72fcca58-84a5165c6b1mr10202941b3a.73.1784192483796;
        Thu, 16 Jul 2026 02:01:23 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 17:00:55 +0800
Subject: [PATCH v2] drm/imx: replace struct drm_simple_display_pipe with
 regular atomic helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-drm-simple-kms-removal-v2-1-7e4a6b8528e6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMedWGoC/3WOwQ6CMBBEf4Xs2TVtUYye/A/jodRVq5RitxAM4
 d9t0auXSSaZmTcTMAVLDIdigkCDZevbZNSqAHPX7Y3QXpIHJVQldmKDl+CQresawqdjDOT8oBs
 UUotSmkpLtYdU7gJd7bgMn85fz339IBPz2i8R6NUnYvzGoNZMaLxzNh6KzGlpjJjJKCpUO8hDd
 8vRh/dyeJBL7/dt++/bIFFgvSFptNiWlSqPnnn96nWTYeskcJ7n+QMga11FDAEAAA==
X-Change-ID: 20260704-drm-simple-kms-removal-01a031c6a129
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784192476; l=16288;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=3hp4tO1y0oFcpTWWTyITDwR1ZTZoHpK33hppfnXMd+4=;
 b=ygE4iQN91kshn1fAtLPBD1T04zXm+5QGjsvBJpjxYZR+XTulSruGaQl49D910M0pnIHV5qe0y
 4P9ah08N3WoBO3SE/69g2+APQJ0bdr+26XKTTrtiC+asfnaDiwJMyWs
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfXy8dapGA79PRX
 DaQfiSV5OJM9DgIDcV1L91Dkj3P9cn8xrETgFNl5K4TWu/rxrb2uGxchR1O174kRnjl2P2jTc/8
 PR5JDcBVL4hmBKB9Lov1TtCjc+HM9Kg=
X-Proofpoint-GUID: -wWiWKk2bScXwvPyAOpWIXCgo50-YvDq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfX0NpBejf5bEFU
 onwghMXpM2R4fQ3lONTSsVXXaEnQHgSwiF1uUJqv1bSL/vl+40vyEfpF3P0PS+70juqGCOD6PCK
 1cz8cOk7+d++S6moh2EzJOQ3MMbuhAro2wi33zW3e6T76V5NZu1IgB4X3ol7vJLkTIUo+4lYk22
 DgUtXLE2rNnO2tRkIF/eiX6UXonF+wBvcFFg2JEtcIZz2+PaEfrDpPSGgLWBvCXr+9t9XrbQ0AV
 gtgMqb5AyCHPLYAso1CDpJqX5xRWKVEjqfFmpKDWJxgtn/cK8Ho+FfVT6hy3ivvilvw6dWqvgdP
 jSlfrl4X4uzKwMhxTZ1gES7aBjfrkgYEgCyl/HqfeabNv+j2/K+QFqFZL77ni3GTRlM5k9jxgYE
 npH1ZNPAG9MVN8H1w0cTFaWE5NTNsnmbIBDFDVdVin/ftvBbE+G8DlEJrhDSZMU5amRF1JH3dyJ
 Typb0Vl1mhsctc5K7LA==
X-Authority-Analysis: v=2.4 cv=Xb25Co55 c=1 sm=1 tr=0 ts=6a589de6 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=vJQh6MS5x5Z9w99ZfooA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: -wWiWKk2bScXwvPyAOpWIXCgo50-YvDq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160091
X-purgate-ID: tlsNG-c201ff/1784192489-F56AD2A1-D8F67D55/0/0
X-purgate-type: clean
X-purgate-size: 16290

Convert i.MX LCDC to explicit primary plane, CRTC and encoder objects.
Keep no-scaling plane check and GEM framebuffer prepare callback from
simple-KMS path.

Wire the vblank lifecycle explicitly with CRTC vblank callbacks and
drm_crtc_vblank_on()/drm_crtc_vblank_off(). Use the old CRTC state in the
disable path for clock unwinding so the clock reference count remains
paired with the previous active state.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
struct drm_simple_display_pipe was meant to simplify simple DRM
drivers, but instead adds an extra wrapper around normal DRM atomic
helper setup. As noted in Documentation/gpu/todo.rst, remaining users
should be converted to regular atomic helpers and stop depending on the
simple-KMS interfaces.

Each patch replaces drm_simple_display_pipe_init() with explicit
primary plane, CRTC and encoder setup, and moves the old simple-pipe
callbacks into regular plane and CRTC helper callbacks named according
to local driver conventions.

The conversions preserve helper behavior that used to be implicit in
drm_simple_kms_helper.c, including plane-state validation, CRTC
primary-plane checks, affected-plane propagation, framebuffer prepare
handling, and existing event/vblank flow where applicable.

Result is less helper indirection and more explicit driver-side atomic
wiring, with no remaining simple-KMS dependency in these drivers.

Changes are build-tested only. No hardware testing has been performed.

This patch is based on drm-next-2026-06-27.

AI usage disclosure:
- AI tools were also used to review the code and suggest code changes for
  the DRM atomic conversion.

Thanks,
Ze Huang
---
Changes in v2:
- use 'commit' as name of struct drm_atomic_commit in atomic helpers
- improve control flow in *_crtc_helper_atomic_check() and
  *_plane_helper_atomic_check()
- Moved page-flip/vblank event handling out of plane update paths and into
  CRTC atomic_flush(), using atomic_flush and disable paths
- decide clock disable by old crtc state
- add calls to drm_crtc_vblank_on() and drm_crtc_vblank_off() in crtc
  atomic_enable() and atomic_disbale()
- test crtc_state->enable before mode size check
- Link to v1: https://patch.msgid.link/20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com
---
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c | 217 ++++++++++++++++++++++++++----------
 1 file changed, 159 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
index f52832b43aca..78eac2c4a54c 100644
--- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
+++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
@@ -14,9 +14,9 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_of.h>
+#include <drm/drm_plane_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 #include <linux/bitfield.h>
 #include <linux/clk.h>
@@ -102,7 +102,9 @@
 
 struct imx_lcdc {
 	struct drm_device drm;
-	struct drm_simple_display_pipe pipe;
+	struct drm_plane plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
 	struct drm_connector *connector;
 	void __iomem *base;
 
@@ -135,14 +137,13 @@ static unsigned int imx_lcdc_get_format(unsigned int drm_format)
 	}
 }
 
-static void imx_lcdc_update_hw_registers(struct drm_simple_display_pipe *pipe,
+static void imx_lcdc_update_hw_registers(struct drm_crtc *crtc,
 					 struct drm_plane_state *old_state,
 					 bool mode_set)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_plane_state *new_state = pipe->plane.state;
+	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(crtc->dev);
+	struct drm_plane_state *new_state = lcdc->plane.state;
 	struct drm_framebuffer *fb = new_state->fb;
-	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(pipe->crtc.dev);
 	u32 lpcr, lvcr, lhcr;
 	u32 framesize;
 	dma_addr_t addr;
@@ -188,15 +189,16 @@ static void imx_lcdc_update_hw_registers(struct drm_simple_display_pipe *pipe,
 		clk_prepare_enable(lcdc->clk_per);
 }
 
-static void imx_lcdc_pipe_enable(struct drm_simple_display_pipe *pipe,
-				 struct drm_crtc_state *crtc_state,
-				 struct drm_plane_state *plane_state)
+static void imx_lcdc_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					       struct drm_atomic_commit *commit)
 {
 	int ret;
 	int clk_div;
 	int bpp;
-	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(pipe->crtc.dev);
-	struct drm_display_mode *mode = &pipe->crtc.mode;
+	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(crtc->dev);
+	struct drm_crtc_state *cstate = drm_atomic_get_new_crtc_state(commit, crtc);
+	struct drm_plane_state *plane_state = lcdc->plane.state;
+	struct drm_display_mode *mode = &cstate->mode;
 	struct drm_display_info *disp_info = &lcdc->connector->display_info;
 	const int hsync_pol = (mode->flags & DRM_MODE_FLAG_PHSYNC) ? 0 : 1;
 	const int vsync_pol = (mode->flags & DRM_MODE_FLAG_PVSYNC) ? 0 : 1;
@@ -231,40 +233,46 @@ static void imx_lcdc_pipe_enable(struct drm_simple_display_pipe *pipe,
 
 	ret = clk_prepare_enable(lcdc->clk_ipg);
 	if (ret) {
-		dev_err(pipe->crtc.dev->dev, "Cannot enable ipg clock: %pe\n", ERR_PTR(ret));
+		dev_err(crtc->dev->dev, "Cannot enable ipg clock: %pe\n", ERR_PTR(ret));
 		return;
 	}
 	ret = clk_prepare_enable(lcdc->clk_ahb);
 	if (ret) {
-		dev_err(pipe->crtc.dev->dev, "Cannot enable ahb clock: %pe\n", ERR_PTR(ret));
+		dev_err(crtc->dev->dev, "Cannot enable ahb clock: %pe\n", ERR_PTR(ret));
 
 		clk_disable_unprepare(lcdc->clk_ipg);
 
 		return;
 	}
 
-	imx_lcdc_update_hw_registers(pipe, NULL, true);
+	imx_lcdc_update_hw_registers(crtc, NULL, true);
 
 	/* Enable VBLANK Interrupt */
 	writel(INTR_EOF, lcdc->base + IMX21LCDC_LIER);
+
+	drm_crtc_vblank_on(crtc);
 }
 
-static void imx_lcdc_pipe_disable(struct drm_simple_display_pipe *pipe)
+static void imx_lcdc_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+						struct drm_atomic_commit *commit)
 {
-	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(pipe->crtc.dev);
-	struct drm_crtc *crtc = &lcdc->pipe.crtc;
+	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(commit, crtc);
+	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(commit, crtc);
+	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(crtc->dev);
 	struct drm_pending_vblank_event *event;
 
+	drm_crtc_vblank_off(crtc);
+
 	clk_disable_unprepare(lcdc->clk_ahb);
 	clk_disable_unprepare(lcdc->clk_ipg);
 
-	if (pipe->crtc.enabled)
+	if (old_crtc_state->enable)
 		clk_disable_unprepare(lcdc->clk_per);
 
 	spin_lock_irq(&lcdc->drm.event_lock);
-	event = crtc->state->event;
+	event = new_crtc_state->event;
 	if (event) {
-		crtc->state->event = NULL;
+		new_crtc_state->event = NULL;
 		drm_crtc_send_vblank_event(crtc, event);
 	}
 	spin_unlock_irq(&lcdc->drm.event_lock);
@@ -273,17 +281,20 @@ static void imx_lcdc_pipe_disable(struct drm_simple_display_pipe *pipe)
 	writel(0, lcdc->base + IMX21LCDC_LIER);
 }
 
-static int imx_lcdc_pipe_check(struct drm_simple_display_pipe *pipe,
-			       struct drm_plane_state *plane_state,
-			       struct drm_crtc_state *crtc_state)
+static int imx_lcdc_crtc_helper_atomic_check(struct drm_crtc *crtc,
+					     struct drm_atomic_commit *commit)
 {
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(commit, crtc);
+	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(commit, crtc);
 	const struct drm_display_mode *mode = &crtc_state->mode;
-	const struct drm_display_mode *old_mode = &pipe->crtc.state->mode;
+	const struct drm_display_mode *old_mode = &old_crtc_state->mode;
+	int ret;
 
-	if (mode->hdisplay < LCDC_MIN_XRES || mode->hdisplay > LCDC_MAX_XRES ||
-	    mode->vdisplay < LCDC_MIN_YRES || mode->vdisplay > LCDC_MAX_YRES ||
-	    mode->hdisplay % 0x10) { /* must be multiple of 16 */
-		drm_err(pipe->crtc.dev, "unsupported display mode (%u x %u)\n",
+	if (crtc_state->enable &&
+	    (mode->hdisplay < LCDC_MIN_XRES || mode->hdisplay > LCDC_MAX_XRES ||
+	     mode->vdisplay < LCDC_MIN_YRES || mode->vdisplay > LCDC_MAX_YRES ||
+	     mode->hdisplay % 0x10)) { /* must be multiple of 16 */
+		drm_err(crtc->dev, "unsupported display mode (%u x %u)\n",
 			mode->hdisplay, mode->vdisplay);
 		return -EINVAL;
 	}
@@ -292,46 +303,116 @@ static int imx_lcdc_pipe_check(struct drm_simple_display_pipe *pipe,
 		old_mode->hdisplay != mode->hdisplay ||
 		old_mode->vdisplay != mode->vdisplay;
 
-	return 0;
+	if (crtc_state->enable) {
+		ret = drm_atomic_helper_check_crtc_primary_plane(crtc_state);
+		if (ret)
+			return ret;
+	}
+
+	return drm_atomic_add_affected_planes(commit, crtc);
 }
 
-static void imx_lcdc_pipe_update(struct drm_simple_display_pipe *pipe,
-				 struct drm_plane_state *old_state)
+static void imx_lcdc_plane_helper_atomic_update(struct drm_plane *plane,
+						struct drm_atomic_commit *commit)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_pending_vblank_event *event = crtc->state->event;
-	struct drm_plane_state *new_state = pipe->plane.state;
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(commit, plane);
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(commit, plane);
+	struct drm_crtc *crtc = new_state->crtc ?: old_state->crtc;
 	struct drm_framebuffer *fb = new_state->fb;
 	struct drm_framebuffer *old_fb = old_state->fb;
 	struct drm_crtc *old_crtc = old_state->crtc;
 	bool mode_changed = false;
 
+	if (!fb)
+		return;
+
 	if (old_fb && old_fb->format != fb->format)
 		mode_changed = true;
 	else if (old_crtc != crtc)
 		mode_changed = true;
 
-	imx_lcdc_update_hw_registers(pipe, old_state, mode_changed);
+	imx_lcdc_update_hw_registers(crtc, old_state, mode_changed);
+}
 
-	if (event) {
-		crtc->state->event = NULL;
+static int imx_lcdc_plane_helper_atomic_check(struct drm_plane *plane,
+					      struct drm_atomic_commit *commit)
+{
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(commit, plane);
+	struct drm_crtc *crtc = plane_state->crtc;
+	struct drm_crtc_state *crtc_state = NULL;
 
-		spin_lock_irq(&crtc->dev->event_lock);
+	if (crtc)
+		crtc_state = drm_atomic_get_new_crtc_state(commit, crtc);
 
-		if (crtc->state->active && drm_crtc_vblank_get(crtc) == 0)
-			drm_crtc_arm_vblank_event(crtc, event);
-		else
-			drm_crtc_send_vblank_event(crtc, event);
+	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
+						   DRM_PLANE_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
+						   false, false);
+}
 
-		spin_unlock_irq(&crtc->dev->event_lock);
-	}
+static const struct drm_plane_helper_funcs imx_lcdc_plane_helper_funcs = {
+	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
+	.atomic_check	= imx_lcdc_plane_helper_atomic_check,
+	.atomic_update	= imx_lcdc_plane_helper_atomic_update,
+};
+
+static const struct drm_plane_funcs imx_lcdc_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.destroy		= drm_plane_cleanup,
+	.reset			= drm_atomic_helper_plane_reset,
+	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+};
+
+static void imx_lcdc_crtc_helper_atomic_flush(struct drm_crtc *crtc,
+					      struct drm_atomic_commit *commit)
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
+	if (new_crtc_state->active && drm_crtc_vblank_get(crtc) == 0)
+		drm_crtc_arm_vblank_event(crtc, event);
+	else
+		drm_crtc_send_vblank_event(crtc, event);
+	spin_unlock_irq(&crtc->dev->event_lock);
 }
 
-static const struct drm_simple_display_pipe_funcs imx_lcdc_pipe_funcs = {
-	.enable = imx_lcdc_pipe_enable,
-	.disable = imx_lcdc_pipe_disable,
-	.check = imx_lcdc_pipe_check,
-	.update = imx_lcdc_pipe_update,
+static const struct drm_crtc_helper_funcs imx_lcdc_crtc_helper_funcs = {
+	.atomic_check	= imx_lcdc_crtc_helper_atomic_check,
+	.atomic_enable	= imx_lcdc_crtc_helper_atomic_enable,
+	.atomic_disable	= imx_lcdc_crtc_helper_atomic_disable,
+	.atomic_flush	= imx_lcdc_crtc_helper_atomic_flush,
+};
+
+static int imx_lcdc_crtc_enable_vblank(struct drm_crtc *crtc)
+{
+	return 0;
+}
+
+static void imx_lcdc_crtc_disable_vblank(struct drm_crtc *crtc)
+{
+}
+
+static const struct drm_crtc_funcs imx_lcdc_crtc_funcs = {
+	.reset			= drm_atomic_helper_crtc_reset,
+	.destroy		= drm_crtc_cleanup,
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+	.enable_vblank		= imx_lcdc_crtc_enable_vblank,
+	.disable_vblank		= imx_lcdc_crtc_disable_vblank,
+};
+
+static const struct drm_encoder_funcs imx_lcdc_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
 };
 
 static const struct drm_mode_config_funcs imx_lcdc_mode_config_funcs = {
@@ -369,7 +450,7 @@ MODULE_DEVICE_TABLE(of, imx_lcdc_of_dev_id);
 static irqreturn_t imx_lcdc_irq_handler(int irq, void *arg)
 {
 	struct imx_lcdc *lcdc = arg;
-	struct drm_crtc *crtc = &lcdc->pipe.crtc;
+	struct drm_crtc *crtc = &lcdc->crtc;
 	unsigned int status;
 
 	status = readl(lcdc->base + IMX21LCDC_LISR);
@@ -387,6 +468,9 @@ static int imx_lcdc_probe(struct platform_device *pdev)
 	struct imx_lcdc *lcdc;
 	struct drm_device *drm;
 	struct drm_bridge *bridge;
+	struct drm_plane *plane;
+	struct drm_crtc *crtc;
+	struct drm_encoder *encoder;
 	int irq;
 	int ret;
 	struct device *dev = &pdev->dev;
@@ -428,23 +512,40 @@ static int imx_lcdc_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Cannot initialize mode configuration structure\n");
 
-	/* CRTC, Plane, Encoder */
-	ret = drm_simple_display_pipe_init(drm, &lcdc->pipe,
-					   &imx_lcdc_pipe_funcs,
-					   imx_lcdc_formats,
-					   ARRAY_SIZE(imx_lcdc_formats), NULL, NULL);
+	plane = &lcdc->plane;
+	ret = drm_universal_plane_init(drm, plane, 0,
+				       &imx_lcdc_plane_funcs,
+				       imx_lcdc_formats,
+				       ARRAY_SIZE(imx_lcdc_formats),
+				       NULL,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret < 0)
+		return dev_err_probe(drm->dev, ret, "Cannot initialize primary plane\n");
+	drm_plane_helper_add(plane, &imx_lcdc_plane_helper_funcs);
+
+	crtc = &lcdc->crtc;
+	ret = drm_crtc_init_with_planes(drm, crtc, plane, NULL,
+					&imx_lcdc_crtc_funcs, NULL);
+	if (ret < 0)
+		return dev_err_probe(drm->dev, ret, "Cannot initialize CRTC\n");
+	drm_crtc_helper_add(crtc, &imx_lcdc_crtc_helper_funcs);
+
+	encoder = &lcdc->encoder;
+	ret = drm_encoder_init(drm, encoder, &imx_lcdc_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
 	if (ret < 0)
-		return dev_err_probe(drm->dev, ret, "Cannot setup simple display pipe\n");
+		return dev_err_probe(drm->dev, ret, "Cannot initialize encoder\n");
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
 	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
 	if (ret < 0)
 		return dev_err_probe(drm->dev, ret, "Failed to initialize vblank\n");
 
-	ret = drm_bridge_attach(&lcdc->pipe.encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	ret = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
 		return dev_err_probe(drm->dev, ret, "Cannot attach bridge\n");
 
-	lcdc->connector = drm_bridge_connector_init(drm, &lcdc->pipe.encoder);
+	lcdc->connector = drm_bridge_connector_init(drm, encoder);
 	if (IS_ERR(lcdc->connector))
 		return dev_err_probe(drm->dev, PTR_ERR(lcdc->connector), "Cannot init bridge connector\n");
 

---
base-commit: 3696d07837d1df13a5603d77f667685e7dfb3c53
change-id: 20260704-drm-simple-kms-removal-01a031c6a129

Best regards,
-- 
Ze Huang <ze.huang@oss.qualcomm.com>


