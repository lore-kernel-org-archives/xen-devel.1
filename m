Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D29606A333
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 17:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=E7VOwtO6
Received: from list by lists.xenproject.org with outflank-mailman.1494952.1694191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTjM0-0005Gg-Kj; Wed, 18 Nov 2026 17:21:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494952.1694191; Wed, 18 Nov 2026 17:21:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTjM0-0005GY-F1; Wed, 18 Nov 2026 17:21:52 +0000
Received: by outflank-mailman (input) for mailman id 1494952;
 Wed, 18 Nov 2026 17:21:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xTjLy-0005GQ-RD
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 17:21:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xTjLy-00000004uUh-0lfY;
 Wed, 18 Nov 2026 17:21:50 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xTjLx-00000001ZkC-3G6N;
 Wed, 18 Nov 2026 17:21:50 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From;
	bh=ReIEaztj5uI4r5dihuOxuObOLIuNOZx/WQLYKd7Hhs8=; b=E7VOwtO61V+kZ3ZGlMvrhW7uxV
	1nLA+xBPFRUnUjMQW01b4/iWDmJydcajr5FS5WeDPdkVi5kwNN/ATo+SiLkQcZmGGoZIpWkAJD48S
	Z11uYN9aRANikPVTRFjKBECJHIbWl7TWXXi5TqUUxeE6Ze2LKYx2WcGkqc8Ik06gnCXY=;
From: Roger Pau Monne <roger@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/p2m: prevent replacing special p2m entries
Date: Wed, 18 Nov 2026 18:20:32 +0100
Message-ID: <20261118172032.78501-1-roger@xenproject.org>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The current logic in both p2m_add_foreign() and xenmem_add_to_physmap_one()
allows replacing special p2m types, that should otherwise only be
established/cleaned up via special accessors.

When the backing page for a foreign p2m-type mapping only has one reference
left, the put_page() in p2m_entry_modify() will free the page ahead of it
being flushed from the p2m and the IOMMU TLBs.  This can be triggered with
IOREQ servers, and requires a domain that has privileges over another one
(ie: a stubdom).  Such a domain would create an IOREQ server, map it using
XENMEM_acquire_resource (which creates a p2m_map_foreign p2m entry),
destroy the IOREQ server, and afterwards map something over the IOREQ
entries using XENMEM_add_to_physmap{,_batch}.  At this point the removal
from the p2m will trigger an assert in p2m_entry_modify() on debug builds,
or in releases < 4.22 free the page before the TLBs are flushed.

Something similar can also happen with grant mppaings: entries being
replaced using p2m_add_foreign() or xenmem_add_to_physmap_one() will then
fail when attempting to be cleaned up by replace_grant_host_mapping().
However that only affects the domain itself, and is no worse than what a
grant-mapping domain can already do to the grant source.

Note that p2m_add_page() already refuses to replace p2m entries of special
types.

Fixes: b37d30c8fc52 ("Mapping grant references into HVM guests, take 2")
Fixes: 0537d246f8db ("mm: add 'is_special_page' inline function")
Signed-off-by: Roger Pau Monné <roger@xenproject.org>
---
 xen/arch/x86/mm/p2m.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 52cadd9b25c6..7d95faac62c7 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1953,6 +1953,13 @@ static int p2m_add_foreign(struct domain *tdom, unsigned long fgfn,
 
     /* Remove previously mapped page if it is present. */
     prev_mfn = get_gfn(tdom, gpfn, &p2mt_prev);
+    /* Special p2m slots must be cleaned up via special accessors. */
+    if ( p2m_is_special(p2mt_prev) )
+    {
+        rc = -EPERM;
+        goto put_both;
+    }
+
     if ( mfn_valid(prev_mfn) )
     {
         if ( is_special_page(mfn_to_page(prev_mfn)) )
@@ -2074,8 +2081,11 @@ int xenmem_add_to_physmap_one(
         goto put_all;
     }
 
-    /* Remove previously mapped page if it was present. */
-    if ( p2mt == p2m_mmio_direct )
+    /*
+     * Remove previously mapped page if it was present.  Special p2m slots must
+     * be cleaned up via special accessors.
+     */
+    if ( p2m_is_special(p2mt) )
         rc = -EPERM;
     else if ( mfn_valid(prev_mfn) )
     {
-- 
2.55.0


