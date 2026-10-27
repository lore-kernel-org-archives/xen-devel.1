Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EA6606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 16:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N91V94IB
Received: from list by lists.xenproject.org with outflank-mailman.1462313.1673307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLkO9-0004vZ-07; Tue, 27 Oct 2026 16:51:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462313.1673307; Tue, 27 Oct 2026 16:51:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLkO8-0004vS-SU; Tue, 27 Oct 2026 16:51:04 +0000
Received: by outflank-mailman (input) for mailman id 1462313;
 Tue, 27 Oct 2026 16:51:03 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLkO6-0004vM-Qh
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 16:51:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLkO6-008VeO-0T
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 17:51:02 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ae0d66f-bab6-0a2a0a5309dd-0a2a450aca9e-20
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 17:51:01 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ae0d675-f2d2-0a2a450a0019-d1558030a83e-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 17:51:01 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4a5720b0a57so7338825e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 09:51:01 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-67-71.play-internet.pl.
 [109.243.67.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebd4ba7sm23973485f8f.33.2026.10.27.09.51.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 09:51:00 -0700 (PDT)
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
        d=gmail.com; s=20260707; t=1793119861; x=1793724661; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EPpWdhpY2EJkduoNS3BQPxQ1U6Ru9YMHlhkJUTYsMzE=;
        b=N91V94IBSz154INetHOmyUJE1BSDJq/57Qv2EKxPk670Ao7WLOFPFgM4iZJQLSUjYd
         TU4cjYZRlTT5ncVW123G7+wCHXJuLJMa/V+fwMF2x7fDfopGOEzDKnjhevpjX33iPG14
         e/HtHsBIlP+Wim6EWa63u5DsG7Y0PS62N3Bl+1/PmLtq1xczhzAdq5vNx9pjbPLCzOxy
         ehULq21JpqTO7rCGG7ckHd0WMGtUTfInfxXNOWIBd5YXXdjC259OKjwHpeOjYMGi9YvT
         SnHRUcchL2wVqVksiFICkeIzyFg1zELOKT9jXUVsrjueW17zh7u8Xw7X3kI8kKYjWWab
         dFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119861; x=1793724661;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EPpWdhpY2EJkduoNS3BQPxQ1U6Ru9YMHlhkJUTYsMzE=;
        b=1jrpPo+A31xVZQqbsjgj6XKXl945MBvrTQ3jDBF5qbgOZ6s+pHeJMVMY1Ls75lMXVs
         EdqmTNTlRLtTm/IFVlwqMwUqrDHJmF3Q1xavh4zOIfIz2cfiW6Wa+CFniP7RPXPWY8F9
         J4CFK9TIKlCrZTqmRF1FZKe+LH5XESaq5QsBuj4dpdALFciFFkSCV+1Abx/5Wimbwcfu
         kOjsIBK2Id1dbxCbHaRxhGP1s5GkRciA8KBxCmPoUCWxzYGeBAuH3GtjkxfUD+tQD3Ir
         iu/h6CEVomKMn3ABdfUNnqQJYUUWchSN8SAimh/ZG2wFh022pbb9pPAc0hrH2V/Eppgg
         Wp2Q==
X-Forwarded-Encrypted: i=1; AKwUvBz1623OqhT0glFo2A4i35nR7wiHCf4OY0exxrYgsPRBZG5jc8rnmJccvv4PiuuFORj/i/sCDTUKK8w=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLDHBA8Z2kU31WkJ2LqnCXwSioddpl7+cPARuCRKd5KcCfjBM0q
	K2UhLuZpH7KVhs4PN8q6Z7Y6ybJP28JOmk9PlTAMqk5qdlVZaGWPh3QX
X-Gm-Gg: AYBFou2UPmSY8obRi6TrTxWzV2XtksEEStBflyT0um9yXtNSckAI3e/iQoj80vO8x4+
	nAQXKiwBaArDSIiYD7Xm7GnNTxpqDeW++m1OcfP+6jExoIRhbJJHya3PQ6h4xJNKVC1Ks8sPUE4
	z1ckQ5V0Hpcx4fvPYV77PWbHzzTqGDufp5IGbO1/TZsjw1J3Zx7BGDe7iyHKnguJLJzgoOFMwxU
	QGRU610/VNyJd9miszS4LKx+QRq2rurGaXFDm7DXAnd1sjpdgg4IL7JJjsV+6H6+bOgmMgwazzv
	A8/gMHHr3JGiA//Lu9kPA0nXjYfpoNiHawFjR4Y/boJQDTYM2xXlzloJqhpsHKV+ui5xK+nTzTt
	sjcgIA9dTdoX5y+gQSQUiZXnftyT2OK+6fyDHyj6x2YZsngyp/P0wUn5LusQMqsWph50Wt0b+BF
	binNRRmW/qEORdj86AD1KMrBtt6rqgrh4xJ4U2Z3k1Wcs9no0ClPlB+Kq94A4jDoNEoRgaJ6OdG
	216HX6O+yvr7kZtw+mpmn9eI/1hWD5oWsTLF5xc/A9YT/+YSV+6unVEEsZhKpitYZDs8VSYOBgL
	2BklStqZRvwHzbS6qKRmlFFmhziW
X-Received: by 2002:a05:600c:c117:b0:4a2:f58:9a82 with SMTP id 5b1f17b1804b1-4a7c58f3472mr67601915e9.13.1793119861170;
        Tue, 27 Oct 2026 09:51:01 -0700 (PDT)
Message-ID: <5ada3d12-5569-4e14-8178-815da3665a52@gmail.com>
Date: Tue, 27 Oct 2026 17:51:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] automation/qtb: add unit tests for the QTB
 framework
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech>
 <1787823789.8631fc262581453bbf619ec5b2062170.1a0429a13b8000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1787823789.8631fc262581453bbf619ec5b2062170.1a0429a13b8000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1793119861-4BAD4CFC-2F88EB2E/10/73395122804
X-purgate-type: spam
X-purgate-size: 5046
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 8/27/26 11:42 AM, Baptiste Le Duc wrote:
> The QTB framework is meant to be extended: new test types, new machines and
> new device trees aim to be added by other people.
> 
> Add pytest coverage of the framework's functions, and of the console-test
> type's config validation and expect/retry loop, so that such changes get
> immediate feedback and existing behaviour does not silently regress.

Nothing runs these tests, though: there is no CI job for them, and the
container from patch 1 doesn't even have pytest. So the feedback only
comes if whoever changes the framework has pytest and the QTB fork
installed locally and remembers to run them.

Probably, we want to consider to have a separate job for that (mainly 
question to CI maintainers then)?

Nit: probably "immedidate feedback" will be clearer if this part ...
> 
> The suite covers 100% of the framework's statements, so a new code path
> added without a test shows up as a coverage drop.

Running the suggested pytest-cov command gives 99% here:

Name                                                        Stmts   Miss 
  Cover   Missing
-----------------------------------------------------------------------------------------
...
automation/scripts/qtb/riscv/paths.py                          32      1 
    97%   50
...
automation/scripts/qtb/riscv/xen_dt.py                         26      1 
    96%   21
-----------------------------------------------------------------------------------------
TOTAL                                                         592      2 
    99%

============================== 51 passed in 0.22s 
==============================

Not a problem as
such, but the commit message shouldn't claim 100%.

> 
> The tests are meant to be run locally, from the Xen tree root:
... and part below will be moved up.>
>      python3 -m pytest automation/scripts/qtb/riscv/unit/
> 
> and, with pytest-cov installed, the coverage report is:
> 
>      python3 -m pytest --cov=automation/scripts/qtb \
>          automation/scripts/qtb/riscv/unit/
> 
> The tests drive fakes rather than QEMU, so they need no artifacts to run.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> ---
>   automation/scripts/qtb/riscv/unit/__init__.py |   2 +
>   automation/scripts/qtb/riscv/unit/conftest.py |  42 ++++
>   .../scripts/qtb/riscv/unit/test_config.py     | 121 ++++++++++
>   .../qtb/riscv/unit/test_console_test.py       | 217 ++++++++++++++++++
>   automation/scripts/qtb/riscv/unit/test_dt.py  |  99 ++++++++
>   .../scripts/qtb/riscv/unit/test_machine.py    |  60 +++++
>   .../scripts/qtb/riscv/unit/test_temp_dir.py   |  42 ++++
>   .../scripts/qtb/riscv/unit/test_xen_dt.py     |  46 ++++
>   8 files changed, 629 insertions(+)

[...]

> diff --git a/automation/scripts/qtb/riscv/unit/test_machine.py b/automation/scripts/qtb/riscv/unit/test_machine.py
> new file mode 100644
> index 0000000000..68a1564072
> --- /dev/null
> +++ b/automation/scripts/qtb/riscv/unit/test_machine.py
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +"""Unit tests for RiscvTestMachine QEMU argument assembly."""
> +
> +from __future__ import annotations
> +
> +from stat import S_IEXEC
> +from unittest import mock
> +
> +from ..machine import RiscvTestMachine
> +from ..config import MACHINE_MEMORY, BinariesConfig
> +
> +
> +def _binaries(tmp_path):
> +    xen = tmp_path / "xen"
> +    xen.write_bytes(b"")
> +    return BinariesConfig(xen=xen)
> +
> +
> +def _machine(mc) -> RiscvTestMachine:
> +    """Build the machine with QtbMachine.__init__ stubbed out (it spawns QEMU)."""
> +    with mock.patch("qemu.qtb.QtbMachine.__init__", return_value=None):
> +        return RiscvTestMachine(mc, timeout=30)
> +
> +
> +def test_init_forwards_cpus_to_qtbmachine(tmp_path, make_machine):
> +    mc = make_machine(name="machine", binaries=_binaries(tmp_path))
> +
> +    with mock.patch("qemu.qtb.QtbMachine.__init__", return_value=None) as base_init:
> +        vm = RiscvTestMachine(mc, timeout=30, log_dir="/logs")
> +
> +    assert vm.machine_conf is mc
> +    assert base_init.call_args.kwargs == {
> +        "memory": MACHINE_MEMORY,
> +        "cpus": mc.pcpu,
> +        "mirror_console": False,
> +        "timeout": 30,
> +        "log_dir": "/logs",
> +    }

Many of the tests check how the code is written rather than what it
does: the exact keyword arguments passed to QtbMachine.__init__() here,
the exact dtc argv in test_dt.py, the number of expect_exact() calls of
the attempts loop in test_console_test.py. With everything else mocked
out, these mostly restate the implementation, so each change asked for
in review of patch 3 (mirroring the console, dropping attempts, ...)
has to be repeated here, without the tests catching anything real in
between.

FWIW, all 51 tests pass for me (Debian trixie container from patch 1
plus python3-pytest).

~ Oleksii

