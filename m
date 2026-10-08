Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619AECA6007
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 14:59:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443463.1660786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEpaJ-000126-7B; Thu, 08 Oct 2026 14:59:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443463.1660786; Thu, 08 Oct 2026 14:59:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEpaJ-00011z-3l; Thu, 08 Oct 2026 14:59:03 +0000
Received: by outflank-mailman (input) for mailman id 1443463;
 Thu, 08 Oct 2026 14:59:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xEpaH-00011p-LB
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 14:59:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xEpaH-003FtE-00;
 Thu, 08 Oct 2026 14:59:01 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xEpaG-00BZbl-24;
 Thu, 08 Oct 2026 14:59:00 +0000
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
	bh=9Cl7qznlPW73DNpmiIMzy+AWYFYOhUSvLiSZFtQPyVY=; b=FVjx74ACE/gdhH0qsK4ZiFa+zo
	h22zDNo1/bXEN/sIwXoELqNewGgj7EEOwVzNJHj2CdkOFGIViD1YDwVE3beYiJy9dTs3F1551Scuz
	P0c725x2W5jXCTtD7k29ruOoK1cCVVAa1cXe5txsFaHIQ5qJjNmP20Z0c250h1XLd+qU=;
Date: Thu, 8 Oct 2026 16:58:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: George Dunlap <gwd@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v3 12/18] x86/mm: let Xen's page-table walker operate on
 a given root
Message-ID: <asevstCHf5nfdw_L@Mac.lan>
References: <20261007104051.48841-1-gwd@xenproject.org>
 <20261007104051.48841-13-gwd@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261007104051.48841-13-gwd@xenproject.org>

On Wed, Oct 07, 2026 at 11:40:45AM +0100, George Dunlap wrote:
> map_pages_to_xen() and modify_xen_mappings() maintain Xen's own mappings,
> walking from idle_pg_table, whose Xen slots every other root page-table
> copies.  A later patch introduces a second directmap hierarchy: page
> tables for the directmap virtual address range that some guest contexts
> use in place of idle_pg_table's.  It needs the same maintenance at the
> same virtual addresses.

I assume that "second directmap hierarchy" refers to the sparse
directmap approach?

> Give virt_to_xen_l{3,2,1}e() the L4 to walk from, and move the bodies of
> map_pages_to_xen() and modify_xen_mappings() into map_pages_in() and
> modify_mappings_in(), which take the root as well.  The public functions
> pass idle_pg_table.  The EFI runtime-services page-tables mirror
> idle_pg_table's L4 entries only, so a newly allocated L3 is propagated
> to them only when the root is idle_pg_table.
> 
> TLB flushing is unaffected: it is by virtual address, and the same
> addresses are mapped in either hierarchy.

The virtual address space is just part of it, so far
map_pages_to_xen() has been doing global TLB flushes, because all CPUs
used the same page-tables for the Xen slots that map_pages_to_xen()
modifies.  With the change to pass different L4, there's also the
assumption that the Xen slots on those L4 will be different, and hence
not all CPUs might need flushing?

Maybe I'm thinking ahead too much - but if this is going to be used to
manage the sparse directmap we might want to avoid IPIs to CPUs that
are running with the full directmap when the sparse one is changed,
as those are useless.

Thanks, Roger.

