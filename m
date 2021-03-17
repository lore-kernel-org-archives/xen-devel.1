Return-Path: <SRS0=alo8=IP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68327C433E0
	for <xen-devel@archiver.kernel.org>; Wed, 17 Mar 2021 13:54:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E792964EF3
	for <xen-devel@archiver.kernel.org>; Wed, 17 Mar 2021 13:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E792964EF3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.98710.187391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMWcB-0000Ou-2P; Wed, 17 Mar 2021 13:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98710.187391; Wed, 17 Mar 2021 13:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMWcA-0000On-VN; Wed, 17 Mar 2021 13:53:34 +0000
Received: by outflank-mailman (input) for mailman id 98710;
 Wed, 17 Mar 2021 13:53:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+YAO=IP=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1lMWc9-0000Oh-HD
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 13:53:33 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68aeecdd-82e1-4cbf-9ec1-d43e61e727dd;
 Wed, 17 Mar 2021 13:53:32 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C896B68BFE; Wed, 17 Mar 2021 14:53:27 +0100 (CET)
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
X-Inumbo-ID: 68aeecdd-82e1-4cbf-9ec1-d43e61e727dd
Date: Wed, 17 Mar 2021 14:53:27 +0100
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>, Michael Ellerman <mpe@ellerman.id.au>,
	iommu@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
	Claire Chang <tientzu@chromium.org>, linuxppc-dev@lists.ozlabs.org,
	Dongli Zhang <dongli.zhang@oracle.com>
Subject: Re: [PATCH 12/14] swiotlb: move global variables into a new
 io_tlb_mem structure
Message-ID: <20210317135327.GA10797@lst.de>
References: <20210301074436.919889-1-hch@lst.de> <20210301074436.919889-13-hch@lst.de> <20210317134204.GA315788@konrad-char-us-oracle-com.allregionaliads.osdevelopmeniad.oraclevcn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210317134204.GA315788@konrad-char-us-oracle-com.allregionaliads.osdevelopmeniad.oraclevcn.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Mar 17, 2021 at 01:42:07PM +0000, Konrad Rzeszutek Wilk wrote:
> > -	alloc_size = PAGE_ALIGN(io_tlb_nslabs * sizeof(size_t));
> > -	io_tlb_alloc_size = memblock_alloc(alloc_size, PAGE_SIZE);
> > -	if (!io_tlb_alloc_size)
> > -		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
> > -		      __func__, alloc_size, PAGE_SIZE);
> 
> Shouldn't this be converted to:
> 	mem->alloc_size = memblock_alloc(alloc_size, PAGE_SIZE);
> 	if (...)
> 
> Seems that it got lost in the search and replace?

Yes, I messed that up during the rebase.  That being said it magically
gets fixed in the next patch..

