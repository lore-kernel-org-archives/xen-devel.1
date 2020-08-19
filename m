Return-Path: <SRS0=ZsuC=B5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D685C433E1
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2020 16:02:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48E952078D
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2020 16:02:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="aVD91ZYk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48E952078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8QXK-000704-PQ; Wed, 19 Aug 2020 16:02:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N7ZT=B5=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k8QXJ-0006xV-5Y
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2020 16:02:01 +0000
X-Inumbo-ID: 2720d963-099c-4660-9606-f6fff63917c7
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2720d963-099c-4660-9606-f6fff63917c7;
 Wed, 19 Aug 2020 16:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597852920;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=X+7wgvczDPTfTwDjWG9+pu1n4jK7Ii4wbwsbXI7r9vQ=;
 b=aVD91ZYkFjxWLb5F9KCEoJPgjYo0V+ZYXdeDhtfwQTQhwFp82u2rDHXN
 RSKtnSKu+q0GhDI3wYgStz49QscFL66jfpajk4TTBRVV/BxaVJGXdPCxl
 sSNf6x2QsbD0uT19A6cEc+5Q3u/BSreaeOyQDCNluJm/ZrpaoibIC3JJn 8=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: v0FaXVvy1mbxHR0Z3z5WtampetuyWG/fWbcM3eay2agJQaRO2FP3PfNO3JFwJMPBWZ9gEL+fUy
 JdU8tWD9xrryVTMIc88jGAFy+2zLj9f5mSD6m5DYo/z8p9CjWxFKZQcRgnv60dwIW7S2qojkc9
 Ln+tFDIZUCXr29yo410Mt67Ktk9XrFPAa/U4Nzhzr2ZHtAy5qk+PN+jRuAJ5HkZ3dNNZJ82b5T
 pMDmD2I0ihoLc22SLFF9gY53vMF4+YfxztnrOgGc2mh2eBdXuYf4ogg+7IesMqDc5fA7Lu/0oV
 1LE=
X-SBRS: 2.7
X-MesageID: 24885405
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,331,1592884800"; d="scan'208";a="24885405"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 2/7] resource allocation: Provide
 OSSTEST_ALLOC_FAKE_PLAN test facility
Date: Wed, 19 Aug 2020 17:01:38 +0100
Message-ID: <20200819160143.11178-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200819160143.11178-1-ian.jackson@eu.citrix.com>
References: <20200819160143.11178-1-ian.jackson@eu.citrix.com>
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

Set this variable (to a data-plan.final.pl, say) and it becomes
possible to test host allocation programs without actually allocating
anything and without engaging with the queue system.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Executive.pm | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Osstest/Executive.pm b/Osstest/Executive.pm
index 0808202b..d6b2736b 100644
--- a/Osstest/Executive.pm
+++ b/Osstest/Executive.pm
@@ -767,6 +767,32 @@ sub alloc_resources {
 	? sub { print $debugfh @_, "\n" or die $!; }
         : sub { };
 
+    my $fake_plan = $ENV{OSSTEST_ALLOC_FAKE_PLAN};
+    if (defined $fake_plan) {
+	my $fake_data = do {
+	    local $/ = undef;
+	    open FAKEPLAN, "<", $ENV{OSSTEST_ALLOC_FAKE_PLAN} or die $!;
+	    my $r = <FAKEPLAN> // die $!;
+	    close FAKEPLAN;
+	    $r;
+	};
+	if ($fake_plan =~ m{\.pl$}) {
+	    $fake_data = eval $fake_data;
+	} elsif ($fake_plan =~ m{\.json$}) {
+	    $fake_data = from_json($fake_data);
+	} else {
+	    die;
+	}
+	db_retry($flight,'running', $dbh_tests, [], sub {
+            logm("fake resourcecall..");
+	    my ($ok, $bookinglist) = $resourcecall->($fake_data, 1);
+            logm("fake resourcecall ok=$ok");
+	    $dbh_tests->rollback();
+	    exit $ok;
+        });
+	die "unexpectedly left db_retry";
+    }
+
     my $set_info= sub {
         return if grep { !defined } @_;
         my @s;
-- 
2.11.0


