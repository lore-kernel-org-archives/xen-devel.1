Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040C7C5AD7B
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 16:02:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387623.1628880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtSRn-0001XO-E3; Mon, 10 Aug 2026 16:01:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387623.1628880; Mon, 10 Aug 2026 16:01:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtSRn-0001XH-A9; Mon, 10 Aug 2026 16:01:55 +0000
Received: by outflank-mailman (input) for mailman id 1387623;
 Mon, 10 Aug 2026 16:01:53 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fec689f7e000e099@swg.vates.tech>)
 id 1wtSRl-0001XB-I1
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 16:01:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtSRk-003yAp-KY
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 18:01:52 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fec689f7e000e099@swg.vates.tech>)
 id 6a79f5e1-2eae-0a2a0a5409dd-0a2a45018502-42
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 18:01:52 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fec689f7e000e099@swg.vates.tech>)
 id 6a79f5f0-5984-0a2a45010019-b9ff1c1283ff-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 18:01:52 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fec689f7e000e099.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 10 Aug 2026 16:01:47 +0000
Received: from leducb (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id CDEB880143;
 Mon, 10 Aug 2026 18:01:45 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=mDWDY8uCcNpOoWchPUgPLSC3AhEIumSbEE6oZEH4OMs=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=orkGOrmvBqXcC5/yo/UFmyKqN0YxWs3qMjSf7eltUIA3lif439MB9sezVO9uvIMpUWf/yNLG4
 tb1vU3/5FovEcCh5MiACrbkZkzzopSKOHbusdvkAPjfk/0H3OguhFuwuC1Vu2q7USAnHrEuuSNE
 iz6jocWQQsI5QE16Y8UQ/R5Tk5Z/Wu7pUyHIWoyDsCDOujwDYWvM2+KNBXnZZD2/rcoFmakZuZL
 AT7KDZtI91esKRgkJ7wqdA36vx8vJC4xCireKx+L8xpca1x7kAQPiPrGnVt1nNXC6WTgu3b/+Kg
 IdFihvX3tXavbvQw0tTVsKmcYVLkqi/ti0OlU7ep3llQ==
X-Zone-Loop: c8e3ca4d7798ec05392c0dd2ef91c4d0587d2a8872c6
x-campaign-type: default
x-transaction-id: ab6c9570-46a5-487a-a4d1-af9b08c5d184
x-swg-uid: 01-3221a14d-cc91-447f-964c-cd7f08f435e1
X-Mailer: Sweego
Message-ID:
 <1786377707.8631fc262581453bbf619ec5b2062170.19fec689f7e000e099@vates.tech>
x-swg-bid: 1786377707.8631fc262581453bbf619ec5b2062170.19fec689f7e000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>
Subject: [PATCH 0/6] automation: add QTB test framework for riscv64 smoke tests
Date: Mon, 10 Aug 2026 18:01:13 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2047.9748927987cc8332.19fec6899c0.104ee129b456d5ba=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1786377705920
X-purgate-ID: tlsNG-d62444/1786377712-1E07B757-9824E1D3/0/0
X-purgate-type: clean
X-purgate-size: 8391

---=Part.2047.9748927987cc8332.19fec6899c0.104ee129b456d5ba=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Xen is being made safety certifiable to IEC 61508 SIL 3 and ISO 26262 ASIL
D, with Arm and x86 as the current targets [1]=2E Evidence at those levels=
 is
requirements based testing plus structural coverage, produced automaticall=
y
and repeatably in CI=2E

QTB (QEMU Test Bench) [2] is the framework AMD wrote for it as part of the
Xen safety initiative=2E It drives a live QEMU instance over qtest, QMP an=
d
GDB, so a test has full access to the machine while emulation runs: read
and write the consoles, inspect registers and memory, inject interrupts an=
d
faults, all from Python and all reproducible in a pipeline=2E QTB is not
upstream in QEMU yet, but is planned to be=2E

RISC-V is not in the certification scope today=2E It is also the youngest
port, so it has close to no test infrastructure to undo, which makes it th=
e
cheapest place to adopt QTB=2E Starting the riscv64 tests on the framework
now means the port grows its tests in the shape certification asks for as
the port itself grows, instead of a pile of expect scripts to convert late=
r
if riscv64 ever becomes a certification target=2E It also puts a second
architecture on QTB, which is useful to the framework itself before it is
proposed to QEMU upstream=2E

Concretely, the riscv64 CI coverage today is one expect script,
automation/scripts/qemu-smoke-riscv64=2Esh, which boots Xen alone under QE=
MU
and greps a single string out of one serial console=2E The machine it boot=
s
is hardcoded, so a second configuration means a second script, and a test
with a DomU in it means growing guest handling from scratch=2E

This series replaces that script with a data-driven framework using QTB=2E=
 A
machine is a YAML entry (pcpus, scheduler, interrupt controller, boot
arguments), a test type is a small Python class saying what to do with a
booted machine, and a test binds a machine to that type's expectations=2E
Adding a configuration to CI is then a config change and a job stanza=2E

Patch 1 goes to test-artifacts [3] and must land first, since patches 2-6
run inside the container it adds=2E Patches 2-6 go to xen=2Egit=2E
qemu-smoke-riscv64-gcc also pulls the riscv64 QEMU and OpenSBI binaries
from the qemu-9=2E0=2E0-riscv64 job in test-artifacts, which is not in
test-artifacts master yet and has to land there too=2E

test-artifacts [3]:
- Add a QTB container to run the Xen riscv64 tests
    debian:13-qtb-riscv64, carrying qemu=2Eqtb from AMD's QEMU fork and th=
e
    dtc/fdt dependencies the framework needs at run time=2E

xen=2Egit:
- automation/qtb: add jinja2 device trees for riscv64 smoke tests
    The host tree varies with hart count, MMU type and device set, so it i=
s
    rendered per machine from a template rather than shipping one static
    =2Edts per configuration=2E
- automation/qtb: add Python QTB framework with the console-test type
    The base layer every test type builds on (machine catalog lookup, host
    DT generation, QEMU invocation, per-console log capture) plus the firs=
t
    test type, which asserts every string listed in console-test=2Eyaml is
    printed on the expected console=2E
- automation/qtb: add unit tests for the QTB framework
    pytest coverage of the QEMU-agnostic parts, for developers only=2E
- automation/qtb: add QTB framework README
    How to add a machine, add a test type and run one locally=2E
- CI: run the riscv64 smoke test via QTB framework console-test
    Repoints qemu-smoke-riscv64-gcc at the framework and drops
    qemu-smoke-riscv64=2Esh, which then has no caller left=2E

Testing: QEMU only, as the existing riscv64 CI does=2E
qemu-smoke-riscv64-gcc runs the same check as before=2E

The catalog ships a single Xen-only machine, since Xen cannot boot a DomU
on RISC-V yet=2E DomU machines plus an irq-test type using QTest interrupt
injection follow once DomU support lands=2E

[1] https://elisa=2Etech/blog/2026/07/22/the-final-phase-of-xen-safety-sol=
ving-coverage-and-residual-gaps-stefano-stabellini-amd/
[2] https://gitlab=2Ecom/xen-project/people/amd/qemu/-/tree/safety
[3] https://gitlab=2Ecom/xen-project/hardware/test-artifacts

CI test:
https://gitlab=2Ecom/xen-project/people/baptleduc/xen/-/pipelines/27408369=
46

Baptiste Le Duc (5):
  automation/qtb: add jinja2 device trees for riscv64 smoke tests
  automation/qtb: add Python QTB framework with the console-test type
  automation/qtb: add unit tests for the QTB framework
  automation/qtb: add QTB framework README
  CI: run the riscv64 smoke test via QTB framework console-test

 =2Egitlab-ci=2Eyml                                |   3 +
 automation/gitlab-ci/test=2Eyaml                |  26 ++-
 automation/scripts/qemu-smoke-riscv64=2Esh      |  19 --
 automation/scripts/qemu_smoke_riscv64=2Epy      | 122 ++++++++++
 automation/scripts/qtb/__init__=2Epy            |   2 +
 automation/scripts/qtb/riscv/README=2Emd        | 182 +++++++++++++++
 automation/scripts/qtb/riscv/__init__=2Epy      |   9 +
 automation/scripts/qtb/riscv/config=2Epy        | 125 ++++++++++
 automation/scripts/qtb/riscv/config=2Eyaml      |  19 ++
 =2E=2E=2E/qtb/riscv/console_test/__init__=2Epy        |   4 +
 =2E=2E=2E/qtb/riscv/console_test/console-test=2Eyaml  |  18 ++
 =2E=2E=2E/qtb/riscv/console_test/console_test=2Epy    | 145 ++++++++++++
 automation/scripts/qtb/riscv/dt=2Epy            |  57 +++++
 =2E=2E=2E/scripts/qtb/riscv/dts/qemu-host=2Edts=2Ej2    | 160 +++++++++++=
++
 automation/scripts/qtb/riscv/machine=2Epy       |  56 +++++
 automation/scripts/qtb/riscv/paths=2Epy         |  51 ++++
 automation/scripts/qtb/riscv/qtb_test=2Epy      |  53 +++++
 automation/scripts/qtb/riscv/unit/__init__=2Epy |   2 +
 automation/scripts/qtb/riscv/unit/conftest=2Epy |  42 ++++
 =2E=2E=2E/scripts/qtb/riscv/unit/test_config=2Epy     | 128 +++++++++++
 =2E=2E=2E/qtb/riscv/unit/test_console_test=2Epy       | 217 +++++++++++++=
+++++
 automation/scripts/qtb/riscv/unit/test_dt=2Epy  |  99 ++++++++
 =2E=2E=2E/scripts/qtb/riscv/unit/test_machine=2Epy    |  58 +++++
 =2E=2E=2E/scripts/qtb/riscv/unit/test_temp_dir=2Epy   |  42 ++++
 =2E=2E=2E/scripts/qtb/riscv/unit/test_xen_dt=2Epy     |  46 ++++
 automation/scripts/qtb/riscv/xen_dt=2Epy        |  58 +++++
 26 files changed, 1718 insertions(+), 25 deletions(-)
 delete mode 100755 automation/scripts/qemu-smoke-riscv64=2Esh
 create mode 100755 automation/scripts/qemu_smoke_riscv64=2Epy
 create mode 100644 automation/scripts/qtb/__init__=2Epy
 create mode 100644 automation/scripts/qtb/riscv/README=2Emd
 create mode 100644 automation/scripts/qtb/riscv/__init__=2Epy
 create mode 100644 automation/scripts/qtb/riscv/config=2Epy
 create mode 100644 automation/scripts/qtb/riscv/config=2Eyaml
 create mode 100644 automation/scripts/qtb/riscv/console_test/__init__=2Ep=
y
 create mode 100644 automation/scripts/qtb/riscv/console_test/console-test=
=2Eyaml
 create mode 100644 automation/scripts/qtb/riscv/console_test/console_test=
=2Epy
 create mode 100644 automation/scripts/qtb/riscv/dt=2Epy
 create mode 100644 automation/scripts/qtb/riscv/dts/qemu-host=2Edts=2Ej2
 create mode 100644 automation/scripts/qtb/riscv/machine=2Epy
 create mode 100644 automation/scripts/qtb/riscv/paths=2Epy
 create mode 100644 automation/scripts/qtb/riscv/qtb_test=2Epy
 create mode 100644 automation/scripts/qtb/riscv/unit/__init__=2Epy
 create mode 100644 automation/scripts/qtb/riscv/unit/conftest=2Epy
 create mode 100644 automation/scripts/qtb/riscv/unit/test_config=2Epy
 create mode 100644 automation/scripts/qtb/riscv/unit/test_console_test=2E=
py
 create mode 100644 automation/scripts/qtb/riscv/unit/test_dt=2Epy
 create mode 100644 automation/scripts/qtb/riscv/unit/test_machine=2Epy
 create mode 100644 automation/scripts/qtb/riscv/unit/test_temp_dir=2Epy
 create mode 100644 automation/scripts/qtb/riscv/unit/test_xen_dt=2Epy
 create mode 100644 automation/scripts/qtb/riscv/xen_dt=2Epy

--=20
2=2E55=2E0



-- 
Baptiste Le Duc | Vates Hypervisor & Kernel Engineer

XCP-ng & Xen Orc=
hestra - Vates solutions

web: https://vates=2Etech
---=Part.2047.9748927987cc8332.19fec6899c0.104ee129b456d5ba=---

