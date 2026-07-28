Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179E8C531F9
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 10:40:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372350.1619705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wofE3-0005uq-JV; Tue, 28 Jul 2026 10:39:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372350.1619705; Tue, 28 Jul 2026 10:39:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wofE3-0005uj-Gt; Tue, 28 Jul 2026 10:39:55 +0000
Received: by outflank-mailman (input) for mailman id 1372350;
 Tue, 28 Jul 2026 10:39:54 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vijayanand.jitta@oss.qualcomm.com>)
 id 1wofE2-0005ud-Mo
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 10:39:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wofE1-00EMli-ML
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 12:39:53 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vijayanand.jitta@oss.qualcomm.com>)
 id 6a6886df-5cb7-0a2a0a5109dd-0a2a4502995a-34
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 12:39:53 +0200
Received: from [205.220.168.131] (helo=mx0a-0031df01.pphosted.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <vijayanand.jitta@oss.qualcomm.com>)
 id 6a6886f7-6ca4-0a2a45020019-cddca8839cf0-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 12:39:53 +0200
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66S82GjU1908866
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 10:39:51 GMT
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbp8bve5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 10:39:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-38f0fe57470so959779a91.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 03:39:50 -0700 (PDT)
Received: from [192.168.1.14] ([103.28.245.139])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38f08968de4sm4269200a91.2.2026.07.28.03.39.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 03:39:49 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=qcppdkim1 header.d=qualcomm.com header.i="@qualcomm.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=google header.d=oss.qualcomm.com header.i="@oss.qualcomm.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tSdcsk71nOjiqCkvXi2nOvJunCqAD9QzbH9nuI5oGcM=; b=iNnNA9efeNppXLMI
	ADfqnOz57Fup/AKKZao5OkovTB2j41hia1B62e6iILnw9Y7pzqFv0wGa10RfB08r
	vxX9GZWNFUdPU/B5D3JzCTlxx8xlvh9dJ5Z8vqPHZDbmfF3bVqgh5iEz2W9zjQta
	LcKdd1FRuxNdlJDfz4e3ynGGSscGi5e5wJyV/FFBfES5TElAacixzs3c5wOIp6jt
	WMFKB3/YaThUZ/7YhzwgW62BP6nQbsPZHRZMUyWxvPEFXBTZpuIGlkZxXbRiOOcL
	rUDpU8K4mSp/iPWhIAiqao5cGwoTXij3eMc81bs9/5NEFEIt/eKHndwsRCOJk7M7
	yJCDtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785235190; x=1785839990; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSdcsk71nOjiqCkvXi2nOvJunCqAD9QzbH9nuI5oGcM=;
        b=D7O6MHhLXPbE9k6ChqB/y9ixmTk2ComWyJkpEPWgP7zkqnI/OyTMeXilaMWjCEWIiW
         REjnD+IKK8bAFzslxSRoIzMqogokVmTm+LQS8uGkQtm/GWLUXn0itOYduXetNv6eF7oV
         /8svza7xV3pvlFb1+1dkB6uINes0dQQkzt5yu09dXf7+wif1sENBtVPdQj1+FWBlFR4P
         7u6lvYPL8Q4JpenV41u24h/BNHF3lS4MtKL28xgmMQamJa6NLsqCD+D1gIgXKt9Lb+Bf
         lEMFGinGVi7/49KTtGj0U0+7LAs3ZGdGtLpoWUJCzt4TNH1FrPid0qTotlg5qsSYWyx6
         ft2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785235190; x=1785839990;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tSdcsk71nOjiqCkvXi2nOvJunCqAD9QzbH9nuI5oGcM=;
        b=AWVZBPpzPk/v2fvWcR/SqLZK7REQOFfHXL60ZuCQq6A0v8Il3GrqVByMiiLcr5esTC
         CefgzxlUsx7EzdacBE/7QKenHa0W05dbB7KyF1VISfmq0r9r6xB/W8gITZuZL///Nno+
         Rtnc3YTi6W2jlIgKtj08NNoQI5i3JMUbcxlTNepMDAfu+saoZI13Y8Fgwz6d24Hqg06p
         drkFs8YnydTT3zrdP+Bw1LvDMwflk5cUVeUAQgr5EyDaLfOsFGtdmtiQ+l0xrrTbUrJM
         0a9gAbaEqHbENgE91leFmSBmTTQqfLqRZQR+IIoJIhofFhgLGlu8DzOtO8mzRc8mkOBM
         gj3Q==
X-Forwarded-Encrypted: i=1; AHgh+RriPuMPNMOGVAhCOFLoNtAerQ4z1XC4kQDoAIAbFYjtExXiVP/4cibqThq4n9RaMBMIstBbvAMHwR4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzIt44CPP21BaBQKsTkAhHhiUcHnINbKN8wWzDsbaKypGBCSS4k
	czgijkwt28TRKlsNKwryCj2kJTHcUBRzuMaMPwWUYnwSWIlFp3m3KCHtM4ubo4+MMHMexsZoGLo
	yvA+H+KqIHYjRJzL7hhfRAmGYfj6Pzq+mprT6uicmafLSxCGJmdRCRhAR4SdoCicenlN1Dw==
X-Gm-Gg: AR+sD12Nlwl1TwqZWb7gKFJbCNKK1oHw4rGUwTKjoJXRfxcqpYY0ZKqcjmFyPkqzOcy
	bziGzk7vnGc8DYrXHgYu8aJTsUnWKjscccExRTSLCbvIhyJisdQ56A/A70HF79HAhZeuNCpuXdw
	wYuWbFarx7LlNQ0K7/rv17kN1bjgcC1BL4QPNNLPbg8sNqDBpNR7DccmoSj+OIK/2ExReo7YShS
	+J+XI2+JmC6SWG1Sbj5H92XWua8LMa5Efk6sRUGeoLBqWZHs/ABXySNHfrLmVqQ3xxnlq3UxpIU
	DMTwX/KuWwC7/m4C62BbWnj1tCofg1/pPsJGigatZQ7KL3PuMX/XZ7caJZDaTPhZCK414gM4zRN
	/EiWNyshv0m8As/P1+Wjb4gJQm4iRp0u7DoCI
X-Received: by 2002:a17:90b:4ad0:b0:38e:4e61:c9e with SMTP id 98e67ed59e1d1-38f6a36a11fmr1788763a91.21.1785235189908;
        Tue, 28 Jul 2026 03:39:49 -0700 (PDT)
X-Received: by 2002:a17:90b:4ad0:b0:38e:4e61:c9e with SMTP id 98e67ed59e1d1-38f6a36a11fmr1788716a91.21.1785235189339;
        Tue, 28 Jul 2026 03:39:49 -0700 (PDT)
Message-ID: <569bd4d8-2d77-457e-a0fb-388180c34711@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 16:09:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 3/3] of: Respect #{iommu,msi}-cells in maps
To: Robin Murphy <robin.murphy@arm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Nipun Gupta
 <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas
 <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
        imx@lists.linux.dev, xen-devel@lists.xenproject.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20260603-parse_iommu_cells-v16-0-dc509dacb19a@oss.qualcomm.com>
 <20260603-parse_iommu_cells-v16-3-dc509dacb19a@oss.qualcomm.com>
 <3f5c974f-425d-47a5-9fda-e05de1f39d79@linaro.org>
 <0d0896af-a4a5-445d-8db7-fdb9eecd07a2@oss.qualcomm.com>
 <69b1235a-832b-4a00-bcfd-f51991d23488@arm.com>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <69b1235a-832b-4a00-bcfd-f51991d23488@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5MyBTYWx0ZWRfX9Sb3hLcc5YbS
 RQiH8Ok21ml/MzWau4f0O+oFlHim3GANN/zMTAv7FLIoTHuYkT7OiYfhUUMjaNlq9TZ28T3SmHf
 VGJR9p2clXa+kEPeFguzOjzMMF2cgo0=
X-Proofpoint-GUID: Q-wlObUFKgd0-lRiDAtyX0gCrerLA45U
X-Proofpoint-ORIG-GUID: Q-wlObUFKgd0-lRiDAtyX0gCrerLA45U
X-Authority-Analysis: v=2.4 cv=KLJqylFo c=1 sm=1 tr=0 ts=6a6886f6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=4Zb5+qXS4S4qhaWSJ/zCzA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=g5k_W2lUybaQNBh0X1UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5MyBTYWx0ZWRfXyQ40q9UcaIeS
 E9EPBON/U3KxpvGT5zCzC2zu1tksCOpeR8n6oZvdMYk6fGpMsnZfec2wd3YHUpOCenUGYLCuikR
 fjgglSgqUSr/7Pf/4IhOLMHaBaOTzYy904kAY1lTKznK2B8vcP9zIvJhARbEDZr6b/yUpVhQztF
 hSUHBawHx/zai4rxhXw76Ot8U2eKGmokokSYwFGmW9Tqva0CYPEDIyJrQ+SM9IZKVJBe6i3GKnL
 ZAMsXCVOdXCzjsmCFWLcsEOf9F1jydIuAc+uYxNPfGUNjjSJP+8CrllgbwNFRCjGYyBpLei1bdg
 Cm7DrFPZgbigH1wYmF3XEoMMOJG4fqBPoj7kiWKrxJ359JAOG2V0mNr1/9Fevxh5p0xm3DchUeP
 EDIMxHq8IOVrbIxkdhzq6PXrg/xNPqOLyzBxKJCfAXcLrWZbIyEbMNfaQMEojvuyWfPC+8Td9la
 LZphLOm+kimLeQ1QvKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280093
X-purgate-ID: tlsNG-720697/1785235193-317CA2AC-0B6AAF6D/0/0
X-purgate-type: clean
X-purgate-size: 6096



On 7/28/2026 3:34 PM, Robin Murphy wrote:
> On 28/07/2026 5:05 am, Vijayanand Jitta wrote:
>>
>>
>> On 7/23/2026 6:47 PM, Neil Armstrong wrote:
>>> Hi,
>>>
>>> On 6/3/26 09:13, Vijayanand Jitta wrote:
>>>> From: Robin Murphy <robin.murphy@arm.com>
>>>>
>>>> So far our parsing of {iommu,msi}-map properties has always blindly
>>>> assumed that the output specifiers will always have exactly 1 cell.
>>>> This typically does happen to be the case, but is not actually enforced
>>>> (and the PCI msi-map binding even explicitly states support for 0 or 1
>>>> cells) - as a result we've now ended up with dodgy DTs out in the field
>>>> which depend on this behaviour to map a 1-cell specifier for a 2-cell
>>>> provider, despite that being bogus per the bindings themselves.
>>>>
>>>> Since there is some potential use in being able to map at least single
>>>> input IDs to multi-cell output specifiers (and properly support 0-cell
>>>> outputs as well), add support for properly parsing and using the target
>>>> nodes' #cells values, albeit with the unfortunate complication of still
>>>> having to work around expectations of the old behaviour too.
>>>>
>>>> Since there are multi-cell output specifiers, the callers of of_map_id()
>>>> may need to get the exact cell output value for further processing.
>>>> Update of_map_id() to set args_count in the output to reflect the actual
>>>> number of output specifier cells.
>>>>
>>>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>>>> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>>>> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
>>>> ---
>>>>    drivers/of/base.c  | 168 +++++++++++++++++++++++++++++++++++++++++------------
>>>>    include/linux/of.h |   6 +-
>>>>    2 files changed, 135 insertions(+), 39 deletions(-)
>>>>
>>>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>>>> index d658c2620135..ac7961cbab94 100644
>>>> --- a/drivers/of/base.c
>>>> +++ b/drivers/of/base.c
>>>> @@ -2116,19 +2116,49 @@ int of_find_last_cache_level(unsigned int cpu)
>>>>        return cache_level;
>>>>    }
>>>>    +/*
>>>> + * Some DTs have an iommu-map targeting a 2-cell IOMMU node while
>>>> + * specifying only 1 cell. Fortunately they all consist of value '1'
>>>> + * as the 2nd cell entry with the same target, so check for that pattern.
>>>> + *
>>>> + * Example:
>>>> + *    IOMMU node:
>>>> + *        #iommu-cells = <2>;
>>>> + *
>>>> + *    Device node:
>>>> + *        iommu-map = <0x0000 &smmu 0x0000 0x1>,
>>>> + *                <0x0100 &smmu 0x0100 0x1>;
>>>
>>> So the sm8650 PCIe controllers has:
>>>
>>> pcie@1c08000:
>>>              iommu-map = <0     &apps_smmu 0x1480 0x1>,
>>>                      <0x100 &apps_smmu 0x1481 0x1>;
>>>
>>> and
>>>
>>> pcie@1c00000:
>>>
>>>              iommu-map = <0     &apps_smmu 0x1400 0x1>,
>>>                      <0x100 &apps_smmu 0x1401 0x1>;
>>>
>>> and apps_smmu has #iommu-cells = <2>, but gets flagged at wrong:
>>>
>>> [    7.538800] OF: /soc@0/pcie@1c08000: iommu-map has 1-cell entries targeting 2-cell #iommu-cells, treating as 1-cell output
>>>
>>> Returning false in of_check_bad_map() triggers:
>>>
>>> [    7.642680] OF: /soc@0/pcie@1c08000: Unsupported iommu-map - cannot handle 256-ID range with 2-cell output specifier
>>>
>>> I don't understand the issue here, we use 2 cells as expected by
>>> the iommu-cells, so why is it wrong ? can somebody explain in
>>> comprehensive words ? I'm super confused, it worked like a charm until now.
>>>
>>> Neil
>>>
>>
>> Hi Neil,
>>
>> iommu-map = <0     &apps_smmu 0x1480 0x1>,
>>              <0x100 &apps_smmu 0x1481 0x1>;
>>
>>
>> Entries here are not 2-cell format, Even though apps_smmu declares #iommu-cells = <2>,
>> this DT only supplies one output cell (0x1480/0x1481) — the trailing 0x1 is the length field,
>> not a second output cell. (<id-base phandle out-base length>)
>>
>> The new code detects exactly this pattern (same target phandle across all entries, length always 1)
>> and falls back to treating the map as 1-cell output for backward compatibility — hence the pr_warn_once.
>> It's harmless and expected, your RIDs still resolve to the correct SIDs (0 → 0x1480, 0x100 → 0x1481).
>>
>> The second message is a different case and shouldn't be coming from this same map — once the 1-cell
>> fallback triggers on the first entry, it applies to the whole map, so you shouldn't hit both warnings
>> together on the same node. That error only fires for a genuine 2-cell output specifier combined with
>> an id_len > 1, e.g.:
>>
>> iommu-map = <0x0 &apps_smmu 0x1480 0x1 0x100>;
>>
>> (<id-base, phandle, out0, out1, length=256>) — which isn't supported, since there's no way to
>> linearly scale a multi-cell output specifier across a range of IDs.
>>
>> Are you seeing that second error on the same pcie node, or a different one?
>> If it's the same node, can you share the exact iommu-map entry that triggers it?
> 
> I think Neil is saying he bypassed the fallback check so that it *did* try to parse the given map with the real #iommu-cells=2 in precisely the way you've shown - so even if it could have got past that point, it would have then blown trying to parse the second "entry" of just <&apps_smmu 0x1481 0x1>, since 0x1481 almost certainly isn't a valid phandle to read an #iommu-cells value from.
> 
> Cheers,
> Robin.

Right, I get it now, so when it tried to parse with iommu-cells as 2,

iommu-map = <0     &apps_smmu 0x1480 0x1>,
            <0x100 &apps_smmu 0x1481 0x1>;

Above tuples would look something like <0  &apps_smmu 0x1480 0x1 0x100>, where 0x100 from next tuple would be seen as length. Hence, the above error log.
And the next tuple <&apps_smmu 0x1481 0x1> won't be able to get parsed as you mentioned.


Thanks,
Vijay












