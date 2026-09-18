Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BEDC982DA
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 15:15:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1425627.1649520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7aIu-0006yG-2L; Fri, 18 Sep 2026 15:15:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1425627.1649520; Fri, 18 Sep 2026 15:15:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7aIt-0006y8-Ue; Fri, 18 Sep 2026 15:15:07 +0000
Received: by outflank-mailman (input) for mailman id 1425627;
 Fri, 18 Sep 2026 15:15:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ze.huang@oss.qualcomm.com>) id 1x7aIs-0006xt-HE
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 15:15:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7aIr-006X1o-QT
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 17:15:05 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6aad556c-8faa-0a2a0a5109dd-0a2a4503aefe-36
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 17:15:05 +0200
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6aad5577-fae8-0a2a45030019-cddcb4839146-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 17:15:05 +0200
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68IF0X5u1234167
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 15:15:03 GMT
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs7jk81ua-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 15:15:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2d6f80c76e6so17559445ad.3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 08:15:02 -0700 (PDT)
Received: from localhost ([143.246.51.243]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ddb73db302sm10267015ad.2.2026.09.18.08.14.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Sep 2026 08:15:00 -0700 (PDT)
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
	klACuV7fdAYuSy7gHXP/AwNMnEDjRFePgshatLjHrOQ=; b=DTqEyIFwhXRJLNu9
	IeYZsHOrKbXijwmdqq+ZxiPvyfet/fCUB0waQ1XFZArweh0RjYYUmoxq7nl/JEN1
	Uy5NmhOd1qusEnfpTpqRg8agzbrAvS7pZSvHR/ylobOfF2XYjSV1/YXA1xxh8us/
	0WSRuT7kO6kdLHoxx0I2EyTlfaVrjEBLOT5OPcRGUnOIkfZCR1Q/Gs7QFtUyIHF/
	pYQtElGkrqyBwxzixxweaHTo1wj2rjXG06RAMMI+IEvfVga5JiRCPKr59GAZzH1x
	JMF+HWQl287jMZVbazg42u8QTxVQ95BPg7psGMdFhgyAH+3PsFf8v+fRdN7V6mJV
	VeUpRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789744502; x=1790349302; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=klACuV7fdAYuSy7gHXP/AwNMnEDjRFePgshatLjHrOQ=;
        b=C8ZOREXWTdqaM32xy1hknWSzg/v9reA94UVS5j5jZcqUXY3kz00zGlvCSLmcJwD0xb
         u+WQRRYBOyyGwcUfUenuteqIfePxzJjyHjL10hoWQsZ+MIcmuUEazbkbNhXmMuTcS0iw
         7A3pcuOJ3O1Xlp3B1YqyZkeEYp0o8eA6vNayoXEdOAyCJ6QEZmrxyebCP/zpIvLlQozc
         9AyxYwoup7xMSPwGtzoDj0Kzp41zsOHmx7g1Xbxv+aUS4S0w679X5Nu8Ey1STsDfZP2n
         Mt4CaWrpi9LLRdHqBV0hs/HhG3YP2ZBGpYPoQxJqZUzAfh7UmSwx+Y4AZxErvpushHqT
         1A2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789744502; x=1790349302;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=klACuV7fdAYuSy7gHXP/AwNMnEDjRFePgshatLjHrOQ=;
        b=dcATbVbkgunAM44znTV8E22GiIazj3n/D5syqyOvfQ9O0uOBoLfTRssLhf4TUVzg8Y
         S4F0LRVCba//ed9UPZ/UIT1FouMoVbmvmfz3ayMv3EzmRgjzDOOvql823c4zJ8d5irbd
         5GmQ9jIKyqbg+5J/tHUCnhWqDrcctRHIgp2GBcxXIfBB81CFq8bG7AZlFtoc4Ife54qq
         IkeUgr5B3o6xHO2hrQHT+OLW/8kt77Zeoc9jjbJP8h73u3/YVRQNYhbUdpVycopTfW4y
         2HFaw9oyREcj8ICnh+5oA/y7hLb1E0VqLKstZzvdL0/L9iOkDqUQc+G95YdRyPv2Ppcp
         BmcA==
X-Forwarded-Encrypted: i=1; AKwUvBzq5JOlxrnf8CUMkkopJdNAZi+QAm4AuUtdd8+IBfd3XSkl3Nmodkx99TCG9KbJAaMWJr0THlxlji4=@lists.xenproject.org
X-Gm-Message-State: AFuF++mo9CmEtQcO+aZj2CPVFj9mdzlhNzoMpNQwzl4G1MMBqCkg/Ksy
	FVeKe19OzQKa6haBntRijvW2yFMSDgM30bEpX/Ts7Z/PTYl/6lwg4Fs257Q15RZpfnEpFSkGJk8
	lHkx4AF4FrYDU9qfoQAejysKqf+07VTNSJdzUPcXheaOdZBz8hdtE/tD79NFY+66tK3pvZw==
X-Gm-Gg: AYBFou0uwMYi78V0jfW5g0DwAqsCvVBgUe9PbErncAiPeXWUXF7ec1bWNKTqQhi6yIh
	dJQFv299sU4fl0QvKd2eB1nu1xYY71huvfcdqxdXjGpTetCCvwviiR4p3ZvgwpMzKR7LfcchfVq
	jjeZ+VUb707ffYh/ETum03ixyCsXoo87v0Ot/ej1omQV/id3YLXCNcxWOkguvwz6EAHN/1aq8tW
	zsl2BLF/duGgt1nCeBG+UW4hSHZY7XszaS2GIvxb+02JXM9Pim9dcBstf+S630z+TijLJXwmk/t
	yczxDLQGk3aa4C9ljmOWO63n1pNGn1o6SrMaQUzsZdI8OHbTK/BakN1PtVdtai5uvirq6cXScqs
	kO+b1cg==
X-Received: by 2002:a17:903:906:b0:2dd:c053:e669 with SMTP id d9443c01a7336-2ddc053e6a2mr4635015ad.47.1789744501633;
        Fri, 18 Sep 2026 08:15:01 -0700 (PDT)
X-Received: by 2002:a17:903:906:b0:2dd:c053:e669 with SMTP id d9443c01a7336-2ddc053e6a2mr4634335ad.47.1789744501092;
        Fri, 18 Sep 2026 08:15:01 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 23:14:35 +0800
Message-Id: <DLIJGTK5M3G0.2PNROS5SMQWNF@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-aspeed@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
        <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/2] drm/imx: replace struct drm_simple_display_pipe
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
 <oleksandr_andrushchenko@epam.com>,
        "Philipp Zabel"
 <p.zabel@pengutronix.de>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>,
        "Marian Cichy" <m.cichy@pengutronix.de>
X-Mailer: aerc 0.22.0.r10.g73f20125
References: <20260727-drm-simple-kms-removal-v3-0-de36e534f7a1@oss.qualcomm.com> <20260727-drm-simple-kms-removal-v3-2-de36e534f7a1@oss.qualcomm.com> <8e4c84be-5c89-4d84-adda-aad4c7de0c8a@suse.de>
In-Reply-To: <8e4c84be-5c89-4d84-adda-aad4c7de0c8a@suse.de>
X-Proofpoint-ORIG-GUID: MLiBPxhPjqk70rc0NIv2TKBkaJ0hli2i
X-Proofpoint-GUID: MLiBPxhPjqk70rc0NIv2TKBkaJ0hli2i
X-Authority-Analysis: v=2.4 cv=FeSiV5+6 c=1 sm=1 tr=0 ts=6aad5576 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=LNnhWNgewsfctp/cwirQdA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=nI5uWgR6GCbiVoZM8DwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIxNyBTYWx0ZWRfX9GkqI9kUxNdH
 xaJowi0Bfn5ZoxL6BBdj96wirRi1/XCkMnxIBzKji0T0axJhprJyqeBmYuE4uL1xi/7xrIz5EzT
 JyJGH0rVQmGeF55c3M0EXNM8vimI/RVCGMasWcCBVlbKeV/JGNcITRAijjaSy7CpSmBr+D9IFxS
 waqdEFvsUFfRLoFqxzBzVx+7CiqNDQCiwl1BkxiMmktsKBY+GZj1rk2tGiu56ctcDgts/pysEfk
 zNq22JZ1MMQ6EiZvz/Pdi53wrG++Ye+V7MeScJq1l8OSkQhHGcHPIMv+VvunlVg4+JDKxp/ewZ3
 nQpw751461wPQ3niEDWh3WiA963ahVKSj/4yRqdZ6D9jdoQ5tBeFDpJUr95qydBBtlc23S21HVi
 7ehDuHleJK+yGH1CWosj9DPdGuJmC9OpNb7DRdxKDrvc4ETkllGmoqjv69aoE6cKNHA1aUYUVCb
 sKrke2p7YwCqQcL96Uw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIxNyBTYWx0ZWRfX6WfenxViJ08H
 Z4E4KMnqr4xWRG4clvJMFxCxkElNE8bx1p+3xTwj6p7NF7vGZyXRsZigG7IDsMVkXfn8wLTNyba
 3lgZRn9RR4QUJRIAnQNpiXp6etVujx4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180217
X-purgate-ID: tlsNG-33051d/1789744505-772F54E9-0DECE7E2/0/0
X-purgate-type: clean
X-purgate-size: 1526

On Wed Sep 16, 2026 at 2:50 PM CST, Thomas Zimmermann wrote:
> Hi
>
> Am 26.07.26 um 21:42 schrieb Ze Huang:
>> Convert i.MX LCDC to explicit primary plane, CRTC and encoder objects.
>> Keep no-scaling plane check and GEM framebuffer prepare callback from
>> simple-KMS path.
>>
>> Wire the vblank lifecycle explicitly with CRTC vblank callbacks and
>> drm_crtc_vblank_on()/drm_crtc_vblank_off(). Use the old CRTC state in th=
e
>> disable path for clock unwinding so the clock reference count remains
>> paired with the previous active state.
>>
>> Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
>> ---
>> +

[ ... ]

>> +static void imx_lcdc_crtc_helper_atomic_flush(struct drm_crtc *crtc,
>> +					      struct drm_atomic_commit *commit)
>> +{
>> +	struct drm_crtc_state *new_crtc_state =3D drm_atomic_get_new_crtc_stat=
e(commit, crtc);
>> +	struct drm_pending_vblank_event *event =3D new_crtc_state->event;
>> +
>> +	if (!event)
>> +		return;
>> +
>> +	new_crtc_state->event =3D NULL;
>> +
>> +	spin_lock_irq(&crtc->dev->event_lock);
>> +	if (new_crtc_state->active && drm_crtc_vblank_get(crtc) =3D=3D 0)
>> +		drm_crtc_arm_vblank_event(crtc, event);
>> +	else
>> +		drm_crtc_send_vblank_event(crtc, event);
>> +	spin_unlock_irq(&crtc->dev->event_lock);
>>   }
>
> Please use drm_crtc_vblank_atomic_flush(). [1]
>
> [1]=20
> https://elixir.bootlin.com/linux/v7.2.5/source/drivers/gpu/drm/drm_vblank=
_helper.c#L51

Thanks! will follow

>
> Best regards
> Thomas
>

