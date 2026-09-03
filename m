Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5837AC624DA
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 10:31:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406731.1639920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x24jL-00076B-TR; Thu, 03 Sep 2026 10:31:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406731.1639920; Thu, 03 Sep 2026 10:31:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x24jL-000762-Pp; Thu, 03 Sep 2026 10:31:39 +0000
Received: by outflank-mailman (input) for mailman id 1406731;
 Thu, 03 Sep 2026 10:31:38 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <usama.anjum@arm.com>) id 1x24jK-00073S-A9
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 10:31:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x24jJ-003GIr-Mr
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 12:31:37 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <usama.anjum@arm.com>)
 id 6a994c73-2eae-0a2a0a5409dd-0a2a4508d218-44
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 12:31:37 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTP (eXpurgate 4.57.1)
 (envelope-from <usama.anjum@arm.com>)
 id 6a994c87-f659-0a2a45080019-d98c6eaccc0a-1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 12:31:35 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6C8A1F37;
 Thu,  3 Sep 2026 03:31:30 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com
 [10.2.198.93])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 75F4A3F673;
 Thu,  3 Sep 2026 03:31:25 -0700 (PDT)
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
	t=1788431494; bh=8uqvVZKecvI6tof0d601k1uUFNGK7TSPrxBJrkWSFMs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sXvoBVq6thF4MC66REFWIycWWSSZel6llh2rEnxk29YVxzxeqTuvKzkLPQExpL5vP
	 VIAxdYcA409XP5txGxWv7JlB54zBOpxe/Awbpe8nex8QVvSi/N1WKiqaShe9lPoTL+
	 u61Zttng6oGMuIVLrzcTlmYO3afTqLY+B5XmFwf0=
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
Subject: [PATCH v2 5/8] mm: convert PTE table entry to pte
Date: Thu,  3 Sep 2026 11:29:57 +0100
Message-ID: <20260903103002.1091859-6-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260903103002.1091859-1-usama.anjum@arm.com>
References: <20260903103002.1091859-1-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1788431496-CF55C87B-4EAAE030/0/0
X-purgate-type: clean
X-purgate-size: 895

The non-MMU stub receives hw_pte_t but returns a software PTE value. It
has no attached PTE that requires ptep_get(), so convert only the stored
entry through __pte_from_hw().

Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
Changes since v1:
- Explain why the NOMMU stub does not use ptep_get().
- Use software PTE value terminology.
---
 include/linux/hugetlb.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 0d2101facaa50..637fc863d3687 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -1278,7 +1278,8 @@ static inline pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 #ifdef CONFIG_MMU
 	return ptep_get(ptep);
 #else
-	return *ptep;
+	/* No attached PTE that requires ptep_get(). */
+	return __pte_from_hw(*ptep);
 #endif
 }
 
-- 
2.47.3


