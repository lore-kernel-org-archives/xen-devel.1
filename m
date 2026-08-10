Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5EBC5AD55
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 16:10:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387638.1628924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtSa1-0004Jd-8L; Mon, 10 Aug 2026 16:10:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387638.1628924; Mon, 10 Aug 2026 16:10:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtSa1-0004JW-5Z; Mon, 10 Aug 2026 16:10:25 +0000
Received: by outflank-mailman (input) for mailman id 1387638;
 Mon, 10 Aug 2026 16:10:23 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fec705d4f000e099@swg.vates.tech>)
 id 1wtSZz-00043O-34
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 16:10:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtSZy-00Exz0-GH
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 18:10:22 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fec705d4f000e099@swg.vates.tech>)
 id 6a79f79b-e002-0a2a0a5209dd-0a2a45018e00-44
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 18:10:22 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fec705d4f000e099@swg.vates.tech>)
 id 6a79f7e7-5984-0a2a45010019-b9ff1c23956d-5
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 18:10:22 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fec705d4f000e099.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 10 Aug 2026 16:10:14 +0000
Received: from leducb (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 05DC283637;
 Mon, 10 Aug 2026 18:10:14 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=9di4me1yvbuqspU7BIqnNXEvi4rg8NzN9nAZG65MC1c=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=S4iKRsLkA2y1u2Ia4FcWyfUJVnRPLSFSxmsw8CDHpDLBHBlUfrKtd8sSSpprTlK4YF0/jD6Ki
 ccAz9hHgpmjeVe7ImQPNOTq2qH9Pa8F9jWM9aBH9DGLShlqzig9vMB5/BfZQtlxD+9x2o19t+Wi
 FOmXH3+PPEljfBQJhQC1letP/Ce6V22t/XjueAb15pQnwAUt/iZqdNzoZSezQ6yyf60+tl28vro
 UnF//RRdAxCEt47u2jgiTPOQAV2pVjuwNW0HzoSvsy2ZGkdgmVlYaKtyaFqQB4AkWURqaDKaBXv
 ru3sd8M36u/UUxEQlaKIAlwpB5uwiS+iQEx6AA7+ssWQ==
X-Zone-Loop: ab6935da73f37db8225160c8308ea7678a0ff97380b8
x-campaign-type: default
x-transaction-id: 52953e68-b175-457e-a583-68c71d0e9933
x-swg-uid: 01-a6312d36-96ce-43c8-831e-5c6f590a83d4
X-Mailer: Sweego
Message-ID:
 <1786378214.8631fc262581453bbf619ec5b2062170.19fec705d4f000e099@vates.tech>
x-swg-bid: 1786378214.8631fc262581453bbf619ec5b2062170.19fec705d4f000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 5/6] automation/qtb: add QTB framework README
Date: Mon, 10 Aug 2026 18:09:55 +0200
In-Reply-To: <20260810155543.927954-1-baptiste.le-duc@vates.tech>
References: <20260810155543.927954-1-baptiste.le-duc@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.204c.8057a2cfa8722de8.19fec705adb.8862fb7305d5dccf=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1786378214107
X-purgate-ID: tlsNG-d62444/1786378222-1FE68757-1E8E5302/0/0
X-purgate-type: clean
X-purgate-size: 8331

---=Part.204c.8057a2cfa8722de8.19fec705adb.8862fb7305d5dccf=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Document the qtb riscv64 test framework in a README=2E

It covers:
  - the core concepts (machine, test type, test) and how they map to files
  - the source files layout
  - the CLI: `qemu_smoke_riscv64=2Epy <type> <command>`, with "console-tes=
t"
    as the type
  - the config files: the machine catalog and a type's own `<type>=2Eyaml`
  - the Jinja2 device-tree templates under dts/
  - how to add a test (config-only) and how to add a new test type=2E

Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste=2Ele-duc@vates=2Etech>
---
 automation/scripts/qtb/riscv/README=2Emd | 182 +++++++++++++++++++++++++
 1 file changed, 182 insertions(+)
 create mode 100644 automation/scripts/qtb/riscv/README=2Emd

diff --git a/automation/scripts/qtb/riscv/README=2Emd b/automation/scripts=
/qtb/riscv/README=2Emd
new file mode 100644
index 0000000000=2E=2Effcb027bbc
--- /dev/null
+++ b/automation/scripts/qtb/riscv/README=2Emd
@@ -0,0 +1,182 @@
+qtb riscv64 test framework
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+
+A small framework that boots Xen under QEMU on riscv64 and drives it to a
+pass/fail verdict automatically from its console output=2E
+
+It is built on QEMU's qtb (QEMU Test Bench) Python package, which gives
+programmatic control of a QEMU process over QMP and qtest, plus access to=
 the
+consoles=2E
+
+What it does
+------------
+
+1=2E Reads a machine description (what to boot: cpus, Xen command line) a=
nd a
+   test description (what to assert)=2E
+2=2E Generates the host device tree=2E
+3=2E Launches QEMU with Xen and the firmware wired in=2E
+4=2E Reads the console and checks what Xen printed=2E
+
+Core concepts
+-------------
+
+- Machine: test-agnostic description of what to boot=2E Reusable across t=
est
+  types=2E `config=2Eyaml` -> `MachineConfig`=2E
+- Test type: a `RiscvQtbTest` subclass implementing the logic of a kind o=
f test
+  (e=2Eg=2E `console-test`)=2E Identified by `type_id`=2E See `console_te=
st/`=2E
+- Test: one named, runnable instance of a type: a machine plus the type's
+  parameters=2E Lives in the type's `<type>=2Eyaml`=2E
+
+A test type owns a config file describing its tests, each test names a ma=
chine
+from the shared catalog (`config=2Eyaml`) and layers its own parameters o=
n top=2E
+
+Layout
+------
+
+```
+qemu_smoke_riscv64=2Epy        CLI entry point (<type> run | list)
+
+qtb/riscv/                   This framework
+  __init__=2Epy                Public API
+  qtb_test=2Epy                RiscvQtbTest ABC every test type derives f=
rom
+  config=2Epy                  Machine catalog parser -> MachineConfig
+  xen_dt=2Epy                  Generates the host device tree from its Ji=
nja2 template
+  dt=2Epy                      Compile =2Edts -> =2Edtb with dtc
+  paths=2Epy                   Path resolution (pkg-relative)
+  machine=2Epy                 RiscvTestMachine: assembles the QEMU comma=
nd line
+
+  config=2Eyaml                The machine catalog (shared across test ty=
pes)
+  dts/                       Jinja2 device-tree templates (host, common)
+
+  console_test/              The console-test type
+    __init__=2Epy
+    console_test=2Epy          ConsoleTest implementation
+    console-test=2Eyaml        Its tests
+
+  unit/                      pytest unit tests of the framework logic its=
elf
+```
+
+How a type is selected
+----------------------
+
+The test type is the first positional argument (`qemu_smoke_riscv64=2Epy =
console-test run
+=2E=2E=2E`)=2E The CLI builds one subcommand per entry of `TEST_TYPES` (`=
__init__=2Epy`),
+named after the type's `type_id`=2E
+
+Each type declares the `config_file` it reads its tests from=2E
+
+Prerequisites
+-------------
+
+- `qemu=2Eqtb`, QEMU's Python package (`python/` in the QEMU tree)
+- `jinja2`, `pyyaml`, `pexpect`
+- `dtc` (device-tree-compiler)
+- the binaries a machine boots: `qemu-system-riscv64`, the firmware
+  (OpenSBI) and `xen`
+
+CLI usage
+---------
+
+Run from `automation/scripts/`, or give the full path from the Xen tree r=
oot
+(`=2E/automation/scripts/qemu_smoke_riscv64=2Epy =2E=2E=2E`), which is wh=
at CI does=2E
+
+```
+# List every test the type defines in its config:
+=2E/qemu_smoke_riscv64=2Epy console-test list
+
+# Run one test (drives it to PASS/FAIL, exit 0/1):
+=2E/qemu_smoke_riscv64=2Epy console-test run dom0less-1smp-0domu-1vcpu-ap=
lic-imsic-null \
+    --log-dir qtb-logs
+```
+
+`--log-dir` (run only) collects the QEMU process log, the qtest log, and =
each
+console as `con<N>=2Elog`: `con0=2Elog` is Xen's own console, the only on=
e wired
+up today=2E Omit it to write no logs=2E `-v/--verbose` raises the
+log level to debug=2E
+
+Config files
+------------
+
+`config=2Eyaml` is the machine catalog=2E `binaries:` are build artifacts=
 resolved
+under `binaries/` (overridable with `$QTB_BINARIES_DIR`); absolute paths =
pass
+through=2E
+
+Machine entries omit any optional field left at its default=2E
+Here are the parameters:
+
+- `pcpu` (required): host physical cpus=2E
+- `mmu_type` (default `sv48`): Xen host MMU type=2E
+- `xen_bootargs` (default `""`): Xen command line=2E
+
+`<type>=2Eyaml` describes the tests of that type=2E
+
+`console-test`
+--------------
+
+A test names a machine and maps a console index to the string(s) expected=
 on
+that console: index 0 is Xen's own console (`con0`, logged as `con0=2Elog=
`)=2E
+
+```
+machine_catalog: config=2Eyaml    # the catalog to resolve machine names =
against
+tests:
+  dom0less-1smp-0domu-1vcpu-aplic-imsic-null:
+    machine: dom0less-1smp-0domu-1vcpu-aplic-imsic-null   # a name in con=
fig=2Eyaml
+    expect:
+      0: [All set up]           # Xen itself must print "All set up"
+```
+
+Logic, per console:
+
+1=2E read the console
+2=2E wait for each expected string in turn, in the order listed
+3=2E bound each wait by `timeout` seconds, retrying a timed-out wait up t=
o
+   `attempts` times
+
+The map itself must not be empty, otherwise the test would pass without
+asserting anything=2E
+
+Device trees (dts/)
+-------------------
+
+Jinja2 template, generated per machine and compiled with dtc:
+
+- `qemu-host=2Edts=2Ej2` - the Xen host tree: the hart count, the host MM=
U type and
+  the Xen command line=2E
+
+Adding a test
+-------------
+
+To add a test to an existing type (e=2Eg=2E `console-test`):
+
+1=2E Pick a machine from `config=2Eyaml`, or add a new one under `machine=
s:` (set
+   `pcpu`, and any optional field that differs from its default =E2=80=94=
 see the
+   field list above)=2E
+2=2E Add a test entry under `tests:` in the type's `<type>=2Eyaml`, namin=
g that
+   machine and supplying the type's own parameters (for `console-test`, o=
ne
+   `expect` list per console)=2E
+3=2E Run it: `=2E/qemu_smoke_riscv64=2Epy console-test run <your-test-nam=
e>`=2E
+
+No code change is needed, a test is pure config=2E
+
+Adding a new test type
+----------------------
+
+1=2E Create `mytype/` with `mytype=2Epy` defining a `RiscvQtbTest` subcla=
ss: set
+   `type_id`, `description`, and `config_file`, and implement `from_confi=
g`,
+   `list_tests`, and `run(vm)`=2E
+2=2E Add `mytype/__init__=2Epy` that does `from =2Emytype import MyType`=
=2E
+3=2E Add `MyType` to `TEST_TYPES` in `__init__=2Epy` so the CLI exposes i=
t=2E
+
+Unit tests
+----------
+
+The `unit/` directory holds pytest tests of the framework's own logic (co=
nfig
+parsing, device-tree rendering, QEMU arg assembly)=2E They do not boot QE=
MU and
+are independent of the CI smoke tests, but they import the framework, so =
they
+need the prerequisites above plus `pytest`=2E
+
+Run from the Xen tree root:
+
+```
+python3 -m pytest automation/scripts/qtb/riscv/unit/
+```


-- 
Baptiste Le Duc | Vates Hypervisor & Kernel Engineer

XCP-ng & Xen Orc=
hestra - Vates solutions

web: https://vates=2Etech
---=Part.204c.8057a2cfa8722de8.19fec705adb.8862fb7305d5dccf=---

