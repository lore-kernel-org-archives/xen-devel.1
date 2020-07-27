Return-Path: <SRS0=5MCE=BG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A161C43458
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2020 14:40:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EA4E20719
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2020 14:40:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="nD6Ce3tQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EA4E20719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k04II-0000gX-GF; Mon, 27 Jul 2020 14:39:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wM/5=BG=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1k04IG-0000dz-TH
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 14:39:56 +0000
X-Inumbo-ID: 06b3e7f8-d017-11ea-a7dc-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 06b3e7f8-d017-11ea-a7dc-12813bfff9fa;
 Mon, 27 Jul 2020 14:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5NW5X4tKkJdncJ3jCsyAFhkJXBFKJtHVYTfU6S+d5S0=; b=nD6Ce3tQfWBHg/ctqxHn3jozva
 xe8pRF309lfmlRrapwqOKGfGgV+d3/dcHc6OjmX1GDQfdDdTxcD9RfSrvfkY8buKwd3VQRy02v2BB
 iDDl2nRpjgIPcDX/3w88eQtFOpUkLzrv2M4eGIxdfKDfSIVBgIOFPy1/MgVHQC6SATBk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1k04I9-0001kj-Uo; Mon, 27 Jul 2020 14:39:49 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1k041V-0002w6-2v; Mon, 27 Jul 2020 14:22:37 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v8 14/15] x86: switch to use domheap page for page tables
Date: Mon, 27 Jul 2020 15:22:04 +0100
Message-Id: <53c9d3ced017091305a5fcf94bf3d74c58735c63.1595857947.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1595857947.git.hongyxia@amazon.com>
References: <cover.1595857947.git.hongyxia@amazon.com>
In-Reply-To: <cover.1595857947.git.hongyxia@amazon.com>
References: <cover.1595857947.git.hongyxia@amazon.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jgrall@amazon.com,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Hongyan Xia <hongyxia@amazon.com>

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>

---
Changed in v8:
- const qualify pg in alloc_xen_pagetable_new().
---
 xen/arch/x86/mm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 76b8c681c9..8348f6329f 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4935,10 +4935,10 @@ mfn_t alloc_xen_pagetable_new(void)
 {
     if ( system_state != SYS_STATE_early_boot )
     {
-        void *ptr = alloc_xenheap_page();
+        const struct page_info *pg = alloc_domheap_page(NULL, 0);
 
-        BUG_ON(!hardware_domain && !ptr);
-        return ptr ? virt_to_mfn(ptr) : INVALID_MFN;
+        BUG_ON(!hardware_domain && !pg);
+        return pg ? page_to_mfn(pg) : INVALID_MFN;
     }
 
     return alloc_boot_pages(1, 1);
@@ -4948,7 +4948,7 @@ mfn_t alloc_xen_pagetable_new(void)
 void free_xen_pagetable_new(mfn_t mfn)
 {
     if ( system_state != SYS_STATE_early_boot && !mfn_eq(mfn, INVALID_MFN) )
-        free_xenheap_page(mfn_to_virt(mfn_x(mfn)));
+        free_domheap_page(mfn_to_page(mfn));
 }
 
 void *alloc_map_clear_xen_pt(mfn_t *pmfn)
-- 
2.16.6


