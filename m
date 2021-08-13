Return-Path: <SRS0=yX3p=NE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA697C4338F
	for <xen-devel@archiver.kernel.org>; Fri, 13 Aug 2021 12:38:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DC3860F51
	for <xen-devel@archiver.kernel.org>; Fri, 13 Aug 2021 12:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6DC3860F51
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.166792.304448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEWRq-0007hA-7L; Fri, 13 Aug 2021 12:38:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166792.304448; Fri, 13 Aug 2021 12:38:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEWRq-0007h3-4U; Fri, 13 Aug 2021 12:38:06 +0000
Received: by outflank-mailman (input) for mailman id 166792;
 Fri, 13 Aug 2021 12:38:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mEWRo-0007gq-W2
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 12:38:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mEWRo-0005n8-Nn; Fri, 13 Aug 2021 12:38:04 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mEWRo-0000ep-I1; Fri, 13 Aug 2021 12:38:04 +0000
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
	bh=FSHAQuD72Dpnk6fZ3Y/N822KAqDxa/7LY8sxuD0D6Do=; b=H3046KqSAEv/xlUsQ1uVqUBFdG
	7AWHSWqfhCDX8b43Bv71YiwAYyBmEyg5Gs/7KGKrP0O+UQQJjHIl2E85qohyTDOL1U+uBXLv1+nM3
	rmQ1D7ue/5yUoPPff4aF951KYC2UTOUaWkTtQFlHHZgl1NKhD9zoTFWbhppIeQUbaC5Q=;
Subject: Re: [PATCH V4 05/10] xen/arm: static memory initialization
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com
References: <20210728102758.3269446-1-penny.zheng@arm.com>
 <20210728102758.3269446-6-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0fb3df68-c94c-c4da-bcd1-f1fbdf429d37@xen.org>
Date: Fri, 13 Aug 2021 13:38:02 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210728102758.3269446-6-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Penny,

On 28/07/2021 11:27, Penny Zheng wrote:
> +/* Static memory initialization */
> +static void __init init_staticmem_pages(void)
> +{
> +    unsigned int bank;
> +
> +    /* TODO: Considering NUMA-support scenario. */

I forgot to ask about this. What do you expect to be different with NUMA?

> +    for ( bank = 0 ; bank < bootinfo.static_mem.nr_banks; bank++ )
> +    {
> +        unsigned long bank_start = PFN_UP(bootinfo.static_mem.bank[bank].start);
> +        unsigned long bank_size = PFN_DOWN(bootinfo.static_mem.bank[bank].size);
> +        unsigned long bank_end = bank_start + bank_size;
> +
> +        if ( bank_end <= bank_start )
> +            return;
> +
> +        free_staticmem_pages(mfn_to_page(_mfn(bank_start)),
> +                             bank_size, false);
> +    }
> +}
> +

Cheers,

-- 
Julien Grall

