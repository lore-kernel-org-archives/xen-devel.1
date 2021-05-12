Return-Path: <SRS0=7qAe=KH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39EB7C433ED
	for <xen-devel@archiver.kernel.org>; Wed, 12 May 2021 07:27:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCA4D613EE
	for <xen-devel@archiver.kernel.org>; Wed, 12 May 2021 07:27:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCA4D613EE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.126153.237483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgjGb-0005zd-Vj; Wed, 12 May 2021 07:26:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126153.237483; Wed, 12 May 2021 07:26:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgjGb-0005zW-Ri; Wed, 12 May 2021 07:26:49 +0000
Received: by outflank-mailman (input) for mailman id 126153;
 Wed, 12 May 2021 07:26:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6NHd=KH=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1lgjGb-0005zQ-CT
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 07:26:49 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 618a88ed-57e8-4ba7-a9af-ca60e4609b20;
 Wed, 12 May 2021 07:26:48 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 90F4A67373; Wed, 12 May 2021 09:26:45 +0200 (CEST)
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
X-Inumbo-ID: 618a88ed-57e8-4ba7-a9af-ca60e4609b20
Date: Wed, 12 May 2021 09:26:45 +0200
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, hch@lst.de,
	linux-kernel@vger.kernel.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	boris.ostrovsky@oracle.com, jgross@suse.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] xen/arm64: do not set SWIOTLB_NO_FORCE when
 swiotlb is required
Message-ID: <20210512072645.GA22396@lst.de>
References: <20210511174142.12742-1-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511174142.12742-1-sstabellini@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

> -int xen_swiotlb_detect(void)
> -{
> -	if (!xen_domain())
> -		return 0;
> -	if (xen_feature(XENFEAT_direct_mapped))
> -		return 1;
> -	/* legacy case */
> -	if (!xen_feature(XENFEAT_not_direct_mapped) && xen_initial_domain())
> -		return 1;
> -	return 0;
> -}

I think this move should be a separate prep patch.

