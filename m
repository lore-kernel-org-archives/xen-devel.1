Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698AFC53209
	for <xen-devel@archiver.kernel.org>; Sun, 26 Jul 2026 19:44:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371181.1618819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wo4lD-0003Tw-De; Sun, 26 Jul 2026 19:43:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371181.1618819; Sun, 26 Jul 2026 19:43:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wo4lD-0003To-8b; Sun, 26 Jul 2026 19:43:43 +0000
Received: by outflank-mailman (input) for mailman id 1371181;
 Sun, 26 Jul 2026 19:43:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ze.huang@oss.qualcomm.com>) id 1wo4lB-0003Td-Ta
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2026 19:43:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wo4l8-00GstL-Bo
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2026 21:43:38 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a666320-2eae-0a2a0a5409dd-0a2a450cde20-14
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 21:43:38 +0200
Received: from [205.220.168.131] (helo=mx0a-0031df01.pphosted.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a666367-f479-0a2a450c0019-cddca8830a4c-3
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 21:43:37 +0200
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66QH8IcQ1527745
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 19:43:35 GMT
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmm3sbnxk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 19:43:35 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-cb6cf425e86so2613496a12.1
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 12:43:35 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbbb66dcd38sm2312070a12.29.2026.07.26.12.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2026 12:43:32 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=qcppdkim1 header.d=qualcomm.com header.i="@qualcomm.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:Message-Id:MIME-Version:Subject:To"; dkim=pass header.s=google header.d=oss.qualcomm.com header.i="@oss.qualcomm.com" header.h="Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FDQIeXpPD+dwLpKCV5Porv
	y3ne6CU+pJakDyD+AScDY=; b=pAZEOG1UWrwTp6+Udv9XpGfugtOEAbIEc8xh32
	izDKpGGoq0uH1WZWcQJmbJh+NgBE/f+Uy+hkdw7i28QDjdp4ViKCyfkO6VwS31Rf
	mPq41EFbFh3JI6QUTWEmXHsgHUGiynrS2EXPL8ZkcGbth9TSJM0wOlwvSBZpQM8B
	S9RjIOpjJQY3oPTTWsdlHzfSuVc90CxICcka85UZSEoOl5LywkG8t9kdG5gFsMwx
	lewic+xOYkv8Oo6dLPBQixW7/Z3DgUgfa8U0YswMXMz76jIhiG6QgcCMmaHZOpAh
	3/lvfjR7c+MmmS1k1XWZ+opI3fWzDVLKNYC2G95V8q3IShMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785095014; x=1785699814; darn=lists.xenproject.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FDQIeXpPD+dwLpKCV5Porvy3ne6CU+pJakDyD+AScDY=;
        b=PN5UmgKuhUuFOor5GquNgnNyd4PoVAOhnXiokjpqNzSADZD+QLzj+YbOStiATjFy/0
         8H9mY/oHH3cOcoU2PCx+NMTguCQk9E8/HPHAyu9NI0ol01ITX08S3vsM34Ix7aH9ur/i
         EqecHZ0nYmw8mXjcW/Jmsf3kQ9FBDFupbHwStlA5ukFRbyk1VUTA7J9Suju/V1v8JJWz
         e30j1Ob07gNTLayk+L+qZmJWTURvrdQftbHhPFVWj6J/H4+TerT/z69ovzWYKTfj9OxZ
         7WnrZ97c5uPItirJsG3ro9wnwYR9P/XPCoiuMHzZiMblls373hQcJnMMTjH/oKFVm5qm
         C1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785095014; x=1785699814;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FDQIeXpPD+dwLpKCV5Porvy3ne6CU+pJakDyD+AScDY=;
        b=LKsrWCAaFyHeIzrbTE5/dwdTdHxSovwy1vlOTqgnzYP/j+9CPFT5n+b13mb6HcjdcJ
         9tgo1A6P5e9nGpWX18ZOZWMuuaUpZWq0C4q6yWQOtAvPu8M0u2PcXhfPwyYx1HtSiuHC
         h4n0HC+dj1zLRlWboSra09AmOk5GNWby/eZib5q2GhwX6V/KYf1ctTbUD9Bcipqupq4L
         EU+xQEUfksPWXhBMF3oK8Uznyy6/K6jwItLT8ih78nUCx1mNHH640zwXBRBsIzW/PgFT
         itRQsprSAqRwzaqgX96DdXqqe7MEcefsnObzb+IJSqeG6En9fXy3Gejq1N5GU7rvTPb8
         jguQ==
X-Forwarded-Encrypted: i=1; AHgh+Row5mfGtMcxQSsjCiUWvymXTu6Ro/7hQLPKu57XaMy3kC3P02BOKJemhn4Brxb6LoMeql1ZHP8QkAY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyE5VRMMAwdaFYm9L40V7I01C+RKjC4D3IhNbr/VVBZwtoCRBg7
	HMK7LBt6zf/N9EBcQupXkHYokz+vFa83QZOKWp88Meu6XWNZO8H+rGe7fpuaxYJoQS7qabsoth5
	xXLzJeAoOvj7NMVSOgZsDWapbSBXTBG1jCwFJithjn3lstcHBizpEDAxaxEMCXfn0vT/Utg==
X-Gm-Gg: AR+sD10zBdrm7sG8J/f6iCRNRDdsMkQjpaJS1BXkPyV3x5DHCOyL4LRzUlzWUwlY1K+
	STr8Q/robeYMbLEPTU3qAtta5vHzywcO2cr8thHEpnXdUXo5AeQEfXaR3waKuv8E4pU2ftd/2Oy
	fwr9mSfhUAVnhrkDX/XGiswkqpmRX/sCoNmNyLTcZXnP5PvTkbYSMi4hYsCt3LvKQOSmKgejR0C
	3w7hL0it9MNzK8oOIR7DN63NxOF4WV7fo3UK1cPYYupaC+WFje19s2tNkiu2j+tXgICtXe3L1PY
	xF1SeUutB0WadGZP7gFsc5Zzs0D2y3bcPP4o4fk+jR5WKwUiW+30U/iWBoO4uzvGAxMmgOQBbWK
	ZrXkvkQwxCZ/pgEGG2zmc
X-Received: by 2002:a05:6a20:43ac:b0:3b3:2703:115 with SMTP id adf61e73a8af0-3c67dc41ae3mr5548164637.16.1785095014247;
        Sun, 26 Jul 2026 12:43:34 -0700 (PDT)
X-Received: by 2002:a05:6a20:43ac:b0:3b3:2703:115 with SMTP id adf61e73a8af0-3c67dc41ae3mr5548148637.16.1785095013838;
        Sun, 26 Jul 2026 12:43:33 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Subject: [PATCH v3 0/2] drm: replace simple display pipe users with atomic
 helpers
Date: Mon, 27 Jul 2026 03:42:31 +0800
Message-Id: <20260727-drm-simple-kms-removal-v3-0-de36e534f7a1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAChjZmoC/3WOwQ6CMBBEf4Xs2SVtEYye/A/jodRVq5RitxCN4
 d9t0auXSSaZmTdvYAqWGHbFGwJNlq3vk6lWBZir7i+E9pQ8KKEasRFrPAWHbN3QEd4dYyDnJ92
 hkFpU0jRaqi2k8hDobJ/L8OH49Ty2NzIxr/0SgR5jIsZvDFrNhMY7Z+OuyJyenhEzGUWDagN56
 Go5+vBaDk9y6f2+1f++TRIFtmuSRou6alS198zlY9RdhpVJ4DjP8wccL41iDAEAAA==
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
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Marian Cichy <m.cichy@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, xen-devel@lists.xenproject.org,
        Ze Huang <ze.huang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785095005; l=2679;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=SzrRHowXSa10BAHCyJ1LhewVqZLaXZNB44vA3ptkLd8=;
 b=ygG0jOkfjjtOnpnb/85WRy8PlT/tiW1jcovVo98E9rFl6SsoVZpL7kFNMISeo+OC86QqJ04Aw
 LK0RRwuDsgNBhR/dSZRqnbW+r+gFyurTl3vHzvkgzWB3HgUd6B0UHHR
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfX/oJWn2/RAjsc
 zV1Z4HBNUlpJ6GjEYqsMEw1WWyhqlQtEWPC6guutxP1vmYFwE3VI+CSDJPypPDv5Km9D+bVv8+e
 xTG0zruHEQwocanl4GegoA6FNrbwBWlr8qBV6ougvswvPQIqNCO6+kgjvOsa1FUsp2DCZeLEnku
 +alFQK5g1lz2I7256/VZ0X0nfyQ0c5v6Z7A9mwVNAW5SLuShPGY62Yd/tS5VzV1AopCrpngu2FU
 s4ZJawEqy4OHN5akdIGX+Y9+I6T/4rNFQ+pAY/+UbaUJEgJ6t3LS5i7G80DCt6YZ2Wupi4XlV2+
 4F27vxRvowXigFcD3bPGz4kfVyo39mnTEfb8++AF47w5gcnAIDqdmFj44NMmkxKs+x9a3+2D/fO
 1LJ6QnOylLe/5YCx295qi6P9byz5ZdqA+zL2rTNwst+XI8rrZtONM6N/P+I3fPAhSGyZW8ZwxQb
 CHQci4Jocgs4X3S45uA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfX+7Fs7u0S7Q60
 zTK1VIwJ69VK5I+FYsGTln4Wgd7VTd0+x8ZyQyfcO65YZKLzyb4jUOl2t5gONFcufxGs57hTd/T
 A0mFbq5fmwmN+WJPo+ohAHXmxZbKKNE=
X-Proofpoint-ORIG-GUID: CAUCGNRqCqPq02qQYPRq3H3A25tlPX-T
X-Proofpoint-GUID: CAUCGNRqCqPq02qQYPRq3H3A25tlPX-T
X-Authority-Analysis: v=2.4 cv=KanidwYD c=1 sm=1 tr=0 ts=6a666367 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=Aa0Oat_sKGPK8WdvVJkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260200
X-purgate-ID: tlsNG-d25034/1785095018-020C1A5B-4904EE37/0/0
X-purgate-type: clean
X-purgate-size: 2681

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

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
Changes in v3:
- Add a new preparatory patch to avoid duplicate clk_per enables in
  imx-lcdc pipe update after CRTC enable.
- Use commit-local atomic state in enable/update/check paths.
- Link to v2: https://patch.msgid.link/20260716-drm-simple-kms-removal-v2-1-7e4a6b8528e6@oss.qualcomm.com/

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
Ze Huang (2):
      drm/imx/lcdc: avoid duplicate clk_per enable
      drm/imx: replace struct drm_simple_display_pipe with regular atomic helpers

 drivers/gpu/drm/imx/lcdc/imx-lcdc.c | 263 ++++++++++++++++++++++++++----------
 1 file changed, 190 insertions(+), 73 deletions(-)
---
base-commit: 3696d07837d1df13a5603d77f667685e7dfb3c53
change-id: 20260704-drm-simple-kms-removal-01a031c6a129

Best regards,
-- 
Ze Huang <ze.huang@oss.qualcomm.com>


