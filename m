Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC09C53209
	for <xen-devel@archiver.kernel.org>; Sun, 26 Jul 2026 19:54:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371265.1618909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wo4ve-0001zX-T1; Sun, 26 Jul 2026 19:54:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371265.1618909; Sun, 26 Jul 2026 19:54:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wo4ve-0001zQ-PN; Sun, 26 Jul 2026 19:54:30 +0000
Received: by outflank-mailman (input) for mailman id 1371265;
 Sun, 26 Jul 2026 19:54:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ze.huang@oss.qualcomm.com>) id 1wo4vd-0001zK-RI
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2026 19:54:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wo4vc-001WSc-Nz
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2026 21:54:28 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a666560-e002-0a2a0a5209dd-0a2a4509a594-38
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 21:54:28 +0200
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a666412-be1a-0a2a45090019-cddcb483534e-3
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 21:46:27 +0200
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66QJF1Ih1593823
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 19:46:26 GMT
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmn7vbjs5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 19:46:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-38e7621655eso3815797a91.0
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 12:46:25 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38f03b0eaa8sm4105998a91.8.2026.07.26.12.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2026 12:46:23 -0700 (PDT)
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
	qYw7YOevf7R1VaLGJE434uj9XUAJ+efhiT66MYE6HgA=; b=JFD2x2i6i050fq5c
	bDN7bgFtTZ7Sfm5SqUnqFm5eluW8Vk6cS3DMjgDr6v9VexxI+t0aU4tSBtrcAvT7
	I/lyXA43IaigZbmeOXdLWxxGDY9+DlgVAjoGjG+ObeQ71Y69u+RPqFXcUWZACs5d
	c28BQkTmfH5Y82NI96ySJY/gycW7qY2IkWbtJyvXyYN2+cYzvFFY4Ctmw+cn4o5h
	0vPoCRRSR9dkSFYNJLGTKliq5XHgo9Z6fNUAVxOzNPxuIHtTJAoSNL7353yWnify
	EzhMbvNba5KKY0r7lV7Ta4kUeMp5Fw3+4oUSiBQY9VPmf6gsV9dVj7v/URc5Zoe1
	UVJbkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785095185; x=1785699985; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qYw7YOevf7R1VaLGJE434uj9XUAJ+efhiT66MYE6HgA=;
        b=ZcCg7ZbCM5tiINRvKgK5PrGRhnZvX6yc6QpbhyaA29j3yux1ykBKBxMZq3Vo2noA90
         4Z53ZozZmkmezd/F5kjP3XNjRflqC5KID2c56SS8vDkV58AzSKboA8CBZmRTSymsEymy
         kb+DCp5bm2Ayr4THEwJ1siYkcsyj0uFHC9ySUOUftjoU3cWfkAJd/5SFHyAQ4CDyTLOa
         M85nUCispbmUaRhXKKa1PLFImjMxl7iURNTFF32rj+nwLtlLuxsdxps9ouX9TQ9zIbhV
         5gPxTteFMx0Wp3VfP3dBSQqE5ssB6P1FTzxG2dJW4IgyPKAAGDu742am/3VBOKG7x+T6
         XFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785095185; x=1785699985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qYw7YOevf7R1VaLGJE434uj9XUAJ+efhiT66MYE6HgA=;
        b=E34Cd/GHGw8ECav0TdSThaFKkflmtnoqoFSdW1Ud09dG8JR5hOMahOmxCPN9KlVzHT
         VhZNKfcvyEAS1pBWf8Ib5qzvBIynWtV+OXh3Ceg6JG7UeeCQY9GSdbYO61uLFYZNR7aQ
         vSII85TCILFw/hmYDieijTR/OpBg/gZXyGj/JRqQCFdwzDyqs5PdkCJNCEkICj/jdofZ
         7J1Xj7dx4ULC9YclD4YphDM4XMVBOrlZH6uVWh32zdDM+eGcm1H55NRF1jbtnfyOyLQ8
         /xBHiDThYx+I1IqXVpNJXZvroPaWisGfmrTI+20ijtj1+cC2EgPO0Ew7MgZaoJXzbWk6
         w+VA==
X-Forwarded-Encrypted: i=1; AHgh+RrfHQMLTpO3tlyoxOpdRQvtuyhHdl/5lU913bCok0Ke/QoPIR+aTc5VB2tl/0cAT0R0ULFXz49qG/I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyoOQ2rkulfvEsUsYsCpOLKnb6eF04alp9iUA7Cslpcp5dJpiaZ
	BsXrXZkkNwVIiO+QTLeZaDjMzagIiRdl1Oom5ug0sYStNM//mq3ctzKzSKFFW9O4l1teG/Jqc85
	ef9sF4JCKXnJ9YjafPEB7dZv61ps4LVFSSliqsb4bd8WzWEgGaOotmaBUKE+137uF81NMqA==
X-Gm-Gg: AR+sD13eUU9Ze6xmUISnvyXFurKCrqBJK7e66cMgJzW46euo2AtOvWjkBDXjfVbQDth
	oa9xXdkA2EAFTXZsfUQNBPTJRbeZfilkJQRf+nt0kVTSeUh4L4lriisu7rJG/0ZsfuBwTlJIBYb
	ugWSE307Q2Avc+HZF16zSe9afxX3Etg20X9YirJmXYPti7ir73UEoc0Dnwrck9dW6QilQ+9cbIP
	CF80HNnWSfduNNch5Fh0EDWZaS9AVSuB4bJ7mjhQtkuXQWcFhXWTKlp+tFuDgnRyuyg03tIAMKc
	BH1jsTpNbFIT25OYFe2IyO2r2SOy0XQfMDdKhZdTOKldQ23YsNfv0uz3aDozL7QuqCGqbx4DBv6
	XEuwne//s1jB6wf7dZSir
X-Received: by 2002:a17:90b:2642:b0:38f:1e1a:5141 with SMTP id 98e67ed59e1d1-38f29620a7emr6222279a91.28.1785095184894;
        Sun, 26 Jul 2026 12:46:24 -0700 (PDT)
X-Received: by 2002:a17:90b:2642:b0:38f:1e1a:5141 with SMTP id 98e67ed59e1d1-38f29620a7emr6222251a91.28.1785095184441;
        Sun, 26 Jul 2026 12:46:24 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 03:45:19 +0800
Subject: [PATCH v3 6/8] drm/repaper: replace struct drm_simple_display_pipe
 with regular atomic helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-drm-simple-kms-removal-v3-6-cd5dc89858c6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785095129; l=8123;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=AAx34gAM0g1XJvks56BpyKPpL86hNGfHkaqmTZ6w6/0=;
 b=0wLxQLCaGBQoh2NRb3mNAmGNnyaRnCPadbrAOaKKC67gUQV3goDlvM9OKxsAyvDatXtean6lJ
 GxRtATgRjlEC7duzu8UWemNPnKENa4bCZTwGGNjQcIYvTf3lN+2t4jy
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Authority-Analysis: v=2.4 cv=GKk41ONK c=1 sm=1 tr=0 ts=6a666412 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pkK3EMrqy3vWcbFnmDwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: D-S_XfeY7o6KW0IyyQ8UUUDj1wcwGtqV
X-Proofpoint-ORIG-GUID: D-S_XfeY7o6KW0IyyQ8UUUDj1wcwGtqV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfXwR8uau32zv0/
 om7lONlrAo0ABpDDD3TPLbQZf8e7NBkoD5SUs6TjlvjfAV/2JfNk5vs0ejnOQ51IHRbkNdNhVbP
 wc5oXRg2NAd/ooHLoRfCWFbHqJ6dEro=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfX65Xm/YGIndmz
 kpL2XN1jv8idIF7p+xR8twJhSFwQbLEENSFGAoCCXr7997ZJHipO+pU5JMaxCdwtoDSLCOJdE3m
 /1h4uL5SHA+KR0/04+ls982gta3Vh0/5eAQEVOo2vNzoOjhjM13835xOKMwFwI/k3buV/bxb5lC
 6SSbjmSQlBbq/Rb462NkyWvTdkt16XmJcOz0CtnkyMT23yYg3OPqlzTSQaoi1w/vy4wOHNvCiRp
 UOJWLrtdMP2hug3PeVv0xXeXGUHzJP1yy5x10pI3hWOH5kc7aWDqV91B+y2m1VuoijuVdoy9Ua5
 lHaYmTgWS8oUHeFuFOpou5xgDhZiZQYqpvnhN5rNjLg+AHWlnjN/ZCm/rRr8voBJ3cUyN7y3QnT
 2MRWLbCGUGUTkqIX5oVZ/UEzRSmOwIhQZjLHmOIV0pjCGo7Fh4xCjutExuAKYCOxtCtmHAAEIvg
 B+EzJj2drMTecGsMGrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260200
X-purgate-ID: tlsNG-bad1c0/1785095187-FD86F034-AE220E36/0/0
X-purgate-type: clean
X-purgate-size: 8125

Convert repaper to explicit primary plane, CRTC and encoder objects.

Keep the shadow-plane helpers, framebuffer access handling and
no-scaling plane-state validation from the simple-KMS path.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>

---
Changes in v3:
- Skip damage updates unless the CRTC state exists and is active.
---
 drivers/gpu/drm/tiny/repaper.c | 138 ++++++++++++++++++++++++++++++++---------
 1 file changed, 110 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index c8270591afc7..f225e38fd404 100644
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
 
@@ -827,27 +828,90 @@ static void repaper_pipe_disable(struct drm_simple_display_pipe *pipe)
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
+	struct drm_crtc_state *cstate = NULL;
 	struct drm_rect rect;
 
-	if (!pipe->crtc.state->active)
+	if (pstate->crtc)
+		cstate = drm_atomic_get_new_crtc_state(commit, pstate->crtc);
+
+	if (!cstate || !cstate->active)
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
+					     struct drm_atomic_commit *commit)
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
+static const struct drm_plane_helper_funcs repaper_plane_helper_funcs = {
+	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+	.atomic_check	= repaper_plane_helper_atomic_check,
+	.atomic_update	= repaper_plane_helper_atomic_update,
+};
+
+static int repaper_crtc_helper_atomic_check(struct drm_crtc *crtc,
+					    struct drm_atomic_commit *commit)
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
@@ -1102,9 +1166,27 @@ static int repaper_probe(struct spi_device *spi)
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


