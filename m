Return-Path: <SRS0=B7KG=DO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8279C41604
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 18:27:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EAB12168B
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 18:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EAB12168B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.3703.11007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQEAA-0003H0-8w; Wed, 07 Oct 2020 18:27:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3703.11007; Wed, 07 Oct 2020 18:27:41 +0000
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
	id 1kQEA8-0003Ew-Sr; Wed, 07 Oct 2020 18:27:40 +0000
Received: by outflank-mailman (input) for mailman id 3703;
 Wed, 07 Oct 2020 18:27:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE4m-00072Q-MQ
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:22:08 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28d148d1-a6a9-4f44-b524-7bf9d2054855;
 Wed, 07 Oct 2020 18:20:28 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDk9-0007CF-3e; Wed, 07 Oct 2020 19:00:49 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE4m-00072Q-MQ
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:22:08 +0000
X-Inumbo-ID: 28d148d1-a6a9-4f44-b524-7bf9d2054855
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 28d148d1-a6a9-4f44-b524-7bf9d2054855;
	Wed, 07 Oct 2020 18:20:28 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDk9-0007CF-3e; Wed, 07 Oct 2020 19:00:49 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 63/82] test host reuse: Switch to principled sharing scope runvar scheme
Date: Wed,  7 Oct 2020 19:00:05 +0100
Message-Id: <20201007180024.7932-64-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

* When selecthost is passed an @host ident, indicating prep work,
  engage restricted runvar access.  If no call to sharing_for_build
  was made, this means it can access only the runvars in
  the default value of @accessible_runvar_pats.

* Make the sharetype for host reuse be based on the values of
  precisely those same runvars, rather than using an adhoc scheme.

The set of covered runvars is bigger now as a result of testing...

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/TestSupport.pm | 23 ++++++++++++++++++++++-
 ts-host-reuse          | 20 ++++++++------------
 2 files changed, 30 insertions(+), 13 deletions(-)

diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index 752c36c5..28381f05 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -162,7 +162,22 @@ our $logm_prefix= '';
 
 # When runvar_access_restrict is called, it will limit reading
 # of non-synth runvars to ones which match these glob patterns.
-our @accessible_runvar_pats = qw(test-host-setup-runvars-will-appear-here);
+# The initial list is the runvars whih affect how a test host is
+# set up, and for test jobs it isn't modified.  synth runvars
+# which are read-modify-write by host setup must be listed too.
+our @accessible_runvar_pats =
+  qw(
+      *_dmrestrict *buildjob
+      arch console di_version dom0_mem enable_xsm freebsd_distpath
+      linux_boot_append os suite toolstack xen_boot_append xenable_xsm
+      host                           *_host 
+      host_console                   *_host_console
+      host_hostflagadjust            *_host_hostflagadjust
+      host_hostflags                 *_host_hostflags
+      host_linux_boot_append         *_host_linux_boot_append
+      host_ip                        *_host_ip
+      host_power_install             *_host_power_install
+   );
 
 #---------- test script startup ----------
 
@@ -1274,6 +1289,12 @@ sub selecthost ($;$$) {
 	return $child;
     }
 
+    #----- if we're sharing an actual host, make sure we do it right -----
+
+    if ($isprep) {
+	runvar_access_restrict();
+    }
+
     #----- calculation of the host's properties -----
 
     # Firstly, hardcoded defaults
diff --git a/ts-host-reuse b/ts-host-reuse
index 29abe987..c852a858 100755
--- a/ts-host-reuse
+++ b/ts-host-reuse
@@ -64,18 +64,14 @@ sub sharetype_add ($$) {
 }
 
 sub compute_test_sharetype () {
-    $sharetype =
-	"test-$flight/$r{arch}/$r{xenbuildjob}/$r{kernbuildjob}/$r{buildjob}";
-
-    sharetype_add('suite', $ho->{Suite});
-    sharetype_add('di', $ho->{DiVersion});
-
-    foreach my $runvar (qw(freebsd_distpath freebsdbuildjob
-			   xenable_xsm toolstack kernkind
-			   xen_boot_append toolstack)) {
-	my $val = $r{$runvar};
-	die "$runvar $val ?" if defined $val && $val =~ m{[,/\%\\]};
-	sharetype_add($runvar, $val);
+    $sharetype = "test-$flight";
+    my %done;
+    foreach my $key (runvar_glob(@accessible_runvar_pats)) {
+	next if runvar_is_synth($key);
+	my $val = $r{$key};
+	next if $done{$key}++;
+	$val =~ s{[^\"-\~]|\%}{ sprintf "%%%02x", ord $& }ge;
+	$sharetype .= "!$key=$r{$key}";
     }
 
     return $sharetype;
-- 
2.20.1


