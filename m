Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3D8C4451B
	for <xen-devel@archiver.kernel.org>; Sat, 18 Jul 2026 15:42:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1365627.1615920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wl7BJ-00029m-HQ; Sat, 18 Jul 2026 15:42:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1365627.1615920; Sat, 18 Jul 2026 15:42:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wl7BJ-00029f-EN; Sat, 18 Jul 2026 15:42:25 +0000
Received: by outflank-mailman (input) for mailman id 1365627;
 Sat, 18 Jul 2026 15:42:24 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ze.huang@oss.qualcomm.com>) id 1wl7BI-00029Z-56
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2026 15:42:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wl7BH-002xU5-BD
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2026 17:42:23 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a5b9e89-bab6-0a2a0a5309dd-0a2a4504c38c-46
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jul 2026 17:42:23 +0200
Received: from [205.220.168.131] (helo=mx0a-0031df01.pphosted.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a5b9edd-b57f-0a2a45040019-cddca8837aa4-3
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jul 2026 17:42:22 +0200
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66IDD3g5838754
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jul 2026 15:42:20 GMT
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bnh33w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jul 2026 15:42:20 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-cab3e9cd922so4296950a12.0
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jul 2026 08:42:20 -0700 (PDT)
Received: from localhost ([188.253.117.185]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-31429f9d439sm22974922eec.5.2026.07.18.08.42.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Jul 2026 08:42:18 -0700 (PDT)
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
	B3Tozc6XvAyXDRXhNm08ssVPc4HklhucZjeYpfFjPmA=; b=l9F6S0Gnb2vjgD6a
	NBQfReSJBOyCIXwIUgjQE9ha1CjdNnqVi17UErZCTYSlBRo/TxMbCbjqKp2d0Yy8
	2grbSegaeCpYWBsCtdZz1Mn3v8FEv1j5UcVICfCZoIiXa6CDvpkRuAbnTODcJZ/U
	B2BcXlqo9x1yKCfP3m63lMsLAwNF6umECQ3O2BYkakRH9Y3pltrWALui4/z2ZZDB
	Oohi70BkTEVI9LYX4Az4ZXFHWOAsSgFmcQVj/yBR+bc/KWRawPM7IARiYuzeczGl
	2Z7prJm/hdBFhaSSwCdQjPyC6p/fQJ948P1wqkX9Tl6bHTlDilZ5bfpKV/jZ9sV8
	GzU+Jw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784389339; x=1784994139; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B3Tozc6XvAyXDRXhNm08ssVPc4HklhucZjeYpfFjPmA=;
        b=INyFRt5kZFSWbLCarnx9En52slxAVgvFgOyqitYs0zHXINhiL89FkzFRN/e+YUkIz5
         5KafRvByV9ihjsTdJVFdbbtkICajtLXKd2Md/fc196Um+vTxtRn4qoHwcH0FScQHchNM
         l/B290VONX5CHZcL4/C8DVlcInF4LsthEAXlhHo0MhcQPg3CrVYQc42SaNnNaWq9GLYI
         aTmzTD0QNMdjuIrGjVhhnZND6IW1p8fxPQpWWN5b8NyUcnaCKSSSlRFmb+B+dQVxteJC
         hoZBEJ3V4auKZP0F7I16tacy/OmaO5tVeqnYlB3PMIl4lc2Tzzz5kcayDfTqKBVDzQom
         NJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784389339; x=1784994139;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B3Tozc6XvAyXDRXhNm08ssVPc4HklhucZjeYpfFjPmA=;
        b=PsJiDbD6CKoqUBHYMibxvyb2zRgHBHtfHFDPPlET5e6xzNn/qo4FKCW+7D/lTXfYfn
         YttsW1X4KaHQ5nE0BQsiA0beNWUP+4WaDe7o9Xevg4EuUYLi8yS/E6cQ30Zw2AffWLA3
         jJV9gEmYySNsT6I9OXK/LbgIVwzrBYWprWg5TOR+QNp2gfw2HbPIFz1D69J6rOy+8Kqb
         5VMA8GgivoL4gf1sFu6hD4OjTyKrhSpKwgH6jkigm0MI7rdyJbC2Em7ZgK5NYbJr+1oG
         xRi0rXhiayiTYc3iKtr3xDrmiaXXIaNwIiQv7myLgmDGEXAKmLliSLyYKle8n1bd9Fvt
         QEZg==
X-Forwarded-Encrypted: i=1; AHgh+RoOLRWIEjGKiPLiU6JuhmJTZ5rTo/7WYh+UO71e+u2MjU7oWwAO7rAEG+b3K/tOBwBrrdpHiyFPGBg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwIM4GOBEiOF5XDVxd0zdG82scfPc6qs+RlO6vNNQu+r/UucMrn
	G5w9ykyNeSiCO5wpvT7N289dYE5PaaBlrunEg/iLf0qfHuQjgi5IYLxBTo31ETIk8mCcWjcNloz
	x6jKIuBujQsF48Dg9IbHBFHLcb8AtjYYVF7CF0Yqgtu1jq/nAqmgBkF7lbgpYDKyWJsDCXQ==
X-Gm-Gg: AfdE7cnJJ+ghZ0ncfD7gOnf4MoPEGeSe29xWooK/ii5BDvdyOkaQl7E7Wv4G/22wbri
	Uydo7p+90ZbUGlflx9njK+pkGGtr1Q040Znpz0HVBFCFzMcyEhm9slSVN+sO1WLTd8HAmWfMmDp
	Lj7RHQfT8yjNVsh+iqFZGPhJJuwnbcA8b/pXPLdW8UU0ppIxDjSHWQR/Pn79DECgxnvN9GPcIW5
	EPBQ9Z8Z20DYElqsX73W4WlDcTxSoOqiEdeypWCKAUDag2zw0Qqgeq6EylkRN2Bkx+Tsfz0A1FI
	ffgxxnZ2Bs+7RzRCjuq4Iay9pq569QpMrDtSeEb/4z2bHFD37BfzM/+PJoyQrWOX3KmanOEOveQ
	alC0zfw==
X-Received: by 2002:a05:6300:95:b0:3bf:e2f1:1b08 with SMTP id adf61e73a8af0-3c3ad9717d4mr7925873637.40.1784389339425;
        Sat, 18 Jul 2026 08:42:19 -0700 (PDT)
X-Received: by 2002:a05:6300:95:b0:3bf:e2f1:1b08 with SMTP id adf61e73a8af0-3c3ad9717d4mr7925851637.40.1784389338852;
        Sat, 18 Jul 2026 08:42:18 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 18 Jul 2026 23:42:10 +0800
Message-Id: <DK1T85P7OAAY.RXCY4AX71VRX@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-aspeed@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
        <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 5/8] drm/gm12u320: replace struct
 drm_simple_display_pipe with regular atomic helpers
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
References: <20260716-drm-simple-kms-removal-v2-0-1133a8fc3785@oss.qualcomm.com> <20260716-drm-simple-kms-removal-v2-5-1133a8fc3785@oss.qualcomm.com> <26981ae1-4aef-4965-8600-f5e30a1b564a@suse.de>
In-Reply-To: <26981ae1-4aef-4965-8600-f5e30a1b564a@suse.de>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDE2MyBTYWx0ZWRfXxUBleYNz9cXC
 AGMtUYWpz34Sanv2xmONJCpIT+zKZBXRJj4KWNtUN3+i8JzF+7ui5YUZY9dZ2V9B2A9vRK05PzX
 CsodY8ZD9+Da0UIOTFmiiQ5gt/nQ9OQPbpEFiss7siAQm6IRppN7Xy3HozrlMfUkix+bpVwhiCl
 fMr7aOIYijlVZdjqYauJkpfVshyosSKekjeBHWX4yEdbE/xsrBqCvoRKRygFAw31ThThMx9DlYE
 OCcN21UJxaIHWmv7fgmfzKQxX/86FMlyN4Lj8EKHoaKL6676+rKHLVlMvXEihDo9/4mS6UOPGVl
 xKdKPe8vGcyQC1Znv5+oxDByMG8qkQlVCGryArgqaV1F3OPlS/4CvAuuOpHZjMiLWzVHSELBKWG
 iX154yBblI1FVe8TtQIH6yoXnWQ50HLQaEENYaQRnMaxMvPk6xs9RqNwLGsjjKTPehePT3zx7L9
 YBQdWnFun8SWl1pkzrQ==
X-Proofpoint-ORIG-GUID: 12bvoK1yx2JNwkIgbQM4_me9vYZscKcW
X-Proofpoint-GUID: 12bvoK1yx2JNwkIgbQM4_me9vYZscKcW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDE2MyBTYWx0ZWRfXxnLAL0bPZis7
 J5xWGPHM8k4rsW4PChO8RiNFxO2wqpaNoC/uXrFdPOYqRMgqT3yZECu5zieY3LefNCc+R8Fhlrx
 sleJdj+ztj93H4i+H0EQe9oTEn8samo=
X-Authority-Analysis: v=2.4 cv=deOwG3Xe c=1 sm=1 tr=0 ts=6a5b9edc cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=RQ3dwY0XcLBFaqRX7rIGyg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ZBS7nKAnUslcPLfxFb0A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180163
X-purgate-ID: tlsNG-ebf023/1784389343-52AC8B50-9BE1A51B/0/0
X-purgate-type: clean
X-purgate-size: 2691

On Fri Jul 17, 2026 at 3:18 PM CST, Thomas Zimmermann wrote:
> Hi
>
> Am 16.07.26 um 11:01 schrieb Ze Huang:
>> Convert gm12u320 to direct primary plane, CRTC and encoder setup.
>>
>> Keep shadow-plane helper state, framebuffer access helpers and
>> no-scaling plane-state check from simple-KMS path.
>>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Tested-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/tiny/gm12u320.c | 132 ++++++++++++++++++++++++++++++++=
--------
>>   1 file changed, 107 insertions(+), 25 deletions(-)
>>
> [...]
>>  =20
>> -static void gm12u320_pipe_enable(struct drm_simple_display_pipe *pipe,
>> -				 struct drm_crtc_state *crtc_state,
>> -				 struct drm_plane_state *plane_state)
>> +static void gm12u320_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>> +					       struct drm_atomic_commit *commit)
>>   {
>>   	struct drm_rect rect =3D { 0, 0, GM12U320_USER_WIDTH, GM12U320_HEIGHT=
 };
>> -	struct gm12u320_device *gm12u320 =3D to_gm12u320(pipe->crtc.dev);
>> +	struct gm12u320_device *gm12u320 =3D to_gm12u320(crtc->dev);
>> +	struct drm_plane_state *plane_state =3D gm12u320->plane.state;
>
> Did you see the reply from the Sashiko bot?
>
> What happens is that user space can apply multiple atomic commits in a=20
> row, but they are applied to hardware asynchronously. So if you take the=
=20
> plane state here directly from the plane, it could have been replaced by=
=20
> a later atomic commit already.=C2=A0 Rather get the correct plane state w=
ith=20
> the helper drm_atomic_get_new_plane_state().
>

I think I misunderstood this point. I had assumed that
drm_atomic_get_*_state() was only needed for the state object directly
matching the helper callback, for example crtc_state in
*_crtc_helper_atomic_enable() and plane_state in
*_plane_helper_atomic_update(), while other state could be accessed via
the device-private structure.

From your explanation, I see that this is wrong. In the atomic commit
path, any state associated with the current commit should be obtained
through drm_atomic_get_*_state(), because the object=E2=80=99s ->state may
already refer to a later commit.

> I did not look at all of the series' patches for this problem, but the ru=
le
> applies to all of the mode-setting code.
>
> Best regards
> Thomas

This affects other patches in the series as well, and some drivers may
need additional fixes in internal helpers too, e.g. arc_pgu_set_pxl_fmt()
in arcpgu.c [1].

I will audit the full series and fix such cases in the next version.

Best regards
Ze

