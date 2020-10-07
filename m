Return-Path: <SRS0=B7KG=DO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6815BC41604
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 18:19:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00E1A2173E
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 18:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00E1A2173E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.3652.10627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQE2J-0007mE-8x; Wed, 07 Oct 2020 18:19:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3652.10627; Wed, 07 Oct 2020 18:19:35 +0000
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
	id 1kQE2J-0007m5-4E; Wed, 07 Oct 2020 18:19:35 +0000
Received: by outflank-mailman (input) for mailman id 3652;
 Wed, 07 Oct 2020 18:19:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE2H-00072Q-H9
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:19:33 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f893354c-fbd2-4f1f-81a5-8981f15d37d1;
 Wed, 07 Oct 2020 18:19:13 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDkA-0007CF-DW; Wed, 07 Oct 2020 19:00:50 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE2H-00072Q-H9
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:19:33 +0000
X-Inumbo-ID: f893354c-fbd2-4f1f-81a5-8981f15d37d1
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f893354c-fbd2-4f1f-81a5-8981f15d37d1;
	Wed, 07 Oct 2020 18:19:13 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDkA-0007CF-DW; Wed, 07 Oct 2020 19:00:50 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 69/82] host lifecycle: Record lifecycle in db and runvar
Date: Wed,  7 Oct 2020 19:00:11 +0100
Message-Id: <20201007180024.7932-70-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

This is just the calls to host_update_lifecycle_info.
Now the db table is Needed.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/TestSupport.pm    | 2 ++
 schema/host-lifecycle.sql | 2 +-
 ts-freebsd-host-install   | 1 +
 ts-host-install           | 1 +
 ts-host-reuse             | 1 +
 ts-logs-capture           | 1 +
 6 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index 22141981..163862f8 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -1418,6 +1418,8 @@ sub selecthost ($;$$) {
 	}
     }
 
+    host_update_lifecycle_info($ho, $isprep ? 'selectprep' : 'select');
+
     return $ho;
 }
 
diff --git a/schema/host-lifecycle.sql b/schema/host-lifecycle.sql
index 7f1f5bb0..7e4fc2aa 100644
--- a/schema/host-lifecycle.sql
+++ b/schema/host-lifecycle.sql
@@ -1,4 +1,4 @@
--- ##OSSTEST## 012 Preparatory
+-- ##OSSTEST## 012 Needed
 --
 -- Records the jobs which have touched a host, for host sharing/reuse
 -- The information here is ephemeral - it is cleared when a host is
diff --git a/ts-freebsd-host-install b/ts-freebsd-host-install
index 9feb98cd..31e14d57 100755
--- a/ts-freebsd-host-install
+++ b/ts-freebsd-host-install
@@ -295,3 +295,4 @@ setup_netboot_local($ho);
 
 # Proceed with the install
 install();
+host_update_lifecycle_info($ho, 'wiped');
diff --git a/ts-host-install b/ts-host-install
index 5badc706..276c6af8 100755
--- a/ts-host-install
+++ b/ts-host-install
@@ -297,3 +297,4 @@ END
 }
 
 install();
+host_update_lifecycle_info($ho, 'wiped');
diff --git a/ts-host-reuse b/ts-host-reuse
index 0ecbb0bd..85beb51e 100755
--- a/ts-host-reuse
+++ b/ts-host-reuse
@@ -158,6 +158,7 @@ sub act_post_test () {
     return unless $ho->{Shared};
     die unless $ho->{Shared}{State} eq 'mid-test';
     post_test_cleanup();
+    host_update_lifecycle_info($ho, 'final');
     host_shared_mark_ready($ho, $sharetype, 'mid-test', 'ready');
 }
 
diff --git a/ts-logs-capture b/ts-logs-capture
index ec494fe1..0b0b6af6 100755
--- a/ts-logs-capture
+++ b/ts-logs-capture
@@ -309,3 +309,4 @@ if (fetch_logs_host()) {
     }
 }
 logm("logs captured to $stash");
+host_update_lifecycle_info($ho, 'final');
-- 
2.20.1


