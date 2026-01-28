Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC66BD35694
	for <xen-devel@archiver.kernel.org>; Wed, 28 Jan 2026 08:50:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1215263.1525471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl1FU-0005FS-Nr; Wed, 28 Jan 2026 08:50:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215263.1525471; Wed, 28 Jan 2026 08:50:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl1FU-0005F4-K1; Wed, 28 Jan 2026 08:50:04 +0000
Received: by outflank-mailman (input) for mailman id 1215263;
 Wed, 28 Jan 2026 08:50:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DdDL=AB=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1vl1FT-0004vd-HQ
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 08:50:03 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54ed9585-fc26-11f0-b160-2bf370ae4941;
 Wed, 28 Jan 2026 09:50:01 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
 id CEA75227A8E; Wed, 28 Jan 2026 09:49:58 +0100 (CET)
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
X-Inumbo-ID: 54ed9585-fc26-11f0-b160-2bf370ae4941
Date: Wed, 28 Jan 2026 09:49:58 +0100
From: Christoph Hellwig <hch@lst.de>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jens Axboe <axboe@kernel.dk>,
	Keith Busch <kbusch@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>
Subject: Re: [PATCH] nvme-pci: fix parameter order in nvme_free_sgls() call
Message-ID: <20260128084958.GB9373@lst.de>
References: <20260127195907.34563-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260127195907.34563-1-roger.pau@citrix.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Jan 27, 2026 at 08:59:06PM +0100, Roger Pau Monne wrote:
> The call to nvme_free_sgls() in nvme_unmap_data() has the sg_list and sge
> parameters swapped.  This wasn't noticed by the compiler because both share
> the same type.  On a Xen PV hardware domain, and possibly any other
> architectures that takes that path, this leads to corruption of the NVMe
> contents.
> 
> Fixes: f0887e2a52d4 ("nvme-pci: create common sgl unmapping helper")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> If possible it would be good for this to go in 6.19.0-rc8, as corruption of
> the root device as part of a kernel update is unexpected. Sadly 6.18
> already contained this issue, and no-one noticed, so its impact is limited?

This only affects non-IOMMU paths with a non-noop dma_unmap_phys.
So it is a very common setup, but very severe for those.  Because of
that we should get into 6.19-rc and -stable ASAP.

The fix looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

but maybe we can reword the subject to sound less harmless, e.g.:

nvme-pci: DMA unmap the correct regions in nvme_free_sgls

?

