Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C98E7E0C4
	for <xen-devel@archiver.kernel.org>; Mon,  9 Feb 2026 10:47:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1225215.1531698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpOn9-0008GW-8E; Mon, 09 Feb 2026 10:46:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225215.1531698; Mon, 09 Feb 2026 10:46:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpOn9-0008GP-4W; Mon, 09 Feb 2026 10:46:55 +0000
Received: by outflank-mailman (input) for mailman id 1225215;
 Mon, 09 Feb 2026 10:46:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r8oy=AN=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vpOn8-0008GA-9V
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 10:46:54 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a414413b-05a4-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 11:46:51 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46E7D339;
 Mon,  9 Feb 2026 02:46:44 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.53.56])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA2123F63F;
 Mon,  9 Feb 2026 02:46:48 -0800 (PST)
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
X-Inumbo-ID: a414413b-05a4-11f1-b162-2bf370ae4941
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5] xen: Add Darwin.mk
Date: Mon,  9 Feb 2026 11:46:44 +0100
Message-ID: <49c0bd388d45b6936bd852d99fbbc262fb078253.1770633598.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen does not provide a Darwin build configuration useable on Mac OS.
It is possible to build Xen Hypervisor (tools are not supported) with a
toolchain able to produce ELF binaries (GCC or others).

Add config/Darwin.mk to include StdGNU.mk and force
XEN_COMPILE_ARCH=unknown, ensuring Darwin builds always follow
the cross-compile path so compiling on Mac OS is always handled as a
cross compilation case.

Only compiling the hypervisor has been tested !

An example of how to build the hypervisor for arm64 on Mac OS
(tools cannot be build for now) using a compiler from brew:
- brew install aarch64-elf-gcc aarch64-elf-binutils
- make XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-elf- HOSTCC=clang

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Change-Id: Iba91634afbaab58767bb8744b4b722ce5732a6dd
---
Changes since v4:
- Subect was "xen: Add Darwin.mk for GNU toolchains" but remove the GNU
  toolchains part as this could also work with Clang
- remove 'cd xen' from commit message
- simplify comment in Darwin.mk and rework commit message.

Changes since v3:
- set XEN_COMPILE_ARCH to unknown instead of Darwin
- list binutils as a dependency to install in brew in commit message

Changes since v2:
- Subject was "xen: Add macOS hypervisor build configuration"
- Update Darwin.mk comments to more accurate versions (Jan)
- Remove the build-on-macos help as we have no dependency on anything
  coming from brew anymore and the toolchain can be retrieved by lots of
  other solutions than brew on mac os. Switch to a simple doc in the
  commit message instead
---
 config/Darwin.mk | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 config/Darwin.mk

diff --git a/config/Darwin.mk b/config/Darwin.mk
new file mode 100644
index 000000000000..b1fc9ca859b0
--- /dev/null
+++ b/config/Darwin.mk
@@ -0,0 +1,6 @@
+# Use GNU tool definitions as the tools we are using are either GNU compatible
+# or we only use features which are supported on Mac OS.
+include $(XEN_ROOT)/config/StdGNU.mk
+
+# Cross compile on Mac OS, only hypervisor build has been tested, no tools
+XEN_COMPILE_ARCH = unknow
-- 
2.52.0


