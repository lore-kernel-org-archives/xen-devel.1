Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3474BEC1EA2
	for <xen-devel@archiver.kernel.org>; Thu,  5 Feb 2026 11:34:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1221768.1529906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnxcF-0003fD-Vm; Thu, 05 Feb 2026 11:33:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221768.1529906; Thu, 05 Feb 2026 11:33:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnxcF-0003f6-S5; Thu, 05 Feb 2026 11:33:43 +0000
Received: by outflank-mailman (input) for mailman id 1221768;
 Thu, 05 Feb 2026 11:33:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BdQL=AJ=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vnxcE-0003et-Cr
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 11:33:42 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 83fc179f-0286-11f1-b161-2bf370ae4941;
 Thu, 05 Feb 2026 12:33:39 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F322E339;
 Thu,  5 Feb 2026 03:33:31 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.53.248])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A11213F7D8;
 Thu,  5 Feb 2026 03:33:36 -0800 (PST)
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
X-Inumbo-ID: 83fc179f-0286-11f1-b161-2bf370ae4941
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1] xen: Use MFLAGS for silent-mode detection
Date: Thu,  5 Feb 2026 12:33:12 +0100
Message-ID: <3ab39249c788fd0463e73df9464d482fefe8516b.1770290975.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

GNU make 4.4+ exposes variable overrides in MAKEFLAGS after "--" (e.g.
O=/path, FOO=bar). The silent-mode check searches for "s" and can match
an override value, forcing silent output even without -s.

Use MFLAGS for short options and filter out any long options before
searching for "s". This preserves -s detection while avoiding false
positives from overrides.

Fixes: 4fdb4b71b152 ("xen/build: introduce if_changed and if_changed_rule")

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/Makefile | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index 13e336ba5484..5fc725fb02db 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -113,10 +113,11 @@ else
     Q := @
 endif
 
-# If the user is running make -s (silent mode), suppress echoing of
-# commands
-
-ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
+# If the user is running make -s (silent mode), suppress echoing of commands.
+# Use MFLAGS (short options only). MAKEFLAGS may include variable overrides
+# after “--” (GNU make greater than 4.4), which can contain an “s” and falsely
+# trigger silent mode.
+ifneq ($(findstring s,$(filter-out --%,$(MFLAGS))),)
     quiet := silent_
 endif
 
-- 
2.52.0


