Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FEBCA5FF0
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 13:30:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440840.1658332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDilm-000219-6e; Mon, 05 Oct 2026 13:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440840.1658332; Mon, 05 Oct 2026 13:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDilm-000212-3z; Mon, 05 Oct 2026 13:30:18 +0000
Received: by outflank-mailman (input) for mailman id 1440840;
 Mon, 05 Oct 2026 13:30:16 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <philmd@oss.qualcomm.com>) id 1xDilk-00020w-Hq
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 13:30:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDilj-00BEjA-9G
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 15:30:15 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6ac3a660-8faa-0a2a0a5109dd-0a2a450ac9d2-40
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 15:30:14 +0200
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6ac3a665-f2d2-0a2a450a0019-cddcb4833af0-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 15:30:14 +0200
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 695CFXF3914119
 for <xen-devel@lists.xenproject.org>; Mon, 5 Oct 2026 13:30:13 GMT
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3chfkwj9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 13:30:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-939c30aa9a0so184299885a.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 06:30:12 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c622bb17esm3500119f8f.45.2026.10.05.06.30.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2026 06:30:10 -0700 (PDT)
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
	/iCgxSwi3RoPvij3TTorlI9rkpxXQmuhLqHpTg4Dmx8=; b=mWC55rueulo0cyec
	4DHpszLix4/EbA2Z0EiF4sqEFype7emqWTYRQylDT/227otnYQiXxSeKo8vhh4/n
	pBVA2/zSDvKYkZ6HI1TD+m5HHQCF1SdD25Z5Rv61xMFW5vVr0oxH8nODXq7wotUP
	8kAHBJhjMqrd8hG+Wliekw6YFsw8r2LAsYw8QKQ3dqpsZ8o5D9jYkn/MDVJK08PA
	5zoWWRSubhPyFCziXILClpx9wnt5/vMFGLD/eeYki2ZezcLzItmzcB3cyTN2izRA
	oHCYIDEu/pe3jPOH3rdC6TRgALil+PLrtHfOC49ERP0RvUGb0B4umAj58UfDA1gy
	xHe7zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791207012; x=1791811812; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/iCgxSwi3RoPvij3TTorlI9rkpxXQmuhLqHpTg4Dmx8=;
        b=Yht02DgQJgVsoG9xzpy/nw+ghB1WfZorAsOmTE0YjVnhDYl99b8enYi/4bop5iVuf0
         1wRC5y39sLk9woV3nVN50HZ29T+XkXlQvI64m7pZ4ucFCj+sJCqb8d663JIhjiWlZ1ow
         K547h3K0Li+Yf9Wc0hFtTTTe4E1Gv0hMODSwe9qAcQAKx1CcycDSA9MJcH+Ml469T25K
         JBhw40wwXJYvdnxFkzyazOC8F/7vhBYk0QU5LDfweKVZgz/gVwYUgoM6JYS36oARoKTd
         +bxL4irSKrST1euVnNjp0wpeW1sPW8bpFG+zSfgm/qsoeFbefnm/x8sDy4x81gty35QL
         p6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791207012; x=1791811812;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/iCgxSwi3RoPvij3TTorlI9rkpxXQmuhLqHpTg4Dmx8=;
        b=NnyWtntRAklhlpm3s4IjtCH+a5OgOme1oVX148QDMVy7gAYRcNp44mkG5eet+9RQS2
         Etpr5KRNpq562I7p+vgsZyti+TX8zGXYslrNT74xybmxUws4kXxZ3idugJbWq7wuydd8
         bgzJfyn5aUEvTvL43y7k/DHNBjAXL94sIzJg8S36Vshi8j6FZB8EbE26jds7XbAlpIoN
         aX2tJmHn2aoKK3ZJ3XgdA4hNA3r7vwO3krXEe/lBnxWTvrcvVPR6j+FKeQRrwlUePWLj
         c67LJmwau3vBevzg76dwj5moz5kMSsZuAFBoGyCaxkf93nxgIAqMuKEoYXoCughe+D4k
         x83A==
X-Gm-Message-State: AFuF++mLytASUMFHU48uq3j3nObTnMV1WiubYW7k7joCzHv8OQfydrSS
	jkl/e3J4OOdzYvd/o1cw+dgoO6Gs9Wp92d12Pg6uC4QTWQxLLfVWjUSgRNGm36LoUBYZpc2dJ+n
	0q0yzGyGNofdpyMpKQ/0kiC1aMPQhDydioaSv9fdY9do7H8aMuPokWyz+YkFoItpPY3LKlw==
X-Gm-Gg: AYBFou0Nj1pJQLXm/EuSP4PAvrKUCdKE6SICSZzyy1ixah7Ur+4M1uY9DmrYzMfyHYi
	yWEG26+5zKBE9g1e4gWGXn4PJCZ1wbkOw4YeSv9u1Q2WWpviZfUJVcS36jwxPC6F8taBUUvpwYm
	BcK5qoFux367nsqKq/5CmFgqrgWAl7H4BykT0e1ST4GCZSEGBKIOqBeCzI8aIdnfuyJsn/owW9N
	8zQp8ZOH7pdvhmIoV9cPF4/ULlFYdyU0YHdhkucG0Qax/tA94IkoNrPSmlCKwMTELZ9V3yGgYlm
	4AVYc+N7aDwQXuJDncFyFTfElkkscl1jS2gRy8P7DgMUreSurERWxb083YUk+K0yi6mzAMecmap
	XaPXyRlfk8+O8g4hDxA0mzMxiexDkTHnNYA==
X-Received: by 2002:a05:620a:6f93:20b0:93e:78b7:fa4e with SMTP id af79cd13be357-93e78b808d5mr219631385a.37.1791207011812;
        Mon, 05 Oct 2026 06:30:11 -0700 (PDT)
X-Received: by 2002:a05:620a:6f93:20b0:93e:78b7:fa4e with SMTP id af79cd13be357-93e78b808d5mr219626385a.37.1791207011240;
        Mon, 05 Oct 2026 06:30:11 -0700 (PDT)
Message-ID: <63427797-e8ed-4345-b8c7-469d20865165@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 15:30:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/28] hw/ide: mark ICH9 and ide-hd/ide-cd as secure
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
        qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
        qemu-block@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-15-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260911143627.2743803-15-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6AwE9SMuN-idRV8NalRm4Un3_785EgPK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA1MiBTYWx0ZWRfX2lDSZULMT9bG
 y/rqoleAkABp1bvJH8PCBcNZ+0rOnphbR3+lTWfD9OKDhHDRwBEWCvvgVCEMR7jmPYSzrj8qj5k
 nPBbAXoJMNmi5f7vEErHwvP/X1R38lc=
X-Authority-Analysis: v=2.4 cv=eZSo7LEH c=1 sm=1 tr=0 ts=6ac3a664 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=20KFwNOVAAAA:8 a=6wYS7wvJjY0OpNKrp4sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 6AwE9SMuN-idRV8NalRm4Un3_785EgPK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA1MiBTYWx0ZWRfX985dc7M+0zju
 PwTmHsk5OylfnhzXnO/k+7LCiKajBwH7AiIftc5teAd5qZr3Yu8IXSWXCSR/k6biOf+GUYlKkPH
 +NEmAhNPlk1d1Oxbq97cJAMu4QJfAmD07599ktoWvzJmhpk4JdrWcG9ZyfWiJR9L2RHIBFv2oJS
 6TGh8UQrC3j5OuuUETR7m2FwCNplLCb/VZJb17xhejztR1TOKhV6WtNDoUVv8B4lezgQaQz3vCX
 jeBRlXsAlmbLP9YCl7lC99qskSufmZaczV9mrhCG11J9kaAWVIq1+KlcEWMfzVn4eoOz5sf1D8v
 A33izCju6JAcsO3Wu60pL93aPXOL9tGjgE6GWTzAqiiq4E9veeRjud2bV+Nh/ychsCkRO9nxWN7
 bP2cJS4jCQslOMSr1cXvpGAnKGyBIn1xj1hk0J04CHBn2O+Mp8kmPZftnpF8cfRw+Ai8QVM/PzF
 oHcjbpXeKhIEKwNvbXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050052
X-purgate-ID: tlsNG-4011c0/1791207014-4ACDBCFC-A5112552/0/0
X-purgate-type: clean
X-purgate-size: 984

On 11/9/26 16:36, Daniel P. BerrangÃ© wrote:
> These have a long history of usage in virtualization scenarios on
> x86, for OS which lack modern virtio drivers for storage, and thus
> must be considered secure.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   hw/ide/ich.c     | 1 +
>   hw/ide/ide-dev.c | 3 +++
>   hw/ide/piix.c    | 2 ++
>   3 files changed, 6 insertions(+)


> @@ -252,6 +254,7 @@ static const TypeInfo ide_device_type_info = {
>       .parent = TYPE_DEVICE,
>       .instance_size = sizeof(IDEDevice),
>       .abstract = true,
> +    .secure = true,

We shouldn't accept abstract secure device class IMO because it
will be to easy to merge new devices that ended secure and we do
not want to consider them. I'd go a step further and assert both
can not be set together.

>       .class_size = sizeof(IDEDeviceClass),
>       .class_init = ide_device_class_init,
>       .instance_init = ide_dev_instance_init,

