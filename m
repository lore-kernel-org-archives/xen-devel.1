Return-Path: <SRS0=B7KG=DO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 832A9C41604
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 18:28:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6E042168B
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 18:28:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6E042168B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.3739.11214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQEAu-0005Rm-Ps; Wed, 07 Oct 2020 18:28:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3739.11214; Wed, 07 Oct 2020 18:28:28 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQEAu-0005R2-2x; Wed, 07 Oct 2020 18:28:28 +0000
Received: by outflank-mailman (input) for mailman id 3739;
 Wed, 07 Oct 2020 18:28:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE3y-00072Q-KE
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:21:18 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 086ee261-506d-4c6b-b4bd-b2f9e49e314b;
 Wed, 07 Oct 2020 18:20:03 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDk5-0007CF-LX; Wed, 07 Oct 2020 19:00:45 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE3y-00072Q-KE
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:21:18 +0000
X-Inumbo-ID: 086ee261-506d-4c6b-b4bd-b2f9e49e314b
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 086ee261-506d-4c6b-b4bd-b2f9e49e314b;
	Wed, 07 Oct 2020 18:20:03 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDk5-0007CF-LX; Wed, 07 Oct 2020 19:00:45 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 49/82] host reuse: sg-run-job: per-host prep: Use @ for per-host-ts
Date: Wed,  7 Oct 2020 18:59:51 +0100
Message-Id: <20201007180024.7932-50-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

These are the steps that will be skipped when we reuse a test host.

No functional change yet since we don't allocate the host shared yet.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-run-job | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sg-run-job b/sg-run-job
index 0b2e20e7..af43008d 100755
--- a/sg-run-job
+++ b/sg-run-job
@@ -25,9 +25,9 @@ readconfig
 source-method JobDB
 
 proc per-host-prep {} {
-    per-host-ts .       host-ping-check-native/@ ts-host-ping-check
-    per-host-ts .       xen-install/@     ts-xen-install
-    per-host-ts .       xen-boot/@        ts-host-reboot
+    per-host-ts @.      host-ping-check-native/@ ts-host-ping-check
+    per-host-ts @.      xen-install/@     ts-xen-install
+    per-host-ts @.      xen-boot/@        ts-host-reboot
 
     per-host-ts .       host-ping-check-xen/@ ts-host-ping-check
     per-host-ts .       =(*)            { ts-leak-check basis }
-- 
2.20.1


