Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D641DC54F4E
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 16:56:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371811.1619327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woOcL-0000Gg-8m; Mon, 27 Jul 2026 16:55:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371811.1619327; Mon, 27 Jul 2026 16:55:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woOcK-0000Ej-RH; Mon, 27 Jul 2026 16:55:52 +0000
Received: by outflank-mailman (input) for mailman id 1371811;
 Mon, 27 Jul 2026 16:48:58 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <usama.anjum@arm.com>) id 1woOVe-0005nN-Oq
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 16:48:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woOVe-00CEIp-5m
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 18:48:58 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <usama.anjum@arm.com>)
 id 6a678bf6-bab6-0a2a0a5309dd-0a2a450c9a16-6
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 18:48:58 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTP (eXpurgate 4.57.1)
 (envelope-from <usama.anjum@arm.com>)
 id 6a678bf9-f479-0a2a450c0019-d98c6eaca1c4-1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 18:48:57 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A614F1764;
 Mon, 27 Jul 2026 09:48:52 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com
 [10.2.198.93])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1AEFB3F86F;
 Mon, 27 Jul 2026 09:48:47 -0700 (PDT)
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
	t=1785170936; bh=qEy/4+Wk/vbSZVdyK/qjuUUSc2n2G8gdddSYiTCTNvs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cDo3Do/rskCw4TMjsksYR/tTcB5Uv/vDrx6ixPR1mOTM9Q1q7fU9kGjz12p9Id7LU
	 nUuEt+vwKjZkAjRnRdC1eDlKTRvfsr1Lh1WkbMYT2XqOqXc7LIJh1KJzggyS6NyLvN
	 HLK4yn08JVV6tDRzci16mxLBAw0vZjMCqreNmXG8=
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
Subject: [PATCH RFC 09/11] misc/sgi-gru: use ptep_get() for page-table reads
Date: Mon, 27 Jul 2026 17:47:00 +0100
Message-ID: <20260727164715.2866609-10-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260727164715.2866609-1-usama.anjum@arm.com>
References: <20260727164715.2866609-1-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1785170937-008CDA5B-8579A142/0/0
X-purgate-type: clean
X-purgate-size: 1091

A leaf PMD is being read through ptep_get() by treating the PMD address
as PTE-sized table storage. ptep_get() now accepts hw_pte_t *, so update
the cast accordingly.

pte_offset_kernel() also returns hw_pte_t *. Get pte_t value by calling
ptep_get().

Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
 drivers/misc/sgi-gru/grufault.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/sgi-gru/grufault.c b/drivers/misc/sgi-gru/grufault.c
index 3557d78ee47a2..ff89d34ad2aa4 100644
--- a/drivers/misc/sgi-gru/grufault.c
+++ b/drivers/misc/sgi-gru/grufault.c
@@ -228,10 +228,10 @@ static int atomic_pte_lookup(struct vm_area_struct *vma, unsigned long vaddr,
 		goto err;
 #ifdef CONFIG_X86_64
 	if (unlikely(pmd_leaf(*pmdp)))
-		pte = ptep_get((pte_t *)pmdp);
+		pte = ptep_get((hw_pte_t *)pmdp);
 	else
 #endif
-		pte = *pte_offset_kernel(pmdp, vaddr);
+		pte = ptep_get(pte_offset_kernel(pmdp, vaddr));
 
 	if (unlikely(!pte_present(pte) ||
 		     (write && (!pte_write(pte) || !pte_dirty(pte)))))
-- 
2.47.3


