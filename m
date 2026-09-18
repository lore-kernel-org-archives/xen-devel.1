Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C656C982D7
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 17:05:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1425729.1649556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7c1v-0006bZ-TS; Fri, 18 Sep 2026 17:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1425729.1649556; Fri, 18 Sep 2026 17:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7c1v-0006bS-PY; Fri, 18 Sep 2026 17:05:43 +0000
Received: by outflank-mailman (input) for mailman id 1425729;
 Fri, 18 Sep 2026 17:05:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ze.huang@oss.qualcomm.com>) id 1x7c1v-0006bK-9Q
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 17:05:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7c1t-006mVJ-T5
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 19:05:41 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6aad6f54-e002-0a2a0a5209dd-0a2a450b858c-26
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 19:05:41 +0200
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6aad6f64-b7e8-0a2a450b0019-cddcb483e4a6-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 19:05:41 +0200
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68IGoPFV1211846
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 17:05:39 GMT
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs23922r6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 17:05:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2dc7337e2a7so12882595ad.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 10:05:39 -0700 (PDT)
Received: from localhost ([143.246.51.243]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ddb75ae73csm11519845ad.57.2026.09.18.10.05.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Sep 2026 10:05:37 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=qcppdkim1 header.d=qualcomm.com header.i="@qualcomm.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-Id:Mime-Version:References:Subject:To"; dkim=pass header.s=google header.d=oss.qualcomm.com header.i="@oss.qualcomm.com" header.h="In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QMjXKTddFP/KRl7r6fg9f8x2YOcB9udmZHxfTy35BWA=; b=WMMuEWXHWJBv/taD
	f9QZUlE46GdUzuTjYYf/C3doWA0kR+Y5MgruXgzoDKrnaUUWblDlcnoq62X0pGZb
	/qbl9/Nh08g2JIywKdvQgqoIFODG95dmBYMwKhKE8pfH/9GV1s9uiIZ/ny0o1Ct9
	AxCx/8lN1sOSKnfJuvaS1JUg9GiNW/atd+A2FpRM9LBALe3ZTIKYfBJ7XUzkVsAm
	/0Sfv53h7nA91Txh3LNTG0XJ02vyxwLdjN4jnrj+2hSOYEPJdtabTGR3PdaWxCxi
	qwYwhp2WIMT4a5wkgjtCyWIgf1y9m/+GKe3lh+g7l4PT8AQ6cRmW8HyvIVAcaiX9
	oOwVlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789751139; x=1790355939; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QMjXKTddFP/KRl7r6fg9f8x2YOcB9udmZHxfTy35BWA=;
        b=Ji0Cq8X43PZ/3yRrGbdtrbHFI3r86UiL3YIFbijELY74R76aWW98PHB4UOHEINxyTf
         LYYjdgH9dsmc8daZ5BvBOh5Mi0iziJJFBw8UUuWCLR4T2KEfe8QNZ87CPypCBWnXyh3x
         KcVXfa5LwXfMfJ7nhA/1Mld/DjfrrmLkY1Frj7wbu+yWva0qwg0oCFWHo0fPcx1/ifwe
         8OrYVFaszWUx9oK96z2l0zDO0g3gRGgdHRRurlo3bp/KmdYJhak9ZH1i/rs+BZsh41ca
         W1G9vlaL0L8ifctTlvv6vCLiSrqFcalkV1Lip4koK36WJ9iFS5511T7uVUBi/+0+uE35
         OQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789751139; x=1790355939;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QMjXKTddFP/KRl7r6fg9f8x2YOcB9udmZHxfTy35BWA=;
        b=K/NqFZeuhRj0EJV2AUAM+WhHHUlWtRtjBGzcBe6923lXOYbH1w5918LgBDL8Pzeoug
         xflggiz0oObidY4luuRfzsY2srhdelXrFX3GrJ6czm18+uOkPIKMPFrZkwk0x8fjB3YQ
         95qcOfW98STBlSsHnExt7+aIwmgcmOuxwKDDHh1+wFuiVjY1I9OpHwWwPDt45MMkf8/h
         fmgocK3VWpGb8IwJD9XM943vIRn9z0MvW9UCtj5QezedQzbSzERXQS8/LmRL4GbgNvce
         ITru7qY/ybpwuPtvOrb/jG/qrZC+gCpKfm4XpUksF3Lf5aiI9fS+aX+QhtSrCtdsQ/M/
         ifJA==
X-Forwarded-Encrypted: i=1; AKwUvBxjnJV8fIGuwR268d5zlDjjbxO61aLL/gFTjCDJeJUycXDSG1saUggmRMg3yuwQD3wvvL/JpC5+diY=@lists.xenproject.org
X-Gm-Message-State: AFuF++nN4kQsCVT6aa9QOHv9xdRIX4v+R4E0qnleN5NeND+jbirimZGG
	wVqB7TtcCKExhr6z+bJ4++7rF4/+1tFmB3uSeUQU7YbEfTBObzmQ8sqLPct7bFwBvDV4mWVTX7y
	aOMLmyHx+fM2H0BxxV1UO0LuGRz3sgodUVne3oDbCkjx3hix6ryLigZcsqvtKYGWLGchW7w==
X-Gm-Gg: AYBFou3eroPvzJ6PUHeU1vSOzR/FhexQCZOKnvRW2m5zxvLV8EycTvdslb2q4vlNOjP
	joXwOzc7BMTlIW/JyUHxyXfUZRgue++0RNwD0WU4B+RD31pfzUGlKMqjWFghCVCwuN5YNmTzqua
	BDl7hxwFd2bhZ0g5SFDTh+nGLiPDyDi615iYDRxj60ytpr/gXgGclvzmCNR5JyMVbYAP5NZ6+Cw
	Bz3fVwU2+jZvI6kA6usQtMblMt+1BbijcaIep2eY/eKNrV32kabx3Msj+x7y5K7JRpnX8usf8Nr
	3RO+E38gM4ifx6d5VhWUr9aHxxBgtRvR0ijwQ8CtIYW5rCfCwMt8yzSM31Fe1Lbvn40cjilPM+W
	1F5/7DQ==
X-Received: by 2002:a17:902:fc50:b0:2dd:c053:e0f6 with SMTP id d9443c01a7336-2ddc053e13emr7876625ad.37.1789751138499;
        Fri, 18 Sep 2026 10:05:38 -0700 (PDT)
X-Received: by 2002:a17:902:fc50:b0:2dd:c053:e0f6 with SMTP id d9443c01a7336-2ddc053e13emr7876085ad.37.1789751137947;
        Fri, 18 Sep 2026 10:05:37 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 19 Sep 2026 01:05:13 +0800
Message-Id: <DLILTJ12IX36.15ABZZEUMTL59@oss.qualcomm.com>
Cc: "Ze Huang" <ze.huang@oss.qualcomm.com>,
        "Alexey Brodkin"
 <abrodkin@synopsys.com>,
        "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>,
        "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
        "Joel Stanley" <joel@jms.id.au>,
        "Andrew
 Jeffery" <andrew@codeconstruct.com.au>,
        "Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>,
        "Pengutronix Kernel Team"
 <kernel@pengutronix.de>,
        "Fabio Estevam" <festevam@gmail.com>,
        "Linus
 Walleij" <linusw@kernel.org>,
        "Hans de Goede" <hansg@kernel.org>,
        "Alex
 Lanzano" <lanzano.alex@gmail.com>,
        "Oleksandr Andrushchenko"
 <oleksandr_andrushchenko@epam.com>,
        "Philipp Zabel"
 <p.zabel@pengutronix.de>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>,
        "Marian Cichy" <m.cichy@pengutronix.de>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-aspeed@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
        <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/2] drm/imx: replace struct drm_simple_display_pipe
 with regular atomic helpers
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: "Maxime Ripard" <mripard@kernel.org>,
        "Thomas Zimmermann"
 <tzimmermann@suse.de>
X-Mailer: aerc 0.22.0.r10.g73f20125
References: <20260727-drm-simple-kms-removal-v3-0-de36e534f7a1@oss.qualcomm.com> <20260727-drm-simple-kms-removal-v3-2-de36e534f7a1@oss.qualcomm.com> <8e4c84be-5c89-4d84-adda-aad4c7de0c8a@suse.de> <aqpJKSSKunElnQ3o@houat>
In-Reply-To: <aqpJKSSKunElnQ3o@houat>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDI0NSBTYWx0ZWRfXz9lnGZRlra3V
 w0w99TSEKX/5CQgtJyckvjLQnx3/1HX8ueBQ5cW8Cy2bGMe6D/KBukHwiKoXLV1KuJXyevmpluN
 JmoxOGsraYuOgmgY9nSW8Zv1fFzfK68=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDI0NSBTYWx0ZWRfX3Vm8f3f+XIak
 /Aq1RrGImoDR/CDaSN3V27L5sPSrBhOsJNE0FnGDIWwMp3qTkhzFFoDw27VhzRVMKCAj+luDQFw
 P7ka4wu235mRT1sU7/sycC2gJ2wxpsGXdhRpAY/oJP4iYvsGnChpBhgx1fyh1ZXUChJM7LpJEOH
 GvUeTw4vWB5sZbvKjCdw9jmd80HUHloFIxhYpByG0wYRIhBbzKdnJy5684Y1FDHSOZ0DMQ2+KI6
 c2m0v1lK33sP1wkqtD9zUM4Z3Fvmjjnyctq14dwHn4YPBj8sKUZ4rk1edY1C/+Eo8xo3fmy9Q6G
 QOvDcEl8wBFOAHr3B07YCzJLFLmEYIwkyE6P4BYxH/c3krA0VTl+ZAHVuvb6NWbK+tMSMlTsZ7v
 5FyQz68LUVGtRS+htSSxVaJKBK3rumzxD3PH2+pyd1Riyjz0Ny1V+Xpx2f+hCtgp0b9MnGYEEFy
 O564Iyz+86isDd+mPRA==
X-Proofpoint-ORIG-GUID: 7H4dEN8HV7w13PDUh-9Jw7JTAefMxiJO
X-Authority-Analysis: v=2.4 cv=I7zw19gg c=1 sm=1 tr=0 ts=6aad6f63 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=LNnhWNgewsfctp/cwirQdA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=IqZAcGRvIuv5jEvzszIA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 7H4dEN8HV7w13PDUh-9Jw7JTAefMxiJO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180245
X-purgate-ID: tlsNG-42698a/1789751141-A8CCF9EA-D6827E69/0/0
X-purgate-type: clean
X-purgate-size: 702

On Wed Sep 16, 2026 at 3:46 PM CST, Maxime Ripard wrote:
> On Wed, Sep 16, 2026 at 08:50:21AM +0200, Thomas Zimmermann wrote:
>> > +static const struct drm_plane_funcs imx_lcdc_plane_funcs =3D {
>> > +	.update_plane		=3D drm_atomic_helper_update_plane,
>> > +	.disable_plane		=3D drm_atomic_helper_disable_plane,
>> > +	.destroy		=3D drm_plane_cleanup,
>> > +	.reset			=3D drm_atomic_helper_plane_reset,
>
> Also, this needs to be drm_atomic_helper_plane_create_state
>
>> > +static const struct drm_crtc_funcs imx_lcdc_crtc_funcs =3D {
>> > +	.reset			=3D drm_atomic_helper_crtc_reset,
>
>  and drm_atomic_helper_crtc_create_state
>
> Maxime

Thanks for the reminder. Will do.

Ze

