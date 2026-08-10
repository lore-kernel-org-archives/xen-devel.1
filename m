Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9234CC5AD7B
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 09:51:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387269.1628537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtMew-0003Bp-66; Mon, 10 Aug 2026 09:51:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387269.1628537; Mon, 10 Aug 2026 09:51:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtMew-0003Bi-2w; Mon, 10 Aug 2026 09:51:06 +0000
Received: by outflank-mailman (input) for mailman id 1387269;
 Mon, 10 Aug 2026 09:51:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1wtMeu-0002ya-H7
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 09:51:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wtMet-00Ef1T-21;
 Mon, 10 Aug 2026 09:51:03 +0000
Received: from [217.155.165.12] (helo=localhost.localdomain)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wtMet-0066Tx-0J;
 Mon, 10 Aug 2026 09:51:03 +0000
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
	bh=LeEkJR3wDbFHkguioVrXqEE8FwRBWi05Kbj07PLC7cQ=; b=H0+YJe1MKYv4xfnK6X3L3qR+TV
	MeoyYG7k9NupZWxt2mQDA9UXMVZbsr5hNkvOw13kPfxWgQfCVHyAXdTLKYIhE37qSoBU+wZ6R1xae
	ttW/9mrJUlm+dQ3s6vxsvTcQTTgmsAoTGYpGFofRTqcynUf8vI8G9C0XJhqTDptI3AyM=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/3] xen/scripts: adapt gen_compile_commands.py to Xen
Date: Mon, 10 Aug 2026 10:49:44 +0100
Message-ID: <20260810095056.29884-3-gwd@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260810095056.29884-1-gwd@xenproject.org>
References: <20260810095056.29884-1-gwd@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two changes from the Linux original:

 - Linux's compiler invocations end with the source file
   ("... -c -o foo.o foo.c"), and the script's line pattern relies
   on that; Xen's cmd_cc_o_c places "-c $<" before "-o" and "-MQ",
   so on a Xen object tree the unmodified script matches nothing and
   produces an empty database.  Adjust _LINE_PATTERN to capture the
   command up to and including "-c" plus the source file, dropping
   the remainder, which database consumers do not need.

 - Reword the docstring and help text to refer to Xen.

The support for reading object lists from archives and modules.order
is unused in Xen but retained to minimise divergence from the
original.

Assisted-by: LLM
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
v2: Reword the _LINE_PATTERN comment to describe what the dropped
remainder is, rather than commenting on the change relative to Linux.
---
 xen/scripts/gen_compile_commands.py | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/xen/scripts/gen_compile_commands.py b/xen/scripts/gen_compile_commands.py
index 96e6e46ad1..1c9b05e4dd 100755
--- a/xen/scripts/gen_compile_commands.py
+++ b/xen/scripts/gen_compile_commands.py
@@ -5,7 +5,7 @@
 #
 # Author: Tom Roeder <tmroeder@google.com>
 #
-"""A tool for generating compile_commands.json in the Linux kernel."""
+"""A tool for generating compile_commands.json for the Xen hypervisor."""
 
 import argparse
 import json
@@ -19,7 +19,11 @@ _DEFAULT_OUTPUT = 'compile_commands.json'
 _DEFAULT_LOG_LEVEL = 'WARNING'
 
 _FILENAME_PATTERN = r'^\..*\.cmd$'
-_LINE_PATTERN = r'^(saved)?cmd_[^ ]*\.o := (?P<command_prefix>.* )(?P<file_path>[^ ]*\.[cS]) *(;|$)'
+# Capture the command up to and including "-c" plus the source file, and
+# drop the remainder: all that follows the source file is the output
+# location and dependency-tracking arguments ("-o ...", "-MQ ..."), which
+# database consumers do not need.
+_LINE_PATTERN = r'^(saved)?cmd_[^ ]*\.o := (?P<command_prefix>.* -c )(?P<file_path>[^ ]*\.[cS])( .*)?$'
 _VALID_LOG_LEVELS = ['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL']
 # The tools/ directory adopts a different build system, and produces .cmd
 # files in a different format. Do not support it.
@@ -35,10 +39,10 @@ def parse_arguments():
         output: Where to write the compile-commands JSON file.
         paths: The list of files/directories to handle to find .cmd files.
     """
-    usage = 'Creates a compile_commands.json database from kernel .cmd files'
+    usage = 'Creates a compile_commands.json database from Xen .cmd files'
     parser = argparse.ArgumentParser(description=usage)
 
-    directory_help = ('specify the output directory used for the kernel build '
+    directory_help = ('specify the output directory used for the Xen build '
                       '(defaults to the working directory)')
     parser.add_argument('-d', '--directory', type=str, default='.',
                         help=directory_help)
-- 
2.55.0


