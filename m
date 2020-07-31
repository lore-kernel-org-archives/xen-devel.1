Return-Path: <SRS0=y719=BK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD46C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2020 12:02:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC0DD22D04
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2020 12:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC0DD22D04
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1Tk4-0002HY-Si; Fri, 31 Jul 2020 12:02:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nr0X=BK=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1k1Tk4-00026u-5E
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:02:28 +0000
X-Inumbo-ID: b261fa71-d325-11ea-8e2b-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b261fa71-d325-11ea-8e2b-bc764e2007e4;
 Fri, 31 Jul 2020 12:02:26 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1k1TN2-0001W4-AN; Fri, 31 Jul 2020 12:38:40 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH v2 32/41] adhoc-revtuple-generator: Fix an undef
 warning in a debug print
Date: Fri, 31 Jul 2020 12:38:11 +0100
Message-Id: <20200731113820.5765-33-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200731113820.5765-1-ian.jackson@eu.citrix.com>
References: <20200731113820.5765-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

$parents might be undef here.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
New in v2.
---
 adhoc-revtuple-generator | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/adhoc-revtuple-generator b/adhoc-revtuple-generator
index c8d6f4ad..ec33305a 100755
--- a/adhoc-revtuple-generator
+++ b/adhoc-revtuple-generator
@@ -463,7 +463,7 @@ sub coalesce {
 	$out->{$node}{Date}= $explode_date;
 	my $parents= $graphs[$explode_i]{ $node[$explode_i] }{Parents};
 	print DEBUG "#$explode_i $explode_isearliest".
-            " $explode_date  x".scalar(@$parents)."\n";
+            " $explode_date  x".($parents ? scalar(@$parents) : "-")."\n";
 
 	foreach my $subparent (@$parents) {
 	    $node[$explode_i]= $subparent;
-- 
2.20.1


