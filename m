Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605CB606A31F
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 17:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q78vTKLN
Received: from list by lists.xenproject.org with outflank-mailman.1462331.1673314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLl1v-0002Gh-0i; Tue, 27 Oct 2026 17:32:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462331.1673314; Tue, 27 Oct 2026 17:32:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLl1u-0002Ga-UQ; Tue, 27 Oct 2026 17:32:10 +0000
Received: by outflank-mailman (input) for mailman id 1462331;
 Tue, 27 Oct 2026 17:32:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLl1s-0002GB-MC
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 17:32:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLl1s-007Sxb-2p
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 18:32:08 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ae0e017-bab6-0a2a0a5309dd-0a2a45058e7a-2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 18:32:08 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ae0e017-4cb1-0a2a45050019-d1558036dd89-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 18:32:08 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a2084d62cdso810885e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 10:32:07 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-67-71.play-internet.pl.
 [109.243.67.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebc3a1csm24334241f8f.16.2026.10.27.10.32.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 10:32:06 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793122327; x=1793727127; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BPFJ5JiP/ElLTx62+FRfNGsv7fzfBK63m/+szJKtrA4=;
        b=q78vTKLNbY/pFSOqcIKg8pUglkpRSKJ4avRNmNePx7t+1nYK7lGUBValpH4ln2iavu
         HSCviIqiY0o5iHmO3g+dtJLh4Yzfi6nBLo0aSmtsrBm58bwie0f1z+9zhu8EBpjwpcub
         UO3avpYsLnFAxqgyPnBxoR5CBrbKK5dc2ejfgnhYRncGuEsmjGb/AuBu2hi3YARzBvnh
         fuWVC6LarrHlIhVlrS+EkQydAIPk+NLcAm5nPW3zw83HnBnpthSSs6rNdUXiByKXUFO3
         ZGbKWcbZqJaEwiiykeoOLoHkBXJ0z3xNI1M93Dad3F48wUM6GXJplilLh71NKrsiqfaA
         rC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793122327; x=1793727127;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BPFJ5JiP/ElLTx62+FRfNGsv7fzfBK63m/+szJKtrA4=;
        b=tb5NA4k+R6ChtZ+lpCrEc6DlzImsl3LmeaxyVFRnvRt14w9mebrVRvLv23jGzqV7Da
         rMh5tAs3MJXDxGpQo/qkke1qeA3oYqT0HXJCNQtyLor8HmEJqvdGrGlLezzDA/zGjQB0
         Vpg1Rm6noJZo9S9FCLYMwlzUYWrqlsLUdqfpYoQB+mbpTACN/V5kQtTyowRrkHJDnj9m
         5cG75eBk/ghrkJ3Jexz9fUXfuuJANCraUJc60G/AFVQsYeIuCEVYdhfQ2hcJeXSFLhJN
         4W0jYC13HIromfBv417mG1HyEHk2uf9Nd3HCbBpsxMB70hL1NVYOzUK3VC+1qfmTsMEk
         1n3g==
X-Forwarded-Encrypted: i=1; AKwUvBx+RflJZawqrK+6pVNJq2uULJH4o9meW9taNU6/8hw/t3pP+VPiS1h+etGgQV+CC9tMRn17luqpTkw=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIm6/hC0i4QZy17U0qXfpRB8z2TyCn+vOoMnXSXZlN/kxj2byKc
	MMrGPGcfqiSKkDt4OGWDLFhIgEqbbK/liniaJjb2yi8w40XA38K9dkgU
X-Gm-Gg: AYBFou12hIAgFGd5Ox9O5tQyeKzgPbndM+UHbv5erW6TBO7Tiak10tZxD11TJYZo7w8
	6vjKOO/QWR7HzE/TLZqb4K+8jsIQmR/TwXJ5+TCtApCNn1xbhuQoIBQq0/36U3ZaQv85pk0HvpJ
	loFyLve4iEqJcBL0oQ2o2pAHsZu5wjpDK4BZcMs35maU05+aWF0GVQI2ioH2T7rDjgsbLr1GKuY
	xv3tElPkt4fvqlFDSVJanU40cXw1Mv8xYTFD7IbTqzet3pqlt1Fo2U/c4MhicCt3A3Q3rhEcGTg
	vH4kbDrMGF4RRF6n8MXD/mlvXhybUrr4HVrwagc8cPeUCnYG5dN/Bt17yqoDYkVkNxL1Jqu5gCo
	CfwJc7D4Pzn/um2P2RQHHcditfpLEO8ygg2/CzPDZ3aCKabLr3VobipnYAMtngOJPdjCeBOzqYM
	Pa6dRSiRUdIwjnZC4Mnv2cyv7/lmQiLIv3d073xh0Q4Cwfl5J1ejaoEDwDSca63zWhkRV2fdYPC
	yPRpaO6bCi098qkhHFO9iz1DFj6o8Q8AZQP/fnyH5fYmDqXuP+famJfAE20d+9Sz7fTz98maiF2
	dDtp1qXiJo2T/GTkIkTV2wiRs4JL
X-Received: by 2002:a05:600c:c173:b0:4a2:1a:a129 with SMTP id 5b1f17b1804b1-4a35acb9b05mr180537885e9.35.1793122327306;
        Tue, 27 Oct 2026 10:32:07 -0700 (PDT)
Message-ID: <1fcacfcb-2775-4a4f-ac38-d7ed9a143e99@gmail.com>
Date: Tue, 27 Oct 2026 18:32:05 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] automation/qtb: add QTB framework README
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech>
 <1787823789.8631fc262581453bbf619ec5b2062170.1a0429a1484000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1787823789.8631fc262581453bbf619ec5b2062170.1a0429a1484000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1793122328-F76BD2A1-31CB49CC/10/73395122804
X-purgate-type: spam
X-purgate-size: 7418
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 8/27/26 11:42 AM, Baptiste Le Duc wrote:
> Document the qtb riscv64 test framework in a README.

I understand that you are trying to introduce things so they could be 
traceble. But probaly it makes mentioned in cover letter or somewhere 
else that thre is README which probably should be read first for easier 
understanding of the patch series.

> 
> It covers:
>    - the core concepts (machine, test type, test) and how they map to files
>    - the source files layout
>    - the CLI: `qemu_smoke_riscv64.py <type> <command>`, with "console-test"
>      as the type
>    - the config files: the machine catalog and a type's own `<type>.yaml`
>    - the Jinja2 device-tree templates under dts/
>    - how to add a test (config-only) and how to add a new test type.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> ---
>   automation/scripts/qtb/riscv/README.md | 182 +++++++++++++++++++++++++
>   1 file changed, 182 insertions(+)
>   create mode 100644 automation/scripts/qtb/riscv/README.md
> 
> diff --git a/automation/scripts/qtb/riscv/README.md b/automation/scripts/qtb/riscv/README.md
> new file mode 100644
> index 0000000000..c173714d75
> --- /dev/null
> +++ b/automation/scripts/qtb/riscv/README.md
> @@ -0,0 +1,182 @@
> +qtb riscv64 test framework
> +==========================
> +
> +A small framework that boots Xen under QEMU on riscv64 and drives it to a
> +pass/fail verdict automatically from its console output.
> +
> +It is built on QEMU's qtb (QEMU Test Bench) Python package, which gives
> +programmatic control of a QEMU process over QMP and qtest, plus access to the
> +consoles.
> +
> +What it does
> +------------
> +
> +1. Reads a machine description (what to boot: cpus, Xen command line) and a
> +   test description (what to assert).
> +2. Generates the host device tree.
> +3. Launches QEMU with Xen.
> +4. Reads the console and checks what Xen printed.
> +
> +Core concepts
> +-------------
> +
> +- Machine: test-agnostic description of what to boot. Reusable across test
> +  types. `config.yaml` -> `MachineConfig`.
> +- Test type: a `RiscvQtbTest` subclass implementing the logic of a kind of test
> +  (e.g. `console-test`). Identified by `type_id`. See `console_test/`.
> +- Test: one named, runnable instance of a type: a machine plus the type's
> +  parameters. Lives in the type's `<type>.yaml`.
> +
> +A test type owns a config file describing its tests, each test names a machine
> +from the shared catalog (`config.yaml`) and layers its own parameters on top.
> +
> +Layout
> +------
> +
> +```
> +qemu_smoke_riscv64.py        CLI entry point (<type> run | list)
> +
> +qtb/riscv/                   This framework
> +  __init__.py                Public API
> +  qtb_test.py                RiscvQtbTest ABC every test type derives from
> +  config.py                  Machine catalog parser -> MachineConfig
> +  xen_dt.py                  Generates the host device tree from its Jinja2 template
> +  dt.py                      Compile .dts -> .dtb with dtc
> +  paths.py                   Path resolution (pkg-relative)
> +  machine.py                 RiscvTestMachine: assembles the QEMU command line
> +
> +  config.yaml                The machine catalog (shared across test types)
> +  dts/                       Jinja2 device-tree templates (host, common)

There is only one template, qemu-host.dts.j2, nothing "common".

> +
> +  console_test/              The console-test type
> +    __init__.py
> +    console_test.py          ConsoleTest implementation
> +    console-test.yaml        Its tests
> +
> +  unit/                      pytest unit tests of the framework logic itself
> +```
> +
> +How a type is selected
> +----------------------
> +
> +The test type is the first positional argument (`qemu_smoke_riscv64.py console-test run
> +...`). The CLI builds one subcommand per entry of `TEST_TYPES` (`__init__.py`),
> +named after the type's `type_id`.
> +
> +Each type declares the `config_file` it reads its tests from.
> +
> +Prerequisites
> +-------------
> +
> +- `qemu.qtb`, QEMU's Python package (`python/` in the QEMU tree)

qemu.qtb isn't in QEMU's python/ (it isn't upstream yet, as the cover
letter says), so this sends people to the wrong place. Please point to
the fork and the commit used by the container in patch 1, or better,
say that the simplest way to get all prerequisites is that container,
and show how to run a test in it with containerize.

> +- `jinja2`, `pyyaml`, `pexpect`
> +- `dtc` (device-tree-compiler)
> +- `qemu-system-riscv64`
> +- the `xen` binary a machine boots
> +
> +CLI usage
> +---------
> +
> +Run from `automation/scripts/`, or give the full path from the Xen tree root
> +(`./automation/scripts/qemu_smoke_riscv64.py ...`), which is what CI does.

Neither works without QTB_BINARIES_DIR unless xen is copied to
automation/scripts/qtb/riscv/binaries/ (see my reply to patch 3), and
the README doesn't say where to put it.

> +
> +```
> +# List every test the type defines in its config:
> +./qemu_smoke_riscv64.py console-test list
> +
> +# Run one test (drives it to PASS/FAIL, exit 0/1):
> +./qemu_smoke_riscv64.py console-test run dom0less-1smp-0domu-1vcpu-aplic-imsic-null \
> +    --log-dir qtb-logs
> +```
> +
> +`--log-dir` (run only) collects the QEMU process log, the qtest log, and each
> +console as `con<N>.log`: `con0.log` is Xen's own console, the only one wired

There is no qtest log: QtbMachine passes "-qtest-log none". The
riscv64-qtest-<pid>.log file is QEMU's stdout/stderr; "qtest" comes
from the machine name.

> +up today. Omit it to write no logs. `-v/--verbose` raises the
> +log level to debug.
> +
> +Config files
> +------------
> +
> +`config.yaml` is the machine catalog. `binaries:` are build artifacts resolved
> +under `binaries/` (overridable with `$QTB_BINARIES_DIR`); absolute paths pass
> +through.

This reads as binaries/ at the top of the tree, while it is actually
automation/scripts/qtb/riscv/binaries/.

> +
> +Machine entries omit any optional field left at its default.
> +Here are the parameters:
> +
> +- `pcpu` (required): host physical cpus.
> +- `mmu_type` (default `sv48`): Xen host MMU type.

See my reply to patch 2: Xen doesn't use this.

> +- `xen_bootargs` (default `""`): Xen command line.
> +
> +`<type>.yaml` describes the tests of that type.
> +
> +`console-test`
> +--------------
> +
> +A test names a machine and maps a console index to the string(s) expected on
> +that console: index 0 is Xen's own console (`con0`, logged as `con0.log`).
> +
> +```
> +machine_catalog: config.yaml    # the catalog to resolve machine names against
> +tests:
> +  dom0less-1smp-0domu-1vcpu-aplic-imsic-null:
> +    machine: dom0less-1smp-0domu-1vcpu-aplic-imsic-null   # a name in config.yaml
> +    expect:
> +      0: [All set up]           # Xen itself must print "All set up"
> +```
> +
> +Logic, per console:
> +
> +1. read the console
> +2. wait for each expected string in turn, in the order listed
> +3. bound each wait by `timeout` seconds, retrying a timed-out wait up to
> +   `attempts` times

See my reply to patch 3: nothing is retried, attempts only multiplies
the timeout.

[...]

~ Oleksii

