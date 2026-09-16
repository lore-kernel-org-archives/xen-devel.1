Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB21C88E5C
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 11:36:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1422815.1648119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6nvN-0004dO-Os; Wed, 16 Sep 2026 11:35:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1422815.1648119; Wed, 16 Sep 2026 11:35:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6nvN-0004dD-JS; Wed, 16 Sep 2026 11:35:37 +0000
Received: by outflank-mailman (input) for mailman id 1422815;
 Wed, 16 Sep 2026 11:35:36 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ayan.kumar.halder@amd.com>) id 1x6nvM-0004bw-0q
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 11:35:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6nvK-007kMV-Fd
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 13:35:34 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6aaa7f03-bab6-0a2a0a5309dd-0a2a450ce87e-20
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 13:35:33 +0200
Received: from [52.101.57.31]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6aaa7f04-f479-0a2a450c0019-3465391f34fc-4
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 13:35:33 +0200
Received: from BN9PR03CA0254.namprd03.prod.outlook.com (2603:10b6:408:ff::19)
 by DS7PR12MB5718.namprd12.prod.outlook.com (2603:10b6:8:71::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 11:35:26 +0000
Received: from BN2PEPF000044A8.namprd04.prod.outlook.com
 (2603:10b6:408:ff:cafe::82) by BN9PR03CA0254.outlook.office365.com
 (2603:10b6:408:ff::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Wed,
 16 Sep 2026 11:35:24 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000044A8.mail.protection.outlook.com (10.167.243.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Wed, 16 Sep 2026 11:35:24 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 16 Sep
 2026 06:35:24 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via
 Frontend Transport; Wed, 16 Sep 2026 06:35:23 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UijxvMgJUc1Cdm1VX5c/02X+1e0tUKjKB/XAVLdlcCHQ+TCQRwjOZd5Civ3QsluqEoBUdljs1veTvAIrMVV+j1Hyq9SJ4cF8ejWmmhS6QhS8EJZRKKo2Lh/R25jHik3uerpqH7tuGoGFqWUQoOpBpx8U6sFDplV7xzPIAuGLStDDVW1o2W3Ld7VBWWwfqvYzxZpFFibqp5Kh+9kEjKlaJwrpyh/vy0WcuzqLhmNRhUzntmE5rR4JaBDUW9T1iVC/OGwa8c//M0Cbby/Lv8xzJ/an6ANHi/ScQ7ksshhKtB+d5q1Pm+Ezg/sbtbdKL9YFPwEHql2nyDLWIw1NLSwJRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xrc0yfbW430zJrQysRPIrSUuJKNogQEEXYt7wQuJzTk=;
 b=iAQlXARduT4k6FAWlzOWYAgRihEHESmtn5JgBh7dYYlwOVVfQNbOD7CUqVk5P8hiDCoxc9W5KRZLjXw1C4aZVZR+dmh9603gQtoxeUJKHwa9HUmU0CX4vl8wgaR/i1VJpYDah0KFLrJ1xp2sCSU4sYAIoWvWY7GQLqlesYXBtREmNfI/An5pnN9qNyZMQ/JC/gK94dxPVdKj5tGjO1kYqgpZld9u5sdsTze7tiTl8AwMs3R/sCD1bdND4NmF6F5ssLK16wWg4o0P5euVKDcPBMqIwg4/XuwXzSYjRNqvwaKzFH2Q0CVcOOKsG2AvSRLHecz9fB1fyUn6KeEWfYXOaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xrc0yfbW430zJrQysRPIrSUuJKNogQEEXYt7wQuJzTk=;
 b=SFobVkwRy1qKmtXgFCEbSeRkrKpHXfl443wq+ZdLXzDebP8YI4iUKM1hWyGa2GroeAnaZGd/+lPx6e+KPOkxbsAsYGrx80YdRHVfeD4s1FzIf0Y0o+t+X3Xum3zFimdcBCZqzOrLbRZGn7SiAvT7HnWU3XpTje9wtj1rfjvk0zc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne
	<roger@xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v4 for 4.23] Add GIC SGI boot/self tests in Xen
Date: Wed, 16 Sep 2026 12:35:20 +0100
Message-ID: <20260916113520.3870182-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A8:EE_|DS7PR12MB5718:EE_
X-MS-Office365-Filtering-Correlation-Id: b078d290-02fe-4873-2f1e-08df13e6996b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|7416014|82310400026|376014|1800799024|11063799006|56012099006|10067099003|18002099003|6133799003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info:
	/NsNvaSuCNqTkGlCegv4dF29jzmiaA8Ha0I8c1+N5pRgzqR8Xs4zBpX/pOICk1X10kLI622jWz+QBYpcVfkZpHDASxSqD11Htq03vJ56fFdzA5xneXg9Q8Ynw+ARy9G3h09ZElvBWGcyI78nNpLbbs3q1NxSZjmx2ZXIuDUufbD/OXbNdEZjxMKK3HnyzISGCy63fDsLh7oeRtgoMpGUP6U5EuUsi9WogSQUG+rNguzxCEOIcNoowJOuDCPrfpsuB7OcmpdI+3NOZRtEYrD7gRgy4A/cyfzzWGNpa4Cr/8elu5h/B9bQXZr/qKYqdRUTWvkhBhyizmWn3wfzV1MxVd/Oid/SBjlWTKh/518jjAgzssnSayW1Pl/Dbd+nKeRw1/8/j3J/1hc5pS/lIgNPA89RCI3K7jqeZeqe2YuX6ZKyX1HbwArBlYJm2Roca/GEOdsBnfxB4yq+vlZboEBZYeeGXjnFtUZL4V0aPJhQJ9sAe7PYmu2dtg5cpOq+190PSYF53x7E+hrwwjfixyRqoZkpdD6JO6OKsoHOySiFuugFYfON4Ce/0NMEcjxsxG7R+nIdiveB6tXCgelTw+Tkr1nbLPGN7SXDuXqO/Hb2Q1hpk2yKZZLQUVGsucI9Ls7ka1Fz0bPzKiXG6BTkxGppkw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(82310400026)(376014)(1800799024)(11063799006)(56012099006)(10067099003)(18002099003)(6133799003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FRG4pgQuR+NHZVva3sqosX/VGPIyOZXl40agbowTCXKXP24DOY/AU3HlpFttDEqTMF8u37lT5z6tc6gJDtaA8sv2o/tvqfqo2KCBIMSmwyVaASVOGjg61Z5G86jlIieEBWt1hnoeT/RC9zUSCzDAMHhYJKXNG9cgzWAjERdCeRE4j0Z45lKvUqRWfjXwvLIs9P2HIJkYq+3MpG/5L9BakaZibQSurLCXab6O7YzbGhNuKVvsL9fqG5xMmwkAQiErnomga3TxOFOUhgyDfZlwfsedQ7U4RHUtTR9HS0PrxnFsu5ofuWxJtbhp80hIrClD96ctFNsFK9BwFhAM8c7D1n9se9+nTMv/KTKOJiMK5Mrm/0GcaG70VzowI6aYiSx+E6Tjfthb4dg73A6arYR3A0KM6cCAivwngzxgmzIJ6kl5S2Ok8W7UPWlPFe/vMJ7r
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 11:35:24.6840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b078d290-02fe-4873-2f1e-08df13e6996b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5718
X-purgate-ID: tlsNG-d25034/1789558533-024DFA5B-31BE9BA7/0/0
X-purgate-type: clean
X-purgate-size: 16383

Boot self-tests (also referred to as boot-time tests or power-on
self-tests) are intended to check that Xen has configured the hardware
correctly before bringing up any domains.

Introduce tests to confirm that, using a dedicated SGI (GIC_SGI_TEST):
1. A cpu can send the SGI to itself
2. A cpu can send the SGI to another specific CPU (CPU0)
3. A cpu can send the SGI to all the other CPUs

Each CPU counts the test SGIs it takes. A sender samples those counters
before sending and then waits for the count of every CPU it targeted to
change, which is how it tells that the SGI was really delivered. The
counters are never reset, so comparing against a sample rather than an
absolute value keeps concurrent senders from disturbing each other.

A test reports a failure by panic(), so Xen never continues on a
platform where SGI delivery is broken. When the tests pass, Xen carries
on booting normally.

Also introduce a config CONFIG_BOOT_SELFTEST which enables these
tests. It depends on DEBUG and is off unless explicitly enabled.

Also introduce a boolean command line parameter "gic-test", so that a
build with CONFIG_BOOT_SELFTEST enabled can be shipped but the tests
selected at boot. It is documented in
docs/misc/xen-command-line.pandoc.

In order to keep all the boot self-tests together in the binary, a
separate section "initcallboottest" is introduced. Tests are registered
using __initcallboottest() and run once on every CPU by
do_init_boottests(), bracketed by begin/end messages. They run before
any domain is created on the primary core, and before the idle loop is
entered on a secondary core.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Link to v3:
https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg215355.html

Upstream CI run:
https://gitlab.com/xen-project/people/ayankuma/xen/-/pipelines/2853709475

Changes in v4:
 - gic-test.c is SPDX GPL-2.0-only; COPYING states v2-only is the only
   valid version. v3 had changed this to GPL-2.0-or-later to match the
   neighbouring GIC files, which was wrong (Julien).
 - The SGI handler uses ACCESS_ONCE() for the increment as well as the
   read, since the counter is published to another CPU. Not an atomic:
   only the receiving CPU writes its own counter (Julien).
 - Dropped the file name from the gic_sgi_test_interrupt() comment in
   asm/gic.h (Julien).
 - asm/setup.h is included after asm/tee/tee.h in smpboot.c (Julien).
 - Sent as a new thread rather than in-reply-to v3 (Julien).
 - Rebased onto current staging (adbbbd47a1); applied unchanged.

 automation/gitlab-ci/build.yaml               |   8 ++
 automation/gitlab-ci/test.yaml                |   8 ++
 .../scripts/qemu-boot-selftest-arm64.sh       |  72 +++++++++++++
 docs/misc/xen-command-line.pandoc             |  10 ++
 xen/arch/arm/Kconfig                          |  13 +++
 xen/arch/arm/Makefile                         |   1 +
 xen/arch/arm/gic-test.c                       | 102 ++++++++++++++++++
 xen/arch/arm/gic.c                            |   5 +
 xen/arch/arm/include/asm/gic.h                |   8 ++
 xen/arch/arm/include/asm/setup.h              |   9 ++
 xen/arch/arm/setup.c                          |  20 ++++
 xen/arch/arm/smpboot.c                        |   3 +
 xen/arch/arm/xen.lds.S                        |   4 +
 13 files changed, 263 insertions(+)
 create mode 100755 automation/scripts/qemu-boot-selftest-arm64.sh
 create mode 100644 xen/arch/arm/gic-test.c

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 27eefec5f9..3d37e0b572 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -420,6 +420,14 @@ alpine-3.24-arm64-gcc-debug:
       CONFIG_UBSAN=y
       CONFIG_UBSAN_FATAL=y
 
+alpine-3.24-arm64-gcc-debug-boot-selftest:
+  extends: .gcc-arm64-build-debug
+  <<: *build-test
+  variables:
+    CONTAINER: alpine:3.24-arm64v8
+    EXTRA_XEN_CONFIG: |
+      CONFIG_BOOT_SELFTEST=y
+
 alpine-3.24-arm64-gcc-randconfig:
   extends: .gcc-arm64-build
   variables:
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 61adc1baff..96127995d7 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -605,6 +605,14 @@ qemu-smoke-dom0less-arm64-gcc-debug-gicv3:
     - *arm64-test-needs
     - alpine-3.24-arm64-gcc-debug
 
+qemu-smoke-boot-selftest-arm64-gcc-debug:
+  extends: .qemu-arm64
+  script:
+    - ./automation/scripts/qemu-boot-selftest-arm64.sh 2>&1 | tee ${LOGFILE}
+  needs:
+    - *arm64-test-needs
+    - alpine-3.24-arm64-gcc-debug-boot-selftest
+
 qemu-smoke-dom0less-arm64-gcc-debug-staticmem:
   extends: .qemu-arm64
   script:
diff --git a/automation/scripts/qemu-boot-selftest-arm64.sh b/automation/scripts/qemu-boot-selftest-arm64.sh
new file mode 100755
index 0000000000..e36bd8d94a
--- /dev/null
+++ b/automation/scripts/qemu-boot-selftest-arm64.sh
@@ -0,0 +1,72 @@
+#!/bin/bash
+
+set -ex -o pipefail
+
+# Boot Xen under QEMU with gic-test in xen,xen-bootargs and check that every
+# self-test reported OK and that Xen carried on booting.
+
+XEN=binaries/xen
+# qemu-system-aarch64 comes from the debian:13-arm64v8 test container, the
+# same way the other qemu-smoke-*-arm64 scripts get it.
+QEMU=qemu-system-aarch64
+DTB_RAW=binaries/virt.dtb
+DTB=binaries/virt-bootselftest.dtb
+LOG=smoke.serial
+
+NR_CPUS=4
+
+test -f ${XEN}
+
+${QEMU} \
+    -machine virt,virtualization=true,gic-version=3,dumpdtb=${DTB_RAW} \
+    -cpu cortex-a57 -m 1024 -smp ${NR_CPUS} -display none -net none
+
+cp ${DTB_RAW} ${DTB}
+fdtput -t s ${DTB} /chosen xen,xen-bootargs \
+    "gic-test console=dtuart sync_console"
+
+rm -f ${LOG}
+timeout 60 ${QEMU} \
+    -machine virt,virtualization=true,gic-version=3 \
+    -cpu cortex-a57 -m 1024 -smp ${NR_CPUS} \
+    -serial file:${LOG} \
+    -monitor none -display none -no-reboot -net none \
+    -dtb ${DTB} \
+    -kernel ${XEN} || true
+
+fail=0
+
+check() {
+    local what=$1
+    local expected=$2
+    local got
+
+    got=$(grep -c -- "${what}" ${LOG} || true)
+    if [ "${got}" -ne "${expected}" ]; then
+        echo "FAIL: '${what}': expected ${expected}, got ${got}"
+        fail=1
+        return
+    fi
+
+    echo "OK: '${what}' x${expected}"
+}
+
+# Every CPU sends an SGI to itself...
+check "GIC selftest: CPU[0-9]*: SGI to self: OK" ${NR_CPUS}
+# ...every secondary CPU sends one to CPU0...
+check "GIC selftest: CPU[0-9]*: SGI to CPU0: OK" $((NR_CPUS - 1))
+# ...and whichever CPU runs last sends one to all the others.
+check "GIC selftest: CPU[0-9]*: SGI to all but self: OK" 1
+
+check "boot self-tests done" ${NR_CPUS}
+check "GIC selftest: .*did not receive" 0
+
+# A passing self-test must leave Xen booting normally.
+check "LOADING DOMAIN 0\|Xen dom0less mode detected" 1
+
+if [ ${fail} -ne 0 ]; then
+    echo "FAILED"
+    exit 1
+fi
+
+echo "PASSED"
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index b2c94ae56d..ea0e3368b1 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1282,6 +1282,16 @@ available on Intel Panther Lake and Diamond Rapids CPUs, and AMD Zen6 CPUs.
 FRED is fully supported on AMD hardware.  On Intel hardware it is still tech
 preview, and in particular not security supported.
 
+### gic-test (arm)
+> `= <boolean>`
+
+> Default: `false`
+
+Only available when `CONFIG_BOOT_SELFTEST` is enabled.
+
+Run the GIC SGI boot self-tests while each CPU is brought up.  Xen panics if
+an SGI is not delivered; otherwise it carries on booting normally.
+
 ### gnttab
 > `= List of [ max-ver:<integer>, transitive=<bool>, transfer=<bool> ]`
 
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 843a43897e..92a1788854 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -498,6 +498,19 @@ config ARM64_HARDEN_BRANCH_PREDICTOR
 config ARM32_HARDEN_BRANCH_PREDICTOR
     def_bool y if ARM_32 && HARDEN_BRANCH_PREDICTOR
 
+config BOOT_SELFTEST
+	bool "Enable boot self-tests"
+	depends on DEBUG
+	help
+	  This option enables boot self-tests. They are intended to check that
+	  Xen has configured the hardware correctly before bringing up any
+	  domains. A failure is reported by panic(); when the tests pass, Xen
+	  boots normally.
+
+	  Selected at boot with the "gic-test" command line option.
+
+	  If unsure, say N.
+
 source "arch/arm/platforms/Kconfig"
 
 source "common/Kconfig"
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index b7afd3e58c..71f177824b 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -24,6 +24,7 @@ obj-y += domctl.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += efi/
 obj-y += gic.o
+obj-$(CONFIG_BOOT_SELFTEST) += gic-test.o
 obj-$(CONFIG_GICV2) += gic-v2.o
 obj-$(CONFIG_GICV3) += gic-v3.o
 obj-$(CONFIG_HAS_ITS) += gic-v3-its.o
diff --git a/xen/arch/arm/gic-test.c b/xen/arch/arm/gic-test.c
new file mode 100644
index 0000000000..c2ffe2e9b9
--- /dev/null
+++ b/xen/arch/arm/gic-test.c
@@ -0,0 +1,102 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/atomic.h>
+#include <xen/cpumask.h>
+#include <xen/init.h>
+#include <xen/lib.h>
+#include <xen/param.h>
+#include <xen/percpu.h>
+#include <xen/smp.h>
+#include <xen/time.h>
+#include <asm/gic.h>
+#include <asm/processor.h>
+#include <asm/setup.h>
+
+static bool __initdata opt_gic_test;
+boolean_param("gic-test", opt_gic_test);
+
+static DEFINE_PER_CPU(unsigned int, sgi_test_count);
+
+void gic_sgi_test_interrupt(void)
+{
+    ACCESS_ONCE(this_cpu(sgi_test_count))++;
+}
+
+static unsigned int __init sgi_count(unsigned int cpu)
+{
+    return ACCESS_ONCE(per_cpu(sgi_test_count, cpu));
+}
+
+static void __init snapshot_sgi(unsigned int *before)
+{
+    unsigned int cpu;
+
+    for_each_online_cpu ( cpu )
+        before[cpu] = sgi_count(cpu);
+}
+
+/*
+ * Wait for every CPU in @mask to take one more GIC_SGI_TEST than the count
+ * recorded in @before.
+ */
+static void __init expect_sgi(const cpumask_t *mask,
+                              const unsigned int *before, const char *what)
+{
+    s_time_t deadline = NOW() + MILLISECS(100);
+    unsigned int cpu;
+
+    for_each_cpu ( cpu, mask )
+    {
+        while ( sgi_count(cpu) == before[cpu] )
+        {
+            if ( NOW() > deadline )
+                panic("GIC selftest: %s: CPU%u did not receive GIC_SGI_TEST\n",
+                      what, cpu);
+            cpu_relax();
+        }
+    }
+
+    printk("GIC selftest: CPU%u: %s: OK\n", smp_processor_id(), what);
+}
+
+/*
+ * "All but self" is only meaningful once every CPU can take an SGI, so it is
+ * run by whichever CPU observes that it is the last one to get here.
+ */
+static int __init gic_sgi_selftest(void)
+{
+    static atomic_t __initdata seen = ATOMIC_INIT(0);
+    unsigned int before[NR_CPUS] = { };
+    unsigned int cpu = smp_processor_id();
+
+    if ( !opt_gic_test )
+        return 0;
+
+    snapshot_sgi(before);
+    send_SGI_self(GIC_SGI_TEST);
+    expect_sgi(cpumask_of(cpu), before, "SGI to self");
+
+    if ( cpu != 0 )
+    {
+        snapshot_sgi(before);
+        send_SGI_one(0, GIC_SGI_TEST);
+        expect_sgi(cpumask_of(0), before, "SGI to CPU0");
+    }
+
+    if ( atomic_add_return(1, &seen) == num_online_cpus() )
+    {
+        cpumask_t target;
+
+        cpumask_andnot(&target, &cpu_online_map, cpumask_of(cpu));
+
+        if ( !cpumask_empty(&target) )
+        {
+            snapshot_sgi(before);
+            send_SGI_allbutself(GIC_SGI_TEST);
+            expect_sgi(&target, before, "SGI to all but self");
+        }
+    }
+
+    return 0;
+}
+__initcallboottest(gic_sgi_selftest);
diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index 078049e741..6a132c64e1 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -330,6 +330,11 @@ static void do_static_sgi(struct cpu_user_regs *regs, enum gic_sgi sgi)
     case GIC_SGI_CALL_FUNCTION:
         smp_call_function_interrupt();
         break;
+#ifdef CONFIG_BOOT_SELFTEST
+    case GIC_SGI_TEST:
+        gic_sgi_test_interrupt();
+        break;
+#endif
     default:
         panic("Unhandled SGI %d on CPU%d\n", sgi, smp_processor_id());
         break;
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
index ee2c26adb4..33dca9dcc6 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -306,6 +306,9 @@ enum gic_sgi {
     GIC_SGI_EVENT_CHECK,
     GIC_SGI_DUMP_STATE,
     GIC_SGI_CALL_FUNCTION,
+#ifdef CONFIG_BOOT_SELFTEST
+    GIC_SGI_TEST,
+#endif
     GIC_SGI_STATIC_MAX,
 };
 
@@ -321,6 +324,11 @@ extern void send_SGI_one(unsigned int cpu, enum gic_sgi sgi);
 extern void send_SGI_self(enum gic_sgi sgi);
 extern void send_SGI_allbutself(enum gic_sgi sgi);
 
+#ifdef CONFIG_BOOT_SELFTEST
+/* Record a GIC_SGI_TEST delivered to this CPU. */
+void gic_sgi_test_interrupt(void);
+#endif
+
 /* print useful debug info */
 extern void gic_dump_info(struct vcpu *v);
 extern void gic_dump_vgic_info(struct vcpu *v);
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 2af7805125..c491c56729 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -48,6 +48,15 @@ void setup_mm(void);
 extern uint32_t hyp_traps_vector[];
 void init_traps(void);
 
+#ifdef CONFIG_BOOT_SELFTEST
+#define __initcallboottest(fn) \
+    static const initcall_t __initcall_##fn __init_call("boottest") = (fn)
+
+void do_init_boottests(void);
+#else
+static inline void do_init_boottests(void) {}
+#endif
+
 int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
                   struct rangeset *iomem_ranges, struct rangeset *irq_ranges);
 
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 79bbf24305..16f899dff5 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -81,6 +81,24 @@ static void __init init_idle_domain(void)
     /* TODO: setup_idle_pagetable(); */
 }
 
+#ifdef CONFIG_BOOT_SELFTEST
+extern const initcall_t __initcall_boot_test_start[],
+    __initcall_boot_test_end[];
+
+void do_init_boottests(void)
+{
+    const initcall_t *call;
+
+    printk("CPU%u: boot self-tests start\n", smp_processor_id());
+
+    for ( call = __initcall_boot_test_start; call < __initcall_boot_test_end;
+          call++ )
+        (*call)();
+
+    printk("CPU%u: boot self-tests done\n", smp_processor_id());
+}
+#endif /* CONFIG_BOOT_SELFTEST */
+
 static const char * __initdata processor_implementers[] = {
     ['A'] = "ARM Limited",
     ['B'] = "Broadcom Corporation",
@@ -471,6 +489,8 @@ void asmlinkage __init noreturn start_xen(unsigned long fdt_paddr)
     enable_errata_workarounds();
     enable_cpu_features();
 
+    do_init_boottests();
+
     /* Create initial domain 0. */
     if ( !is_dom0less_mode() )
         create_dom0();
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 1806c47a08..8c9072f3c1 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -30,6 +30,7 @@
 #include <asm/psci.h>
 #include <asm/acpi.h>
 #include <asm/tee/tee.h>
+#include <asm/setup.h>
 
 /* Override macros from asm/page.h to make them work with mfn_t */
 #undef virt_to_mfn
@@ -413,6 +414,8 @@ void asmlinkage noreturn start_secondary(void)
 
     printk(XENLOG_DEBUG "CPU %u booted.\n", smp_processor_id());
 
+    do_init_boottests();
+
     startup_cpu_idle_loop();
 }
 
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index d4d9594033..7399ef4804 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -146,6 +146,10 @@ SECTIONS
        *(.initcall1.init)
        __initcall_end = .;
 
+       __initcall_boot_test_start = .;
+       *(.initcallboottest.init)
+       __initcall_boot_test_end = .;
+
        . = ALIGN(4);
        __alt_instructions = .;
        *(.altinstructions)
-- 
2.25.1


