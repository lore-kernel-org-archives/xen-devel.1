Return-Path: <SRS0=y719=BK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E7A8C433DF
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2020 12:01:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D18B22BF3
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2020 12:01:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D18B22BF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1TjB-0001ft-Pk; Fri, 31 Jul 2020 12:01:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nr0X=BK=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1k1TjB-0001R9-3l
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:01:33 +0000
X-Inumbo-ID: 9260ce9a-d325-11ea-8e2b-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9260ce9a-d325-11ea-8e2b-bc764e2007e4;
 Fri, 31 Jul 2020 12:01:31 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1k1TN3-0001W4-Dg; Fri, 31 Jul 2020 12:38:41 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH v2 35/41] cs-bisection-step: Break out qtxt_common_ok
Date: Fri, 31 Jul 2020 12:38:14 +0100
Message-Id: <20200731113820.5765-36-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200731113820.5765-1-ian.jackson@eu.citrix.com>
References: <20200731113820.5765-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Make this bit of query into a subref which takes a $table argument.

No change to the generated query.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
v2: New patch.
---
 cs-bisection-step | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/cs-bisection-step b/cs-bisection-step
index f11726aa..ba0c6424 100755
--- a/cs-bisection-step
+++ b/cs-bisection-step
@@ -190,6 +190,13 @@ sub flight_rmap ($$) {
 END
     };
 
+    my $qtxt_common_tree_ok = sub {
+	my ($table) = @_;
+	[<<END];
+  	      $table.name LIKE E'tree\\_%'
+END
+    };
+
     $dbh_tests->do(<<END, {});
           CREATE TEMP TABLE tmp_build_info (
               use varchar NOT NULL,
@@ -267,7 +274,7 @@ $qtxt_common_tables
 
            WHERE
 @{ $qtxt_common_rev_ok->('rev') } AND
-  	          url.name LIKE E'tree\\_%'
+@{ $qtxt_common_tree_ok->('url') }
 	     AND  url.use = rev.use
 	     AND  url.job = rev.job
 	     AND (rev.name = 'built_revision_' || substr(url.name,6) OR
-- 
2.20.1


