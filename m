Return-Path: <SRS0=/2oJ=GW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D6B6C433DB
	for <xen-devel@archiver.kernel.org>; Tue, 19 Jan 2021 11:18:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE2A82311C
	for <xen-devel@archiver.kernel.org>; Tue, 19 Jan 2021 11:18:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE2A82311C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.70274.126072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1p1p-0003WT-6S; Tue, 19 Jan 2021 11:18:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70274.126072; Tue, 19 Jan 2021 11:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1p1p-0003WM-3L; Tue, 19 Jan 2021 11:18:29 +0000
Received: by outflank-mailman (input) for mailman id 70274;
 Tue, 19 Jan 2021 11:18:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d268=GW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l1p1n-0003WG-3g
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 11:18:27 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4c52a7d8-42a3-4a3c-b97a-63ad2c66ec7b;
 Tue, 19 Jan 2021 11:18:26 +0000 (UTC)
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
X-Inumbo-ID: 4c52a7d8-42a3-4a3c-b97a-63ad2c66ec7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611055106;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WVyRXRyDmoQ1fs1F8zXZrojE0+40ErdN2mVWfMq0NTw=;
  b=ZHTYy1um5ny8CTmPo8iW0+JF08IigTAarpcMf0e3k8P0IFwnk/mcnv9C
   mQmKKoa5BXI1ZNHtTGGmMbqUO6UyGKeMVaJ5rIQ6nBRz6M13JGun2hI7m
   qbcHnzWFLdhBwbO3RiNLjWeCBh4WempfBRswL051KFz++yHTHRD/PzPBJ
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: loBzdUKdIiUmn1LOFqjmTmkms5VSOwcZatdW+WL95pybupjJp7ToNSL9ZmhVJiT4brsAVgj8rr
 wGDEqE4tZoHh/Al1CU2DB+2LyOnVtYvqbrVjLVlGmfO/3WkhHVgDFwDWLQe5fwA/vKi4+MKg7F
 PoSWQWjWNCWSpMLmJQou+XQfwPsfNYgIzIw6/F8Y77xNwUooNKcsux2q3jDsTh2TS1gZRLuU3m
 m/mYbHbNYkmZKnKTwBu6SWQCR+EudFLPf2eB6WO1OsLLlXz+K5dEFLoy6BqQZKqhhsfHdIB6S/
 VIs=
X-SBRS: 5.1
X-MesageID: 35575485
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,358,1602561600"; 
   d="scan'208";a="35575485"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/gnttab: Log when grant_table_init() fails
Date: Tue, 19 Jan 2021 11:18:05 +0000
Message-ID: <20210119111805.18295-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

... so debug builds can see what went wrong, rather than getting an
unqualified -EINVAL out domain creation.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
---
 xen/common/grant_table.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index b31d404579..cbdd6e2f4e 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -1920,7 +1920,11 @@ int grant_table_init(struct domain *d, int max_grant_frames,
     if ( max_grant_frames < INITIAL_NR_GRANT_FRAMES ||
          max_grant_frames > opt_max_grant_frames ||
          max_maptrack_frames > opt_max_maptrack_frames )
+    {
+        dprintk(XENLOG_INFO, "Bad grant table sizes: grant %u, maptrack %u\n",
+                max_grant_frames, max_maptrack_frames);
         return -EINVAL;
+    }
 
     if ( (gt = xzalloc(struct grant_table)) == NULL )
         return -ENOMEM;
-- 
2.11.0


