Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D71CC982D7
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 16:59:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1425720.1649546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7bvF-00053G-6K; Fri, 18 Sep 2026 16:58:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1425720.1649546; Fri, 18 Sep 2026 16:58:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7bvF-000539-3B; Fri, 18 Sep 2026 16:58:49 +0000
Received: by outflank-mailman (input) for mailman id 1425720;
 Fri, 18 Sep 2026 16:58:47 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ze.huang@oss.qualcomm.com>) id 1x7bvD-000532-IK
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 16:58:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7bvC-00F6tx-VQ
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 18:58:46 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6aad6da4-e002-0a2a0a5209dd-0a2a45089a5c-30
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 18:58:46 +0200
Received: from [205.220.168.131] (helo=mx0a-0031df01.pphosted.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6aad6dc4-f659-0a2a45080019-cddca8838444-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 18:58:46 +0200
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68IGoBf11347056
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 16:58:44 GMT
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs72u0nwm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 16:58:44 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-cc4b524ce78so668414a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 09:58:44 -0700 (PDT)
Received: from localhost ([143.246.51.243]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cc5c50e7433sm1426162a12.28.2026.09.18.09.58.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Sep 2026 09:58:42 -0700 (PDT)
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
	FmJ9l5QFBMMe48wI+FnvFQSDXsCaB79a0WihlyuJstA=; b=F862iJklfTEspXfc
	UjvRsNylWUiwop35P1muhLn10HTOL/M7stdoCV5Frgx1dJJyqJCtb9FvturdV8sv
	z3alBIEzMWiVlVthfKBVozYtF7rTFVwi4etMJQaCL3Xb1OMzWcr3mo94SqS0NKef
	R2spGU2cf3Z4YDgyNC0YvETba6iLNRQtX+MmCmDbez6Y2pZzcL6/1A49LPfbZR3+
	EwSgfygJ0q8qQ9GphKHYvddiZI3X3ZqEQSOuyLKfi60D+5Gm3ZpMKc/Bkp7QtCxC
	19jlA5mLGS4eEQmM2YLhernOpYqFKGMWVlTYHqEyqO4snc1SdLMMuu7ckn2KAGe8
	b6XcSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789750723; x=1790355523; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FmJ9l5QFBMMe48wI+FnvFQSDXsCaB79a0WihlyuJstA=;
        b=jJDLv31yYeE5dDXlp/Z9G1ste+iKtZbbWSH+zJOxQFPXy8UUS8Jtwo+K07Qew524DD
         1sW9li8r6RRgC55Xvi6u3w8t6co2pF49NimKVdzTDs4vVopWyB3xVSwh9iq5EjdYwDiI
         D4pSovVB0wYPhknEIbZcqFZRLm13JDD8kzzGrvBCjc7kxtPZKCPMR3Q45b43mLOqUTi7
         tRjUNREct8Us3trDGAh1Q19F8AeJpfYE432ajvLBamCNROXzi2SNYvMHGPWzlO8CsWar
         IuJQhFhVrOajc9wZCPXVO21sZiQz+RAxpGmjywiTvoVFv05oVZaPOFD+vv0piHkZVLbq
         dqJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750723; x=1790355523;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FmJ9l5QFBMMe48wI+FnvFQSDXsCaB79a0WihlyuJstA=;
        b=tU4YtYH9Es7E0vVATWwD6tIh6VDKHzGy+2FoBAAbnrGJKL7e9uOHs4jvhYvTfpbwkF
         ywH2/aJFNKHiZ0QbNsOVVzNm25v05sAMQgbLIgA0GBXZx7pwuQGvTsIJ9A5W2UwtENEa
         BHGAwdHXpC0CyUb3XTUO+AW9U5tzjAOTaVqzMlyDF4a38FC0wu8ryGoqz/5esmTaf5Np
         T55IYHNqyswhMMr/7b1BUGMpuc1v8zgCXOJZuyI4YI9QJ+rwUEJUagoKpp/C3Y4pd0c2
         oSYk9DLv5L3f0CUf30DRSlZsWFSNkL7/TgknibgE4q8SFn6b9hRDBdK2c47zivUNQi+z
         oKfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJ9LFyAOCsFLNFJl0SPTigRrHyZd5eVz6EHWaXY+BFNm6K9egLonjBboO0J0+SknsUXKB5lq7Hioo=@lists.xenproject.org
X-Gm-Message-State: AFuF++kzcVmzp92E9cFoZWMZIivFhBG1VBYL9q4c/Ts7zf5YfVFLCLLP
	+aMbFIUajar5x3/IhEJ5Pe7yWaK8Otksi+sjWHo1jByUOp3RNGcBE6ucIwBTDHuuV6lW5zNVmGi
	zXx8Ym1KBrcjzTFqNQTi8kS+Z0PX98sSrwWjFAghDtqx5wiIBqs3VpSSTWymGm6ndkKzG8w==
X-Gm-Gg: AYBFou23DctS1WmDjS2Q9YgNErTHba57V6nZQXvR4J88+bnHXejJr39sPAR1Fr4CSvI
	VmM+ETivJ3zefXSDVry0l/QkymKuOEJNvy2FH8a5F1v94u+p439Nb38wwQiP9/F4WOoz3HHezbr
	JY/+BznbTwCtXL+m4uP42VsPC5ND/eUJ3PLLRNWHznrvJhZbkflGfF3StU+rYLU10/5XAK/BxAG
	Ukh8FELrSdaBWd16G7pDGGP+JKx1iZIZS+MH9NZuU7uUggVROrbPdRWxacBeOfbaHStm9D6zqCQ
	kptyMleQTrJXHhXbObZWlWuL/EOipJi7jf+2SDZc2xw1WaIB0JzCTFS+kJx9zfPo+Z2arrB3jdS
	2rYCJYw==
X-Received: by 2002:a05:6a20:d707:b0:3dd:a195:fa0e with SMTP id adf61e73a8af0-3dda195fd95mr361304637.51.1789750723373;
        Fri, 18 Sep 2026 09:58:43 -0700 (PDT)
X-Received: by 2002:a05:6a20:d707:b0:3dd:a195:fa0e with SMTP id adf61e73a8af0-3dda195fd95mr361267637.51.1789750722830;
        Fri, 18 Sep 2026 09:58:42 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 19 Sep 2026 00:58:17 +0800
Message-Id: <DLILO7Y6WWXC.ON1PAKLWJM1Y@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-aspeed@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
        <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/2] drm/imx/lcdc: avoid duplicate clk_per enable
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
 <oleksandr_andrushchenko@epam.com>,
        "Philipp Zabel"
 <p.zabel@pengutronix.de>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>,
        "Marian Cichy" <m.cichy@pengutronix.de>
X-Mailer: aerc 0.22.0.r10.g73f20125
References: <20260727-drm-simple-kms-removal-v3-0-de36e534f7a1@oss.qualcomm.com> <20260727-drm-simple-kms-removal-v3-1-de36e534f7a1@oss.qualcomm.com> <bbf8fd0e-8e1c-4899-98f4-b8231800de8c@suse.de>
In-Reply-To: <bbf8fd0e-8e1c-4899-98f4-b8231800de8c@suse.de>
X-Proofpoint-ORIG-GUID: 6QyOg1d8mn6FBGxlNMoJl3GAz_eJW4o9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDI0MiBTYWx0ZWRfX/Z52rwxuHshd
 oAD8GbFJBCoOxMTTtZB6vnbIxbrqtER/xbcwN0e4UJkg7JxRSMA+uYJRbNnIJ0t5vguibPHZYCu
 1ZOF5JzQW4aVmiMxZDaBIkZD1i2N3fA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDI0MiBTYWx0ZWRfX4NAr/0gOaw10
 A4hou6QvCPAIXKuKpK2gXyIckKyrJY5pjNle+PNu8fPOgV01FiEfA8onKUl7dLtBtSkjs4sh4Lg
 iDf7aikjLSIQXelS6O/Mxc9k8njXypi6ksyr1QBPlsZQLN9wVWX2DfVLZ9Q3RpO/qKwsI+iDJu0
 6S4E1yZYxOTlBnqXpe4gE1WHY5+abCGbafLxz+jzKrBTi6lZiqKIxjl+xiZCbNLJlW9AXdS4tVB
 mgsSJEccP2elBF8q7USjmnqskpGx119kJLensAGq7PP4SbXIoEYmluUNtXSsHUkysqqQAMhOWWL
 XucVBI3wwOriB2CV3JDfv7scQty7YtRDXNB6GM7Wd4STaKD+83pgqaxEVeDL9Ojqk5+SfM14gL2
 pXJxaliUaAxhQSZYqrRiVAoX+lM0z7ipvv2VW6JaTLp4vSQNpzhizsPSx4Xd11z1Q/eMY95uQ2t
 ee+UO3ennUA8HJP1PCw==
X-Proofpoint-GUID: 6QyOg1d8mn6FBGxlNMoJl3GAz_eJW4o9
X-Authority-Analysis: v=2.4 cv=DO8acCNb c=1 sm=1 tr=0 ts=6aad6dc4 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=LNnhWNgewsfctp/cwirQdA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=gNeoJdBQTLUQTwsD9V0A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180242
X-purgate-ID: tlsNG-c1860d/1789750726-D4D7087B-B6522880/0/0
X-purgate-type: clean
X-purgate-size: 2316

On Wed Sep 16, 2026 at 2:24 PM CST, Thomas Zimmermann wrote:
> Hi
>
> Am 26.07.26 um 21:42 schrieb Ze Huang:
>> The simple-KMS helper calls the pipe update after enabling the CRTC.
>> On an enable commit, imx_lcdc_pipe_enable() already programs the
>> mode and enables clk_per. The following pipe update sees the plane move
>> from no CRTC to the active CRTC, treats it as a mode update, and calls
>> imx_lcdc_update_hw_registers() again.
>>
>> That second call has no old CRTC state to disable clk_per first, but it
>> enables clk_per again at the end. The disable path only drops one
>> reference, leaving clk_per enabled after each on/off cycle.
>>
>> Skip the register update from the pipe update path when the CRTC already
>> needs a modeset. The enable path has already programmed the hardware for
>> that commit; keep the event handling in pipe update unchanged.
>

Thanks for your review.

> That seems reasonable. Once the driver uses regular DRM helpers instead=
=20
> of simple_kms,=20

> it can all be untangled and this test won't be necessary any longer.

Yes, that's the goal.

IMO it's better to spilt the operations in imx_lcdc_update_hw_registers()
or distinguish the caller.

However, it might be risky to make big changes without hardware validation,
I think it accpetable for now.

>
>>
>> Fixes: c87e859cdeb5 ("drm/imx/lcdc: Implement DRM driver for imx25")
>> Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>
>> ---
>>   drivers/gpu/drm/imx/lcdc/imx-lcdc.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/l=
cdc/imx-lcdc.c
>> index f52832b43aca..81024f7d9e96 100644
>> --- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
>> +++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
>> @@ -311,7 +311,8 @@ static void imx_lcdc_pipe_update(struct drm_simple_d=
isplay_pipe *pipe,
>>   	else if (old_crtc !=3D crtc)
>>   		mode_changed =3D true;
>>  =20
>> -	imx_lcdc_update_hw_registers(pipe, old_state, mode_changed);
>> +	if (!drm_atomic_crtc_needs_modeset(crtc->state))
>> +		imx_lcdc_update_hw_registers(pipe, old_state, mode_changed);
>>  =20
>>   	if (event) {
>>   		crtc->state->event =3D NULL;
>>



