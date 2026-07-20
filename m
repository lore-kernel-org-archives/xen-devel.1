Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7B0C44515
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 14:27:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366646.1616594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wloy3-0000Bv-MJ; Mon, 20 Jul 2026 14:27:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366646.1616594; Mon, 20 Jul 2026 14:27:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wloy3-0000Bo-JL; Mon, 20 Jul 2026 14:27:39 +0000
Received: by outflank-mailman (input) for mailman id 1366646;
 Mon, 20 Jul 2026 14:27:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <philmd@oss.qualcomm.com>) id 1wloy2-0000BS-O2
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 14:27:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wloy1-009lQf-Ta
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:27:37 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a5e304d-5cb7-0a2a0a5109dd-0a2a4507bc14-16
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 16:27:37 +0200
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a5e3057-b4ea-0a2a45070019-cddcb483f5f0-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 16:27:36 +0200
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66KDrEAC2807543
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 14:27:34 GMT
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgre9cn6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 14:27:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-522de3c645dso56634201cf.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 07:27:34 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63ee0086sm32882765f8f.30.2026.07.20.07.27.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 07:27:32 -0700 (PDT)
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
	DWJNyilWcUWmfqywoqzffl/7oB98sIt3grJe2Xwyo4U=; b=DpI0U26qEQcoXKxP
	TtGYGlh1I+7pQIlnf92gRatiIy3HZN0GjVv5OXBwYy5B3nXwPY6m4C46K/K1gr82
	ThpIUl35qfqSyDFvzwkEB1lX0Tv0C5nlOhjjoWgmdM7e9eNhW1F0KEaao183S7Zg
	dkxN5ZC4g1Pjb7XcOhXWz0KemLT32T0OCTJ2WSQ1cNp2ANZ2w2oyHRgiaXHkNaw9
	IjGRlwUdo7PZB9xhgUfv1KQlzN3MRKee9Ez+KtL34KLX8TDDCeDZp1LZLt4k1zY2
	uLFKAaMMuazFJEfZzo+ASidycvCrtxeJVlXKiaQkhkV3mJR/UEOnBbk6N4T5ix7b
	AcPEAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784557654; x=1785162454; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DWJNyilWcUWmfqywoqzffl/7oB98sIt3grJe2Xwyo4U=;
        b=PUTxlzUgqNuq+VZj9w3GDkjY93EU21VLqqV3XagXzI9o3YC+tL3v11UE0xTwGghDRY
         fFL6c3hp6pwNHmCsZBRWWEYxfpY67uv8sCEnG5VDUXnfXFU7jPGdtaarViMBwFz4a3Ll
         tLxh0JoRwXRVFKvJ7QhdQe4x/nDDVp2KR05m8h14TsAQX34lfW5K0bVkg3jO/heERA2u
         TObwmd0OXdKsxMJOmCDMpcyR81Qj/MA/6iusMJNsv9o7vVInLYYIRWbQ2QmJn7Tac/DN
         Y+V2qG21TJjJYPIu2h4U5lyCSxuXl2s45wQliz1AjUnxt1g+b7b6rQF6dk5nvUOt7ueP
         S7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784557654; x=1785162454;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DWJNyilWcUWmfqywoqzffl/7oB98sIt3grJe2Xwyo4U=;
        b=BVRp/oXiGNTOQvz32h2z4e03xMqrcgbK/SlNhhf5m39ojcFCKVLCXuPYmg6avw0hVk
         DET6SJss/cy/l3cAjSGzIlWzwLaUKOoJqG1Axe8K/bLGBx3l+O0uIuxP/Dw1ImgI29cP
         vfZBXyYbf5nQOycr9hX80yrMkjgZoHzLunajW44kv00Z3/KGTJO41jN6Ar/+WAsX2iqM
         tEU7l6/0IiOyMxjAYhvcJ37W+EAkP8SImaQemgeiFe8IZOZ43q1POKCRPwtwhHAh0o3o
         MuhMrUVoWMFGZ5OVK6BywwDkjQOiK3mSaXRZ45LGoqJKe5yvtuNroHa847JozWmdyxK7
         VATw==
X-Forwarded-Encrypted: i=1; AHgh+RrKaEeFKIsP/dCDpnrANN+VDnAUtd1QqhhnuVFGJSBdQN7TXeg3Dscn+JPLs/bsLR327MR5M4SKUbk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6wXnYUpp5p2b5T4L4hHTKYL3Mgf0KLlT6FkfCd1tCAM3/hAMq
	rbWmTqOarVy3gWMn2sIXlnbCWBQ3G+shiVvQQQNi49DnxB5UG52ug1hQkfAtJWQHplmo00uVD8n
	d0XEdw2ihYWmoU7X7JRgHlWJoUM+zd7OYBFnW2spwRuV5LFYgoYrNKyAyp0qaDp2SwMimlA==
X-Gm-Gg: AfdE7cl04H1yhqNGotvpVUbsh0L6bv/c248AFM81sP+G+iJOsNdD+6JqQh22REG5jFP
	3sxIIt3bXCEk7jpCfIdcDsF5H5mOEtEM5A6L9C4GT+p2ccp8N3p+u/un1T4sDN/TL+SiNfjKIG8
	y5fwDI/dJRmapnlPLcopPrq444QZq+k4j7j+6ctrhO1hkA7FPP6ggc2ClLLMyyZE/BCsOyL4qzL
	0BN8V3msOd6wjOR0GAO6PkUsd87RNTt1tnjmTtd2KrSBqjEx+wkrR9sEXIfVMwdlBAWCZ55nA4e
	/bCB+6xEL66c56BpR8wkwvOuj+j7irp61QUPc+n/vEngNkXXuuY8jYW0jZEQHwHAykK+1+bXRy6
	7tx1dHHJxfJmud7IAaCC628FHQkrk0AE7YV4zGTWBQSId5aHiFKY=
X-Received: by 2002:a05:622a:1a9f:b0:51c:a70:5ed with SMTP id d75a77b69052e-5213ad60752mr132018401cf.30.1784557654071;
        Mon, 20 Jul 2026 07:27:34 -0700 (PDT)
X-Received: by 2002:a05:622a:1a9f:b0:51c:a70:5ed with SMTP id d75a77b69052e-5213ad60752mr132017971cf.30.1784557653592;
        Mon, 20 Jul 2026 07:27:33 -0700 (PDT)
Message-ID: <b160d306-cd5a-40e1-9c57-858a249e13df@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:27:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] migration: fix qemu_get_counted_string annotation
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
 <20260720-co-v1-2-fabb4db3c204@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260720-co-v1-2-fabb4db3c204@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE2MSBTYWx0ZWRfX/vumsm0yEHdk
 KmNLugAvzH4yPWBwlH1UTdGTqJ042b+uV/uV+b+Gp9jT8cvNAzx8rO79i+2qLaP53ziHujoe21+
 T576Xg49SVN/W/jDm3WA3sGnmApFsPQ=
X-Proofpoint-GUID: uwebRqfAl6skdhwGE2BZRVVAqFFoNw6u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE2MSBTYWx0ZWRfX6EOXK50dFsiS
 hLu1PKYEOjKN3DMAul5Z2/BsxvN3lej7oWx2anGNBEJf8BZV/0iYCz0deW+1TYNQioLdq5V5IQa
 EmUZib3jgQXH79f76NdsuBoeKjYXJwXxFUEzMdz9DJ0+B9QhsuV02zXW0yGZrNnHcdiIQe/Zyob
 0FEU+akWxOLis1elpzOWdAnIHl+FePQFZnD66rXfbaF6oPdS8Slh1zSGTuaFftNjnl17LBKh48N
 piRqL33X6dcS76pXsqTp6u2Jkb7QdbjtwuGLk2oIxPXq4IaL+XwDU/C7Wv9SA4+E+vul0yX/mIt
 HJKBq1nDUcLtC+8sqE84uGGSKcABpQ6q4w7lh40IvTejiwNpFzDqMXaV9Q8/IG9gE/9ExgVdMHI
 EdlozqFuzODNqwhHvqjOT96igNOoTZ4edR3dRVJFy6llgoLgwbTKlvVQK8YXyCqYywP8CtqOHUZ
 kOAY/hENXqbyumRGIow==
X-Proofpoint-ORIG-GUID: uwebRqfAl6skdhwGE2BZRVVAqFFoNw6u
X-Authority-Analysis: v=2.4 cv=foLsol4f c=1 sm=1 tr=0 ts=6a5e3056 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200161
X-purgate-ID: tlsNG-ef75cf/1784557656-A48C9AE4-C6E7B955/0/0
X-purgate-type: clean
X-purgate-size: 347

On 20/7/26 09:55, Marc-AndrÃ© Lureau wrote:
> Fixes: 394b9407e4c ("migration: mark mixed functions that can suspend")
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   migration/qemu-file.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

