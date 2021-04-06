Return-Path: <SRS0=uqgo=JD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D5A2C433B4
	for <xen-devel@archiver.kernel.org>; Tue,  6 Apr 2021 22:02:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EDCA613A7
	for <xen-devel@archiver.kernel.org>; Tue,  6 Apr 2021 22:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EDCA613A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.106323.203336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTtm1-0001mD-39; Tue, 06 Apr 2021 22:02:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106323.203336; Tue, 06 Apr 2021 22:02:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTtm0-0001m6-Vh; Tue, 06 Apr 2021 22:02:12 +0000
Received: by outflank-mailman (input) for mailman id 106323;
 Tue, 06 Apr 2021 22:02:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uncx=JD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lTtlz-0001m1-Ko
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 22:02:11 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 20e51005-24ae-495c-8589-c0446eead18c;
 Tue, 06 Apr 2021 22:02:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 935D8613A7;
 Tue,  6 Apr 2021 22:02:09 +0000 (UTC)
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
X-Inumbo-ID: 20e51005-24ae-495c-8589-c0446eead18c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617746529;
	bh=SzZ7UJTzlNQHfYZIl0LQTRTH/9V0JE1aqijTWvQoIf8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Y8fJU3nBbKvdGldEJctppPXe+fdX62TadUoJIB9FB960sS7jCmhhkryggGczYVeT5
	 DrLmjmLL0V/82Zz6XUOUZFRJ42ju6X9Po8dK0kMEkh7rdAvhFW3dwEVz3zSCRuba+y
	 tL2fTairHTKLa+CcoUt4kgyovzQKnKuRLLN+M3q33sj6q0yEegSTRvN2CwNHFUnkn0
	 gDxRcg1zjYW3r2kfOUHg6oRvhgFy/w9EaWiAN0es5hov6puHcSCZTcUBgId9DgkXWd
	 Wzu21RCHtWfBfbjprNY4nNISM7YLKtnNEzVqTlyLB5YaL1uweOhV8UevhGV8atsjzm
	 61ZVieXBeBV2g==
Date: Tue, 6 Apr 2021 15:02:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] xen/iommu: smmu: Silence clang in
 arm_smmu_device_dt_probe()
In-Reply-To: <20210402155106.15486-1-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2104061502010.31460@sstabellini-ThinkPad-T480s>
References: <20210402155106.15486-1-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 2 Apr 2021, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Clang 11 will throw the following error:
> 
> smmu.c:2284:18: error: cast to smaller integer type 'enum arm_smmu_arch_version' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
>         smmu->version = (enum arm_smmu_arch_version)of_id->data;
>                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> The error can be prevented by initially casting to (uintptr_t) and then
> enum.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> 
> Changes in v2:
>     - Cast to (uintptr_t) rather than introduce separate pointer
>     (requested by Andrew).
> 
> Only build tested
> ---
>  xen/drivers/passthrough/arm/smmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index 20ac672e91b6..fab7be8b48bb 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -2382,7 +2382,7 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev)
>  	smmu->dev = dev;
>  
>  	of_id = of_match_node(arm_smmu_of_match, dev->of_node);
> -	smmu->version = (enum arm_smmu_arch_version)of_id->data;
> +	smmu->version = (enum arm_smmu_arch_version)(uintptr_t)of_id->data;
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	smmu->base = devm_ioremap_resource(dev, res);
> -- 
> 2.17.1
> 

