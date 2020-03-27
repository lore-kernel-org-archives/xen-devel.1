Return-Path: <SRS0=U/nz=5M=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B222C43331
	for <xen-devel@archiver.kernel.org>; Fri, 27 Mar 2020 18:16:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 167792083E
	for <xen-devel@archiver.kernel.org>; Fri, 27 Mar 2020 18:16:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 167792083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHtVp-00046G-LJ; Fri, 27 Mar 2020 18:15:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tAzE=5M=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jHtVo-00046A-09
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 18:15:20 +0000
X-Inumbo-ID: ea27f6c6-7056-11ea-a6c1-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea27f6c6-7056-11ea-a6c1-bc764e2007e4;
 Fri, 27 Mar 2020 18:15:19 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jHtVl-0004KR-Fb; Fri, 27 Mar 2020 18:15:17 +0000
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 27 Mar 2020 18:15:13 +0000
Message-Id: <20200327181513.19366-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [OSSTEST PATCH] README.dev: Suggest -P for
 commissioning flights
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 README.dev | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/README.dev b/README.dev
index e32889b7..2cbca109 100644
--- a/README.dev
+++ b/README.dev
@@ -115,7 +115,7 @@ and boot Xen:
  $ hn=mudcake
  $ flight=`./make-hosts-flight play xen-unstable blessed-commission-$hn commission-$hn $basis`; echo $flight
  113155
- $ ./mg-execute-flight -Bcommission-$hn -Eian.jackson@citrix.com $flight
+ $ ./mg-execute-flight -P -Bcommission-$hn -Eian.jackson@citrix.com $flight
 
 This will email the specified address.  The examination should pass,
 completely.  If it does not then you may need to change the BIOS
@@ -132,7 +132,7 @@ If that works, a more thorough test:
 
  $ basis=113124   # pick last good xen-unstable or osstest flight
  $ flight=`./cs-adjust-flight new:commission-$hn copy $basis`; echo $flight
- $ ./mg-execute-flight -Bcommission-$hn -Eian.jackson@citrix.com -f$basis $flight
+ $ ./mg-execute-flight -P -Bcommission-$hn -Eian.jackson@citrix.com -f$basis $flight
 
 This should show no regressions.  (Or, at least, none that are a cause
 for concern.)
-- 
2.11.0


