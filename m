Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9BE606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 18:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mhWx35R6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HzQKgl7I
Received: from list by lists.xenproject.org with outflank-mailman.1462451.1673468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLlsb-0000Iw-PW; Tue, 27 Oct 2026 18:26:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462451.1673468; Tue, 27 Oct 2026 18:26:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLlsb-0000Ip-Ma; Tue, 27 Oct 2026 18:26:37 +0000
Received: by outflank-mailman (input) for mailman id 1462451;
 Tue, 27 Oct 2026 18:26:36 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <philmd@oss.qualcomm.com>) id 1xLlsa-0000Hl-BL
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 18:26:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLlsZ-0057Jy-O7
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 19:26:35 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6ae0eccc-2eae-0a2a0a5409dd-0a2a4503cfc4-8
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 19:26:35 +0100
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6ae0ecda-fae8-0a2a45030019-cddcb4834744-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 19:26:35 +0100
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69RIHRZx2639301
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 18:26:34 GMT
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5tt5t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 18:26:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93f322ef7d3so17564685a.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 11:26:33 -0700 (PDT)
Received: from [192.168.69.229] (82-67-153-177.subs.proxad.net.
 [82.67.153.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a94e6b8656sm23975e9.10.2026.10.27.11.26.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 11:26:31 -0700 (PDT)
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
	5gtNOSL9DkqGrvLv5HiCmciZ411PQzVsYtj0F/yuWWM=; b=mhWx35R6EzRfQjVN
	1xH7p7SD7YTepkSQKvJRjnJdAwgY3XESWxBjR4e7n6msb3JPozQgoQDg0IxUxvi9
	hh1y0NovGCLazoZMOvJYn2VAHMfRpp6z5/xUwqSWFKtr/SwyQiyWAJkZ36GJbrcZ
	tjsFwvJyI61eqNejUo0z1ji7yPaKzlLipLt9pj3r4nEbWVn/Fzz09FJXK9JSFAbZ
	ZzwCiBOs6tcDrhMUPVudgOC8nrmUw8KJgoNXP6ql2E1i1/5zSNRRCklwLpyCRxdA
	XYxo2Z62g5QP2nNWOWLa+A6cCrxb3JWGzPLY6TIq1iZnyMlyQiHezOf0cPJEU92M
	nJptmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793125593; x=1793730393; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5gtNOSL9DkqGrvLv5HiCmciZ411PQzVsYtj0F/yuWWM=;
        b=HzQKgl7IL0bLB1kNurWRrKRG6ENY4OZxmGOWOaC6GTaU3LGh8oUi4ME3ypKsZIkTOQ
         2UtJv83rAd5V1dPzxtYsiVLREJCW3NzkrNhabsMo7NFlpuQLOpTyuuHetiBBBKlkMAVU
         ddF53yOIQD3+Ou6FDh3yl7oZe3JuW6rcuexbiDbONDfFxNDXaWe1WJ7wXNH4xIsSHuQL
         4MEqek8j8U3FdK+NR/cYRFhu5RaBq36x2dRyT/PhJ/ra1NJL9norsJvOz1CFK5LGqFWT
         kWPP6ZBc03Qife4ojO0YQJ9I4NfQwvBT9pbHNIHf/gejPQfrdzXsC4tkc1eNVuLPF618
         Md6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793125593; x=1793730393;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5gtNOSL9DkqGrvLv5HiCmciZ411PQzVsYtj0F/yuWWM=;
        b=OaK4j3mgGiURMbgihFfhiiPDbXDCcq/ne6B926pI+7NmNhyfLAo0FBg7GA+bcJMrPk
         KIPjG3F9HnKO5MenGPZj+QPdZ6DA1DH4oSK39H5ZgjVJtKrGk8K6uNRecKJM0M62BEa8
         5sHajERTFStBz1cpaSr5yhTbYIjjMEVSMB2ZXxvf4bbnxH+37Mi2zx2+0YX6a8Lotose
         BQhEpj99uJMJXxZniGicfHyabW4z9pZE2pcrWTccnfBVPGw+dzGJN/whiYM59ukmm+vt
         6ObD1mvI/dtL4lWYrD0Il8Reh1yH2kfqlJlWGs3qUxN37I0xFbwLaSLpoMCM9B54R61v
         mPfA==
X-Forwarded-Encrypted: i=1; AKwUvBwNBuM/pNn4vUjlqW5w9F7Bt5ZxLUzCnGPENTGlFohJm8zZwZ1uWBQhgbHQTq6KZcG2eQUYJXdFaxI=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIaXCzFqJJJWU11p8VGJmoeEtuuHM3xM3BrwcXD8/pR9wOBG9+w
	es10K/WVY2lXr4BT2pOTEloUARXBl+IVb7cf0D5iidrWcr7hchGvCsyv+hDN6+jcYoZX600aXfM
	zxeNihOqhzC03YLuE3PWDaI5P2fJXP7Ne6BrHOhYfRbSOYO6+9g2fTk1jlDpz0hGt+T1gxw==
X-Gm-Gg: AYBFou1Ern0A2f8kx3QQbpR62F9vFne1QmJpUl/ofkiUMfFl4X4H7J+qCPYiIBvars1
	Av2XNPrYpjsV6d4+lJcTnaZfkVI+07TgOMKamc0DPbuO9hMEnqH40m54ZXVdNeWLL9xqvpaBVld
	eCS7itbYvtXTmEimQDw2avULGKAg0eWKmkjm2WE7TdTOHL2GOUjvKFhLiKO93tDfXeJqgvm99fa
	OH0tB2CYzEs1gJKLXrqlN1w8nOrN7VHKZ5fzISL/bZBdF5v/BY4AGnQuExFuQlDRcYt5lZ+6qoV
	fK4Kz/a4ICHkozk4wwkrDTFrSaVNICCYJN94o5Jpt/ZTLhQnmiTt82n6ns5QFG1BNFn+85c7ky3
	vEXMSP2Vm8xNXmuA01oABVqUYKQSf9OoN9V3UdE15OeBSNQ69TQ==
X-Received: by 2002:a05:620a:2b4e:b0:93f:24c5:f561 with SMTP id af79cd13be357-940ef9457cbmr1583431785a.33.1793125592760;
        Tue, 27 Oct 2026 11:26:32 -0700 (PDT)
X-Received: by 2002:a05:620a:2b4e:b0:93f:24c5:f561 with SMTP id af79cd13be357-940ef9457cbmr1583427885a.33.1793125592323;
        Tue, 27 Oct 2026 11:26:32 -0700 (PDT)
Message-ID: <5ca7722a-cd6d-47eb-b8ec-4c93ef4d4699@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 19:26:29 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] accel/kvm: mark kvm accelerator as secure
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
 <20261027181400.1752951-10-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261027181400.1752951-10-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MyBTYWx0ZWRfX55QNVfX78GiZ
 Xrx/yMNT781snm4NwEv0oH/GmXaJMBYn0RuEdihFi3GU6rBjZszRyQo8omsrbJojDZrHjpNo8Gv
 EzsqmDydapDAWJwLsVEFDec15+ubWho=
X-Proofpoint-ORIG-GUID: Z_hKpElPpi61y3DTO9m2mXsKRqDDwO5B
X-Proofpoint-GUID: Z_hKpElPpi61y3DTO9m2mXsKRqDDwO5B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MyBTYWx0ZWRfX7K5cakEiReow
 LSl99XZKqjqr0vh8UFtNZGGe/onFfcsBeM/vRLmZTlpFxZKnaP6Kbf6XwVJn4VoA90V76COmu3v
 01CsSOsD4g2sea1EduSUDNLKZtKRGc05QRJu5A5FzaeNuTwXeRN+wp1aEG++EeQxpwi9KIdmXJ3
 /sjV6T427E45RvppjknbgT08AyIvAGP1HpJJlkF+85/khh9KGa+x/ddiGq80j+FMmUG+c9c9yeJ
 v3AV7e/kjFGSdNmp0vN2kEzsqtcZekHVfnAurmU2R++SLtNB5cwAtNVZxVtrHkGt0Mvl+dQxtGg
 44zUv32oR41zzglGH8Rwkg6C/NsqUFfaa7REqHbqs9gF28N4FPEEbouuWPLxmbFISc2z9KDfHOU
 vzAsW/SYCvAN92+ReVCIWyWnNosxiLFbIJ9m8ZgWx6GHjTP650mNpIxcGOpA9KtOvA9n5IK+x9K
 aieS3iOCgeRWcFngrvQ==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae0ecd9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=R0rOnUjNbK5cqpqgS9oA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270073
X-purgate-ID: tlsNG-33051d/1793125595-6F4C74E9-63965E81/0/0
X-purgate-type: clean
X-purgate-size: 419
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27/10/26 19:13, Daniel P. BerrangÃ© wrote:
> KVM is servicing virtualization use cases which must provide security
> and actively maintained.
> 
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   accel/kvm/kvm-all.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

