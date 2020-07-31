Return-Path: <SRS0=y719=BK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE53C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2020 11:39:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C28920838
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2020 11:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C28920838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1TNF-0005sq-1o; Fri, 31 Jul 2020 11:38:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nr0X=BK=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1k1TND-0005kZ-0M
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 11:38:51 +0000
X-Inumbo-ID: 59d8fa34-d322-11ea-8e26-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59d8fa34-d322-11ea-8e26-bc764e2007e4;
 Fri, 31 Jul 2020 11:38:29 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1k1TMq-0001W4-Bf; Fri, 31 Jul 2020 12:38:28 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH v2 05/41] sg-report-flight: Add a comment re
 same-flight search narrowing
Date: Fri, 31 Jul 2020 12:37:44 +0100
Message-Id: <20200731113820.5765-6-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200731113820.5765-1-ian.jackson@eu.citrix.com>
References: <20200731113820.5765-1-ian.jackson@eu.citrix.com>
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

In afe851ca1771e5da6395b596afa69e509dbbc278
  sg-report-flight: When justifying, disregard out-of-flight build jobs
we narrowed sg-report-flight's search algorith.

An extensive justification is in the commit message.  I think much of
this information belongs in-tree, so c&p it (with slight edits) here.

No code change.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-flight | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sg-report-flight b/sg-report-flight
index 831917a9..fc439495 100755
--- a/sg-report-flight
+++ b/sg-report-flight
@@ -242,9 +242,27 @@ END
 	# jobs.  We start with all jobs in $tflight, and for each job
 	# we also process any other jobs it refers to in *buildjob runvars.
 	#
+	# The real thing we want to check that the build jobs *in the
+	# same flight as the justifying job* used the right revisions.
+	# Build jobs from other flights were either (i) build jobs for
+	# components not being targed for testing by this branch, but
+	# which were necessary for the justifying job and for which we
+	# decided to reuse another build job (in which case we don't
+	# really care what versions they used, even if underlying it
+	# all there might be a different version of a tree we are
+	# actually interested in (ii) the kind of continuous update
+	# thing seen with freebsdbuildjob.
+	#
+	# (This is rather different to cs-bisection-step, which is
+	# less focused on changes in a particular set of trees.)
+	#
+	# So we limit the scope of our recursive descent into build
+	# jobs, to jobs in the same flight.
+	#
 	# We don't actually use a recursive algorithm because that
 	# would involve recursive use of the same sql query object;
 	# hence the @binfos_todo queue.
+
 	my @binfos_todo;
 	my $binfos_queue = sub {
 	    my ($inflight,$q,$why) = @_;
-- 
2.20.1


