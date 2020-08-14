Return-Path: <SRS0=TMXt=BY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C739EC433E1
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2020 17:26:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C67A20708
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2020 17:26:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="cewrDWv6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C67A20708
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dTZ-0004JA-Vg; Fri, 14 Aug 2020 17:26:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dQ5-00024Q-GL
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:23:09 +0000
X-Inumbo-ID: a7390e41-f3d2-4171-a822-ee700fc01ca5
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7390e41-f3d2-4171-a822-ee700fc01ca5;
 Fri, 14 Aug 2020 17:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425741;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=uHxURdk47z4WA/HkYNY5Reoic0Udo2X39Jbx4cyBODE=;
 b=cewrDWv6rRHk1rkLtI94dpZPYOZSixQFqBj7TdSe/yfEk0sAO+ovzpBT
 FZNE0BZALd3w1nILbnURDUaUrieWj4D9Ie3gjZylPrNFyWiMZV3i4GHfO
 yGLBQp/PqKLLE9lqgdaXXHLhXrNlZulWIXOTiSIZnRbp+WzCvn/WgTYzJ M=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: XLsqIzKr+LbHvXDHYGeXcxiwqJmXkCGLhWZc6reQ6QXPuqklIpvyACl3ovNfEqdFwoW+SRnBkN
 bFwoJYEmB+cFYC4gX3Jpu9p5RSbA4UVnpAvmGbfqf6bfScRb8HbTlPQosR2n6RH3AcEvbpsCtG
 Ec9GdzWVQ2zoEKMrB7QOXNMb1CV2q5WhLElXBQhbaFjHsgBNAatTvE9fS23uXQ8WUN8rSkS3sU
 dYSjcztV/qKTW/XNImmVgECkcHLkUOUMaf5MpQYsQW9qHGwpwIAacsHf2y73t2xa68glEoUqYi
 BCk=
X-SBRS: 2.7
X-MesageID: 24879744
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24879744"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 39/60] history reporting (nfc): Make cacheable_fn work
 without cache
Date: Fri, 14 Aug 2020 18:21:44 +0100
Message-ID: <20200814172205.9624-40-ian.jackson@eu.citrix.com>
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

This would allow us to use this in call sites without a cache.

I changed my mind about the code that prompted this, but it still
seems plausibly useful, so I'm keeping this commit.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/HistoryReport.pm | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Osstest/HistoryReport.pm b/Osstest/HistoryReport.pm
index 695d744a..5d2c83b7 100644
--- a/Osstest/HistoryReport.pm
+++ b/Osstest/HistoryReport.pm
@@ -99,6 +99,7 @@ sub key ($) {
 
 sub cacheable_fn ($$$) {
     my ($jr, $cachekey, $fn) = @_;
+    return $fn->() if !defined $cachekey;
     $cachekey = '%'.$cachekey;
     my $cached = $jr->{$cachekey};
     $q_count{$cachekey}++;
-- 
2.11.0


