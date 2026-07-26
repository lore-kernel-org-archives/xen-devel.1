Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F414FC53219
	for <xen-devel@archiver.kernel.org>; Sun, 26 Jul 2026 19:46:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371225.1618891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wo4nm-0006t8-O2; Sun, 26 Jul 2026 19:46:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371225.1618891; Sun, 26 Jul 2026 19:46:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wo4nm-0006t1-KT; Sun, 26 Jul 2026 19:46:22 +0000
Received: by outflank-mailman (input) for mailman id 1371225;
 Sun, 26 Jul 2026 19:46:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ze.huang@oss.qualcomm.com>) id 1wo4nl-0006on-0r
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2026 19:46:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wo4nk-009ZKg-E4
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2026 21:46:20 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a666404-5cb7-0a2a0a5109dd-0a2a4509e246-4
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 21:46:20 +0200
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a66640b-be1a-0a2a45090019-cddcb4831ac0-3
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 21:46:20 +0200
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66QH73jb1333213
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 19:46:18 GMT
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmn7vbjrp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 19:46:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-38dc085b0a7so3816717a91.2
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 12:46:18 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38f03b0eaa8sm4105998a91.8.2026.07.26.12.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2026 12:46:16 -0700 (PDT)
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
	tzBRrJFfWf9nuUSk+Umahe/GXjmEn4PayMptDA8R4co=; b=eSrHRae+4KBJsqzq
	PRmZQmIoQ8J6u9+blj/zwfOFX54m0IOTPrB/iPVShNYnvFDCwzhSKRSqlVKDvuNs
	vA+xR14w273BsD0kDwfefgw+yW4p6AFSBDFMfZ3fpzle9yt2Oi+Vu1hfg1fsXazo
	XKci7DdKH9K+o7gJuy5xA9SXDUa4hrbLKzEXBbgkDODDK679rHG83Fb0Fbcnse/E
	5w82A7Vg9wzAvkzCIPc5pcIvNVdN4FGPG2Nht9vykKbwX1mya0SDeoruIsYgk+FT
	gyUp7CWEzdUcjSXQsYKq2OJwLOpZ2lCCliBingET4Gpo+AiMNbuYYtMb0qCDIR7K
	xDewrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785095177; x=1785699977; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tzBRrJFfWf9nuUSk+Umahe/GXjmEn4PayMptDA8R4co=;
        b=BDjPLEAs0SE4DstXMHX4n52rZUpglkElCDUMbwXRHLwiNW/bhzixemboMdI2nf5oPF
         EXic29B2y6PuBGGDWxTGtcu2d39Tuhij7WYbHgu57/1aY0s5yPwi3eEnViz5HHENdY4r
         0fOyOSDuqpOHmkSuJeJRMK4Y1HGLskWvkmluaO8p8iEgeTdx+q8bp7nh4NiT+a1KA5sD
         iRLgVai8nECed921MxpocGS5rO/Wgu9I1cLIzALNARZmMPEVqrXay5aLZjpHYo3lMCzh
         OLZ0Ls8girDZhHNmLpCQhOnAGmPv1NIC1PeSq7+aIHrIZTWFPpFCDGb4H3iPqUowterT
         LpBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785095177; x=1785699977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tzBRrJFfWf9nuUSk+Umahe/GXjmEn4PayMptDA8R4co=;
        b=hhJuHwoD21KShY4DhLR6uftf12dg2zxddnpIOjn9AJtxqONeX0Zn7/GbcoqdEHp/Zz
         rTYMo09xwj8VTHVqgjqmiy/P2MsJmtHA0oOnYVFJ/dCJ4ix9EOHMD1KKGJ65OkX8JiFJ
         zaOy8cNerl2CWui3ep/rHImKbG854G3ExeKCAHCRXBmMabdBCFSNJm8Fe02iwSfKUlgm
         UXpv7YT3RGijU/ybE8/EJffeR8NPK4PWhlfhRB6adeBPkWByjPWqO5g0OOyaeLOIOe9s
         /u8JiKCU3RrLiytCm+2HIU95JxakQJe8udF0IL8dyGajGUlng+BeJmENjLOIEwmDETrM
         Y5xA==
X-Forwarded-Encrypted: i=1; AHgh+RrYClXZM7pHL8ND57OLQJEkJviSzT0wHgtcZnVsxDsF2ReIGWN1lUHrXuXKU2AIpDlqMEtETr1u8tc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwSOcmvzw9VpZehFE70xVuCUYN0wufFEk4QWZT0WITkL/luI9WC
	mjnUdPdOEfl0xANieSGlVlMgs+EvZbMw3Fq9p3rFgMQlUDzXf7C6pIiZjYCu3D97RN3O1kSGdoU
	coGhHfIRn0Y6Ze2N3puzkeYXlw1fNd8M/8mHBxVRMdGE5mKsfXCC1H/SA3kTjzm2L6SozAA==
X-Gm-Gg: AR+sD13QiZXZ4L8ml841pI9D+4R0Cefa9Mv6hlpohRWXmADdZZRsBPrC+r3RSX/A1k4
	AWXxPmn8YlKeom8UgpUql8gNEQO3qERsX7KqkknPkzLnQzKf6hJV0U5NJQAVNkpvV/FyRTDbCja
	QlQMeUu4dqkzaRsBYh1Il5GxvLZ1DbgHELNzKHWHAvQInZox1gLxhH3p//2uoylU2iib6FcUaCM
	GozgLibOebYqry/2FvAekNaE+qCSJhvdchvxBDRNA7Iu86mQpl+M5W8Z8SUChECwJPXlciaBINQ
	gMRWRFTvqS0uDEc4Iiw//oiQfgSVrQ7uDUm9KXVT8tZ0F0Ka3+52ag/gWHa3TPaiUDUuHiyqFVK
	Jas83sQJBHjcX5+nu/gh6
X-Received: by 2002:a17:90a:d607:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-38f294ea129mr5919571a91.14.1785095177326;
        Sun, 26 Jul 2026 12:46:17 -0700 (PDT)
X-Received: by 2002:a17:90a:d607:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-38f294ea129mr5919538a91.14.1785095176894;
        Sun, 26 Jul 2026 12:46:16 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 03:45:18 +0800
Subject: [PATCH v3 5/8] drm/gm12u320: replace struct
 drm_simple_display_pipe with regular atomic helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-drm-simple-kms-removal-v3-5-cd5dc89858c6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785095129; l=8382;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=g+MDix2aoww8WVfrNbk1rE7PxKYObabHjKYvIJmxIMM=;
 b=mVZJXr+XmZgsHgsqa8wml/FP/WY7LcnwyXF2tb9+b/ejFt0L03u0D2Ll1AvyTMa4xxIz1ByxX
 qLo+sDvLyK+DfFgJTfsRiCYyQwCIqSBAsF6iNEqLbnHNKyQJtYM5yyE
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Authority-Analysis: v=2.4 cv=GKk41ONK c=1 sm=1 tr=0 ts=6a66640a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=cqCYvchtcWlsvxqGjdoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 6r2dFg9fEdmTsZibdhMewgbREIJ3i4uw
X-Proofpoint-ORIG-GUID: 6r2dFg9fEdmTsZibdhMewgbREIJ3i4uw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfX38qSOpCtgXDm
 7xQtVQ162KXNUwcvLWjjeF+q+/PE3BYDnV7ZK9PGoMd/aIdx9UWJIJBZM25/jTnVwIiMlky1Wwi
 9CM10rqtjRf6rXVTaEnVdvCIv3sgqLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfXwyhWbC8wRuND
 rfXthLG0iQkal/KBSvD9ZP59tEO4/41mZIgvvmNg7im5Krmk7VmmSOk8b567LJg1Uqqk4U9BFf8
 VYajqwPnVIYPBRL6slyhgDq0ifUmr2AtekC6IYNrmoiB6ZDaOB4jEdTb8MlMF85QzvITqpIKWwT
 wT42hWXOan/7GNaIZ39PRzOYULjlXquYfwB7F/9xpvtEWJlIJH3z1JWWpf0HpsYAND6nAl4V1jj
 Tmi84qqiI1yBzwAhkHDa3JVkwU+TBwR2cHWFQjL99/eOoymkowk8mOhcXaAIK9U08mKj6lpngeZ
 hRCaWm/X0lAFsPXLzvGGkIE/DtQmzNvhIWWfO8NVtefQhtv+kqM4OsQQJhlgMJ4V8Hjmeq4cyoV
 3P056F0fiHzmiW8uX4mfWUkV+cpMPvNdZjJPCLYu/QRPyiSUEFNlZZAEn4WHDLXZffpI2WfSJHa
 +ZeX+669jF6ujdvbDRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260200
X-purgate-ID: tlsNG-bad1c0/1785095180-3B6D2034-4927B2BB/0/0
X-purgate-type: clean
X-purgate-size: 8384

Convert gm12u320 to direct primary plane, CRTC and encoder setup.

Keep shadow-plane helper state, framebuffer access helpers and
no-scaling plane-state check from simple-KMS path.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>

---
Changes in v3:
- Use commit-local plane state in the CRTC enable path when marking the first
  frame dirty.
- Make the gm12u320 container helper static inline.
---
 drivers/gpu/drm/tiny/gm12u320.c | 138 ++++++++++++++++++++++++++++++++--------
 1 file changed, 111 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index d73dfebb4353..afcf0dfff14b 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -8,6 +8,7 @@
 #include <linux/usb.h>
 
 #include <drm/clients/drm_client_setup.h>
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_connector.h>
@@ -27,7 +28,6 @@
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 static bool eco_mode;
 module_param(eco_mode, bool, 0644);
@@ -87,7 +87,9 @@ MODULE_PARM_DESC(eco_mode, "Turn on Eco mode (less bright, more silent)");
 
 struct gm12u320_device {
 	struct drm_device	         dev;
-	struct drm_simple_display_pipe   pipe;
+	struct drm_plane	         plane;
+	struct drm_crtc		         crtc;
+	struct drm_encoder	         encoder;
 	struct drm_connector	         conn;
 	unsigned char                   *cmd_buf;
 	unsigned char                   *data_buf[GM12U320_BLOCK_COUNT];
@@ -102,7 +104,10 @@ struct gm12u320_device {
 	} fb_update;
 };
 
-#define to_gm12u320(__dev) container_of(__dev, struct gm12u320_device, dev)
+static inline struct gm12u320_device *to_gm12u320(struct drm_device *__dev)
+{
+	return container_of(__dev, struct gm12u320_device, dev);
+}
 
 static const char cmd_data[CMD_SIZE] = {
 	0x55, 0x53, 0x42, 0x43, 0x00, 0x00, 0x00, 0x00,
@@ -554,43 +559,106 @@ static int gm12u320_conn_init(struct gm12u320_device *gm12u320)
 }
 
 /* ------------------------------------------------------------------ */
-/* gm12u320 (simple) display pipe				      */
+/* gm12u320 display pipe					      */
 
-static void gm12u320_pipe_enable(struct drm_simple_display_pipe *pipe,
-				 struct drm_crtc_state *crtc_state,
-				 struct drm_plane_state *plane_state)
+static void gm12u320_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					       struct drm_atomic_commit *commit)
 {
 	struct drm_rect rect = { 0, 0, GM12U320_USER_WIDTH, GM12U320_HEIGHT };
-	struct gm12u320_device *gm12u320 = to_gm12u320(pipe->crtc.dev);
-	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+	struct gm12u320_device *gm12u320 = to_gm12u320(crtc->dev);
+	struct drm_plane_state *pstate = drm_atomic_get_new_plane_state(commit, &gm12u320->plane);
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(pstate);
 
 	gm12u320->fb_update.draw_status_timeout = FIRST_FRAME_TIMEOUT;
-	gm12u320_fb_mark_dirty(plane_state->fb, &shadow_plane_state->data[0], &rect);
+	gm12u320_fb_mark_dirty(pstate->fb, &shadow_plane_state->data[0], &rect);
 }
 
-static void gm12u320_pipe_disable(struct drm_simple_display_pipe *pipe)
+static void gm12u320_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+						struct drm_atomic_commit *commit)
 {
-	struct gm12u320_device *gm12u320 = to_gm12u320(pipe->crtc.dev);
+	struct gm12u320_device *gm12u320 = to_gm12u320(crtc->dev);
 
 	gm12u320_stop_fb_update(gm12u320);
 }
 
-static void gm12u320_pipe_update(struct drm_simple_display_pipe *pipe,
-				 struct drm_plane_state *old_state)
+static void gm12u320_plane_helper_atomic_update(struct drm_plane *plane,
+						struct drm_atomic_commit *commit)
 {
-	struct drm_plane_state *state = pipe->plane.state;
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(commit, plane);
+	struct drm_plane_state *state = drm_atomic_get_new_plane_state(commit, plane);
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
 	struct drm_rect rect;
 
+	if (!state->fb)
+		return;
+
 	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
 		gm12u320_fb_mark_dirty(state->fb, &shadow_plane_state->data[0], &rect);
 }
 
-static const struct drm_simple_display_pipe_funcs gm12u320_pipe_funcs = {
-	.enable	    = gm12u320_pipe_enable,
-	.disable    = gm12u320_pipe_disable,
-	.update	    = gm12u320_pipe_update,
-	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
+static const struct drm_plane_funcs gm12u320_plane_funcs = {
+	.update_plane	= drm_atomic_helper_update_plane,
+	.disable_plane	= drm_atomic_helper_disable_plane,
+	.destroy	= drm_plane_cleanup,
+	DRM_GEM_SHADOW_PLANE_FUNCS,
+};
+
+static int gm12u320_plane_helper_atomic_check(struct drm_plane *plane,
+					      struct drm_atomic_commit *commit)
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
+static const struct drm_plane_helper_funcs gm12u320_plane_helper_funcs = {
+	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+	.atomic_check	= gm12u320_plane_helper_atomic_check,
+	.atomic_update	= gm12u320_plane_helper_atomic_update,
+};
+
+static int gm12u320_crtc_helper_atomic_check(struct drm_crtc *crtc,
+					     struct drm_atomic_commit *commit)
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
+static const struct drm_crtc_helper_funcs gm12u320_crtc_helper_funcs = {
+	.atomic_check	= gm12u320_crtc_helper_atomic_check,
+	.atomic_enable	= gm12u320_crtc_helper_atomic_enable,
+	.atomic_disable	= gm12u320_crtc_helper_atomic_disable,
+};
+
+static const struct drm_crtc_funcs gm12u320_crtc_funcs = {
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.reset			= drm_atomic_helper_crtc_reset,
+	.destroy		= drm_crtc_cleanup,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+};
+
+static const struct drm_encoder_funcs gm12u320_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
 };
 
 static const uint32_t gm12u320_pipe_formats[] = {
@@ -677,13 +745,29 @@ static int gm12u320_usb_probe(struct usb_interface *interface,
 	if (ret)
 		return ret;
 
-	ret = drm_simple_display_pipe_init(&gm12u320->dev,
-					   &gm12u320->pipe,
-					   &gm12u320_pipe_funcs,
-					   gm12u320_pipe_formats,
-					   ARRAY_SIZE(gm12u320_pipe_formats),
-					   gm12u320_pipe_modifiers,
-					   &gm12u320->conn);
+	ret = drm_universal_plane_init(dev, &gm12u320->plane, 0,
+				       &gm12u320_plane_funcs,
+				       gm12u320_pipe_formats,
+				       ARRAY_SIZE(gm12u320_pipe_formats),
+				       gm12u320_pipe_modifiers,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+	drm_plane_helper_add(&gm12u320->plane, &gm12u320_plane_helper_funcs);
+
+	ret = drm_crtc_init_with_planes(dev, &gm12u320->crtc, &gm12u320->plane, NULL,
+					&gm12u320_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+	drm_crtc_helper_add(&gm12u320->crtc, &gm12u320_crtc_helper_funcs);
+
+	ret = drm_encoder_init(dev, &gm12u320->encoder, &gm12u320_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ret;
+	gm12u320->encoder.possible_crtcs = drm_crtc_mask(&gm12u320->crtc);
+
+	ret = drm_connector_attach_encoder(&gm12u320->conn, &gm12u320->encoder);
 	if (ret)
 		return ret;
 

-- 
2.43.0


