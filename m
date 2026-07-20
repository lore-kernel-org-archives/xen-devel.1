Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D15C44515
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 14:28:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366654.1616602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wloyx-0000td-UW; Mon, 20 Jul 2026 14:28:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366654.1616602; Mon, 20 Jul 2026 14:28:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wloyx-0000tW-Ry; Mon, 20 Jul 2026 14:28:35 +0000
Received: by outflank-mailman (input) for mailman id 1366654;
 Mon, 20 Jul 2026 14:28:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <philmd@oss.qualcomm.com>) id 1wloyw-0000tO-T8
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 14:28:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wloyw-00HEUb-8j
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:28:34 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a5e3077-2eae-0a2a0a5409dd-0a2a450b89f0-38
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 16:28:33 +0200
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a5e308f-b7e8-0a2a450b0019-cddcb48369f6-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 16:28:33 +0200
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66KDrFVI2807604
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 14:28:31 GMT
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgre9cs4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 14:28:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c1a97644aso274109581cf.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 07:28:31 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63ed1911sm32338925f8f.22.2026.07.20.07.28.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 07:28:29 -0700 (PDT)
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
	DCD6ryiRf2IMgIcsXdTwziYvUf4p/7Yn9QaMTtU6zJ0=; b=hq0klmAYnZP5JoJT
	sK8drUjzh7cTDgtIQP/uzz5l5uiX5a7DxfSaCuAs9qtlj9lEV5RHV9nY2c4JPlir
	IZXTWAJ4lfTzIAxbamP2ahNv18SeR9auDvEDjtkV6KQusvGpPakIPhWSeZoQcVOd
	3tTG61NL8drdtDPEtXiq99OhLsWQSaGUKv/HuR43F4GqATNNpd7R+17wPc6W6kUi
	wSF8mnXCaF4xTjT+i6m+O6Puk3xUTKyEkp64EJhYdxeOmVvOSlI14djRZXhF/Ybr
	H/7V1ha7Fnlhc+pxdFLSruCGISMvZkB4M2c51feCsRXGB6ZPO+yGEOgeR3MGmTr9
	DKslxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784557711; x=1785162511; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DCD6ryiRf2IMgIcsXdTwziYvUf4p/7Yn9QaMTtU6zJ0=;
        b=duLlAJ2qredleZC7jICgJoUXgOGZbsEIVyvptrFkhUqUTmC6DJMYcBk380wfkhUoHR
         i1CR5is57r0ale0uL0sl/Gs9jg6fGOW0jtN35lqCj8/aXN374CxfhcutQ5TLVDE5Fpk/
         LbtzKgk0duNfnoKTTpqn2nn+CqA/lQQESdTyrhuAw17a7hoHZrbK946WxjWI3DHoLIsC
         ZGx+NsZdPWfIL9DBiV/tO35Mwzce27bs4YCUmdm6RkkwU+RDbMgWpFxzR0huA0fp0fe/
         RiAXvwg2QgPk6/oqNFGNbvZfhRvXk/f4Ix84a/WBi1BrRK/PK5PONArkHaEXhSKT0C86
         XgdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784557711; x=1785162511;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DCD6ryiRf2IMgIcsXdTwziYvUf4p/7Yn9QaMTtU6zJ0=;
        b=BxDokZXN110LT0LFxZ6fhuasyrGXTe8GWS5L/FadOSdGxj93d3CxKfril4Moabt1Y5
         Mv4cZpgk56HCENAHaNuAxHYW5P5fgwgV/bB6oUPLYjZLAMXywdYTE5NmnO6TeGahTOTz
         iADIMjS2JJfLwaCr+d1a/acO8Qy1b3hucFhOX/6UMrtW+WwcXvWEUH4ZEMXkz+QsMTQN
         YT5+r1Sutu9E7fqoUtFSrPbhCbxmVMRvEPVIcqu7GkgwZGMj/myP9tJz+FWT3xedPQRG
         4kQJdfOO9NwjFJiq1QL1anl3SrZBgPy1tjAoZsD3Q+WGz+Jb7bi1ZEG8S5zLHSkRdhET
         xKJw==
X-Forwarded-Encrypted: i=1; AHgh+Rr4U+cnU8+MjyQJi5lInFmzb24m5Zck95rQoRRKJfFhi/Edya6kRR/sZHNF8ock/kui1r6z4JDrSco=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw4N0KiY80KPN3tLjMcl18nmiNlbsN2481f2X7veJvYbd98NDSv
	AkkK0cgJ9XmVrUJ9s3y0GV7P8ZMjEEep7rbvi8gwftUrn41kEMoccY80RHp2BPL05jwONR1qMWo
	t0vH3P0ep5vCI0LPKiU+Wno/Q+UsU6WWvkHnUfkXQ1wmt953hIsx9jPyAiB+8zkqmocpyHw==
X-Gm-Gg: AfdE7cnwanPFiwGwyUf3NLwbIObi+x7bsoV38+bypY0pUBNAL+j9JYcnBqJbCu/yQVI
	ShLj501tgkIyCVWRZ2uNtGlTqJZOFoS40dfrbNrBNnYAFen6bGAHMEygxvyR1DFTvk7yM/LqPhK
	d2ajZG4e0+RHdrke1UKnhKfgOnI+TSIr2EiHNMJxEfoTTw6mThBusQX8hJOyXmgv+ZrepakERtt
	3l0tp+jc180Q+dO2oW+g+/3DqK02pBwJV+ad4ep3e1nM8pW3QfahPceFhO8qgwqIvGXmeS43ekE
	OmTZ/+x6UOtJUHIJvcG2IddoG7/FkDPrvnPBlauvTkz8LJTZGcno38dak2B2uCZ1nLLTaAhWV42
	lQfHmHj/8TjVKX1U40ADkGOo02TvvGPV4exVMBacdAYEz56KGS5I=
X-Received: by 2002:a05:622a:11cf:b0:517:61d5:2f7b with SMTP id d75a77b69052e-5213e28e1c4mr134792681cf.56.1784557710873;
        Mon, 20 Jul 2026 07:28:30 -0700 (PDT)
X-Received: by 2002:a05:622a:11cf:b0:517:61d5:2f7b with SMTP id d75a77b69052e-5213e28e1c4mr134792291cf.56.1784557710387;
        Mon, 20 Jul 2026 07:28:30 -0700 (PDT)
Message-ID: <9420cae5-c5a8-4622-944c-172c8edff13a@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:28:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] io: add missing coroutine annotation
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
 <20260720-co-v1-3-fabb4db3c204@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260720-co-v1-3-fabb4db3c204@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE2MSBTYWx0ZWRfX9qW+8knQyJME
 et67IDmGMSvfn0fikqCGod+xsxFAAZc+S/f2DGQqL+OFdjzmlOsstqelZS9qgnUoMYfkUsoWP+B
 5pSb3NbqDBzH99AzvPUYR7sy2kIQGPs=
X-Proofpoint-GUID: fMQFKaNXCV-Za6uy5-gTRKGL7NzA4ADt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE2MSBTYWx0ZWRfX9GprQGyeCSPs
 vSVTQYMrdW9suS64bagaYZflCXr40TZizPRs9VAfp2nbeUg3MC55qpAlzilq+N0BfwTTlj/exe6
 d1CAsuZmClfkUHzz0eA5xrkl5oyOcstTXb5g3FfEfaDUXFb8w6FwH3aqcLI2w2TVX/3FiyCGzNN
 CRgGBmqqdPC5Ks7VDAtDI/v29IfaTOAxST85FHlVcbcY1cbVyV9xpWGsuBf/7abcqEUo3eTxkRd
 MtLaaFsqnAhkdVHCYthq82ERomVmUaWYfup2b+e0NISbbuBmFIgRbI/mG/A8hXe0CMGSdXABGnY
 3sHdRgkJl8TS+/2yw7cNF81d6Ju8XPx8jmj39LU1DvB3UvJ5lAwDY4NgV56heOAmo4foKx0CKQn
 dMBU2fbpzY1fEu9tA8vQEjgdo4pUYKM4dYfZyZn2gIsgNagp0xmcD4dXisIudDlXkEEujuz23Y0
 eMRpyQZE5v4C/Ioeieg==
X-Proofpoint-ORIG-GUID: fMQFKaNXCV-Za6uy5-gTRKGL7NzA4ADt
X-Authority-Analysis: v=2.4 cv=foLsol4f c=1 sm=1 tr=0 ts=6a5e308f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=IcDbTAYIwZMDiq8AA74A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200161
X-purgate-ID: tlsNG-42698a/1784557713-AB6D29EA-F861C5CB/0/0
X-purgate-type: clean
X-purgate-size: 1658

On 20/7/26 09:55, Marc-AndrÃ© Lureau wrote:
> Fixes: 1edf0df28409 ("io: Add qio_channel_wait_cond() helper")
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   include/io/channel.h | 4 ++--
>   io/channel.c         | 5 +++--
>   2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/include/io/channel.h b/include/io/channel.h
> index 98485c9280a..c90ace20d53 100644
> --- a/include/io/channel.h
> +++ b/include/io/channel.h
> @@ -1016,8 +1016,8 @@ void qio_channel_wait(QIOChannel *ioc,
>    * This will work with/without a coroutine context, by automatically select
>    * the proper API to wait.
>    */
> -void qio_channel_wait_cond(QIOChannel *ioc,
> -                           GIOCondition condition);
> +void coroutine_mixed_fn qio_channel_wait_cond(QIOChannel *ioc,

Better using same alignment than below (more importantly in
a header), otherwise:

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

> +                        GIOCondition condition);
>   
>   /**
>    * qio_channel_set_aio_fd_handler:
> diff --git a/io/channel.c b/io/channel.c
> index 2853dadb684..620256f310d 100644
> --- a/io/channel.c
> +++ b/io/channel.c
> @@ -905,8 +905,9 @@ void qio_channel_wait(QIOChannel *ioc,
>       g_main_context_unref(ctxt);
>   }
>   
> -void qio_channel_wait_cond(QIOChannel *ioc,
> -                           GIOCondition condition)
> +void coroutine_mixed_fn
> +qio_channel_wait_cond(QIOChannel *ioc,
> +                      GIOCondition condition)
>   {
>       if (qemu_in_coroutine()) {
>           qio_channel_yield(ioc, condition);
> 


