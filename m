Return-Path: <SRS0=2oKG=LY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D732C11F68
	for <xen-devel@archiver.kernel.org>; Wed, 30 Jun 2021 09:10:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2C4361375
	for <xen-devel@archiver.kernel.org>; Wed, 30 Jun 2021 09:10:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2C4361375
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.148165.273746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyWEJ-00084o-EW; Wed, 30 Jun 2021 09:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148165.273746; Wed, 30 Jun 2021 09:09:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyWEJ-00084h-BM; Wed, 30 Jun 2021 09:09:59 +0000
Received: by outflank-mailman (input) for mailman id 148165;
 Wed, 30 Jun 2021 09:09:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lyWEI-00084b-To
 for xen-devel@lists.xenproject.org; Wed, 30 Jun 2021 09:09:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lyWEH-0001ky-GJ; Wed, 30 Jun 2021 09:09:57 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lyWEH-00089l-AI; Wed, 30 Jun 2021 09:09:57 +0000
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
	bh=quUuhcUj8Lmb3qmX/7h+AoH6JolIgsZBD2IzgJX7B0g=; b=w+D8SH+OpkhTHDUI73K4eQU6h3
	9qJ0GRHWPu5pXprL/hOwnFoTTuVwKAZcXPhuvIAsJyPUMvw9KXW3ZDLDgAf7YVGlm546RP09tTChi
	Eio1hDTVPSHHZ+wnahA5ei4EcfonmqaLx46O5e4xDl0QtHb6nL/sWv6TfdqRqNJ1dmTs=;
Subject: Re: [PATCH] xen/arm: smmuv1: Fixed stream matching register
 allocation
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <612e7f61c19e60019bb7829888342fda95fd36be.1624546532.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <11df0a34-724a-63ad-1822-4bd8aa364ab0@xen.org>
Date: Wed, 30 Jun 2021 10:09:55 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <612e7f61c19e60019bb7829888342fda95fd36be.1624546532.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 25/06/2021 17:37, Rahul Singh wrote:
> SMR allocation should be based on the number of supported stream
> matching register for each SMMU device.
> 
> Issue introduced by commit 5e08586afbb90b2e2d56c175c07db77a4afa873c
> when backported the patches from Linux to XEN to fix the stream match
> conflict issue when two devices have the same stream-id.
> 
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> Tested-by: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>   xen/drivers/passthrough/arm/smmu.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index d9a3a0cbf6..da2cd457d7 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -149,6 +149,7 @@ typedef enum irqreturn irqreturn_t;
>   #define kzalloc(size, flags)		_xzalloc(size, sizeof(void *))
>   #define devm_kzalloc(dev, size, flags)	_xzalloc(size, sizeof(void *))
>   #define kmalloc_array(size, n, flags)	_xmalloc_array(size, sizeof(void *), n)
> +#define kzalloc_array(size, n, flags)	_xzalloc_array(size, sizeof(void *), n)
>   
>   static void __iomem *devm_ioremap_resource(struct device *dev,
>   					   struct resource *res)
> @@ -2221,7 +2222,7 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
>   		smmu->smr_mask_mask = smr >> SMR_MASK_SHIFT;
>   
>   		/* Zero-initialised to mark as invalid */
> -		smmu->smrs = devm_kzalloc(smmu->dev, sizeof(*smmu->smrs), GFP_KERNEL);
> +		smmu->smrs = kzalloc_array(sizeof(*smmu->smrs), size, GFP_KERNEL);

I noticed this is already in... However, I am a bit puzzled into why 
this was switched devm_kzalloc() to kzalloc_array(). This doesn't matter 
for Xen as they are just wrappers to x*alloc() but a mention in the 
commit message would have been useful.

Also, when sending series, please remember to create a cover letter and 
number each patch.

Cheers,

-- 
Julien Grall

