Return-Path: <SRS0=y719=BK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B276FC433E0
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2020 11:38:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8905720838
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2020 11:38:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8905720838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1TMp-0005ke-IY; Fri, 31 Jul 2020 11:38:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nr0X=BK=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1k1TMo-0005kZ-2U
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 11:38:26 +0000
X-Inumbo-ID: 57e8ee26-d322-11ea-8e26-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57e8ee26-d322-11ea-8e26-bc764e2007e4;
 Fri, 31 Jul 2020 11:38:25 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1k1TMm-0001W4-3J; Fri, 31 Jul 2020 12:38:24 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH v2 00/41] Performance work
Date: Fri, 31 Jul 2020 12:37:39 +0100
Message-Id: <20200731113820.5765-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
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

This is a combination of two series and some new work:
 * [OSSTEST PATCH 00/14] Flight report performance improvements
 * [OSSTEST PATCH 00/11] Improve performance of sg-report-host-history
 * New work to improve the performance of cs-bisection-step
 * Fixes to usage of SQL LIKE

Thanks to George for reviews of some of the most critical patches to
the regression analyser in sg-report-flight.  Where necessary I have
rebased those reviewed patches over the SQL LIKE fixes, and in those
cases I retained the reviewed-by.  I hope that's OK.

Outstanding in my perf programme is sg-report-job-history.

Ian Jackson (41):
  Add cperl-indent-level to .dir-locals.el
  SQL: Use "LIKE" rather than "like", etc.
  SQL: Fix incorrect LIKE pattern syntax (literals)
  SQL: Fix incorrect LIKE pattern syntax (program variables)
  sg-report-flight: Add a comment re same-flight search narrowing
  sg-report-flight: Sort failures by job name as last resort
  schema: Provide indices for sg-report-flight
  sg-report-flight: Ask the db for flights of interest
  sg-report-flight: Use WITH to use best index use for $flightsq
  sg-report-flight: Use WITH clause to use index for $anypassq
  sg-report-flight: Use the job row from the intitial query
  Executive: Use index for report__find_test
  duration_estimator: Ignore truncated jobs unless we know the step
  duration_estimator: Introduce some _qtxt variables
  duration_estimator: Explicitly provide null in general host q
  duration_estimator: Return job column in first query
  duration_estimator: Move $uptincl_testid to separate @x_params
  duration_estimator: Move duration query loop into database
  Executive: Drop redundant AND clause
  schema: Add index for quick lookup by host
  sg-report-host-history: Find flight limit by flight start date
  sg-report-host-history: Drop per-job debug etc.
  Executive: Export opendb_tests
  sg-report-host-history: Add a debug print after sorting jobs
  sg-report-host-history: Do the main query per host
  sg-report-host-history: Rerganisation: Make mainquery per-host
  sg-report-host-history: Rerganisation: Read old logs later
  sg-report-host-history: Rerganisation: Change loops
  sg-report-host-history: Drop a redundznt AND clause
  sg-report-host-history: Fork
  schema: Add index to help cs-bisection-step
  adhoc-revtuple-generator: Fix an undef warning in a debug print
  cs-bisection-step: Generalise qtxt_common_rev_ok
  cs-bisection-step: Move an AND
  cs-bisection-step: Break out qtxt_common_ok
  cs-bisection-step: Use db_prepare a few times instead of ->do
  cs-bisection-step: temporary table: Insert only rows we care about
  SQL: Change LIKE E'...\\_...' to LIKE '...\_...'
  cs-bisection-step: Add a debug print when we run dot(1)
  cs-bisection-step: Lay out the revision tuple graph once
  duration_estimator: Clarify recentflights query a bit

 .dir-locals.el                    |   3 +-
 Osstest.pm                        |   8 +-
 Osstest/Executive.pm              |  79 +++++++++------
 Osstest/JobDB/Executive.pm        |   2 +-
 adhoc-revtuple-generator          |   2 +-
 cr-ensure-disk-space              |   4 +-
 cs-adjust-flight                  |   2 +-
 cs-bisection-step                 |  51 +++++++---
 mg-force-push                     |   2 +-
 mg-report-host-usage-collect      |  10 +-
 ms-planner                        |   2 +-
 schema/runvars-built-index.sql    |   7 ++
 schema/runvars-host-index.sql     |   8 ++
 schema/runvars-revision-index.sql |   7 ++
 schema/steps-broken-index.sql     |   7 ++
 schema/steps-job-index.sql        |   7 ++
 sg-report-flight                  | 129 ++++++++++++++++++++----
 sg-report-host-history            | 161 +++++++++++++++++-------------
 sg-report-job-history             |   4 +-
 ts-logs-capture                   |   2 +-
 20 files changed, 344 insertions(+), 153 deletions(-)
 create mode 100644 schema/runvars-built-index.sql
 create mode 100644 schema/runvars-host-index.sql
 create mode 100644 schema/runvars-revision-index.sql
 create mode 100644 schema/steps-broken-index.sql
 create mode 100644 schema/steps-job-index.sql

-- 
2.20.1


