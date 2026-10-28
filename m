Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B55B606A31F
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 09:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=Qvjl4dxR
Received: from list by lists.xenproject.org with outflank-mailman.1463000.1673977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM0IA-0000FP-PS; Wed, 28 Oct 2026 09:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463000.1673977; Wed, 28 Oct 2026 09:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM0IA-0000FI-Mb; Wed, 28 Oct 2026 09:49:58 +0000
Received: by outflank-mailman (input) for mailman id 1463000;
 Wed, 28 Oct 2026 09:49:58 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a181ea8c1d000f79f@swg.vates.tech>)
 id 1xM0I9-0000FA-Qi
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 09:49:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xM0I8-006OhM-SY
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 10:49:56 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a181ea8c1d000f79f@swg.vates.tech>)
 id 6ae1c538-2eae-0a2a0a5409dd-0a2a450ae2c4-34
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 10:49:56 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a181ea8c1d000f79f@swg.vates.tech>)
 id 6ae1c544-f2d2-0a2a450a0019-b9ff1c228857-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 10:49:56 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a181ea8c1d000f79f.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 28 Oct 2026 09:49:54 +0000
Received: from l14 (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id C279482F5C;
 Wed, 28 Oct 2026 10:49:53 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=+JzbgpxP3FqraFlm+HRAw5QfZsTuxXaXrmR6y7fqCqA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Qvjl4dxRFoFEpuHKWeMn+QgcGsbhP/AJlhy/qYF5oGkGjw2vfe51L3OKLcuf30Xt3OLIr/Op/
 lcJla5oP1mbsFtm7tGt4lP+Jqc1vXxiLW70FR4B5pi9Gs4v9VoQ9BV9mIiRBcD3ZVS5k5plISuY
 Ccq43UMYYHfiOd9h9GY7Ph3kGgzLL/pQDj9/7RTmK8FSLP/7N5T4ptXaSASTD6rs0x+Gj6wxj28
 0BtrxrMUg6ZnA82K/KC2Z1pFJ0dK5LuIpRRn8xBF/YrdkzV7a4Z7kHe18CpOHfQIUToklDq5vxO
 SuP9FQnw8A4HaHnSWr7zOj/Eo5slcFsCsuDzAOf+XrQg==
X-Zone-Loop: 0103b367a8918eaf374600eb52f0c4385643a01f715b
x-campaign-type: default
x-transaction-id: 621b8407-09a7-43d4-b414-9ae985a8f370
x-swg-uid: 01-3075735e-b197-4c29-ac71-39fc9c74119d
X-Mailer: Sweego
Message-ID:
 <1793180994.8631fc262581453bbf619ec5b2062170.1a181ea8c1d000f79f@vates.tech>
x-swg-bid: 1793180994.8631fc262581453bbf619ec5b2062170.1a181ea8c1d000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Wed, 28 Oct 2026 10:49:53 +0100
From: Anthony PERARD <anthony.perard@vates.tech>
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 3/6] automation/qtb: add Python QTB framework with the
 console-test type
References: <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech>
 <1787823788.8631fc262581453bbf619ec5b2062170.1a0429a1248000c4f3@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1787823788.8631fc262581453bbf619ec5b2062170.1a0429a1248000c4f3@vates.tech>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.27b.80311203c4ee5755.1a181ea8968.a971603a2cf41c40=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793180993901
X-purgate-ID: tlsNG-4011c0/1793180996-58BC8CFC-38F7848B/0/0
X-purgate-type: clean
X-purgate-size: 31405
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.27b.80311203c4ee5755.1a181ea8968.a971603a2cf41c40=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 11:42:49AM +0200, Baptiste Le Duc wrote:
> diff --git a/automation/scripts/qemu_smoke_riscv64=2Epy b/automation/scr=
ipts/qemu_smoke_riscv64=2Epy
> new file mode 100755
> index 0000000000=2E=2Ef338fafcc2
> --- /dev/null
> +++ b/automation/scripts/qemu_smoke_riscv64=2Epy
> @@ -0,0 +1,122 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2=2E0-only
> +"""CLI launcher for the qtb riscv64 dom0less tests=2E
> +
> +The test type comes first (e=2Eg=2E `console-test`), then a command=2E =
Each type
> +reads its own config file, which ships with the type=2E
> +
> +Commands:
> +    list  Print every test the type defines in the config, then exit=2E
> +    run   Boot one test's machine under QEMU and drive it to a pass/fai=
l
> +          verdict=2E
> +
> +Usage:
> +    =2E/qemu_smoke_riscv64=2Epy console-test list
> +    =2E/qemu_smoke_riscv64=2Epy console-test run dom0less-1smp-0domu-1v=
cpu-aplic-imsic-null

Can we change the usage a bit?
I would put `list` and `run` (the command) as first possitionnal
argument=2E

`list` would list all types of tests, if alone on the command line=2E
And `list console-test` would list all tests associated with this kind=2E

As for the comment of this file, it doesn't feel useful as it is=2E It's
currently a very verbose way to try to explain how to use the command
line, it doesn't explain everything, "usage" is actually just few
"examples", and I don't think one would look here to find out how to use
it, when running the script with `-h` can print something more standard=2E

I guess here you could explain that tests from a config=2Eyaml will be run
under qemu, with different parameter for the machine and different tests
to run=2E

> +"""
> +
> +from __future__ import annotations
> +
> +import argparse
> +import logging
> +import sys
> +from collections=2Eabc import Sequence
> +from traceback import extract_tb, format_exc
> +
> +from qtb=2Eriscv import RiscvQtbTest, TEST_TYPES, RiscvTestMachine, cle=
anup_temp_dir
> +
> +logger =3D logging=2EgetLogger(__name__)
> +
> +
> +def _run_test(test: RiscvQtbTest, log_dir: str | None) -> int:
> +    """Compile the machine's device trees, boot it, and run the test=2E=
"""
> +    vm =3D RiscvTestMachine(test=2Emachine, timeout=3Dtest=2Etimeout, l=
og_dir=3Dlog_dir)

Naming that `vm` might be a be counter intuitive=2E Especially if you
intend to have nested VM later=2E My guess, `host` or `machine` would be a
bit better=2E


> +    try:
> +        with vm:
> +            vm=2Elaunch()
> +            test=2Erun(vm)
> +    except Exception as exc:
> +        print(
> +            f"FAIL: {test=2Ename}: {type(exc)=2E__name__}: {exc}",
> +            file=3Dsys=2Estderr,
> +            flush=3DTrue,
> +        )
> +        return 1
> +
> +    print(f"PASS: {test=2Ename}", flush=3DTrue)
> +    return 0
> +
> +
> +def main(argv: Sequence[str] | None =3D None) -> int:
> +    ns =3D setup_parser()=2Eparse_args(argv)
> +    logging=2EbasicConfig(
> +        level=3Dlogging=2EDEBUG if ns=2Everbose else logging=2EWARNING,=
 format=3D"%(message)s"
> +    )
> +    try:
> +        return ns=2Efunc(ns)
> +    except Exception as exc:
> +        logger=2Edebug(format_exc())
> +        frame =3D extract_tb(exc=2E__traceback__)[-1]
> +        print(f"{frame=2Efilename}:{frame=2Elineno}: {exc}")
> +        return 2
> +    finally:
> +        cleanup_temp_dir()

This cleanup_temp_dir() is out of place, when `main()` doesn't create
this temporary dir=2E Instead you could have the main prepare an
environment, create temporary directories, and give that to the test
classes, and that in turn would justify to do the cleanup here=2E

> +
> +
> +if __name__ =3D=3D "__main__":
> +    sys=2Eexit(main())
> diff --git a/automation/scripts/qtb/riscv/config=2Epy b/automation/scrip=
ts/qtb/riscv/config=2Epy
> new file mode 100644
> index 0000000000=2E=2Eb5068d6bfb
> --- /dev/null
> +++ b/automation/scripts/qtb/riscv/config=2Epy
> @@ -0,0 +1,119 @@
> +# SPDX-License-Identifier: GPL-2=2E0-only
> +"""YAML config parser for qtb-based Xen riscv64 tests=2E
> +
> +Parsing steps:
> +    - validate the YAML
> +    - build the dataclasses: the host device tree is compiled on first =
use
> +      of MachineConfig=2Edt
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
> +from =2Epaths import resolve_binary, resolve_path
> +from =2Exen_dt import DeviceTree, build_xen_device_tree
> +
> +XEN_MMU_TYPE_DEFAULT: str =3D "sv48"
> +XEN_BOOTARGS_DEFAULT: str =3D ""
> +
> +MACHINE_MEMORY: int =3D 2048

That feels like a lot, how about just 512MB? Or do you need 2GB for the
tests? And why isn't it called *_DEFAULT like other parameters?

> +MACHINE_INTERRUPT_CONTROLLER: str =3D "aplic-imsic"

This isn't used here, in `config=2Epy`=2E Either
MACHINE_INTERRUPT_CONTROLLER doesn't need to exist, or it should be
added to MachineConfig=2E

> +
> +
> +@dataclass(frozen=3DTrue)
> +class MachineConfig:
> +    """One named machine: the test-agnostic description of what to boot=
=2E
> +
> +    A machine is reusable across test types; a test (see RiscvQtbTest
> +    subclasses) picks a machine by name and layers its own parameters o=
n top=2E
> +    """
> +
> +    name: str
> +    pcpu: int
> +    binaries: BinariesConfig
> +    mmu_type: str  # Xen (host) MMU type, injected into the host dts cp=
us=2E
> +    xen_bootargs: str
> +
> +    @classmethod
> +    def from_config(cls, file_name: str, machine: str) -> MachineConfig=
:
> +        """Build only the single named machine from the catalog at `pat=
h`=2E
> +
> +        A test run boots one machine, so there is no need to construct =
the
> +        whole catalog: parse the YAML, validate the shared binaries, an=
d
> +        build just the requested entry=2E
> +        """
> +        fpath: Path =3D resolve_path(file_name)
> +        raw: dict =3D yaml=2Esafe_load(fpath=2Eread_text())
> +
> +        required =3D ("binaries", "machines")
> +        missing =3D [k for k in required if k not in raw]
> +        if missing:
> +            raise ValueError(f"Global config {file_name} missing keys: =
{missing}")
> +
> +        binaries: BinariesConfig =3D _parse_binaries(raw["binaries"])
> +
> +        machines =3D raw["machines"]
> +        if machine not in machines:
> +            known =3D ", "=2Ejoin(sorted(machines)) or "(none)"
> +            raise ValueError(f"unknown machine {machine!r}; known machi=
nes: {known}")
> +
> +        return _parse_machine(machines[machine], binaries, machine)
> +
> +    @cached_property
> +    def dt(self) -> DeviceTree:
> +        """Host device tree, compiled on first use=2E"""
> +        return build_xen_device_tree(self)
> diff --git a/automation/scripts/qtb/riscv/config=2Eyaml b/automation/scr=
ipts/qtb/riscv/config=2Eyaml
> new file mode 100644
> index 0000000000=2E=2E94897827b7
> --- /dev/null
> +++ b/automation/scripts/qtb/riscv/config=2Eyaml
> @@ -0,0 +1,17 @@
> +# Shared config for the qtb riscv64 tests
> +#
> +# A machine is the test-agnostic description of what to boot (cpus, Xen=
 command
> +# line)=2E Test YAMLs (e=2Eg=2E console-test=2Eyaml) pick a machine by =
name and layer
> +# their own parameters on top=2E
> +#
> +# Path resolution (see paths=2Epy): `binaries:` entries resolve against
> +# $QTB_BINARIES_DIR env var if defined else `binaries`=2E Absolute path=
s used
> +# as-is=2E
> +
> +binaries:
> +  xen:      xen
> +
> +machines:
> +  dom0less-1smp-0domu-1vcpu-aplic-imsic-null:
> +    xen_bootargs: "sched=3Dnull"

There's a document describing the Xen command line in the xen tree=2E It
is composed of parameters and options=2E Also `xl info` calls it
`xen_commandline`=2E While I understand "bootargs", can we rename that to
something more comment in this context? That is "xen_cmdline" or
"xen_commandline"=2E


> diff --git a/automation/scripts/qtb/riscv/console_test/console-test=2Eya=
ml b/automation/scripts/qtb/riscv/console_test/console-test=2Eyaml
> new file mode 100644
> index 0000000000=2E=2Ecec0edc510
> --- /dev/null
> +++ b/automation/scripts/qtb/riscv/console_test/console-test=2Eyaml
> @@ -0,0 +1,18 @@

Would it be possible to merge this config file into the main one? That
is "config=2Eyaml"=2E I think having a single config file for the whole te=
st
suite would be easier to manage going forward=2E It would be easier to
look at a single files instead of looking for files in multiple
locations=2E Then we can just tell the main script which config file to
use, and the different class of tests won't have to guess where their
config file is=2E


> +# Console string expectation test (run with: qemu_smoke_riscv64=2Epy co=
nsole-test run <test>)=2E
> +#
> +# Each test uses a machine from config=2Eyaml and maps a console index =
to the list
> +# of string(s) expected on that console: 0 is Xen's own console=2E The =
runner boots
> +# the machine and asserts each string is printed within the timeout=2E =
Nothing is
> +# injected=2E
> +#
> +# Test options:
> +#   timeout: int  # timeout between each string match (in seconds)
> +#   attempts: int # number of tries for a wait before failing=2E Defaul=
t 3 (min =3D 1)
> +
> +machine_catalog: config=2Eyaml
> +
> +tests:
> +  dom0less-1smp-0domu-1vcpu-aplic-imsic-null:
> +    machine: dom0less-1smp-0domu-1vcpu-aplic-imsic-null
> +    expect:
> +      0: ["All set up"]

I wonder if configuring the machine here instead of in a separated array
wouldn't make more sense=2E The string
"dom0less-1smp-0domu-1vcpu-aplic-imsic-null" is duplicated three time=2E
If instead we had:
   =20
    tests:
      dom0less-1smp-0domu-1vcpu-aplic-imsic-null:
        machine:
            pcpu: 1
            xen_bootargs: "sched=3Dnull"
        expect:
          0: ["All set up"]

> diff --git a/automation/scripts/qtb/riscv/console_test/console_test=2Epy=
 b/automation/scripts/qtb/riscv/console_test/console_test=2Epy
> new file mode 100644
> index 0000000000=2E=2E95540fd388
> --- /dev/null
> +++ b/automation/scripts/qtb/riscv/console_test/console_test=2Epy
> @@ -0,0 +1,145 @@
> +# SPDX-License-Identifier: GPL-2=2E0-only
> +"""Console string expectation test (`type: console-test`)=2E
> +
> +Per console: assert each expected string is printed within the timeout=
=2E
> +Nothing is injected; this only watches console output=2E
> +
> +YAML (console-test=2Eyaml): each test names the machine it boots (tests=
 may
> +share one) and maps a console index to the string(s) expected on it: 0 =
is
> +Xen's own console=2E
> +
> +    machine_catalog: config=2Eyaml
> +    tests:
> +      dom0less-1smp-0domu-1vcpu-aplic-imsic-null:  # test name (run pos=
itional)
> +        machine: dom0less-1smp-0domu-1vcpu-aplic-imsic-null  # from con=
fig=2Eyaml
> +        expect:                                    # console index -> s=
tring(s)
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
> +from =2E=2Epaths import resolve_path
> +from =2E=2Econfig import MachineConfig, required_keys
> +from =2E=2Eqtb_test import TIMEOUT_DEFAULT, RiscvQtbTest
> +from =2E=2Emachine import RiscvTestMachine
> +
> +logger =3D logging=2EgetLogger(__name__)
> +
> +TYPE_ID: str =3D "console-test"
> +
> +CONFIG_FILE_DEFAULT: str =3D "console_test/console-test=2Eyaml"
> +DESCRIPTION_DEFAULT: str =3D "Assert expected string(s) are printed on =
the Xen console"

"DESCRIPTION_DEFAULT", do you mean it can be changed?

Just curious, is there a reason to have TYPE_ID and DESCRIPTION_DEFAULT
instead of adding the string directly in the class? (That is not using
TYPE_ID at all)=2E


> +ATTEMPTS_DEFAULT: int =3D 3
> +
> +XEN_CONS_IDX: int =3D 0

It could be useful to have a description for XEN_CONS_IDX=2E

> +
> +
> +class ConsoleTest(RiscvQtbTest):
> +    type_id: ClassVar[str] =3D TYPE_ID
> +    description: ClassVar[str] =3D DESCRIPTION_DEFAULT
> +    config_file: ClassVar[str] =3D CONFIG_FILE_DEFAULT
> +
> +    def __init__(self, raw: dict, test_name: str) -> None:
> +        self=2Ename, self=2Edata, self=2Emachine =3D self=2E_parse_test=
_cfg(raw, test_name)
> +
> +        self=2Eexpect =3D self=2Edata["expect"]  # expected console str=
ing
> +
> +        self=2Etimeout =3D int(self=2Edata=2Eget("timeout", TIMEOUT_DEF=
AULT))
> +        if self=2Etimeout < 1:
> +            raise ValueError("timeout < 1, must be at least 1")
> +
> +        self=2Eattempts =3D int(self=2Edata=2Eget("attempts", ATTEMPTS_=
DEFAULT))
> +        if self=2Eattempts < 1:
> +            raise ValueError("attempts < 1, must be at least 1")
> +
> +    @staticmethod
> +    def _load_yaml(path) -> dict:
> +        return yaml=2Esafe_load(resolve_path(path)=2Eread_text())

This method looks out-of place, it doesn't interact with ConsoleTest at
all=2E It could be a generic util/tool=2E Or not exist a all and let the
main create a `dict` from a yaml and git that `dict` to ConsoleTest to
initialise itself, which is already how ConsoleTest is initialised
curently anyway=2E

> +
> +    @classmethod
> +    def from_config(cls, config_file: str, test_name: str) -> ConsoleTe=
st:
> +        return cls(cls=2E_load_yaml(config_file), test_name)
> +
> +    @staticmethod
> +    @required_keys("test_data", {"machine", "expect"})
> +    def _parse_test_data(
> +        machine_catalog: str, test_data: dict, test_name: str
> +    ) -> tuple[str, dict, MachineConfig]:
> +        """Parse test data dictionary"""
> +        test_machine =3D MachineConfig=2Efrom_config(machine_catalog, t=
est_data["machine"])
> +
> +        def invalid(why: str) -> ValueError:
> +            return ValueError(
> +                f"test {test_name!r}: {why}; expected "
> +                f"{{{XEN_CONS_IDX}: ['str1', 'str2', =2E=2E=2E]}}"
> +            )
> +
> +        expect =3D test_data["expect"]
> +        if not isinstance(expect, dict) or expect=2Ekeys() !=3D {XEN_CO=
NS_IDX}:
> +            raise invalid(
> +                f"expect must map console index {XEN_CONS_IDX} (Xen's o=
wn "
> +                f"console, the only one) and nothing else, got {expect!=
r}"
> +            )
> +        strings =3D expect[XEN_CONS_IDX]
> +        if not isinstance(strings, list):
> +            raise invalid(
> +                f"{ConsoleTest=2Econfig_file} expects a list of string(=
s), "
> +                f"got {type(strings)=2E__name__}"
> +            )
> +        if not strings:
> +            raise invalid("Xen has no expected string")
> +        if not all(isinstance(s, str) and s for s in strings):
> +            raise invalid(f"Xen expects non-empty strings, got {strings=
!r}")
> +        return (test_name, test_data, test_machine)
> +
> +    @staticmethod
> +    @required_keys("raw", {"machine_catalog", "tests"})
> +    def _parse_test_cfg(raw: dict, test_name: str) -> tuple[str, dict, =
MachineConfig]:
> +        """Read the config: return the named test dict and its machine=
=2E"""
> +
> +        tests =3D raw["tests"]
> +        if test_name not in tests:
> +            known =3D ", "=2Ejoin(sorted(tests)) or "(none)"
> +            raise ValueError(f"unknown test {test_name!r}; known tests:=
 {known}")
> +
> +        test_data =3D tests[test_name]
> +        return ConsoleTest=2E_parse_test_data(
> +            raw["machine_catalog"], test_data, test_name
> +        )
> +
> +    @staticmethod
> +    def list_tests(config_file: str) -> list[str]:
> +        tests =3D ConsoleTest=2E_load_yaml(config_file)=2Eget("tests")
> +        if not tests:
> +            logger=2Ewarning("no 'tests' key found in %s", config_file)
> +            return []
> +        return list(tests)
> +
> +    @staticmethod
> +    def _console(vm: RiscvTestMachine):
> +        """Xen's own console (con0)=2E"""
> +        if vm=2Econsole is None:
> +            raise RuntimeError("Xen console not wired up, machine not l=
aunched?")
> +        return vm=2Econsole
> +
> +    def run(self, vm: RiscvTestMachine) -> None:
> +        cons =3D self=2E_console(vm)
> +        for strings in self=2Eexpect=2Evalues():
> +            for s in strings:
> +                self=2E_expect_string(cons, s)
> +
> +    def _expect_string(self, cons, expected: str) -> None:

Shouldn't `cons` have a type?

> +        """Wait for `expected` on the console, retrying on timeout=2E""=
"
> +        for attempt in range(self=2Eattempts):
> +            try:
> +                cons=2Eexpect_exact(expected, timeout=3Dself=2Etimeout)
> +                return
> +            except pexpect=2ETIMEOUT:
> +                if attempt =3D=3D self=2Eattempts - 1:
> +                    raise

I don't understand the point of this function=2E
Why to we retry the `grep` on a timeout? Why is the original asked
timeout multiplied by "attempts" ? (which is effectively what is
happening here, more or less)

Also, raising `pexpect=2ETIMEOUT` might not be the exception to throw=2E A
new set of exception dedicated for the Test* classes might be better,
and could easily been catch in the main function that run all the tests
(without having to import unrelated module like `pexpect`)=2E

> diff --git a/automation/scripts/qtb/riscv/dt=2Epy b/automation/scripts/q=
tb/riscv/dt=2Epy
> new file mode 100644
> index 0000000000=2E=2Ef0376979e5
> --- /dev/null
> +++ b/automation/scripts/qtb/riscv/dt=2Epy
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: GPL-2=2E0-only
> +"""Device tree (DT) handling: compile a =2Edts source into a =2Edtb"""
> +
> +from __future__ import annotations
> +
> +import logging
> +import subprocess
> +from pathlib import Path
> +
> +logger =3D logging=2EgetLogger(__name__)
> +
> +
> +def _compile_dts(src: Path, out: Path):
> +    """Run dtc to compile =2Edts `src` into the =2Edtb file at `out`"""
> +    try:
> +        p =3D subprocess=2Erun(
> +            ["dtc", "-I", "dts", "-O", "dtb", "-o", str(out), str(src)]=
,
> +            check=3DTrue,
> +            capture_output=3DTrue,
> +            text=3DTrue,
> +        )
> +        logger=2Edebug("dtc %s: stdout: %s stderr: %s", src, p=2Estdout=
, p=2Estderr)
> +
> +    except FileNotFoundError as e:
> +        raise RuntimeError("dtc not found in PATH; install device-tree-=
compiler") from e
> +    except subprocess=2ECalledProcessError as e:
> +        raise RuntimeError(
> +            f"dtc failed on {str(src)!r} (exit {e=2Ereturncode}):\n"
> +            f" stdout: {e=2Estdout}\n stderr: {e=2Estderr}"
> +        ) from e
> +
> +
> +def compile_to_dtb(src: Path, out: Path) -> Path:
> +    """
> +    Compile a =2Edts source to a =2Edtb under out dir and return the =
=2Edtb path=2E
> +
> +    Raises FileNotFoundError if `src` or `out` don't exist=2E
> +    """
> +    if not src=2Eexists():
> +        raise FileNotFoundError(
> +            f"Device tree source {str(src)!r} not found"
> +        )
> +
> +    if not out=2Eexists():
> +        raise FileNotFoundError(f"Device Tree output dir: {out} doesn't=
 exist")
> +
> +    dtb =3D out / (src=2Estem + "=2Edtb")
> +    _compile_dts(src, dtb)
> +    return dtb
> +
> +
> +def write_dts(text: str, name: str, out_dir: Path) -> Path:
> +    """Write generated =2Edts text to <out_dir>/<name>=2Edts; return it=
s path=2E"""
> +    src =3D out_dir / f"{name}=2Edts"
> +    src=2Eparent=2Emkdir(parents=3DTrue, exist_ok=3DTrue)
> +    src=2Ewrite_text(text)
> +    return src

I don't like this function, it doesn't do anything related to device
tree=2E It's just a generic that allow to write any text to a file in any
directory, even non existing ones, as long as the filename ends with =2E"d=
ts"=2E
I think whatever is calling this function should deal with the filename
and the directory=2E And that caller should probably write to an existing
directory=2E


> diff --git a/automation/scripts/qtb/riscv/machine=2Epy b/automation/scri=
pts/qtb/riscv/machine=2Epy
> new file mode 100644
> index 0000000000=2E=2E74a05dfc82
> --- /dev/null
> +++ b/automation/scripts/qtb/riscv/machine=2Epy
> @@ -0,0 +1,57 @@
> +
> +    def _resolve_binary(self) -> str:
> +        return str(resolve_from_path(self=2Eqemu_bin))

Nothing is using that function=2E (In that patch at least)

> diff --git a/automation/scripts/qtb/riscv/paths=2Epy b/automation/script=
s/qtb/riscv/paths=2Epy
> new file mode 100644
> index 0000000000=2E=2E237f1bf502
> --- /dev/null
> +++ b/automation/scripts/qtb/riscv/paths=2Epy

I don't like this module=2E Maybe some of those functions here could be
move to the qtb package instead, and rename the module "utils" or
"tools" or something else generic=2E Because nothing here is riscv
specific=2E

> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: GPL-2=2E0-only
> +"""Path helpers: resolve pkg-relative paths=2E"""
> +
> +from __future__ import annotations
> +
> +import os
> +import shutil
> +import tempfile
> +from functools import lru_cache
> +from pathlib import Path
> +
> +# Every relative path in this module is resolved against this base=2E
> +_BASE =3D Path(__file__)=2Eresolve()=2Eparent
> +
> +# Build artifacts, overridable for CI=2E
> +_BINARIES_BASE =3D Path(os=2Eenviron=2Eget("QTB_BINARIES_DIR") or _BASE=
 / "binaries")

_BINARIES_BASE is misplaced I think, as it's buried deep into the
modules=2E I would rather have the location of the "binaries" been set
from the start by the main script, then give the path to the classes
that needs it=2E

Also, having the "binaries" directory location in a envvar is a nice
idea, but can it be renamed to be more generic for the CI ?
Something like "XEN_CI_BINARIES_DIR"=2E Because this is a variable that
contained shared information between the jobs that build xen and other,
and jobs that run tests=2E

> +
> +
> +@lru_cache(maxsize=3D1)
> +def _temp_dir_handle() -> tempfile=2ETemporaryDirectory:
> +    return tempfile=2ETemporaryDirectory(prefix=3D"qtb-")
> +
> +
> +def temp_dir() -> Path:
> +    """Process-wide scratch dir for generated/compiled artifacts (singl=
eton)=2E"""
> +    return Path(_temp_dir_handle()=2Ename)
> +
> +
> +def cleanup_temp_dir() -> None:
> +    """Remove the scratch dir, if one was created, and clear the cache=
=2E"""
> +    if _temp_dir_handle=2Ecache_info()=2Ecurrsize:
> +        _temp_dir_handle()=2Ecleanup()
> +        _temp_dir_handle=2Ecache_clear()
> +
> +
> +def resolve_path(file_name: str) -> Path:
> +    """Resolve `file_name` against _BASE, absolute paths pass through=
=2E"""
> +    return _resolve_under(file_name, _BASE)
> +
> +
> +def resolve_binary(file_name: str) -> Path:
> +    """Resolve a build artifact against _BINARIES_BASE, absolute paths =
pass through=2E"""
> +    return _resolve_under(file_name, _BINARIES_BASE)
> +
> +
> +def resolve_from_path(file_name: str) -> Path:
> +    """Resolve an executable on $PATH, absolute paths pass through=2E""=
"
> +    path =3D shutil=2Ewhich(file_name)
> +    if not path:
> +        raise FileNotFoundError(f"cannot resolve {file_name!r}: not an =
executable on $PATH")
> +    return Path(path)
> +
> +
> +def _resolve_under(file_name: str, base: Path) -> Path:
> +    """Resolve `file_name` against `base`, absolute paths pass through=
=2E"""
> +    p =3D Path(file_name)
> +    path =3D p if p=2Eis_absolute() else base / p
> +    if not path=2Eexists():
> +        raise FileNotFoundError(f"cannot resolve {str(path)!r}: does no=
t exist")
> +    return path
> diff --git a/automation/scripts/qtb/riscv/qtb_test=2Epy b/automation/scr=
ipts/qtb/riscv/qtb_test=2Epy
> new file mode 100644
> index 0000000000=2E=2E872fbc2fa9
> --- /dev/null
> +++ b/automation/scripts/qtb/riscv/qtb_test=2Epy
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: GPL-2=2E0-only
> +"""Abstract base for the qtb riscv64 test types=2E
> +
> +A test type is a RiscvQtbTest subclass owning a config file that descri=
bes its
> +tests, each bound to a machine from the shared catalog=2E
> +"""
> +
> +from __future__ import annotations
> +
> +from abc import ABC, abstractmethod
> +from typing import ClassVar
> +
> +from =2Econfig import MachineConfig
> +from =2Emachine import RiscvTestMachine
> +
> +# Default per-test timeout (seconds)
> +TIMEOUT_DEFAULT: int =3D 120
> +
> +
> +class RiscvQtbTest(ABC):
> +    """One runnable test bound to the machine it boots=2E
> +
> +    A subclass sets `type_id`, `description`, and `config_file`, and im=
plements
> +    `from_config` to parse its config file, `list_tests` to enumerate t=
he tests
> +    it declares, and `run` to drive the test logic=2E
> +    """
> +
> +    # Set by each concrete subclass=2E
> +    type_id: ClassVar[str] =3D ""
> +    # One-line summary of what the type does, shown in the CLI help=2E
> +    description: ClassVar[str] =3D ""
> +    # Config file the type reads its tests from, resolved pkg-relative=
=2E
> +    config_file: ClassVar[str] =3D ""
> +
> +    # Set by the subclass parser=2E
> +    name: str
> +    data: dict
> +    machine: MachineConfig
> +    timeout: int =3D TIMEOUT_DEFAULT
> +
> +    @classmethod
> +    @abstractmethod
> +    def from_config(cls, config_file: str, test_name: str) -> RiscvQtbT=
est:
> +        """Build the test named `test_name` from `config_file`=2E"""
> +
> +    @staticmethod
> +    @abstractmethod
> +    def list_tests(config_file: str) -> list[str]:
> +        """Return the names of every test declared in the config file=
=2E"""

It's nice to have an abstract class, but can't we implement some
methods like `list_tests()` here? Otherwise, it's likely that the same
exact function is going to be duplicated in every kind of tests=2E

> +    @abstractmethod
> +    def run(self, vm: RiscvTestMachine) -> None:
> +        """Drive the running machine and assert the expected result=2E"=
""
> diff --git a/automation/scripts/qtb/riscv/xen_dt=2Epy b/automation/scrip=
ts/qtb/riscv/xen_dt=2Epy
> new file mode 100644
> index 0000000000=2E=2E8881b01b36
> --- /dev/null
> +++ b/automation/scripts/qtb/riscv/xen_dt=2Epy
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: GPL-2=2E0-only
> +"""Build the Xen host device tree for a MachineConfig=2E

It feels like both module `dt=2Epy` and `xen_dt=2Epy` could be in the same
module, with something that takes a templates and parameters, and
generate a DTB=2E

But, seen that xen_dt access directly MachineConfig, maybe all the
functions dealing with the device tree could be in the same file as
the one declaring MachineConfig, or =2E

> +
> +The tree is rendered from its Jinja2 template (dts/qemu-host=2Edts=2Ej2=
), which
> +takes the hart count, the Xen MMU type and the Xen command line, then c=
ompiled
> +to a DTB with dtc=2E
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
> +from =2Epaths import resolve_path, temp_dir
> +from =2Edt import compile_to_dtb, write_dts
> +
> +if TYPE_CHECKING:  # config imports this module, so only import it for =
typing=2E
> +    from =2Econfig import MachineConfig
> +
> +# Directory holding the Jinja2 platform device tree templates=2E
> +_DTS_DIR =3D "dts"

Instead of having this hidden variable, how about making it part of the
config file? With full path, that is probably relative to the config
file location=2E

> +
> +
> +@dataclass(frozen=3DTrue)
> +class DeviceTree:
> +    """Compiled device trees for one machine launch=2E"""
> +
> +    dts: Path
> +    dtb: Path

Is there any reason to keep the path to the dts? It doesn't seems to be
ever used=2E

> +
> +
> +@lru_cache(maxsize=3D1)
> +def _env() -> Environment:
> +    return Environment(
> +        loader=3DFileSystemLoader(resolve_path(_DTS_DIR)),
> +        keep_trailing_newline=3DTrue,
> +    )
> +
> +
> +def _render_xen_dts(machine: MachineConfig) -> str:
> +    """Render the Xen host device tree source text for `machine`=2E"""
> +    tmpl =3D _env()=2Eget_template("qemu-host=2Edts=2Ej2")

Same remark as for _DTS_DIR, "qemu-host=2Edts=2Ej2" could just be part of
the path to the dts on a config file=2E

> +    return tmpl=2Erender(
> +        ncpus=3Dmachine=2Epcpu,
> +        mmu_type=3Dmachine=2Emmu_type,
> +        xen_bootargs=3Dmachine=2Exen_bootargs,
> +    )
> +
> +
> +def build_xen_device_tree(machine: MachineConfig) -> DeviceTree:
> +    """Compile `machine` device tree into the shared scratch dir=2E"""
> +    out =3D temp_dir()
> +    dts: Path =3D write_dts(_render_xen_dts(machine), machine=2Ename, o=
ut)
> +    dtb: Path =3D compile_to_dtb(dts, out)
> +    return DeviceTree(dts=3Ddts, dtb=3Ddtb)
>=20


There's something I haven't really talked about yet, and maybe it's too
much changes=2E I've had in mind that the main script
"qemu_smoke_riscv64=2Epy" could run all the available tests (or even just
all the tests of a single kind/type) and report the result=2E This would
change a bit how the different Test classes are instantiated=2E

It might actually be better for several reason to run all tests at once=2E
- It's a single job in the pipeline=2E
    - which mean, all the time spent to start a new container, cloning
      the xen tree, downloading the artefacts, cleanup; would be done a
      single time, and all those step likely takes a lot more time that
      the execution of the test=2E
    - adding a test is easier, there's a single file to edit, and it's
      automatically picked up=2E No need to also edit the pipeline as well=
=2E
    - well, it could be a single job per kind of test, or a single job
      overall=2E But one job per kind of test is probably better=2E
- It's easier to run the all the tests locally, just a single command=2E

Having a single job in the pipeline doesn't prevent from having the
result of a single test easily available, for example all the
"*-tools-test-*" jobs generate a `tests-junit=2Exml` and you can see the
result in the gitlab WebUI, for example:
https://gitlab=2Ecom/xen-project/hardware/xen/-/pipelines/2994120991/test_=
report


I hope all my comments make sense, and would make the framework better=2E

Cheers,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.27b.80311203c4ee5755.1a181ea8968.a971603a2cf41c40=---

