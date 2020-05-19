Return-Path: <SRS0=kHyn=7B=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9149AC433E1
	for <xen-devel@archiver.kernel.org>; Tue, 19 May 2020 19:03:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72351206C3
	for <xen-devel@archiver.kernel.org>; Tue, 19 May 2020 19:03:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72351206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb7WH-0004oo-7e; Tue, 19 May 2020 19:03:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+xc8=7B=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jb7WG-0004o4-7z
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 19:03:16 +0000
X-Inumbo-ID: 4dc93020-9a03-11ea-ae69-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::3])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4dc93020-9a03-11ea-ae69-bc764e2007e4;
 Tue, 19 May 2020 19:02:37 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jb7Vc-0001da-EC; Tue, 19 May 2020 20:02:36 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 08/38] ts-leak-check: Ignore buster's udevd too
Date: Tue, 19 May 2020 20:02:00 +0100
Message-Id: <20200519190230.29519-9-ian.jackson@eu.citrix.com>
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

For reasons I don't propose to investigate, on buster udevd shows up
like this:

  2019-11-26 18:13:48 Z LEAKED [process 2633 /lib/systemd/systemd-udevd] process: root      2633  1555  0 18:10 ?        00:00:00 /lib/systemd/systemd-udevd

This does not match our suppression.  Add an additional suppression.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 ts-leak-check | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ts-leak-check b/ts-leak-check
index 41e6245d..f3cca8aa 100755
--- a/ts-leak-check
+++ b/ts-leak-check
@@ -202,6 +202,7 @@ xenstore /vm
 xenstore /libxl
 
 process .* udevd
+process .* .*/systemd-udevd
 process .* /.+/systemd-shim
 
 file /var/run/xenstored/db
-- 
2.20.1


