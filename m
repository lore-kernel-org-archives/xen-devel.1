Return-Path: <SRS0=TMXt=BY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7769C433E3
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2020 17:22:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A3D720708
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2020 17:22:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="JNXUX/WJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A3D720708
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dPN-000285-QR; Fri, 14 Aug 2020 17:22:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dPM-00024Q-F3
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:22:24 +0000
X-Inumbo-ID: e752ff3c-c5c0-466e-9851-32d936877fe4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e752ff3c-c5c0-466e-9851-32d936877fe4;
 Fri, 14 Aug 2020 17:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425735;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=yzvvWPvs19JE/ETvoMiV0rNkq4oq3GlQAVyUogvXSnU=;
 b=JNXUX/WJqveNUCCI5qUF/ral5cm/5sfvH6TKSiQFLqlJUE5PAkWuQAoO
 sNpj8Bf6JSdIqLPyCWrsCAaSETw4g6zTS8ZBrQbmUalVY4Ln2sfxyNkMO
 YJidUzJZ0EnyoJGQqk+XAsNc/p1wC7vyHmdrTjefCDpRJV1bif8wxf6Tc k=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: lpIon3J5lLZzhK5HxqvZYGJlKd6KgNNT71qxQZ3tB9E6jR+Krz3Kp5+yFiZwdXWC8dblRPHbjZ
 IEXmGweZP5VpLgMXa2HjCKY8o2YMa8wuKiF7UcSSyCop6mPLaUCQVpsu9Y8I6nLhmmhwD2C2sW
 tOJXvWdRNNVG9BVKKkl1W70YNbKFUZ37weFvQadWO/UlAgzFi42nCSdbbuZTNZVFlUCZNkguLN
 upWAPd0b85DP5rv69KpYaQ4nHdGAnitYw2TaKUKleFMtgwNdMaSj6VoRdl9egtBH3+O08RcBPz
 fko=
X-SBRS: 2.7
X-MesageID: 24900366
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24900366"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 11/60] history reporting (nfc): Rename $cachehits to
 $rows_hit
Date: Fri, 14 Aug 2020 18:21:16 +0100
Message-ID: <20200814172205.9624-12-ian.jackson@eu.citrix.com>
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
 sg-report-host-history | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sg-report-host-history b/sg-report-host-history
index 8c5cd105..705367cf 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -118,7 +118,7 @@ sub cache_row_lookup_prep ($) {
     my $cacherow = $cache{cache_row_key($$jrr)};
     if ($cacherow) {
 	$$jrr = $cacherow;
-	$cachehits++;
+	$rows_hit++;
     }
 }
 
@@ -303,7 +303,7 @@ END
     # The contents of $jr for each job is cached across runs.
 
     my @rows;
-    my $cachehits = 0;
+    my $rows_hit = 0;
     foreach my $jr (@$inrows) {
 	#print DEBUG "JOB $jr->{flight}.$jr->{job} ";
 
@@ -320,7 +320,7 @@ END
 	push @rows, { %$jr, %$endedrow };
     }
 
-    print DEBUG "CACHE $hostname $cachehits / ".(scalar @rows)
+    print DEBUG "CACHE $hostname $rows_hit / ".(scalar @rows)
 	." of ".(scalar %cache)."\n";
 
     @rows = sort { $b->{finished} <=> $a->{finished} } @rows;
-- 
2.11.0


