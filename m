Return-Path: <SRS0=cMO7=FW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A6CBC35270
	for <xen-devel@archiver.kernel.org>; Fri, 18 Dec 2020 20:45:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E54E023B70
	for <xen-devel@archiver.kernel.org>; Fri, 18 Dec 2020 20:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E54E023B70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=daemonizer.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.56681.99276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqMd3-00018p-7i; Fri, 18 Dec 2020 20:45:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56681.99276; Fri, 18 Dec 2020 20:45:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqMd3-00018i-4h; Fri, 18 Dec 2020 20:45:33 +0000
Received: by outflank-mailman (input) for mailman id 56681;
 Fri, 18 Dec 2020 20:45:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dpih=FW=daemonizer.de=maxi@srs-us1.protection.inumbo.net>)
 id 1kqMd2-00018c-IB
 for xen-devel@lists.xenproject.org; Fri, 18 Dec 2020 20:45:32 +0000
Received: from mx1.somlen.de (unknown [2a00:1828:a019::100:0])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 489e8013-2004-4272-bf58-e05c90e9a54b;
 Fri, 18 Dec 2020 20:45:31 +0000 (UTC)
Received: by mx1.somlen.de with ESMTPSA id 48D09C3AF0E;
 Fri, 18 Dec 2020 21:45:30 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 489e8013-2004-4272-bf58-e05c90e9a54b
From: Maximilian Engelhardt <maxi@daemonizer.de>
To: xen-devel@lists.xenproject.org
Cc: Maximilian Engelhardt <maxi@daemonizer.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 2/3] docs: use predictable ordering in generated documentation
Date: Fri, 18 Dec 2020 21:42:34 +0100
Message-Id: <31df2a1128c15bc1b4c738bf52e29c80982b4170.1608319634.git.maxi@daemonizer.de>
In-Reply-To: <cover.1608319634.git.maxi@daemonizer.de>
References: <cover.1608319634.git.maxi@daemonizer.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the seq number is equal, sort by the title to get predictable
output ordering. This is useful for reproducible builds.

Signed-off-by: Maximilian Engelhardt <maxi@daemonizer.de>
---
 docs/xen-headers | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/xen-headers b/docs/xen-headers
index 54155632c4..8c434d77e2 100755
--- a/docs/xen-headers
+++ b/docs/xen-headers
@@ -331,7 +331,7 @@ sub output_index () {
 <h2>Starting points</h2>
 <ul>
 END
-    foreach my $ic (sort { $a->{Seq} <=> $b->{Seq} } @incontents) {
+    foreach my $ic (sort { $a->{Seq} <=> $b->{Seq} or $a->{Title} cmp $b->{Title} } @incontents) {
         $o .= "<li><a href=\"$ic->{Href}\">$ic->{Title}</a></li>\n";
     }
     $o .= "</ul>\n";
-- 
2.20.1


