Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9DDCA600C
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 19:09:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443710.1660875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEtUE-0001IR-Lg; Thu, 08 Oct 2026 19:09:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443710.1660875; Thu, 08 Oct 2026 19:09:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEtUE-0001IK-Ih; Thu, 08 Oct 2026 19:09:02 +0000
Received: by outflank-mailman (input) for mailman id 1443710;
 Thu, 08 Oct 2026 19:09:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xEtUD-0001IE-9O
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 19:09:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xEtUC-003L7F-1d;
 Thu, 08 Oct 2026 19:09:00 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xEtUC-00DqP3-0Z;
 Thu, 08 Oct 2026 19:09:00 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=pL4BZT6JiKwWU1Tagwo1RutSMWGZUVear7peu41Yir4=; b=ZmX1T5c0H0CyWrDs11IUtugIBH
	KQXkGQrvhQ97W9I6V7eR0FkgyVX2NFSzCJw3cO83Ei3xXCxo3V63YwJDUQlP4DNkfmPlgxHLQUZ2m
	8voIS22FDli92a9kXqHzHsdBHv781yDyIbksjSAGZ0QabwdJLoP/skFrrUmuop6/dEJ0=;
Date: Thu, 8 Oct 2026 21:08:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: George Dunlap <gwd@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v3 16/18] x86/domain_page: keep the maphash's slots, not
 their mappings
Message-ID: <asfqSiiEE6elURr7@Mac.lan>
References: <20261007104051.48841-1-gwd@xenproject.org>
 <20261007104051.48841-17-gwd@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261007104051.48841-17-gwd@xenproject.org>

On Wed, Oct 07, 2026 at 11:40:49AM +0100, George Dunlap wrote:
> unmap_domain_page() keeps a recently unmapped slot in the vCPU's
> maphash (MAPHASH_ENTRIES, 8 per vCPU) for a quick remap of the same
> MFN, and leaves its PTE in place until the entry is displaced by a later
> unmap or reclaimed by a full cache.  Until then the page stays mapped,
> although nothing refers to the mapping and the mapcache holds no
> reference to the page.  A page freed meanwhile and handed to another
> domain stays mapped in the previous user's mapcache: in the vCPU's own
> area for a domain with per-vCPU page-tables, in the domain-wide area of
> a PV domain, where all of its vCPUs can reach it.
> 
> While the full directmap is loaded, that reaches nothing it does not
> map anyway.  On the sparse view of the directmap, Xen reaches
> domain-heap memory only through mappings made for the purpose, and a
> mapping kept in the maphash would leave another domain's page
> reachable from a context which has nothing to do with it.
> 
> Keep the slot, not the mapping: unmapping the last reference zaps the
> PTE and keeps the hash entry, and a later hit maps the page again in the
> same slot.  The slot has mapped nothing else in between, so that needs
> no flush.  Reusing the slot for another page still goes through the
> garbage map, or through the replacement of a hash entry when the cache
> is full, both of which flush first.  A translation of the zapped PTE
> left in a TLB is covered, for owned pages, by the flush the page
> allocator arranges before a freed page is reused wherever a sparse view
> is configured ("x86/mm: flush owned pages before reuse with the sparse
> directmap view").

As commented on the previous patch, I'm not convinced that's enough.
I do think we need to do a flush here, as it's not so much as the page
being used by another domain (or by Xen itself), internally the guest
might also have different contexts and we should prevent leaks between
them.

> 
> The cost is one PTE write per unmap into the maphash and per remap from
> it.  A second unmap of an entry in the maphash now finds its PTE not
> present and is caught by the check unmap_domain_page() has for entries
> the first unmap zapped, rather than by the reference count's ASSERT()
> in debug builds only.
> 
> The change does not depend on asi= or on a sparse view of the directmap
> being configured.  PV vCPUs use the domain-wide mapcache on the default
> command line too: in debug builds for every page, in release builds for
> pages beyond the reach of the full directmap in their page-tables (5TiB,
> 3.5TiB with CONFIG_BIGMEM).

There's likely no need to mention again the exact conditions that make
the mapcache active for PV domains, that's IMO too verbose and doesn't
add anything of value to the reasoning here.

Thanks, Roger.

