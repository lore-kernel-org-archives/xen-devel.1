Return-Path: <SRS0=c7Nm=N6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CBFC433EF
	for <xen-devel@archiver.kernel.org>; Wed,  8 Sep 2021 07:06:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFD46610E8
	for <xen-devel@archiver.kernel.org>; Wed,  8 Sep 2021 07:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DFD46610E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.181502.328644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNres-00079G-6j; Wed, 08 Sep 2021 07:06:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181502.328644; Wed, 08 Sep 2021 07:06:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNres-000799-3c; Wed, 08 Sep 2021 07:06:10 +0000
Received: by outflank-mailman (input) for mailman id 181502;
 Wed, 08 Sep 2021 07:06:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EHX5=N6=casper.srs.infradead.org=BATV+2e9f3f7219a4df6f1e93+6590+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1mNrer-000793-0h
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 07:06:09 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47745604-fee7-4bdb-b441-22ad7585a358;
 Wed, 08 Sep 2021 07:06:03 +0000 (UTC)
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mNrdA-008aSO-K1; Wed, 08 Sep 2021 07:04:35 +0000
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
X-Inumbo-ID: 47745604-fee7-4bdb-b441-22ad7585a358
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=u0jDPhGZwBkm+JMr6omQzYQizJyYgqZlwoU/jhm0G5s=; b=MlbsyzCdFKeIEDRfx1McK2amJc
	sZxrTxkScG/1WgXYGHD4V+bhWBRDZcajEMfSC3Rwh7B9lDj5xGPybecP4NGCxlvEnCQ5dAOw/mvQC
	Ne+YzN2biFxXb0cqjqdD5AOk5OTnSO86XUY8fGrf5F9OLSg1zVss0ee990dy8gbMeXRwV80gqaQDr
	AB/je8uC8iu7fwxs1wpvfFnQHp9bbN0RhMh1Yv+PeKByy9sQeiTX39GFwbTWNr1IIAGhJtTj1RjEi
	nMjgdiOKSed2JDSqDn7hI5nd+A9lN6PF4SsxMBk0Yvlq7ucqDs2VuYNkj6v52X1Qm7lpLLWu3Xn5N
	JDT+ugtg==;
Date: Wed, 8 Sep 2021 08:04:24 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 08/12] swiotlb-xen: arrange to have buffer info logged
Message-ID: <YThgeOiR0PU+iNlC@infradead.org>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
 <2e3c8e68-36b2-4ae9-b829-bf7f75d39d47@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e3c8e68-36b2-4ae9-b829-bf7f75d39d47@suse.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

On Tue, Sep 07, 2021 at 02:07:21PM +0200, Jan Beulich wrote:
> I consider it unhelpful that address and size of the buffer aren't put
> in the log file; it makes diagnosing issues needlessly harder. The
> majority of callers of swiotlb_init() also passes 1 for the "verbose"
> parameter. 
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

