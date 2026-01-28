Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE375D3F06D
	for <xen-devel@archiver.kernel.org>; Wed, 28 Jan 2026 14:23:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1215707.1525823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl6Rj-0005az-Rk; Wed, 28 Jan 2026 14:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215707.1525823; Wed, 28 Jan 2026 14:23:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl6Rj-0005as-Os; Wed, 28 Jan 2026 14:23:03 +0000
Received: by outflank-mailman (input) for mailman id 1215707;
 Wed, 28 Jan 2026 14:23:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DdDL=AB=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1vl6Ri-0005aL-KY
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 14:23:02 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8dac13a-fc54-11f0-9ccf-f158ae23cfc8;
 Wed, 28 Jan 2026 15:23:00 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B7173227AAC; Wed, 28 Jan 2026 15:22:55 +0100 (CET)
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
X-Inumbo-ID: d8dac13a-fc54-11f0-9ccf-f158ae23cfc8
Date: Wed, 28 Jan 2026 15:22:55 +0100
From: Christoph Hellwig <hch@lst.de>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Christoph Hellwig <hch@lst.de>, xen-devel@lists.xenproject.org,
	Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>
Subject: Re: [PATCH] nvme-pci: fix parameter order in nvme_free_sgls() call
Message-ID: <20260128142255.GA3210@lst.de>
References: <20260127195907.34563-1-roger.pau@citrix.com> <20260128084958.GB9373@lst.de> <aXnScGiFkX7ZFFdE@Mac.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXnScGiFkX7ZFFdE@Mac.lan>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Jan 28, 2026 at 10:10:08AM +0100, Roger Pau Monné wrote:
> > > the root device as part of a kernel update is unexpected. Sadly 6.18
> > > already contained this issue, and no-one noticed, so its impact is limited?
> > 
> > This only affects non-IOMMU paths with a non-noop dma_unmap_phys.
> > So it is a very common setup, but very severe for those.  Because of
> 
> Do you mean a "not very common setup"?  Otherwise I can't parse the
> sentence.

Yes, sorry.


