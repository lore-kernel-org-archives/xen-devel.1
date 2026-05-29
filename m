Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F5DDCD4F54
	for <xen-devel@archiver.kernel.org>; Fri, 29 May 2026 12:48:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1322061.1588410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSwdR-0002nk-0t; Fri, 29 May 2026 12:48:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322061.1588410; Fri, 29 May 2026 12:48:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSwdQ-0002nd-UG; Fri, 29 May 2026 12:48:20 +0000
Received: by outflank-mailman (input) for mailman id 1322061;
 Fri, 29 May 2026 12:48:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wSwdP-0002nE-VB
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 12:48:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSwdP-002Vm0-Bn
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 14:48:19 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a198b0f-bab6-0a2a0a5309dd-0a2a4509d2b4-8
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 14:48:19 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a198b12-2497-0a2a45090019-a06583099392-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 14:48:19 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 4EC4082767EE;
 Fri, 29 May 2026 08:47:03 -0400 (EDT)
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
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 6/7] xen/arch/x86/dom0_build.c: Extend the upper limit for Dom0's max_pages
Date: Fri, 29 May 2026 13:44:00 +0100
Message-Id: <ca5e61de283a1dee1b679c5aa27b3c6432b0ffce.1780058608.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1780058608.git.bernhard.kaindl@citrix.com>
References: <cover.1780058608.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1780058899-42573A53-14A57183/0/0
X-purgate-type: clean
X-purgate-size: 806

dom0_compute_nr_pages(): Update the upper limit for Dom0's max_pages
in dom0_compute_nr_pages() to limit from UINT_MAX to ULONG_MAX.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
----
Creating a Dom0 of > 16TB isn't a useful thing, but could be for testing.
---
 xen/arch/x86/dom0_build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 80308ca9af46..2ebb8308fbaf 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -440,7 +440,7 @@ unsigned long __init dom0_compute_nr_pages(
         }
     }
 
-    d->max_pages = min_t(unsigned long, max_pages, UINT_MAX);
+    d->max_pages = min_t(unsigned long, max_pages, ULONG_MAX);
 
     return nr_pages;
 }
-- 
2.39.5


