Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA342CA5FFC
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 16:14:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442549.1660101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEUHb-000302-QY; Wed, 07 Oct 2026 16:14:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442549.1660101; Wed, 07 Oct 2026 16:14:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEUHb-0002zu-NA; Wed, 07 Oct 2026 16:14:19 +0000
Received: by outflank-mailman (input) for mailman id 1442549;
 Wed, 07 Oct 2026 16:14:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xEUHZ-0002z0-U8
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 16:14:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xEUHZ-001i6y-1O;
 Wed, 07 Oct 2026 16:14:17 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xEUHZ-003XMO-0L;
 Wed, 07 Oct 2026 16:14:17 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=wyyl9UAOzk73xXmM5mfnr7RlHBErYaRJAGrqdTLMHKY=; b=ojvH39jRu28XUEDTV2jPEHrKae
	Y7yuh4xZVCxvfeMTU4zdemzOiKFBkEuBHzUNfyLjSBDeAV3OrK6jQKm4BqqSaWUcsHEy6KASxds5J
	N2ctFcnl3ot/xM1Ix3gARC4SmEq5XE6BCBkqkb1+GF9N8nz2y6q7v4Cn+kfHzSt7sxaQ=;
Date: Wed, 7 Oct 2026 18:14:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: George Dunlap <gwd@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v3 04/18] x86/domain_page: drop redundant
 create_perdomain_mapping() call
Message-ID: <asZv13b7RYIfMsmd@Mac.lan>
References: <20261007104051.48841-1-gwd@xenproject.org>
 <20261007104051.48841-5-gwd@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261007104051.48841-5-gwd@xenproject.org>

On Wed, Oct 07, 2026 at 11:40:37AM +0100, George Dunlap wrote:
> From: Roger Pau Monné <roger.pau@citrix.com>
> 
> We want to change per-domain mappings to be per-vCPU mappings.  In
> preparation for that, we want to arrange that
> create_perdomain_mapping() work either with a single perdomain area,
> or with a per-vCPU perdomain area.
> 
> One of the current calls in a domain context turns out to be
> unnecessary:
> 
> mapcache_domain_init() pre-plumbs L1 tables over the whole
> inuse/garbage bitmap range (sized for the full MAPCACHE_ENTRIES
> capacity), without populating any data pages.  The plumbing is
> redundant: mapcache_vcpu_init() installs the bitmap pages the domain
> will actually use with populating calls, which allocate any missing
> page-table structure on demand -- and since d->max_vcpus is fixed
> before any vCPU is created, the range those calls cover never grows.
> The pre-plumbed tail beyond it backs virtual addresses that are never
> populated at all.
> 
> In debug builds, and on hosts with memory hotplug or with more memory
> than the PV directmap covers, the call was also what first allocated a
> PV domain's per-domain L3.  Release builds on other hosts already
> allocated it only with the first vCPU.
> 
> Drop the call; now we always allocate only with the first vCPU.
> 
> With the only fallible operation gone, mapcache_domain_init() becomes
> void, and arch_domain_create()'s error handling for it goes away.
> 
> The per-domain-mapping work in mapcache_vcpu_init() stays where it is
> rather than moving into mapcache_domain_init() along with this change,
> ready for a later patch which introduces per-vCPU mapcaches.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8, Claude Code:claude-opus-5-5
> Signed-off-by: George Dunlap <gwd@xenproject.org>

Reviewed-by: Roger Pau Monné <roger@xenproject.org>

Thanks, Roger.

