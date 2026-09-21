Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E456C982DE
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 07:01:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427102.1649735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8Y17-0002K2-Is; Mon, 21 Sep 2026 07:00:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427102.1649735; Mon, 21 Sep 2026 07:00:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8Y17-0002Jv-Fe; Mon, 21 Sep 2026 07:00:45 +0000
Received: by outflank-mailman (input) for mailman id 1427102;
 Mon, 21 Sep 2026 07:00:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <lance.yang@linux.dev>) id 1x8Y15-0002Jp-84
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 07:00:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8Y14-00BIjj-Ka
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 09:00:42 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <lance.yang@linux.dev>)
 id 6ab0d61a-2eae-0a2a0a5409dd-0a2a450bae24-0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 09:00:42 +0200
Received: from [91.218.175.183] (helo=mta0.migadu.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <lance.yang@linux.dev>)
 id 6ab0d619-b7e8-0a2a450b0019-5bdaafb7aac2-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 09:00:41 +0200
Received: by smtp.migadu.com with ESMTPS id 6ebfb9316ecf8394;
 Mon, 21 Sep 2026 07:00:40 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=key1 header.d=linux.dev header.i="@linux.dev" header.h="From:To:Subject:Date:Message-ID:MIME-Version:Content-Type"
X-Envelope-To: xen-devel@lists.xenproject.org
DKIM-Signature: a=rsa-sha256; bh=TLZQlQIDzt2OohWOO5wD38jaj3Gdn2F1Ht1VsE34Ej0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789974040; v=1; x=1790578840;
 b=I6PFtfnLwAItmk5ez6jrUL842Fp5IqmdFIy/CLempbTd9dRNLwt0e1m45kgHAwjtXINEYp0O
 Y0Q2roic6ZdTUhReWoIjh7sxlul64e4Ki/jC7lQNY2VSG21brJpeAgfPjvkyCG2+gB6ry4aGB/q
 6in6CziMVVAW4Eh9y8dfa9Gg=
X-Envelope-To: xen-devel@lists.xenproject.org
X-Mizu-Trace-ID: 6ebfb9316ecf8394
X-Migadu-Flow: FLOW_OUT
Message-ID: <01cfa2f8-753b-428b-932f-470a46221b4d@linux.dev>
Date: Mon, 21 Sep 2026 15:00:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/17] xen/grant-table: stop setting PG_private on
 pages for grant mapping
Content-Language: en-US
To: Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, David Hildenbrand <david@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Alistair Popple <apopple@nvidia.com>, Suren Baghdasaryan
 <surenb@google.com>, Muchun Song <muchun.song@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>, Nico Pache
 <nico.pache@linux.dev>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Kairui Song <kasong@tencent.com>,
 linux-kernel@vger.kernel.org, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Juergen Gross <jgross@suse.com>,
 Gregory Price <gourry@gourry.net>, Qi Zheng <qi.zheng@linux.dev>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, Ying Huang <ying.huang@linux.alibaba.com>,
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>
References: <20260920-remove-pg_private-v5-0-bb68b6a21869@nvidia.com>
 <20260920-remove-pg_private-v5-3-bb68b6a21869@nvidia.com>
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20260920-remove-pg_private-v5-3-bb68b6a21869@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1789974042-AB2DC9EA-168DB269/0/0
X-purgate-type: clean
X-purgate-size: 941



On 2026/9/21 10:27, Zi Yan wrote:
> gnttab_alloc_pages() stores xen_page_foreign in page->private. On 32-bit, a
> pointer to an allocated xen_page_foreign is stored; on 64-bit,
> xen_page_foreign is stored inline. Checking page->private != NULL is enough
> to tell whether a xen_page_foreign needs to be freed on 32-bit and
> page->private is zeroed unconditionally on 64-bit.
> 
> It prepares for a future commit that remove PG_private.
> 
> No functional change intended.
> 
> Assisted-by: LLM
> To: Juergen Gross <jgross@suse.com>
> To: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Cc: xen-devel@lists.xenproject.org
> Cc: linux-kernel@vger.kernel.org
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---

Nothing jumped out at me, feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>

