Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C51C54F4D
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 16:56:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371797.1619282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woOcI-0007lY-7A; Mon, 27 Jul 2026 16:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371797.1619282; Mon, 27 Jul 2026 16:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woOcH-0007jN-Uz; Mon, 27 Jul 2026 16:55:49 +0000
Received: by outflank-mailman (input) for mailman id 1371797;
 Mon, 27 Jul 2026 16:47:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <usama.anjum@arm.com>) id 1woOUe-0005hq-0r
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 16:47:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woOUc-008hCR-Uq
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 18:47:55 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <usama.anjum@arm.com>)
 id 6a678b9f-5cb7-0a2a0a5109dd-0a2a4509c1d6-44
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 18:47:54 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTP (eXpurgate 4.57.1)
 (envelope-from <usama.anjum@arm.com>)
 id 6a678bba-be1a-0a2a45090019-d98c6eaca880-1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 18:47:54 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6328C1756;
 Mon, 27 Jul 2026 09:47:49 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com
 [10.2.198.93])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CAAF73F86F;
 Mon, 27 Jul 2026 09:47:44 -0700 (PDT)
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
	t=1785170873; bh=OeHCtGC0uAROhEyzqyRGicgDGQ57E/f+pQoW3sVwCjU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d9t9pVk3z+LotvxypYLqFho7KP5XEkp7l8lfha+xgcBRash4qGjZ0Vd/mV34z3ngj
	 YCiqC4R9lIHqddTtejnz0iRZ+amGDO4RrpcG6DeJWoifcWXWkFCXl4PCx8iVJw3r/E
	 fHskF6P1T34bdcplSjvRlLirD1a3/E+yp9d0XlLw=
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
Subject: [PATCH RFC 02/11] mm: make hw_pte_t visible to generic PTE interfaces
Date: Mon, 27 Jul 2026 17:46:53 +0100
Message-ID: <20260727164715.2866609-3-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260727164715.2866609-1-usama.anjum@arm.com>
References: <20260727164715.2866609-1-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1785170874-FDC6D034-99337F8F/0/0
X-purgate-type: clean
X-purgate-size: 1823

Later conversions use hw_pte_t in page-table checking, generic page-table
helpers, and vmalloc interfaces. Include linux/pgtable_types.h from the
headers that declare those interfaces before changing their types.

For vmalloc.h, replace the direct asm/page.h include with
linux/pgtable_types.h. The latter includes asm/page.h, so pgprot_t remains
available.

Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
 include/linux/page_table_check.h | 2 ++
 include/linux/pgtable.h          | 1 +
 include/linux/vmalloc.h          | 2 +-
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/page_table_check.h b/include/linux/page_table_check.h
index 12268a32e8be1..12ee6d16ad339 100644
--- a/include/linux/page_table_check.h
+++ b/include/linux/page_table_check.h
@@ -7,6 +7,8 @@
 #ifndef __LINUX_PAGE_TABLE_CHECK_H
 #define __LINUX_PAGE_TABLE_CHECK_H
 
+#include <linux/pgtable_types.h>
+
 #ifdef CONFIG_PAGE_TABLE_CHECK
 #include <linux/jump_label.h>
 
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 8c093c119e5a8..cf595608cc4c4 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -4,6 +4,7 @@
 
 #include <linux/pfn.h>
 #include <asm/pgtable.h>
+#include <linux/pgtable_types.h>
 
 #define PMD_ORDER	(PMD_SHIFT - PAGE_SHIFT)
 #define PUD_ORDER	(PUD_SHIFT - PAGE_SHIFT)
diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index e4d8d0a9f30f9..c59a68c183110 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -8,7 +8,7 @@
 #include <linux/init.h>
 #include <linux/list.h>
 #include <linux/llist.h>
-#include <asm/page.h>		/* pgprot_t */
+#include <linux/pgtable_types.h>	/* pgprot_t, hw_pte_t */
 #include <linux/rbtree.h>
 #include <linux/overflow.h>
 
-- 
2.47.3


