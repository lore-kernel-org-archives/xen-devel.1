Return-Path: <SRS0=Shbi=DH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2643FC4727E
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2020 14:49:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D22FF2076B
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2020 14:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D22FF2076B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.791.2639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNdPR-0003eI-MA; Wed, 30 Sep 2020 14:48:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791.2639; Wed, 30 Sep 2020 14:48:45 +0000
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
	id 1kNdPR-0003eB-Ij; Wed, 30 Sep 2020 14:48:45 +0000
Received: by outflank-mailman (input) for mailman id 791;
 Wed, 30 Sep 2020 14:48:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rf9I=DH=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kNdPQ-0003e6-KK
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 14:48:44 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7015b32e-c46d-4715-a212-62ce281ab1dc;
 Wed, 30 Sep 2020 14:48:43 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 873FE6736F; Wed, 30 Sep 2020 16:48:39 +0200 (CEST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rf9I=DH=lst.de=hch@srs-us1.protection.inumbo.net>)
	id 1kNdPQ-0003e6-KK
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 14:48:44 +0000
X-Inumbo-ID: 7015b32e-c46d-4715-a212-62ce281ab1dc
Received: from verein.lst.de (unknown [213.95.11.211])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7015b32e-c46d-4715-a212-62ce281ab1dc;
	Wed, 30 Sep 2020 14:48:43 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 873FE6736F; Wed, 30 Sep 2020 16:48:39 +0200 (CEST)
Date: Wed, 30 Sep 2020 16:48:39 +0200
From: Christoph Hellwig <hch@lst.de>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Christoph Hellwig <hch@lst.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Peter Zijlstra <peterz@infradead.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Chris Wilson <chris@chris-wilson.co.uk>,
	Matthew Auld <matthew.auld@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Minchan Kim <minchan@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Nitin Gupta <ngupta@vflare.org>, x86@kernel.org,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: Re: remove alloc_vm_area v2
Message-ID: <20200930144839.GA897@lst.de>
References: <20200924135853.875294-1-hch@lst.de> <20200925194349.d0ee9dbedb2ec48f0bfcd2ec@linux-foundation.org> <20200926062959.GA3427@lst.de> <160128801808.6464.1013594053120198786@jlahtine-mobl.ger.corp.intel.com> <20200928123741.GA4999@lst.de> <160138340987.15771.13645983702040612672@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <160138340987.15771.13645983702040612672@jlahtine-mobl.ger.corp.intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Sep 29, 2020 at 03:43:30PM +0300, Joonas Lahtinen wrote:
> Hmm, those are both committed after our last -next pull request, so they
> would normally only target next merge window. drm-next closes the merge
> window around -rc5 already.
> 
> But, in this specific case those are both Fixes: patches with Cc: stable,
> so they should be pulled into drm-intel-next-fixes PR.
> 
> Rodrigo, can you cherry-pick those patches to -next-fixes that you send
> to Dave?

They still haven't made it to linux-next.  I think for now I'll just
rebase without them again and then you can handle the conflicts for
5.11.

