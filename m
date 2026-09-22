Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE63C98302
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 10:09:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428471.1651337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xR0-0007EX-DY; Tue, 22 Sep 2026 10:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428471.1651337; Tue, 22 Sep 2026 10:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xR0-0007EQ-Am; Tue, 22 Sep 2026 10:09:10 +0000
Received: by outflank-mailman (input) for mailman id 1428471;
 Tue, 22 Sep 2026 10:09:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1x8xQy-00070A-RU
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 10:09:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1x8xQy-00Ao2h-1A;
 Tue, 22 Sep 2026 10:09:08 +0000
Received: from [2a01:cb15:80c6:e800:b9e9:dfdc:4751:7ecb] (helo=l14.home)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1x8xQy-00DE8C-2t;
 Tue, 22 Sep 2026 10:09:08 +0000
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
	bh=E1LH+34AS/zTBhZzWE2Tec45KIoMgC4W9seEEpRboRo=; b=1cnzPWZ/y+7519jE3Oa6zQtntx
	ftqwiO5uPq2hggQD2+YgnlQdwIbyt8rzCI62Tfcdc2EOSbMrY6YtjLlDgjiGEmroILcpROhKHV6ew
	KrkHL3ruS44zvUFx5fUvKWBa/Ok5Cv8byuIM29mR15hhSOg4PHXZ5tHNtoDCQqFm1Kx8=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC XEN PATCH 05/13] pytest: Introduce reading the console, and add a test
Date: Tue, 22 Sep 2026 12:08:52 +0200
Message-ID: <20260922100900.29129-6-anthony@xenproject.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922100900.29129-1-anthony@xenproject.org>
References: <20260922100900.29129-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

The test will do more than just checking dom0 booted in a later patch.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 automation/pytest/lib/ipmi.py    | 86 ++++++++++++++++++++++++++++++++
 automation/pytest/pyproject.toml |  1 +
 automation/pytest/test_boot.py   | 24 +++++++++
 3 files changed, 111 insertions(+)

diff --git a/automation/pytest/lib/ipmi.py b/automation/pytest/lib/ipmi.py
index 0d3b085f704c..bda5d8077577 100644
--- a/automation/pytest/lib/ipmi.py
+++ b/automation/pytest/lib/ipmi.py
@@ -1,6 +1,8 @@
 import logging
 import paramiko
 import re
+import time
+from typing import Generator
 
 
 class IPMI:
@@ -67,3 +69,87 @@ class IPMI:
 
     def power_off(self):
         self._power('off force')
+
+    def get_console(self):
+        logging.info(f"Start console acquisition on {self.blade_node}")
+        ssh = self._new_client()
+        channel = ssh.invoke_shell()
+
+        output = ""
+        logging.debug("wait for prompt")
+        while True:
+            if channel.recv_ready():
+                output += channel.recv(9999).decode('utf-8')
+                # wait for prompt
+                logging.debug(output)
+                if output.strip().endswith('hpiLO->'):
+                    logging.debug("got prompt")
+                    break
+            elif channel.exit_status_ready():
+                raise Exception("Shell closed unexpectedly.")
+            else:
+                time.sleep(0.1)  # Wait a bit for more output
+
+        logging.debug("run connect node vsp acquire")
+        cmd = f"connect node vsp acquire {self.blade_node}\n"
+        channel.send(cmd)
+
+        self.channel = channel
+
+    def console_output_generator(self) -> Generator[str]:
+        if not self.channel:
+            raise Exception("Must call get_console")
+        channel = self.channel
+        previous_output = ''
+        # `count` when this reach 0, we had a line from the console that isn't
+        # finished, like a prompt, for sometime already, so display it in the
+        # debug.
+        count = 0
+        ansi_escape = re.compile(r'''
+            \x1B  # ESC
+            (?:   # 7-bit C1 Fe (except CSI)
+                [@-Z\\-_]
+            |     # or [ for CSI, followed by a control sequence
+                \[
+                [0-?]*  # Parameter bytes
+                [ -/]*  # Intermediate bytes
+                [@-~]   # Final byte
+            )
+        ''', re.VERBOSE)
+        while True:
+            if channel.recv_ready():
+                output = previous_output
+                output += channel.recv(9999).decode('utf-8')
+                output_lines = output.splitlines(keepends=True)
+                for line in output_lines[:-1]:
+                    line = ansi_escape.sub('', line)
+                    line = line.rstrip()
+                    if line in ['', '\r', '\r\n']:
+                        continue
+                    logging.debug(line)
+                    yield line
+                previous_output = output_lines[-1]
+                if previous_output.endswith('\n'):
+                    line = previous_output
+                    line = ansi_escape.sub('', line)
+                    line = line.rstrip()
+                    if line not in ['', '\r', '\r\n']:
+                        logging.debug(line)
+                    previous_output = ''
+                    count = 0
+                else:
+                    count = 20
+                # previous_output = output[-len(expect):]
+            # Check if the shell closed unexpectedly
+            elif channel.exit_status_ready():
+                raise Exception("Shell closed unexpectedly.")
+            else:
+                if count > 1:
+                    count -= 1
+                elif count == 1:
+                    line = previous_output
+                    line = ansi_escape.sub('', line)
+                    if line not in ['\r']:
+                        logging.debug("XXXXX output buffer: %s XXXXXX" % repr(line))
+                    count -= 1
+                time.sleep(0.5)  # Wait a bit for more output
diff --git a/automation/pytest/pyproject.toml b/automation/pytest/pyproject.toml
index 78f60c4f8e77..4ab7094e0d84 100644
--- a/automation/pytest/pyproject.toml
+++ b/automation/pytest/pyproject.toml
@@ -6,6 +6,7 @@ dependencies = [
     "paramiko>=4.0.0",
     "pip>=26.0.1",
     "pytest>=9.0.2",
+    "pytest-timeout>=2.4.0",
     "types-paramiko>=4.0.0.20260322",
 ]
 [dependency-groups]
diff --git a/automation/pytest/test_boot.py b/automation/pytest/test_boot.py
index b7610736fa25..158f1a30dcb6 100644
--- a/automation/pytest/test_boot.py
+++ b/automation/pytest/test_boot.py
@@ -1,3 +1,4 @@
+import logging
 import os
 from pathlib import Path
 import pytest
@@ -53,8 +54,31 @@ def machine_on_ipmi(prepare_netboot: None) -> Generator[IPMI]:
             password=os.environ['MOON_CONSOLE_PASS'],
             blade_node=os.environ['IPMI_BLADE_NODE'],
             )
+    # start console
+    ipmi.get_console()
     ipmi.power_off()
     ipmi.power_status()
     ipmi.power_on()
     yield ipmi
     ipmi.power_off()
+
+
+@pytest.mark.timeout(600)
+def test_xen_tools_tests(machine_on_ipmi: IPMI,
+                         ) -> None:
+    expect_string = "Dom0 ready"
+    for line in machine_on_ipmi.console_output_generator():
+        #
+        # Wait for `expect_string` for the test to succeed
+        #
+        if expect_string in line:
+            logging.info(f"got expect_string '{line}'.")
+            break
+        #
+        # Some common expected or not console outputs.
+        #
+        if "Latest ChangeSet:" in line:
+            logging.info(f"Test xen build from '{line}'.")
+        if "Manual reset required ('noreboot' specified)" in line:
+            # Test failed, could wait a bit before failing the test.
+            logging.error("Xen panic")
-- 
Anthony PERARD


