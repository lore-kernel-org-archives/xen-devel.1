Return-Path: <SRS0=/2oJ=GW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56FD7C433E6
	for <xen-devel@archiver.kernel.org>; Tue, 19 Jan 2021 13:03:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F25C023133
	for <xen-devel@archiver.kernel.org>; Tue, 19 Jan 2021 13:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F25C023133
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.70356.126240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1qfE-0006ac-N4; Tue, 19 Jan 2021 13:03:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70356.126240; Tue, 19 Jan 2021 13:03:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1qfE-0006aV-K0; Tue, 19 Jan 2021 13:03:16 +0000
Received: by outflank-mailman (input) for mailman id 70356;
 Tue, 19 Jan 2021 13:03:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d268=GW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l1qfD-0006aQ-Ig
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 13:03:15 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e8de0c55-0738-4779-8e4f-c53af50ac1a6;
 Tue, 19 Jan 2021 13:03:12 +0000 (UTC)
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
X-Inumbo-ID: e8de0c55-0738-4779-8e4f-c53af50ac1a6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611061392;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fwdk9r4mlRfWjhsz12GBmRgTh8gZcqlYj+5ivv9hGto=;
  b=DZNvHxlkGz1jzAPY1dwlRc2hCZ+EatIuVaiIgSMiwxO8cweqWBUhIYjd
   s6nko0iDoCBtRwzXFIPXoFdxWCdY1cmLx4gtJikMKq0yF2O86i9u54e7y
   55cHiqLltOXoRx9pZ3S6eYaTi/DC90x6KwcftLcqsQhUOyZAGiXLGVyRB
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: BItoeW3yMRHXpxY1TtYYh9R1jtsVdWrCbjKVeJH/hFyomlWUFqfdBzlZg5W5ZUVkMi2NvUJl+4
 Z4YwffgAIcmsxLhq8Xn4vpK9Ex+A2zap7XXMN0MuBM3e9xftJxgsiqYiSV22sIDbUWYyVdL3Zk
 wGzV2NDfCX2bzqLrULecVXbp8em91faSMHC9refZk0wcK7Fv0B7HFtNdwwMIBFmRX+lmYr0YJN
 UlPd+C0MXskLKOrpDnKp1vnli07DSWZOeaFUQZBghE8VRwmpNis8DHAEu4moe3+trFNMKV551E
 AIo=
X-SBRS: 5.1
X-MesageID: 35416195
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,358,1602561600"; 
   d="scan'208";a="35416195"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH v3] x86/mm: Short circuit damage from "fishy" ref/typecount failure
Date: Tue, 19 Jan 2021 13:02:54 +0000
Message-ID: <20210119130254.27058-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210119094122.23713-1-andrew.cooper3@citrix.com>
References: <20210119094122.23713-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This code has been copied in 3 places, but it is problematic.

All cases will hit a BUG() later in domain teardown, when a the missing
type/count reference is underflowed.

Don't complicated the logic by leaving a totally unqualified domain crash, and
a timebomb which will be triggered by the toolstack at a slightly later, and
seemingly unrelated, point.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Paul Durrant <paul@xen.org>
CC: Tamas K Lengyel <tamas@tklengyel.com>

v3:
 * Actually include the typo corrects to make it compile.
v2:
 * Reword the commit message.
 * Switch BUG() to BUG_ON() to further reduce code volume.
---
 xen/arch/x86/hvm/ioreq.c     | 11 ++---------
 xen/arch/x86/hvm/vmx/vmx.c   | 11 ++---------
 xen/arch/x86/mm/mem_paging.c | 17 ++++-------------
 3 files changed, 8 insertions(+), 31 deletions(-)

diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 1cc27df87f..0c38cfa151 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -366,15 +366,8 @@ static int hvm_alloc_ioreq_mfn(struct hvm_ioreq_server *s, bool buf)
     if ( !page )
         return -ENOMEM;
 
-    if ( !get_page_and_type(page, s->target, PGT_writable_page) )
-    {
-        /*
-         * The domain can't possibly know about this page yet, so failure
-         * here is a clear indication of something fishy going on.
-         */
-        domain_crash(s->emulator);
-        return -ENODATA;
-    }
+    /* Domain can't know about this page yet - something fishy going on. */
+    BUG_ON(!get_page_and_type(page, s->target, PGT_writable_page));
 
     iorp->va = __map_domain_page_global(page);
     if ( !iorp->va )
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 2d4475ee3d..4120234c15 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3042,15 +3042,8 @@ static int vmx_alloc_vlapic_mapping(struct domain *d)
     if ( !pg )
         return -ENOMEM;
 
-    if ( !get_page_and_type(pg, d, PGT_writable_page) )
-    {
-        /*
-         * The domain can't possibly know about this page yet, so failure
-         * here is a clear indication of something fishy going on.
-         */
-        domain_crash(d);
-        return -ENODATA;
-    }
+    /* Domain can't know about this page yet - something fishy going on. */
+    BUG_ON(!get_page_and_type(pg, d, PGT_writable_page));
 
     mfn = page_to_mfn(pg);
     clear_domain_page(mfn);
diff --git a/xen/arch/x86/mm/mem_paging.c b/xen/arch/x86/mm/mem_paging.c
index 01281f786e..60d667ae94 100644
--- a/xen/arch/x86/mm/mem_paging.c
+++ b/xen/arch/x86/mm/mem_paging.c
@@ -379,19 +379,10 @@ static int prepare(struct domain *d, gfn_t gfn,
         page = alloc_domheap_page(d, 0);
         if ( unlikely(page == NULL) )
             goto out;
-        if ( unlikely(!get_page(page, d)) )
-        {
-            /*
-             * The domain can't possibly know about this page yet, so failure
-             * here is a clear indication of something fishy going on.
-             */
-            gprintk(XENLOG_ERR,
-                    "%pd: fresh page for GFN %"PRI_gfn" in unexpected state\n",
-                    d, gfn_x(gfn));
-            domain_crash(d);
-            page = NULL;
-            goto out;
-        }
+
+        /* Domain can't know about this page yet - something fishy going on. */
+        BUG_ON(!get_page(page, d));
+
         mfn = page_to_mfn(page);
         page_extant = 0;
 
-- 
2.11.0


