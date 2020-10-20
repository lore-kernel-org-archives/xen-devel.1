Return-Path: <SRS0=M+rI=D3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65AD1C4363A
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2020 17:20:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E04C62222D
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2020 17:20:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E04C62222D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.9753.25710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUvJD-000562-0A; Tue, 20 Oct 2020 17:20:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9753.25710; Tue, 20 Oct 2020 17:20:26 +0000
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
	id 1kUvJC-00055v-TP; Tue, 20 Oct 2020 17:20:26 +0000
Received: by outflank-mailman (input) for mailman id 9753;
 Tue, 20 Oct 2020 17:20:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CtYs=D3=suse.cz=vbabka@srs-us1.protection.inumbo.net>)
 id 1kUvJA-00055p-RC
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 17:20:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4c8e74e-8ca4-4db0-8519-c179f02554a1;
 Tue, 20 Oct 2020 17:20:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EDB3BAC23;
 Tue, 20 Oct 2020 17:20:22 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=CtYs=D3=suse.cz=vbabka@srs-us1.protection.inumbo.net>)
	id 1kUvJA-00055p-RC
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 17:20:24 +0000
X-Inumbo-ID: b4c8e74e-8ca4-4db0-8519-c179f02554a1
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b4c8e74e-8ca4-4db0-8519-c179f02554a1;
	Tue, 20 Oct 2020 17:20:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id EDB3BAC23;
	Tue, 20 Oct 2020 17:20:22 +0000 (UTC)
Subject: Re: [PATCH v2 3/5] mm/page_alloc: move pages to tail in
 move_to_free_list()
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, linux-hyperv@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Oscar Salvador <osalvador@suse.de>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>, Michal Hocko <mhocko@kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, Mike Rapoport <rppt@kernel.org>,
 Scott Cheloha <cheloha@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <20201005121534.15649-1-david@redhat.com>
 <20201005121534.15649-4-david@redhat.com>
From: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <505935d6-90d2-3fce-57f0-5946968d6372@suse.cz>
Date: Tue, 20 Oct 2020 19:20:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201005121534.15649-4-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/5/20 2:15 PM, David Hildenbrand wrote:
> Whenever we move pages between freelists via move_to_free_list()/
> move_freepages_block(), we don't actually touch the pages:
> 1. Page isolation doesn't actually touch the pages, it simply isolates
>     pageblocks and moves all free pages to the MIGRATE_ISOLATE freelist.
>     When undoing isolation, we move the pages back to the target list.
> 2. Page stealing (steal_suitable_fallback()) moves free pages directly
>     between lists without touching them.
> 3. reserve_highatomic_pageblock()/unreserve_highatomic_pageblock() moves
>     free pages directly between freelists without touching them.
> 
> We already place pages to the tail of the freelists when undoing isolation
> via __putback_isolated_page(), let's do it in any case (e.g., if order <=
> pageblock_order) and document the behavior. To simplify, let's move the
> pages to the tail for all move_to_free_list()/move_freepages_block() users.
> 
> In 2., the target list is empty, so there should be no change. In 3.,
> we might observe a change, however, highatomic is more concerned about
> allocations succeeding than cache hotness - if we ever realize this
> change degrades a workload, we can special-case this instance and add a
> proper comment.
> 
> This change results in all pages getting onlined via online_pages() to
> be placed to the tail of the freelist.
> 
> Reviewed-by: Oscar Salvador <osalvador@suse.de>
> Acked-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> Reviewed-by: Wei Yang <richard.weiyang@linux.alibaba.com>

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

