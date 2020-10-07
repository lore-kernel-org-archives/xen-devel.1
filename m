Return-Path: <SRS0=B7KG=DO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2347CC41604
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 18:19:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEF962173E
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 18:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEF962173E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.3647.10579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQE1y-0007Mn-PS; Wed, 07 Oct 2020 18:19:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3647.10579; Wed, 07 Oct 2020 18:19:14 +0000
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
	id 1kQE1y-0007Md-L0; Wed, 07 Oct 2020 18:19:14 +0000
Received: by outflank-mailman (input) for mailman id 3647;
 Wed, 07 Oct 2020 18:19:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE1x-00072Q-GG
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:19:13 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6c7b4c3-36aa-4ac6-a6a4-36a2a11e9a31;
 Wed, 07 Oct 2020 18:19:03 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDk7-0007CF-Nc; Wed, 07 Oct 2020 19:00:47 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE1x-00072Q-GG
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:19:13 +0000
X-Inumbo-ID: a6c7b4c3-36aa-4ac6-a6a4-36a2a11e9a31
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a6c7b4c3-36aa-4ac6-a6a4-36a2a11e9a31;
	Wed, 07 Oct 2020 18:19:03 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDk7-0007CF-Nc; Wed, 07 Oct 2020 19:00:47 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 58/82] runvar access: Introduce access control machinery
Date: Wed,  7 Oct 2020 19:00:00 +0100
Message-Id: <20201007180024.7932-59-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

This will allow us to trap accesses, during test host setup, to
runvars which weren't included in ithe calculation of the sharing
scope.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/TestSupport.pm | 53 ++++++++++++++++++++++++++++++++++++++++++
 README                 |  2 +-
 2 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index ce13d3a6..b1eca0a9 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -33,6 +33,7 @@ use File::Basename;
 use IO::Handle;
 use Carp;
 use Digest::SHA;
+use File::FnMatch qw(:fnmatch);
 
 BEGIN {
     use Exporter ();
@@ -141,6 +142,8 @@ BEGIN {
                       target_core_dump_setup
                       sha256file host_shared_mark_ready
                       gitcache_setup
+
+		      @accessible_runvar_pats
                       );
     %EXPORT_TAGS = ( );
 
@@ -156,6 +159,10 @@ our %timeout= qw(RebootDown   100
 our $logm_handle= new IO::File ">& STDERR" or die $!;
 our $logm_prefix= '';
 
+# When runvar_access_restrict is called, it will limit reading
+# of non-synth runvars to ones which match these glob patterns.
+our @accessible_runvar_pats = qw(test-host-setup-runvars-will-appear-here);
+
 #---------- test script startup ----------
 
 sub tsreadconfig () {
@@ -3164,4 +3171,50 @@ END
                                  'home-osstest-gitconfig');
 }
 
+sub runvar_access_restrict () {
+    # restricts runvars to those in @accessible_runvar_pats
+    return if "@accessible_runvar_pats" eq "*";
+    return if tied %r;
+    tie %r, 'RunvarMonitor', %r;
+}
+
+sub runvar_access_check ($$) {
+    my ($key, $what) = @_;
+    return if grep { fnmatch $_, $key } @accessible_runvar_pats;
+    my $m = "reuse-uncontrolled runvar $what '$key'\n".
+            " (controlled runvars are @accessible_runvar_pats)";
+    confess $m unless $ENV{OSSTEST_UNCONTROLLED_SHARE_RUNVAR_WARNONLY};
+    Carp::cluck $m;
+}
+
+package RunvarMonitor;
+use Carp;
+use Osstest;
+use Osstest::TestSupport;
+
+sub TIEHASH {
+    my $self = shift;
+    logm("reuse: restricting runvars to @accessible_runvar_pats");
+    return bless { @_ }, $self;
+}
+
+sub _ok {
+    my $self = shift;
+    my $key = shift;
+    Osstest::TestSupport::runvar_access_check($key, 'access');
+}
+
+sub FIRSTKEY {
+    confess
+      "reuse-uncontrolled runvar scanning - change to use runvar_glob!";
+}
+sub FETCH { my ($self, $key) = @_; $self->_ok($key); $self->{$key} }
+sub EXISTS { my ($self, $key) = @_; $self->_ok($key); exists $self->{$key} }
+sub STORE { my ($self, $key, $val) = @_; $self->{$key} = $val; }
+sub DELETE { my ($self, $key) = @_; delete $self->{$key}; }
+
+sub CLEAR { confess }
+sub SCALAR { confess }
+sub UNTIE { confess }
+
 1;
diff --git a/README b/README
index ba4bea1d..a929010c 100644
--- a/README
+++ b/README
@@ -297,7 +297,7 @@ To run osstest in standalone mode:
      curl
      netcat
      chiark-utils-bin
-     libxml-libxml-perl
+     libxml-libxml-perl libfile-fnmatch-perl
      dctrl-tools
      libnet-snmp-perl (if you are going to use Masterswitch PDUs)
 
-- 
2.20.1


