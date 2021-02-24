Return-Path: <SRS0=y6zA=H2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C48C433E6
	for <xen-devel@archiver.kernel.org>; Wed, 24 Feb 2021 09:44:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE92F64E2B
	for <xen-devel@archiver.kernel.org>; Wed, 24 Feb 2021 09:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE92F64E2B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.89217.167864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEqiG-0003My-4C; Wed, 24 Feb 2021 09:44:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89217.167864; Wed, 24 Feb 2021 09:44:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEqiF-0003Mf-UO; Wed, 24 Feb 2021 09:44:07 +0000
Received: by outflank-mailman (input) for mailman id 89217;
 Wed, 24 Feb 2021 09:44:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lEqiE-0003Ly-OI
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 09:44:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lEqiC-0002NU-BH; Wed, 24 Feb 2021 09:44:04 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lEqiC-0000gz-2Q; Wed, 24 Feb 2021 09:44:04 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=F3pV8CFzjIR41kWk/X0MEyzvkJbWUgUJEtOR4PpRZWU=; b=eZG7nvMrer8uwX99SXEsH1jm+
	OXnaUoii+JE82exb2YLB9QGB9igVhFIF+ZVs3GfL2eiYh1sG5tsaIc93MsANIb0+6R6MeZWyINPdl
	9Mkka/pgWj/2pGTao6Tpz4updx1JSjgIWt+WIHe3nC2c6wOCkjA52lHFuHxDRjcBVLGc0=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: hongyxia@amazon.co.uk,
	iwj@xenproject.org,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Paul Durrant <paul@xen.org>
Subject: [for-4.15][RESEND PATCH v4 1/2] xen/x86: iommu: Ignore IOMMU mapping requests when a domain is dying
Date: Wed, 24 Feb 2021 09:43:55 +0000
Message-Id: <20210224094356.7606-2-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210224094356.7606-1-julien@xen.org>
References: <20210224094356.7606-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

The new x86 IOMMU page-tables allocator will release the pages when
relinquishing the domain resources. However, this is not sufficient
when the domain is dying because nothing prevents page-table to be
allocated.

As the domain is dying, it is not necessary to continue to modify the
IOMMU page-tables as they are going to be destroyed soon.

At the moment, page-table allocates will only happen when iommu_map().
So after this change there will be no more page-table allocation
happening.

In order to observe d->is_dying correctly, we need to rely on per-arch
locking, so the check to ignore IOMMU mapping is added on the per-driver
map_page() callback.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

As discussed in v3, this is only covering 4.15. We can discuss
post-4.15 how to catch page-table allocations if another caller (e.g.
iommu_unmap() if we ever decide to support superpages) start to use the
page-table allocator.

Changes in v4:
    - Move the patch to the top of the queue
    - Reword the commit message

Changes in v3:
    - Patch added. This is a replacement of "xen/iommu: iommu_map: Don't
    crash the domain if it is dying"
---
 xen/drivers/passthrough/amd/iommu_map.c | 12 ++++++++++++
 xen/drivers/passthrough/vtd/iommu.c     | 12 ++++++++++++
 xen/drivers/passthrough/x86/iommu.c     |  6 ++++++
 3 files changed, 30 insertions(+)

diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthrough/amd/iommu_map.c
index d3a8b1aec766..560af54b765b 100644
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -285,6 +285,18 @@ int amd_iommu_map_page(struct domain *d, dfn_t dfn, mfn_t mfn,
 
     spin_lock(&hd->arch.mapping_lock);
 
+    /*
+     * IOMMU mapping request can be safely ignored when the domain is dying.
+     *
+     * hd->arch.mapping_lock guarantees that d->is_dying will be observed
+     * before any page tables are freed (see iommu_free_pgtables()).
+     */
+    if ( d->is_dying )
+    {
+        spin_unlock(&hd->arch.mapping_lock);
+        return 0;
+    }
+
     rc = amd_iommu_alloc_root(d);
     if ( rc )
     {
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index d136fe36883b..b549a71530d5 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1762,6 +1762,18 @@ static int __must_check intel_iommu_map_page(struct domain *d, dfn_t dfn,
 
     spin_lock(&hd->arch.mapping_lock);
 
+    /*
+     * IOMMU mapping request can be safely ignored when the domain is dying.
+     *
+     * hd->arch.mapping_lock guarantees that d->is_dying will be observed
+     * before any page tables are freed (see iommu_free_pgtables())
+     */
+    if ( d->is_dying )
+    {
+        spin_unlock(&hd->arch.mapping_lock);
+        return 0;
+    }
+
     pg_maddr = addr_to_dma_page_maddr(d, dfn_to_daddr(dfn), 1);
     if ( !pg_maddr )
     {
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index cea1032b3d02..c6b03624fe28 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -267,6 +267,12 @@ int iommu_free_pgtables(struct domain *d)
     struct page_info *pg;
     unsigned int done = 0;
 
+    if ( !is_iommu_enabled(d) )
+        return 0;
+
+    /* After this barrier, no more IOMMU mapping can happen */
+    spin_barrier(&hd->arch.mapping_lock);
+
     while ( (pg = page_list_remove_head(&hd->arch.pgtables.list)) )
     {
         free_domheap_page(pg);
-- 
2.17.1


