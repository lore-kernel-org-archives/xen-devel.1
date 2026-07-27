Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C9DC53209
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 16:56:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371795.1619276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woOcH-0007iK-SD; Mon, 27 Jul 2026 16:55:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371795.1619276; Mon, 27 Jul 2026 16:55:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woOcH-0007iD-NN; Mon, 27 Jul 2026 16:55:49 +0000
Received: by outflank-mailman (input) for mailman id 1371795;
 Mon, 27 Jul 2026 16:47:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <usama.anjum@arm.com>) id 1woOUV-0005hJ-8G
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 16:47:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woOUU-008hAK-6O
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 18:47:46 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <usama.anjum@arm.com>)
 id 6a678b9b-e002-0a2a0a5209dd-0a2a4506abe0-32
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 18:47:45 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTP (eXpurgate 4.57.1)
 (envelope-from <usama.anjum@arm.com>)
 id 6a678bb1-195a-0a2a45060019-d98c6eace028-1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 18:47:45 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F79516F8;
 Mon, 27 Jul 2026 09:47:40 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com
 [10.2.198.93])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CB9873F86F;
 Mon, 27 Jul 2026 09:47:35 -0700 (PDT)
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
	t=1785170864; bh=HTxL5I80nQ3dFGJzsPYMsGaUEA0cATezEAGoZ6SZAko=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cD/2EUfMuUeyBVWNFHChNrDBH7K/jYSjTJKf2AXn2R9DI+PVxfhjgfb453XXO3T00
	 wM2xtUT1X0QX+sopNRnwbQI/o96tO4ir4xNQ7qJwgqdJF5QNcWrVk4USoCTYK5iOy/
	 9Wp82ZRCjM6t4RzOb3pUepvrD42VVL0Lu3oBSBc0=
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
Subject: [PATCH RFC 01/11] mm: introduce hw_pte_t for PTE table storage
Date: Mon, 27 Jul 2026 17:46:52 +0100
Message-ID: <20260727164715.2866609-2-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260727164715.2866609-1-usama.anjum@arm.com>
References: <20260727164715.2866609-1-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1785170865-F5E0E77B-B74966A7/0/0
X-purgate-type: clean
X-purgate-size: 1563

pte_t is used both for logical PTE values and for entries stored in a PTE
table, so pte_t * does not distinguish a pointer to a copied value from a
pointer to table storage.

Introduce hw_pte_t as the generic name for a PTE table element. Define it
as an alias of pte_t by default so architectures retain their existing
representation and behavior until they opt in to a distinct storage type.

Include asm/page.h so pte_t is defined before the generic alias.

Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
 MAINTAINERS                   |  1 +
 include/linux/pgtable_types.h | 11 +++++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 include/linux/pgtable_types.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 15dd00c7ffec5..78aac05949829 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16981,6 +16981,7 @@ F:	include/linux/mmu_notifier.h
 F:	include/linux/pagewalk.h
 F:	include/linux/pgalloc.h
 F:	include/linux/pgtable.h
+F:	include/linux/pgtable_types.h
 F:	include/linux/ptdump.h
 F:	include/linux/vmpressure.h
 F:	include/linux/vmstat.h
diff --git a/include/linux/pgtable_types.h b/include/linux/pgtable_types.h
new file mode 100644
index 0000000000000..ed5dba42a4f8c
--- /dev/null
+++ b/include/linux/pgtable_types.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_PGTABLE_TYPES_H
+#define _LINUX_PGTABLE_TYPES_H
+
+#include <asm/page.h>
+
+#ifndef __HAVE_ARCH_HW_PTE_T
+#define hw_pte_t pte_t
+#endif
+
+#endif /* _LINUX_PGTABLE_TYPES_H */
-- 
2.47.3


