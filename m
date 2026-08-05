Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352B9C56201
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 01:53:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382730.1626055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrQoZ-0007Rm-23; Wed, 05 Aug 2026 01:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382730.1626055; Wed, 05 Aug 2026 01:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrQoY-0007Rf-Tc; Wed, 05 Aug 2026 01:53:02 +0000
Received: by outflank-mailman (input) for mailman id 1382730;
 Wed, 05 Aug 2026 01:53:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1wrQoX-0007RR-1v
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 01:53:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wrQoV-0068PJ-2h;
 Wed, 05 Aug 2026 01:52:59 +0000
Received: from [203.221.94.45] (helo=Mac.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wrQoU-00CujO-3C;
 Wed, 05 Aug 2026 01:52:59 +0000
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
	bh=Lee8YbDbDbQD/PEEAUhgQiCV3VG2M8ylKmtExRHl+xg=; b=IqME4ytnnjn9USk2eu1wJs0TiW
	tVlwldlurKihxRUiDhT/sRbDNyQLAW29RBAymV6JhKTZvKReFxWYB8qdUAS5RwMxJ7MAgPEcZ+iKi
	Wa3Ne1hYbrZAvb8D/GtmLGnoPN1jDeR8tEoQjcpY8o1pm7H18R6xVZKYyMKDVwoIn12A=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/3] xen/scripts: import gen_compile_commands.py from Linux
Date: Wed,  5 Aug 2026 11:52:38 +1000
Message-ID: <20260805015247.41943-2-gwd@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805015247.41943-1-gwd@xenproject.org>
References: <20260805015247.41943-1-gwd@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen's Kbuild-derived build system records the exact command line used
to compile each object in .<target>.o.cmd files.  That is everything
needed to produce a compile_commands.json compilation database, the
format clangd and other tooling consume to provide accurate
cross-referencing (go to definition, find references, call hierarchy)
in LSP-capable editors.

Import scripts/clang-tools/gen_compile_commands.py from the Linux
kernel, unmodified, so that the provenance of the code is easy to
verify (commit 90efe2b9119f, Linux v6.16).

As-is the script produces an empty database on a Xen tree, since
Xen's compile command lines differ slightly from Linux's; the
following patch adapts it.

Assisted-by: LLM
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
 xen/scripts/gen_compile_commands.py | 228 ++++++++++++++++++++++++++++
 1 file changed, 228 insertions(+)
 create mode 100755 xen/scripts/gen_compile_commands.py

diff --git a/xen/scripts/gen_compile_commands.py b/xen/scripts/gen_compile_commands.py
new file mode 100755
index 0000000000..96e6e46ad1
--- /dev/null
+++ b/xen/scripts/gen_compile_commands.py
@@ -0,0 +1,228 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (C) Google LLC, 2018
+#
+# Author: Tom Roeder <tmroeder@google.com>
+#
+"""A tool for generating compile_commands.json in the Linux kernel."""
+
+import argparse
+import json
+import logging
+import os
+import re
+import subprocess
+import sys
+
+_DEFAULT_OUTPUT = 'compile_commands.json'
+_DEFAULT_LOG_LEVEL = 'WARNING'
+
+_FILENAME_PATTERN = r'^\..*\.cmd$'
+_LINE_PATTERN = r'^(saved)?cmd_[^ ]*\.o := (?P<command_prefix>.* )(?P<file_path>[^ ]*\.[cS]) *(;|$)'
+_VALID_LOG_LEVELS = ['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL']
+# The tools/ directory adopts a different build system, and produces .cmd
+# files in a different format. Do not support it.
+_EXCLUDE_DIRS = ['.git', 'Documentation', 'include', 'tools']
+
+def parse_arguments():
+    """Sets up and parses command-line arguments.
+
+    Returns:
+        log_level: A logging level to filter log output.
+        directory: The work directory where the objects were built.
+        ar: Command used for parsing .a archives.
+        output: Where to write the compile-commands JSON file.
+        paths: The list of files/directories to handle to find .cmd files.
+    """
+    usage = 'Creates a compile_commands.json database from kernel .cmd files'
+    parser = argparse.ArgumentParser(description=usage)
+
+    directory_help = ('specify the output directory used for the kernel build '
+                      '(defaults to the working directory)')
+    parser.add_argument('-d', '--directory', type=str, default='.',
+                        help=directory_help)
+
+    output_help = ('path to the output command database (defaults to ' +
+                   _DEFAULT_OUTPUT + ')')
+    parser.add_argument('-o', '--output', type=str, default=_DEFAULT_OUTPUT,
+                        help=output_help)
+
+    log_level_help = ('the level of log messages to produce (defaults to ' +
+                      _DEFAULT_LOG_LEVEL + ')')
+    parser.add_argument('--log_level', choices=_VALID_LOG_LEVELS,
+                        default=_DEFAULT_LOG_LEVEL, help=log_level_help)
+
+    ar_help = 'command used for parsing .a archives'
+    parser.add_argument('-a', '--ar', type=str, default='llvm-ar', help=ar_help)
+
+    paths_help = ('directories to search or files to parse '
+                  '(files should be *.o, *.a, or modules.order). '
+                  'If nothing is specified, the current directory is searched')
+    parser.add_argument('paths', type=str, nargs='*', help=paths_help)
+
+    args = parser.parse_args()
+
+    return (args.log_level,
+            os.path.realpath(args.directory),
+            args.output,
+            args.ar,
+            args.paths if len(args.paths) > 0 else [args.directory])
+
+
+def cmdfiles_in_dir(directory):
+    """Generate the iterator of .cmd files found under the directory.
+
+    Walk under the given directory, and yield every .cmd file found.
+
+    Args:
+        directory: The directory to search for .cmd files.
+
+    Yields:
+        The path to a .cmd file.
+    """
+
+    filename_matcher = re.compile(_FILENAME_PATTERN)
+    exclude_dirs = [ os.path.join(directory, d) for d in _EXCLUDE_DIRS ]
+
+    for dirpath, dirnames, filenames in os.walk(directory, topdown=True):
+        # Prune unwanted directories.
+        if dirpath in exclude_dirs:
+            dirnames[:] = []
+            continue
+
+        for filename in filenames:
+            if filename_matcher.match(filename):
+                yield os.path.join(dirpath, filename)
+
+
+def to_cmdfile(path):
+    """Return the path of .cmd file used for the given build artifact
+
+    Args:
+        Path: file path
+
+    Returns:
+        The path to .cmd file
+    """
+    dir, base = os.path.split(path)
+    return os.path.join(dir, '.' + base + '.cmd')
+
+
+def cmdfiles_for_a(archive, ar):
+    """Generate the iterator of .cmd files associated with the archive.
+
+    Parse the given archive, and yield every .cmd file used to build it.
+
+    Args:
+        archive: The archive to parse
+
+    Yields:
+        The path to every .cmd file found
+    """
+    for obj in subprocess.check_output([ar, '-t', archive]).decode().split():
+        yield to_cmdfile(obj)
+
+
+def cmdfiles_for_modorder(modorder):
+    """Generate the iterator of .cmd files associated with the modules.order.
+
+    Parse the given modules.order, and yield every .cmd file used to build the
+    contained modules.
+
+    Args:
+        modorder: The modules.order file to parse
+
+    Yields:
+        The path to every .cmd file found
+    """
+    with open(modorder) as f:
+        for line in f:
+            obj = line.rstrip()
+            base, ext = os.path.splitext(obj)
+            if ext != '.o':
+                sys.exit('{}: module path must end with .o'.format(obj))
+            mod = base + '.mod'
+            # Read from *.mod, to get a list of objects that compose the module.
+            with open(mod) as m:
+                for mod_line in m:
+                    yield to_cmdfile(mod_line.rstrip())
+
+
+def process_line(root_directory, command_prefix, file_path):
+    """Extracts information from a .cmd line and creates an entry from it.
+
+    Args:
+        root_directory: The directory that was searched for .cmd files. Usually
+            used directly in the "directory" entry in compile_commands.json.
+        command_prefix: The extracted command line, up to the last element.
+        file_path: The .c file from the end of the extracted command.
+            Usually relative to root_directory, but sometimes absolute.
+
+    Returns:
+        An entry to append to compile_commands.
+
+    Raises:
+        ValueError: Could not find the extracted file based on file_path and
+            root_directory or file_directory.
+    """
+    # The .cmd files are intended to be included directly by Make, so they
+    # escape the pound sign '#' as '$(pound)'. The compile_commands.json file
+    # is not interepreted by Make, so this code replaces the escaped version
+    # with '#'.
+    prefix = command_prefix.replace('$(pound)', '#')
+
+    # Return the canonical path, eliminating any symbolic links encountered in the path.
+    abs_path = os.path.realpath(os.path.join(root_directory, file_path))
+    if not os.path.exists(abs_path):
+        raise ValueError('File %s not found' % abs_path)
+    return {
+        'directory': root_directory,
+        'file': abs_path,
+        'command': prefix + file_path,
+    }
+
+
+def main():
+    """Walks through the directory and finds and parses .cmd files."""
+    log_level, directory, output, ar, paths = parse_arguments()
+
+    level = getattr(logging, log_level)
+    logging.basicConfig(format='%(levelname)s: %(message)s', level=level)
+
+    line_matcher = re.compile(_LINE_PATTERN)
+
+    compile_commands = []
+
+    for path in paths:
+        # If 'path' is a directory, handle all .cmd files under it.
+        # Otherwise, handle .cmd files associated with the file.
+        # built-in objects are linked via vmlinux.a
+        # Modules are listed in modules.order.
+        if os.path.isdir(path):
+            cmdfiles = cmdfiles_in_dir(path)
+        elif path.endswith('.a'):
+            cmdfiles = cmdfiles_for_a(path, ar)
+        elif path.endswith('modules.order'):
+            cmdfiles = cmdfiles_for_modorder(path)
+        else:
+            sys.exit('{}: unknown file type'.format(path))
+
+        for cmdfile in cmdfiles:
+            with open(cmdfile, 'rt') as f:
+                result = line_matcher.match(f.readline())
+                if result:
+                    try:
+                        entry = process_line(directory, result.group('command_prefix'),
+                                             result.group('file_path'))
+                        compile_commands.append(entry)
+                    except ValueError as err:
+                        logging.info('Could not add line from %s: %s',
+                                     cmdfile, err)
+
+    with open(output, 'wt') as f:
+        json.dump(sorted(compile_commands, key=lambda x: x["file"]), f, indent=2, sort_keys=True)
+
+
+if __name__ == '__main__':
+    main()
-- 
2.55.0


