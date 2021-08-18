Return-Path: <SRS0=jJV9=NJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 536C9C4338F
	for <xen-devel@archiver.kernel.org>; Wed, 18 Aug 2021 17:44:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3A16610CB
	for <xen-devel@archiver.kernel.org>; Wed, 18 Aug 2021 17:44:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F3A16610CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.168309.307306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGPbk-00008P-Uj; Wed, 18 Aug 2021 17:44:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168309.307306; Wed, 18 Aug 2021 17:44:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGPbk-00008I-RO; Wed, 18 Aug 2021 17:44:08 +0000
Received: by outflank-mailman (input) for mailman id 168309;
 Wed, 18 Aug 2021 17:44:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mGPbj-000087-Bu
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 17:44:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mGPbi-0003Le-Da; Wed, 18 Aug 2021 17:44:06 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mGPbi-0005aj-7b; Wed, 18 Aug 2021 17:44:06 +0000
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
	bh=YoNlUY16dNm1GnnafYf/lC9oVVK3TE2+/iKkczJfa9E=; b=5lPej/4Q/BaRiep+8ceXEjIN7q
	ZtA9xjb+Wojb7STyaoAFSSNmVkDyHXbRkSn4DGpoBWSHutifQDAxcwYSOtr9gS3XPnhm1GE9SJR6d
	LpLFmH6N+2LDUAM1TvC+nHBei9Kut+cXql1Gfz/ye/xsAfCVdxVEwfqR5dX/PM/Ne3PQ=;
Subject: Re: [PATCH] Arm: relax iomem_access_permitted() check
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <a26e91df-7c49-5903-6228-821d92c4902c@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <adfdc3f6-5801-8387-6400-393f2536c6cd@xen.org>
Date: Wed, 18 Aug 2021 18:44:04 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <a26e91df-7c49-5903-6228-821d92c4902c@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 18/08/2021 08:52, Jan Beulich wrote:
> Ranges checked by iomem_access_permitted() are inclusive; to permit a
> mapping there's no need for access to also have been granted for the
> subsequent page.

Good catch! OOI, how did you find it?

> 
> Fixes: 80f9c3167084 ("xen/arm: acpi: Map MMIO on fault in stage-2 page table for the hardware domain")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

> 
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -1893,7 +1893,7 @@ static bool try_map_mmio(gfn_t gfn)
>           return false;
>   
>       /* The hardware domain can only map permitted MMIO regions */
> -    if ( !iomem_access_permitted(d, mfn_x(mfn), mfn_x(mfn) + 1) )
> +    if ( !iomem_access_permitted(d, mfn_x(mfn), mfn_x(mfn)) )
>           return false;
>   
>       return !map_regions_p2mt(d, gfn, 1, mfn, p2m_mmio_direct_c);
> 

-- 
Julien Grall

