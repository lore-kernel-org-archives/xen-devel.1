Return-Path: <SRS0=zJBp=LZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0CD4C11F69
	for <xen-devel@archiver.kernel.org>; Thu,  1 Jul 2021 14:11:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91943613B7
	for <xen-devel@archiver.kernel.org>; Thu,  1 Jul 2021 14:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91943613B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.148725.274983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxPl-0005wC-BE; Thu, 01 Jul 2021 14:11:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148725.274983; Thu, 01 Jul 2021 14:11:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxPl-0005vu-7S; Thu, 01 Jul 2021 14:11:37 +0000
Received: by outflank-mailman (input) for mailman id 148725;
 Thu, 01 Jul 2021 14:11:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXwC=LZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lyxPH-0005F9-KI
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:11:07 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1af898a2-da76-11eb-8328-12813bfff9fa;
 Thu, 01 Jul 2021 14:10:36 +0000 (UTC)
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
X-Inumbo-ID: 1af898a2-da76-11eb-8328-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625148635;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aeF7Kv7O4DhLszrRehfv9wqocK16xFjPyQnD/pOHJvE=;
  b=WL8qr6MQA+x8RdrBCE95NyrnzLnsiXABHSyLSZcVkr4ZyQVlbnW00MBj
   mr8GZpa4Y5hEhb3sckHQLmeChjfBdimVPZlqukINYTrlizr+HilQ3uvvH
   uckt1fprX5Mw8n2Wf9RMOIWBIudUQtCYf3DRyc/535Z+dPo6sKGW8OaEB
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: T+nZT/JsDbYrezwdPi3ALHuuwvixwOuxi/FNoer4yP4Pnaf60DhTs+1eP/80q+GMRH94ovSYSd
 c53NoQcvvGgP1cYWY7Gk9ZYtghKWbTT0Bz/w2BTBZHJHTssm5raqpAOmmFSjrZvDgECmdiD7q4
 CeooBiqXRxbHMni5y2ATcAQCcsvGo+dVnaEvhSuh4dzFHwZXD4zFQl2xJpnJsOWGNWCYUoOPDy
 C7UnsoBV5aomfgtaq9lkm53rQOnE7xwIHj4MnXGbKuVuiQq3D3NdY1toOIVbLqAox7BIYXlbWN
 QKw=
X-SBRS: 5.1
X-MesageID: 47384392
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:GxVxraBj3K7mmOjlHemq55DYdb4zR+YMi2TC1yhKJiC9Ffbo8P
 xG/c5rrCMc5wxxZJhNo7290ey7MBHhHP1OkO0s1NWZPDUO0VHAROoJ0WKh+UyEJ8SXzJ866U
 4KScZD4bPLYWSS9fyKgzWFLw==
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="47384392"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v6 12/31] build: use subdir-y in test/Makefile
Date: Thu, 1 Jul 2021 15:09:52 +0100
Message-ID: <20210701141011.785641-13-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210701141011.785641-1-anthony.perard@citrix.com>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This allows Makefile.clean to recurse into livepatch without help.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/test/Makefile | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/xen/test/Makefile b/xen/test/Makefile
index aaa499664396..41e4d7bdb78b 100644
--- a/xen/test/Makefile
+++ b/xen/test/Makefile
@@ -4,15 +4,10 @@ tests all: build
 
 ifneq ($(XEN_TARGET_ARCH),x86_32)
 # Xen 32-bit x86 hypervisor no longer supported, so has no test livepatches
-SUBDIRS += livepatch
+subdir-y += livepatch
 endif
 
 install build subtree-force-update uninstall: %:
-	set -e; for s in $(SUBDIRS); do \
+	set -e; for s in $(subdir-y); do \
 		$(MAKE) -f $(BASEDIR)/Rules.mk -C $$s $*; \
 	done
-
-clean::
-	set -e; for s in $(SUBDIRS); do \
-		$(MAKE) -f $(BASEDIR)/Rules.mk -C $$s $@; \
-	done
-- 
Anthony PERARD


