Return-Path: <SRS0=syOn=JY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92375C43470
	for <xen-devel@archiver.kernel.org>; Tue, 27 Apr 2021 18:01:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5114761006
	for <xen-devel@archiver.kernel.org>; Tue, 27 Apr 2021 18:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5114761006
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.118793.225087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbS0t-0002DZ-VA; Tue, 27 Apr 2021 18:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118793.225087; Tue, 27 Apr 2021 18:00:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbS0t-0002D2-Hr; Tue, 27 Apr 2021 18:00:47 +0000
Received: by outflank-mailman (input) for mailman id 118793;
 Tue, 27 Apr 2021 18:00:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lbS0r-00029a-Ji
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 18:00:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lbS0r-0004px-Ix
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 18:00:45 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lbS0r-0001n0-IG
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 18:00:45 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1lbS0p-0003ln-Nj; Tue, 27 Apr 2021 19:00:43 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=BOGeV0UJXxuJsKF2TUUsYhyibwoa6RDq0MP2ZccTrRM=; b=yO53tsGjHmBT3w0CEv7d11HdZY
	2eXRLo7szATEdBELG4lSlIrDOa9S0IXHaxqm2vgjtIZI1WWEgrUFoSQTgRBcorL97UQ3MfTngSdQV
	+rVZklXjGO/Kl11AhN8hr5U7AkswqWfDQC8WKPOqF6+QQMDMo0BTzOK5CDSATM8wFlMU=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 5/7] mg-schema-test-database: posgtres compat: Sequences
Date: Tue, 27 Apr 2021 19:00:31 +0100
Message-Id: <20210427180033.9439-6-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210427180033.9439-1-iwj@xenproject.org>
References: <20210427180033.9439-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now (postgresql 11) start_value is in a different table.  We don't
really care about it very much and mostly care about the last value,
so we fix that (and launder the for-db comparison dumps).

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 mg-schema-test-database | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/mg-schema-test-database b/mg-schema-test-database
index 26e35c5b..eab0746e 100755
--- a/mg-schema-test-database
+++ b/mg-schema-test-database
@@ -425,16 +425,16 @@ END
         seq_alters=""
         for seq in $sequences; do
         	orgseqval=$(psql_query <<END
-			SELECT start_value || ' ' || last_value FROM $seq
+			SELECT s.last_value FROM $seq s
 END
                 )
-                read orgstart orglast <<END
+                read orglast <<END
 $orgseqval
 END
 		newlast=$(( 10000 * (2 + $orglast / 10000) ))
                 seq_alters+="
 			ALTER SEQUENCE $seq
-				START WITH $orgstart
+				START WITH $newlast
 				RESTART WITH $newlast;
 "
         done
@@ -447,7 +447,15 @@ END
 
 	# Schema should now be identical to main DB
 	$(withtest get_pgdump_cmd) -s -O -x >$t.schema.created
-	diff -u $t.schema.orig $t.schema.created
+
+	for wh in orig created; do
+		perl -pe '
+			next unless m{^CREATE SEQUENCE }..m{^\)};
+			$_ = "" if m/^\s*START WITH \d+$/;
+		' <$t.schema.$wh >$t.schema.$wh-laund
+	done
+
+	diff -u $t.schema.orig-laund $t.schema.created-laund
 
 	#---------- mark resources that we are going to borrow ----------
 
-- 
2.20.1


