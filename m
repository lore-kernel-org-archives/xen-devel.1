Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1788E63F3D
	for <xen-devel@archiver.kernel.org>; Mon, 16 Feb 2026 13:44:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1234162.1537494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrytQ-0007yF-GO; Mon, 16 Feb 2026 13:44:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234162.1537494; Mon, 16 Feb 2026 13:44:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrytQ-0007xF-8u; Mon, 16 Feb 2026 13:44:04 +0000
Received: by outflank-mailman (input) for mailman id 1234162;
 Mon, 16 Feb 2026 13:44:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AfU3=AU=bounce.vates.tech=bounce-md_30504962.69931f1f.v1-b9b5c5ead9004716bf05dfc35d46d2e5@srs-se1.protection.inumbo.net>)
 id 1vrytP-0007hl-4B
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 13:44:03 +0000
Received: from mail187-15.suw11.mandrillapp.com
 (mail187-15.suw11.mandrillapp.com [198.2.187.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c74fc17-0b3d-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Feb 2026 14:44:01 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-15.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fF3sC4xYlzPm0PYM
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 13:43:59 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b9b5c5ead9004716bf05dfc35d46d2e5; Mon, 16 Feb 2026 13:43:59 +0000
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
X-Inumbo-ID: 8c74fc17-0b3d-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1771249439; x=1771519439;
	bh=8ylKuGd2BMY1tYigbaDonsjt+0UlJARYpSIysh5XnsQ=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=g3t1tEAUX/Hwr7m69E0W6oiHtXKiEPgfO9J9r4Z5VzSohA553lrdkgklB4mX72s2P
	 3gZtkRT6aOUSXkfDOrcF1sjWow0otGnD9CGDaB4v5hnUvP2ZJ7QsP9JuDglXBE89u8
	 0JqBL3PADqwtBprHaEsbmVZ9k1+F3K1f7ATksZtekspbs2YtqFdGZDRZgizTxDRf3e
	 5ym27DIri9lwjxEOJiThMdrgbW0Jh/3wj/JXhckr++8YGZ0LLIJI+Q9zTjYuZTF8h1
	 C/e6XAeiDSF5I7wQVynccrtvlQ+D90eqaYFS92Em4GUV8PWuN1HBNfPn6nfYIM3JqZ
	 ECH7h836za+xA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1771249439; x=1771509939; i=julian.vetter@vates.tech;
	bh=8ylKuGd2BMY1tYigbaDonsjt+0UlJARYpSIysh5XnsQ=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=zFWanLLTSQ9GDGybif5GeUk2sTb9nGOi87qcVSLNwYp9WwWTRK3X7o5zmh4GM2T5L
	 lu4SgSRayHsFwuXr9hzLwB2fUQBZK1C5Bje/LVEIQYmsUO+W+IzkfhfmCBqaihsv5A
	 aTfiNTUCg2jDXeRAKb2/5P0gG6JdEoZ6wunpR+A7U4wVDVgO5DgFh7aHUY/hoPB4SC
	 CND4AJTSmBivv/hiChQaWKv+O1TfpX+yDDWlh81YnYqZycPGkYlLSz7a4yX8ee9cev
	 Qhouf0t8THvQfQxNpFWWeGF8Oijh3iZ4A5l8lpKN+Gf8diyztHMhO39URbj3A2JSp/
	 3BvIwKAqW46Ng==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v2=202/3]=20x86/ioreq:=20Prepare=20spacing=20for=20upcoming=20patch?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1771249437847
To: xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Julian Vetter" <julian.vetter@vates.tech>
Message-Id: <20260216134334.3510048-3-julian.vetter@vates.tech>
In-Reply-To: <20260216134334.3510048-1-julian.vetter@vates.tech>
References: <20260216134334.3510048-1-julian.vetter@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b9b5c5ead9004716bf05dfc35d46d2e5?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260216:md
Date: Mon, 16 Feb 2026 13:43:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

This patch just changes indentation, to make the next patch easier to
review.

Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
---
Changes in v2
- New patch
---
 xen/arch/x86/hvm/ioreq.c | 86 ++++++++++++++++++++++------------------
 1 file changed, 47 insertions(+), 39 deletions(-)

diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index a5fa97e149..5ebc48dbd4 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -125,14 +125,16 @@ static void hvm_unmap_ioreq_gfn(struct ioreq_server *s, bool buf)
 {
     struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
 
-    if ( gfn_eq(iorp->gfn, INVALID_GFN) )
-        return;
+    {
+        if ( gfn_eq(iorp->gfn, INVALID_GFN) )
+            return;
 
-    destroy_ring_for_helper(&iorp->va, iorp->page);
-    iorp->page = NULL;
+        destroy_ring_for_helper(&iorp->va, iorp->page);
+        iorp->page = NULL;
 
-    hvm_free_ioreq_gfn(s, iorp->gfn);
-    iorp->gfn = INVALID_GFN;
+        hvm_free_ioreq_gfn(s, iorp->gfn);
+        iorp->gfn = INVALID_GFN;
+    }
 }
 
 static int hvm_map_ioreq_gfn(struct ioreq_server *s, bool buf)
@@ -141,34 +143,36 @@ static int hvm_map_ioreq_gfn(struct ioreq_server *s, bool buf)
     struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
     int rc;
 
-    if ( iorp->page )
     {
-        /*
-         * If a page has already been allocated (which will happen on
-         * demand if ioreq_server_get_frame() is called), then
-         * mapping a guest frame is not permitted.
-         */
-        if ( gfn_eq(iorp->gfn, INVALID_GFN) )
-            return -EPERM;
-
-        return 0;
-    }
+        if ( iorp->page )
+        {
+            /*
+             * If a page has already been allocated (which will happen on
+             * demand if ioreq_server_get_frame() is called), then
+             * mapping a guest frame is not permitted.
+             */
+            if ( gfn_eq(iorp->gfn, INVALID_GFN) )
+                return -EPERM;
+
+            return 0;
+        }
 
-    if ( d->is_dying )
-        return -EINVAL;
+        if ( d->is_dying )
+            return -EINVAL;
 
-    iorp->gfn = hvm_alloc_ioreq_gfn(s);
+        iorp->gfn = hvm_alloc_ioreq_gfn(s);
 
-    if ( gfn_eq(iorp->gfn, INVALID_GFN) )
-        return -ENOMEM;
+        if ( gfn_eq(iorp->gfn, INVALID_GFN) )
+            return -ENOMEM;
 
-    rc = prepare_ring_for_helper(d, gfn_x(iorp->gfn), &iorp->page,
-                                 &iorp->va);
+        rc = prepare_ring_for_helper(d, gfn_x(iorp->gfn), &iorp->page,
+                                     &iorp->va);
 
-    if ( rc )
-        hvm_unmap_ioreq_gfn(s, buf);
+        if ( rc )
+            hvm_unmap_ioreq_gfn(s, buf);
 
-    return rc;
+        return rc;
+    }
 }
 
 static void hvm_remove_ioreq_gfn(struct ioreq_server *s, bool buf)
@@ -176,12 +180,14 @@ static void hvm_remove_ioreq_gfn(struct ioreq_server *s, bool buf)
     struct domain *d = s->target;
     struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
 
-    if ( gfn_eq(iorp->gfn, INVALID_GFN) )
-        return;
+    {
+        if ( gfn_eq(iorp->gfn, INVALID_GFN) )
+            return;
 
-    if ( p2m_remove_page(d, iorp->gfn, page_to_mfn(iorp->page), 0) )
-        domain_crash(d);
-    clear_page(iorp->va);
+        if ( p2m_remove_page(d, iorp->gfn, page_to_mfn(iorp->page), 0) )
+            domain_crash(d);
+        clear_page(iorp->va);
+    }
 }
 
 static int hvm_add_ioreq_gfn(struct ioreq_server *s, bool buf)
@@ -190,16 +196,18 @@ static int hvm_add_ioreq_gfn(struct ioreq_server *s, bool buf)
     struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
     int rc;
 
-    if ( gfn_eq(iorp->gfn, INVALID_GFN) )
-        return 0;
+    {
+        if ( gfn_eq(iorp->gfn, INVALID_GFN) )
+            return 0;
 
-    clear_page(iorp->va);
+        clear_page(iorp->va);
 
-    rc = p2m_add_page(d, iorp->gfn, page_to_mfn(iorp->page), 0, p2m_ram_rw);
-    if ( rc == 0 )
-        paging_mark_pfn_dirty(d, _pfn(gfn_x(iorp->gfn)));
+        rc = p2m_add_page(d, iorp->gfn, page_to_mfn(iorp->page), 0, p2m_ram_rw);
+        if ( rc == 0 )
+            paging_mark_pfn_dirty(d, _pfn(gfn_x(iorp->gfn)));
 
-    return rc;
+        return rc;
+    }
 }
 
 int arch_ioreq_server_map_pages(struct ioreq_server *s)
-- 
2.51.0



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


