Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A6AC6FD1F
	for <xen-devel@archiver.kernel.org>; Wed, 22 Mar 2023 13:58:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.513475.794518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peyyo-00045S-8u; Wed, 22 Mar 2023 13:58:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513475.794518; Wed, 22 Mar 2023 13:58:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peyyo-00045L-6B; Wed, 22 Mar 2023 13:58:18 +0000
Received: by outflank-mailman (input) for mailman id 513475;
 Wed, 22 Mar 2023 13:58:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TbkX=7O=arm.com=peter.hoyes@srs-se1.protection.inumbo.net>)
 id 1peyym-00045F-Ey
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 13:58:16 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 961de917-c8b9-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 14:58:13 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBAE64B3;
 Wed, 22 Mar 2023 06:58:56 -0700 (PDT)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.64])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E652B3F71E;
 Wed, 22 Mar 2023 06:58:11 -0700 (PDT)
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
X-Inumbo-ID: 961de917-c8b9-11ed-b464-930f4c7d94ae
From: Peter Hoyes <peter.hoyes@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	bertrand.marquis@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/xendomains: Only save/restore/migrate if supported by xenlight
Date: Wed, 22 Mar 2023 13:58:00 +0000
Message-Id: <20230322135800.3869458-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Hoyes <Peter.Hoyes@arm.com>

Saving, restoring and migrating domains are not currently supported on
arm and arm64 platforms, so xendomains prints the warning:

  An error occurred while saving domain:
  command not implemented

when attempting to run `xendomains stop`. It otherwise continues to shut
down the domains cleanly, with the unsupported steps skipped.

Use `xl help` to detect whether save/restore/migrate is supported by the
platform. If not, do not attempt to run the corresponding command.

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
---
 tools/hotplug/Linux/xendomains.in | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/tools/hotplug/Linux/xendomains.in b/tools/hotplug/Linux/xendomains.in
index 70f4129ef4..bafcb874e1 100644
--- a/tools/hotplug/Linux/xendomains.in
+++ b/tools/hotplug/Linux/xendomains.in
@@ -229,6 +229,15 @@ parseln()
     [ -n "$name" -a -n "$id" ] && return 0 || return 1
 }
 
+subcmd_supported()
+{
+    local output
+    output=$("$CMD help | grep "^ $1"")
+    if [ ! "$output" ]; then
+        return 1
+    fi
+}
+
 is_running()
 {
     get_xsdomid
@@ -260,7 +269,8 @@ start()
 
     saved_domains=" "
     if [ "$XENDOMAINS_RESTORE" = "true" ] &&
-       contains_something "$XENDOMAINS_SAVE"
+       contains_something "$XENDOMAINS_SAVE" &&
+       subcmd_supported "restore"
     then
 	echo -n "Restoring Xen domains:"
 	saved_domains=`ls $XENDOMAINS_SAVE`
@@ -411,7 +421,7 @@ stop()
 	    echo -n "(zomb)"
 	    continue
 	fi
-	if test -n "$XENDOMAINS_MIGRATE"; then
+	if test -n "$XENDOMAINS_MIGRATE" && subcmd_supported "migrate"; then
 	    echo -n "(migr)"
 	    watchdog_xencmd migrate &
 	    WDOG_PID=$!
@@ -430,7 +440,7 @@ stop()
 		continue
 	    fi
 	fi
-	if test -n "$XENDOMAINS_SAVE"; then
+	if test -n "$XENDOMAINS_SAVE" && subcmd_supported "save"; then
 	    echo -n "(save)"
 	    watchdog_xencmd save &
 	    WDOG_PID=$!
-- 
2.34.1


