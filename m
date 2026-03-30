Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD77A1061B14
	for <xen-devel@archiver.kernel.org>; Mon, 30 Mar 2026 16:17:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1267863.1557372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7FJH-0002Ml-64; Mon, 30 Mar 2026 16:17:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267863.1557372; Mon, 30 Mar 2026 16:17:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7FJH-0002Ma-0r; Mon, 30 Mar 2026 16:17:51 +0000
Received: by outflank-mailman (input) for mailman id 1267863;
 Mon, 30 Mar 2026 16:17:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <edwin.torok@citrix.com>) id 1w7FJF-00026i-IW
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 16:17:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7FJE-008sKR-Ux
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 18:17:48 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <edwin.torok@citrix.com>)
 id 69caa22b-bab6-0a2a0a5309dd-0a2a4506ab40-4
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 18:17:48 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <edwin.torok@citrix.com>)
 id 69caa22b-3034-0a2a45060019-a0658308aeb8-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 18:17:48 +0200
Received: from localhost.localdomain (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTPS id 8B93741B6C9C;
 Mon, 30 Mar 2026 12:17:12 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 5/5] automation/scripts/build: group command output from parallel jobs
Date: Mon, 30 Mar 2026 17:17:28 +0100
Message-ID: <0061ddf6e91e07a960c10dd2f44bdda18dd243b1.1774886602.git.edwin.torok@citrix.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774886602.git.edwin.torok@citrix.com>
References: <cover.1774886602.git.edwin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1774887468-801831C2-3AE34AA0/0/0
X-purgate-type: clean
X-purgate-size: 2011

Whenever 'make -j' is used, '-O' should be used too.
This ensures that output from parallel invocations of the compiler or
tests do not mix with each-other.
The downside is that make has to buffer the output and will only print
it when the command completes, which can add a noticable delay during
local development, but should have no impact on the CI.

Signed-off-by: Edwin Török <edwin.torok@citrix.com>
---
 automation/scripts/build | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/automation/scripts/build b/automation/scripts/build
index 26ffdf3350..e30ac24e46 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -19,7 +19,7 @@ if [[ "${RANDCONFIG}" == "y" ]]; then
     # Append job-specific fixed configuration
     echo "${EXTRA_FIXED_RANDCONFIG}" >> xen/allrandom.config.tmp
 
-    make -j$(nproc) -C xen KCONFIG_ALLCONFIG=allrandom.config.tmp randconfig
+    make -j$(nproc) -O -C xen KCONFIG_ALLCONFIG=allrandom.config.tmp randconfig
 
     # RANDCONFIG implies HYPERVISOR_ONLY
     HYPERVISOR_ONLY="y"
@@ -34,7 +34,7 @@ else
         echo "${EXTRA_XEN_CONFIG}" >> xen/.config
     fi
 
-    make -j$(nproc) -C xen olddefconfig
+    make -j$(nproc) -O -C xen olddefconfig
 fi
 
 # Save the config file before building because build failure causes the script
@@ -64,7 +64,7 @@ if [[ "${CPPCHECK}" == "y" ]] && [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
     cp xen/cppcheck-report/xen-cppcheck.txt xen-cppcheck.txt
 elif [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
     # Xen-only build
-    make -j$(nproc) xen
+    make -j$(nproc) -O xen
 
     # Preserve artefacts
     collect_xen_artefacts
@@ -105,9 +105,9 @@ else
     fi
 
     ./configure "${cfgargs[@]}"
-    make -j$(nproc) dist
+    make -j$(nproc) -O dist
 
-    make -j$(nproc) check
+    make -j$(nproc) -O check
 
     # Preserve artefacts
     # Note: Some smoke tests depending on finding binaries/xen on a full build
-- 
2.47.3


