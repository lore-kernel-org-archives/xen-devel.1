Return-Path: <SRS0=9gwS=BD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF9A9C433E1
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2020 17:22:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E54220674
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2020 17:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E54220674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jz1Ot-0005f8-J1; Fri, 24 Jul 2020 17:22:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ulAu=BD=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jz1Ot-0005eH-0Q
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 17:22:27 +0000
X-Inumbo-ID: 3ae3a489-cdd2-11ea-8862-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3ae3a489-cdd2-11ea-8862-bc764e2007e4;
 Fri, 24 Jul 2020 17:22:21 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jz1Om-00021j-6C; Fri, 24 Jul 2020 18:22:20 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 00/11] Improve performance of sg-report-host-history
Date: Fri, 24 Jul 2020 18:22:05 +0100
Message-Id: <20200724172216.28204-1-ian.jackson@eu.citrix.com>
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is reasonably straightforward.

In my tests it reduces the time for an incremental run, with a hot
cache, from several hundred seconds to a handful of seconds.

This series really wants to go after the flight report improvements,
although the schema updates could be combined.

Ian Jackson (11):
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

 Osstest/Executive.pm          |   2 +-
 schema/runvars-host-index.sql |   8 ++
 sg-report-host-history        | 152 +++++++++++++++++++---------------
 3 files changed, 94 insertions(+), 68 deletions(-)
 create mode 100644 schema/runvars-host-index.sql

-- 
2.20.1


