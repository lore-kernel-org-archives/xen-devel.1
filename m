Return-Path: <SRS0=3Mnr=7R=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5165BC433DF
	for <xen-devel@archiver.kernel.org>; Thu,  4 Jun 2020 12:45:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C3AE2064C
	for <xen-devel@archiver.kernel.org>; Thu,  4 Jun 2020 12:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C3AE2064C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgpFN-0005c6-L8; Thu, 04 Jun 2020 12:45:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IlcT=7R=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jgpFM-0005bg-Bn
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 12:45:24 +0000
X-Inumbo-ID: 3745003a-a661-11ea-9947-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3745003a-a661-11ea-9947-bc764e2007e4;
 Thu, 04 Jun 2020 12:45:06 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jgpF3-0006vr-Bn; Thu, 04 Jun 2020 13:45:05 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 4/4] cs-bisection-step: Do not needlessly repro on tip
Date: Thu,  4 Jun 2020 13:44:59 +0100
Message-Id: <20200604124459.18453-5-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200604124459.18453-1-ian.jackson@eu.citrix.com>
References: <20200604124459.18453-1-ian.jackson@eu.citrix.com>
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

If we were halfway through bisecting, we treat the incident failure as
the basis failure.  But our previous bisection results can count as
indications that things are really failing - we don't need to repro on
the very final commit.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 cs-bisection-step | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/cs-bisection-step b/cs-bisection-step
index bc6fb794..9a0fee39 100755
--- a/cs-bisection-step
+++ b/cs-bisection-step
@@ -873,7 +873,8 @@ sub search () {
         need_repro_sequence(2, sub {
             my ($repro_count, $is_last_repro) = @_;
             need_repro('pass', $nodes{"@basispass_rtuple"}, "basis pass") ||
-            need_repro('fail', $nodes{"@latest_rtuple"},    "basis failure");
+            need_repro('fail', $nodes{"@latest_rtuple"}, "basis failure",
+		       !$is_last_repro);
         });
 
     foreach my $startfail (@failures) {
-- 
2.20.1


