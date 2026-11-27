Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9794606A6BB
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 12:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pAhuk2UB
Received: from list by lists.xenproject.org with outflank-mailman.1504984.1699961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWvGL-0007zH-K1; Fri, 27 Nov 2026 12:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1504984.1699961; Fri, 27 Nov 2026 12:41:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWvGL-0007zA-H1; Fri, 27 Nov 2026 12:41:13 +0000
Received: by outflank-mailman (input) for mailman id 1504984;
 Fri, 27 Nov 2026 12:41:13 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hfranco@baylibre.com>) id 1xWvGK-0007z4-RT
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 12:41:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWvGK-001RYJ-6O
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 13:41:12 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <hfranco@baylibre.com>)
 id 6b097a66-8faa-0a2a0a5109dd-0a2a450cb638-2
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 13:41:12 +0100
Received: from [209.85.221.176] (helo=mail-vk1-f176.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <hfranco@baylibre.com>)
 id 6b097a67-f479-0a2a450c0019-d155ddb0e571-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 13:41:11 +0100
Received: by mail-vk1-f176.google.com with SMTP id
 71dfb90a1353d-5ecda93627eso2575268e0c.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 04:41:11 -0800 (PST)
Received: from localhost ([2804:14c:4c5:8bf0:96eb:98f3:8775:4ebc])
 by smtp.gmail.com with UTF8SMTPSA id
 71dfb90a1353d-5ee8b5bb61asm23658771e0c.10.2026.11.27.04.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2026 04:41:09 -0800 (PST)
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
        d=baylibre.com; s=google; t=1795783270; x=1796388070; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sP7N6jdvSWc/UK0fmgWzOhZaMNAXlydZjdjgOHO2Frs=;
        b=pAhuk2UBUXoWDovggZf2X1AoYVq+szZgWrSiux9Zza+zWc8aJl88DRkjNLpRCUECFw
         QzGcLqln7ICbMW9xpYwxvGRUBzTBSuZLBg6bLxD67x+1kw2nOlA6fYsR/dQgSVkYbFhp
         VZC9T+U7JQVKsWWzNwgt5EHof1t78BSVmvInhLUE2N/lzDdJRtc63xC35QxRZ56IgcR/
         jCmU55A+kMf2MEynDrG9HmKNLzZen9jb2sFOCHgWWfDP+btqHJ2f+JfxI3AfUFuX2ZEc
         8uUl8FNEBt6ST2XeSke+tERMURD1o8KHb3YRACwJvgI/nFYbqOplmtr5cREyojVJcelK
         ngHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795783270; x=1796388070;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sP7N6jdvSWc/UK0fmgWzOhZaMNAXlydZjdjgOHO2Frs=;
        b=sv02WGIhyvoyqnEGUWONEmsPMZE/O10ouFsFIpXRwqL/rpag81VYz1cr+j79mf4epT
         58QznxZ8xFzJBypbs8g9mWLf7W0l2ed798YQoiUT8w/iPzPNqi4oBqocvguO2gs3Xqwo
         UB8whiTECX1GkGj0wq7+Lj7skrl8RbJK5d5ciujBi137cO7IXf/iIICssHJL7rYZYFic
         w50nXZNLwaGwENYDFHsrQ03PXvmPiZm88iXS6vIBtkHArAjgyVaU/D2I6N7jJedt0DHE
         G2zXMjsKaFRf3BuklU3u9+GqPMIqv/xTC4ceizwJxtkQaUyH39e2I6G7StWPoIWfhhjx
         0ixg==
X-Gm-Message-State: APuU4Z97w87WZXor8da6oNqFMsMzCdTeqEeZCjZrzSCCxbR3rT9/XswE
	O0ss+phC+A3UFeF13pKZ8MrNDyU7sc8PjdeQUsiT9A8wAVehlUmeAUvNxQ/iQR1Bx0+ijN7IsBR
	pWaw7
X-Gm-Gg: AZFdTZcdFe02B5Sqm0Lq8h4iVCTE2jEF1jCzGyNBgPfWlRj/ovvsZ+g/eepk3BCsV5Y
	8Me1F6SRnDPNxe/J7p4VpXIQuE0P5xyNM6B6ciXGs/mMgLmKLDSrHFEFexHpKoeTwDPOpJrAtML
	XMUJt6oWjd4/xuj8jxIeZlxy7DmpxNPEGWNUzUfGUO3sZE0g/mMQ/YArmXYj6fBT2GzkgU+nBhl
	AQ98sj/EbtwmGWau2zdnzjUwu/U1mQKQPSOjoal1Az24fU7rfJcBDETJIMLLoQoLNPnA+ePq4ph
	lAtfdLupZsLyjn3GAW1BNRKTT9bt8IaZaPZRD5LqHowtGPVO+1Rc6BIjuFNF1v02OleAaLsJ6cE
	iheTf63zjvH+uC3gIcy4gVBcAjGulogphBCIMPSuKbj/cI2RdCwiRRb/hQ8OJzAB7lwxtO4y1Lg
	nW/O9eDO3UvN0aBkI4JziyWKu4dIB/pIqYIC5QX4lnna+Le6uUnuSo7nu84ptQiESJ5X6DMPd1l
	QCT23hyr38vlugFa2sFMDTaY86N/MM/vRXtlIpVzG0BpPLHHXeK77GzCVgZ+L0GtdKno/fjYcnM
	gXgKz2GGckzyPvChnVJrdXrjQ6vz1JTl7wNDItROOE4NDu7IeoSvrzAA9TLfsF75qGMC2R7S4+j
	Enw4881z9eg==
X-Received: by 2002:a05:6122:4b88:b0:5ca:fc48:5634 with SMTP id 71dfb90a1353d-5ee8aed35femr13347400e0c.11.1795783270283;
        Fri, 27 Nov 2026 04:41:10 -0800 (PST)
Date: Fri, 27 Nov 2026 09:41:06 -0300
From: Hiago De Franco <hfranco@baylibre.com>
To: xen-devel@lists.xenproject.org
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
	Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony PERARD <anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, 
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Alejandro Vallejo <alejandro.garciavallejo@amd.com>, 
	Zhang Zheng <zhangzheng@iscas.ac.cn>
Subject: Re: [PATCH v3 3/6] automation/qtb: add the console-test type with a
 Xen boot test
Message-ID: <bql6ied6comkx3zg7yhhh2ewanvz3exwk2ivyptkhzuehtvzxo@pfe634frei67>
References: <1793714671.8631fc262581453bbf619ec5b2062170.1a1a1b9ce9c000403d@vates.tech/T/#u>
 <1793714906.8631fc262581453bbf619ec5b2062170.1a1a1bd65c3000403d@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1793714906.8631fc262581453bbf619ec5b2062170.1a1a1bd65c3000403d@vates.tech>
X-purgate-ID: tlsNG-d25034/1795783272-5113AA5B-FE4BF2F8/0/0
X-purgate-type: clean
X-purgate-size: 6380
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 03:08:11PM +0100, Baptiste Le Duc wrote:
> Add a first console test, which boots Xen under QEMU and waits for "All set
> up" on its console. It is the equivalent of qemu-smoke-riscv64.sh, with the
> finer control QTB gives, and new configurations are added as test
> parameters instead of new scripts.
> 
> The tests get their machine through the `machine` pytest fixture. A test
> parametrizes the fixture indirectly with the pCPU count, and the fixture
> builds the matching RiscvTestMachine from it, so a new configuration only
> takes a pytest.param() above the test function. The fixture launches QEMU
> before the test body and shuts it down after, so setup problems (missing
> binary, QEMU not starting) are reported as pytest errors and only console
> checks are reported as test failures.
> 
> --binaries-dir gives the directory holding the binaries to boot, and is
> mandatory. --log-dir gives where to keep the QEMU and console logs, one
> <module>/<test> subdirectory per test. The timeout of each expected string
> is 1500 seconds, as in console.exp, overridden by TEST_TIMEOUT_OVERRIDE or
> TEST_TIMEOUT.
> 
> Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

Reviewed-by: Hiago De Franco <hfranco@baylibre.com>

> ---
> Changes in v3:
> - New patch, split out of v2 "automation/qtb: add Python QTB framework
>   with the console-test type".
> - Rework on top of pytest: tests are pytest functions parametrizing the
>   `machine` fixture. The CLI, config.yaml, the per-type YAML files, the
>   test class hierarchy and the attempts/retry logic are gone.
> - Take the binaries and logs directories from --binaries-dir and
>   --log-dir, no environment variable.
> - Take the per-string timeout from TEST_TIMEOUT_OVERRIDE/TEST_TIMEOUT,
>   like console.exp.
> ---
>  automation/scripts/qtb/riscv/tests/__init__.py     |  2 +
>  automation/scripts/qtb/riscv/tests/conftest.py     | 65 ++++++++++++++++++++++
>  automation/scripts/qtb/riscv/tests/test_console.py | 35 ++++++++++++
>  3 files changed, 102 insertions(+)
> 
> diff --git a/automation/scripts/qtb/riscv/tests/__init__.py b/automation/scripts/qtb/riscv/tests/__init__.py
> new file mode 100644
> index 0000000000..24d34ae2d1
> --- /dev/null
> +++ b/automation/scripts/qtb/riscv/tests/__init__.py
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +"""qtb riscv64 tests: boot Xen under QEMU and check what it does."""
> diff --git a/automation/scripts/qtb/riscv/tests/conftest.py b/automation/scripts/qtb/riscv/tests/conftest.py
> new file mode 100644
> index 0000000000..be6c7223a3
> --- /dev/null
> +++ b/automation/scripts/qtb/riscv/tests/conftest.py
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +"""Fixtures booting Xen under QEMU for the qtb riscv64 tests.
> +
> +A test takes the `machine` fixture and parametrizes it indirectly with its
> +pCPU count.
> +"""
> +
> +from __future__ import annotations
> +
> +from pathlib import Path
> +
> +import pytest
> +
> +from qtb.env import QtbEnv
> +from qtb.riscv.machine import HostConfig, RiscvTestMachine
> +
> +def pytest_addoption(parser: pytest.Parser) -> None:
> +    parser.addoption(
> +        "--log-dir",
> +        default=None,
> +        metavar="DIR",
> +        help="Directory for all logs (QEMU process log, qtest and the "
> +        "consoles as con<N>.log), one subdirectory per test. When unset, "
> +        "no logs are written.",
> +    )
> +
> +    parser.addoption(
> +        "--binaries-dir",
> +        default=None,
> +        metavar="DIR",
> +        help="Directory holding the build artifacts (xen, ...) the tests boot.",
> +    )
> +
> +
> +@pytest.fixture
> +def machine(request: pytest.FixtureRequest, qtb_env: QtbEnv):
> +    """The test's machine: QEMU launched."""
> +    if not hasattr(request, "param"):
> +        pytest.fail("machine fixture needs indirect parametrization with the "
> +                    "pCPU count")
> +    machine = RiscvTestMachine(
> +        HostConfig(request.param),
> +        env=qtb_env,
> +    )
> +    with machine:
> +        machine.launch()
> +        yield machine
> +
> +
> +@pytest.fixture
> +def qtb_env(request: pytest.FixtureRequest) -> QtbEnv:
> +    log_dir = request.config.getoption("log_dir")
> +    if log_dir:
> +        # One <module>/<test> subdirectory per test
> +        log_dir = Path(log_dir) / request.node.path.stem / request.node.name
> +        log_dir.mkdir(parents=True, exist_ok=True)
> +
> +    binaries_dir = request.config.getoption("binaries_dir")
> +    if binaries_dir is None:
> +        pytest.fail("no binaries dir: pass --binaries-dir")
> +
> +    return QtbEnv(
> +        binaries_dir=Path(binaries_dir),
> +        log_dir=log_dir,
> +    )
> diff --git a/automation/scripts/qtb/riscv/tests/test_console.py b/automation/scripts/qtb/riscv/tests/test_console.py
> new file mode 100644
> index 0000000000..10169e03a8
> --- /dev/null
> +++ b/automation/scripts/qtb/riscv/tests/test_console.py
> @@ -0,0 +1,35 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +"""Console string expectation tests (console-test).
> +
> +Boot Xen under QEMU and check its console, within the timeout.
> +"""
> +
> +from __future__ import annotations
> +
> +import os
> +
> +import pytest
> +from qemu.qtb import GuestConsoleSession
> +
> +from qtb.riscv.machine import RiscvTestMachine
> +
> +# Per expected string (seconds)
> +TIMEOUT: int = int(
> +    os.environ.get("TEST_TIMEOUT_OVERRIDE") or os.environ.get("TEST_TIMEOUT")
> +    or 1500
> +)
> +
> +
> +def _check_console(console: GuestConsoleSession, expect: list[str]) -> None:
> +    """Assert each string in `expect` is printed on console, in order."""
> +    for s in expect:
> +        RiscvTestMachine.expect_console(console, s, TIMEOUT)
> +
> +
> +def _check_host_boot(machine: RiscvTestMachine) -> None:
> +    _check_console(machine.get_host_console(), ["All set up"])
> +
> +
> +@pytest.mark.parametrize("machine", [pytest.param(1, id="1pcpu")], indirect=True)
> +def test_host_boot(machine):
> +    _check_host_boot(machine)
> 
> -- 
> 2.56.0
> 
> 

-- 
Hiago

