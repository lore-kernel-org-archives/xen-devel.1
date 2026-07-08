Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBD2C43458
	for <xen-devel@archiver.kernel.org>; Wed,  8 Jul 2026 14:47:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1357116.1611605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whTY9-0005mX-Hd; Wed, 08 Jul 2026 14:46:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357116.1611605; Wed, 08 Jul 2026 14:46:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whTY9-0005mQ-Ec; Wed, 08 Jul 2026 14:46:57 +0000
Received: by outflank-mailman (input) for mailman id 1357116;
 Wed, 08 Jul 2026 14:46:56 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ze.huang@oss.qualcomm.com>) id 1whTY8-0005mK-2k
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 14:46:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whTY6-0005ZD-DX
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 16:46:54 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a4e62d1-bab6-0a2a0a5309dd-0a2a4503cf54-18
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 16:46:54 +0200
Received: from [205.220.168.131] (helo=mx0a-0031df01.pphosted.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a4e62dc-ec1a-0a2a45030019-cddca8832f92-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 16:46:53 +0200
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 668C3AVo2736275
 for <xen-devel@lists.xenproject.org>; Wed, 8 Jul 2026 14:46:51 GMT
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9hnv1vg8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 14:46:51 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-448d51840c4so402863fac.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 07:46:51 -0700 (PDT)
Received: from localhost ([151.243.38.149]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-44cfb13d619sm18125627fac.2.2026.07.08.07.46.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jul 2026 07:46:49 -0700 (PDT)
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
	vL4MQZJyYnOZgb+t9Slt97jlU8ZMhiBcIG4lPhLxhqk=; b=l9PTuMVsLQ/lb5E7
	FUy+YKYjhfuxGpV2yPYrT8cW990iscK3mTQzOIF8tGq/IN0UGqjuAyycToz5zcmp
	b5J5Ef65ekAr1pBRTSoIVmVaCAilH9sfGD3P2WGPIs887lWUsiNiEKklxBPgWTzc
	dEcSjBxCFMfjZgSkE9LOnrD5tnmd4F1z/y65PGB1QpI4IiFBzBbHqeO8mC3y1SyT
	VijYEMNHVsbO8/EMtiW5eEhFMLHRcUpvXEZ5J4PAOgvLKXcYGSY8gNO9U3ScfM0r
	JhbjreFoT0InUzIWIFkZZMGSEQ76sA922nbzv2otnraPB1TKtoPir2rkT9lzt6gG
	mmmXMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783522011; x=1784126811; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vL4MQZJyYnOZgb+t9Slt97jlU8ZMhiBcIG4lPhLxhqk=;
        b=XhLD+vKL2EBDYcUKZJm0sBHuKIALcCke3sY+igFt07xylFTOMs4VOU7c88hHaGXx14
         4GnlkbURXEORx79CqgNpwN9PSTGM8yEX1ykl1mD62LMqcQ3zfX45KmIRwIQBDazC7gIt
         SS5/RGdKs/lRaSy2JkEKxz9CTUemNSefv6UZFe2F/5H4O7Gd0eXxg6CHl5hnYc5cwQ5y
         EldxA5GQkv8vrwUdGNWu7VjTtEvAMNE25bgQ0eSF0f7d446zS3+kv7rF7g2B5j59UTty
         PiJX0jZm3i9MQ+kkMdlQxijeHcTWQPbg6rled2vmT0IfF7LNP4123hMGfOYjz7dKw/oM
         VCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522011; x=1784126811;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vL4MQZJyYnOZgb+t9Slt97jlU8ZMhiBcIG4lPhLxhqk=;
        b=Tsn/OeugfjfWdsdwfy6OLs5K9wz7TW9UdXnuB1PvNd27c11XQcQKrB79Z77C3tTz+O
         wcHbxmN0qU5P6XZzsaHWZewUgu54Gj9Uqul5AamzmS2bs/p9iDZsGGfCRgyDy18QgXsG
         wP7Y5XfwEg/0Jz3568ff61Vh+WvbKebpt2Y/mJ+SjPerWxCjQgWkEUA3dBvLLOYnp1+l
         rv8jyVBMzWXJ9yprch4wUJ9oku04m0R4fXjf362J2vrE9BLRzGDD9IaWZf/sBiH9GMfL
         cidL0D3XNCKQMIBFHp/a+Z0zVBSd9v+Fz0OtbTkek4Jk/ZbixfGsMhGZYB8hxCFCWVGN
         bmMA==
X-Forwarded-Encrypted: i=1; AHgh+Rrc5ih9DYX6gYzEF/AH1O4p3JhuxfxNmOHS3DSYBD+w47YBuHQku3ThM7acwLQlud5foGpHOi5wv+I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxT3Lj2TqzHrZER8Z6o9YUP0PC8So6MOtcaNoedbBeJWyZuaz7w
	yUdw16JwLIfFueM05aB9Pu7/U0aTR1P5HlzgZ8qN2zkbA8DOt9emRj+n6edlu7du/MnpU7jVMnR
	yGVcRREjLKKDqSKvAsfgGsx4OtTtjryzw7yGKJRnTg+3GkTG3op5aD2Cy1UVx6S/SUC9m9g==
X-Gm-Gg: AfdE7cmjoQSlNV9PIxesRtpCbIe/UGO/o3QOFaIhwHp8eegzxepUoTSy9gG/NbbzscP
	uQrGQdjZR9tMYVIGGmwnawxpovxfYEkYrYjvNFE38VtTa/9LGWX5cC9buYq3iLCrUFaIFSAJXoj
	o25V5jk/YluFCBqUl0R3wwZM446PJfRS1yPJtFLJcuiyQtzDXrvJ5tnAjZyOnVm2HFNAn2XlOFt
	JWDHprZwGgDiqyElN+prDtINtf/Ofo65LB3ccukO8oACvyOEUobl2oaEsBSzFmPqD8FflDN/wua
	Uicb7/J93SkI+BbpZe3Opk8MRjDAABC+wdY+94vGSfkqp3+W39Jg5H4iURdDtC5NxqfH1XTVCuA
	TZe/sSK/6WiMmTNM=
X-Received: by 2002:a05:6871:2ecf:b0:447:a321:35d with SMTP id 586e51a60fabf-4516387345cmr1779018fac.10.1783522010299;
        Wed, 08 Jul 2026 07:46:50 -0700 (PDT)
X-Received: by 2002:a05:6871:2ecf:b0:447:a321:35d with SMTP id 586e51a60fabf-4516387345cmr1778984fac.10.1783522009770;
        Wed, 08 Jul 2026 07:46:49 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 22:46:30 +0800
Message-Id: <DJT9S3CQRB0P.982J925T9O4B@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-aspeed@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
        <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 5/9] drm/pl111: replace struct drm_simple_display_pipe
 with regular atomic helpers
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
        "Ze Huang"
 <ze.huang@oss.qualcomm.com>,
        "Alexey Brodkin" <abrodkin@synopsys.com>,
        "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
        "Maxime Ripard"
 <mripard@kernel.org>,
        "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>,
        "Joel Stanley" <joel@jms.id.au>,
        "Andrew Jeffery"
 <andrew@codeconstruct.com.au>,
        "Frank Li" <Frank.Li@nxp.com>,
        "Sascha
 Hauer" <s.hauer@pengutronix.de>,
        "Pengutronix Kernel Team"
 <kernel@pengutronix.de>,
        "Fabio Estevam" <festevam@gmail.com>,
        "Linus
 Walleij" <linusw@kernel.org>,
        "Hans de Goede" <hansg@kernel.org>,
        "Alex
 Lanzano" <lanzano.alex@gmail.com>,
        "Oleksandr Andrushchenko"
 <oleksandr_andrushchenko@epam.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com> <20260705-drm-simple-kms-removal-v1-5-b4e1ca053623@oss.qualcomm.com> <747ae980-9358-4e15-84e3-6e2f3e143423@suse.de>
In-Reply-To: <747ae980-9358-4e15-84e3-6e2f3e143423@suse.de>
X-Authority-Analysis: v=2.4 cv=KNNqylFo c=1 sm=1 tr=0 ts=6a4e62db cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=cNux22OjBTKCC6TmznXXXA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=bxtzNzRwT3Q_vXoiTiMA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE0NSBTYWx0ZWRfXwl8GVHZ2FNRt
 tzndXpL7/FNa0tKUuwELDFub1yvoosW6lXlPSufDI+87uzymT2SbTD/He83wnQUzM9V0uDDlz1v
 FYb6hz638lPJFvbfwI8Qs5dub1nO2Mc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE0NSBTYWx0ZWRfXyn/ZnwGFk7em
 51GfzNfBsDTy6Am6zv0LSqAavWFyXFDX5lmtkn+DPbUaxBklWUHg8/3a6uA5GHtD8HJHH09ZJTD
 ybvCzIXTqW2+81omRkG/pNnDqI4ZhCpAm12Z2ahHDPUojkoGEEKkhbBwdUOV4u42I4rBZJLjH5p
 AQ9QVlyZmjgxuQR9+rW9zrtPFJSJ7XCIpDiNDeGKPtxohIJ8GgIFFyG6FRnvU7UHDvXIk+VqQrn
 z5ZwcUDnMtz0w03I21hdF3swt4lqmtxvHFLXRTFNvPXVhpLKfiFtdp1Cs8+uKKE0FKd8oisbVXA
 q5eDPdJMM8n1MYRHE5WFAWabpnnNMFRg3l4S7fT/w6ju92WjeQDrqDCrqTSQhjMpT6TC9fD6B1O
 z5C6ANGcs49UTL+twkWtP9X37tES2yydpY5Wtk8hgdnTwZQDfaD1ZiVX+mXX2ri4h1aCVALbNbI
 4m/4PQ11mZik/8v8l/Q==
X-Proofpoint-ORIG-GUID: luHrAbd6jgMO3Tr5reqpSlgaJJhrmXrH
X-Proofpoint-GUID: luHrAbd6jgMO3Tr5reqpSlgaJJhrmXrH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080145
X-purgate-ID: tlsNG-33051d/1783522014-B49825D1-169519EE/0/0
X-purgate-type: clean
X-purgate-size: 2145

On Wed Jul 8, 2026 at 9:03 PM CST, Thomas Zimmermann wrote:
>
>
> Am 04.07.26 um 20:31 schrieb Ze Huang:
>> Replace PL111 simple display pipe with explicit plane, CRTC and encoder
>> objects.
>>
>> Keep existing hardware programming and vblank behavior, and install GEM
>> framebuffer prepare helper explicitly.
>>
>> Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/pl111/pl111_display.c | 174 ++++++++++++++++++++++++++=
--------
>>   drivers/gpu/drm/pl111/pl111_drm.h     |   5 +-
>>   drivers/gpu/drm/pl111/pl111_drv.c     |   3 +-
>>   3 files changed, 136 insertions(+), 46 deletions(-)
>>

[ ... ]

>> -static int pl111_display_check(struct drm_simple_display_pipe *pipe,
>> -			       struct drm_plane_state *pstate,
>> -			       struct drm_crtc_state *cstate)
>> +static int pl111_plane_helper_atomic_check(struct drm_plane *plane,
>> +					   struct drm_atomic_commit *state)
>>   {
>> -	const struct drm_display_mode *mode =3D &cstate->mode;
>> -	struct drm_framebuffer *old_fb =3D pipe->plane.state->fb;
>> +	struct drm_plane_state *pstate =3D drm_atomic_get_new_plane_state(stat=
e, plane);
>> +	struct drm_crtc *crtc =3D pstate->crtc;
>> +	struct drm_crtc_state *cstate;
>> +	const struct drm_display_mode *mode;
>> +	struct drm_framebuffer *old_fb =3D plane->state->fb;
>>   	struct drm_framebuffer *fb =3D pstate->fb;
>> +	int ret;
>> +
>> +	if (!crtc)
>> +		return 0;
>> +
>> +	cstate =3D drm_atomic_get_new_crtc_state(state, crtc);
>> +	if (!cstate)
>> +		return 0;
>> +
>> +	ret =3D drm_atomic_helper_check_plane_state(pstate, cstate,
>> +						  DRM_PLANE_NO_SCALING,
>> +						  DRM_PLANE_NO_SCALING,
>> +						  false, false);
>
> This is another case of _check_plane_state() running conditionally.
>

Acknowledged

>> +	if (ret)
>> +		return ret;
>> +
>> +	if (!pstate->visible)
>> +		return 0;
>> +
>> +	mode =3D &cstate->mode;
>>  =20
>>   	if (mode->hdisplay % 16)
>>   		return -EINVAL;
>> @@ -117,16 +140,14 @@ static int pl111_display_check(struct drm_simple_d=
isplay_pipe *pipe,
>>   	return 0;
>>   }

[ ... ]

