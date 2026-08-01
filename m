Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03F3C55172
	for <xen-devel@archiver.kernel.org>; Sat,  1 Aug 2026 14:43:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1380254.1624255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqAv8-0005Se-Lr; Sat, 01 Aug 2026 14:42:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1380254.1624255; Sat, 01 Aug 2026 14:42:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqAv8-0005SX-Ij; Sat, 01 Aug 2026 14:42:38 +0000
Received: by outflank-mailman (input) for mailman id 1380254;
 Sat, 01 Aug 2026 14:42:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <usama.arif@linux.dev>) id 1wqAv6-0005SR-8R
 for xen-devel@lists.xenproject.org; Sat, 01 Aug 2026 14:42:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqAv4-009QRQ-BF
 for xen-devel@lists.xenproject.org; Sat, 01 Aug 2026 16:42:35 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <usama.arif@linux.dev>)
 id 6a6e05b7-e002-0a2a0a5209dd-0a2a450ba9c2-20
 for <xen-devel@lists.xenproject.org>; Sat, 01 Aug 2026 16:42:33 +0200
Received: from [91.218.175.185] (helo=out-185.mta0.migadu.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <usama.arif@linux.dev>)
 id 6a6e05d8-b7e8-0a2a450b0019-5bdaafb99398-3
 for <xen-devel@lists.xenproject.org>; Sat, 01 Aug 2026 16:42:32 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=key1 header.d=linux.dev header.i="@linux.dev" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785595351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9bAGXb0quOYyJBifFj3CMsobl7Wj528s8Q4pbvQG4r8=;
	b=NEVhQSZZKi4DShjfGxrZuPRqNtphOqe5pi5nbT5xk6bKbRruhnX8733czhr713IWW5JtNX
	lBIXPePnqdQ4ryvX+Ui/oO5FEIW8RXuUpYzDAhh8N6HVjtmRQGHRB2ii5QDX7Pypq+cifn
	JH9gGi4r4HorTfPR/8XI8D8vS+iUZ30=
From: Usama Arif <usama.arif@linux.dev>
To: Zi Yan <ziy@nvidia.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Kairui Song <kasong@tencent.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH RFC 03/14] xen/grant-table: stop setting PG_private on pages for grant mapping
Date: Sat,  1 Aug 2026 07:42:19 -0700
Message-ID: <20260801144223.1599317-1-usama.arif@linux.dev>
In-Reply-To: <20260731-remove-pg_private-v1-3-142c97ba3562@nvidia.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-purgate-ID: tlsNG-42698a/1785595353-1AEDE9EA-5B6B8159/0/0
X-purgate-type: clean
X-purgate-size: 2611

On Fri, 31 Jul 2026 22:13:26 -0400 Zi Yan <ziy@nvidia.com> wrote:

> gnttab_alloc_pages() stores xen_page_foreign in allocated page->private.

in allocated page->private "for 32-bit only".

> On 32-bit, a pointer to xen_page_foreign is stored; on 64-bit,
> xen_page_foreign is stored inline. Checking page->private != NULL is enough
> to tell whether a xen_page_foreign needs to be freed on 32-bit and
> page->private is zeroed unconditionally on 64-bit.
> 
> It prepares for a future commit that remove PG_private.
> 
> No funtional change intended.
> 
> Assisted-by: Claude:claude-opus-4-8
> Assisted-by: Codex:gpt-5
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> To: Juergen Gross <jgross@suse.com>
> To: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Cc: xen-devel@lists.xenproject.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/xen/balloon.c     | 5 +++++
>  drivers/xen/grant-table.c | 7 +++----
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
> index e7f1d4ca6d753..7f47b0ad05607 100644
> --- a/drivers/xen/balloon.c
> +++ b/drivers/xen/balloon.c
> @@ -182,6 +182,11 @@ static struct page *balloon_retrieve(bool require_lowmem)
>  
>  	__ClearPageOffline(page);
>  	dec_node_page_state(page, NR_BALLOON_PAGES);
> +	/*
> +	 * clear page->private before giving it out, since it might be used to
> +	 * store xen_page_foreign info.
> +	 */
> +	set_page_private(page, 0);
>  
>  	return page;
>  }
> diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
> index 35f879dc5dfb8..cc348ba2e0786 100644
> --- a/drivers/xen/grant-table.c
> +++ b/drivers/xen/grant-table.c
> @@ -875,7 +875,7 @@ int gnttab_pages_set_private(int nr_pages, struct page **pages)
>  
>  		set_page_private(pages[i], (unsigned long)foreign);
>  #endif
> -		SetPagePrivate(pages[i]);
> +		/* Data is stored in page->private on 64-bit */

On 64-bit arch you just iterate an empty for loop. Cleaner to put the
whole for loop in ifdef?

>  	}
>  
>  	return 0;
> @@ -1031,12 +1031,11 @@ void gnttab_pages_clear_private(int nr_pages, struct page **pages)
>  	int i;
>  
>  	for (i = 0; i < nr_pages; i++) {
> -		if (PagePrivate(pages[i])) {
>  #if BITS_PER_LONG < 64
> +		if (page_private(pages[i]))
>  			kfree((void *)page_private(pages[i]));
>  #endif
> -			ClearPagePrivate(pages[i]);
> -		}
> +		set_page_private(pages[i], 0);
>  	}
>  }
>  EXPORT_SYMBOL_GPL(gnttab_pages_clear_private);
> 
> -- 
> 2.53.0
> 
> 

