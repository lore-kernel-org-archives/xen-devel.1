Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF05C44515
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 20:59:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367411.1617194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlv4d-0006db-Nn; Mon, 20 Jul 2026 20:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367411.1617194; Mon, 20 Jul 2026 20:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlv4d-0006dU-K2; Mon, 20 Jul 2026 20:58:51 +0000
Received: by outflank-mailman (input) for mailman id 1367411;
 Mon, 20 Jul 2026 20:58:50 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <philmd@oss.qualcomm.com>) id 1wlv4b-0006dH-W4
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 20:58:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlv4b-008B4H-Cv
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 22:58:49 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a5e8c09-5cb7-0a2a0a5109dd-0a2a45048f10-0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 22:58:49 +0200
Received: from [205.220.168.131] (helo=mx0a-0031df01.pphosted.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a5e8c07-b57f-0a2a45040019-cddca8838ef4-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 22:58:49 +0200
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66KJTSu63283928
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 20:58:47 GMT
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhh5y2yad-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 20:58:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c26012cd0so187275871cf.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 13:58:46 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-495653bfed7sm17139495e9.11.2026.07.20.13.58.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 13:58:44 -0700 (PDT)
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
	yXvKzkuRVGbi0KnPF83YKFfobJ/BYgNqxZq8H29B9BI=; b=E607B0YNz5K5jpeZ
	jEqdtXqAigBiCaEfBMwN0vJy2sIthhYHYqbhBcNvRHQbO6gQm35Frz172RVPOKxC
	/Wv2IkO79fBNPjSBlQ+tGcjq24b6Fysr2Op8RdkcqJqJboSVqsYt18cE0S13dsCX
	tQRorCxnaDQMbPQ728W6s6Fax5Stxu7bZeU/LoD6VXPnJecj8Cqf6wtpPPB70aPD
	4vkmMvtGT4OxvOLMTd2lkW9NFL66VNnxERJvaabEgzD7tLGGhkNxfDkOpPYMO830
	seGJmiwchQNgxeaSSwpSb+3dFiN/IGKEvyKtitZdUeqZyogjO6QfveIdJq//wxmB
	wsto+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784581126; x=1785185926; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yXvKzkuRVGbi0KnPF83YKFfobJ/BYgNqxZq8H29B9BI=;
        b=Dj0byijnTdPT6YiRSOyLO0D2Q1Hh3M+233tMMDf7hV+sHxcUigF8B7UzQ6l9B1P2d7
         cyHBM9qE5AuyYbUzcnIOTFhBdqSTSk4sGRpl4mZaCGnwjGFfvzgT6TakE5ePPIokm/qI
         AOBCL/jirYqC3Ifgys6LauNl763lQ+S/AceG3MG6FcoP/70VXrcCX0g5BNShM2j5aQj6
         TBer/lxzSqF8wiYkObPXGSO2/NXDlZ+aVS3alzFBNaliTxNnI+qtf7YKLYzNhQdxr6Ur
         I6KHYn8CztFqNngFy3t0hIbeefdpP4XxMMf8EzqzAD2gnhVzEjDbhOCyJ0a4bnNLggpu
         9rbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784581126; x=1785185926;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yXvKzkuRVGbi0KnPF83YKFfobJ/BYgNqxZq8H29B9BI=;
        b=mYJU49XdSzPD2zIVB43HzYD1IZ1Y8zCC/4H3AGIj8aW+q0DrHLEC+n3c1a1i73Z9Y5
         nQWxHTIjpFJZYN6QfcDURv/f2eeEZDvzSEy1z8MqHmE9oasP4ex4M3pvpYYsjiF2lmuT
         B6T9szLKwllqceoXhOSJT7kaZBygj7Kaqg35LgJffTAvuaQqOhMrfCVzEyQSbc8wSruG
         kso2uva+zFrPj7v6XABQmnBi9uhIDl9FVNpKZ9mhzb+KruvtCAFQdmTFYACmAo+YdZrL
         MhLfa4Ncac9aoMGbChh+zvM6+b49hmSrIkuFjS8YJqAQFu3PZe54y+KU/2gN9wdiTIww
         +d0g==
X-Forwarded-Encrypted: i=1; AHgh+Roe03Yapmz/b6Hg+c3t4rLKRTgMxOlaxpOWOjUd1ByDNx5qLJmY1d8+J9grKocxqgbstrzvbjfu6bk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyOsAYLXNnQCTpZtpvVVM51Ib/jtqSgtttR3okO3uuMSfuF7nFY
	DKer1yDT3m9nWFaaSIvxz9t5c6PV67hVvIwJJgHbCjWi16f1aI7hzAziIBvR4rY7RMxbEn5+3Cp
	jX33UQOVl/Y8GWyNQEq6jPE4Hb8Pkw8PdQCpC9yfRYH4QIbhr/h7nd6gU/x9Fw+pjlCuAuA==
X-Gm-Gg: AfdE7clRP+K+GOnpmC93fAG0SIKvPzTqPR9HC6zGt/nKZJpqNTEd+j2yaLjg+QgfMjA
	Q5DqIVX/QmoTZwecQMn9ORVbzo+RUw/g6hM+9QGay3XhGi1fYCrctWO/Qhwu5j5OYqAKm6ZnR4d
	8sPlIZ68bqC2N34yy0o5xLkFlPLknopXvyYcQeoQQ2SdAth8AktCEXnZyJWdulod2Sorwi0zX/S
	YoEMNRhxtQdz3qJelALdXjvOD/Gf5HJPX0/F2YUSiKK/Lo56rY90us41rgOt/CXZC5nvPM2Jk+w
	YyezTVd+c9aVEm3Va8mt2nPlLe/Jf5pT1vucgHuQ9admAPDs3ACOSDWB7ErVLbz1256YJTA0v8x
	ZSkngWmgE2t9jyDVTJDVlqyLfhJ/pjBIsBBQj7sKCoEhBnIKq6q4=
X-Received: by 2002:a05:622a:5cd:b0:51c:a8:51cd with SMTP id d75a77b69052e-5213bb21707mr147059781cf.1.1784581125517;
        Mon, 20 Jul 2026 13:58:45 -0700 (PDT)
X-Received: by 2002:a05:622a:5cd:b0:51c:a8:51cd with SMTP id d75a77b69052e-5213bb21707mr147059411cf.1.1784581125140;
        Mon, 20 Jul 2026 13:58:45 -0700 (PDT)
Message-ID: <985035ee-2577-4b99-8eaa-948a56ad62e0@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 22:58:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] block: add missing coroutine_fn annotations
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
 <20260720-co-v1-6-fabb4db3c204@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260720-co-v1-6-fabb4db3c204@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDIyOSBTYWx0ZWRfX5G7yxmoCABfS
 p0uOcnS31Z1w2reCq/S1hSaEyWpLhDYS8akEzfiTUZ36qAOYLCSCgxfdFJXPd+JKIkGB/PzAEj1
 gx0nqq7BWzW5jKgbSsLVwe64RJSV2dI=
X-Proofpoint-GUID: PlyockgLh3T1VLa0yD-qVzdeZZB0xUPp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDIyOSBTYWx0ZWRfX4ngMRQRxbe67
 MOSVBOLkSYkrbFFockB7W4OosuPRYYSo3BE4yeBP4tBHxJYY/VONKtRx2t986+zGrOCYp8dHoiV
 Fllq+kZPAdunEu8IRn6HV3WVlq9jNQuXLa0xSM3OlGzZ451bcY9hKUryFfF95xBi2Pdu5itEtpj
 T4pMRNmE9j+RgW5qOCXrtUeSnfCAebgaNhEw3iHJiUVsDaP9rzc30f7+bxxnuwLu+mUCctiQuSg
 theYtWHayBKk4ObfMm+1liTYSjbh6jjaLMGii9UJ0wEiBxVKMUOJgNa3q0fFZnWXHODZ4LbmEuk
 +ZOELMuBy7KIhilm8W6hCj5R0ppOYJFksd+Q/rzd4Ha/Ld0SgvwmiwSwg/cBdsfIUExmrnP34lr
 G3fb2esrr+vGLCcWJ9rGrSyhsd1QiesQR/MmM7tvsp9hFVcIzn7u+8fJoB+Sb2sdfSzeqhnpW7Q
 jgEPFciVPhnulKIXIyw==
X-Proofpoint-ORIG-GUID: PlyockgLh3T1VLa0yD-qVzdeZZB0xUPp
X-Authority-Analysis: v=2.4 cv=f/x4wuyM c=1 sm=1 tr=0 ts=6a5e8c06 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=20KFwNOVAAAA:8 a=1BCzUFiEGB2mR181h8AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_05,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200229
X-purgate-ID: tlsNG-ebf023/1784581129-C1AD0B50-7BCAEC9D/0/0
X-purgate-type: clean
X-purgate-size: 723

On 20/7/26 09:55, Marc-AndrÃ© Lureau wrote:
> The functions call coroutine functions or are called by coroutine.
> 
> Add an assert() in qcow2_do_close() code path which calls a
> no_coroutine_fn bdrv_graph_wrlock_drained().
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   include/block/blockjob_int.h |  2 +-
>   block/crypto.c               | 13 +++++++------
>   block/io.c                   |  8 +++++---
>   block/parallels.c            |  5 +++--
>   block/qcow2.c                | 11 +++++++----
>   blockjob.c                   |  3 ++-
>   6 files changed, 25 insertions(+), 17 deletions(-)

Too many distinct code paths in a single patch to my
taste, I'll skip.

