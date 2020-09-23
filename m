Return-Path: <SRS0=1HVP=DA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A97C7C4363D
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2020 06:11:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 406D121D43
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2020 06:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 406D121D43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKxzj-0006lW-Bh; Wed, 23 Sep 2020 06:11:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3Xh8=DA=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kKxzh-0006lB-UO
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 06:11:09 +0000
X-Inumbo-ID: 2072efdc-8d4b-437d-b5cf-d81d17894ead
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2072efdc-8d4b-437d-b5cf-d81d17894ead;
 Wed, 23 Sep 2020 06:11:06 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id DCEC767373; Wed, 23 Sep 2020 08:11:02 +0200 (CEST)
Date: Wed, 23 Sep 2020 08:11:02 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Christoph Hellwig <hch@lst.de>, Matthew Wilcox <willy@infradead.org>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-mm@kvack.org,
 Peter Zijlstra <peterz@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Andrew Morton <akpm@linux-foundation.org>,
 intel-gfx@lists.freedesktop.org, Nitin Gupta <ngupta@vflare.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/6] drm/i915: use vmap in shmem_pin_map
Message-ID: <20200923061102.GA15762@lst.de>
References: <20200918163724.2511-1-hch@lst.de>
 <20200918163724.2511-4-hch@lst.de>
 <20200921191157.GX32101@casper.infradead.org> <20200922062249.GA30831@lst.de>
 <43d10588-2033-038b-14e4-9f41cd622d7b@linux.intel.com>
 <20200922143141.GA26637@lst.de>
 <e429c3e6-2143-f51a-4c1c-c1470076ad3e@linux.intel.com>
 <20200922163346.GA1701@lst.de>
 <1b05b9d6-a14c-85cd-0728-d0d40c9ff84b@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b05b9d6-a14c-85cd-0728-d0d40c9ff84b@linux.intel.com>
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

On Tue, Sep 22, 2020 at 06:04:37PM +0100, Tvrtko Ursulin wrote:
> Only reason I can come up with now is if mapping side is on a latency 
> sensitive path, while un-mapping is lazy/delayed so can be more costly. 
> Then fast map and extra cost on unmap may make sense.

In general yes.  But compared to the overall operations a small kmalloc
is in the noise, so I'd really like to see numbers.

> It more applies to the other i915 patch, which implements a much more used 
> API, but whether or not we can demonstrate any difference in the perf 
> profiles I couldn't tell you without trying to collect some.

The other patch keeps the stack, as avoiding it would not simplify the
code as significantly.  I still doubt it is all that useful, though.


>> We could do vmalloc_to_page, but that is fairly expensive (not as bad
>> as reading from the page cache..).  Are you really worried about the
>> allocation?
>
> Not so much given how we don't even use shmem_pin_map outside selftests.
>
> If we start using it I expect it will be for tiny objects anyway. Only if 
> they end up being pinned for the lifetime of the driver, it may be a 
> pointless waste of memory compared to the downsides of vmalloc_to_page. But 
> we can revisit this particular edge case optimization if the need arises.

For tiny object we could either look into using kmap, or in fact
ensure the shmem files aren't in highmem, in which case you could
always use single-page mappings without any extra mapping.

