Return-Path: <SRS0=Vd0m=MI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31710C12002
	for <xen-devel@archiver.kernel.org>; Fri, 16 Jul 2021 06:32:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3E11613E7
	for <xen-devel@archiver.kernel.org>; Fri, 16 Jul 2021 06:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3E11613E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.157000.289733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4HOx-0006Gr-3S; Fri, 16 Jul 2021 06:32:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157000.289733; Fri, 16 Jul 2021 06:32:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4HOx-0006Gk-0W; Fri, 16 Jul 2021 06:32:47 +0000
Received: by outflank-mailman (input) for mailman id 157000;
 Fri, 16 Jul 2021 06:32:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=acOe=MI=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1m4HOv-0006Ga-3s
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 06:32:45 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a0a2ecca-e5ff-11eb-894d-12813bfff9fa;
 Fri, 16 Jul 2021 06:32:44 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2BDE767373; Fri, 16 Jul 2021 08:32:42 +0200 (CEST)
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
X-Inumbo-ID: a0a2ecca-e5ff-11eb-894d-12813bfff9fa
Date: Fri, 16 Jul 2021 08:32:41 +0200
From: Christoph Hellwig <hch@lst.de>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org,
	xen-devel@lists.xenproject.org, Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Stephen Bates <sbates@raithlin.com>,
	Martin Oliveira <martin.oliveira@eideticom.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v1 14/16] x86/amd_gart: return error code from
 gart_map_sg()
Message-ID: <20210716063241.GC13345@lst.de>
References: <20210715164544.6827-1-logang@deltatee.com> <20210715164544.6827-15-logang@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210715164544.6827-15-logang@deltatee.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Jul 15, 2021 at 10:45:42AM -0600, Logan Gunthorpe wrote:
> @@ -458,7 +460,7 @@ static int gart_map_sg(struct device *dev, struct scatterlist *sg, int nents,
>  	iommu_full(dev, pages << PAGE_SHIFT, dir);
>  	for_each_sg(sg, s, nents, i)
>  		s->dma_address = DMA_MAPPING_ERROR;
> -	return 0;
> +	return ret;

While we're at it - setting the ->dma_address to DMA_MAPPING_ERROR is
not part of the ->map_sg calling convention.  Might be worth to fix
up while we're at it.

