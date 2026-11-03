Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0905606A327
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 14:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=I9L6n8X6
Received: from list by lists.xenproject.org with outflank-mailman.1469869.1678638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOFBk-00020w-ED; Tue, 03 Nov 2026 14:08:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469869.1678638; Tue, 03 Nov 2026 14:08:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOFBk-00020p-AZ; Tue, 03 Nov 2026 14:08:36 +0000
Received: by outflank-mailman (input) for mailman id 1469869;
 Tue, 03 Nov 2026 14:08:35 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a1bd641f000403d@swg.vates.tech>)
 id 1xOFBi-0001vQ-VE
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 14:08:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOFBi-00EYES-Be
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 15:08:34 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a1bd641f000403d@swg.vates.tech>)
 id 6ae9eadc-e002-0a2a0a5209dd-0a2a45078c7e-30
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:08:34 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a1bd641f000403d@swg.vates.tech>)
 id 6ae9eade-b4ea-0a2a45070019-b9ff1c228f1d-4
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:08:34 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1a1bd641f000403d.008 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 03 Nov 2026 14:08:26 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 516328237D;
 Tue,  3 Nov 2026 15:08:25 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=btNJsqkeLccghZm4riqNKdfshjJfJDFcVuvTM8zN4aA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=I9L6n8X6O5s6TfGvkZ7nwjsJ8w+sX2+RIEFqfbhvnj324NLAAck0bMTQ18GuLP1lK3fyiV9+F
 7d9lNMkY9EXwqbpd+70/RpUjwSEHC9Ot5vmnSWSYSwUyeZb2/MTRX46NtK0Q+noCYQvBWM3PKA5
 eFULyf/VAO2RrCpiYYzqHTjWQCtjxa9jXxlUGUgjDGDPAZLK37oa2P/iPyMAZEmAHu2XWWweKdJ
 7G6GG2lqDbDCufFZPYE/UxWHVjSUKjgx4zgzbTlgjEGXjDOiDVUnsBV2gp7rtPrTTo/V2cUj8Y/
 5S8oqJP6Ve2U+u2l7zXdeGOxfhgY7gwyMqQvZ/4ej5CQ==
X-Zone-Loop: 8594ae6480e0601061f0aaea7de1114c49de5dbec9db
x-campaign-type: default
x-transaction-id: b2164b08-6572-4e93-a28f-d63b28607888
x-swg-uid: 01-a51712d3-ecb4-427e-866f-1839e96f514a
X-Mailer: Sweego
Message-ID:
 <1793714906.8631fc262581453bbf619ec5b2062170.1a1a1bd641f000403d@vates.tech>
x-swg-bid: 1793714906.8631fc262581453bbf619ec5b2062170.1a1a1bd641f000403d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	Zhang Zheng <zhangzheng@iscas.ac.cn>
Subject: [PATCH v3 2/6] automation/qtb: add the QTB machine for riscv64
Date: Tue,  3 Nov 2026 15:08:10 +0100
In-Reply-To: <1793714671.8631fc262581453bbf619ec5b2062170.1a1a1b9ce9c000403d@vates.tech/T/#u>
References: <1793714671.8631fc262581453bbf619ec5b2062170.1a1a1b9ce9c000403d@vates.tech/T/#u>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793714580; l=7275; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=0ARUiVs6j2C6Fgw0h/da4a735UDRtLBCCfKpiMUJyZE=; b=9E8mESN78E11bYKxpHvgCR6kFAJpaCMyI0X/qYWigCxRRHfYlnYJXFlu0Gh1qtpthZuqOZ99l hgA6h7A7qpZAvyoMtkWqXl7NxCh7Bz6TFT02myMHNdHdZByCjQkUBCY
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793714905497
X-purgate-ID: tlsNG-ef75cf/1793714914-A7AD0AE4-DCDAE4D7/0/0
X-purgate-type: clean
X-purgate-size: 7277
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The QTB (QEMU Test Bench) Python package drives a QEMU process over QMP and
qtest through QtbMachine, which leaves the QEMU binary (_resolve_binary())
and the machine part of its command line (_machine_args()) to a subclass.

Add RiscvTestMachine, the riscv64 implementation of QtbMachine, with:
  - HostConfig, the test-agnostic description of the host (Xen) to boot:
    for now, the pCPU count and the RAM size.
  - The QEMU command line that boots Xen on the virt machine in
    aia=aplic-imsic mode, using the distribution's qemu-system-riscv64,
    found in PATH, and the OpenSBI it bundles. Xen is resolved from the
    binaries directory before QEMU starts, so a missing one fails the
    test without launching QEMU for nothing.
  - expect_console() waits for a string on a console and turns a timeout or
    a closed console into an AssertionError, which pytest reports as a test
    failure.
  - Xen's console is mirrored to stdout, so a failing test shows where Xen
    stopped without fetching its log from the artifacts.

QtbEnv (qtb/env.py) holds the directories shared by every test, and
qtb/utils.py holds the generic path helpers.

Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
The machine is unused on its own: the pytest fixture booting it and the
first test come in the next patch.
---
Changes in v3:
- New patch, split out of v2 "automation/qtb: add Python QTB framework
  with the console-test type".
- Mirror Xen's console to stdout, so pytest shows it in the report of a
  failing test.
- Map pexpect timeouts and EOF to AssertionError (a pytest failure)
  instead of a dedicated TestFailure exception.
- Keep the host at 2GB.
- Drop the Jinja2 host device tree.
---
 automation/scripts/qtb/__init__.py       |  2 +
 automation/scripts/qtb/env.py            | 15 ++++++
 automation/scripts/qtb/riscv/__init__.py |  2 +
 automation/scripts/qtb/riscv/machine.py  | 92 ++++++++++++++++++++++++++++++++
 automation/scripts/qtb/utils.py          | 15 ++++++
 5 files changed, 126 insertions(+)

diff --git a/automation/scripts/qtb/__init__.py b/automation/scripts/qtb/__init__.py
new file mode 100644
index 0000000000..a0e6e76cb2
--- /dev/null
+++ b/automation/scripts/qtb/__init__.py
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+"""QTB (QEMU Test Bench) test frameworks."""
diff --git a/automation/scripts/qtb/env.py b/automation/scripts/qtb/env.py
new file mode 100644
index 0000000000..7887d6af23
--- /dev/null
+++ b/automation/scripts/qtb/env.py
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+"""Run environment prepared by the launcher and shared by every test."""
+
+from __future__ import annotations
+
+from dataclasses import dataclass
+from pathlib import Path
+
+
+@dataclass(frozen=True)
+class QtbEnv:
+    """Directories prepared by the launcher and shared by every test."""
+
+    binaries_dir: Path  # Build artifacts (xen, ...) the hosts boot.
+    log_dir: Path | None = None  # Logs, kept after the run.
diff --git a/automation/scripts/qtb/riscv/__init__.py b/automation/scripts/qtb/riscv/__init__.py
new file mode 100644
index 0000000000..7a0218c73c
--- /dev/null
+++ b/automation/scripts/qtb/riscv/__init__.py
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+"""QTB riscv64 test framework package."""
diff --git a/automation/scripts/qtb/riscv/machine.py b/automation/scripts/qtb/riscv/machine.py
new file mode 100644
index 0000000000..1c5e3b0d9e
--- /dev/null
+++ b/automation/scripts/qtb/riscv/machine.py
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: GPL-2.0-only
+"""QtbMachine for riscv64."""
+
+from __future__ import annotations
+
+import shutil
+from collections.abc import Sequence
+from dataclasses import dataclass
+
+import pexpect
+from qemu.qtb import GuestConsoleSession
+from qemu.qtb import QtbMachine
+
+from qtb.env import QtbEnv
+from qtb.utils import resolve_under
+
+
+@dataclass(frozen=True)
+class HostConfig:
+    """The test-agnostic description of what to boot."""
+
+    pcpu: int
+    memory: int = 2048  # MB
+
+
+class RiscvTestMachine(QtbMachine):
+    arch_name = "riscv64"
+    gdb_arch = "riscv:rv64"
+
+    qemu_bin = "qemu-system-riscv64"
+
+    def __init__(
+        self,
+        host_config: HostConfig,
+        *,
+        env: QtbEnv,
+    ) -> None:
+        self.host = host_config
+        self.env = env
+        # Resolved before QEMU starts, so a missing binary fails early.
+        self.xen = resolve_under("xen", env.binaries_dir)
+        super().__init__(
+            memory=self.host.memory,
+            cpus=self.host.pcpu,
+            mirror_console=True,
+            # Default expect timeout
+            timeout=30,
+            log_dir=str(env.log_dir) if env.log_dir else None,
+        )
+
+    # Implements QtbMachine._machine_args()
+    def _machine_args(self, memory: int, cpus: int) -> Sequence[str]:
+        machine_opt = "virt,aia=aplic-imsic"
+        cpu_opt = "rv64,svpbmt=on"
+        return [
+            "-M",
+            machine_opt,
+            "-cpu",
+            cpu_opt,
+            "-smp",
+            str(cpus),
+            "-m",
+            str(memory),
+            "-kernel",
+            str(self.xen),
+        ]
+
+    # Implements QtbMachine._resolve_binary()
+    @classmethod
+    def _resolve_binary(cls) -> str:
+        qemu = shutil.which(cls.qemu_bin)
+        if qemu is None:
+            raise FileNotFoundError(f"{cls.qemu_bin} not found in PATH")
+        return qemu
+
+    def get_host_console(self) -> GuestConsoleSession | None:
+        return self.console
+
+    @staticmethod
+    def expect_console(
+        console: GuestConsoleSession, expected: str, timeout: int
+    ) -> None:
+        """Wait for `expected` on console and fail if it does not show up
+        within `timeout`, which overrides the default one from QtbMachine."""
+        if console is None:
+            raise RuntimeError("Xen console not wired up, host not launched?")
+        try:
+            console.expect_exact(expected, timeout=timeout)
+        except pexpect.TIMEOUT:
+            raise AssertionError(f"{expected!r} not seen within {timeout}s") from None
+        except pexpect.EOF:
+            raise AssertionError(f"console closed before {expected!r}") from None
diff --git a/automation/scripts/qtb/utils.py b/automation/scripts/qtb/utils.py
new file mode 100644
index 0000000000..cce5936acb
--- /dev/null
+++ b/automation/scripts/qtb/utils.py
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+"""Generic helpers shared by the QTB test frameworks."""
+
+from __future__ import annotations
+
+from pathlib import Path
+
+
+def resolve_under(file_name: str, base: Path) -> Path:
+    """Resolve `file_name` against `base`, absolute paths pass through."""
+    p = Path(file_name)
+    path = p if p.is_absolute() else base / p
+    if not path.exists():
+        raise FileNotFoundError(f"cannot resolve {str(path)!r}: does not exist")
+    return path

-- 
2.56.0


