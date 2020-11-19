Return-Path: <SRS0=hRpO=EZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5174CC56201
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2020 19:08:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0577208D5
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2020 19:08:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="0DpbZfK/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0577208D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.31366.61741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfpHm-0005e6-4M; Thu, 19 Nov 2020 19:08:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31366.61741; Thu, 19 Nov 2020 19:08:02 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfpHl-0005dw-Va; Thu, 19 Nov 2020 19:08:01 +0000
Received: by outflank-mailman (input) for mailman id 31366;
 Thu, 19 Nov 2020 19:08:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kfpHk-0005bQ-KF
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 19:08:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfpHk-0003TA-8e; Thu, 19 Nov 2020 19:08:00 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfpHk-0000TE-1g; Thu, 19 Nov 2020 19:08:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfpHk-0005bQ-KF
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 19:08:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=OFTW7+XoUzoZJqOmYFJ6tvN5l1t/e5UfO6wPacf/RUI=; b=0DpbZfK/HWJzMuVRx7orNGkBS
	57IMf9WdvCWoIx4VzwZG/bZ5zb5qDQcM9bGlX879p6AbGFSr4LwnZmTi3N/dMVnEjY4jCb2snnRNi
	oMoZTEdFPbvcYBmp5RP4oj+GnnwCVDZrA/coXE5hrf28LGh+cd99Okc1sMszTev8e7HB4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfpHk-0003TA-8e; Thu, 19 Nov 2020 19:08:00 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=ufe34d9ed68d054.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfpHk-0000TE-1g; Thu, 19 Nov 2020 19:08:00 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	Julien Grall <julien.grall@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <julien.grall@amazon.com>
Subject: [PATCH RFC 5/6] xen/arm: mm: Don't open-code Xen PT update in remove_early_mappings
Date: Thu, 19 Nov 2020 19:07:50 +0000
Message-Id: <20201119190751.22345-6-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119190751.22345-1-julien@xen.org>
References: <20201119190751.22345-1-julien@xen.org>

From: Julien Grall <julien.grall@arm.com>

Now that xen_pt_update_entry() is able to deal with different mapping
size, we can replace the open-coding of the page-tables update by a call
to modify_xen_mappings().

As the function is not meant to fail, a BUG_ON is added to check the
return.

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Julien Grall <julien.grall@amazon.com>
---
 xen/arch/arm/mm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index af0f12b6e6d3..aee6d410ac4f 100644
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


