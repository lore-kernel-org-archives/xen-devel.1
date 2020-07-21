Return-Path: <SRS0=Ywvf=BA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A23F9C433E8
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2020 18:43:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D9DF20717
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2020 18:43:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D9DF20717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxxE4-0002AF-H7; Tue, 21 Jul 2020 18:42:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8efX=BA=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jxxE3-0001xV-NL
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 18:42:51 +0000
X-Inumbo-ID: e8d90019-cb81-11ea-85a2-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8d90019-cb81-11ea-85a2-bc764e2007e4;
 Tue, 21 Jul 2020 18:42:21 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jxxDZ-0001u7-0G; Tue, 21 Jul 2020 19:42:21 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 07/14] sg-report-flight: Use the job row from the
 intitial query
Date: Tue, 21 Jul 2020 19:41:58 +0100
Message-Id: <20200721184205.15232-8-ian.jackson@eu.citrix.com>
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

$jcheckq is redundant: we looked this up right at the start.

This is not expected to speed things up very much, but it makes things
somewhat cleaner and clearer.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-flight | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sg-report-flight b/sg-report-flight
index b8d948da..bcb0d427 100755
--- a/sg-report-flight
+++ b/sg-report-flight
@@ -160,10 +160,6 @@ sub findaflight ($$$$$) {
         return undef;
     }
 
-    my $jcheckq= db_prepare(<<END);
-        SELECT status FROM jobs WHERE flight=? AND job=?
-END
-
     my $checkq= db_prepare(<<END);
         SELECT status FROM steps WHERE flight=? AND job=? AND testid=?
                                    AND status!='skip'
@@ -263,7 +259,7 @@ $runvars_conds
             ORDER BY flight DESC
             LIMIT 1000
       )
-      SELECT *
+      SELECT flight, jobs.status
         FROM sub
 $flightsq_jobs_join
        WHERE (1=1)
@@ -304,7 +300,7 @@ END
                 WHERE flight=?
 END
 
-    while (my ($tflight) = $flightsq->fetchrow_array) {
+    while (my ($tflight, $tjstatus) = $flightsq->fetchrow_array) {
 	# Recurse from the starting flight looking for relevant build
 	# jobs.  We start with all jobs in $tflight, and for each job
 	# we also process any other jobs it refers to in *buildjob runvars.
@@ -407,8 +403,7 @@ END
             $checkq->execute($tflight, $job, $testid);
             ($chkst) = $checkq->fetchrow_array();
 	    if (!defined $chkst) {
-		$jcheckq->execute($tflight, $job);
-		my ($jchkst) = $jcheckq->fetchrow_array();
+		my $jchkst = $tflight->{status};
 		$chkst = $jchkst if $jchkst eq 'starved';
 	    }
         }
-- 
2.20.1


