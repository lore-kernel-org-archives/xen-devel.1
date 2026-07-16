Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C17C44501
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 09:03:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1363562.1615137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkHzb-0001E6-A5; Thu, 16 Jul 2026 09:02:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363562.1615137; Thu, 16 Jul 2026 09:02:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkHzb-0001Dz-6b; Thu, 16 Jul 2026 09:02:55 +0000
Received: by outflank-mailman (input) for mailman id 1363562;
 Thu, 16 Jul 2026 09:02:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ze.huang@oss.qualcomm.com>) id 1wkHzZ-0001Dp-6K
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 09:02:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkHzX-00GbEm-EV
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 11:02:51 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a589e3a-bab6-0a2a0a5309dd-0a2a450cebea-10
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 11:02:51 +0200
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a589e39-f479-0a2a450c0019-cddcb48344a4-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 11:02:50 +0200
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66G83AS52123862
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 09:02:49 GMT
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feuex071t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 09:02:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2cca5e0a0c9so124154485ad.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 02:02:48 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cf106b271asm16592555ad.64.2026.07.16.02.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2026 02:02:47 -0700 (PDT)
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
	:mime-version:subject:to; s=qcppdkim1; bh=ublGuK2L8LkFww+I8N33BP
	NROB2FHlpEAQq3id5WGFg=; b=V+6oa4N+LgdZwM5OLLMLzcpu+E7cXBM2MjtCEL
	paYclXuXv45UgosyH+b9jNiKowTXide2Ruhznp2OXf7vih/6t8cP9bhAYTrzPSt/
	jwyj/Kl71gtpnD4kZrMhdE08ty+lQDmLltP4kJyeqX/U1d3yIHP+be9yi19Bjbyj
	SH5VGFy1EQnvdryRsoFC4scN7YkeMd7XyOzadCndh4iPReYTiK/1SpI9rejhWLFs
	J889JR4PrWpy90cTbVS6USh7agUADPwTnK6TH/bG9yig6w22YsSkxL9A7Z4ZAD3m
	qqv71vdY/Wi3BhnG0Ug0fBLjBQLCOvcd6SUZuiNjnMDruDiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784192568; x=1784797368; darn=lists.xenproject.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ublGuK2L8LkFww+I8N33BPNROB2FHlpEAQq3id5WGFg=;
        b=cyNyZIaZGxAzrkdbExFYxiij1676hcaXg3Nz7w8rbFhf8xEoEFyLgNuEB0bDIGmHCi
         0yvSQF7jj91aJztN+ltiDBt7deDMYKPiJTBOSad8sBLOsQi5bwcynyRhyBWKuRogm+pc
         FxFYlLQYuCHui7GsWK6FFha5JHUCEPb7QMF08liVHxpEhs/WeOtkyHROKsYMirEz+9hT
         rUNZJVFpTnsz/LrKrpiXw8YZRApftOfllLdBcgZOVTJ0d4i6w9iuYzshtzuh9N8+Uz50
         1uYowYeowQDJCWN7JYhS8y6lKLu4Bj2WYL5ZG0Qu9IwcLSGOfwwbS29Rp4G6fzuCM2lF
         ZlyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192568; x=1784797368;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ublGuK2L8LkFww+I8N33BPNROB2FHlpEAQq3id5WGFg=;
        b=SW5ogwHAolDZXEbV/ySDWs5q+bqtHGumFge+Y+hEXfcznYRpVadw6JPm1vkg73Ozuw
         Zk7N29bCF30kbTHKdWPqkdI0kXs7P7icfkJSXcSRFzJS8TH4+fvhfIcqk1e3MQUM5iQg
         TFcJ1fZ3eDa/K0KPzYvVzOieFlR7TabpzJzpt74A3icm3sooaCSYPO62OThnIPfROWqI
         Qukl9vOW3ax17UtLlFVrSt0U0JBOdp4YDkVXnh+Ww7DuwfTr+3cvI1K9hRfTP3obVBQe
         bX8XIyz8fs2ojC/L+RY8kwLaiZLQVaqxFjTJquoi2O0m58eVdXnVTfQ+WlCYvHrVTHa9
         Oi0g==
X-Forwarded-Encrypted: i=1; AHgh+Rqu4fkL2dN3wS9qXhsr4YUOSGrSXqvBsHTSa7s/1syTzshjYA18bb5j6+3vm4NMOZyf6HWItTrSdlA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YySEGm9jHWBsoatEVloRVXsE6MoKNlwC8Jz+jdCHN0i4/fjSBSg
	6kXI/KeZctB8yfg9NssFDkAASwnkFs6LGvLprY2r2Rtk4rniZndWy8KSrMymnIIGBmsxJMchEhy
	LfGr3DxUxQkLXLGwStKVkEHV2LjQN+PYvaLzWm40KjnsSXsQf+p+6rfpF/IQUDTuV2NPLKczmpT
	YsxfIH
X-Gm-Gg: AfdE7cnAPtdNSertOLwN9tYjfNB0w62dM10FWeLmov3qsFeP1fge6oDvFkR8ZUM0fSG
	FjOHiji89yl6vqsx3ZmevxmXlrBqakX/TUQOsRtwPZr9oGAV4SwSCJJsAOHuUMDsFpkG9OkWBqO
	llMccBwvjQ4MgTp7OgWEE9Y1eIvdWSKd1oG6cDHwpAtgsHHrPf9ub71oKW2ZFDhK3EZ+h7+qbTW
	dOofzb0eTTwSxAKlhWxdU+bnAmR5pfvTvBWcAEZMgALP6BAvtnxQsc6Nj5R0Ql+fZ9bmVOZh3Rl
	mQnk5Ae8C+SnuKo+iOY3s+a8XwybrvBnE0pPLSoOXmd0jxh+x3GR5eEsW8xUR1nATffZBCIFrkU
	UAQf6Cflqq/sfdh0Nl2N7
X-Received: by 2002:a17:902:d4c7:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2cf03bd52fcmr58054665ad.4.1784192568030;
        Thu, 16 Jul 2026 02:02:48 -0700 (PDT)
X-Received: by 2002:a17:902:d4c7:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2cf03bd52fcmr58054215ad.4.1784192567515;
        Thu, 16 Jul 2026 02:02:47 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Subject: [PATCH v2 0/8] drm: replace simple display pipe users with atomic
 helpers
Date: Thu, 16 Jul 2026 17:01:52 +0800
Message-Id: <20260716-drm-simple-kms-removal-v2-0-1133a8fc3785@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAKeWGoC/3WOwQ6CMBBEf4Xs2TVtUYye/A/jodRVq5RitxAM4
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784192559; l=4273;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=LslnXr/GYqt7lILfSX6H30ANs5TVBAPc61jkQsfXePo=;
 b=Qn3SgZ3Jcpq2dbsoxobIntKn1Fa949LtJINyO/lyXEjkZuMSQIFchq6+tnE8WqT7IXdz+1rFS
 ByTjQjwu366A0YatYIUCp3ydGB4Kf09fwhed1OK9kDkxik/D9RYfMki
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Authority-Analysis: v=2.4 cv=JeeMa0KV c=1 sm=1 tr=0 ts=6a589e39 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=fqn4YNmA52JUfYToRRoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 27JCUbJjofowraKhzRmAqEepxOF_Q6bP
X-Proofpoint-GUID: 27JCUbJjofowraKhzRmAqEepxOF_Q6bP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfXzmkM89iKIgTK
 WKxBmXkdxP0vG+4PskoIoxgywCgZx1WU9OCY8/runoTSPMvsesAlqaR89PJvDtYh9bubN9vxD7q
 L0t0Q5RwwWLvnNKVA7uXf6FaUa5vB4Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfX2bC+34SKxe0W
 gkmOI2hbJFS6P/D7B5WktXuKDS93FD9cUcn/LvQ2a3dgM96HmMtaJ7JDl+ANkIn3Fb+ftcYi9nx
 AUW97mM1vU3bLv67yQpBoewXSZ2oNm2cu6JLojOEXZUH7HozBap01up3epnDiBpYjNam+xtXvTn
 vcfwLNMwYbRgl1nXOYbztRMHo8NwxCvLzbTyRHm6V7GgkjV66QPlH8t4IRjmgYScMQdBTbO3D8J
 Y+XHrkk+tRtd/lnB0i2+XoKT8rVTUuMqNgYSAw3RfikB9ekUfWnXeUJtKvG3UTwp4WBHas8bgcf
 89B75FZwjiKnXG/Eygzz/8jqXVBzz8cOiQ+xA1096ricDRM5IzzE/r3qK/pdQ238GVtRlbG4FYi
 vgMaeGSbqp+ZruVqmlZlAxroEcPFnO7sg4h2rV7EJ0z8jN/UbsSK//ZGar0Yia1I573559aSDwK
 7npX9/wTOVJB7lV8wRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160091
X-purgate-ID: tlsNG-d25034/1784192571-020C1A5B-B961426E/0/0
X-purgate-type: clean
X-purgate-size: 4275

struct drm_simple_display_pipe was meant to simplify simple DRM
drivers, but instead adds an extra wrapper around normal DRM atomic
helper setup. As noted in Documentation/gpu/todo.rst, remaining users
should be converted to regular atomic helpers and stop depending on the
simple-KMS interfaces.

This series converts the following drivers:

  - arcpgu
  - aspeed
  - mcde
  - pl111
  - gm12u320
  - repaper
  - tve200
  - xen frontend

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

Except for gm12u320, no hardware testing was performed.

This series is based on drm-next-2026-06-27.

AI usage disclosure:
- I wrote the first two commits myself. The remaining patches were completed
  with assistance from AI tools.
- AI tools were also used to review the code and suggest code changes for
  the DRM atomic conversion.

Thanks,
Ze Huang

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
Changes in v2:
- common changes:
- create upcast helpers
- use 'commit' as name of struct drm_atomic_commit in atomic helpers
- improve control flow in *_crtc_helper_atomic_check() and
  *_plane_helper_atomic_check()
- Moved page-flip/vblank event handling out of plane update paths and into
  CRTC atomic_flush(), using atomic_flush and disable paths for mcde,
  pl111 and tve200
- arcpgu:
    - remove reduntant mod_supported helper
    - change obsolete mode field to crtc->state->mode
- mcde:
    - drop attach of unused encoder
- tve200:
    - reorder connector/bridge attach
- xen:
    - change possible_crtcs mask to 0
- Link to v1: https://patch.msgid.link/20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com

---
Ze Huang (8):
      drm/arcpgu: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/aspeed: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/mcde: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/pl111: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/gm12u320: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/repaper: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/tve200: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/xen: replace struct drm_simple_display_pipe with regular atomic helpers

 drivers/gpu/drm/aspeed/aspeed_gfx.h      |  11 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 187 ++++++++++++++++-------
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  |   3 +-
 drivers/gpu/drm/mcde/mcde_display.c      | 251 ++++++++++++++++++++-----------
 drivers/gpu/drm/mcde/mcde_drm.h          |   8 +-
 drivers/gpu/drm/mcde/mcde_drv.c          |   8 +-
 drivers/gpu/drm/pl111/pl111_display.c    | 202 ++++++++++++++++++-------
 drivers/gpu/drm/pl111/pl111_drm.h        |   5 +-
 drivers/gpu/drm/pl111/pl111_drv.c        |   3 +-
 drivers/gpu/drm/tiny/arcpgu.c            | 179 ++++++++++++++++------
 drivers/gpu/drm/tiny/gm12u320.c          | 132 +++++++++++++---
 drivers/gpu/drm/tiny/repaper.c           | 132 ++++++++++++----
 drivers/gpu/drm/tve200/tve200_display.c  | 217 +++++++++++++++++---------
 drivers/gpu/drm/tve200/tve200_drm.h      |   6 +-
 drivers/gpu/drm/tve200/tve200_drv.c      |  12 +-
 drivers/gpu/drm/xen/xen_drm_front.h      |   6 +-
 drivers/gpu/drm/xen/xen_drm_front_kms.c  | 175 +++++++++++++++------
 17 files changed, 1107 insertions(+), 430 deletions(-)
---
base-commit: 3696d07837d1df13a5603d77f667685e7dfb3c53
change-id: 20260704-drm-simple-kms-removal-01a031c6a129

Best regards,
-- 
Ze Huang <ze.huang@oss.qualcomm.com>


