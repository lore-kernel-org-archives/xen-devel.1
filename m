Return-Path: <SRS0=TMXt=BY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB5B4C433E1
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2020 17:23:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74FB620708
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2020 17:23:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="W+uVArh+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74FB620708
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dPm-0002Wo-TW; Fri, 14 Aug 2020 17:22:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dPl-00024Q-Fp
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:22:49 +0000
X-Inumbo-ID: a392a876-06c2-417b-846d-04f0f9c402c4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a392a876-06c2-417b-846d-04f0f9c402c4;
 Fri, 14 Aug 2020 17:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425739;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=7tEJzOFe1rNL6H1YNP7my17N/c5tTg3jF4HNaa1FTqs=;
 b=W+uVArh+J46cKo0AIaLCSPdrcO8P/2lwo2A4hGNxDuktWkAUi44VtjXn
 9Mr74pWQKEqY9zmiPJdVANSeQ006YIWsBNmI+mkc0Ng2W2euhiXTawtuR
 dIC5zipGDr6Gpk/Tba8H08Dba+s4EkmAiBJlv4X8wS5+U8BVmJDY/lJ/R w=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 6ARKZM0gZtes4QSkjJYnK72EiWwb9mWVaqcYBhEIBbYXHm0QFvsTcppTGOls0TmEKKm2deWvsY
 ZgX6WQW0r2Hl77IPdYgblLsKlMfT/vZExgBVdEiEpWme5NskbP2zT0e0at+7y79lLLKavJmuSD
 1D7Qqc7uG2I35bv5r72TKpNDq+7JezrRpeBNylQGm+MYuqGGQZxjW7fES0TYjlVW4ClYglW3AB
 T8abbixo/T81ZtDTd1i5sF13vAUiNwku12qePAXTIiH2L+qiH3twMe9N4WZ9KMHx18TO14stP3
 +ZQ=
X-SBRS: 2.7
X-MesageID: 24879738
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24879738"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 34/60] sg-report-job-history: Use one child per report
Date: Fri, 14 Aug 2020 18:21:39 +0100
Message-ID: <20200814172205.9624-35-ian.jackson@eu.citrix.com>
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

Rather than one child per job, which then did one report per branch.

This will mean we can use the cache machinery, which is rather global
so wouldn't cope well with processing multiple job history reports
within a process.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-job-history | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/sg-report-job-history b/sg-report-job-history
index 384a7670..3307b281 100755
--- a/sg-report-job-history
+++ b/sg-report-job-history
@@ -296,15 +296,16 @@ END
     }
 }
 
-sub processjob ($) {
-    my ($j) = @_;
-    processjobbranch($j,undef);
-    processjobbranch($j,$_) foreach @branches;
+my @tasks;
+foreach my $j (@jobs) {
+    push @tasks, $j;
+    push @tasks, "$j $_" foreach @branches;
 }
 
-parallel_by_fork('sg-report-job-history', $maxjobs, \@jobs, sub {
-    my ($j) = @_;
+parallel_by_fork('sg-report-job-history', $maxjobs, \@tasks, sub {
+    my ($task) = @_;
+    my ($job, $branch) = split / /, $task; # $branch might be undef
     db_retry($dbh_tests, [], sub {
-        processjob($j);
+        processjobbranch($job, $branch);
     });
 });
-- 
2.11.0


