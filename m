Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B7FC43334
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jun 2022 13:16:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.356608.584908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5obL-0007JY-Ja; Mon, 27 Jun 2022 13:16:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356608.584908; Mon, 27 Jun 2022 13:16:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5obL-0007JK-F4; Mon, 27 Jun 2022 13:16:27 +0000
Received: by outflank-mailman (input) for mailman id 356608;
 Mon, 27 Jun 2022 13:16:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXPS=XC=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1o5obK-0005lc-3c
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 13:16:26 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 58936768-f61b-11ec-bd2d-47488cf2e6aa;
 Mon, 27 Jun 2022 15:16:25 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B0B11758;
 Mon, 27 Jun 2022 06:16:25 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.42.186])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4501F3F5A1;
 Mon, 27 Jun 2022 06:16:22 -0700 (PDT)
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
X-Inumbo-ID: 58936768-f61b-11ec-bd2d-47488cf2e6aa
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 6/7] xsm/flask: Use unsigned int instead of plain unsigned
Date: Mon, 27 Jun 2022 15:15:42 +0200
Message-Id: <20220627131543.410971-7-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627131543.410971-1-michal.orzel@arm.com>
References: <20220627131543.410971-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is just for the style and consistency reasons as the former is
being used more often than the latter.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/xsm/flask/ss/avtab.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/xsm/flask/ss/avtab.c b/xen/xsm/flask/ss/avtab.c
index 017f5183de..9761d028d8 100644
--- a/xen/xsm/flask/ss/avtab.c
+++ b/xen/xsm/flask/ss/avtab.c
@@ -349,7 +349,7 @@ int avtab_read_item(struct avtab *a, void *fp, struct policydb *pol,
     struct avtab_key key;
     struct avtab_datum datum;
     int i, rc;
-    unsigned set;
+    unsigned int set;
 
     memset(&key, 0, sizeof(struct avtab_key));
     memset(&datum, 0, sizeof(struct avtab_datum));
-- 
2.25.1


