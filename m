Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D655C5CFDB
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 23:41:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390484.1630851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuf2X-0005FZ-VT; Thu, 13 Aug 2026 23:40:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390484.1630851; Thu, 13 Aug 2026 23:40:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuf2X-0005FR-SY; Thu, 13 Aug 2026 23:40:49 +0000
Received: by outflank-mailman (input) for mailman id 1390484;
 Thu, 13 Aug 2026 21:27:45 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewprecious388@gmail.com>) id 1wucxl-0002fz-1M
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 21:27:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wucxk-007fFh-1q
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 23:27:44 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewprecious388@gmail.com>)
 id 6a7e367b-2eae-0a2a0a5409dd-0a2a4507d592-32
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 23:27:44 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewprecious388@gmail.com>)
 id 6a7e36cf-b4ea-0a2a45070019-d155dd29d90f-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 23:27:44 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-47f71156e1aso122954f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 14:27:43 -0700 (PDT)
Received: from debian.debian ([102.213.48.6]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f2b1d90sm2411674f8f.22.2026.08.13.14.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2026 14:27:41 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786656463; x=1787261263; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1IsaaZEM5AbAGdu6Vn3gDX/VJhjYFIvgg6s6SuZB6TQ=;
        b=fnBtVyObovRfdQkrXPeOtEC616VfsEmXWTwepePeHCdiSZ8J0KTuWpZB6ZcgMUPzZ1
         ZIbtKctbDJQiGm6EoHDyby8J8/43gMtLMSbHDxpK9fmT/XhEofb7ufFHWok6jR3vDP61
         0xBM0OjDpihd3/UN+PXYFid/XDXAhDV0wrrjCM6Uzg67W6XnEyBZQvia8v200/mF8aaH
         FGpmMClGZ82UoBuBIngvtarxfqluBk/gUMFnSE5dUitbzNDHDZoiIRHb8j0Mnf68cfiS
         vgiJw4LzhSUgcOPyAFVKl4G2HtgTjixfgy4R6gp52DB4DrnrJtRsgPTLit0GKc1x8gl9
         ieNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786656463; x=1787261263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1IsaaZEM5AbAGdu6Vn3gDX/VJhjYFIvgg6s6SuZB6TQ=;
        b=UNz9Unxvg1zTLxJFZ7uZp7Ro70516+6KEanlEPzwHkjD3CDCj7Y+FzAI6F0isvBybp
         VSqyrtm02huDtTbiuvtiBXferc8J8QlRu8Y+EAD3bXiXEtv2XCddH3sOYcE9X51xK9Ta
         Q5dQVmKBl06RSYGSWuqe/n2unXe7MFqvcoaDYnK35J8GksUP45GMmrCPWei+0EVvXM2N
         52fRICe7U9Nko8A4RrO4y2ycIJ4OvfsrDGRBWFnbi1bHDfEuiweiGWaBT9g+SH+BxILi
         B5Iy7DJOU624eYx4pgyDUCOXHi7Lox4emDrABTs9/6IKyicrkuizBHu8xvmw2osJikbJ
         Gj2g==
X-Gm-Message-State: AOJu0YzK9zxyAHw6ychx/9L7NPs8hZpKOHEpImVoqx/4EvE8hfhh7S2P
	iBz31DhR700E8vTJnHN273JwF0uklQeThMR7FEfKqu5qkvSLzYdmfD7UhcYlfa7eK6c=
X-Gm-Gg: AR+sD10X6mHVvHYEMP/0hszS+P1qbhd/4yvmQ40lSZRhoYCgH1sYLQitkbKT0KY7dqg
	cyjvkB3aOg649e6hmqu+dVeWZcObTGUCklPQiqASUebwBJscVI/Vlu/71XWpwiaLZsNwLKbrWtz
	MSiP4N5FdRGi3tB8vDwLmCeJN3NuVZPbt0CUj84mUdKc9vuN9M+GH0jpx6unE1PPvh0Nf6eeGAT
	M1n4WnG/Lkm6egrxrlFR53dyU4p/Np/OPvJ9AqhSJn5Jjl2pspx/P2Uhf+tiefDBMGluMADuFrS
	UwFxDeMJTxxXqOcVNo/MXUWyH2kxuU6vtRcHBu3AY0GfBHMovyKOeUM/yH0c/8eb3KGtdCjwHq/
	zkOBTy50Abj3JqwGAEMUz7E7nLwM35Lp8HECKGwlUc+hVmWVuqisYN5PTdvUMgTBTp+7EhL7jij
	OwHaefMBvQR0jUQ0EHB1if15spIkb1F+qgQ9d+uck3iba0D/Sws4WeWolHPgBpODJ4YjVMlNYpL
	byO2ss=
X-Received: by 2002:a05:6000:22c5:b0:481:3124:c71f with SMTP id ffacd0b85a97d-481607487bdmr1383300f8f.17.1786656463465;
        Thu, 13 Aug 2026 14:27:43 -0700 (PDT)
From: Andrew Mbugua <andrewprecious388@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: anthony.perard@vates.tech,
	Andrew Mbugua <andrewprecious388@gmail.com>
Subject: [XEN PATCH] tools/console/daemon: fix log_dir memory leak in xenconsoled
Date: Fri, 14 Aug 2026 00:27:23 +0300
Message-ID: <20260813212724.2607832-1-andrewprecious388@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1786656464-36AD8AE4-C6653229/0/0
X-purgate-type: clean
X-purgate-size: 1709

Valgrind reports that 21 bytes are "still reachable" from the (XEN_LOG_DIR "/console") allocation:

HEAP SUMMARY:
    in use at exit: 21 bytes in 1 blocks
    total heap usage: 9 allocs, 8 frees, 4,799 bytes allocated

Since the dynamic memory allocation for the default log directory path happens before the process
forks into the background, the parent and intermediate processes exit during daemonize()
with the memory still reachable.

Move the strdup() allocation down below the daemonize() block. This ensures only the final
background daemon allocates the default path, matching the lifetime of the free(log_dir)
cleanup loop at the exit of main().

With this change, Valgrind reports a clean heap summary

HEAP SUMMARY:
    in use at exit: 0 bytes in 0 blocks
    total heap usage: 8 allocs, 8 frees, 4,778 bytes allocated

Signed-off-by: Andrew Mbugua <andrewprecious388@gmail.com>
---
 tools/console/daemon/main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/console/daemon/main.c b/tools/console/daemon/main.c
index aac7233a48..9f81d73164 100644
--- a/tools/console/daemon/main.c
+++ b/tools/console/daemon/main.c
@@ -181,10 +181,6 @@ int main(int argc, char **argv)
 		}
 	}
 
-	if (!log_dir) {
-		log_dir = strdup(XEN_LOG_DIR "/console");
-	}
-
 	if (geteuid() != 0) {
 		fprintf(stderr, "%s requires root to run.\n", argv[0]);
 		exit(EPERM);
@@ -201,6 +197,10 @@ int main(int argc, char **argv)
 		daemonize(pidfile ? pidfile : XEN_RUN_DIR "/xenconsoled.pid");
 	}
 
+	if (!log_dir) {
+                log_dir = strdup(XEN_LOG_DIR "/console");
+        }
+
 	if (!xen_setup())
 		exit(1);
 
-- 
2.47.3


