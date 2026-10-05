Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCEA5CA5FCE
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 13:26:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440833.1658322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDiiD-0000M4-Nt; Mon, 05 Oct 2026 13:26:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440833.1658322; Mon, 05 Oct 2026 13:26:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDiiD-0000Lx-LG; Mon, 05 Oct 2026 13:26:37 +0000
Received: by outflank-mailman (input) for mailman id 1440833;
 Mon, 05 Oct 2026 13:26:36 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <philmd@oss.qualcomm.com>) id 1xDiiC-0000KI-7I
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 13:26:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDiiB-00Cdqv-GT
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 15:26:35 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6ac3a586-2eae-0a2a0a5409dd-0a2a450287c6-4
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 15:26:35 +0200
Received: from [205.220.168.131] (helo=mx0a-0031df01.pphosted.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6ac3a588-6ca4-0a2a45020019-cddca8833614-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 15:26:34 +0200
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 695CFNAE2849519
 for <xen-devel@lists.xenproject.org>; Mon, 5 Oct 2026 13:26:32 GMT
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h49u40pmp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 13:26:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93e834ff4d0so33477385a.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 06:26:32 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c62270751sm3609856f8f.13.2026.10.05.06.26.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2026 06:26:30 -0700 (PDT)
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
	UVgGfElQqq72YJB4eDFJMKlG7GcShx6WHC77Em6o9hY=; b=ZC1fHKHV/qsoDmPj
	FDfEtTM1kmRRdSaeBGnLzA4meN1RJ8E2t9PCpmuXWrsF0YZ8A8XK0Pb3cIegUwc8
	OIUPAs6axekii+F2WtJvHLCihGAbNUuLvzsXQ4vTJhgKA1NfGuIfkF25mZRF/PcW
	wmyTMqR4bxOe1lNa1FA1DaDeHLw2ad2EMSxZjfrF9QI8mBWttvQPxICfcJ/MDI8c
	fJj0o5IemJXEcP+R84/ouKMskWPiIdJmOLuR8bCYs/5SAjR9F+CvElb5JNZ4Koqw
	4ho2FY/s8yFn2TE6go/hlxpZsyOK6GuzlQnexSTC+GO+8marjcIkhl28Tnuu9Aqx
	oNrVOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791206791; x=1791811591; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UVgGfElQqq72YJB4eDFJMKlG7GcShx6WHC77Em6o9hY=;
        b=Be2pi5JKbSYmRuRBNSM0AnpAdI8BRP7E+mqPEElWG9Mu76raA0RwyavHuNO0uAwrn0
         YoUtxyUf8cgoXmOV3I4MSbELmG6L06EhKEe7KVcFuOHQ8biTphT1Xg8ZFE0VrDgEIrKk
         TV9J2WXXk9z23yZ+CnxepLVVqDcQEAM4cgA+T0vPBckdysm/goJSGpFrPui7nFo6I+Qu
         3t1sJbx2Fv6HMQAAHpHCqJ0ZQzez6UQGp2yUTmvamlbANobiptMZnmtmTSaSaDpqGSHC
         hCIs/TVkfaznDHhCJf47OK7GqZ6QpPr6mnbw/oZ7csxCLv96u/eCdY+xiBh+3mXQdo+k
         GbwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791206791; x=1791811591;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UVgGfElQqq72YJB4eDFJMKlG7GcShx6WHC77Em6o9hY=;
        b=PE/Gnjmj8TDurlgJTjpGOibmDCmbI0XzZIuLxo8jcqi3svse4cziwYQlu/ryRRxDhv
         8mXD8N+AI91NtmLvfnhBdkq6JptiH+9VquXWm9n5d8ZGyn181MXPRbzeEBWlaGtHq4lH
         9feh+SBTzSZeRkGQP/0pIGkfGPQwLv4GyZfH6YAf/e5XWAdh0wgKDhMFCUYcXyRnhLd6
         S5wcPp5q61/Tt4EUQqnozto6VE87RHJYKQO0gj85uEPOjD7UftfhORfB+33iL5B6qnxV
         F+2gHI9pYZbyx5hYXV2jk3Pe6cwDEQpHjMDvOgKJefjHnLffHUhyreUDpKSb+DOGYYTc
         EubA==
X-Gm-Message-State: AFuF++kUDJhZoTjZyVz3AGnbbHeauac7sbcbEZYtADAWwgRKqxMqdc12
	Z810wj5+ePOMvrvBDr2iXe1k3kcuEUjJifXCnabJANIiwFOVEgmtSRB+o8uR9P3CacYA85TJuvq
	MECiJjVgAQBAWx25ljTvjlQ0PAdwEbpzzh+nobyVIe2sKxIPnfZKVlEUtyltSp7frVJmN4b1F3c
	56Jd+u
X-Gm-Gg: AYBFou1KiJSvsAt+wQlCJfNPCVGmnHUQYNLuo/OAGounZowHdT2NxZuQOHbg705B+sr
	DQdTcM9uEytCWosrMey0MBY+lFCDm+bzP/uo/VhyxEsDK6DbxduSfWkN9/vXZeBSgGsHftHPOO9
	OCizgGXDVF4nIjJB2ZYa7zJIJGRDRFFe4xj0G3mzkikfWd/YtenuzoeLsPklhzh6vhiO7Dhm4dW
	SuwRaFiyzrZ5OtlGhnf7yoIGvNb247rP3pGy5NG90yI72mKrx2jKCPEyM0y2uI4sZ3hblXYqMZF
	V8nM1RvSMYe+go1sQaj6M4LIV1gx24Kktl6wBPMkVD9M+U0fVQrPzDcySwC5rwaM7lOGDb1Fdnc
	XnLhqd08lichGkfurVeNpmipXkBUcDCKBtg==
X-Received: by 2002:a05:620a:90ca:10b0:937:d6e8:59b0 with SMTP id af79cd13be357-93ce7c145d0mr1342533585a.10.1791206791322;
        Mon, 05 Oct 2026 06:26:31 -0700 (PDT)
X-Received: by 2002:a05:620a:90ca:10b0:937:d6e8:59b0 with SMTP id af79cd13be357-93ce7c145d0mr1342528885a.10.1791206790784;
        Mon, 05 Oct 2026 06:26:30 -0700 (PDT)
Message-ID: <67742103-9b40-4c02-b297-e5d46d80482b@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 15:26:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/28] accel: mark kvm and xen accelerators as secure
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
        qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
        qemu-block@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-3-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260911143627.2743803-3-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: c3xTJ_Qbxzoq3sBxTpiLO6H0fzXwfP1P
X-Proofpoint-GUID: c3xTJ_Qbxzoq3sBxTpiLO6H0fzXwfP1P
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA1MiBTYWx0ZWRfX8Hd0CVC/vmrY
 Ai3bB7EJBxuZzHcL5X1xsN/X+P33mIeeLphik1R5JTNMDr9J/D8ogWEukNM83i/9fhXxQWx+Yi4
 B8lGmxu54YFy7+dNLpUGwbWVaL4YSw4=
X-Authority-Analysis: v=2.4 cv=LuEHWXdc c=1 sm=1 tr=0 ts=6ac3a588 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=20KFwNOVAAAA:8 a=ft2qPWJe3-GeceLKO5gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA1MiBTYWx0ZWRfX4Gv6jx3wJOQL
 q0w2LdW0HuLZI5Ar78pxadcMKH28ekGJ7zVP2S+Xk41NHHwzopQNTirY50KOQO+iL6LnlZzLAom
 +dcc2pKEQ5ZnCTq3B06sUBBXirWNtfpp6/lSl3Xq2ZRyA86Emvj4+jz5U2hsEK/HYcHLTL/YEwT
 EfWFjrNpiT3oIxNx3eY1V8O/suenMr6j130WIBLvILWH7RV+vdfAhkxqWQJkhJQQ5OnJLx7Slp6
 +TBjFTGqd/wANRnM+AVVicV02P/B7Nt3Gr9GnuWFEJ1UBcuFx6wmB2xNC+kXCbjeYRKxjq+rsBK
 HvXLo1eWd62yuAgtf1MgHI61I7yGOc9Gq4V2R5fll5ZSmAR59OQ1JrTJW1CUIvGbzw2ujzkhLqG
 6W2AYM/9nxtApebHlQGiu9S1yTDoE7gukEqjRCfC/N3w3VDsO4jGJFFrv9gulVj4POdb/omjXhv
 iB//WBrEyfhFOgN3TKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050052
X-purgate-ID: tlsNG-720697/1791206795-F32B12AC-0BC2C3F3/0/0
X-purgate-type: clean
X-purgate-size: 947

On 11/9/26 16:36, Daniel P. BerrangÃ© wrote:
> TCG is too complex to be considered to provide a security boundary
> for malicious guest workloads. QTest is only used for functional
> testing and thus is not relevant to mark secure.
> 
> KVM and Xen are servicing virtualization use cases which must
> provide security and actively maintained.
> 
> While HVF would be in scope conceptually, it is not sufficiently
> mature or maintained to claim a security boundary at this time.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   accel/accel-common.c      | 2 ++
>   accel/accel-system.c      | 1 +
>   accel/kvm/kvm-accel-ops.c | 1 +
>   accel/kvm/kvm-all.c       | 1 +

Maybe split so maintainers can Ack separately?

>   accel/xen/xen-all.c       | 2 ++
>   5 files changed, 7 insertions(+)

I think accel/nitro/ is also meant to be secure (in patch 6
you mark hw/virtio/virtio-nsm.c as secure).

