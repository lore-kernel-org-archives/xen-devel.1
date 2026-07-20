Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E9BC4452A
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 14:26:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366639.1616585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlowu-00087U-Do; Mon, 20 Jul 2026 14:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366639.1616585; Mon, 20 Jul 2026 14:26:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlowu-00087N-Ay; Mon, 20 Jul 2026 14:26:28 +0000
Received: by outflank-mailman (input) for mailman id 1366639;
 Mon, 20 Jul 2026 14:26:27 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <philmd@oss.qualcomm.com>) id 1wlows-00087H-UW
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 14:26:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlows-00G7Yd-Ao
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:26:26 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a5e3009-e002-0a2a0a5209dd-0a2a4508bdea-16
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 16:26:26 +0200
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a5e3010-f659-0a2a45080019-cddcb483eab0-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 16:26:25 +0200
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66KDqelr2604326
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 14:26:24 GMT
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhggg9j6m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 14:26:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51a8c689b5fso195904571cf.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 07:26:23 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4955d6d9e71sm104268275e9.14.2026.07.20.07.26.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 07:26:21 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=qcppdkim1 header.d=qualcomm.com header.i="@qualcomm.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=google header.d=oss.qualcomm.com header.i="@oss.qualcomm.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Content-Language:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xylt6wsFKJvrYyxVqGoSHrKPaMLy/Xg4jMInsdLnhbg=; b=j5ApMr3p6EZG/Nd+
	hGnvGfgyo7mkwOY60sHfUg0uD9QQgMe2JkPYTGznsxjuaiDfZ8VJ2rSORr9y3CWq
	caDSud4jE4wksqsMOUUGXTsYYBrVeOCyQfmq4bM6FX1Kpmnyhf6imeUUFWOP2U+N
	BJzkSNMEMfWgVYG/b3imUbbz072XqVMpsfZhSyEdH57GKm4BDA7noCuqXQ55dgLW
	96meegHLxYsCbkICAapvTJMG6Kiw8bpaH5mj3BFJinHJSel6zePHvTmD3idJaDRQ
	mqYxHTHTu2TZYuKrX1BUUJyLD7AJ8DhbURVs3adYWy1n0SYIdfawGfrvnTQ6T83K
	ZkBp8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784557583; x=1785162383; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xylt6wsFKJvrYyxVqGoSHrKPaMLy/Xg4jMInsdLnhbg=;
        b=atmGS+vumtoeBqiIT1CORhzXmuba6dCswe+uK3p0ghnFa6Frobh7mOAEbiglok+NsT
         wxN0U1b4m3LJte3tqSD8JFANs/YVxPQ8RGTFgBU3C1M/20z/oC0uC77W7uPIdAZ/yHnP
         IYej57XvMPnL1vTbEH/uWP8JuKsVn1T2kgh1lc0E91quk+Q31ni7spAjhDPi3eZbAUkp
         ZcZWTygR9G2crWwyjp8OlLBjcGKCxNhSVWoauTKZNFrr3t3NpXh3pmWYUtITcFiRhGAA
         FoHND2vfGI5fBbgFpRdbbkSRN4TRYKt3yA3RuaBxaGfX33bVIdINK3iVexg7JLji38Bo
         0dLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784557583; x=1785162383;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xylt6wsFKJvrYyxVqGoSHrKPaMLy/Xg4jMInsdLnhbg=;
        b=nRF5EJjF/RJdhEio5IFwm6xpjLJb11lFPJilVAI90orb3RnHDfhEd0d98H24mYTtzi
         8WjZ4PYVVnuVs/l3S+RZdoiW974l7bB5/bIz+GF5ozT/oCES77NdAnN+P3a93OzjcPuu
         Riib8HOnMCaAY5NA5leFF5yNmIDGg11HRcphaDybFx/SSGYtKOB7isZ89AD2ZHFOumzT
         gPyX+m575nvmAmt9098bzENE9OY/fUdk0FEC3PD5uXb2FIRA7Vfql7yOLESxvgOFOzQl
         rRmI+feVeN/igp8Rs53TjbyM9S0zA3opGb3keWjsZuOCab68sYvfoUxaKOQylIGqi5J8
         VQqw==
X-Forwarded-Encrypted: i=1; AHgh+Rpbxk5lkt7zO0hKBQj0h2f9BP8bINgGMKOWFvY69ErUlcIYZjvagmq0N7lMdl+WzpeDHzmFYM/3BTU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQRU56tKuZr2iG848MyKAyMn9Cbt8az2jR1mbNnbf4E/EyOQOm
	baI4pyBtrYBXiENCNbxkiLoNPqVq7qYdgz7KgNCQLw25tq+BEMpNvkw9MJPIy91slRJ8kJgK2hA
	bwuKUkCCQytmhR8A4CmSzASYcOBvP1vva8U0E0ZzLD/Z3usT1iYp0A1Fu1yRiGQHOnGHKdQ==
X-Gm-Gg: AfdE7ck1qO20ivXGx1/L01mprmmGsAd1NqD9toEvN31s9aaz/lGkF4u/B7kNUPE1yuX
	ZI6Xoca3av/MZ547ZJsDyCjiWaCB/3oZSgqt/A4LhCh4w4sIAfIpk2RTEqNVEZY1lakQ8QME7MQ
	KrzZFTLYsQjx16+exPmq3XLt3YPbbvRwRENjmhuIM1A6a/lmHQbzN0vECwX/zd4gR7ySGI8yYFU
	09XJuuYyoTt35pX7MU0bHU4wrOcHSg0EjoB+oIGq/tsAUQNkmQ3F/F3znnj4+t17DX4H4GRjmL8
	en6+BaR/1a9/K3Zv9jDnkjBd1MpYG1HK2uTxE9FhZQgHkP5qAv08l5fB/nV7YWapqkiPmey1a9X
	W9yMZJULsRh7l8jOviik9I+zXEFRgv1lZzeotM4jtoxcdaZLQrPw=
X-Received: by 2002:a05:622a:3d0:b0:51a:f94e:ce51 with SMTP id d75a77b69052e-5213e28f161mr133654261cf.50.1784557583294;
        Mon, 20 Jul 2026 07:26:23 -0700 (PDT)
X-Received: by 2002:a05:622a:3d0:b0:51a:f94e:ce51 with SMTP id d75a77b69052e-5213e28f161mr133653711cf.50.1784557582784;
        Mon, 20 Jul 2026 07:26:22 -0700 (PDT)
Message-ID: <bf0bb4a3-bcf8-44a2-b3da-b9e8fed68a5d@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:26:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] monitor: annotate monitor_qmp_dispatcher_pop_any() as
 coroutine
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
        qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
        Fabiano Rosas <farosas@suse.de>,
        =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
        John Snow <jsnow@redhat.com>,
        Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
        Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
        qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
        Fam Zheng <fam@euphon.net>, "Denis V. Lunev" <den@openvz.org>,
        Christian Schoenebeck <qemu_oss@crudebyte.com>,
        Greg Kurz <groug@kaod.org>, "Michael S. Tsirkin" <mst@redhat.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony PERARD <anthony@xenproject.org>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        xen-devel@lists.xenproject.org, Li Zhijian <lizhijian@fujitsu.com>
References: <20260720-co-v1-0-fabb4db3c204@redhat.com>
 <20260720-co-v1-1-fabb4db3c204@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260720-co-v1-1-fabb4db3c204@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: yJBq3c_6-8XdYfflR8-8cdBb7xHzb4NU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE2MSBTYWx0ZWRfX4GDFao7gFCNS
 2vPTfMcMV2KgTv0U+dXIyrj2gVRiNrnXClBY6qeZuLJAkbbrEy9Ring4uokhr9MnR2B1Y0AHNrZ
 FOUfGLZp+AbQOjc9ZwE44c9+rey4thk35xvk0x/PA/loLBVKKS7RdwFDWzFgTywCxVPLZpN4Ptb
 i6bCzhonI4Cd+h7n6imtjHum8a03OVOeE5mAlZBh+vVIiMs3y+5o0JzreZsyHKBxsnV+UniI2xp
 9J0J2SPNc7qnPxxZ+T9cPApblbfM9oDvnCqjjwp//ghhsVLCZHsprnol8AzeZNYpzB//vShx/UR
 Ha+KbDriu+tH0Pg1VF91/fViSgqxMG2zSiO0ps86w79gcLvJJDQeztUKPi8mugn23p6zKGf/gj2
 0O8r+9cIB43HSfZxCkJjIW/t9DCLMliAuZX6P9IEWRnb29EihuhpwueG/GDo/8LlgqSKJ3KAHlQ
 VGZzO2eCU6i8554DFtw==
X-Authority-Analysis: v=2.4 cv=RPmD2Yi+ c=1 sm=1 tr=0 ts=6a5e3010 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: yJBq3c_6-8XdYfflR8-8cdBb7xHzb4NU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE2MSBTYWx0ZWRfX/juIyR1U1YyD
 135t287AQBm1QLOBsp5Khmg/iH5bOymf5VoHcsWDl0Fm3K/u/8q/G8L0lbZVboCQAeUH9+OV702
 Ic/nDPkWeCSaRlVOAc/om40faUCQzhk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200161
X-purgate-ID: tlsNG-c1860d/1784557586-D715E87B-0764EADC/0/0
X-purgate-type: clean
X-purgate-size: 446

On 20/7/26 09:55, Marc-AndrÃ© Lureau wrote:
> The function calls qemu_coroutine_yield(), and is called from
> monitor_qmp_dispatcher_co().
> 
> Fixes: 60f4f62efeb ("monitor: extract request dequeuing to a new function")
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   monitor/qmp.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

