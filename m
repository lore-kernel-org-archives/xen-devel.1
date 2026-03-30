Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8651061B0F
	for <xen-devel@archiver.kernel.org>; Mon, 30 Mar 2026 16:17:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1267862.1557362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7FJF-000273-N6; Mon, 30 Mar 2026 16:17:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267862.1557362; Mon, 30 Mar 2026 16:17:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7FJF-00026r-Hx; Mon, 30 Mar 2026 16:17:49 +0000
Received: by outflank-mailman (input) for mailman id 1267862;
 Mon, 30 Mar 2026 16:17:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <edwin.torok@citrix.com>) id 1w7FJE-000205-4Y
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 16:17:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7FJD-008sKR-Go
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 18:17:47 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <edwin.torok@citrix.com>)
 id 69caa215-bab6-0a2a0a5309dd-0a2a45078ada-30
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 18:17:47 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <edwin.torok@citrix.com>)
 id 69caa22a-fd74-0a2a45070019-a065830897da-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 18:17:47 +0200
Received: from localhost.localdomain (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTPS id 2293D41B6C98;
 Mon, 30 Mar 2026 12:17:11 -0400 (EDT)
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
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 4/5] automation/scripts/build: run unit tests in the CI
Date: Mon, 30 Mar 2026 17:17:27 +0100
Message-ID: <8749dcae7962383993ecb27dacb2f6cfef9fe78e.1774886602.git.edwin.torok@citrix.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774886602.git.edwin.torok@citrix.com>
References: <cover.1774886602.git.edwin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1774887467-552B9303-9C68DE14/0/0
X-purgate-type: clean
X-purgate-size: 694

Signed-off-by: Edwin Török <edwin.torok@citrix.com>
Link: https://lore.kernel.org/xen-devel/aa7V_nOG0ctnjxH3@macbook.local/
---
 automation/scripts/build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/automation/scripts/build b/automation/scripts/build
index 359ee18444..26ffdf3350 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -107,6 +107,8 @@ else
     ./configure "${cfgargs[@]}"
     make -j$(nproc) dist
 
+    make -j$(nproc) check
+
     # Preserve artefacts
     # Note: Some smoke tests depending on finding binaries/xen on a full build
     # even though dist/ contains everything, while some containers don't even
-- 
2.47.3


