Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE10606ACE3
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2026 15:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V5E3ZJuo
Received: from list by lists.xenproject.org with outflank-mailman.1458353.1670683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJuWd-0006nr-Sy; Thu, 22 Oct 2026 15:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458353.1670683; Thu, 22 Oct 2026 15:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJuWd-0006nk-QE; Thu, 22 Oct 2026 15:16:15 +0000
Received: by outflank-mailman (input) for mailman id 1458353;
 Thu, 22 Oct 2026 15:16:15 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xJuWd-0006ne-7D
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 15:16:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJuWc-00BcQ9-KK
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 17:16:14 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ada28bd-e002-0a2a0a5209dd-0a2a4508dc82-14
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 17:16:14 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ada28b3-f659-0a2a45080019-d155dd2fe93c-3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 17:16:03 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-48bbb06e746so1238349f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 08:16:03 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-67-71.play-internet.pl.
 [109.243.67.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e2583523asm12984219f8f.37.2026.10.22.08.16.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2026 08:16:01 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792682163; x=1793286963; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XOY5V2I7WVNx7NuhLs0lweaAB5/YgZ23anQKEeEyg14=;
        b=V5E3ZJuoSlOG1npgfr8WfFtOEMBwSCPaoxAkPApjMUPwwK/PxIGo8kVy8GKOxT/cfN
         BqlN3AOjAguMcddZwd5GrzoU4ByAUzXo61IiBGXo3zKandYK1UFyrr3CVpf25Cf1sWRv
         WsNJXAjjZIWYI+jlrma86Jk0c8nbb3ZZLqnpzN7DNN6RAXv2/57EbNXPiuex7NmeKFEW
         cPmcJzHx+KOfrJDKxHm2eAOMuFLGdcHhcqQrEsjRd1kuoaZL2/NOYra8AUEjDwxr4+BX
         2zX1gQ9XKMFSBcuwmY6u2M6avcWtRK0rfT2pPKUgw6fIjcpNN6KiSs394o5y/x4ypsGj
         kJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792682163; x=1793286963;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XOY5V2I7WVNx7NuhLs0lweaAB5/YgZ23anQKEeEyg14=;
        b=SmOMgarVOp/HNulDRJBT95ARX31vv0gDcck4SQyyrojbgkFqDyjq+QNfkHilaYRHEk
         8iiD+YVKRcLqIYa4Dyq4tTvtZEBlcIPQf3/EFNTbN24NOMqfx6x68GCj1sxWfecmL98a
         0NmcFlmpokJuvcVxBrGMintH/zYs/2oKwg0lOCBm3yp+W9FnpDhvunaW35PCXY0qflu0
         F73g0wfEnsCKixldpMhVLTLmr+Ggdrh7l5b7o9/GI0VX3LPTYRR2SJg8hLdPbP55kKpC
         j+t4Hs2wUE6cUMTJIU4bd3j1H63AKMjTDIhP0g3zXz5EmCMbPCmiX4StSqqUXchzSSCR
         Qb7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwQ3CaaTvlVYUIG2rESfBXHwG+uMfcYAE5/K9bhYe8aN9zmABmHysHsBhX1WcFFCW/G+vRjhIu8jZk=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKP2AQiokgO5SpnzOXWXoD5Gisd9XvLSGSO8Qgm9VLtd85Yh8rS
	zKcfTPZvRtdzaAil58//dKBKPhDDsdgg3VI6BpGb2LQuatBEoyHqFIUl
X-Gm-Gg: AYBFou22vMgLzrcJW+da86YfuxmVD6qNfya+l/P842M5QB3bRBLdui/X/dk4SA+uyhC
	+Zlr6Sa0csbVMf41o6QGJzZjjNJAm6QONYMxNxoatcmNSm4GO/EDC2WQmtepzp6ZTAblQPQJf9i
	D5PFI1z8tI9/Pw+dda3GiAUy0hhn6i+sX45aa9YY6ZslP6W28aovCxLXJtIP3hooURxb+AyXfYY
	8Qktsw7xNWgNM/05IxSyA4060SOPY2U/u3UkI3tq0OIKfOvHAbdYqHFrnmMsvL+smMjdnviHETF
	8RWKVJIFouKgGj3AzUojtysXrt38BI2vDo/cessBWb1fCZyYgb3+mpiiBfBu4OmoXNmRMUORIsd
	Nipt3+toV70qN/96O+MRnBZfLfRjA9LYvcocX2B4d4649OVq87OIqz4Uxg+V3OjixDfW3dI6RmR
	Uon5BjdQfX3Y8dOpoSfwRK4OBBxlaJ3E5vGIx3WjHPt0eRGqpJBbXfNHw71Wuo4jZmsAupwkNIu
	N68cf4oTPag5ZtB4L8sHH60MyKrohb/G7v6CBZGuA8RtTgUlJwioNEUP12Su5crTKMAqXdeTgJE
	+6oaxvCjmeEKBZ92m2RnwfxedBCA
X-Received: by 2002:a05:6000:40db:b0:488:8ab9:f74c with SMTP id ffacd0b85a97d-48e2644ef10mr12981926f8f.3.1792682162671;
        Thu, 22 Oct 2026 08:16:02 -0700 (PDT)
Message-ID: <008e9c3e-07ae-4ee0-9aed-b132db796fac@gmail.com>
Date: Thu, 22 Oct 2026 17:15:59 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] automation/qtb: add Python QTB framework with the
 console-test type
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech>
 <1787823788.8631fc262581453bbf619ec5b2062170.1a0429a1248000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1787823788.8631fc262581453bbf619ec5b2062170.1a0429a1248000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1792682163-CF95A87B-DD8CC60E/10/73395122804
X-purgate-type: spam
X-purgate-size: 19594
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 8/27/26 11:42 AM, Baptiste Le Duc wrote:

[...]

> 
> diff --git a/automation/scripts/qemu_smoke_riscv64.py b/automation/scripts/qemu_smoke_riscv64.py
> new file mode 100755
> index 0000000000..f338fafcc2
> --- /dev/null
> +++ b/automation/scripts/qemu_smoke_riscv64.py
> @@ -0,0 +1,122 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0-only
> +"""CLI launcher for the qtb riscv64 dom0less tests.
> +
> +The test type comes first (e.g. `console-test`), then a command. Each type
> +reads its own config file, which ships with the type.
> +
> +Commands:
> +    list  Print every test the type defines in the config, then exit.
> +    run   Boot one test's machine under QEMU and drive it to a pass/fail
> +          verdict.
> +
> +Usage:
> +    ./qemu_smoke_riscv64.py console-test list
> +    ./qemu_smoke_riscv64.py console-test run dom0less-1smp-0domu-1vcpu-aplic-imsic-null
> +"""
> +
> +from __future__ import annotations
> +
> +import argparse
> +import logging
> +import sys
> +from collections.abc import Sequence
> +from traceback import extract_tb, format_exc
> +
> +from qtb.riscv import RiscvQtbTest, TEST_TYPES, RiscvTestMachine, cleanup_temp_dir
> +
> +logger = logging.getLogger(__name__)
> +
> +
> +def _run_test(test: RiscvQtbTest, log_dir: str | None) -> int:
> +    """Compile the machine's device trees, boot it, and run the test."""
> +    vm = RiscvTestMachine(test.machine, timeout=test.timeout, log_dir=log_dir)
> +    try:
> +        with vm:
> +            vm.launch()
> +            test.run(vm)
> +    except Exception as exc:
> +        print(
> +            f"FAIL: {test.name}: {type(exc).__name__}: {exc}",
> +            file=sys.stderr,
> +            flush=True,
> +        )
> +        return 1

This is all that ends up in the job log when the test fails. I made a
test wait for a string which never appears, and the whole output was:

   FAIL: never-matches: TIMEOUT: Timeout exceeded.
   <qemu.qtb.console._QemuSpawn object at 0x7ff4503c8980>
   searcher: searcher_string:
       0: b'THIS STRING NEVER APPEARS'

Together with mirror_console=False (see machine.py below), there isn't
a single line of Xen's output in the job log, whereas
qemu-smoke-riscv64.sh puts the whole console there. Finding out where
Xen stopped then requires downloading con0.log from the artifacts.

Also, as this catches every exception and prints only its message, a
bug in the framework itself is reported the same way, with no traceback 
even with -v.

> +
> +    print(f"PASS: {test.name}", flush=True)
> +    return 0

[...]

> diff --git a/automation/scripts/qtb/riscv/config.py b/automation/scripts/qtb/riscv/config.py
> new file mode 100644
> index 0000000000..b5068d6bfb
> --- /dev/null
> +++ b/automation/scripts/qtb/riscv/config.py
> @@ -0,0 +1,119 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +"""YAML config parser for qtb-based Xen riscv64 tests.
> +
> +Parsing steps:
> +    - validate the YAML
> +    - build the dataclasses: the host device tree is compiled on first use
> +      of MachineConfig.dt
> +"""
> +
> +from __future__ import annotations
> +
> +import functools
> +import inspect
> +from dataclasses import dataclass
> +from functools import cached_property
> +from pathlib import Path
> +
> +import yaml
> +
> +from .paths import resolve_binary, resolve_path
> +from .xen_dt import DeviceTree, build_xen_device_tree
> +
> +XEN_MMU_TYPE_DEFAULT: str = "sv48"

See my reply to patch 2: Xen doesn't read mmu-type from the host CPU
nodes, so this has no effect on it.

> +XEN_BOOTARGS_DEFAULT: str = ""
> +
> +MACHINE_MEMORY: int = 2048
> +MACHINE_INTERRUPT_CONTROLLER: str = "aplic-imsic"
> +
> +
> +def required_keys(argument_name: str, keys: set, label: str = ""):
> +    """Validate the dict passed as `argument_name` has every key in `keys`."""

This is a lot of machinery (binding the decorated function's signature
through inspect) just to check that two or three keys are present, and
it doesn't catch the mistakes one is likely to make in config.yaml.

What I got (with help of AI) for a few of them:

- an empty machine entry:
   config.py:40: 'NoneType' object has no attribute 'keys'
- pcpu: "two":
   qemu-host.dts.j2:52: 'str' object cannot be interpreted as an integer
- pcpu: 0:
   the DT is generated and QEMU is launched, which then fails with
   "Invalid CPU topology".

A few explicit checks (pcpu is an integer >= 1, an entry is a mapping,
...) would be both simpler and more useful. MachineConfig.from_config()
doesn't use the decorator either and checks its keys by hand, so the
same file has two ways of doing the same thing.

> +    keys = set(keys)
> +
> +    def decorate(func):
> +        sig = inspect.signature(func)
> +
> +        @functools.wraps(func)
> +        def wrapper(*args, **kwargs):
> +            arg = sig.bind(*args, **kwargs).arguments[argument_name]
> +            missing = keys - arg.keys()
> +            if missing:
> +                raise ValueError(
> +                    f"{label or func.__name__} missing keys: {sorted(missing)}"
> +                )
> +            return func(*args, **kwargs)
> +
> +        return wrapper
> +
> +    return decorate
> +
> +
> +@dataclass
> +class BinariesConfig:
> +    xen: Path
> +
> +
> +@required_keys("raw", {"xen"}, label="binaries config")
> +def _parse_binaries(raw: dict) -> BinariesConfig:
> +    return BinariesConfig(xen=resolve_binary(raw["xen"]))
> +
> +
> +@required_keys("raw", {"pcpu"}, label="machine config")
> +def _parse_machine(
> +    raw: dict,
> +    binaries: BinariesConfig,
> +    machine: str,
> +) -> MachineConfig:
> +    return MachineConfig(
> +        name=machine,
> +        pcpu=raw["pcpu"],
> +        binaries=binaries,
> +        mmu_type=raw.get("mmu_type", XEN_MMU_TYPE_DEFAULT),
> +        xen_bootargs=raw.get("xen_bootargs", XEN_BOOTARGS_DEFAULT),
> +    )
> +
> +
> +@dataclass(frozen=True)
> +class MachineConfig:
> +    """One named machine: the test-agnostic description of what to boot.
> +
> +    A machine is reusable across test types; a test (see RiscvQtbTest
> +    subclasses) picks a machine by name and layers its own parameters on top.
> +    """
> +
> +    name: str
> +    pcpu: int
> +    binaries: BinariesConfig
> +    mmu_type: str  # Xen (host) MMU type, injected into the host dts cpus.
> +    xen_bootargs: str
> +
> +    @classmethod
> +    def from_config(cls, file_name: str, machine: str) -> MachineConfig:
> +        """Build only the single named machine from the catalog at `path`.
> +
> +        A test run boots one machine, so there is no need to construct the
> +        whole catalog: parse the YAML, validate the shared binaries, and
> +        build just the requested entry.
> +        """
> +        fpath: Path = resolve_path(file_name)
> +        raw: dict = yaml.safe_load(fpath.read_text())
> +
> +        required = ("binaries", "machines")
> +        missing = [k for k in required if k not in raw]
> +        if missing:
> +            raise ValueError(f"Global config {file_name} missing keys: {missing}")
> +
> +        binaries: BinariesConfig = _parse_binaries(raw["binaries"])
> +
> +        machines = raw["machines"]
> +        if machine not in machines:
> +            known = ", ".join(sorted(machines)) or "(none)"
> +            raise ValueError(f"unknown machine {machine!r}; known machines: {known}")
> +
> +        return _parse_machine(machines[machine], binaries, machine)
> +
> +    @cached_property
> +    def dt(self) -> DeviceTree:
> +        """Host device tree, compiled on first use."""
> +        return build_xen_device_tree(self)

[...]

> diff --git a/automation/scripts/qtb/riscv/console_test/console_test.py b/automation/scripts/qtb/riscv/console_test/console_test.py
> new file mode 100644
> index 0000000000..95540fd388
> --- /dev/null
> +++ b/automation/scripts/qtb/riscv/console_test/console_test.py
> @@ -0,0 +1,145 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +"""Console string expectation test (`type: console-test`).
> +
> +Per console: assert each expected string is printed within the timeout.
> +Nothing is injected; this only watches console output.
> +
> +YAML (console-test.yaml): each test names the machine it boots (tests may
> +share one) and maps a console index to the string(s) expected on it: 0 is
> +Xen's own console.
> +
> +    machine_catalog: config.yaml
> +    tests:
> +      dom0less-1smp-0domu-1vcpu-aplic-imsic-null:  # test name (run positional)
> +        machine: dom0less-1smp-0domu-1vcpu-aplic-imsic-null  # from config.yaml
> +        expect:                                    # console index -> string(s)
> +          0: [All set up]
> +"""
> +
> +from __future__ import annotations
> +
> +import logging
> +from typing import ClassVar
> +
> +import pexpect
> +import yaml
> +
> +from ..paths import resolve_path
> +from ..config import MachineConfig, required_keys
> +from ..qtb_test import TIMEOUT_DEFAULT, RiscvQtbTest
> +from ..machine import RiscvTestMachine
> +
> +logger = logging.getLogger(__name__)
> +
> +TYPE_ID: str = "console-test"
> +
> +CONFIG_FILE_DEFAULT: str = "console_test/console-test.yaml"
> +DESCRIPTION_DEFAULT: str = "Assert expected string(s) are printed on the Xen console"
> +ATTEMPTS_DEFAULT: int = 3
> +
> +XEN_CONS_IDX: int = 0
> +
> +
> +class ConsoleTest(RiscvQtbTest):
> +    type_id: ClassVar[str] = TYPE_ID
> +    description: ClassVar[str] = DESCRIPTION_DEFAULT
> +    config_file: ClassVar[str] = CONFIG_FILE_DEFAULT
> +
> +    def __init__(self, raw: dict, test_name: str) -> None:
> +        self.name, self.data, self.machine = self._parse_test_cfg(raw, test_name)
> +
> +        self.expect = self.data["expect"]  # expected console string
> +
> +        self.timeout = int(self.data.get("timeout", TIMEOUT_DEFAULT))
> +        if self.timeout < 1:
> +            raise ValueError("timeout < 1, must be at least 1")
> +
> +        self.attempts = int(self.data.get("attempts", ATTEMPTS_DEFAULT))
> +        if self.attempts < 1:
> +            raise ValueError("attempts < 1, must be at least 1")
> +
> +    @staticmethod
> +    def _load_yaml(path) -> dict:
> +        return yaml.safe_load(resolve_path(path).read_text())
> +
> +    @classmethod
> +    def from_config(cls, config_file: str, test_name: str) -> ConsoleTest:
> +        return cls(cls._load_yaml(config_file), test_name)
> +
> +    @staticmethod
> +    @required_keys("test_data", {"machine", "expect"})
> +    def _parse_test_data(
> +        machine_catalog: str, test_data: dict, test_name: str
> +    ) -> tuple[str, dict, MachineConfig]:
> +        """Parse test data dictionary"""
> +        test_machine = MachineConfig.from_config(machine_catalog, test_data["machine"])
> +
> +        def invalid(why: str) -> ValueError:
> +            return ValueError(
> +                f"test {test_name!r}: {why}; expected "
> +                f"{{{XEN_CONS_IDX}: ['str1', 'str2', ...]}}"
> +            )
> +
> +        expect = test_data["expect"]
> +        if not isinstance(expect, dict) or expect.keys() != {XEN_CONS_IDX}:
> +            raise invalid(
> +                f"expect must map console index {XEN_CONS_IDX} (Xen's own "
> +                f"console, the only one) and nothing else, got {expect!r}"
> +            )
> +        strings = expect[XEN_CONS_IDX]
> +        if not isinstance(strings, list):
> +            raise invalid(
> +                f"{ConsoleTest.config_file} expects a list of string(s), "
> +                f"got {type(strings).__name__}"
> +            )
> +        if not strings:
> +            raise invalid("Xen has no expected string")
> +        if not all(isinstance(s, str) and s for s in strings):
> +            raise invalid(f"Xen expects non-empty strings, got {strings!r}")
> +        return (test_name, test_data, test_machine)
> +
> +    @staticmethod
> +    @required_keys("raw", {"machine_catalog", "tests"})
> +    def _parse_test_cfg(raw: dict, test_name: str) -> tuple[str, dict, MachineConfig]:
> +        """Read the config: return the named test dict and its machine."""
> +
> +        tests = raw["tests"]
> +        if test_name not in tests:
> +            known = ", ".join(sorted(tests)) or "(none)"
> +            raise ValueError(f"unknown test {test_name!r}; known tests: {known}")
> +
> +        test_data = tests[test_name]
> +        return ConsoleTest._parse_test_data(
> +            raw["machine_catalog"], test_data, test_name
> +        )
> +
> +    @staticmethod
> +    def list_tests(config_file: str) -> list[str]:
> +        tests = ConsoleTest._load_yaml(config_file).get("tests")
> +        if not tests:
> +            logger.warning("no 'tests' key found in %s", config_file)
> +            return []
> +        return list(tests)
> +
> +    @staticmethod
> +    def _console(vm: RiscvTestMachine):
> +        """Xen's own console (con0)."""
> +        if vm.console is None:
> +            raise RuntimeError("Xen console not wired up, machine not launched?")
> +        return vm.console
> +
> +    def run(self, vm: RiscvTestMachine) -> None:
> +        cons = self._console(vm)
> +        for strings in self.expect.values():
> +            for s in strings:
> +                self._expect_string(cons, s)
> +
> +    def _expect_string(self, cons, expected: str) -> None:
> +        """Wait for `expected` on the console, retrying on timeout."""
> +        for attempt in range(self.attempts):
> +            try:
> +                cons.expect_exact(expected, timeout=self.timeout)
> +                return
> +            except pexpect.TIMEOUT:
> +                if attempt == self.attempts - 1:
> +                    raise

Nothing is actually retried here: on a timeout, expect_exact() is just
called again on the same stream, so "attempts" only multiplies the
timeout. With timeout: 5 and attempts: 3, the failing test above gave
up after exactly 15 seconds, and with the defaults it is a single
360 second wait per string. I'd drop attempts and keep only timeout.

Also, console.exp, which the other QEMU and hardware tests use, honours
TEST_TIMEOUT and TEST_TIMEOUT_OVERRIDE, while this ignores them.

[...]
> diff --git a/automation/scripts/qtb/riscv/machine.py b/automation/scripts/qtb/riscv/machine.py
> new file mode 100644
> index 0000000000..74a05dfc82
> --- /dev/null
> +++ b/automation/scripts/qtb/riscv/machine.py
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +"""QtbMachine for riscv64."""
> +
> +from __future__ import annotations
> +
> +from collections.abc import Sequence
> +
> +from qemu.qtb import QtbMachine
> +
> +from .config import MACHINE_INTERRUPT_CONTROLLER, MACHINE_MEMORY, MachineConfig
> +from .paths import resolve_from_path
> +
> +
> +class RiscvTestMachine(QtbMachine):
> +    arch_name = "riscv64"
> +    gdb_arch = "riscv:rv64"
> +
> +    qemu_bin = "qemu-system-riscv64"
> +
> +    def __init__(
> +        self,
> +        mc: MachineConfig,
> +        *,
> +        timeout: int,
> +        log_dir: str | None = None,
> +    ) -> None:
> +        self.machine_conf = mc
> +        super().__init__(
> +            memory=MACHINE_MEMORY,
> +            cpus=mc.pcpu,
> +            mirror_console=False,

Why not mirror the console? QTB's own from_argv() mirrors it unless
--no-mirror is given, and with it the job log would contain Xen's
output, as it does today.

> +            timeout=timeout,
> +            log_dir=log_dir,
> +        )
> +

[...]

> diff --git a/automation/scripts/qtb/riscv/paths.py b/automation/scripts/qtb/riscv/paths.py
> new file mode 100644
> index 0000000000..237f1bf502
> --- /dev/null
> +++ b/automation/scripts/qtb/riscv/paths.py
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +"""Path helpers: resolve pkg-relative paths."""
> +
> +from __future__ import annotations
> +
> +import os
> +import shutil
> +import tempfile
> +from functools import lru_cache
> +from pathlib import Path
> +
> +# Every relative path in this module is resolved against this base.
> +_BASE = Path(__file__).resolve().parent
> +
> +# Build artifacts, overridable for CI.
> +_BINARIES_BASE = Path(os.environ.get("QTB_BINARIES_DIR") or _BASE / "binaries")

So by default xen is looked for in 
automation/scripts/qtb/riscv/binaries/, while every other script in 
automation/scripts/ uses binaries/ at the top of the tree. Without 
QTB_BINARIES_DIR, a run from the top of the tree fails with "cannot 
resolve '.../automation/scripts/qtb/riscv/binaries/xen': does not 
exist", and "resolved under binaries/" in the README (patch 5) doesn't 
make that clear either. Defaulting to binaries/ at the top of the tree 
would follow the existing convention, and patch 6 wouldn't need to set 
QTB_BINARIES_DIR.

[...]
> diff --git a/automation/scripts/qtb/riscv/xen_dt.py b/automation/scripts/qtb/riscv/xen_dt.py
> new file mode 100644
> index 0000000000..8881b01b36
> --- /dev/null
> +++ b/automation/scripts/qtb/riscv/xen_dt.py
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +"""Build the Xen host device tree for a MachineConfig.
> +
> +The tree is rendered from its Jinja2 template (dts/qemu-host.dts.j2), which
> +takes the hart count, the Xen MMU type and the Xen command line, then compiled
> +to a DTB with dtc.
> +"""
> +
> +from __future__ import annotations
> +
> +from dataclasses import dataclass
> +from functools import lru_cache
> +from pathlib import Path
> +from typing import TYPE_CHECKING
> +from jinja2 import Environment, FileSystemLoader
> +
> +from .paths import resolve_path, temp_dir
> +from .dt import compile_to_dtb, write_dts
> +
> +if TYPE_CHECKING:  # config imports this module, so only import it for typing.
> +    from .config import MachineConfig
> +
> +# Directory holding the Jinja2 platform device tree templates.
> +_DTS_DIR = "dts"
> +
> +
> +@dataclass(frozen=True)
> +class DeviceTree:
> +    """Compiled device trees for one machine launch."""
> +
> +    dts: Path
> +    dtb: Path
> +
> +
> +@lru_cache(maxsize=1)
> +def _env() -> Environment:
> +    return Environment(
> +        loader=FileSystemLoader(resolve_path(_DTS_DIR)),
> +        keep_trailing_newline=True,
> +    )
> +
> +
> +def _render_xen_dts(machine: MachineConfig) -> str:
> +    """Render the Xen host device tree source text for `machine`."""
> +    tmpl = _env().get_template("qemu-host.dts.j2")
> +    return tmpl.render(
> +        ncpus=machine.pcpu,
> +        mmu_type=machine.mmu_type,
> +        xen_bootargs=machine.xen_bootargs,
> +    )
> +
> +
> +def build_xen_device_tree(machine: MachineConfig) -> DeviceTree:
> +    """Compile `machine` device tree into the shared scratch dir."""
> +    out = temp_dir()

The scratch dir is removed on exit, so after a failed run --log-dir
contains only con0.log and the qtest log, and there is no way to see
which DT Xen was booted with. Could the .dts be copied to --log-dir as
well?

~ Oleksii

> +    dts: Path = write_dts(_render_xen_dts(machine), machine.name, out)
> +    dtb: Path = compile_to_dtb(dts, out)
> +    return DeviceTree(dts=dts, dtb=dtb)


