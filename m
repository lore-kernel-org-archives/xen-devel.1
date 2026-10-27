Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37506606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 18:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I+FxSk9S;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j7M4Y7NO
Received: from list by lists.xenproject.org with outflank-mailman.1462439.1673442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLlri-0007bM-Vi; Tue, 27 Oct 2026 18:25:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462439.1673442; Tue, 27 Oct 2026 18:25:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLlri-0007bD-Rj; Tue, 27 Oct 2026 18:25:42 +0000
Received: by outflank-mailman (input) for mailman id 1462439;
 Tue, 27 Oct 2026 18:25:41 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <philmd@oss.qualcomm.com>) id 1xLlrh-0007b6-3O
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 18:25:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLlrg-00A1uE-GY
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 19:25:40 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6ae0ec9f-bab6-0a2a0a5309dd-0a2a4503b5bc-14
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 19:25:39 +0100
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6ae0eca2-fae8-0a2a45030019-cddcb4830b48-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 19:25:39 +0100
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69RIIJGg3486811
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 18:25:38 GMT
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbtbuga-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 18:25:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93caf7856ffso13215885a.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 11:25:37 -0700 (PDT)
Received: from [192.168.69.229] (82-67-153-177.subs.proxad.net.
 [82.67.153.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ecd37f4sm28457361f8f.44.2026.10.27.11.25.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 11:25:35 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=qcppdkim1 header.d=qualcomm.com header.i="@qualcomm.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=google header.d=oss.qualcomm.com header.i="@oss.qualcomm.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Content-Language:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4XLiomQ5/ZQQqJIKi2eA86vXUSMhCvCaUYYNDKbeFLY=; b=I+FxSk9Sr95xLB2X
	uwvSjsPgTHMJgc5OGaqC61pP5R0e2i4mo3aJTnNe4SNlZwvqaVbnQPRf8dnhsN2C
	8SkDkD0vXIE79p33s/2Sjm5JbtgpTFjp5cAv2XjDL15Kl5HNPFAFi0ogUkxy7p65
	o1OhVdAZXnayylAEEW1OCEXaOtX7swCII77TaEZjk7uNQHd+KEZoeCTiw7fSP3o5
	5hEQIWpJBSqgnHQdbgPpeBrNrdcSIoXM+wDgDomcgLWJHZ7ZVKccvdIJBFgA+E86
	tUEI6pyQl96fQ+jqOGz3r+T2V/+ywGOFkwQlsNfchB6EeF0f8sMDTPeJmeONgkl6
	DcpFQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793125537; x=1793730337; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4XLiomQ5/ZQQqJIKi2eA86vXUSMhCvCaUYYNDKbeFLY=;
        b=j7M4Y7NOc1qZwpaNywVIN1zWVO9qSDhJcnm4qz6m14KV+fR0fV57rTERTEh0aFnFE1
         xkE1WSz2IV/kE33YV8Rm8eTPOH4B3b9B/xT+MuHwJCL3vBCaexcF378YyUn/YCNcBYsn
         QQctlFQ7R9WSBuNCyKjNIDxZLn2qy2/1PYQ2kdVxHi6EvhtwTEWLYj//cqkoQxol8Cfy
         GZGxN9sd7EV5y0YIyvUgsfJMtxGSlohIBlbROdrSppK5iPuXgv5f84FCMrE+JDnSm9EU
         6eWql8/kefOJveP5VbY0h/7rak13bLBqMxvHNOed5PlW0PswEDuoVT6qnRUXzEsiXHxQ
         r2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793125537; x=1793730337;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4XLiomQ5/ZQQqJIKi2eA86vXUSMhCvCaUYYNDKbeFLY=;
        b=UruyY/xcQdK6oMJCjlHls6NkaWdt7ifnibH4orQJWXK9LRFoxxBWLQ6WuL/gw+QnQF
         Iz7W76a5TkkUdlNHKvfFgBvwRPSAtoF0a7IOiMfXRKS9+Nlae7Gu0RYo5y67MjUyNj9S
         XNJ2Ar2cWRTIJfiD/u1nkq9T80eZmvSmCa5l9blcHFJxsMVTAl52jTYPJq0SilaxYhAS
         bZ65ARHB4TN3TLh1pLsX4/5Yo/xkj5tD/fuihGgFLCtXqceAisGywUTL93bbvNnF3Gbh
         jG3TQhhZSSFNY8FbbVaXyj4yWo4qlZgBbb3qLf/Zts5oFSSzRaDnQyGcJ7PJugLaUTvY
         98Lg==
X-Forwarded-Encrypted: i=1; AKwUvBw9YLs1wNTg6Z757rzR+rF1ledG7217nrynLaJbmvU6pEcthv9lXgx6G8//KMijTqchwS/dTxUpVMQ=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIQNoH3W9GJUjVauGSq7d0DxljCWKwvUO9b0CwKYW8IMcRUaUvt
	Ng6QXdBetA0sh65bfiPNmluPTD49judsdNe4lnVDXWGSyuz9D43cIInhsOnv5zBGJGFdenEffJn
	+wMBHuz75YENTvjOTXt6/Wk9tzc9yd/U0H1CTmQRBPU7Pjzt4tGy8H14dhzXA1oXorHBHMA==
X-Gm-Gg: AYBFou0YT8IX8/5jmMQXPOsCklJ7sNH5UJDCLuocIw2djXX9QcnAOYJT8FtOmzh3gSr
	FI69DRtclxpNa9Q+13DFqJO4Y/ubq6RqVhrrNPoAqiQyS5Km6l2bBpUyZr/cGrmbMbgEJfjKEAY
	nvP3F9e6JCs+U0r69FUIqjdX1KVLWwqeFA7W4Tm2qv0FE19JuxWxG8C/f29GLT3L19hy9r5iX9B
	J8M4v0YdeupC6tEgSVzVjXc1Qrh+DlaOjLglRwUOQYRzQeI82RAnoPTIYLqam4zv1eddxQ1isVT
	YXG8U3RS1oLth9qxB9jHoRfnqIikrgDy5yZx/rId/B9wXM/u1SgVHJUyB4Y86MY6tx790Tf7FDK
	hxT7GnQjispRAmSWfv8w9TJc66hJ7qQjygVCqcnw0tZM+jZhKgWn8zzVniYhP1TupTMLhqxTJJt
	AMt3n0s9fJ3wDn3VToTekVLuA=
X-Received: by 2002:a05:620a:2987:b0:93e:5247:f61e with SMTP id af79cd13be357-940ef8bbf03mr1581123785a.25.1793125537157;
        Tue, 27 Oct 2026 11:25:37 -0700 (PDT)
X-Received: by 2002:a05:620a:2987:b0:93e:5247:f61e with SMTP id af79cd13be357-940ef8bbf03mr1581119785a.25.1793125536648;
        Tue, 27 Oct 2026 11:25:36 -0700 (PDT)
Message-ID: <d17c2d21-4b82-4fff-b08b-56cfdfe8a61c@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 19:25:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] hw/arm: mark 'virt' as a secure machine
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
        qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        David Hildenbrand <david@kernel.org>,
        Anthony PERARD <anthony@xenproject.org>,
        Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Alistair Francis <alistair.francis@wdc.com>,
        Weiwei Li
 <liwei1518@gmail.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Chao Liu
 <chao.liu@processmission.com>,
        Harsh Prateek Bora <harshpb@linux.ibm.com>,
        Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
        Amit Machhiwal <amachhiw@linux.ibm.com>,
        xen-devel@lists.xenproject.org, Sergio Lopez <slp@redhat.com>,
        qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
        Bibo Mao <maobibo@loongson.cn>, Ilya Leoshkevich <iii@linux.ibm.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        Xianglai Li <lixianglai@loongson.cn>,
        Palmer Dabbelt <palmer@dabbelt.com>, qemu-s390x@nongnu.org,
        kvm@vger.kernel.org, Alexander Graf <graf@amazon.com>,
        Song Gao <17746591750@163.com>, Eric Farman <farman@linux.ibm.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20261027181400.1752951-1-berrange@redhat.com>
 <20261027181400.1752951-2-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261027181400.1752951-2-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfX9HIDZJqv5+oq
 vIQc9yAPgOqHom3zNZEu3UPQ3it64DNdMdmLykfvcVfV3OkpFYfR1J2AaNNeBRFyiO+Hn48eAX4
 w8GZx9l0KK8F3KfRp5zY5mqBquo/FAM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfX+g48qS2dcbxZ
 s4J+9RXlz1A54lq30Et2LJlMr4t/4fUTd7z0irm9wuZIoy9tnhueyL74Bp4lQ5w13c4g+gL/5hz
 Lf4CBN7EbiqmD9Rv95MkXxWfFVXDsaJFcxlBftpohV+s91lkAipoGiA4TSnhMjp4E3KVHg8DKCx
 kUvHFBJGoikU3NJXaRx/ONYhBsnHyzAGLU1m81QXdvJHsk4/l68jLj6Sq1+Hx4oK0GgRgnMWfQ6
 yOk/yApt/R7kTEPHDX/gWhQ1Hlb9Y+wJcRN1pqFl1OyoVqBJW3w2YCP1uKyIacQTJ347YFBaW1s
 WuqEpyOQiw1KPXgkKu1CdSlkvpx5XkN2Ogw8ETVaa4L5Ero6KZNWlR2NSeVib53uoIcOCj4OyWG
 vIimnh1UlFDuOaTJA49Ibbxg/mx8HIBrAnRQwigNPIjV81OPpfAdFzcQcui7WSrBEkNFiH2W2jf
 6TYUIWchVP2xmgynMRw==
X-Proofpoint-ORIG-GUID: Xlm50UgvYdN0UI-k7U8L1vNO1Rj_js9_
X-Proofpoint-GUID: Xlm50UgvYdN0UI-k7U8L1vNO1Rj_js9_
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae0eca1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=XauY5eRjrSQ0cOF71_8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270072
X-purgate-ID: tlsNG-33051d/1793125539-6FAC44E9-66BB097C/0/0
X-purgate-type: clean
X-purgate-size: 456
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27/10/26 19:13, Daniel P. BerrangÃ© wrote:
> The 'virt' arm machine is already declared secure in
> docs/system/security.rst, due too its intended usage in virtualization
> scenarios.
> 
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   hw/arm/virt.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

