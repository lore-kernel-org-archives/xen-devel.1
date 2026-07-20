Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED071C4452A
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 14:29:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366662.1616613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlozN-0001M9-BI; Mon, 20 Jul 2026 14:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366662.1616613; Mon, 20 Jul 2026 14:29:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlozN-0001M2-5n; Mon, 20 Jul 2026 14:29:01 +0000
Received: by outflank-mailman (input) for mailman id 1366662;
 Mon, 20 Jul 2026 14:29:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <philmd@oss.qualcomm.com>) id 1wlozM-0001Lo-4Y
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 14:29:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlozL-00C34H-HW
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:28:59 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a5e30a1-5cb7-0a2a0a5109dd-0a2a45019646-12
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 16:28:59 +0200
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a5e30a9-5984-0a2a45010019-cddcb4838fd0-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 16:28:59 +0200
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66KDqhwi2604546
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 14:28:57 GMT
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhggg9jy4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 14:28:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-930a098ea19so609556285a.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 07:28:57 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63edcd13sm29900527f8f.26.2026.07.20.07.28.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 07:28:55 -0700 (PDT)
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
	3v8X7K1Jdd2Up35z5ZRbHLpJSqQnb68dV+D2c89O4UE=; b=oLRzAaOX3A/eug7u
	mZ7WaOUOeXP0/LysfkLyx3/cgRARoLOxy8JMNj4vHPWa3pKQffeooqO0XcbmityX
	zFAGcvFTlMuqQam60omMxpmKxETtAY4P5YXM6FfGre42DF3TDq6h4Q3OI70YEotL
	Q3vF1kp6e6+50IsCojT4d1tvBP8iWEJYmsUItliNlMlbX5p/7r9f0CxSJAwqO6eZ
	RN6Z9Hy09TLUIQr+SFF0rHA8CHZJmvIqk+WQzUn+iGV6NO9ee0R6lZhr5aisc1bO
	p09gYPy9+gQDnzbgbY3wyXm4sziXjtgYGMZl2QNBZ25PIRURwi/ljIiCJ8sZM5gM
	gbxLKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784557737; x=1785162537; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3v8X7K1Jdd2Up35z5ZRbHLpJSqQnb68dV+D2c89O4UE=;
        b=YzfJaE6sbz76jm/OwgLwyRoNuN4pXvcKqIWFGhYota1I3UB487Ikk7R5ko3cNYKHkm
         qRS9e1S1Fx9kp6MTcDtkNSYi5V8KZ3nsosI6Y4vY5gwmPMUJuWLi8CYfFfPXXVq9tWGr
         dthzsCdg8obbgy/FV/TvcrdjnhG0LuAN5s3pNE5tIc6UKmgXXoE46TXxEnuL2EQrpOc5
         8lpO6h8LiwaaR8qzXoi08J1to0kAc+jFl4e2v9D4s6Gi/J+BKtVQbQFw+kx45lidN+0I
         kINKD7FToLghfQWLhd4NS/Lcc6MNEeLlXfZZNQ92HF+whsHBUb+dvKHHnmEEtXMHmi++
         LMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784557737; x=1785162537;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3v8X7K1Jdd2Up35z5ZRbHLpJSqQnb68dV+D2c89O4UE=;
        b=QVR+lNa1y/XHQNQqRo+TJrabfpPHmi2xsQ4Fe+057x2kvZs+Doc0rhKE+o+87ELiQr
         GtdbB+5GsWlKz5UlNAgNwjc3bAu8ab573MdODB9YH+lz4Eg/fs5trbO25qmoZ0VXkAKm
         ThroEiMQehofbwir1Ur9Gees2M9+AtpYeBJS6x00yAagwGU9cavL+IQOmjd4/iBbp7jc
         W2qYsbdsx09LgzAk03YZpTE6RpiKXsOa4T+l2uuFAblh7nIZVsTmU/LGLxrHYRCT25J4
         yZyJjobpS1j4Jr2X4KTMX+ZmHlp4Os3OjAIs3x5yG+rdldPn2LErk5jLlmRoWngkEYr0
         2qhQ==
X-Forwarded-Encrypted: i=1; AHgh+RqohLqhS8gJ6NzfV1dQXF/tdI7+w5r4FWdmGzr8MOiJXtQdXjkQYm4oh/iE/ymb5jfyg7xr+WhdMlk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzGieO9Vf5VaXUwqBroi32oI4Rbu4ZJdXGenw9NJ6k3cmnP2Zse
	gWKjloAkfjVRdsqZd/RU6H9JpXu7ah65fYYF6Tttc06y7HaCBhkSe8bWLVNhTa0cvKxbgQJ3Owp
	jkQjwP+xhGYFTIGG18lF57f65Z+8vVT2UqeZBg4j3+oBWZTEZK7cQOFACNOdNIKhUBk8ryw==
X-Gm-Gg: AfdE7ckMIkXJqwYkAtic6M9OJAtjkDzf/DGpbAcHJpgVzYLp3osXW44HmXk8JSs5yku
	DdTZ2GjdKUK89jp+Ns6EDHbf/ngt8nb5E169ZsYLsdQFuu/q47/OI1WUdarufCsi30hVhHmDZHb
	UfGcru+Rdy3DVHnRO2LY3C71wc7+Ngn1IJ5PS2q2vBrSO065hlEyizp83ZTZ9XhQAE5/NIQMOuf
	tzp0yqzgNf1V2VeBc+EhNpEn4snPXlH0FFdtQHnkYxDoi9mNkIRKgyh8ZhzCw5i4UM1t4bBRJx/
	pWEbVTEjWfzuQGNxbwfs4jBVqFS7mvpVq4A9GOCgpvx6+/lqarwlis2FE8K4CwYizirf64yYhlw
	5hDkVtUaN2kmq8AozREg00w3h8urvX4m7ywXqnKQrM+T6k+PMHeo=
X-Received: by 2002:ac8:5dc7:0:b0:517:8f2e:5d97 with SMTP id d75a77b69052e-5213c7e6cafmr131842411cf.22.1784557736410;
        Mon, 20 Jul 2026 07:28:56 -0700 (PDT)
X-Received: by 2002:ac8:5dc7:0:b0:517:8f2e:5d97 with SMTP id d75a77b69052e-5213c7e6cafmr131841891cf.22.1784557735937;
        Mon, 20 Jul 2026 07:28:55 -0700 (PDT)
Message-ID: <4cb0beed-b719-4fa8-a83e-09ede61ac665@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:28:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] block: add missing coroutine annotation
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
 <20260720-co-v1-4-fabb4db3c204@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260720-co-v1-4-fabb4db3c204@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Egj4II8w3yOK8GXBEga1uFQSHdjcfQwu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE2MSBTYWx0ZWRfXzMs5rRvVoFmV
 Emmyp0Bs6FHgwpP7hLDszSXdCJkOJhi+Kr92mqWliHGUYGJ/z9W/oq/M7Mdv0axUxgIdOqENTgd
 No4TTIrDdnhLR1gWI//69QHrZxfijx9j2NfCq0tDZo7dZllHUp2PL5K/J85M4Eyez6rC07lwOtU
 8U04K2/DGT+EKJWld9G5VZ2ImCouxWFsUy2vT/qGrKlyCcC6PpCuW8Ikq5aAIiByNJMLacOJqtP
 xYZd4zoH1dBujzqsqVlVU7RnB13GItaY5c61ALczmyeniT1EGyHpuJ1a7BY8Ny9PUpX23sO4hRL
 NCLxBx/u8zgh84sDiIh79jIvzxVnNcOaRqC+HWNxgy6VUEJH9k61MxwJlVsgFG1YEMmGp0tFud8
 OgIUoXw30W0NrQj0SLBKfZfR1VSOb5gJkvwL1XSrab1mUDNQqVZOGOrqrNxX8TLYizgQmlOgm4M
 jfWgv6JhFqcEAwxKOTw==
X-Authority-Analysis: v=2.4 cv=RPmD2Yi+ c=1 sm=1 tr=0 ts=6a5e30a9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Egj4II8w3yOK8GXBEga1uFQSHdjcfQwu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE2MSBTYWx0ZWRfXwDHC97AVCdbg
 WIEpLcwYaaMqDTyxJG9yXPYHQHJGpt+oMZ6Fh9qGi//4UAkLHZihdD/7hk3FCcgMDilJxmgT94o
 1nlGW0q+lkzJiFfQAc4+l3CkUzLJUx0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200161
X-purgate-ID: tlsNG-d62444/1784557739-1DE78757-4A8F276E/0/0
X-purgate-type: clean
X-purgate-size: 413

On 20/7/26 09:55, Marc-AndrÃ© Lureau wrote:
> The function was extracted without carrying the annotation.
> 
> Fixes: 23743ab282af ("block: move commit_run loop to separate function")
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   block/commit.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

