Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32CDC53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 12:58:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1373959.1620870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohNw-00066N-Tq; Tue, 28 Jul 2026 12:58:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1373959.1620870; Tue, 28 Jul 2026 12:58:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohNw-00066G-Qw; Tue, 28 Jul 2026 12:58:16 +0000
Received: by outflank-mailman (input) for mailman id 1373959;
 Tue, 28 Jul 2026 12:58:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <neil.armstrong@linaro.org>) id 1wohNv-00065Q-2z
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 12:58:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wohNu-00EM1D-G4
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 14:58:14 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <neil.armstrong@linaro.org>)
 id 6a68a74c-bab6-0a2a0a5309dd-0a2a450c9bac-26
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 14:58:14 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <neil.armstrong@linaro.org>)
 id 6a68a766-f479-0a2a450c0019-d1558031e93d-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 14:58:14 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4955de8797cso24503605e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 05:58:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5788:c4e1:cf35:7211?
 ([2a01:e0a:106d:1080:5788:c4e1:cf35:7211])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496c4615681sm77642695e9.11.2026.07.28.05.58.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 05:58:13 -0700 (PDT)
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
        d=linaro.org; s=google; t=1785243494; x=1785848294; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hC8sRjnafAE4kvTJxwUbBr2JgmCMzJbZTFX3udFXll0=;
        b=P1oJJbl2+ig7dupVa4S3qd7UJTQ0r27QK7GB7L1kCwczQnuoNUp0/vQWJyega/KiGG
         MngeIJAfcHSZv7YxEVfRZGJXoDjNanLXSVzUSYUZ41oqcEjJRTDTz6jFjOSe2vlzn9KY
         yw0wFZfW75nPrd3cNeRYlfh2+fU2lVRSjn4CHHGBd1lK71b17rl+1HgZAzZ9LdiT3sgS
         uir9s/akSWoBEy1N2Ot098vcDXTw4qoYy3vjebC/lbdJM39SLvkBmhbTmQsBNbqktasQ
         ge8o+fOcLnpmoWJAFtCeyBQ9YT6bLOzyPlJXV0j4IkhBpk4DjI7kexQS8TpLxqJF63+t
         GN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785243494; x=1785848294;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hC8sRjnafAE4kvTJxwUbBr2JgmCMzJbZTFX3udFXll0=;
        b=UP7GOLFOXrmK9/QGcHNYncIJe5fRRxv6l2UEWprLg+NMNoJACFfSZIVe7WSx6eLf4D
         sEtqLHSGgepNMoFXnVHaHBJFeFV3RMY5UsCxeVx4IqlCV1Qt4VAFk8tg1peiZPqRxLf9
         MLsDh0VnWOcKOo48L8Cex8/kHS0eySZm7zEPC4h77jSAlOn+TZ80GjewSsZT7bNuzlEv
         vYveRcIqabrI6XN3cEzWEqLeN5VmLG1rBGry5r57iNDEL1VbI1JTX6+tkLMXWZ3ZqQd2
         zb/q4JEFqbvLovFOLH+LoEftF0ZLLqrvQEDvY36ZNdPsZCrBnImpKvXkn4/ImB/5zu37
         Wu6A==
X-Forwarded-Encrypted: i=1; AHgh+RrJJpCOhHfFVChmj6aE3ZF+fAxM7XP6dwx9O474d/+HxwvWccs+q+HdCWBe0SYreGw7+slcqqKhUnw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzkJ2FDdBIRYuLgErPmvVhMuUVyPjCC8AgntzK1Lm/QPjqKr/Cb
	5GuC6aXnjGauxixKIET/lk/idu/lAHhJUbTcRkZE1kGIXsRc4qtuLF1YIqxm4ms7zlI=
X-Gm-Gg: AR+sD12KISQcpRkTtukEHEfluHbcBPcrOSSzD9ohlQ38Gui3ufIRgThpkQ3uLIT6T+r
	WgI0BUFm3DUrHvVDzewmPxmmgC+bJq2tvbNFPoDSMD3Gx8Lnpm09SfUwUUW6gcFamBhgFSVRgbF
	fOvQVMmszXcmcopcgB1wsAYgNINQiFWCGkapyhRk+WjEVYMeDCXumGIB+2ye+NotMp8eShDFD7F
	3znXDbRLL0J/VbWiVfE5/5l0W2wwIhS9+c8jUT/wbyGT0e4vEelp1jiQy1efmcEWS8eMQtf6Xof
	zj1Wj2ZQCg/UKKDdr+Ew2IaxvyZG4vJWPt/1hahudNmfIf6QIgpRF/75lGoOuFAqd9vL+TspzEy
	lzbSZ7nBL8woO5aXrCKm6+W0PQ8VHiViupDfsgXoQ3/KSr6LKRTHwY1tyqkSR4t5dSl/Wgi8ojx
	gq5dxin1XkRDwZQxaidqzCPehVUZFS68nkz9eMGiwuUYJ1YbnRHoBEExwPmTKNdzXV4OY+
X-Received: by 2002:a05:600c:3b1e:b0:493:bd2a:93bb with SMTP id 5b1f17b1804b1-496c653d055mr24700215e9.3.1785243493668;
        Tue, 28 Jul 2026 05:58:13 -0700 (PDT)
Message-ID: <df81c03b-6d2b-4c5d-8818-1aa42c146d44@linaro.org>
Date: Tue, 28 Jul 2026 14:58:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v16 3/3] of: Respect #{iommu,msi}-cells in maps
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
 Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org, imx@lists.linux.dev,
 xen-devel@lists.xenproject.org,
 Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20260603-parse_iommu_cells-v16-0-dc509dacb19a@oss.qualcomm.com>
 <20260603-parse_iommu_cells-v16-3-dc509dacb19a@oss.qualcomm.com>
 <3f5c974f-425d-47a5-9fda-e05de1f39d79@linaro.org>
 <fuqnxdknkajqotzmmlknwnthqpku7as5kpvmgogexl5bi7x6y4@tthbasf5lqvc>
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
In-Reply-To: <fuqnxdknkajqotzmmlknwnthqpku7as5kpvmgogexl5bi7x6y4@tthbasf5lqvc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1785243494-03AD4A5B-131A5FA0/0/0
X-purgate-type: clean
X-purgate-size: 2899

On 7/28/26 13:34, Dmitry Baryshkov wrote:
> On Thu, Jul 23, 2026 at 03:17:24PM +0200, Neil Armstrong wrote:
>> Hi,
>>
>> On 6/3/26 09:13, Vijayanand Jitta wrote:
>>> From: Robin Murphy <robin.murphy@arm.com>
>>>
>>> So far our parsing of {iommu,msi}-map properties has always blindly
>>> assumed that the output specifiers will always have exactly 1 cell.
>>> This typically does happen to be the case, but is not actually enforced
>>> (and the PCI msi-map binding even explicitly states support for 0 or 1
>>> cells) - as a result we've now ended up with dodgy DTs out in the field
>>> which depend on this behaviour to map a 1-cell specifier for a 2-cell
>>> provider, despite that being bogus per the bindings themselves.
>>>
>>> Since there is some potential use in being able to map at least single
>>> input IDs to multi-cell output specifiers (and properly support 0-cell
>>> outputs as well), add support for properly parsing and using the target
>>> nodes' #cells values, albeit with the unfortunate complication of still
>>> having to work around expectations of the old behaviour too.
>>>
>>> Since there are multi-cell output specifiers, the callers of of_map_id()
>>> may need to get the exact cell output value for further processing.
>>> Update of_map_id() to set args_count in the output to reflect the actual
>>> number of output specifier cells.
>>>
>>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>>> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>>> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
>>> ---
>>>    drivers/of/base.c  | 168 +++++++++++++++++++++++++++++++++++++++++------------
>>>    include/linux/of.h |   6 +-
>>>    2 files changed, 135 insertions(+), 39 deletions(-)
>>>
>>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>>> index d658c2620135..ac7961cbab94 100644
>>> --- a/drivers/of/base.c
>>> +++ b/drivers/of/base.c
>>> @@ -2116,19 +2116,49 @@ int of_find_last_cache_level(unsigned int cpu)
>>>    	return cache_level;
>>>    }
>>> +/*
>>> + * Some DTs have an iommu-map targeting a 2-cell IOMMU node while
>>> + * specifying only 1 cell. Fortunately they all consist of value '1'
>>> + * as the 2nd cell entry with the same target, so check for that pattern.
>>> + *
>>> + * Example:
>>> + *	IOMMU node:
>>> + *		#iommu-cells = <2>;
>>> + *
>>> + *	Device node:
>>> + *		iommu-map = <0x0000 &smmu 0x0000 0x1>,
>>> + *			    <0x0100 &smmu 0x0100 0x1>;
>>
>> So the sm8650 PCIe controllers has:
>>
>> pcie@1c08000:
>> 			iommu-map = <0     &apps_smmu 0x1480 0x1>,
>> 				    <0x100 &apps_smmu 0x1481 0x1>;
> 
> To silence the warning, update the iommu maps to:
> 
> 			iommu-map = <0     &apps_smmu 0x1480 0x0 0x1>,
> 				    <0x100 &apps_smmu 0x1481 0x0 0x1>;
> 
> 

Will do, I was surprised none of the DT were fixed.

Thanks,
Neil

