Return-Path: <SRS0=rjis=JW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DECCAC433ED
	for <xen-devel@archiver.kernel.org>; Sun, 25 Apr 2021 20:13:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C68561285
	for <xen-devel@archiver.kernel.org>; Sun, 25 Apr 2021 20:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C68561285
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.117305.223152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lal8F-0001aF-IZ; Sun, 25 Apr 2021 20:13:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117305.223152; Sun, 25 Apr 2021 20:13:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lal8F-0001Zz-8n; Sun, 25 Apr 2021 20:13:31 +0000
Received: by outflank-mailman (input) for mailman id 117305;
 Sun, 25 Apr 2021 20:13:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lal8E-0001Y5-Am
 for xen-devel@lists.xenproject.org; Sun, 25 Apr 2021 20:13:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lal8E-0000od-1A; Sun, 25 Apr 2021 20:13:30 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lal8D-0005m7-Ow; Sun, 25 Apr 2021 20:13:30 +0000
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
	 bh=qdn1le94TFR9RGBuVbMK3tl4UOk0qVZcjP09VJjmTGA=; b=kSyw3dlhX1A7P2j0w/l4hybr8
	Ud7zQLDGt7Mn8i2uLPIulsJTxh+GPmAfBOJ+yF7305IdEUH38vps72MRsC2vx5R8CCCdDVKY8IHQD
	9hFVBq73P0B1YneXKbnrgn/waWH4v8dVnu9t/ZXBysrReYhDJFh8i2DS0ckzPd97eWLYM=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Wei.Chen@arm.com,
	Henry.Wang@arm.com,
	Penny.Zheng@arm.com,
	Bertrand.Marquis@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH RFCv2 05/15] xen/arm: mm: Avoid flushing the TLBs when mapping are inserted
Date: Sun, 25 Apr 2021 21:13:08 +0100
Message-Id: <20210425201318.15447-6-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210425201318.15447-1-julien@xen.org>
References: <20210425201318.15447-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

Currently, the function xen_pt_update() will flush the TLBs even when
the mappings are inserted. This is a bit wasteful because we don't
allow mapping replacement. Even if we were, the flush would need to
happen earlier because mapping replacement should use Break-Before-Make
when updating the entry.

A single call to xen_pt_update() can perform a single action. IOW, it
is not possible to, for instance, mix inserting and removing mappings.
Therefore, we can use `flags` to determine what action is performed.

This change will be particularly help to limit the impact of switching
boot time mapping to use xen_pt_update().

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

    Changes in v2:
        - New patch
---
 xen/arch/arm/mm.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 8ebb36899314..1fe52b3af722 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1101,7 +1101,13 @@ static bool xen_pt_check_entry(lpae_t entry, mfn_t mfn, unsigned int level,
         /* We should be here with a valid MFN. */
         ASSERT(!mfn_eq(mfn, INVALID_MFN));
 
-        /* We don't allow replacing any valid entry. */
+        /*
+         * We don't allow replacing any valid entry.
+         *
+         * Note that the function xen_pt_update() relies on this
+         * assumption and will skip the TLB flush. The function will need
+         * to be updated if the check is relaxed.
+         */
         if ( lpae_is_valid(entry) )
         {
             if ( lpae_is_mapping(entry, level) )
@@ -1333,11 +1339,16 @@ static int xen_pt_update(unsigned long virt,
     }
 
     /*
-     * Flush the TLBs even in case of failure because we may have
+     * The TLBs flush can be safely skipped when a mapping is inserted
+     * as we don't allow mapping replacement (see xen_pt_check_entry()).
+     *
+     * For all the other cases, the TLBs will be flushed unconditionally
+     * even if the mapping are failed. This is because we may have
      * partially modified the PT. This will prevent any unexpected
      * behavior afterwards.
      */
-    flush_xen_tlb_range_va(virt, PAGE_SIZE * nr_mfns);
+    if ( !(flags & _PAGE_PRESENT) || mfn_eq(mfn, INVALID_MFN) )
+        flush_xen_tlb_range_va(virt, PAGE_SIZE * nr_mfns);
 
     spin_unlock(&xen_pt_lock);
 
-- 
2.17.1


