Return-Path: <SRS0=B7KG=DO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF0F2C4727E
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 18:28:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91BE52168B
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 18:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91BE52168B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.3754.11275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQEB9-00068e-Js; Wed, 07 Oct 2020 18:28:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3754.11275; Wed, 07 Oct 2020 18:28:43 +0000
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
	id 1kQEB8-00066z-Ee; Wed, 07 Oct 2020 18:28:42 +0000
Received: by outflank-mailman (input) for mailman id 3754;
 Wed, 07 Oct 2020 18:28:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE4D-00072Q-Kx
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:21:33 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1bee077b-0b92-4225-aeef-89e68b1bd8f5;
 Wed, 07 Oct 2020 18:20:11 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDk1-0007CF-ML; Wed, 07 Oct 2020 19:00:41 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE4D-00072Q-Kx
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:21:33 +0000
X-Inumbo-ID: 1bee077b-0b92-4225-aeef-89e68b1bd8f5
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1bee077b-0b92-4225-aeef-89e68b1bd8f5;
	Wed, 07 Oct 2020 18:20:11 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDk1-0007CF-ML; Wed, 07 Oct 2020 19:00:41 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Ian Jackson <Ian.Jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 33/82] plan search: Move $share_compat_ok further up the file
Date: Wed,  7 Oct 2020 18:59:35 +0100
Message-Id: <20201007180024.7932-34-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

We are going to want to use this outside the loop.

No functional change.

Signed-off-by: Ian Jackson <Ian.Jackson@eu.citrix.com>
---
 Osstest/Executive.pm | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/Osstest/Executive.pm b/Osstest/Executive.pm
index e17b6503..4083ae6b 100644
--- a/Osstest/Executive.pm
+++ b/Osstest/Executive.pm
@@ -684,6 +684,23 @@ sub plan_search ($$$$) {
 
         $events ||= [ ];
 
+	my $share_compat_ok = sub {
+	    my ($eshare) = @_;
+	    $dbgprint->("PLAN LOOP   SHARE-COMPAT-OK ".
+		"type $eshare->{Type} vs. ".
+		    ($req->{Shared} // '<undef>')." ".
+		"wear $eshare->{Wear} ".
+		"shares $eshare->{Shares} vs. ".
+		    ($req->{SharedMaxTasks}//'<undef>'));
+	    return 0 unless defined $req->{Shared};
+	    return 0 unless $req->{Shared} eq $eshare->{Type};
+	    my $wear= $eshare->{Wear}+1;
+	    return 0 if $wear > $req->{SharedMaxWear};
+	    return 0 if $eshare->{Shares} != $req->{SharedMaxTasks};
+	    $dbgprint->("PLAN LOOP   SHARE-COMPAT-OK Y");
+	    return 1;
+	};
+
 	# can we do $req at $try_time ?  If not, when later can we ?
       PERIOD:
 	foreach (my $ix=0; $ix<@$events; $ix++) {
@@ -698,23 +715,6 @@ sub plan_search ($$$$) {
             # this period is entirely after the proposed slot;
             # so no need to check this or any later periods
 
-	    my $share_compat_ok = sub {
-		my ($eshare) = @_;
-		$dbgprint->("PLAN LOOP   SHARE-COMPAT-OK ".
-		    "type $eshare->{Type} vs. ".
-			($req->{Shared} // '<undef>')." ".
-		    "wear $eshare->{Wear} ".
-		    "shares $eshare->{Shares} vs. ".
-			($req->{SharedMaxTasks}//'<undef>'));
-		return 0 unless defined $req->{Shared};
-		return 0 unless $req->{Shared} eq $eshare->{Type};
-		my $wear= $eshare->{Wear}+1;
-		return 0 if $wear > $req->{SharedMaxWear};
-		return 0 if $eshare->{Shares} != $req->{SharedMaxTasks};
-		$dbgprint->("PLAN LOOP   SHARE-COMPAT-OK Y");
-		return 1;
-	    };
-
 	    next PERIOD if $endevt->{Time} <= $try_time;
             # this period is entirely before the proposed slot;
             # it doesn't overlap, but must check subsequent periods
-- 
2.20.1


