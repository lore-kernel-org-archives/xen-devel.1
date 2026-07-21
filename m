Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C6DC44529
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2026 08:25:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367604.1617329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm5nK-0002r1-SW; Tue, 21 Jul 2026 08:25:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367604.1617329; Tue, 21 Jul 2026 08:25:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm5nK-0002qu-PA; Tue, 21 Jul 2026 08:25:42 +0000
Received: by outflank-mailman (input) for mailman id 1367604;
 Tue, 21 Jul 2026 08:25:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <philmd@oss.qualcomm.com>) id 1wm5nJ-0002pj-FN
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 08:25:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wm5nI-008uuZ-H4
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 10:25:40 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a5f2ce7-bab6-0a2a0a5309dd-0a2a4506d346-46
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 10:25:40 +0200
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a5f2d03-195a-0a2a45060019-cddcb48325ca-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 10:25:40 +0200
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66L6bwS23978338
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 08:25:38 GMT
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv438vk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 08:25:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c1a97644aso4334821cf.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 01:25:38 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956547323bsm52072685e9.4.2026.07.21.01.25.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2026 01:25:36 -0700 (PDT)
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
	ZF1H2C3sWBUxUFeIPjxdM+X09KSU/DDuULUiVulHlSI=; b=GNBaIcbLoQV99QXL
	OhrtQ0Pj22BxtEAMk95gFHQeZ8f/ZXiZbZibdU03AJq/2+Cl00kUde9Hm61AKgvY
	5pgZ7q5CUVkhigqqQGr/rDaaZguJqiLwm/+wF0xZcqyoqI4ytErNBr68P3Q7JjYf
	THUpq4s6wLjto8PkbfaH8B0KGyfiHOP8kIOL/6edMe+9nwbZa5XB0JIDRJ/Nf927
	EbN6oW/4CbcqqEIqNGT091PB4ZzJoNeZhWAOd4CQungifm5Ecf1iKMk3DRhw28zS
	qc8CKk/ZIF0N7eL/JX9qD6D2ufe95eRN9l+A9xACL9NSgelE2MGYEbM8ZNS6sxcb
	oSh9Ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784622338; x=1785227138; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZF1H2C3sWBUxUFeIPjxdM+X09KSU/DDuULUiVulHlSI=;
        b=iSbUD6NRiyChdy6rjFG7oDlFDxfi0PGtriSWLrVIs/R3qP7EpX+MOq1pEoINcstaOD
         qUc6SSkDSiqJ5XqKK94jbUFp4M+5TdtI1nCWmoJFbK7+NBkyqI9T4MdY0LPTUeBQl+BZ
         mDlB/YboWVePpxXiDEifOqu0QrfUJb8F4XlyBKwTWw4shsTNAtJpC5aVrMYv4pjGEOBg
         dXgRjEsJi1lDMcwM+EVzZp1DIyHAmrTldw5TDef1HMmibW24P7Q7G6UQqp2OCBLIfbSg
         foR74uN4sECodats8sx/SJ2oDUorEyqw835pfinOQXUAk38N3RNbeRPaqXl1GfwFKFB8
         Ra9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784622338; x=1785227138;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZF1H2C3sWBUxUFeIPjxdM+X09KSU/DDuULUiVulHlSI=;
        b=FT4diXTbsFa0NswJLhdfjtvV25j2qFC/N0XHQIbRntjy42VgMvxVwU+6zsbBb1n4Gt
         DPLjoJSTUZdl1MEhQUlSihQXErLt8AsaGJaFtpykKm9WJhRmxq0TeTxCOCXFuYKqW8Ev
         y032fAmHAiaOFlHHmJZYxFJ1L3Q9nDV3LoIsJad/q14v3WkoDJOwiZz075q2CDbI78t0
         83Id1O6hrBVoZlim8ifpHSIarTA+GbeHIbqvokqPiaL6v4HxFmNCnA6UkXojMn5ICoiU
         UXKFWeHHZSCtqkjsdEDMhvKCmMLVr/cexKU954dPy9ihLmIphbVcdO800vM4HouWu1ml
         p+mw==
X-Forwarded-Encrypted: i=1; AHgh+Ro/OqLkYlyVF503bESbRgIraI6kGjfFGghZY3kfjVeIfF5nTkJPspOtlbSA0EtdJOqkDP4ThbLcfak=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNgxPmZp8tBYjIaFjv4405VSSDS56LHW2PwtSciDfh9/XG4xEf
	BXOJOfWV1PiHo0CAbRcmDa1x4bX9KBgArefjS7fzzsBA3o+/p4jh+wgMmFh0iJ3tmG4VdbcV+Ya
	9FV6fKIxXm2EJX7+Tl6Wh7/PMQxbhHs/+aRAyGleE+jw7jNOX2eHMpcCEbowPy+uzUIYtxQ==
X-Gm-Gg: AfdE7cm2b4Qnl6vCJ2kyV8zKG4nmFXOCFDfUD3tBdMmZBZO2mNEUUSg+EHRcBuVvLBf
	csaoKc6Ze8Vo3rWeyUSZQzfAR79S8pnGqD9y80EcmZaKmyFs5iiOLpx/8lqpuUDkWRGUOOStW3H
	2+dX+SSLEiRCz1iNJYWoDoMYAJNza8YcMI8qA5XhpLmUMLAQpfXATXdFYp60DjT9CGxQAx4e24N
	++Q6lKMg60aH6vcgXm5wh0v/3nxv0MVREUV7TIVhgUKjPbcC55OCXYKT9aEfYV6cR4IMuqiiMqZ
	PeVfZsKcxms+hdIm43aNatGDGQcvrO2RykJQKqNMnHarVQpz+1hQ92JMHmRC5SflYo/ThPnPjfZ
	0Dfsv75i2uNSqOo1QVgo+2OsOPaHCR/KObHTy9c28C+z1E1KOI+A=
X-Received: by 2002:a05:622a:2517:b0:516:dff5:68c4 with SMTP id d75a77b69052e-5213c008207mr155290691cf.7.1784622337800;
        Tue, 21 Jul 2026 01:25:37 -0700 (PDT)
X-Received: by 2002:a05:622a:2517:b0:516:dff5:68c4 with SMTP id d75a77b69052e-5213c008207mr155290121cf.7.1784622337125;
        Tue, 21 Jul 2026 01:25:37 -0700 (PDT)
Message-ID: <af19f823-234c-462d-8c52-4d8cf4b93c4c@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 10:25:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] hw/9pfs: annotate V9fsTransport callbacks as
 coroutine_fn
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
        Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
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
 <7790107e-1256-4ed8-ba49-cab980197938@oss.qualcomm.com>
 <5af0aaf1-d372-4800-9f6f-8f5dacd8c69e@oss.qualcomm.com>
 <CAMxuvaxREAH4K45UYeC6PK5fnYXTZW9nitRApMdtaxOC6rPDow@mail.gmail.com>
 <CAMxuvaySONs4r=1Bmsao1f1cZdviGGwPVM8+1Q+1vdY0X-pYVw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <CAMxuvaySONs4r=1Bmsao1f1cZdviGGwPVM8+1Q+1vdY0X-pYVw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bjmfwCN3xS0S5_qNRmVDty_-AxN3y7dD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA4NyBTYWx0ZWRfX50a333u+TzlN
 SQschOpx0ZZwFwNUa3+gVjla+ttqxhV2+aSxlfXj7rKv3irnlT1BlM8ZzPZk3JFFX9VSLFzEeT4
 9JYKMgzYVgTVaZeIJ8J4cco6Pw6i9a+OEMG9UhZpV2XuyvaJQnErv2Z4pnONHAE8Ot/ssIbZZVk
 8rLmYeo1N6p/o1dGdK+rFY/1FrTE8uifryrfSvpi49gAnAK/jTCJVYvhWuPI+toxgyMpN799Wb+
 1TCejxnGYMg49v+uaZ/d/zv5yf5gjPDWe6qD/hmrZ/LzN9Kc8w3VgF9OzBBcClzAUMmKL55zg3+
 87iCU2uywVNC9IAvbPIqPTAP6U65kkAtA0Weq3pxjatORyeY9sBg9XHIiolk69SQ8UE5MJLBHnC
 7LqK58NBg73iNohS3fl0h2bkFf+xJRCJG1JxAxkEUcUL0BpnqVOfMgbUBYORc289/5W++fTE6Il
 57t/nmOdh4V1JqvZJLw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA4NyBTYWx0ZWRfXwxhFcyQbLGIl
 +m/sLWP8iJBDDNeHut6gyAp9vu/BYPd4F1BqqGvOX41UjNzRCWuGKv7Rr7YIUizTtPgDVeYQNEY
 mSmNTG+4z6svhEMlgIE3mE7Dqc++L5o=
X-Authority-Analysis: v=2.4 cv=daawG3Xe c=1 sm=1 tr=0 ts=6a5f2d02 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=i-HqGOpKeM9wF-ee4XAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: bjmfwCN3xS0S5_qNRmVDty_-AxN3y7dD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210087
X-purgate-ID: tlsNG-16d1c6/1784622340-FD80D77B-1A02468D/0/0
X-purgate-type: clean
X-purgate-size: 5854

On 21/7/26 10:06, Marc-AndrÃ© Lureau wrote:
> Hi
> 
> On Tue, Jul 21, 2026 at 11:58 AM Marc-André Lureau
> <marcandre.lureau@redhat.com> wrote:
>>
>> Hi
>>
>> On Tue, Jul 21, 2026 at 12:54 AM Philippe Mathieu-Daudé
>> <philmd@oss.qualcomm.com> wrote:
>>>
>>> On 20/7/26 22:42, Philippe Mathieu-DaudÃ© wrote:
>>>> On 20/7/26 16:02, Christian Schoenebeck wrote:
>>>>> On Monday, 20 July 2026 09:55:36 CEST Marc-André Lureau wrote:
>>>>>> All V9fsTransport callbacks are invoked exclusively from coroutine
>>>>>> context (the v9fs_* PDU handlers). Annotate the function pointer
>>>>>> types in V9fsTransport and all implementations (virtio and xen
>>>>>> backends), as well as intermediate callers in 9p.c (pdu_marshal,
>>>>>> pdu_unmarshal, v9fs_init_qiov_from_pdu, etc.).
>>>>>>
>>>>>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>>>> ---
>>>>>>    hw/9pfs/9p.h               | 26 +++++++++++++++-----------
>>>>>>    hw/9pfs/9p.c               | 31 +++++++++++++++++++------------
>>>>>>    hw/9pfs/virtio-9p-device.c | 24 +++++++++++++-----------
>>>>>>    hw/9pfs/xen-9p-backend.c   | 34 +++++++++++++++++-----------------
>>>>>>    4 files changed, 64 insertions(+), 51 deletions(-)
>>>>>>
>>>>>> diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
>>>>>> index 1a309664f6e..0e52ffbdf38 100644
>>>>>> --- a/hw/9pfs/9p.h
>>>>>> +++ b/hw/9pfs/9p.h
>>>>>> @@ -472,17 +472,21 @@ void pdu_submit(V9fsPDU *pdu, P9MsgHeader *hdr);
>>>>>>    void v9fs_reset(V9fsState *s);
>>>>>>
>>>>>>
>>>>>>    struct V9fsTransport {
>>>>>> -    ssize_t     (*pdu_vmarshal)(V9fsPDU *pdu, size_t offset, const
>>>>>> char *fmt,
>>>>>> -                                va_list ap);
>>>>>> -    ssize_t     (*pdu_vunmarshal)(V9fsPDU *pdu, size_t offset, const
>>>>>> char *fmt,
>>>>>> -                                  va_list ap);
>>>>>> -    void        (*init_in_iov_from_pdu)(V9fsPDU *pdu, struct iovec
>>>>>> **piov,
>>>>>> -                                        unsigned int *pniov, size_t
>>>>>> size);
>>>>>> -    void        (*init_out_iov_from_pdu)(V9fsPDU *pdu, struct iovec
>>>>>> **piov,
>>>>>> -                                         unsigned int *pniov, size_t
>>>>>> size);
>>>>>> -    void        (*push_and_notify)(V9fsPDU *pdu);
>>>>>> -    size_t      (*msize_limit)(V9fsState *s);
>>>>>> -    size_t      (*response_buffer_size)(V9fsPDU *pdu);
>>>>>> +    ssize_t     coroutine_fn (*pdu_vmarshal)(V9fsPDU *pdu, size_t
>>>>>> offset,
>>>>>> +                                             const char *fmt,
>>>>>> va_list ap);
>>>>>> +    ssize_t     coroutine_fn (*pdu_vunmarshal)(V9fsPDU *pdu, size_t
>>>>>> offset,
>>>>>> +                                               const char *fmt,
>>>>>> va_list ap);
>>>>>> +    void        coroutine_fn (*init_in_iov_from_pdu)(V9fsPDU *pdu,
>>>>>> +                                                     struct iovec
>>>>>> **piov,
>>>>>> +                                                     unsigned int
>>>>>> *pniov,
>>>>>> +                                                     size_t size);
>>>>>> +    void        coroutine_fn (*init_out_iov_from_pdu)(V9fsPDU *pdu,
>>>>>> +                                                      struct iovec
>>>>>> **piov,
>>>>>> +                                                      unsigned int
>>>>>> *pniov,
>>>>>> +                                                      size_t size);
>>>>>> +    void        coroutine_fn (*push_and_notify)(V9fsPDU *pdu);
>>>>>> +    size_t      coroutine_fn (*msize_limit)(V9fsState *s);
>>>>>> +    size_t      coroutine_fn (*response_buffer_size)(V9fsPDU *pdu);
>>>>>>    };
>>>>>
>>>>> I wonder whether that could be made more diff/blame-friendly.
>>>>> Especially as
>>>>> this currently only serves documentation purposes.
>>>>>
>>>>> They way you are positioning coroutine_fn it usually resolves to an
>>>>> attribute
>>>>> attached to the function's return type, not to the function itself, even
>>>>> though clang/gcc handling it flexible. For attaching an attribute to the
>>>>> function itself the attribute should either be attached before the
>>>>> function
>>>>> declaration or after the function declaration.
>>>>
>>>> I tend to aggree it would be clearer to have these attributes /before/
>>>> the function prototype declaration.
>>>
>>> $ git grep -E '^(static )?coroutine_(mixed_)?fn' | wc -l
>>>         90
>>
>> More like
>> $  git grep -rnE '\b(coroutine_fn|co_wrapper[a-z_]*)\b' | wc -l
>> 1343
>>
> 
> That matching is not accurate, it's actually hard enough to match all
> annotations instances.. but this should be a rough estimation.
> 
>> most of them are "return-type co_annotation fn(..)"
>> we even have scripts/block-coroutine-wrapper.py that relies and
>> produce this order..
>> a bit late to change the style imho...
>>
>> At least, let's not make this a requirement for this series, please

Not a requirement on my side, but if we had to pick a style,
I'd vote for "attribute before return type".

>>
>>>> block/block-copy.c:47:static coroutine_fn int
>>> block_copy_task_entry(AioTask *task);
>>> block/copy-before-write.c:106:static coroutine_fn int
>>> cbw_do_copy_before_write(BlockDriverState *bs,
>>> block/nvme.c:1351:static coroutine_fn int nvme_co_flush(BlockDriverState
>>> *bs)
>>> block/ssh.c:1223:static coroutine_fn int ssh_flush(BDRVSSHState *s,
>>> BlockDriverState *bs)
>>> nbd/server.c:3077:static coroutine_fn void nbd_trip(void *opaque)
>>> block/block-copy.c:581:static coroutine_fn int
>>> block_copy_task_entry(AioTask *task)
>>> ...
>>>
>>>>
>>>>> In both cases you could then
>>>>> add it to its own, separate line, avoiding a lot of noise.
>>>>>
>>>>> /Christian
>>>>>
>>>>>
>>>>>
>>>>>
>>>>
>>>>
>>>
> 
> 


