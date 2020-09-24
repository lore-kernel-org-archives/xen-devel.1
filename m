Return-Path: <SRS0=okQV=DB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9774C4363D
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2020 10:10:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7199521D24
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2020 10:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7199521D24
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLOCh-0003Oo-9N; Thu, 24 Sep 2020 10:10:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pxis=DB=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kLOCg-0003Og-OP
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 10:10:18 +0000
X-Inumbo-ID: dc13e187-722b-44ad-a3b5-5c03fb915b93
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dc13e187-722b-44ad-a3b5-5c03fb915b93;
 Thu, 24 Sep 2020 10:10:17 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 047AC68AFE; Thu, 24 Sep 2020 12:10:14 +0200 (CEST)
Date: Thu, 24 Sep 2020 12:10:13 +0200
From: Christoph Hellwig <hch@lst.de>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: hch@lst.de, xen-devel@lists.xenproject.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Subject: Re: [bug report] x86/xen: open code alloc_vm_area in
 arch_gnttab_valloc
Message-ID: <20200924101013.GA21907@lst.de>
References: <20200924085044.GA1569000@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200924085044.GA1569000@mwanda>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Sep 24, 2020 at 11:50:44AM +0300, Dan Carpenter wrote:
> Hello Christoph Hellwig,
> 
> The patch a0e7ac6b4907: "x86/xen: open code alloc_vm_area in
> arch_gnttab_valloc" from Sep 23, 2020, leads to the following static
> checker warning:
> 
> 	arch/x86/xen/grant-table.c:110 arch_gnttab_valloc()
> 	warn: did you mean to pass the address of 'area->ptes'

This has been fixed up an done a bit differently in the current
version:

http://git.infradead.org/users/hch/misc.git/commitdiff/a44f0087ead305bc91cac704b99cbf27b4cca92a

