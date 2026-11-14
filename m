Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E59606A327
	for <xen-devel@archiver.kernel.org>; Sat, 14 Nov 2026 21:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=KnrLqGAW
Received: from list by lists.xenproject.org with outflank-mailman.1489515.1690974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSLYG-0006al-FN; Sat, 14 Nov 2026 21:44:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1489515.1690974; Sat, 14 Nov 2026 21:44:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSLYG-0006aa-CC; Sat, 14 Nov 2026 21:44:48 +0000
Received: by outflank-mailman (input) for mailman id 1489515;
 Sat, 14 Nov 2026 21:44:47 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1dc04fa9d0006d3f@swg.vates.tech>)
 id 1xSLYE-0006aU-Jm
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 21:44:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSLYC-007Otv-DE
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 22:44:44 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1dc04fa9d0006d3f@swg.vates.tech>)
 id 6af8d5f1-bab6-0a2a0a5309dd-0a2a45079938-24
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 22:44:44 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1dc04fa9d0006d3f@swg.vates.tech>)
 id 6af8d646-b4ea-0a2a45070019-b9ff1c239377-3
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 22:44:38 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1dc04fa9d0006d3f.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 14 Nov 2026 21:44:36 +0000
Received: from leducb.tail4c4a28.ts.net
 (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr [90.112.87.96])
 (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id D9F2681F96;
 Sat, 14 Nov 2026 22:44:34 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=W4R7HyVOUuL/vKZC/L2/PKt+YEhuS++aKp5MIMK2ya4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:feedback-id;
 b=KnrLqGAWAhJEik3AklfK/W77+Vt4vGDrBcd2D+Xc1ixNHNz9RC9bni5To/Q66qap24TvMvBhC
 fAjmODOiYiQGj2LTOrQcv5v1bE0+uV8Nlz+QatXS1+WE8Gl2mwOt1j5QHM9TS2WTtQyhAT1NnI/
 6E8v8sISWzYuXDdu8f/3xC/3mDtANv58bUaUtsaczDabci1TjRSN7AGZe6C82rY6UNyyztrgonL
 HCOiaFr8hNIeGO6BdCyt/Rpj7pYE4g6amxJVBJYT+SBcZhydLfdJ3oaGrt9++EHppE/lWchoQ3G
 ko0EQU1v2Vjdb7aIKOJiyT0CcBgQoBCcaFRHtZImDQNQ==
X-Zone-Loop: 976b161cbbad4c5af438248f3a50c61a21113cfc6a00
x-campaign-type: default
x-transaction-id: 3d04caa3-557f-4517-bcb8-0d51455a1dd1
x-swg-uid: 01-13ba1d1a-e542-4aa2-9dab-f1c1584cf0e6
X-Mailer: Sweego
Message-ID:
 <1794692676.8631fc262581453bbf619ec5b2062170.1a1dc04fa9d0006d3f@vates.tech>
x-swg-bid: 1794692676.8631fc262581453bbf619ec5b2062170.1a1dc04fa9d0006d3f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [PATCH] Drop the CREDITS file
Date: Sat, 14 Nov 2026 22:44:23 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1794692675061
X-purgate-ID: tlsNG-ef75cf/1794692684-34AC8AE4-F5B48F29/0/0
X-purgate-type: clean
X-purgate-size: 1406
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CREDITS was introduced in 2013 to record Jeremy Fitzhardinge's pvops
work when he was dropped from MAINTAINERS. No other entry has been added
since, although many maintainers have stepped down, and nothing in the
tree refers to it.

A credits file holding a single 13 year old entry gives a misleading
picture of who contributed to Xen. The git history, which keeps earlier
MAINTAINERS entries, is the actual record, so retire the file rather
than leave it unmaintained. Therefore, Jeremy's credit is not lost
because his work remains recorded in the git history.

Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
 CREDITS | 16 ----------------
 1 file changed, 16 deletions(-)
 delete mode 100644 CREDITS

diff --git a/CREDITS b/CREDITS
deleted file mode 100644
index 3ddcdbaac6..0000000000
--- a/CREDITS
+++ /dev/null
@@ -1,16 +0,0 @@
-    This is at least a partial credits-file of people that have
-    contributed to the Xen project.  It is sorted by name and
-    formatted to allow easy grepping and beautification by
-    scripts.  The fields are: name (N), email (E), web-address
-    (W), PGP key ID and fingerprint (P), description (D), and
-    snail-mail address (S).
-    Thanks,
-
-            Xen team
-----------
-
-N: Jeremy Fitzhardinge
-E: jeremy@goop.org
-W: http://www.goop.org/~jeremy
-P: 1B40B6D0
-D: Linux pvops
-- 
2.56.0


