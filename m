Return-Path: <SRS0=BMa3=HO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61BA6C433DB
	for <xen-devel@archiver.kernel.org>; Fri, 12 Feb 2021 15:40:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D23064DFF
	for <xen-devel@archiver.kernel.org>; Fri, 12 Feb 2021 15:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D23064DFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.84309.158062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAaYa-0000rW-Dn; Fri, 12 Feb 2021 15:40:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84309.158062; Fri, 12 Feb 2021 15:40:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAaYa-0000rN-9l; Fri, 12 Feb 2021 15:40:32 +0000
Received: by outflank-mailman (input) for mailman id 84309;
 Fri, 12 Feb 2021 15:40:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o46S=HO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lAaYY-0000ix-O2
 for xen-devel@lists.xenproject.org; Fri, 12 Feb 2021 15:40:30 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b53a4ed4-952e-4bde-aa3e-303df37baa6d;
 Fri, 12 Feb 2021 15:40:16 +0000 (UTC)
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
X-Inumbo-ID: b53a4ed4-952e-4bde-aa3e-303df37baa6d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613144416;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=THEW0Vd+o8+5NNZotQAfhag3Lg3d+kZffhIX6B7tke8=;
  b=M3SFRRzPFVN3UbIedZ6vE/toxx2jRMFqDrxjXKPppSUZM88OIDw+aNeh
   LsZnCJngO53TjpDiSp3vkD4YOtULBiBvlwJNOPkb2qNdmAhELiQFIwafA
   oOyEHlDBaq8z4BtL3PB9hi+A9Im3T6U72ameDN/ZCpymNvI3SXFM54Cii
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 6Fw2KaezQaX/2xsw/xTG3V/cEq3H06/GILUVL4Y3NEK8P+ifbKijqr9FjN+/AIxZbV19l1Foc0
 li4F9FqP2dlWBqgmjJkF7KiuLPTCRnOgXq7WTZ+pqtPBfkQ8gKYMumEST+xKSCHPokhEe2qLsN
 dQW70Ec2AFsvezMup9xPwZw/THN//JMfLN/oJSP16nuZ1HcYj6CDdmeKim3GYNV5MkCYiDW7M3
 Caa+K5RSzxr5qTNo32reNxfMf9L34HCUOAf1KCEef0pxUNhdNY8oGc6dKqiXvIGH7LhpYHRwni
 fpY=
X-SBRS: 5.2
X-MesageID: 37085875
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,174,1610427600"; 
   d="scan'208";a="37085875"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [PATCH 07/10] tools: Use -Og for debug builds when available
Date: Fri, 12 Feb 2021 15:39:50 +0000
Message-ID: <20210212153953.4582-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210212153953.4582-1-andrew.cooper3@citrix.com>
References: <20210212153953.4582-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

The recommended optimisation level for debugging is -Og, and is what tools
such as gdb prefer.  In practice, it equates to -01 with a few specific
optimisations turned off.

abi-dumper in particular wants the libraries it inspects in this form.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Juergen Gross <jgross@suse.com>
---
 tools/Rules.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/Rules.mk b/tools/Rules.mk
index f61da81f4a..2907ed2d39 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -106,8 +106,9 @@ endif
 CFLAGS_libxenlight += $(CFLAGS_libxenctrl)
 
 ifeq ($(debug),y)
-# Disable optimizations
-CFLAGS += -O0 -fno-omit-frame-pointer
+# Use -Og if available, -O0 otherwise
+dbg_opt_level := $(call cc-option,$(CC),-Og,-O0)
+CFLAGS += $(dbg_opt_level) -fno-omit-frame-pointer
 # But allow an override to -O0 in case Python enforces -D_FORTIFY_SOURCE=<n>.
 PY_CFLAGS += $(PY_NOOPT_CFLAGS)
 else
-- 
2.11.0


