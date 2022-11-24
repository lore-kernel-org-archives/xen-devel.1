Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F26C4332F
	for <xen-devel@archiver.kernel.org>; Thu, 24 Nov 2022 02:51:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.447749.704359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oy2KO-0008VX-QH; Thu, 24 Nov 2022 02:51:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447749.704359; Thu, 24 Nov 2022 02:51:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oy2KO-0008VO-Lr; Thu, 24 Nov 2022 02:51:04 +0000
Received: by outflank-mailman (input) for mailman id 447749;
 Thu, 24 Nov 2022 02:51:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qARR=3Y=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oy2KN-0007dj-5c
 for xen-devel@lists.xenproject.org; Thu, 24 Nov 2022 02:51:03 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id d4f59c5e-6ba2-11ed-91b6-6bf2151ebd3b;
 Thu, 24 Nov 2022 03:51:02 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CCAF23A;
 Wed, 23 Nov 2022 18:51:08 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2C3C73F587;
 Wed, 23 Nov 2022 18:50:58 -0800 (PST)
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
X-Inumbo-ID: d4f59c5e-6ba2-11ed-91b6-6bf2151ebd3b
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Community Manager <community.manager@xenproject.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v5 3/3] CHANGELOG: Start new "unstable" section
Date: Thu, 24 Nov 2022 10:50:41 +0800
Message-Id: <20221124025041.1540079-4-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124025041.1540079-1-Henry.Wang@arm.com>
References: <20221124025041.1540079-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
v4 -> v5:
- Add Julien's Reviewed-by.
v3 -> v4:
- No change.
v2 -> v3:
- Take the opportunity to also adjust the 4.17 entry since this
  patch will be applied only after branching.
- Add 4.17 release date.
- Drop Julien's acked-by because of the content change.
v1 -> v2:
- Add Julien's Acked-by.
---
 CHANGELOG.md | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5d686a4258..c2bf26d524 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -4,7 +4,9 @@ Notable changes to Xen will be documented in this file.
 
 The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
-## [4.17.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging)
+## [unstable UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
+
+## [4.17.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.17.0) - 2022-12-??
 
 ### Changed
  - On x86 "vga=current" can now be used together with GrUB2's gfxpayload setting. Note that
-- 
2.25.1


