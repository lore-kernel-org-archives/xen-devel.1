Return-Path: <SRS0=63tD=ON=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39FEBC433EF
	for <xen-devel@archiver.kernel.org>; Thu, 23 Sep 2021 11:26:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E433460FE8
	for <xen-devel@archiver.kernel.org>; Thu, 23 Sep 2021 11:26:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E433460FE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.193773.345180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMsG-00053L-WB; Thu, 23 Sep 2021 11:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193773.345180; Thu, 23 Sep 2021 11:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMsG-00053E-Sw; Thu, 23 Sep 2021 11:26:44 +0000
Received: by outflank-mailman (input) for mailman id 193773;
 Thu, 23 Sep 2021 11:26:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mTMsF-000538-Qr
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 11:26:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mTMsF-0006TB-M8; Thu, 23 Sep 2021 11:26:43 +0000
Received: from [202.153.84.92] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mTMsF-0005IO-CG; Thu, 23 Sep 2021 11:26:43 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=qsT6T22e61w6/AfoiiKbCCIYFz/PbjvAVA6oSo1g8CQ=; b=vPuhyePzRQi+7lhrZNrHbINgo5
	7IegUyeYzQHA+RiRYjc4nFS4uSypdmQX6l+EZSfMSz7aeKCsO/SQekhUjQ25cnDuBenzChE5vSmr2
	EOm6eqJuVhWjtfHNRBhBBh4J1RWvxqeq/RplY+RoZqdxDNklV8uVIW+Uece6ny6YNKbE=;
Subject: Re: [PATCH 10/11] xen/arm: device assignment on 1:1 direct-map domain
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20210923031115.1429719-1-penny.zheng@arm.com>
 <20210923031115.1429719-11-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c6730ec5-53c7-9bf2-4620-eefbc7c7c4a3@xen.org>
Date: Thu, 23 Sep 2021 16:26:40 +0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210923031115.1429719-11-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 23/09/2021 08:11, Penny Zheng wrote:
> User could do device passthrough, with "xen,force-assign-without-iommu" in
> the device tree snippet, on trusted guest through 1:1 direct-map,
> if IOMMU absent or disabled on hardware.

At the moment, it would be possible to passthrough a non-DMA capable 
device with direct-mapping. After this patch, this is going to be forbidden.

> 
> In order to achieve that, this patch adds 1:1 direct-map check and disables
> iommu-related action.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>   xen/arch/arm/domain_build.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index c92e510ae7..9a9d2522b7 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2070,14 +2070,18 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
>       if ( res < 0 )
>           return res;
>   
> +    /*
> +     * If xen_force, we allow assignment of devices without IOMMU protection.
> +     * And if IOMMU is disabled or absent, 1:1 direct-map is necessary > +     */
> +    if ( xen_force && is_domain_direct_mapped(kinfo->d) &&
> +         !dt_device_is_protected(node) )

dt_device_is_protected() will be always false unless the device is 
protected behing an SMMU using the legacy binding. So I don't think this 
is correct to move this check ahead. In fact..

> +        return 0;
> +
>       res = iommu_add_dt_device(node);

... the call should already be a NOP when the IOMMU is disabled or the 
device is not behind an IOMMU. So can you explain what you are trying to 
prevent here?

>       if ( res < 0 )
>           return res;
>   
> -    /* If xen_force, we allow assignment of devices without IOMMU protection. */
> -    if ( xen_force && !dt_device_is_protected(node) )
> -        return 0;
> -
>       return iommu_assign_dt_device(kinfo->d, node);
>   }
>   
> 

Cheers,

-- 
Julien Grall

