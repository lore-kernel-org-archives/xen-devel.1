Return-Path: <SRS0=TMXt=BY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01BA3C433DF
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2020 17:27:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6EC220708
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2020 17:27:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="FkWFF/r6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6EC220708
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dTm-0004p7-P5; Fri, 14 Aug 2020 17:26:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dRm-00024Q-Jf
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:24:54 +0000
X-Inumbo-ID: 8ece59ae-6f11-4c58-bde3-308e5aa54450
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ece59ae-6f11-4c58-bde3-308e5aa54450;
 Fri, 14 Aug 2020 17:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=2hKHQMm9lLk+HPPyAXgeOLKFpKDe8arF7r1l0PzRvic=;
 b=FkWFF/r6MMbEmBQr07kuhErzeIx/aSLCMNO5M5kTZemDT3atGO10ZX+0
 gern9u4hwLD62T53XRGjovHLA4zhi54VmQTtWWVZ7G68OsHQ0S6F3X/Ty
 nNsu/yivIsDQqNoV8HdpfV3TBjFT9A6CzP4F4CeTX+Cjf3Drizl8h+eXr c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Si1LiZ6+uGvgQeCovR0vFboL6vY7HEzbv+EJ2TxQnGItq26WNjNXEWlI+sutz2urnTRhOq2ZAN
 sgdVA+LQsKSiTHTpCrxC1WxXZCOmB+g18H7dRLhExvkU6wD2Of+W9E2ArUxDs0SNpDdUMUmbWg
 4LkqsVBL81V+2+eBQneabxM59ogtcqrB5AcPPIne02CCuRPWVdzOTOQ5fW40AJFIvrG3ytIPH/
 CrYpmIvxUn4+sEsL4804TJao+DDKGjLmvsnTDylckLwYCtJ2oSCpsQ9R2ec06YzULZ/GtetWok
 sLc=
X-SBRS: 2.7
X-MesageID: 24576925
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24576925"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 57/60] sg-report-job-history: Cache report_run_getinfo
Date: Fri, 14 Aug 2020 18:22:02 +0100
Message-ID: <20200814172205.9624-58-ian.jackson@eu.citrix.com>
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

No logical change.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-job-history | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sg-report-job-history b/sg-report-job-history
index 2cac123b..5d2a7e15 100755
--- a/sg-report-job-history
+++ b/sg-report-job-history
@@ -159,7 +159,7 @@ END
 
     while (my $f= $flightsq->fetchrow_hashref()) {
 	cache_row_lookup_prep(\$f);
-        my $ri= report_run_getinfo($f);
+        my $ri= cacheable_fn($f, 'rri', sub { report_run_getinfo($f) });
 
 	$ri->{Hosts} = cacheable_fn($f, 'h', sub {
             my %hosts;
-- 
2.11.0


