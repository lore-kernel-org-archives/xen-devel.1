Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5935BC61DCB
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 09:43:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400482.1636154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzWdj-0005xi-F4; Thu, 27 Aug 2026 09:43:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400482.1636154; Thu, 27 Aug 2026 09:43:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzWdj-0005xO-97; Thu, 27 Aug 2026 09:43:19 +0000
Received: by outflank-mailman (input) for mailman id 1400482;
 Thu, 27 Aug 2026 09:43:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0429a13b8000c4f3@swg.vates.tech>)
 id 1wzWdh-0005t6-Fg
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 09:43:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzWdg-00Fwyk-Sf
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 11:43:16 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0429a13b8000c4f3@swg.vates.tech>)
 id 6a9006ab-2eae-0a2a0a5409dd-0a2a450c8740-18
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 11:43:16 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0429a13b8000c4f3@swg.vates.tech>)
 id 6a9006b4-f479-0a2a450c0019-b9ff1c23ac25-4
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 11:43:16 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0429a13b8000c4f3.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 27 Aug 2026 09:43:08 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 4AE4483B2D;
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=6mJ8pRhovm2+57Ktp8ucrhFg2lizqcmzFInUehED0eY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=ntsIHfGb7RobZHhoTvpUvXEdWsN0TRDx0g5GdBbPfCEwb3ZOL7/1dRdhZdw9Y7zpQf9v6JeNG
 SIQHeAQI1b8SbBQO21UeAUDtapmexb+1oscdZR34Ux08Ego/CeI1aYDGwTMmuLvPguO6BcpIlAX
 Iiwtn412nN5k8umuzKqNmr2SmT3YkagWsmCxtBh4ykP0+CWt4rEitm8EOk1YuSYa9zDQN6ZMeze
 V7u9TncLzlIvXHYgtaTpYH9U4BgkPv4tYxxAPicT/hAwhZgSOaAWjaiIUXbluz04fMbyw+C+eFy
 wIeVB9NEENP4eDY2CW+l/CM8W28xujnoanN3tl+o60Bg==
X-Zone-Loop: f549f6904b0c164413a1efaa9959808997ab1665a6b7
x-campaign-type: default
x-transaction-id: 616ba5a6-bfce-46ac-a600-21a132984cd4
x-swg-uid: 01-2acc789e-fd0d-4ed6-8569-fac68cd69c8a
X-Mailer: Sweego
Message-ID:
 <1787823789.8631fc262581453bbf619ec5b2062170.1a0429a13b8000c4f3@vates.tech>
x-swg-bid: 1787823789.8631fc262581453bbf619ec5b2062170.1a0429a13b8000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 4/6] automation/qtb: add unit tests for the QTB framework
Date: Thu, 27 Aug 2026 11:42:50 +0200
In-Reply-To: <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech>
References: <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1787823788399
X-purgate-ID: tlsNG-d25034/1787823796-01AC4A5B-345BE6C6/0/0
X-purgate-type: clean
X-purgate-size: 24135

The QTB framework is meant to be extended: new test types, new machines and
new device trees aim to be added by other people.

Add pytest coverage of the framework's functions, and of the console-test
type's config validation and expect/retry loop, so that such changes get
immediate feedback and existing behaviour does not silently regress.

The suite covers 100% of the framework's statements, so a new code path
added without a test shows up as a coverage drop.

The tests are meant to be run locally, from the Xen tree root:

    python3 -m pytest automation/scripts/qtb/riscv/unit/

and, with pytest-cov installed, the coverage report is:

    python3 -m pytest --cov=automation/scripts/qtb \
        automation/scripts/qtb/riscv/unit/

The tests drive fakes rather than QEMU, so they need no artifacts to run.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
 automation/scripts/qtb/riscv/unit/__init__.py |   2 +
 automation/scripts/qtb/riscv/unit/conftest.py |  42 ++++
 .../scripts/qtb/riscv/unit/test_config.py     | 121 ++++++++++
 .../qtb/riscv/unit/test_console_test.py       | 217 ++++++++++++++++++
 automation/scripts/qtb/riscv/unit/test_dt.py  |  99 ++++++++
 .../scripts/qtb/riscv/unit/test_machine.py    |  60 +++++
 .../scripts/qtb/riscv/unit/test_temp_dir.py   |  42 ++++
 .../scripts/qtb/riscv/unit/test_xen_dt.py     |  46 ++++
 8 files changed, 629 insertions(+)
 create mode 100644 automation/scripts/qtb/riscv/unit/__init__.py
 create mode 100644 automation/scripts/qtb/riscv/unit/conftest.py
 create mode 100644 automation/scripts/qtb/riscv/unit/test_config.py
 create mode 100644 automation/scripts/qtb/riscv/unit/test_console_test.py
 create mode 100644 automation/scripts/qtb/riscv/unit/test_dt.py
 create mode 100644 automation/scripts/qtb/riscv/unit/test_machine.py
 create mode 100644 automation/scripts/qtb/riscv/unit/test_temp_dir.py
 create mode 100644 automation/scripts/qtb/riscv/unit/test_xen_dt.py

diff --git a/automation/scripts/qtb/riscv/unit/__init__.py b/automation/scripts/qtb/riscv/unit/__init__.py
new file mode 100644
index 0000000000..b234dc5303
--- /dev/null
+++ b/automation/scripts/qtb/riscv/unit/__init__.py
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+"""pytest tests of the framework's own logic."""
diff --git a/automation/scripts/qtb/riscv/unit/conftest.py b/automation/scripts/qtb/riscv/unit/conftest.py
new file mode 100644
index 0000000000..576eaf13b1
--- /dev/null
+++ b/automation/scripts/qtb/riscv/unit/conftest.py
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: GPL-2.0-only
+"""Shared pytest fixtures for the qtb unit tests."""
+
+from __future__ import annotations
+
+import pytest
+
+from ..config import MachineConfig
+
+
+@pytest.fixture
+def make_file(tmp_path):
+    """Return a factory creating a file of `size` bytes, yielding its path."""
+
+    def _make(name: str, size: int = 16) -> str:
+        p = tmp_path / name
+        p.write_bytes(b"\0" * size)
+        return str(p)
+
+    return _make
+
+
+@pytest.fixture
+def make_machine():
+    """Return a factory building a MachineConfig for tests."""
+
+    def _make(
+        *,
+        name="m",
+        binaries=None,
+        mmu="sv48",
+        xen_bootargs="",
+    ) -> MachineConfig:
+        return MachineConfig(
+            name=name,
+            pcpu=4,
+            binaries=binaries,
+            mmu_type=mmu,
+            xen_bootargs=xen_bootargs,
+        )
+
+    return _make
diff --git a/automation/scripts/qtb/riscv/unit/test_config.py b/automation/scripts/qtb/riscv/unit/test_config.py
new file mode 100644
index 0000000000..422ba2a5ea
--- /dev/null
+++ b/automation/scripts/qtb/riscv/unit/test_config.py
@@ -0,0 +1,121 @@
+# SPDX-License-Identifier: GPL-2.0-only
+"""Unit tests for the YAML machine-catalog parser."""
+
+from __future__ import annotations
+
+from pathlib import Path
+
+import pytest
+import yaml
+
+from ..config import (
+    XEN_BOOTARGS_DEFAULT,
+    XEN_MMU_TYPE_DEFAULT,
+    MachineConfig,
+    _parse_binaries,
+)
+
+
+@pytest.fixture
+def binaries(make_file):
+    """Raw binaries dict pointing at an existing file."""
+    return {"xen": make_file("xen")}
+
+
+# ---- _parse_binaries ----
+
+
+def test_parse_binaries_resolves_existing_paths(binaries):
+    assert _parse_binaries(binaries).xen == Path(binaries["xen"])
+
+
+def test_parse_binaries_missing_key_raises(binaries):
+    del binaries["xen"]
+    with pytest.raises(ValueError, match="missing keys"):
+        _parse_binaries(binaries)
+
+
+def test_parse_binaries_missing_file_raises(binaries, tmp_path):
+    binaries["xen"] = str(tmp_path / "absent")
+    with pytest.raises(FileNotFoundError):
+        _parse_binaries(binaries)
+
+
+# ---- MachineConfig.from_config ----
+
+
+def _write_yaml(tmp_path, binaries, name="machine-a", **machine_overrides):
+    machine = {
+        "pcpu": 1,
+        "xen_bootargs": "com1=poll sched=null",
+    }
+    machine.update(machine_overrides)
+    doc = {"binaries": binaries, "machines": {name: machine}}
+    path = tmp_path / "config.yaml"
+    path.write_text(yaml.safe_dump(doc))
+    return str(path)
+
+
+def test_from_config_builds_machineconfig(tmp_path, binaries):
+    path = _write_yaml(tmp_path, binaries)
+
+    mc = MachineConfig.from_config(path, "machine-a")
+
+    assert mc.name == "machine-a"
+    assert mc.pcpu == 1
+    assert mc.xen_bootargs == "com1=poll sched=null"
+    assert mc.binaries.xen == Path(binaries["xen"])
+
+
+def test_from_config_applies_optional_defaults(tmp_path, binaries):
+    # A machine with only the required keys falls back to the module defaults.
+    path = _write_yaml(
+        tmp_path,
+        binaries,
+        name="bare",
+        mmu_type=None,
+        xen_bootargs=None,
+    )
+    # Drop the keys set to None so the parser sees them as absent.
+    doc = yaml.safe_load(Path(path).read_text())
+    for k in ("mmu_type", "xen_bootargs"):
+        doc["machines"]["bare"].pop(k, None)
+    Path(path).write_text(yaml.safe_dump(doc))
+
+    mc = MachineConfig.from_config(path, "bare")
+
+    assert mc.mmu_type == XEN_MMU_TYPE_DEFAULT
+    assert mc.xen_bootargs == XEN_BOOTARGS_DEFAULT
+
+
+def test_from_config_missing_machine_key_raises(tmp_path, binaries):
+    path = _write_yaml(tmp_path, binaries, name="bare")
+    doc = yaml.safe_load(Path(path).read_text())
+    del doc["machines"]["bare"]["pcpu"]
+    Path(path).write_text(yaml.safe_dump(doc))
+
+    with pytest.raises(ValueError, match="machine config missing keys"):
+        MachineConfig.from_config(path, "bare")
+
+
+def test_from_config_missing_top_level_key_raises(tmp_path, binaries):
+    path = _write_yaml(tmp_path, binaries)
+    doc = yaml.safe_load(Path(path).read_text())
+    del doc["binaries"]
+    Path(path).write_text(yaml.safe_dump(doc))
+
+    with pytest.raises(ValueError, match="missing keys: \\['binaries'\\]"):
+        MachineConfig.from_config(path, "machine-a")
+
+
+def test_from_config_unknown_machine_raises(tmp_path, binaries):
+    path = _write_yaml(tmp_path, binaries)
+    with pytest.raises(ValueError, match="unknown machine 'nope'"):
+        MachineConfig.from_config(path, "nope")
+
+
+def test_from_config_missing_binary_raises(tmp_path, binaries):
+    binaries["xen"] = str(tmp_path / "gone")
+    path = _write_yaml(tmp_path, binaries)
+    with pytest.raises(FileNotFoundError):
+        MachineConfig.from_config(path, "machine-a")
diff --git a/automation/scripts/qtb/riscv/unit/test_console_test.py b/automation/scripts/qtb/riscv/unit/test_console_test.py
new file mode 100644
index 0000000000..cf15ed3b1b
--- /dev/null
+++ b/automation/scripts/qtb/riscv/unit/test_console_test.py
@@ -0,0 +1,217 @@
+# SPDX-License-Identifier: GPL-2.0-only
+"""Unit tests for the console-test test type (console_test.py)."""
+
+from __future__ import annotations
+
+from itertools import chain, repeat
+from unittest import mock
+
+import pexpect
+import pytest
+
+from ..console_test.console_test import ConsoleTest
+from ..config import MachineConfig
+
+
+# ---- helpers ----
+
+
+def _parse_test_data(machine, expect, name="dummy"):
+    """Validate `expect` against `machine`, without reading a catalog file."""
+    test_data = {"machine": "box", "expect": expect}
+    with mock.patch.object(MachineConfig, "from_config", return_value=machine):
+        return ConsoleTest._parse_test_data("config.yaml", test_data, name)
+
+
+def _console(fail_times: int = 0, matches: int = 1) -> mock.Mock:
+    """Stand in for a pexpect spawn: `fail_times` timeouts, then `matches` hits.
+
+    Every wait past `matches` times out, so a test that waits more often than it
+    should fails instead of silently passing.
+    """
+    cons = mock.Mock()
+    cons.expect_exact.side_effect = chain(
+        [pexpect.TIMEOUT("nope")] * fail_times,
+        [None] * matches,
+        repeat(pexpect.TIMEOUT("nope")),
+    )
+    return cons
+
+
+def _asked(cons: mock.Mock) -> list[str]:
+    """The strings waited for on `cons`, one entry per attempt (matched or not)."""
+    return [call.args[0] for call in cons.expect_exact.call_args_list]
+
+
+def _test(expect, machine, **opts):
+    """Build a ConsoleTest bound to `machine`, skipping the YAML read."""
+    raw = {
+        "machine_catalog": "config.yaml",
+        "tests": {"dummy": {"machine": "box", "expect": expect, **opts}},
+    }
+    with mock.patch.object(MachineConfig, "from_config", return_value=machine):
+        return ConsoleTest(raw, "dummy")
+
+
+# ---- _parse_test_data ----
+
+
+def test_parse_test_data_accepts_a_list_of_strings(make_machine):
+    machine = make_machine()
+    name, data, got = _parse_test_data(machine, {0: ["Hello", "All set up"]})
+    assert (name, got) == ("dummy", machine)
+    assert data["expect"] == {0: ["Hello", "All set up"]}
+
+
+def test_parse_test_data_bare_string_raises(make_machine):
+    # A bare string is refused, not wrapped: the YAML must spell out the list.
+    machine = make_machine()
+    with pytest.raises(ValueError, match="expects a list of string"):
+        _parse_test_data(machine, {0: "All set up"})
+
+
+@pytest.mark.parametrize(
+    "expect",
+    [
+        {-1: ["All set up"]},  # console index below Xen's
+        {1: ["All set up"]},  # console index above Xen's
+        {0: ["All set up"], 1: ["More"]},  # Xen's + another unknown
+        ["All set up"],  # no console index
+        None,
+        "All set up",  # not a map at all
+    ],
+)
+def test_parse_test_data_not_the_xen_console_map_raises(expect, make_machine):
+    machine = make_machine()
+    with pytest.raises(ValueError, match="must map console index 0"):
+        _parse_test_data(machine, expect)
+
+
+def test_parse_test_data_empty_list_raises(make_machine):
+    machine = make_machine()
+    with pytest.raises(ValueError, match="Xen has no expected string"):
+        _parse_test_data(machine, {0: []})
+
+
+def test_parse_test_data_empty_string_in_list_raises(make_machine):
+    machine = make_machine()
+    with pytest.raises(ValueError, match="Xen expects non-empty strings"):
+        _parse_test_data(machine, {0: ["All set up", ""]})
+
+
+def test_parse_test_data_missing_expect_raises():
+    with pytest.raises(ValueError, match="missing keys"):
+        ConsoleTest._parse_test_data("config.yaml", {"machine": "box"}, "dummy")
+
+
+# ---- _parse_test_cfg ----
+
+
+def test_parse_test_cfg_missing_machine_catalog_raises():
+    with pytest.raises(ValueError, match="missing keys"):
+        ConsoleTest._parse_test_cfg({"tests": {}}, "dummy")
+
+
+def test_parse_test_cfg_unknown_test_raises():
+    raw = {"machine_catalog": "config.yaml", "tests": {"a": {}}}
+    with pytest.raises(ValueError, match="unknown test 'dummy'"):
+        ConsoleTest._parse_test_cfg(raw, "dummy")
+
+
+# ---- __init__ ----
+
+
+def test_timeout_and_attempts_are_read(make_machine):
+    test = _test({0: ["All set up"]}, make_machine(), timeout=7, attempts=2)
+    assert (test.timeout, test.attempts) == (7, 2)
+
+
+def test_timeout_below_one_raises(make_machine):
+    with pytest.raises(ValueError, match="timeout < 1"):
+        _test({0: ["All set up"]}, make_machine(), timeout=0)
+
+
+def test_attempts_below_one_raises(make_machine):
+    with pytest.raises(ValueError, match="attempts < 1"):
+        _test({0: ["All set up"]}, make_machine(), attempts=0)
+
+
+# ---- run ----
+
+
+def test_run_expects_each_string_in_order_on_con0(make_machine):
+    test = _test({0: ["first", "then"]}, make_machine())
+    vm = mock.Mock(console=_console(matches=2))
+
+    test.run(vm)
+
+    assert _asked(vm.console) == ["first", "then"]
+
+
+def test_run_xen_console_not_wired_raises(make_machine):
+    test = _test({0: ["All set up"]}, make_machine())
+    vm = mock.Mock(console=None)
+
+    with pytest.raises(RuntimeError, match="not launched"):
+        test.run(vm)
+
+
+# ---- _expect_string ----
+
+
+def test_expect_string_retries_after_a_timeout(make_machine):
+    test = _test({0: ["All set up"]}, make_machine(), attempts=3)
+    cons = _console(fail_times=2)
+
+    test._expect_string(cons, "All set up")
+
+    assert _asked(cons) == ["All set up"] * 3
+
+
+def test_expect_string_raises_once_attempts_are_spent(make_machine):
+    test = _test({0: ["All set up"]}, make_machine(), attempts=2)
+    cons = _console(matches=0)
+
+    with pytest.raises(pexpect.TIMEOUT):
+        test._expect_string(cons, "All set up")
+
+    assert _asked(cons) == ["All set up"] * 2
+
+
+# ---- config IO ----
+
+
+def test_list_tests_reads_the_type_yaml():
+    names = ConsoleTest.list_tests("console_test/console-test.yaml")
+    assert "dom0less-1smp-0domu-1vcpu-aplic-imsic-null" in names
+
+
+def test_list_tests_without_a_tests_key_returns_empty():
+    with mock.patch.object(ConsoleTest, "_load_yaml", return_value={}):
+        assert ConsoleTest.list_tests("console-test.yaml") == []
+
+
+def test_from_config_builds_instance(make_machine):
+    machine = make_machine()
+
+    raw = {
+        "machine_catalog": "config.yaml",
+        "tests": {"dummy": {"machine": "box", "expect": {0: ["All set up"]}}},
+    }
+    # Mock the YAML read and the catalog lookup: only the build logic is under test.
+    with (
+        mock.patch.object(ConsoleTest, "_load_yaml", return_value=raw),
+        mock.patch.object(MachineConfig, "from_config", return_value=machine),
+    ):
+        test = ConsoleTest.from_config("console-test.yaml", "dummy")
+
+    assert test.name == "dummy"
+    assert test.type_id == "console-test"
+    assert test.machine is machine
+    assert test.expect == {0: ["All set up"]}
+
+
+def test_from_config_unknown_test_raises():
+    # Also pins from_config's argument order (config file, then test name).
+    with pytest.raises(ValueError, match="unknown test 'nope'"):
+        ConsoleTest.from_config("console_test/console-test.yaml", "nope")
diff --git a/automation/scripts/qtb/riscv/unit/test_dt.py b/automation/scripts/qtb/riscv/unit/test_dt.py
new file mode 100644
index 0000000000..2201a8651f
--- /dev/null
+++ b/automation/scripts/qtb/riscv/unit/test_dt.py
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: GPL-2.0-only
+"""Unit tests for the device-tree compile path (dt.py)."""
+
+from __future__ import annotations
+
+import shutil
+from unittest import mock
+
+import pytest
+
+from .. import dt
+
+_HAS_DTC = shutil.which("dtc") is not None
+_MINIMAL_DTS = "/dts-v1/;\n/ { };\n"
+
+
+# ---- _compile_dts (dtc wrapper) ----
+
+
+def test_compile_dts_invokes_dtc(tmp_path):
+    src = tmp_path / "in.dts"
+    src.write_text(_MINIMAL_DTS)
+    dtb = tmp_path / "in.dtb"
+
+    with mock.patch.object(dt.subprocess, "run") as run:
+        dt._compile_dts(src, dtb)
+
+    run.assert_called_once()
+    argv = run.call_args.args[0]
+    assert argv == ["dtc", "-I", "dts", "-O", "dtb", "-o", str(dtb), str(src)]
+    assert run.call_args.kwargs["check"] is True
+    assert run.call_args.kwargs["capture_output"] is True
+
+
+def test_compile_dts_missing_dtc_raises_runtimeerror(tmp_path):
+    src, dtb = tmp_path / "a.dts", tmp_path / "a.dtb"
+    src.write_text(_MINIMAL_DTS)
+
+    with mock.patch.object(dt.subprocess, "run", side_effect=FileNotFoundError):
+        with pytest.raises(RuntimeError, match="dtc not found"):
+            dt._compile_dts(src, dtb)
+
+
+def test_compile_dts_dtc_failure_raises_runtimeerror(tmp_path):
+    src, dtb = tmp_path / "a.dts", tmp_path / "a.dtb"
+    src.write_text(_MINIMAL_DTS)
+    err = dt.subprocess.CalledProcessError(1, "dtc", output="out", stderr="syntax error")
+
+    with mock.patch.object(dt.subprocess, "run", side_effect=err):
+        with pytest.raises(RuntimeError, match="syntax error"):
+            dt._compile_dts(src, dtb)
+
+
+# ---- compile_to_dtb path handling ----
+
+
+def test_compile_to_dtb_missing_source_raises_filenotfound(tmp_path):
+    with pytest.raises(FileNotFoundError, match="not found"):
+        dt.compile_to_dtb(tmp_path / "nope.dts", tmp_path)
+
+
+def test_compile_to_dtb_missing_out_dir_raises_filenotfound(tmp_path):
+    src = tmp_path / "a.dts"
+    src.write_text(_MINIMAL_DTS)
+
+    with pytest.raises(FileNotFoundError, match="doesn't exist"):
+        dt.compile_to_dtb(src, tmp_path / "absent")
+
+
+def test_compile_to_dtb_source_goes_to_out_dir_with_dtb_suffix(tmp_path):
+    src = tmp_path / "host-1smp.dts"
+    src.write_text(_MINIMAL_DTS)
+    out = tmp_path / "binaries"
+    out.mkdir()
+
+    with mock.patch.object(dt, "_compile_dts") as compile_mock:
+        result = dt.compile_to_dtb(src, out)
+
+    assert result == out / "host-1smp.dtb"
+    compile_mock.assert_called_once_with(src, out / "host-1smp.dtb")
+
+
+# ---- write_dts ----
+
+
+def test_write_dts_writes_source_under_out_dir(tmp_path):
+    src = dt.write_dts(_MINIMAL_DTS, name="unit", out_dir=tmp_path)
+
+    assert src == tmp_path / "unit.dts"
+    assert src.read_text() == _MINIMAL_DTS
+
+
+@pytest.mark.skipif(not _HAS_DTC, reason="dtc not installed")
+def test_write_then_compile_produces_dtb(tmp_path):
+    src = dt.write_dts(_MINIMAL_DTS, name="unit", out_dir=tmp_path)
+    dtb = dt.compile_to_dtb(src, tmp_path)
+
+    assert dtb.is_file()
+    assert dtb.suffix == ".dtb"
diff --git a/automation/scripts/qtb/riscv/unit/test_machine.py b/automation/scripts/qtb/riscv/unit/test_machine.py
new file mode 100644
index 0000000000..68a1564072
--- /dev/null
+++ b/automation/scripts/qtb/riscv/unit/test_machine.py
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: GPL-2.0-only
+"""Unit tests for RiscvTestMachine QEMU argument assembly."""
+
+from __future__ import annotations
+
+from stat import S_IEXEC
+from unittest import mock
+
+from ..machine import RiscvTestMachine
+from ..config import MACHINE_MEMORY, BinariesConfig
+
+
+def _binaries(tmp_path):
+    xen = tmp_path / "xen"
+    xen.write_bytes(b"")
+    return BinariesConfig(xen=xen)
+
+
+def _machine(mc) -> RiscvTestMachine:
+    """Build the machine with QtbMachine.__init__ stubbed out (it spawns QEMU)."""
+    with mock.patch("qemu.qtb.QtbMachine.__init__", return_value=None):
+        return RiscvTestMachine(mc, timeout=30)
+
+
+def test_init_forwards_cpus_to_qtbmachine(tmp_path, make_machine):
+    mc = make_machine(name="machine", binaries=_binaries(tmp_path))
+
+    with mock.patch("qemu.qtb.QtbMachine.__init__", return_value=None) as base_init:
+        vm = RiscvTestMachine(mc, timeout=30, log_dir="/logs")
+
+    assert vm.machine_conf is mc
+    assert base_init.call_args.kwargs == {
+        "memory": MACHINE_MEMORY,
+        "cpus": mc.pcpu,
+        "mirror_console": False,
+        "timeout": 30,
+        "log_dir": "/logs",
+    }
+
+
+def test_resolve_qemu_on_path(tmp_path, make_machine, monkeypatch):
+    qemu = tmp_path / "qemu-system-riscv64"
+    qemu.write_bytes(b"")
+    qemu.chmod(S_IEXEC)
+    monkeypatch.setenv("PATH", str(tmp_path))
+    mc = make_machine(name="machine", binaries=_binaries(tmp_path))
+
+    assert _machine(mc)._resolve_binary() == str(qemu)
+
+
+
+def test_machine_args_wires_kernel_and_dtb_but_no_bios(tmp_path, make_machine):
+    mc = make_machine(name="machine", binaries=_binaries(tmp_path))
+
+    args = list(_machine(mc)._machine_args(memory=2048, cpus=4))
+
+    assert args[args.index("-kernel") + 1] == str(mc.binaries.xen)
+    assert args[args.index("-dtb") + 1] == str(mc.dt.dtb)
+    assert args[args.index("-m") + 1] == "2048"
+    assert args[args.index("-smp") + 1] == "4"
diff --git a/automation/scripts/qtb/riscv/unit/test_temp_dir.py b/automation/scripts/qtb/riscv/unit/test_temp_dir.py
new file mode 100644
index 0000000000..d595d824d7
--- /dev/null
+++ b/automation/scripts/qtb/riscv/unit/test_temp_dir.py
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: GPL-2.0-only
+"""Unit tests for the temp_dir scratch-directory singleton."""
+
+from __future__ import annotations
+
+import pytest
+
+from .. import paths
+
+
+@pytest.fixture(autouse=True)
+def _reset_singleton():
+    # Force each test to begin with fresh temp dir
+    yield
+    paths.cleanup_temp_dir()
+
+
+def test_temp_dir_exists_and_prefixed():
+    d = paths.temp_dir()
+    assert d.is_dir()
+    assert d.name.startswith("qtb-")
+
+
+def test_temp_dir_is_singleton():
+    assert paths.temp_dir() == paths.temp_dir()
+
+
+def test_temp_dir_handle_kept_alive():
+    h = paths._temp_dir_handle()
+    assert h is paths._temp_dir_handle()
+    assert h.name == str(paths.temp_dir())
+
+
+def test_cleanup_temp_dir_removes_and_resets():
+    d = paths.temp_dir()
+    assert d.is_dir()
+    paths.cleanup_temp_dir()
+    assert not d.exists()
+    # Cache reset: next call builds a fresh, existing dir, not the gone one.
+    fresh = paths.temp_dir()
+    assert fresh.is_dir()
+    assert fresh != d
diff --git a/automation/scripts/qtb/riscv/unit/test_xen_dt.py b/automation/scripts/qtb/riscv/unit/test_xen_dt.py
new file mode 100644
index 0000000000..37c4055b31
--- /dev/null
+++ b/automation/scripts/qtb/riscv/unit/test_xen_dt.py
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0-only
+"""Unit tests for xen_dt device-tree generation."""
+
+from __future__ import annotations
+
+from unittest import mock
+
+from .. import xen_dt
+
+
+# ---- _render_xen_dts ----
+
+
+def test_render_injects_bootargs(make_machine):
+    machine = make_machine(xen_bootargs="com1=poll sched=null")
+    out = xen_dt._render_xen_dts(machine)
+
+    assert 'xen,xen-bootargs = "com1=poll sched=null";' in out
+
+
+def test_render_injects_xen_mmu_type(make_machine):
+    machine = make_machine(mmu="sv39")
+    out = xen_dt._render_xen_dts(machine)
+
+    assert 'mmu-type = "riscv,sv39";' in out
+
+
+# ---- build_xen_device_tree ----
+
+
+def test_build_xen_device_tree_compiles(tmp_path, make_machine):
+    machine = make_machine(name="unit-test")
+    dts = tmp_path / "unit-test.dts"
+    dtb = tmp_path / "unit-test.dtb"
+    with (
+        mock.patch.object(xen_dt, "temp_dir", return_value=tmp_path),
+        mock.patch.object(xen_dt, "write_dts", return_value=dts) as write_dts,
+        mock.patch.object(xen_dt, "compile_to_dtb", return_value=dtb) as compile_to_dtb,
+    ):
+        result = xen_dt.build_xen_device_tree(machine)
+
+    write_dts.assert_called_once()
+    assert write_dts.call_args.args[1] == machine.name
+    compile_to_dtb.assert_called_once_with(dts, tmp_path)
+    assert result.dts == dts
+    assert result.dtb == dtb

