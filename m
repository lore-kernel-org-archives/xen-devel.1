Return-Path: <SRS0=fGkr=BP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E620C433E0
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2020 20:52:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A69921D95
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2020 20:52:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VCVTNJpG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A69921D95
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3QNz-0005yD-11; Wed, 05 Aug 2020 20:51:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w8Yv=BP=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k3QNx-0005y8-QU
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 20:51:41 +0000
X-Inumbo-ID: d2c1a28e-392c-4c1f-92a4-bad31ad5abc6
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2c1a28e-392c-4c1f-92a4-bad31ad5abc6;
 Wed, 05 Aug 2020 20:51:41 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id j22so19095944lfm.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2020 13:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=uZbgQQ59cM99l8le6g15/UCmLOmI4BVnDuMGPUAYHsA=;
 b=VCVTNJpGKTivoLI2ScxDezNtyRJY7Mhf8ZoCerDEeA8JFO9UijVOLhc2c6jYi5woC3
 RnfMZDNcMANu99KckoqrCpftkM9OAWQ4xrxcIpXP8G4i0aF753tPqcM+jmOGUy/KeXEH
 5K1FCqfVPNA0G1BjwIxQBcuh/2oXiK7Y84ICj8rtLYtmgFl3GUguMVwjL9XR+hZVKO4X
 iLP3WZn2qa/34w7nTdHyQIrPrqJF7dEC0Tmv8giVKy5WsF/VQdKYIcsXuI1xH0TA40I8
 wYxGEdu2Jfn9AEI64gNlSL2wcP2gMZE4UVPUf2PVmIGbAPKXdGvoPflU3ENl9IPCL62c
 Z6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=uZbgQQ59cM99l8le6g15/UCmLOmI4BVnDuMGPUAYHsA=;
 b=Bk9WZDC1pt4jiPiDDRevyak7emLnfz1Oa2ZQdWRWDSE8eYNilm4xTJxSGMfS1zEtxS
 9v7BV5863/ObJEui1wZRld4HU50FUWx69dnPWUEkWBFTtG7yNR9Newkxinfc12nekU6N
 D8afY0yxQa7dc0ILPrApvZIoCQ8YjGlmMKGf2x8pjDMAT2wYm1y/UnbDXuv62DU223nK
 Ihx75ANgUrbJ3DGpPlj6/JDqnCZOcaLQk1xqS4UAUy3R1UGqt6ZqrlA0456W9r5XPL+h
 lPiyJJj8aW+Bvpad/QHot7QmNFrWbYPFQNdkfC7dWt6X9Z/m4LiGTzdkQPNmhqcUnEvq
 JlKg==
X-Gm-Message-State: AOAM533nn7NMW091DlV3GcbdyVX1L6lRqDZkqFTnx7EPvny8Kk2Qcoez
 V2Vm5VjIvDqIg7C+bCqysuc=
X-Google-Smtp-Source: ABdhPJxMRvEbOqGUs4Xx38dzWPZ0NmuP9hkFEQT5ZKjnnFwPM5kSdG3pgneKGXGhvvOTaiBRW8i6Tw==
X-Received: by 2002:a19:c752:: with SMTP id x79mr2273891lff.197.1596660699904; 
 Wed, 05 Aug 2020 13:51:39 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id g6sm1610504lfr.51.2020.08.05.13.51.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2020 13:51:39 -0700 (PDT)
Subject: Re: [RFC PATCH V1 09/12] libxl: Handle virtio-mmio irq in more
 correct way
To: Stefano Stabellini <sstabellini@kernel.org>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-10-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2008041556390.5748@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <2163c32b-6fcf-b28b-a357-793666b20a35@gmail.com>
Date: Wed, 5 Aug 2020 23:51:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2008041556390.5748@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 05.08.20 02:22, Stefano Stabellini wrote:

Hi Stefano

> On Mon, 3 Aug 2020, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> This patch makes possible to use device passthrough again.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>>   tools/libxl/libxl_arm.c | 33 +++++++++++++++++++++++----------
>>   1 file changed, 23 insertions(+), 10 deletions(-)
>>
>> diff --git a/tools/libxl/libxl_arm.c b/tools/libxl/libxl_arm.c
>> index 620b499..4f748e3 100644
>> --- a/tools/libxl/libxl_arm.c
>> +++ b/tools/libxl/libxl_arm.c
>> @@ -9,6 +9,10 @@
>>   #include <assert.h>
>>   #include <xen/device_tree_defs.h>
>>   
>> +#define GUEST_VIRTIO_MMIO_BASE  xen_mk_ullong(0x02000000)
>> +#define GUEST_VIRTIO_MMIO_SIZE  xen_mk_ullong(0x200)
>> +#define GUEST_VIRTIO_MMIO_SPI   33
> They should be in xen/include/public/arch-arm.h

ok


>
> Is one interrupt enough if there are multiple virtio devices? Is it one
> interrupt for all virtio devices, or one for each device?

   One interrupt for each virtio device. I experimented with current 
series and assigned 4 disk partitions to the guest. This resulted in 4 
separate device-tree nodes, and each node had individual SPI and MMIO range.


>
> Of course this patch should be folded in the patch to add virtio support
> to libxl.

ok


-- 
Regards,

Oleksandr Tyshchenko


