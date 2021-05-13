Return-Path: <SRS0=0ON0=KI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 010ACC433ED
	for <xen-devel@archiver.kernel.org>; Thu, 13 May 2021 06:11:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E232613E6
	for <xen-devel@archiver.kernel.org>; Thu, 13 May 2021 06:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E232613E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.126489.238127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lh4Yf-0001WA-WF; Thu, 13 May 2021 06:10:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126489.238127; Thu, 13 May 2021 06:10:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lh4Yf-0001W3-Sy; Thu, 13 May 2021 06:10:53 +0000
Received: by outflank-mailman (input) for mailman id 126489;
 Thu, 13 May 2021 06:10:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4Mxh=KI=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1lh4Ye-0001Vx-Jd
 for xen-devel@lists.xenproject.org; Thu, 13 May 2021 06:10:52 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 780289eb-2339-4154-b73a-d4fbc703e19e;
 Thu, 13 May 2021 06:10:50 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 90E7A67373; Thu, 13 May 2021 08:10:48 +0200 (CEST)
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
X-Inumbo-ID: 780289eb-2339-4154-b73a-d4fbc703e19e
Date: Thu, 13 May 2021 08:10:48 +0200
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
	jgross@suse.com, hch@lst.de,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v2 1/3] xen/arm: move xen_swiotlb_detect to
 arm/swiotlb-xen.h
Message-ID: <20210513061048.GA26335@lst.de>
References: <alpine.DEB.2.21.2105121313060.5018@sstabellini-ThinkPad-T480s> <20210512201823.1963-1-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210512201823.1963-1-sstabellini@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

