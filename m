Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF50C44501
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 09:03:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1363583.1615181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkI0B-0003Cl-5H; Thu, 16 Jul 2026 09:03:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363583.1615181; Thu, 16 Jul 2026 09:03:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkI0A-0003CF-IT; Thu, 16 Jul 2026 09:03:30 +0000
Received: by outflank-mailman (input) for mailman id 1363583;
 Thu, 16 Jul 2026 09:03:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ze.huang@oss.qualcomm.com>) id 1wkI07-00033O-VW
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 09:03:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkI07-0078Bq-BH
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 11:03:27 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a589e59-5cb7-0a2a0a5109dd-0a2a4501e606-38
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 11:03:27 +0200
Received: from [205.220.168.131] (helo=mx0a-0031df01.pphosted.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a589e5d-5984-0a2a45010019-cddca883babe-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 11:03:26 +0200
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66G7DkOR1734158
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 09:03:25 GMT
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fed063hh8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 09:03:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2cd01a14e81so94454835ad.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 02:03:24 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cf106b271asm16592555ad.64.2026.07.16.02.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2026 02:03:23 -0700 (PDT)
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
	MeSqLazRYgr33B487FeWpWmBWUCKqNkEYXob2j87zRQ=; b=FXVHZpAGJedoRTh8
	n3RpC40OMzwvSPs0hVWwrGEzYyj8qIUe/ElinbQoYVKUsjih/3bJr0JspEfwiHkT
	Hv/bd0/PKRu0B/lwGk43bnVxZ/sfaN/AkKfYjGhdDh+NH6EgBvQXIjRt/ihZNyEW
	CwM7Yw1OwPFp7rmw44bTwGXrmfddtvT/X6D+PRlQHfbk8X18hGykq59dMxKQjHif
	PVH8MGdgMNItGElve/sqSJW2uUH7S6OEIcwfZfDvhvtGQAf2JJynU6mT4tiMyb1U
	/kl3+u71Qlb7J5NdtCaWqSVRb5DG0q0y07ik4skRubojZqf8kd5kJd51wT3oVoKL
	yNwKmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784192604; x=1784797404; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MeSqLazRYgr33B487FeWpWmBWUCKqNkEYXob2j87zRQ=;
        b=R6Jq/umbq0K8CM25aOTwSRBvjXcwZwZ0R8VIWn1N2ymwHdPkP3w9NH5cGOQ86q9CfI
         Yl5EdqrcAwHHKJCwb5QSXVVkv40GkRR0kjawrWsGHK3n4Sm0aDXFpt0WSXaMA9ALDd/W
         pSYfhoCIepnzZflUYSJHQIiX6GTQNacrFEARsTp0/G1pwYaKhSl1Ks3/jgYXTD29VcCf
         5RlXh1n/LAj40nIgDzXFaBfidwW6f/4Jrj3SXGjCy3Kjz8+lKgx2HzTODHc/vDmrhHhb
         LXTIz8ISCXPtfpz4jFiyDuOtQfno8gG3tXEDMlXgwCY+WH/bN/oTt+vnUZ2G5uIPGgq9
         bECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192604; x=1784797404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MeSqLazRYgr33B487FeWpWmBWUCKqNkEYXob2j87zRQ=;
        b=cyuUqDU1vgla57xa89rK99f8ytUYblrCQi24399i7b51iwCtx341TEYhe0PzycTkWn
         moI8ZelhUZ/HOwpf6MPa/kDFCSAToDZQLiXf9vEpmLi2uQUYZmGe7da1IbmWgJGqm4Cg
         WA6Y/BuuUZ515jwoDrIZejjAO+dM2b3dvI4y5f9GZqYHAPhqt+NvabIIOJNG8brW0IuK
         X2CyUDnc6wrxdLSPIHs3Q9h1I0OOt89as/fPuyxFI9YUPbofSsU/1UsL2vNV16sqwDWc
         QwU0OVdw9krp4NF0V1hN5oSaZpcCR62djk/igToWfxNzvBZL1U0kBIEIQbVRyK/zVlQO
         8kQw==
X-Forwarded-Encrypted: i=1; AHgh+RrAbWMVFwkF5zs9ACjD406SjAJLzuMPUasJa2yl+ubf9aLbo2ieFNmZbEIxMSXZxvWX+pXOfwSPlK4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzCzH2aGXZaNStR6JvbyE5a6z0yC+Pl4OTwxLv32guRumedbKPU
	1FrnWSzn+Fbc18GW+RFVNvLJEicGmLogRTZyIiUz1mIMypw4q0r+duYl+kgHp5HESX1Vw7G2Y0n
	gMn46qS3t7Q0kOxyMOlyxmw3Cx/Ds5ednlVojUgnz2ZPmS7WGy/fMu23TBPzIgHsoF0yb89BfBh
	yq9jBH
X-Gm-Gg: AfdE7cm8H5wWhvIPh0woE+IveJ3Zh0JnJ3h9ZoZUTy9/l8/wQuCXfSHpI2RLiN4sLrx
	py6zToVfNPEnJfsZIEFPtHN8g/1qUaWNoFEkGbGR1IVoA1tuLwE2rfTKA/eadNGdMoGWMjANsfv
	3rOEU7GoE3jP14Gkc6TwOEfQfuCgIezPLtT4YNBEt+zQ0YUPZWZVfdSKAr2phQdObnfBsJ22WeR
	9FIe5lNGnL/oPNs6+UcvC6nC1O27Z3ht+hfoQ96oJs6RnXIbGetTFDh1+HB47/fu/to2v+KxVUI
	Y7lOClCqLkx2+P5EQ0jZzFhDDdsZkGQKHZkZe5ouuJhFVV7sWepfnfG424hWh6p8w5RHzxEiDB4
	kKlADQdNqtclx9TrbZoMB
X-Received: by 2002:a17:902:ecc4:b0:2ca:b8d:e65e with SMTP id d9443c01a7336-2cf03dc62b5mr62673265ad.37.1784192604113;
        Thu, 16 Jul 2026 02:03:24 -0700 (PDT)
X-Received: by 2002:a17:902:ecc4:b0:2ca:b8d:e65e with SMTP id d9443c01a7336-2cf03dc62b5mr62672665ad.37.1784192603523;
        Thu, 16 Jul 2026 02:03:23 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 17:01:57 +0800
Subject: [PATCH v2 5/8] drm/gm12u320: replace struct
 drm_simple_display_pipe with regular atomic helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-drm-simple-kms-removal-v2-5-1133a8fc3785@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784192560; l=7964;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=clrd2wPCUImRmnt9dUsqbH/TK0mbxMgUhxeWagkxE+4=;
 b=0oRyaLEkb6eanKq6iqSl6wa+hGMmW3tOf5ZzNUvdnQ1H3jNsbTzi9cLXyJD2dE3oAeyIW6luo
 TPO40xg3wNsAgnlI+cgNB4ljxIOqwV95/AiRUDhwKVkGVCOsCip/o0W
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfXwx3G8v0L4d/7
 j10wLSfv3sZBpg4hiD80btGoi/CmT6ErcoOuN2YSlDtWfqZ8XUhx/2UTGYurt+VDzMnTdyafTEW
 5IgAahov0KFrqzHkP7mvt3IVNw/hLzA=
X-Proofpoint-GUID: uWJ-MOP4YTyBF8V6JnJGn2gcQJHfEN2a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfX3uxatpS/3En8
 a60eHwjw28PQMKqKcHEGXWsftxYlhjeBiwU76p6spvinKoHIEnDNhTnSgnlqCcUG4TomdwULz5M
 7GtcjSDCZ15AiLe+Di4nOnYxc7ahPwbrmIyhe8IGVLTm9BzAq5M7r4c3xpa8Y8DXwEMVUWP8Zl5
 5D3nqn/4PJBsubqX9Kxob2a7ulQlvqfNexCKioxqi/j6jr/KAv/Oe/9daulGodbT82bBAsMYpNO
 xwdPp+JSIe4UKcfhQUOQ6/9hxqKi2aLEChEbTghcHYV7Qa1u1ScSl90xMJFigcT/gxpkIyGVOum
 OlvkOTbSw5J2aLuey6Mp1WtGiUSDSrgjrxqa+PSGki0w4uswSQtCMIYhHRPXHlrbV4GpHE3lI+0
 DQhk70CLeTF/bHHIsqf+j/xqxQRfvfllSJFrL6o7d85W64KFnwhc1DRQa9/TTDzvd6hUuFRUv4v
 OXab0tVjMGql992bqOw==
X-Authority-Analysis: v=2.4 cv=Xb25Co55 c=1 sm=1 tr=0 ts=6a589e5c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=g95SU4BBbiomblFqym4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: uWJ-MOP4YTyBF8V6JnJGn2gcQJHfEN2a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160091
X-purgate-ID: tlsNG-d62444/1784192607-1D67C757-A7371AEC/0/0
X-purgate-type: clean
X-purgate-size: 7966

Convert gm12u320 to direct primary plane, CRTC and encoder setup.

Keep shadow-plane helper state, framebuffer access helpers and
no-scaling plane-state check from simple-KMS path.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
 drivers/gpu/drm/tiny/gm12u320.c | 132 ++++++++++++++++++++++++++++++++--------
 1 file changed, 107 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index d73dfebb4353..df60968856e5 100644
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
+static struct gm12u320_device *to_gm12u320(struct drm_device *__dev)
+{
+	return container_of(__dev, struct gm12u320_device, dev);
+}
 
 static const char cmd_data[CMD_SIZE] = {
 	0x55, 0x53, 0x42, 0x43, 0x00, 0x00, 0x00, 0x00,
@@ -554,43 +559,104 @@ static int gm12u320_conn_init(struct gm12u320_device *gm12u320)
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
+	struct gm12u320_device *gm12u320 = to_gm12u320(crtc->dev);
+	struct drm_plane_state *plane_state = gm12u320->plane.state;
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 
 	gm12u320->fb_update.draw_status_timeout = FIRST_FRAME_TIMEOUT;
 	gm12u320_fb_mark_dirty(plane_state->fb, &shadow_plane_state->data[0], &rect);
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
+	struct drm_crtc *crtc = plane_state->crtc;
+	struct drm_crtc_state *crtc_state = NULL;
+
+	if (crtc)
+		crtc_state = drm_atomic_get_new_crtc_state(commit, crtc);
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
@@ -677,13 +743,29 @@ static int gm12u320_usb_probe(struct usb_interface *interface,
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


