Return-Path: <SRS0=JQvX=5Q=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E289BC2D0F1
	for <xen-devel@archiver.kernel.org>; Tue, 31 Mar 2020 16:43:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE2B5214DB
	for <xen-devel@archiver.kernel.org>; Tue, 31 Mar 2020 16:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE2B5214DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJJz7-0003pT-HE; Tue, 31 Mar 2020 16:43:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DbII=5Q=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jJJz6-0003pG-BA
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 16:43:28 +0000
X-Inumbo-ID: bbdd354a-736e-11ea-b58d-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bbdd354a-736e-11ea-b58d-bc764e2007e4;
 Tue, 31 Mar 2020 16:43:22 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jJJyz-0003wI-W5; Tue, 31 Mar 2020 17:43:22 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH v2 2/2] host props/flags: Save for commissioning
 flights too
Date: Tue, 31 Mar 2020 17:43:18 +0100
Message-Id: <20200331164318.4651-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200331164318.4651-1-ian.jackson@eu.citrix.com>
References: <20200331164318.4651-1-ian.jackson@eu.citrix.com>
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

Obviously we want this!

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest.pm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Osstest.pm b/Osstest.pm
index 54f0085c..1e381d8f 100644
--- a/Osstest.pm
+++ b/Osstest.pm
@@ -411,7 +411,7 @@ sub blessing_must_not_modify_host ($) {
     # returns '' (falseish) if we may modify a host's props etc.,
     # or a trueish string message if may not
     my ($intended_blessing) = @_;
-    return '' if $intended_blessing eq "real";
+    return '' if $intended_blessing =~ qr{^real$|^commission-};
     return "intended blessing $intended_blessing != real";
 }
 
-- 
2.11.0


