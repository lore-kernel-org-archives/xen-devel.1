Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A440C43458
	for <xen-devel@archiver.kernel.org>; Wed,  8 Jul 2026 14:05:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1357069.1611570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whStQ-0007Bb-3X; Wed, 08 Jul 2026 14:04:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357069.1611570; Wed, 08 Jul 2026 14:04:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whStQ-0007BU-09; Wed, 08 Jul 2026 14:04:52 +0000
Received: by outflank-mailman (input) for mailman id 1357069;
 Wed, 08 Jul 2026 14:04:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ze.huang@oss.qualcomm.com>) id 1whStO-0007BM-F3
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 14:04:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whStN-000LEt-Iu
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 16:04:49 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a4e58ed-5cb7-0a2a0a5109dd-0a2a4504e5ba-48
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 16:04:49 +0200
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a4e58fb-a01d-0a2a45040019-cddcb483371e-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 16:04:44 +0200
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 668C3Q4h2667378
 for <xen-devel@lists.xenproject.org>; Wed, 8 Jul 2026 14:04:43 GMT
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f99hgugak-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 14:04:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2cae455cf6dso13805815ad.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 07:04:42 -0700 (PDT)
Received: from localhost ([151.243.38.149]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9bdcbe2sm29180235ad.9.2026.07.08.07.04.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jul 2026 07:04:40 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=qcppdkim1 header.d=qualcomm.com header.i="@qualcomm.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-Id:Mime-Version:References:Subject:To"; dkim=pass header.s=google header.d=oss.qualcomm.com header.i="@oss.qualcomm.com" header.h="In-Reply-To:References:Cc:To:From:Subject:Message-Id:Date:Content-Transfer-Encoding:Mime-Version"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7S+MjchcQqeSwjWf/6h1QHGeCWnNy62k3EwNXzSfzYE=; b=XYn5xS7iC7VCcWix
	xhnhTIcvDNsc1/nvfBhoPlNbOhiej2Avy11JpIjojoQiY5W7VaF6F64qB174NOCl
	2CQumGJy+kTFU2ACISEHy1qwarBGDEfgE0UKgxgCq12USRJvImgwzKRpvwoihH4a
	E8Dc1MurOOAeC6VGsIkChHnSuAel5oo0Yf4wS7G8TILVblGK+LApBlJNmAFhJrE3
	iMNn1EO5gr+PsJHXUPL5j/Z3LK24ZSi7OEIPpG/qFsg48yuKx+nfFFww6QPfWnLo
	FZxPnOLImbYNSBpBGfMHvs2t6mdaDaMv4RClDsBsjH5NqC5WGizNkXg9m+Uo2Pue
	d726+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783519482; x=1784124282; darn=lists.xenproject.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7S+MjchcQqeSwjWf/6h1QHGeCWnNy62k3EwNXzSfzYE=;
        b=MfZt2dPTIk67jwErbWEsBuJdShLrzCthsLiy5lWZ92poo8JEoisyHclO76Y+9I+IgT
         +RtdVwX0+IzZNvgtJcnAZqTYheJ0jb7j26pdpzFWdbDCia21ymOJ6UKhIJt6TOlP9TqV
         GSI/Bay4ZgGFB2HssuPrnriWQW5+AKcjGd/6hx0gfMthYka4BLF2jW0xD6GnytQFw7Mz
         PBusL15pvnLQ7OB4CzGftFqUj+EN+88uQXjfPsUn+3D7YxYm/nIkEIPRdVf61A8Sxk2a
         axJziiN2d/uF6HF2iHkZl70Lxx4/er+Ue5zQcFeP8TuCXtpOr9SGN22sUC2nhYLWYuko
         AuTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783519482; x=1784124282;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7S+MjchcQqeSwjWf/6h1QHGeCWnNy62k3EwNXzSfzYE=;
        b=ERma8QBYX/eSVutooZQ2jvof9BYtSZzOFsUhfkGZR4HK95UbDVtc1VtXEREhM5EOhW
         pdOYT5R6NiK/912e4jcnNsTjF8QeLY6fQYtwTdl0A1//cVSg7Zxd13+FNs2qohluoRB4
         gsz9GiHekYZugp1cJqls0p1cXlED5CfLombgjdLw7uHRejn2xhiWF3KxBEyACsexQNax
         fO7v3K3CKlUmahx+pRVi08yiHXBQWSYepqhSHO49PyV6fDNGbVhq6AdaqsPD1gC4jj7U
         4VMNe0wjk+y57ADm8Tr8+ku48I5Li3jJywsuJYL2Bt0Td97kammqWjjYTRvDcqNpJQs4
         3qzA==
X-Forwarded-Encrypted: i=1; AHgh+RoWJiDM8lRoVxnE1TPVKm8rJN57mlId3d1TwdGNjdPOVSU6cdVFlKMBSSZgRvMCI7mKpPK7u0Nvc/k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyfQJJ3o0+okQyDuz6cb2zJCahSMByS/1KpCInkYM017zfUvyDR
	AiXM7UK7kFQExrNb1Ltyms2f8IeaVpsesFYPn0txVVrHYfh83SFcXuL6JwkHm3p01fB+XEkY8WO
	uepGNvgaBLvlPFfPh0ekUHBFNImwbk7+5XpljqGkwamCDD14A65g5R5aoihONmCKYt4eVNA==
X-Gm-Gg: AfdE7clXuFJjR6oIfQFA76tvZRZNBSGYc0IoDmTXIf+zjuzjSUoqCz4e5Xj7SeEEclQ
	9+/5SnrJUY0fzQpLLsAUo7EGBEKkNJU9hmkq0a2YlCRAVSzEgD7C17GY40RSnCL0B47OJuceW72
	dQbxST2tcPUNPqr3BPUOjJOaTFV+cVzlOEYZL3RsrBvvjSzAhJ8L0wfQIaU6ga2gOMgF/90x1QR
	9eXDGSBaHhSuv4XbHXxLpGgSfNpDwFhfX1QqpTI2UkL+LU3n7sy+gREwC2SxMY7QPah7S1eSoFK
	vJib8Rw1vqVMEGok/o338dcfMgl4qILb4CaZObqPByk1gan5J49IUXB/P1UmtcNdY+Wi8rFcmdX
	dGSo7xAsJHc5KQDU=
X-Received: by 2002:a17:903:110f:b0:2c9:ae0b:61e3 with SMTP id d9443c01a7336-2ccea2d7e14mr27467065ad.2.1783519481623;
        Wed, 08 Jul 2026 07:04:41 -0700 (PDT)
X-Received: by 2002:a17:903:110f:b0:2c9:ae0b:61e3 with SMTP id d9443c01a7336-2ccea2d7e14mr27466655ad.2.1783519481069;
        Wed, 08 Jul 2026 07:04:41 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 22:04:21 +0800
Message-Id: <DJT8VTO893BW.1DXRZNVOUL362@oss.qualcomm.com>
Subject: Re: [PATCH 4/9] drm/mcde: replace struct drm_simple_display_pipe
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
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-aspeed@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
        <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com> <20260705-drm-simple-kms-removal-v1-4-b4e1ca053623@oss.qualcomm.com> <4d1ddd5d-2635-4ee0-8481-78f3a034233b@suse.de>
In-Reply-To: <4d1ddd5d-2635-4ee0-8481-78f3a034233b@suse.de>
X-Proofpoint-GUID: VCdDdR5qHlhKWPKTM6ZdN1jTg109eK6B
X-Authority-Analysis: v=2.4 cv=CviPtH4D c=1 sm=1 tr=0 ts=6a4e58fa cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=cNux22OjBTKCC6TmznXXXA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=7ZHkO8slaP7M83yUoBMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: VCdDdR5qHlhKWPKTM6ZdN1jTg109eK6B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEzOCBTYWx0ZWRfXxx9mg1HIfzf8
 JJ4z9lTTw2RXMLrWLm046zBhGUJX9BV7m775OG1ntNKllXg1ijCI2QmwfmexX1fNx7mf+GNe5k7
 HRRUKqxLdHuzTr6yTfl7n2JwSIhp69I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEzOCBTYWx0ZWRfX1LYwyJZtXvmC
 79dslbijjTw9eWq5vLPAG+97tOAib1P97RkwITR3DEOhg0tHJxv8uTdL7KcDheQzaku62j1Nyri
 CuRd6ahG/N0z+OCuD3XccKjIpMFPdl2ngL3IjWE1oFwrHSIBwfYeT6vEo/aUSnqPjjHW9N4KYTO
 LAs1Qq9wPEdd20iMhAzMtAmuKCOkoCrvurX+1CzeiJ5Q1RZrIG6HsfHGOQlW0EJllcMJ+HdgnUL
 xMUbabaY8yOsQefbCm7zuWwt7a/RSlgYWsYKLSp6pzt5+REPSQRQX6WilclNcxSUMpnxTCHWsbF
 dvywI/z5GrTw7BVOzRx+E+PvcQZ5iXGsjl5iPWegVpnUpguljYdauJwXgkQM87McW+8R7O85PnA
 sM2PGHs60Qz96xXUgUfAJelMqxpPYSzGDZfUurOqf50Xk31DGmMQl6WX1JrC5c74TWu0658XqUW
 i+z44ZDuMj2KBFMdTag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080138
X-purgate-ID: tlsNG-ebf023/1783519484-AE3371CC-6C1421AA/0/0
X-purgate-type: clean
X-purgate-size: 7183

On Wed Jul 8, 2026 at 9:02 PM CST, Thomas Zimmermann wrote:
> Hi
>
> Am 04.07.26 um 20:31 schrieb Ze Huang:
>> Convert MCDE to explicit plane, CRTC and encoder objects.
>>
>> Keep FIFO, event and framebuffer update sequencing intact, and install
>> GEM framebuffer prepare callback explicitly.
>>
>> Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/mcde/mcde_display.c | 162 +++++++++++++++++++++++++++-=
--------
>>   drivers/gpu/drm/mcde/mcde_drm.h     |   6 +-
>>   drivers/gpu/drm/mcde/mcde_drv.c     |   3 +-
>>   3 files changed, 129 insertions(+), 42 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/=
mcde_display.c
>> index 257a6e84dd58..4d86fa5030eb 100644
>> --- a/drivers/gpu/drm/mcde/mcde_display.c
>> +++ b/drivers/gpu/drm/mcde/mcde_display.c
>> @@ -10,6 +10,7 @@
>>   #include <linux/regulator/consumer.h>
>>   #include <linux/media-bus-format.h>
>>  =20
>> +#include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_device.h>
>>   #include <drm/drm_fb_dma_helper.h>
>>   #include <drm/drm_fourcc.h>
>> @@ -18,7 +19,6 @@
>>   #include <drm/drm_gem_dma_helper.h>
>>   #include <drm/drm_mipi_dsi.h>
>>   #include <drm/drm_print.h>
>> -#include <drm/drm_simple_kms_helper.h>
>>   #include <drm/drm_bridge.h>
>>   #include <drm/drm_vblank.h>
>>   #include <video/mipi_display.h>
>> @@ -132,7 +132,7 @@ void mcde_display_irq(struct mcde *mcde)
>>   	writel(mispp, mcde->regs + MCDE_RISPP);
>>  =20
>>   	if (vblank)
>> -		drm_crtc_handle_vblank(&mcde->pipe.crtc);
>> +		drm_crtc_handle_vblank(&mcde->crtc);
>>  =20
>>   	if (misovl)
>>   		dev_info(mcde->dev, "some stray overlay IRQ %08x\n", misovl);
>> @@ -157,13 +157,35 @@ void mcde_display_disable_irqs(struct mcde *mcde)
>>   	writel(0xFFFFFFFF, mcde->regs + MCDE_RISCHNL);
>>   }
>>  =20
>> -static int mcde_display_check(struct drm_simple_display_pipe *pipe,
>> -			      struct drm_plane_state *pstate,
>> -			      struct drm_crtc_state *cstate)
>> +static int mcde_plane_helper_atomic_check(struct drm_plane *plane,
>> +					  struct drm_atomic_commit *state)
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
>
> Your planes' atomic_check functions should always run=20
> drm_atomic_helper_check_plane_state() first. Otherwise, the plane state=
=20
> will be incorrect.
>
> If there is no crtc, simply pass NULL for the CRTC state.=C2=A0 I'd advis=
e to=20
> duplicate the pattern at [1] from lines 487 to 498.=C2=A0 After=20
> _check_plane_state() ran, the atomic_check can do additional tests.
>
> If not looked over all the other patches for this problem, but this=20
> comment would apply to all of them.
>
> [1]=20
> https://elixir.bootlin.com/linux/v7.1.2/source/drivers/gpu/drm/mgag200/mg=
ag200_mode.c#L487

Will follow, thanks

>
>> +
>> +	cstate =3D drm_atomic_get_new_crtc_state(state, crtc);
>> +	if (!cstate)
>> +		return 0;
>> +
>> +	ret =3D drm_atomic_helper_check_plane_state(pstate, cstate,
>> +						  DRM_PLANE_NO_SCALING,
>> +						  DRM_PLANE_NO_SCALING,
>> +						  false, false);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (!pstate->visible)
>> +		return 0;
>> +
>> +	mode =3D &cstate->mode;
>>  =20
>>   	if (fb) {
>>   		u32 offset =3D drm_fb_dma_get_gem_addr(fb, pstate, 0);
>> @@ -1149,16 +1171,14 @@ static void mcde_setup_dsi(struct mcde *mcde, co=
nst struct drm_display_mode *mod
>>   	*dsi_formatter_frame =3D formatter_frame;
>>   }
>>  =20
>> -static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
>> -				struct drm_crtc_state *cstate,
>> -				struct drm_plane_state *plane_state)
>> +static void mcde_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>> +					   struct drm_atomic_commit *state)
>>   {
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>> -	struct drm_plane *plane =3D &pipe->plane;
>>   	struct drm_device *drm =3D crtc->dev;
>>   	struct mcde *mcde =3D to_mcde(drm);
>> +	struct drm_crtc_state *cstate =3D crtc->state;
>>   	const struct drm_display_mode *mode =3D &cstate->mode;
>> -	struct drm_framebuffer *fb =3D plane->state->fb;
>> +	struct drm_framebuffer *fb =3D mcde->plane.state->fb;
>>   	u32 format =3D fb->format->format;
>>   	int dsi_pkt_size;
>>   	int fifo_wtrmrk;
>> @@ -1298,9 +1318,9 @@ static void mcde_display_enable(struct drm_simple_=
display_pipe *pipe,
>>   	dev_info(drm->dev, "MCDE display is enabled\n");
>>   }
>>  =20
>> -static void mcde_display_disable(struct drm_simple_display_pipe *pipe)
>> +static void mcde_crtc_helper_atomic_disable(struct drm_crtc *crtc,
>> +					    struct drm_atomic_commit *state)
>>   {
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>>   	struct drm_device *drm =3D crtc->dev;
>>   	struct mcde *mcde =3D to_mcde(drm);
>>   	struct drm_pending_vblank_event *event;
>> @@ -1381,17 +1401,23 @@ static void mcde_set_extsrc(struct mcde *mcde, u=
32 buffer_address)
>>   	writel(buffer_address + mcde->stride, mcde->regs + MCDE_EXTSRCXA1);
>>   }
>>  =20
>> -static void mcde_display_update(struct drm_simple_display_pipe *pipe,
>> -				struct drm_plane_state *old_pstate)
>> +static void mcde_plane_helper_atomic_update(struct drm_plane *plane,
>> +					    struct drm_atomic_commit *state)
>>   {
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>> -	struct drm_device *drm =3D crtc->dev;
>> -	struct mcde *mcde =3D to_mcde(drm);
>> -	struct drm_pending_vblank_event *event =3D crtc->state->event;
>> -	struct drm_plane *plane =3D &pipe->plane;
>> +	struct drm_crtc *crtc =3D plane->state->crtc;
>> +	struct drm_device *drm;
>> +	struct mcde *mcde;
>> +	struct drm_pending_vblank_event *event;
>>   	struct drm_plane_state *pstate =3D plane->state;
>>   	struct drm_framebuffer *fb =3D pstate->fb;
>>  =20
>> +	if (!crtc)
>> +		return;
>
> The helper first does vblank handling and then handles visibility by=20
> testing "if (fb)". No need for this test.

Will drop it

>
>> +
>> +	drm =3D crtc->dev;
>> +	mcde =3D to_mcde(drm);
>> +	event =3D crtc->state->event;
>> +
>
> And this needs to handle !crtc without returning.
>
>>   	/*
>>   	 * Handle any pending event first, we need to arm the vblank
>
> And the next block handled vblanks, which is not the right place. That's=
=20
> a preexisting issue.=C2=A0 Vblank handling is better done in the crtc's=
=20
> atomic_flush.

I'll move vblank handling logic to new atomic_flush function

>
> Best regards
> Thomas
>
>>   	 * interrupt before sending any update to the display so we don't
>> @@ -1443,9 +1469,8 @@ static void mcde_display_update(struct drm_simple_=
display_pipe *pipe,
>>   	}
>>   }

Thanks,
Ze

