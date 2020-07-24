Return-Path: <SRS0=9gwS=BD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C92C433F1
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2020 17:22:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F4E120674
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2020 17:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F4E120674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jz1Oy-0005gU-ST; Fri, 24 Jul 2020 17:22:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ulAu=BD=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jz1Oy-0005eH-0Z
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 17:22:32 +0000
X-Inumbo-ID: 3b648008-cdd2-11ea-8862-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b648008-cdd2-11ea-8862-bc764e2007e4;
 Fri, 24 Jul 2020 17:22:21 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jz1Om-00021j-Ob; Fri, 24 Jul 2020 18:22:20 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 02/11] sg-report-host-history: Find flight limit by
 flight start date
Date: Fri, 24 Jul 2020 18:22:07 +0100
Message-Id: <20200724172216.28204-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200724172216.28204-1-ian.jackson@eu.citrix.com>
References: <20200724172216.28204-1-ian.jackson@eu.citrix.com>
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

By default we look for anything in (roughly) the last year.

This query is in fact quite fast because the flights table is small.

There is still the per-host limit of $limit (2000) recent runs.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-host-history | 56 ++++++++++++++++++++----------------------
 1 file changed, 27 insertions(+), 29 deletions(-)

diff --git a/sg-report-host-history b/sg-report-host-history
index 54738e68..5dd875c1 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -29,6 +29,7 @@ use POSIX;
 use Osstest::Executive qw(:DEFAULT :colours);
 
 our $limit= 2000;
+our $timelimit= 86400 * (366 + 14);
 our $flightlimit;
 our $htmlout = ".";
 our $read_existing=1;
@@ -45,6 +46,8 @@ while (@ARGV && $ARGV[0] =~ m/^-/) {
     last if m/^--?$/;
     if (m/^--(limit)\=([1-9]\d*)$/) {
         $$1= $2;
+    } elsif (m/^--time-limit\=([1-9]\d*)$/) {
+        $timelimit= $1;
     } elsif (m/^--flight-limit\=([1-9]\d*)$/) {
 	$flightlimit= $1;
     } elsif (restrictflight_arg($_)) {
@@ -108,38 +111,33 @@ sub read_existing_logs ($) {
 }
 
 sub computeflightsrange () {
-    if (!$flightlimit) {
-	my $flagscond =
-	    '('.join(' OR ', map { "f.hostflag = 'blessed-$_'" } @blessings).')';
-	my $nhostsq = db_prepare(<<END);
-	    SELECT count(*)
-	      FROM resources r
-	     WHERE restype='host'
-	       AND EXISTS (SELECT 1
-			     FROM hostflags f
-			    WHERE f.hostname=r.resname
-			      AND $flagscond)
+    if ($flightlimit) {
+	my $minflightsq = db_prepare(<<END);
+	    SELECT flight
+	      FROM (
+		SELECT flight
+		  FROM flights
+		 WHERE $restrictflight_cond
+		 ORDER BY flight DESC
+		 LIMIT $flightlimit
+	      ) f
+	      ORDER BY flight ASC
+	      LIMIT 1
 END
-        $nhostsq->execute();
-	my ($nhosts) = $nhostsq->fetchrow_array();
-	print DEBUG "COUNTED $nhosts hosts\n";
-	$flightlimit = $nhosts * $limit * 2;
-    }
-
-    my $minflightsq = db_prepare(<<END);
-	SELECT flight
-	  FROM (
+	$minflightsq->execute();
+	($minflight,) = $minflightsq->fetchrow_array();
+    } else {
+	my $minflightsq = db_prepare(<<END);
 	    SELECT flight
-	      FROM flights
-             WHERE $restrictflight_cond
-	     ORDER BY flight DESC
-	     LIMIT $flightlimit
-	  ) f
-	  ORDER BY flight ASC
-	  LIMIT 1
+              FROM flights
+             WHERE started >= ?
+          ORDER BY flight ASC
+             LIMIT 1
 END
-    $minflightsq->execute();
-    ($minflight,) = $minflightsq->fetchrow_array();
+	my $now = time // die $!;
+        $minflightsq->execute($now - $timelimit);
+	($minflight,) = $minflightsq->fetchrow_array();
+    }
     $minflight //= 0;
 
     $flightcond = "(flight > $minflight)";
-- 
2.20.1


