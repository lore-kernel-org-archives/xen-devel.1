Return-Path: <SRS0=1HVP=DA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB141C2D0A8
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2020 13:41:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86B1321D92
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2020 13:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86B1321D92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL51Q-0002JO-J1; Wed, 23 Sep 2020 13:41:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3Xh8=DA=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kL51P-0002JJ-Fn
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 13:41:23 +0000
X-Inumbo-ID: e5fa8310-dd11-4a05-b257-6ef68cad0b8b
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5fa8310-dd11-4a05-b257-6ef68cad0b8b;
 Wed, 23 Sep 2020 13:41:22 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4FDA86736F; Wed, 23 Sep 2020 15:41:18 +0200 (CEST)
Date: Wed, 23 Sep 2020 15:41:17 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-mm@kvack.org,
 Peter Zijlstra <peterz@infradead.org>,
 intel-gfx@lists.freedesktop.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Nitin Gupta <ngupta@vflare.org>
Subject: Re: [Intel-gfx] [PATCH 4/6] drm/i915: use vmap in i915_gem_object_map
Message-ID: <20200923134117.GB9893@lst.de>
References: <20200918163724.2511-1-hch@lst.de>
 <20200918163724.2511-5-hch@lst.de>
 <9b5d40af-7378-9e68-ca51-73b2148287f3@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b5d40af-7378-9e68-ca51-73b2148287f3@linux.intel.com>
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

On Wed, Sep 23, 2020 at 10:52:33AM +0100, Tvrtko Ursulin wrote:
>
> On 18/09/2020 17:37, Christoph Hellwig wrote:
>> i915_gem_object_map implements fairly low-level vmap functionality in
>> a driver.  Split it into two helpers, one for remapping kernel memory
>> which can use vmap, and one for I/O memory that uses vmap_pfn.
>>
>> The only practical difference is that alloc_vm_area prefeaults the
>> vmalloc area PTEs, which doesn't seem to be required here for the
>> kernel memory case (and could be added to vmap using a flag if actually
>> required).
>
> Patch looks good to me.
>
> Series did not get a CI run from our side because of a different base so I 
> don't know if you would like to have a run there? If so you would need to 
> rebase against git://anongit.freedesktop.org/drm-tip drm-tip and you could 
> even send a series to intel-gfx-trybot@lists.freedesktop.org, suppressing 
> cc, to check it out without sending a copy to the real mailing list.

It doesn't seem like I can post to any freedesktop list, as I always
get rejection messages.  But I'll happily prepare a branch if one
of you an feed it into your CI.

