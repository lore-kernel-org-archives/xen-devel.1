Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBC5C982F1
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 10:09:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428470.1651328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xQz-00071n-72; Tue, 22 Sep 2026 10:09:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428470.1651328; Tue, 22 Sep 2026 10:09:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xQz-00071e-4U; Tue, 22 Sep 2026 10:09:09 +0000
Received: by outflank-mailman (input) for mailman id 1428470;
 Tue, 22 Sep 2026 10:09:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1x8xQx-0006oL-Ln
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 10:09:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1x8xQx-00Ao2U-0j;
 Tue, 22 Sep 2026 10:09:07 +0000
Received: from [2a01:cb15:80c6:e800:b9e9:dfdc:4751:7ecb] (helo=l14.home)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1x8xQx-00DE8C-2R;
 Tue, 22 Sep 2026 10:09:07 +0000
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
	bh=EZSW/BF9mMmUonbwLJFPmPKsbgF7MFx2YuFv+VyC5TQ=; b=SzR99WPYlckt9ZceJ+XwhMyLb8
	lcFIIs0ULG/7EnPojaqbf/pRVOT83KtjZxhTTIWGg/IKbhq3pCrlcjOSb+CWbq0hTRb4yEYxGwvkj
	QLHV1dPx7mduE+5CsaMusYwyMVVNeYhChsH42NNBIIdTuchCe2DKoKG5QOntx/vUWrNk=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC XEN PATCH 04/13] pytest: Add fixture that boot a machine
Date: Tue, 22 Sep 2026 12:08:51 +0200
Message-ID: <20260922100900.29129-5-anthony@xenproject.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922100900.29129-1-anthony@xenproject.org>
References: <20260922100900.29129-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

.. and power it off once a test using the fixture is done.

This IPMI class is using the `ssh` console of an HP Moonshot 1500
Chassis.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
Maybe we could rename the class to Machine as a lib to control the
machine behavior, and access it's console.
---
 automation/pytest/lib/ipmi.py  | 69 ++++++++++++++++++++++++++++++++++
 automation/pytest/test_boot.py | 17 +++++++++
 2 files changed, 86 insertions(+)
 create mode 100644 automation/pytest/lib/ipmi.py

diff --git a/automation/pytest/lib/ipmi.py b/automation/pytest/lib/ipmi.py
new file mode 100644
index 000000000000..0d3b085f704c
--- /dev/null
+++ b/automation/pytest/lib/ipmi.py
@@ -0,0 +1,69 @@
+import logging
+import paramiko
+import re
+
+
+class IPMI:
+    def __init__(self, *,
+                 hostname: str,
+                 username: str,
+                 password: str,
+                 blade_node: str,
+                 ) -> None:
+        self.hostname = hostname
+        self.username = username
+        self.password = password
+        self.blade_node = blade_node
+
+        self.channel = None
+
+    def _new_client(self):
+        ssh = paramiko.client.SSHClient()
+        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
+        ssh.connect(self.hostname,
+                    username=self.username,
+                    password=self.password)
+        return ssh
+
+    def _run_cmd(self, command: str, debug_print: bool = True) -> str:
+        with self._new_client() as ssh:
+            stdin, stdout, stderr = ssh.exec_command(command)
+            output = stdout.read().decode()
+            if debug_print:
+                for line in output.splitlines():
+                    if line in ['']:
+                        continue
+                    logging.debug(line.rstrip())
+            # the command's exit status (0 = success, 1 = failure)
+            # stdout.channel.recv_exit_status()
+            return output
+
+    def _power(self, state: str) -> None:
+        assert state in ["on", "off force"]
+        logging.info(f"Set power {state.split(' ')[0]} {self.blade_node}")
+        command = f"set node power {state} {self.blade_node}"
+        output = self._run_cmd(command, debug_print=False)
+        m = re.search(f"{self.blade_node}: #Node 1 (.*)\\r$",
+                      output,
+                      flags=re.M)
+        if m:
+            logging.info(f"-> {m[1]}")
+        else:
+            logging.warning(f"Failed to parse 'set power' command output: '{output}'")
+
+    def power_status(self):
+        command = f"show node power {self.blade_node}"
+        output = self._run_cmd(command, debug_print=False)
+        m = re.search(f"{self.blade_node}: #Node 1\\r\\n\\s+Power State: (\\S+)\\r$",
+                      output,
+                      flags=re.M)
+        if m:
+            logging.info(f"Machine is {m[1]}")
+        else:
+            logging.warning(f"Failed to match for \"Power State\" in '{output}'")
+
+    def power_on(self):
+        self._power('on')
+
+    def power_off(self):
+        self._power('off force')
diff --git a/automation/pytest/test_boot.py b/automation/pytest/test_boot.py
index 661c2a59e4fe..b7610736fa25 100644
--- a/automation/pytest/test_boot.py
+++ b/automation/pytest/test_boot.py
@@ -1,9 +1,11 @@
 import os
 from pathlib import Path
 import pytest
+from typing import Generator
 
 from lib.boot_binary import BootBinary
 from lib.net_boot import NetBoot
+from lib.ipmi import IPMI
 
 
 @pytest.fixture
@@ -41,3 +43,18 @@ def prepare_netboot(prepare_rootfs: BootBinary, xenroot_path: Path) -> None:
         prepare_rootfs.dom0_tools(),
     ]
     netboot.prepare_tftp(xenroot_path, rootfs_paths)
+
+
+@pytest.fixture
+def machine_on_ipmi(prepare_netboot: None) -> Generator[IPMI]:
+    ipmi = IPMI(
+            hostname=os.environ['IPMI_HOSTNAME'],
+            username=os.environ['MOON_CONSOLE_USER'],
+            password=os.environ['MOON_CONSOLE_PASS'],
+            blade_node=os.environ['IPMI_BLADE_NODE'],
+            )
+    ipmi.power_off()
+    ipmi.power_status()
+    ipmi.power_on()
+    yield ipmi
+    ipmi.power_off()
-- 
Anthony PERARD


