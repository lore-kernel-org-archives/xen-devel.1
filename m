Return-Path: <SRS0=y719=BK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A51C433E1
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2020 12:02:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B18CB22B40
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2020 12:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B18CB22B40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1Tk0-0002Cz-IP; Fri, 31 Jul 2020 12:02:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nr0X=BK=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1k1Tjz-00026u-58
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:02:23 +0000
X-Inumbo-ID: af900828-d325-11ea-8e2b-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af900828-d325-11ea-8e2b-bc764e2007e4;
 Fri, 31 Jul 2020 12:02:20 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1k1TN6-0001W4-2a; Fri, 31 Jul 2020 12:38:44 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH v2 40/41] cs-bisection-step: Lay out the revision
 tuple graph once
Date: Fri, 31 Jul 2020 12:38:19 +0100
Message-Id: <20200731113820.5765-41-ian.jackson@eu.citrix.com>
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

The graph layout algorithm is not very fast, particularly if the
revision graph is big.  In my test case this saves about 10s.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
v2: New patch.
---
 cs-bisection-step | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/cs-bisection-step b/cs-bisection-step
index 027032a1..8544bac0 100755
--- a/cs-bisection-step
+++ b/cs-bisection-step
@@ -1113,10 +1113,15 @@ END
         or die "$!";
 
     if (eval {
+	print DEBUG "RUNNING dot -Txdot\n";
+	system_checked("dot", "-Txdot", "-o$graphfile.xdot",
+		       "$graphfile.dot");
         foreach my $fmt (qw(ps png svg)) {
-	    print DEBUG "RUNNING dot -T$fmt\n";
-            system_checked("dot", "-T$fmt", "-o$graphfile.$fmt",
-			   "$graphfile.dot");
+	    # neato rather than dot, because neato just uses positions
+	    # etc. in the input whereas dot does (re)calculation work.
+	    print DEBUG "RUNNING neato -n2 -T$fmt\n";
+            system_checked("neato", "-n2", "-T$fmt", "-o$graphfile.$fmt",
+			   "$graphfile.xdot");
         }
 	open SVGI, "$graphfile.svg" or die "$graphfile.svg $!";
 	open SVGO, ">", "$graphfile.svg.new" or die "$graphfile.svg.new $!";
-- 
2.20.1


