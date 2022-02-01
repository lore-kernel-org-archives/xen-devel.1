Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AF4C433F5
	for <xen-devel@archiver.kernel.org>; Tue,  1 Feb 2022 17:04:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.263699.456521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEwZD-0005vD-TQ; Tue, 01 Feb 2022 17:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263699.456521; Tue, 01 Feb 2022 17:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEwZD-0005v6-QT; Tue, 01 Feb 2022 17:03:43 +0000
Received: by outflank-mailman (input) for mailman id 263699;
 Tue, 01 Feb 2022 17:03:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wubh=SQ=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nEwZC-0005v0-CG
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 17:03:42 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id e784beee-8380-11ec-8eb8-a37418f5ba1a;
 Tue, 01 Feb 2022 18:03:41 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15C026D;
 Tue,  1 Feb 2022 09:03:40 -0800 (PST)
Received: from e123311-lin.arm.com (unknown [10.57.1.119])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C7A23F40C;
 Tue,  1 Feb 2022 09:03:39 -0800 (PST)
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
X-Inumbo-ID: e784beee-8380-11ec-8eb8-a37418f5ba1a
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/configure.ac: Replace macro AC_HELP_STRING
Date: Tue,  1 Feb 2022 18:03:21 +0100
Message-Id: <20220201170321.32510-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

... with AS_HELP_STRING as the former is obsolete according
to GNU autoconf 2.67 documentation.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 tools/configure.ac | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/configure.ac b/tools/configure.ac
index 5a4fb9022d..f29c319b42 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -215,7 +215,7 @@ AC_SUBST(qemu_xen_path)
 AC_SUBST(qemu_xen_systemd)
 
 AC_ARG_WITH([stubdom-qmp-proxy],
-    AC_HELP_STRING([--stubdom-qmp-proxy@<:@=PATH@:>@],
+    AS_HELP_STRING([--stubdom-qmp-proxy@<:@=PATH@:>@],
         [Use supplied binary PATH as a QMP proxy into stubdomain]),[
     stubdom_qmp_proxy="$withval"
 ],[
-- 
2.29.0


