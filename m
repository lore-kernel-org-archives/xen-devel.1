Return-Path: <SRS0=63tD=ON=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10230C433EF
	for <xen-devel@archiver.kernel.org>; Thu, 23 Sep 2021 14:36:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEEE7611C6
	for <xen-devel@archiver.kernel.org>; Thu, 23 Sep 2021 14:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CEEE7611C6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.194332.346186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTPpy-000787-S4; Thu, 23 Sep 2021 14:36:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194332.346186; Thu, 23 Sep 2021 14:36:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTPpy-000780-Ou; Thu, 23 Sep 2021 14:36:34 +0000
Received: by outflank-mailman (input) for mailman id 194332;
 Thu, 23 Sep 2021 14:36:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ES3T=ON=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mTPpx-00077u-GJ
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 14:36:33 +0000
Received: from mail-lf1-x134.google.com (unknown [2a00:1450:4864:20::134])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d9ecf389-9a48-46c0-b7a3-1e211e02ec1e;
 Thu, 23 Sep 2021 14:36:32 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id g41so27440712lfv.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 07:36:32 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id e1sm608964ljp.114.2021.09.23.07.36.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 07:36:30 -0700 (PDT)
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
X-Inumbo-ID: d9ecf389-9a48-46c0-b7a3-1e211e02ec1e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=kcm7GQxPRLl4JaE3RrEZ0xk8j4QAy1OICAxW3VEdfUg=;
        b=pqP9KCkdBel26c0mkwZRwjljeX4ricLoRDihcrcJIxnpX81IJTp/H1Z3ePseMa8jI6
         +iZd5GqwMLywyMGFhbYbaTtCVdxHzZzym2W2aQrTZP86oDGEbJgDpNDGv5p8AyPiuBhZ
         LfUfzRsL0m4K3p0oL0wa/jaK5K2DyxMIq70lfp7imqdLPnDrwSgW2UgKyzJg74DcJWhG
         9pZuY3Ii5N6Rc8e21axgU1yAYS24IdxixukK3L+vho29JkQ0Iv8Gtuk7lHtoLHTCMWHo
         yPoamBnZrf4gVy4TfsQXQ9WZ8Z+rDM9ZgV9GTkemrT2EaGo1Ktd8IcAvLbIXmVL4LWyT
         AQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=kcm7GQxPRLl4JaE3RrEZ0xk8j4QAy1OICAxW3VEdfUg=;
        b=W+Ke5BNcrPJ6omCzvor9m9gKPQ96ETK4gCO7a7G3rVCvDqe+E/1Nmqsqc6sn9iHVo0
         9rcQ+m9t33j7y7fG1V694FBB75oVAYr7UqhyQOfCua1hP69dprTtAONDKOUci8/cxM8i
         fQSLlFropzEQG61iuLHuCDwIH4b7ONxm+vz0Cs7pt2ojP0CWAnKvsynwmR39zEA8SFWu
         PHxk4FsOl/g2igv4LtGrD1Tu6KFnrIvwz0OFMUxJbWGvIlMwO7CCIxey2WcupWFNLHm4
         MFJ/9Ms1cuGkfEoahhucpoYxLcggANXmYpQhJDfs9gBcdHq0RwjSbYdrN2HKwQ5zTzNz
         uprA==
X-Gm-Message-State: AOAM5314QFB9wi8htzI0mtQXWW0Ktxqp7LA+TBiPMzGT2xGMV2Du/LfG
	F8SiBVOzuW2IR/4JsX58BeQ=
X-Google-Smtp-Source: ABdhPJzv4n6y2GmcfYIh4P4WiBxwTEj1dvgifhmjEXv/uipewKxSwhLCTAQtyI2AN5E5ajchZlqOSg==
X-Received: by 2002:a05:6512:e98:: with SMTP id bi24mr4301005lfb.497.1632407790744;
        Thu, 23 Sep 2021 07:36:30 -0700 (PDT)
Subject: Re: [PATCH] xen/arm: optee: Allocate anonymous domheap pages
From: Oleksandr <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Julien Grall <jgrall@amazon.com>
References: <1630935741-17088-1-git-send-email-olekstysh@gmail.com>
Message-ID: <5c1b7d53-2a12-cff5-d3a7-284e44bdef27@gmail.com>
Date: Thu, 23 Sep 2021 17:36:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1630935741-17088-1-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


Hello all.


Gentle reminder.


On 06.09.21 16:42, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> Allocate anonymous domheap pages as there is no strict need to
> account them to a particular domain.
>
> Since XSA-383 "xen/arm: Restrict the amount of memory that dom0less
> domU and dom0 can allocate" the dom0 cannot allocate memory outside
> of the pre-allocated region. This means if we try to allocate
> non-anonymous page to be accounted to dom0 we will get an
> over-allocation issue when assigning that page to the domain.
> The anonymous page, in turn, is not assigned to any domain.
>
> CC: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Acked-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
>   xen/arch/arm/tee/optee.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
> index 3453615..83b4994 100644
> --- a/xen/arch/arm/tee/optee.c
> +++ b/xen/arch/arm/tee/optee.c
> @@ -410,7 +410,7 @@ static struct shm_rpc *allocate_and_pin_shm_rpc(struct optee_domain *ctx,
>       if ( !shm_rpc )
>           return ERR_PTR(-ENOMEM);
>   
> -    shm_rpc->xen_arg_pg = alloc_domheap_page(current->domain, 0);
> +    shm_rpc->xen_arg_pg = alloc_domheap_page(NULL, 0);
>       if ( !shm_rpc->xen_arg_pg )
>       {
>           xfree(shm_rpc);
> @@ -774,7 +774,7 @@ static int translate_noncontig(struct optee_domain *ctx,
>        * - There is a plan to implement preemption in the code below, which
>        *   will allow use to increase default MAX_SHM_BUFFER_PG value.
>        */
> -    xen_pgs = alloc_domheap_pages(current->domain, order, 0);
> +    xen_pgs = alloc_domheap_pages(NULL, order, 0);
>       if ( !xen_pgs )
>           return -ENOMEM;
>   
> @@ -938,7 +938,7 @@ static bool copy_std_request(struct cpu_user_regs *regs,
>   
>       BUILD_BUG_ON(OPTEE_MSG_NONCONTIG_PAGE_SIZE > PAGE_SIZE);
>   
> -    call->xen_arg_pg = alloc_domheap_page(current->domain, 0);
> +    call->xen_arg_pg = alloc_domheap_page(NULL, 0);
>       if ( !call->xen_arg_pg )
>       {
>           set_user_reg(regs, 0, OPTEE_SMC_RETURN_ENOMEM);

-- 
Regards,

Oleksandr Tyshchenko


