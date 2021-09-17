Return-Path: <SRS0=v0KR=OH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B560C433F5
	for <xen-devel@archiver.kernel.org>; Fri, 17 Sep 2021 20:05:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C682C60F21
	for <xen-devel@archiver.kernel.org>; Fri, 17 Sep 2021 20:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C682C60F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.189688.339535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRK6P-0004XV-UY; Fri, 17 Sep 2021 20:04:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189688.339535; Fri, 17 Sep 2021 20:04:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRK6P-0004XO-QE; Fri, 17 Sep 2021 20:04:53 +0000
Received: by outflank-mailman (input) for mailman id 189688;
 Fri, 17 Sep 2021 20:04:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+WA1=OH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mRK6O-0004XI-QF
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 20:04:52 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b27a69a9-28b1-4f14-bfe1-52bd1bf787c7;
 Fri, 17 Sep 2021 20:04:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 18D11611C3;
 Fri, 17 Sep 2021 20:04:51 +0000 (UTC)
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
X-Inumbo-ID: b27a69a9-28b1-4f14-bfe1-52bd1bf787c7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631909091;
	bh=mEyjE0OtAQmdOBy6JF1uWMiaz+LsaQ2TOO9N0GzD4q8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TwffbNS4RL5k7jgYAk9bPvqGar9gPSXlDk7tGrFRJS6vG73q/79FwFr4xCCJNw66u
	 faPcb3eKXbUXcWv89rMvuYi/3EqZIZqPynZ0WV/pN974Hj6SuS9OvfoEUzia0kGSgw
	 mzsjR/DoMpf7tw4UA3fGaUygmCF//mPQMFR0RSwEkTVgEGfu0fJtHyKA2mJa1p15cL
	 7iBAO8W5stpj5jk+KUlDxzg1MU6JehWVMawg6sskx2DvAncMAwMtsqXL9ioGWwOMYY
	 VslTVrm1j8TiDQ36VTupNVotaWGVYguVOhI/f4EI09U3JMvFkddeor/0PdlCclJ7XV
	 T6eyo4p4Y6/pA==
Date: Fri, 17 Sep 2021 13:04:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Juergen Gross <jgross@suse.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    lkml <linux-kernel@vger.kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "hch@lst.de" <hch@lst.de>, Konrad Wilk <konrad.wilk@oracle.com>, 
    "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
Subject: Re: [PATCH v2 1/4] swiotlb-xen: ensure to issue well-formed
 XENMEM_exchange requests
In-Reply-To: <7b3998e3-1233-4e5a-89ec-d740e77eb166@suse.com>
Message-ID: <alpine.DEB.2.21.2109171304380.21985@sstabellini-ThinkPad-T480s>
References: <164e58ff-2edd-2c99-ac3d-e18eb06ff731@suse.com> <7b3998e3-1233-4e5a-89ec-d740e77eb166@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 17 Sep 2021, Jan Beulich wrote:
> While the hypervisor hasn't been enforcing this, we would still better
> avoid issuing requests with GFNs not aligned to the requested order.
> Instead of altering the value also in the call to panic(), drop it
> there for being static and hence easy to determine without being part
> of the panic message.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> I question how useful it is to wrap "bytes" in PAGE_ALIGN(), when it is
> a multiple of a segment's size anyway (or at least was supposed to be,
> prior to "swiotlb-xen: maintain slab count properly"). But that's
> perhaps yet another separate patch.
> ---
> v2: Drop logging of alignment. Wrap lines.
> 
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -230,10 +230,11 @@ retry:
>  	/*
>  	 * Get IO TLB memory from any location.
>  	 */
> -	start = memblock_alloc(PAGE_ALIGN(bytes), PAGE_SIZE);
> +	start = memblock_alloc(PAGE_ALIGN(bytes),
> +			       IO_TLB_SEGSIZE << IO_TLB_SHIFT);
>  	if (!start)
> -		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
> -		      __func__, PAGE_ALIGN(bytes), PAGE_SIZE);
> +		panic("%s: Failed to allocate %lu bytes\n",
> +		      __func__, PAGE_ALIGN(bytes));
>  
>  	/*
>  	 * And replace that memory with pages under 4GB.
> 

