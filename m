Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC7D606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 23:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=nDF1d/Hu
Received: from list by lists.xenproject.org with outflank-mailman.1463710.1674455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMCj8-0002Mu-G5; Wed, 28 Oct 2026 23:06:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463710.1674455; Wed, 28 Oct 2026 23:06:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMCj8-0002Mn-DA; Wed, 28 Oct 2026 23:06:38 +0000
Received: by outflank-mailman (input) for mailman id 1463710;
 Wed, 28 Oct 2026 23:06:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xMCj6-0002Mb-IQ
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 23:06:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMCj6-00000000oyk-2jIV
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 23:06:36 +0000
Received: from [217.155.165.12] (helo=Mac.fritz.box.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMCj6-00000001KpM-0thJ
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 23:06:36 +0000
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
	bh=b5/KRvNpW7doNNwVa6XyxzTuMKkPxnUY8BHBVIU7vEI=; b=nDF1d/Hu3qdLMExlgZMe9TguRc
	cYzBW9IeiigmBRM+nrq69yVdxidlU4SxLQPpoF2Qo+DF2ynNzitjCAZ6o6eCcr7+zxLHmaTHXfZ/v
	CHsNXGWLKXKgwUjbQdKc8EwZrgkVEkGhREPKif9aPYusgCTdw7OM1wchzIDuwtTl+TPI=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v5 00/45] ASI: HVM through X4
Date: Wed, 28 Oct 2026 23:05:14 +0000
Message-ID: <20261028-asi-hvm-v5-0-13b908e0df0b@xenproject.org>
X-Mailer: git-send-email 2.56.0
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

The approach is the same as v3 and v4: Start by focusing on just
getting ASI and intra-domain isolation for HVM guests.  PV support is
added where it's simple to do.

The full series can be roughly divided as below:

Included in this version, posted before:

- VH (02-14): Give each vCPU of an HVM guest its own per-domain area
  and its own mapcache.

- DV (15-24): Maintain two "views" of the directmap: A full directmap,
  and a sparse directmap.  The full directmap is what we have now; the
  sparse directmap removes non-xenheap heap memory.

- X1 (25-31): Add a vCPU state window to the per-domain area (both for
  PV and HVM).  Move SVM VMCB structures and VMX guest MSR areas into
  it.

Included this version, new:

- X2 (32-35): Move every vCPU's saved register frame (PV and HVM), and
  the HVM emulator's operand caches, into the vCPU state window.  35
  also clears the vCPU's copy of an emulated I/O request once it has
  been consumed.

- X3 (36-38): Introduce map_domain_pages(), which maps several pages
  in the calling vCPU's per-domain area, and use it in place of vmap()
  for the shadow code's cross-page emulated writes and the HVM
  emulator's multi-frame accesses.
  
- X4 (39-45): Move the guest XSAVE areas into the vCPU state window.

Implemented but not yet posted:

- PH1: Preparation for per-pCPU stacks, modifying rendezvous and
  call-function IPIs to not use the stack

- PH2: Moving pCPU stacks into the perdomain area, allocating them
  from the domheap

- O: A number of optimizations to improve performance

The functionality of v5 (through X4) is the bare minimum that
XenServer needs to make it into 4.23.

v4 can be found here:

https://lore.kernel.org/xen-devel/20261019-asi-hvm-v4-0-b68b66652266@xenproject.org/

v5 is based on staging 8b0a70ddd29d, which now includes Ross's
"x86/svm: Don't clear clean bits on every context switch"
(69633efbca3c).  Ross's patch replaces v4's 26/30, "x86/svm: clear the
VMCB clean bits in svm_ctxt_switch_from()", which is dropped.

The first 31 patches are v4's other 29, some changed in review, and
one new patch (16); the last 14 are new: they add map_domain_pages(),
and move the register frames, the emulator's caches and the XSAVE
areas into the vCPU state window.  v4's 16/30 is now two, 17 and 18.

Some more details:

01: A fix that should be considered for backport

16: New patch, a work-around for a slow-down which causes a watchdog
to fire.  (Proper performance fixes have been implemented but won't be
posted until the end of the entire series.)

15,17-18: The previous patch 16 has been refactored; some of it has
moved to patch 15, the rest has been broken down into two patches.
Code is substantially the same, with minor edits; the patch breakdown
has changed to improve reviewability.

35 also limits exposure of ioreq state: Completely isolating each
vCPU’s I/O requests from being read by other vCPUs of the same domain
is complicated; as a mitigation, this patch clears the emulated I/O
request once it has been consumed, reducing the window available to
read the payload.

39-42 are Alejandro's patches from "x86: Address Space Isolation FPU
preparations" (v3, January 2025), revived.

State is moved from the xenheap into the per-domain area for both ASI
and non-ASI domains: VMCB, MSR List, vCPU register frame, and
XSAVE/FPU areas.  Same is true for users of map_domain_pages.  This
protects non-ASI domains from ASI domains.

One key thing to get feedback on is the question below 45's "---":
xstate_init() now panics on hardware whose XSAVE area needs more than
the three pages reserved for it in the vCPU state window.  No current
hardware does.  Should it do more, for instance size the reservation
from the size found at boot, or fall back to xenheap areas on such
hardware?

Note that at the end of this series, PV guests can be given the sparse
directmap; this isolates them from other domains, but doesn't isolate
vCPUs within a domain.  With v5, a PV domain's register frames and
XSAVE areas are also out of reach of domains on the sparse directmap,
whether or not the PV domain itself is on it.

Testing of v5:

- Builds of xen/ at each of the 45 patches, in nine configurations:
  debug and release, each with and without CONFIG_SPARSE_DIRECTMAP
  from 18 on (where the option appears), !HVM, !PV, the PV shim, and
  shadow paging, debug and release.
  No warnings or errors beyond those staging itself gives.

- QEMU (TCG) smoke boots at 31, 33, 36 and 45: a PV dom0 with no
  asi=, asi=1, asi=1,dom0=0 and xpti=1; a PVH dom0 with no asi=,
  asi=1 and asi=1,dom0=0.  Each boot reaches dom0's userspace with no
  crash, assertion or warning in Xen's log.

- On an Intel NUC: whole-tree builds (xen, tools, stubdom, docs) of
  45, with tools/tests/vpci run.  Boots of 45 (cet=no-shstk,no-ibt
  pv=32 throughout) with XPTI forced on (xpti=1), with XPTI off, and
  with asi=1: in each, a 64-bit PV guest and an HVM guest (QEMU, PV
  drivers) run a short stress and network test side by side and shut
  down cleanly.  With asi=1, XTF's full suite, 32-bit PV included,
  passes twice (the usual four skips).

- The same basic code has been run through XenRT, with the issue
  addressed by 16 (slow dom0 kernel decompression triggering a
  watchdog on large machines) the only issue found.

A dependency graph of the above functionality can be found here:

https://xenbits.xenproject.org/people/gdunlap/asi-series-deps.html

Extending the intra-domain isolation to PV guests would involve
implementing per-vCPU root pagetables for PV guests.  There are draft
implementations of this, but they are quite complicated.

Alejandro Vallejo (4):
  x86/emulator: Refactor FXSAVE_AREA to use wrappers
  x86/mpx: Map/unmap xsave area in read_bndcfgu()
  x86/fpu: Pass explicit xsave areas to fpu_(f)xsave()
  x86/fpu: Pass explicit xsave areas to fpu_(f)xrstor()

George Dunlap (31):
  x86/PoD: map one page at a time in p2m_pod_zero_check()
  x86/mm: refuse to promote an L4 while the domain has no per-domain L3
  x86/mm: have init_xen_l4_slots() take a vCPU in place of the domain
  x86/domain_page: drop redundant is_pv_vcpu() checks
  x86/domain_page: don't unmap a mapcache entry that is not present
  x86/mm: let Xen's page-table walker operate on a given root
  xen/gunzip: process pending softirqs once per deflate block
  x86/mm: add hooks for a sparse view of the directmap
  x86/mm: build and maintain a sparse view of the directmap
  x86/domain_page: key the directmap fast paths on the loaded view
  x86/domain_page: clear a mapcache slot at its last unmap
  x86/mm: run guest contexts on the sparse directmap view
  x86/spec-ctrl: wire the sparse directmap view into the asi= option
  xen/xmalloc: return an emptied region after dropping the pool lock
  x86/mm: split a sparse directmap superpage with a page being freed
  x86/mm: introduce a per-vCPU state window in the perdomain area
  x86/svm: introduce SVM_MAP_VMCB() and SVM_UNMAP_VMCB()
  x86/svm: restore guest debug registers in svm_do_resume()
  x86/svm: drop svm_vmcb_dump()'s paddr
  x86/svm: allocate VMCBs from the domain heap behind the vCPU state
    window
  x86/vmx: move the guest MSR load/save list off always-mapped memory
  x86: access a vCPU's saved register frame through map/unmap helpers
  x86: move the saved register frame behind the vCPU state window
  x86/hvm: move the emulator's operand caches behind the vCPU state
    window
  x86/hvm: clear the vCPU's copy of an emulated I/O request once
    consumed
  x86/domain_page: introduce map_domain_pages()
  x86/shadow: use map_domain_pages() for cross-page emulated writes
  x86/hvm: use map_domain_pages() for multi-frame emulated accesses
  x86/xstate: classify xsave-area seam accesses by failure mode
  x86/domain: restore FPU state after switching to the new page tables
  x86/xstate: move guest XSAVE areas behind the vCPU state window

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

 docs/misc/xen-command-line.pandoc           |  57 +++
 xen/arch/x86/Kconfig                        |   1 +
 xen/arch/x86/Makefile                       |   1 +
 xen/arch/x86/domain.c                       | 233 ++++++++--
 xen/arch/x86/domain_page.c                  | 461 ++++++++++++++++----
 xen/arch/x86/domctl.c                       |  98 +++--
 xen/arch/x86/hvm/domain.c                   |   6 +-
 xen/arch/x86/hvm/emulate.c                  | 243 ++++++++---
 xen/arch/x86/hvm/hvm.c                      | 122 +++---
 xen/arch/x86/hvm/svm/nestedsvm.c            |  12 +-
 xen/arch/x86/hvm/svm/svm.c                  | 147 +++++--
 xen/arch/x86/hvm/svm/vmcb.c                 |  74 +++-
 xen/arch/x86/hvm/svm/vmcb.h                 |  29 +-
 xen/arch/x86/hvm/vmx/vmcs.c                 | 151 ++++++-
 xen/arch/x86/hvm/vmx/vmx.c                  |   7 +-
 xen/arch/x86/hypercall.c                    |   4 +-
 xen/arch/x86/i387.c                         |  60 ++-
 xen/arch/x86/include/asm/config.h           |  42 +-
 xen/arch/x86/include/asm/domain.h           | 109 ++++-
 xen/arch/x86/include/asm/hvm/emulate.h      |   9 +-
 xen/arch/x86/include/asm/hvm/vcpu.h         |   7 +
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h     |  63 +--
 xen/arch/x86/include/asm/i387.h             |   1 +
 xen/arch/x86/include/asm/mm.h               |  29 +-
 xen/arch/x86/include/asm/sparse-directmap.h |  83 ++++
 xen/arch/x86/include/asm/spec_ctrl.h        |   3 +
 xen/arch/x86/include/asm/xstate.h           |  73 ++--
 xen/arch/x86/mm.c                           | 428 +++++++++++++++---
 xen/arch/x86/mm/hap/hap.c                   |   2 +-
 xen/arch/x86/mm/p2m-pod.c                   |  72 ++-
 xen/arch/x86/mm/shadow/hvm.c                |   6 +-
 xen/arch/x86/mm/shadow/multi.c              |   2 +-
 xen/arch/x86/pv/dom0_build.c                |   9 +-
 xen/arch/x86/pv/domain.c                    |  30 +-
 xen/arch/x86/pv/shim.c                      |   4 +-
 xen/arch/x86/setup.c                        |   4 +
 xen/arch/x86/sparse-directmap.c             | 455 +++++++++++++++++++
 xen/arch/x86/spec_ctrl.c                    | 183 +++++++-
 xen/arch/x86/traps.c                        |  20 +-
 xen/arch/x86/x86_64/mm.c                    |  14 +-
 xen/arch/x86/x86_emulate/blk.c              |  36 +-
 xen/arch/x86/xstate.c                       | 212 ++++++++-
 xen/common/Kconfig                          |  18 +
 xen/common/gzip/gunzip.c                    |   1 +
 xen/common/gzip/inflate.c                   |   1 +
 xen/common/page_alloc.c                     |  51 ++-
 xen/common/xmalloc_tlsf.c                   |  12 +-
 xen/include/xen/domain_page.h               |  21 +
 xen/include/xen/mm.h                        |  40 ++
 49 files changed, 3102 insertions(+), 644 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/sparse-directmap.h
 create mode 100644 xen/arch/x86/sparse-directmap.c


base-commit: 8b0a70ddd29dec2f86a49c21e3664a21e281e859
-- 
2.56.0


