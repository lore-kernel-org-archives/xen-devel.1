Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C603C98302
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 10:09:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428474.1651366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xR4-0007v1-CY; Tue, 22 Sep 2026 10:09:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428474.1651366; Tue, 22 Sep 2026 10:09:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xR4-0007um-6m; Tue, 22 Sep 2026 10:09:14 +0000
Received: by outflank-mailman (input) for mailman id 1428474;
 Tue, 22 Sep 2026 10:09:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1x8xR2-0007kM-9U
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 10:09:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1x8xR1-00Ao3C-2Y;
 Tue, 22 Sep 2026 10:09:12 +0000
Received: from [2a01:cb15:80c6:e800:b9e9:dfdc:4751:7ecb] (helo=l14.home)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1x8xR2-00DE8C-14;
 Tue, 22 Sep 2026 10:09:12 +0000
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
	bh=Hwc7/siulS2GTqhirLoPBndfzFNCWOOcNc5vmaXH1ZA=; b=2mE9f1d1Mlu7p1vVgKuzljZlyP
	DLxEvE+cnn2NRyKZm2pU7aalSuWQEuHOS013o0PFUuFg/9L1qZEmX87FbCQnvC7OUEXg6dSJDwqiL
	O2L4AAE0N7MO8ShiIrh4QRq29EHkFNA7qUOZnu97g4J8e7Y6IWF+AyJ2WQt5RqKY3bJs=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC XEN PATCH 08/13] pytest: Run run-tools-tests over ssh on the test machine
Date: Tue, 22 Sep 2026 12:08:55 +0200
Message-ID: <20260922100900.29129-9-anthony@xenproject.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922100900.29129-1-anthony@xenproject.org>
References: <20260922100900.29129-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

Add a new random ssh public key to the rootfs.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 automation/pytest/lib/boot_binary.py |  7 +++++
 automation/pytest/test_boot.py       | 39 ++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/automation/pytest/lib/boot_binary.py b/automation/pytest/lib/boot_binary.py
index d8f503ead9f2..1910d1f88fe6 100644
--- a/automation/pytest/lib/boot_binary.py
+++ b/automation/pytest/lib/boot_binary.py
@@ -23,6 +23,7 @@ class BootBinary:
     def __init__(self, tmp_path: Path, xenroot: Path,
                  pxe_host: str,
                  http_pxe_path: str,
+                 ssh_pub_keys: str | None = None,
                  vlan_id: int | None = None,
                  static_ip: str | None = None,
                  static_gateway: str | None = None,
@@ -37,6 +38,7 @@ class BootBinary:
         self.static_gateway = static_gateway
         self.static_dns = static_dns
         self.static_ipv6 = static_ipv6
+        self.ssh_pub_keys = ssh_pub_keys
         self.boot_script = boot_script
 
         # Minimal rootfs
@@ -126,6 +128,11 @@ class BootBinary:
         runlevel_boot_d.mkdir(parents=True)
         (runlevel_boot_d / "networking").symlink_to("/etc/init.d/networking")
 
+        if self.ssh_pub_keys:
+            home_root_ssh = rootfs_path / "root/.ssh"
+            home_root_ssh.mkdir(parents=True)
+            (home_root_ssh / "authorized_keys").write_text(self.ssh_pub_keys)
+
         local_d_dir = rootfs_path / "etc/local.d"
         local_d_dir.mkdir(parents=True)
 
diff --git a/automation/pytest/test_boot.py b/automation/pytest/test_boot.py
index 90d8e00e90d9..039cc36c1a04 100644
--- a/automation/pytest/test_boot.py
+++ b/automation/pytest/test_boot.py
@@ -1,5 +1,6 @@
 import logging
 import os
+import paramiko
 from pathlib import Path
 import pytest
 import random
@@ -16,6 +17,11 @@ def xenroot_path() -> Path:
     return Path("../..").resolve()
 
 
+@pytest.fixture
+def sshkey_for_test() -> paramiko.pkey.PKey:
+    return paramiko.ecdsakey.ECDSAKey.generate()
+
+
 @pytest.fixture
 def boot_string() -> str:
     return ''.join(random.choice(string.ascii_letters) for _ in range(16))
@@ -24,6 +30,7 @@ def boot_string() -> str:
 @pytest.fixture
 def prepare_rootfs(tmp_path: Path,
                    xenroot_path: Path,
+                   sshkey_for_test: paramiko.pkey.PKey,
                    boot_string: str,
                    ) -> BootBinary:
     static_gateway = os.environ['HOST_IP_GATEWAY']
@@ -31,6 +38,9 @@ def prepare_rootfs(tmp_path: Path,
 
     boot_script = f"echo Dom0 ready {boot_string}\n"
 
+    ssh_pub_keys = os.environ['SSH_PUB_KEYS']
+    ssh_pub_keys += f"\n{sshkey_for_test.get_name()} {sshkey_for_test.get_base64()}\n"
+
     return BootBinary(tmp_path,
                       xenroot_path,
                       vlan_id=int(os.environ['HOST_IP_VLANID']),
@@ -40,6 +50,7 @@ def prepare_rootfs(tmp_path: Path,
                       static_gateway=static_gateway,
                       static_dns=static_gateway,
                       static_ipv6=os.environ['HOST_IP6'],
+                      ssh_pub_keys=ssh_pub_keys,
                       boot_script=boot_script,
                       )
 
@@ -73,6 +84,7 @@ def machine_on_ipmi(prepare_netboot: None) -> Generator[IPMI]:
 
 @pytest.mark.timeout(600)
 def test_xen_tools_tests(machine_on_ipmi: IPMI,
+                         sshkey_for_test: paramiko.pkey.PKey,
                          boot_string: str,
                          ) -> None:
     expect_string = boot_string
@@ -91,3 +103,30 @@ def test_xen_tools_tests(machine_on_ipmi: IPMI,
         if "Manual reset required ('noreboot' specified)" in line:
             # Test failed, could wait a bit before failing the test.
             logging.error("Xen panic")
+    ssh = paramiko.client.SSHClient()
+    ssh.set_missing_host_key_policy(paramiko.client.WarningPolicy)
+    logging.debug(f"connecting to {os.environ['HOST_IP4'].split('/')[0]}")
+    ssh.connect(os.environ['HOST_IP4'].split('/')[0],
+                username='root',
+                pkey=sshkey_for_test,
+                timeout=10,
+                )
+
+    cmd = '/root/run-tools-tests /usr/lib/xen/tests /tmp/tests-junit.xml'
+    logging.info(f"Exec command: {cmd}")
+    stdin, stdout, stderr = ssh.exec_command(cmd)
+    for output in stdout:
+        logging.debug(output.strip())
+    errormsg = stderr.read()
+    if errormsg:
+        logging.info(f"cmd errro: {errormsg!r}")
+    exit_status = stderr.channel.recv_exit_status()
+    logging.debug(f"exit status: {exit_status}")
+
+    cmd = 'cat /tmp/tests-junit.xml'
+    stdin, stdout, stderr = ssh.exec_command(cmd)
+    junit = stdout.read()
+    logging.debug(f"got junit result: {junit!r}")
+    errormsg = stderr.read()
+    if errormsg:
+        logging.info(f"cmd errro: {errormsg!r}")
-- 
Anthony PERARD


