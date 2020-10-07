Return-Path: <SRS0=B7KG=DO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA65C41604
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 18:28:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFC322168B
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 18:28:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFC322168B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.3714.11123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQEAa-0004VD-1i; Wed, 07 Oct 2020 18:28:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3714.11123; Wed, 07 Oct 2020 18:28:07 +0000
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
	id 1kQEAY-0004TL-Cq; Wed, 07 Oct 2020 18:28:06 +0000
Received: by outflank-mailman (input) for mailman id 3714;
 Wed, 07 Oct 2020 18:28:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE3K-00072Q-JE
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:20:38 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 445c0d87-e272-473b-9656-7b1803bf3f30;
 Wed, 07 Oct 2020 18:19:45 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDkD-0007CF-76; Wed, 07 Oct 2020 19:00:53 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE3K-00072Q-JE
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:20:38 +0000
X-Inumbo-ID: 445c0d87-e272-473b-9656-7b1803bf3f30
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 445c0d87-e272-473b-9656-7b1803bf3f30;
	Wed, 07 Oct 2020 18:19:45 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDkD-0007CF-76; Wed, 07 Oct 2020 19:00:53 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 81/82] sg-report-flight: Sharing reports: more task finished info
Date: Wed,  7 Oct 2020 19:00:23 +0100
Message-Id: <20201007180024.7932-82-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Other steps from jobs affecting this host either started after we are
running, and therefore didn't affect the stuff we're reporting, or
already in the db.  Furthermore, any such effects for steps which have
finished must have completed by the max finished time  But if there
are unfinished steps, we don't know the finish time.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 sg-report-flight | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/sg-report-flight b/sg-report-flight
index 8f99bb69..33f953ca 100755
--- a/sg-report-flight
+++ b/sg-report-flight
@@ -1355,7 +1355,8 @@ END
     # table rows to the overall union (sum type) rows.
     my $nullcols_main = nullcols(qw(
         flight::integer job status oidents
-        started::integer rest_started::integer finished::integer
+        started::integer rest_started::integer
+        finished::integer all_finished::boolean
     ));
     my $nullcols_tasks = nullcols(qw(
         taskid::integer type refkey username comment
@@ -1382,7 +1383,11 @@ END
 	      (SELECT max(finished)
 		 FROM steps s
 		WHERE s.flight = q.flight
-		  AND s.job    = q.job)          AS finished
+		  AND s.job    = q.job)          AS finished,
+	      (SELECT every(finished IS NOT NULL)
+		 FROM steps s
+		WHERE s.flight = q.flight
+		  AND s.job    = q.job)          AS all_finished
 	FROM Q
         ORDER BY q.tident),
 
@@ -1401,6 +1406,7 @@ END
 	      min(prep_started)                  AS prep_started,
 	      min(rest_started)                  AS rest_started,
 	      max(finished)                      AS finished,
+	      every(all_finished)                AS all_finished,
 	      $nullcols_tasks,
 	      $nullcols_elided,
               NULL::integer                      AS sort_index
@@ -1466,7 +1472,7 @@ END
 <th>role(s)<br>(there)</td>
 <th>install / prep.<br>started</td>
 <th>use</br>started</td>
-<th>last step<br>ended</td>
+<th>last relevant step<br>ended</td>
 <th>job<br>status</td>
 </tr>
 END
@@ -1522,7 +1528,7 @@ END
 	      map { $_ ? show_abs_time($_) : '' }
 	      $srow->{prep_started},
 	      $srow->{rest_started},
-	      !$srow->{olive} && $srow->{finished};
+	      (!$srow->{olive} || $srow->{all_finished}) && $srow->{finished};
 	    my $info = report_run_getinfo($srow);
 	    print H <<END, 
 <td $info->{ColourAttr}>$info->{Content}</td>
-- 
2.20.1


