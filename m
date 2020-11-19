Return-Path: <SRS0=hRpO=EZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65429C6379F
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2020 19:08:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC4CD20853
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2020 19:08:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="zL91chzf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC4CD20853
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.31367.61753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfpHn-0005gi-HA; Thu, 19 Nov 2020 19:08:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31367.61753; Thu, 19 Nov 2020 19:08:03 +0000
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
	id 1kfpHn-0005gX-Bv; Thu, 19 Nov 2020 19:08:03 +0000
Received: by outflank-mailman (input) for mailman id 31367;
 Thu, 19 Nov 2020 19:08:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kfpHl-0005de-Nl
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 19:08:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfpHl-0003TU-Ep; Thu, 19 Nov 2020 19:08:01 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfpHl-0000TE-7K; Thu, 19 Nov 2020 19:08:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfpHl-0005de-Nl
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 19:08:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=qv0miUVBKz6uIh+FSZC0kOfLNz+frFcB+3hoEnxh+9s=; b=zL91chzf8hZBUIw5w4SKJJCD1
	W/X7Rm/ungjPoPdwz8RLEZO8sUiZWA7VPaYJjnzH1tDtMwldOMDVQ7vxl8g14t32Vh6GS1ZF8E0s6
	piSb7LB0PqXXVptGpcTy159/CJZiKSLrcG4O7QFfpFifsZrcDgxk4XWSvPv/A/gPKu7xs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfpHl-0003TU-Ep; Thu, 19 Nov 2020 19:08:01 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=ufe34d9ed68d054.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfpHl-0000TE-7K; Thu, 19 Nov 2020 19:08:01 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	Julien Grall <julien.grall@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH RFC 6/6] xen/arm: mm: Re-implement early_fdt_map() using map_pages_to_xen()
Date: Thu, 19 Nov 2020 19:07:51 +0000
Message-Id: <20201119190751.22345-7-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119190751.22345-1-julien@xen.org>
References: <20201119190751.22345-1-julien@xen.org>

From: Julien Grall <julien.grall@arm.com>

Now that map_pages_to_xen() has been extended to support 2MB mappings,
we can replace the create_mappings() calls by map_pages_to_xen() calls.

The mapping can also be marked read-only as Xen as no business to modify
the host Device Tree.

Signed-off-by: Julien Grall <julien.grall@arm.com>
---
 xen/arch/arm/mm.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index aee6d410ac4f..37ea9d5ce20a 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -558,6 +558,7 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
     paddr_t offset;
     void *fdt_virt;
     uint32_t size;
+    int rc;
 
     /*
      * Check whether the physical FDT address is set and meets the minimum
@@ -573,8 +574,12 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
     /* The FDT is mapped using 2MB superpage */
     BUILD_BUG_ON(BOOT_FDT_VIRT_START % SZ_2M);
 
-    create_mappings(xen_second, BOOT_FDT_VIRT_START, paddr_to_pfn(base_paddr),
-                    SZ_2M >> PAGE_SHIFT, SZ_2M);
+    rc = map_pages_to_xen(BOOT_FDT_VIRT_START, maddr_to_mfn(base_paddr),
+                          SZ_2M >> PAGE_SHIFT,
+                          PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
+    if ( rc )
+        panic("Unable to map the device-tree.\n");
+
 
     offset = fdt_paddr % SECOND_SIZE;
     fdt_virt = (void *)BOOT_FDT_VIRT_START + offset;
@@ -588,9 +593,12 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
 
     if ( (offset + size) > SZ_2M )
     {
-        create_mappings(xen_second, BOOT_FDT_VIRT_START + SZ_2M,
-                        paddr_to_pfn(base_paddr + SZ_2M),
-                        SZ_2M >> PAGE_SHIFT, SZ_2M);
+        rc = map_pages_to_xen(BOOT_FDT_VIRT_START + SZ_2M,
+                              maddr_to_mfn(base_paddr + SZ_2M),
+                              SZ_2M >> PAGE_SHIFT,
+                              PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
+        if ( rc )
+            panic("Unable to map the device-tree\n");
     }
 
     return fdt_virt;
-- 
2.17.1


