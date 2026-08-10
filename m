Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007C3C5AD7B
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 16:10:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387636.1628906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtSZx-0003q4-N0; Mon, 10 Aug 2026 16:10:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387636.1628906; Mon, 10 Aug 2026 16:10:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtSZx-0003px-JW; Mon, 10 Aug 2026 16:10:21 +0000
Received: by outflank-mailman (input) for mailman id 1387636;
 Mon, 10 Aug 2026 16:10:20 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fec7059c4000e099@swg.vates.tech>)
 id 1wtSZw-0003V4-M9
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 16:10:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtSZw-008NAc-2g
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 18:10:20 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fec7059c4000e099@swg.vates.tech>)
 id 6a79f7dd-bab6-0a2a0a5309dd-0a2a45049fd2-30
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 18:10:20 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fec7059c4000e099@swg.vates.tech>)
 id 6a79f7e9-b57f-0a2a45040019-b9ff1c128dc1-4
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 18:10:19 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fec7059c4000e099.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 10 Aug 2026 16:10:13 +0000
Received: from leducb (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 17DBA83637;
 Mon, 10 Aug 2026 18:10:13 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=4gwMD6zXp3l+68wW5VATdQU87ALcOqMpO+ibR2khxMk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=qoT8XPsVnYTVy3ZrL7EMcKfbekmhFjlYs+vYaEbWIkE2S6AB/dYx3k6w/IsiqAmpaj9m9Her3
 Q/5jhKRN/kThgy/9RW/r4TqYU/SaKWPKxZIyoZZTmfYsd71S5hYxl0TCocyt+mT6W4P8HtDVuJq
 v8qMYdWyiZxX2ydCPKK6xpZiAmycYLQK8KTaOm9gB6i7Oek3U3NWFvuv2s8tiLz/H6bEmre05ez
 Y6w3FXK2nMNonZs83EhWtQWe1BYRzRRaBvKa/rMAfFLdurEDWglzubjkKVisfmzAArVPIf69E9t
 wnIHsdXEnK8/e4/1uIc/TzIltv1AMIcPFo/v1EkOPZpg==
X-Zone-Loop: 6278c9a605463988f0e2096657a2f01e6a13ac656913
x-campaign-type: default
x-transaction-id: 2f24dc91-d34a-4ced-b8d8-e3a2d1e72128
x-swg-uid: 01-78e2c1f4-9781-4c1e-a18a-116b488b716b
X-Mailer: Sweego
Message-ID:
 <1786378213.8631fc262581453bbf619ec5b2062170.19fec7059c4000e099@vates.tech>
x-swg-bid: 1786378213.8631fc262581453bbf619ec5b2062170.19fec7059c4000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 3/6] automation/qtb: add Python QTB framework with the console-test type
Date: Mon, 10 Aug 2026 18:09:53 +0200
In-Reply-To: <20260810155543.927954-1-baptiste.le-duc@vates.tech>
References: <20260810155543.927954-1-baptiste.le-duc@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.204a.3666f13f27356d06.19fec70574c.2d6a0cec16cef1a9=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1786378213196
X-purgate-ID: tlsNG-ebf023/1786378220-528C9B50-72A61DF8/0/0
X-purgate-type: clean
X-purgate-size: 32316

---=Part.204a.3666f13f27356d06.19fec70574c.2d6a0cec16cef1a9=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Port qemu-smoke-riscv64=2Esh from shell to a Python QTB framework that driv=
es
QEMU over qtest/QMP and the console to run riscv64 smoke tests=2E

The framework is based on AMD's QTB (QEMU Test Bench) framework, which is
not yet upstream in QEMU but is planned to be soon=2E This is a riscv64
adaptation of it=2E

The framework:
  - parses a test config (config=2Eyaml) into typed machine descriptions
    (config=2Epy)=2E The host device tree of a machine is compiled on firs=
t
    use of MachineConfig=2Edt, so a run that never boots (`list`, or a
    config error) does not invoke dtc=2E
  - generates the Xen host device tree from a Jinja2 template and compiles
    it to a DTB with dtc (xen_dt=2Epy, dt=2Epy)=2E
  - assembles the QEMU command line in RiscvTestMachine (machine=2Epy),
    resolving artifact paths via paths=2Epy=2E
  - defines an abstract RiscvQtbTest base shared by every test type
    (qtb_test=2Epy)=2E
  - wires it together behind a CLI: the test type is a leading positional
    with `list` and `run` subcommands (qemu_smoke_riscv64=2Epy)=2E

console-test test type comes with it=2E It boots a machine from the shared
catalog and asserts every expected string is printed on Xen's own console
within the timeout=2E Its tests live in console-test=2Eyaml, which maps co=
nsole
indices to the expected output strings=2E This makes it straightforward to
add support for a domU console index once Xen provides it=2E

Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste=2Ele-duc@vates=2Etech>
---
 automation/scripts/qemu_smoke_riscv64=2Epy      | 122 +++++++++++++++
 automation/scripts/qtb/__init__=2Epy            |   2 +
 automation/scripts/qtb/riscv/__init__=2Epy      |   9 ++
 automation/scripts/qtb/riscv/config=2Epy        | 125 +++++++++++++++
 automation/scripts/qtb/riscv/config=2Eyaml      |  19 +++
 =2E=2E=2E/qtb/riscv/console_test/__init__=2Epy        |   4 +
 =2E=2E=2E/qtb/riscv/console_test/console-test=2Eyaml  |  18 +++
 =2E=2E=2E/qtb/riscv/console_test/console_test=2Epy    | 145 +++++++++++++=
+++++
 automation/scripts/qtb/riscv/dt=2Epy            |  57 +++++++
 automation/scripts/qtb/riscv/machine=2Epy       |  56 +++++++
 automation/scripts/qtb/riscv/paths=2Epy         |  51 ++++++
 automation/scripts/qtb/riscv/qtb_test=2Epy      |  53 +++++++
 automation/scripts/qtb/riscv/xen_dt=2Epy        |  58 +++++++
 13 files changed, 719 insertions(+)
 create mode 100755 automation/scripts/qemu_smoke_riscv64=2Epy
 create mode 100644 automation/scripts/qtb/__init__=2Epy
 create mode 100644 automation/scripts/qtb/riscv/__init__=2Epy
 create mode 100644 automation/scripts/qtb/riscv/config=2Epy
 create mode 100644 automation/scripts/qtb/riscv/config=2Eyaml
 create mode 100644 automation/scripts/qtb/riscv/console_test/__init__=2Ep=
y
 create mode 100644 automation/scripts/qtb/riscv/console_test/console-test=
=2Eyaml
 create mode 100644 automation/scripts/qtb/riscv/console_test/console_test=
=2Epy
 create mode 100644 automation/scripts/qtb/riscv/dt=2Epy
 create mode 100644 automation/scripts/qtb/riscv/machine=2Epy
 create mode 100644 automation/scripts/qtb/riscv/paths=2Epy
 create mode 100644 automation/scripts/qtb/riscv/qtb_test=2Epy
 create mode 100644 automation/scripts/qtb/riscv/xen_dt=2Epy

diff --git a/automation/scripts/qemu_smoke_riscv64=2Epy b/automation/scrip=
ts/qemu_smoke_riscv64=2Epy
new file mode 100755
index 0000000000=2E=2Ef338fafcc2
--- /dev/null
+++ b/automation/scripts/qemu_smoke_riscv64=2Epy
@@ -0,0 +1,122 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2=2E0-only
+"""CLI launcher for the qtb riscv64 dom0less tests=2E
+
+The test type comes first (e=2Eg=2E `console-test`), then a command=2E Ea=
ch type
+reads its own config file, which ships with the type=2E
+
+Commands:
+    list  Print every test the type defines in the config, then exit=2E
+    run   Boot one test's machine under QEMU and drive it to a pass/fail
+          verdict=2E
+
+Usage:
+    =2E/qemu_smoke_riscv64=2Epy console-test list
+    =2E/qemu_smoke_riscv64=2Epy console-test run dom0less-1smp-0domu-1vcp=
u-aplic-imsic-null
+"""
+
+from __future__ import annotations
+
+import argparse
+import logging
+import sys
+from collections=2Eabc import Sequence
+from traceback import extract_tb, format_exc
+
+from qtb=2Eriscv import RiscvQtbTest, TEST_TYPES, RiscvTestMachine, clean=
up_temp_dir
+
+logger =3D logging=2EgetLogger(__name__)
+
+
+def _run_test(test: RiscvQtbTest, log_dir: str | None) -> int:
+    """Compile the machine's device trees, boot it, and run the test=2E""=
"
+    vm =3D RiscvTestMachine(test=2Emachine, timeout=3Dtest=2Etimeout, log=
_dir=3Dlog_dir)
+    try:
+        with vm:
+            vm=2Elaunch()
+            test=2Erun(vm)
+    except Exception as exc:
+        print(
+            f"FAIL: {test=2Ename}: {type(exc)=2E__name__}: {exc}",
+            file=3Dsys=2Estderr,
+            flush=3DTrue,
+        )
+        return 1
+
+    print(f"PASS: {test=2Ename}", flush=3DTrue)
+    return 0
+
+
+def _cmd_list(ns: argparse=2ENamespace) -> int:
+    """`<type> list`: print every test the type defines=2E"""
+    for name in ns=2Ecls=2Elist_tests(ns=2Ecls=2Econfig_file):
+        print(name)
+    return 0
+
+
+def _cmd_run(ns: argparse=2ENamespace) -> int:
+    """`<type> run`: build the named test and drive it to a verdict=2E"""
+    test =3D ns=2Ecls=2Efrom_config(ns=2Ecls=2Econfig_file, ns=2Etest)
+    return _run_test(test, ns=2Elog_dir)
+
+
+def setup_parser() -> argparse=2EArgumentParser:
+    parser =3D argparse=2EArgumentParser(
+        description=3D"Launch a qtb riscv64 dom0less test: "
+        "qemu_smoke_riscv64=2Epy <type> <command>=2E",
+    )
+    common_args =3D argparse=2EArgumentParser(add_help=3DFalse)
+    common_args=2Eadd_argument(
+        "-v", "--verbose", action=3D"store_true", help=3D"Print debug out=
put"
+    )
+    run_args =3D argparse=2EArgumentParser(add_help=3DFalse)
+    run_args=2Eadd_argument("test", help=3D"Name of the test to run=2E")
+    run_args=2Eadd_argument(
+        "--log-dir",
+        default=3DNone,
+        metavar=3D"DIR",
+        help=3D"Directory for all logs (QEMU process log, qtest, and the =
"
+        "consoles as con<N>=2Elog)=2E When unset, no logs are written=2E"=
,
+    )
+
+    # qemu_smoke_riscv64=2Epy <type> <command>
+    types =3D parser=2Eadd_subparsers(dest=3D"type", required=3DTrue)
+    for cls in TEST_TYPES:
+        desc =3D cls=2Edescription
+        cmds =3D types=2Eadd_parser(
+            cls=2Etype_id, help=3Ddesc, description=3Ddesc
+        )=2Eadd_subparsers(dest=3D"command", required=3DTrue)
+        cmds=2Eadd_parser(
+            "list",
+            parents=3D[common_args],
+            description=3Ddesc,
+            help=3D"List the tests for the type and exit=2E",
+        )=2Eset_defaults(func=3D_cmd_list, cls=3Dcls)
+        cmds=2Eadd_parser(
+            "run",
+            parents=3D[common_args, run_args],
+            description=3Ddesc,
+            help=3D"Run one test=2E",
+        )=2Eset_defaults(func=3D_cmd_run, cls=3Dcls)
+
+    return parser
+
+
+def main(argv: Sequence[str] | None =3D None) -> int:
+    ns =3D setup_parser()=2Eparse_args(argv)
+    logging=2EbasicConfig(
+        level=3Dlogging=2EDEBUG if ns=2Everbose else logging=2EWARNING, f=
ormat=3D"%(message)s"
+    )
+    try:
+        return ns=2Efunc(ns)
+    except Exception as exc:
+        logger=2Edebug(format_exc())
+        frame =3D extract_tb(exc=2E__traceback__)[-1]
+        print(f"{frame=2Efilename}:{frame=2Elineno}: {exc}")
+        return 2
+    finally:
+        cleanup_temp_dir()
+
+
+if __name__ =3D=3D "__main__":
+    sys=2Eexit(main())
diff --git a/automation/scripts/qtb/__init__=2Epy b/automation/scripts/qtb=
/__init__=2Epy
new file mode 100644
index 0000000000=2E=2Ea0e6e76cb2
--- /dev/null
+++ b/automation/scripts/qtb/__init__=2Epy
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2=2E0-only
+"""QTB (QEMU Test Bench) test frameworks=2E"""
diff --git a/automation/scripts/qtb/riscv/__init__=2Epy b/automation/scrip=
ts/qtb/riscv/__init__=2Epy
new file mode 100644
index 0000000000=2E=2E6a6c48be32
--- /dev/null
+++ b/automation/scripts/qtb/riscv/__init__=2Epy
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2=2E0-only
+"""QTB riscv64 test framework package=2E"""
+
+from =2Eqtb_test import RiscvQtbTest
+from =2Econsole_test import ConsoleTest
+from =2Emachine import RiscvTestMachine
+from =2Epaths import cleanup_temp_dir
+
+TEST_TYPES: tuple[type[RiscvQtbTest], =2E=2E=2E] =3D (ConsoleTest,)
diff --git a/automation/scripts/qtb/riscv/config=2Epy b/automation/scripts=
/qtb/riscv/config=2Epy
new file mode 100644
index 0000000000=2E=2E92b5ea0f55
--- /dev/null
+++ b/automation/scripts/qtb/riscv/config=2Epy
@@ -0,0 +1,125 @@
+# SPDX-License-Identifier: GPL-2=2E0-only
+"""YAML config parser for qtb-based Xen riscv64 tests=2E
+
+Parsing steps:
+    - validate the YAML
+    - build the dataclasses: the host device tree is compiled on first us=
e
+      of MachineConfig=2Edt
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
+from =2Epaths import resolve_binary, resolve_path
+from =2Exen_dt import DeviceTree, build_xen_device_tree
+
+XEN_MMU_TYPE_DEFAULT: str =3D "sv48"
+XEN_BOOTARGS_DEFAULT: str =3D ""
+
+MACHINE_MEMORY: int =3D 2048
+MACHINE_INTERRUPT_CONTROLLER: str =3D "aplic-imsic"
+
+
+def required_keys(argument_name: str, keys: set, label: str =3D ""):
+    """Validate the dict passed as `argument_name` has every key in `keys=
`=2E"""
+    keys =3D set(keys)
+
+    def decorate(func):
+        sig =3D inspect=2Esignature(func)
+
+        @functools=2Ewraps(func)
+        def wrapper(*args, **kwargs):
+            arg =3D sig=2Ebind(*args, **kwargs)=2Earguments[argument_name=
]
+            missing =3D keys - arg=2Ekeys()
+            if missing:
+                raise ValueError(
+                    f"{label or func=2E__name__} missing keys: {sorted(mi=
ssing)}"
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
+    qemu: Path
+    firmware: Path
+    xen: Path
+
+
+@required_keys("raw", {"qemu", "firmware", "xen"}, label=3D"binaries conf=
ig")
+def _parse_binaries(raw: dict) -> BinariesConfig:
+    return BinariesConfig(
+        qemu=3Dresolve_binary(raw["qemu"]),
+        firmware=3Dresolve_binary(raw["firmware"]),
+        xen=3Dresolve_binary(raw["xen"]),
+    )
+
+
+@required_keys("raw", {"pcpu"}, label=3D"machine config")
+def _parse_machine(
+    raw: dict,
+    binaries: BinariesConfig,
+    machine: str,
+) -> MachineConfig:
+    return MachineConfig(
+        name=3Dmachine,
+        pcpu=3Draw["pcpu"],
+        binaries=3Dbinaries,
+        mmu_type=3Draw=2Eget("mmu_type", XEN_MMU_TYPE_DEFAULT),
+        xen_bootargs=3Draw=2Eget("xen_bootargs", XEN_BOOTARGS_DEFAULT),
+    )
+
+
+@dataclass(frozen=3DTrue)
+class MachineConfig:
+    """One named machine: the test-agnostic description of what to boot=
=2E
+
+    A machine is reusable across test types; a test (see RiscvQtbTest
+    subclasses) picks a machine by name and layers its own parameters on =
top=2E
+    """
+
+    name: str
+    pcpu: int
+    binaries: BinariesConfig
+    mmu_type: str  # Xen (host) MMU type, injected into the host dts cpus=
=2E
+    xen_bootargs: str
+
+    @classmethod
+    def from_config(cls, file_name: str, machine: str) -> MachineConfig:
+        """Build only the single named machine from the catalog at `path`=
=2E
+
+        A test run boots one machine, so there is no need to construct th=
e
+        whole catalog: parse the YAML, validate the shared binaries, and
+        build just the requested entry=2E
+        """
+        fpath: Path =3D resolve_path(file_name)
+        raw: dict =3D yaml=2Esafe_load(fpath=2Eread_text())
+
+        required =3D ("binaries", "machines")
+        missing =3D [k for k in required if k not in raw]
+        if missing:
+            raise ValueError(f"Global config {file_name} missing keys: {m=
issing}")
+
+        binaries: BinariesConfig =3D _parse_binaries(raw["binaries"])
+
+        machines =3D raw["machines"]
+        if machine not in machines:
+            known =3D ", "=2Ejoin(sorted(machines)) or "(none)"
+            raise ValueError(f"unknown machine {machine!r}; known machine=
s: {known}")
+
+        return _parse_machine(machines[machine], binaries, machine)
+
+    @cached_property
+    def dt(self) -> DeviceTree:
+        """Host device tree, compiled on first use=2E"""
+        return build_xen_device_tree(self)
diff --git a/automation/scripts/qtb/riscv/config=2Eyaml b/automation/scrip=
ts/qtb/riscv/config=2Eyaml
new file mode 100644
index 0000000000=2E=2Ec1b69ad441
--- /dev/null
+++ b/automation/scripts/qtb/riscv/config=2Eyaml
@@ -0,0 +1,19 @@
+# Shared config for the qtb riscv64 tests
+#
+# A machine is the test-agnostic description of what to boot (cpus, Xen c=
ommand
+# line)=2E Test YAMLs (e=2Eg=2E console-test=2Eyaml) pick a machine by na=
me and layer
+# their own parameters on top=2E
+#
+# Path resolution (see paths=2Epy): `binaries:` entries resolve against
+# $QTB_BINARIES_DIR env var if defined else `binaries`=2E Absolute paths =
used
+# as-is=2E
+
+binaries:
+  qemu:     qemu-system-riscv64
+  firmware: opensbi-riscv64-generic-fw_dynamic=2Ebin
+  xen:      xen
+
+machines:
+  dom0less-1smp-0domu-1vcpu-aplic-imsic-null:
+    xen_bootargs: "sched=3Dnull"
+    pcpu: 1
diff --git a/automation/scripts/qtb/riscv/console_test/__init__=2Epy b/aut=
omation/scripts/qtb/riscv/console_test/__init__=2Epy
new file mode 100644
index 0000000000=2E=2E5db5569965
--- /dev/null
+++ b/automation/scripts/qtb/riscv/console_test/__init__=2Epy
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2=2E0-only
+"""console-test type package=2E"""
+
+from =2Econsole_test import ConsoleTest
diff --git a/automation/scripts/qtb/riscv/console_test/console-test=2Eyaml=
 b/automation/scripts/qtb/riscv/console_test/console-test=2Eyaml
new file mode 100644
index 0000000000=2E=2Ecec0edc510
--- /dev/null
+++ b/automation/scripts/qtb/riscv/console_test/console-test=2Eyaml
@@ -0,0 +1,18 @@
+# Console string expectation test (run with: qemu_smoke_riscv64=2Epy cons=
ole-test run <test>)=2E
+#
+# Each test uses a machine from config=2Eyaml and maps a console index to=
 the list
+# of string(s) expected on that console: 0 is Xen's own console=2E The ru=
nner boots
+# the machine and asserts each string is printed within the timeout=2E No=
thing is
+# injected=2E
+#
+# Test options:
+#   timeout: int  # timeout between each string match (in seconds)
+#   attempts: int # number of tries for a wait before failing=2E Default =
3 (min =3D 1)
+
+machine_catalog: config=2Eyaml
+
+tests:
+  dom0less-1smp-0domu-1vcpu-aplic-imsic-null:
+    machine: dom0less-1smp-0domu-1vcpu-aplic-imsic-null
+    expect:
+      0: ["All set up"]
diff --git a/automation/scripts/qtb/riscv/console_test/console_test=2Epy b=
/automation/scripts/qtb/riscv/console_test/console_test=2Epy
new file mode 100644
index 0000000000=2E=2E95540fd388
--- /dev/null
+++ b/automation/scripts/qtb/riscv/console_test/console_test=2Epy
@@ -0,0 +1,145 @@
+# SPDX-License-Identifier: GPL-2=2E0-only
+"""Console string expectation test (`type: console-test`)=2E
+
+Per console: assert each expected string is printed within the timeout=2E
+Nothing is injected; this only watches console output=2E
+
+YAML (console-test=2Eyaml): each test names the machine it boots (tests m=
ay
+share one) and maps a console index to the string(s) expected on it: 0 is
+Xen's own console=2E
+
+    machine_catalog: config=2Eyaml
+    tests:
+      dom0less-1smp-0domu-1vcpu-aplic-imsic-null:  # test name (run posit=
ional)
+        machine: dom0less-1smp-0domu-1vcpu-aplic-imsic-null  # from confi=
g=2Eyaml
+        expect:                                    # console index -> str=
ing(s)
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
+from =2E=2Epaths import resolve_path
+from =2E=2Econfig import MachineConfig, required_keys
+from =2E=2Eqtb_test import TIMEOUT_DEFAULT, RiscvQtbTest
+from =2E=2Emachine import RiscvTestMachine
+
+logger =3D logging=2EgetLogger(__name__)
+
+TYPE_ID: str =3D "console-test"
+
+CONFIG_FILE_DEFAULT: str =3D "console_test/console-test=2Eyaml"
+DESCRIPTION_DEFAULT: str =3D "Assert expected string(s) are printed on th=
e Xen console"
+ATTEMPTS_DEFAULT: int =3D 3
+
+XEN_CONS_IDX: int =3D 0
+
+
+class ConsoleTest(RiscvQtbTest):
+    type_id: ClassVar[str] =3D TYPE_ID
+    description: ClassVar[str] =3D DESCRIPTION_DEFAULT
+    config_file: ClassVar[str] =3D CONFIG_FILE_DEFAULT
+
+    def __init__(self, raw: dict, test_name: str) -> None:
+        self=2Ename, self=2Edata, self=2Emachine =3D self=2E_parse_test_c=
fg(raw, test_name)
+
+        self=2Eexpect =3D self=2Edata["expect"]  # expected console strin=
g
+
+        self=2Etimeout =3D int(self=2Edata=2Eget("timeout", TIMEOUT_DEFAU=
LT))
+        if self=2Etimeout < 1:
+            raise ValueError("timeout < 1, must be at least 1")
+
+        self=2Eattempts =3D int(self=2Edata=2Eget("attempts", ATTEMPTS_DE=
FAULT))
+        if self=2Eattempts < 1:
+            raise ValueError("attempts < 1, must be at least 1")
+
+    @staticmethod
+    def _load_yaml(path) -> dict:
+        return yaml=2Esafe_load(resolve_path(path)=2Eread_text())
+
+    @classmethod
+    def from_config(cls, config_file: str, test_name: str) -> ConsoleTest=
:
+        return cls(cls=2E_load_yaml(config_file), test_name)
+
+    @staticmethod
+    @required_keys("test_data", {"machine", "expect"})
+    def _parse_test_data(
+        machine_catalog: str, test_data: dict, test_name: str
+    ) -> tuple[str, dict, MachineConfig]:
+        """Parse test data dictionary"""
+        test_machine =3D MachineConfig=2Efrom_config(machine_catalog, tes=
t_data["machine"])
+
+        def invalid(why: str) -> ValueError:
+            return ValueError(
+                f"test {test_name!r}: {why}; expected "
+                f"{{{XEN_CONS_IDX}: ['str1', 'str2', =2E=2E=2E]}}"
+            )
+
+        expect =3D test_data["expect"]
+        if not isinstance(expect, dict) or expect=2Ekeys() !=3D {XEN_CONS=
_IDX}:
+            raise invalid(
+                f"expect must map console index {XEN_CONS_IDX} (Xen's own=
 "
+                f"console, the only one) and nothing else, got {expect!r}=
"
+            )
+        strings =3D expect[XEN_CONS_IDX]
+        if not isinstance(strings, list):
+            raise invalid(
+                f"{ConsoleTest=2Econfig_file} expects a list of string(s)=
, "
+                f"got {type(strings)=2E__name__}"
+            )
+        if not strings:
+            raise invalid("Xen has no expected string")
+        if not all(isinstance(s, str) and s for s in strings):
+            raise invalid(f"Xen expects non-empty strings, got {strings!r=
}")
+        return (test_name, test_data, test_machine)
+
+    @staticmethod
+    @required_keys("raw", {"machine_catalog", "tests"})
+    def _parse_test_cfg(raw: dict, test_name: str) -> tuple[str, dict, Ma=
chineConfig]:
+        """Read the config: return the named test dict and its machine=2E=
"""
+
+        tests =3D raw["tests"]
+        if test_name not in tests:
+            known =3D ", "=2Ejoin(sorted(tests)) or "(none)"
+            raise ValueError(f"unknown test {test_name!r}; known tests: {=
known}")
+
+        test_data =3D tests[test_name]
+        return ConsoleTest=2E_parse_test_data(
+            raw["machine_catalog"], test_data, test_name
+        )
+
+    @staticmethod
+    def list_tests(config_file: str) -> list[str]:
+        tests =3D ConsoleTest=2E_load_yaml(config_file)=2Eget("tests")
+        if not tests:
+            logger=2Ewarning("no 'tests' key found in %s", config_file)
+            return []
+        return list(tests)
+
+    @staticmethod
+    def _console(vm: RiscvTestMachine):
+        """Xen's own console (con0)=2E"""
+        if vm=2Econsole is None:
+            raise RuntimeError("Xen console not wired up, machine not lau=
nched?")
+        return vm=2Econsole
+
+    def run(self, vm: RiscvTestMachine) -> None:
+        cons =3D self=2E_console(vm)
+        for strings in self=2Eexpect=2Evalues():
+            for s in strings:
+                self=2E_expect_string(cons, s)
+
+    def _expect_string(self, cons, expected: str) -> None:
+        """Wait for `expected` on the console, retrying on timeout=2E"""
+        for attempt in range(self=2Eattempts):
+            try:
+                cons=2Eexpect_exact(expected, timeout=3Dself=2Etimeout)
+                return
+            except pexpect=2ETIMEOUT:
+                if attempt =3D=3D self=2Eattempts - 1:
+                    raise
diff --git a/automation/scripts/qtb/riscv/dt=2Epy b/automation/scripts/qtb=
/riscv/dt=2Epy
new file mode 100644
index 0000000000=2E=2Ef0376979e5
--- /dev/null
+++ b/automation/scripts/qtb/riscv/dt=2Epy
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: GPL-2=2E0-only
+"""Device tree (DT) handling: compile a =2Edts source into a =2Edtb"""
+
+from __future__ import annotations
+
+import logging
+import subprocess
+from pathlib import Path
+
+logger =3D logging=2EgetLogger(__name__)
+
+
+def _compile_dts(src: Path, out: Path):
+    """Run dtc to compile =2Edts `src` into the =2Edtb file at `out`"""
+    try:
+        p =3D subprocess=2Erun(
+            ["dtc", "-I", "dts", "-O", "dtb", "-o", str(out), str(src)],
+            check=3DTrue,
+            capture_output=3DTrue,
+            text=3DTrue,
+        )
+        logger=2Edebug("dtc %s: stdout: %s stderr: %s", src, p=2Estdout, =
p=2Estderr)
+
+    except FileNotFoundError as e:
+        raise RuntimeError("dtc not found in PATH; install device-tree-co=
mpiler") from e
+    except subprocess=2ECalledProcessError as e:
+        raise RuntimeError(
+            f"dtc failed on {str(src)!r} (exit {e=2Ereturncode}):\n"
+            f" stdout: {e=2Estdout}\n stderr: {e=2Estderr}"
+        ) from e
+
+
+def compile_to_dtb(src: Path, out: Path) -> Path:
+    """
+    Compile a =2Edts source to a =2Edtb under out dir and return the =2Ed=
tb path=2E
+
+    Raises FileNotFoundError if `src` or `out` don't exist=2E
+    """
+    if not src=2Eexists():
+        raise FileNotFoundError(
+            f"Device tree source {str(src)!r} not found"
+        )
+
+    if not out=2Eexists():
+        raise FileNotFoundError(f"Device Tree output dir: {out} doesn't e=
xist")
+
+    dtb =3D out / (src=2Estem + "=2Edtb")
+    _compile_dts(src, dtb)
+    return dtb
+
+
+def write_dts(text: str, name: str, out_dir: Path) -> Path:
+    """Write generated =2Edts text to <out_dir>/<name>=2Edts; return its =
path=2E"""
+    src =3D out_dir / f"{name}=2Edts"
+    src=2Eparent=2Emkdir(parents=3DTrue, exist_ok=3DTrue)
+    src=2Ewrite_text(text)
+    return src
diff --git a/automation/scripts/qtb/riscv/machine=2Epy b/automation/script=
s/qtb/riscv/machine=2Epy
new file mode 100644
index 0000000000=2E=2E9ea44ffc4e
--- /dev/null
+++ b/automation/scripts/qtb/riscv/machine=2Epy
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: GPL-2=2E0-only
+"""QtbMachine for riscv64=2E"""
+
+from __future__ import annotations
+
+from collections=2Eabc import Sequence
+
+from qemu=2Eqtb import QtbMachine
+
+from =2Econfig import MACHINE_INTERRUPT_CONTROLLER, MACHINE_MEMORY, Machi=
neConfig
+
+
+class RiscvTestMachine(QtbMachine):
+    arch_name =3D "riscv64"
+    gdb_arch =3D "riscv:rv64"
+
+    def __init__(
+        self,
+        mc: MachineConfig,
+        *,
+        timeout: int,
+        log_dir: str | None =3D None,
+    ) -> None:
+        self=2Emachine_conf =3D mc
+        super()=2E__init__(
+            memory=3DMACHINE_MEMORY,
+            cpus=3Dmc=2Epcpu,
+            mirror_console=3DFalse,
+            timeout=3Dtimeout,
+            log_dir=3Dlog_dir,
+        )
+
+    def _machine_args(self, memory: int, cpus: int) -> Sequence[str]:
+        machine =3D self=2Emachine_conf
+        machine_opt =3D f"virt,aclint=3Doff,aia=3D{MACHINE_INTERRUPT_CONT=
ROLLER}"
+        # Xen has no sstc support yet=2E
+        cpu_opt =3D "rv64,svpbmt=3Don,smstateen=3Don,sstc=3Doff"
+        return [
+            "-dtb",
+            str(machine=2Edt=2Edtb),
+            "-M",
+            machine_opt,
+            "-cpu",
+            cpu_opt,
+            "-smp",
+            str(cpus),
+            "-m",
+            str(memory),
+            "-bios",
+            str(machine=2Ebinaries=2Efirmware),
+            "-kernel",
+            str(machine=2Ebinaries=2Exen),
+        ]
+
+    def _resolve_binary(self) -> str:
+        return str(self=2Emachine_conf=2Ebinaries=2Eqemu)
diff --git a/automation/scripts/qtb/riscv/paths=2Epy b/automation/scripts/=
qtb/riscv/paths=2Epy
new file mode 100644
index 0000000000=2E=2E94a134530f
--- /dev/null
+++ b/automation/scripts/qtb/riscv/paths=2Epy
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: GPL-2=2E0-only
+"""Path helpers: resolve pkg-relative paths=2E"""
+
+from __future__ import annotations
+
+import os
+import tempfile
+from functools import lru_cache
+from pathlib import Path
+
+# Every relative path in this module is resolved against this base=2E
+_BASE =3D Path(__file__)=2Eresolve()=2Eparent
+
+# Build artifacts (qemu, firmware, xen) base, overridable for CI=2E
+_BINARIES_BASE =3D Path(os=2Eenviron=2Eget("QTB_BINARIES_DIR") or _BASE /=
 "binaries")
+
+
+@lru_cache(maxsize=3D1)
+def _temp_dir_handle() -> tempfile=2ETemporaryDirectory:
+    return tempfile=2ETemporaryDirectory(prefix=3D"qtb-")
+
+
+def temp_dir() -> Path:
+    """Process-wide scratch dir for generated/compiled artifacts (singlet=
on)=2E"""
+    return Path(_temp_dir_handle()=2Ename)
+
+
+def cleanup_temp_dir() -> None:
+    """Remove the scratch dir, if one was created, and clear the cache=2E=
"""
+    if _temp_dir_handle=2Ecache_info()=2Ecurrsize:
+        _temp_dir_handle()=2Ecleanup()
+        _temp_dir_handle=2Ecache_clear()
+
+
+def resolve_path(file_name: str) -> Path:
+    """Resolve `file_name` against _BASE, absolute paths pass through=2E"=
""
+    return _resolve_under(file_name, _BASE)
+
+
+def resolve_binary(file_name: str) -> Path:
+    """Resolve a build artifact against _BINARIES_BASE, absolute paths pa=
ss through=2E"""
+    return _resolve_under(file_name, _BINARIES_BASE)
+
+
+def _resolve_under(file_name: str, base: Path) -> Path:
+    """Resolve `file_name` against `base`, absolute paths pass through=2E=
"""
+    p =3D Path(file_name)
+    path =3D p if p=2Eis_absolute() else base / p
+    if not path=2Eexists():
+        raise FileNotFoundError(f"cannot resolve {str(path)!r}: does not =
exist")
+    return path
diff --git a/automation/scripts/qtb/riscv/qtb_test=2Epy b/automation/scrip=
ts/qtb/riscv/qtb_test=2Epy
new file mode 100644
index 0000000000=2E=2E872fbc2fa9
--- /dev/null
+++ b/automation/scripts/qtb/riscv/qtb_test=2Epy
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: GPL-2=2E0-only
+"""Abstract base for the qtb riscv64 test types=2E
+
+A test type is a RiscvQtbTest subclass owning a config file that describe=
s its
+tests, each bound to a machine from the shared catalog=2E
+"""
+
+from __future__ import annotations
+
+from abc import ABC, abstractmethod
+from typing import ClassVar
+
+from =2Econfig import MachineConfig
+from =2Emachine import RiscvTestMachine
+
+# Default per-test timeout (seconds)
+TIMEOUT_DEFAULT: int =3D 120
+
+
+class RiscvQtbTest(ABC):
+    """One runnable test bound to the machine it boots=2E
+
+    A subclass sets `type_id`, `description`, and `config_file`, and impl=
ements
+    `from_config` to parse its config file, `list_tests` to enumerate the=
 tests
+    it declares, and `run` to drive the test logic=2E
+    """
+
+    # Set by each concrete subclass=2E
+    type_id: ClassVar[str] =3D ""
+    # One-line summary of what the type does, shown in the CLI help=2E
+    description: ClassVar[str] =3D ""
+    # Config file the type reads its tests from, resolved pkg-relative=2E
+    config_file: ClassVar[str] =3D ""
+
+    # Set by the subclass parser=2E
+    name: str
+    data: dict
+    machine: MachineConfig
+    timeout: int =3D TIMEOUT_DEFAULT
+
+    @classmethod
+    @abstractmethod
+    def from_config(cls, config_file: str, test_name: str) -> RiscvQtbTes=
t:
+        """Build the test named `test_name` from `config_file`=2E"""
+
+    @staticmethod
+    @abstractmethod
+    def list_tests(config_file: str) -> list[str]:
+        """Return the names of every test declared in the config file=2E"=
""
+
+    @abstractmethod
+    def run(self, vm: RiscvTestMachine) -> None:
+        """Drive the running machine and assert the expected result=2E"""
diff --git a/automation/scripts/qtb/riscv/xen_dt=2Epy b/automation/scripts=
/qtb/riscv/xen_dt=2Epy
new file mode 100644
index 0000000000=2E=2E8881b01b36
--- /dev/null
+++ b/automation/scripts/qtb/riscv/xen_dt=2Epy
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: GPL-2=2E0-only
+"""Build the Xen host device tree for a MachineConfig=2E
+
+The tree is rendered from its Jinja2 template (dts/qemu-host=2Edts=2Ej2),=
 which
+takes the hart count, the Xen MMU type and the Xen command line, then com=
piled
+to a DTB with dtc=2E
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
+from =2Epaths import resolve_path, temp_dir
+from =2Edt import compile_to_dtb, write_dts
+
+if TYPE_CHECKING:  # config imports this module, so only import it for ty=
ping=2E
+    from =2Econfig import MachineConfig
+
+# Directory holding the Jinja2 platform device tree templates=2E
+_DTS_DIR =3D "dts"
+
+
+@dataclass(frozen=3DTrue)
+class DeviceTree:
+    """Compiled device trees for one machine launch=2E"""
+
+    dts: Path
+    dtb: Path
+
+
+@lru_cache(maxsize=3D1)
+def _env() -> Environment:
+    return Environment(
+        loader=3DFileSystemLoader(resolve_path(_DTS_DIR)),
+        keep_trailing_newline=3DTrue,
+    )
+
+
+def _render_xen_dts(machine: MachineConfig) -> str:
+    """Render the Xen host device tree source text for `machine`=2E"""
+    tmpl =3D _env()=2Eget_template("qemu-host=2Edts=2Ej2")
+    return tmpl=2Erender(
+        ncpus=3Dmachine=2Epcpu,
+        mmu_type=3Dmachine=2Emmu_type,
+        xen_bootargs=3Dmachine=2Exen_bootargs,
+    )
+
+
+def build_xen_device_tree(machine: MachineConfig) -> DeviceTree:
+    """Compile `machine` device tree into the shared scratch dir=2E"""
+    out =3D temp_dir()
+    dts: Path =3D write_dts(_render_xen_dts(machine), machine=2Ename, out=
)
+    dtb: Path =3D compile_to_dtb(dts, out)
+    return DeviceTree(dts=3Ddts, dtb=3Ddtb)


-- 
Baptiste Le Duc | Vates Hypervisor & Kernel Engineer

XCP-ng & Xen Orc=
hestra - Vates solutions

web: https://vates=2Etech
---=Part.204a.3666f13f27356d06.19fec70574c.2d6a0cec16cef1a9=---

