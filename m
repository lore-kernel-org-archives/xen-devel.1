Return-Path: <SRS0=TMXt=BY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA51C433E8
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2020 17:26:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FBF920708
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2020 17:26:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="d2D4IP0K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FBF920708
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dTO-00043b-QT; Fri, 14 Aug 2020 17:26:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dRM-00024H-2y
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:24:28 +0000
X-Inumbo-ID: 8045ba7c-ba19-4aad-af45-0587ec95cdba
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8045ba7c-ba19-4aad-af45-0587ec95cdba;
 Fri, 14 Aug 2020 17:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425744;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=35wvHPbtsS4tCSQHRh9nXy4l+Oi4ard8rAoLOTjQwQ0=;
 b=d2D4IP0Khr7ewUNEvkJydKo04R6qeBv8RoSiWDuhidJDA0caJKGJpw+W
 9qTc0T7A70hwdikm5SvXaPFoveUz4aBCAuSytqxmO7NxsPacnruqAOxAo
 AlVij8XVCW49w5dxSaYqNsEJ8B/KC8ImV3sLq705TNbh4jqbgq//uu6yK o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: AJGGAk75SevsXl08laJ2+S4mDXZNhtia1LZ25Qh+RUY6nFuht/BPpRYY83D2jNqeBDKEXO4qfi
 JccJhqA2d5G0orCqEevCxL/69MOqJMueCOSLdWLkSRuLVwFsZyqlLZTnnmQitqZWNnH34G8Na6
 6sfpV5IScV9I+j93ArXfXU7vbTtin0LBDO6f0H2s4v89ncld6yoq8tkVv/NK6flnL7k7ywu1jj
 s0hTZhSSkKia8zvJPE8gUZjM6QlQ0kNYVHy6CdahOoG5SgWhYnWipXNYcFxV1e+PtkJOvy31nJ
 nrI=
X-SBRS: 2.7
X-MesageID: 24725193
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24725193"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 56/60] sg-report-job-history (nfc): Abolish $fromstuff
Date: Fri, 14 Aug 2020 18:22:01 +0100
Message-ID: <20200814172205.9624-57-ian.jackson@eu.citrix.com>
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

This used to be reused, but that is no longer the case.  Do away with
it, for clarity and simplicity.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-job-history | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sg-report-job-history b/sg-report-job-history
index 48dc2f57..2cac123b 100755
--- a/sg-report-job-history
+++ b/sg-report-job-history
@@ -140,13 +140,11 @@ END
     }
     my $offset= $limit-1;
 
-    my $fromstuff= <<END;
+    my $flightsq= db_prepare(<<END);
+        SELECT * 
           FROM jobs JOIN flights USING (flight)
          WHERE ($cond)
       ORDER BY flight DESC
-END
-    my $flightsq= db_prepare(<<END);
-        SELECT * $fromstuff
          LIMIT $limit
 END
     $flightsq->execute(@params);
-- 
2.11.0


