Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99840C61DD3
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 09:43:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400481.1636149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzWdj-0005ul-4w; Thu, 27 Aug 2026 09:43:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400481.1636149; Thu, 27 Aug 2026 09:43:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzWdj-0005ue-2C; Thu, 27 Aug 2026 09:43:19 +0000
Received: by outflank-mailman (input) for mailman id 1400481;
 Thu, 27 Aug 2026 09:43:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0429a1248000c4f3@swg.vates.tech>)
 id 1wzWdh-0005t3-52
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 09:43:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzWdg-00Fwyk-I1
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 11:43:16 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0429a1248000c4f3@swg.vates.tech>)
 id 6a9006ab-2eae-0a2a0a5409dd-0a2a450c8740-14
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 11:43:16 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0429a1248000c4f3@swg.vates.tech>)
 id 6a9006b4-f479-0a2a450c0019-b9ff1c23ac25-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 11:43:16 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0429a1248000c4f3.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 27 Aug 2026 09:43:08 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id C8E9881230;
 Thu, 27 Aug 2026 11:43:07 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=gmD+/yUGFmr+Kw4z5rV1wyYCJPmGDuI5iAWOZKM9ipI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=lF//gPMh4IZ7JGz9ltPnd+NVQwLcrfDWrXXCsze08igi3HH/jOA9CeZ1HYTQXZmrAZTpZkzTd
 KhPz6gzf01HoqqafjMANLMI5ltC5/UUa1+tAfzuMPRP5ZKgUJM6BrZCJr/WtFHHAHvwC9KwXpVU
 ue/DWzmsNs8JDfalJd1R94TCOUoqAK5KOUva1olnZ4dsFZUNN2ubXlniLy37aDVVAGtIJhROqa7
 zAablxk+AEhvgyUk+RGFi4SvThCaLt9lG0FAPFOZUFu6u1uVrX4T3CdJhpBvTrR+hDRbcRquJoy
 ZwZcJejbyaw5LBc8zsdb7YgVF7TQfh8MoNu4s72MkPBg==
X-Zone-Loop: e0465787c52ba03e2322fc009b167e8a3ec347e8619e
x-campaign-type: default
x-transaction-id: ca1f5808-1918-4b1d-ab19-ccf96af2fa07
x-swg-uid: 01-ddb26cfa-a869-405e-a862-3831fc4020b1
X-Mailer: Sweego
Message-ID:
 <1787823788.8631fc262581453bbf619ec5b2062170.1a0429a1248000c4f3@vates.tech>
x-swg-bid: 1787823788.8631fc262581453bbf619ec5b2062170.1a0429a1248000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 3/6] automation/qtb: add Python QTB framework with the console-test type
Date: Thu, 27 Aug 2026 11:42:49 +0200
In-Reply-To: <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech>
References: <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1787823787917
X-purgate-ID: tlsNG-d25034/1787823796-028DDA5B-019E4CE5/0/0
X-purgate-type: clean
X-purgate-size: 30584

Port qemu-smoke-riscv64.sh from shell to a Python QTB framework that drives
QEMU over qtest/QMP and the console to run riscv64 smoke tests.

The framework is based on AMD's QTB (QEMU Test Bench) framework, which is
not yet upstream in QEMU but is planned to be soon. This is a riscv64
adaptation of it.

The framework:
  - parses a test config (config.yaml) into typed machine descriptions
    (config.py). The host device tree of a machine is compiled on first
    use of MachineConfig.dt, so a run that never boots (`list`, or a
    config error) does not invoke dtc.
  - generates the Xen host device tree from a Jinja2 template and compiles
    it to a DTB with dtc (xen_dt.py, dt.py).
  - assembles the QEMU command line in RiscvTestMachine (machine.py),
    resolving artifact paths via paths.py.
  - defines an abstract RiscvQtbTest base shared by every test type
    (qtb_test.py).
  - wires it together behind a CLI: the test type is a leading positional
    with `list` and `run` subcommands (qemu_smoke_riscv64.py).

console-test test type comes with it. It boots a machine from the shared
catalog and asserts every expected string is printed on Xen's own console
within the timeout. Its tests live in console-test.yaml, which maps console
indices to the expected output strings. This makes it straightforward to
add support for a domU console index once Xen provides it.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
 automation/scripts/qemu_smoke_riscv64.py      | 122 +++++++++++++++
 automation/scripts/qtb/__init__.py            |   2 +
 automation/scripts/qtb/riscv/__init__.py      |   9 ++
 automation/scripts/qtb/riscv/config.py        | 119 ++++++++++++++
 automation/scripts/qtb/riscv/config.yaml      |  17 ++
 .../qtb/riscv/console_test/__init__.py        |   4 +
 .../qtb/riscv/console_test/console-test.yaml  |  18 +++
 .../qtb/riscv/console_test/console_test.py    | 145 ++++++++++++++++++
 automation/scripts/qtb/riscv/dt.py            |  57 +++++++
 automation/scripts/qtb/riscv/machine.py       |  57 +++++++
 automation/scripts/qtb/riscv/paths.py         |  60 ++++++++
 automation/scripts/qtb/riscv/qtb_test.py      |  53 +++++++
 automation/scripts/qtb/riscv/xen_dt.py        |  58 +++++++
 13 files changed, 721 insertions(+)
 create mode 100755 automation/scripts/qemu_smoke_riscv64.py
 create mode 100644 automation/scripts/qtb/__init__.py
 create mode 100644 automation/scripts/qtb/riscv/__init__.py
 create mode 100644 automation/scripts/qtb/riscv/config.py
 create mode 100644 automation/scripts/qtb/riscv/config.yaml
 create mode 100644 automation/scripts/qtb/riscv/console_test/__init__.py
 create mode 100644 automation/scripts/qtb/riscv/console_test/console-test.yaml
 create mode 100644 automation/scripts/qtb/riscv/console_test/console_test.py
 create mode 100644 automation/scripts/qtb/riscv/dt.py
 create mode 100644 automation/scripts/qtb/riscv/machine.py
 create mode 100644 automation/scripts/qtb/riscv/paths.py
 create mode 100644 automation/scripts/qtb/riscv/qtb_test.py
 create mode 100644 automation/scripts/qtb/riscv/xen_dt.py

diff --git a/automation/scripts/qemu_smoke_riscv64.py b/automation/scripts/qemu_smoke_riscv64.py
new file mode 100755
index 0000000000..f338fafcc2
--- /dev/null
+++ b/automation/scripts/qemu_smoke_riscv64.py
@@ -0,0 +1,122 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-only
+"""CLI launcher for the qtb riscv64 dom0less tests.
+
+The test type comes first (e.g. `console-test`), then a command. Each type
+reads its own config file, which ships with the type.
+
+Commands:
+    list  Print every test the type defines in the config, then exit.
+    run   Boot one test's machine under QEMU and drive it to a pass/fail
+          verdict.
+
+Usage:
+    ./qemu_smoke_riscv64.py console-test list
+    ./qemu_smoke_riscv64.py console-test run dom0less-1smp-0domu-1vcpu-aplic-imsic-null
+"""
+
+from __future__ import annotations
+
+import argparse
+import logging
+import sys
+from collections.abc import Sequence
+from traceback import extract_tb, format_exc
+
+from qtb.riscv import RiscvQtbTest, TEST_TYPES, RiscvTestMachine, cleanup_temp_dir
+
+logger = logging.getLogger(__name__)
+
+
+def _run_test(test: RiscvQtbTest, log_dir: str | None) -> int:
+    """Compile the machine's device trees, boot it, and run the test."""
+    vm = RiscvTestMachine(test.machine, timeout=test.timeout, log_dir=log_dir)
+    try:
+        with vm:
+            vm.launch()
+            test.run(vm)
+    except Exception as exc:
+        print(
+            f"FAIL: {test.name}: {type(exc).__name__}: {exc}",
+            file=sys.stderr,
+            flush=True,
+        )
+        return 1
+
+    print(f"PASS: {test.name}", flush=True)
+    return 0
+
+
+def _cmd_list(ns: argparse.Namespace) -> int:
+    """`<type> list`: print every test the type defines."""
+    for name in ns.cls.list_tests(ns.cls.config_file):
+        print(name)
+    return 0
+
+
+def _cmd_run(ns: argparse.Namespace) -> int:
+    """`<type> run`: build the named test and drive it to a verdict."""
+    test = ns.cls.from_config(ns.cls.config_file, ns.test)
+    return _run_test(test, ns.log_dir)
+
+
+def setup_parser() -> argparse.ArgumentParser:
+    parser = argparse.ArgumentParser(
+        description="Launch a qtb riscv64 dom0less test: "
+        "qemu_smoke_riscv64.py <type> <command>.",
+    )
+    common_args = argparse.ArgumentParser(add_help=False)
+    common_args.add_argument(
+        "-v", "--verbose", action="store_true", help="Print debug output"
+    )
+    run_args = argparse.ArgumentParser(add_help=False)
+    run_args.add_argument("test", help="Name of the test to run.")
+    run_args.add_argument(
+        "--log-dir",
+        default=None,
+        metavar="DIR",
+        help="Directory for all logs (QEMU process log, qtest, and the "
+        "consoles as con<N>.log). When unset, no logs are written.",
+    )
+
+    # qemu_smoke_riscv64.py <type> <command>
+    types = parser.add_subparsers(dest="type", required=True)
+    for cls in TEST_TYPES:
+        desc = cls.description
+        cmds = types.add_parser(
+            cls.type_id, help=desc, description=desc
+        ).add_subparsers(dest="command", required=True)
+        cmds.add_parser(
+            "list",
+            parents=[common_args],
+            description=desc,
+            help="List the tests for the type and exit.",
+        ).set_defaults(func=_cmd_list, cls=cls)
+        cmds.add_parser(
+            "run",
+            parents=[common_args, run_args],
+            description=desc,
+            help="Run one test.",
+        ).set_defaults(func=_cmd_run, cls=cls)
+
+    return parser
+
+
+def main(argv: Sequence[str] | None = None) -> int:
+    ns = setup_parser().parse_args(argv)
+    logging.basicConfig(
+        level=logging.DEBUG if ns.verbose else logging.WARNING, format="%(message)s"
+    )
+    try:
+        return ns.func(ns)
+    except Exception as exc:
+        logger.debug(format_exc())
+        frame = extract_tb(exc.__traceback__)[-1]
+        print(f"{frame.filename}:{frame.lineno}: {exc}")
+        return 2
+    finally:
+        cleanup_temp_dir()
+
+
+if __name__ == "__main__":
+    sys.exit(main())
diff --git a/automation/scripts/qtb/__init__.py b/automation/scripts/qtb/__init__.py
new file mode 100644
index 0000000000..a0e6e76cb2
--- /dev/null
+++ b/automation/scripts/qtb/__init__.py
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+"""QTB (QEMU Test Bench) test frameworks."""
diff --git a/automation/scripts/qtb/riscv/__init__.py b/automation/scripts/qtb/riscv/__init__.py
new file mode 100644
index 0000000000..6a6c48be32
--- /dev/null
+++ b/automation/scripts/qtb/riscv/__init__.py
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-only
+"""QTB riscv64 test framework package."""
+
+from .qtb_test import RiscvQtbTest
+from .console_test import ConsoleTest
+from .machine import RiscvTestMachine
+from .paths import cleanup_temp_dir
+
+TEST_TYPES: tuple[type[RiscvQtbTest], ...] = (ConsoleTest,)
diff --git a/automation/scripts/qtb/riscv/config.py b/automation/scripts/qtb/riscv/config.py
new file mode 100644
index 0000000000..b5068d6bfb
--- /dev/null
+++ b/automation/scripts/qtb/riscv/config.py
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: GPL-2.0-only
+"""YAML config parser for qtb-based Xen riscv64 tests.
+
+Parsing steps:
+    - validate the YAML
+    - build the dataclasses: the host device tree is compiled on first use
+      of MachineConfig.dt
+"""
+
+from __future__ import annotations
+
+import functools
+import inspect
+from dataclasses import dataclass
+from functools import cached_property
+from pathlib import Path
+
+import yaml
+
+from .paths import resolve_binary, resolve_path
+from .xen_dt import DeviceTree, build_xen_device_tree
+
+XEN_MMU_TYPE_DEFAULT: str = "sv48"
+XEN_BOOTARGS_DEFAULT: str = ""
+
+MACHINE_MEMORY: int = 2048
+MACHINE_INTERRUPT_CONTROLLER: str = "aplic-imsic"
+
+
+def required_keys(argument_name: str, keys: set, label: str = ""):
+    """Validate the dict passed as `argument_name` has every key in `keys`."""
+    keys = set(keys)
+
+    def decorate(func):
+        sig = inspect.signature(func)
+
+        @functools.wraps(func)
+        def wrapper(*args, **kwargs):
+            arg = sig.bind(*args, **kwargs).arguments[argument_name]
+            missing = keys - arg.keys()
+            if missing:
+                raise ValueError(
+                    f"{label or func.__name__} missing keys: {sorted(missing)}"
+                )
+            return func(*args, **kwargs)
+
+        return wrapper
+
+    return decorate
+
+
+@dataclass
+class BinariesConfig:
+    xen: Path
+
+
+@required_keys("raw", {"xen"}, label="binaries config")
+def _parse_binaries(raw: dict) -> BinariesConfig:
+    return BinariesConfig(xen=resolve_binary(raw["xen"]))
+
+
+@required_keys("raw", {"pcpu"}, label="machine config")
+def _parse_machine(
+    raw: dict,
+    binaries: BinariesConfig,
+    machine: str,
+) -> MachineConfig:
+    return MachineConfig(
+        name=machine,
+        pcpu=raw["pcpu"],
+        binaries=binaries,
+        mmu_type=raw.get("mmu_type", XEN_MMU_TYPE_DEFAULT),
+        xen_bootargs=raw.get("xen_bootargs", XEN_BOOTARGS_DEFAULT),
+    )
+
+
+@dataclass(frozen=True)
+class MachineConfig:
+    """One named machine: the test-agnostic description of what to boot.
+
+    A machine is reusable across test types; a test (see RiscvQtbTest
+    subclasses) picks a machine by name and layers its own parameters on top.
+    """
+
+    name: str
+    pcpu: int
+    binaries: BinariesConfig
+    mmu_type: str  # Xen (host) MMU type, injected into the host dts cpus.
+    xen_bootargs: str
+
+    @classmethod
+    def from_config(cls, file_name: str, machine: str) -> MachineConfig:
+        """Build only the single named machine from the catalog at `path`.
+
+        A test run boots one machine, so there is no need to construct the
+        whole catalog: parse the YAML, validate the shared binaries, and
+        build just the requested entry.
+        """
+        fpath: Path = resolve_path(file_name)
+        raw: dict = yaml.safe_load(fpath.read_text())
+
+        required = ("binaries", "machines")
+        missing = [k for k in required if k not in raw]
+        if missing:
+            raise ValueError(f"Global config {file_name} missing keys: {missing}")
+
+        binaries: BinariesConfig = _parse_binaries(raw["binaries"])
+
+        machines = raw["machines"]
+        if machine not in machines:
+            known = ", ".join(sorted(machines)) or "(none)"
+            raise ValueError(f"unknown machine {machine!r}; known machines: {known}")
+
+        return _parse_machine(machines[machine], binaries, machine)
+
+    @cached_property
+    def dt(self) -> DeviceTree:
+        """Host device tree, compiled on first use."""
+        return build_xen_device_tree(self)
diff --git a/automation/scripts/qtb/riscv/config.yaml b/automation/scripts/qtb/riscv/config.yaml
new file mode 100644
index 0000000000..94897827b7
--- /dev/null
+++ b/automation/scripts/qtb/riscv/config.yaml
@@ -0,0 +1,17 @@
+# Shared config for the qtb riscv64 tests
+#
+# A machine is the test-agnostic description of what to boot (cpus, Xen command
+# line). Test YAMLs (e.g. console-test.yaml) pick a machine by name and layer
+# their own parameters on top.
+#
+# Path resolution (see paths.py): `binaries:` entries resolve against
+# $QTB_BINARIES_DIR env var if defined else `binaries`. Absolute paths used
+# as-is.
+
+binaries:
+  xen:      xen
+
+machines:
+  dom0less-1smp-0domu-1vcpu-aplic-imsic-null:
+    xen_bootargs: "sched=null"
+    pcpu: 1
diff --git a/automation/scripts/qtb/riscv/console_test/__init__.py b/automation/scripts/qtb/riscv/console_test/__init__.py
new file mode 100644
index 0000000000..5db5569965
--- /dev/null
+++ b/automation/scripts/qtb/riscv/console_test/__init__.py
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+"""console-test type package."""
+
+from .console_test import ConsoleTest
diff --git a/automation/scripts/qtb/riscv/console_test/console-test.yaml b/automation/scripts/qtb/riscv/console_test/console-test.yaml
new file mode 100644
index 0000000000..cec0edc510
--- /dev/null
+++ b/automation/scripts/qtb/riscv/console_test/console-test.yaml
@@ -0,0 +1,18 @@
+# Console string expectation test (run with: qemu_smoke_riscv64.py console-test run <test>).
+#
+# Each test uses a machine from config.yaml and maps a console index to the list
+# of string(s) expected on that console: 0 is Xen's own console. The runner boots
+# the machine and asserts each string is printed within the timeout. Nothing is
+# injected.
+#
+# Test options:
+#   timeout: int  # timeout between each string match (in seconds)
+#   attempts: int # number of tries for a wait before failing. Default 3 (min = 1)
+
+machine_catalog: config.yaml
+
+tests:
+  dom0less-1smp-0domu-1vcpu-aplic-imsic-null:
+    machine: dom0less-1smp-0domu-1vcpu-aplic-imsic-null
+    expect:
+      0: ["All set up"]
diff --git a/automation/scripts/qtb/riscv/console_test/console_test.py b/automation/scripts/qtb/riscv/console_test/console_test.py
new file mode 100644
index 0000000000..95540fd388
--- /dev/null
+++ b/automation/scripts/qtb/riscv/console_test/console_test.py
@@ -0,0 +1,145 @@
+# SPDX-License-Identifier: GPL-2.0-only
+"""Console string expectation test (`type: console-test`).
+
+Per console: assert each expected string is printed within the timeout.
+Nothing is injected; this only watches console output.
+
+YAML (console-test.yaml): each test names the machine it boots (tests may
+share one) and maps a console index to the string(s) expected on it: 0 is
+Xen's own console.
+
+    machine_catalog: config.yaml
+    tests:
+      dom0less-1smp-0domu-1vcpu-aplic-imsic-null:  # test name (run positional)
+        machine: dom0less-1smp-0domu-1vcpu-aplic-imsic-null  # from config.yaml
+        expect:                                    # console index -> string(s)
+          0: [All set up]
+"""
+
+from __future__ import annotations
+
+import logging
+from typing import ClassVar
+
+import pexpect
+import yaml
+
+from ..paths import resolve_path
+from ..config import MachineConfig, required_keys
+from ..qtb_test import TIMEOUT_DEFAULT, RiscvQtbTest
+from ..machine import RiscvTestMachine
+
+logger = logging.getLogger(__name__)
+
+TYPE_ID: str = "console-test"
+
+CONFIG_FILE_DEFAULT: str = "console_test/console-test.yaml"
+DESCRIPTION_DEFAULT: str = "Assert expected string(s) are printed on the Xen console"
+ATTEMPTS_DEFAULT: int = 3
+
+XEN_CONS_IDX: int = 0
+
+
+class ConsoleTest(RiscvQtbTest):
+    type_id: ClassVar[str] = TYPE_ID
+    description: ClassVar[str] = DESCRIPTION_DEFAULT
+    config_file: ClassVar[str] = CONFIG_FILE_DEFAULT
+
+    def __init__(self, raw: dict, test_name: str) -> None:
+        self.name, self.data, self.machine = self._parse_test_cfg(raw, test_name)
+
+        self.expect = self.data["expect"]  # expected console string
+
+        self.timeout = int(self.data.get("timeout", TIMEOUT_DEFAULT))
+        if self.timeout < 1:
+            raise ValueError("timeout < 1, must be at least 1")
+
+        self.attempts = int(self.data.get("attempts", ATTEMPTS_DEFAULT))
+        if self.attempts < 1:
+            raise ValueError("attempts < 1, must be at least 1")
+
+    @staticmethod
+    def _load_yaml(path) -> dict:
+        return yaml.safe_load(resolve_path(path).read_text())
+
+    @classmethod
+    def from_config(cls, config_file: str, test_name: str) -> ConsoleTest:
+        return cls(cls._load_yaml(config_file), test_name)
+
+    @staticmethod
+    @required_keys("test_data", {"machine", "expect"})
+    def _parse_test_data(
+        machine_catalog: str, test_data: dict, test_name: str
+    ) -> tuple[str, dict, MachineConfig]:
+        """Parse test data dictionary"""
+        test_machine = MachineConfig.from_config(machine_catalog, test_data["machine"])
+
+        def invalid(why: str) -> ValueError:
+            return ValueError(
+                f"test {test_name!r}: {why}; expected "
+                f"{{{XEN_CONS_IDX}: ['str1', 'str2', ...]}}"
+            )
+
+        expect = test_data["expect"]
+        if not isinstance(expect, dict) or expect.keys() != {XEN_CONS_IDX}:
+            raise invalid(
+                f"expect must map console index {XEN_CONS_IDX} (Xen's own "
+                f"console, the only one) and nothing else, got {expect!r}"
+            )
+        strings = expect[XEN_CONS_IDX]
+        if not isinstance(strings, list):
+            raise invalid(
+                f"{ConsoleTest.config_file} expects a list of string(s), "
+                f"got {type(strings).__name__}"
+            )
+        if not strings:
+            raise invalid("Xen has no expected string")
+        if not all(isinstance(s, str) and s for s in strings):
+            raise invalid(f"Xen expects non-empty strings, got {strings!r}")
+        return (test_name, test_data, test_machine)
+
+    @staticmethod
+    @required_keys("raw", {"machine_catalog", "tests"})
+    def _parse_test_cfg(raw: dict, test_name: str) -> tuple[str, dict, MachineConfig]:
+        """Read the config: return the named test dict and its machine."""
+
+        tests = raw["tests"]
+        if test_name not in tests:
+            known = ", ".join(sorted(tests)) or "(none)"
+            raise ValueError(f"unknown test {test_name!r}; known tests: {known}")
+
+        test_data = tests[test_name]
+        return ConsoleTest._parse_test_data(
+            raw["machine_catalog"], test_data, test_name
+        )
+
+    @staticmethod
+    def list_tests(config_file: str) -> list[str]:
+        tests = ConsoleTest._load_yaml(config_file).get("tests")
+        if not tests:
+            logger.warning("no 'tests' key found in %s", config_file)
+            return []
+        return list(tests)
+
+    @staticmethod
+    def _console(vm: RiscvTestMachine):
+        """Xen's own console (con0)."""
+        if vm.console is None:
+            raise RuntimeError("Xen console not wired up, machine not launched?")
+        return vm.console
+
+    def run(self, vm: RiscvTestMachine) -> None:
+        cons = self._console(vm)
+        for strings in self.expect.values():
+            for s in strings:
+                self._expect_string(cons, s)
+
+    def _expect_string(self, cons, expected: str) -> None:
+        """Wait for `expected` on the console, retrying on timeout."""
+        for attempt in range(self.attempts):
+            try:
+                cons.expect_exact(expected, timeout=self.timeout)
+                return
+            except pexpect.TIMEOUT:
+                if attempt == self.attempts - 1:
+                    raise
diff --git a/automation/scripts/qtb/riscv/dt.py b/automation/scripts/qtb/riscv/dt.py
new file mode 100644
index 0000000000..f0376979e5
--- /dev/null
+++ b/automation/scripts/qtb/riscv/dt.py
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: GPL-2.0-only
+"""Device tree (DT) handling: compile a .dts source into a .dtb"""
+
+from __future__ import annotations
+
+import logging
+import subprocess
+from pathlib import Path
+
+logger = logging.getLogger(__name__)
+
+
+def _compile_dts(src: Path, out: Path):
+    """Run dtc to compile .dts `src` into the .dtb file at `out`"""
+    try:
+        p = subprocess.run(
+            ["dtc", "-I", "dts", "-O", "dtb", "-o", str(out), str(src)],
+            check=True,
+            capture_output=True,
+            text=True,
+        )
+        logger.debug("dtc %s: stdout: %s stderr: %s", src, p.stdout, p.stderr)
+
+    except FileNotFoundError as e:
+        raise RuntimeError("dtc not found in PATH; install device-tree-compiler") from e
+    except subprocess.CalledProcessError as e:
+        raise RuntimeError(
+            f"dtc failed on {str(src)!r} (exit {e.returncode}):\n"
+            f" stdout: {e.stdout}\n stderr: {e.stderr}"
+        ) from e
+
+
+def compile_to_dtb(src: Path, out: Path) -> Path:
+    """
+    Compile a .dts source to a .dtb under out dir and return the .dtb path.
+
+    Raises FileNotFoundError if `src` or `out` don't exist.
+    """
+    if not src.exists():
+        raise FileNotFoundError(
+            f"Device tree source {str(src)!r} not found"
+        )
+
+    if not out.exists():
+        raise FileNotFoundError(f"Device Tree output dir: {out} doesn't exist")
+
+    dtb = out / (src.stem + ".dtb")
+    _compile_dts(src, dtb)
+    return dtb
+
+
+def write_dts(text: str, name: str, out_dir: Path) -> Path:
+    """Write generated .dts text to <out_dir>/<name>.dts; return its path."""
+    src = out_dir / f"{name}.dts"
+    src.parent.mkdir(parents=True, exist_ok=True)
+    src.write_text(text)
+    return src
diff --git a/automation/scripts/qtb/riscv/machine.py b/automation/scripts/qtb/riscv/machine.py
new file mode 100644
index 0000000000..74a05dfc82
--- /dev/null
+++ b/automation/scripts/qtb/riscv/machine.py
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: GPL-2.0-only
+"""QtbMachine for riscv64."""
+
+from __future__ import annotations
+
+from collections.abc import Sequence
+
+from qemu.qtb import QtbMachine
+
+from .config import MACHINE_INTERRUPT_CONTROLLER, MACHINE_MEMORY, MachineConfig
+from .paths import resolve_from_path
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
+        mc: MachineConfig,
+        *,
+        timeout: int,
+        log_dir: str | None = None,
+    ) -> None:
+        self.machine_conf = mc
+        super().__init__(
+            memory=MACHINE_MEMORY,
+            cpus=mc.pcpu,
+            mirror_console=False,
+            timeout=timeout,
+            log_dir=log_dir,
+        )
+
+    def _machine_args(self, memory: int, cpus: int) -> Sequence[str]:
+        machine = self.machine_conf
+        machine_opt = f"virt,aclint=off,aia={MACHINE_INTERRUPT_CONTROLLER}"
+        # Xen has no sstc support yet.
+        cpu_opt = "rv64,svpbmt=on,smstateen=on,sstc=off"
+        return [
+            "-dtb",
+            str(machine.dt.dtb),
+            "-M",
+            machine_opt,
+            "-cpu",
+            cpu_opt,
+            "-smp",
+            str(cpus),
+            "-m",
+            str(memory),
+            "-kernel",
+            str(machine.binaries.xen),
+        ]
+
+    def _resolve_binary(self) -> str:
+        return str(resolve_from_path(self.qemu_bin))
diff --git a/automation/scripts/qtb/riscv/paths.py b/automation/scripts/qtb/riscv/paths.py
new file mode 100644
index 0000000000..237f1bf502
--- /dev/null
+++ b/automation/scripts/qtb/riscv/paths.py
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: GPL-2.0-only
+"""Path helpers: resolve pkg-relative paths."""
+
+from __future__ import annotations
+
+import os
+import shutil
+import tempfile
+from functools import lru_cache
+from pathlib import Path
+
+# Every relative path in this module is resolved against this base.
+_BASE = Path(__file__).resolve().parent
+
+# Build artifacts, overridable for CI.
+_BINARIES_BASE = Path(os.environ.get("QTB_BINARIES_DIR") or _BASE / "binaries")
+
+
+@lru_cache(maxsize=1)
+def _temp_dir_handle() -> tempfile.TemporaryDirectory:
+    return tempfile.TemporaryDirectory(prefix="qtb-")
+
+
+def temp_dir() -> Path:
+    """Process-wide scratch dir for generated/compiled artifacts (singleton)."""
+    return Path(_temp_dir_handle().name)
+
+
+def cleanup_temp_dir() -> None:
+    """Remove the scratch dir, if one was created, and clear the cache."""
+    if _temp_dir_handle.cache_info().currsize:
+        _temp_dir_handle().cleanup()
+        _temp_dir_handle.cache_clear()
+
+
+def resolve_path(file_name: str) -> Path:
+    """Resolve `file_name` against _BASE, absolute paths pass through."""
+    return _resolve_under(file_name, _BASE)
+
+
+def resolve_binary(file_name: str) -> Path:
+    """Resolve a build artifact against _BINARIES_BASE, absolute paths pass through."""
+    return _resolve_under(file_name, _BINARIES_BASE)
+
+
+def resolve_from_path(file_name: str) -> Path:
+    """Resolve an executable on $PATH, absolute paths pass through."""
+    path = shutil.which(file_name)
+    if not path:
+        raise FileNotFoundError(f"cannot resolve {file_name!r}: not an executable on $PATH")
+    return Path(path)
+
+
+def _resolve_under(file_name: str, base: Path) -> Path:
+    """Resolve `file_name` against `base`, absolute paths pass through."""
+    p = Path(file_name)
+    path = p if p.is_absolute() else base / p
+    if not path.exists():
+        raise FileNotFoundError(f"cannot resolve {str(path)!r}: does not exist")
+    return path
diff --git a/automation/scripts/qtb/riscv/qtb_test.py b/automation/scripts/qtb/riscv/qtb_test.py
new file mode 100644
index 0000000000..872fbc2fa9
--- /dev/null
+++ b/automation/scripts/qtb/riscv/qtb_test.py
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: GPL-2.0-only
+"""Abstract base for the qtb riscv64 test types.
+
+A test type is a RiscvQtbTest subclass owning a config file that describes its
+tests, each bound to a machine from the shared catalog.
+"""
+
+from __future__ import annotations
+
+from abc import ABC, abstractmethod
+from typing import ClassVar
+
+from .config import MachineConfig
+from .machine import RiscvTestMachine
+
+# Default per-test timeout (seconds)
+TIMEOUT_DEFAULT: int = 120
+
+
+class RiscvQtbTest(ABC):
+    """One runnable test bound to the machine it boots.
+
+    A subclass sets `type_id`, `description`, and `config_file`, and implements
+    `from_config` to parse its config file, `list_tests` to enumerate the tests
+    it declares, and `run` to drive the test logic.
+    """
+
+    # Set by each concrete subclass.
+    type_id: ClassVar[str] = ""
+    # One-line summary of what the type does, shown in the CLI help.
+    description: ClassVar[str] = ""
+    # Config file the type reads its tests from, resolved pkg-relative.
+    config_file: ClassVar[str] = ""
+
+    # Set by the subclass parser.
+    name: str
+    data: dict
+    machine: MachineConfig
+    timeout: int = TIMEOUT_DEFAULT
+
+    @classmethod
+    @abstractmethod
+    def from_config(cls, config_file: str, test_name: str) -> RiscvQtbTest:
+        """Build the test named `test_name` from `config_file`."""
+
+    @staticmethod
+    @abstractmethod
+    def list_tests(config_file: str) -> list[str]:
+        """Return the names of every test declared in the config file."""
+
+    @abstractmethod
+    def run(self, vm: RiscvTestMachine) -> None:
+        """Drive the running machine and assert the expected result."""
diff --git a/automation/scripts/qtb/riscv/xen_dt.py b/automation/scripts/qtb/riscv/xen_dt.py
new file mode 100644
index 0000000000..8881b01b36
--- /dev/null
+++ b/automation/scripts/qtb/riscv/xen_dt.py
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: GPL-2.0-only
+"""Build the Xen host device tree for a MachineConfig.
+
+The tree is rendered from its Jinja2 template (dts/qemu-host.dts.j2), which
+takes the hart count, the Xen MMU type and the Xen command line, then compiled
+to a DTB with dtc.
+"""
+
+from __future__ import annotations
+
+from dataclasses import dataclass
+from functools import lru_cache
+from pathlib import Path
+from typing import TYPE_CHECKING
+from jinja2 import Environment, FileSystemLoader
+
+from .paths import resolve_path, temp_dir
+from .dt import compile_to_dtb, write_dts
+
+if TYPE_CHECKING:  # config imports this module, so only import it for typing.
+    from .config import MachineConfig
+
+# Directory holding the Jinja2 platform device tree templates.
+_DTS_DIR = "dts"
+
+
+@dataclass(frozen=True)
+class DeviceTree:
+    """Compiled device trees for one machine launch."""
+
+    dts: Path
+    dtb: Path
+
+
+@lru_cache(maxsize=1)
+def _env() -> Environment:
+    return Environment(
+        loader=FileSystemLoader(resolve_path(_DTS_DIR)),
+        keep_trailing_newline=True,
+    )
+
+
+def _render_xen_dts(machine: MachineConfig) -> str:
+    """Render the Xen host device tree source text for `machine`."""
+    tmpl = _env().get_template("qemu-host.dts.j2")
+    return tmpl.render(
+        ncpus=machine.pcpu,
+        mmu_type=machine.mmu_type,
+        xen_bootargs=machine.xen_bootargs,
+    )
+
+
+def build_xen_device_tree(machine: MachineConfig) -> DeviceTree:
+    """Compile `machine` device tree into the shared scratch dir."""
+    out = temp_dir()
+    dts: Path = write_dts(_render_xen_dts(machine), machine.name, out)
+    dtb: Path = compile_to_dtb(dts, out)
+    return DeviceTree(dts=dts, dtb=dtb)

