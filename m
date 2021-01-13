Return-Path: <SRS0=UsJP=GQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 583F1C433E0
	for <xen-devel@archiver.kernel.org>; Wed, 13 Jan 2021 12:28:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAB7123329
	for <xen-devel@archiver.kernel.org>; Wed, 13 Jan 2021 12:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAB7123329
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.66435.117973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzfFq-0003kP-LF; Wed, 13 Jan 2021 12:28:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66435.117973; Wed, 13 Jan 2021 12:28:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzfFq-0003kI-HO; Wed, 13 Jan 2021 12:28:02 +0000
Received: by outflank-mailman (input) for mailman id 66435;
 Wed, 13 Jan 2021 12:28:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=77Up=GQ=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1kzfFo-0003kD-Kj
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 12:28:00 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e9c37d32-9dcf-41e0-b984-737fe8fd4e40;
 Wed, 13 Jan 2021 12:27:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 45BAB2313E;
 Wed, 13 Jan 2021 12:27:58 +0000 (UTC)
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
X-Inumbo-ID: e9c37d32-9dcf-41e0-b984-737fe8fd4e40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1610540878;
	bh=DMT/14eqvz5zf53FuIMip/3tOpUYx9AeGju+aNpk6Tg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RIeWKwdCzel81a5/+igwlQa7a96S4uuDSVMhO/TwoBeDkIRVbX+C6VT/zl3DHzGuy
	 TN7OjM0+Zieesb8xP+RgbKU5rKX0cUd7nzCdBCw4R29wCGdqUIBnkZaVV1OJ6+Cnca
	 DxODljnCCEJbvE8Rkq5e8BMdF1IFL/e9Km/FCSDg=
Date: Wed, 13 Jan 2021 13:29:05 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Claire Chang <tientzu@chromium.org>, robh+dt@kernel.org,
	mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
	joro@8bytes.org, will@kernel.org, frowand.list@gmail.com,
	konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com,
	sstabellini@kernel.org, m.szyprowski@samsung.com,
	robin.murphy@arm.com, grant.likely@arm.com, xypron.glpk@gmx.de,
	treding@nvidia.com, mingo@kernel.org, bauerman@linux.ibm.com,
	peterz@infradead.org, saravanak@google.com,
	rafael.j.wysocki@intel.com, heikki.krogerus@linux.intel.com,
	andriy.shevchenko@linux.intel.com, rdunlap@infradead.org,
	dan.j.williams@intel.com, bgolaszewski@baylibre.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org, tfiga@chromium.org,
	drinkcat@chromium.org
Subject: Re: [RFC PATCH v3 2/6] swiotlb: Add restricted DMA pool
Message-ID: <X/7nkb/YDpKlakRO@kroah.com>
References: <20210106034124.30560-1-tientzu@chromium.org>
 <20210106034124.30560-3-tientzu@chromium.org>
 <X/VrqxcaAMi65CF0@kroah.com>
 <20210113115126.GB29376@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113115126.GB29376@lst.de>

On Wed, Jan 13, 2021 at 12:51:26PM +0100, Christoph Hellwig wrote:
> On Wed, Jan 06, 2021 at 08:50:03AM +0100, Greg KH wrote:
> > > --- a/include/linux/device.h
> > > +++ b/include/linux/device.h
> > > @@ -413,6 +413,7 @@ struct dev_links_info {
> > >   * @dma_pools:	Dma pools (if dma'ble device).
> > >   * @dma_mem:	Internal for coherent mem override.
> > >   * @cma_area:	Contiguous memory area for dma allocations
> > > + * @dma_io_tlb_mem: Internal for swiotlb io_tlb_mem override.
> > 
> > Why does this have to be added here?  Shouldn't the platform-specific
> > code handle it instead?
> 
> The whole code added here is pretty generic.  What we need to eventually
> do, though is to add a separate dma_device instead of adding more and more
> bloat to struct device.

I have no objections for that happening!

