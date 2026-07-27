Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B25C54EFC
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 16:56:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371799.1619285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woOcI-0007t5-CE; Mon, 27 Jul 2026 16:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371799.1619285; Mon, 27 Jul 2026 16:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woOcI-0007rC-8F; Mon, 27 Jul 2026 16:55:50 +0000
Received: by outflank-mailman (input) for mailman id 1371799;
 Mon, 27 Jul 2026 16:48:05 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <usama.anjum@arm.com>) id 1woOUn-0005if-ER
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 16:48:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woOUm-000Jar-DK
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 18:48:04 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <usama.anjum@arm.com>)
 id 6a678bc3-bab6-0a2a0a5309dd-0a2a4506c9c6-0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 18:48:03 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTP (eXpurgate 4.57.1)
 (envelope-from <usama.anjum@arm.com>)
 id 6a678bc3-195a-0a2a45060019-d98c6eac9434-1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 18:48:03 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F7E01713;
 Mon, 27 Jul 2026 09:47:58 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com
 [10.2.198.93])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C99943F86F;
 Mon, 27 Jul 2026 09:47:53 -0700 (PDT)
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
	t=1785170882; bh=1nPdXqpMGrD8xhrtZLy0UKY4t0IJBjPnmmBVyVTpx2M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VrTwGW4mYDqQ+Z27OKZvmrSWlMxIF9vB8wItFBCFzOD96K2SMpyMovHX9gdNiY0K6
	 KTkZ43BeXBYATryo387K8Y/zE/PbD147zbQij+iKgrmmKw6au5gN84pjtEpgkqn/nN
	 weSnIFswO51i+rS/asQ1MifW24hm3Y/lBeLNUCWM=
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
Subject: [PATCH RFC 03/11] mm: name pointers to copied PTE values ptentp
Date: Mon, 27 Jul 2026 17:46:54 +0100
Message-ID: <20260727164715.2866609-4-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260727164715.2866609-1-usama.anjum@arm.com>
References: <20260727164715.2866609-1-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1785170883-F520877B-B7B78683/0/0
X-purgate-type: clean
X-purgate-size: 2481

The hw_pte_t conversion must retain pte_t * for pointers to standalone PTE
values. Name the value parameters ptentp in the install_pte callback,
write_protect_page(), and guard_install_set_pte() so the later mechanical
conversion can distinguish them from pointers to PTE table storage.

Some functions already use the ptentp name, including:
- madvise_folio_pte_batch()
- folio_pte_batch_flags()
No need to convert them.

This is a naming-only change.

Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
 include/linux/pagewalk.h | 2 +-
 mm/ksm.c                 | 4 ++--
 mm/madvise.c             | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
index b41d7265c01bc..c34d826c5e4a2 100644
--- a/include/linux/pagewalk.h
+++ b/include/linux/pagewalk.h
@@ -89,7 +89,7 @@ struct mm_walk_ops {
 		       struct mm_walk *walk);
 	void (*post_vma)(struct mm_walk *walk);
 	int (*install_pte)(unsigned long addr, unsigned long next,
-			   pte_t *ptep, struct mm_walk *walk);
+			   pte_t *ptentp, struct mm_walk *walk);
 	enum page_walk_lock walk_lock;
 };
 
diff --git a/mm/ksm.c b/mm/ksm.c
index b9b32f7bfb691..c41b2c241bb09 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -1292,7 +1292,7 @@ static u32 calc_checksum(struct page *page)
 }
 
 static int write_protect_page(struct vm_area_struct *vma, struct folio *folio,
-			      pte_t *orig_pte)
+			      pte_t *ptentp)
 {
 	struct mm_struct *mm = vma->vm_mm;
 	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, 0, 0);
@@ -1371,7 +1371,7 @@ static int write_protect_page(struct vm_area_struct *vma, struct folio *folio,
 
 		set_pte_at(mm, pvmw.address, pvmw.pte, entry);
 	}
-	*orig_pte = entry;
+	*ptentp = entry;
 	err = 0;
 
 out_unlock:
diff --git a/mm/madvise.c b/mm/madvise.c
index 07a21ca31bad4..c324cc991f841 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -1101,12 +1101,12 @@ static int guard_install_pte_entry(pte_t *pte, unsigned long addr,
 }
 
 static int guard_install_set_pte(unsigned long addr, unsigned long next,
-				 pte_t *ptep, struct mm_walk *walk)
+				 pte_t *ptentp, struct mm_walk *walk)
 {
 	unsigned long *nr_pages = (unsigned long *)walk->private;
 
 	/* Simply install a PTE marker, this causes segfault on access. */
-	*ptep = make_pte_marker(PTE_MARKER_GUARD);
+	*ptentp = make_pte_marker(PTE_MARKER_GUARD);
 	(*nr_pages)++;
 
 	return 0;
-- 
2.47.3


