Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6775DC44529
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 20:43:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367385.1617167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlupF-0003eW-VQ; Mon, 20 Jul 2026 20:42:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367385.1617167; Mon, 20 Jul 2026 20:42:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlupF-0003eP-Rv; Mon, 20 Jul 2026 20:42:57 +0000
Received: by outflank-mailman (input) for mailman id 1367385;
 Mon, 20 Jul 2026 20:42:57 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <philmd@oss.qualcomm.com>) id 1wlupF-0003eJ-88
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 20:42:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlupE-0089Rx-5p
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 22:42:56 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a5e884e-2eae-0a2a0a5409dd-0a2a4507aea6-2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 22:42:56 +0200
Received: from [205.220.168.131] (helo=mx0a-0031df01.pphosted.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a5e884e-b4ea-0a2a45070019-cddca8833bfa-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 22:42:55 +0200
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66KJU21R3369163
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 20:42:53 GMT
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgs02yad-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 20:42:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c0ab07320so149420321cf.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 13:42:53 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4955de8895dsm100865115e9.4.2026.07.20.13.42.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 13:42:50 -0700 (PDT)
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
	evPbccQePK9+xKuCm0xjXOtQA/aq6aTomkUzqkmA3sI=; b=SLa7x4EDAUB2qvWE
	DjgorCNFfsNHAB5w0MAZH/NMyfsLES5n4vEiJSBybOp0ROx4hTOadd2CwnGyWR9m
	FtuQgTTLjcogVixa7fbJc2A9sRcVNUC0PhD0Wka/k/aeC5tlxo4wJESwohAJNcVF
	Ffd6+DU50IF0gWuVpt1CNgwhGMtsT0PhATMo3gevv6g8Czv+5hixtuPvB/heM+7i
	6r+8Dv+5G7pF6OsLGPV7aVhksBX5AXXGXmR+Fyz0JGbN404hFgKPapSvXgkrimVx
	0EA6WfxOz0FrrfH8eYsAO0gH+8vTcfe/C4eqzH+u5tcXCO4Se8NOIFXnKsMGdxho
	pOQFkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784580172; x=1785184972; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=evPbccQePK9+xKuCm0xjXOtQA/aq6aTomkUzqkmA3sI=;
        b=D0uq+y0DhX0OoX9VIT4KIO4qyQNDiNEKooHJoRDR1bk73SAEE51hRQvfu+pngN0RnE
         6eMa150ZUSnN624D7P4B0FHOEXehsJRONw7lpcCJnvESp6JQlppdWT3qh/njvXpApJ6W
         nTTfld9PJ+PfgWzfIj6i4GIpm7O/M9G4q83c+XeJvWg0QZr8QTrilB2vOf/YSQhc3RCo
         HRxDxhchHH89njQc4zPzIsnDKeoOqUX0tAE5L5fdZvM7bwzEd4Eva3QzCCeNt48CnJZX
         2dj5Gr8yACuDGCzGSthsCqFG19RWlWIcbaIP6Bf8Brcwf0Ge8xPpq0EVx12WJ2jDBhtl
         z1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784580172; x=1785184972;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=evPbccQePK9+xKuCm0xjXOtQA/aq6aTomkUzqkmA3sI=;
        b=MWmqcAjpIW2M0SiEEw6gB+6xoI5ice8TaCdPbAGKsMf4cHFBjZ1Uu7LNH+fTnUXaHN
         8+V9sS7M8iriQIGAWRutCGASGlxSMq8fggq7PldsTxJXp6/HcVLuTMiBfeSzr0HMjecM
         emWMaUROU6ksqCx7PqUuA6d/xY9w+0Wa/EP2ZJEr6eIGpk7NmHIUMxUIuAGfZyj+Feag
         Y0KDS5pjQKLB8pboj7ffKKMDrrYYlBpb4s9jJfPJEvHVBR70TjI7Q0J+06i36WvnvTAM
         DmSa/Uy6Cy1+h1GZgXmhAypiXl8xso9hI2/GZTs+W4HQpYHFCaxXlhaEpKtXKspAJxHV
         Fgtw==
X-Forwarded-Encrypted: i=1; AHgh+RpxmXh8r0p/JFhyogb/yqbecsrsUFcSye+xNDVlW+UeFN1LHZ4R+of5UejCoEPJ41oBvutdxnYJyOw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxsDEaN+wUcUsuekUJJctqnhcQzHli1dzpIUQbZC2GlgCygifWn
	4lCQXFMUdQpyAdeMG3LCsMdC82sQJZfpbZna+WRFV4mKp07YcFSQKKp60Xp5tn1aY+W4sC3sKn3
	UDz9eRJW/S1dJx0CotMLn9wfWFKpHmjKb4Vr12c91UgIWsjOaU8FFB23crNrTM60lDq4tMA==
X-Gm-Gg: AfdE7clx+AIdQT0VOHnDtCSv9FzA7v/kDel9RjKsu89LOo3zKDPT8vemzFP/b9B+IZq
	p8Vk3ZNtwMRjXy6+8QkzYIgfgPtlU7f4IEhUzbhUsE9wt+5ngDPQexCgKHoSwRhYGzTcHJ2FAO4
	zRpauviTkz/IV/kvIdfkypGoEr8x+VTft5n9E5DNdwQzn17ADciY3d4CF9IBNbRudOnD50yyiRX
	cQ4Qmve7jvO8KbNVd2cAoqjIuwOez3RRKRIZceJX4LiZAf0qEuX0n7k6gmYAAY8xNRd/vWd2B3L
	2P7uhgkxth9CYFmSRZX/ftXsnoZ5HHZdquoxNRzW15ZBbwMGoBjIfczqy76c4S6TWClAPHNzJVk
	0zBsAcYAKfeVNR/j1UWXTcl+xKbNcQopNFl4agz71h2SulhNzNiE=
X-Received: by 2002:a05:622a:5e88:b0:51c:b98a:244a with SMTP id d75a77b69052e-5213d0c6e6emr149550631cf.62.1784580172394;
        Mon, 20 Jul 2026 13:42:52 -0700 (PDT)
X-Received: by 2002:a05:622a:5e88:b0:51c:b98a:244a with SMTP id d75a77b69052e-5213d0c6e6emr149550271cf.62.1784580171948;
        Mon, 20 Jul 2026 13:42:51 -0700 (PDT)
Message-ID: <7790107e-1256-4ed8-ba49-cab980197938@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 22:42:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] hw/9pfs: annotate V9fsTransport callbacks as
 coroutine_fn
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
        =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
        Fabiano Rosas <farosas@suse.de>,
        =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
        John Snow <jsnow@redhat.com>,
        Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
        Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
        qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
        Fam Zheng <fam@euphon.net>, "Denis V. Lunev" <den@openvz.org>,
        Greg Kurz <groug@kaod.org>, "Michael S. Tsirkin" <mst@redhat.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony PERARD <anthony@xenproject.org>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        xen-devel@lists.xenproject.org, Li Zhijian <lizhijian@fujitsu.com>
References: <20260720-co-v1-0-fabb4db3c204@redhat.com>
 <20260720-co-v1-7-fabb4db3c204@redhat.com> <7970030.EvYhyI6sBW@weasel>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <7970030.EvYhyI6sBW@weasel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDIyNiBTYWx0ZWRfX3yguUldX1aHs
 HmPUvbb6JYq7FaKs8iOluQ0GEhNKK6y8z5HnYJ2/8axsWA5opRYsfQrxgSqoAiMRJU5GxlhUkg6
 +81jmsNPkfNIcBXYWUmxo8EjA2bEuZE=
X-Proofpoint-ORIG-GUID: sAW4TZIwtvq3Qfg2q-zjHxqG3U-w6wDN
X-Authority-Analysis: v=2.4 cv=DMS/JSNb c=1 sm=1 tr=0 ts=6a5e884d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=20KFwNOVAAAA:8 a=U4s93ykpB3yW7ajRV6YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: sAW4TZIwtvq3Qfg2q-zjHxqG3U-w6wDN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDIyNiBTYWx0ZWRfXx+AbRS/+CF8R
 udketZKN3kA4c9MbbANs7kcAYCcs1I5YYE7kc8ICzPqXxHqZdvBsNeJtoIvo05x9RWu6enW0xh/
 w3/T3Er85kuZIK8M5q3DuwCOWmPHyubPgVrJNkoXr95YoW2qEmgwOB0zGpFHlyNkbFnOI2tvHYs
 IuftAgq/QNoQsgsR9sIArZ2CPHwSSlFgcOYwcfWYGI9FwNjd47Po1qgsabHTwJDB3ksv/QwQphp
 LtcFvb8coxJBdZnUPuYIcL5oCIM+ugsGEQkqR6UU7nAH9CwMk1pL+toc3PSg0uOo25QQJKxrQDf
 UNJAvXB+gl2UHnAO828SsOP9hyJBECmUDFXMOL7k0J5f56l9M2JFJJe6HdMuPSGg7vTJu5z1+FZ
 v7DCDzcZh7ip2Iofj+cGMk5DQKuOQeepEm/VPho/qaG+Xn1JgDbgseAPSjNjp4du1PC36gApC8w
 2kVemy3endfnVc/2zeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_05,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200226
X-purgate-ID: tlsNG-ef75cf/1784580176-A74D3AE4-3B77BB32/0/0
X-purgate-type: clean
X-purgate-size: 3784

On 20/7/26 16:02, Christian Schoenebeck wrote:
> On Monday, 20 July 2026 09:55:36 CEST Marc-André Lureau wrote:
>> All V9fsTransport callbacks are invoked exclusively from coroutine
>> context (the v9fs_* PDU handlers). Annotate the function pointer
>> types in V9fsTransport and all implementations (virtio and xen
>> backends), as well as intermediate callers in 9p.c (pdu_marshal,
>> pdu_unmarshal, v9fs_init_qiov_from_pdu, etc.).
>>
>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> ---
>>   hw/9pfs/9p.h               | 26 +++++++++++++++-----------
>>   hw/9pfs/9p.c               | 31 +++++++++++++++++++------------
>>   hw/9pfs/virtio-9p-device.c | 24 +++++++++++++-----------
>>   hw/9pfs/xen-9p-backend.c   | 34 +++++++++++++++++-----------------
>>   4 files changed, 64 insertions(+), 51 deletions(-)
>>
>> diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
>> index 1a309664f6e..0e52ffbdf38 100644
>> --- a/hw/9pfs/9p.h
>> +++ b/hw/9pfs/9p.h
>> @@ -472,17 +472,21 @@ void pdu_submit(V9fsPDU *pdu, P9MsgHeader *hdr);
>>   void v9fs_reset(V9fsState *s);
>>
>>
>>   struct V9fsTransport {
>> -    ssize_t     (*pdu_vmarshal)(V9fsPDU *pdu, size_t offset, const char *fmt,
>> -                                va_list ap);
>> -    ssize_t     (*pdu_vunmarshal)(V9fsPDU *pdu, size_t offset, const char *fmt,
>> -                                  va_list ap);
>> -    void        (*init_in_iov_from_pdu)(V9fsPDU *pdu, struct iovec **piov,
>> -                                        unsigned int *pniov, size_t size);
>> -    void        (*init_out_iov_from_pdu)(V9fsPDU *pdu, struct iovec **piov,
>> -                                         unsigned int *pniov, size_t size);
>> -    void        (*push_and_notify)(V9fsPDU *pdu);
>> -    size_t      (*msize_limit)(V9fsState *s);
>> -    size_t      (*response_buffer_size)(V9fsPDU *pdu);
>> +    ssize_t     coroutine_fn (*pdu_vmarshal)(V9fsPDU *pdu, size_t offset,
>> +                                             const char *fmt, va_list ap);
>> +    ssize_t     coroutine_fn (*pdu_vunmarshal)(V9fsPDU *pdu, size_t offset,
>> +                                               const char *fmt, va_list ap);
>> +    void        coroutine_fn (*init_in_iov_from_pdu)(V9fsPDU *pdu,
>> +                                                     struct iovec **piov,
>> +                                                     unsigned int *pniov,
>> +                                                     size_t size);
>> +    void        coroutine_fn (*init_out_iov_from_pdu)(V9fsPDU *pdu,
>> +                                                      struct iovec **piov,
>> +                                                      unsigned int *pniov,
>> +                                                      size_t size);
>> +    void        coroutine_fn (*push_and_notify)(V9fsPDU *pdu);
>> +    size_t      coroutine_fn (*msize_limit)(V9fsState *s);
>> +    size_t      coroutine_fn (*response_buffer_size)(V9fsPDU *pdu);
>>   };
> 
> I wonder whether that could be made more diff/blame-friendly. Especially as
> this currently only serves documentation purposes.
> 
> They way you are positioning coroutine_fn it usually resolves to an attribute
> attached to the function's return type, not to the function itself, even
> though clang/gcc handling it flexible. For attaching an attribute to the
> function itself the attribute should either be attached before the function
> declaration or after the function declaration.

I tend to aggree it would be clearer to have these attributes /before/
the function prototype declaration.

> In both cases you could then
> add it to its own, separate line, avoiding a lot of noise.
> 
> /Christian
> 
> 
> 
> 


