Return-Path: <SRS0=MI8D=MR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7CA7C4338F
	for <xen-devel@archiver.kernel.org>; Sun, 25 Jul 2021 06:08:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EF2760F13
	for <xen-devel@archiver.kernel.org>; Sun, 25 Jul 2021 06:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8EF2760F13
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.160737.295210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m7XIo-0008JC-5N; Sun, 25 Jul 2021 06:07:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 160737.295210; Sun, 25 Jul 2021 06:07:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m7XIo-0008J5-28; Sun, 25 Jul 2021 06:07:54 +0000
Received: by outflank-mailman (input) for mailman id 160737;
 Sun, 25 Jul 2021 06:07:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wHM9=MR=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1m7XIm-0008Iz-Ro
 for xen-devel@lists.xenproject.org; Sun, 25 Jul 2021 06:07:52 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a4266ed8-ed0e-11eb-957d-12813bfff9fa;
 Sun, 25 Jul 2021 06:07:51 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 0DC2267373; Sun, 25 Jul 2021 08:07:48 +0200 (CEST)
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
X-Inumbo-ID: a4266ed8-ed0e-11eb-957d-12813bfff9fa
Date: Sun, 25 Jul 2021 08:07:47 +0200
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
	Martin Oliveira <martin.oliveira@eideticom.com>
Subject: Re: [PATCH v2 01/21] dma-mapping: Allow map_sg() ops to return
 negative error codes
Message-ID: <20210725060747.GA10852@lst.de>
References: <20210723175008.22410-1-logang@deltatee.com> <20210723175008.22410-2-logang@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210723175008.22410-2-logang@deltatee.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

> +int dma_map_sgtable(struct device *dev, struct sg_table *sgt,
> +		    enum dma_data_direction dir, unsigned long attrs)
> +{
> +	int nents;
> +
> +	nents = __dma_map_sg_attrs(dev, sgt->sgl, sgt->orig_nents, dir, attrs);
> +	if (nents == 0)
> +		return -EIO;
> +	else if (nents < 0) {
> +		if (WARN_ON_ONCE(nents != -EINVAL && nents != -ENOMEM &&
> +				 nents != -EIO))
> +			return -EIO;

I think this validation of the errnos needs to go into __dma_map_sg_attrs,
so that we catch it for the classic dma_map_sg callers as well.

