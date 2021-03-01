Return-Path: <SRS0=TTqk=H7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7701C433E0
	for <xen-devel@archiver.kernel.org>; Mon,  1 Mar 2021 17:01:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58C3A64FE2
	for <xen-devel@archiver.kernel.org>; Mon,  1 Mar 2021 17:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58C3A64FE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.91805.173230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGlv7-00069K-Rd; Mon, 01 Mar 2021 17:01:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91805.173230; Mon, 01 Mar 2021 17:01:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGlv7-00069C-OA; Mon, 01 Mar 2021 17:01:21 +0000
Received: by outflank-mailman (input) for mailman id 91805;
 Mon, 01 Mar 2021 17:01:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ju5b=H7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lGlv6-00062i-Bv
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:01:20 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2756f48d-8e71-41c6-9676-8669975f102a;
 Mon, 01 Mar 2021 17:01:14 +0000 (UTC)
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
X-Inumbo-ID: 2756f48d-8e71-41c6-9676-8669975f102a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614618073;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=FjUnGPVEAyWud86DM21udaJ75FfBw2ymxYDma8YblGY=;
  b=Gk1B5LmGOsbeKAVMilN6Cjwy2dNGND2l2eRU8SVwyaFOKKGkFIl5wykU
   36y0RwDwqkyVq/g3/9ovzyvMsUUK20y7VSxUG5GH0cl4w2GjWGyzJhNBk
   hGjfe7pMDec83xX1AGNqn+O7c/du9ep6OfR0SiE1hlH6q5+xEFOQR9XUF
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: k1jckH8qiAXyMvWlee/mBx99CGcwRw0gaUEDd8Drr9NkOz39+Nw/7Jyxtf1EMdLhpGyCvusVMA
 kGiW2XYgvp4D1cJaBC8v41TrFPJmxEZ/gNH4h7Ge1q4ZIacV+XZqJDxX2eAZxYxigEx1UKeVvD
 QyYgR6Ydn5cCvVUjXXkFrUGAfmIpPoEYgY1Khdsx69Hg9C9WSj0Jpaj8O+/KMeYOl7RFayXPM+
 tAidUuS1aKD2fKCg4X8MVHUvZ7qtwFC0wjeECE29TKu79npVl9G0jipyxwAZkv3644hHZR8BzQ
 OWM=
X-SBRS: 5.2
X-MesageID: 38182446
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,215,1610427600"; 
   d="scan'208";a="38182446"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [PATCH 3/3] tools/libs: Check ABI # DO NOT APPLY YET
Date: Mon, 1 Mar 2021 17:00:44 +0000
Message-ID: <20210301170044.23295-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210301170044.23295-1-andrew.cooper3@citrix.com>
References: <20210301170044.23295-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Juergen Gross <jgross@suse.com>
---
 tools/libs/.gitignore |  2 ++
 tools/libs/libs.mk    | 15 +++++++++++----
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/tools/libs/.gitignore b/tools/libs/.gitignore
index 4a13126144..655f46a6e8 100644
--- a/tools/libs/.gitignore
+++ b/tools/libs/.gitignore
@@ -1 +1,3 @@
+*/abi.chk
+*/compat_reports/
 */headers.lst
diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index a68cec244c..c12e779e63 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -96,12 +96,19 @@ lib$(LIB_FILE_NAME).so.$(MAJOR): lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR)
 lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR): $(PIC_OBJS) libxen$(LIBNAME).map
 	$(CC) $(LDFLAGS) $(PTHREAD_LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,lib$(LIB_FILE_NAME).so.$(MAJOR) $(SHLIB_LDFLAGS) -o $@ $(PIC_OBJS) $(LDUSELIBS) $(APPEND_LDFLAGS)
 
-# If abi-dumper is available, write out the ABI analysis
-ifneq ($(ABI_DUMPER),)
-libs: $(PKG_ABI)
 $(PKG_ABI): lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR) headers.lst
 	$(ABI_DUMPER) $< -o $@ -public-headers headers.lst -lver $(MAJOR).$(MINOR)
+
+abi.chk: $(PKG_OLD_ABI) $(PKG_ABI)
+	$(ABI_COMPLIANCE_CHECKER) -l lib$(LIB_FILE_NAME) -old $(PKG_OLD_ABI) -new $(PKG_ABI)
+	touch $@
+
+ifneq ($(ABI_COMPLIANCE_CHECKER),)
+ifeq ($(debug_symbols),y)
+libs: abi.chk
 endif
+endif
+
 
 .PHONY: install
 install: build
@@ -131,7 +138,7 @@ TAGS:
 clean:
 	rm -rf *.rpm $(LIB) *~ $(DEPS_RM) $(LIB_OBJS) $(PIC_OBJS)
 	rm -f lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR) lib$(LIB_FILE_NAME).so.$(MAJOR)
-	rm -f headers.chk headers.lst
+	rm -f headers.chk headers.lst abi.chk
 	rm -f $(PKG_CONFIG)
 	rm -f _paths.h
 
-- 
2.11.0


