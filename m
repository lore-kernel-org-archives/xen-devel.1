Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A09CA5FB3
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 11:52:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438263.1657140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCFKx-0003Yj-Vi; Thu, 01 Oct 2026 11:52:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438263.1657140; Thu, 01 Oct 2026 11:52:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCFKx-0003Yc-Sw; Thu, 01 Oct 2026 11:52:31 +0000
Received: by outflank-mailman (input) for mailman id 1438263;
 Thu, 01 Oct 2026 11:52:31 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <titouan.christophe@essensium.com>)
 id 1xCFKw-0003YW-6h
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 11:52:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCFKv-0006tl-E5
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 13:52:29 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <titouan.christophe@essensium.com>)
 id 6abe4963-bab6-0a2a0a5309dd-0a2a4508b992-38
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 13:52:29 +0200
Received: from [74.125.228.171] (helo=mail-ej2-f43.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <titouan.christophe@essensium.com>)
 id 6abe497d-f659-0a2a45080019-4a7de4aba3a5-3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 13:52:29 +0200
Received: by mail-ej2-f43.google.com with SMTP id
 a640c23a62f3a-c2e20bb4583so257267866b.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 04:52:29 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2e31c944aesm142248666b.17.2026.10.01.04.52.28
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2026 04:52:28 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=mind.be header.i="@mind.be" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google; t=1790855549; x=1791460349; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1LuPQtkjuq/IETZZ3B87abIAFWuwNq0Qb7879Nam4zY=;
        b=PZmpNHpr1cCI56Y3/LR+u/PcAK0LZsuIoBpGiFyY4Ee0bZeXrdlhj929AWeDd7+tsa
         WPLoKMbW5pEcQdmnNl62DGJwO6i+prI2jxcuk3O0F0mZiXaYlTRax2dufn1a7P8ElWRr
         pTbde5KzZTerkDzeT4f+nHKTpi5EmR8DUo0b6ETJ0hOJRvW1xuBJ3iekvCz+HDP13m9R
         sII1X5neOER9ti69RlMJv4NjVJ6ce2furgbCPTU6rU4PsDzUWTeOLe2KWGOGTvIqGT8r
         fFJInkrxWSmiXvD6s2lGewPHweMKkW743a2K4YOx81trZD+2jKjswTf9Gd+opfstvUdS
         3xIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790855549; x=1791460349;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1LuPQtkjuq/IETZZ3B87abIAFWuwNq0Qb7879Nam4zY=;
        b=ff7ZK+XkZ9f1tHXgpDlOktK2zjjB+LzU8WMqxzmnMgULypavyrT0vsVspwrpO2En7U
         1S6Ub0Vka8tMCWRjuYkTCXeN2luD9ioJQr94wgZB/ZOZFWMhYhKyrRppPl+nNQ+lsLSg
         iC6qCr8XQTP7HmxEM8jWwW6bbkeIg6eoFqmgDsyMU0ySmSsD4XD+KDIautXduTWtGZ7z
         MF4t2z/V9iEgcLp3N4xhxUM24KAwlcgVmzJ2+BZcAig0y3BVtyyl7Fih1xWjjUgXPtvw
         /tV4MHK23jV+7F62gG5ZqHUKJPY6M/kvQ/6+7HJppTiqWsj/dCbVxGaGakpUBm9/1aMY
         arGg==
X-Gm-Message-State: AFuF++nPjABLeUizEpyVm2joAlVgk1A77SsNBsxi3XI7GJ2llTtG6IYV
	v3DPVqIimER3dA/JLiXvWRHRK8oLzKMVR5O5ue8fwmnOKsMm3KfSerk4rsZMRfKKo/sAnoN5YJl
	VI9Y/
X-Gm-Gg: AYBFou3AXRn+nVDgIZhYjcA0Zd9kLQ1ThNsYxF6ZVOUqLGbrpNEVF871scdWRNsh/dA
	wyx6J1+/axRyJpUm7bjEFF/lWZ/7e5vCivDHj+A04kNXAls6eAkh5zaDdVs7L8290Y7HOx1Gfx8
	z00lHRkcyfIJfRqZacSC+AYrju6zWhMj/PtiQA/2OGNRgC2yN0PBuM6bwVkWBnvLHi6DyCSRev2
	vCuqd7PcASVYQFGAcgjusdBuWUCFkoAfhBU4aT2tnR7XkU2DKn24p/p+EGhWIBOkEuPjyO3nqN3
	buA9NqfSxm8Gij1KFZnGwu6Li09x5tAwoghwQ5z2cFu9o4+g+Sl1Or16/om8GS0dTQ9rrhp77lZ
	06S7fW92buMQNgWboqg2sQR/9d0JDaQm8hkadBSHQmlVVNLZD0zMj+GYRqXoCYeAkN84MzTj0Ua
	InnEeaiY1bBySzmGg3lwxDtfaGFuh6rU8FLhXyMmDHuBf1HVWTjHW1Oo7Zs8SJ4jkyPVwz4pAxw
	mvUNobcSlA=
X-Received: by 2002:a17:907:c15:b0:c2d:ca78:ea83 with SMTP id a640c23a62f3a-c2e23df5c63mr394338266b.38.1790855548583;
        Thu, 01 Oct 2026 04:52:28 -0700 (PDT)
From: Titouan Christophe <titouan.christophe@mind.be>
To: xen-devel@lists.xenproject.org
Subject: [PATCH test-artifacts] Build minimal images with Buildroot
Date: Thu,  1 Oct 2026 13:52:25 +0200
Message-ID: <20261001115226.471814-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1790855549-D4D7087B-0E3D8B95/0/0
X-purgate-type: clean
X-purgate-size: 12760

Add a way to build minimal Xen + Linux dom0 images, and their corresponding
cross-compilation toolchains with Buildroot [1]. This effectively provides
a consistent cross-architecture development environment.

Buildroot is a project that makes it easy to build embedded system images,
including Linux, Xen or bootloaders. Leverage that build system to build
minimal images for use in the CI environment of Xen sub-projects, namely
Unikraft.

This approach is based on a Buildroot External tree [2] which currently only
provides 2 target defconfigs (arm64 and x86_64, both running on qemu).
It uses a recent development version of Buildroot that integrates changes
to build Xen on x86_64 [3], on its latest official version 4.22.0 [4].
It also includes the latest kernel (linux-7.2.7 at the time of writing).

As a byproduct, aside xen+kernel+rootfs, we also get a cross-compilation
toolchain (that runs on x86_64 hosts). This makes it easy to cross-compile
domUs for arm64, and it alleviates dynamic libraries mismatches when
adding userspace programs to the dom0 Linux image. As an example, one such
problem: Alpine linux is based on musl while your regular development
computer is probably based on glibc, which causes issues if you are
recompiling `xl` and try to use it in the Alpine image.

[1] https://buildroot.org/
[2] https://buildroot.org/downloads/manual/manual.html#outside-br-custom
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/0bf8b2ecee6b1b41746e8863b57c2c5ba3a623b1
[4] https://gitlab.com/buildroot.org/buildroot/-/commit/a962be2eea146e06661712159698bc7cbf3305f2

This work is derived from this original series:
https://gitlab.com/xen-project/fusa/unikraft/-/merge_requests/1

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 .gitlab-ci.yml                                | 20 ++++++++++
 br2-xendevel-external/.gitignore              |  2 +
 br2-xendevel-external/Config.in               |  9 +++++
 .../board/xendevel/common/rootfs-prune.sh     | 21 ++++++++++
 .../xendevel/x86_64/linux-xen-dom0.fragment   | 40 +++++++++++++++++++
 .../configs/xendevel_dom0_arm64_defconfig     | 34 ++++++++++++++++
 .../configs/xendevel_dom0_x86_64_defconfig    | 38 ++++++++++++++++++
 br2-xendevel-external/external.desc           |  2 +
 br2-xendevel-external/external.mk             |  9 +++++
 scripts/build-buildroot.sh                    | 35 ++++++++++++++++
 10 files changed, 210 insertions(+)
 create mode 100644 br2-xendevel-external/.gitignore
 create mode 100644 br2-xendevel-external/Config.in
 create mode 100755 br2-xendevel-external/board/xendevel/common/rootfs-prune.sh
 create mode 100644 br2-xendevel-external/board/xendevel/x86_64/linux-xen-dom0.fragment
 create mode 100644 br2-xendevel-external/configs/xendevel_dom0_arm64_defconfig
 create mode 100644 br2-xendevel-external/configs/xendevel_dom0_x86_64_defconfig
 create mode 100644 br2-xendevel-external/external.desc
 create mode 100644 br2-xendevel-external/external.mk
 create mode 100755 scripts/build-buildroot.sh

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d04822f..8db3a0b 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -81,3 +81,23 @@ linux-6.6.56-x86_64:
 microcode-x86:
   extends: .x86_64-artifacts
   script: ./scripts/x86-microcode.sh
+
+
+#
+# Buildroot based artifacts
+#
+buildroot:
+  extends: .artifacts
+  image:
+    name: registry.gitlab.com/buildroot.org/buildroot/base:20250218.2110
+  parallel:
+    matrix:
+      - VARIANT: [arm64, x86_64]
+  cache:
+    key: buildroot-dl-${VARIANT}
+    paths:
+      - br2-xendevel-external/dl/
+  script:
+    - ./scripts/build-buildroot.sh "${VARIANT}"
+    - mkdir -p binaries
+    - cp br2-xendevel-external/xen-${VARIANT}/images/* binaries/
diff --git a/br2-xendevel-external/.gitignore b/br2-xendevel-external/.gitignore
new file mode 100644
index 0000000..424351b
--- /dev/null
+++ b/br2-xendevel-external/.gitignore
@@ -0,0 +1,2 @@
+xen-arm64
+xen-x86_64
diff --git a/br2-xendevel-external/Config.in b/br2-xendevel-external/Config.in
new file mode 100644
index 0000000..3c8e444
--- /dev/null
+++ b/br2-xendevel-external/Config.in
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: BSD-3-Clause
+#
+# Kconfig entry point for the XENDEVEL external tree. Entries appear under
+# "External options -> Xen dom0 + Unikraft domU development environment" in
+# `make menuconfig`.
+#
+# No XENDEVEL packages are defined yet; add
+#   source "$BR2_EXTERNAL_XENDEVEL_PATH/package/<name>/Config.in"
+# lines here as they are introduced.
diff --git a/br2-xendevel-external/board/xendevel/common/rootfs-prune.sh b/br2-xendevel-external/board/xendevel/common/rootfs-prune.sh
new file mode 100755
index 0000000..7e3a661
--- /dev/null
+++ b/br2-xendevel-external/board/xendevel/common/rootfs-prune.sh
@@ -0,0 +1,21 @@
+#!/bin/sh
+# SPDX-License-Identifier: BSD-3-Clause
+#
+# Buildroot post-build script: shrink the dom0 target filesystem so the cpio
+# initramfs unpacks inside the dom0 memory window. $1 is the target directory.
+set -e
+T="$1"
+
+# qemu-xen BIOS/ROM/keymap blobs (~283MB) — unused by PV/PVH guests.
+rm -rf "$T/usr/share/qemu-xen"
+
+# Docs / man / info — not needed at runtime.
+rm -rf "$T/usr/share/doc" "$T/usr/share/man" "$T/usr/share/info"
+
+# The arch default kernel config is monolithic enough to boot dom0 without
+# loadable modules for the smoke test. Keep the xen-related modules if present,
+# drop the rest to shrink the initramfs.
+if [ -d "$T/lib/modules" ]; then
+	find "$T/lib/modules" -type f -name '*.ko' \
+		! -path '*xen*' -delete 2>/dev/null || true
+fi
diff --git a/br2-xendevel-external/board/xendevel/x86_64/linux-xen-dom0.fragment b/br2-xendevel-external/board/xendevel/x86_64/linux-xen-dom0.fragment
new file mode 100644
index 0000000..a999333
--- /dev/null
+++ b/br2-xendevel-external/board/xendevel/x86_64/linux-xen-dom0.fragment
@@ -0,0 +1,40 @@
+# Linux kernel config fragment: x86_64 Xen dom0.
+#
+# The stock x86_64 kernel defconfig does NOT enable Xen (CONFIG_XEN is not set),
+# so the resulting bzImage carries no Xen PV ELF notes / PVH entry and Xen
+# refuses to build dom0 ("Will only load images built for the generic loader or
+# Linux images ... or with PHYS32_ENTRY set" / "Could not construct d0"). Turn on
+# Xen PV+PVH dom0, the hvc console, and the backend/toolstack devices (evtchn,
+# gntdev, gntalloc, xenfs, blk/net back) so the xl toolstack can drive the domU.
+CONFIG_HYPERVISOR_GUEST=y
+CONFIG_PARAVIRT=y
+CONFIG_XEN=y
+CONFIG_XEN_PV=y
+CONFIG_XEN_PV_SMP=y
+CONFIG_XEN_DOM0=y
+CONFIG_XEN_PV_DOM0=y
+CONFIG_XEN_PVH=y
+CONFIG_XEN_PVHVM=y
+CONFIG_XEN_SAVE_RESTORE=y
+CONFIG_XEN_BACKEND=y
+CONFIG_XENFS=y
+CONFIG_XEN_COMPAT_XENFS=y
+CONFIG_XEN_SYS_HYPERVISOR=y
+CONFIG_XEN_XENBUS_FRONTEND=y
+CONFIG_XEN_GNTDEV=y
+CONFIG_XEN_GRANT_DEV_ALLOC=y
+CONFIG_XEN_DEV_EVTCHN=y
+CONFIG_XEN_PRIVCMD=y
+CONFIG_XEN_BLKDEV_FRONTEND=y
+CONFIG_XEN_BLKDEV_BACKEND=y
+CONFIG_XEN_NETDEV_FRONTEND=y
+CONFIG_XEN_NETDEV_BACKEND=y
+CONFIG_HVC_XEN=y
+CONFIG_HVC_XEN_FRONTEND=y
+CONFIG_TTY=y
+# Monolithic kernel: build everything in, no loadable modules. This drops the
+# whole udev/libkmod module-loading path at boot (no .ko files to insert), so
+# the rootfs can also drop kmod + eudev. Every driver this QEMU dom0 needs
+# (ata_piix, e1000, virtio, 9p, xen blk/net back) is already =y in the x86_64
+# arch default config, so nothing required is lost.
+# CONFIG_MODULES is not set
diff --git a/br2-xendevel-external/configs/xendevel_dom0_arm64_defconfig b/br2-xendevel-external/configs/xendevel_dom0_arm64_defconfig
new file mode 100644
index 0000000..cb802a8
--- /dev/null
+++ b/br2-xendevel-external/configs/xendevel_dom0_arm64_defconfig
@@ -0,0 +1,34 @@
+# aarch64 Xen dom0: hypervisor + xl toolstack + Linux
+
+BR2_aarch64=y
+BR2_cortex_a72=y
+
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
+
+BR2_TARGET_GENERIC_HOSTNAME="xen-dom0"
+BR2_TARGET_GENERIC_ISSUE="Xen dom0 (br2-xendevel-external)"
+BR2_TARGET_GENERIC_GETTY_PORT="console"
+
+# devtmpfs mounted by init + eudev, so /dev/null and the Xen
+# gnttab/evtchn/privcmd device nodes exist at runtime.
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+BR2_PACKAGE_XEN=y
+BR2_PACKAGE_XEN_HYPERVISOR=y
+BR2_PACKAGE_XEN_TOOLS=y
+
+BR2_PACKAGE_KMOD=y
+BR2_PACKAGE_UTIL_LINUX_BINARIES=y
+
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_CPIO_GZIP=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_ROOTFS_POST_BUILD_SCRIPT="$(BR2_EXTERNAL_XENDEVEL_PATH)/board/xendevel/common/rootfs-prune.sh"
+
+BR2_PACKAGE_HOST_ENVIRONMENT_SETUP=y
diff --git a/br2-xendevel-external/configs/xendevel_dom0_x86_64_defconfig b/br2-xendevel-external/configs/xendevel_dom0_x86_64_defconfig
new file mode 100644
index 0000000..7e0d894
--- /dev/null
+++ b/br2-xendevel-external/configs/xendevel_dom0_x86_64_defconfig
@@ -0,0 +1,38 @@
+# x86_64 Xen dom0: hypervisor + xl toolstack + Linux
+
+BR2_x86_64=y
+
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE=y
+
+BR2_TARGET_GENERIC_HOSTNAME="xen-dom0"
+BR2_TARGET_GENERIC_ISSUE="Xen dom0 (br2-xendevel-external)"
+BR2_TARGET_GENERIC_GETTY_PORT="console"
+
+# The monolithic kernel has CONFIG_DEVTMPFS_MOUNT=y, so it creates every dev
+# (including the Xen control nodes /dev/xen/{evtchn,gntdev,privcmd,...} that
+# xenstored/xenconsoled need) at driver registration. That removes the need for
+# a userspace device manager and the libkmod/udev boot noise entirely.
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
+
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(BR2_EXTERNAL_XENDEVEL_PATH)/board/xendevel/x86_64/linux-xen-dom0.fragment"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
+
+BR2_PACKAGE_XEN=y
+BR2_PACKAGE_XEN_HYPERVISOR=y
+BR2_PACKAGE_XEN_TOOLS=y
+
+# No kmod: the kernel is monolithic (CONFIG_MODULES=n), so there are no modules
+# to insert and nothing links against libkmod. Dropping it (and eudev, above)
+# removes the only consumer that was failing on the missing libkmod.so.2.
+
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_CPIO_GZIP=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_ROOTFS_POST_BUILD_SCRIPT="$(BR2_EXTERNAL_XENDEVEL_PATH)/board/xendevel/common/rootfs-prune.sh"
+
+BR2_PACKAGE_HOST_ENVIRONMENT_SETUP=y
diff --git a/br2-xendevel-external/external.desc b/br2-xendevel-external/external.desc
new file mode 100644
index 0000000..232eb0e
--- /dev/null
+++ b/br2-xendevel-external/external.desc
@@ -0,0 +1,2 @@
+name: XENDEVEL
+desc: Xen development environment
diff --git a/br2-xendevel-external/external.mk b/br2-xendevel-external/external.mk
new file mode 100644
index 0000000..37cd1d8
--- /dev/null
+++ b/br2-xendevel-external/external.mk
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: BSD-3-Clause
+#
+# Buildroot external tree makefile fragment.
+#
+# Every package/*/*.mk under this tree is included by Buildroot. There are no
+# XENDEVEL-specific packages yet: the tree currently provides the dom0
+# defconfigs and board support files only.
+
+include $(sort $(wildcard $(BR2_EXTERNAL_XENDEVEL_PATH)/package/*/*.mk))
diff --git a/scripts/build-buildroot.sh b/scripts/build-buildroot.sh
new file mode 100755
index 0000000..73ab123
--- /dev/null
+++ b/scripts/build-buildroot.sh
@@ -0,0 +1,35 @@
+#!/usr/bin/env bash
+
+set -e -o pipefail
+
+BR2_EXT_DIR=$(realpath $(dirname $0)/../br2-xendevel-external)
+
+BR_REPO=https://gitlab.com/buildroot.org/buildroot
+# First Buildroot version (2026.08-345-ga962be2eea) with Xen 4.22 on x86_64
+BR_COMMIT=a962be2eea146e06661712159698bc7cbf3305f2
+BR_DIR=${BR2_EXT_DIR}/buildroot
+export BR2_DL_DIR=${BR2_EXT_DIR}/dl
+
+# Not using `git clone --revision` as it requires git >= 2.49
+if [ "$(git -C ${BR_DIR} rev-parse HEAD 2>/dev/null)" != "${BR_COMMIT}" ]; then
+	git init -q ${BR_DIR}
+	git -C ${BR_DIR} fetch --depth=1 ${BR_REPO} ${BR_COMMIT}
+	git -C ${BR_DIR} checkout -q FETCH_HEAD
+fi
+
+do_build() {	
+	build_dir=${BR2_EXT_DIR}/xen-${1}
+	make BR2_EXTERNAL=${BR2_EXT_DIR} O=${build_dir} -C ${BR_DIR} xendevel_dom0_${1}_defconfig
+	make -C ${build_dir} source all sdk | grep '>>>'
+}
+
+for arg in $*; do
+	case "$arg" in
+		arm64|x86_64)
+			do_build $arg
+			;;
+		*)
+			echo "Unknown target $arg" >&2
+			exit 1
+	esac
+done
-- 
2.55.0


