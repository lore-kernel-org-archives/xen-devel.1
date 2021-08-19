Return-Path: <SRS0=TguT=NK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1BC7C4338F
	for <xen-devel@archiver.kernel.org>; Thu, 19 Aug 2021 13:28:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FBD960C40
	for <xen-devel@archiver.kernel.org>; Thu, 19 Aug 2021 13:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9FBD960C40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.168803.308227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGi5t-0004rk-PZ; Thu, 19 Aug 2021 13:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168803.308227; Thu, 19 Aug 2021 13:28:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGi5t-0004rd-M6; Thu, 19 Aug 2021 13:28:29 +0000
Received: by outflank-mailman (input) for mailman id 168803;
 Thu, 19 Aug 2021 13:28:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mGi5s-0004rP-25
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 13:28:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mGi5r-0008U6-61; Thu, 19 Aug 2021 13:28:27 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mGi5q-0000YE-WC; Thu, 19 Aug 2021 13:28:27 +0000
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
	bh=9ovr3H7QPW+FM6NO7EPo5q6SPgM4bCuiZW3uLJ2kmxk=; b=u+g9Wv34V8fdUOxJ6FpgPauCVr
	wRKUvNGY6W1w35NRAmBds+jopOskJQbxGKxX+q5VJxpHT61EUrVvlfQpHnpH5Spmatz72ZeCIr7/z
	pp8aJo+5clPaxkls/IJWHWt+Gfzw2SM7XHKvhMsxYAd7rfRBpw/ua0GzRKudXUd3NasA=;
Subject: Re: [XEN RFC PATCH 04/40] xen/arm: return default DMA bit width when
 platform is not set
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, jbeulich@suse.com
Cc: Bertrand.Marquis@arm.com
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-5-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <61893862-6b8f-9c1b-367b-7e0c837a43c5@xen.org>
Date: Thu, 19 Aug 2021 14:28:24 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210811102423.28908-5-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 11/08/2021 11:23, Wei Chen wrote:
> From: Hongda Deng <Hongda.Deng@arm.com>
> 
> In current code, arch_get_dma_bitsize will return 32 when platorm
> or platform->dma_bitsize is not set. It's not resonable, for Arm,

s/resonable/reasonable/

> we don't require to reserve DMA memory. So we set dma_bitsize always
> be 0. In NO-NUMA system, arch_get_dma_bitsize will not be invoked,
> so dma_bitsize will not be overrided by this function. 

arch_get_dma_bitsize() is also used to allocate dom0 memory. We need to 
be able to allocate some DMA-able memory that can be used by every devices.

> But in NUMA
> system, once the online nodes are greater than 1, this function will
> be invoked. The dma_bitsize will be limited to 32. That means, only
> first 4GB memory can be used for DMA. But that's against our hardware
> design. We don't have that kind of restriction on hardware.

What do you mean by "hardware design"? Are you referring to the server 
you boot Xen on?

Anyway, there are plenty of platform out that have devices which can't 
DMA into memory above 32-bit. On RPI, this is even lower (30-bit).

So I would be cautious to change the default limit.

At the moment, the only place on Arm where we need DMA-able memory is 
for dom0. This is allocated at boot and can't change afterwards (for now).

So I would explore to remove the NUMA check for drop the DMA zone. FAOD, 
both suggestion are for Arm only. For x86, they need to be kept.

> Only
> platform setting can override dma_bitsize. So in this patch, we
> return default dma_bitsize, when platform and platorm->dma_bitsize
> are not set.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Hongda Deng <Hongda.Deng@arm.com>
> ---
>   xen/arch/arm/platform.c | 4 +++-
>   xen/common/page_alloc.c | 2 +-
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/platform.c b/xen/arch/arm/platform.c
> index 4db5bbb4c5..0a27fef9a4 100644
> --- a/xen/arch/arm/platform.c
> +++ b/xen/arch/arm/platform.c
> @@ -27,6 +27,7 @@ extern const struct platform_desc _splatform[], _eplatform[];
>   /* Pointer to the current platform description */
>   static const struct platform_desc *platform;
>   
> +extern unsigned int dma_bitsize;
>   
>   static bool __init platform_is_compatible(const struct platform_desc *plat)
>   {
> @@ -157,7 +158,8 @@ bool platform_device_is_blacklisted(const struct dt_device_node *node)
>   
>   unsigned int arch_get_dma_bitsize(void)
>   {
> -    return ( platform && platform->dma_bitsize ) ? platform->dma_bitsize : 32;
> +    return ( platform && platform->dma_bitsize ) ? platform->dma_bitsize
> +                                                 : dma_bitsize;
>   }
>   
>   /*
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 958ba0cd92..0f0cae5a4e 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -227,7 +227,7 @@ static bool __read_mostly scrub_debug;
>    * Bit width of the DMA heap -- used to override NUMA-node-first.
>    * allocation strategy, which can otherwise exhaust low memory.
>    */
> -static unsigned int dma_bitsize;
> +unsigned int dma_bitsize;
>   integer_param("dma_bits", dma_bitsize);
>   
>   /* Offlined page list, protected by heap_lock. */
> 

Cheers,

-- 
Julien Grall

