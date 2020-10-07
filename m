Return-Path: <SRS0=B7KG=DO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AD3DC4363C
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 18:18:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F6F02173E
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 18:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F6F02173E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.3637.10471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQE0t-0006Vt-Kq; Wed, 07 Oct 2020 18:18:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3637.10471; Wed, 07 Oct 2020 18:18:07 +0000
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
	id 1kQE0t-0006Vk-Hn; Wed, 07 Oct 2020 18:18:07 +0000
Received: by outflank-mailman (input) for mailman id 3637;
 Wed, 07 Oct 2020 18:18:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE0r-0006UA-RO
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:18:05 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb70c138-20c1-4e8d-987d-9f2ded624cf7;
 Wed, 07 Oct 2020 18:18:03 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDk7-0007CF-Ge; Wed, 07 Oct 2020 19:00:47 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE0r-0006UA-RO
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:18:05 +0000
X-Inumbo-ID: bb70c138-20c1-4e8d-987d-9f2ded624cf7
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id bb70c138-20c1-4e8d-987d-9f2ded624cf7;
	Wed, 07 Oct 2020 18:18:03 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDk7-0007CF-Ge; Wed, 07 Oct 2020 19:00:47 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 57/82] TestSupport: Provide runvar_is_synth
Date: Wed,  7 Oct 2020 18:59:59 +0100
Message-Id: <20201007180024.7932-58-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

Internally we use an array %r_notsynth.  This allows us to avoid
adding code to store_runvar etc.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/TestSupport.pm | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index 634d6d2e..ce13d3a6 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -52,7 +52,7 @@ BEGIN {
                       store_runvar get_runvar get_runvar_maybe
                       get_runvar_default need_runvars
                       unique_incrementing_runvar next_unique_name
-                      stashfilecontents
+                      stashfilecontents runvar_is_synth
 
                       target_cmd_root_status target_cmd_output_root_status
                       target_cmd_root target_cmd target_cmd_build
@@ -147,7 +147,7 @@ BEGIN {
     @EXPORT_OK   = qw();
 }
 
-our (%r,$flight,$job,$stash);
+our (%r,$flight,$job,$stash,%r_,%r_notsynth);
 
 our %timeout= qw(RebootDown   100
                  RebootUp     400
@@ -178,12 +178,13 @@ sub tsreadconfig () {
         logm("starting $flight.$job");
 
         my $q= $dbh_tests->prepare(<<END);
-            SELECT name, val FROM runvars WHERE flight=? AND job=?
+            SELECT name, val, synth FROM runvars WHERE flight=? AND job=?
 END
         $q->execute($flight, $job);
         my $row;
         while ($row= $q->fetchrow_hashref()) {
             $r{ $row->{name} }= $row->{val};
+	    $r_notsynth{ $row->{name} }= !$row->{synth};
             logm("setting $row->{name}=$row->{val}");
         }
         $q->finish();
@@ -434,6 +435,11 @@ END
     return $value;
 }
 
+sub runvar_is_synth ($) {
+    my ($key) = @_;
+    return !$r_notsynth{$key};
+}
+
 sub target_adjust_timeout ($$) {
     my ($ho,$timeoutref) = @_; # $ho might be a $gho
     my $nestinglvl = $ho->{NestingLevel} // $ho->{Host}{NestingLevel};
-- 
2.20.1


