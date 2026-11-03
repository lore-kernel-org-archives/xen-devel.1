Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A8C606A324
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 14:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=R7Nj/LVu
Received: from list by lists.xenproject.org with outflank-mailman.1469870.1678647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOFBn-0002Fn-Qp; Tue, 03 Nov 2026 14:08:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469870.1678647; Tue, 03 Nov 2026 14:08:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOFBn-0002Fg-Nk; Tue, 03 Nov 2026 14:08:39 +0000
Received: by outflank-mailman (input) for mailman id 1469870;
 Tue, 03 Nov 2026 14:08:38 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a1bd65c3000403d@swg.vates.tech>)
 id 1xOFBm-0002Ev-N3
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 14:08:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOFBm-00EYES-3g
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 15:08:38 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a1bd65c3000403d@swg.vates.tech>)
 id 6ae9eadc-e002-0a2a0a5209dd-0a2a45078c7e-48
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:08:38 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a1bd65c3000403d@swg.vates.tech>)
 id 6ae9eade-b4ea-0a2a45070019-b9ff1c228f1d-5
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:08:38 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1a1bd65c3000403d.008 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 03 Nov 2026 14:08:26 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id C7DC08236A;
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
 q=dns/txt; s=selector1; bh=1tZgKsLL6qqRS4QgEjGGM7FNC+OZ9yobRv0XRAs+mcc=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=R7Nj/LVuZB0I1BvbH3N8efG0FZsjiqWPm27dGhIY22QNLjA9msWcOBUNOBBVnO5IzJloF5clw
 R/todBI1FHZkYSYYZFITpIZATsZMMdXPqBF5aQKpuKHTOsbV6ACU7pr8t2SoQoGyRdOItjDAtNO
 vzkcQMYTavN8hwFy5Rab4XvtPbN5DJEh2AkHHRtY2m2K0jP0J+Qgc70ByxHHqcOWStb3WJOqhHb
 hezSVwyZTDSucF2ERZOdimH9ruaEUdl5A+FY0Z7gm6XjOQjvdvve5Jyvvb93IvA3lCkVQCUpM1V
 BDeYAnAXGMu4XT9smL/2KRFtT7yJdyecaue0GBQHXH6Q==
X-Zone-Loop: d04a41d3da7e8a9aeb8a533812b0f451b13577210029
x-campaign-type: default
x-transaction-id: 365bce43-1f8f-450b-9995-a71113aee2e5
x-swg-uid: 01-07279d96-0e3d-426c-bb2e-19b46dd68488
X-Mailer: Sweego
Message-ID:
 <1793714906.8631fc262581453bbf619ec5b2062170.1a1a1bd65c3000403d@vates.tech>
x-swg-bid: 1793714906.8631fc262581453bbf619ec5b2062170.1a1a1bd65c3000403d
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
Subject: [PATCH v3 3/6] automation/qtb: add the console-test type with a Xen boot test
Date: Tue,  3 Nov 2026 15:08:11 +0100
In-Reply-To: <1793714671.8631fc262581453bbf619ec5b2062170.1a1a1b9ce9c000403d@vates.tech/T/#u>
References: <1793714671.8631fc262581453bbf619ec5b2062170.1a1a1b9ce9c000403d@vates.tech/T/#u>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793714580; l=5911; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=wZhS8AZVt+JzEA/taOgQXqInQ8JcrMvFqNkp4py+p7g=; b=zflSNbV3DQxjdhELu7TmLFr1ReQ/JSxvPudZeXJah7JlG7IMengR9ACR+9muM4bxUnlmENZKy 2HTXJA/GpheCqohMekW9QnIeK7s2F/pPEnOpc3M4QG9cfSvluhJ8U5F
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793714905982
X-purgate-ID: tlsNG-ef75cf/1793714918-3C411AE4-7FA1B44B/0/0
X-purgate-type: clean
X-purgate-size: 5913
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a first console test, which boots Xen under QEMU and waits for "All set
up" on its console. It is the equivalent of qemu-smoke-riscv64.sh, with the
finer control QTB gives, and new configurations are added as test
parameters instead of new scripts.

The tests get their machine through the `machine` pytest fixture. A test
parametrizes the fixture indirectly with the pCPU count, and the fixture
builds the matching RiscvTestMachine from it, so a new configuration only
takes a pytest.param() above the test function. The fixture launches QEMU
before the test body and shuts it down after, so setup problems (missing
binary, QEMU not starting) are reported as pytest errors and only console
checks are reported as test failures.

--binaries-dir gives the directory holding the binaries to boot, and is
mandatory. --log-dir gives where to keep the QEMU and console logs, one
<module>/<test> subdirectory per test. The timeout of each expected string
is 1500 seconds, as in console.exp, overridden by TEST_TIMEOUT_OVERRIDE or
TEST_TIMEOUT.

Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
Changes in v3:
- New patch, split out of v2 "automation/qtb: add Python QTB framework
  with the console-test type".
- Rework on top of pytest: tests are pytest functions parametrizing the
  `machine` fixture. The CLI, config.yaml, the per-type YAML files, the
  test class hierarchy and the attempts/retry logic are gone.
- Take the binaries and logs directories from --binaries-dir and
  --log-dir, no environment variable.
- Take the per-string timeout from TEST_TIMEOUT_OVERRIDE/TEST_TIMEOUT,
  like console.exp.
---
 automation/scripts/qtb/riscv/tests/__init__.py     |  2 +
 automation/scripts/qtb/riscv/tests/conftest.py     | 65 ++++++++++++++++++++++
 automation/scripts/qtb/riscv/tests/test_console.py | 35 ++++++++++++
 3 files changed, 102 insertions(+)

diff --git a/automation/scripts/qtb/riscv/tests/__init__.py b/automation/scripts/qtb/riscv/tests/__init__.py
new file mode 100644
index 0000000000..24d34ae2d1
--- /dev/null
+++ b/automation/scripts/qtb/riscv/tests/__init__.py
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+"""qtb riscv64 tests: boot Xen under QEMU and check what it does."""
diff --git a/automation/scripts/qtb/riscv/tests/conftest.py b/automation/scripts/qtb/riscv/tests/conftest.py
new file mode 100644
index 0000000000..be6c7223a3
--- /dev/null
+++ b/automation/scripts/qtb/riscv/tests/conftest.py
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: GPL-2.0-only
+"""Fixtures booting Xen under QEMU for the qtb riscv64 tests.
+
+A test takes the `machine` fixture and parametrizes it indirectly with its
+pCPU count.
+"""
+
+from __future__ import annotations
+
+from pathlib import Path
+
+import pytest
+
+from qtb.env import QtbEnv
+from qtb.riscv.machine import HostConfig, RiscvTestMachine
+
+def pytest_addoption(parser: pytest.Parser) -> None:
+    parser.addoption(
+        "--log-dir",
+        default=None,
+        metavar="DIR",
+        help="Directory for all logs (QEMU process log, qtest and the "
+        "consoles as con<N>.log), one subdirectory per test. When unset, "
+        "no logs are written.",
+    )
+
+    parser.addoption(
+        "--binaries-dir",
+        default=None,
+        metavar="DIR",
+        help="Directory holding the build artifacts (xen, ...) the tests boot.",
+    )
+
+
+@pytest.fixture
+def machine(request: pytest.FixtureRequest, qtb_env: QtbEnv):
+    """The test's machine: QEMU launched."""
+    if not hasattr(request, "param"):
+        pytest.fail("machine fixture needs indirect parametrization with the "
+                    "pCPU count")
+    machine = RiscvTestMachine(
+        HostConfig(request.param),
+        env=qtb_env,
+    )
+    with machine:
+        machine.launch()
+        yield machine
+
+
+@pytest.fixture
+def qtb_env(request: pytest.FixtureRequest) -> QtbEnv:
+    log_dir = request.config.getoption("log_dir")
+    if log_dir:
+        # One <module>/<test> subdirectory per test
+        log_dir = Path(log_dir) / request.node.path.stem / request.node.name
+        log_dir.mkdir(parents=True, exist_ok=True)
+
+    binaries_dir = request.config.getoption("binaries_dir")
+    if binaries_dir is None:
+        pytest.fail("no binaries dir: pass --binaries-dir")
+
+    return QtbEnv(
+        binaries_dir=Path(binaries_dir),
+        log_dir=log_dir,
+    )
diff --git a/automation/scripts/qtb/riscv/tests/test_console.py b/automation/scripts/qtb/riscv/tests/test_console.py
new file mode 100644
index 0000000000..10169e03a8
--- /dev/null
+++ b/automation/scripts/qtb/riscv/tests/test_console.py
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: GPL-2.0-only
+"""Console string expectation tests (console-test).
+
+Boot Xen under QEMU and check its console, within the timeout.
+"""
+
+from __future__ import annotations
+
+import os
+
+import pytest
+from qemu.qtb import GuestConsoleSession
+
+from qtb.riscv.machine import RiscvTestMachine
+
+# Per expected string (seconds)
+TIMEOUT: int = int(
+    os.environ.get("TEST_TIMEOUT_OVERRIDE") or os.environ.get("TEST_TIMEOUT")
+    or 1500
+)
+
+
+def _check_console(console: GuestConsoleSession, expect: list[str]) -> None:
+    """Assert each string in `expect` is printed on console, in order."""
+    for s in expect:
+        RiscvTestMachine.expect_console(console, s, TIMEOUT)
+
+
+def _check_host_boot(machine: RiscvTestMachine) -> None:
+    _check_console(machine.get_host_console(), ["All set up"])
+
+
+@pytest.mark.parametrize("machine", [pytest.param(1, id="1pcpu")], indirect=True)
+def test_host_boot(machine):
+    _check_host_boot(machine)

-- 
2.56.0


