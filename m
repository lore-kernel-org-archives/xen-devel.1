Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47C5FD8FC0
	for <xen-devel@archiver.kernel.org>; Thu, 26 Feb 2026 14:59:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1242025.1542797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvcq8-0001iJ-Hj; Thu, 26 Feb 2026 14:59:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1242025.1542797; Thu, 26 Feb 2026 14:59:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvcq8-0001iC-EP; Thu, 26 Feb 2026 14:59:44 +0000
Received: by outflank-mailman (input) for mailman id 1242025;
 Thu, 26 Feb 2026 14:59:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wgwr=A6=citrix.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1vvcq7-0001i6-6e
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 14:59:43 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.tibco.com
 [160.101.131.8]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c73c83c2-1323-11f1-b164-2bf370ae4941;
 Thu, 26 Feb 2026 15:59:42 +0100 (CET)
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id E9CDB4290343;
 Thu, 26 Feb 2026 09:59:20 -0500 (EST)
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
X-Inumbo-ID: c73c83c2-1323-11f1-b164-2bf370ae4941
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 07/10] tools/lib/ctrl/xc: Add xc_domain_claim_memory() to libxenctrl
Date: Thu, 26 Feb 2026 14:29:21 +0000
Message-Id: <cff8a067879289c2dac661a513a1b7f4e11caa90.1772098423.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1772098423.git.bernhard.kaindl@citrix.com>
References: <cover.1772098423.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a libxc function for the new XEN_DOMCTL_claim_memory hypercall,
It supports node-specific claims and host-wide claims.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 tools/include/xenctrl.h     |  4 ++++
 tools/libs/ctrl/xc_domain.c | 27 +++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index d5dbf69c8968..a0a9f2143b32 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2659,6 +2659,10 @@ int xc_domain_set_llc_colors(xc_interface *xch, uint32_t domid,
                              const uint32_t *llc_colors,
                              uint32_t num_llc_colors);
 
+int xc_domain_claim_memory(xc_interface *xch, uint32_t domid,
+                           uint32_t nr_claims,
+                           memory_claim_t *claims);
+
 #if defined(__arm__) || defined(__aarch64__)
 int xc_dt_overlay(xc_interface *xch, void *overlay_fdt,
                   uint32_t overlay_fdt_size, uint8_t overlay_op);
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index 01c0669c8863..685efc03d295 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -1070,6 +1070,33 @@ int xc_domain_remove_from_physmap(xc_interface *xch,
     return xc_memory_op(xch, XENMEM_remove_from_physmap, &xrfp, sizeof(xrfp));
 }
 
+/* Claim the guest memory for a domain before starting the domain build */
+int xc_domain_claim_memory(xc_interface *xch,
+                           uint32_t domid,
+                           uint32_t nr_claims,
+                           memory_claim_t *claims)
+{
+    struct xen_domctl domctl = {};
+    DECLARE_HYPERCALL_BOUNCE(claims, sizeof(*claims) * nr_claims,
+                             XC_HYPERCALL_BUFFER_BOUNCE_IN);
+    int ret;
+
+    if ( xc_hypercall_bounce_pre(xch, claims) )
+        return -1;
+
+    domctl.cmd = XEN_DOMCTL_claim_memory;
+    domctl.domain = domid;
+    domctl.u.claim_memory.nr_claims = nr_claims;
+    set_xen_guest_handle(domctl.u.claim_memory.claims, claims);
+
+    ret = do_domctl(xch, &domctl);
+
+    xc_hypercall_bounce_post(xch, claims);
+
+    return ret;
+}
+
+/* Legacy function for claiming pages, replaced by xc_domain_claim_memory() */
 int xc_domain_claim_pages(xc_interface *xch,
                                uint32_t domid,
                                unsigned long nr_pages)
-- 
2.39.5


