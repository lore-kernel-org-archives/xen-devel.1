Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88C7C982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 10:09:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428473.1651356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xR1-0007e3-SH; Tue, 22 Sep 2026 10:09:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428473.1651356; Tue, 22 Sep 2026 10:09:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xR1-0007dw-PJ; Tue, 22 Sep 2026 10:09:11 +0000
Received: by outflank-mailman (input) for mailman id 1428473;
 Tue, 22 Sep 2026 10:09:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1x8xR1-0007TP-2T
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 10:09:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1x8xR0-00Ao33-25;
 Tue, 22 Sep 2026 10:09:10 +0000
Received: from [2a01:cb15:80c6:e800:b9e9:dfdc:4751:7ecb] (helo=l14.home)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1x8xR1-00DE8C-0c;
 Tue, 22 Sep 2026 10:09:10 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=xsrfE5ntOSeufRj3RlZPqsn9RM3+8iFSAAGbkUyL2x4=; b=F918OzmvRXBlx+JnVvgeFWjMcA
	yR9nA6x4lQJgt2XxFbxsDy9e920oXWwmXgiYmEWpWGwbr8Y0MfYyL37WTYPrVNfVDSE3S//hEz9RL
	gi6kqsjyaZIPdMPbhAQF2ghv37Ee29nggdHv3WCWe2FuEzXz3RoJyHcLs/bTq92dqaek=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC XEN PATCH 07/13] pytest: Add random string to look for in the logs
Date: Tue, 22 Sep 2026 12:08:54 +0200
Message-ID: <20260922100900.29129-8-anthony@xenproject.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922100900.29129-1-anthony@xenproject.org>
References: <20260922100900.29129-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

This allow to check that we are testing the expected rootfs.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 automation/pytest/test_boot.py | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/automation/pytest/test_boot.py b/automation/pytest/test_boot.py
index 158f1a30dcb6..90d8e00e90d9 100644
--- a/automation/pytest/test_boot.py
+++ b/automation/pytest/test_boot.py
@@ -2,6 +2,8 @@ import logging
 import os
 from pathlib import Path
 import pytest
+import random
+import string
 from typing import Generator
 
 from lib.boot_binary import BootBinary
@@ -14,14 +16,20 @@ def xenroot_path() -> Path:
     return Path("../..").resolve()
 
 
+@pytest.fixture
+def boot_string() -> str:
+    return ''.join(random.choice(string.ascii_letters) for _ in range(16))
+
+
 @pytest.fixture
 def prepare_rootfs(tmp_path: Path,
                    xenroot_path: Path,
+                   boot_string: str,
                    ) -> BootBinary:
     static_gateway = os.environ['HOST_IP_GATEWAY']
     http_pxe_path = os.environ["PXE_HTTP_PATH"]
 
-    boot_script = f"echo Dom0 ready\n"
+    boot_script = f"echo Dom0 ready {boot_string}\n"
 
     return BootBinary(tmp_path,
                       xenroot_path,
@@ -65,8 +73,9 @@ def machine_on_ipmi(prepare_netboot: None) -> Generator[IPMI]:
 
 @pytest.mark.timeout(600)
 def test_xen_tools_tests(machine_on_ipmi: IPMI,
+                         boot_string: str,
                          ) -> None:
-    expect_string = "Dom0 ready"
+    expect_string = boot_string
     for line in machine_on_ipmi.console_output_generator():
         #
         # Wait for `expect_string` for the test to succeed
-- 
Anthony PERARD


