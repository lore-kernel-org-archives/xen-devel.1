Return-Path: <SRS0=BOky=EQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A97CC388F7
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2020 09:14:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E53620780
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2020 09:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E53620780
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.23101.49670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcPjP-0003N4-RE; Tue, 10 Nov 2020 09:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23101.49670; Tue, 10 Nov 2020 09:14:27 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcPjP-0003Mx-Mr; Tue, 10 Nov 2020 09:14:27 +0000
Received: by outflank-mailman (input) for mailman id 23101;
 Tue, 10 Nov 2020 09:14:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5gKK=EQ=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kcPjO-0003Ms-2a
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 09:14:26 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7885558-6f25-4fd1-90cd-264bd6d40d02;
 Tue, 10 Nov 2020 09:14:24 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 352EF6736F; Tue, 10 Nov 2020 10:14:22 +0100 (CET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5gKK=EQ=lst.de=hch@srs-us1.protection.inumbo.net>)
	id 1kcPjO-0003Ms-2a
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 09:14:26 +0000
X-Inumbo-ID: b7885558-6f25-4fd1-90cd-264bd6d40d02
Received: from verein.lst.de (unknown [213.95.11.211])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b7885558-6f25-4fd1-90cd-264bd6d40d02;
	Tue, 10 Nov 2020 09:14:24 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 352EF6736F; Tue, 10 Nov 2020 10:14:22 +0100 (CET)
Date: Tue, 10 Nov 2020 10:14:21 +0100
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>, xen-devel@lists.xenproject.org,
	iommu@lists.linux-foundation.org,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-5.10] swiotlb: remove the tbl_dma_addr argument to
 swiotlb_tbl_map_single
Message-ID: <20201110091421.GA23707@lst.de>
References: <20201023063309.3472987-1-hch@lst.de> <20201103094643.GA18936@lst.de> <20201104140438.GA16892@char.us.oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104140438.GA16892@char.us.oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Nov 04, 2020 at 09:04:38AM -0500, Konrad Rzeszutek Wilk wrote:
> On Tue, Nov 03, 2020 at 10:46:43AM +0100, Christoph Hellwig wrote:
> > ping?
> 
> Hopefully this goes through. I am in the process of testing it but ran
> into testing issues that I believe are unrelated.

Did you manage to make any progress?  This fixes an issue with the
new support for systems with DMA offsets in 5.10..

