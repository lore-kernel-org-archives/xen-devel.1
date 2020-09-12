Return-Path: <SRS0=AwHt=CV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FF8CC10DAA
	for <xen-devel@archiver.kernel.org>; Sat, 12 Sep 2020 08:22:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA456214D8
	for <xen-devel@archiver.kernel.org>; Sat, 12 Sep 2020 08:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA456214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kH0mw-0007y8-5i; Sat, 12 Sep 2020 08:21:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ukTE=CV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kH0mu-0007y3-5S
 for xen-devel@lists.xenproject.org; Sat, 12 Sep 2020 08:21:36 +0000
X-Inumbo-ID: ae7c683e-2ed0-4cb0-b05f-d4a0eabf1c2b
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ae7c683e-2ed0-4cb0-b05f-d4a0eabf1c2b;
 Sat, 12 Sep 2020 08:21:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1C6E7AF69;
 Sat, 12 Sep 2020 08:21:50 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Subject: [PATCH v2] tools/libs/stat: fix broken build
Date: Sat, 12 Sep 2020 10:21:32 +0200
Message-Id: <20200912082132.21108-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Making getBridge() static triggered a build error with some gcc versions:

error: 'strncpy' output may be truncated copying 15 bytes from a string of
length 255 [-Werror=stringop-truncation]

Fix that by using a buffer with 256 bytes instead.

Fixes: 6d0ec053907794 ("tools: split libxenstat into new tools/libs/stat directory")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/stat/xenstat_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/stat/xenstat_linux.c b/tools/libs/stat/xenstat_linux.c
index 793263f2b6..4fee63e36d 100644
--- a/tools/libs/stat/xenstat_linux.c
+++ b/tools/libs/stat/xenstat_linux.c
@@ -264,7 +264,7 @@ int xenstat_collect_networks(xenstat_node * node)
 {
 	/* Helper variables for parseNetDevLine() function defined above */
 	int i;
-	char line[512] = { 0 }, iface[16] = { 0 }, devBridge[16] = { 0 }, devNoBridge[17] = { 0 };
+	char line[512] = { 0 }, iface[16] = { 0 }, devBridge[256] = { 0 }, devNoBridge[257] = { 0 };
 	unsigned long long rxBytes, rxPackets, rxErrs, rxDrops, txBytes, txPackets, txErrs, txDrops;
 
 	struct priv_data *priv = get_priv_data(node->handle);
-- 
2.26.2


