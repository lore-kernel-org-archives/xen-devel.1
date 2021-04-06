Return-Path: <SRS0=uqgo=JD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB0FC433B4
	for <xen-devel@archiver.kernel.org>; Tue,  6 Apr 2021 11:06:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E22A261055
	for <xen-devel@archiver.kernel.org>; Tue,  6 Apr 2021 11:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E22A261055
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.105804.202416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTjXR-0004Rt-5d; Tue, 06 Apr 2021 11:06:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105804.202416; Tue, 06 Apr 2021 11:06:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTjXQ-0004Rc-Un; Tue, 06 Apr 2021 11:06:28 +0000
Received: by outflank-mailman (input) for mailman id 105804;
 Tue, 06 Apr 2021 11:06:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1lTjXP-0004PN-Bj
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 11:06:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lTjXP-00053O-5g; Tue, 06 Apr 2021 11:06:27 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=ua82172827c7b5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lTjXO-0002qD-Oe; Tue, 06 Apr 2021 11:06:27 +0000
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
	s=20200302mail; h=References:In-Reply-To:References:In-Reply-To:Message-Id:
	Date:Subject:Cc:To:From; bh=sENfbFuCu1+L3yhspWdtG93S3uUvA4Qf23dnlgpUlWw=; b=g
	6/uFwrP0ztAxMAycJ3CwgsiAbXrnNZIGYO1Ks0rZSQPbqqK+pIA3CBbFDGdyu+B3BzMPK1ZGVl4fg
	a/oSn/Xi7pVhWL5i9yi1BDuXHVds0AIrw0j2Ds3eKEjQjezcYTVSoWyxJYAm3Y6CMv3sUM3CpRdd4
	Yef6mOmhATHukP1c=;
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Cc: jgrall@amazon.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v9 06/13] x86_64/mm: switch to new APIs in setup_m2p_table
Date: Tue,  6 Apr 2021 12:05:54 +0100
Message-Id: <a556247b09ed587b38feae9c95bd9c8d70bf2b23.1617706782.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617706782.git.hongyxia@amazon.com>
References: <cover.1617706782.git.hongyxia@amazon.com>
In-Reply-To: <cover.1617706782.git.hongyxia@amazon.com>
References: <cover.1617706782.git.hongyxia@amazon.com>

From: Wei Liu <wei.liu2@citrix.com>

While doing so, avoid repetitive mapping of l2_ro_mpt by keeping it
across loops, and only unmap and map it when crossing 1G boundaries.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>

---
Changed in v8:
- re-structure if condition around l2_ro_mpt.
- reword the commit message.

Changed in v7:
- avoid repetitive mapping of l2_ro_mpt.
- edit commit message.
- switch to alloc_map_clear_xen_pt().
---
 xen/arch/x86/x86_64/mm.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index da239f097703..442f345b2a54 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -402,7 +402,8 @@ static int setup_m2p_table(struct mem_hotadd_info *info)
 
     ASSERT(l4e_get_flags(idle_pg_table[l4_table_offset(RO_MPT_VIRT_START)])
             & _PAGE_PRESENT);
-    l3_ro_mpt = l4e_to_l3e(idle_pg_table[l4_table_offset(RO_MPT_VIRT_START)]);
+    l3_ro_mpt = map_l3t_from_l4e(
+                    idle_pg_table[l4_table_offset(RO_MPT_VIRT_START)]);
 
     smap = (info->spfn & (~((1UL << (L2_PAGETABLE_SHIFT - 3)) -1)));
     emap = ((info->epfn + ((1UL << (L2_PAGETABLE_SHIFT - 3)) - 1 )) &
@@ -420,6 +421,10 @@ static int setup_m2p_table(struct mem_hotadd_info *info)
     i = smap;
     while ( i < emap )
     {
+        if ( (RO_MPT_VIRT_START + i * sizeof(*machine_to_phys_mapping)) &
+             ((1UL << L3_PAGETABLE_SHIFT) - 1) )
+            UNMAP_DOMAIN_PAGE(l2_ro_mpt);
+
         switch ( m2p_mapped(i) )
         {
         case M2P_1G_MAPPED:
@@ -455,32 +460,31 @@ static int setup_m2p_table(struct mem_hotadd_info *info)
 
             ASSERT(!(l3e_get_flags(l3_ro_mpt[l3_table_offset(va)]) &
                   _PAGE_PSE));
-            if ( l3e_get_flags(l3_ro_mpt[l3_table_offset(va)]) &
-              _PAGE_PRESENT )
-                l2_ro_mpt = l3e_to_l2e(l3_ro_mpt[l3_table_offset(va)]) +
-                  l2_table_offset(va);
+            if ( l2_ro_mpt )
+                /* nothing */;
+            else if ( l3e_get_flags(l3_ro_mpt[l3_table_offset(va)]) &
+                      _PAGE_PRESENT )
+                l2_ro_mpt = map_l2t_from_l3e(l3_ro_mpt[l3_table_offset(va)]);
             else
             {
-                l2_ro_mpt = alloc_xen_pagetable();
+                mfn_t l2_ro_mpt_mfn;
+
+                l2_ro_mpt = alloc_map_clear_xen_pt(&l2_ro_mpt_mfn);
                 if ( !l2_ro_mpt )
                 {
                     ret = -ENOMEM;
                     goto error;
                 }
 
-                clear_page(l2_ro_mpt);
                 l3e_write(&l3_ro_mpt[l3_table_offset(va)],
-                          l3e_from_paddr(__pa(l2_ro_mpt),
-                                         __PAGE_HYPERVISOR_RO | _PAGE_USER));
-                l2_ro_mpt += l2_table_offset(va);
+                          l3e_from_mfn(l2_ro_mpt_mfn,
+                                       __PAGE_HYPERVISOR_RO | _PAGE_USER));
             }
 
             /* NB. Cannot be GLOBAL: guest user mode should not see it. */
-            l2e_write(l2_ro_mpt, l2e_from_mfn(mfn,
+            l2e_write(&l2_ro_mpt[l2_table_offset(va)], l2e_from_mfn(mfn,
                    /*_PAGE_GLOBAL|*/_PAGE_PSE|_PAGE_USER|_PAGE_PRESENT));
         }
-        if ( !((unsigned long)l2_ro_mpt & ~PAGE_MASK) )
-            l2_ro_mpt = NULL;
         i += ( 1UL << (L2_PAGETABLE_SHIFT - 3));
     }
 #undef CNT
@@ -488,6 +492,8 @@ static int setup_m2p_table(struct mem_hotadd_info *info)
 
     ret = setup_compat_m2p_table(info);
 error:
+    unmap_domain_page(l2_ro_mpt);
+    unmap_domain_page(l3_ro_mpt);
     return ret;
 }
 
-- 
2.23.3


