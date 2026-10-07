Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B135CA600A
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 10:41:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442099.1659620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEP52-000619-FQ; Wed, 07 Oct 2026 10:41:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442099.1659620; Wed, 07 Oct 2026 10:41:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEP52-000612-Ci; Wed, 07 Oct 2026 10:41:00 +0000
Received: by outflank-mailman (input) for mailman id 1442099;
 Wed, 07 Oct 2026 10:40:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xEP51-00060w-Eq
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 10:40:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEP51-001bht-0j
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 10:40:59 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEP50-001QnT-3C
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 10:40:59 +0000
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
	MIME-Version:Message-ID:Date:Subject:To:From;
	bh=MAkw5G1K3FbvfvIIjecvRR1tqFdb7fcdhV92wmhQAjE=; b=OGL6eKRS8BOPr6hXX3OcKKHozG
	SVmZ07YFN7NGjafcx8wsJHjPsQLsFqxCWDAZCJXpDGRTLoL/pVFMap5hmHeOvxWKd7YidZr+LQ9mA
	xnmVW6ILJQVW0kJzKTyfV5H/LdGFtIp4joaBN1KSk6U/Xb1gF3QT7AuaEqQnYlEdGQXc=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 00/18] ASI: HVM per-vCPU areas and sparse-view directmap
Date: Wed,  7 Oct 2026 11:40:33 +0100
Message-ID: <20261007104051.48841-1-gwd@xenproject.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In an attempt to reach something useful for XenServer sooner, I've
changed the approach somewhat.

The previous approach implemented sparse direct-map and intra-domain
isolation everywhere, for all types of guests.  Implementing
intra-domain isolation for PV guests introduces a large amount of
complexity, due to the ABI of Xen running on guest pagetables.

Start from the other direction instead, and focus just on getting ASI
and intra-domain isolation for HVM guests.

This series looks like this:

- A fix that should be considered for backport (01).

- Implement per-vCPU per-domain area and per-vCPU mapcaches for HVM
guests.  (02-11).  This is much simpler since each HVM vcpu already
has its own monitor table.

- Maintain two "views" of the directmap (12-18): A full directmap, and
a sparse directmap.  The full directmap is what we have now; the
sparse directmap, which removes non-xenheap heap memory.

The key patch to get feedback on is patch 13/18.

Note that at the end of this series, PV guests can be given the sparse
direct-map; this isolates them from other domains, but doesn't isolate
vCPUs within a domain.

An advantage of this is that it allows us to easily turn the sparse
directmap off for dom0 (or other system domains).  Some quick tests on
my local test rig show that network throughput from dom0 to a guest
drops 31% when the sparse directmap is enabled for dom0 vs not.

The rest of the series would look like this:

- Implement a per-vCPU state area, and move key bits of guest state into it.

- Implement per-pCPU stacks.  In this mode, per-pCPU stacks would only
be for HVM guests using the "sparse directmap".  Until we get per-vCPU
root pagetables for PV guests, it's not practical to prevent a PV
guest from seeing all the stacks.

A dependency graph of the above functionality can be found here:

https://xenbits.xenproject.org/people/gdunlap/asi-series-deps.html

Extending the intra-domain isolation to PV guests would involve
implementing per-vCPU root pagetables for PV guests.  There are draft
implementations of this, but they are quite complicated.

George Dunlap (9):
  x86/PoD: map one page at a time in p2m_pod_zero_check()
  x86/domain_page: don't unmap a mapcache entry that is not present
  x86/mm: let Xen's page-table walker operate on a given root
  x86/mm: build and maintain a sparse view of the directmap
  x86/domain_page: key the directmap fast paths on the loaded view
  x86/mm: flush owned pages before reuse with the sparse directmap view
  x86/domain_page: keep the maphash's slots, not their mappings
  x86/mm: run guest contexts on the sparse directmap view
  x86/spec-ctrl: wire the sparse directmap view into the asi= option

Roger Pau Monné (9):
  x86/mm: purge unneeded destroy_perdomain_mapping()
  x86/mm: prepare destroy_perdomain_mapping() for per-vCPU perdomain
    areas
  x86/domain_page: drop redundant create_perdomain_mapping() call
  x86/mm: prepare create_perdomain_mapping() for per-vCPU perdomain
    areas
  x86/spec-ctrl: introduce Address Space Isolation command line option
  x86/hvm: introduce per-vCPU L3 page-table
  x86/domain_page: prepare the mapcache for per-vCPU accounting
  x86/domain_page: move struct mapcache_vcpu to struct arch_vcpu
  x86/hvm: introduce per-vCPU mapcache for vCPU-PT domains

 docs/misc/xen-command-line.pandoc           |  49 ++
 xen/arch/x86/Kconfig                        |   1 +
 xen/arch/x86/Makefile                       |   1 +
 xen/arch/x86/domain.c                       |  21 +-
 xen/arch/x86/domain_page.c                  | 311 ++++++++---
 xen/arch/x86/hvm/hvm.c                      |   6 -
 xen/arch/x86/include/asm/domain.h           |  62 ++-
 xen/arch/x86/include/asm/mm.h               |  26 +-
 xen/arch/x86/include/asm/sparse-directmap.h |  98 ++++
 xen/arch/x86/include/asm/spec_ctrl.h        |   2 +
 xen/arch/x86/mm.c                           | 259 +++++++--
 xen/arch/x86/mm/hap/hap.c                   |   2 +-
 xen/arch/x86/mm/p2m-pod.c                   |  72 ++-
 xen/arch/x86/mm/shadow/hvm.c                |   2 +-
 xen/arch/x86/mm/shadow/multi.c              |   5 +-
 xen/arch/x86/pv/dom0_build.c                |   6 +-
 xen/arch/x86/pv/domain.c                    |  14 +-
 xen/arch/x86/setup.c                        |   7 +
 xen/arch/x86/sparse-directmap.c             | 570 ++++++++++++++++++++
 xen/arch/x86/spec_ctrl.c                    | 194 ++++++-
 xen/arch/x86/x86_64/mm.c                    |  10 +-
 xen/common/Kconfig                          |  18 +
 xen/common/page_alloc.c                     |  55 +-
 xen/include/xen/mm.h                        |  41 ++
 24 files changed, 1615 insertions(+), 217 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/sparse-directmap.h
 create mode 100644 xen/arch/x86/sparse-directmap.c

-- 
2.55.0


