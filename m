Return-Path: <SRS0=Ywvf=BA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6200CC433E1
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2020 19:07:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AD592068F
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2020 19:07:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AD592068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxxbB-0004aY-He; Tue, 21 Jul 2020 19:06:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8efX=BA=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jxxbA-0004aT-LH
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 19:06:44 +0000
X-Inumbo-ID: 50ae2986-cb85-11ea-85a6-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50ae2986-cb85-11ea-85a6-bc764e2007e4;
 Tue, 21 Jul 2020 19:06:43 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jxxDZ-0001u7-UT; Tue, 21 Jul 2020 19:42:22 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 10/14] duration_estimator: Introduce some _qtxt
 variables
Date: Tue, 21 Jul 2020 19:42:01 +0100
Message-Id: <20200721184205.15232-11-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200721184205.15232-1-ian.jackson@eu.citrix.com>
References: <20200721184205.15232-1-ian.jackson@eu.citrix.com>
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

No functional change.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Executive.pm | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Osstest/Executive.pm b/Osstest/Executive.pm
index 3cd37c14..c966a1be 100644
--- a/Osstest/Executive.pm
+++ b/Osstest/Executive.pm
@@ -1146,7 +1146,7 @@ sub duration_estimator ($$;$$) {
     if ($will_uptoincl_testid) {
 	$or_status_truncated = "OR j.status='truncated'!";
     }
-    my $recentflights_q= $dbh_tests->prepare(<<END);
+    my $recentflights_qtxt= <<END;
             SELECT f.flight AS flight,
 		   f.started AS started,
                    j.status AS status
@@ -1167,7 +1167,7 @@ sub duration_estimator ($$;$$) {
                  ORDER BY f.started DESC
 END
 
-    my $duration_anyref_q= $dbh_tests->prepare(<<END);
+    my $duration_anyref_qtxt= <<END;
             SELECT f.flight AS flight,
                    max(s.finished) AS max_finished
 		      FROM steps s JOIN flights f
@@ -1212,6 +1212,8 @@ END_UPTOINCL
                 AS duration
 END_ALWAYS
 	
+    my $recentflights_q= $dbh_tests->prepare($recentflights_qtxt);
+    my $duration_anyref_q= $dbh_tests->prepare($duration_anyref_qtxt);
     my $duration_duration_q = $dbh_tests->prepare($duration_duration_qtxt);
 
     return sub {
-- 
2.20.1


