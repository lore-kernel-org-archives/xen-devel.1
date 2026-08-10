Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFA3C5AD55
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 16:10:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387637.1628915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtSZz-00043g-35; Mon, 10 Aug 2026 16:10:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387637.1628915; Mon, 10 Aug 2026 16:10:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtSZy-00043Z-Vt; Mon, 10 Aug 2026 16:10:22 +0000
Received: by outflank-mailman (input) for mailman id 1387637;
 Mon, 10 Aug 2026 16:10:21 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fec705b96000e099@swg.vates.tech>)
 id 1wtSZx-0003e4-0E
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 16:10:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtSZw-00Exz0-D2
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 18:10:20 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fec705b96000e099@swg.vates.tech>)
 id 6a79f79b-e002-0a2a0a5209dd-0a2a45018e00-40
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 18:10:20 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fec705b96000e099@swg.vates.tech>)
 id 6a79f7e7-5984-0a2a45010019-b9ff1c23956d-4
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 18:10:20 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fec705b96000e099.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 10 Aug 2026 16:10:14 +0000
Received: from leducb (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 8BD63836CA;
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
 q=dns/txt; s=selector1; bh=2bfsoiEs2rAdY4I4Kp7G6nvU3IQk8zu75BYtS3wxPMU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=fAyLc397XD5acd0FvQWQnTjkI0Fj/7gzULhacda+HOeTumzNfTtCYDw7+LWdUiS8dmUbeMVE0
 tJnuF5ie+W7b6jV4Sv+IcUxjgt8DMILEdt2TGPrgt7n8E1ztI/dJ+qUH/V2M7NmWADg4zvtBL9N
 SvYMyV152VL9SAzyv07Ipb65t8l1P8ziNnTE+3gTm29khg4LZrr/RMtuLmxfFdmDwPE0oqbfOl2
 ow0L46E2Qpzu1tTtkWinWoCKYleB/RggdaEVQbwx59zsrueWdcNCwFSx8bLBjbaAtmpKFDklDCQ
 0lN8ESxIq4VvuCUyJVx76wSMZD+plIp0PZ3JJoe9HFXQ==
X-Zone-Loop: fe2e1731f33cf08b1ea41793c6cbaffb04564bcafc2b
x-campaign-type: default
x-transaction-id: 074ba940-8969-42e1-b2e3-2204decf4e2a
x-swg-uid: 01-3cd3a695-e1d4-474c-8385-3d852215669b
X-Mailer: Sweego
Message-ID:
 <1786378214.8631fc262581453bbf619ec5b2062170.19fec705b96000e099@vates.tech>
x-swg-bid: 1786378214.8631fc262581453bbf619ec5b2062170.19fec705b96000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 4/6] automation/qtb: add unit tests for the QTB framework
Date: Mon, 10 Aug 2026 18:09:54 +0200
In-Reply-To: <20260810155543.927954-1-baptiste.le-duc@vates.tech>
References: <20260810155543.927954-1-baptiste.le-duc@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.204b.877beba074a48ee1.19fec70591b.fc1f12a78ffda386=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1786378213659
X-purgate-ID: tlsNG-d62444/1786378220-BDC79757-45D141D2/0/0
X-purgate-type: clean
X-purgate-size: 26123

---=Part.204b.877beba074a48ee1.19fec70591b.fc1f12a78ffda386=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The QTB framework is meant to be extended: new test types, new machines and
new device trees aim to be added by other people=2E

Add pytest coverage of the framework's functions, and of the console-test
type's config validation and expect/retry loop, so that such changes get
immediate feedback and existing behaviour does not silently regress=2E

The suite covers 100% of the framework's statements, so a new code path
added without a test shows up as a coverage drop=2E

The tests are meant to be run locally, from the Xen tree root:

    python3 -m pytest automation/scripts/qtb/riscv/unit/

and, with pytest-cov installed, the coverage report is:

    python3 -m pytest --cov=3Dautomation/scripts/qtb \
        automation/scripts/qtb/riscv/unit/

The tests drive fakes rather than QEMU, so they need no artifacts to run=
=2E

Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste=2Ele-duc@vates=2Etech>
---
 automation/scripts/qtb/riscv/unit/__init__=2Epy |   2 +
 automation/scripts/qtb/riscv/unit/conftest=2Epy |  42 ++++
 =2E=2E=2E/scripts/qtb/riscv/unit/test_config=2Epy     | 128 +++++++++++
 =2E=2E=2E/qtb/riscv/unit/test_console_test=2Epy       | 217 +++++++++++++=
+++++
 automation/scripts/qtb/riscv/unit/test_dt=2Epy  |  99 ++++++++
 =2E=2E=2E/scripts/qtb/riscv/unit/test_machine=2Epy    |  58 +++++
 =2E=2E=2E/scripts/qtb/riscv/unit/test_temp_dir=2Epy   |  42 ++++
 =2E=2E=2E/scripts/qtb/riscv/unit/test_xen_dt=2Epy     |  46 ++++
 8 files changed, 634 insertions(+)
 create mode 100644 automation/scripts/qtb/riscv/unit/__init__=2Epy
 create mode 100644 automation/scripts/qtb/riscv/unit/conftest=2Epy
 create mode 100644 automation/scripts/qtb/riscv/unit/test_config=2Epy
 create mode 100644 automation/scripts/qtb/riscv/unit/test_console_test=2E=
py
 create mode 100644 automation/scripts/qtb/riscv/unit/test_dt=2Epy
 create mode 100644 automation/scripts/qtb/riscv/unit/test_machine=2Epy
 create mode 100644 automation/scripts/qtb/riscv/unit/test_temp_dir=2Epy
 create mode 100644 automation/scripts/qtb/riscv/unit/test_xen_dt=2Epy

diff --git a/automation/scripts/qtb/riscv/unit/__init__=2Epy b/automation/=
scripts/qtb/riscv/unit/__init__=2Epy
new file mode 100644
index 0000000000=2E=2Eb234dc5303
--- /dev/null
+++ b/automation/scripts/qtb/riscv/unit/__init__=2Epy
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2=2E0-only
+"""pytest tests of the framework's own logic=2E"""
diff --git a/automation/scripts/qtb/riscv/unit/conftest=2Epy b/automation/=
scripts/qtb/riscv/unit/conftest=2Epy
new file mode 100644
index 0000000000=2E=2E576eaf13b1
--- /dev/null
+++ b/automation/scripts/qtb/riscv/unit/conftest=2Epy
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: GPL-2=2E0-only
+"""Shared pytest fixtures for the qtb unit tests=2E"""
+
+from __future__ import annotations
+
+import pytest
+
+from =2E=2Econfig import MachineConfig
+
+
+@pytest=2Efixture
+def make_file(tmp_path):
+    """Return a factory creating a file of `size` bytes, yielding its pat=
h=2E"""
+
+    def _make(name: str, size: int =3D 16) -> str:
+        p =3D tmp_path / name
+        p=2Ewrite_bytes(b"\0" * size)
+        return str(p)
+
+    return _make
+
+
+@pytest=2Efixture
+def make_machine():
+    """Return a factory building a MachineConfig for tests=2E"""
+
+    def _make(
+        *,
+        name=3D"m",
+        binaries=3DNone,
+        mmu=3D"sv48",
+        xen_bootargs=3D"",
+    ) -> MachineConfig:
+        return MachineConfig(
+            name=3Dname,
+            pcpu=3D4,
+            binaries=3Dbinaries,
+            mmu_type=3Dmmu,
+            xen_bootargs=3Dxen_bootargs,
+        )
+
+    return _make
diff --git a/automation/scripts/qtb/riscv/unit/test_config=2Epy b/automati=
on/scripts/qtb/riscv/unit/test_config=2Epy
new file mode 100644
index 0000000000=2E=2E790328a13f
--- /dev/null
+++ b/automation/scripts/qtb/riscv/unit/test_config=2Epy
@@ -0,0 +1,128 @@
+# SPDX-License-Identifier: GPL-2=2E0-only
+"""Unit tests for the YAML machine-catalog parser=2E"""
+
+from __future__ import annotations
+
+from pathlib import Path
+
+import pytest
+import yaml
+
+from =2E=2Econfig import (
+    XEN_BOOTARGS_DEFAULT,
+    XEN_MMU_TYPE_DEFAULT,
+    MachineConfig,
+    _parse_binaries,
+)
+
+
+@pytest=2Efixture
+def binaries(make_file):
+    """Raw binaries dict pointing at three existing files=2E"""
+    return {
+        "qemu": make_file("qemu-system-riscv64"),
+        "firmware": make_file("fw=2Ebin"),
+        "xen": make_file("xen"),
+    }
+
+
+# ---- _parse_binaries ----
+
+
+def test_parse_binaries_resolves_existing_paths(binaries):
+    cfg =3D _parse_binaries(binaries)
+    assert cfg=2Eqemu =3D=3D Path(binaries["qemu"])
+    assert cfg=2Efirmware =3D=3D Path(binaries["firmware"])
+    assert cfg=2Exen =3D=3D Path(binaries["xen"])
+
+
+def test_parse_binaries_missing_key_raises(binaries):
+    del binaries["xen"]
+    with pytest=2Eraises(ValueError, match=3D"missing keys"):
+        _parse_binaries(binaries)
+
+
+def test_parse_binaries_missing_file_raises(binaries, tmp_path):
+    binaries["xen"] =3D str(tmp_path / "absent")
+    with pytest=2Eraises(FileNotFoundError):
+        _parse_binaries(binaries)
+
+
+# ---- MachineConfig=2Efrom_config ----
+
+
+def _write_yaml(tmp_path, binaries, name=3D"machine-a", **machine_overrid=
es):
+    machine =3D {
+        "pcpu": 1,
+        "xen_bootargs": "com1=3Dpoll sched=3Dnull",
+    }
+    machine=2Eupdate(machine_overrides)
+    doc =3D {"binaries": binaries, "machines": {name: machine}}
+    path =3D tmp_path / "config=2Eyaml"
+    path=2Ewrite_text(yaml=2Esafe_dump(doc))
+    return str(path)
+
+
+def test_from_config_builds_machineconfig(tmp_path, binaries):
+    path =3D _write_yaml(tmp_path, binaries)
+
+    mc =3D MachineConfig=2Efrom_config(path, "machine-a")
+
+    assert mc=2Ename =3D=3D "machine-a"
+    assert mc=2Epcpu =3D=3D 1
+    assert mc=2Exen_bootargs =3D=3D "com1=3Dpoll sched=3Dnull"
+    assert mc=2Ebinaries=2Eqemu =3D=3D Path(binaries["qemu"])
+
+
+def test_from_config_applies_optional_defaults(tmp_path, binaries):
+    # A machine with only the required keys falls back to the module defa=
ults=2E
+    path =3D _write_yaml(
+        tmp_path,
+        binaries,
+        name=3D"bare",
+        mmu_type=3DNone,
+        xen_bootargs=3DNone,
+    )
+    # Drop the keys set to None so the parser sees them as absent=2E
+    doc =3D yaml=2Esafe_load(Path(path)=2Eread_text())
+    for k in ("mmu_type", "xen_bootargs"):
+        doc["machines"]["bare"]=2Epop(k, None)
+    Path(path)=2Ewrite_text(yaml=2Esafe_dump(doc))
+
+    mc =3D MachineConfig=2Efrom_config(path, "bare")
+
+    assert mc=2Emmu_type =3D=3D XEN_MMU_TYPE_DEFAULT
+    assert mc=2Exen_bootargs =3D=3D XEN_BOOTARGS_DEFAULT
+
+
+def test_from_config_missing_machine_key_raises(tmp_path, binaries):
+    path =3D _write_yaml(tmp_path, binaries, name=3D"bare")
+    doc =3D yaml=2Esafe_load(Path(path)=2Eread_text())
+    del doc["machines"]["bare"]["pcpu"]
+    Path(path)=2Ewrite_text(yaml=2Esafe_dump(doc))
+
+    with pytest=2Eraises(ValueError, match=3D"machine config missing keys=
"):
+        MachineConfig=2Efrom_config(path, "bare")
+
+
+def test_from_config_missing_top_level_key_raises(tmp_path, binaries):
+    path =3D _write_yaml(tmp_path, binaries)
+    doc =3D yaml=2Esafe_load(Path(path)=2Eread_text())
+    del doc["binaries"]
+    Path(path)=2Ewrite_text(yaml=2Esafe_dump(doc))
+
+    with pytest=2Eraises(ValueError, match=3D"missing keys: \\['binaries'=
\\]"):
+        MachineConfig=2Efrom_config(path, "machine-a")
+
+
+def test_from_config_unknown_machine_raises(tmp_path, binaries):
+    path =3D _write_yaml(tmp_path, binaries)
+    with pytest=2Eraises(ValueError, match=3D"unknown machine 'nope'"):
+        MachineConfig=2Efrom_config(path, "nope")
+
+
+def test_from_config_missing_binary_raises(tmp_path, binaries):
+    binaries["qemu"] =3D str(tmp_path / "gone")
+    path =3D _write_yaml(tmp_path, binaries)
+    with pytest=2Eraises(FileNotFoundError):
+        MachineConfig=2Efrom_config(path, "machine-a")
diff --git a/automation/scripts/qtb/riscv/unit/test_console_test=2Epy b/au=
tomation/scripts/qtb/riscv/unit/test_console_test=2Epy
new file mode 100644
index 0000000000=2E=2Ecf15ed3b1b
--- /dev/null
+++ b/automation/scripts/qtb/riscv/unit/test_console_test=2Epy
@@ -0,0 +1,217 @@
+# SPDX-License-Identifier: GPL-2=2E0-only
+"""Unit tests for the console-test test type (console_test=2Epy)=2E"""
+
+from __future__ import annotations
+
+from itertools import chain, repeat
+from unittest import mock
+
+import pexpect
+import pytest
+
+from =2E=2Econsole_test=2Econsole_test import ConsoleTest
+from =2E=2Econfig import MachineConfig
+
+
+# ---- helpers ----
+
+
+def _parse_test_data(machine, expect, name=3D"dummy"):
+    """Validate `expect` against `machine`, without reading a catalog fil=
e=2E"""
+    test_data =3D {"machine": "box", "expect": expect}
+    with mock=2Epatch=2Eobject(MachineConfig, "from_config", return_value=
=3Dmachine):
+        return ConsoleTest=2E_parse_test_data("config=2Eyaml", test_data,=
 name)
+
+
+def _console(fail_times: int =3D 0, matches: int =3D 1) -> mock=2EMock:
+    """Stand in for a pexpect spawn: `fail_times` timeouts, then `matches=
` hits=2E
+
+    Every wait past `matches` times out, so a test that waits more often =
than it
+    should fails instead of silently passing=2E
+    """
+    cons =3D mock=2EMock()
+    cons=2Eexpect_exact=2Eside_effect =3D chain(
+        [pexpect=2ETIMEOUT("nope")] * fail_times,
+        [None] * matches,
+        repeat(pexpect=2ETIMEOUT("nope")),
+    )
+    return cons
+
+
+def _asked(cons: mock=2EMock) -> list[str]:
+    """The strings waited for on `cons`, one entry per attempt (matched o=
r not)=2E"""
+    return [call=2Eargs[0] for call in cons=2Eexpect_exact=2Ecall_args_li=
st]
+
+
+def _test(expect, machine, **opts):
+    """Build a ConsoleTest bound to `machine`, skipping the YAML read=2E"=
""
+    raw =3D {
+        "machine_catalog": "config=2Eyaml",
+        "tests": {"dummy": {"machine": "box", "expect": expect, **opts}},
+    }
+    with mock=2Epatch=2Eobject(MachineConfig, "from_config", return_value=
=3Dmachine):
+        return ConsoleTest(raw, "dummy")
+
+
+# ---- _parse_test_data ----
+
+
+def test_parse_test_data_accepts_a_list_of_strings(make_machine):
+    machine =3D make_machine()
+    name, data, got =3D _parse_test_data(machine, {0: ["Hello", "All set =
up"]})
+    assert (name, got) =3D=3D ("dummy", machine)
+    assert data["expect"] =3D=3D {0: ["Hello", "All set up"]}
+
+
+def test_parse_test_data_bare_string_raises(make_machine):
+    # A bare string is refused, not wrapped: the YAML must spell out the =
list=2E
+    machine =3D make_machine()
+    with pytest=2Eraises(ValueError, match=3D"expects a list of string"):
+        _parse_test_data(machine, {0: "All set up"})
+
+
+@pytest=2Emark=2Eparametrize(
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
+def test_parse_test_data_not_the_xen_console_map_raises(expect, make_mach=
ine):
+    machine =3D make_machine()
+    with pytest=2Eraises(ValueError, match=3D"must map console index 0"):
+        _parse_test_data(machine, expect)
+
+
+def test_parse_test_data_empty_list_raises(make_machine):
+    machine =3D make_machine()
+    with pytest=2Eraises(ValueError, match=3D"Xen has no expected string"=
):
+        _parse_test_data(machine, {0: []})
+
+
+def test_parse_test_data_empty_string_in_list_raises(make_machine):
+    machine =3D make_machine()
+    with pytest=2Eraises(ValueError, match=3D"Xen expects non-empty strin=
gs"):
+        _parse_test_data(machine, {0: ["All set up", ""]})
+
+
+def test_parse_test_data_missing_expect_raises():
+    with pytest=2Eraises(ValueError, match=3D"missing keys"):
+        ConsoleTest=2E_parse_test_data("config=2Eyaml", {"machine": "box"=
}, "dummy")
+
+
+# ---- _parse_test_cfg ----
+
+
+def test_parse_test_cfg_missing_machine_catalog_raises():
+    with pytest=2Eraises(ValueError, match=3D"missing keys"):
+        ConsoleTest=2E_parse_test_cfg({"tests": {}}, "dummy")
+
+
+def test_parse_test_cfg_unknown_test_raises():
+    raw =3D {"machine_catalog": "config=2Eyaml", "tests": {"a": {}}}
+    with pytest=2Eraises(ValueError, match=3D"unknown test 'dummy'"):
+        ConsoleTest=2E_parse_test_cfg(raw, "dummy")
+
+
+# ---- __init__ ----
+
+
+def test_timeout_and_attempts_are_read(make_machine):
+    test =3D _test({0: ["All set up"]}, make_machine(), timeout=3D7, atte=
mpts=3D2)
+    assert (test=2Etimeout, test=2Eattempts) =3D=3D (7, 2)
+
+
+def test_timeout_below_one_raises(make_machine):
+    with pytest=2Eraises(ValueError, match=3D"timeout < 1"):
+        _test({0: ["All set up"]}, make_machine(), timeout=3D0)
+
+
+def test_attempts_below_one_raises(make_machine):
+    with pytest=2Eraises(ValueError, match=3D"attempts < 1"):
+        _test({0: ["All set up"]}, make_machine(), attempts=3D0)
+
+
+# ---- run ----
+
+
+def test_run_expects_each_string_in_order_on_con0(make_machine):
+    test =3D _test({0: ["first", "then"]}, make_machine())
+    vm =3D mock=2EMock(console=3D_console(matches=3D2))
+
+    test=2Erun(vm)
+
+    assert _asked(vm=2Econsole) =3D=3D ["first", "then"]
+
+
+def test_run_xen_console_not_wired_raises(make_machine):
+    test =3D _test({0: ["All set up"]}, make_machine())
+    vm =3D mock=2EMock(console=3DNone)
+
+    with pytest=2Eraises(RuntimeError, match=3D"not launched"):
+        test=2Erun(vm)
+
+
+# ---- _expect_string ----
+
+
+def test_expect_string_retries_after_a_timeout(make_machine):
+    test =3D _test({0: ["All set up"]}, make_machine(), attempts=3D3)
+    cons =3D _console(fail_times=3D2)
+
+    test=2E_expect_string(cons, "All set up")
+
+    assert _asked(cons) =3D=3D ["All set up"] * 3
+
+
+def test_expect_string_raises_once_attempts_are_spent(make_machine):
+    test =3D _test({0: ["All set up"]}, make_machine(), attempts=3D2)
+    cons =3D _console(matches=3D0)
+
+    with pytest=2Eraises(pexpect=2ETIMEOUT):
+        test=2E_expect_string(cons, "All set up")
+
+    assert _asked(cons) =3D=3D ["All set up"] * 2
+
+
+# ---- config IO ----
+
+
+def test_list_tests_reads_the_type_yaml():
+    names =3D ConsoleTest=2Elist_tests("console_test/console-test=2Eyaml"=
)
+    assert "dom0less-1smp-0domu-1vcpu-aplic-imsic-null" in names
+
+
+def test_list_tests_without_a_tests_key_returns_empty():
+    with mock=2Epatch=2Eobject(ConsoleTest, "_load_yaml", return_value=3D=
{}):
+        assert ConsoleTest=2Elist_tests("console-test=2Eyaml") =3D=3D []
+
+
+def test_from_config_builds_instance(make_machine):
+    machine =3D make_machine()
+
+    raw =3D {
+        "machine_catalog": "config=2Eyaml",
+        "tests": {"dummy": {"machine": "box", "expect": {0: ["All set up"=
]}}},
+    }
+    # Mock the YAML read and the catalog lookup: only the build logic is =
under test=2E
+    with (
+        mock=2Epatch=2Eobject(ConsoleTest, "_load_yaml", return_value=3Dr=
aw),
+        mock=2Epatch=2Eobject(MachineConfig, "from_config", return_value=
=3Dmachine),
+    ):
+        test =3D ConsoleTest=2Efrom_config("console-test=2Eyaml", "dummy"=
)
+
+    assert test=2Ename =3D=3D "dummy"
+    assert test=2Etype_id =3D=3D "console-test"
+    assert test=2Emachine is machine
+    assert test=2Eexpect =3D=3D {0: ["All set up"]}
+
+
+def test_from_config_unknown_test_raises():
+    # Also pins from_config's argument order (config file, then test name=
)=2E
+    with pytest=2Eraises(ValueError, match=3D"unknown test 'nope'"):
+        ConsoleTest=2Efrom_config("console_test/console-test=2Eyaml", "no=
pe")
diff --git a/automation/scripts/qtb/riscv/unit/test_dt=2Epy b/automation/s=
cripts/qtb/riscv/unit/test_dt=2Epy
new file mode 100644
index 0000000000=2E=2E2201a8651f
--- /dev/null
+++ b/automation/scripts/qtb/riscv/unit/test_dt=2Epy
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: GPL-2=2E0-only
+"""Unit tests for the device-tree compile path (dt=2Epy)=2E"""
+
+from __future__ import annotations
+
+import shutil
+from unittest import mock
+
+import pytest
+
+from =2E=2E import dt
+
+_HAS_DTC =3D shutil=2Ewhich("dtc") is not None
+_MINIMAL_DTS =3D "/dts-v1/;\n/ { };\n"
+
+
+# ---- _compile_dts (dtc wrapper) ----
+
+
+def test_compile_dts_invokes_dtc(tmp_path):
+    src =3D tmp_path / "in=2Edts"
+    src=2Ewrite_text(_MINIMAL_DTS)
+    dtb =3D tmp_path / "in=2Edtb"
+
+    with mock=2Epatch=2Eobject(dt=2Esubprocess, "run") as run:
+        dt=2E_compile_dts(src, dtb)
+
+    run=2Eassert_called_once()
+    argv =3D run=2Ecall_args=2Eargs[0]
+    assert argv =3D=3D ["dtc", "-I", "dts", "-O", "dtb", "-o", str(dtb), =
str(src)]
+    assert run=2Ecall_args=2Ekwargs["check"] is True
+    assert run=2Ecall_args=2Ekwargs["capture_output"] is True
+
+
+def test_compile_dts_missing_dtc_raises_runtimeerror(tmp_path):
+    src, dtb =3D tmp_path / "a=2Edts", tmp_path / "a=2Edtb"
+    src=2Ewrite_text(_MINIMAL_DTS)
+
+    with mock=2Epatch=2Eobject(dt=2Esubprocess, "run", side_effect=3DFile=
NotFoundError):
+        with pytest=2Eraises(RuntimeError, match=3D"dtc not found"):
+            dt=2E_compile_dts(src, dtb)
+
+
+def test_compile_dts_dtc_failure_raises_runtimeerror(tmp_path):
+    src, dtb =3D tmp_path / "a=2Edts", tmp_path / "a=2Edtb"
+    src=2Ewrite_text(_MINIMAL_DTS)
+    err =3D dt=2Esubprocess=2ECalledProcessError(1, "dtc", output=3D"out"=
, stderr=3D"syntax error")
+
+    with mock=2Epatch=2Eobject(dt=2Esubprocess, "run", side_effect=3Derr)=
:
+        with pytest=2Eraises(RuntimeError, match=3D"syntax error"):
+            dt=2E_compile_dts(src, dtb)
+
+
+# ---- compile_to_dtb path handling ----
+
+
+def test_compile_to_dtb_missing_source_raises_filenotfound(tmp_path):
+    with pytest=2Eraises(FileNotFoundError, match=3D"not found"):
+        dt=2Ecompile_to_dtb(tmp_path / "nope=2Edts", tmp_path)
+
+
+def test_compile_to_dtb_missing_out_dir_raises_filenotfound(tmp_path):
+    src =3D tmp_path / "a=2Edts"
+    src=2Ewrite_text(_MINIMAL_DTS)
+
+    with pytest=2Eraises(FileNotFoundError, match=3D"doesn't exist"):
+        dt=2Ecompile_to_dtb(src, tmp_path / "absent")
+
+
+def test_compile_to_dtb_source_goes_to_out_dir_with_dtb_suffix(tmp_path):
+    src =3D tmp_path / "host-1smp=2Edts"
+    src=2Ewrite_text(_MINIMAL_DTS)
+    out =3D tmp_path / "binaries"
+    out=2Emkdir()
+
+    with mock=2Epatch=2Eobject(dt, "_compile_dts") as compile_mock:
+        result =3D dt=2Ecompile_to_dtb(src, out)
+
+    assert result =3D=3D out / "host-1smp=2Edtb"
+    compile_mock=2Eassert_called_once_with(src, out / "host-1smp=2Edtb")
+
+
+# ---- write_dts ----
+
+
+def test_write_dts_writes_source_under_out_dir(tmp_path):
+    src =3D dt=2Ewrite_dts(_MINIMAL_DTS, name=3D"unit", out_dir=3Dtmp_pat=
h)
+
+    assert src =3D=3D tmp_path / "unit=2Edts"
+    assert src=2Eread_text() =3D=3D _MINIMAL_DTS
+
+
+@pytest=2Emark=2Eskipif(not _HAS_DTC, reason=3D"dtc not installed")
+def test_write_then_compile_produces_dtb(tmp_path):
+    src =3D dt=2Ewrite_dts(_MINIMAL_DTS, name=3D"unit", out_dir=3Dtmp_pat=
h)
+    dtb =3D dt=2Ecompile_to_dtb(src, tmp_path)
+
+    assert dtb=2Eis_file()
+    assert dtb=2Esuffix =3D=3D "=2Edtb"
diff --git a/automation/scripts/qtb/riscv/unit/test_machine=2Epy b/automat=
ion/scripts/qtb/riscv/unit/test_machine=2Epy
new file mode 100644
index 0000000000=2E=2E0a90a5545b
--- /dev/null
+++ b/automation/scripts/qtb/riscv/unit/test_machine=2Epy
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: GPL-2=2E0-only
+"""Unit tests for RiscvTestMachine QEMU argument assembly=2E"""
+
+from __future__ import annotations
+
+from unittest import mock
+
+from =2E=2Emachine import RiscvTestMachine
+from =2E=2Econfig import MACHINE_MEMORY, BinariesConfig
+
+
+def _binaries(tmp_path):
+    paths =3D {}
+    for name in ("qemu", "firmware", "xen"):
+        p =3D tmp_path / name
+        p=2Ewrite_bytes(b"")
+        paths[name] =3D str(p)
+    return BinariesConfig(**paths)
+
+
+def _machine(mc) -> RiscvTestMachine:
+    """Build the machine with QtbMachine=2E__init__ stubbed out (it spawn=
s QEMU)=2E"""
+    with mock=2Epatch("qemu=2Eqtb=2EQtbMachine=2E__init__", return_value=
=3DNone):
+        return RiscvTestMachine(mc, timeout=3D30)
+
+
+def test_init_forwards_cpus_to_qtbmachine(tmp_path, make_machine):
+    mc =3D make_machine(name=3D"machine", binaries=3D_binaries(tmp_path))
+
+    with mock=2Epatch("qemu=2Eqtb=2EQtbMachine=2E__init__", return_value=
=3DNone) as base_init:
+        vm =3D RiscvTestMachine(mc, timeout=3D30, log_dir=3D"/logs")
+
+    assert vm=2Emachine_conf is mc
+    assert base_init=2Ecall_args=2Ekwargs =3D=3D {
+        "memory": MACHINE_MEMORY,
+        "cpus": mc=2Epcpu,
+        "mirror_console": False,
+        "timeout": 30,
+        "log_dir": "/logs",
+    }
+
+
+def test_resolve_binary_is_the_configured_qemu(tmp_path, make_machine):
+    mc =3D make_machine(name=3D"machine", binaries=3D_binaries(tmp_path))
+
+    assert _machine(mc)=2E_resolve_binary() =3D=3D str(mc=2Ebinaries=2Eqe=
mu)
+
+
+def test_machine_args_wires_firmware_kernel_and_dtb(tmp_path, make_machin=
e):
+    mc =3D make_machine(name=3D"machine", binaries=3D_binaries(tmp_path))
+
+    args =3D list(_machine(mc)=2E_machine_args(memory=3D2048, cpus=3D4))
+
+    assert args[args=2Eindex("-bios") + 1] =3D=3D str(mc=2Ebinaries=2Efir=
mware)
+    assert args[args=2Eindex("-kernel") + 1] =3D=3D str(mc=2Ebinaries=2Ex=
en)
+    assert args[args=2Eindex("-dtb") + 1] =3D=3D str(mc=2Edt=2Edtb)
+    assert args[args=2Eindex("-m") + 1] =3D=3D "2048"
+    assert args[args=2Eindex("-smp") + 1] =3D=3D "4"
diff --git a/automation/scripts/qtb/riscv/unit/test_temp_dir=2Epy b/automa=
tion/scripts/qtb/riscv/unit/test_temp_dir=2Epy
new file mode 100644
index 0000000000=2E=2Ed595d824d7
--- /dev/null
+++ b/automation/scripts/qtb/riscv/unit/test_temp_dir=2Epy
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: GPL-2=2E0-only
+"""Unit tests for the temp_dir scratch-directory singleton=2E"""
+
+from __future__ import annotations
+
+import pytest
+
+from =2E=2E import paths
+
+
+@pytest=2Efixture(autouse=3DTrue)
+def _reset_singleton():
+    # Force each test to begin with fresh temp dir
+    yield
+    paths=2Ecleanup_temp_dir()
+
+
+def test_temp_dir_exists_and_prefixed():
+    d =3D paths=2Etemp_dir()
+    assert d=2Eis_dir()
+    assert d=2Ename=2Estartswith("qtb-")
+
+
+def test_temp_dir_is_singleton():
+    assert paths=2Etemp_dir() =3D=3D paths=2Etemp_dir()
+
+
+def test_temp_dir_handle_kept_alive():
+    h =3D paths=2E_temp_dir_handle()
+    assert h is paths=2E_temp_dir_handle()
+    assert h=2Ename =3D=3D str(paths=2Etemp_dir())
+
+
+def test_cleanup_temp_dir_removes_and_resets():
+    d =3D paths=2Etemp_dir()
+    assert d=2Eis_dir()
+    paths=2Ecleanup_temp_dir()
+    assert not d=2Eexists()
+    # Cache reset: next call builds a fresh, existing dir, not the gone o=
ne=2E
+    fresh =3D paths=2Etemp_dir()
+    assert fresh=2Eis_dir()
+    assert fresh !=3D d
diff --git a/automation/scripts/qtb/riscv/unit/test_xen_dt=2Epy b/automati=
on/scripts/qtb/riscv/unit/test_xen_dt=2Epy
new file mode 100644
index 0000000000=2E=2E37c4055b31
--- /dev/null
+++ b/automation/scripts/qtb/riscv/unit/test_xen_dt=2Epy
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2=2E0-only
+"""Unit tests for xen_dt device-tree generation=2E"""
+
+from __future__ import annotations
+
+from unittest import mock
+
+from =2E=2E import xen_dt
+
+
+# ---- _render_xen_dts ----
+
+
+def test_render_injects_bootargs(make_machine):
+    machine =3D make_machine(xen_bootargs=3D"com1=3Dpoll sched=3Dnull")
+    out =3D xen_dt=2E_render_xen_dts(machine)
+
+    assert 'xen,xen-bootargs =3D "com1=3Dpoll sched=3Dnull";' in out
+
+
+def test_render_injects_xen_mmu_type(make_machine):
+    machine =3D make_machine(mmu=3D"sv39")
+    out =3D xen_dt=2E_render_xen_dts(machine)
+
+    assert 'mmu-type =3D "riscv,sv39";' in out
+
+
+# ---- build_xen_device_tree ----
+
+
+def test_build_xen_device_tree_compiles(tmp_path, make_machine):
+    machine =3D make_machine(name=3D"unit-test")
+    dts =3D tmp_path / "unit-test=2Edts"
+    dtb =3D tmp_path / "unit-test=2Edtb"
+    with (
+        mock=2Epatch=2Eobject(xen_dt, "temp_dir", return_value=3Dtmp_path=
),
+        mock=2Epatch=2Eobject(xen_dt, "write_dts", return_value=3Ddts) as=
 write_dts,
+        mock=2Epatch=2Eobject(xen_dt, "compile_to_dtb", return_value=3Ddt=
b) as compile_to_dtb,
+    ):
+        result =3D xen_dt=2Ebuild_xen_device_tree(machine)
+
+    write_dts=2Eassert_called_once()
+    assert write_dts=2Ecall_args=2Eargs[1] =3D=3D machine=2Ename
+    compile_to_dtb=2Eassert_called_once_with(dts, tmp_path)
+    assert result=2Edts =3D=3D dts
+    assert result=2Edtb =3D=3D dtb


-- 
Baptiste Le Duc | Vates Hypervisor & Kernel Engineer

XCP-ng & Xen Orc=
hestra - Vates solutions

web: https://vates=2Etech
---=Part.204b.877beba074a48ee1.19fec70591b.fc1f12a78ffda386=---

