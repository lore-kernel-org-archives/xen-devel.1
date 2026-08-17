Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F21C5B572
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 03:49:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392437.1631385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvoL8-0001QP-5E; Mon, 17 Aug 2026 03:48:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392437.1631385; Mon, 17 Aug 2026 03:48:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvoL8-0001QH-02; Mon, 17 Aug 2026 03:48:46 +0000
Received: by outflank-mailman (input) for mailman id 1392437;
 Mon, 17 Aug 2026 03:48:44 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <philmd@oss.qualcomm.com>) id 1wvoL5-0001QB-Sm
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 03:48:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvoL3-001Kd2-Q2
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 05:48:41 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a82842e-bab6-0a2a0a5309dd-0a2a4507df8e-46
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 05:48:41 +0200
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a828498-b4ea-0a2a45070019-cddcb483d6f6-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 05:48:41 +0200
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67GLEe9J666108
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 03:48:39 GMT
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghnw1wc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 03:48:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-92ec3146553so536746985a.1
 for <xen-devel@lists.xenproject.org>; Sun, 16 Aug 2026 20:48:39 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499877d20fdsm211481035e9.1.2026.08.16.20.48.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Aug 2026 20:48:37 -0700 (PDT)
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
	EsLBxE7C6yuhliAVoQd5K4lTOTwWVs9jvIfglrYIGMA=; b=o+X6ZC7uDJU5eoci
	SKIQVjxFklujwGmjdKBaWfO1wyHWaXJjiEk5w7+cAyYpAROjqSDN0ncVMR4jh8C4
	35Xb/F3xs0F8UCoUlncKQjWs8dVmNXnoio7RFSuy/5Qgo9BcQVQkO5o56mK0PUiA
	KgLURGkqDnCN4OTMhbon/TxK9rpbKEyIY1LyD7Trj9z8Eu0NgD6EZrFXS/Hxj7JM
	I3Pp0/d4sM+tpn9P7674VoN8GJYhfI5iZK12I+Jg7N005xDhPlu3hzt6s8zdKOXG
	B/B+WD39v5UtfL0URsncKi0WXIrMr/VOr2pmNv05+GVz/rpwBAQUZ2/Vjw9waXO6
	qPC5Sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786938519; x=1787543319; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EsLBxE7C6yuhliAVoQd5K4lTOTwWVs9jvIfglrYIGMA=;
        b=DaR+0wVNe+SXrNMPS8XUuI4s4YY7flZVAcbL/T/W9I69CEC5hgaWIoOPEKuQtDLha4
         pfUaGtWCdBSNQH7LN3lDHSggr8ROvZkJDvb7LqIz/b2siNsY/dTOaO29kVNy3rkdaqdI
         tQOhszEnGAP3L5ZBWuWt40FqfJOUaN3mgIWflGdElY1uPm3ckUQ0JBrmLSNVVr6Lrep5
         65TJv8C7ZeFgVJi/+F3/NDX13y2TC+Ru7OWB4LLB2z2I/iNmANDuv5kP5v2q2Jb3+ee0
         Pc94uGb6e64T42GJ/88I/q1Y6TJwnmDnNzdV8wUIW6gW1tCHuo8jQGcGghfffKCmRtRP
         D4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786938519; x=1787543319;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EsLBxE7C6yuhliAVoQd5K4lTOTwWVs9jvIfglrYIGMA=;
        b=GoQOPOZBxTxCtZgTlPhEFpkIQSzqBeBwlWFn54Xo522tQDmXtfPLE80+DZuIgOSJO9
         /66wxDCw2Nv1WuFqzmKywGRNcOALXQprcWon//tTU6pWUrVSKWoxVC9oA7cqdVKfIr22
         JVaS42Bq5931pkE0USoWFf0iaC4vxJg4Bdh1gunD2C2iOgfko+FqefbBISsXDJ8P6+xd
         Shgpr28IXE7G2Ru2yWp9yVtsuimCTgM6KiO85NUSluT7MbEQ2Vyy18i5ZNIVzGXF6q78
         qwlFnLDiYH1D+XpvW1xfsRx3jDIUMGFdEGDSVcESTg0Sv8TlyZ7AjqAS/6FJzYpVjPFM
         CygQ==
X-Forwarded-Encrypted: i=1; AHgh+RruOCj33UDacfcED+2tH65iqJ/4IU0/zmE/nmpt9nzW8T4VX46oGeuBllptfFx3ic4GBlRHskR+v1w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLdHao8aQG7gtnWpxrSMYOBxHMUGFzGsUOJ7HDGOFgITJ2DDtQ
	P8rANr5qyXAO5+rbuqJRhkExFvpiZ9yUoZjM40Igk8M4RVehFpTYWm5S6V/iNXnvw4xncCM8EyO
	2FyOxQ7N5Oy8hmNPgE+D0K7jO14dqUEAni5BYw9QOmt0jSTAsgRbiesBKe2NLTgSS7DN7Hg==
X-Gm-Gg: AR+sD103mru3/F7bSasK7+hqliLX7sCCBVLjI0AlNZD7CPIJZh8fVTBPaxQ+CtG8jDZ
	2aiH9oi7Pu8UYDJxMb1EJUdjbttwgBoKeSFvYFCqT/n20PZGnw/ZroTpqpeKVh1yyJk1eV6Zf+c
	JYWfc5mOG9fVTC9tgzQbjj5tliChjFNlKJbY5BzJuek/f/xH+yGRtUZPvpNzNLbz/sk5YFcU4M9
	UFbvW3o3kPdJp/JnVkqryw828SYQE0im5O3hjxHQ8qx/fcip2kwD6XlolwJyxAtT1w+Ow1jnhyJ
	T/R310TAIMiMA3qZK1YCaoikkLPYYLz8v8SP58BjRP6x1758/U0W4VwGkkuvHzYvkK032OEmwtq
	u4GhuJto70XVbF+ImWM7yoQue2PjVTlNbwSU=
X-Received: by 2002:a05:620a:2683:b0:936:bcd8:8650 with SMTP id af79cd13be357-936d230591cmr2147907385a.38.1786938518828;
        Sun, 16 Aug 2026 20:48:38 -0700 (PDT)
X-Received: by 2002:a05:620a:2683:b0:936:bcd8:8650 with SMTP id af79cd13be357-936d230591cmr2147905285a.38.1786938518479;
        Sun, 16 Aug 2026 20:48:38 -0700 (PDT)
Message-ID: <a0efd5c6-6af4-482f-9646-b917efa0ae29@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 05:48:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 39/49] qdev-monitor: make print_dev() callback take
 MonitorHMP
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
        qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
        =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
        Markus Armbruster <armbru@redhat.com>,
        "Michael S. Tsirkin"
 <mst@redhat.com>,
        Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony PERARD <anthony@xenproject.org>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        xen-devel@lists.xenproject.org
References: <20260816-qemu-no-hmp-v3-0-e53fc35bc550@redhat.com>
 <20260816-qemu-no-hmp-v3-39-e53fc35bc550@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260816-qemu-no-hmp-v3-39-e53fc35bc550@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDAyNiBTYWx0ZWRfX9hboK0dusMM4
 P+wrhQ6v8Kc4/iBUZV4dmRIPJIg9dnxcBMLWjgH3mIh7PAaK0+Zb9Da2y77A9rCbUKD5Y6iTqNn
 IZrc403gjZw1Bxm+2gO8MoykABU9PsBL6c/hY2aixwvB6wph6jzW3FEqQ7Bin2GdtYjIjrgaz/M
 adW2LzeoXt5lsWydRyo6iD15Z5UKlKmukuPfrRgY8zUhLfkR2EZW1eXThy8q8uJkOTxTqZVCo2T
 B2WKnnd/RK2Lkjy6fhJnpK0DgOgTRTZBXlJCWEz818MbUTlIdgbwXIFJEpoEeOf8RT7ueuq8SlQ
 ULVybPOJvpx86p4vrjLFEl2L5i8eJuUd/nI95zYUleiUMbhmxKv8wrGn2d4sxlZwFXOAse375N/
 qzqMgRMApiQGRuEpGdGfVGFR/ZGAOfaN2fxBvVfIVyDTpXtzx7VRmZPfBts+QAaUOzRLJpkoBT/
 azZcUkiJZN51Ze7XV+A==
X-Proofpoint-ORIG-GUID: LPK5b3tc17CM4LF3tVnPOxTV4ofMLaFr
X-Authority-Analysis: v=2.4 cv=QN5YgALL c=1 sm=1 tr=0 ts=6a828497 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDAyNiBTYWx0ZWRfX/zXbql4JAjMY
 nP+rlxAoCkSdXAzvSKZJXmSsFDThzLfMKmTpOgTh6lX3a8gCquwOycZNBjFGRP1I263g++SP7pC
 Q1IZPi9v1QGoV9JAm5uQQL9bxjihIGM=
X-Proofpoint-GUID: LPK5b3tc17CM4LF3tVnPOxTV4ofMLaFr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170026
X-purgate-ID: tlsNG-ef75cf/1786938521-A46CAAE4-374341D7/0/0
X-purgate-type: clean
X-purgate-size: 710

On 16/8/26 21:13, Marc-AndrÃ© Lureau wrote:
> The callback is specific to HMP context, avoid unsafe MONITOR_HMP()
> cast.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   hw/char/virtio-serial-bus.c | 6 +++---
>   hw/core/sysbus.c            | 5 ++---
>   hw/misc/auxbus.c            | 7 +++----
>   hw/pci/pci-hmp-cmds.c       | 3 +--
>   hw/pci/pci-internal.h       | 2 +-
>   hw/usb/bus.c                | 5 ++---
>   hw/xen/xen-bus.c            | 3 +--
>   include/hw/core/qdev.h      | 3 ++-
>   system/qdev-monitor.c       | 7 +++----
>   9 files changed, 18 insertions(+), 23 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

