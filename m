Return-Path: <SRS0=iyTO=JM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E82D6C433ED
	for <xen-devel@archiver.kernel.org>; Thu, 15 Apr 2021 09:41:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97E6760FD8
	for <xen-devel@archiver.kernel.org>; Thu, 15 Apr 2021 09:41:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97E6760FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.110976.212070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWyV9-0001Wq-UG; Thu, 15 Apr 2021 09:41:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110976.212070; Thu, 15 Apr 2021 09:41:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWyV9-0001Wj-RS; Thu, 15 Apr 2021 09:41:31 +0000
Received: by outflank-mailman (input) for mailman id 110976;
 Thu, 15 Apr 2021 09:41:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x7n8=JM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lWyV9-0001We-6G
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 09:41:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87f9c48e-6b83-45f4-b161-bd061daff44d;
 Thu, 15 Apr 2021 09:41:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 38852AC87;
 Thu, 15 Apr 2021 09:41:29 +0000 (UTC)
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
X-Inumbo-ID: 87f9c48e-6b83-45f4-b161-bd061daff44d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618479689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DJ55pGTV1Ycmrz3jU7NCoDWaPsEth8XN2XbbDgtsXps=;
	b=VMdxY6pVbLmlOd8UNH5jMmtZrZlbg6cpeJARtuShvfJ64cctg7gEptccF9PlI13E7QaDjo
	jBTocpRsma0J43aTzw7uptnEY0wqlfflfaqy1YX2XQIwfnrc9hMCjen4r4ieeNbzs6+KDZ
	MQl7WfFmVT2ovdTRtRoeKxqZPc8X+Ho=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] gnttab: defer allocation of status frame tracking array
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Message-ID: <d2397cd4-040e-3cc0-22d8-3f65d01f9326@suse.com>
Date: Thu, 15 Apr 2021 11:41:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This array can be large when many grant frames are permitted; avoid
allocating it when it's not going to be used anyway, by doing this only
in gnttab_populate_status_frames().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Drop smp_wmb(). Re-base.
v2: Defer allocation to when a domain actually switches to the v2 grant
    API.

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -1747,6 +1747,17 @@ gnttab_populate_status_frames(struct dom
     /* Make sure, prior version checks are architectural visible */
     block_speculation();
 
+    if ( gt->status == ZERO_BLOCK_PTR )
+    {
+        gt->status = xzalloc_array(grant_status_t *,
+                                   grant_to_status_frames(gt->max_grant_frames));
+        if ( !gt->status )
+        {
+            gt->status = ZERO_BLOCK_PTR;
+            return -ENOMEM;
+        }
+    }
+
     for ( i = nr_status_frames(gt); i < req_status_frames; i++ )
     {
         if ( (gt->status[i] = alloc_xenheap_page()) == NULL )
@@ -1767,18 +1778,23 @@ status_alloc_failed:
         free_xenheap_page(gt->status[i]);
         gt->status[i] = NULL;
     }
+    if ( !nr_status_frames(gt) )
+    {
+        xfree(gt->status);
+        gt->status = ZERO_BLOCK_PTR;
+    }
     return -ENOMEM;
 }
 
 static int
 gnttab_unpopulate_status_frames(struct domain *d, struct grant_table *gt)
 {
-    unsigned int i;
+    unsigned int i, n = nr_status_frames(gt);
 
     /* Make sure, prior version checks are architectural visible */
     block_speculation();
 
-    for ( i = 0; i < nr_status_frames(gt); i++ )
+    for ( i = 0; i < n; i++ )
     {
         struct page_info *pg = virt_to_page(gt->status[i]);
         gfn_t gfn = gnttab_get_frame_gfn(gt, true, i);
@@ -1833,12 +1849,11 @@ gnttab_unpopulate_status_frames(struct d
         page_set_owner(pg, NULL);
     }
 
-    for ( i = 0; i < nr_status_frames(gt); i++ )
-    {
-        free_xenheap_page(gt->status[i]);
-        gt->status[i] = NULL;
-    }
     gt->nr_status_frames = 0;
+    for ( i = 0; i < n; i++ )
+        free_xenheap_page(gt->status[i]);
+    xfree(gt->status);
+    gt->status = ZERO_BLOCK_PTR;
 
     return 0;
 }
@@ -1969,11 +1984,11 @@ int grant_table_init(struct domain *d, i
     if ( gt->shared_raw == NULL )
         goto out;
 
-    /* Status pages for grant table - for version 2 */
-    gt->status = xzalloc_array(grant_status_t *,
-                               grant_to_status_frames(gt->max_grant_frames));
-    if ( gt->status == NULL )
-        goto out;
+    /*
+     * Status page tracking array for v2 gets allocated on demand. But don't
+     * leave a NULL pointer there.
+     */
+    gt->status = ZERO_BLOCK_PTR;
 
     grant_write_lock(gt);
 
@@ -4047,11 +4062,12 @@ int gnttab_acquire_resource(
         if ( gt->gt_version != 2 )
             break;
 
+        rc = gnttab_get_status_frame_mfn(d, final_frame, &tmp);
+
         /* Check that void ** is a suitable representation for gt->status. */
         BUILD_BUG_ON(!__builtin_types_compatible_p(
                          typeof(gt->status), grant_status_t **));
         vaddrs = (void **)gt->status;
-        rc = gnttab_get_status_frame_mfn(d, final_frame, &tmp);
         break;
     }
 

