Return-Path: <SRS0=fakL=LQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3643C2B9F4
	for <xen-devel@archiver.kernel.org>; Tue, 22 Jun 2021 16:43:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 820B96128E
	for <xen-devel@archiver.kernel.org>; Tue, 22 Jun 2021 16:43:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 820B96128E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.145984.268527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvjUt-0007he-Lr; Tue, 22 Jun 2021 16:43:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145984.268527; Tue, 22 Jun 2021 16:43:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvjUt-0007hX-Io; Tue, 22 Jun 2021 16:43:35 +0000
Received: by outflank-mailman (input) for mailman id 145984;
 Tue, 22 Jun 2021 16:43:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lvjUs-0007hR-Q3
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 16:43:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lvjUr-0007LF-Ss; Tue, 22 Jun 2021 16:43:33 +0000
Received: from [54.239.6.180] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lvjUr-0000c8-Le; Tue, 22 Jun 2021 16:43:33 +0000
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
	bh=KpftfilInNWc/ShgTGCTIa+k0kYvxGlta4CEhJ7KT+0=; b=ShzyUHaR3lfmcG3KSJkcqjZO6b
	+R9xUELrHzJ2KQ58hKiB09awVKjivs2UKNKTeYVPTjKnaOcpu0GPw4DmbqeNGXtISTyNV9cggRlHI
	wsM34nT+zKPPZ0Ebv7Ma9eWWFktY9b0iMC8f/WAvj3x1ybvh3acqV7vG8MZ09pI9BWjo=;
Subject: Re: [PATCH] iommu/arm: ipmmu-vmsa: Add compatible for Renesas R-Car
 M3-W+ SoC
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1623698292-7464-1-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <36ae57eb-e7ce-8ca9-0f4e-23b9f1b0c0e7@xen.org>
Date: Tue, 22 Jun 2021 18:43:31 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1623698292-7464-1-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 14/06/2021 21:18, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> The "renesas,r8a77961" string identifies M3-W+ (aka M3-W ES3.0)
> instead of "renesas,r8a7796" since Linux commit:
> "9c9f7891093b02eb64ca4e1c7ab776a4296c058f soc: renesas: Identify R-Car M3-W+".
> Add new compatible to the Xen driver.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
>   xen/drivers/passthrough/arm/ipmmu-vmsa.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> index 8b8e3a0..1255b0d 100644
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -1316,6 +1316,7 @@ static const struct dt_device_match ipmmu_dt_match[] __initconst =
>       DT_MATCH_COMPATIBLE("renesas,ipmmu-r8a7795"),
>       DT_MATCH_COMPATIBLE("renesas,ipmmu-r8a77965"),
>       DT_MATCH_COMPATIBLE("renesas,ipmmu-r8a7796"),
> +    DT_MATCH_COMPATIBLE("renesas,ipmmu-r8a77961"),
>       { /* sentinel */ },
>   };
>   
> 

-- 
Julien Grall

