Return-Path: <SRS0=fnl0=GG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48C80C433E0
	for <xen-devel@archiver.kernel.org>; Sun,  3 Jan 2021 18:47:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E87CC20771
	for <xen-devel@archiver.kernel.org>; Sun,  3 Jan 2021 18:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E87CC20771
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.60974.106964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kw8PO-0004qY-G9; Sun, 03 Jan 2021 18:47:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 60974.106964; Sun, 03 Jan 2021 18:47:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kw8PO-0004qR-Bd; Sun, 03 Jan 2021 18:47:18 +0000
Received: by outflank-mailman (input) for mailman id 60974;
 Sun, 03 Jan 2021 18:47:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SG+r=GG=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1kw8PN-0004qM-M5
 for xen-devel@lists.xenproject.org; Sun, 03 Jan 2021 18:47:17 +0000
Received: from MTA-11-4.privateemail.com (unknown [198.54.127.104])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b370471-66b1-4541-905d-c90c1930abb5;
 Sun, 03 Jan 2021 18:47:16 +0000 (UTC)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
 by mta-11.privateemail.com (Postfix) with ESMTP id 0BE8B80098;
 Sun,  3 Jan 2021 13:47:16 -0500 (EST)
Received: from t9.localdomain (unknown [10.20.151.229])
 by mta-11.privateemail.com (Postfix) with ESMTPA id E1F4B80080;
 Sun,  3 Jan 2021 18:47:14 +0000 (UTC)
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
X-Inumbo-ID: 6b370471-66b1-4541-905d-c90c1930abb5
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/mem_sharing: silence ubsan warning
Date: Sun,  3 Jan 2021 11:47:11 -0700
Message-Id: <7536d7bd92337933e6e23be359ca981deab50016.1609699565.git.tamas@tklengyel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Running Xen compiled with UBSAN produces a warning for mismatched size. It's
benign but this patch silences the warning.

Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
---
 xen/arch/x86/mm/mem_sharing.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index c428fd16ce..6920077dbf 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1638,7 +1638,10 @@ static int fork_hap_allocation(struct domain *cd, struct domain *d)
     rc = hap_set_allocation(cd, mb << (20 - PAGE_SHIFT), &preempted);
     paging_unlock(cd);
 
-    return preempted ? -ERESTART : rc;
+    if ( preempted )
+        rc = -ERESTART;
+
+    return rc;
 }
 
 static void copy_tsc(struct domain *cd, struct domain *d)
-- 
2.25.1


