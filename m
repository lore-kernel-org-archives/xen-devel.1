Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B950C606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 17:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=S+a3y6YD
Received: from list by lists.xenproject.org with outflank-mailman.1463486.1674337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM79a-0002cz-Pi; Wed, 28 Oct 2026 17:09:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463486.1674337; Wed, 28 Oct 2026 17:09:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM79a-0002cs-M1; Wed, 28 Oct 2026 17:09:34 +0000
Received: by outflank-mailman (input) for mailman id 1463486;
 Wed, 28 Oct 2026 17:09:32 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1837cf5ff000f79f@swg.vates.tech>)
 id 1xM79Y-0002cJ-7h
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 17:09:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xM79X-008NPo-Bg
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 18:09:31 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1837cf5ff000f79f@swg.vates.tech>)
 id 6ae22c23-8faa-0a2a0a5109dd-0a2a4502e2f4-30
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 18:09:31 +0100
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1837cf5ff000f79f@swg.vates.tech>)
 id 6ae22c4a-6ca4-0a2a45020019-b9ff1c1291c3-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 18:09:31 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1837cf5ff000f79f.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 28 Oct 2026 17:09:27 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5194C82C5C;
 Wed, 28 Oct 2026 18:09:26 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=6L/hueQJbBKX0kvzY/pAWcQ+34OJLdrKc9wGZ5upqcM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=S+a3y6YD8zOv4RLLJc0F3YdBX6MtQxwORmIG3/6jl1qM0YH4qPF3llp+683o8h7dLK8U/E1bW
 A8aDyyd7yg0YvQS/L6tbwAKLCP0UhWRGm7QZyRohJWG6tXPkzYtUpWPxN/9+5fQh9keVRfS82GT
 sB8l13xpWmzbsgl6ST/kN4399tkRf2Fq+gW0JrAcTI6nDGFFncgLSfStVNHBcy7GySsQEbgFfpf
 xWIZ05IPSb3o6ekBMDytEEWQA4GXjLhillvdgoiqEzfHmPWt8g4TLkictNBbZfIDh05hVLAgfU7
 V0F9Arv9jXgxvydyC7sNlltvObMf41IarTL/KSQQO21w==
X-Zone-Loop: df92b822182eaa357a0475cb90475795a54d4ff4bb1f
x-campaign-type: default
x-transaction-id: b2c72bdb-23a6-431e-93ab-104bb75e0b08
x-swg-uid: 01-5dc67000-a0e9-4fd6-959a-a8be4829785e
X-Mailer: Sweego
Message-ID:
 <1793207367.8631fc262581453bbf619ec5b2062170.1a1837cf5ff000f79f@vates.tech>
x-swg-bid: 1793207367.8631fc262581453bbf619ec5b2062170.1a1837cf5ff000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 3/6] automation/qtb: add Python QTB framework with
 the console-test type
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <1793180994.8631fc262581453bbf619ec5b2062170.1a181ea8c1d000f79f@vates.tech>
References: <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech>
 <1787823788.8631fc262581453bbf619ec5b2062170.1a0429a1248000c4f3@vates.tech>
 <1793180994.8631fc262581453bbf619ec5b2062170.1a181ea8c1d000f79f@vates.tech>
Date: Wed, 28 Oct 2026 18:09:20 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793207361; l=17954;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=0IoXOGAiLq08vJDn/DmoYnwhMNTOY/UXL05QGxKvh4M=;
 b=hwOFKgj7Gg9bBhJ0IWnv6Carj2mUW+rVr9gHhHHgL16qtbMG/F82YQ7t2ynZzSoziC+Kn5ssR
 AefL6xul9xBBjHr2FBKgHfMvaVyJyJtdKfYdiI/3zWXaQMKCnQWH01d
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793207366440
X-purgate-ID: tlsNG-720697/1793207371-F12A12AC-FFCEF6AB/0/0
X-purgate-type: clean
X-purgate-size: 17954
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-28 10:49 +0100, Anthony PERARD wrote:
> On Thu, Aug 27, 2026 at 11:42:49AM +0200, Baptiste Le Duc wrote:
> > diff --git a/automation/scripts/qemu_smoke_riscv64.py b/automation/scripts/qemu_smoke_riscv64.py
> > new file mode 100755
> > index 0000000000..f338fafcc2
> > --- /dev/null
> > +++ b/automation/scripts/qemu_smoke_riscv64.py
> > @@ -0,0 +1,122 @@
> > +#!/usr/bin/env python3
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +"""CLI launcher for the qtb riscv64 dom0less tests.
> > +
> > +The test type comes first (e.g. `console-test`), then a command. Each type
> > +reads its own config file, which ships with the type.
> > +
> > +Commands:
> > +    list  Print every test the type defines in the config, then exit.
> > +    run   Boot one test's machine under QEMU and drive it to a pass/fail
> > +          verdict.
> > +
> > +Usage:
> > +    ./qemu_smoke_riscv64.py console-test list
> > +    ./qemu_smoke_riscv64.py console-test run dom0less-1smp-0domu-1vcpu-aplic-imsic-null

Thanks for the review!

> Can we change the usage a bit?
> I would put `list` and `run` (the command) as first possitionnal
> argument.
>
> `list` would list all types of tests, if alone on the command line.
> And `list console-test` would list all tests associated with this kind.

Done in v3: `list <type>` and `run <type> [test...]`. Without a test
name, `run` runs every test of the type (see your last remark).

>
> As for the comment of this file, it doesn't feel useful as it is. It's
> currently a very verbose way to try to explain how to use the command
> line, it doesn't explain everything, "usage" is actually just few
> "examples", and I don't think one would look here to find out how to use
> it, when running the script with `-h` can print something more standard.
>
> I guess here you could explain that tests from a config.yaml will be run
> under qemu, with different parameter for the machine and different tests
> to run.

Done in v3.
> [ ... 16 lines skipped ... ]
> > +def _run_test(test: RiscvQtbTest, log_dir: str | None) -> int:
> > +    """Compile the machine's device trees, boot it, and run the test."""
> > +    vm = RiscvTestMachine(test.machine, timeout=test.timeout, log_dir=log_dir)
> 
> Naming that `vm` might be a be counter intuitive. Especially if you
> intend to have nested VM later. My guess, `host` or `machine` would be a
> bit better.

Renamed `machine` in v3.
> [ ... 18 lines skipped ... ]
> > +def main(argv: Sequence[str] | None = None) -> int:
> > +    ns = setup_parser().parse_args(argv)
> > +    logging.basicConfig(
> > +        level=logging.DEBUG if ns.verbose else logging.WARNING, format="%(message)s"
> > +    )
> > +    try:
> > +        return ns.func(ns)
> > +    except Exception as exc:
> > +        logger.debug(format_exc())
> > +        frame = extract_tb(exc.__traceback__)[-1]
> > +        print(f"{frame.filename}:{frame.lineno}: {exc}")
> > +        return 2
> > +    finally:
> > +        cleanup_temp_dir()
> 
> This cleanup_temp_dir() is out of place, when `main()` doesn't create
> this temporary dir. Instead you could have the main prepare an
> environment, create temporary directories, and give that to the test
> classes, and that in turn would justify to do the cleanup here.

Done in v3: main() creates the temporary directory and passes it down in
a new QtbEnv dataclass (qtb/env.py). The temp_dir helpers are gone.
> 
> > +
> > +
> > +if __name__ == "__main__":
> > +    sys.exit(main())
> > diff --git a/automation/scripts/qtb/riscv/config.py b/automation/scripts/qtb/riscv/config.py
> > new file mode 100644
> > index 0000000000..b5068d6bfb
> > --- /dev/null
> > +++ b/automation/scripts/qtb/riscv/config.py
> > @@ -0,0 +1,119 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +"""YAML config parser for qtb-based Xen riscv64 tests.
> > +
> > +Parsing steps:
> > +    - validate the YAML
> > +    - build the dataclasses: the host device tree is compiled on first use
> > +      of MachineConfig.dt
> > +"""
> > +
> > +from __future__ import annotations
> > +
> > +import functools
> > +import inspect
> > +from dataclasses import dataclass
> > +from functools import cached_property
> > +from pathlib import Path
> > +
> > +import yaml
> > +
> > +from .paths import resolve_binary, resolve_path
> > +from .xen_dt import DeviceTree, build_xen_device_tree
> > +
> > +XEN_MMU_TYPE_DEFAULT: str = "sv48"
> > +XEN_BOOTARGS_DEFAULT: str = ""
> > +
> > +MACHINE_MEMORY: int = 2048
> 
> That feels like a lot, how about just 512MB? Or do you need 2GB for the
> tests? And why isn't it called *_DEFAULT like other parameters?

512MB is enough, changed in v3. It's not *_DEFAULT because it isn't
configurable.

>
> > +MACHINE_INTERRUPT_CONTROLLER: str = "aplic-imsic"
>
> This isn't used here, in `config.py`. Either
> MACHINE_INTERRUPT_CONTROLLER doesn't need to exist, or it should be
> added to MachineConfig.

Both moved into MachineConfig in v3 (MEMORY, INTERRUPT_CONTROLLER).
> [ ... 50 lines skipped ... ]
> > +++ b/automation/scripts/qtb/riscv/config.yaml
> > @@ -0,0 +1,17 @@
> > +# Shared config for the qtb riscv64 tests
> > +#
> > +# A machine is the test-agnostic description of what to boot (cpus, Xen command
> > +# line). Test YAMLs (e.g. console-test.yaml) pick a machine by name and layer
> > +# their own parameters on top.
> > +#
> > +# Path resolution (see paths.py): `binaries:` entries resolve against
> > +# $QTB_BINARIES_DIR env var if defined else `binaries`. Absolute paths used
> > +# as-is.
> > +
> > +binaries:
> > +  xen:      xen
> > +
> > +machines:
> > +  dom0less-1smp-0domu-1vcpu-aplic-imsic-null:
> > +    xen_bootargs: "sched=null"
> 
> There's a document describing the Xen command line in the xen tree. It
> is composed of parameters and options. Also `xl info` calls it
> `xen_commandline`. While I understand "bootargs", can we rename that to
> something more comment in this context? That is "xen_cmdline" or
> "xen_commandline".

Renamed xen_commandline in v3.

>
>
> > diff --git a/automation/scripts/qtb/riscv/console_test/console-test.yaml b/automation/scripts/qtb/riscv/console_test/console-test.yaml
> > new file mode 100644
> > index 0000000000..cec0edc510
> > --- /dev/null
> > +++ b/automation/scripts/qtb/riscv/console_test/console-test.yaml
> > @@ -0,0 +1,18 @@
> 
> Would it be possible to merge this config file into the main one? That
> is "config.yaml". I think having a single config file for the whole test
> suite would be easier to manage going forward. It would be easier to
> look at a single files instead of looking for files in multiple
> locations. Then we can just tell the main script which config file to
> use, and the different class of tests won't have to guess where their
> config file is.

Done in v3: single config.yaml, one top-level section per test type
(`console-test:`), loaded once by the main script.

> [ ... 15 lines skipped ... ]
> > +tests:
> > +  dom0less-1smp-0domu-1vcpu-aplic-imsic-null:
> > +    machine: dom0less-1smp-0domu-1vcpu-aplic-imsic-null
> > +    expect:
> > +      0: ["All set up"]
> 
> I wonder if configuring the machine here instead of in a separated array
> wouldn't make more sense. The string
> "dom0less-1smp-0domu-1vcpu-aplic-imsic-null" is duplicated three time.
> If instead we had:
>     
>     tests:
>       dom0less-1smp-0domu-1vcpu-aplic-imsic-null:
>         machine:
>             pcpu: 1
>             xen_bootargs: "sched=null"
>         expect:
>           0: ["All set up"]

Done in v3. The separate catalog was meant to share machines across
test types, but I think with a single config.yaml YAML anchors could cover that.
> [ ... 42 lines skipped ... ]
> > +CONFIG_FILE_DEFAULT: str = "console_test/console-test.yaml"
> > +DESCRIPTION_DEFAULT: str = "Assert expected string(s) are printed on the Xen console"
> 
> "DESCRIPTION_DEFAULT", do you mean it can be changed?
> 
> Just curious, is there a reason to have TYPE_ID and DESCRIPTION_DEFAULT
> instead of adding the string directly in the class? (That is not using
> TYPE_ID at all).

No strong reason, strings are inlined in the class in v3.

> [ ... 3 lines skipped ... ]
> > +XEN_CONS_IDX: int = 0
>
> It could be useful to have a description for XEN_CONS_IDX.

Done in v3.
> [ ... 21 lines skipped ... ]
> > +    @staticmethod
> > +    def _load_yaml(path) -> dict:
> > +        return yaml.safe_load(resolve_path(path).read_text())
> 
> This method looks out-of place, it doesn't interact with ConsoleTest at
> all. It could be a generic util/tool. Or not exist a all and let the
> main create a `dict` from a yaml and git that `dict` to ConsoleTest to
> initialise itself, which is already how ConsoleTest is initialised
> curently anyway.

Agreed, both from_config() and _load_yaml() dropped in v3: main loads
the YAML and passes the dict directly to __init__().
> [ ... 74 lines skipped ... ]
> > +    def _expect_string(self, cons, expected: str) -> None:
> 
> Shouldn't `cons` have a type?

Yes, GuestConsoleSession in v3.
> 
> > +        """Wait for `expected` on the console, retrying on timeout."""
> > +        for attempt in range(self.attempts):
> > +            try:
> > +                cons.expect_exact(expected, timeout=self.timeout)
> > +                return
> > +            except pexpect.TIMEOUT:
> > +                if attempt == self.attempts - 1:
> > +                    raise
> 
> I don't understand the point of this function.
> Why to we retry the `grep` on a timeout? Why is the original asked
> timeout multiplied by "attempts" ? (which is effectively what is
> happening here, more or less)
> 
> Also, raising `pexpect.TIMEOUT` might not be the exception to throw. A
> new set of exception dedicated for the Test* classes might be better,
> and could easily been catch in the main function that run all the tests
> (without having to import unrelated module like `pexpect`).

No good reason, retry dropped in v3.

Agreed for the exception: v3 adds TestFailure; ConsoleTest maps
pexpect.TIMEOUT/EOF to it and main only catches TestFailure.

> [ ... 58 lines skipped ... ]
> > +def write_dts(text: str, name: str, out_dir: Path) -> Path:
> > +    """Write generated .dts text to <out_dir>/<name>.dts; return its path."""
> > +    src = out_dir / f"{name}.dts"
> > +    src.parent.mkdir(parents=True, exist_ok=True)
> > +    src.write_text(text)
> > +    return src
> 
> I don't like this function, it doesn't do anything related to device
> tree. It's just a generic that allow to write any text to a file in any
> directory, even non existing ones, as long as the filename ends with ."dts".
> I think whatever is calling this function should deal with the filename
> and the directory. And that caller should probably write to an existing
> directory.

Dropped in v3: build_dtb() writes <name>.dts into the existing temporary
directory from main(), no mkdir.
> [ ... 9 lines skipped ... ]
> > +    def _resolve_binary(self) -> str:
> > +        return str(resolve_from_path(self.qemu_bin))
> 
> Nothing is using that function. (In that patch at least)

It's a QtbMachine hook, called from QtbMachine.__init__() (same for
_machine_args()). v3 adds a comment on both to make it more clear.
> 
> > diff --git a/automation/scripts/qtb/riscv/paths.py b/automation/scripts/qtb/riscv/paths.py
> > new file mode 100644
> > index 0000000000..237f1bf502
> > --- /dev/null
> > +++ b/automation/scripts/qtb/riscv/paths.py
> 
> I don't like this module. Maybe some of those functions here could be
> move to the qtb package instead, and rename the module "utils" or
> "tools" or something else generic. Because nothing here is riscv
> specific.

Done in v3: paths.py is gone, the generic helpers moved to qtb/utils.py.

> [ ... 7 lines skipped ... ]
> > +import os
> > +import shutil
> > +import tempfile
> > +from functools import lru_cache
> > +from pathlib import Path
> > +
> > +# Every relative path in this module is resolved against this base.
> > +_BASE = Path(__file__).resolve().parent
> > +
> > +# Build artifacts, overridable for CI.
> > +_BINARIES_BASE = Path(os.environ.get("QTB_BINARIES_DIR") or _BASE / "binaries")
> 
> _BINARIES_BASE is misplaced I think, as it's buried deep into the
> modules. I would rather have the location of the "binaries" been set
> from the start by the main script, then give the path to the classes
> that needs it.
> 
> Also, having the "binaries" directory location in a envvar is a nice
> idea, but can it be renamed to be more generic for the CI ?
> Something like "XEN_CI_BINARIES_DIR". Because this is a variable that
> contained shared information between the jobs that build xen and other,
> and jobs that run tests.

Done in v3: main reads $XEN_CI_BINARIES_DIR and passes it in QtbEnv.
CI job updated too.

> [ ... 96 lines skipped ... ]
> > +    @staticmethod
> > +    @abstractmethod
> > +    def list_tests(config_file: str) -> list[str]:
> > +        """Return the names of every test declared in the config file."""
> 
> It's nice to have an abstract class, but can't we implement some
> methods like `list_tests()` here? Otherwise, it's likely that the same
> exact function is going to be duplicated in every kind of tests.
Agreed. In v3 list_tests() is implemented once in RiscvQtbTest.
> [ ... 8 lines skipped ... ]
> > +++ b/automation/scripts/qtb/riscv/xen_dt.py
> > @@ -0,0 +1,58 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +"""Build the Xen host device tree for a MachineConfig.
> 
> It feels like both module `dt.py` and `xen_dt.py` could be in the same
> module, with something that takes a templates and parameters, and
> generate a DTB.
> 
> But, seen that xen_dt access directly MachineConfig, maybe all the
> functions dealing with the device tree could be in the same file as
> the one declaring MachineConfig, or .

Merged in v3: dt.py has a generic build_dtb(template, params, name, out),
and RiscvTestMachine maps its MachineConfig to the params. xen_dt.py is
gone.

> [ ... 21 lines skipped ... ]
> > +# Directory holding the Jinja2 platform device tree templates.
> > +_DTS_DIR = "dts"
> 
> Instead of having this hidden variable, how about making it part of the
> config file? With full path, that is probably relative to the config
> file location.

Done in v3, see below...

> > +
> > +
> > +@dataclass(frozen=True)
> > +class DeviceTree:
> > +    """Compiled device trees for one machine launch."""
> > +
> > +    dts: Path
> > +    dtb: Path
> 
> Is there any reason to keep the path to the dts? It doesn't seems to be
> ever used.

Yes, for debugging: Oleksii asked to keep the .dts in the log dir. v3
drops DeviceTree and copies the .dts into --log-dir when it is set.
> 
> > +
> > +
> > +@lru_cache(maxsize=1)
> > +def _env() -> Environment:
> > +    return Environment(
> > +        loader=FileSystemLoader(resolve_path(_DTS_DIR)),
> > +        keep_trailing_newline=True,
> > +    )
> > +
> > +
> > +def _render_xen_dts(machine: MachineConfig) -> str:
> > +    """Render the Xen host device tree source text for `machine`."""
> > +    tmpl = _env().get_template("qemu-host.dts.j2")
> 
> Same remark as for _DTS_DIR, "qemu-host.dts.j2" could just be part of
> the path to the dts on a config file.

...`host_dts: dts/qemu-host.dts.j2` in config.yaml, resolved
relative to it by main and passed in QtbEnv.

> 
> > +    return tmpl.render(
> > +        ncpus=machine.pcpu,
> > +        mmu_type=machine.mmu_type,
> > +        xen_bootargs=machine.xen_bootargs,
> > +    )
> > +
> > +
> > +def build_xen_device_tree(machine: MachineConfig) -> DeviceTree:
> > +    """Compile `machine` device tree into the shared scratch dir."""
> > +    out = temp_dir()
> > +    dts: Path = write_dts(_render_xen_dts(machine), machine.name, out)
> > +    dtb: Path = compile_to_dtb(dts, out)
> > +    return DeviceTree(dts=dts, dtb=dtb)
> > 
> 
> 
> There's something I haven't really talked about yet, and maybe it's too
> much changes. I've had in mind that the main script
> "qemu_smoke_riscv64.py" could run all the available tests (or even just
> all the tests of a single kind/type) and report the result. This would
> change a bit how the different Test classes are instantiated.
> 
> It might actually be better for several reason to run all tests at once.
> - It's a single job in the pipeline.
>     - which mean, all the time spent to start a new container, cloning
>       the xen tree, downloading the artefacts, cleanup; would be done a
>       single time, and all those step likely takes a lot more time that
>       the execution of the test.
>     - adding a test is easier, there's a single file to edit, and it's
>       automatically picked up. No need to also edit the pipeline as well.
>     - well, it could be a single job per kind of test, or a single job
>       overall. But one job per kind of test is probably better.
> - It's easier to run the all the tests locally, just a single command.
> 
> Having a single job in the pipeline doesn't prevent from having the
> result of a single test easily available, for example all the
> "*-tools-test-*" jobs generate a `tests-junit.xml` and you can see the
> result in the gitlab WebUI, for example:
> https://gitlab.com/xen-project/hardware/xen/-/pipelines/2994120991/test_report

Agreed. In v3 `run <type>` runs all tests of the type, so one job per
type. I'll add a junit report for per-test results.

> I hope all my comments make sense, and would make the framework better.

They do, thanks for your time!

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

