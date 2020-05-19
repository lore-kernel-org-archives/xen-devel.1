Return-Path: <SRS0=kHyn=7B=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A19C433DF
	for <xen-devel@archiver.kernel.org>; Tue, 19 May 2020 19:02:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B182206C3
	for <xen-devel@archiver.kernel.org>; Tue, 19 May 2020 19:02:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B182206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb7Ve-0004Yk-1c; Tue, 19 May 2020 19:02:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+xc8=7B=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jb7Vc-0004Yf-6a
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 19:02:36 +0000
X-Inumbo-ID: 4ccb2c46-9a03-11ea-b07b-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::3])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ccb2c46-9a03-11ea-b07b-bc764e2007e4;
 Tue, 19 May 2020 19:02:35 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jb7Va-0001da-Qf; Tue, 19 May 2020 20:02:34 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 01/38] ts-logs-capture: Cope if xl shutdown leaves
 domain running for a bit
Date: Tue, 19 May 2020 20:01:53 +0100
Message-Id: <20200519190230.29519-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200519190230.29519-1-ian.jackson@eu.citrix.com>
References: <20200519190230.29519-1-ian.jackson@eu.citrix.com>
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

This seems mostly to affect buster but it could in principle affect
earlier releases too I think.

In principle it would be nice to fix this bug, and to have a proper
test for it, but a reliable test is hard and an unreliable one is not
useful.  So I guess we are going to have this workaround
indefinitely...

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 ts-logs-capture | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ts-logs-capture b/ts-logs-capture
index 0320a5a5..d75a2fda 100755
--- a/ts-logs-capture
+++ b/ts-logs-capture
@@ -272,6 +272,7 @@ sub shutdown_guests () {
 		( xl shutdown -a -F -w ; echo y ) &
 	    ) | (
 		read x
+		sleep 10 # xl shutdown is a bit racy :-/
 		xl list | awk '!/^Domain-0 |^Name / {print $2}' \
 		| xargs -t -r -n1 xl destroy ||:
 	    )
-- 
2.20.1


