Return-Path: <SRS0=/9Q0=HT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 444BFC433E0
	for <xen-devel@archiver.kernel.org>; Wed, 17 Feb 2021 14:25:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB0DE64E4D
	for <xen-devel@archiver.kernel.org>; Wed, 17 Feb 2021 14:25:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB0DE64E4D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.86285.161885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCNlO-0005Ln-Kf; Wed, 17 Feb 2021 14:25:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86285.161885; Wed, 17 Feb 2021 14:25:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCNlO-0005LS-At; Wed, 17 Feb 2021 14:25:10 +0000
Received: by outflank-mailman (input) for mailman id 86285;
 Wed, 17 Feb 2021 14:25:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lCNlM-0005Jc-W0
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 14:25:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCNlL-0004eT-3C; Wed, 17 Feb 2021 14:25:07 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCNlK-00057m-QC; Wed, 17 Feb 2021 14:25:07 +0000
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
	 bh=t6YsWVHT5mEBG6Q0BImhmwLAtI3B16h1jksP0n7ERIQ=; b=3uZES943amRECcWSte8d/Dw7R
	ooUX+hMcyyiJcd2+SiVkaL03GfOgZudyjNCtUsOlGFIAXRWUKX6zPL084P0mq3UBltQLNE3oIQNtO
	zRGebw4/RErIbC+mIgjphC42rG3SWLKaKVC/grLUGVeLLo8qTPRk6Fg09klw7eKzFDrbQ=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: hongyxia@amazon.co.uk,
	iwj@xenproject.org,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Paul Durrant <paul@xen.org>
Subject: [for-4.15][PATCH v3 2/3] xen/x86: iommu: Ignore IOMMU mapping requests when a domain is dying
Date: Wed, 17 Feb 2021 14:24:57 +0000
Message-Id: <20210217142458.3769-3-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210217142458.3769-1-julien@xen.org>
References: <20210217142458.3769-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

The new x86 IOMMU page-tables allocator will release the pages when
relinquishing the domain resources. However, this is not sufficient
when the domain is dying because nothing prevents page-table to be
allocated.

Currently page-table allocations can only happen from iommu_map(). As
the domain is dying, there is no good reason to continue to modify the
IOMMU page-tables.

In order to observe d->is_dying correctly, we need to rely on per-arch
locking, so the check to ignore IOMMU mapping is added on the per-driver
map_page() callback.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

Changes in v3:
    - Patch added. This is a replacement of "xen/iommu: iommu_map: Don't
    crash the domain if it is dying"
---
 xen/drivers/passthrough/amd/iommu_map.c | 13 +++++++++++++
 xen/drivers/passthrough/vtd/iommu.c     | 13 +++++++++++++
 xen/drivers/passthrough/x86/iommu.c     |  3 +++
 3 files changed, 29 insertions(+)

diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthrough/amd/iommu_map.c
index d3a8b1aec766..ed78a083ba12 100644
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -285,6 +285,19 @@ int amd_iommu_map_page(struct domain *d, dfn_t dfn, mfn_t mfn,
 
     spin_lock(&hd->arch.mapping_lock);
 
+    /*
+     * IOMMU mapping request can be safely ignored when the domain is dying.
+     *
+     * hd->arch.mapping_lock guarantees that d->is_dying will be observed
+     * before any page tables are freed (see iommu_free_pgtables() and
+     * iommu_clear_root_pgtable()).
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
index e1871f6c2bc1..239a63f74f64 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1771,6 +1771,19 @@ static int __must_check intel_iommu_map_page(struct domain *d, dfn_t dfn,
 
     spin_lock(&hd->arch.mapping_lock);
 
+    /*
+     * IOMMU mapping request can be safely ignored when the domain is dying.
+     *
+     * hd->arch.mapping_lock guarantees that d->is_dying will be observed
+     * before any page tables are freed (see iommu_free_pgtables() and
+     * iommu_clear_root_pgtable()).
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
index f54fc8093f18..faa0078db595 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -273,6 +273,9 @@ int iommu_free_pgtables(struct domain *d)
     /*
      * Pages will be moved to the free list below. So we want to
      * clear the root page-table to avoid any potential use after-free.
+     *
+     * After this call, no more IOMMU mapping can happen.
+     *
      */
     hd->platform_ops->clear_root_pgtable(d);
 
-- 
2.17.1


