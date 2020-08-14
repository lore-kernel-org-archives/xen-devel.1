Return-Path: <SRS0=TMXt=BY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CBF8C433E5
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2020 17:26:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D93020708
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2020 17:26:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="SDvWMNtT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D93020708
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dTP-00045E-JN; Fri, 14 Aug 2020 17:26:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dSB-00024Q-Kt
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:25:19 +0000
X-Inumbo-ID: 8932bc25-9404-4cb3-a7c7-6cee3dadcbd5
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8932bc25-9404-4cb3-a7c7-6cee3dadcbd5;
 Fri, 14 Aug 2020 17:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Ph/KZZdUJIILbzz5zhADuCUKbWqNr0e5tyD4DfmxFCg=;
 b=SDvWMNtTApNoWyhZoIe8gOdkpGqUeQ6jGr00R+K9Ys1K2/xb4Tu0GO24
 bJmWe6c2E6tdAF4mSYY11DplgRWpdx616OIcmkKxu+1ZOTSWmVbrcqGAc
 sDz5ygafN+eHGRCSQWguC/zZespGLatY4dXEabElg5mELrOU7QMERaKT0 g=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ug+qUfbi1jD6fWmU3D7GzJNjm2AMiFCe/B6YfTaJvtFfHm82p5CGNHstCHu598gBeKHCCC0ts2
 GA18nUliP1sg2jraTK6VXILohL+lA9d/wE8Vi+/Pa/Am7vv3Gi/OrmxY76ec6Kw2lFFlfnr/PT
 y5WCeHMaflgJeZj3E8f8npofG3IJeTFtfppj6OfkSrzj6CWKnntsQ9rbgRJVUkGZtja3dSKBkC
 hPyCfhIFMORIePBVo7YaKILsiflxt9I2xFuwY7Pvfar/DYES+wiDv8jETTNDDKPnENNnCTIV7s
 Rl0=
X-SBRS: 2.7
X-MesageID: 24576923
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24576923"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 55/60] history reporting: Break out minflight_by_time
Date: Fri, 14 Aug 2020 18:22:00 +0100
Message-ID: <20200814172205.9624-56-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
References: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Move this from sg-report-host-history so we can reuse it.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/HistoryReport.pm | 16 ++++++++++++++++
 sg-report-host-history   | 13 ++-----------
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/Osstest/HistoryReport.pm b/Osstest/HistoryReport.pm
index 3e2ad0d3..b851ae45 100644
--- a/Osstest/HistoryReport.pm
+++ b/Osstest/HistoryReport.pm
@@ -37,6 +37,7 @@ BEGIN {
 			 cache_write_entry
 			 cache_finish
 			 parallel_by_fork
+			 minflight_by_time
 		    );
     %EXPORT_TAGS = ();
 
@@ -282,4 +283,19 @@ sub parallel_by_fork ($$$$) {
     exit $worst;
 }
 
+sub minflight_by_time ($) {
+    my ($timelimit) = @_;
+    my $minflightsq = db_prepare(<<END);
+	    SELECT flight
+              FROM flights
+             WHERE started >= ?
+          ORDER BY flight ASC
+             LIMIT 1
+END
+    my $now = time // die $!;
+    $minflightsq->execute($now - $timelimit);
+    my ($minflight,) = $minflightsq->fetchrow_array();
+    $minflight //= 0;
+}
+
 1;
diff --git a/sg-report-host-history b/sg-report-host-history
index 0a2e9904..efe652bb 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -95,19 +95,10 @@ sub computeflightsrange () {
 END
 	$minflightsq->execute();
 	($minflight,) = $minflightsq->fetchrow_array();
+	$minflight //= 0;
     } else {
-	my $minflightsq = db_prepare(<<END);
-	    SELECT flight
-              FROM flights
-             WHERE started >= ?
-          ORDER BY flight ASC
-             LIMIT 1
-END
-	my $now = time // die $!;
-        $minflightsq->execute($now - $timelimit);
-	($minflight,) = $minflightsq->fetchrow_array();
+	$minflight = minflight_by_time($timelimit);
     }
-    $minflight //= 0;
 
     $flightcond = "(flight > $minflight)";
 
-- 
2.11.0


