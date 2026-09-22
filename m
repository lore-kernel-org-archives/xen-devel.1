Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A71BC982FF
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 10:09:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428469.1651320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xQy-0006ot-0D; Tue, 22 Sep 2026 10:09:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428469.1651320; Tue, 22 Sep 2026 10:09:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xQx-0006om-TJ; Tue, 22 Sep 2026 10:09:07 +0000
Received: by outflank-mailman (input) for mailman id 1428469;
 Tue, 22 Sep 2026 10:09:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1x8xQw-0006bn-Ix
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 10:09:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1x8xQw-00Ao2I-0I;
 Tue, 22 Sep 2026 10:09:06 +0000
Received: from [2a01:cb15:80c6:e800:b9e9:dfdc:4751:7ecb] (helo=l14.home)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1x8xQw-00DE8C-1x;
 Tue, 22 Sep 2026 10:09:06 +0000
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
	bh=m5pcMrpsVzkcznQskoFs5fpPn/HZg88On5QggZelYuc=; b=mEhbB726wfIqB6nZLNEs7MDb20
	xL/TX3pqFrZvTHl9dSnWWgRJO8h4r2fDOf2Nn/cmNWNn9Ve5+TWp4HCv6fhlusZhHADnYzqiPBKgv
	I567QOvIddWZM/x/Aps+0K3r3nkmgTyK1Y9+xIJTXv8H1ZXag+Vp0lev7wDetSCQblCY=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC XEN PATCH 03/13] pytest: Add fixture to prepare the tftp server
Date: Tue, 22 Sep 2026 12:08:50 +0200
Message-ID: <20260922100900.29129-4-anthony@xenproject.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922100900.29129-1-anthony@xenproject.org>
References: <20260922100900.29129-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

Prepare the netboot config, and upload the necessary files.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 automation/pytest/lib/net_boot.py | 60 +++++++++++++++++++++++++++++++
 automation/pytest/pyproject.toml  |  2 ++
 automation/pytest/test_boot.py    | 11 ++++++
 3 files changed, 73 insertions(+)
 create mode 100644 automation/pytest/lib/net_boot.py

diff --git a/automation/pytest/lib/net_boot.py b/automation/pytest/lib/net_boot.py
new file mode 100644
index 000000000000..50d2cfaa5aaa
--- /dev/null
+++ b/automation/pytest/lib/net_boot.py
@@ -0,0 +1,60 @@
+import io
+import logging
+import os
+import paramiko
+from pathlib import Path
+import textwrap
+
+
+class NetBoot:
+    def grub_script(self) -> str:
+        http_pxe_path = os.environ['PXE_HTTP_PATH']
+        tftp_path = f"(http)/{http_pxe_path}"
+        console_opts = "console=vga,com1"
+
+        xen_cmdline_opts = [
+            console_opts,
+            "loglvl=all",
+            "guest_loglvl=all",
+            "dom0_mem=4G",
+            "console_timestamps=boot",
+            "watchdog",
+            "noreboot",
+            ]
+        xen_cmdline = " ".join(xen_cmdline_opts)
+        linux_cmdline = "console=hvc0 root=/dev/ram0 earlyprintk=xen"
+        script = textwrap.dedent(f"""\
+            echo \"Loading xen\"
+            multiboot2 {tftp_path}/xen {xen_cmdline}
+            echo \"Loading vmlinuz\"
+            module2 {tftp_path}/bzImage {linux_cmdline}
+            echo \"Loading initrd\"
+            module2 --nounzip {tftp_path}/pre-dom0-rootfs.cpio.gz
+            echo \"Booting\"
+            boot
+            """)
+
+        return script
+
+    def prepare_tftp(self, xenroot: Path, rootfss: list[Path]) -> None:
+        username = os.environ['PXE_SSH_USER']
+        hostname = os.environ['PXE_HOST']
+        remote_path = Path(os.environ['PXE_SSH_PATH'])
+
+        binaries_path = xenroot / "binaries"
+        binaries = []
+        for b1 in ["xen", "bzImage"]:
+            binaries.append(binaries_path / b1)
+        binaries += rootfss
+
+        ssh = paramiko.client.SSHClient()
+        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
+        ssh.connect(hostname, username=username)
+        with ssh.open_sftp() as sftp:
+            for b2 in binaries:
+                logging.debug(f" put {b2}, to {remote_path / b2.name}")
+                sftp.put(str(b2), str(remote_path / b2.name), confirm=True)
+            grub_script = io.BytesIO(self.grub_script().encode('utf-8'))
+            sftp.putfo(grub_script, str(remote_path / "grub.cfg"),
+                       confirm=True)
+        ssh.close()
diff --git a/automation/pytest/pyproject.toml b/automation/pytest/pyproject.toml
index 3180b2555029..78f60c4f8e77 100644
--- a/automation/pytest/pyproject.toml
+++ b/automation/pytest/pyproject.toml
@@ -3,8 +3,10 @@ name = "xen-ci-intree"
 version = "0.1.0"
 requires-python = ">=3.14"
 dependencies = [
+    "paramiko>=4.0.0",
     "pip>=26.0.1",
     "pytest>=9.0.2",
+    "types-paramiko>=4.0.0.20260322",
 ]
 [dependency-groups]
 dev = [
diff --git a/automation/pytest/test_boot.py b/automation/pytest/test_boot.py
index 230cee96d0ba..661c2a59e4fe 100644
--- a/automation/pytest/test_boot.py
+++ b/automation/pytest/test_boot.py
@@ -3,6 +3,7 @@ from pathlib import Path
 import pytest
 
 from lib.boot_binary import BootBinary
+from lib.net_boot import NetBoot
 
 
 @pytest.fixture
@@ -30,3 +31,13 @@ def prepare_rootfs(tmp_path: Path,
                       static_ipv6=os.environ['HOST_IP6'],
                       boot_script=boot_script,
                       )
+
+
+@pytest.fixture
+def prepare_netboot(prepare_rootfs: BootBinary, xenroot_path: Path) -> None:
+    netboot = NetBoot()
+    rootfs_paths = [
+        prepare_rootfs.minimal(),
+        prepare_rootfs.dom0_tools(),
+    ]
+    netboot.prepare_tftp(xenroot_path, rootfs_paths)
-- 
Anthony PERARD


