Return-Path: <SRS0=rjis=JW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D0ABC43461
	for <xen-devel@archiver.kernel.org>; Sun, 25 Apr 2021 20:13:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13E4F611ED
	for <xen-devel@archiver.kernel.org>; Sun, 25 Apr 2021 20:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13E4F611ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.117306.223167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lal8H-0001ex-S2; Sun, 25 Apr 2021 20:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117306.223167; Sun, 25 Apr 2021 20:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lal8H-0001el-NM; Sun, 25 Apr 2021 20:13:33 +0000
Received: by outflank-mailman (input) for mailman id 117306;
 Sun, 25 Apr 2021 20:13:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lal8G-0001ci-6i
 for xen-devel@lists.xenproject.org; Sun, 25 Apr 2021 20:13:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lal8F-0000om-LM; Sun, 25 Apr 2021 20:13:31 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lal8F-0005m7-Cs; Sun, 25 Apr 2021 20:13:31 +0000
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
	 bh=siVUWwfApP96aB3lihKwJZ2TVvy/coY05i6ribyQkaQ=; b=TFO4q8j8JOAgGjBBHSZTLC9+u
	iMlWqMTBkWFPT36hYWWc45g8Fn5uSG78rEvAy+6H21I/Zi1kc+RNJ+JDddxtmVz/WrZPfWXlehK++
	RbjszRSe7SLY8uM6Tn4Vd5WPAUN7qbDigjXmUG8LihxVjqOpSclHnKLMMocAWn9vFeTmM=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Wei.Chen@arm.com,
	Henry.Wang@arm.com,
	Penny.Zheng@arm.com,
	Bertrand.Marquis@arm.com,
	Julien Grall <julien.grall@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH RFCv2 06/15] xen/arm: mm: Don't open-code Xen PT update in remove_early_mappings()
Date: Sun, 25 Apr 2021 21:13:09 +0100
Message-Id: <20210425201318.15447-7-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210425201318.15447-1-julien@xen.org>
References: <20210425201318.15447-1-julien@xen.org>

From: Julien Grall <julien.grall@arm.com>

Now that xen_pt_update_entry() is able to deal with different mapping
size, we can replace the open-coding of the page-tables update by a call
to modify_xen_mappings().

As the function is not meant to fail, a BUG_ON() is added to check the
return.

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v2:
        - Stay consistent with how function name are used in the commit
        message
        - Add my AWS signed-off-by
---
 xen/arch/arm/mm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 1fe52b3af722..2cbfbe25240e 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -598,11 +598,11 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
 
 void __init remove_early_mappings(void)
 {
-    lpae_t pte = {0};
-    write_pte(xen_second + second_table_offset(BOOT_FDT_VIRT_START), pte);
-    write_pte(xen_second + second_table_offset(BOOT_FDT_VIRT_START + SZ_2M),
-              pte);
-    flush_xen_tlb_range_va(BOOT_FDT_VIRT_START, BOOT_FDT_SLOT_SIZE);
+    int rc;
+
+    rc = modify_xen_mappings(BOOT_FDT_VIRT_START, BOOT_FDT_VIRT_END,
+                             _PAGE_BLOCK);
+    BUG_ON(rc);
 }
 
 /*
-- 
2.17.1


