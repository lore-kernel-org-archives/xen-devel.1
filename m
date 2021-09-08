Return-Path: <SRS0=c7Nm=N6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2D24C433F5
	for <xen-devel@archiver.kernel.org>; Wed,  8 Sep 2021 06:55:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CBA961104
	for <xen-devel@archiver.kernel.org>; Wed,  8 Sep 2021 06:55:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8CBA961104
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.181470.328589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNrUA-00032v-6J; Wed, 08 Sep 2021 06:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181470.328589; Wed, 08 Sep 2021 06:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNrUA-00032o-2U; Wed, 08 Sep 2021 06:55:06 +0000
Received: by outflank-mailman (input) for mailman id 181470;
 Wed, 08 Sep 2021 06:55:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EHX5=N6=casper.srs.infradead.org=BATV+2e9f3f7219a4df6f1e93+6590+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1mNrU8-00032N-AL
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 06:55:04 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ee8d88b-6697-42d9-a1a9-435fb2597190;
 Wed, 08 Sep 2021 06:54:59 +0000 (UTC)
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mNrSS-008a0O-5n; Wed, 08 Sep 2021 06:53:45 +0000
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
X-Inumbo-ID: 4ee8d88b-6697-42d9-a1a9-435fb2597190
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mNv6jBhL0dwmk4rDDYf4ikhCU0kC8phJg4t0M4uQRDc=; b=aE5y0hGlp2Xj4xb952dvEVdScM
	KnAkeo8HeySFYAkHcdp37IMVTE1i0gtREK8+yHbyQ5UCZahHa1/ncIMqtviCOSYTzL/AmK9KAmrfa
	GbkJD7rJALGnUYk7MMG+5GPjSi3u2vcTySZWbKcHBhIaTZfX4KhIV1b8fYvgn6mid2qUVy57Zv+xj
	bT3JLbdCLI2NEQBhgA864/cN0ICBGxedybXpxHkTrhaXYJUYyO3bprAOlD7SGZz90vpWEEFcJpiki
	keuEbK6oYViBMYnqTQotJTIhoHqzVhJ17AvLP/tLzLc46VGBhDiVNvg6j04I7IECrcc9WRWQ0W5gg
	EL39LFfg==;
Date: Wed, 8 Sep 2021 07:53:20 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 03/12] swiotlb-xen: maintain slab count properly
Message-ID: <YThd4HDvB3pBD2/F@infradead.org>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
 <dc054cb0-bec4-4db0-fc06-c9fc957b6e66@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc054cb0-bec4-4db0-fc06-c9fc957b6e66@suse.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

On Tue, Sep 07, 2021 at 02:05:12PM +0200, Jan Beulich wrote:
> Generic swiotlb code makes sure to keep the slab count a multiple of the
> number of slabs per segment. Yet even without checking whether any such
> assumption is made elsewhere, it is easy to see that xen_swiotlb_fixup()
> might alter unrelated memory when calling xen_create_contiguous_region()
> for the last segment, when that's not a full one - the function acts on
> full order-N regions, not individual pages.
> 
> Align the slab count suitably when halving it for a retry. Add a build
> time check and a runtime one. Replace the no longer useful local
> variable "slabs" by an "order" one calculated just once, outside of the
> loop. Re-use "order" for calculating "dma_bits", and change the type of
> the latter as well as the one of "i" while touching this anyway.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

