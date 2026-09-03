Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3982C624DA
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 10:31:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406707.1639884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x24ii-0005Ql-Mu; Thu, 03 Sep 2026 10:31:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406707.1639884; Thu, 03 Sep 2026 10:31:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x24ii-0005Qc-K8; Thu, 03 Sep 2026 10:31:00 +0000
Received: by outflank-mailman (input) for mailman id 1406707;
 Thu, 03 Sep 2026 10:30:59 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <usama.anjum@arm.com>) id 1x24ih-0005Q9-GE
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 10:30:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x24ig-00EatS-NY
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 12:30:58 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <usama.anjum@arm.com>)
 id 6a994c51-e002-0a2a0a5209dd-0a2a4504a890-44
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 12:30:58 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTP (eXpurgate 4.57.1)
 (envelope-from <usama.anjum@arm.com>)
 id 6a994c60-b57f-0a2a45040019-d98c6eac887e-1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 12:30:57 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 993991F02;
 Thu,  3 Sep 2026 03:30:52 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com
 [10.2.198.93])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3AE423F673;
 Thu,  3 Sep 2026 03:30:47 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=foss header.d=arm.com header.i="@arm.com" header.h="From:To:Cc:Subject:Date:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788431456; bh=DEt3KlUchGpFfzI7cFYM3vauHOwXVIVRP1eSVCB1rgM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OCqN0IM73DlVeIFEnlcCIuqR18FAoouHSGHhXNucYr8rONtG/PWo24UoFAmagMzIb
	 8r48Ezf7p4wr9UIjQ4++anmaFeiCydvVPqtUevaAhHfgY9il6/+hvRvy7PKAcpAA/e
	 wapcW/7pqB0l6aY7tSwko5ZNforUusnJFwU24SHs=
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
Subject: [PATCH v2 1/8] mm: introduce hw_pte_t for PTE table storage
Date: Thu,  3 Sep 2026 11:29:53 +0100
Message-ID: <20260903103002.1091859-2-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260903103002.1091859-1-usama.anjum@arm.com>
References: <20260903103002.1091859-1-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1788431457-C06DAB50-18E923D2/0/0
X-purgate-type: clean
X-purgate-size: 3024

pte_t is used both for software PTE values and for entries stored in a PTE
table, so pte_t * does not distinguish a pointer to a software PTE
value from a pointer to table storage.

Introduce hw_pte_t as the generic name for a PTE table element. Define it
as a macro alias of pte_t by default. When an architecture selects
ARCH_HAS_HW_PTE_T, define it as a structure containing a pte_t instead.
This preserves the representation while allowing converted architectures
to enforce the distinction at compile time.

Name the generic wrapper structure __hw_pte_t so architectures can
forward-declare it when pgtable_t must be defined before the generic
hw_pte_t typedef is visible. This avoids header-order dependencies.

Keep the C type definitions behind an __ASSEMBLY__ check because
architecture assembly sources can include this header indirectly. Include
asm/page.h so consumers such as linux/vmalloc.h retain the page definitions
they previously obtained from that header.

Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
Changes since v1:
- Name the generic wrapper structure __hw_pte_t so architectures can
  forward-declare it, and explain why this is required.
- Use software PTE value terminology.

Changes since RFC v1:
- Add the ARCH_HAS_HW_PTE_T opt-in and generic wrapper definition.
- Exclude the C type definitions from assembly sources.
- Update the description for the new opt-in model.
---
 MAINTAINERS                   |  1 +
 include/linux/pgtable_types.h | 17 +++++++++++++++++
 mm/Kconfig                    |  3 +++
 3 files changed, 21 insertions(+)
 create mode 100644 include/linux/pgtable_types.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 2133aec4a2004..da60a8bdcddb5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17140,6 +17140,7 @@ F:	include/linux/mmu_notifier.h
 F:	include/linux/pagewalk.h
 F:	include/linux/pgalloc.h
 F:	include/linux/pgtable.h
+F:	include/linux/pgtable_types.h
 F:	include/linux/ptdump.h
 F:	include/linux/vmpressure.h
 F:	include/linux/vmstat.h
diff --git a/include/linux/pgtable_types.h b/include/linux/pgtable_types.h
new file mode 100644
index 0000000000000..07da05d375c2c
--- /dev/null
+++ b/include/linux/pgtable_types.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_PGTABLE_TYPES_H
+#define _LINUX_PGTABLE_TYPES_H
+
+#include <asm/page.h>
+
+#ifndef __ASSEMBLY__
+
+#ifdef CONFIG_ARCH_HAS_HW_PTE_T
+typedef struct __hw_pte_t { pte_t __pte; } hw_pte_t;
+#else
+#define hw_pte_t pte_t
+#endif
+
+#endif /* !__ASSEMBLY__ */
+
+#endif /* _LINUX_PGTABLE_TYPES_H */
diff --git a/mm/Kconfig b/mm/Kconfig
index c1ddf59c0d71a..5f462ec6fa5e5 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1312,6 +1312,9 @@ comment "GUP_TEST needs to have DEBUG_FS enabled"
 config GUP_GET_PXX_LOW_HIGH
 	bool
 
+config ARCH_HAS_HW_PTE_T
+	bool
+
 config DMAPOOL_TEST
 	tristate "Enable a module to run time tests on dma_pool"
 	depends on HAS_DMA
-- 
2.47.3


