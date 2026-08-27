Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7C8C61DB9
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 09:43:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400484.1636173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzWdp-0006Uq-8c; Thu, 27 Aug 2026 09:43:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400484.1636173; Thu, 27 Aug 2026 09:43:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzWdp-0006UT-1X; Thu, 27 Aug 2026 09:43:25 +0000
Received: by outflank-mailman (input) for mailman id 1400484;
 Thu, 27 Aug 2026 09:43:23 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0429a1484000c4f3@swg.vates.tech>)
 id 1wzWdn-0006OC-Gw
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 09:43:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzWdm-00AoWH-Ep
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 11:43:22 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0429a1484000c4f3@swg.vates.tech>)
 id 6a9006ad-e002-0a2a0a5209dd-0a2a4508ba2a-42
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 11:43:22 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0429a1484000c4f3@swg.vates.tech>)
 id 6a9006b8-f659-0a2a45080019-b9ff1c12af39-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 11:43:20 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0429a1484000c4f3.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 27 Aug 2026 09:43:09 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 9413D83B32;
 Thu, 27 Aug 2026 11:43:08 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=7bSuJNzprWfjbzLQMqWGQPycYoufJkdjbgVndy19/bs=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=MsNcnMmp4UIMF8WiJYhRETCynXGqhLHnSXz5lL4IWWjZvhFoNocv+q3uIPWe0psQW534iwfyy
 PgVe1GOLeaENEzjxVE6IBtVKzzG05PtZ8lTcyabogWbf8fsLrzp0IM4HKt6RUcrC6HO7B+yHYOr
 YLHFKJFK+JqRlCj9ogLx+DQJcLkIPSeIJSJsfwPi2GYJHl36ok9KgfLHX2ojrlr29k1bxPGJIFW
 +FKOAbf7DqPTrO8M6gwj1+n9F5l0MLEpiB1ubwzUKRY6Smrd2gr2oroWS0TFJizWemr+PeEgj4D
 vcsUmIY8/BQ8WXWx926ZFCWjN1B32mzltuwCXASOIoVw==
X-Zone-Loop: 6ba272c28740d1c7ee60548b8ae2d6428574eae73383
x-campaign-type: default
x-transaction-id: 61ee72db-108d-4708-9d11-c2b3ecd9acdc
x-swg-uid: 01-d2edfc05-4cf1-4eef-a57c-8b8064b8cc43
X-Mailer: Sweego
Message-ID:
 <1787823789.8631fc262581453bbf619ec5b2062170.1a0429a1484000c4f3@vates.tech>
x-swg-bid: 1787823789.8631fc262581453bbf619ec5b2062170.1a0429a1484000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 5/6] automation/qtb: add QTB framework README
Date: Thu, 27 Aug 2026 11:42:51 +0200
In-Reply-To: <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech>
References: <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1787823788688
X-purgate-ID: tlsNG-c1860d/1787823801-CCB7187B-6472FC02/0/0
X-purgate-type: clean
X-purgate-size: 7495

Document the qtb riscv64 test framework in a README.

It covers:
  - the core concepts (machine, test type, test) and how they map to files
  - the source files layout
  - the CLI: `qemu_smoke_riscv64.py <type> <command>`, with "console-test"
    as the type
  - the config files: the machine catalog and a type's own `<type>.yaml`
  - the Jinja2 device-tree templates under dts/
  - how to add a test (config-only) and how to add a new test type.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
 automation/scripts/qtb/riscv/README.md | 182 +++++++++++++++++++++++++
 1 file changed, 182 insertions(+)
 create mode 100644 automation/scripts/qtb/riscv/README.md

diff --git a/automation/scripts/qtb/riscv/README.md b/automation/scripts/qtb/riscv/README.md
new file mode 100644
index 0000000000..c173714d75
--- /dev/null
+++ b/automation/scripts/qtb/riscv/README.md
@@ -0,0 +1,182 @@
+qtb riscv64 test framework
+==========================
+
+A small framework that boots Xen under QEMU on riscv64 and drives it to a
+pass/fail verdict automatically from its console output.
+
+It is built on QEMU's qtb (QEMU Test Bench) Python package, which gives
+programmatic control of a QEMU process over QMP and qtest, plus access to the
+consoles.
+
+What it does
+------------
+
+1. Reads a machine description (what to boot: cpus, Xen command line) and a
+   test description (what to assert).
+2. Generates the host device tree.
+3. Launches QEMU with Xen.
+4. Reads the console and checks what Xen printed.
+
+Core concepts
+-------------
+
+- Machine: test-agnostic description of what to boot. Reusable across test
+  types. `config.yaml` -> `MachineConfig`.
+- Test type: a `RiscvQtbTest` subclass implementing the logic of a kind of test
+  (e.g. `console-test`). Identified by `type_id`. See `console_test/`.
+- Test: one named, runnable instance of a type: a machine plus the type's
+  parameters. Lives in the type's `<type>.yaml`.
+
+A test type owns a config file describing its tests, each test names a machine
+from the shared catalog (`config.yaml`) and layers its own parameters on top.
+
+Layout
+------
+
+```
+qemu_smoke_riscv64.py        CLI entry point (<type> run | list)
+
+qtb/riscv/                   This framework
+  __init__.py                Public API
+  qtb_test.py                RiscvQtbTest ABC every test type derives from
+  config.py                  Machine catalog parser -> MachineConfig
+  xen_dt.py                  Generates the host device tree from its Jinja2 template
+  dt.py                      Compile .dts -> .dtb with dtc
+  paths.py                   Path resolution (pkg-relative)
+  machine.py                 RiscvTestMachine: assembles the QEMU command line
+
+  config.yaml                The machine catalog (shared across test types)
+  dts/                       Jinja2 device-tree templates (host, common)
+
+  console_test/              The console-test type
+    __init__.py
+    console_test.py          ConsoleTest implementation
+    console-test.yaml        Its tests
+
+  unit/                      pytest unit tests of the framework logic itself
+```
+
+How a type is selected
+----------------------
+
+The test type is the first positional argument (`qemu_smoke_riscv64.py console-test run
+...`). The CLI builds one subcommand per entry of `TEST_TYPES` (`__init__.py`),
+named after the type's `type_id`.
+
+Each type declares the `config_file` it reads its tests from.
+
+Prerequisites
+-------------
+
+- `qemu.qtb`, QEMU's Python package (`python/` in the QEMU tree)
+- `jinja2`, `pyyaml`, `pexpect`
+- `dtc` (device-tree-compiler)
+- `qemu-system-riscv64`
+- the `xen` binary a machine boots
+
+CLI usage
+---------
+
+Run from `automation/scripts/`, or give the full path from the Xen tree root
+(`./automation/scripts/qemu_smoke_riscv64.py ...`), which is what CI does.
+
+```
+# List every test the type defines in its config:
+./qemu_smoke_riscv64.py console-test list
+
+# Run one test (drives it to PASS/FAIL, exit 0/1):
+./qemu_smoke_riscv64.py console-test run dom0less-1smp-0domu-1vcpu-aplic-imsic-null \
+    --log-dir qtb-logs
+```
+
+`--log-dir` (run only) collects the QEMU process log, the qtest log, and each
+console as `con<N>.log`: `con0.log` is Xen's own console, the only one wired
+up today. Omit it to write no logs. `-v/--verbose` raises the
+log level to debug.
+
+Config files
+------------
+
+`config.yaml` is the machine catalog. `binaries:` are build artifacts resolved
+under `binaries/` (overridable with `$QTB_BINARIES_DIR`); absolute paths pass
+through.
+
+Machine entries omit any optional field left at its default.
+Here are the parameters:
+
+- `pcpu` (required): host physical cpus.
+- `mmu_type` (default `sv48`): Xen host MMU type.
+- `xen_bootargs` (default `""`): Xen command line.
+
+`<type>.yaml` describes the tests of that type.
+
+`console-test`
+--------------
+
+A test names a machine and maps a console index to the string(s) expected on
+that console: index 0 is Xen's own console (`con0`, logged as `con0.log`).
+
+```
+machine_catalog: config.yaml    # the catalog to resolve machine names against
+tests:
+  dom0less-1smp-0domu-1vcpu-aplic-imsic-null:
+    machine: dom0less-1smp-0domu-1vcpu-aplic-imsic-null   # a name in config.yaml
+    expect:
+      0: [All set up]           # Xen itself must print "All set up"
+```
+
+Logic, per console:
+
+1. read the console
+2. wait for each expected string in turn, in the order listed
+3. bound each wait by `timeout` seconds, retrying a timed-out wait up to
+   `attempts` times
+
+The map itself must not be empty, otherwise the test would pass without
+asserting anything.
+
+Device trees (dts/)
+-------------------
+
+Jinja2 template, generated per machine and compiled with dtc:
+
+- `qemu-host.dts.j2` - the Xen host tree: the hart count, the host MMU type and
+  the Xen command line.
+
+Adding a test
+-------------
+
+To add a test to an existing type (e.g. `console-test`):
+
+1. Pick a machine from `config.yaml`, or add a new one under `machines:` (set
+   `pcpu`, and any optional field that differs from its default — see the
+   field list above).
+2. Add a test entry under `tests:` in the type's `<type>.yaml`, naming that
+   machine and supplying the type's own parameters (for `console-test`, one
+   `expect` list per console).
+3. Run it: `./qemu_smoke_riscv64.py console-test run <your-test-name>`.
+
+No code change is needed, a test is pure config.
+
+Adding a new test type
+----------------------
+
+1. Create `mytype/` with `mytype.py` defining a `RiscvQtbTest` subclass: set
+   `type_id`, `description`, and `config_file`, and implement `from_config`,
+   `list_tests`, and `run(vm)`.
+2. Add `mytype/__init__.py` that does `from .mytype import MyType`.
+3. Add `MyType` to `TEST_TYPES` in `__init__.py` so the CLI exposes it.
+
+Unit tests
+----------
+
+The `unit/` directory holds pytest tests of the framework's own logic (config
+parsing, device-tree rendering, QEMU arg assembly). They do not boot QEMU and
+are independent of the CI smoke tests, but they import the framework, so they
+need the prerequisites above plus `pytest`.
+
+Run from the Xen tree root:
+
+```
+python3 -m pytest automation/scripts/qtb/riscv/unit/
+```

