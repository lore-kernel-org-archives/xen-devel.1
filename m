Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431B5CA5FCE
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 13:35:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440852.1658351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDiqK-0003DT-1V; Mon, 05 Oct 2026 13:35:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440852.1658351; Mon, 05 Oct 2026 13:35:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDiqJ-0003DM-Tk; Mon, 05 Oct 2026 13:34:59 +0000
Received: by outflank-mailman (input) for mailman id 1440852;
 Mon, 05 Oct 2026 13:34:59 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <philmd@oss.qualcomm.com>) id 1xDiqI-0003DG-TX
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 13:34:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDiqI-002cuw-A7
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 15:34:58 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6ac3a780-2eae-0a2a0a5409dd-0a2a4505975e-12
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 15:34:58 +0200
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6ac3a780-4cb1-0a2a45050019-cddcb483bc36-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 15:34:58 +0200
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 695CFUJZ2366423
 for <xen-devel@lists.xenproject.org>; Mon, 5 Oct 2026 13:34:56 GMT
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h49tvrmwy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 13:34:55 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-7c07f9547d9so401795137.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 06:34:55 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6773663dsm76912f8f.4.2026.10.05.06.34.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2026 06:34:53 -0700 (PDT)
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
	LZ4EJ7lmFpUwukMRrcGizDRsY8ibjTYc8PvBHvmSrfw=; b=CWQVOJdDOTDPbH1O
	NfS9xAxzkpQCdSPPWEAKqjJ+nmQuGnkVpn5Bsynp24goBkSvPYxdVo/R+VFxnxn3
	aCj0S9Z1pgbzBwyAo9eKwPSSP9pnb1vcS2TssOYQOeqor1PFgl9QQxQFIWFI+3xl
	lfe79WT/XIu8gZ8Bl0E/xoWedZMtuBnaXxeaCKjkvZEmebGQJWVmrC1lvMPxgOvY
	QP3M4CZVcyN3HhF6UTwTuXxMxxqdlpKPUyg2IwaJStcRb695yBuKn+yjAHqgAZOA
	j+DOAHHxJZxn03PWrRi3qpJ+KvvHAEFfYSztq9B5k6KKngyanNW8KRoWT+KQYzOz
	x3epNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791207295; x=1791812095; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LZ4EJ7lmFpUwukMRrcGizDRsY8ibjTYc8PvBHvmSrfw=;
        b=cgrL202gNmDO2l9BCncsrxxQYBvtT2hLY7o+VYnF/M7/xR8Rl33xLY4KdVwG3rKlEw
         FBTPDY0TxSB/oZaJAIgwoiEjQ/RRdgmtvI9l39pwNpJTtHMK0Id7hnmWWNPZZs3YA/Ko
         ASxZs+uyz90vE987J4FgKDz7SB7xDsT/6ltSXeuUqzoUQW1UWSnpyk/zQrw1oDYRMecu
         9Kb+72b6PLjON2SqIlPBobSIl8iDkoVtiJkepBSox8avtjET/n71j8KRsFvVuIu2697i
         ARdhMjNmoJJ8ZefkG2G30hOiQ0qDLWTBVO9TW62hiHa9KqUB+Xx9iXnjGMBcvpQvk0lT
         AsmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791207295; x=1791812095;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LZ4EJ7lmFpUwukMRrcGizDRsY8ibjTYc8PvBHvmSrfw=;
        b=Sw21Ryv7N96GRa8MACMjGrMkYmKZcI5hbWggpnKzi6VEUsKIL6UCIqKtL1Hiu3i7Dt
         yt8NeQW+mQBX02JaOpsfs7HQuOxhMfZotNvlP0PmoboIpxXPbTYycPIdsOekAmQjyjSw
         lCaJAzrRwxT9wCFsj9oS1LhPdiZ3A9YmKfpEHA+i2NY0vZn/Q1gHmSnJ1fXpEWNQ9lEB
         lyfdITgHkbwGPcjJ4P5PKyuuHy+IYO8cLvwN+19dzg+hRc9hfADSEDBqAcUHaKt2fgAf
         +xG5xwmIa7+alCG0QUTfKXtwIJCBlC89onhQTvJlf50RcBzY1afxx0m+vr6tUQIDinIu
         oKWA==
X-Forwarded-Encrypted: i=1; AKwUvBxlLgs6ZnSFxkc68T/W6E8+XjhDEQKB3YkKaCJMvywDOZO1MWo5yZZw6oBrxaSpo3cSCJfW+8uo2VQ=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKBxePF3/jh1ES1bjuTxOJ5rIWK/XAtplWFJ4vyUbMTHB932e6j
	nEfrbqm7CHk7pnNp23H8QeCeF0f0I86M7aYZtIstL0ZmV+3pSbZcBUshm74W/W4QkIM5fHWwC4j
	C+B2cuR644tkjS4IyO9W7RkvsLzELZ+P31K8HBq2dtqTW+bPd+TlzY4/Kmz5ZbmsdSNLr7EB4n0
	wxot12
X-Gm-Gg: AYBFou0UVvtSDe/1tg7/Oo+28WPAgLVzCS5ZwjT5rJlTkb7hWTMEgfWce18tD8eXxd+
	T+aROhcHCC9qU69vNAa+NqTgRquF/GrBzs03O3ehnSVfzDNzaoCwrDyuTXVT2yw0o7Tm8VIYsDO
	+dbX9RS2Cz7K2sT3QIxuz90t6kkfxyzyP9jVj3TFNe5hoVMVLbVGmnO0uyTvVbB/aiCrjoXmDd2
	M9fc9r9/RkoZYwHBjo701FkuIRrPJr+dOUj6ZH9Ze2OxHcOJl2gri1w3Y4PsInsryqTAohq0H16
	Tj9HFev/HS1xgGl5ktdom6QU/QDkKbZ4skLb/7BcRTj/CZruObkKzEdFxNFjmme/uY6XJiqOp2x
	ELJf/gvZEYCThrnnhcvOBHLni73wvHRAEpQ==
X-Received: by 2002:a05:6102:91b:b0:7c3:881f:b620 with SMTP id ada2fe7eead31-7c3881ff813mr919263137.21.1791207294828;
        Mon, 05 Oct 2026 06:34:54 -0700 (PDT)
X-Received: by 2002:a05:6102:91b:b0:7c3:881f:b620 with SMTP id ada2fe7eead31-7c3881ff813mr919248137.21.1791207294089;
        Mon, 05 Oct 2026 06:34:54 -0700 (PDT)
Message-ID: <5e64e1e0-d733-4f8e-98b4-8e6b554101b2@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 15:34:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/28] hw: mark secure machines for x86, s390, ppc, arm,
 loonarch, riscv
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
        qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
        qemu-s390x@nongnu.org, qemu-arm@nongnu.org
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-2-berrange@redhat.com>
 <f1481bad-4dbb-414c-801e-aa24a6977b18@oss.qualcomm.com>
 <asOk6i4CNT9P6Bs-@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <asOk6i4CNT9P6Bs-@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aN9lOr9m c=1 sm=1 tr=0 ts=6ac3a77f cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=ID6ng7r3AAAA:8 a=20KFwNOVAAAA:8 a=CtHk5BvZtinuqIhR7bsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22 a=AkheI1RvQwOzcTXhi5f4:22
X-Proofpoint-GUID: wJNUQA_ZuX9-U-eRvN4Gh0FWOJMFy4v1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA1MyBTYWx0ZWRfX1rXnyRWVqVMq
 FRLRTD38rJln3dFPLf4f1O+VzI/5TlJVmLvlORM135ig7Rz55XdPPN35/rFZzR/RJFyX/JFLaN8
 jQp829KplJjSi059+ZEPMCVQLlJaiS8PiEmQwVaiXjKnEtU9Qdnbet3BElivPhuwYUdbv+YCoUp
 kETZdlhc4oux16hEVeBOMjVIkt1sxUXA0Vguw0YwjfFzGW0p/J2aER+0QveG+wZkCtkVxUqf3Of
 Wh2a7Ozrz9msTktOOKag7wJxUy/Dm8CJjUmjKnE69GM5COko8G9bbTiyr0KU+L8uQdQR4ef2eBE
 qExiFJJT+P4n/HeAPKBw2JXHm0D0yxlPfqumJLjKSdTYKMK+YTehWtT/iEMeVHl+9xaylJZm32f
 8qNqoj67Nh0+pDaBnaUKqzrQFtZ7wCGIqgGPm7Tbu6kOh3W/F8TxDJbaXu9/xOFlmVr7enkMKTT
 NsZIlKY/0pyte3OB4dA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA1MyBTYWx0ZWRfX6iq0zio3q/Yt
 IGjjMOSdB09iM9wGbbrQXfgsK+ImRLXamGolkGPk1wKbneOOFctBV91Lbd5+C+0XjiNeZi8Ieky
 HK7mLf688O0Ji+2Q+eoZelzJ+gF/WI4=
X-Proofpoint-ORIG-GUID: wJNUQA_ZuX9-U-eRvN4Gh0FWOJMFy4v1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050053
X-purgate-ID: tlsNG-c201ff/1791207298-F7CB82A1-EEE0E594/0/0
X-purgate-type: clean
X-purgate-size: 2184

On 5/10/26 15:23, Daniel P. BerrangÃ© wrote:
> On Mon, Oct 05, 2026 at 03:06:08PM +0200, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> On 11/9/26 16:36, Daniel P. BerrangÃ© wrote:
>>> The versioned machine types are typically present for use in
>>> virtualization use cases and can be expected to provide a security
>>> barrier. The only exceptions are the m68k versioned machine types
>>> which are only used with TCG. There are also a handful of other
>>> machines declared secure in docs/system/security.rst, notably
>>> the Xen machine variants and microvm.
>>>
>>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>>> ---
>>>    hw/arm/virt.c              | 1 +
>>>    hw/arm/xen-pvh.c           | 1 +
>>>    hw/i386/microvm.c          | 1 +
>>>    hw/i386/pc_piix.c          | 4 ++--
>>>    hw/i386/xen/xen-pvh.c      | 1 +
>>>    hw/loongarch/virt.c        | 2 ++
>>>    hw/ppc/spapr.c             | 1 +
>>>    hw/riscv/virt.c            | 1 +
>>>    hw/s390x/s390-virtio-ccw.c | 1 +
>>>    hw/xen/xen-pvh-common.c    | 1 +
>>>    hw/xenpv/xen_machine_pv.c  | 2 +-
>>>    include/hw/i386/pc.h       | 1 +
>>>    12 files changed, 14 insertions(+), 3 deletions(-)
>>
>> This patch should be split per machine / area of maintenance,
>> so maintainers can officially Ack their commitment to security
>> boundary for their machine.
>>
>> I'm not sure LoongArch / RISCV / PPC are. If this was previously
>> discussed, then pointer to the public discussions should be listed
>> in the patch description.
> 
> Those are explicitly documented here:
> 
>    https://www.qemu.org/docs/master/system/security.html#virtualization-use-case
> 
> so this patch is just encoding what has already been defined.

I probably missed when this was accepted, we are good then!

That said, 1/ Nitro Enclave are missing and 2/ this series organization
is not easy to follow to me: I'd rather a per-machine approach, with a
'info qom-tree' output justifying the devices, then finish the series
with busses-based devices expected to be secure. I dont quite follow
this approach. I'm not asking to redo the series since it is already
reviewed.

