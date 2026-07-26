Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C582C53219
	for <xen-devel@archiver.kernel.org>; Sun, 26 Jul 2026 19:44:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371182.1618827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wo4lH-0003h3-IV; Sun, 26 Jul 2026 19:43:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371182.1618827; Sun, 26 Jul 2026 19:43:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wo4lH-0003gw-Fa; Sun, 26 Jul 2026 19:43:47 +0000
Received: by outflank-mailman (input) for mailman id 1371182;
 Sun, 26 Jul 2026 19:43:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ze.huang@oss.qualcomm.com>) id 1wo4lG-0003gg-Hd
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2026 19:43:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wo4lF-00Gt1t-Uz
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2026 21:43:45 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a666320-2eae-0a2a0a5409dd-0a2a450cde20-20
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 21:43:45 +0200
Received: from [205.220.168.131] (helo=mx0a-0031df01.pphosted.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a66636f-f479-0a2a450c0019-cddca88340c4-3
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 21:43:45 +0200
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66QH6n1t1126257
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 19:43:43 GMT
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmnweuf2q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 19:43:43 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-ca7c1e22995so3445356a12.3
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 12:43:43 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbbb66dcd38sm2312070a12.29.2026.07.26.12.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2026 12:43:41 -0700 (PDT)
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
	CNoRgYHBQCH+tsjxR75Szw9VyLMDvEKRkPSqMXEGBh8=; b=NPm9kHgZsDf1LGlX
	jzlVHtMg0YUIG18rO33jutaRk1yFpZdsfUZVRWXI0ghtaU1/yaZpgmvF1zkkIkMO
	Fx/GEM6lleoZ2OcTLU3bCQDNV8OfTPfNjRq65BaBvGXKNXhIMzq0ln7rci/Qk6fr
	bhHa4Hm6Jd1qdtFzl/Ez17lREMOW1lrfDBpw5evnVY9Xoy1I6kuZkcMe/VXEJ+KX
	Pn0yKJyoOgri+0JqUjlVmDNy54VMgGwyHkj89PveR+TywEoAf/HLoQ7s4fPsnpUE
	ysQBHzdtZRRTpsO7e5MMXpwCaF2Eic1vfLqRYDOcebT3rm1E7+C2mEIsQneM6hEz
	vMj/ZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785095023; x=1785699823; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CNoRgYHBQCH+tsjxR75Szw9VyLMDvEKRkPSqMXEGBh8=;
        b=M2Qvzh23RQJcLhfr3Kkmv3PDxqBsM/cP0A0gV7y4TGcI6DAYOy8bMf7y+DRA3/oQ52
         kIoaA2Lltht1rOBMEq8pKomTCAauHgN5s6cd/ao2Oka/T8zFLFCfuq3ZXMrtXWgcP49g
         P+DdZ4FRZf3AY+1tzdDLOVqo0HXMlq2uS03kxsEJW4VfuO8rPjEdyiSIHp2o57wM12yG
         tTCW8wS61A760ltuGXqxh6tYZKOURQ9+s44FBBhdF9GvhiYlzrlwTeRLx6Xt5cZ+lXR6
         0hlzjYM++OAYqCQdsR8qwP8PVRbbIh/EVJVrLYHS3jclYfWd2AYGZVvFYybdk7DDGOiV
         8ycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785095023; x=1785699823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CNoRgYHBQCH+tsjxR75Szw9VyLMDvEKRkPSqMXEGBh8=;
        b=W+vghUPGQCvVJbkmzottw6qiII9/vI7DjcxJCKSxGVZjbPiH7GSuV6qOsLry25XIU9
         TFHLa/ImpEKZicZF2dPtJzurJ1TBNZS80IP9ES2Zbgfrbqzx8NLkVMukIHmRjkONsHcP
         2XrS2QiP8qbUh4daqmhS7BU+qjSpFBFboxpqVUW/PzAK3N+VOEeTsn+KfvC8UAHwl+yz
         NxRW/5gYAPmKcYRmXzGimlm/bEIfRdAlxjdtCBaiPfXK629PcOL4eZekhuxbFSQHpT1F
         zYMDVwD/R2jF6iTaOmCuEwSp7Kp+WCS5w3lM+CxPL8eCygfeN0t0P9Z2WhYSds29AZbS
         Irhg==
X-Forwarded-Encrypted: i=1; AHgh+Rp+VuHE8+c5No5b1njvWdAo/AgmnhK6hH2qV6cZso8aej07CJ20eSQg7HD6ta4aAt6VNYubVj+2u9Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy78eX/0QSdaJPn1Rv1VrrE5yg/v+SrlBU/IxqBi17BOMGSQMGx
	zlQvg1yNSywyf+zjEBgMSgRXAIDEFfWXxMxCb+0Vw+6xshp92tUbZcYgt4v4rvdFGDOcLL1ldEU
	5hvonfJ9gnIw5aerCL+pvbMr7eUFhLjrFI9uzyeEzaLyHVDUJYaYa+nqar/R++raHQalmSg==
X-Gm-Gg: AR+sD12kOsXhD/7utJ22zDqP6gg7EMi8HLybzb/P8TdFsnXaOV8tz/Ol6+nSLxOwqst
	H6rcRIB7uBOwcWezCFBUdgzhVe+SUqG1zWGOmMQPHhOZdWTLtTTgs1wbLvDGucdGBu4K7xASSEV
	TcJKoAYs1qFz6yiF5FyF2TvbR6hyr7owQaYvV2jXst5jzgE7/LZqhGSeWA84+d3T805NCYJMQL0
	Z5Z+TdBkC/xKRjIk/DtcSLaFTt7IkAAgyV/Z7qSZztZlSyKebc1BRGb/kUCRriiAas84KTWolB3
	whJuQuPpgFqINBgJUaIL3dOGO3PAhbfykkrGeGJM3NdJgQgWrThoLJSqlt4bzHiQLL++0WSalAv
	bBtuTlum4u0jACNjUkLXs
X-Received: by 2002:a05:6a21:918c:b0:3bf:6c08:fb85 with SMTP id adf61e73a8af0-3c67e0e92fdmr5593390637.53.1785095022538;
        Sun, 26 Jul 2026 12:43:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:918c:b0:3bf:6c08:fb85 with SMTP id adf61e73a8af0-3c67e0e92fdmr5593377637.53.1785095022117;
        Sun, 26 Jul 2026 12:43:42 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 03:42:32 +0800
Subject: [PATCH v3 1/2] drm/imx/lcdc: avoid duplicate clk_per enable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-drm-simple-kms-removal-v3-1-de36e534f7a1@oss.qualcomm.com>
References: <20260727-drm-simple-kms-removal-v3-0-de36e534f7a1@oss.qualcomm.com>
In-Reply-To: <20260727-drm-simple-kms-removal-v3-0-de36e534f7a1@oss.qualcomm.com>
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
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Marian Cichy <m.cichy@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, xen-devel@lists.xenproject.org,
        Ze Huang <ze.huang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785095005; l=1575;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=0iliuiHXJ6h0/St/QGB8FSTuTPg/hKE4ZxbThjkpOEk=;
 b=nuCUHzR6KH+1G4beZzHutnnOVPquBUhtAMv7nYpAmPcJwkzLDxQbdplnG0zdIkeIj2bMf6cbt
 akZOj/szyIRD7rXgAh5kCjmvJ221hnITo+m6kuUDxyG75FWxOXTdMnr
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfX4/8l2aa5QjUr
 dxmOB+Qlp4rV1hMjYbwrKqbOxPXijqepwtE/EXcdb+qpQnp/5EoTda9RL48Qs3bvvqJYGLq91T8
 kEkcqg2Iw2cOxhvlIf5wcNA+S3yXOjncC61aqeQRDRsPzXbQOiigCvFk7LsAT6wQ35A8RW2+uQh
 ED/xzePky9xDR6swiwyMgUGh2WV37a28L4kvuQ2CsciRtThs+T0nBm/BN99odpwCCWqNd4lK/JI
 j8TQMZW8yg39EJ50POBhWYgalxlkfNIiTVxCMl99WhdRB1pq3TdgyUetEpKAcpefxjU8xbLepYV
 2PT6ldCUTNRABfL0K601lBIM4vCxATgwXGz6hGaADPUUMeVYomzOIWbXufCbN+P+vRQmfAoMf8t
 SIUlTX/xaWWG30oAtcFi09OpPdJ/8L4X5wmIAvzlNo5jpktYJ/4UW9OMJSVz0r/wknGgjPqp8hS
 oYazRZOTG1FyMhIUUZA==
X-Proofpoint-GUID: Mt1kufhGEag4dx8SwNf79keAGnqlhn9v
X-Authority-Analysis: v=2.4 cv=S77pBosP c=1 sm=1 tr=0 ts=6a66636f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=xnl2VaEmiNnR3tlLptkA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: Mt1kufhGEag4dx8SwNf79keAGnqlhn9v
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfX5orI6Ew8FXNg
 oQ16x0maacREbvArjCnjyyV+ma7UKz5OjhOKBOkFNH8YWAAbnm5w2U8xrbaCpBqLxWzlfNmr3mM
 bTq2Esx4XAzp0fAU0zZn/jlkDrtYngY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260200
X-purgate-ID: tlsNG-d25034/1785095025-02CDBA5B-36A3C34A/0/0
X-purgate-type: clean
X-purgate-size: 1577

The simple-KMS helper calls the pipe update after enabling the CRTC.
On an enable commit, imx_lcdc_pipe_enable() already programs the
mode and enables clk_per. The following pipe update sees the plane move
from no CRTC to the active CRTC, treats it as a mode update, and calls
imx_lcdc_update_hw_registers() again.

That second call has no old CRTC state to disable clk_per first, but it
enables clk_per again at the end. The disable path only drops one
reference, leaving clk_per enabled after each on/off cycle.

Skip the register update from the pipe update path when the CRTC already
needs a modeset. The enable path has already programmed the hardware for
that commit; keep the event handling in pipe update unchanged.

Fixes: c87e859cdeb5 ("drm/imx/lcdc: Implement DRM driver for imx25")
Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
index f52832b43aca..81024f7d9e96 100644
--- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
+++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
@@ -311,7 +311,8 @@ static void imx_lcdc_pipe_update(struct drm_simple_display_pipe *pipe,
 	else if (old_crtc != crtc)
 		mode_changed = true;
 
-	imx_lcdc_update_hw_registers(pipe, old_state, mode_changed);
+	if (!drm_atomic_crtc_needs_modeset(crtc->state))
+		imx_lcdc_update_hw_registers(pipe, old_state, mode_changed);
 
 	if (event) {
 		crtc->state->event = NULL;

-- 
2.43.0


