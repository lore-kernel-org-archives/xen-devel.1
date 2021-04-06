Return-Path: <SRS0=uqgo=JD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF3AAC433ED
	for <xen-devel@archiver.kernel.org>; Tue,  6 Apr 2021 11:14:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E25B613C8
	for <xen-devel@archiver.kernel.org>; Tue,  6 Apr 2021 11:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E25B613C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.105861.202492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTjfM-0006AT-Ip; Tue, 06 Apr 2021 11:14:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105861.202492; Tue, 06 Apr 2021 11:14:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTjfM-0006AI-9N; Tue, 06 Apr 2021 11:14:40 +0000
Received: by outflank-mailman (input) for mailman id 105861;
 Tue, 06 Apr 2021 11:14:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1lTjfL-00068F-3A
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 11:14:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lTjfK-0005DF-PH; Tue, 06 Apr 2021 11:14:38 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=ua82172827c7b5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lTjXW-0002qD-Ef; Tue, 06 Apr 2021 11:06:34 +0000
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
	Date:Subject:Cc:To:From; bh=ghfYvoztMTHTZUjJZnAAYnP+07ha7ktJ9bkRKWPH3C0=; b=p
	dpfQAPuqvalw97DlIN6QlIium63XHVzzicF8LwVLyNlh0Hi8+DeQWCo1P5ENQK2J2tbVPU7lqY642
	2z7mlsjHc06h4v5cLRU86NpLqLDbGmUadgIYcx54wwpem6xk2ItsgUB4O1uruBCrX3tAoganK5McH
	R699Sw+0+P8FU5CY=;
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Cc: jgrall@amazon.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v9 10/13] x86/smpboot: switch clone_mapping() to new APIs
Date: Tue,  6 Apr 2021 12:05:58 +0100
Message-Id: <d55bcecc33df5b277bc3e1dbb48826bc816d8d10.1617706782.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617706782.git.hongyxia@amazon.com>
References: <cover.1617706782.git.hongyxia@amazon.com>
In-Reply-To: <cover.1617706782.git.hongyxia@amazon.com>
References: <cover.1617706782.git.hongyxia@amazon.com>

From: Wei Liu <wei.liu2@citrix.com>

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>

---
Changed in v7:
- change patch title
- remove initialiser of pl3e.
- combine the initialisation of pl3e into a single assignment.
- use the new alloc_map_clear() helper.
- use the normal map_domain_page() in the error path.
---
 xen/arch/x86/smpboot.c | 44 ++++++++++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index e90c4dfa8a88..9c5323977b25 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -694,8 +694,8 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
     unsigned long linear = (unsigned long)ptr, pfn;
     unsigned int flags;
     l3_pgentry_t *pl3e;
-    l2_pgentry_t *pl2e;
-    l1_pgentry_t *pl1e;
+    l2_pgentry_t *pl2e = NULL;
+    l1_pgentry_t *pl1e = NULL;
     int rc = 0;
 
     /*
@@ -710,7 +710,7 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
          (linear >= XEN_VIRT_END && linear < DIRECTMAP_VIRT_START) )
         return -EINVAL;
 
-    pl3e = l4e_to_l3e(idle_pg_table[root_table_offset(linear)]) +
+    pl3e = map_l3t_from_l4e(idle_pg_table[root_table_offset(linear)]) +
         l3_table_offset(linear);
 
     flags = l3e_get_flags(*pl3e);
@@ -723,7 +723,7 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
     }
     else
     {
-        pl2e = l3e_to_l2e(*pl3e) + l2_table_offset(linear);
+        pl2e = map_l2t_from_l3e(*pl3e) + l2_table_offset(linear);
         flags = l2e_get_flags(*pl2e);
         ASSERT(flags & _PAGE_PRESENT);
         if ( flags & _PAGE_PSE )
@@ -734,7 +734,7 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
         }
         else
         {
-            pl1e = l2e_to_l1e(*pl2e) + l1_table_offset(linear);
+            pl1e = map_l1t_from_l2e(*pl2e) + l1_table_offset(linear);
             flags = l1e_get_flags(*pl1e);
             if ( !(flags & _PAGE_PRESENT) )
                 goto out;
@@ -742,51 +742,58 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
         }
     }
 
+    UNMAP_DOMAIN_PAGE(pl1e);
+    UNMAP_DOMAIN_PAGE(pl2e);
+    UNMAP_DOMAIN_PAGE(pl3e);
+
     if ( !(root_get_flags(rpt[root_table_offset(linear)]) & _PAGE_PRESENT) )
     {
-        pl3e = alloc_xen_pagetable();
+        mfn_t l3mfn;
+
+        pl3e = alloc_map_clear_xen_pt(&l3mfn);
         rc = -ENOMEM;
         if ( !pl3e )
             goto out;
-        clear_page(pl3e);
         l4e_write(&rpt[root_table_offset(linear)],
-                  l4e_from_paddr(__pa(pl3e), __PAGE_HYPERVISOR));
+                  l4e_from_mfn(l3mfn, __PAGE_HYPERVISOR));
     }
     else
-        pl3e = l4e_to_l3e(rpt[root_table_offset(linear)]);
+        pl3e = map_l3t_from_l4e(rpt[root_table_offset(linear)]);
 
     pl3e += l3_table_offset(linear);
 
     if ( !(l3e_get_flags(*pl3e) & _PAGE_PRESENT) )
     {
-        pl2e = alloc_xen_pagetable();
+        mfn_t l2mfn;
+
+        pl2e = alloc_map_clear_xen_pt(&l2mfn);
         rc = -ENOMEM;
         if ( !pl2e )
             goto out;
-        clear_page(pl2e);
-        l3e_write(pl3e, l3e_from_paddr(__pa(pl2e), __PAGE_HYPERVISOR));
+        l3e_write(pl3e, l3e_from_mfn(l2mfn, __PAGE_HYPERVISOR));
     }
     else
     {
         ASSERT(!(l3e_get_flags(*pl3e) & _PAGE_PSE));
-        pl2e = l3e_to_l2e(*pl3e);
+        pl2e = map_l2t_from_l3e(*pl3e);
     }
 
     pl2e += l2_table_offset(linear);
 
     if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) )
     {
-        pl1e = alloc_xen_pagetable();
+        mfn_t l1mfn;
+
+        pl1e = alloc_map_clear_xen_pt(&l1mfn);
         rc = -ENOMEM;
         if ( !pl1e )
             goto out;
-        clear_page(pl1e);
-        l2e_write(pl2e, l2e_from_paddr(__pa(pl1e), __PAGE_HYPERVISOR));
+        l2e_write(pl2e, l2e_from_mfn(l1mfn, __PAGE_HYPERVISOR));
     }
     else
     {
         ASSERT(!(l2e_get_flags(*pl2e) & _PAGE_PSE));
-        pl1e = l2e_to_l1e(*pl2e);
+        pl1e = map_l1t_from_l2e(*pl2e);
     }
 
     pl1e += l1_table_offset(linear);
@@ -802,6 +809,9 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
 
     rc = 0;
  out:
+    unmap_domain_page(pl1e);
+    unmap_domain_page(pl2e);
+    unmap_domain_page(pl3e);
     return rc;
 }
 
-- 
2.23.3


