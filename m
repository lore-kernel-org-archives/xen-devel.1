Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B9D606A328
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 14:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=JB8+fst+
Received: from list by lists.xenproject.org with outflank-mailman.1469871.1678655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOFBs-0002Y6-0r; Tue, 03 Nov 2026 14:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469871.1678655; Tue, 03 Nov 2026 14:08:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOFBr-0002Xy-UH; Tue, 03 Nov 2026 14:08:43 +0000
Received: by outflank-mailman (input) for mailman id 1469871;
 Tue, 03 Nov 2026 14:08:43 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a1bd67a4000403d@swg.vates.tech>)
 id 1xOFBq-0002W6-US
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 14:08:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOFBq-0073eV-3t
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 15:08:42 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a1bd67a4000403d@swg.vates.tech>)
 id 6ae9eae4-bab6-0a2a0a5309dd-0a2a4508d2ba-22
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:08:42 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a1bd67a4000403d@swg.vates.tech>)
 id 6ae9eae9-f659-0a2a45080019-b9ff1c2399c7-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:08:42 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1a1bd67a4000403d.008 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 03 Nov 2026 14:08:27 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 409F58237D;
 Tue,  3 Nov 2026 15:08:26 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=J0Tvjq261UWbeUTC4EzNOR8zNabm6CtON8Gg2CDkJ24=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=JB8+fst+ES3ArY7RqRK9VC8DHgDP0g8jxqj1tcn9YXLOLhq9+/D5Gfy4O9Mbz3hYJrBiv7zpG
 Zs1drHhoVvYHh/h9GNORsxeuI9uWn1VJxNVVX+MM3VeX2LcxCwB4YwAdSbrQokuJpQYH8t2iCST
 bg9vbnXIhTLRI+N0I0bOGtQqXD81uor465QA8PACznNQNfmeuhr/EGGW/n6OEhjki3TU6LbjmQZ
 nv95FYNL2MH4LFSX9JAAfrLWV0VIYAxp1hcpB5NEE600I3MViW76ylpRj9wnfO7JW1v1rreBxG4
 x6mjmsoyzS09uEMJNd0uLWmFdtTeVv3QKfO6AfiI81JA==
X-Zone-Loop: d904bfc0ab6134519420becb16732b8795341d9f1723
x-campaign-type: default
x-transaction-id: a8e56d00-95a8-4583-8ffe-ba12d9912a98
x-swg-uid: 01-9070715d-0a82-4762-a980-cad323d7ebd1
X-Mailer: Sweego
Message-ID:
 <1793714907.8631fc262581453bbf619ec5b2062170.1a1a1bd67a4000403d@vates.tech>
x-swg-bid: 1793714907.8631fc262581453bbf619ec5b2062170.1a1a1bd67a4000403d
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
Subject: [PATCH v3 4/6] automation/qtb: add QTB framework README
Date: Tue,  3 Nov 2026 15:08:12 +0100
In-Reply-To: <1793714671.8631fc262581453bbf619ec5b2062170.1a1a1b9ce9c000403d@vates.tech/T/#u>
References: <1793714671.8631fc262581453bbf619ec5b2062170.1a1a1b9ce9c000403d@vates.tech/T/#u>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793714580; l=5611; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=YanaScGFUsa0lc6CQ3L8sJLQhJCTZkpANKuIeMKk/NM=; b=UWPiPKs08Z5H4medNaLgIXm5H8yALI8ihRfFi8TzHR2v5EP+kvNA94R5S7h5mLqU2X81aEENF PuZGRx+12dAAHnq/Hkbd7pri0CjIoHU/qbwrMZFb5MmdJ7SW//HTKf+
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793714906429
X-purgate-ID: tlsNG-c1860d/1793714922-CC37587B-7268341E/0/0
X-purgate-type: clean
X-purgate-size: 5613
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Document the qtb riscv64 test framework in a README.

It covers:
  - the core concepts: a test type is a pytest module under tests/, a test
    is a function parametrizing the `machine` fixture with what it boots
  - the source files layout
  - the prerequisites and how to run the tests with pytest, with logs and
    a JUnit report as CI does
  - how to run them in the CI container
  - how to add a test and how to add a new test type.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
Changes in v3:
- Rewrite for the pytest-based framework.
---
 automation/scripts/qtb/riscv/README.md | 127 +++++++++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/automation/scripts/qtb/riscv/README.md b/automation/scripts/qtb/riscv/README.md
new file mode 100644
index 0000000000..f074a70c4a
--- /dev/null
+++ b/automation/scripts/qtb/riscv/README.md
@@ -0,0 +1,127 @@
+qtb riscv64 test framework
+==========================
+
+A small pytest framework built on qtb (QEMU Test Bench), a Python package that
+controls a QEMU process over QMP and qtest and gives access to its consoles.
+Each test drives Xen and its guests through these interfaces and turns what
+it observes into a pass/fail verdict.
+
+Prerequisites
+-------------
+
+- `qemu.qtb`: the QEMU Test Bench Python package. It is not upstream yet, so
+  install it with its `[qtb]` extra (which pulls `pexpect`) from the `python/`
+  directory of the `QEMU_REPO` fork, at the `QEMU_COMMIT` pinned in
+  `automation/build/debian/13-riscv64-qtb.dockerfile`.
+- `pytest`.
+- `qemu-system-riscv64` in PATH, with its bundled OpenSBI.
+- A riscv64 `xen` binary, in the directory given with `--binaries-dir`.
+
+The simplest way to get the Python ones is to use the CI container, see
+"Running in the container" below.
+
+Running the tests
+-----------------
+
+Run from the top level of the source tree, as CI does. Here the binaries are
+in `binaries/`:
+
+```
+T=automation/scripts/qtb/riscv/tests
+
+# List every test:
+python3 -m pytest $T --collect-only -q
+
+# Run every test, one file, one test, or by name substring:
+python3 -m pytest $T --binaries-dir binaries
+python3 -m pytest $T/test_console.py --binaries-dir binaries
+python3 -m pytest $T/test_console.py::test_host_boot --binaries-dir binaries
+python3 -m pytest $T -k 1pcpu --binaries-dir binaries
+
+# With logs and per-test results as JUnit XML (what CI does):
+python3 -m pytest $T --binaries-dir binaries --log-dir qtb-logs \
+    --junitxml tests-junit.xml
+```
+
+pytest finds the `qtb` package on its own, as `automation/scripts/` is the
+first directory above the tests without an `__init__.py`.
+
+The `machine` fixture understands the following options.
+
+- `--binaries-dir DIR`: The directory holding the binaries. It is required to
+  boot a test.
+
+- `--log-dir DIR`: The directory collecting the logs, in one
+  `<module>/<test>/` subdirectory per test. It holds QEMU's stdout/stderr
+  (`riscv64-qtest-<pid>.log`, named after the host) and Xen's console as
+  `con0.log`. Without it, no logs are written.
+
+`--log-cli-level=DEBUG` shows the debug logs live.
+
+Running in the container
+------------------------
+
+Build the CI container once, then run the tests in it with `containerize`,
+which mounts the Xen tree as the working directory. In this example, we assume
+the binaries were copied to `binaries/` at the top of the tree.
+
+```
+make -C automation/build debian/13-riscv64-qtb
+CONTAINER=trixie-riscv64-qtb ./automation/scripts/containerize \
+    python3 -m pytest automation/scripts/qtb/riscv/tests --binaries-dir binaries
+```
+
+Layout
+------
+
+```
+qtb/env.py                   QtbEnv: directories handed to each host
+qtb/utils.py                 Generic helpers, not riscv specific
+
+qtb/riscv/                   This framework
+  machine.py                 HostConfig: what a host boots; RiscvTestMachine:
+                             QEMU command line, console helpers
+
+  tests/                     The QEMU tests, one module per test type
+    conftest.py              `machine` fixture and its options
+    test_console.py          console-test
+```
+
+Test types and tests
+--------------------
+
+A test type is one module under `tests/`. Each test is a short function
+taking the `machine` fixture, which it parametrizes indirectly with the
+pCPU counts it runs on:
+
+```
+@pytest.mark.parametrize(
+    "machine",
+    [pytest.param(1, id="1pcpu")],
+    indirect=True,
+)
+def test_a(machine):
+    ...
+```
+
+Before the test body runs, the `machine` fixture launches QEMU with Xen. Once
+the test body returns, QEMU is shut down.
+
+An exception raised before the test body (a bad parameter, a missing binary,
+QEMU not starting) is reported by pytest and JUnit as an *error*. An
+exception raised in the test body (an `expect_console` timing out) is
+reported as a *failure*.
+
+Adding a test
+-------------
+
+Add a function to the module of the test type, parametrize `machine`
+indirectly with the machines it runs on, and check their consoles.
+
+Adding a test type
+------------------
+
+Add `tests/test_<type>.py`, holding the logic of the type in one function
+that takes the machine and the parameters of the type, and the tests that
+call it. Host-side helpers shared between types go to `RiscvTestMachine` or
+`machine.py`. State the requirements of the type in the module docstring.

-- 
2.56.0


