Return-Path: <SRS0=B7KG=DO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C001EC4727E
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 18:18:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 442FD2173E
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 18:18:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 442FD2173E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.3638.10483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQE0x-0006Yn-UF; Wed, 07 Oct 2020 18:18:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3638.10483; Wed, 07 Oct 2020 18:18:11 +0000
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
	id 1kQE0x-0006Yf-Qg; Wed, 07 Oct 2020 18:18:11 +0000
Received: by outflank-mailman (input) for mailman id 3638;
 Wed, 07 Oct 2020 18:18:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE0w-0006UA-Ra
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:18:10 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1901b5e8-0928-4160-9047-aaf276f7001d;
 Wed, 07 Oct 2020 18:18:08 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDk0-0007CF-Aq; Wed, 07 Oct 2020 19:00:40 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE0w-0006UA-Ra
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:18:10 +0000
X-Inumbo-ID: 1901b5e8-0928-4160-9047-aaf276f7001d
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1901b5e8-0928-4160-9047-aaf276f7001d;
	Wed, 07 Oct 2020 18:18:08 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDk0-0007CF-Aq; Wed, 07 Oct 2020 19:00:40 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Ian Jackson <Ian.Jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 28/82] host allocation: Support new reuse-* magic hostflag
Date: Wed,  7 Oct 2020 18:59:30 +0100
Message-Id: <20201007180024.7932-29-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

This is like share-* except it has different MaxTasks and MaxWear
parameters.

Signed-off-by: Ian Jackson <Ian.Jackson@eu.citrix.com>
---
 README.planner              |  7 +++++++
 ts-hosts-allocate-Executive | 15 +++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/README.planner b/README.planner
index f134d716..a9275f12 100644
--- a/README.planner
+++ b/README.planner
@@ -230,6 +230,13 @@ hostflag:
     identically.  The osstest test harness revision is automatically
     appended and therefore does not need to be included.
 
+  reuse-SHARING
+
+    The host may be reused, one job after another.  Like share- but
+    only permits one job at a time, and has a much higher limit for
+    the number of successive jobs.  ts-host-test-share should be used
+    to arrange for the host's state to be recorded appropriately.
+
   equiv-FORMALTOKEN
 
     For each equiv-FORMALTOKEN job flag set on one or more IDENTs, a
diff --git a/ts-hosts-allocate-Executive b/ts-hosts-allocate-Executive
index 2c18a739..6fcfd2e3 100755
--- a/ts-hosts-allocate-Executive
+++ b/ts-hosts-allocate-Executive
@@ -279,6 +279,16 @@ sub compute_hids () {
                     " $hid->{DefaultSharedMaxTasks}".
                     " $hid->{DefaultSharedMaxWear}\n";
                 next;
+            } elsif ($flag =~ m/^reuse-/) {
+                die if exists $hid->{Shared};
+                my $shr= $'; #'
+                $hid->{Shared}= $shr." ".get_harness_rev();
+                $hid->{SharedMaxTasks}= 1;
+		$hid->{SharedMaxWear}= 10;
+                print DEBUG "HID $ident FLAG $flag SHARE-REUSE $shr".
+                    " $hid->{SharedMaxTasks}".
+                    " $hid->{SharedMaxWear}\n";
+                next;
             } elsif ($flag =~ m/^equiv-/) {
                 my $formalclass= $'; #'
                 die if exists $hid->{Equiv};
@@ -484,6 +494,11 @@ END
         foreach my $kcomb (qw(Shared-Max-Wear Shared-Max-Tasks)) {
             my $kdb= $kcomb;  $kdb =~ y/-A-Z/ a-z/;
             my $khash= $kcomb;  $khash =~ y/-//d;
+	    if ($hid->{$khash}) {
+		$candrow->{$khash} = $hid->{$khash};
+                print DEBUG "$dbg $khash FROM-HID\n";
+		next;
+	    }
             $resprop_q->execute($candrow->{restype},$candrow->{resname},$kdb);
             my $proprow= $resprop_q->fetchrow_hashref();
             my $val= $proprow->{val};
-- 
2.20.1


