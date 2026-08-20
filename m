Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38973C5DF81
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2026 17:44:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1396845.1634485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx6o8-0000sc-AY; Thu, 20 Aug 2026 17:44:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1396845.1634485; Thu, 20 Aug 2026 17:44:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx6o8-0000sV-6d; Thu, 20 Aug 2026 17:44:04 +0000
Received: by outflank-mailman (input) for mailman id 1396845;
 Thu, 20 Aug 2026 17:44:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1wx6o6-0000sJ-9t
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 17:44:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wx6o5-00E233-18;
 Thu, 20 Aug 2026 17:44:01 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wx6o4-00DjFg-2C;
 Thu, 20 Aug 2026 17:44:00 +0000
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
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From;
	bh=4gjc2syBetsa8lvBC5l7yduRaUYNpizoHytXTmGrQPQ=; b=wrE2mtrh3bah6n6aqKG58FbOKo
	iEV0XRuOMYLuXpaePRAEDwBmk6k76Z5KgMMbz8i62ba6DibQRZOivb0MpvDvrhFDiEUJ7LdqAVWri
	Rh8M8zpxyOu87v1wJQZLUdUfbCO5oYL669ezFU3Udcedj2mmi7qF4D+bu2zLDx/wBhCY=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/7] x86: Address Space Isolation, part 1: per-domain area mapping rework
Date: Thu, 20 Aug 2026 18:43:40 +0100
Message-ID: <20260820-asi-part1-0-f2dbd92b8459@xenproject.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is the first batch of patches continuing the x86 Address Space
Isolation (ASI) work that Roger posted as "x86: adventures in Address
Space Isolation" (v1 [1], v2 [2]).  I've taken over finishing it up
and getting it upstream.

Rather than re-posting the whole stack (nearly 60 patches) each time,
I'd like to run this as a rolling series: post a reviewable slice from
the front, drop patches as they are committed, and append the next
ones as they mature.  Each batch should stand on its own; the cover
letter of each will say where it sits in the larger picture.

A "map" of the entire series -- grouped into logical chunks, with the
dependencies between patches -- is maintained here:

https://xenbits.xenproject.org/people/gdunlap/asi-series-deps.html

Note that the graph above is a work in progress; dependency lines may
change as more of the series is vetted.  Note also that the full
series includes a design doc as patch 1; that's not ready for
publication yet, so patches 1-7 of this series correspond to nodes 2-8
of the graph.

The problem this slice addresses: the per-domain area already has
central machinery for building its page-tables and for managing the
backing pages it owns itself (create_perdomain_mapping() and friends);
what it lacks is a way to install a caller's own pages at a chosen
address.  The PV GDT and LDT code fills that gap privately, by having
create_perdomain_mapping() hand back aliases of the L1 tables it
builds and stashing them in d->arch.pv.gdt_ldt_l1tab; mapping updates
are then written through the stash, bypassing the interface.  That
arrangement assumes a single, domain-wide set of per-domain
page-tables, which stops holding once the per-domain area becomes
per-vCPU (the next slices).

This slice closes the gap centrally:

 - Patch 1 moves the per-domain page-table allocations from the
   domheap to the xenheap.  The page-tables (not the data pages they
   map) are then reachable through their always-mapped alias from any
   context, so walking them needs no mapcache -- including from the
   context switch.
 - Patch 2 introduces populate_perdomain_mapping() on top: a single
   writer for the per-domain area, installing caller-owned pages at a
   chosen address by walking the always-mapped page-tables.
 - Patches 3-5 convert the Xen-GDT slot, the guest GDT, and the guest
   LDT paths to it.
 - Patch 6 removes the stash.  Patch 7 simplifies
   create_perdomain_mapping(), whose L1-capture mode existed only to
   build the stash.

One point reviewers may want to look at specifically: patch 1 changes
where the per-domain page-tables are allocated from, and its commit
message discusses the (minor) NUMA-placement consequence.

Relative to v2: patch 1 is new -- v2 kept the page-tables in the
domheap and walked them through map_domain_page(), with a linear-map
fast path for the currently-running vCPU; making the page-tables
always-mapped lets one plain walk serve every caller and context, and
the context switch keeps its existing structure.  The populate patch
is split from its first user; the LDT demand-map now goes through
populate_perdomain_mapping() rather than writing linear entries;
pv_destroy_gdt() keeps mapping torn-down slots read-only to the zero
page (in v2 they became empty -- a guest-visible partial revert of
cf6d39f819); and the domain -> vCPU parameter switches move to the
next slice.  Per-patch changes are noted below each patch's "---".

Testing:
 - Each patch builds (x86_64, CONFIG_DEBUG=y); tier-1 qemu boot at
   the tip.
 - The series passes the Xen GitLab CI pipeline, including the
   hardware runner:
    https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2776674713
 - On an Intel NUC, debug build: XTF pv64 and pv32pae suites (the
   latter with cet=no-shstk,no-ibt pv=32, since CET disables PV32);
   plus an LDT exerciser in a PV Linux guest (modify_ldt() with 1-16
   page LDTs, demand-faulting every page, LAR beyond the limit,
   shrinking, teardown; also with the guest's vCPUs bounced across
   pCPUs) -- thousands of rounds, no assertions or "unable to map"
   reports.

[1] https://lore.kernel.org/xen-devel/20240726152206.28411-1-roger.pau@citrix.com/
[2] https://lore.kernel.org/xen-devel/20250108142659.99490-1-roger.pau@citrix.com/

George Dunlap (1):
  x86/mm: allocate the per-domain page-tables from the xenheap

Roger Pau Monné (6):
  x86/mm: introduce populate_perdomain_mapping()
  x86/pv: use populate_perdomain_mapping() to map the Xen GDT
  x86/pv: set/clear guest GDT mappings using
    populate_perdomain_mapping()
  x86/pv: update guest LDT mappings using
    {populate,destroy}_perdomain_mapping()
  x86/pv: remove stashing of GDT/LDT L1 page-tables
  x86/mm: simplify create_perdomain_mapping() interface

 xen/arch/x86/domain.c               |  17 ++-
 xen/arch/x86/domain_page.c          |  10 +-
 xen/arch/x86/hvm/hvm.c              |   2 +-
 xen/arch/x86/include/asm/desc.h     |   6 +-
 xen/arch/x86/include/asm/domain.h   |  14 +-
 xen/arch/x86/include/asm/mm.h       |   9 +-
 xen/arch/x86/mm.c                   | 225 +++++++++++++++++-----------
 xen/arch/x86/pv/descriptor-tables.c |  57 ++++---
 xen/arch/x86/pv/domain.c            |  16 +-
 xen/arch/x86/pv/mm.c                |  16 +-
 xen/arch/x86/smpboot.c              |  14 +-
 xen/arch/x86/traps.c                |   4 +-
 xen/arch/x86/x86_64/mm.c            |   3 +-
 13 files changed, 221 insertions(+), 172 deletions(-)


base-commit: 669f8c502aeaa538f8407013ba04461e71361ed4
-- 
2.55.0


