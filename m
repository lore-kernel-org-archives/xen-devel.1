Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF17606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 19:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=OgBgQFpT
Received: from list by lists.xenproject.org with outflank-mailman.1454761.1668264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xItGO-0005OV-Dv; Mon, 19 Oct 2026 19:43:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454761.1668264; Mon, 19 Oct 2026 19:43:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xItGO-0005OO-BA; Mon, 19 Oct 2026 19:43:16 +0000
Received: by outflank-mailman (input) for mailman id 1454761;
 Mon, 19 Oct 2026 19:43:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xItGN-0005OC-8X
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 19:43:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xItGN-000000022je-1WMX
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 19:43:15 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xItGN-00000001FjN-0Qpv
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 19:43:15 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From;
	bh=wLsogNPjrZdKtS17lrwteI/YwOL7FRQzUi+W577fu44=; b=OgBgQFpTLw/v8jepk2Mbjig5pz
	F/SFUvrhRLj45kVWJcuRTE43sJ+vgrBjzrWdo1rATTiR5lIDAOL1ONSWMeLVkEH5/IXnswYQd+LTN
	wAWV6vjWDyN3S+GwlkgHn2iblqwO90sVd9D6YOnO3yvlVdMNe1rnigieEG30T9EvpC0k=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v4 00/30] ASI: HVM per-vCPU areas, sparse-view directmap, per-vCPU state area
Date: Mon, 19 Oct 2026 20:42:31 +0100
Message-ID: <20261019-asi-hvm-v4-0-b68b66652266@xenproject.org>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is the first part of a series to implement address space
isolation.

The approach is the same as v3: Start by focusing on just getting ASI
and intra-domain isolation for HVM guests.  PV support is added where
it's simple to do, and regressions are avoided.

The first 20 patches are (sometimes broken-down or extended) versions
of what was posted in v3; the last 10 patches make a few additional
improvements to the sparse-view directmap, and then begin moving vCPU
state out of the xenheap and into a per-vCPU area.

To be more detailed:

01: A fix that should be considered for backport

02-14: Implement per-vCPU perdomain area and per-vCPU mapcaches for
HVM guests.

15-22: Maintain two "views" of the directmap: A full directmap, and a
sparse directmap.  The full directmap is what we have now; the sparse
directmap removes non-xenheap heap memory.

23-30: Add a vCPU state area to the perdomain area (both for PV and
HVM).  Move SVM VMCB structures and VMX guest MSR areas into it.

One key thing to get feedback on is 22: It's a not very simple effort
to mitigate a very rare event.

Note that at the end of this series, PV guests can be given the sparse
direct-map; this isolates them from other domains, but doesn't isolate
vCPUs within a domain.

An advantage of this is that it allows us to easily turn the sparse
directmap off for dom0 (or other system domains).  Some quick tests on
my local test rig on v3 of the series show that network throughput
from dom0 to a guest drops 31% when the sparse directmap is enabled
for dom0 vs not.

The rest of the series looks like this:

- Move more things into the vCPU state area: user_regs, FPU/XSAVE

- Hardening for ioreq server state (The ioreq server pages can't be
moved into per-vCPU areas without a massive refactoring of the ioreq
server protocol.)

- Implement per-pCPU stacks.  In this mode, per-pCPU stacks would only
be for HVM guests using the "sparse directmap".  Until we get per-vCPU
root pagetables for PV guests, it's not practical to prevent a PV
guest from seeing all the stacks.

- Low-hanging optimizations

A dependency graph of the above functionality can be found here:

https://xenbits.xenproject.org/people/gdunlap/asi-series-deps.html

Extending the intra-domain isolation to PV guests would involve
implementing per-vCPU root pagetables for PV guests.  There are draft
implementations of this, but they are quite complicated.

George Dunlap (20):
  x86/PoD: map one page at a time in p2m_pod_zero_check()
  x86/mm: refuse to promote an L4 while the domain has no vCPU
  x86/mm: have init_xen_l4_slots() take a vCPU in place of the domain
  x86/domain_page: drop redundant is_pv_vcpu() checks
  x86/domain_page: don't unmap a mapcache entry that is not present
  x86/mm: let Xen's page-table walker operate on a given root
  x86/mm: build and maintain a sparse view of the directmap
  x86/domain_page: key the directmap fast paths on the loaded view
  x86/domain_page: clear a mapcache slot at its last unmap
  x86/mm: run guest contexts on the sparse directmap view
  x86/spec-ctrl: wire the sparse directmap view into the asi= option
  xen/xmalloc: return an emptied region after dropping the pool lock
  x86/mm: split a sparse directmap superpage with a page being freed
  x86/mm: introduce a per-vCPU state window in the perdomain area
  x86/svm: introduce svm_vmcb_map() and svm_vmcb_unmap()
  x86/svm: clear the VMCB clean bits in svm_ctxt_switch_from()
  x86/svm: restore guest debug registers in svm_do_resume()
  x86/svm: drop svm_vmcb_dump()'s paddr and the unused VCPU_svm_vmcb
  x86/svm: allocate VMCBs from the domain heap behind the vCPU state
    window
  x86/vmx: move the guest MSR load/save list off always-mapped memory

Roger Pau Monné (10):
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
  x86/mm: introduce populate_perdomain_mapping()

 docs/misc/xen-command-line.pandoc           |  49 +++
 xen/arch/x86/Kconfig                        |   1 +
 xen/arch/x86/Makefile                       |   1 +
 xen/arch/x86/domain.c                       |  30 +-
 xen/arch/x86/domain_page.c                  | 302 +++++++++----
 xen/arch/x86/hvm/hvm.c                      |   6 -
 xen/arch/x86/hvm/svm/nestedsvm.c            |  12 +-
 xen/arch/x86/hvm/svm/svm.c                  | 151 +++++--
 xen/arch/x86/hvm/svm/vmcb.c                 |  74 +++-
 xen/arch/x86/hvm/svm/vmcb.h                 |  20 +-
 xen/arch/x86/hvm/vmx/vmcs.c                 | 134 +++++-
 xen/arch/x86/include/asm/config.h           |  23 +-
 xen/arch/x86/include/asm/domain.h           |  51 ++-
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h     |  63 +--
 xen/arch/x86/include/asm/mm.h               |  29 +-
 xen/arch/x86/include/asm/sparse-directmap.h |  83 ++++
 xen/arch/x86/include/asm/spec_ctrl.h        |   2 +
 xen/arch/x86/mm.c                           | 424 +++++++++++++++---
 xen/arch/x86/mm/hap/hap.c                   |   2 +-
 xen/arch/x86/mm/p2m-pod.c                   |  72 ++--
 xen/arch/x86/mm/shadow/hvm.c                |   2 +-
 xen/arch/x86/mm/shadow/multi.c              |   2 +-
 xen/arch/x86/pv/dom0_build.c                |   6 +-
 xen/arch/x86/pv/domain.c                    |  30 +-
 xen/arch/x86/pv/shim.c                      |   4 +-
 xen/arch/x86/setup.c                        |   4 +
 xen/arch/x86/sparse-directmap.c             | 455 ++++++++++++++++++++
 xen/arch/x86/spec_ctrl.c                    | 174 +++++++-
 xen/arch/x86/x86_64/asm-offsets.c           |   1 -
 xen/arch/x86/x86_64/mm.c                    |  14 +-
 xen/common/Kconfig                          |  18 +
 xen/common/page_alloc.c                     |  51 ++-
 xen/common/xmalloc_tlsf.c                   |  12 +-
 xen/include/xen/mm.h                        |  40 ++
 34 files changed, 1993 insertions(+), 349 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/sparse-directmap.h
 create mode 100644 xen/arch/x86/sparse-directmap.c


base-commit: 7e020a4dd6ed30eb6c91a9abe2767034e2bb270a
-- 
2.55.0


