Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475F7EB28D6
	for <xen-devel@archiver.kernel.org>; Fri,  6 Feb 2026 08:17:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1222902.1530577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voH1v-00087P-TN; Fri, 06 Feb 2026 08:17:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222902.1530577; Fri, 06 Feb 2026 08:17:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voH1v-00087I-Qo; Fri, 06 Feb 2026 08:17:31 +0000
Received: by outflank-mailman (input) for mailman id 1222902;
 Fri, 06 Feb 2026 08:17:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qUCI=AK=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1voH1u-00084v-Rd
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 08:17:30 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 452dc470-0334-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Feb 2026 09:17:26 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2ED0B339;
 Fri,  6 Feb 2026 00:17:19 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.55.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F048F3F740;
 Fri,  6 Feb 2026 00:17:23 -0800 (PST)
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
X-Inumbo-ID: 452dc470-0334-11f1-9ccf-f158ae23cfc8
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3] xen: Add Darwin.mk for GNU toolchains
Date: Fri,  6 Feb 2026 09:17:17 +0100
Message-ID: <a3837d27d473763a667596841754398e7d67df46.1770365754.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen does not provide a Darwin build configuration for selecting
GNU tool definitions. On macOS, the tools we use are either GNU
compatible or we only rely on features supported by Mac OS, so
using the GNU tool definitions is appropriate.

Add config/Darwin.mk to include StdGNU.mk and force
XEN_COMPILE_ARCH=Darwin, ensuring Darwin builds always follow
the cross-compile path as we depend on the Linux ABI so compiling
on Mac OS is always a cross compilation case.

An example of how to build the hypervisor for arm64 on Mac OS
(tools cannot be build for now) using a compiler from brew:
- brew install aarch64-elf-gcc
- cd xen
- make XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-elf- HOSTCC=gcc

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes since v2:
- Subject was "xen: Add macOS hypervisor build configuration"
- Update Darwin.mk comments to more accurate versions (Jan)
- Remove the build-on-macos help as we have no dependency on anything
  coming from brew anymore and the toolchain can be retrieved by lots of
  other solutions than brew on mac os. Switch to a simple doc in the
  commit message instead
---
 config/Darwin.mk | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 config/Darwin.mk

diff --git a/config/Darwin.mk b/config/Darwin.mk
new file mode 100644
index 000000000000..427588eaf899
--- /dev/null
+++ b/config/Darwin.mk
@@ -0,0 +1,7 @@
+# Use GNU tool definitions as the tools we are using are either GNU compatible
+# or we only use features which are supported on Mac OS.
+include $(XEN_ROOT)/config/StdGNU.mk
+
+# Xen uses Linux'es ABI so we are cross compiling on Mac OS.
+# Force COMPILE_ARCH to a fake value to make sure it is always the case.
+XEN_COMPILE_ARCH = Darwin
-- 
2.52.0


