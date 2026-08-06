Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D86C56208
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 08:40:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384361.1627325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrtdt-0005XE-NC; Thu, 06 Aug 2026 08:39:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384361.1627325; Thu, 06 Aug 2026 08:39:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrtdt-0005X6-Jj; Thu, 06 Aug 2026 08:39:57 +0000
Received: by outflank-mailman (input) for mailman id 1384361;
 Thu, 06 Aug 2026 08:39:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <usama.anjum@arm.com>) id 1wrtds-0005Vv-6l
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 08:39:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrtdr-00790P-Jg
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 10:39:55 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <usama.anjum@arm.com>)
 id 6a744842-e002-0a2a0a5209dd-0a2a450a8a14-44
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 10:39:55 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTP (eXpurgate 4.57.1)
 (envelope-from <usama.anjum@arm.com>)
 id 6a74485a-f2d2-0a2a450a0019-d98c6eacdb06-1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 10:39:54 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 836C4153B;
 Thu,  6 Aug 2026 01:39:49 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com
 [10.2.198.93])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C4F063F632;
 Thu,  6 Aug 2026 01:39:45 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=foss header.d=arm.com header.i="@arm.com" header.h="From:To:Cc:Subject:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786005593; bh=1/GXhzlocZP3RO99ssHRo2N31fXX+evtIf1AglwmeYk=;
	h=From:To:Cc:Subject:Date:From;
	b=XAD0GC3BFV+aOtURbErU8rEzfMbSmdJMzfNwzK/FHv0gx1gos8TDz/dRjKI0JzDR0
	 AQ4BuCvKLoJi+XVzKw+vUT1ULkUCtkTdaFTQUlv601HAIs75njL9FmO8WmoPB+Psrr
	 TDc5b83VZ6vnRuzuzlPGu/pmjS3BAMBtce5CKFQo=
From: Muhammad Usama Anjum <usama.anjum@arm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Will Deacon <will@kernel.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	David Hildenbrand <david@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	SJ Park <sj@kernel.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Jan Kara <jack@suse.cz>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	Mike Rapoport <rppt@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	ziy@nvidia.com,
	pfalcato@suse.de,
	agordeev@linux.ibm.com,
	ryan.roberts@arm.com
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>,
	linux-kernel@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-parisc@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-trace-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	damon@lists.linux.dev
Subject: [PATCH 0/9] mm: distinguish PTE table storage from PTE values
Date: Thu,  6 Aug 2026 09:38:38 +0100
Message-ID: <20260806083926.1807279-1-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1786005595-502F0CFC-4C0B5F46/0/0
X-purgate-type: clean
X-purgate-size: 12117

Hi,

pte_t currently describes both a logical PTE value and an element stored
in a PTE table. Consequently, pte_t * can point either to a standalone
value, often a stack copy, or to a PTE-table slot. The compiler cannot
distinguish these cases. A value pointer can therefore be passed to an
interface that expects table storage, while table storage can be read by
direct dereference instead of the architecture accessor.

This series begins a staged conversion at the PTE level. It introduces
hw_pte_t as the element type for PTE-table storage and converts generic
MM to use hw_pte_t *. Logical PTE values remain pte_t. Interfaces that
intentionally return a value through pte_t *, such as install_pte,
remain value interfaces; the relevant parameters are named ptentp to
make that distinction explicit.

The generic definition aliases hw_pte_t to pte_t unless an architecture
selects ARCH_HAS_HW_PTE_T, which enables a distinct generic wrapper. No
architecture selects it in this series, so the representation and
behaviour of every architecture are preserved. ptep_get() keeps its
existing READ_ONCE() semantics and converts the stored element through
__pte_from_hw(). An architecture can later select the option and convert
its PTE interfaces to make the distinction compiler-enforced.
Architecture PTE implementations and most architecture code are
deliberately left for those later opt-in conversions.

Here, hw_pte_t identifies PTE-table storage rather than table lifetime:
complete PTE tables use hw_pte_t whether or not they are currently
linked into a page-table hierarchy, while standalone copied values use
pte_t. The distinction between complete but unlinked tables and
hardware-reachable tables was raised during discussion and remains an
important point for review.

PMD, PUD, P4D and PGD storage are deliberately out of scope. They can be
converted in later series after the PTE boundary is agreed, avoiding the
PMD-specific cases that made an all-level conversion difficult to
review.

Most mechanical pointer conversions were generated with the Coccinelle
script included below, then audited and fixed by hand.

This series does not add a second ptep_get_once() accessor and does not
remove or replace STRICT_MM_TYPECHECKS.

The design discussion is available at [1]; while the original idea came
from [2].

I've the patches here [3] for arm64 conversion which I used to find
usages in generic code which I missed during development. These would be
sent separately.

[1] https://lore.kernel.org/all/6110202c-057b-4701-8c04-1a76ee7bb9ab@arm.com/
[2] https://lore.kernel.org/all/a063f6c5-2785-4a9f-8079-25edb3e54cef@arm.com
[3] https://github.com/musamaanjum/linux/commits/pte0_arm/

Thanks,
Usama
---
Changes since RFC v1:
- Add ARCH_HAS_HW_PTE_T so architectures can opt in to a distinct
  PTE-table storage type.
- Define the distinct hw_pte_t wrapper and its conversion helpers in
  generic code instead of requiring each architecture to define them.
- Read hw_pte_t through READ_ONCE() before converting it to pte_t.
- Drop the previous mremap patch in favour of [a]. Apply [a] first if
  it is not already present.
- Drop the previous two dead-code conversion patches; the affected
  code was cleaned up separately in [b] and [c].

[a] https://lore.kernel.org/linux-mm/20260720141633.501799-1-agordeev@linux.ibm.com/
[b] https://lore.kernel.org/all/20260730111316.3672672-1-usama.anjum@arm.com
[c] https://lore.kernel.org/all/20260730094501.3002718-1-usama.anjum@arm.com

---
// SPDX-License-Identifier: GPL-2.0-only
///
/// Rename raw PTE pointer types to hardware PTE pointer types.
///
/// This is a mechanical type rename. It converts common declarations,
/// function parameters, prototypes, return types and casts from "pte_t *"
/// to "hw_pte_t *". Plain "pte_t" objects are intentionally left unchanged.
/// Pointers named "ptentp" refer to temporary logical PTE values and are
/// intentionally ignored in all modes.
/// Re-run in context mode afterwards to audit remaining raw pte_t pointers
/// and cases that need hand conversion, such as trace macros and mixed
/// declarations.
///
/// Confidence: Moderate
// Options: --no-includes --include-headers

virtual patch
virtual report
virtual context

@local_decl depends on patch@
identifier x != ptentp;
@@
- pte_t *x;
+ hw_pte_t *x;

@local_decl_init depends on patch@
identifier x != ptentp;
expression e;
@@
- pte_t *x = e;
+ hw_pte_t *x = e;

@param_proto depends on patch@
identifier f;
identifier x != ptentp;
type R;
@@
R f(...,
- pte_t *x
+ hw_pte_t *x
,...);

@param_proto_unnamed depends on patch@
identifier f;
type R;
@@
R f(...,
- pte_t *
+ hw_pte_t *
,...);

@param_def depends on patch@
identifier f;
identifier x != ptentp;
type R;
@@
R f(...,
- pte_t *x
+ hw_pte_t *x
,...)
{ ... }

@ret_proto depends on patch@
identifier f;
parameter list ps;
@@
- pte_t *
+ hw_pte_t *
  f(ps);

@ret_def depends on patch@
identifier f;
parameter list ps;
@@
- pte_t *
+ hw_pte_t *
  f(ps)
{ ... }

@struct_member depends on patch@
identifier S;
identifier x != ptentp;
@@
struct S {
...
- pte_t *x;
+ hw_pte_t *x;
...
};

@union_member depends on patch@
identifier x != ptentp;
@@
union {
...
- pte_t *x;
+ hw_pte_t *x;
...
};

@union_member_in_struct depends on patch@
identifier S;
identifier x != ptentp;
@@
struct S {
...
union {
...
- pte_t *x;
+ hw_pte_t *x;
...
};
...
};

@fnptr_struct_member depends on patch@
identifier S,f;
identifier x != ptentp;
type R;
@@
struct S {
...
R (*f)(...,
- pte_t *x
+ hw_pte_t *x
,...);
...
};

@fnptr_typedef_pte_fn_t depends on patch@
identifier x != ptentp;
@@
typedef int (*pte_fn_t)(...,
- pte_t *x
+ hw_pte_t *x
,...);

@cast depends on patch@
expression e;
@@
- (pte_t *)e
+ (hw_pte_t *)e

@remaining_decl depends on context || report@
identifier x != ptentp;
position p;
@@
* pte_t *x@p;

@remaining_decl_init depends on context || report@
identifier x != ptentp;
expression e;
position p;
@@
* pte_t *x@p = e;

@remaining_param_proto depends on context || report@
identifier f;
identifier x != ptentp;
type R;
position p;
@@
R f(...,
* pte_t *x@p
,...);

@remaining_param_proto_unnamed depends on context || report@
identifier f;
type R;
position p;
@@
R f(...,
* pte_t *@p
,...);

@remaining_param_def depends on context || report@
identifier f;
identifier x != ptentp;
type R;
position p;
@@
R f(...,
* pte_t *x@p
,...)
{ ... }

@remaining_ret_proto depends on context || report@
identifier f;
parameter list ps;
position p;
@@
* pte_t *f@p(ps);

@remaining_ret_def depends on context || report@
identifier f;
parameter list ps;
position p;
@@
* pte_t *f@p(ps)
{ ... }

@remaining_struct_member depends on context || report@
identifier S;
identifier x != ptentp;
position p;
@@
struct S {
...
* pte_t *x@p;
...
};

@remaining_union_member depends on context || report@
identifier x != ptentp;
position p;
@@
union {
...
* pte_t *x@p;
...
};

@remaining_union_member_in_struct depends on context || report@
identifier S;
identifier x != ptentp;
position p;
@@
struct S {
...
union {
...
* pte_t *x@p;
...
};
...
};

@remaining_fnptr_struct_member depends on context || report@
identifier S,f;
identifier x != ptentp;
type R;
position p;
@@
struct S {
...
R (*f)(...,
* pte_t *x@p
,...);
...
};

@remaining_fnptr_typedef_pte_fn_t depends on context || report@
identifier x != ptentp;
position p;
@@
typedef int (*pte_fn_t)(...,
* pte_t *x@p
,...);

Muhammad Usama Anjum (9):
  mm: introduce hw_pte_t for PTE table storage
  mm: make hw_pte_t visible to generic PTE interfaces
  mm: name pointers to copied PTE values ptentp
  mm: use hw_pte_t for generic PTE table storage
  mm: convert PTE table entries in ptep_get()
  mm: convert PTE table entry to pte
  mm/kasan: use hw_pte_t for the early shadow PTE table
  drm/i915: use hw_pte_t for PTE range callbacks
  xen: use hw_pte_t for PTE range callbacks

 MAINTAINERS                                   |  1 +
 .../drm/i915/gem/selftests/i915_gem_mman.c    |  4 +-
 drivers/gpu/drm/i915/i915_mm.c                |  4 +-
 drivers/xen/gntdev.c                          |  2 +-
 drivers/xen/privcmd.c                         |  2 +-
 drivers/xen/xenbus/xenbus_client.c            |  2 +-
 drivers/xen/xlate_mmu.c                       |  4 +-
 fs/hugetlbfs/inode.c                          |  3 +-
 fs/proc/task_mmu.c                            | 33 ++++----
 include/asm-generic/hugetlb.h                 | 15 ++--
 include/asm-generic/pgalloc.h                 |  6 +-
 include/asm-generic/tlb.h                     |  5 +-
 include/linux/hugetlb.h                       | 52 ++++++------
 include/linux/kasan.h                         |  2 +-
 include/linux/mm.h                            | 26 +++---
 include/linux/page_table_check.h              | 10 ++-
 include/linux/pagewalk.h                      | 10 +--
 include/linux/pgtable.h                       | 81 ++++++++++---------
 include/linux/pgtable_types.h                 | 19 +++++
 include/linux/rmap.h                          |  2 +-
 include/linux/swapops.h                       |  6 +-
 include/linux/vmalloc.h                       |  4 +-
 include/trace/events/xen.h                    | 10 +--
 kernel/bpf/arena.c                            |  9 ++-
 kernel/events/core.c                          |  3 +-
 mm/Kconfig                                    |  3 +
 mm/damon/ops-common.c                         |  2 +-
 mm/damon/ops-common.h                         |  2 +-
 mm/damon/vaddr.c                              | 20 ++---
 mm/debug_vm_pgtable.c                         |  2 +-
 mm/filemap.c                                  |  4 +-
 mm/gup.c                                      |  9 ++-
 mm/highmem.c                                  | 15 ++--
 mm/hmm.c                                      |  6 +-
 mm/huge_memory.c                              |  4 +-
 mm/hugetlb.c                                  | 60 +++++++-------
 mm/hugetlb_vmemmap.c                          | 13 +--
 mm/internal.h                                 | 16 ++--
 mm/kasan/init.c                               | 14 ++--
 mm/kasan/shadow.c                             |  6 +-
 mm/khugepaged.c                               | 24 +++---
 mm/ksm.c                                      | 11 +--
 mm/madvise.c                                  | 18 +++--
 mm/mapping_dirty_helpers.c                    |  4 +-
 mm/memory-failure.c                           |  6 +-
 mm/memory.c                                   | 78 +++++++++---------
 mm/mempolicy.c                                |  4 +-
 mm/migrate.c                                  |  4 +-
 mm/migrate_device.c                           |  4 +-
 mm/mincore.c                                  |  4 +-
 mm/mlock.c                                    |  4 +-
 mm/mprotect.c                                 | 19 ++---
 mm/mremap.c                                   |  4 +-
 mm/page_table_check.c                         |  4 +-
 mm/pagewalk.c                                 |  9 ++-
 mm/percpu.c                                   |  2 +-
 mm/pgtable-generic.c                          | 20 ++---
 mm/ptdump.c                                   |  4 +-
 mm/rmap.c                                     |  6 +-
 mm/sparse-vmemmap.c                           | 24 +++---
 mm/swap_state.c                               |  3 +-
 mm/swapfile.c                                 |  5 +-
 mm/userfaultfd.c                              | 32 ++++----
 mm/util.c                                     |  2 +-
 mm/vmalloc.c                                  | 13 +--
 mm/vmscan.c                                   |  6 +-
 66 files changed, 437 insertions(+), 368 deletions(-)
 create mode 100644 include/linux/pgtable_types.h

-- 
2.47.3


