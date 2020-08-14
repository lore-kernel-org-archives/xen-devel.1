Return-Path: <SRS0=TMXt=BY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F76C433E4
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2020 17:22:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3619C20708
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2020 17:22:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="YrJY1nvk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3619C20708
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dPI-000257-2g; Fri, 14 Aug 2020 17:22:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dPH-00024Q-F1
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:22:19 +0000
X-Inumbo-ID: 2adde251-d036-4faf-ae7a-63afdc966da3
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2adde251-d036-4faf-ae7a-63afdc966da3;
 Fri, 14 Aug 2020 17:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425734;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=VWuuAPMerjfMQAsxmPr3Y+nXxd0ZATQLLz4PXLvUE9U=;
 b=YrJY1nvko0fjO0IZERJQxmkp3VdMXWs54jZe9HKhqtJZHQF4d51Kk2Fm
 Is6e+ezuT23abNQRP7o4MGoSLBJy2XuHYJ2gZWaNOtLAn3+BT38DhDIDi
 7DRUf9+/t5NzmNap2vTzgesNLmRxpTYkk0yuwpXzoZkO5SZUjWVqo5x5m k=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: DLrvCt/pkEFSxhXfX8rOcRGnPb5aQSF+z8NJjaw7a8W9P5aUSkw3ZbIQc6wRQyASHExuQ4RkZ8
 IvkiOLxVoVRbMv0BCpAdpelnF2xgYIpLHr8ZkyP9xEHamLeqYwTzbrwz7tcbMvQLzfD/szbsid
 A1TkjlJADSwh9MPqSgA/pIDsF7+sm2XmOELnUO3SaDfaoNZ+PFBs9vfHVU03B8T8bURWbBiaAs
 0cln33AU7NfAvPjcQk+g+YkrEbIM0EooWc3W948bzeSM8faPnyeITWwBPBBiQUsAPk/3+eUwax
 cYw=
X-SBRS: 2.7
X-MesageID: 24900364
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24900364"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 09/60] history reporting (nfc): Provide cacheable_fn
Date: Fri, 14 Aug 2020 18:21:14 +0100
Message-ID: <20200814172205.9624-10-ian.jackson@eu.citrix.com>
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
 sg-report-host-history | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/sg-report-host-history b/sg-report-host-history
index f37dd4a2..90369ce4 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -181,20 +181,27 @@ END
 our $jqcachemisses = 0;
 our $jqtotal = 0;
 
-sub cacheable_query ($$$) {
-    my ($q, $jr, $cachekey) = @_;
+sub cacheable_fn ($$$) {
+    my ($jr, $cachekey, $fn) = @_;
     $jqtotal++;
     $cachekey = '%'.$cachekey;
     my $cached = $jr->{$cachekey};
     if (!$cached) {
 	$jqcachemisses++;
-	$q->execute($jr->{flight}, $jr->{job});
-	$cached = $q->fetchrow_hashref();
+	$cached = $fn->();
 	$jr->{$cachekey} = $cached;
     }
     return $cached;
 }
 
+sub cacheable_query ($$$) {
+    my ($q, $jr, $cachekey) = @_;
+    cacheable_fn($jr, $cachekey, sub {
+	$q->execute($jr->{flight}, $jr->{job});
+	return $q->fetchrow_hashref();
+    });
+}
+
 our %hosts;
 
 sub mainquery ($) {
-- 
2.11.0


