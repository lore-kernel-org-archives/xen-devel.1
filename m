Return-Path: <SRS0=ian9=NQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7752FC4338F
	for <xen-devel@archiver.kernel.org>; Wed, 25 Aug 2021 13:29:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35160610A1
	for <xen-devel@archiver.kernel.org>; Wed, 25 Aug 2021 13:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 35160610A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.172318.314323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIsxV-0000U6-2V; Wed, 25 Aug 2021 13:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172318.314323; Wed, 25 Aug 2021 13:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIsxU-0000Tz-VQ; Wed, 25 Aug 2021 13:28:48 +0000
Received: by outflank-mailman (input) for mailman id 172318;
 Wed, 25 Aug 2021 13:28:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mIsxT-0000Tt-6H
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 13:28:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIsxS-0005n9-7t; Wed, 25 Aug 2021 13:28:46 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIsxS-0002VK-2D; Wed, 25 Aug 2021 13:28:46 +0000
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
	bh=EWHE2c6UUIBrDnF+Ams4synyRxsvQbYnQvTRm6sR+bg=; b=GlBdzweAAInqPYBRL2EOrqp8gQ
	ou9ioWvpIp1IlTiR2oPXgviLhIfKcYo7E29otKAL9ntsYGt0QO+CeqEnjB7bFxv59UfF43BkxXeg3
	zhHYZASd5Yzf9EShDZ/kBWo4zLqt3Ongw9hiY7HZ+kJsAORNJXgv4Wt43DsH99oJNoS4=;
Subject: Re: [XEN RFC PATCH 14/40] xen/arm: set NUMA nodes max number to 64 by
 default
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, jbeulich@suse.com
Cc: Bertrand.Marquis@arm.com
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-15-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <dfde3e1a-be4b-cf14-8a75-8910760b2c3c@xen.org>
Date: Wed, 25 Aug 2021 14:28:44 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210811102423.28908-15-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Wei,

On 11/08/2021 11:23, Wei Chen wrote:
> Today's Arm64 systems can reach or exceed 16 NUMA nodes, so
> we set the number to 64 to match with x86.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/include/asm-arm/numa.h | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
> index 1162c702df..b2982f9053 100644
> --- a/xen/include/asm-arm/numa.h
> +++ b/xen/include/asm-arm/numa.h
> @@ -5,7 +5,15 @@
>   
>   typedef u8 nodeid_t;
>   
> -#if !defined(CONFIG_NUMA)
> +#if defined(CONFIG_NUMA)
> +
> +/*
> + * Same as x86, we set the max number of NUMA nodes to 64 and
> + * set the number of NUMA memory block number to 128.
> + */

Such comment can rot easily if x86 decides to bump there values. But 
given the value is the same, I think it would make sense to move the 
define to xen/numa.h.

> +#define NODES_SHIFT      6
> +
> +#else
>   
>   /* Fake one node for now. See also node_online_map. */
>   #define cpu_to_node(cpu) 0
> 

Cheers,

-- 
Julien Grall

