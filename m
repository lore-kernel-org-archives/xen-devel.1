Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4445C27C4F
	for <xen-devel@archiver.kernel.org>; Sun, 30 Jun 2024 05:56:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.751061.1158936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNnXW-0005z2-KW; Sun, 30 Jun 2024 05:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751061.1158936; Sun, 30 Jun 2024 05:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNnXW-0005yv-HE; Sun, 30 Jun 2024 05:55:54 +0000
Received: by outflank-mailman (input) for mailman id 751061;
 Sun, 30 Jun 2024 05:55:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnWF=OA=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1sNnXU-0005yp-Mk
 for xen-devel@lists.xenproject.org; Sun, 30 Jun 2024 05:55:52 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 641c242d-36a5-11ef-b4bb-af5377834399;
 Sun, 30 Jun 2024 07:55:50 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3943868AFE; Sun, 30 Jun 2024 07:55:42 +0200 (CEST)
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
X-Inumbo-ID: 641c242d-36a5-11ef-b4bb-af5377834399
Date: Sun, 30 Jun 2024 07:55:42 +0200
From: "hch@lst.de" <hch@lst.de>
To: Michael Kelley <mhklinux@outlook.com>
Cc: Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>,
	"hch@lst.de" <hch@lst.de>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"will@kernel.org" <will@kernel.org>,
	"jgross@suse.com" <jgross@suse.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>,
	"m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC 1/1] swiotlb: Reduce calls to swiotlb_find_pool()
Message-ID: <20240630055542.GA5379@lst.de>
References: <20240607031421.182589-1-mhklinux@outlook.com> <SN6PR02MB41577686D72E206DB0084E90D4D62@SN6PR02MB4157.namprd02.prod.outlook.com> <20240627060251.GA15590@lst.de> <20240627085216.556744c1@meshulam.tesarici.cz> <SN6PR02MB4157E61B49C8435E38AC968DD4D72@SN6PR02MB4157.namprd02.prod.outlook.com> <20240627152513.GA23497@lst.de> <SN6PR02MB4157D9B1A64FF78461D6A7EDD4D72@SN6PR02MB4157.namprd02.prod.outlook.com> <20240628060129.GA26206@lst.de> <20240628094708.3a454619@meshulam.tesarici.cz> <SN6PR02MB415781789CBD6597142BEC68D4D12@SN6PR02MB4157.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR02MB415781789CBD6597142BEC68D4D12@SN6PR02MB4157.namprd02.prod.outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Sat, Jun 29, 2024 at 03:55:58PM +0000, Michael Kelley wrote:
> Unless there is further discussion on this point, I'll just keep the original
> "is_swiotlb_buffer()" in v2.

That is the wrong name for something that returns the pool as pointed
out before.

