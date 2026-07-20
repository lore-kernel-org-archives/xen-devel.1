Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3947C44515
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 20:55:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367395.1617176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlv0j-0005Pa-1X; Mon, 20 Jul 2026 20:54:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367395.1617176; Mon, 20 Jul 2026 20:54:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlv0i-0005PT-Uu; Mon, 20 Jul 2026 20:54:48 +0000
Received: by outflank-mailman (input) for mailman id 1367395;
 Mon, 20 Jul 2026 20:54:48 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <philmd@oss.qualcomm.com>) id 1wlv0i-0005PN-53
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 20:54:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlv0h-008AbV-3S
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 22:54:47 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a5e8afe-e002-0a2a0a5209dd-0a2a4502ca1c-8
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 22:54:47 +0200
Received: from [205.220.168.131] (helo=mx0a-0031df01.pphosted.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a5e8b15-6ca4-0a2a45020019-cddca8831868-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 22:54:46 +0200
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66KJU16N3368923
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 20:54:44 GMT
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgs030e0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 20:54:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c1b4d961dso78998771cf.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 13:54:44 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956547319dsm13811755e9.5.2026.07.20.13.54.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 13:54:41 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=qcppdkim1 header.d=qualcomm.com header.i="@qualcomm.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=google header.d=oss.qualcomm.com header.i="@oss.qualcomm.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:Content-Language:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j1yaI9+UfRFExxJWNuN1Irm3lmYbG6CVl7bu6i2Vrzo=; b=X0vUQZthLGy8i433
	mR5mzBPnxNQhvq8pyqcdPPYxs0hKq6ojsfeLyBxhEQoJ2kX+7XzzlpWH1x1ZcSDs
	af4H7NlkefIYXCHgNr5aAjK0sPygak+dQyc4LR1u9+tO/dTCPIEKaE89ZlJNhapx
	Vn/sxHP9Vpg1ejGKmMYRWOQMIhZiA4HX7sDtlrUGUe/Ku1tsbG00184P9hbj3ZME
	PAJ9G3/PP+aV6IdigP4fqQ8+lA6qb66XYHSJkff2ywNcZwsiE9Pxw1+oAo/ekbOb
	cgb7nh2pNKgugnYFcgMlPvLb3mXgVxbnCH9jiKLCW956r2vbXIjVzvZqIm5yzTo8
	YN6OmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784580883; x=1785185683; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j1yaI9+UfRFExxJWNuN1Irm3lmYbG6CVl7bu6i2Vrzo=;
        b=IaDPNb9M7YIU26l2bZO0ueFT5HHv0AACWzb6p7ArL3BnW4GMfNydnldZ8/LY44vM3w
         2adu/Q4F8/FpIoNvivyu5A+tiwOQTJIT+gl9qs0ZaO74bp9PNr0ZdoFDm0H16/swItZB
         zEpJwgV6oOa48+gHQLGK7hgPuIyM4nou9HEemnbfj72gRfM8ocfst4Ng3IzupNZcHdQF
         07suOT+sLUzK4YrBn92v0S1QNaT54RJzf2Yvov5EJZtF1/wQLs10E8hNkEj2DZvfagKR
         +NnrB8DdbgXXyAshEVNI3cCC/QaJhZdiQXet3GrNba4ggRKYuukYk6v/o6CS9ZNLhM4e
         ZS0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784580883; x=1785185683;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j1yaI9+UfRFExxJWNuN1Irm3lmYbG6CVl7bu6i2Vrzo=;
        b=KxfKrS4OlyiH7ys2Q4Ecok03/fMUCUxHLWXYTp6SmTtnHVk/C+u9+FVFjfb23jJq57
         9btkm4rRRsQdjwV50ALORVaCPqHRHLJCMlMph3dvrvbjad+r1V0rskaT/ejRtFEq/D69
         52DvpYwFvmWOAKE+Hx20/+8SHcFJ8vmMeCQiB8pWrh9A95tKvsm5/DYbJfL3rEXspatW
         6/E6NkwLruu3nlcgdU4VNxWvz91Ox72g+uWvU38dtgPl4TZEfdaEC3USBg4oewXg69nW
         32LJu+CzBGbmzlqbU4pQEMqmkpcUZttUEjR9QZ0drm+beTkC8gogLFtIoYUKz+XXiT7E
         wFCA==
X-Forwarded-Encrypted: i=1; AHgh+RrsqFFFAP9gPr0d/QJ2xDVcZwwbdycqntIHgX82g7OxNVu4P/EhA0U8D5oCrXpG4y/a/c0w26CM5SA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwG6dI3hxIMpWaX8sO/msjRFIJQZ1BvyRqM+FQwyjlPs2zhTKL/
	qZD6tceQgJXc26zOclwOOUdmTkiSkFXgElsa6e6vsoM4ixm7yLpBlFLZLSbEI14mq8kiJpfxGa+
	n80/Z+BiTSwPsp4VgtxzU4MZ7iAB/bU0yWNRZYIx4cmqbW2v+gefhX6wUmqI1RuG7VCMuew==
X-Gm-Gg: AfdE7clC2GZWqf1Au7morLDATBSWO68Yw+wf3lG2dyxSYzz085hFQFUDt/WH8QJGHdT
	aQy40Vi8a3mfqN5x0+n0jlcGd0frwBeqskk0tQXXGesVbs9xDilyykywMMQeWjk5dyvSEhuLW9B
	fJpVManxn+mVKA/3pF5JLrCe/EpqClK40u8RLz3Nzgge4KM/0AIJcscWhK6Zi7/S29QWVm8VLiW
	hruH3tKXcyirEjwkWi83Ah+ZRNIfQqx/C3EBNjEx/n2zJD4aiYt61wSDcvuzJPi84fR8TEltk1Z
	03D11x1VnL0L7E4scXhpTs5/qJB6ggx0TDGxte93gAbORrgbfz1/5rKmVmgx8gJMqkWjz+HvrPK
	7cS2VB11XiMJfhZ3aCiFvMMGzOodZsbKranzKE5irUX8g38T8i8E=
X-Received: by 2002:a05:622a:60c:b0:51c:98f:f288 with SMTP id d75a77b69052e-51fc1293160mr201720151cf.25.1784580883405;
        Mon, 20 Jul 2026 13:54:43 -0700 (PDT)
X-Received: by 2002:a05:622a:60c:b0:51c:98f:f288 with SMTP id d75a77b69052e-51fc1293160mr201719971cf.25.1784580882969;
        Mon, 20 Jul 2026 13:54:42 -0700 (PDT)
Message-ID: <5af0aaf1-d372-4800-9f6f-8f5dacd8c69e@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 22:54:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] hw/9pfs: annotate V9fsTransport callbacks as
 coroutine_fn
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
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
 <7790107e-1256-4ed8-ba49-cab980197938@oss.qualcomm.com>
In-Reply-To: <7790107e-1256-4ed8-ba49-cab980197938@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDIyOCBTYWx0ZWRfX2yvVYNgDq0fa
 0mzsN951mwH5g6p6JbgKS9z4pXDVp8CdeoO/0L3tydtQBXwn70omYRRzNz0O/0D7BY2tdb542dR
 1Sze2QINeEx+z4fwolNZ/idrkrlI4mg=
X-Proofpoint-ORIG-GUID: R0oGcMxZ8vzThijzcdXpIdmcBHCtzofc
X-Authority-Analysis: v=2.4 cv=DMS/JSNb c=1 sm=1 tr=0 ts=6a5e8b14 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=20KFwNOVAAAA:8 a=FKbDSFgr-VcrMEy9-l8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: R0oGcMxZ8vzThijzcdXpIdmcBHCtzofc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDIyOCBTYWx0ZWRfX4yS9NpTzdiH1
 b5PqqPAYczafKTLpXK0kvDbEgSZoKEmh7cRVVbKR2dbyWuNn932vRYEKUv/N78fQICoMw4iEqXp
 qcIZCV7SKEugGhqZ77hBn5TCo7tBnA1+sUujG+wr7MK9rjtYCjYVZpdf6Ux+PK7AwaC9MFiPmfl
 V2sYoJFrX9U3oB05lcpuj+GpiE0t6FKLct/bR0CbNbix1M/ulsFYVB+/ws5zfh4nBdnZ8Per5YE
 X/T39pLaVS56i3kfPfKhTW4yAOcT/kN3EIG9NlrOBEL9TwTYjKgt3Ivu7eqzsuCLBZwsrCC9obx
 Vi3oYsvyFOIRKLnr3rz/upYQs70+iJMDbx7Ajpbapaxl4RyLdRWBVcq6EvbYZ+6YDNvw+Fl/7ou
 wXJObvp3ppg8URqLLgd3NLzdknRG/RdSYShLUq1MPph+nHUxtC0weaUNI/OdldC6L3u7LlUUEl7
 WdrImblBRwyvnvfbtfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_05,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200228
X-purgate-ID: tlsNG-720697/1784580887-F24B62AC-B0127FC9/0/0
X-purgate-type: clean
X-purgate-size: 5319

On 20/7/26 22:42, Philippe Mathieu-DaudÃ© wrote:
> On 20/7/26 16:02, Christian Schoenebeck wrote:
>> On Monday, 20 July 2026 09:55:36 CEST Marc-André Lureau wrote:
>>> All V9fsTransport callbacks are invoked exclusively from coroutine
>>> context (the v9fs_* PDU handlers). Annotate the function pointer
>>> types in V9fsTransport and all implementations (virtio and xen
>>> backends), as well as intermediate callers in 9p.c (pdu_marshal,
>>> pdu_unmarshal, v9fs_init_qiov_from_pdu, etc.).
>>>
>>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>> ---
>>>   hw/9pfs/9p.h               | 26 +++++++++++++++-----------
>>>   hw/9pfs/9p.c               | 31 +++++++++++++++++++------------
>>>   hw/9pfs/virtio-9p-device.c | 24 +++++++++++++-----------
>>>   hw/9pfs/xen-9p-backend.c   | 34 +++++++++++++++++-----------------
>>>   4 files changed, 64 insertions(+), 51 deletions(-)
>>>
>>> diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
>>> index 1a309664f6e..0e52ffbdf38 100644
>>> --- a/hw/9pfs/9p.h
>>> +++ b/hw/9pfs/9p.h
>>> @@ -472,17 +472,21 @@ void pdu_submit(V9fsPDU *pdu, P9MsgHeader *hdr);
>>>   void v9fs_reset(V9fsState *s);
>>>
>>>
>>>   struct V9fsTransport {
>>> -    ssize_t     (*pdu_vmarshal)(V9fsPDU *pdu, size_t offset, const 
>>> char *fmt,
>>> -                                va_list ap);
>>> -    ssize_t     (*pdu_vunmarshal)(V9fsPDU *pdu, size_t offset, const 
>>> char *fmt,
>>> -                                  va_list ap);
>>> -    void        (*init_in_iov_from_pdu)(V9fsPDU *pdu, struct iovec 
>>> **piov,
>>> -                                        unsigned int *pniov, size_t 
>>> size);
>>> -    void        (*init_out_iov_from_pdu)(V9fsPDU *pdu, struct iovec 
>>> **piov,
>>> -                                         unsigned int *pniov, size_t 
>>> size);
>>> -    void        (*push_and_notify)(V9fsPDU *pdu);
>>> -    size_t      (*msize_limit)(V9fsState *s);
>>> -    size_t      (*response_buffer_size)(V9fsPDU *pdu);
>>> +    ssize_t     coroutine_fn (*pdu_vmarshal)(V9fsPDU *pdu, size_t 
>>> offset,
>>> +                                             const char *fmt, 
>>> va_list ap);
>>> +    ssize_t     coroutine_fn (*pdu_vunmarshal)(V9fsPDU *pdu, size_t 
>>> offset,
>>> +                                               const char *fmt, 
>>> va_list ap);
>>> +    void        coroutine_fn (*init_in_iov_from_pdu)(V9fsPDU *pdu,
>>> +                                                     struct iovec 
>>> **piov,
>>> +                                                     unsigned int 
>>> *pniov,
>>> +                                                     size_t size);
>>> +    void        coroutine_fn (*init_out_iov_from_pdu)(V9fsPDU *pdu,
>>> +                                                      struct iovec 
>>> **piov,
>>> +                                                      unsigned int 
>>> *pniov,
>>> +                                                      size_t size);
>>> +    void        coroutine_fn (*push_and_notify)(V9fsPDU *pdu);
>>> +    size_t      coroutine_fn (*msize_limit)(V9fsState *s);
>>> +    size_t      coroutine_fn (*response_buffer_size)(V9fsPDU *pdu);
>>>   };
>>
>> I wonder whether that could be made more diff/blame-friendly. 
>> Especially as
>> this currently only serves documentation purposes.
>>
>> They way you are positioning coroutine_fn it usually resolves to an 
>> attribute
>> attached to the function's return type, not to the function itself, even
>> though clang/gcc handling it flexible. For attaching an attribute to the
>> function itself the attribute should either be attached before the 
>> function
>> declaration or after the function declaration.
> 
> I tend to aggree it would be clearer to have these attributes /before/
> the function prototype declaration.

$ git grep -E '^(static )?coroutine_(mixed_)?fn' | wc -l
       90

block/block-copy.c:47:static coroutine_fn int 
block_copy_task_entry(AioTask *task);
block/copy-before-write.c:106:static coroutine_fn int 
cbw_do_copy_before_write(BlockDriverState *bs,
block/nvme.c:1351:static coroutine_fn int nvme_co_flush(BlockDriverState 
*bs)
block/ssh.c:1223:static coroutine_fn int ssh_flush(BDRVSSHState *s, 
BlockDriverState *bs)
nbd/server.c:3077:static coroutine_fn void nbd_trip(void *opaque)
block/block-copy.c:581:static coroutine_fn int 
block_copy_task_entry(AioTask *task)
...

> 
>> In both cases you could then
>> add it to its own, separate line, avoiding a lot of noise.
>>
>> /Christian
>>
>>
>>
>>
> 
> 


