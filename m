Return-Path: <SRS0=Ri3b=7E=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF9EC433E0
	for <xen-devel@archiver.kernel.org>; Fri, 22 May 2020 16:13:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CAA42078D
	for <xen-devel@archiver.kernel.org>; Fri, 22 May 2020 16:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CAA42078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jcAIO-00065m-B0; Fri, 22 May 2020 16:13:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2cgu=7E=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jcAIM-00064q-Ui
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 16:13:14 +0000
X-Inumbo-ID: 216abf58-9c47-11ea-b9cf-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 216abf58-9c47-11ea-b9cf-bc764e2007e4;
 Fri, 22 May 2020 16:13:11 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: QCTX7pdxLRE62cejAiA0UeIvrskqgUuAcylRwpuAgvfZw2mdhem3bUqZTBVw3kIeQ34PcL54UV
 CC41qdZAe/c1TPCpzJOkVsJaU53QCWMFDJs6DlKOekAHGia5PvH7Oi48DuEia0PTI/ettFO3Cr
 qgXj/yp+Pi5jHyUf+zOiFenC0HKkB8oq5b+n9X2OvZ3TNANxwJLUQgQNKheV3czVPljI9Ajrkl
 6xPOqeNFkxhqzHjPh4e2y8Ura0nIj/mRCg6tPfZ7aLLU0HSZPZZoJsqDYje/rpFYEKQOVswPHj
 Be0=
X-SBRS: 2.7
X-MesageID: 18476572
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,422,1583211600"; d="scan'208";a="18476572"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH 2/5] golang: Add a variable for the libxl source directory
Date: Fri, 22 May 2020 17:12:37 +0100
Message-ID: <20200522161240.3748320-3-george.dunlap@citrix.com>
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
 Ian Jackson <ian.jackson@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

...rather than duplicating the path in several places.

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
CC: Ian Jackson <ian.jackson@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/golang/xenlight/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/golang/xenlight/Makefile b/tools/golang/xenlight/Makefile
index 37ed1358c4..cd0a62505f 100644
--- a/tools/golang/xenlight/Makefile
+++ b/tools/golang/xenlight/Makefile
@@ -9,6 +9,8 @@ GOXL_INSTALL_DIR = $(GOCODE_DIR)$(GOXL_PKG_DIR)
 
 GO ?= go
 
+LIBXL_SRC_DIR = ../../libxl
+
 .PHONY: all
 all: build
 
@@ -21,8 +23,8 @@ $(XEN_GOPATH)/src/$(XEN_GOCODE_URL)/xenlight/: xenlight.go types.gen.go helpers.
 	$(INSTALL_DATA) types.gen.go $(XEN_GOPATH)$(GOXL_PKG_DIR)
 	$(INSTALL_DATA) helpers.gen.go $(XEN_GOPATH)$(GOXL_PKG_DIR)
 
-%.gen.go: gengotypes.py $(XEN_ROOT)/tools/libxl/libxl_types.idl $(XEN_ROOT)/tools/libxl/idl.py
-	XEN_ROOT=$(XEN_ROOT) $(PYTHON) gengotypes.py ../../libxl/libxl_types.idl
+%.gen.go: gengotypes.py $(LIBXL_SRC_DIR)/libxl_types.idl $(LIBXL_SRC_DIR)/idl.py
+	XEN_ROOT=$(XEN_ROOT) $(PYTHON) gengotypes.py $(LIBXL_SRC_DIR)/libxl_types.idl
 
 # Go will do its own dependency checking, and not actuall go through
 # with the build if none of the input files have changed.
-- 
2.25.1


