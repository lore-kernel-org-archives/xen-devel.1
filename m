Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D378B606A31C
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 12:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YuYOROk0
Received: from list by lists.xenproject.org with outflank-mailman.1504976.1699952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWvEU-0006V2-8n; Fri, 27 Nov 2026 12:39:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1504976.1699952; Fri, 27 Nov 2026 12:39:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWvEU-0006Uf-6F; Fri, 27 Nov 2026 12:39:18 +0000
Received: by outflank-mailman (input) for mailman id 1504976;
 Fri, 27 Nov 2026 12:39:17 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hfranco@baylibre.com>) id 1xWvES-0006UY-GU
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 12:39:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWvER-001QqF-I2
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 13:39:15 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <hfranco@baylibre.com>)
 id 6b0979ee-e002-0a2a0a5209dd-0a2a4507a07a-16
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 13:39:15 +0100
Received: from [209.85.222.43] (helo=mail-ua1-f43.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <hfranco@baylibre.com>)
 id 6b0979f2-b4ea-0a2a45070019-d155de2bc95f-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 13:39:15 +0100
Received: by mail-ua1-f43.google.com with SMTP id
 a1e0cc1a2514c-99071945aa7so4307066241.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 04:39:14 -0800 (PST)
Received: from localhost ([2804:14c:4c5:8bf0:96eb:98f3:8775:4ebc])
 by smtp.gmail.com with UTF8SMTPSA id
 a1e0cc1a2514c-99e6e08a02asm24462380241.11.2026.11.27.04.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2026 04:39:13 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=baylibre.com header.i="@baylibre.com" header.h="In-Reply-To:Content-Disposition:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795783154; x=1796387954; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HZVsKe7JqFlnRImYC/Oh7YX6TdvVGVOCB8ImmRt9KK0=;
        b=YuYOROk0Kpv0G8MDcq3TBNKQiFEsfIx6yOQVmqerA8Umi1PCzqTW5adp34ro4hlNn9
         qFeWCFZPZPuT4WLDwwQoxIA+AAvConlyDPSu7vLNAMNZzAsBtKSEPwJuMWIkafrj69oy
         1QWXOT1jMgDwoE9/fl2ICmL2XYxamohWGoMHJDCgtKYiJD6HrZfLLANgf2lTn5/y7QS0
         s3mODIZOvFoedCrzK9zWtq4GjmQcPzz1JK1/1JOmzJhOqL+xIznAE0UI7Nbx2lzHg9fO
         8hA4qaaZ3uSchvdBH6rxbl8iPguhqDJevRJtpv5geu87mLUoGQwRpMykVc0/bHmfRSKg
         Nm0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795783154; x=1796387954;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HZVsKe7JqFlnRImYC/Oh7YX6TdvVGVOCB8ImmRt9KK0=;
        b=b5OOBWtIifpPROnxEnqr72DJ23lRf9KXK0p2hAUqdHHQVLRw3h0V7cvuwI91CepbJo
         QZ7NrK+fbYfQo8C9kRmgt3LVgXIvGG7tzGvg1PRC7AF/JdekS0NqOQog9cStgtjTdp7g
         mJkcqBopBKYlGQAmZh6FD76Qto7Vsyj/GrW93yC3mfhI2temyk8D12rXzSjICwFPQ30O
         LfnIOY/pI4/6p5249vQ2dSlFUm92EHcUz7945iv7Oe+aNH7VDculSjU0LjUpWyw8A6lV
         vEie/nYk1Bc3YnflvbQY99uaYDgmV1yalqGUveQrvY/2OEhWEPaJBLom1WtLGFj9FyzJ
         ipcA==
X-Gm-Message-State: APuU4Z+OXHtnKZ1GpsnlmYonEeIFc70kxRqrcbCnN766zIKb2SHVXLhd
	YFVRxPlXTDq1GqLH1nE8DVMzHOxf6wTwUNIOzUafN1aLs6x7BAQLdnUE89mMwveyh5w066Xv2ML
	BXzQC
X-Gm-Gg: AZFdTZfKmL3EKanX6wvcd414IiLMOsDqokWGU/iRG21anYlJNKhU70ULWOEdLSP6Qqb
	bJA/uA2lB7E9yVKyZgLbNwuwhd8P/WLdag6vTf9stGqo6Aees4Vte1cu/YBDcBkKBWcoc3QHdGI
	YVlgzshaoTZ79oH6+GxnvQm2RJv7GrWThTb8NXxyiz6kMsEzv8GBfkqEl+newcbKVSmxwOCgehe
	X6WESh6PEwaYGryTbGDVRwE9ggI6f7BufeTpNZ6PWxIi8aPUANHSNXH4u23EyWKwGiVvantKxJn
	yrlJWHzPAj2nIgiz3NR/LV1uo/93aVQ/ucOSa2VPwUwyqBhNG9jtLLRyt8zeYpTEhHhY8AZ3kJG
	IljO3xMaJL/MzjIMiisrX+0IdPDVwshup55HUn9GhBfsZqkjPtyBSpA5YzFbO3/JC2y3mCQXn1I
	CDZT9b+AqyECED0vGTQbeimZcN0EArKHuvVonO71TX2mBJCMfKiggEIgs36Et8hmcGhtFlWdiE0
	QfmCKoIyxezhur7A9YdVw7asOGUmBxISsbuWUzFGjYOJuDyRdHbv8h+hE1/mw8DyXiZp5AGrU6T
	tLQZHCdqTzEUzipA8q22rFTfYs84F3VUiUynJhg2GxpmezO5eP+csD6prJLB5PuKbLRwoV5yxTj
	e721xyB/H
X-Received: by 2002:a05:6122:3b84:b0:5c9:a60b:e5a6 with SMTP id 71dfb90a1353d-5ee8af7690fmr14887249e0c.17.1795783153725;
        Fri, 27 Nov 2026 04:39:13 -0800 (PST)
Date: Fri, 27 Nov 2026 09:39:10 -0300
From: Hiago De Franco <hfranco@baylibre.com>
To: xen-devel@lists.xenproject.org
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
	Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony PERARD <anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, 
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Alejandro Vallejo <alejandro.garciavallejo@amd.com>, 
	Zhang Zheng <zhangzheng@iscas.ac.cn>
Subject: Re: [PATCH v3 2/6] automation/qtb: add the QTB machine for riscv64
Message-ID: <kmuznww6gj7lek54wy7ipnsrm4zz7yrhievtft55totb2rgzlm@akrm3igohnhz>
References: <1793714671.8631fc262581453bbf619ec5b2062170.1a1a1b9ce9c000403d@vates.tech/T/#u>
 <1793714906.8631fc262581453bbf619ec5b2062170.1a1a1bd641f000403d@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1793714906.8631fc262581453bbf619ec5b2062170.1a1a1bd641f000403d@vates.tech>
X-purgate-ID: tlsNG-ef75cf/1795783155-36CDFAE4-901270F5/0/0
X-purgate-type: clean
X-purgate-size: 7828
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 03:08:10PM +0100, Baptiste Le Duc wrote:
> The QTB (QEMU Test Bench) Python package drives a QEMU process over QMP and
> qtest through QtbMachine, which leaves the QEMU binary (_resolve_binary())
> and the machine part of its command line (_machine_args()) to a subclass.
> 
> Add RiscvTestMachine, the riscv64 implementation of QtbMachine, with:
>   - HostConfig, the test-agnostic description of the host (Xen) to boot:
>     for now, the pCPU count and the RAM size.
>   - The QEMU command line that boots Xen on the virt machine in
>     aia=aplic-imsic mode, using the distribution's qemu-system-riscv64,
>     found in PATH, and the OpenSBI it bundles. Xen is resolved from the
>     binaries directory before QEMU starts, so a missing one fails the
>     test without launching QEMU for nothing.
>   - expect_console() waits for a string on a console and turns a timeout or
>     a closed console into an AssertionError, which pytest reports as a test
>     failure.
>   - Xen's console is mirrored to stdout, so a failing test shows where Xen
>     stopped without fetching its log from the artifacts.
> 
> QtbEnv (qtb/env.py) holds the directories shared by every test, and
> qtb/utils.py holds the generic path helpers.
> 
> Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

Reviewed-by: Hiago De Franco <hfranco@baylibre.com>

> ---
> The machine is unused on its own: the pytest fixture booting it and the
> first test come in the next patch.
> ---
> Changes in v3:
> - New patch, split out of v2 "automation/qtb: add Python QTB framework
>   with the console-test type".
> - Mirror Xen's console to stdout, so pytest shows it in the report of a
>   failing test.
> - Map pexpect timeouts and EOF to AssertionError (a pytest failure)
>   instead of a dedicated TestFailure exception.
> - Keep the host at 2GB.
> - Drop the Jinja2 host device tree.
> ---
>  automation/scripts/qtb/__init__.py       |  2 +
>  automation/scripts/qtb/env.py            | 15 ++++++
>  automation/scripts/qtb/riscv/__init__.py |  2 +
>  automation/scripts/qtb/riscv/machine.py  | 92 ++++++++++++++++++++++++++++++++
>  automation/scripts/qtb/utils.py          | 15 ++++++
>  5 files changed, 126 insertions(+)
> 
> diff --git a/automation/scripts/qtb/__init__.py b/automation/scripts/qtb/__init__.py
> new file mode 100644
> index 0000000000..a0e6e76cb2
> --- /dev/null
> +++ b/automation/scripts/qtb/__init__.py
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +"""QTB (QEMU Test Bench) test frameworks."""
> diff --git a/automation/scripts/qtb/env.py b/automation/scripts/qtb/env.py
> new file mode 100644
> index 0000000000..7887d6af23
> --- /dev/null
> +++ b/automation/scripts/qtb/env.py
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +"""Run environment prepared by the launcher and shared by every test."""
> +
> +from __future__ import annotations
> +
> +from dataclasses import dataclass
> +from pathlib import Path
> +
> +
> +@dataclass(frozen=True)
> +class QtbEnv:
> +    """Directories prepared by the launcher and shared by every test."""
> +
> +    binaries_dir: Path  # Build artifacts (xen, ...) the hosts boot.
> +    log_dir: Path | None = None  # Logs, kept after the run.
> diff --git a/automation/scripts/qtb/riscv/__init__.py b/automation/scripts/qtb/riscv/__init__.py
> new file mode 100644
> index 0000000000..7a0218c73c
> --- /dev/null
> +++ b/automation/scripts/qtb/riscv/__init__.py
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +"""QTB riscv64 test framework package."""
> diff --git a/automation/scripts/qtb/riscv/machine.py b/automation/scripts/qtb/riscv/machine.py
> new file mode 100644
> index 0000000000..1c5e3b0d9e
> --- /dev/null
> +++ b/automation/scripts/qtb/riscv/machine.py
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +"""QtbMachine for riscv64."""
> +
> +from __future__ import annotations
> +
> +import shutil
> +from collections.abc import Sequence
> +from dataclasses import dataclass
> +
> +import pexpect
> +from qemu.qtb import GuestConsoleSession
> +from qemu.qtb import QtbMachine
> +
> +from qtb.env import QtbEnv
> +from qtb.utils import resolve_under
> +
> +
> +@dataclass(frozen=True)
> +class HostConfig:
> +    """The test-agnostic description of what to boot."""
> +
> +    pcpu: int
> +    memory: int = 2048  # MB
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
> +        host_config: HostConfig,
> +        *,
> +        env: QtbEnv,
> +    ) -> None:
> +        self.host = host_config
> +        self.env = env
> +        # Resolved before QEMU starts, so a missing binary fails early.
> +        self.xen = resolve_under("xen", env.binaries_dir)
> +        super().__init__(
> +            memory=self.host.memory,
> +            cpus=self.host.pcpu,
> +            mirror_console=True,
> +            # Default expect timeout
> +            timeout=30,
> +            log_dir=str(env.log_dir) if env.log_dir else None,
> +        )
> +
> +    # Implements QtbMachine._machine_args()
> +    def _machine_args(self, memory: int, cpus: int) -> Sequence[str]:
> +        machine_opt = "virt,aia=aplic-imsic"
> +        cpu_opt = "rv64,svpbmt=on"
> +        return [
> +            "-M",
> +            machine_opt,
> +            "-cpu",
> +            cpu_opt,
> +            "-smp",
> +            str(cpus),
> +            "-m",
> +            str(memory),
> +            "-kernel",
> +            str(self.xen),
> +        ]
> +
> +    # Implements QtbMachine._resolve_binary()
> +    @classmethod
> +    def _resolve_binary(cls) -> str:
> +        qemu = shutil.which(cls.qemu_bin)
> +        if qemu is None:
> +            raise FileNotFoundError(f"{cls.qemu_bin} not found in PATH")
> +        return qemu
> +
> +    def get_host_console(self) -> GuestConsoleSession | None:
> +        return self.console
> +
> +    @staticmethod
> +    def expect_console(
> +        console: GuestConsoleSession, expected: str, timeout: int
> +    ) -> None:
> +        """Wait for `expected` on console and fail if it does not show up
> +        within `timeout`, which overrides the default one from QtbMachine."""
> +        if console is None:
> +            raise RuntimeError("Xen console not wired up, host not launched?")
> +        try:
> +            console.expect_exact(expected, timeout=timeout)
> +        except pexpect.TIMEOUT:
> +            raise AssertionError(f"{expected!r} not seen within {timeout}s") from None
> +        except pexpect.EOF:
> +            raise AssertionError(f"console closed before {expected!r}") from None
> diff --git a/automation/scripts/qtb/utils.py b/automation/scripts/qtb/utils.py
> new file mode 100644
> index 0000000000..cce5936acb
> --- /dev/null
> +++ b/automation/scripts/qtb/utils.py
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +"""Generic helpers shared by the QTB test frameworks."""
> +
> +from __future__ import annotations
> +
> +from pathlib import Path
> +
> +
> +def resolve_under(file_name: str, base: Path) -> Path:
> +    """Resolve `file_name` against `base`, absolute paths pass through."""
> +    p = Path(file_name)
> +    path = p if p.is_absolute() else base / p
> +    if not path.exists():
> +        raise FileNotFoundError(f"cannot resolve {str(path)!r}: does not exist")
> +    return path
> 
> -- 
> 2.56.0
> 
> 

-- 
Hiago

