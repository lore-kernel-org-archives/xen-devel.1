Return-Path: <SRS0=9fiq=HS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2D3DC433E0
	for <xen-devel@archiver.kernel.org>; Tue, 16 Feb 2021 16:49:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8593C64E09
	for <xen-devel@archiver.kernel.org>; Tue, 16 Feb 2021 16:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8593C64E09
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.85962.160928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC3Wm-0005Gq-AA; Tue, 16 Feb 2021 16:48:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85962.160928; Tue, 16 Feb 2021 16:48:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC3Wm-0005Gj-5L; Tue, 16 Feb 2021 16:48:44 +0000
Received: by outflank-mailman (input) for mailman id 85962;
 Tue, 16 Feb 2021 16:48:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IlKa=HS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lC3Wk-0005Ge-Ti
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:48:43 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8353bae6-55be-4058-8f0c-8d6eb701fd7f;
 Tue, 16 Feb 2021 16:48:41 +0000 (UTC)
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
X-Inumbo-ID: 8353bae6-55be-4058-8f0c-8d6eb701fd7f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613494121;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=HWCoZ/WJgui/TOZPaunhOxHAHwsS6IwogKSNyRuE1MM=;
  b=U9QXR0D95B7FHPYJEgVXYLIknMY5eBvw2qf6HPU8fgNaKnx2s3lzyoKx
   91vc9WSmpenWQlWaFgZp5QIEUhm2bmtJ7RK8WmKNnwBSD85Kapv67VdGv
   WRfXnLld7AWFNpckekM30RADBztxBjpnuF2rpv7Hea0ONxXG5uTtHsEad
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Vu5xwLrJvSApH8hUwNswQFMM3cM8P1xVSKSRrVVgu6uFp5kKddaamlvAD0Ja9xdiCtuuTwjo+S
 /GqAkMC6L9qSbPCsTi+/Uy+rtWFrHj4I7rWZOGRiauEZ7x1NmxlVnTJIK6OAOKhZ6Xog/a9LtI
 zreVNWJsefFuDqqvQIDiXrolj6Hx2SANzXvLqeeZtSS+pEuDpgp5/1LcwnCpqy4Y/6OMIGR+AK
 YpIpxNFbIsmWZU+D5hr4hOScO8O43TS+Y/HfEdITYAMMiA1XkSaLpSPSv244PL3G0j026WCnk2
 3rY=
X-SBRS: 5.1
X-MesageID: 37281190
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,184,1610427600"; 
   d="scan'208";a="37281190"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 09/10] tools/libs: Add rule to generate headers.lst
Date: Tue, 16 Feb 2021 16:48:16 +0000
Message-ID: <20210216164816.27948-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210212153953.4582-10-andrew.cooper3@citrix.com>
References: <20210212153953.4582-10-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

abi-dumper needs a list of the public header files for shared objects, and
only accepts this in the form of a file.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Juergen Gross <jgross@suse.com>

v2:
 * Use set -e to avoid truncated content on transient errors
---
 tools/libs/.gitignore | 1 +
 tools/libs/libs.mk    | 9 ++++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)
 create mode 100644 tools/libs/.gitignore

diff --git a/tools/libs/.gitignore b/tools/libs/.gitignore
new file mode 100644
index 0000000000..4a13126144
--- /dev/null
+++ b/tools/libs/.gitignore
@@ -0,0 +1 @@
+*/headers.lst
diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index 0b3381755a..7970627ac8 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -76,6 +76,10 @@ endif
 
 headers.chk: $(AUTOINCS)
 
+headers.lst: FORCE
+	@{ set -e; $(foreach h,$(LIBHEADERS),echo $(h);) } > $@.tmp
+	@$(call move-if-changed,$@.tmp,$@)
+
 libxen$(LIBNAME).map:
 	echo 'VERS_$(MAJOR).$(MINOR) { global: *; };' >$@
 
@@ -118,9 +122,12 @@ TAGS:
 clean:
 	rm -rf *.rpm $(LIB) *~ $(DEPS_RM) $(LIB_OBJS) $(PIC_OBJS)
 	rm -f lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR) lib$(LIB_FILE_NAME).so.$(MAJOR)
-	rm -f headers.chk
+	rm -f headers.chk headers.lst
 	rm -f $(PKG_CONFIG)
 	rm -f _paths.h
 
 .PHONY: distclean
 distclean: clean
+
+.PHONY: FORCE
+FORCE:
-- 
2.11.0


