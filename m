Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B7BCA5FCE
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 13:06:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440814.1658296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDiOZ-0004H9-Mc; Mon, 05 Oct 2026 13:06:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440814.1658296; Mon, 05 Oct 2026 13:06:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDiOZ-0004Gt-Jf; Mon, 05 Oct 2026 13:06:19 +0000
Received: by outflank-mailman (input) for mailman id 1440814;
 Mon, 05 Oct 2026 13:06:18 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <philmd@oss.qualcomm.com>) id 1xDiOY-0004Gn-0s
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 13:06:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDiOW-007PfM-U7
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 15:06:16 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6ac3a0c0-8faa-0a2a0a5109dd-0a2a45098030-30
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 15:06:16 +0200
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6ac3a0c7-be1a-0a2a45090019-cddcb483a49a-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 15:06:16 +0200
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 695CFUFj2366423
 for <xen-devel@lists.xenproject.org>; Mon, 5 Oct 2026 13:06:14 GMT
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h49tvrh3y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 13:06:14 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-7bf634a101fso1539218137.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 06:06:14 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6229ce17sm3389247f8f.29.2026.10.05.06.06.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2026 06:06:10 -0700 (PDT)
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
	68/MEj2aCnTszQcG+42MXKwOQtnPqyWZO3EspYwBapY=; b=dpawgZD59/svzDvA
	5eyEAYiHv2bphtiWRdbm98p0zG4ASH7l9aodoZmPfNdd9tJZXy1OgTlyU/IBuDZI
	HMoU5QtoRKm4WWYYjGkRVIu1onMT3aNaKjFdeORaxQ9KGGWvk7g8jZ5eG9bQcg6l
	Gf3TSvWV7AFgw+CAeYalbTi18XoYO/gSdKTdMkfUR2S0/S8AGWtKTTWzthENpTrd
	LqOcWwW73dMW5+BZ2mOf3MWnIBjri23EfBFOfeg9ZkxvyelGJkDLQekPerJpZoBv
	v7glvw/Dat37P7uQkZJALSWGl7jvLJKVjZetBltp5/j/4JRQq2KXoeQ15N3aX1xq
	ar9oeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791205573; x=1791810373; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=68/MEj2aCnTszQcG+42MXKwOQtnPqyWZO3EspYwBapY=;
        b=cmET0Lto1Zye2oggOJEYM7MrorBL4rN4uU4GW+oDaZNEj+JGfbOprwI0MYkFBsXJzc
         qvPMEShKkaQUI+hWhFeZk2hTi7UaG80ygrUvoFj9XCk1jWlvildsR5mr6La7Hco2j4JO
         JYJY+tfFN/ZWHCFYounnwhgbLCb5u6o31hlv78QJKoKShs0Cmi65vv4bS0BNej1hPWNQ
         mdHT7QeMnxltJsSkfQ1UyazytEtbJI6e6QazSCnH/f1ad+Fy+0n8DaD6W5WoAWI/Ki6q
         y1Bvy01xSka8dW8iaQhzjrhBX/0PDDoPj4BqAv4L7cSiAkYhK5vaSxyX6BTDZzuaN0vg
         EEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791205573; x=1791810373;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=68/MEj2aCnTszQcG+42MXKwOQtnPqyWZO3EspYwBapY=;
        b=s5+5cZbwAnOho3T4w3ymIzpJ4T0/BOO9DEmP+E0+Gu3dFrjlCcJgCeZxCXTa7kUaEw
         zma3gH4vyQtXC/tRzJPu90+DlQ6OeaRxN0YMKGd6A9dqWAymP4cNbyVqFtiuHx5nhHbx
         pCbFghu4YzpjShI6S2l00dEj95GNc1jj7d+nS17zlymlJ35RLbybzpEcN1M011PqGbcx
         EazWL+dCJ7UKEzdUc1XtbMyXUTX31oQp+tWQurFCRHXPKGpzpPI596bieJ2PMgktZnyT
         w2gowbhMGqPVj5sN3V2h/u3pVYp4Qdm7Z8+3PlRiH8LCIVvCRcb6aTheqIWxeFdRQ2dx
         KU3Q==
X-Gm-Message-State: AFq9FYLrlkVuN7y2BB2+2AiDTHsUkAgIzd8dyeNxQmEy17vcOoLOqG0j
	31pDtkZf+ow4OplO4iFE7X58eQfQqkSEFntafYy20mMhhZZlFFmq0WnCcdpGtZ+qzTbxtFaczdE
	N3mnQGz8ZcQOxORg4rF41qek/dOp5zUQmzuKijm/e/47X1zGcS1BhG0AeeSe+9O1By0BoxA==
X-Gm-Gg: AYBFou1vpZeitFVZ2SJDR38DKsZAZvrDRO5xZ3y4BjNVSHnsCkY2gue1CjeJmOLpW48
	SQD41uzPdMYQcjPlQYvmb1AmYKNgz8789cUZ53FGloEioK01wkgeq6K71s4JUEFjf0n43hVZjJv
	QR8sTgZYjtSduOgkHS+ceT0Vo+qrVADls3qwtEP1rVsl/aGDkW/PU3S65VB3WyhsRlCciKSzqtb
	O1xfiQz9ADs/5o4KRdtNLilCJtoC2/IOIl/fif2+b4G/YWzKPjmJmMwoOQwMO1Hk+e54tMdNuQU
	pDQ9Ej3KZfCtiTgaN24fILOc/AApJEM0gd2pIJ26i+y2JTJ757cw9JwmReZAeMP3+aljDtBhDSh
	DPn67QRoH2OCCNFlIjbGVc0LN1aGmHz6ahA==
X-Received: by 2002:a05:6102:148c:b0:7bc:696f:a5fb with SMTP id ada2fe7eead31-7c0f5baadd7mr2929698137.29.1791205572734;
        Mon, 05 Oct 2026 06:06:12 -0700 (PDT)
X-Received: by 2002:a05:6102:148c:b0:7bc:696f:a5fb with SMTP id ada2fe7eead31-7c0f5baadd7mr2929564137.29.1791205570734;
        Mon, 05 Oct 2026 06:06:10 -0700 (PDT)
Message-ID: <f1481bad-4dbb-414c-801e-aa24a6977b18@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 15:06:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/28] hw: mark secure machines for x86, s390, ppc, arm,
 loonarch, riscv
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
        qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
        qemu-block@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-2-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260911143627.2743803-2-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aN9lOr9m c=1 sm=1 tr=0 ts=6ac3a0c6 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=20KFwNOVAAAA:8 a=tVdpVsJRxwjYG60tULUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: SVPfH-1JGxmdFt9ZARadIm75pUNQ4Jo8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA1MSBTYWx0ZWRfX387B4Avl60BS
 9h4Qya0tOI+QOY/XtqDIvR8o5h6FX2J47k0SdCz3PP+i6kBDrzKZPRKFpJGgq2aiNbniginY/E9
 10kYuKFcdRmf4FOLjM2jjR+OSH6KiFzaGxe7mgmXF0BhNvStKzcNnnqYeGb6Nj8BUSryEnR/DAR
 7GHQM/t81oHoZxUWofPe5BAEAnnSnhL4ot1Q8LpbkxvtxC2sfq5eVR/+Igj7/37nFeVplFpexJd
 eWYyA3zZrRiHO2WWoRk8LyEP2tSzV1dcoN7MVKEryfbLm9kyYxalvMoi2owVSIep+PF3g3hv5Jc
 qgk+Cd352LbtyPsvHMNcj4iAwZuqSnoLiNAQCaqjtWTQDjjJUqR9Bh0t/Lx4aOMompZ6G0zMuCn
 WkCzYa6wxmnP44hz1Y1Z3Dz9vrUsF5byY8QAS/ptPJB2HfxM1zUdYIVsKHoKqS6hhTs6UEv4rYn
 jHhjEYWcxJaDpMEcp0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA1MSBTYWx0ZWRfX0tmN8eUip+1V
 QXAjUg0badUcBrkmLlkAvvnYQETEBtSl9uq1IP/OVBGjanbsUg/ufbephUWdECv1ZMNBlUkdM86
 0+nb2z548dgoVZbSzrrOw7gF2beECj8=
X-Proofpoint-ORIG-GUID: SVPfH-1JGxmdFt9ZARadIm75pUNQ4Jo8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050051
X-purgate-ID: tlsNG-bad1c0/1791205576-FC610034-EBAA9B3A/0/0
X-purgate-type: clean
X-purgate-size: 1361

Hi,

On 11/9/26 16:36, Daniel P. BerrangÃ© wrote:
> The versioned machine types are typically present for use in
> virtualization use cases and can be expected to provide a security
> barrier. The only exceptions are the m68k versioned machine types
> which are only used with TCG. There are also a handful of other
> machines declared secure in docs/system/security.rst, notably
> the Xen machine variants and microvm.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   hw/arm/virt.c              | 1 +
>   hw/arm/xen-pvh.c           | 1 +
>   hw/i386/microvm.c          | 1 +
>   hw/i386/pc_piix.c          | 4 ++--
>   hw/i386/xen/xen-pvh.c      | 1 +
>   hw/loongarch/virt.c        | 2 ++
>   hw/ppc/spapr.c             | 1 +
>   hw/riscv/virt.c            | 1 +
>   hw/s390x/s390-virtio-ccw.c | 1 +
>   hw/xen/xen-pvh-common.c    | 1 +
>   hw/xenpv/xen_machine_pv.c  | 2 +-
>   include/hw/i386/pc.h       | 1 +
>   12 files changed, 14 insertions(+), 3 deletions(-)

This patch should be split per machine / area of maintenance,
so maintainers can officially Ack their commitment to security
boundary for their machine.

I'm not sure LoongArch / RISCV / PPC are. If this was previously
discussed, then pointer to the public discussions should be listed
in the patch description.

Regards,

Phil.

