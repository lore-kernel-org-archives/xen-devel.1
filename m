Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA240CD6E4A
	for <xen-devel@archiver.kernel.org>; Fri, 29 May 2026 12:48:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1322074.1588419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSwdh-0003BL-7a; Fri, 29 May 2026 12:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322074.1588419; Fri, 29 May 2026 12:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSwdh-0003BE-4W; Fri, 29 May 2026 12:48:37 +0000
Received: by outflank-mailman (input) for mailman id 1322074;
 Fri, 29 May 2026 12:48:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wSwdg-0003AO-0b
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 12:48:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSwdf-002VpK-De
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 14:48:35 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a198b0f-bab6-0a2a0a5309dd-0a2a4509d2b4-40
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 14:48:35 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a198b22-2497-0a2a45090019-a0658309bde0-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 14:48:35 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 873A082767E7;
 Fri, 29 May 2026 08:47:19 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 7/7] tools/libs/stat/xenstat.c: Extend the "no maximum" sentinel for max_pages
Date: Fri, 29 May 2026 13:44:01 +0100
Message-Id: <3b0adba2cbdb73e16a1c29e081dda9167547ce57.1780058608.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1780058608.git.bernhard.kaindl@citrix.com>
References: <cover.1780058608.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1780058915-4156BA53-B990E7C5/0/0
X-purgate-type: clean
X-purgate-size: 908

In xenstat_get_node(), update the "no maximum" sentinel for max_pages
from UINT_MAX to ULONG_MAX, which is converted to (unsigned long long)-1.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 tools/libs/stat/xenstat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/stat/xenstat.c b/tools/libs/stat/xenstat.c
index 8bab2e66a7fe..376136871487 100644
--- a/tools/libs/stat/xenstat.c
+++ b/tools/libs/stat/xenstat.c
@@ -221,7 +221,7 @@ xenstat_node *xenstat_get_node(xenstat_handle * handle, unsigned int flags)
 			    ((unsigned long long)domaininfo[i].tot_pages)
 			    * handle->page_size;
 			domain->max_mem =
-			    domaininfo[i].max_pages == UINT_MAX
+			    domaininfo[i].max_pages == ULONG_MAX
 			    ? (unsigned long long)-1
 			    : (unsigned long long)(domaininfo[i].max_pages
 						   * handle->page_size);
-- 
2.39.5


