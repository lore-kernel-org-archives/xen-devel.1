Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF85C982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 10:29:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428556.1651407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xkP-0006q2-WC; Tue, 22 Sep 2026 10:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428556.1651407; Tue, 22 Sep 2026 10:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xkP-0006ps-Pb; Tue, 22 Sep 2026 10:29:13 +0000
Received: by outflank-mailman (input) for mailman id 1428556;
 Tue, 22 Sep 2026 10:29:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1x8xkO-0006mx-8k
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 10:29:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1x8xkN-00ApBn-1O;
 Tue, 22 Sep 2026 10:29:11 +0000
Received: from [2a01:cb15:80c6:e800:b9e9:dfdc:4751:7ecb] (helo=l14.home)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1x8xR4-00DE8C-1z;
 Tue, 22 Sep 2026 10:09:14 +0000
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
	bh=0EYmk0NJ/kvSiclNpr9gVl0wT7a9lZ6KKLAdNMnZn+8=; b=0g8vDDC72M9fifW5/z5jWwZDDe
	n7hUPd2gGJRzFSwarkZyHVAjqpw/lGDU4inJjDrKWlEuGraLJsx2x6d8a077cvulNZaZr7ch29yjc
	twCdNBUMctcABymJi4huRQ8kK3urMKHgpHa+3CLoEg8ojQ146KhHUegJ/1sXNuXdT5z4=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC XEN PATCH 10/13] pytest: Add guest test
Date: Tue, 22 Sep 2026 12:08:57 +0200
Message-ID: <20260922100900.29129-11-anthony@xenproject.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922100900.29129-1-anthony@xenproject.org>
References: <20260922100900.29129-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

Adding a second test, to help show how to improve the fixtures, and
needed code in libraries

That test copies part of the run tools-test tests, but we could shared
that better.

Then, we ssh to the host, to both follow the guest log files and to
prepare and start the guest, over several SSH channel.

tail_log() could go into a lib.
And I don't know yet what to do with the collected threads object.

I also want to get rid of the guest_boot_script marker, and ssh to the
guest instead.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 automation/pytest/test_boot.py | 97 ++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/automation/pytest/test_boot.py b/automation/pytest/test_boot.py
index 5a7ec43fa52b..089aa1e6c063 100644
--- a/automation/pytest/test_boot.py
+++ b/automation/pytest/test_boot.py
@@ -3,8 +3,11 @@ import os
 import paramiko
 from pathlib import Path
 import pytest
+from queue import Queue
 import random
 import string
+from textwrap import dedent
+from threading import Thread
 from typing import Generator
 
 from lib.boot_binary import BootBinary
@@ -138,3 +141,97 @@ def test_xen_tools_tests(machine_on_ipmi: IPMI,
     errormsg = stderr.read()
     if errormsg:
         logging.info(f"cmd errro: {errormsg!r}")
+
+
+@pytest.mark.timeout(600)
+@pytest.mark.guest_boot_script(dedent(f"""
+    ifconfig eth0 10.1.105.101
+    until ping -c 10 {os.environ["HOST_IP4"].partition('/')[0]}; do
+        sleep 1
+    done
+    echo \"guest ping test passed\"
+    """))
+def test_guest(
+        machine_on_ipmi: IPMI,
+        sshkey_for_test: paramiko.pkey.PKey,
+        boot_string: str,
+        ) -> None:
+    expect_string = boot_string
+    for line in machine_on_ipmi.console_output_generator():
+        #
+        # Wait for `expect_string` for the test to succeed
+        #
+        if expect_string in line:
+            logging.info(f"got expect_string '{line}'.")
+            break
+        #
+        # Some common expected or not console outputs.
+        #
+        if "Latest ChangeSet:" in line:
+            logging.info(f"Test xen build from '{line}'.")
+        if "Manual reset required ('noreboot' specified)" in line:
+            # Test failed, could wait a bit before failing the test.
+            logging.error("Xen panic")
+
+    with paramiko.client.SSHClient() as ssh:
+        threads = []
+        ssh_logs: Queue[str] = Queue()
+        ssh.set_missing_host_key_policy(paramiko.client.WarningPolicy)
+        logging.debug(f"connecting to {os.environ['HOST_IP4'].split('/')[0]}")
+        ssh.connect(os.environ['HOST_IP4'].split('/')[0],
+                    username='root',
+                    pkey=sshkey_for_test,
+                    timeout=10,
+                    )
+
+        def ssh_channel_read(stdout, prefix):
+            for output in stdout:
+                ssh_logs.put(f"{prefix}{output.strip()}")
+
+        def tail_log(file: Path, prefix: str):
+            stdin, stdout, stderr = ssh.exec_command(f"tail -n0 -F {file}")
+            stdin.close()
+            # Dirty, should keep `stderr` to clean it up
+            t = Thread(target=ssh_channel_read, args=(stdout, prefix))
+            t.start()
+            return t
+
+        threads += [
+            tail_log(Path("/var/log/xen/console/guest-domU.log"), "(domU) "),
+            tail_log(Path("/var/log/xen/qemu-dm-domU.log"), "(qemu-dm) "),
+         ]
+
+        cmd = dedent(f"""
+            set -x
+            pxe_host="{os.environ["PXE_HOST"]}"
+            http_pxe_path="{os.environ["PXE_HTTP_PATH"]}"
+            wget http://${{pxe_host}}/${{http_pxe_path}}/bzImage -O /boot/vmlinuz-domU
+            wget http://${{pxe_host}}/${{http_pxe_path}}/guest-rootfs.cpio.gz -O /boot/initrd-domU
+            xl -Tvvv create /etc/xen/domU.cfg 2>&1
+            """)
+        logging.info(f"Exec command: {cmd}")
+        stdin, stdout, stderr = ssh.exec_command(cmd)
+
+        # everything is on stderr, both wget and xl output
+        t = Thread(target=ssh_channel_read, args=(stderr, ""))
+        t.start()
+        threads.append(t)
+        t = Thread(target=ssh_channel_read, args=(stdout, ""))
+        t.start()
+        threads.append(t)
+
+        # Log while `xl` is preparing the guest to start
+        while t.is_alive():
+            line = ssh_logs.get()
+            logging.debug(line)
+
+        xl_exit_status = stderr.channel.recv_exit_status()
+        assert xl_exit_status == 0
+
+        # `xl` have exited, continue logging the guest output
+        while True:
+            line = ssh_logs.get()
+            logging.debug(line)
+            if "guest ping test passed" in line:
+                logging.info("found expected guest line in logs")
+                break
-- 
Anthony PERARD


