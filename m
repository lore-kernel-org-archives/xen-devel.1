Return-Path: <SRS0=UsJP=GQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBEFEC433DB
	for <xen-devel@archiver.kernel.org>; Wed, 13 Jan 2021 19:10:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69B6C20665
	for <xen-devel@archiver.kernel.org>; Wed, 13 Jan 2021 19:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69B6C20665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.66729.118635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzlWi-0005ag-Hx; Wed, 13 Jan 2021 19:09:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66729.118635; Wed, 13 Jan 2021 19:09:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzlWi-0005aZ-Eh; Wed, 13 Jan 2021 19:09:52 +0000
Received: by outflank-mailman (input) for mailman id 66729;
 Wed, 13 Jan 2021 19:09:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kzlWh-0005aU-FH
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 19:09:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kzlWf-0002gB-Cq; Wed, 13 Jan 2021 19:09:49 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kzlWf-0008A3-6S; Wed, 13 Jan 2021 19:09:49 +0000
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
	bh=rzi+mbU2LXehHY6tL0lquPRAqa0KivnPh2+sn2d41pU=; b=22dvzUMVaiVIFGWX/+Xuv8t7Ck
	aqnSq3CTtLa8uLxhjkkwOdRA5ZFf2xVBCumbSifWEW7TGoMAuDtkhzBmcr8mj18Cv5JPAB2sGm9Ae
	cZf3sjFXtoXp/2qmZZ4g3fXLMfXdyP5zKMZHGw+K6/F29nBWVQ4sJnqKF2occP285/Y0=;
Subject: Re: [PATCH] memory: avoid pointless continuation in
 xenmem_add_to_physmap()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <e41fb847-684e-2502-5261-56108ebaeab0@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <feaa96fe-4609-0f4c-6cb0-8bac854bc7f6@xen.org>
Date: Wed, 13 Jan 2021 19:09:47 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <e41fb847-684e-2502-5261-56108ebaeab0@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 04/12/2020 10:43, Jan Beulich wrote:
> Adjust so we uniformly avoid needlessly arranging for a continuation on
> the last iteration.
> 
> Fixes: 5777a3742d88 ("IOMMU: hold page ref until after deferred TLB flush")

I view this patch as an optimization because there is nothing wrong with 
the code. So I think "Fixes" is not entirely suitable here.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Other than my remark about the tag:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

> 
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -854,8 +854,9 @@ int xenmem_add_to_physmap(struct domain
>               ++extra.ppage;
>   
>           /* Check for continuation if it's not the last iteration. */
> -        if ( (++done >= ARRAY_SIZE(pages) && extra.ppage) ||
> -             (xatp->size > done && hypercall_preempt_check()) )
> +        if ( xatp->size > ++done &&
> +             ((done >= ARRAY_SIZE(pages) && extra.ppage) ||
> +              hypercall_preempt_check()) )
>           {
>               rc = start + done;
>               break;
> 

-- 
Julien Grall

