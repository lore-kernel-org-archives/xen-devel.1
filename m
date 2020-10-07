Return-Path: <SRS0=B7KG=DO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F9EEC4363C
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 18:28:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B57482168B
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 18:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B57482168B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.3762.11294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQEBC-0006HR-VN; Wed, 07 Oct 2020 18:28:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3762.11294; Wed, 07 Oct 2020 18:28:46 +0000
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
	id 1kQEBB-0006GE-N9; Wed, 07 Oct 2020 18:28:45 +0000
Received: by outflank-mailman (input) for mailman id 3762;
 Wed, 07 Oct 2020 18:28:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE5u-00072Q-PO
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:23:18 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 56a087aa-63ef-43c8-b5ff-160335ac114f;
 Wed, 07 Oct 2020 18:21:25 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDk8-0007CF-T2; Wed, 07 Oct 2020 19:00:48 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE5u-00072Q-PO
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:23:18 +0000
X-Inumbo-ID: 56a087aa-63ef-43c8-b5ff-160335ac114f
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 56a087aa-63ef-43c8-b5ff-160335ac114f;
	Wed, 07 Oct 2020 18:21:25 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDk8-0007CF-T2; Wed, 07 Oct 2020 19:00:48 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 62/82] runvar access: Introduce effects_gone_before_share_reuse
Date: Wed,  7 Oct 2020 19:00:04 +0100
Message-Id: <20201007180024.7932-63-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

The syslog server, and its port, is used for things that happen in
this job, but the syslog server is torn down and a new one started,
when the host is reused.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Debian.pm      | 10 ++++++----
 Osstest/TestSupport.pm |  6 ++++++
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index ae3c1d33..01930e1f 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -727,10 +727,12 @@ sub di_installcmdline_core ($$;@) {
     push @cl, "priority=$debconf_priority";
     push @cl, "rescue/enable=true" if $xopts{RescueMode};
 
-    if ($r{syslog_server}) {
-	$r{syslog_server} =~ m/:(\d+)$/ or die "$r{syslog_server} ?";
-	push @cl, "log_host=$`", "log_port=$1";
-    }
+    effects_gone_before_share_reuse(sub {
+        if ($r{syslog_server}) {
+	    $r{syslog_server} =~ m/:(\d+)$/ or die "$r{syslog_server} ?";
+	    push @cl, "log_host=$`", "log_port=$1";
+	}
+    });
 
     return @cl;
 }
diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index c6bd6714..752c36c5 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -144,6 +144,7 @@ BEGIN {
                       gitcache_setup
 
 		      @accessible_runvar_pats sharing_for_build
+		      effects_gone_before_share_reuse
                       );
     %EXPORT_TAGS = ( );
 
@@ -3173,6 +3174,11 @@ END
 
 sub sharing_for_build () { @accessible_runvar_pats = qw(*); };
 
+sub effects_gone_before_share_reuse ($) {
+    local @accessible_runvar_pats = qw(*);
+    $_[0]();
+}
+
 sub runvar_access_restrict () {
     # restricts runvars to those in @accessible_runvar_pats
     return if "@accessible_runvar_pats" eq "*";
-- 
2.20.1


