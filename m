Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5EEC624D5
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 09:44:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405451.1638938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1hVn-0002Gl-Qa; Wed, 02 Sep 2026 09:44:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405451.1638938; Wed, 02 Sep 2026 09:44:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1hVn-0002GZ-K8; Wed, 02 Sep 2026 09:44:07 +0000
Received: by outflank-mailman (input) for mailman id 1405451;
 Wed, 02 Sep 2026 09:44:06 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 1x1hVm-0002G3-H2
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 09:44:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1hVl-0093D7-Tt
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 11:44:05 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 6a97efdf-8faa-0a2a0a5109dd-0a2a450abd98-22
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:44:05 +0200
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.fritz.box)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTP (eXpurgate 4.57.1)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 6a97efe5-f2d2-0a2a450a0019-d99ba50cf8dc-1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:44:05 +0200
Received: by Georges-MacBook-Pro-2.fritz.box (Postfix, from userid 501)
 id 6D33F36928D6; Wed,  2 Sep 2026 10:44:05 +0100 (BST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
From: George Dunlap <dunlapg@umich.edu>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <gwd@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Alejandro Vallejo <agarciav@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 00/14] x86: Address Space Isolation, part 2: asi= option and per-vCPU page tables
Date: Wed,  2 Sep 2026 10:43:44 +0100
Message-ID: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1788342245-59DDFCFC-AC52A507/0/0
X-purgate-type: clean
X-purgate-size: 6366

From: George Dunlap <gwd@xenproject.org>

This is the second batch of the x86 Address Space Isolation (ASI)
series, run as a rolling series as laid out in part 1 [3]: patches are
posted from the front as they are ready, dropped once committed, and
appended as they mature.  None of part 1 has been committed yet, so
this posting contains v2 of those seven patches, revised per review,
followed by seven new ones.  The original work was posted by Roger as
"x86: adventures in Address Space Isolation" (v1 [1], v2 [2]).

The map of the entire series -- grouped into logical chunks, with the
dependencies between patches -- is maintained here:

https://xenbits.xenproject.org/people/gdunlap/asi-series-deps.html

Patches 1-14 of this posting are d03-d16 on that map.  (d01 is Jan's
independently posted "x86: always park offline CPUs", which nothing in
this posting depends on; d02 is the design document, which isn't ready
for publication yet.)

What this batch does:

 - Patches 1-7 are the part 1 content: give the per-domain area a
   single central writer for installing caller-owned pages
   (populate_perdomain_mapping()), convert the PV GDT/LDT paths to it,
   and remove the stashed L1 aliases that bypassed the interface.  The
   headline change since part 1, following Jan's review of the xenheap
   allocation patch: the per-domain page-tables stay in the domheap,
   and the contexts that must walk them with interrupts disabled get
   dedicated IRQs-off mapping variants (patch 1) rather than an
   always-mapped alias.  Per-patch changes are noted below each
   patch's "---".

 - Patches 8-11 prepare the perdomain interfaces
   ({create,destroy}_perdomain_mapping() and their callers) to work
   with either a single domain-wide perdomain area or a per-vCPU one.

 - Patch 12 introduces the asi= command line option ahead of the
   functionality it enables, so the newly added code can be keyed on
   it from the start.  All knobs default to off, and enabling any of
   them warns at boot that the feature is not functional and intended
   for development only.

 - Patch 13 pairs the maintenance of the XPTI per-domain slot in the
   per-CPU root page-table: installed on switch-in, now cleared on
   switch-out.

 - Patch 14 is the core of this phase: an optional per-vCPU L3 for
   the per-domain area, so that what a vCPU can reach through the
   per-domain slot is its own state rather than every vCPU's.  With
   this patch HVM guests can run with per-vCPU page-tables; for PV
   guests the rest of the machinery (per-vCPU mapcache, root
   page-table handling, and a per-vCPU L4) follows in the next batch.

Testing:
 - Applies cleanly to staging at the base commit below; each patch
   builds (x86_64, CONFIG_DEBUG=y).
 - arm64 build and tier-1 qemu boot at the tip (patch 1 touches the
   common domain_page.h).
 - x86 tier-1 qemu boots at the tip: default; asi=1 with a 1-vCPU
   dom0 (SMP PV vCPU-PT arrives later in the series); and xpti=1
   forced, exercising the new switch-out clear on every context
   switch.
 - The series passes the Xen GitLab CI pipeline, including the
   hardware runners:
    https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2809749496
 - On an Intel NUC (debug build), three configurations -- default,
   xpti=1 forced, and asi=1 with a 1-vCPU dom0 and UP guests: XTF
   pv64 + pv32pae suites (29 pass / 2 skip in each; pv32pae via
   cet=no-shstk,no-ibt pv=32), plus an LDT exerciser in a PV Linux
   guest, sequential, parallel, and under vcpu-pin churn -- no
   assertions, crashes, or "unable to map" reports.  The xpti=1 run
   exercises patch 13's switch-out clear on every context switch;
   SMP PV guests were excluded from the asi=1 run (not expected to
   work until the per-vCPU L4 patch).

[1] https://lore.kernel.org/xen-devel/20240726152206.28411-1-roger.pau@citrix.com/
[2] https://lore.kernel.org/xen-devel/20250108142659.99490-1-roger.pau@citrix.com/
[3] https://lore.kernel.org/xen-devel/20260820-asi-part1-0-f2dbd92b8459@xenproject.org/

George Dunlap (2):
  x86/domain_page: introduce IRQs-off variants of {,un}map_domain_page()
  x86/pv: clear the XPTI root_pgt per-domain slot on context-switch out

Roger Pau Monné (12):
  x86/mm: introduce populate_perdomain_mapping()
  x86/pv: use populate_perdomain_mapping() to map the Xen GDT
  x86/pv: set/clear guest GDT mappings using
    populate_perdomain_mapping()
  x86/pv: update guest LDT mappings using
    {populate,destroy}_perdomain_mapping()
  x86/pv: remove stashing of GDT/LDT L1 page-tables
  x86/mm: simplify create_perdomain_mapping() interface
  x86/mm: purge unneeded destroy_perdomain_mapping()
  x86/mm: prepare destroy_perdomain_mapping() for per-vCPU perdomain
    areas
  x86/domain_page: drop redundant create_perdomain_mapping() call
  x86/mm: prepare create_perdomain_mapping() for per-vCPU perdomain
    areas
  x86/spec-ctrl: introduce Address Space Isolation command line option
  x86/mm: introduce per-vCPU L3 page-table

 docs/misc/xen-command-line.pandoc    |  24 +++
 xen/arch/x86/domain.c                |  53 ++++-
 xen/arch/x86/domain_page.c           |  72 +++++--
 xen/arch/x86/hvm/hvm.c               |   6 -
 xen/arch/x86/include/asm/desc.h      |   2 -
 xen/arch/x86/include/asm/domain.h    |  28 ++-
 xen/arch/x86/include/asm/mm.h        |  16 +-
 xen/arch/x86/include/asm/spec_ctrl.h |   2 +
 xen/arch/x86/mm.c                    | 296 +++++++++++++++++++++------
 xen/arch/x86/mm/hap/hap.c            |   2 +-
 xen/arch/x86/mm/paging.c             |  14 ++
 xen/arch/x86/mm/shadow/common.c      |  11 +
 xen/arch/x86/mm/shadow/hvm.c         |   2 +-
 xen/arch/x86/mm/shadow/multi.c       |   2 +-
 xen/arch/x86/pv/descriptor-tables.c  |  57 +++---
 xen/arch/x86/pv/dom0_build.c         |   8 +-
 xen/arch/x86/pv/domain.c             |  26 +--
 xen/arch/x86/pv/mm.c                 |  16 +-
 xen/arch/x86/smpboot.c               |  15 --
 xen/arch/x86/spec_ctrl.c             | 107 +++++++++-
 xen/arch/x86/traps.c                 |   2 -
 xen/arch/x86/x86_64/mm.c             |   7 +-
 xen/include/xen/domain_page.h        |  14 ++
 23 files changed, 594 insertions(+), 188 deletions(-)


base-commit: 2565341135f88081535f6830a6256277e2834403
-- 
2.55.0


