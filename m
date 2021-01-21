Return-Path: <SRS0=QJUc=GY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B3E8C433DB
	for <xen-devel@archiver.kernel.org>; Thu, 21 Jan 2021 09:35:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A175E2388E
	for <xen-devel@archiver.kernel.org>; Thu, 21 Jan 2021 09:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A175E2388E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.71949.129228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2WNA-0000oh-3P; Thu, 21 Jan 2021 09:35:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71949.129228; Thu, 21 Jan 2021 09:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2WNA-0000oa-0L; Thu, 21 Jan 2021 09:35:24 +0000
Received: by outflank-mailman (input) for mailman id 71949;
 Thu, 21 Jan 2021 09:35:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l2WN8-0000oV-C9
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 09:35:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2WN6-00054a-PX; Thu, 21 Jan 2021 09:35:20 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2WN6-0006bJ-IZ; Thu, 21 Jan 2021 09:35:20 +0000
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
	bh=C+DFmXRDjCRQ44eA7khCBjoqwmqH94NQhpBLui/WR4w=; b=rct8howXdktStiOmcEFFRd6vME
	tKkLePIhjn395qb13wj+HYegnbCe/LZWCo0OIkRQML9D29LGNMhe1/aqCpvGnvs8BFGfjHl9QkvEt
	OksrtjhVL0LxxQpKX5HSvL0oZZlksDVsSOBTMxla51tZsKgiGmwMBjPz2pfhL4r2C1AU=;
Subject: Re: [PATCH] xen/arm: Fix compilation error when early printk is
 enabled
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com,
 wei.chen@arm.com
References: <20210121093041.21537-1-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <42ca88cc-8535-f8c4-2441-a8d3a3308f32@xen.org>
Date: Thu, 21 Jan 2021 09:35:18 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210121093041.21537-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Michal,

On 21/01/2021 09:30, Michal Orzel wrote:
> Fix compilation error when enabling early printk, introduced
> by commit aa4b9d1ee6538b5cbe218d4d3fcdf9548130a063:
> ```
> debug.S: Assembler messages:
> debug.S:31: Error: constant expression expected at operand 2 -- `ldr x15,=((0x00400000+(0)*PAGE_SIZE)+(0x1c090000&~PAGE_MASK))`
> debug.S:38: Error: constant expression expected at operand 2 -- `ldr x15,=((0x00400000+(0)*PAGE_SIZE)+(0x1c090000&~PAGE_MASK))`
> ```
> 
> The fix is to include header <xen/page-size.h> which now contains
> definitions for page/size/mask etc.
> 

Fixes: aa4b9d1ee653 ("include: don't use asm/page.h from common headers")

> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

> ---
>   xen/include/asm-arm/early_printk.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/xen/include/asm-arm/early_printk.h b/xen/include/asm-arm/early_printk.h
> index d5485decfa..8dc911cf48 100644
> --- a/xen/include/asm-arm/early_printk.h
> +++ b/xen/include/asm-arm/early_printk.h
> @@ -10,6 +10,7 @@
>   #ifndef __ARM_EARLY_PRINTK_H__
>   #define __ARM_EARLY_PRINTK_H__
>   
> +#include <xen/page-size.h>
>   
>   #ifdef CONFIG_EARLY_PRINTK
>   
> 

Cheers,

-- 
Julien Grall

