Return-Path: <SRS0=cIP9=CB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5BFCC433E5
	for <xen-devel@archiver.kernel.org>; Sun, 23 Aug 2020 09:35:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9368220768
	for <xen-devel@archiver.kernel.org>; Sun, 23 Aug 2020 09:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9368220768
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9mPV-0004vW-D0; Sun, 23 Aug 2020 09:35:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kEn0=CB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k9mPT-0004t9-Ri
 for xen-devel@lists.xenproject.org; Sun, 23 Aug 2020 09:35:31 +0000
X-Inumbo-ID: 7dc5b9e7-29de-43ca-b90f-ee05f966f50a
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7dc5b9e7-29de-43ca-b90f-ee05f966f50a;
 Sun, 23 Aug 2020 09:35:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9F9AAAD3C;
 Sun, 23 Aug 2020 09:35:52 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: [PATCH v3 04/38] tools: don't call make recursively from libs.mk
Date: Sun, 23 Aug 2020 11:34:45 +0200
Message-Id: <20200823093519.18386-5-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200823093519.18386-1-jgross@suse.com>
References: <20200823093519.18386-1-jgross@suse.com>
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

During build of a xen library make is called again via libs.mk. This is
not necessary as the same can be achieved by a simple dependency.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 tools/libs/libs.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index 8045c00e9a..764f5441e2 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -45,8 +45,7 @@ $(PKG_CONFIG_LOCAL): PKG_CONFIG_LIBDIR = $(CURDIR)
 all: build
 
 .PHONY: build
-build:
-	$(MAKE) libs
+build: libs
 
 .PHONY: libs
 libs: headers.chk $(LIB) $(PKG_CONFIG_INST) $(PKG_CONFIG_LOCAL)
-- 
2.26.2


