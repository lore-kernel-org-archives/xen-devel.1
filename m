Return-Path: <SRS0=Ri3b=7E=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E11C433E2
	for <xen-devel@archiver.kernel.org>; Fri, 22 May 2020 16:13:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94114207F9
	for <xen-devel@archiver.kernel.org>; Fri, 22 May 2020 16:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94114207F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jcAIC-00062y-WB; Fri, 22 May 2020 16:13:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2cgu=7E=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jcAIC-00062s-0V
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 16:13:04 +0000
X-Inumbo-ID: 1c853447-9c47-11ea-abf6-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c853447-9c47-11ea-abf6-12813bfff9fa;
 Fri, 22 May 2020 16:13:02 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: KkaoinM9/gs5S/yJZ56rjkJY/pe8/WowyyXkJncXmN4y0QC5OF7G1CWrKU+ZOsmBOMQlV9ceUJ
 uoweMJ/cOPDmMxN/30QtE5MSpe2LSz1uLJcD17JXFm/fiZrmi4vcAbkwxL5fiRItJO5cE2If2i
 yhsXdoj3YZrJxSIaOIJRXdMBsUiwXMQK7WTwlvWmPx1Ny866FhJNDxNPf1HSk3T6dihUkdZ07z
 rJyrUu2/cgluUg59wO9ZhrCfj5mMOB6cpwLUpn3E1GKU7Kgiu8tCzWB1tgFGZT3xqjdQ+dxzFL
 3XE=
X-SBRS: 2.7
X-MesageID: 18915172
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,422,1583211600"; d="scan'208";a="18915172"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH 1/5] golang: Add a minimum go version to go.mod
Date: Fri, 22 May 2020 17:12:36 +0100
Message-ID: <20200522161240.3748320-2-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200522161240.3748320-1-george.dunlap@citrix.com>
References: <20200522161240.3748320-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 George Dunlap <george.dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

`go build` wants to add the current go version to go.mod as the
minimum every time we run `make` in the directory.  Add 1.11 (the
earliest Go version that supports modules) there to make it happy.

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
CC: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/golang/xenlight/go.mod | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/golang/xenlight/go.mod b/tools/golang/xenlight/go.mod
index 926474d929..7dfbd758d1 100644
--- a/tools/golang/xenlight/go.mod
+++ b/tools/golang/xenlight/go.mod
@@ -1 +1,3 @@
 module xenbits.xenproject.org/git-http/xen.git/tools/golang/xenlight
+
+go 1.11
-- 
2.25.1


