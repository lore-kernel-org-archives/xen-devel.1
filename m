Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9F8606A31E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 11:42:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1500813.1696886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVouJ-0007LH-6f; Tue, 24 Nov 2026 11:41:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500813.1696886; Tue, 24 Nov 2026 11:41:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVouJ-0007LA-3X; Tue, 24 Nov 2026 11:41:55 +0000
Received: by outflank-mailman (input) for mailman id 1500813;
 Tue, 24 Nov 2026 11:41:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex.brett@citrix.com>) id 1xVouH-0007L4-RB
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 11:41:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVouH-001X0s-0Q
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 12:41:53 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex.brett@citrix.com>)
 id 6b0577ce-e002-0a2a0a5209dd-0a2a4503bffa-38
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 12:41:52 +0100
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex.brett@citrix.com>)
 id 6b0577ff-fae8-0a2a45030019-a0658309b850-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 12:41:52 +0100
Received: from mewpvdipd1100.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 86D8B84E0BB6;
 Tue, 24 Nov 2026 06:40:13 -0500 (EST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Alex Brett <alex.brett@citrix.com>
To: qemu-devel@nongnu.org
Cc: Alex Brett <alex.brett@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH] xen-mapcache: Fix a build error with -fexceptions
Date: Tue, 24 Nov 2026 11:41:26 +0000
Message-ID: <20261124114127.790173-1-alex.brett@citrix.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1795520512-6C8DD4E9-A1C54E6D/0/0
X-purgate-type: clean
X-purgate-size: 1087
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When building with -Werror=maybe-uninitialized and -fexceptions, gcc can
report:
error: 'err' may be used uninitialized [-Werror=maybe-uninitialized]

err gets assigned to g_new0() unconditionally, but under -fexceptions
the calls to trace_xen_remap_bucket() or g_new0() might unwind, leading
the g_autofree cleanup to run g_free() on an uninitialised err. Avoid
the warning and any future issues by initialising it to NULL in the same
pattern as other definitions.

Signed-off-by: Alex Brett <alex.brett@citrix.com>
---
 hw/xen/xen-mapcache.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index e30c07c2ee..0a19cfdc1b 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -199,7 +199,7 @@ static void xen_remap_bucket(MapCache *mc,
     uint8_t *vaddr_base;
     g_autofree uint32_t *refs = NULL;
     g_autofree xen_pfn_t *pfns = NULL;
-    g_autofree int *err;
+    g_autofree int *err = NULL;
     unsigned int i;
     hwaddr nb_pfn = size >> XC_PAGE_SHIFT;
 
-- 
2.53.0


