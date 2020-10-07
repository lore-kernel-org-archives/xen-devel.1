Return-Path: <SRS0=B7KG=DO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96050C4727F
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 18:28:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E14221707
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 18:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E14221707
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.3725.11170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQEAn-000544-19; Wed, 07 Oct 2020 18:28:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3725.11170; Wed, 07 Oct 2020 18:28:20 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQEAl-00051z-9S; Wed, 07 Oct 2020 18:28:19 +0000
Received: by outflank-mailman (input) for mailman id 3725;
 Wed, 07 Oct 2020 18:28:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE5a-00072Q-Oa
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:22:58 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0cc44eaa-1422-4344-b38e-de78d4195244;
 Wed, 07 Oct 2020 18:21:14 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDkA-0007CF-Jv; Wed, 07 Oct 2020 19:00:50 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE5a-00072Q-Oa
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:22:58 +0000
X-Inumbo-ID: 0cc44eaa-1422-4344-b38e-de78d4195244
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0cc44eaa-1422-4344-b38e-de78d4195244;
	Wed, 07 Oct 2020 18:21:14 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDkA-0007CF-Jv; Wed, 07 Oct 2020 19:00:50 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 70/82] sg-report-flight: Refactor runvar access
Date: Wed,  7 Oct 2020 19:00:12 +0100
Message-Id: <20201007180024.7932-71-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

Collect the runvars query into local perl variables.  This will allow
us to reuse the information without going back to the db.

No functional change.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-flight | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/sg-report-flight b/sg-report-flight
index 07834581..281361c0 100755
--- a/sg-report-flight
+++ b/sg-report-flight
@@ -1142,6 +1142,16 @@ END
     my $ji = $htmlout_jobq->fetchrow_hashref();
     die unless $ji;
 
+    my $varsq= db_prepare(<<END);
+        SELECT name, val, synth FROM runvars
+                WHERE flight=? AND job=?
+             ORDER BY synth, name
+END
+    $varsq->execute($fi->{Flight}, $job);
+    my $runvar_table = $varsq->fetchall_arrayref({});
+    my %runvar_map;
+    $runvar_map{$_->{name}} = $_ foreach @$runvar_table;
+
     print H <<END;
 <html><head><title>$title</title><head>
 <body>
@@ -1244,14 +1254,8 @@ END
 <h2>Test control variables</h2>
 <table rules=all><tr><th>Name</th><th>Value</th><th>Source</th></tr>
 END
-    my $varsq= db_prepare(<<END);
-        SELECT name, val, synth FROM runvars
-                WHERE flight=? AND job=?
-             ORDER BY synth, name
-END
-    $varsq->execute($fi->{Flight}, $job);
-    while (my $varrow= $varsq->fetchrow_arrayref()) {
-        my ($vn,$vv,$synth) = (@$varrow);
+    foreach my $varrow (@$runvar_table) {
+        my ($vn,$vv,$synth) = (@$varrow{qw(name val synth)});
         print H "<tr><th>".encode_entities($vn)."</th>";
         print H "<td>";
         my $url;
-- 
2.20.1


