Return-Path: <SRS0=Ywvf=BA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B996EC433E4
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2020 18:42:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96B6020717
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2020 18:42:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96B6020717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxxDW-0001yG-Lk; Tue, 21 Jul 2020 18:42:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8efX=BA=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jxxDU-0001xV-SX
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 18:42:16 +0000
X-Inumbo-ID: e58f2176-cb81-11ea-85a2-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e58f2176-cb81-11ea-85a2-bc764e2007e4;
 Tue, 21 Jul 2020 18:42:15 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jxxDS-0001u7-MV; Tue, 21 Jul 2020 19:42:14 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 00/14] Flight report performance improvements
Date: Tue, 21 Jul 2020 19:41:51 +0100
Message-Id: <20200721184205.15232-1-ian.jackson@eu.citrix.com>
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

osstest was taking far too long calculating what test failures were
regressions, and generating the email and web reports.  The slow part
was analysing the test history, mostly because it ended up doing a lot
of dumb scans of large tables.

In this series I fix this problem for sg-report-flight: I add some
indexes, and reorganise some of the queries so that they can make good
use of them.

I suspect there may still be problems with sg-report-host-history and
cs-bisection-step.  I haven't investigated those yet.

George: you volunteered to review my SQL.  I hope the information in
the commit messages is useful for that.  Thanks!

Ian Jackson (14):
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

 Osstest/Executive.pm              |  70 ++++++++++------
 schema/runvars-built-index.sql    |   7 ++
 schema/runvars-revision-index.sql |   7 ++
 schema/steps-job-index.sql        |   7 ++
 sg-report-flight                  | 127 +++++++++++++++++++++++++-----
 5 files changed, 174 insertions(+), 44 deletions(-)
 create mode 100644 schema/runvars-built-index.sql
 create mode 100644 schema/runvars-revision-index.sql
 create mode 100644 schema/steps-job-index.sql

-- 
2.20.1


