Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C45606A33F
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 14:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=cXEWXShv
Received: from list by lists.xenproject.org with outflank-mailman.1469861.1678620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOF7y-0000vR-Pj; Tue, 03 Nov 2026 14:04:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469861.1678620; Tue, 03 Nov 2026 14:04:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOF7y-0000vK-Me; Tue, 03 Nov 2026 14:04:42 +0000
Received: by outflank-mailman (input) for mailman id 1469861;
 Tue, 03 Nov 2026 14:04:40 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOF7w-0000vE-AM
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 14:04:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOF7v-007SJY-BW
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 15:04:39 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a1b9ce9c000403d@swg.vates.tech>)
 id 6ae9e9f6-bab6-0a2a0a5309dd-0a2a4502abb8-4
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:04:39 +0100
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a1b9ce9c000403d@swg.vates.tech>)
 id 6ae9e9f6-6ca4-0a2a45020019-b9ff1c129a53-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:04:38 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1a1b9ce9c000403d.008 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 03 Nov 2026 14:04:31 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 299B980CEA;
 Tue,  3 Nov 2026 15:04:30 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=xR3LshpJf4aU8udUWzTEmL0l5bpW90W538KPPuHClJU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:feedback-id;
 b=cXEWXShvBM0KSeva+tvUeLNA1COf899JBgsM/5/JEhANTNIfquv7aG/SDJ+M9SMlBuk+ddO7O
 +6LmqYYjPFLoy1Y4AtDRfl7KVDXjvoLGYJ6D02VAQSQcTVp2wT9AfkViqSnKd6qP85Y7FIrnAwF
 R85Kz0zLBn5T+ZScrYLwOPVuNqRC+nOPQiB3/SanLQVaKpjg1umFUnZbAY2kqCReYCr3Exlm477
 q34ilEHfLj89Dwp65iiQOOvYtCb5oIlJOViD4PxO9OcEOXcQN9jqftxOWmgjJbk9mNfCEiBB/i0
 vXww63koGgJel0Ly+KrOBEpQ0QlzRxKe/ZzAEctMK2OA==
X-Zone-Loop: 04442828bf1c3092a27254946025411a94df66c4648e
x-campaign-type: default
x-transaction-id: b93ca29c-3ced-4058-ae8d-abe08ef3ffee
x-swg-uid: 01-c96d6d35-4e7f-4c8e-9947-06953e23a605
X-Mailer: Sweego
Message-ID:
 <1793714671.8631fc262581453bbf619ec5b2062170.1a1a1b9ce9c000403d@vates.tech>
x-swg-bid: 1793714671.8631fc262581453bbf619ec5b2062170.1a1a1b9ce9c000403d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	Zhang Zheng <zhangzheng@iscas.ac.cn>
Subject: [PATCH v3 0/6] CI: run the riscv64 smoke test with the QTB framework
Date: Tue,  3 Nov 2026 15:04:13 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20261103-qtb-framework-pytest-f3ed28e4bd78
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793714580; l=5996; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=/ItNJDnAZ8idEcB3e4PBLEVjvavObGnb/Xj0R/bL8Vs=; b=K2FZLfcokUN5ijqWddOyY/dD5MwhOry/whF2t3AmLWq9SbjDDkXhwbqDZQj63Xql5xH0fLDxm wR3cO2MTyCPA2RxRC8cO+0ZKl9eZscc6g0CJIztOzFF9yLTbe/sXXtT
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793714670358
X-purgate-ID: tlsNG-720697/1793714678-F38BC2AC-9951DD7E/10/73395122804
X-purgate-type: spam
X-purgate-size: 5998
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The current riscv64 smoke test (qemu-smoke-riscv64.sh) boots Xen under QEMU
and waits for "All set up" with expect. That is enough for one string on
one console, but RISC-V dom0less, in flight on xen-devel, would appreciate
having more: a matrix of pCPU counts, schedulers and domU layouts, and
checks on several consoles (Xen's and each domU's).

This series adds a small pytest framework built on AMD's QTB (QEMU Test
Bench) Python package [1]. It was written as part of the Xen safety
initiative and drives a QEMU instance over qtest, QMP and GDB, so a test
has full access to the machine while the emulation runs: read and write the
consoles, inspect registers and memory, inject interrupts and faults. QTB
is not upstream in QEMU yet, but is planned to be. Using QTB for the
riscv64 tests was suggested by Stefano Stabellini.

The pytest framework the series adds is a small wrapper on top of the QTB
framework that allows us to test the output of many different Xen
configurations with a simple pytest function. The aim is first to add more
coverage, and also to have a modular and easy way to add test logic. For
example, we plan to use it to add IRQ tests, checking that an interrupt
reaches the expected guest based on its SMP affinity.

Tests are plain pytest functions and the machine they boot is a
fixture. The per-test console logs and a JUnit report are kept as CI
artifacts, so GitLab shows per-test results. The README added in patch 4
is the best place to start reading.

Coverage is unchanged: the only test boots Xen alone on one pCPU and
waits for "All set up". The new job runs next to the expect-based one,
which patch 6 drops separately, so that patch can wait until the QTB job
has proven itself. The domU console tests are ready and will follow as
a separate series once RISC-V dom0less is merged, as they cannot pass
on staging before that.

This series:
    1: CI: add a Debian 13 riscv64 QTB container
    2-3: automation/qtb: add the QTB machine for riscv64, and the
         console-test type with a Xen boot test
    4: automation/qtb: add QTB framework README
    5: CI: add a riscv64 smoke test job using the QTB console-test
    6: CI: drop the riscv64 expect-based smoke test

Tested in GitLab CI, with the container's Debian qemu-system-riscv64 and
the OpenSBI it bundles.

Test CI pipeline:
https://gitlab.com/xen-project/people/baptleduc/xen/-/pipelines/TODO

[1] https://gitlab.com/xen-project/people/amd/qemu/-/tree/24cd7e5c0d7e4db8e651f091d0b9da2e7c58dbab/python

---
Changes in v3:
- Rework the framework by using pytest: tests are pytest functions
  parametrizing a `machine` fixture, run all at once with a JUnit
  report. The CLI, config.yaml, the per-type YAML files, the test class
  hierarchy and the attempts/retry logic are gone, so the v2 remarks on
  them no longer apply.
- Split into patches under 200 lines each.
- Move the container to xen.git (automation/build/), named
  debian:13-riscv64-qtb, with offline wheels from the fork, pytest, and
  a comment that the pinned commit is from the safety branch.
- Binaries and logs directories are given with --binaries-dir and
  --log-dir, no environment variable.
- Mirror Xen's console to stdout, so pytest shows it in the report of a
  failing test.
- Take the per-string timeout from TEST_TIMEOUT_OVERRIDE/TEST_TIMEOUT,
  like console.exp.
- Map pexpect timeouts and EOF to AssertionError (a pytest failure)
  instead of a dedicated TestFailure exception.
- Keep the host at 2GB: the follow-up domU tests boot two 512MB domUs.
- Drop the unit tests patch: nothing in CI runs them.
- Drop the Jinja2 host device tree. The follow-up domU series generates
  it from QEMU's own (-machine dumpdtb=) with fdtput, as the Arm tests
  do, and the Xen-only test here needs none.
- Keep the expect-based test, drop it in its own patch.
- Rename the CI template and job with "qtb".
- Link to v2: https://patch.msgid.link/1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech

To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Connor Davis <connojdavis@gmail.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Zhang Zheng <zhangzheng@iscas.ac.cn>

---
Baptiste Le Duc (6):
      CI: add a Debian 13 riscv64 QTB container
      automation/qtb: add the QTB machine for riscv64
      automation/qtb: add the console-test type with a Xen boot test
      automation/qtb: add QTB framework README
      CI: add a riscv64 smoke test job using the QTB console-test
      CI: drop the riscv64 expect-based smoke test

 automation/build/debian/13-riscv64-qtb.dockerfile  |  47 ++++++++
 automation/gitlab-ci/test.yaml                     |  25 ++--
 automation/scripts/containerize                    |   1 +
 automation/scripts/qemu-smoke-riscv64.sh           |  19 ---
 automation/scripts/qtb/__init__.py                 |   2 +
 automation/scripts/qtb/env.py                      |  15 +++
 automation/scripts/qtb/riscv/README.md             | 127 +++++++++++++++++++++
 automation/scripts/qtb/riscv/__init__.py           |   2 +
 automation/scripts/qtb/riscv/machine.py            |  92 +++++++++++++++
 automation/scripts/qtb/riscv/tests/__init__.py     |   2 +
 automation/scripts/qtb/riscv/tests/conftest.py     |  65 +++++++++++
 automation/scripts/qtb/riscv/tests/test_console.py |  35 ++++++
 automation/scripts/qtb/utils.py                    |  15 +++
 13 files changed, 419 insertions(+), 28 deletions(-)
---
base-commit: d8e0282815561ff67ebe6b5dfd582a586dafff48
change-id: 20261103-qtb-framework-pytest-f3ed28e4bd78

Best regards,
--  
Baptiste Le Duc <baptiste.le-duc@vates.tech>


