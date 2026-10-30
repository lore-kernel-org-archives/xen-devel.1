Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A6D606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 17:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hOaeq5yt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U1W3728T
Received: from list by lists.xenproject.org with outflank-mailman.1465985.1676398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMqjB-0007pK-11; Fri, 30 Oct 2026 17:49:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465985.1676398; Fri, 30 Oct 2026 17:49:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMqjA-0007pD-Ua; Fri, 30 Oct 2026 17:49:20 +0000
Received: by outflank-mailman (input) for mailman id 1465985;
 Fri, 30 Oct 2026 17:49:19 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xMqj9-0007p7-58
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 17:49:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMqj8-00EGkR-Ay
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 18:49:18 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 6ae4d888-e002-0a2a0a5209dd-0a2a4503d70c-40
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 18:49:17 +0100
Received: from [205.220.168.131] (helo=mx0a-0031df01.pphosted.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 6ae4d89b-fae8-0a2a45030019-cddca883c294-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 18:49:17 +0100
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69UERF6r378152
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 17:49:15 GMT
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme7549c2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 17:49:14 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-3698bd5392cso851851eec.1
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 10:49:14 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36a429467cdsm8795841eec.19.2026.10.30.10.49.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Oct 2026 10:49:12 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=qcppdkim1 header.d=qualcomm.com header.i="@qualcomm.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=google header.d=oss.qualcomm.com header.i="@oss.qualcomm.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Content-Language:From:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6UX8J6tayYdcMuVbYI0MgDwbUxidzIgfE/ULZAD4kYA=; b=hOaeq5yt3cEVyZFR
	0tcQK3F875a+bmOxQFt3NzEAIrxoXbA6yPh5NhgW4MAf9cAj0/4TZ4yrn4KP1kcD
	Kp9GGGOq7DiRWMlvGrdeNt7vTD2zwg+2ndYttukoJgHotjFNQ5DTwFgFPFfGcxrQ
	S84ZD1SE/RRcXjnwA/ZNC3H2KbAaplCR2GEzUffSZmN4TcKb3jpsUkqQO3khlwkA
	BwLuhVO07EJk7pqktnw+tpYOXlTyFSkZnednle311tiKR9MXSfi7Kixi0d5uxm+Y
	uZOYYiE9IWpSMHVtN5WwCvRISpf0uYqtn/fWrJANW8KPSQZLDmBLOxLlmjpfLxtJ
	rydZKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793382554; x=1793987354; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6UX8J6tayYdcMuVbYI0MgDwbUxidzIgfE/ULZAD4kYA=;
        b=U1W3728TC4gGEkZfuwNMNk2w4npuxJfd3Mh8SHiMcEfvefNMUqLgnJINbK3zLD1LKm
         HZDBYsNVbhPNwPYwbfoW3Z4HnCtqZEMCu0e1dfPtaGmrUah52Tv7raeJFvkHgZnY6K6u
         v5Osf1hYqeEMEszqFu/5ueGeVE8mEXyvl2hrkRYzyaQHRq9ScKhE9UMIUcCkK7YaLe3N
         LDpTakmSh9SjlF3PMjvHf18vJyZlf/CzePLxZxcw5aUAbazejobqjQHiHw6HjbSIEbj6
         3zLMx+fUIs8aNPl2qOgWEPE4VIA3PRIM6ZStAYUXV4xpAY5UfiNy4CcJxVhAML8LDTYe
         E+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793382554; x=1793987354;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6UX8J6tayYdcMuVbYI0MgDwbUxidzIgfE/ULZAD4kYA=;
        b=UOBFTM8AvM+tBNjBz7t71k7U9/nqyyuG53I7sDUFIxA8cuNpoB7E5MtnaHqq0njGP3
         t1WRFDaWngaQrNXnNonXJR7GLD88eI2lkmL6p38mfnArttCDSkVD3F9qyYJk9X18gMns
         ol7dLCswVvA1TrHNwKghcIllTztXSls7IoZx18QG2WDyzVoy8o8Rk8geSXPfntBRbuI1
         ukCVZWx92vclgvek7uHDL1LG6FjMsP15o6vOFyi+DzQsF+IXqPB23XO6UKX8frmYZzLW
         4LQnJnEAU3SpP/gUMs1PFQBUJ26RIkawu+/3K/zjuc6kxCX/D4FlDuYlGlYen7JA+rHl
         P+Yw==
X-Forwarded-Encrypted: i=1; AKwUvBxuvgusROV8Vm+ur4c80nSbJc09eudXmVDcdbYMSi6kvpe1rN5spGgy3vhjJkDUjPHYjiKlJH6tcT8=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJmecZ/Y4hHyuBWx0SirBbw81tTDtG4JRrXG0sjNOp11bcJIWxb
	ObbyK/g1MEPzBuxZjeioVJk2qeaoeAcPxRz7iAmwmULNsUKIAGnMHBVp3sPC+3hy2G22Ml6Kr3w
	hZXJ4+7CM02ASetS6PpJip8jS1d7FyGuvj2+5LbB30hZ5Run/ZUL0lErccyzRwQ5Q2DqeZA==
X-Gm-Gg: AYBFou2/68vo/7LyFrjNxAVpj/P7AsX1hlNSjHGypfTe3QS5GykoR3ElVDZ48g3w4VD
	fK+O9nUPMQvMfkuCeDnGkUoPsw5tGpyNiZ81iDV9XxUf3MgtCrFSZjYgmEf/QZXZYIMMF/QKeEj
	INPJNszYqgsT7a+dUpZuakkI/jmdiAwnAELzOr5H3oEIglHw+Hbge+0T+aBDrkYLLP+p1ykwJAV
	DmuL712TenxBbI/pZJzCJ2dPZgpOWbpjrcr8gNM3s0YrZUZbrdVFPbC0lE4vlgVuLqAMz/+nELh
	wwZf1SLe5lcscRVt/7VrjcANprB0EfCmSgFfPVYbgxVSDfJCbq6O+QcJZrvyt2jdYqUAfT/nMm/
	A8Yu5MsQI7rlnHNNw0faGcLx/PFfZpgoVQrk2j20OLpCV0IexxV3H/L1ZujSg2/ytXFIhMQJjPE
	nj0l9FqFcCYFsyV2nu1FwhaVp6iqmmyqxiZTA4ZeAXyBg=
X-Received: by 2002:a05:7300:3d0a:b0:35e:2c6:d462 with SMTP id 5a478bee46e88-36a2fc203c3mr7976415eec.0.1793382553989;
        Fri, 30 Oct 2026 10:49:13 -0700 (PDT)
X-Received: by 2002:a05:7300:3d0a:b0:35e:2c6:d462 with SMTP id 5a478bee46e88-36a2fc203c3mr7976358eec.0.1793382553364;
        Fri, 30 Oct 2026 10:49:13 -0700 (PDT)
Message-ID: <9c2a2e48-e15f-43ee-9eef-0ebb607ccafc@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 09:49:10 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15] hw: expand DEFINE_MACHINE to explicit TypeInfo
 registration
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Anthony PERARD <anthony@xenproject.org>, Felipe Balbi <balbi@kernel.org>,
        Aleksandar Rikalo <arikalo@gmail.com>,
        BALATON Zoltan <balaton@eik.bme.hu>,
        Philippe Mathieu-Daude <philmd@mailo.com>,
        Antony Pavlov <antonynpavlov@gmail.com>,
        Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Subbaraya Sundeep <sundeep.lkml@gmail.com>,
        =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Niek Linnenbank
 <nieklinnenbank@gmail.com>,
        xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
        Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc@nongnu.org,
        Alexandre Iooss <erdnaxe@crans.org>, Weiwei Li <liwei1518@gmail.com>,
        Zhao Liu <zhao1.liu@intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
        Thomas Huth <th.huth+qemu@posteo.eu>,
        =?UTF-8?Q?Cl=C3=A9ment_Chigot?=
 <chigot@adacore.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Yoshinori Sato <yoshinori.sato@nifty.com>,
        Frederic Konrad <konrad.frederic@yahoo.fr>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Peter Maydell
 <peter.maydell@linaro.org>,
        Chao Liu <chao.liu@processmission.com>,
        Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
        Alistair Francis <alistair@alistair23.me>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Gaurav Sharma <gaurav.sharma_7@nxp.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Alistair Francis <alistair.francis@wdc.com>,
        Artyom Tarasenko <atar4qemu@gmail.com>, qemu-arm@nongnu.org
References: <20261030151539.1872-1-luoyonggang@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261030151539.1872-1-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Du3jAS7kyOA2L3oYRLO8325B1UXZ2UTr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA3MCBTYWx0ZWRfX+UVnao1z7aTW
 2f4Ga/sKp9U1VpAqrLZg5f3xduJqC2l3WHW3QW/g+2UA+0wC+JEnj0F+TzSzhw20f5YOw5phEbw
 wy/VR7tbscpT5Uf8hcttFmNvMHMsZTt0jPodHcafucWu0Vu4kvUCKLwP6WbyGM98hfCBgZ2qIhV
 ylg//3voeX21s9UjGuhpReBmeCjRRjIEHeJpLqRzA3HSpzotYuRqBHbSi9ecdOzmBjkvzBCV7Uw
 tFwOWhWKZ3hD8ZYr1lFEnXE/P1299dD/XAgoiGodKfBvH+EKUDfb1BiPSFDTzaj8FwHetpxfbuf
 vFrjUPqv63C5o01502CR0VihEi+OmaxCQn5c46RNLLPQcaMJjDW5hPCtFQ1t1kLvbJDXzvJ8vGV
 7A+Nx2L2I9pCBmF8BqsYbViPuT7+UQnLYI2dGaVm6WFm3RpMjMgL/9rnZoiE/oIhzZBfw3vtTKm
 MLrlzLzHQgyh5Wgs4Jg==
X-Proofpoint-ORIG-GUID: Du3jAS7kyOA2L3oYRLO8325B1UXZ2UTr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA3MCBTYWx0ZWRfX3S3cIc+iPGBa
 sYxfzfC6w04y9AwP01GHXQw4Rl/Ze3ZuMTS8f/lh87iZFDjDcNZpjliBEHtwrRyzLMqU3ivv7qs
 /ou97caxGpJVPTiPXABXGSoZ28ecjSM=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae4d89a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=6Hdeo9sKUei7lKwjsM4A:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300070
X-purgate-ID: tlsNG-33051d/1793382557-762FD4E9-B9F60BDA/0/0
X-purgate-type: clean
X-purgate-size: 4106
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/30/2026 7:15 AM, Yonggang Luo wrote:
> DEFINE_MACHINE and DEFINE_MACHINE_EXTENDED hide the TypeInfo and the type_init
> function that calls type_register_static(). A later change needs to pass a
> target mask into that registration, and the macros have no parameter for it.
> This series expands every caller first, with no behavior change, so the
> follow-up only replaces the type_register_static() call.
> 
> Each machine file gains a class_init function, a TypeInfo, and a type_init
> function that calls type_register_static(). The last patch removes
> DEFINE_MACHINE* and DEFINE_SECURE_MACHINE* from include/hw/core/boards.h.
> 
> Yonggang Luo (15):
>   hw/alpha: expand DEFINE_MACHINE in dp264.c
>   hw/m68k: expand DEFINE_MACHINE for M68K machines
>   hw/microblaze: expand DEFINE_MACHINE for MicroBlaze
>   hw/tricore: expand DEFINE_MACHINE in tricore_testboard.c
>   hw/arm: expand DEFINE_MACHINE for ARM machines
>   hw/riscv: expand DEFINE_MACHINE for RISC-V machines
>   hw/core/null-machine: expand DEFINE_MACHINE
>   hw/mips: expand DEFINE_MACHINE for MIPS machines
>   hw/ppc: expand DEFINE_MACHINE for PowerPC machines
>   hw/sh4: expand DEFINE_MACHINE in r2d.c
>   hw/sparc: expand DEFINE_MACHINE in leon3.c
>   hw/xenpv: expand DEFINE_MACHINE in xen_machine_pv.c
>   hw/xtensa: expand DEFINE_MACHINE in sim.c
>   hw/xtensa: expand DEFINE_MACHINE in virt.c
>   hw/core/boards: remove unused DEFINE_MACHINE* macros
> 
>  hw/alpha/dp264.c                    | 18 +++++++++--
>  hw/arm/bananapi_m2u.c               | 18 +++++++++--
>  hw/arm/cubieboard.c                 | 19 +++++++++---
>  hw/arm/digic_boards.c               | 18 +++++++++--
>  hw/arm/imx25_pdk.c                  | 18 +++++++++--
>  hw/arm/imx8mm-evk.c                 | 20 +++++++++---
>  hw/arm/integratorcp.c               | 14 ++++++---
>  hw/arm/kzm.c                        | 18 +++++++++--
>  hw/arm/max78000fthr.c               | 17 ++++++++--
>  hw/arm/mcimx6ul-evk.c               | 18 +++++++++--
>  hw/arm/mcimx7d-sabre.c              | 20 +++++++++---
>  hw/arm/msf2-som.c                   | 17 ++++++++--
>  hw/arm/netduino2.c                  | 17 ++++++++--
>  hw/arm/netduinoplus2.c              | 17 ++++++++--
>  hw/arm/olimex-stm32-h405.c          | 18 +++++++++--
>  hw/arm/orangepi.c                   | 19 +++++++++---
>  hw/arm/stm32vldiscovery.c           | 18 +++++++++--
>  hw/core/null-machine.c              | 18 +++++++++--
>  hw/m68k/an5206.c                    | 18 +++++++++--
>  hw/m68k/mcf5208.c                   | 18 +++++++++--
>  hw/microblaze/petalogix_ml605_mmu.c | 19 ++++++++++--
>  hw/microblaze/xlnx-zynqmp-pmu.c     | 19 ++++++++++--
>  hw/mips/boston.c                    | 18 +++++++++--
>  hw/mips/fuloong2e.c                 | 18 +++++++++--
>  hw/mips/malta.c                     | 12 ++++++--
>  hw/ppc/amigaone.c                   | 18 +++++++++--
>  hw/ppc/pegasos.c                    | 21 ++++++++-----
>  hw/ppc/ppc440_bamboo.c              | 18 +++++++++--
>  hw/ppc/prep.c                       | 18 +++++++++--
>  hw/ppc/sam460ex.c                   | 18 +++++++++--
>  hw/ppc/virtex_ml507.c               | 18 +++++++++--
>  hw/riscv/boston-aia.c               | 18 +++++++++--
>  hw/riscv/microblaze-v-generic.c     | 18 +++++++++--
>  hw/sh4/r2d.c                        | 18 +++++++++--
>  hw/sparc/leon3.c                    | 18 +++++++++--
>  hw/tricore/tricore_testboard.c      | 18 +++++++++--
>  hw/xenpv/xen_machine_pv.c           | 18 +++++++++--
>  hw/xtensa/sim.c                     | 18 +++++++++--
>  hw/xtensa/virt.c                    | 18 +++++++++--
>  include/hw/core/boards.h            | 48 -----------------------------
>  40 files changed, 605 insertions(+), 142 deletions(-)
> 

So far, this expansion has been done only on machines that required to
modify TypeInfo: mostly virt types, which are ambiguous between targets
and require to introduce is_available.

Maybe this can be delayed for when such machines require it also.

Regards,
Pierrick

