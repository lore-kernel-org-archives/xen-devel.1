Return-Path: <SRS0=TMXt=BY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F664C433DF
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2020 17:22:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 235E020708
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2020 17:22:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="NoaWWEXs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 235E020708
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dPg-0002OZ-2n; Fri, 14 Aug 2020 17:22:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dPe-00024H-V9
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:22:42 +0000
X-Inumbo-ID: f3d33461-b42b-4aa0-ba62-f5f5675d7a53
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f3d33461-b42b-4aa0-ba62-f5f5675d7a53;
 Fri, 14 Aug 2020 17:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425735;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=7526Su95kbsnzuzEUlz4l/oEnSDHWKYNYWxHeDrsvYs=;
 b=NoaWWEXsuAQyuABfbMgC04W9cahAwBe5mO+2PV/YPbWpxGOCujcBws8O
 DoNcVz34sb+IQGgA3fAoMVsfVZYVl15LnFLpd8nSjkrj8XYz8IxOxzDXt
 yJatq6p8EBpMjjQD9zKwOu+tuf2E21/oGjNWgEkBAG+3Zodt1QLvy+ab+ 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: exZqm6N1k7Xa5mO1hHKBYiL8tU9DKSTz8x5hC0DyddGilu+NrguhueaT/GX2FkK1xOz3nNKyI3
 uHEYqLr4HLBoPgsJ5C9XPvzLNElHeDYrx0Mpd3e52kxOFkZ81reo9MQNsFMeqIlU7NNUdhf1l8
 tyc+aFls9OQ4u3nrqg+3ApT3VlbWRZMgATFW/nvkTefCqPYN/Gt/VeMlUOgLIsXADbLgYlFFPJ
 FZQ/aKwSQqAmhVr6amO1ltWG0LDCNQC0iYqbyDmtvYwg1LN+K7DXH7xVG9Xx/VC5Vc+8X2+yPx
 078=
X-SBRS: 2.7
X-MesageID: 24900365
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24900365"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 07/60] history reporting (nfc): Break out
 cache_row_lookup_prep
Date: Fri, 14 Aug 2020 18:21:12 +0100
Message-ID: <20200814172205.9624-8-ian.jackson@eu.citrix.com>
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

Prep work.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-host-history | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/sg-report-host-history b/sg-report-host-history
index a8dae159..2724ef27 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -112,6 +112,16 @@ sub cache_read_existing ($) {
     close H;
 }
 
+sub cache_row_lookup_prep ($) {
+    my ($jrr) = @_;
+
+    my $cacherow = $cache{cache_row_key($$jrr)};
+    if ($cacherow) {
+	$$jrr = $cacherow;
+	$cachehits++;
+    }
+}
+
 sub cache_write_entry ($$) {
     my ($fh, $jr) = @_;
     print $fh "<!-- osstest-report-reuseable";
@@ -286,11 +296,7 @@ END
     foreach my $jr (@$inrows) {
 	#print DEBUG "JOB $jr->{flight}.$jr->{job} ";
 
-	my $cacherow = $cache{cache_row_key($jr)};
-	if ($cacherow) {
-	    $jr = $cacherow;
-	    $cachehits++;
-	}
+	cache_row_lookup_prep(\$jr);
 
 	my $endedrow = cacheable_query($endedq, $jr, 'e');
 	if (!$endedrow) {
-- 
2.11.0


