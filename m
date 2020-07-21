Return-Path: <SRS0=Ywvf=BA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A22C433E7
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2020 18:42:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9468F20717
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2020 18:42:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9468F20717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxxDu-00024h-PK; Tue, 21 Jul 2020 18:42:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8efX=BA=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jxxDt-0001xV-Mo
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 18:42:41 +0000
X-Inumbo-ID: e7f1f12a-cb81-11ea-85a2-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7f1f12a-cb81-11ea-85a2-bc764e2007e4;
 Tue, 21 Jul 2020 18:42:21 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jxxDY-0001u7-F0; Tue, 21 Jul 2020 19:42:20 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 05/14] sg-report-flight: Use WITH to use best index
 use for $flightsq
Date: Tue, 21 Jul 2020 19:41:56 +0100
Message-Id: <20200721184205.15232-6-ian.jackson@eu.citrix.com>
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

While we're here, convert this EXISTS subquery to a JOIN.

Perf: runtime of my test case now ~200-300s.

Example query before (from the Perl DBI trace):

      SELECT * FROM (
        SELECT DISTINCT flight, blessing
             FROM flights
             JOIN runvars r1 USING (flight)

            WHERE (branch='xen-unstable')
              AND ( (TRUE AND flight <= 151903) AND (blessing='real') )
                  AND EXISTS (SELECT 1
                            FROM jobs
                           WHERE jobs.flight = flights.flight
                             AND jobs.job = ?)

              AND r1.name LIKE 'built_revision_%'
              AND r1.name = ?
              AND r1.val= ?

            ORDER BY flight DESC
            LIMIT 1000
      ) AS sub
      ORDER BY blessing ASC, flight DESC

With bind variables:

     "test-armhf-armhf-libvirt"
     'built_revision_xen'
     '165f3afbfc3db70fcfdccad07085cde0a03c858b'

After:

      WITH sub AS (
        SELECT DISTINCT flight, blessing
             FROM flights
             JOIN runvars r1 USING (flight)

            WHERE (branch='xen-unstable')
              AND ( (TRUE AND flight <= 151903) AND (blessing='real') )
              AND r1.name LIKE 'built_revision_%'
              AND r1.name = ?
              AND r1.val= ?

            ORDER BY flight DESC
            LIMIT 1000
      )
      SELECT *
        FROM sub
        JOIN jobs USING (flight)

       WHERE (1=1)
                  AND jobs.job = ?

      ORDER BY blessing ASC, flight DESC

With bind variables:

    'built_revision_xen'
    '165f3afbfc3db70fcfdccad07085cde0a03c858b'
    "test-armhf-armhf-libvirt"

Diff to the query:

-      SELECT * FROM (
+      WITH sub AS (
         SELECT DISTINCT flight, blessing
              FROM flights
              JOIN runvars r1 USING (flight)

             WHERE (branch='xen-unstable')
               AND ( (TRUE AND flight <= 151903) AND (blessing='real') )
-                  AND EXISTS (SELECT 1
-                            FROM jobs
-                           WHERE jobs.flight = flights.flight
-                             AND jobs.job = ?)
-
               AND r1.name LIKE 'built_revision_%'
               AND r1.name = ?
               AND r1.val= ?

             ORDER BY flight DESC
             LIMIT 1000
-      ) AS sub
+      )
+      SELECT *
+        FROM sub
+        JOIN jobs USING (flight)
+
+       WHERE (1=1)
+                  AND jobs.job = ?
+
       ORDER BY blessing ASC, flight DESC

CC: George Dunlap <George.Dunlap@citrix.com>
Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-flight | 39 ++++++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/sg-report-flight b/sg-report-flight
index 61aec7a8..b5398573 100755
--- a/sg-report-flight
+++ b/sg-report-flight
@@ -180,18 +180,6 @@ END
         return undef;
     }
 
-    my @flightsq_params;
-    my $flightsq_jobcond='(1=1)';
-    if (defined $job) {
-	push @flightsq_params, $job;
-	$flightsq_jobcond = <<END;
-                  AND EXISTS (SELECT 1
-			    FROM jobs
-			   WHERE jobs.flight = flights.flight
-			     AND jobs.job = ?)
-END
-    }
-
     # We build a slightly complicated query to find possibly-relevant
     # flights.  A "possibly-relevant" flight is one which the main
     # flight categorisation algorithm below (the loop over $tflight)
@@ -220,6 +208,7 @@ END
     # still execute the full job-specific recursive examination, for
     # each possibly-relevant flight - that's the $tflight loop body.
 
+    my @flightsq_params;
     my $runvars_joins = '';
     my $runvars_conds = '';
     my $ri=0;
@@ -247,18 +236,38 @@ END
       }
     }
 
+    my $flightsq_jobs_join = '';
+    my $flightsq_jobcond = '';
+    if (defined $job) {
+	push @flightsq_params, $job;
+	$flightsq_jobs_join = <<END;
+        JOIN jobs USING (flight)
+END
+	$flightsq_jobcond = <<END;
+                  AND jobs.job = ?
+END
+    }
+
+    # In psql 9.6 this WITH clause makes postgresql do the flights
+    # query first.  This is good because our built revision index finds
+    # relevant flights very quickly.  Without this, postgresql seems
+    # to like to scan the jobs table.
     my $flightsq= <<END;
-      SELECT * FROM (
+      WITH sub AS (
         SELECT DISTINCT flight, blessing
              FROM flights
 $runvars_joins
             WHERE $branches_cond_q
               AND $blessingscond
-$flightsq_jobcond
 $runvars_conds
             ORDER BY flight DESC
             LIMIT 1000
-      ) AS sub
+      )
+      SELECT *
+        FROM sub
+$flightsq_jobs_join
+       WHERE (1=1)
+$flightsq_jobcond
       ORDER BY blessing ASC, flight DESC
 END
     $flightsq= db_prepare($flightsq);
-- 
2.20.1


