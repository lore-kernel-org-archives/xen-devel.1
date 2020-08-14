Return-Path: <SRS0=TMXt=BY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05BD3C433E3
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2020 17:22:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB21E20708
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2020 17:22:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="V4pTVXAb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB21E20708
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dPb-0002IV-CH; Fri, 14 Aug 2020 17:22:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dPZ-00024H-V3
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:22:37 +0000
X-Inumbo-ID: 8d9b3bd9-0f36-4b7b-b07a-0c23d5d827ed
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d9b3bd9-0f36-4b7b-b07a-0c23d5d827ed;
 Fri, 14 Aug 2020 17:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425735;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=5sXArIfAieSlcRtZvx5G6aGcdhH9pEgHuyMk5n7JEVc=;
 b=V4pTVXAbv8erVHzupOvPp6jXHCOu3GZKZ3xo8O8GXWVKnffFsfNN2bpU
 4GW1rOaIJhfIzqp4YJiY3bMFsC5c11QkMR7qu/502J+g12qs8If4khluQ
 JIiU3yLzxB8fNPtQrrPzfUYFSlQ60XER7cTcAzNAKhf8VtLn0XwKIMBkC A=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 7Bp9EfzMfiQEfxddNHnfzGwwaggYHMYp6rygoiI/oBUADI4roYsYkTBXJ5I4imD7VjvNL8NrH4
 p+P+wUvIS7oY5jMOYiEf12SvbfCLW4rUkKzjLFf02lhBCBEvTQJhlR6SlFORTYASdtcO+Xos7x
 xYhqs3lKjIobz9CU2NjsCY3tkUL9goDVkNJqPJIreVGOeuMsao+u1EixZgtYew11ohf1UxnZBh
 P7qdgYTE7PTZhglNFBnLUaeb7hlOqdNXjnQjGY2Sd3SGkeqOjfh2qAIgIPQQrBLUrq2knswwrU
 wu4=
X-SBRS: 2.7
X-MesageID: 24545452
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24545452"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 13/60] history reporting (nfc): Move cacheable_*
 further up the file
Date: Fri, 14 Aug 2020 18:21:18 +0100
Message-ID: <20200814172205.9624-14-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
References: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
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

Pure code motion.  Brings these together with the other work-cacheing
code.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-host-history | 60 +++++++++++++++++++++++++-------------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/sg-report-host-history b/sg-report-host-history
index 32414322..43ddd2af 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -88,6 +88,36 @@ sub cache_row_key ($) {
     return join $; , map { $jr->{$_} } @cache_row_key_cols;
 }
 
+our $jqcachemisses = 0;
+our $jqtotal = 0;
+
+sub cacheable_fn ($$$) {
+    my ($jr, $cachekey, $fn) = @_;
+    $jqtotal++;
+    $cachekey = '%'.$cachekey;
+    my $cached = $jr->{$cachekey};
+    $q_count{$cachekey}++;
+    if (!$cached) {
+	$jqcachemisses++;
+	$q_misses{$cachekey}++;
+	$cached = $fn->();
+	$jr->{$cachekey} = $cached;
+    }
+    return $cached;
+}
+
+sub cacheable_query ($$$) {
+    my ($q, $jr, $cachekey) = @_;
+    cacheable_fn($jr, $cachekey, sub {
+	foreach my $k (keys %{ $q->{ParamTypes} }) {
+	    $k =~ m/^:/ or die "$k ?";
+	    $q->bind_param($k, $jr->{$'} // die "$k ?");
+	}
+	$q->execute();
+	return $q->fetchrow_hashref();
+    });
+}
+
 sub cache_read_previous ($) {
     my ($html_file) = @_;
     if (!open H, $html_file) {
@@ -182,36 +212,6 @@ END
     print DEBUG "MINFLIGHT $minflight\n";
 }
 
-our $jqcachemisses = 0;
-our $jqtotal = 0;
-
-sub cacheable_fn ($$$) {
-    my ($jr, $cachekey, $fn) = @_;
-    $jqtotal++;
-    $cachekey = '%'.$cachekey;
-    my $cached = $jr->{$cachekey};
-    $q_count{$cachekey}++;
-    if (!$cached) {
-	$jqcachemisses++;
-	$q_misses{$cachekey}++;
-	$cached = $fn->();
-	$jr->{$cachekey} = $cached;
-    }
-    return $cached;
-}
-
-sub cacheable_query ($$$) {
-    my ($q, $jr, $cachekey) = @_;
-    cacheable_fn($jr, $cachekey, sub {
-	foreach my $k (keys %{ $q->{ParamTypes} }) {
-	    $k =~ m/^:/ or die "$k ?";
-	    $q->bind_param($k, $jr->{$'} // die "$k ?");
-	}
-	$q->execute();
-	return $q->fetchrow_hashref();
-    });
-}
-
 our %hosts;
 
 sub mainquery ($) {
-- 
2.11.0


