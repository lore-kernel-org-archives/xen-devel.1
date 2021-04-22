Return-Path: <SRS0=VIWx=JT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA9B7C433B4
	for <xen-devel@archiver.kernel.org>; Thu, 22 Apr 2021 18:21:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44C6D613D1
	for <xen-devel@archiver.kernel.org>; Thu, 22 Apr 2021 18:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44C6D613D1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.115781.220930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZdwO-0005P6-A4; Thu, 22 Apr 2021 18:20:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115781.220930; Thu, 22 Apr 2021 18:20:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZdwO-0005Oz-6d; Thu, 22 Apr 2021 18:20:40 +0000
Received: by outflank-mailman (input) for mailman id 115781;
 Thu, 22 Apr 2021 18:20:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lZdwN-0005Ou-DD
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 18:20:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lZdwM-00043l-3r; Thu, 22 Apr 2021 18:20:38 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lZdwL-0006sl-SD; Thu, 22 Apr 2021 18:20:38 +0000
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
	bh=21+g1Yd2Cvh0Dc697geLe/Rvf49dUbVbHccR2pCOqWk=; b=q1soYbFzq8zORvcOQ3Foty+7h3
	WrQ9LG8GgXkX7r9GjfIDgUeqOotyuCVfGNF/qy95ltvVzmRn4frgHWHcFiS+iq9OCK9+uq6hSlGOe
	D2B91sbH4xJuMFEsrLgmyCjV0kF+Ka++czT9tpqrTaMlmjxXEk3cKTqEYKAejjBnGi/0=;
Subject: Re: [PATCH 1/7] xen/arm: Make make_cpus_node() compile at -Og
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210419140132.16909-1-andrew.cooper3@citrix.com>
 <20210419140132.16909-2-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <713d50cc-1036-03eb-f9e4-a330abafb3d4@xen.org>
Date: Thu, 22 Apr 2021 19:20:36 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210419140132.16909-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 19/04/2021 15:01, Andrew Cooper wrote:
> When compiling at -Og:
> 
>    domain_build.c: In function 'make_cpus_node':
>    domain_build.c:926:12: error: 'clock_valid' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>      926 |         if ( clock_valid )
>          |            ^
> 
> The compiler hasn't spotted that clock_valid is always initialised after the
> "if ( !compatible )" check.  Initialise clock_valid to false.

Can you confirm which version this is affecting? We bumped the minimum 
version of GCC recently, so I want to make sure we don't add code to 
silence older compilers.

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> ---
>   xen/arch/arm/domain_build.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index b1d7b9849f..b10f5c8f85 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -831,7 +831,7 @@ static int __init make_cpus_node(const struct domain *d, void *fdt)
>       /* Placeholder for cpu@ + a 32-bit hexadecimal number + \0 */
>       char buf[13];
>       u32 clock_frequency;
> -    bool clock_valid;
> +    bool clock_valid = false;

Would you mind to add something like:

/* Initialized silence at least GCC X.Y. */

With X.Y replaced with the version.

Cheers,

-- 
Julien Grall

