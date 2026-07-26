Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9907C53209
	for <xen-devel@archiver.kernel.org>; Sun, 26 Jul 2026 19:45:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371203.1618846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wo4n9-0004z8-B5; Sun, 26 Jul 2026 19:45:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371203.1618846; Sun, 26 Jul 2026 19:45:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wo4n9-0004z1-8L; Sun, 26 Jul 2026 19:45:43 +0000
Received: by outflank-mailman (input) for mailman id 1371203;
 Sun, 26 Jul 2026 19:45:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ze.huang@oss.qualcomm.com>) id 1wo4n8-0004yv-3R
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2026 19:45:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wo4n7-009ZKg-Gd
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2026 21:45:41 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a666372-5cb7-0a2a0a5109dd-0a2a450bc8ee-46
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 21:45:41 +0200
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a6663e3-b7e8-0a2a450b0019-cddcb483fc72-3
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 21:45:41 +0200
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66QH7Jm71419243
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 19:45:39 GMT
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmm573sq0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 19:45:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-38e1118e4abso3438337a91.0
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 12:45:38 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38f03b0eaa8sm4105998a91.8.2026.07.26.12.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2026 12:45:36 -0700 (PDT)
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
	:mime-version:subject:to; s=qcppdkim1; bh=0ajHIxefN4bg3/NHnVq4I6
	V3IZtJtWB7vSvRVCv6OFg=; b=gqepHiM+WpEKBlSCQThncb9R3/gVRYZO040V+o
	sE3PF0NuXELd2wESCl8B3OfxzuLlatHm14QkBSXAjzyjKMiOXNkpAMJrm+bT0ZJK
	f19mpJyfWxA27aIdH6Q3eI0R6rP6O/3Ij8qKzxPEE3CzJEaqxhG9CkllwsgGqHGI
	HMVq3Va4viF79Ype5Dc9cWRgl/4Q1TaCZRlK0yPy68tHcuvIZF0cTmZLKd4iooFE
	DeT1j8UAGNjfrTlK7ajewKz7zqXnlHow3cRH7X+IOD1r4SdOWXCBdflbFRF+j+4W
	6UkzeFwJeyein3cGOkQYR6BehZkelUfQSo0hVIKYY7DkmxuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785095138; x=1785699938; darn=lists.xenproject.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0ajHIxefN4bg3/NHnVq4I6V3IZtJtWB7vSvRVCv6OFg=;
        b=SeHlg7UJneblbxcOeNe6hDxZHxvDxoqPRUk4ZgA0Bq+CL3648zosxrjBkxRnAQIQoY
         71rYOvDPaGLfzLmxnTBfsIdSwL5MACEtI3el8A51caq+5jzVMPjtuPFU7hb1ckrDqGeS
         UeP4cud1LYGhR5A/nwT7RVPExZbs4uJWAXJUDCjHiBmWHEfP5rIubg7Ob6uv/L1xLOJO
         kJEJDh5rsKoAZvFxlaC/9oJ5q9i5e7fFC13m9e8Pn6GzZIn5cyAwFaFBfS+nXhHltl+s
         iBehaGyFK1tCZHzi8F0Guh1NWhK31vbAl+Ttx0441QVWl/QhMsqD4G3youc6gRw5wTLj
         79YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785095138; x=1785699938;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0ajHIxefN4bg3/NHnVq4I6V3IZtJtWB7vSvRVCv6OFg=;
        b=fi/86m2zpiAEzFiu1ENQziYqaXAagoPvk4jiR8glHVxSqBSswnwTk6elJ8ys7/MjAL
         0EmVVaRxo4yewnIbRLVTl8imCQ88NJLBHunBNNswmoJXmmlgf1Ot96sR8H6ytSWy0CMg
         uNzZV4fK/5jjtn5xmvpXgQtFpfZs/G5iq2qaJm2JSgNfYSdQFfs5kQijtxsYxiFTWy6J
         FxL/2SpFw630SYzzElD9gj0Z8UC/vAWvUzjhLYhqfry0dz/DbJk5zxCVOyexzsqkUHku
         68rX78g3MhC5j57xdy+y73uwkPp6EkRhNrxE8IO9jrT7+wNLZPH6SQaIGCkKXWTAdRmq
         jRkA==
X-Forwarded-Encrypted: i=1; AHgh+Rpz1V7H3vH6Fst+f+Y4ayBl6BD4Y4a0YnRnH05eP6DkBuxNncvwcPC7MR4yxxTqOHCSQ9ILCAigae8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyRbWQ5g5BBXUDZLbUm3q+N5F/CwdM05uNWG41e7+S4z4hCH3ir
	6fNbCE/Z2rH+DONbncm1yG7vGXonfC77NsJZ4VcKUTsCUDphQQIJDv3cuGB0xZKFtqaeINVUpyD
	3juKVNMkVF0+lDy5Ss+pzzMMqMuUBjMNJA277IQ7Nk68SYrr5+vH10IIef21D4LiIUpErhQ==
X-Gm-Gg: AR+sD10gGYWhmCDsPuXXqE/oj7v7Eui+2O+ziWW33SjT1czYBi7J32OgJgK7Vwcx6Zk
	7gquK4laSfvJWC02fHtrNJbxlYzUzGgmfYw1OTl6vvq5mu6kgIR1jTZwmRnK7lcuHYVEj/UJPNe
	qrO9wE9KOPXSaI1vaAUpk6I5QYu+QepE7PUci5+DfgLJOTDW8LZE+6xbYbXa2xrhXKArNonsNq0
	nJa9aIskqtgdEgUgShi5bTM6k1n0/XjMtRehGx+4QF+0KIg8QHHs5IUMs2S+AOc2mP12ucPIkG9
	KFiDLjZJtEmsxjHenyHco5VFvWuZkPGX2mJTO3qCDQgcQcyJfXFJczmsCnUFiXgAkYUQI6bQ3WC
	pLuLJL1oiZIUee3cuBURo
X-Received: by 2002:a17:90b:2dc5:b0:38d:e0c4:c955 with SMTP id 98e67ed59e1d1-38f2950e5b0mr5850198a91.15.1785095137771;
        Sun, 26 Jul 2026 12:45:37 -0700 (PDT)
X-Received: by 2002:a17:90b:2dc5:b0:38d:e0c4:c955 with SMTP id 98e67ed59e1d1-38f2950e5b0mr5850172a91.15.1785095137330;
        Sun, 26 Jul 2026 12:45:37 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Subject: [PATCH v3 0/8] drm: replace simple display pipe users with atomic
 helpers
Date: Mon, 27 Jul 2026 03:45:13 +0800
Message-Id: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMtjZmoC/3WOy27CMBBFfyXymkF+EAdY9T+qLhwzFEMcg8exq
 FD+vXZg0UXZjHSluefcByOMDontmweLmB25MJagVg2zJzN+I7hDyUxyqXnHN3CIHsj564Bw8QQ
 RfchmAC4MV8JqI+SOlfI14tHdF/Dn1zPT1J/Rpkp7fUS8TcWYnm+sN4Rgg/cu7ZvqGfGeoJqBa
 5Adq6CToxTizzI4i6X32ta+25YFcOg3KKzhrdJSfQSi9W0yQ5Wty1nIWf6hCf2WJgtNCKXM9mh
 Vt23/oc3z/AthEOIdWgEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785095128; l=5032;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=M/SBdA7VDjpMs5FPTVXoEwvZ9jXN7FwKp4wRYNhbi8s=;
 b=vdmSVBLYyiSgCzw5y+D627tBad3p1KzqzB30cNZzauX8H/pqI7pNd3FVlHJnpB9kKpf18kN88
 Jj8375htkKRDUvCLX1+Z4CLbQnTHMi4DVNy4Jk0ylOpVkfagdrVuj1K
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfX2HlOQlIYHL+y
 WGBFnO4gBPSj2rBsHqSHXK9SfiQ8O804fHY+LOLFpqXuwf8+xYdCa0tJtzGOUf85ZCsTXKRvu60
 RO2KsERqFtuCWjtUOG7aqXDuzyF0aEM=
X-Proofpoint-GUID: ebDA51Z7iATmdDojNhE-mMp_sAyQmM5k
X-Authority-Analysis: v=2.4 cv=FOErAeos c=1 sm=1 tr=0 ts=6a6663e2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=0c0Jg-khWEd_mnVUI7kA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: ebDA51Z7iATmdDojNhE-mMp_sAyQmM5k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfX/Q7hMQIPPcaF
 +YI9cWmRSuDPpkVZV7zbzRmal4mJ0KafNKmhiWYOZvNLXCY9EMrlzbTSU6PVVf7bpkjaY+KP23G
 DNtdVARuWuhDr/ILX8ymQcecHZgLxbWQLPZopB81SM2EO+DROqBeLgBIMWwLkKDhRPc+EiKZAp/
 MDzHSMsJsLwWGl3kSdpXRksNz+yZ08WMWiMkaNMq8rZ0pD5DMPx8+DKYTArM84cOPyZvrsuuaVS
 S7uuCrOGaALEYIJKSsVLL4Q1v+zgZPUGPTsPoDCnTDf2zj7vQ+MjEGJs7PWNljAuTdl0sNkBCgA
 qfsdTT56Sd2MIbEFq+HN8pIsLQJOEgoBF48KcbHUofYu4nwmtmXnGkoFlrTAgx/u3PwQgWuDMOJ
 NtluvnshfOJrmpUOEmfDfnNuzBI5Dpyy8Sv+FU5ToToiGYuhAGaiGCc8Ah/M8cpObq74s7EnMTl
 s5W+E5KpCn2QOXdY92Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260200
X-purgate-ID: tlsNG-42698a/1785095141-19EC69EA-94BB583C/0/0
X-purgate-type: clean
X-purgate-size: 5034

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
Changes in v3:
- Use atomic state from the commit path consistently in converted helpers:
  fetch new CRTC/plane state from the commit in enable/update/flush paths, and
  use drm_atomic_get_crtc_state() with PTR_ERR() handling in plane atomic_check
  hooks before drm_atomic_helper_check_plane_state().
- Move MCDE one-shot flow start from plane atomic_update() to CRTC
  atomic_flush(), after pending vblank event handling.
- Fix repaper damage update path to skip updates unless CRTC is active.
- Fix arcpgu missing remote encoder node handling and lock CRTC state access in
  debugfs.
- Make container helpers static inline.
- Link to v2: https://lore.kernel.org/r/20260716-drm-simple-kms-removal-v2-0-1133a8fc3785@oss.qualcomm.com

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
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 203 ++++++++++++++++++-------
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  |   3 +-
 drivers/gpu/drm/mcde/mcde_display.c      | 248 ++++++++++++++++++++-----------
 drivers/gpu/drm/mcde/mcde_drm.h          |  12 +-
 drivers/gpu/drm/mcde/mcde_drv.c          |   3 +-
 drivers/gpu/drm/pl111/pl111_display.c    | 199 ++++++++++++++++++-------
 drivers/gpu/drm/pl111/pl111_drm.h        |   5 +-
 drivers/gpu/drm/pl111/pl111_drv.c        |   3 +-
 drivers/gpu/drm/tiny/arcpgu.c            | 201 +++++++++++++++++++------
 drivers/gpu/drm/tiny/gm12u320.c          | 138 +++++++++++++----
 drivers/gpu/drm/tiny/repaper.c           | 138 +++++++++++++----
 drivers/gpu/drm/tve200/tve200_display.c  | 219 ++++++++++++++++++---------
 drivers/gpu/drm/tve200/tve200_drm.h      |   6 +-
 drivers/gpu/drm/tve200/tve200_drv.c      |  12 +-
 drivers/gpu/drm/xen/xen_drm_front.h      |   6 +-
 drivers/gpu/drm/xen/xen_drm_front_kms.c  | 188 ++++++++++++++++-------
 17 files changed, 1155 insertions(+), 440 deletions(-)
---
base-commit: 3696d07837d1df13a5603d77f667685e7dfb3c53
change-id: 20260704-drm-simple-kms-removal-01a031c6a129

Best regards,
-- 
Ze Huang <ze.huang@oss.qualcomm.com>


