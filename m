Return-Path: <SRS0=c7Nm=N6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B182FC433F5
	for <xen-devel@archiver.kernel.org>; Wed,  8 Sep 2021 07:04:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77E1061100
	for <xen-devel@archiver.kernel.org>; Wed,  8 Sep 2021 07:04:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 77E1061100
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.181496.328633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNrck-0006Wy-Ph; Wed, 08 Sep 2021 07:03:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181496.328633; Wed, 08 Sep 2021 07:03:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNrck-0006Wr-MY; Wed, 08 Sep 2021 07:03:58 +0000
Received: by outflank-mailman (input) for mailman id 181496;
 Wed, 08 Sep 2021 07:03:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EHX5=N6=casper.srs.infradead.org=BATV+2e9f3f7219a4df6f1e93+6590+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1mNrcj-0006Wl-Il
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 07:03:57 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80301a52-5a33-41df-be3c-c5a0d125574b;
 Wed, 08 Sep 2021 07:03:55 +0000 (UTC)
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mNrbE-008aLp-HO; Wed, 08 Sep 2021 07:03:05 +0000
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
X-Inumbo-ID: 80301a52-5a33-41df-be3c-c5a0d125574b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gatW1BubQnKb2kduQto9Cf0sWBkeir64mglmf+pQf2Q=; b=k7G3Dc9dTikD/msbbkUkrK6bH/
	rcD7O+3KeLMyQ1++oVllKlyi8fr3OzWCFSPglsQEwTuZYSOeBs1r73L3/drk5ceobljVtDfydSKFB
	j/domY+VTpfr9Pk9f5rNEQqFYIDkHP5jTSDi9iVT3CSZOC35ka5bQlKxSolhcWPXaq/1QfK21G+ih
	COU4O1kTW2U6YdQXei4QY2KiZAUUKvTqMlzEA/VevxT4QnIBgJt2vBtZgAO4rpNo8bQHCz2QyPe5C
	fe2/HGVSMq4ipo4jC45iFAjbTS29+lrORLywMIyJG16unTn6UIJAoJaoEX8vMVXeRptUArk8CdQ0M
	IkU/sUdQ==;
Date: Wed, 8 Sep 2021 08:02:24 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 07/12] swiotlb-xen: drop leftover __ref
Message-ID: <YThgAClbSGQCBv5n@infradead.org>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
 <7cd163e1-fe13-270b-384c-2708e8273d34@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7cd163e1-fe13-270b-384c-2708e8273d34@suse.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

On Tue, Sep 07, 2021 at 02:06:55PM +0200, Jan Beulich wrote:
> Commit a98f565462f0 ("xen-swiotlb: split xen_swiotlb_init") should not
> only have added __init to the split off function, but also should have
> dropped __ref from the one left.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

