Return-Path: <SRS0=B7KG=DO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F98DC4363C
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 18:26:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C92F32168B
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 18:26:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C92F32168B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.3674.10663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQE9C-0000oz-U6; Wed, 07 Oct 2020 18:26:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3674.10663; Wed, 07 Oct 2020 18:26:42 +0000
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
	id 1kQE9C-0000os-Pz; Wed, 07 Oct 2020 18:26:42 +0000
Received: by outflank-mailman (input) for mailman id 3674;
 Wed, 07 Oct 2020 18:26:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE2W-00072Q-HT
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:19:48 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9dc5c5b6-8d1c-43ed-a943-f114e0982010;
 Wed, 07 Oct 2020 18:19:21 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDk7-0007CF-UQ; Wed, 07 Oct 2020 19:00:48 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE2W-00072Q-HT
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:19:48 +0000
X-Inumbo-ID: 9dc5c5b6-8d1c-43ed-a943-f114e0982010
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9dc5c5b6-8d1c-43ed-a943-f114e0982010;
	Wed, 07 Oct 2020 18:19:21 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDk7-0007CF-UQ; Wed, 07 Oct 2020 19:00:48 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 59/82] runvar access: Provide runvar_glob
Date: Wed,  7 Oct 2020 19:00:01 +0100
Message-Id: <20201007180024.7932-60-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

We will need this because when runvar access is restricted, accessing
via %r directly won't work.  We want to see what patterns the code is
interested in (so that interest in a nonexistent runvar is properly
tracked).

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/TestSupport.pm | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index b1eca0a9..6403e52b 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -53,7 +53,7 @@ BEGIN {
                       store_runvar get_runvar get_runvar_maybe
                       get_runvar_default need_runvars
                       unique_incrementing_runvar next_unique_name
-                      stashfilecontents runvar_is_synth
+                      stashfilecontents runvar_is_synth runvar_glob
 
                       target_cmd_root_status target_cmd_output_root_status
                       target_cmd_root target_cmd target_cmd_build
@@ -3187,6 +3187,20 @@ sub runvar_access_check ($$) {
     Carp::cluck $m;
 }
 
+sub runvar_glob {
+    my $monitor = tied %r;
+    my $realr = $monitor || \%r;
+    my @out;
+    foreach my $pat (@_) {
+	if ($monitor) { runvar_access_check($pat, 'scan') }
+	foreach my $key (sort keys %$realr) {
+	    next unless fnmatch $pat, $key;
+	    push @out, $key;
+	}
+    }
+    @out;
+}
+
 package RunvarMonitor;
 use Carp;
 use Osstest;
-- 
2.20.1


