Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703DCC44529
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 20:58:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367403.1617185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlv3p-00069o-Ei; Mon, 20 Jul 2026 20:58:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367403.1617185; Mon, 20 Jul 2026 20:58:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlv3p-00069h-C7; Mon, 20 Jul 2026 20:58:01 +0000
Received: by outflank-mailman (input) for mailman id 1367403;
 Mon, 20 Jul 2026 20:58:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <philmd@oss.qualcomm.com>) id 1wlv3o-00069b-4E
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 20:58:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlv3n-000OSU-9m
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 22:57:59 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a5e8bd5-bab6-0a2a0a5309dd-0a2a450caa3c-6
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 22:57:58 +0200
Received: from [205.220.168.131] (helo=mx0a-0031df01.pphosted.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a5e8bd4-f479-0a2a450c0019-cddca883901a-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 22:57:58 +0200
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66KJTXM23106528
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 20:57:56 GMT
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgs531kx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 20:57:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c1eb52e1fso93420001cf.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 13:57:55 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49548e075d4sm221781295e9.1.2026.07.20.13.57.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 13:57:53 -0700 (PDT)
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
	q5m5YhLzsuHt+goJykgjATSDXmmGEZj6f/t2DG1fv54=; b=gypfM1C+hunrJKHP
	PjUplKokm19F9kwMHfHjJXb83UIG+z/+cXd0m7YHJBxAq59vkEL68OqFB/fwlPw8
	EjjzoRbSI253roi6ECXdNTBWjE0TdXujyVQlNmF9W2bjuzCkpUGPr8/n2ozUUBGG
	jWLnAA/2HqXOi92LTnGypSyHcb0bDgVjyNoZUSnvD/zzaHJA9geKQtDOMgXQrJCy
	qF9MEauOAmdkFQnsHOtNvZH6OU6+f/GN3wBQX63y4BFLSK2RTMAktpeE659hhxqN
	WLNt4QXyrJKDfU674Xj8cePSrBV1NyPWHk02iGk5+8Y0GwQxG2VwwvnXLJsJU+8I
	CP79Xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784581075; x=1785185875; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q5m5YhLzsuHt+goJykgjATSDXmmGEZj6f/t2DG1fv54=;
        b=MD2jXP3CLQShtFM7S0kfRXqoxmAzKEt3E9SD3/4JOoO4uV8thU/zkZh/dPXxWLOfej
         DiaZHzh1igXebjUGhAW2niMnaFo0HB9aKmlEoP8k4Uj4/97uJJZ1Irkol7+kz6o5ZpXk
         27xuU3IA23651nHK22jTS0H0FO5GfvIuMepcRKzTpthv+BdQzovr2s8od2rhY+n/Vn6j
         a6oFAg6HNittT8Qty1C9v8rCYyUtVmCNefEBiFp4LBRtV7zF/5TWTl/dsJ2MgiXN48P0
         7YOAG8PGjHmLaQU6IdKdPNfJQbhGnmT4AXjG/yi9LuHWumrafichCfduHil0AvMjyD5s
         b6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784581075; x=1785185875;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q5m5YhLzsuHt+goJykgjATSDXmmGEZj6f/t2DG1fv54=;
        b=qlyAXByKtH+ypYgGPYaG6Y8Q3BwrbWAnNgFGDBUjiWJP+WRKimsoYVFyoHTt89Wb2R
         NBGPYrYGJv57zkA2bLOMIXFJ2ExO6/0eVlHUPYf6diw63uW9DlK5EheGBd4nvYuqTZMm
         BOnR1+dj6XYFGiPxQ8RPi1oi9bFe/nbMWTJ+MTp3xhWs0Dnf07l/xoXXdnvwQt6WBkSv
         87Y9RfsSSGVfUNm4sd+13B569hGsV1oVJi43xQyH/sbRnhE+2SrvJiF5eXi5uhO1ylUv
         6RfplKYko/JH58Fmr3DQx/zlld9PC3yS3ZIqpNjXXnU9sBd9HbEyvBLg+KWjKdCn8Cpx
         jcOg==
X-Forwarded-Encrypted: i=1; AHgh+Rrp9riUf7kvgz9uoIq49Tt3Kiw2Rn9trSYi0Imn3wNpt95alekeO8tJosSWEoGcEaoHAbUIqxdpQ7Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyUyUIdW27+Dz/SJzYqk+kYvh2U1dd1qoWFHqTsoTeQltVRLBjV
	gU69/mVo3KB84qUmeNBeAUayXHfnmu8H1btNqrxAZHKEwn+cm4qLfX/OadyntZmh2YIGg1qRx8u
	VAiPxPLe77KcA90GIN8Tul/dXeJoTxBxvDu3lE+NGWQ9loCCS0JEyF102stAQKHQjjEraeA==
X-Gm-Gg: AfdE7ck9BoIXRDb4mOOcWgJ/ztwlWKlzWw+7hZCMTPgkCrLTMSVRn8NxucVSf7l3g8Z
	UL0OZX7Gk/3SMRJPvbOLLS8cOY66LBLVaGYLQXJy5JmrLV5/8nLgeftCsijKZZGW0wlDzQSM5W9
	XiPkh5mt649W/tVDqsTCZfVGyGGEF5y6qQeVTkk8mld2XhUdnfgzEU3/iGN5Y+xEIohEZaQ6xUh
	FqAgV5riQwNcxd066WR4JXNAI20zyEarFlRwb+0hwILA/i95dHZzitDC+sFxBHWDiJgvoVOL3vl
	Vn6m6e0hZpu+NO03PXzbaEFV12VOdNQiOV+0Ooo8oH6fl7JfPsod2ie1pOiGHPZBEPivk5iS33Y
	BEpdtL5kxYvVEC9IdMlAFwM1o6rPxclOsapVbBTLAKKk8L8S9okI=
X-Received: by 2002:ac8:7d4f:0:b0:51c:185b:29e0 with SMTP id d75a77b69052e-5213a3824d6mr151131211cf.10.1784581075119;
        Mon, 20 Jul 2026 13:57:55 -0700 (PDT)
X-Received: by 2002:ac8:7d4f:0:b0:51c:185b:29e0 with SMTP id d75a77b69052e-5213a3824d6mr151130961cf.10.1784581074544;
        Mon, 20 Jul 2026 13:57:54 -0700 (PDT)
Message-ID: <797f3cd6-5ca2-4cba-8aa0-43fa883f274c@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 22:57:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] qcow2: remove invalid qcow2_check_refcounts calls
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
 <20260720-co-v1-5-fabb4db3c204@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260720-co-v1-5-fabb4db3c204@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDIyOSBTYWx0ZWRfX5LrmAv1hw6Km
 o2dznOFgpm4nAKG5ashC5PKBjjeklsSJzFvbSjy/kFHRwe3fn+AurNb7ugBrbVHEceu0bspoGEt
 WYxNgzCainfyKMdfAIQMdgbXBa0zBw0=
X-Proofpoint-GUID: GVZBM1WGNFBl2wyKtmcIinlf2LF_czIz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDIyOSBTYWx0ZWRfX007B5VLoy1wS
 +Ha2perKgzO03AJzVzU+Y/3JAOZzCndOjcMiXmzB96Pc+ckVEMSqiPbWcRYz9fDTv2eZPHB/m/r
 uWK/j5tupGrNjxFdcL2YiRDPMhLDBdC0PyT+9wvwX1rtKeRCbJXnPfurHwNgQ51FpoHCq3VotlS
 QNzQZbvyYHHZt82/W4Eo7JEPUQ72aVzL1VRL6FaRJ4EearlwOAptizn8KgU/GT4f9KlrDPX8pTG
 1xPZVMth8dhj+B0CB4PqG9OhBGOYlZ+1VKiecVpfgrl2t19f0ZnhPHhpg3lJvASKhbJZQYlr/o/
 ATvppM2g4vkxJKW3exFxz+eNswe3BeqQfvowme/PK6GrchekTewLm6fYiJfb3m+0nnptGPw19Tz
 3+CN4kNmi9J0QfxYL4wLDwAoikYTiobaY5CM2oYaFqycAS6Ov6c9BmiLfJ4RVjxx1PIRAauVqLm
 CPRhtB79J7Wye6hJVCg==
X-Authority-Analysis: v=2.4 cv=CpiPtH4D c=1 sm=1 tr=0 ts=6a5e8bd4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=bejFeoJku8wluUMwU-oA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: GVZBM1WGNFBl2wyKtmcIinlf2LF_czIz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_05,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200229
X-purgate-ID: tlsNG-d25034/1784581078-51737A5B-2EEA796E/0/0
X-purgate-type: clean
X-purgate-size: 1719

On 20/7/26 09:55, Marc-AndrÃ© Lureau wrote:
> Those DEBUG_ALLOC-guarded are dead code incorrectly calling coroutine fn
> from non-coroutine. Remove it.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   block/qcow2-snapshot.c | 18 ------------------
>   1 file changed, 18 deletions(-)
> 
> diff --git a/block/qcow2-snapshot.c b/block/qcow2-snapshot.c
> index 1e8dc48be1c..8453ad73d10 100644
> --- a/block/qcow2-snapshot.c
> +++ b/block/qcow2-snapshot.c
> @@ -740,12 +740,6 @@ int qcow2_snapshot_create(BlockDriverState *bs, QEMUSnapshotInfo *sn_info)
>                             ROUND_UP(sn->vm_state_size, s->cluster_size),
>                             QCOW2_DISCARD_NEVER, false);
>   
> -#ifdef DEBUG_ALLOC
> -    {
> -      BdrvCheckResult result = {0};
> -      qcow2_check_refcounts(bs, &result, 0);
> -    }
> -#endif
>       return 0;
>   

Fixes: 70bacc44532 ("qcow2: mark more functions as coroutine_fns and 
GRAPH_RDLOCK")
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

While here we could remove DEBUG_ALLOC:

-- >8 --
diff --git a/block/qcow2.h b/block/qcow2.h
index ce517040c47..5e1f916d58f 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -33,3 +33,2 @@

-//#define DEBUG_ALLOC
  //#define DEBUG_ALLOC2
diff --git a/block/qcow2.c b/block/qcow2.c
index 19271b10a49..6965b80af03 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1965,9 +1965,2 @@ qcow2_do_open(BlockDriverState *bs, QDict 
*options, int flags,

-#ifdef DEBUG_ALLOC
-    {
-        BdrvCheckResult result = {0};
-        qcow2_check_refcounts(bs, &result, 0);
-    }
-#endif
-
      qemu_co_queue_init(&s->thread_task_queue);
---

