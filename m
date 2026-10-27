Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04148606A31D
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 18:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mD8CnZgQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OeJDcC7b
Received: from list by lists.xenproject.org with outflank-mailman.1462441.1673450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLls6-0007ue-6z; Tue, 27 Oct 2026 18:26:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462441.1673450; Tue, 27 Oct 2026 18:26:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLls6-0007uS-2R; Tue, 27 Oct 2026 18:26:06 +0000
Received: by outflank-mailman (input) for mailman id 1462441;
 Tue, 27 Oct 2026 18:26:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <philmd@oss.qualcomm.com>) id 1xLls4-0007u8-DR
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 18:26:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLls3-007aE8-JH
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 19:26:03 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6ae0eca9-e002-0a2a0a5209dd-0a2a4504d1fa-14
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 19:26:03 +0100
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6ae0ecba-b57f-0a2a45040019-cddcb483f236-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 19:26:03 +0100
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69RIHPCq2945808
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 18:26:01 GMT
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq6aevp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 18:26:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93909014c85so17524685a.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 11:26:01 -0700 (PDT)
Received: from [192.168.69.229] (82-67-153-177.subs.proxad.net.
 [82.67.153.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a94c6d9aeesm405515e9.7.2026.10.27.11.25.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 11:25:59 -0700 (PDT)
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
	sBoNYG2/VLOCXr5s8H72Fe6tRbiTjTU85h25ejei/N0=; b=mD8CnZgQxE1oa5j9
	qoKXWXheKVZzLxGFCQd69cVdXqPCuWdkXjtlYVB1vx1TpHS4ssqwqthhF4DWGHJ0
	pvrzS9FXFH9ZIjGLBLuPqbb6Qa23faQ7wjIwvQ0CHr4TVyUctIEUdCjtiGeh27fp
	UUCi0qykQM2tjuwixbr2fuk2AVp/UwYUVoZ8+gduFzvLxTBKdLpC6pR3tM/7q2C4
	XAS+3ilcyVcxwQQxbWc/6VcuUbkm567kosgeRC1AOdYsVsLteX89eCWUAAW1YYJG
	2xB17lmoRe6Wm2/gtcgLnzc5MVnPDGHTJR3QXJpWzv/WiTRrUzm7DDu0VkE1g2zK
	HkMDrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793125561; x=1793730361; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sBoNYG2/VLOCXr5s8H72Fe6tRbiTjTU85h25ejei/N0=;
        b=OeJDcC7b/GbX/itaXNPmfwb7aoOQDrpznNnsSiwzBqgFmzVksCmdzOu6Bs0+jR5Dej
         Ts2OmhgI+bERxldq08ArtQSkSTjeKaSLxb4FhxBuEEWCgk6dCTMiSFQBMrx5q1RkeM6b
         7Bow0PYpTRO9pUuimCNR5/SieUUs/NkCNArQ/DvAyUD3HP5CE4rC1+mkZkYTM0oX2S7R
         QH2lYZk5Vo1myN7wjIJ9ZMG/9dQjiVR2XjWifrWckXcoZ+kiiA9ZiP9gaenl8BUUst9A
         KabM68KKsoEi5KFVN/Z0aGiavg4iblIS48W2tI2zlAu7+B50WSzkszbq3ogAXm4FFz6k
         89Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793125561; x=1793730361;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sBoNYG2/VLOCXr5s8H72Fe6tRbiTjTU85h25ejei/N0=;
        b=170o3w3V9RnQ3A7KOVcYqM/+amtMHwnxqGeWq7qK+4ZzrtcdNTZmmwF4zN3iAJndnw
         sG+qyptn3iSI1/VugsGSBb+Eq4uqeu4U2opEX5k87s3XpBfhVa7VXGUwKpZb2UhHRKTQ
         yiBsw3R6UbAiPrvBQXFNpCLADDGsf4U7c+NVI7zYdhWoVllRbGllzZTtlM5lTOgFq5MU
         8m+p1XtIEkJZE9dtr7Hza8PmlEVGXoY78WOClJ3lLMpDb7gzwSrorRj27wD31erP0ol9
         F2rTNe8kAfI4GKKJ3DTu9rQKpaR+XYUUpu5+q8uRdSaWLyGCBEUF2KkIU+2ZCoa1B/DU
         u4mg==
X-Forwarded-Encrypted: i=1; AKwUvBzqNuYcFHo8/9qbMjXBB1UIXMuEF7xV3xkdrDEiNwiwlXHCMYtAMANUIkNoTtMKKNmaugDPBabm8+0=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIzM/M4lAI7WCO3lMH3YghivKT0fzdVg0aH/TujO431A6aU/f0T
	IZFcCQcRLetL7aho+eI3ycJ0fTHccvUbdl5AEUQrsJhc1R769TwmZh98P6Ma0xUsuECJbMjyBL4
	e3/qePN8MC/I2jeJ/CPGCmLNbqHP/gpV1+Q4t/hMW3S5vdTyxj9MQOMIZUDsjeZ1rynxK5A==
X-Gm-Gg: AYBFou0szmuMwSBsSAUh5Z5MLWKcXSQU3+upibI+sxbdb3pieIhHzqGMML7oyqojzQG
	rZtWM1MIRwwJ5nzBWZ3sHadEDLXfxy3MomyiRCJ1ucORW0zhKUpgkDyl0Q2ZpqM8anc1/l9Zdwl
	A+ICskqRdl+CnXI77S/Qgw2qDc3QISrDMwlsc6o60WfG1WaaYsjQjlIitTyn9d7mkvgrnhc4iPV
	oUDbaDlcmYEGkxh2q/g2/abGj9CqfnRKYv+uWSjbDU/KviTYDAhf/leWUUukFi5xtAjS6BMD301
	wtK22FKkVADdjjc02hI8vaabDz+u/mKluxz0AslYK6UZEgeCWCqrThvr09NDlyd+lJiPHrj/tg2
	LGsJTmeZTyeH3oC2THYoYuU8PLWQgLDu58C+6Hnk99fuGZFELhQ==
X-Received: by 2002:a05:620a:1b98:b0:93c:6f0e:8468 with SMTP id af79cd13be357-940ef8f0788mr1681987485a.43.1793125561024;
        Tue, 27 Oct 2026 11:26:01 -0700 (PDT)
X-Received: by 2002:a05:620a:1b98:b0:93c:6f0e:8468 with SMTP id af79cd13be357-940ef8f0788mr1681982485a.43.1793125560576;
        Tue, 27 Oct 2026 11:26:00 -0700 (PDT)
Message-ID: <c5a02b34-d171-4329-b8a1-ce7562752ee0@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 19:25:57 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] hw/nitro: mark 'nitro' machine as secure
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
 <20261027181400.1752951-9-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261027181400.1752951-9-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae0ecb9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=ZVfvRXNSK-DTiSIkpbsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: r5OLTR1I_0zoMfmptNXaOuN-4NH3xaTN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MyBTYWx0ZWRfX2/60nCREqqX/
 Q7BkKN1pNl5tKvxnGezC4Py0puVoQUQ4qFAjh2jnp4CNbUNrihWCrDTyT6bAuRjn65jg+8+aSZh
 5Ap4Qr4lD0kn85GPqW/Ds3bpqR1S0bY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MyBTYWx0ZWRfX7LJqPL9qyB0+
 GogZzpq8CyoFUzCofayMvAuRbbF/WAFx2DyU1uLeLKiukiXPL9kJKUbK2uOuoKLdPHOKxaikZQr
 a/MbiF9A0J2+VMm7zaTYMAk8Lcchu8wiSR1wYTSiM2Fdl856xjfL7JEHgbEfiNJcH05wAHSCMg5
 hwOjHMQDng4Yu7mYuxaV6vkXjVyVqCTEqZ0qVxNppvu2S8hcK+dHwA2juT0XiiRKDkVZF415hHg
 nzTnDrw8bhpbEDDAMQyu5/+2wucsDJ9zb+4IZf6AZDkywOJ/1k6wDnYRXtyukx3TDusgejlkOv4
 iQwmI/JWihmTE6tvELfX4mniXOCCLvht7iAETqn0SC5LIODTqp8OF5n6e6dv8GwJ0p/s9eUONH1
 +lUW7tbtzZtauw492BeMkQyhWN0P+jOMHTR7wHPe4VKHa5f2ad/9oMKq56St3lbn7v3yr3aGR4M
 pj/1H41E9nIJsrDRb2Q==
X-Proofpoint-ORIG-GUID: r5OLTR1I_0zoMfmptNXaOuN-4NH3xaTN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270073
X-purgate-ID: tlsNG-ebf023/1793125563-C20D5B50-5F1A3756/0/0
X-purgate-type: clean
X-purgate-size: 414
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27/10/26 19:13, Daniel P. BerrangÃ© wrote:
> Unlike the 'nitro-enclave' machine which provides emulation, the
> 'nitro' machine is used with a real AWS deployment and thus is
> considered to be secure.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   hw/nitro/machine.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

