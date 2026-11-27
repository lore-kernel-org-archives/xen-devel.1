Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438D0606A31E
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 12:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=l1ceSNdg
Received: from list by lists.xenproject.org with outflank-mailman.1504992.1699971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWvHV-0008Su-Sb; Fri, 27 Nov 2026 12:42:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1504992.1699971; Fri, 27 Nov 2026 12:42:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWvHV-0008Sn-Pu; Fri, 27 Nov 2026 12:42:25 +0000
Received: by outflank-mailman (input) for mailman id 1504992;
 Fri, 27 Nov 2026 12:42:24 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hfranco@baylibre.com>) id 1xWvHU-0008Sd-Jp
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 12:42:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWvHU-00FZAm-0H
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 13:42:24 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <hfranco@baylibre.com>)
 id 6b097aa5-bab6-0a2a0a5309dd-0a2a450cc8ba-10
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 13:42:23 +0100
Received: from [209.85.222.52] (helo=mail-ua1-f52.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <hfranco@baylibre.com>)
 id 6b097aae-f479-0a2a450c0019-d155de34e04a-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 13:42:23 +0100
Received: by mail-ua1-f52.google.com with SMTP id
 a1e0cc1a2514c-99e81f5ec91so3522842241.2
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 04:42:23 -0800 (PST)
Received: from localhost ([2804:14c:4c5:8bf0:96eb:98f3:8775:4ebc])
 by smtp.gmail.com with UTF8SMTPSA id
 71dfb90a1353d-5ee8b556db7sm23262113e0c.4.2026.11.27.04.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2026 04:42:21 -0800 (PST)
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
        d=baylibre.com; s=google; t=1795783342; x=1796388142; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EnHBURqM4dVrwiJZ250DyWodteBPQ5S/obOxDJrrg2Y=;
        b=l1ceSNdgwGsHDsaNldZpTV21Zgjy4/E92ZwEhACSQon6Eaa6qPSPebRoUbeLhKwod1
         2r9vQJ3WpdvH/dpurHk2JS8AQuBU1x0oHfvu0CIAZq+wMgmHs8U8ExRn+WuYhK1hR296
         OoYoM13KP79SUbNWR4IhJk3Up/UaeXXdI1HmwoUoWLmkt7P9b5WifU9/kgW/mZ3jxNF2
         wDCKBerLFMNrx4BZ+tB1ip3/UCNptIDASalMHgY44zksDCaU/j0tPvdf/j0jJDttwQT4
         +ROoP7vXu/zhDCLdqhpE/TsbK3EjBzxISjbHw+ax/rmxYXen5jx3fSqcQg/fy0SEN/AP
         kcMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795783342; x=1796388142;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EnHBURqM4dVrwiJZ250DyWodteBPQ5S/obOxDJrrg2Y=;
        b=ZeIkxkqHq9kSnpS3Rf2ZQHZ6X5E4jQ500Hq2kOaK/x2D+Hl+4sdxVAVph+L5jUTRN7
         IQKLuY3HXl2H1yyyjLTdwVtd2WR9bCOfpZ2bR2z8+6GW5tEY+PFCQpK0b8SsEFDmtMv5
         wYCo98PeK9htl5a7mwIXNSbCUsPX9jNR1kTO6Ckdh6Q/upFEjjoTI7JQ2P3oePl7rVP/
         LJH52EX49HWhOdFUI2lXZjm7nHyOVxB2J+w8E4m090nu0fDr+QUjoxAz4uMYSDuxz1sm
         YsYRHpsy7JHvNvMD3YCW5tJrtFiJzSAMg6RUlaNrLJX1ZpwpC+MHNjjcf74NFXJg51Ej
         n7xw==
X-Gm-Message-State: APuU4Z9ubq9XxkhIPIQ3i0wOGYQSBS/DPqKqk6Qey0vXCvx08EVhhPf9
	nkA49zaUr2wCrRN171GX5pWnnEIA77748foFrO3/ONUm1gfp4VDAxiTAaTkCiz+acas+fPxyGjo
	gz42S
X-Gm-Gg: AZFdTZcitxD9DwmB/4u/aWg1c/aVBK42XtbcNlppc3xAh0XppQZGMd+aLXAO92rwUSj
	gwGmDPpCCRNs02IDHwBKLFjrCUSwjUxRHAkGZpBXMn2YNTHE9MnzME33hW4IO48s8loZNUnZtXO
	fnDyaqoiBN2pYSHsuWu4FQLi9kAOpKZhyi2l50XXDajt/EJCZijIubFUs3dZSWtNIFxNTebJOzU
	KuWFBS/ARuCJDAimNpTpMHTP2F476J89TiePUj2kIolA/k2/XwlIMGyzJKbmwUQgxnxtu0jmTDe
	H9lmP0t2xGgaUDkUDwLqaaXYHuu0Re5W62t2eQQnDJ+sOg7WfiwyljZS/WZ+M8HDSFZMMIDFNOC
	hCAxyWcet/oaJfBw1Rw2EI8bLxhT3gLMbtSnshT1pU/SGqak+i0rtACECdCdbrpmupwIIvaXUOx
	RdNS3qHEJXoRx5Yk7Novl2li4TbsYmx1nzxYhTo1JQMJOAcGFPc1vh+Jv3xezpx2HJirrf8/QSu
	v2CQj5Byj+di/BIQbr4meQJdBoHHTtQtEbYZ0whJMGlEkkMNEKupqptZYLbJs4KRTRETHZOvvkb
	m63RzaXr87TgUwlq6pOqzm1vxxMsUP9Ihn30rhBklILwPdthCfYsgIO8ApcjOZob7JTI6oY/eUf
	M8V/cxuIlXw==
X-Received: by 2002:a05:6122:792:b0:5d1:dd67:3a02 with SMTP id 71dfb90a1353d-5ee8aed042bmr13391014e0c.10.1795783342391;
        Fri, 27 Nov 2026 04:42:22 -0800 (PST)
Date: Fri, 27 Nov 2026 09:42:18 -0300
From: Hiago De Franco <hfranco@baylibre.com>
To: xen-devel@lists.xenproject.org
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
	Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony PERARD <anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, 
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Alejandro Vallejo <alejandro.garciavallejo@amd.com>, 
	Zhang Zheng <zhangzheng@iscas.ac.cn>
Subject: Re: [PATCH v3 4/6] automation/qtb: add QTB framework README
Message-ID: <op2v7kgfurqdg7m2lu32ktj44aasszchohimct54g7bbeoudhe@cgvyr725qkvk>
References: <1793714671.8631fc262581453bbf619ec5b2062170.1a1a1b9ce9c000403d@vates.tech/T/#u>
 <1793714907.8631fc262581453bbf619ec5b2062170.1a1a1bd67a4000403d@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1793714907.8631fc262581453bbf619ec5b2062170.1a1a1bd67a4000403d@vates.tech>
X-purgate-ID: tlsNG-d25034/1795783343-014C7A5B-EFAADD50/0/0
X-purgate-type: clean
X-purgate-size: 6068
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 03:08:12PM +0100, Baptiste Le Duc wrote:
> Document the qtb riscv64 test framework in a README.
> 
> It covers:
>   - the core concepts: a test type is a pytest module under tests/, a test
>     is a function parametrizing the `machine` fixture with what it boots
>   - the source files layout
>   - the prerequisites and how to run the tests with pytest, with logs and
>     a JUnit report as CI does
>   - how to run them in the CI container
>   - how to add a test and how to add a new test type.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

Reviewed-by: Hiago De Franco <hfranco@baylibre.com>

> ---
> Changes in v3:
> - Rewrite for the pytest-based framework.
> ---
>  automation/scripts/qtb/riscv/README.md | 127 +++++++++++++++++++++++++++++++++
>  1 file changed, 127 insertions(+)
> 
> diff --git a/automation/scripts/qtb/riscv/README.md b/automation/scripts/qtb/riscv/README.md
> new file mode 100644
> index 0000000000..f074a70c4a
> --- /dev/null
> +++ b/automation/scripts/qtb/riscv/README.md
> @@ -0,0 +1,127 @@
> +qtb riscv64 test framework
> +==========================
> +
> +A small pytest framework built on qtb (QEMU Test Bench), a Python package that
> +controls a QEMU process over QMP and qtest and gives access to its consoles.
> +Each test drives Xen and its guests through these interfaces and turns what
> +it observes into a pass/fail verdict.
> +
> +Prerequisites
> +-------------
> +
> +- `qemu.qtb`: the QEMU Test Bench Python package. It is not upstream yet, so
> +  install it with its `[qtb]` extra (which pulls `pexpect`) from the `python/`
> +  directory of the `QEMU_REPO` fork, at the `QEMU_COMMIT` pinned in
> +  `automation/build/debian/13-riscv64-qtb.dockerfile`.
> +- `pytest`.
> +- `qemu-system-riscv64` in PATH, with its bundled OpenSBI.
> +- A riscv64 `xen` binary, in the directory given with `--binaries-dir`.
> +
> +The simplest way to get the Python ones is to use the CI container, see
> +"Running in the container" below.
> +
> +Running the tests
> +-----------------
> +
> +Run from the top level of the source tree, as CI does. Here the binaries are
> +in `binaries/`:
> +
> +```
> +T=automation/scripts/qtb/riscv/tests
> +
> +# List every test:
> +python3 -m pytest $T --collect-only -q
> +
> +# Run every test, one file, one test, or by name substring:
> +python3 -m pytest $T --binaries-dir binaries
> +python3 -m pytest $T/test_console.py --binaries-dir binaries
> +python3 -m pytest $T/test_console.py::test_host_boot --binaries-dir binaries
> +python3 -m pytest $T -k 1pcpu --binaries-dir binaries
> +
> +# With logs and per-test results as JUnit XML (what CI does):
> +python3 -m pytest $T --binaries-dir binaries --log-dir qtb-logs \
> +    --junitxml tests-junit.xml
> +```
> +
> +pytest finds the `qtb` package on its own, as `automation/scripts/` is the
> +first directory above the tests without an `__init__.py`.
> +
> +The `machine` fixture understands the following options.
> +
> +- `--binaries-dir DIR`: The directory holding the binaries. It is required to
> +  boot a test.
> +
> +- `--log-dir DIR`: The directory collecting the logs, in one
> +  `<module>/<test>/` subdirectory per test. It holds QEMU's stdout/stderr
> +  (`riscv64-qtest-<pid>.log`, named after the host) and Xen's console as
> +  `con0.log`. Without it, no logs are written.
> +
> +`--log-cli-level=DEBUG` shows the debug logs live.
> +
> +Running in the container
> +------------------------
> +
> +Build the CI container once, then run the tests in it with `containerize`,
> +which mounts the Xen tree as the working directory. In this example, we assume
> +the binaries were copied to `binaries/` at the top of the tree.
> +
> +```
> +make -C automation/build debian/13-riscv64-qtb
> +CONTAINER=trixie-riscv64-qtb ./automation/scripts/containerize \
> +    python3 -m pytest automation/scripts/qtb/riscv/tests --binaries-dir binaries
> +```
> +
> +Layout
> +------
> +
> +```
> +qtb/env.py                   QtbEnv: directories handed to each host
> +qtb/utils.py                 Generic helpers, not riscv specific
> +
> +qtb/riscv/                   This framework
> +  machine.py                 HostConfig: what a host boots; RiscvTestMachine:
> +                             QEMU command line, console helpers
> +
> +  tests/                     The QEMU tests, one module per test type
> +    conftest.py              `machine` fixture and its options
> +    test_console.py          console-test
> +```
> +
> +Test types and tests
> +--------------------
> +
> +A test type is one module under `tests/`. Each test is a short function
> +taking the `machine` fixture, which it parametrizes indirectly with the
> +pCPU counts it runs on:
> +
> +```
> +@pytest.mark.parametrize(
> +    "machine",
> +    [pytest.param(1, id="1pcpu")],
> +    indirect=True,
> +)
> +def test_a(machine):
> +    ...
> +```
> +
> +Before the test body runs, the `machine` fixture launches QEMU with Xen. Once
> +the test body returns, QEMU is shut down.
> +
> +An exception raised before the test body (a bad parameter, a missing binary,
> +QEMU not starting) is reported by pytest and JUnit as an *error*. An
> +exception raised in the test body (an `expect_console` timing out) is
> +reported as a *failure*.
> +
> +Adding a test
> +-------------
> +
> +Add a function to the module of the test type, parametrize `machine`
> +indirectly with the machines it runs on, and check their consoles.
> +
> +Adding a test type
> +------------------
> +
> +Add `tests/test_<type>.py`, holding the logic of the type in one function
> +that takes the machine and the parameters of the type, and the tests that
> +call it. Host-side helpers shared between types go to `RiscvTestMachine` or
> +`machine.py`. State the requirements of the type in the module docstring.
> 
> -- 
> 2.56.0
> 
> 

-- 
Hiago

