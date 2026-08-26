Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A5BC5DF97
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2026 17:55:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400120.1636004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzHqN-00016b-Gg; Wed, 26 Aug 2026 17:55:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400120.1636004; Wed, 26 Aug 2026 17:55:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzHqN-00016U-E0; Wed, 26 Aug 2026 17:55:23 +0000
Received: by outflank-mailman (input) for mailman id 1400120;
 Wed, 26 Aug 2026 17:55:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <philmd@oss.qualcomm.com>) id 1wzHqM-00016O-IZ
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 17:55:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzHqL-00DzpF-Vg
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 19:55:21 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a8f2828-8faa-0a2a0a5109dd-0a2a450c9236-36
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 19:55:21 +0200
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a8f2888-f479-0a2a450c0019-cddcb4837060-3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 19:55:21 +0200
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67QGunot1310536
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 17:55:19 GMT
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga03a9baw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 17:55:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-52dcf1bb6e9so1325661cf.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 10:55:19 -0700 (PDT)
Received: from [10.254.188.74] (134.171.88.92.rev.sfr.net. [92.88.171.134])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c250a5d68desm904935366b.10.2026.08.26.10.55.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 10:55:17 -0700 (PDT)
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
	N+D1dHFIktfWOUtW20rGGierHYR2ew9U5aCa22Ma8B4=; b=Db3Eh64G3/1/dhQn
	DGnNMwGUw6E20COHcfPjREIbO0WCBuMQ20pD14QvxB8bbou1xfVbX9BlGu3wOFYP
	FRT7jMdhj75M8tTK885ZyOxbaX4qEXA5QK0zMnPI0rPR+SUbfTU2gpbxqs0XMLjx
	xln4+6f+QYWgqFxPXSJEcL8d8i7fB4Oup/klvteOPgX79tfqUh1PvwTqKnLr7qz2
	jIXRNoQVR9Y9L+i9bJEyjm0oeVLIqiajd792ktPc93nTcolPEFJUk5rMcueovmDq
	bprCweF47sdBWlGGdWYRg70akn+BPGbqhnVKdE0FOZr4CyC5N5ShjHK5eKPYlK3/
	DdUINA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787766918; x=1788371718; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N+D1dHFIktfWOUtW20rGGierHYR2ew9U5aCa22Ma8B4=;
        b=OS56Yv24ws21trScgrxw0MzlypLzWPSXmHolfB86nL4fXO6R30RWuPY+AlB/SeEXjt
         MC1DVEyMP4RrwQSGAgjntxNAIlqT5mshZ02c5POg8pQBEd3zkc77cJDDJFGd2aSA/8yc
         EGCwiqZjSfLsDMqyFvdyBptOP9ZI52aDOQbkkeHvrBK4cZzUmPKKkad1PeRw6SLNwzU6
         ZfSXn5NpfwJ7Yd3fxRhWVSOUkDFEUjaybtNMiU9cTCX4tkNSt1cvSbFDUeI1ailVIq8y
         1d7kkjO/Uw0HBnICDhm5SgZ7tCvCXKHAYOSHr2poFb4xH3OO6TnhlJLuSv4CBZp8RFxt
         hn6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787766918; x=1788371718;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N+D1dHFIktfWOUtW20rGGierHYR2ew9U5aCa22Ma8B4=;
        b=otvaNa/79v/zDO92vvkUtTZEF5mqTk5sV1yRsrM3TUQ/wxHNwyQvK6ZRmXUHbe5w1t
         mw4886K1JSbLl1zlPWGrVsOLCSarNVR4Txn2c32EW8NyMcCu9yqVuFtymkKEC43+0mp5
         sRedBAHxroHHqDoAJb8yuXqPnsFxHPaoOVjuXgmTNuoSOJ3iOiTrxE7Gnuh4X+aKOCAl
         bLXb/g02sxNvAfjyuBJUR1FPxKT1/vvyD5aXiwwYAgLsYxqpZMOMMA5mhb9SOdOSh/dv
         adKdygVSyJWBdTPIso33Ih3x16cPkh8/oVLkgafbTqs8Db5zXSaEv1f7xYOGXDjyG27v
         Heug==
X-Forwarded-Encrypted: i=1; AHgh+RpGO3CGY1StcLLJpmFgvANWyFS/EWB7TLEc6FcLXOH2nB2Ov9VqtdcoDbtrLdMUqSDJYwCw6GaS/no=@lists.xenproject.org
X-Gm-Message-State: AFuF++lXsKn0hww27MTHlSeHiWTuqthYNxF/xEkY/2PA+3/EDGqldJpf
	pT+j2siuYPWRu20gsIib+J34uETkf+5OjsSBkQbQPoHdOswSUJ8OwTfvVuqag2w3ZAh6NpK5k+P
	z/OfDOd8JlLzsd1IhW58s7H3RlPsJgNriRhXV3JtPnMkf5lfSwsLDQ6UTd6PxZNetrPkxxg==
X-Gm-Gg: AR+sD12PzJ/jFQSjxFUmpeIIkTgtG+RqjXnhckwLXAKe+x8E+C0YffqVfW6NvT4tdPK
	4yT6t3ByVLkDfC/JBjGoiQUZCMOQXOX9qg9uyGacQcP21VR2MPQ05sbYbH/1+ydbR4eTBZyl69E
	69llGH3B5meFuwQ5yvoWnQAsJLyBfiWCDHg5tt6AuXKpdjRLtnvuipdSq2D9r3sB76SSckmU8eg
	CZsdmZWDJthI611SUecuOHi+3a4FnapzV52cUCvAqLQM0amwQEjuhBWWXbAS4ygg7XoDXNWDSuc
	QO/WERyR87AiuB4MaQtk+w4QXXK/l4ANx6G7h1mXtSNgntOzh+cMgXP3SyIy3I5kdF6F7ILaS4q
	I7h/q4RAYGvIYCIm6GZaOIEL9Gox4ulxvB7WvI8YYUFE=
X-Received: by 2002:a05:622a:2d3:b0:517:6fc2:4760 with SMTP id d75a77b69052e-52fa1a9aa93mr10470891cf.9.1787766918514;
        Wed, 26 Aug 2026 10:55:18 -0700 (PDT)
X-Received: by 2002:a05:622a:2d3:b0:517:6fc2:4760 with SMTP id d75a77b69052e-52fa1a9aa93mr10470361cf.9.1787766917986;
        Wed, 26 Aug 2026 10:55:17 -0700 (PDT)
Message-ID: <a75ef05f-9357-44ee-91cc-811375bfd300@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 19:55:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 29/49] monitor: isolate HMP declarations in hmp.h
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
        qemu-devel@nongnu.org
Cc: dave@treblig.org,
        =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@mailo.com>,
        =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
        Markus Armbruster <armbru@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>,
        Brian Cain <brian.cain@oss.qualcomm.com>,
        Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony PERARD <anthony@xenproject.org>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Samuel Thibault <samuel.thibault@ens-lyon.org>,
        Jason Wang <jasowangio@gmail.com>,
        Yoshinori Sato
 <yoshinori.sato@nifty.com>,
        Stefan Hajnoczi <stefanha@redhat.com>, xen-devel@lists.xenproject.org
References: <20260825-qemu-no-hmp-v4-0-af60857c2fbe@redhat.com>
 <20260825-qemu-no-hmp-v4-29-af60857c2fbe@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260825-qemu-no-hmp-v4-29-af60857c2fbe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BlPYHATXis8_vFwB6ZXg1S3qRqIQi7ak
X-Authority-Analysis: v=2.4 cv=VdLH+lp9 c=1 sm=1 tr=0 ts=6a8f2887 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=o1isufRNksZXpKP+aqnsag==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=3WJfbomfAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=PA9M43id2i3nLZc8FP0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=1cNuO-ABBywtgFSQhe9S:22
X-Proofpoint-ORIG-GUID: BlPYHATXis8_vFwB6ZXg1S3qRqIQi7ak
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0OSBTYWx0ZWRfX3HyPVQKDGaSC
 3vEEh6s5q2IEPTA/af1vHH97jUSuGzs8d7u8WlOUsSvSu2V9dwrFPExrPBe9qGXqLSwZ64SpDjV
 oFcL+rVqw5bxpcHYsNojmY2g19lYFKDT2dCzaTX0ZXIt/2wmheZDjDkC5pCakZCk+lr1Yr6rhEn
 uVhxi6vNhhriIc5hxxWgT/G5o5jEKh0c8qCwD6JHKdM9KrhJe7ZLsdW0FFP5AhejLwtAn1uBDIR
 xLR+ZDGw9XGzecpwz65fQ0T/6Tg+HXx1ofPL22mmYhgHBf5V+1l003jNz8P1EoZ/XCHuKlotKnt
 CsFkQWOWsMRffYtR3VsQ6bDC0eXj4LT5IgN5I3I/fUzJkjHuhfu5qP9vKbpNzMA1lx6vFPlvR/Y
 P5aFVoD3YCH3QvyS6cOqCl6/OJOp+NoWLwYPKJPRyKuKRD5Me414nRM5jSprxmkWXDfEcwctUPu
 o3sbKMiiWKC7tXPE9sg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0OSBTYWx0ZWRfX2OTmx/nuMxqV
 wagQtn5BcPsQG0Vkrk6g4S74iNErGBOi0gs+aTgod7RW80L8QXNdCyUNRacyng7hkSuKdCY2XnO
 i5/V4buDS2HBYGMKC3M1Tu2YyzI17CI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260149
X-purgate-ID: tlsNG-d25034/1787766921-50321A5B-ED4475C0/0/0
X-purgate-type: clean
X-purgate-size: 1660

On 25/8/26 21:09, Marc-AndrÃ© Lureau wrote:
> Also rename password & commands with hmp in the name, while at it.
> Other functions need larger changes which we will take care of next.
> 
> Reviewed-by: Dr. David Alan Gilbert <dave@treblig.org>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   accel/accel-system.c           |  1 +
>   accel/tcg/monitor.c            |  1 +
>   chardev/char.c                 |  2 +-
>   disas/disas-mon.c              |  1 +
>   gdbstub/system.c               |  2 +-
>   hw/char/virtio-serial-bus.c    |  1 +
>   hw/core/machine-hmp-cmds.c     |  1 -
>   hw/core/sysbus.c               |  1 +
>   hw/hexagon/hexagon_tlb.c       |  1 +
>   hw/misc/auxbus.c               |  1 +
>   hw/usb/bus.c                   |  1 +
>   hw/usb/host-libusb.c           |  1 +
>   hw/xen/xen-bus.c               |  1 +
>   include/monitor/hmp.h          | 21 +++++++++++++++++++++
>   include/monitor/monitor.h      | 18 ------------------
>   monitor/hmp.c                  |  8 ++++----
>   monitor/monitor-internal.h     |  1 +
>   net/slirp.c                    |  1 +
>   stubs/monitor-core.c           |  1 +
>   stubs/monitor-internal.c       |  2 +-
>   target/rx/disas.c              |  1 +
>   tests/unit/test-util-sockets.c |  1 +
>   tools/qemu-vnc/stubs.c         |  1 +
>   trace/trace-hmp-cmds.c         |  1 -
>   ui/ui-hmp-cmds.c               |  4 ++--
>   util/error-report.c            |  2 +-
>   util/qemu-print.c              |  1 +
>   27 files changed, 48 insertions(+), 30 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

