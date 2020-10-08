Return-Path: <SRS0=UaJJ=DP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3946BC04EBE
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2020 19:15:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B31F3221FE
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2020 19:15:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="6n4qxVAd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B31F3221FE
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.4594.12134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQbNP-0000PP-To; Thu, 08 Oct 2020 19:14:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4594.12134; Thu, 08 Oct 2020 19:14:55 +0000
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
	id 1kQbNP-0000P9-OX; Thu, 08 Oct 2020 19:14:55 +0000
Received: by outflank-mailman (input) for mailman id 4594;
 Thu, 08 Oct 2020 19:14:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ViHE=DP=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQbNO-0008Lk-D8
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:54 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c9424736-6a7b-4165-8c3b-5a33faec68f6;
 Thu, 08 Oct 2020 19:14:37 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kQbN7-0004Ru-OC
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:37 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kQbN7-0003tb-NR
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:37 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kQbN5-0006So-RA; Thu, 08 Oct 2020 20:14:35 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ViHE=DP=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQbNO-0008Lk-D8
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:54 +0000
X-Inumbo-ID: c9424736-6a7b-4165-8c3b-5a33faec68f6
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c9424736-6a7b-4165-8c3b-5a33faec68f6;
	Thu, 08 Oct 2020 19:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=MCsVUQFJziPwMSkLU0mG88UTd+s0NbUrjbUZhZJ3BRQ=; b=6n4qxVAdBKMOrxnSZfauFCKsJ6
	PZXKvMwIXWDbnsGnATWDeQd8AArWNyhQEPRI19Ga4gm6dJmdrFJVi6FMTv+jvo4KS6g3phM8pHw7m
	0h/RRfiIu2LL3UaOfku7o+A3RhiEwECNuqiuzTvSxFSAo/hoDvxu/HkKhpz7xwXkQ/hQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbN7-0004Ru-OC
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:37 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbN7-0003tb-NR
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:37 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbN5-0006So-RA; Thu, 08 Oct 2020 20:14:35 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 09/13] Introduce real-retry blessing
Date: Thu,  8 Oct 2020 20:14:18 +0100
Message-Id: <20201008191422.5683-10-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201008191422.5683-1-iwj@xenproject.org>
References: <20201008191422.5683-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

Nothing produces this yet.  (There's play-retry as well of course but
we don't need to document that really.)

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 README.dev          | 9 +++++----
 cr-daily-branch     | 3 ++-
 cr-disk-report      | 2 +-
 cr-try-bisect-adhoc | 2 +-
 cs-bisection-step   | 4 ++--
 sg-report-flight    | 2 +-
 6 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/README.dev b/README.dev
index 2cbca109..3d09b3c6 100644
--- a/README.dev
+++ b/README.dev
@@ -381,10 +381,11 @@ These are the principal (intended) blessings:
    commissioning, and that blessing removed and replaced with `real'
    when the hosts are ready.
 
- * `real-bisect' and `adhoc-bisect': These are found only as the
-   blessing of finished flights.  (This is achieved by passing
-   *-bisect to sg-execute-flight.)  This allows the archaeologist
-   tools to distinguish full flights from bisection steps.
+ * `real-bisect', `real-retry', `adhoc-bisect': These are found only
+   as the blessing of finished flights.  (This is achieved by passing
+   *-bisect or *-retry to sg-execute-flight.)  This allows the
+   archaeologist tools to distinguish full flights from bisection
+   steps and retries.
 
    The corresponding intended blessing (as found in the `intended'
    column of the flights table) is `real'.  So the hosts used by the
diff --git a/cr-daily-branch b/cr-daily-branch
index 23060588..285ea361 100755
--- a/cr-daily-branch
+++ b/cr-daily-branch
@@ -76,7 +76,8 @@ case $branch in
 	treeurl=`./ap-print-url $branch`;;
 esac
 
-blessings_arg=--blessings=${DAILY_BRANCH_TESTED_BLESSING:-real}
+blessings_arg=${DAILY_BRANCH_TESTED_BLESSING:-real}
+blessings_arg=--blessings=${blessings_arg},${blessings_arg}-retest
 sgr_args+=" $blessings_arg"
 
 force_baseline='' # Non-empty = indication why we are forcing baseline.
diff --git a/cr-disk-report b/cr-disk-report
index 543d35bf..d76fd72f 100755
--- a/cr-disk-report
+++ b/cr-disk-report
@@ -38,7 +38,7 @@ our $graphs_px=0;
 our $graphs_py=0;
 open DEBUG, ">/dev/null" or die $!;
 
-our @blessings = qw(real real-bisect);
+our @blessings = qw(real real-retry real-bisect);
 # for these blessings column is       "<blessing> <branch>"
 # for other blessings column is       "<intended> [<blessing>]"
 
diff --git a/cr-try-bisect-adhoc b/cr-try-bisect-adhoc
index caadfd80..c2cfa475 100755
--- a/cr-try-bisect-adhoc
+++ b/cr-try-bisect-adhoc
@@ -49,7 +49,7 @@ export OSSTEST_BLESSING=adhoc
 
 compute_state_callback () {
 	compute_state_core \
-        	--blessings=real,real-bisect,adhoc-bisect \
+        	--blessings=real,real-retry,real-bisect,adhoc-bisect \
                 $bisect "$@" $branch $job $testid
 }
 
diff --git a/cs-bisection-step b/cs-bisection-step
index 762966da..8b391448 100755
--- a/cs-bisection-step
+++ b/cs-bisection-step
@@ -7,7 +7,7 @@
 # usage:
 #   ./cs-bisection-setup [<options>] <branch> <job> <testid>
 # options, usually:
-#      --blessings=real,real-bisect
+#      --blessings=real,real-retry,real-bisect
 #
 # First entry in --blessings list is the blessing of the basis
 # (non-bisection) flights.  This should not be the same as the
@@ -45,7 +45,7 @@ use HTML::Entities;
 use Osstest::Executive;
 use URI::Escape;
 
-our @blessings= qw(real real-bisect);
+our @blessings= qw(real real-retry real-bisect);
 our @revtuplegenargs= ();
 our $broken;
 
diff --git a/sg-report-flight b/sg-report-flight
index f6ace190..18643df6 100755
--- a/sg-report-flight
+++ b/sg-report-flight
@@ -120,7 +120,7 @@ die if defined $specver{this}{flight};
 die if defined $specver{that}{flight} &&
     grep { $_ ne 'flight' } keys %{ $specver{that} };
 
-push @blessings, 'real', 'real-bisect' unless @blessings;
+push @blessings, 'real', 'real-retry', 'real-bisect' unless @blessings;
 
 csreadconfig();
 
-- 
2.20.1


