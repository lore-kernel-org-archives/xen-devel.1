Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9253C982F1
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 10:09:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428475.1651374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xR5-0008B0-MA; Tue, 22 Sep 2026 10:09:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428475.1651374; Tue, 22 Sep 2026 10:09:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xR5-00089o-FX; Tue, 22 Sep 2026 10:09:15 +0000
Received: by outflank-mailman (input) for mailman id 1428475;
 Tue, 22 Sep 2026 10:09:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1x8xR3-0007sy-CU
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 10:09:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1x8xR2-00Ao3M-31;
 Tue, 22 Sep 2026 10:09:13 +0000
Received: from [2a01:cb15:80c6:e800:b9e9:dfdc:4751:7ecb] (helo=l14.home)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1x8xR3-00DE8C-1X;
 Tue, 22 Sep 2026 10:09:13 +0000
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
	bh=zGpGZ+j9aQiCtnJa+6UJN2jNBGnn8uaTwN1dX0fpCgY=; b=olxkbERncTc4JTc6v5Lmha2s6K
	58/t/1bjdVShM6LmKhCmxliYHydgfN5UcDzLBEtwiqg3Qo9HUZN90OmqC0gSlkBClbyFWLcnHm22s
	kuOyjnheTRuRzMQ1+FGGXrYxTz8mOiKGL6+pfgXqYwC2hLiNpLtJ3Z/+CqPH8039087c=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC XEN PATCH 09/13] pytest: Generate a rootfs for a guest
Date: Tue, 22 Sep 2026 12:08:56 +0200
Message-ID: <20260922100900.29129-10-anthony@xenproject.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922100900.29129-1-anthony@xenproject.org>
References: <20260922100900.29129-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 automation/pytest/conftest.py        |  6 ++++
 automation/pytest/lib/boot_binary.py | 42 ++++++++++++++++++++++++++++
 automation/pytest/test_boot.py       |  8 ++++++
 3 files changed, 56 insertions(+)
 create mode 100644 automation/pytest/conftest.py

diff --git a/automation/pytest/conftest.py b/automation/pytest/conftest.py
new file mode 100644
index 000000000000..304241ae06ba
--- /dev/null
+++ b/automation/pytest/conftest.py
@@ -0,0 +1,6 @@
+import pytest
+
+
+def pytest_configure(config: pytest.Config) -> None:
+    config.addinivalue_line("markers",
+                            "guest_boot_script: script to run when the guest boot")
diff --git a/automation/pytest/lib/boot_binary.py b/automation/pytest/lib/boot_binary.py
index 1910d1f88fe6..9e79b1798908 100644
--- a/automation/pytest/lib/boot_binary.py
+++ b/automation/pytest/lib/boot_binary.py
@@ -30,6 +30,7 @@ class BootBinary:
                  static_dns: str | None = None,
                  static_ipv6: str | None = None,
                  boot_script: str | None = None,
+                 guest_boot_script: str | None = None,
                  ) -> None:
         self.vlan_id = vlan_id
         self.pxe_host = pxe_host
@@ -40,6 +41,7 @@ class BootBinary:
         self.static_ipv6 = static_ipv6
         self.ssh_pub_keys = ssh_pub_keys
         self.boot_script = boot_script
+        self.guest_boot_script = guest_boot_script
 
         # Minimal rootfs
         rootfs_path = tmp_path / "rootfs_minimal"
@@ -53,6 +55,12 @@ class BootBinary:
         self.prepare_dom0_rootfs(rootfs_path, xenroot)
         self.rootfs_dom0_dir = rootfs_path
 
+        # Guest kernel + rootfs
+        rootfs_path = tmp_path / "rootfs_domU"
+        rootfs_path.mkdir()
+        self.prepare_guest_rootfs(rootfs_path, xenroot)
+        self.rootfs_guest_dir = rootfs_path
+
 
     def prepare_minimal_rootfs(self, rootfs_path: Path, xenroot: Path) -> None:
         script_pre_xen = dedent(f"""\
@@ -212,8 +220,42 @@ class BootBinary:
 
         self.xen_tools_rootfs = cpio_rootfs
 
+    def prepare_guest_rootfs(self, rootfs_path: Path, xenroot: Path) -> None:
+        etc = rootfs_path / "etc"
+        etc.mkdir()
+
+        local_d_dir = etc / "local.d"
+        local_d_dir.mkdir()
+
+        xen_start_script = local_d_dir / "xen.start"
+        xen_start_script.write_text(dedent(f"""\
+            #!/bin/sh
+            echo 8 > /proc/sys/kernel/printk
+            {self.guest_boot_script}
+            """))
+        xen_start_script.chmod(stat.S_IRUSR | stat.S_IWUSR | stat.S_IXUSR)
+
+        (etc / "issue").write_text(dedent("""\
+            domU Welcome to Alpine Linux
+            Kernel \\r on an \\m (\\l)
+
+            """))
+
+        # rootfs archive
+        rootfs = []
+        # Uncompressed first! Then compressed cpio archives!
+        rootfs.append(xenroot / "binaries/rootfs.cpio.gz")
+        cpio_rootfs = xenroot / "binaries/guest-rootfs.cpio.gz"
+        concatenate_cpios(rootfs, cpio_rootfs)
+        cpio_archive_from_dir(rootfs_path, cpio_rootfs)
+
+        self.guest_rootfs = cpio_rootfs
+
     def minimal(self) -> Path:
         return self.minimal_rootfs
 
     def dom0_tools(self) -> Path:
         return self.xen_tools_rootfs
+
+    def guest(self) -> Path:
+        return self.guest_rootfs
diff --git a/automation/pytest/test_boot.py b/automation/pytest/test_boot.py
index 039cc36c1a04..5a7ec43fa52b 100644
--- a/automation/pytest/test_boot.py
+++ b/automation/pytest/test_boot.py
@@ -32,11 +32,17 @@ def prepare_rootfs(tmp_path: Path,
                    xenroot_path: Path,
                    sshkey_for_test: paramiko.pkey.PKey,
                    boot_string: str,
+                   request: pytest.FixtureRequest
                    ) -> BootBinary:
     static_gateway = os.environ['HOST_IP_GATEWAY']
     http_pxe_path = os.environ["PXE_HTTP_PATH"]
 
     boot_script = f"echo Dom0 ready {boot_string}\n"
+    marker = request.node.get_closest_marker("guest_boot_script")
+    if marker:
+        guest_boot_script = marker.args[0]
+    else:
+        guest_boot_script = None
 
     ssh_pub_keys = os.environ['SSH_PUB_KEYS']
     ssh_pub_keys += f"\n{sshkey_for_test.get_name()} {sshkey_for_test.get_base64()}\n"
@@ -52,6 +58,7 @@ def prepare_rootfs(tmp_path: Path,
                       static_ipv6=os.environ['HOST_IP6'],
                       ssh_pub_keys=ssh_pub_keys,
                       boot_script=boot_script,
+                      guest_boot_script=guest_boot_script,
                       )
 
 
@@ -61,6 +68,7 @@ def prepare_netboot(prepare_rootfs: BootBinary, xenroot_path: Path) -> None:
     rootfs_paths = [
         prepare_rootfs.minimal(),
         prepare_rootfs.dom0_tools(),
+        prepare_rootfs.guest(),
     ]
     netboot.prepare_tftp(xenroot_path, rootfs_paths)
 
-- 
Anthony PERARD


