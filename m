Return-Path: <SRS0=BMa3=HO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UPPERCASE_50_75,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE422C433DB
	for <xen-devel@archiver.kernel.org>; Fri, 12 Feb 2021 18:02:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B2B064DBA
	for <xen-devel@archiver.kernel.org>; Fri, 12 Feb 2021 18:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B2B064DBA
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.84407.158296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAcll-0007ym-LI; Fri, 12 Feb 2021 18:02:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84407.158296; Fri, 12 Feb 2021 18:02:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAcll-0007yf-HN; Fri, 12 Feb 2021 18:02:17 +0000
Received: by outflank-mailman (input) for mailman id 84407;
 Fri, 12 Feb 2021 18:02:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o46S=HO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lAclk-0007ya-Nm
 for xen-devel@lists.xenproject.org; Fri, 12 Feb 2021 18:02:16 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 37b347a6-ba12-4c97-9bee-4f83c9989f03;
 Fri, 12 Feb 2021 18:02:14 +0000 (UTC)
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
X-Inumbo-ID: 37b347a6-ba12-4c97-9bee-4f83c9989f03
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613152934;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=jPG4MEbtuunoyNDu7GuAbGxANDQvxig1cec2/Yjf4ZA=;
  b=JMglDUzUp5VFEKoz80mnk1myCC8Jf5OJteEhKvRk0Um9HsXjyIzgBp6b
   Zm/Z8Yll3EVa3B/2CJCJ8AKqpXB5pMmuCp/PNjUxoNQcPHEt05rcP5h33
   H31VHfTyV73wda0++adT6UxHzqJyDbyCD+wwx+y0oW6KYpglgv3DQE1IO
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: qXwvS7ETl5dTnO3owjy4p1Rx9r95Gyc4KyttyFm0G+AwtCB8byxjDBFjtTpBLXEhAl4T5XKg6Y
 CDJMJl0g22J9VYA++fjPIxz2Kh/4bpbnuCmT80/aU0s8OoKkikvH8wmbG8GVFNEqkpcaB0FUI/
 qc0073opEKtxojGdGN5tCPiIRF5nyt+Zq4Hm0QmR4HOxgd+kKOzGChXHueuGFEmqQFXaq1vOK9
 gXl+a/JOTW9gSx4bATc+05PK3cDvXPvx4WtXqnHmby3mkR2HIxkkIaoW8PZqFTUwseOJW5xVLy
 ihk=
X-SBRS: 5.2
X-MesageID: 37530461
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,174,1610427600"; 
   d="scan'208";a="37530461"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v1.1 10/10] tools/libs: Write out an ABI analysis when abi-dumper is available
Date: Fri, 12 Feb 2021 18:01:43 +0000
Message-ID: <20210212180143.22477-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210212153953.4582-11-andrew.cooper3@citrix.com>
References: <20210212153953.4582-11-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Juergen Gross <jgross@suse.com>

v2:
 * Swap XEN_COMPILE_ARCH for XEN_TARGET_ARCH
 * Swap abi-dumper for $(ABI_DUMPER)
---
 tools/libs/libs.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index ac68996ab2..a82d1783cc 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -49,6 +49,8 @@ PKG_CONFIG_LOCAL := $(PKG_CONFIG_DIR)/$(PKG_CONFIG)
 LIBHEADER ?= $(LIB_FILE_NAME).h
 LIBHEADERS = $(foreach h, $(LIBHEADER), $(XEN_INCLUDE)/$(h))
 
+PKG_ABI := lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR)-$(XEN_TARGET_ARCH)-abi.dump
+
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_PREFIX = $(XEN_ROOT)
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_INCLUDE)
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_LIBDIR = $(CURDIR)
@@ -94,6 +96,13 @@ lib$(LIB_FILE_NAME).so.$(MAJOR): lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR)
 lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR): $(PIC_OBJS) libxen$(LIBNAME).map
 	$(CC) $(LDFLAGS) $(PTHREAD_LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,lib$(LIB_FILE_NAME).so.$(MAJOR) $(SHLIB_LDFLAGS) -o $@ $(PIC_OBJS) $(LDUSELIBS) $(APPEND_LDFLAGS)
 
+# If abi-dumper is available, write out the ABI analysis
+ifneq ($(ABI_DUMPER),)
+libs: $(PKG_ABI)
+$(PKG_ABI): lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR) headers.lst
+	$(ABI_DUMPER) $< -o $@ -public-headers headers.lst -lver $(MAJOR).$(MINOR)
+endif
+
 .PHONY: install
 install: build
 	$(INSTALL_DIR) $(DESTDIR)$(libdir)
-- 
2.11.0


