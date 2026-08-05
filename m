Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A21FC55184
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 01:53:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382731.1626063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrQob-0007fE-6h; Wed, 05 Aug 2026 01:53:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382731.1626063; Wed, 05 Aug 2026 01:53:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrQob-0007f7-41; Wed, 05 Aug 2026 01:53:05 +0000
Received: by outflank-mailman (input) for mailman id 1382731;
 Wed, 05 Aug 2026 01:53:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1wrQoZ-0007eX-Sp
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 01:53:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wrQoY-0068QR-2v;
 Wed, 05 Aug 2026 01:53:02 +0000
Received: from [203.221.94.45] (helo=Mac.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wrQoY-00CujO-0D;
 Wed, 05 Aug 2026 01:53:02 +0000
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
	bh=EQ1BgccOExwdWoWHGsLFxtseXR3eMpL+XYbSkxSyAEo=; b=f/HIkpQwJwcgU1rtgixLQ1KwFo
	pv5nECO/LoGehysoJ5oMBZ5X0DQmHceC3R+tDZn+i+ccIf/w9PmcXom0dA8SL2AlyaYhXsQGgRe8r
	KNJk2QtuimWrMjZImPtGV9YYrydccrjp2zE4DAn+Nnug8CbZ/B3OZ5pVXteIEkauUEAU=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/3] xen/scripts: adapt gen_compile_commands.py to Xen
Date: Wed,  5 Aug 2026 11:52:39 +1000
Message-ID: <20260805015247.41943-3-gwd@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805015247.41943-1-gwd@xenproject.org>
References: <20260805015247.41943-1-gwd@xenproject.org>
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
 xen/scripts/gen_compile_commands.py | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/xen/scripts/gen_compile_commands.py b/xen/scripts/gen_compile_commands.py
index 96e6e46ad1..9abc6410c1 100755
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
@@ -19,7 +19,10 @@ _DEFAULT_OUTPUT = 'compile_commands.json'
 _DEFAULT_LOG_LEVEL = 'WARNING'
 
 _FILENAME_PATTERN = r'^\..*\.cmd$'
-_LINE_PATTERN = r'^(saved)?cmd_[^ ]*\.o := (?P<command_prefix>.* )(?P<file_path>[^ ]*\.[cS]) *(;|$)'
+# Unlike Linux, Xen's compile commands do not end with the source file:
+# cmd_cc_o_c places "-c $<" before "-o" and "-MQ".  Capture the command up
+# to and including "-c" plus the source file, and drop the remainder.
+_LINE_PATTERN = r'^(saved)?cmd_[^ ]*\.o := (?P<command_prefix>.* -c )(?P<file_path>[^ ]*\.[cS])( .*)?$'
 _VALID_LOG_LEVELS = ['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL']
 # The tools/ directory adopts a different build system, and produces .cmd
 # files in a different format. Do not support it.
@@ -35,10 +38,10 @@ def parse_arguments():
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


