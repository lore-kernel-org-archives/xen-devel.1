Return-Path: <SRS0=iZSu=OA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D29A7C433EF
	for <xen-devel@archiver.kernel.org>; Fri, 10 Sep 2021 23:15:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94B3A611AD
	for <xen-devel@archiver.kernel.org>; Fri, 10 Sep 2021 23:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 94B3A611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.184837.333606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOpjb-00050y-Jl; Fri, 10 Sep 2021 23:15:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184837.333606; Fri, 10 Sep 2021 23:15:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOpjb-00050r-Go; Fri, 10 Sep 2021 23:15:03 +0000
Received: by outflank-mailman (input) for mailman id 184837;
 Fri, 10 Sep 2021 23:15:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WGUI=OA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mOpjZ-00050l-T1
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 23:15:01 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ebf57008-128c-11ec-b291-12813bfff9fa;
 Fri, 10 Sep 2021 23:15:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F03D7611F0;
 Fri, 10 Sep 2021 23:14:59 +0000 (UTC)
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
X-Inumbo-ID: ebf57008-128c-11ec-b291-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631315700;
	bh=vJNj/V5gr36eIctaJUoPC89yjzCT0LnaEG2pV27VBPs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OI1DCVnn0xilrmUuSWEetAwLMWahluaHTMFEFvR8u5WMW2j7EIqzKwJ1N7d0t7d9s
	 lYU8f6PgKS0MbktKeEwQcp2NeQbCMka68x6vdCQJAxBgj5AB7oop0aZViU2IW7L0mU
	 kjXLlPVNGTZUzphhrE7aW0f5RxAbNfdRlIU9s3TPG9EyPE/lphthLrGBoTcKxVf5qJ
	 3qSS6+CG2hoIvDciSe5YChDwDXz8taSyLT+YuVrM48k0MqfpcyRDr0oNmqYLnqP32/
	 bdsjTZMimIT1AGxLbKLfK+ZwPPntd/e60jOiTtXUOJs8McLFOwdZ5ePp1lk0G0l2XK
	 7YoiB+BS5ab5g==
Date: Fri, 10 Sep 2021 16:14:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Juergen Gross <jgross@suse.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    lkml <linux-kernel@vger.kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 04/12] swiotlb-xen: ensure to issue well-formed
 XENMEM_exchange requests
In-Reply-To: <397bf325-f81e-e104-6142-e8c9c4955475@suse.com>
Message-ID: <alpine.DEB.2.21.2109101613130.10523@sstabellini-ThinkPad-T480s>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com> <397bf325-f81e-e104-6142-e8c9c4955475@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 7 Sep 2021, Jan Beulich wrote:
> While the hypervisor hasn't been enforcing this, we would still better
> avoid issuing requests with GFNs not aligned to the requested order.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I wonder how useful it is to include the alignment in the panic()
> message.

Not very useful given that it is static. I don't mind either way but you
can go ahead and remove it if you prefer (and it would make the line
shorter.)


> I further wonder how useful it is to wrap "bytes" in
> PAGE_ALIGN(), when it is a multiple of a segment's size anyway (or at
> least was supposed to be, prior to "swiotlb-xen: maintain slab count
> properly").

This one I would keep, to make sure to print out the same amount passed
to memblock_alloc.


> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -231,10 +231,10 @@ retry:
>  	/*
>  	 * Get IO TLB memory from any location.
>  	 */
> -	start = memblock_alloc(PAGE_ALIGN(bytes), PAGE_SIZE);
> +	start = memblock_alloc(PAGE_ALIGN(bytes), IO_TLB_SEGSIZE << IO_TLB_SHIFT);
>  	if (!start)
> -		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
> -		      __func__, PAGE_ALIGN(bytes), PAGE_SIZE);
> +		panic("%s: Failed to allocate %lu bytes align=%#x\n",
> +		      __func__, PAGE_ALIGN(bytes), IO_TLB_SEGSIZE << IO_TLB_SHIFT);
>  
>  	/*
>  	 * And replace that memory with pages under 4GB.
> 

