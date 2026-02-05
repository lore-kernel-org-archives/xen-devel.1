Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D825EA794F
	for <xen-devel@archiver.kernel.org>; Thu,  5 Feb 2026 01:36:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1221355.1529654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnoI9-0002g9-Ch; Thu, 05 Feb 2026 01:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221355.1529654; Thu, 05 Feb 2026 01:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnoI9-0002fQ-6G; Thu, 05 Feb 2026 01:36:21 +0000
Received: by outflank-mailman (input) for mailman id 1221355;
 Thu, 05 Feb 2026 01:36:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1vnoI7-0002TG-1r
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 01:36:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vnoI6-003wR7-3B;
 Thu, 05 Feb 2026 01:36:18 +0000
Received: from [140.209.201.102] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vnoI6-00HVXX-1W;
 Thu, 05 Feb 2026 01:36:18 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=BMutOBe+27MwLrOuLnd1uuC/N9cHX1rSjncNYS0rwBk=; b=YfLCsDy85/YQXPUp+nhtR32ejQ
	sNRH1x0KloisX4lyHEJmPs0Te51ZWTdZWTWd4K7GeNECWxBny/uWMP4+bMudNtgCqPSJGJwuZ4ki6
	8YIz55bbVEYQKEssoW8dLT1cAECE4ZzUyYzpn0AGeqgkwgIKtzS8L92YeDloOis1lc0Y=;
From: dmukhin@xen.org
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	dmukhin@ford.com
Subject: [PATCH v5 5/6] xen/console: update conring memory allocation
Date: Wed,  4 Feb 2026 17:36:05 -0800
Message-ID: <20260205013606.3384798-6-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205013606.3384798-1-dmukhin@ford.com>
References: <20260205013606.3384798-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

conring buffer doesn't need to be aligned to it's size; it just needs to be
contiguous. Use xmalloc_bytes() in console_init_preirq() for run-time
conring buffer allocation.

Warn user when the conring size is being changed behind the user's
back during the console initialization.

Also, limit the user-selectable conring buffer size to the maximum of 2GB
and minimum of _CONRING_SIZE.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v4:
- new patch
---
 xen/drivers/char/console.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 3ad86fd436e2..9394ab2a89eb 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -463,20 +463,34 @@ static void cf_check conring_dump_keyhandler(unsigned char key)
 void __init console_init_ring(void)
 {
     char *ring;
-    unsigned int start, size, chunk, order, memflags;
+    unsigned int start, size, chunk;
     unsigned long flags;
 
     if ( !opt_conring_size )
         return;
 
-    order = get_order_from_bytes(max(opt_conring_size, conring_size));
-    memflags = MEMF_bits(crashinfo_maxaddr_bits);
-    while ( (ring = alloc_xenheap_pages(order, memflags)) == NULL )
+    opt_conring_size = max(opt_conring_size, conring_size);
+    size = ROUNDDOWN(opt_conring_size, PAGE_SIZE);
+    if ( size != opt_conring_size )
     {
-        BUG_ON(order == 0);
-        order--;
+        opt_conring_size = size;
+        printk(XENLOG_WARNING "Rounding down console ring size to multiple of %lu KiB.\n",
+               PAGE_SIZE >> 10);
     }
-    opt_conring_size = PAGE_SIZE << order;
+    if ( opt_conring_size >= GB(2) )
+    {
+        opt_conring_size = GB(2);
+        printk(XENLOG_WARNING "Limiting user-configured console ring size.\n");
+    }
+    else if ( opt_conring_size < _CONRING_SIZE )
+    {
+        opt_conring_size = _CONRING_SIZE;
+        printk(XENLOG_WARNING "Using compile-time console ring size.\n");
+    }
+
+    /* Contiguous buffer; does not need to be naturally aligned. */
+    ring = xmalloc_bytes(opt_conring_size);
+    BUG_ON(ring == NULL);
 
     nrspin_lock_irqsave(&console_lock, flags);
 
-- 
2.52.0


