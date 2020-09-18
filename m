Return-Path: <SRS0=htIg=C3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E440C43464
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2020 16:44:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B01252076B
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2020 16:44:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VlNEUv9L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B01252076B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kJJUZ-0006LK-E4; Fri, 18 Sep 2020 16:44:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EJp8=C3=casper.srs.infradead.org=batv+1a7941a35ce833a0e493+6235+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kJJUY-0006Kw-Rk
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2020 16:44:10 +0000
X-Inumbo-ID: 205d5fa5-3965-4473-a098-322d22575366
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 205d5fa5-3965-4473-a098-322d22575366;
 Fri, 18 Sep 2020 16:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=69oCjFxEJdGUlaKFJvOKKJe894mXXG8veyEGu1EhEJ0=; b=VlNEUv9LV+aY4SkVXB3pcBhQK7
 +4f1IfC2eWnutDmDJHsF4O75LR/vsSEVed4BUN269IhW+paaZFAbeUUdsKcoQ0gNW7Kfmr+VPkUHA
 GvwA1P+iQoGls6ETWLNao2T8t7Mr8sE0yPVdtkjO/LK1Nj783nR91OuW9xdY/1vbPRffrxGVOeG9X
 2sDnFATRgmtwPufmWpiyG7yWGqlpIhXWxZxQ7v2AcX7oVTThZ31QMmE6iQTzxt/29V6Jf9U4Wv6wu
 SyZcuuzTerz8XZ6jnd8TFvT9ezWRbKXv4ugYyyk7ROHTMayUrFcx1u8hULLBACrBBpTGGl5PxhvUl
 bs5MaWXw==;
Received: from 089144214092.atnat0023.highway.a1.net ([89.144.214.92]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJJUL-0007LP-9v; Fri, 18 Sep 2020 16:43:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Minchan Kim <minchan@kernel.org>,
 Nitin Gupta <ngupta@vflare.org>, x86@kernel.org,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
Subject: [PATCH 2/6] mm: add a vmap_pfn function
Date: Fri, 18 Sep 2020 18:37:20 +0200
Message-Id: <20200918163724.2511-3-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200918163724.2511-1-hch@lst.de>
References: <20200918163724.2511-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Add a proper helper to remap PFNs into kernel virtual space so that
drivers don't have to abuse alloc_vm_area and open coded PTE
manipulation for it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/vmalloc.h |  1 +
 mm/Kconfig              |  3 +++
 mm/vmalloc.c            | 45 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+)

diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index 0221f852a7e1a3..8ecd92a947ee0c 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -121,6 +121,7 @@ extern void vfree_atomic(const void *addr);
 
 extern void *vmap(struct page **pages, unsigned int count,
 			unsigned long flags, pgprot_t prot);
+void *vmap_pfn(unsigned long *pfns, unsigned int count, pgprot_t prot);
 extern void vunmap(const void *addr);
 
 extern int remap_vmalloc_range_partial(struct vm_area_struct *vma,
diff --git a/mm/Kconfig b/mm/Kconfig
index 6c974888f86f97..6fa7ba1199eb1e 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -815,6 +815,9 @@ config DEVICE_PRIVATE
 	  memory; i.e., memory that is only accessible from the device (or
 	  group of devices). You likely also want to select HMM_MIRROR.
 
+config VMAP_PFN
+	bool
+
 config FRAME_VECTOR
 	bool
 
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index be4724b916b3e7..59f2afcf26c312 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2407,6 +2407,51 @@ void *vmap(struct page **pages, unsigned int count,
 }
 EXPORT_SYMBOL(vmap);
 
+#ifdef CONFIG_VMAP_PFN
+struct vmap_pfn_data {
+	unsigned long	*pfns;
+	pgprot_t	prot;
+	unsigned int	idx;
+};
+
+static int vmap_pfn_apply(pte_t *pte, unsigned long addr, void *private)
+{
+	struct vmap_pfn_data *data = private;
+
+	if (WARN_ON_ONCE(pfn_valid(data->pfns[data->idx])))
+		return -EINVAL;
+	*pte = pte_mkspecial(pfn_pte(data->pfns[data->idx++], data->prot));
+	return 0;
+}
+
+/**
+ * vmap_pfn - map an array of PFNs into virtually contiguous space
+ * @pfns: array of PFNs
+ * @count: number of pages to map
+ * @prot: page protection for the mapping
+ *
+ * Maps @count PFNs from @pfns into contiguous kernel virtual space and returns
+ * the start address of the mapping.
+ */
+void *vmap_pfn(unsigned long *pfns, unsigned int count, pgprot_t prot)
+{
+	struct vmap_pfn_data data = { .pfns = pfns, .prot = pgprot_nx(prot) };
+	struct vm_struct *area;
+
+	area = get_vm_area_caller(count * PAGE_SIZE, VM_IOREMAP,
+			__builtin_return_address(0));
+	if (!area)
+		return NULL;
+	if (apply_to_page_range(&init_mm, (unsigned long)area->addr,
+			count * PAGE_SIZE, vmap_pfn_apply, &data)) {
+		free_vm_area(area);
+		return NULL;
+	}
+	return area->addr;
+}
+EXPORT_SYMBOL_GPL(vmap_pfn);
+#endif /* CONFIG_VMAP_PFN */
+
 static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
 				 pgprot_t prot, int node)
 {
-- 
2.28.0


