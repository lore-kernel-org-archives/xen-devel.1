Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35307C982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 10:09:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428467.1651302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xQv-0006Or-Fz; Tue, 22 Sep 2026 10:09:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428467.1651302; Tue, 22 Sep 2026 10:09:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xQv-0006Ok-DM; Tue, 22 Sep 2026 10:09:05 +0000
Received: by outflank-mailman (input) for mailman id 1428467;
 Tue, 22 Sep 2026 10:09:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1x8xQu-0006Ga-Fs
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 10:09:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1x8xQt-00Ao1x-2c;
 Tue, 22 Sep 2026 10:09:04 +0000
Received: from [2a01:cb15:80c6:e800:b9e9:dfdc:4751:7ecb] (helo=l14.home)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1x8xQu-00DE8C-12;
 Tue, 22 Sep 2026 10:09:04 +0000
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
	bh=H/MbAY1eGqbTAnphWhom0M3ym5qcu8LUIEqlrx+aImc=; b=JM9IUQ4VbldbOLucyunP3iJ5F/
	VR5KVOpiwzw5fjUPZtqXz+w+aZhSRvxNauAJ6yFShHcpXsehCPo2BL/mApqJ5FiO9alKYYb9ltQ2h
	AL17E26dztPG+ZWB3IUbGcakTknoXvAzQtEEeUOXqpnh6jm4TzGlfPMFxvxMOGKrYmK4=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC XEN PATCH 01/13] pytest: Add fixture to prepare rootfs
Date: Tue, 22 Sep 2026 12:08:48 +0200
Message-ID: <20260922100900.29129-2-anthony@xenproject.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922100900.29129-1-anthony@xenproject.org>
References: <20260922100900.29129-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

It's slyghtly more complicated than the QubeOS's test script as we try
here to create a small rootfs with just enough for setting up the
network, then once Linux is booted we load the rest, that is Xen's
toolstack.

Loading the full rootfs at netboot on the moonshot takes more than 10
minutes, while download it once Linux is booted is much faster.

The network configuration should be flexible enough, we can select
static IP or DHCP, and setup VLAN if needed. I've mainly only tested
static IP + VLAN.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 automation/pytest/lib/__init__.py    |   0
 automation/pytest/lib/boot_binary.py | 212 +++++++++++++++++++++++++++
 automation/pytest/test_boot.py       |  32 ++++
 3 files changed, 244 insertions(+)
 create mode 100644 automation/pytest/lib/__init__.py
 create mode 100644 automation/pytest/lib/boot_binary.py
 create mode 100644 automation/pytest/test_boot.py

diff --git a/automation/pytest/lib/__init__.py b/automation/pytest/lib/__init__.py
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/automation/pytest/lib/boot_binary.py b/automation/pytest/lib/boot_binary.py
new file mode 100644
index 000000000000..d8f503ead9f2
--- /dev/null
+++ b/automation/pytest/lib/boot_binary.py
@@ -0,0 +1,212 @@
+from pathlib import Path
+import shlex
+import stat
+import subprocess
+from textwrap import dedent
+
+
+def cpio_archive_from_dir(root: Path, output: Path) -> None:
+    subprocess.run(f"find . | cpio -H newc --owner=0:0 -o | gzip >> {output}",
+                   shell=True,
+                   cwd=root,
+                   check=True)
+
+
+def concatenate_cpios(archives: list[Path], output: Path) -> None:
+    paths = shlex.join([str(p) for p in archives])
+    subprocess.run(f"cat {paths} > {output}",
+                   shell=True,
+                   check=True)
+
+
+class BootBinary:
+    def __init__(self, tmp_path: Path, xenroot: Path,
+                 pxe_host: str,
+                 http_pxe_path: str,
+                 vlan_id: int | None = None,
+                 static_ip: str | None = None,
+                 static_gateway: str | None = None,
+                 static_dns: str | None = None,
+                 static_ipv6: str | None = None,
+                 boot_script: str | None = None,
+                 ) -> None:
+        self.vlan_id = vlan_id
+        self.pxe_host = pxe_host
+        self.http_pxe_path = http_pxe_path
+        self.static_ip = static_ip
+        self.static_gateway = static_gateway
+        self.static_dns = static_dns
+        self.static_ipv6 = static_ipv6
+        self.boot_script = boot_script
+
+        # Minimal rootfs
+        rootfs_path = tmp_path / "rootfs_minimal"
+        rootfs_path.mkdir()
+        self.prepare_minimal_rootfs(rootfs_path, xenroot)
+        self.rootfs_dir = rootfs_path
+
+        # Rootfs for dom0
+        rootfs_path = tmp_path / "rootfs_dom0"
+        rootfs_path.mkdir()
+        self.prepare_dom0_rootfs(rootfs_path, xenroot)
+        self.rootfs_dom0_dir = rootfs_path
+
+
+    def prepare_minimal_rootfs(self, rootfs_path: Path, xenroot: Path) -> None:
+        script_pre_xen = dedent(f"""\
+            #!/bin/ash
+            set -xe
+
+            wget http://{self.pxe_host}/{self.http_pxe_path}/dom0-rootfs.cpio.gz -O /root/dom0-rootfs.cpio.gz
+            cd /
+            gzip -d < /root/dom0-rootfs.cpio.gz | while cpio -iu; do :; done
+            /etc/local.d/xen.start
+        """)
+
+        bridge_port = "eth0"
+        cfg_vlan = ""
+        if self.vlan_id:
+            bridge_port = f"eth0.{self.vlan_id}"
+            cfg_vlan = f"""\
+                auto {bridge_port}
+                iface {bridge_port} inet manual
+                    vlan-raw-device eth0
+                    # Remove all ipv6 route, they are duplicates from
+                    # the one added to the bridge interface
+                    post-up ip -6 route flush dev $IFACE
+            """
+
+        cfg_addr = ""
+        if self.static_ip and self.static_gateway:
+            cfg_addr = f"""\
+                use static
+                address {self.static_ip}
+                gateway {self.static_gateway}
+            """
+        else:
+            cfg_addr = """\
+                use dhcp
+                """
+
+        if self.static_ip and not self.static_gateway:
+            cfg_addr += f"""\
+                address {self.static_ip}
+            """
+
+        cfg_addr_v6 = ""
+        if self.static_ipv6:
+            cfg_addr_v6 = f"""\
+                address {self.static_ipv6}
+            """
+
+        network_interfaces = dedent(f"""\
+            {cfg_vlan}
+
+            auto xenbr0
+            iface xenbr0
+                {cfg_addr}
+                bridge-ports {bridge_port}
+                bridge-stp 0
+                {cfg_addr_v6}
+        """)
+
+        etc_networkd_d = rootfs_path / "etc/network"
+        etc_networkd_d.mkdir(parents=True)
+        (etc_networkd_d / "interfaces").write_text(network_interfaces)
+
+        # if static
+        if self.static_dns:
+            dns_config = dedent(f"""\
+                nameserver {self.static_dns}
+            """)
+            (rootfs_path / "etc/resolv.conf").write_text(dns_config)
+
+        # rc-update add networking boot
+        runlevel_boot_d = rootfs_path / "etc/runlevels/boot"
+        runlevel_boot_d.mkdir(parents=True)
+        (runlevel_boot_d / "networking").symlink_to("/etc/init.d/networking")
+
+        local_d_dir = rootfs_path / "etc/local.d"
+        local_d_dir.mkdir(parents=True)
+
+        pre_xen_start_script = local_d_dir / "pre-xen.start"
+        pre_xen_start_script.write_text(script_pre_xen)
+        pre_xen_start_script.chmod(stat.S_IRUSR | stat.S_IXUSR)
+
+        # rootfs archive
+        rootfs = []
+        # Uncompressed first! Then compressed cpio archives!
+        rootfs.append(xenroot / "binaries/ucode.cpio")
+        rootfs.append(xenroot / "binaries/rootfs.cpio.gz")
+        cpio_rootfs = xenroot / "binaries/pre-dom0-rootfs.cpio.gz"
+        concatenate_cpios(rootfs, cpio_rootfs)
+        cpio_archive_from_dir(rootfs_path, cpio_rootfs)
+
+        self.minimal_rootfs = cpio_rootfs
+
+    def prepare_dom0_rootfs(self, rootfs_path: Path, xenroot: Path) -> None:
+        etc = rootfs_path / "etc"
+        etc.mkdir()
+
+        local_d_dir = etc / "local.d"
+        local_d_dir.mkdir()
+
+        script_xen = dedent("""\
+            #!/bin/bash
+
+            bash /etc/init.d/xencommons start
+        """)
+        if self.boot_script:
+            script_xen += self.boot_script
+
+        xen_start_script = local_d_dir / "xen.start"
+        xen_start_script.write_text(script_xen)
+        xen_start_script.chmod(stat.S_IRUSR | stat.S_IWUSR | stat.S_IXUSR)
+
+        etc_default = etc / "default"
+        etc_default.mkdir()
+
+        xencommons_default = etc_default / "xencommons"
+        xencommons_default.write_text(dedent("""
+            XENCONSOLED_TRACE=all
+            QEMU_XEN=/bin/false
+            """))
+
+        (rootfs_path / "var/log/xen/console").mkdir(parents=True)
+
+        root_home_dir = rootfs_path / "root"
+        root_home_dir.mkdir(parents=True)
+        run_tool_tests_script = xenroot / "automation/scripts/run-tools-tests"
+        run_tool_tests_script.copy_into(root_home_dir, preserve_metadata=True)
+
+        # VM config file
+        etc_xen = etc / "xen"
+        etc_xen.mkdir()
+        domU_type = "hvm"
+        domU_vif = "'bridge=xenbr0'"
+        (etc_xen / "domU.cfg").write_text(dedent(f"""\
+            type = '{domU_type}'
+            name = 'domU'
+            kernel = '/boot/vmlinuz-domU'
+            ramdisk = '/boot/initrd-domU'
+            cmdline = 'root=/dev/ram0 console=hvc0'
+            memory = 512
+            vif = [ {domU_vif} ]
+            disk = [ ]
+            """))
+
+        # rootfs archive
+        rootfs_dom0 = []
+        # Uncompressed first! Then compressed cpio archives!
+        rootfs_dom0.append(xenroot / "binaries/xen-tools.cpio.gz")
+        cpio_rootfs = xenroot / "binaries/dom0-rootfs.cpio.gz"
+        concatenate_cpios(rootfs_dom0, cpio_rootfs)
+        cpio_archive_from_dir(rootfs_path, cpio_rootfs)
+
+        self.xen_tools_rootfs = cpio_rootfs
+
+    def minimal(self) -> Path:
+        return self.minimal_rootfs
+
+    def dom0_tools(self) -> Path:
+        return self.xen_tools_rootfs
diff --git a/automation/pytest/test_boot.py b/automation/pytest/test_boot.py
new file mode 100644
index 000000000000..230cee96d0ba
--- /dev/null
+++ b/automation/pytest/test_boot.py
@@ -0,0 +1,32 @@
+import os
+from pathlib import Path
+import pytest
+
+from lib.boot_binary import BootBinary
+
+
+@pytest.fixture
+def xenroot_path() -> Path:
+    return Path("../..").resolve()
+
+
+@pytest.fixture
+def prepare_rootfs(tmp_path: Path,
+                   xenroot_path: Path,
+                   ) -> BootBinary:
+    static_gateway = os.environ['HOST_IP_GATEWAY']
+    http_pxe_path = os.environ["PXE_HTTP_PATH"]
+
+    boot_script = f"echo Dom0 ready\n"
+
+    return BootBinary(tmp_path,
+                      xenroot_path,
+                      vlan_id=int(os.environ['HOST_IP_VLANID']),
+                      pxe_host=os.environ["PXE_HOST"],
+                      http_pxe_path=http_pxe_path,
+                      static_ip=os.environ['HOST_IP4'],
+                      static_gateway=static_gateway,
+                      static_dns=static_gateway,
+                      static_ipv6=os.environ['HOST_IP6'],
+                      boot_script=boot_script,
+                      )
-- 
Anthony PERARD


