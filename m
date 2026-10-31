Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4CB606A31A
	for <xen-devel@archiver.kernel.org>; Sat, 31 Oct 2026 01:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=knvkgoU3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dOk4Rpt3
Received: from list by lists.xenproject.org with outflank-mailman.1466546.1676468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMyG9-0006pl-HQ; Sat, 31 Oct 2026 01:51:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1466546.1676468; Sat, 31 Oct 2026 01:51:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMyG9-0006pe-Dv; Sat, 31 Oct 2026 01:51:53 +0000
Received: by outflank-mailman (input) for mailman id 1466546;
 Sat, 31 Oct 2026 01:51:52 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xMyG7-0006pY-UN
 for xen-devel@lists.xenproject.org; Sat, 31 Oct 2026 01:51:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMyG7-00F2cG-3h
 for xen-devel@lists.xenproject.org; Sat, 31 Oct 2026 02:51:51 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 6ae5498a-8faa-0a2a0a5109dd-0a2a450bcc10-20
 for <xen-devel@lists.xenproject.org>; Sat, 31 Oct 2026 02:51:50 +0100
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 6ae549b5-b7e8-0a2a450b0019-cddcb4834a0c-3
 for <xen-devel@lists.xenproject.org>; Sat, 31 Oct 2026 02:51:50 +0100
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69V1C9Eq3872017
 for <xen-devel@lists.xenproject.org>; Sat, 31 Oct 2026 01:51:48 GMT
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x08m72-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sat, 31 Oct 2026 01:51:48 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-36637676140so1895228eec.0
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 18:51:48 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36a42a98f65sm10975065eec.28.2026.10.30.18.51.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Oct 2026 18:51:46 -0700 (PDT)
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
	9EYJOM0H9dJD2hgklOIl9JoR5CMKcX6ZZzpTCEQjgyk=; b=knvkgoU36fxNqvHI
	APfyHeBmKE5zbj3iokodOvop9u//Te8eAgfU8vhwHL2qknoF/LTG+CChpV6kXyys
	W9mgKu52yLpwRiwBgawRXdyksPhxbRrcGSPSS3XsT5j19GWxPiRvDFE4yawnjbKe
	3+cE9yJl6FPhtLhZHqbJ9AEPF0oh+XcfEz21v0QLcRsQag56kThffwM7nO4FF/XS
	4OCAM9pYQfzRbAGHY8AVkD6tNXQZQwtKTWOrDX8fXIE8YYw3t50cv7WFMYo/nwJU
	fjTt/c5fwPZHe1xRhJ41JhfUWHwtBDx/G1uV5pc/qZsoox7uMxXTl3evB7hK7w0H
	SsRVDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793411507; x=1794016307; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9EYJOM0H9dJD2hgklOIl9JoR5CMKcX6ZZzpTCEQjgyk=;
        b=dOk4Rpt3Dh28cDUt2AWPYmsUH2MxzIpYEAOrHziWOH3yhabI6jrdWXuxLIwGvzled3
         HYZAfMjoIEoC4m5QLRQgHJu4pad4iGLx0wxXI0Bu3/DdempLF8r87q1scDDWb+iB07kG
         M7E3ysMhhSq3Ulu6+GkHLAuDkYZwsWmgfWIxzgtB2j/WB44/gSI6IRiVS9bvlxPGf7O9
         EnUGmkL8vHFRrQklZsJMxdqJCeyI5QAT9igDct5+ot3aMUkCY/qrjq3OQho4n6pWaIKA
         RVP+UQSVlJeLtGxK+5uD7HZzlQu1Ute6k2LKxOhIkphj+yKHf3ZZV/DH/a/EMt6pQlmq
         OEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793411507; x=1794016307;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9EYJOM0H9dJD2hgklOIl9JoR5CMKcX6ZZzpTCEQjgyk=;
        b=RC19Npq8Xg6r7ImYK8stxbpeDzjbLcwJ9CWHiSeWRfgzeF/RbzXT3Qbd1Bmk1CkcIQ
         8JvWV/RM0eamrAoUXgqqrmTmDPpBSHH8FqMb/wgntS2+elduo8nowoq5kTacXTgyhvwg
         6HCpIbpUopeijkpQvaFYNnPDbsuqWg4C9asymC9cNIPaPSsi+w/+4TdA0JwJ0jlOySqS
         qrJ8d4WLQW3KubNOLGS13orXW7jUzItlepGGGVCEbFF/hOAzrKigFivsjD9Bz03Jkkf4
         OGNbABL7bAWE4wFRsarPJrFg2VRFo8m4zOUV4BJxSnfb57vo47CDyGC8me2QDfOxRCZz
         heng==
X-Forwarded-Encrypted: i=1; AKwUvBzWxXrHKGZDQzUTg+5rYdWXUmB6w4kbssozGCCFG6Fo7utJ4/kX+ZBj5FnWfrMLGGCl0i0vcPlFCmI=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJVakVw/MKsJWJyZfifeeWquP8iKHuZN0n5cfPGfTNRJjGC4UYa
	aX5vpBA0y+G0q4MBz8HrbMrZaJog77ZPL/UgoEeUjc973zdNVfLcbbKyalHhX15dA3Pzt00tkxo
	A3R1WcveK2sHvp6qqdD+yet611GTIFfVNAzTkyDZFNeIrqhrbcv0xl1Tkg1lhtfsH0ZKb1g==
X-Gm-Gg: AYBFou2gaJ7Xz+ebgT0a0YG20PmLISnL6axoY238pandk9TBaKA8KZNgo5Ndxc25lTn
	NunPk6yLLboTsmq0LCzsdtxHxtGFiU49P/WiwtVkGkx5m8D4H6/dMIsoeh70Gjb4DvSizzhRgso
	S7Iox0nn+Oc9hz8i9b/WW1BDOA9TQZr47z81kue+mT0W1iPg+WhNaH6MZZ2ULGwT5dSOn8Lz/yR
	aMzXGvoAocKn2SQHcrVrRB2OwOLuf9sW3HAknXQMqHdaWsPqio9qvv8rLojJEuoPUGKZ3FVJdMn
	UK0tg8qdAOnXRLPWjtOGGEOizGpwj8jR1yLMU+SlQ+5+ALtNMxNXO27qH91+bgLAWHZGHQ9teas
	+rK5ESCqyusgjLyNh9s2uCG88k+bSQ7symiOosTB+TQj7bNPnFziDm7SGTzxPovjJpLLljQ5/BM
	7L5GSiPGEIaUxws8q2jtG1VSP1s5UKfBpLSjOTSfC9YOc=
X-Received: by 2002:a05:693c:880c:10b0:35c:cd26:3066 with SMTP id 5a478bee46e88-36a424655bcmr5937771eec.41.1793411507365;
        Fri, 30 Oct 2026 18:51:47 -0700 (PDT)
X-Received: by 2002:a05:693c:880c:10b0:35c:cd26:3066 with SMTP id 5a478bee46e88-36a424655bcmr5937730eec.41.1793411506763;
        Fri, 30 Oct 2026 18:51:46 -0700 (PDT)
Message-ID: <aa70e94c-d9a8-41c9-850f-7ded87f7f327@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 17:51:44 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15] hw: expand DEFINE_MACHINE to explicit TypeInfo
 registration
To: BALATON Zoltan <balaton@eik.bme.hu>, Yonggang Luo <luoyonggang@gmail.com>
Cc: qemu-devel@nongnu.org, Anthony PERARD <anthony@xenproject.org>,
        Felipe Balbi <balbi@kernel.org>, Aleksandar Rikalo <arikalo@gmail.com>,
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
 <d1db54c6-b802-676a-7779-0c2c63f5f807@eik.bme.hu>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d1db54c6-b802-676a-7779-0c2c63f5f807@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 2irOUOfK4gg-fPaaQsPmGq5tadLqG3mF
X-Proofpoint-GUID: 2irOUOfK4gg-fPaaQsPmGq5tadLqG3mF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDAwNyBTYWx0ZWRfXyqBhMDbmJ85F
 Cw6UGqBD4MTBSkLeH7vOfy/uCKGQT4QVvxw4Mj0n+2vlEQ2H3u+hkxQz4cM+Z304P6tI/0tkf4r
 mgk1NjMEM1lP4BkEUWFUeLqOEDsx3O0=
X-Authority-Analysis: v=2.4 cv=WfKZ+EhX c=1 sm=1 tr=0 ts=6ae549b4 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=3o5FCx-jELZdd1X3BU0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDAwNyBTYWx0ZWRfX8IrfS0bwnZdx
 0yn9mUTCpCLuhjgZfXO2sxmrmhA9H4xEtE5K39C1ktL1FUzRT4I9by56/fW1UemM08zQv14aLgB
 XJ25Yn6q3mGvsFvNOl7cxH+jW7KvV5zR2pUBcsOryclu/EwqGMoY9OG9Vm2UR1IAxcdYoyfpTlY
 Fv8XLJQ149GElVjxVQMkWT21dFd73lRD3+TmByzpyJrOtQIGBh7UCLvAsGDEtiYjkwvmqhoAGEf
 bpzeepm/AQfEr9FlC1apwsV7uluDKdtr/lOJhV2RyEU9HW3ceM257PjSY4rnDy0IbB77H/wQKZb
 bdDVx9gRz9qHineu2lAtGtu8SfB9neI00cJ+RirNdqM7P8lEd4gMdVraTz4v1JzTTVtUil5Er4E
 u0jCA8U8bwx6ZUzjXjmiYA8YPjsBDFAIXu3R65/t6NpJaT606gyjNCWBoAr9oY3dWsIVlQV6MGQ
 OlAxccysoKQrPdggflA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310007
X-purgate-ID: tlsNG-42698a/1793411510-AACDF9EA-591380B5/0/0
X-purgate-type: clean
X-purgate-size: 5186
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/30/2026 4:09 PM, BALATON Zoltan wrote:
> On Fri, 30 Oct 2026, Yonggang Luo wrote:
>> DEFINE_MACHINE and DEFINE_MACHINE_EXTENDED hide the TypeInfo and the
>> type_init
>> function that calls type_register_static(). A later change needs to
>> pass a
> 
> That's the point of the macro to hide the boiler plate code.
> 
>> target mask into that registration, and the macros have no parameter
>> for it.
> 
> Couldn't you just change the macros to take that parameter instead of
> expanding it everywhere?
>

Problem of macros is that they don't have default parameters, so you
need variants for everything:

DEFINE_MACHINE
DEFINE_MACHINE_EXTENDED
DEFINE_MACHINE_WITH_INTERFACES
DEFINE_MACHINE_WITH_INTERFACE_ARRAY
and now would need a new variant, with variant for other existing ones.

In the end, it's just simpler to remove this and add the boilerplate.
It's written once and never modified, so using a macro just save typing
those lines once.

> Regards,
> BALATON Zoltan
> 
>> This series expands every caller first, with no behavior change, so the
>> follow-up only replaces the type_register_static() call.
>>
>> Each machine file gains a class_init function, a TypeInfo, and a
>> type_init
>> function that calls type_register_static(). The last patch removes
>> DEFINE_MACHINE* and DEFINE_SECURE_MACHINE* from include/hw/core/boards.h.
>>
>> Yonggang Luo (15):
>>  hw/alpha: expand DEFINE_MACHINE in dp264.c
>>  hw/m68k: expand DEFINE_MACHINE for M68K machines
>>  hw/microblaze: expand DEFINE_MACHINE for MicroBlaze
>>  hw/tricore: expand DEFINE_MACHINE in tricore_testboard.c
>>  hw/arm: expand DEFINE_MACHINE for ARM machines
>>  hw/riscv: expand DEFINE_MACHINE for RISC-V machines
>>  hw/core/null-machine: expand DEFINE_MACHINE
>>  hw/mips: expand DEFINE_MACHINE for MIPS machines
>>  hw/ppc: expand DEFINE_MACHINE for PowerPC machines
>>  hw/sh4: expand DEFINE_MACHINE in r2d.c
>>  hw/sparc: expand DEFINE_MACHINE in leon3.c
>>  hw/xenpv: expand DEFINE_MACHINE in xen_machine_pv.c
>>  hw/xtensa: expand DEFINE_MACHINE in sim.c
>>  hw/xtensa: expand DEFINE_MACHINE in virt.c
>>  hw/core/boards: remove unused DEFINE_MACHINE* macros
>>
>> hw/alpha/dp264.c                    | 18 +++++++++--
>> hw/arm/bananapi_m2u.c               | 18 +++++++++--
>> hw/arm/cubieboard.c                 | 19 +++++++++---
>> hw/arm/digic_boards.c               | 18 +++++++++--
>> hw/arm/imx25_pdk.c                  | 18 +++++++++--
>> hw/arm/imx8mm-evk.c                 | 20 +++++++++---
>> hw/arm/integratorcp.c               | 14 ++++++---
>> hw/arm/kzm.c                        | 18 +++++++++--
>> hw/arm/max78000fthr.c               | 17 ++++++++--
>> hw/arm/mcimx6ul-evk.c               | 18 +++++++++--
>> hw/arm/mcimx7d-sabre.c              | 20 +++++++++---
>> hw/arm/msf2-som.c                   | 17 ++++++++--
>> hw/arm/netduino2.c                  | 17 ++++++++--
>> hw/arm/netduinoplus2.c              | 17 ++++++++--
>> hw/arm/olimex-stm32-h405.c          | 18 +++++++++--
>> hw/arm/orangepi.c                   | 19 +++++++++---
>> hw/arm/stm32vldiscovery.c           | 18 +++++++++--
>> hw/core/null-machine.c              | 18 +++++++++--
>> hw/m68k/an5206.c                    | 18 +++++++++--
>> hw/m68k/mcf5208.c                   | 18 +++++++++--
>> hw/microblaze/petalogix_ml605_mmu.c | 19 ++++++++++--
>> hw/microblaze/xlnx-zynqmp-pmu.c     | 19 ++++++++++--
>> hw/mips/boston.c                    | 18 +++++++++--
>> hw/mips/fuloong2e.c                 | 18 +++++++++--
>> hw/mips/malta.c                     | 12 ++++++--
>> hw/ppc/amigaone.c                   | 18 +++++++++--
>> hw/ppc/pegasos.c                    | 21 ++++++++-----
>> hw/ppc/ppc440_bamboo.c              | 18 +++++++++--
>> hw/ppc/prep.c                       | 18 +++++++++--
>> hw/ppc/sam460ex.c                   | 18 +++++++++--
>> hw/ppc/virtex_ml507.c               | 18 +++++++++--
>> hw/riscv/boston-aia.c               | 18 +++++++++--
>> hw/riscv/microblaze-v-generic.c     | 18 +++++++++--
>> hw/sh4/r2d.c                        | 18 +++++++++--
>> hw/sparc/leon3.c                    | 18 +++++++++--
>> hw/tricore/tricore_testboard.c      | 18 +++++++++--
>> hw/xenpv/xen_machine_pv.c           | 18 +++++++++--
>> hw/xtensa/sim.c                     | 18 +++++++++--
>> hw/xtensa/virt.c                    | 18 +++++++++--
>> include/hw/core/boards.h            | 48 -----------------------------
>> 40 files changed, 605 insertions(+), 142 deletions(-)
>>
>>


