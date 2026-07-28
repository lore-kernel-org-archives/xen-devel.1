Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31169C53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 12:58:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1373953.1620853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohNN-0005S8-Ao; Tue, 28 Jul 2026 12:57:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1373953.1620853; Tue, 28 Jul 2026 12:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohNN-0005S1-85; Tue, 28 Jul 2026 12:57:41 +0000
Received: by outflank-mailman (input) for mailman id 1373953;
 Tue, 28 Jul 2026 12:57:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <neil.armstrong@linaro.org>) id 1wohNM-0005Rv-8H
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 12:57:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wohNL-00ELix-HS
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 14:57:39 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <neil.armstrong@linaro.org>)
 id 6a68a737-2eae-0a2a0a5409dd-0a2a450ccb58-20
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 14:57:39 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <neil.armstrong@linaro.org>)
 id 6a68a743-f479-0a2a450c0019-d155dd36c462-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 14:57:39 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-4728c12ba97so2290725f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 05:57:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5788:c4e1:cf35:7211?
 ([2a01:e0a:106d:1080:5788:c4e1:cf35:7211])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f9c4fe4c5sm38412732f8f.12.2026.07.28.05.57.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 05:57:38 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=linaro.org header.i="@linaro.org" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Organization:Autocrypt:Content-Language:References:Cc:To:Subject:Reply-To:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785243459; x=1785848259; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aHwnyYbdVqw8Gfk40ksLWUw1FSirv4HShvCRuaQuLzM=;
        b=OQYI1oaZBBE5cQPIg/n9/JUWRRyE7lMggQX+doawyzZfsY+U2q8Yv6ihfzL2Fc9gAq
         1XkO90rrpSM8bqANKe9z7kdRMjHJF+4o0krZK7t0otSDMtsVRCD4Xe1zWoVKqrIfW2ly
         oafxLuc7UtwNmFZuD4W57w0QYM5ckiM54OLjMZz0aZQj9CgDEePiMhB3RvSbWRmBZwEJ
         sjE+/KCk7SeyFGlWiwuAFeFeglbu7W1PisQuEx7EdxpzBa/npgZg0SAq8MuKS+G1Tjin
         0TuQc7XSFZ4vIL8XGBQPJiVzKEbMiZ6VR2b00RDKdii3W8Dk5g7iNViU1y7xZA/53W34
         BgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785243459; x=1785848259;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aHwnyYbdVqw8Gfk40ksLWUw1FSirv4HShvCRuaQuLzM=;
        b=LsUYDKCoL3GQOY8FaEEtmROdXwXzaL77jaL8mTzr9AC8/yofQNNBhXUpAn83IcIEpQ
         scMs2cDpfKxvB5QpoJpYl39siYCjNctpPtoyf9baTSydYMjU8cCmeMlGATkfP4P12Gg/
         TEuADv4af112FRjoQWvmKyq5q+FSjeoAtBB0z6BocSPiqHs3OIgCaF1l4PgrZzxIGLoh
         kzqNBUEIkmqHjA+y09VnYvx76zna+bhbwEGpCuUcl6VYoOiXdgaTMi+TdzOF/c8oU9dN
         k5cY52ZeJ+BGVyCw3RYfKZDwDGSPjzeRGNkK1Kh+2xvGsqS8CDKOxLSwWygnxSDMr+My
         MUlw==
X-Forwarded-Encrypted: i=1; AHgh+RpirOs3tfc3JicASXGg3ZJ4o0sGNe0keEJ4wtOxUdMJdzmrUHzXq0iqh9xcuTNG3dtBLVqQUcmCf2k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzBrYVMIfAxltH8DJ/RMvGUvNpyQ7u6H01MqrJsG70xU2G6QUo2
	ALODzYWY80M5S1tUipodZlFpCSAupTAYFGqRbke8gxuViIMdA27EdZoE67D4AlM+Vds=
X-Gm-Gg: AR+sD11XoMuZuU+yV2lUvULc84nRwRFu8rxF4ZD28SsZkLVHGPL8mq9lURyvVqwfUA9
	aBCSEMPR+sVq2K8+Rwb+17804a7G0RYCv8B7le2CLBabEUDoCy+O0cOvm/wR+/fG8wzEMou4nQa
	FelfQC8PbFDK7/O0qfD6xBKEyTNhs1hk7h6aOXLiMmMF69/nQ45Oyct/HkQc0/tDDnPBkh5pX6T
	7Ep1WE8QLuSfHecI8P90HESpGPTpNuM48wWezzRv2fPofqiD9e1sUxATdIFv1E+qG+LZiSJv9tt
	A+pX9yyj/MOSUvLAW3QPOrgV7bPX1zEIG/FPDpN0RbauCp156wFYz2pvgx36Xhs0aSOTpnsJ41q
	Lr48Ed9BzI/w7ZEtnlEiU+b/6Bg0ovYTC6IBA7GoBp/mzytLcPZB98QsKQmzf/jAj4fplh6BpCd
	v2Wg8/o3tTv6URn2Y77Z58u5atpg5M9NQdee7o8j5Qz7RONZkcqWuqqRJ/JbbDYQ9SVmSt
X-Received: by 2002:a05:6000:4387:b0:47f:89cd:b48 with SMTP id ffacd0b85a97d-47fb1ecc2acmr2978593f8f.5.1785243458685;
        Tue, 28 Jul 2026 05:57:38 -0700 (PDT)
Message-ID: <13d040a7-4fe2-400b-99c8-433f19aad9bc@linaro.org>
Date: Tue, 28 Jul 2026 14:57:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v16 3/3] of: Respect #{iommu,msi}-cells in maps
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
 Robin Murphy <robin.murphy@arm.com>, Nipun Gupta <nipun.gupta@amd.com>,
 Nikhil Agarwal <nikhil.agarwal@amd.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org, imx@lists.linux.dev,
 xen-devel@lists.xenproject.org,
 Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20260603-parse_iommu_cells-v16-0-dc509dacb19a@oss.qualcomm.com>
 <20260603-parse_iommu_cells-v16-3-dc509dacb19a@oss.qualcomm.com>
 <3f5c974f-425d-47a5-9fda-e05de1f39d79@linaro.org>
 <0d0896af-a4a5-445d-8db7-fdb9eecd07a2@oss.qualcomm.com>
 <69b1235a-832b-4a00-bcfd-f51991d23488@arm.com>
 <569bd4d8-2d77-457e-a0fb-388180c34711@oss.qualcomm.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <569bd4d8-2d77-457e-a0fb-388180c34711@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1785243459-5073FA5B-E9802B20/0/0
X-purgate-type: clean
X-purgate-size: 6372

On 7/28/26 12:39, Vijayanand Jitta wrote:
> 
> 
> On 7/28/2026 3:34 PM, Robin Murphy wrote:
>> On 28/07/2026 5:05 am, Vijayanand Jitta wrote:
>>>
>>>
>>> On 7/23/2026 6:47 PM, Neil Armstrong wrote:
>>>> Hi,
>>>>
>>>> On 6/3/26 09:13, Vijayanand Jitta wrote:
>>>>> From: Robin Murphy <robin.murphy@arm.com>
>>>>>
>>>>> So far our parsing of {iommu,msi}-map properties has always blindly
>>>>> assumed that the output specifiers will always have exactly 1 cell.
>>>>> This typically does happen to be the case, but is not actually enforced
>>>>> (and the PCI msi-map binding even explicitly states support for 0 or 1
>>>>> cells) - as a result we've now ended up with dodgy DTs out in the field
>>>>> which depend on this behaviour to map a 1-cell specifier for a 2-cell
>>>>> provider, despite that being bogus per the bindings themselves.
>>>>>
>>>>> Since there is some potential use in being able to map at least single
>>>>> input IDs to multi-cell output specifiers (and properly support 0-cell
>>>>> outputs as well), add support for properly parsing and using the target
>>>>> nodes' #cells values, albeit with the unfortunate complication of still
>>>>> having to work around expectations of the old behaviour too.
>>>>>
>>>>> Since there are multi-cell output specifiers, the callers of of_map_id()
>>>>> may need to get the exact cell output value for further processing.
>>>>> Update of_map_id() to set args_count in the output to reflect the actual
>>>>> number of output specifier cells.
>>>>>
>>>>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>>>>> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>>>>> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
>>>>> ---
>>>>>     drivers/of/base.c  | 168 +++++++++++++++++++++++++++++++++++++++++------------
>>>>>     include/linux/of.h |   6 +-
>>>>>     2 files changed, 135 insertions(+), 39 deletions(-)
>>>>>
>>>>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>>>>> index d658c2620135..ac7961cbab94 100644
>>>>> --- a/drivers/of/base.c
>>>>> +++ b/drivers/of/base.c
>>>>> @@ -2116,19 +2116,49 @@ int of_find_last_cache_level(unsigned int cpu)
>>>>>         return cache_level;
>>>>>     }
>>>>>     +/*
>>>>> + * Some DTs have an iommu-map targeting a 2-cell IOMMU node while
>>>>> + * specifying only 1 cell. Fortunately they all consist of value '1'
>>>>> + * as the 2nd cell entry with the same target, so check for that pattern.
>>>>> + *
>>>>> + * Example:
>>>>> + *    IOMMU node:
>>>>> + *        #iommu-cells = <2>;
>>>>> + *
>>>>> + *    Device node:
>>>>> + *        iommu-map = <0x0000 &smmu 0x0000 0x1>,
>>>>> + *                <0x0100 &smmu 0x0100 0x1>;
>>>>
>>>> So the sm8650 PCIe controllers has:
>>>>
>>>> pcie@1c08000:
>>>>               iommu-map = <0     &apps_smmu 0x1480 0x1>,
>>>>                       <0x100 &apps_smmu 0x1481 0x1>;
>>>>
>>>> and
>>>>
>>>> pcie@1c00000:
>>>>
>>>>               iommu-map = <0     &apps_smmu 0x1400 0x1>,
>>>>                       <0x100 &apps_smmu 0x1401 0x1>;
>>>>
>>>> and apps_smmu has #iommu-cells = <2>, but gets flagged at wrong:
>>>>
>>>> [    7.538800] OF: /soc@0/pcie@1c08000: iommu-map has 1-cell entries targeting 2-cell #iommu-cells, treating as 1-cell output
>>>>
>>>> Returning false in of_check_bad_map() triggers:
>>>>
>>>> [    7.642680] OF: /soc@0/pcie@1c08000: Unsupported iommu-map - cannot handle 256-ID range with 2-cell output specifier
>>>>
>>>> I don't understand the issue here, we use 2 cells as expected by
>>>> the iommu-cells, so why is it wrong ? can somebody explain in
>>>> comprehensive words ? I'm super confused, it worked like a charm until now.
>>>>
>>>> Neil
>>>>
>>>
>>> Hi Neil,
>>>
>>> iommu-map = <0     &apps_smmu 0x1480 0x1>,
>>>               <0x100 &apps_smmu 0x1481 0x1>;
>>>
>>>
>>> Entries here are not 2-cell format, Even though apps_smmu declares #iommu-cells = <2>,
>>> this DT only supplies one output cell (0x1480/0x1481) — the trailing 0x1 is the length field,
>>> not a second output cell. (<id-base phandle out-base length>)
>>>
>>> The new code detects exactly this pattern (same target phandle across all entries, length always 1)
>>> and falls back to treating the map as 1-cell output for backward compatibility — hence the pr_warn_once.
>>> It's harmless and expected, your RIDs still resolve to the correct SIDs (0 → 0x1480, 0x100 → 0x1481).
>>>
>>> The second message is a different case and shouldn't be coming from this same map — once the 1-cell
>>> fallback triggers on the first entry, it applies to the whole map, so you shouldn't hit both warnings
>>> together on the same node. That error only fires for a genuine 2-cell output specifier combined with
>>> an id_len > 1, e.g.:
>>>
>>> iommu-map = <0x0 &apps_smmu 0x1480 0x1 0x100>;
>>>
>>> (<id-base, phandle, out0, out1, length=256>) — which isn't supported, since there's no way to
>>> linearly scale a multi-cell output specifier across a range of IDs.
>>>
>>> Are you seeing that second error on the same pcie node, or a different one?
>>> If it's the same node, can you share the exact iommu-map entry that triggers it?
>>
>> I think Neil is saying he bypassed the fallback check so that it *did* try to parse the given map with the real #iommu-cells=2 in precisely the way you've shown - so even if it could have got past that point, it would have then blown trying to parse the second "entry" of just <&apps_smmu 0x1481 0x1>, since 0x1481 almost certainly isn't a valid phandle to read an #iommu-cells value from.
>>
>> Cheers,
>> Robin.
> 
> Right, I get it now, so when it tried to parse with iommu-cells as 2,
> 
> iommu-map = <0     &apps_smmu 0x1480 0x1>,
>              <0x100 &apps_smmu 0x1481 0x1>;
> 
> Above tuples would look something like <0  &apps_smmu 0x1480 0x1 0x100>, where 0x100 from next tuple would be seen as length. Hence, the above error log.
> And the next tuple <&apps_smmu 0x1481 0x1> won't be able to get parsed as you mentioned.

Thanks for the explanation, clearer now.

Neil

> 
> 
> Thanks,
> Vijay
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 


