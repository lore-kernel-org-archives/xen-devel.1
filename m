Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F65EC1EA2
	for <xen-devel@archiver.kernel.org>; Thu,  5 Feb 2026 11:34:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1221775.1529929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnxcd-0004MZ-Gt; Thu, 05 Feb 2026 11:34:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221775.1529929; Thu, 05 Feb 2026 11:34:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnxcd-0004MP-EO; Thu, 05 Feb 2026 11:34:07 +0000
Received: by outflank-mailman (input) for mailman id 1221775;
 Thu, 05 Feb 2026 11:34:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BdQL=AJ=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vnxcb-0003et-TY
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 11:34:05 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 938d62e2-0286-11f1-b161-2bf370ae4941;
 Thu, 05 Feb 2026 12:34:05 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C3A1339;
 Thu,  5 Feb 2026 03:33:58 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.53.248])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B2E3A3F778;
 Thu,  5 Feb 2026 03:34:02 -0800 (PST)
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
X-Inumbo-ID: 938d62e2-0286-11f1-b161-2bf370ae4941
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] xen: Add macOS hypervisor build configuration
Date: Thu,  5 Feb 2026 12:33:54 +0100
Message-ID: <d30deb8fa22291beb64eb179e8e2d55d13ef27dd.1770291000.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen does not currently document how to build the hypervisor on macOS, and
there is no Darwin configuration for selecting a Homebrew-based GNU
toolchain. Native builds are not supported; the hypervisor must be
cross-built with a GNU toolchain and GNU make/sed.

Add a minimal Darwin.mk which selects the GNU tool definitions used by
the macOS workflow and point to the build guide for required tools and
setup. Document the Homebrew cross toolchain and GNU tools needed to
build the hypervisor on macOS.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 config/Darwin.mk            |  6 ++++
 docs/misc/build-on-macos.md | 66 +++++++++++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 config/Darwin.mk
 create mode 100644 docs/misc/build-on-macos.md

diff --git a/config/Darwin.mk b/config/Darwin.mk
new file mode 100644
index 000000000000..a4e3efa81842
--- /dev/null
+++ b/config/Darwin.mk
@@ -0,0 +1,6 @@
+# Use GNU tool definitions; the macOS workflow relies on Homebrew GNU tools.
+# See docs/misc/build-on-macos.md for required tools and setup.
+include $(XEN_ROOT)/config/StdGNU.mk
+
+# We are always cross compiling so fake COMPILE_ARCH
+XEN_COMPILE_ARCH = Darwin
diff --git a/docs/misc/build-on-macos.md b/docs/misc/build-on-macos.md
new file mode 100644
index 000000000000..6b56cd8eccab
--- /dev/null
+++ b/docs/misc/build-on-macos.md
@@ -0,0 +1,66 @@
+# Building Xen Hypervisor on macOS
+
+This guide explains how to cross-compile the Xen hypervisor (xen
+subdirectory only) on macOS. This does **not** build the tools.
+
+## Prerequisites
+
+Install the following packages using Homebrew:
+
+```bash
+# Cross-compilation toolchain for ARM64
+brew install aarch64-elf-gcc
+
+# GNU tools (required for compatibility)
+brew install make gnu-sed
+```
+
+Homebrew installs under `/opt/homebrew` on Apple Silicon and `/usr/local` on
+Intel Macs. Adjust paths below accordingly.
+
+### Verification
+
+Verify your installation:
+
+```bash
+# Check cross compiler
+aarch64-elf-gcc --version
+
+# Check GNU make (adjust prefix if needed)
+/opt/homebrew/opt/make/libexec/gnubin/make --version
+
+# Check GNU sed (adjust prefix if needed)
+/opt/homebrew/opt/gnu-sed/libexec/gnubin/sed --version
+```
+
+## Building the Hypervisor
+
+Set up GNU tools in PATH and build:
+
+```bash
+# Set up GNU tools in PATH (adjust prefix if needed)
+export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:/opt/homebrew/opt/make/libexec/gnubin:$PATH"
+
+# Build Xen hypervisor only (in-tree)
+cd xen/
+make XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-elf- HOSTCC=gcc
+
+# Optional: out-of-tree build directory
+# make XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-elf- HOSTCC=gcc O=$PWD/build-mac
+```
+
+## Architecture Support
+
+Currently supported architectures:
+
+- **ARM64** (`arm64`) - Default, uses `aarch64-elf-gcc`
+
+Other targets may work if the corresponding cross toolchain is installed,
+but this guide has only been tested on ARM64.
+
+## Limitations
+
+- **Hypervisor only**: This only builds the Xen hypervisor, not the tools
+- **Cross-compilation only**: Native builds are not supported
+- **macOS-specific**: Instructions optimized for macOS with Homebrew
+- **GNU tools required**: Native BSD tools are not compatible
-- 
2.52.0


