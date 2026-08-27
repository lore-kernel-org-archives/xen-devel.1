Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DD8C61DC7
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 09:36:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400439.1636085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzWWI-0001ti-Ns; Thu, 27 Aug 2026 09:35:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400439.1636085; Thu, 27 Aug 2026 09:35:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzWWI-0001tb-L5; Thu, 27 Aug 2026 09:35:38 +0000
Received: by outflank-mailman (input) for mailman id 1400439;
 Thu, 27 Aug 2026 09:35:37 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@swg.vates.tech>)
 id 1wzWWH-0001tV-0s
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 09:35:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzWWG-002LJp-7a
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 11:35:36 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@swg.vates.tech>)
 id 6a9004cc-2eae-0a2a0a5409dd-0a2a45028de4-44
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 11:35:36 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@swg.vates.tech>)
 id 6a9004e7-6ca4-0a2a45020019-b9ff1c2381d1-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 11:35:36 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a04293255c000c4f3.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 27 Aug 2026 09:35:34 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id D883383B61;
 Thu, 27 Aug 2026 11:35:33 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=yr+BwYUQPHoth+lckl1Y1HxUO1/zH4gLPlVTMB+7FjU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:feedback-id;
 b=akpAJegsghONgX8tR8T/TKyCowx9P32QVocooajTl2Mf0S7Jp9iZUGjFJNkwNWeanBOsmt7DL
 +uh2Ntp0LRj9xF1ylfaKrriGadNc8SxCVigqFN8/2AQq5qG7tKofiJriu/Ufeye8iVnkvyHnPRS
 bq8XgM1PjspdCyWEppJLmoG5U78Y/3Jq42WKIaLt+0dZJ5CklE4ommthusrrywuZ/pwgIjCh74E
 cXvC464G1qzDYqcTVkHyLD5wVEHzTbw5EA8kXRecEXoepf4EGjsIYCSi55rkAj/DUs3UDMWOCnz
 3lQJ76semMjgOFDZELEABi8j5bm6Ek+yWYO5mflGyAIg==
X-Zone-Loop: 9906721adfdcb6f1efebe3e6b51e2627c408f1e7d0dc
x-campaign-type: default
x-transaction-id: 925ebd3f-d5ed-451c-a14e-f0f4960fb5fd
x-swg-uid: 01-3737171c-5a9e-44b2-8360-433b3f0ff558
X-Mailer: Sweego
Message-ID:
 <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech>
x-swg-bid: 1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: baptiste.leduc38@gmail.com,
	xen-devel@lists.xenproject.org
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 0/6] automation: add QTB test framework for riscv64 smoke tests
Date: Thu, 27 Aug 2026 11:35:31 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1787823334063
X-purgate-ID: tlsNG-720697/1787823336-319CB2AC-9BAE4548/0/0
X-purgate-type: clean
X-purgate-size: 8156

v1 was posted on 2026-08-10 with no response yet (13 business days). This
v2 also fixes a bug flagged during internal review, see "Changes since v1"
below.

Xen is being made safety certifiable to IEC 61508 SIL 3 and ISO 26262 ASIL
D, with Arm and x86 as the current targets [1]. Evidence at those levels is
requirements based testing plus structural coverage, produced automatically
and repeatably in CI.

QTB (QEMU Test Bench) [2] is the framework AMD wrote for it as part of the
Xen safety initiative. It drives a live QEMU instance over qtest, QMP and
GDB, so a test has full access to the machine while emulation runs: read
and write the consoles, inspect registers and memory, inject interrupts and
faults, all from Python and all reproducible in a pipeline. QTB is not
upstream in QEMU yet, but is planned to be.

RISC-V is not in the certification scope today. It is also the youngest
port, so it has close to no test infrastructure to undo, which makes it the
cheapest place to adopt QTB. Starting the riscv64 tests on the framework
now means the port grows its tests in the shape certification asks for as
the port itself grows, instead of a pile of expect scripts to convert later
if riscv64 ever becomes a certification target. It also puts a second
architecture on QTB, which is useful to the framework itself before it is
proposed to QEMU upstream.

Concretely, the riscv64 CI coverage today is one expect script,
automation/scripts/qemu-smoke-riscv64.sh, which boots Xen alone under QEMU
and greps a single string out of one serial console. The machine it boots
is hardcoded, so a second configuration means a second script, and a test
with a DomU in it means growing guest handling from scratch.

This series replaces that script with a data-driven framework using QTB. A
machine is a YAML entry (pcpus, scheduler, interrupt controller, boot
arguments), a test type is a small Python class saying what to do with a
booted machine, and a test binds a machine to that type's expectations.
Adding a configuration to CI is then a config change and a job stanza.

Patch 1 goes to test-artifacts [3] and must land first, since patches 2-6
run inside the container it adds. Patches 2-6 go to xen.git.

test-artifacts [3]:
- Add a QTB container to run the Xen riscv64 tests
    debian:13-qtb-riscv64, carrying qemu.qtb from AMD's QEMU fork and the
    dtc/fdt dependencies the framework needs at run time.

xen.git:
- automation/qtb: add jinja2 device trees for riscv64 smoke tests
    The host tree varies with hart count, MMU type and device set, so it is
    rendered per machine from a template rather than shipping one static
    .dts per configuration.
- automation/qtb: add Python QTB framework with the console-test type
    The base layer every test type builds on (machine catalog lookup, host
    DT generation, QEMU invocation, per-console log capture) plus the first
    test type, which asserts every string listed in console-test.yaml is
    printed on the expected console.
- automation/qtb: add unit tests for the QTB framework
    pytest coverage of the QEMU-agnostic parts, for developers only.
- automation/qtb: add QTB framework README
    How to add a machine, add a test type and run one locally.
- CI: run the riscv64 smoke test via QTB framework console-test
    Repoints qemu-smoke-riscv64-gcc at the framework and drops
    qemu-smoke-riscv64.sh, which then has no caller left.

Testing: Unit tests + QEMU only, as the existing riscv64 CI does.
qemu-smoke-riscv64-gcc runs the same check as before.

The catalog ships a single Xen-only machine, since Xen cannot boot a DomU
on RISC-V yet. DomU machines plus an irq-test type using QTest interrupt
injection follow once DomU support lands.

CI pipeline:
https://gitlab.com/xen-project/people/baptleduc/xen/-/pipelines/2795907042

[1] https://elisa.tech/blog/2026/07/22/the-final-phase-of-xen-safety-solving-coverage-and-residual-gaps-stefano-stabellini-amd/
[2] https://gitlab.com/xen-project/people/amd/qemu/-/tree/safety
[3] https://gitlab.com/xen-project/hardware/test-artifacts
[4] https://lore.kernel.org/xen-devel/1786980254.8631fc262581453bbf619ec5b2062170.1a01052c27d000c4f3@vates.tech/

---
Changes since v1:
- Resolve qemu-system-riscv64 from $PATH instead of pinning qemu-9.0.0 in
  test.yaml, dropping the now-unneeded OpenSBI entry too: the
  13-qtb-riscv64 container already bundles both (flagged by Zheng Zhang
  during internal review [4]). Also drops the qemu-9.0.0-riscv64
  test-artifacts dependency noted above.

Baptiste Le Duc (5):
  automation/qtb: add jinja2 device trees for riscv64 smoke tests
  automation/qtb: add Python QTB framework with the console-test type
  automation/qtb: add unit tests for the QTB framework
  automation/qtb: add QTB framework README
  CI: run the riscv64 smoke test via QTB framework console-test

 .gitlab-ci.yml                                |   3 +
 automation/gitlab-ci/test.yaml                |  20 +-
 automation/scripts/qemu-smoke-riscv64.sh      |  19 --
 automation/scripts/qemu_smoke_riscv64.py      | 122 ++++++++++
 automation/scripts/qtb/__init__.py            |   2 +
 automation/scripts/qtb/riscv/README.md        | 182 +++++++++++++++
 automation/scripts/qtb/riscv/__init__.py      |   9 +
 automation/scripts/qtb/riscv/config.py        | 119 ++++++++++
 automation/scripts/qtb/riscv/config.yaml      |  17 ++
 .../qtb/riscv/console_test/__init__.py        |   4 +
 .../qtb/riscv/console_test/console-test.yaml  |  18 ++
 .../qtb/riscv/console_test/console_test.py    | 145 ++++++++++++
 automation/scripts/qtb/riscv/dt.py            |  57 +++++
 .../scripts/qtb/riscv/dts/qemu-host.dts.j2    | 160 +++++++++++++
 automation/scripts/qtb/riscv/machine.py       |  57 +++++
 automation/scripts/qtb/riscv/paths.py         |  60 +++++
 automation/scripts/qtb/riscv/qtb_test.py      |  53 +++++
 automation/scripts/qtb/riscv/unit/__init__.py |   2 +
 automation/scripts/qtb/riscv/unit/conftest.py |  42 ++++
 .../scripts/qtb/riscv/unit/test_config.py     | 121 ++++++++++
 .../qtb/riscv/unit/test_console_test.py       | 217 ++++++++++++++++++
 automation/scripts/qtb/riscv/unit/test_dt.py  |  99 ++++++++
 .../scripts/qtb/riscv/unit/test_machine.py    |  60 +++++
 .../scripts/qtb/riscv/unit/test_temp_dir.py   |  42 ++++
 .../scripts/qtb/riscv/unit/test_xen_dt.py     |  46 ++++
 automation/scripts/qtb/riscv/xen_dt.py        |  58 +++++
 26 files changed, 1709 insertions(+), 25 deletions(-)
 delete mode 100755 automation/scripts/qemu-smoke-riscv64.sh
 create mode 100755 automation/scripts/qemu_smoke_riscv64.py
 create mode 100644 automation/scripts/qtb/__init__.py
 create mode 100644 automation/scripts/qtb/riscv/README.md
 create mode 100644 automation/scripts/qtb/riscv/__init__.py
 create mode 100644 automation/scripts/qtb/riscv/config.py
 create mode 100644 automation/scripts/qtb/riscv/config.yaml
 create mode 100644 automation/scripts/qtb/riscv/console_test/__init__.py
 create mode 100644 automation/scripts/qtb/riscv/console_test/console-test.yaml
 create mode 100644 automation/scripts/qtb/riscv/console_test/console_test.py
 create mode 100644 automation/scripts/qtb/riscv/dt.py
 create mode 100644 automation/scripts/qtb/riscv/dts/qemu-host.dts.j2
 create mode 100644 automation/scripts/qtb/riscv/machine.py
 create mode 100644 automation/scripts/qtb/riscv/paths.py
 create mode 100644 automation/scripts/qtb/riscv/qtb_test.py
 create mode 100644 automation/scripts/qtb/riscv/unit/__init__.py
 create mode 100644 automation/scripts/qtb/riscv/unit/conftest.py
 create mode 100644 automation/scripts/qtb/riscv/unit/test_config.py
 create mode 100644 automation/scripts/qtb/riscv/unit/test_console_test.py
 create mode 100644 automation/scripts/qtb/riscv/unit/test_dt.py
 create mode 100644 automation/scripts/qtb/riscv/unit/test_machine.py
 create mode 100644 automation/scripts/qtb/riscv/unit/test_temp_dir.py
 create mode 100644 automation/scripts/qtb/riscv/unit/test_xen_dt.py
 create mode 100644 automation/scripts/qtb/riscv/xen_dt.py


