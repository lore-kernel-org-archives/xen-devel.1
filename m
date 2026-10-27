Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6620606A31D
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 18:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GaFTzCbc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HY5xecYK
Received: from list by lists.xenproject.org with outflank-mailman.1462446.1673459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLlsN-0008Jw-E6; Tue, 27 Oct 2026 18:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462446.1673459; Tue, 27 Oct 2026 18:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLlsN-0008Jm-A2; Tue, 27 Oct 2026 18:26:23 +0000
Received: by outflank-mailman (input) for mailman id 1462446;
 Tue, 27 Oct 2026 18:26:22 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <philmd@oss.qualcomm.com>) id 1xLlsM-0008JG-52
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 18:26:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLlsL-00A20J-I2
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 19:26:21 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6ae0ecc2-bab6-0a2a0a5309dd-0a2a4506813e-16
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 19:26:21 +0100
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6ae0eccc-195a-0a2a45060019-cddcb483b512-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 19:26:21 +0100
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69RIIC5j3486395
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 18:26:19 GMT
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbtbukw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 18:26:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93cbf2fd504so10166685a.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 11:26:19 -0700 (PDT)
Received: from [192.168.69.229] (82-67-153-177.subs.proxad.net.
 [82.67.153.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a94c021080sm519415e9.2.2026.10.27.11.26.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 11:26:17 -0700 (PDT)
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
	rqvwCdeTzalXFMsGrT6m3x8p0RbZtnSwh+wuiUwhRpU=; b=GaFTzCbcWdxFOmss
	X1hmR8YF6qkazqrBr89HLjt0dkNHrMsLmj3744a08FVuScFjDSrh90yi+m6ZeHCY
	0UU8XuK/tqDgKN3RSD51unGb7rW3rJME5p/5c9VYMUezsjXivQeV6CVILayDkRcq
	JLjRk9jyADcT2aDITWoEnGmWdrylCSBBaK0tddTBmypy5aWG+2SsEgLOKgWKl0Lb
	k7urQDtU6nDl3DhBQFdEpiDoVSYkUYp63o5VwexRSFmejyX3p9EUSdEMxhmVurEb
	BmDEPz4ceTwm795g/6NeGg2NqqIpv20jutiW1SkgQhCA4mSk+hSOSAthzCu+7L6b
	Dn8PDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793125579; x=1793730379; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rqvwCdeTzalXFMsGrT6m3x8p0RbZtnSwh+wuiUwhRpU=;
        b=HY5xecYKnlRfsu5jgRN/vHsocpvu7+pY/pKfGj8RUlPc6ATj9HxKqoiB34qSAAHNI/
         D86UP4gUJe6mxT5Tfn7kgV5wbguTbqCfFyzes69nwnPhBQ9uQaBwba4Ow6BGgFEzBwN8
         /sYa+fEUKtuCdFuWv/u1HZcO0ZAhmyeWIVssCG3OzhY2E7YecxjujAKAbB4WErfk/AUL
         0Z0sVS+3a0YqS3+WlIlQdtjzeTqykSdI/SWO2v+cm32uYQEAlH8vd/aOYLapGUi76P+3
         QTdLwjx95Z7AsHbLCpwK5E7XV75MSOq2BYAilBdEzfSci8HRqc8IWs8lcQIf48+Dgz9U
         kA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793125579; x=1793730379;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rqvwCdeTzalXFMsGrT6m3x8p0RbZtnSwh+wuiUwhRpU=;
        b=yOw+zsVdk27olISGjUdWlwDxNSYoQ4piantjFwi+9v1EOPuZGaoJQS3ddDAbe3inB3
         teXzSCQUEuRtsbj8gBMQafNnm8sxVDnbZB+CO3NSK2p+2PpDgotjqnh7AYrCzYKXGMYw
         IWbVtnmS7MalTkcZ6V9ocLhTiG67pR/EA2pRbBFpLtkTZGpPvckCu+QACCrJ5fZVhWW7
         WkLnLP90+F/FeY7w1iPwilb6Fc0KStdVq4mh5tFjb928FKMBgxobwpQt3tMFkoe0DFxV
         4MeDLfahvNhJOr1Y9sibZVo0wOnLlLkxqxm8zAGh1Hfs8+dTv4PelkRsVsTTGbwRr8/5
         4OTw==
X-Forwarded-Encrypted: i=1; AKwUvByZQ4op64TdcLMFrBSIxi70GFfospCtX0B3nMaMRqN70VkCkeA4Ll8zv+P6vnnEYofvbBiS8Cp/GSc=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJDAMvtjuoJd7Hkq7u0L5AoXr9ll+gvR0nVpCbQ1LPWi89m/XOX
	mo5T+c/bIuDBIzPqM6DqhUO6EpcJzv1Bur5eny/bzsSuSwJybxZMzfhDmF/Hf0qgJ6p5afIk4xe
	vNjvFMN1mbDOlI6Qd2lrFBzaGe2C/S9oHzdQssoPlJbq6B4PJYe5AH+kBjKWckteMWWuofw==
X-Gm-Gg: AYBFou0Z4U8BLfDZ7JDDPxlfcBPIqPj6SFztA81W5APVPf09hkRaj1m/FMpcBCN8yZZ
	7d2ux5cSZia3H+QZ8MyS31J+Ka34mzeKBHXzqMxKK7Jz/qiBelM3QfKbnVs4/2M0FPaQ0p3Dd8R
	eV5lcYSo2Q9ONYI16rM/wSsZHooEEvvMjxxGB5INKIyNCgxGLS5kmBGe6JzksSy8dFXVUYVuOY7
	+71ivgV/6nsReNnrZDYWcMvXPezJIEO6FKFr9i5djN+p+YXAhy6TbN/D+bnai3U345uKVwkPSMZ
	93vrd1g92jpjxAVUc+xaxVrLh8GDNfa5fxlXIVkAz6r237C2Orfmgw8qkbtGz6eoKgVSer+LbwR
	8WO76sUQh/mGDRh7HuaXNjbyjpP5teInQ9MraXnlx6tMQ051Z1A==
X-Received: by 2002:a05:620a:4689:b0:93f:2e08:6420 with SMTP id af79cd13be357-940ef930089mr1680121685a.38.1793125579131;
        Tue, 27 Oct 2026 11:26:19 -0700 (PDT)
X-Received: by 2002:a05:620a:4689:b0:93f:2e08:6420 with SMTP id af79cd13be357-940ef930089mr1680116985a.38.1793125578678;
        Tue, 27 Oct 2026 11:26:18 -0700 (PDT)
Message-ID: <a7e54c98-bad8-4d2c-9e78-75297e772670@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 19:26:16 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] accel/nitro: mark 'nitro' accelerator as secure
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
        Matthew Rosato <mjrosato@linux.ibm.com>
References: <20261027181400.1752951-1-berrange@redhat.com>
 <20261027181400.1752951-12-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261027181400.1752951-12-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfX3cwscTLu+HHE
 tId2sklur1KqQwGl9/NHEERgsIHtznV+eaqVnAYRDmuFwMrmcCxe1CmPwu1GskZaRHIcwC8Yl8c
 iXRfWzUbDnqGWC6aFVl1J/jXl1w0HLk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfXzdh90naxrkLB
 wFnUX9GyJbkfZAqwfuZ5lGdtJhiOr/dYt2D7naVhBV6g5JPpZYIbw9UUYj5OmiJT1JNiguBURRl
 t7SgJ5SXHMyZcnhE/a3P8Ro9y8V/5irQ23RKvGMSberdbmpLxy8OWUOfjonaT4FUixOjRJmb2Eb
 lrDZ5tQzrQ35GWs+5tORwVejGqyl3fMX2UHAenUEA1xVzfPkm/8JduJyrhm7J4VZry/ED8oTqnM
 j5VnrCbDs5BUxW/4kwpGp0c/9UpoBvDfqfVb4tdC3swHf+hVLzYSQ1APoqyL+y2emahjjEZBHhM
 O/8cZuxuPGtvo4uRZuH+8c/wmYK+S4yo25ec7sR7UTMsB4wQ3keW42923WCAy2VhVSJTPWWS62c
 nLESr+2OMk/3x8R9El1dzH6v36RHSRSgFtqHfjc+JZuuD/5P/sjkoFw2pObIMoPG9bKa/3+Ll3P
 rVIri6/IFKM3MsUHHzg==
X-Proofpoint-ORIG-GUID: DwSLMXGMCboJ_EUrs3_vZ7-5ptZmkv5-
X-Proofpoint-GUID: DwSLMXGMCboJ_EUrs3_vZ7-5ptZmkv5-
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae0eccb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=nhBbSb_fY9f1tbuIA-YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270072
X-purgate-ID: tlsNG-16d1c6/1793125581-F74C977B-48B5FC0A/0/0
X-purgate-type: clean
X-purgate-size: 361
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27/10/26 19:14, Daniel P. BerrangÃ© wrote:
> The 'nitro' accelerator is used with a real AWS deployment and
> thus is considered to be secure.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   accel/nitro/nitro-accel.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

