Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF81606A324
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 23:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=IVPKSKmM
Received: from list by lists.xenproject.org with outflank-mailman.1470711.1679317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xONnf-0002XZ-Fo; Tue, 03 Nov 2026 23:20:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470711.1679317; Tue, 03 Nov 2026 23:20:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xONnf-0002XS-DA; Tue, 03 Nov 2026 23:20:19 +0000
Received: by outflank-mailman (input) for mailman id 1470711;
 Tue, 03 Nov 2026 23:20:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xONne-0002X7-2g
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 23:20:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xONne-0000000Cof9-044B
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 23:20:18 +0000
Received: from [2607:fb91:4c8c:bd3f:1da5:e92a:c5fb:865a]
 (helo=localhost.localdomain)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xONnd-0000000EMFa-3TZV
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 23:20:17 +0000
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
	bh=8TVQHotIU3vLyQpGo5XKI9gNKCI1WFDEzRJA5Nleqb8=; b=IVPKSKmMGyKyTsiGSjTgFRQgzK
	Ig/nBxoYQtxJ8ZDQqfoQCcl8sOj+O7CvffQhntDDi2Fowk58SkEn7Al1FLVZ6LBn6/bR30BBQORNb
	eE4Lv2IP/NJqpRZxkrsU5b5bp0ZDZ1MH1xEZ05QlNF+wGH0PPe/NcQmU0kReZjpSH3jw=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 00/44] ASI: HVM through X4
Date: Tue,  3 Nov 2026 17:13:22 -0500
Message-ID: <20261103-asi-hvm-v6-0-59dbc5ce9615@xenproject.org>
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

The approach is the same as v3 to v5: Start by focusing on just
getting ASI and intra-domain isolation for HVM guests.  PV support is
added where it's simple to do.

The full series can be roughly divided as below:

Included in this version, all posted before:

- VH (01-13): Give each vCPU of an HVM guest its own per-domain area
  and its own mapcache.

- DV (14-23): Maintain two "views" of the directmap: A full directmap,
  and a sparse directmap.  The full directmap is what we have now; the
  sparse directmap removes non-xenheap heap memory.

- X1 (24-30): Add a vCPU state window to the per-domain area (both for
  PV and HVM).  Move SVM VMCB structures and VMX guest MSR areas into
  it.

- X2 (31-34): Move every vCPU's saved register frame (PV and HVM), and
  the HVM emulator's operand caches, into the vCPU state window.  34
  also clears the vCPU's copy of an emulated I/O request once it has
  been consumed.

- X3 (35-37): Introduce map_domain_pages(), which maps several pages
  in the calling vCPU's per-domain area, and use it in place of vmap()
  for the shadow code's cross-page emulated writes and the HVM
  emulator's multi-frame accesses.

- X4 (38-44): Move the guest XSAVE areas into the vCPU state window.

Implemented but not yet posted:

- PH1: Preparation for per-pCPU stacks, modifying rendezvous and
  call-function IPIs to not use the stack

- PH2: Moving pCPU stacks into the perdomain area, allocating them
  from the domheap

- O: A number of optimizations to improve performance

The functionality of v6 (through X4) is the bare minimum that
XenServer needs to make it into 4.23.

v5 can be found here:

https://lore.kernel.org/xen-devel/20261028-asi-hvm-v5-0-13b908e0df0b@xenproject.org/

v6 is based on staging 2043d22b7e92.  v5's 01, "x86/PoD: map one page
at a time in p2m_pod_zero_check()", is now in staging (41ddcfe808ec),
so v5's NN is v6's NN-1.

The changes since v5 have been tested (below) and skimmed, but not
yet been over with a fine-tooth comb.

Changes in v6:

- Following Jan's suggestion on v5's 02, the per-domain L3 is now
  allocated when the domain is created, instead of refusing to promote
  an L4 while there is none: 01, "x86/mm: allocate the per-domain L3
  in arch_domain_create()", replaces v5's "x86/mm: refuse to promote
  an L4 while the domain has no per-domain L3".  A vCPU-PT domain has
  no domain-wide L3: each of its vCPUs gets its own in
  arch_vcpu_create() (08).  create_perdomain_mapping() no longer
  allocates an L3.

- To go with it, 07 gives init_xen_l4_slots() two forms around a
  common core: one taking the vCPU that a root page table is private
  to (HVM monitor tables, the compat L4), and init_xen_l4_slots_pv(),
  taking only the domain, for the root page tables a PV domain's vCPUs
  share (its L4s and their shadows).  promote_l4_table() therefore no
  longer needs vCPU 0.

- 02, 04, 05, 20 and 25 change to match, and 13 now cites the PoD fix
  by its hash; each patch's changelog has the details.  Jan's
  Reviewed-by on v5's 06 (now 05) has been dropped.

- In 16, sparse_dmap_init() is still called once the heap has all
  memory.  Since "x86: invoke xenheap_max_mfn() unconditionally"
  (f93ffa1309cd), that means after the loop for RAM above 5 TiB,
  rather than right after the change to SYS_STATE_boot.

Some more details:

15 is a work-around for a slow-down which causes a watchdog to fire.
(Proper performance fixes have been implemented but won't be posted
until the end of the entire series.)

34 also limits exposure of ioreq state: Completely isolating each
vCPU's I/O requests from being read by other vCPUs of the same domain
is complicated; as a mitigation, this patch clears the emulated I/O
request once it has been consumed, reducing the window available to
read the payload.

38-41 are Alejandro's patches from "x86: Address Space Isolation FPU
preparations" (v3, January 2025), revived.

State is moved from the xenheap into the per-domain area for both ASI
and non-ASI domains: VMCB, MSR List, vCPU register frame, and
XSAVE/FPU areas.  Same is true for users of map_domain_pages.  This
protects non-ASI domains from ASI domains.

One key thing to get feedback on is the question below 44's "---":
xstate_init() now panics on hardware whose XSAVE area needs more than
the three pages reserved for it in the vCPU state window.  No current
hardware does.  Should it do more, for instance size the reservation
from the size found at boot, or fall back to xenheap areas on such
hardware?

Note that at the end of this series, PV guests can be given the sparse
directmap; this isolates them from other domains, but doesn't isolate
vCPUs within a domain.  With this series, a PV domain's register
frames and XSAVE areas are also out of reach of domains on the sparse
directmap, whether or not the PV domain itself is on it.

Testing of v6:

- On the series as reworked, on staging 8b0a70ddd29d, before the
  rebase (so without "x86: invoke xenheap_max_mfn() unconditionally"
  and without the smaller review fixes):

  - Builds of xen/ at each of the 44 patches, in seven
    configurations: debug and release, !HVM, !PV, the PV shim, and
    shadow paging, debug and release.  No warnings or errors beyond
    those staging itself gives.

  - On an Intel NUC: whole-tree builds (xen, tools, stubdom, docs) at
    each of the 44, with tools/tests/vpci run.

  - QEMU (TCG) smoke boots at 08 and 44: PV and PVH dom0s (the PVH
    one on HAP and on shadow), and XTF's 32-bit PV and 32-bit HVM
    selftests as dom0, without asi= and with asi=1.  Each boot gets to
    dom0's userspace (or the test's result) with no crash, assertion
    or warning in Xen's log.

  - On the NUC: boots of 08 and 44 without asi= and with asi=1.  In
    each, a 64-bit PV guest is live-migrated to the same host in
    shadow log-dirty mode under a verified workload, with an HVM guest
    beside it; with asi=1, XTF's full suite, 32-bit PV included,
    passes twice (the usual four skips).

- On the rebased series: each patch's tree differs from the tested one
  only by staging's changes and the review fixes in 01, 07, 08 and 16,
  checked file by file.  The same builds and boots are being repeated
  on it; those finished so far have passed.

- The same basic code has been run through XenRT, with the issue
  addressed by 15 (slow dom0 kernel decompression triggering a
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

George Dunlap (30):
  x86/mm: allocate the per-domain L3 in arch_domain_create()
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
 xen/arch/x86/domain.c                       | 239 ++++++++--
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
 xen/arch/x86/include/asm/mm.h               |  32 +-
 xen/arch/x86/include/asm/sparse-directmap.h |  83 ++++
 xen/arch/x86/include/asm/spec_ctrl.h        |   3 +
 xen/arch/x86/include/asm/xstate.h           |  73 ++--
 xen/arch/x86/mm.c                           | 459 ++++++++++++++++---
 xen/arch/x86/mm/hap/hap.c                   |   2 +-
 xen/arch/x86/mm/shadow/hvm.c                |   6 +-
 xen/arch/x86/mm/shadow/multi.c              |   5 +-
 xen/arch/x86/pv/dom0_build.c                |  11 +-
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
 48 files changed, 3101 insertions(+), 618 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/sparse-directmap.h
 create mode 100644 xen/arch/x86/sparse-directmap.c


base-commit: 2043d22b7e926f508cc23391b4c75325fa7211e9
-- 
2.56.0


