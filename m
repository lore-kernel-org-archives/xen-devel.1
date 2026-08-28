Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3575C61DB9
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 10:30:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401891.1637377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wztqO-0006pK-Mz; Fri, 28 Aug 2026 10:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401891.1637377; Fri, 28 Aug 2026 10:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wztqO-0006pD-Ih; Fri, 28 Aug 2026 10:29:56 +0000
Received: by outflank-mailman (input) for mailman id 1401891;
 Fri, 28 Aug 2026 10:29:56 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ayan.kumar.halder@amd.com>) id 1wztqN-0006p7-MQ
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 10:29:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wztqM-005fxq-N2
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 12:29:54 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a916320-8faa-0a2a0a5109dd-0a2a450cceec-6
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 12:29:54 +0200
Received: from [40.107.209.58]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a916320-f479-0a2a450c0019-286bd13ae80b-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 12:29:53 +0200
Received: from BN0PR03CA0053.namprd03.prod.outlook.com (2603:10b6:408:e7::28)
 by PH7PR12MB7236.namprd12.prod.outlook.com (2603:10b6:510:207::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 10:29:45 +0000
Received: from BN1PEPF0001806F.namprd04.prod.outlook.com
 (2603:10b6:408:e7:cafe::a8) by BN0PR03CA0053.outlook.office365.com
 (2603:10b6:408:e7::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Fri,
 28 Aug 2026 10:29:45 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF0001806F.mail.protection.outlook.com (10.167.245.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 10:29:45 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 05:29:45 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 05:29:44 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via
 Frontend Transport; Fri, 28 Aug 2026 05:29:43 -0500
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
 b=KFq95oFmgfruM4He2yXs8Q0we4QMsX/dG2cFb7JcXHi42aNaalNdFYDkRCyWR7VkXgfJbU+Q7lwI74JIrm/Y64y2WqbzbBBbEV3KQJtpjNn3cnYVJGHTcq6If2Ho+qur8QDDp8ssURcPPZv2C2BL9HOXHGroFY7XT9ccDw1Iula8lqunmItxVmTDkGMQlQ9gKX7YKcRYlSNZoyYJCS1WnBN3ovJovElL+y96OqBI3Fu8leWtUcebgXRlbo1tgJfE34EXJLEzsidXPIpo0B0joSQGuTgfKS0Q+jTVMVjtbY+8U6JNaC9lUQ4nQCTfD2ym5Iy5rkTHi0dpFq7tUZ+u4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rxor3PoWIi+9ZpnWGWRHjUc1xefCvkyn8RzJdpJ7jNE=;
 b=DVfYI4lda+7lTalQc+LWm5oqCnSJUACQJduTRgAWdAGH4GL3AagdI0/jpaNeTeb8tqwkEJ0TjqYlZtniGymQjkJqcipAHrQoqyt2f46vxV5Zs8s/EpWh5CJBY3gVxm5TN63psJd0nky77e7ywXE6/O3zfks0jncV3o9J9S+LpJSsQ1Sb+iXIPvZ2/nyWHKIhYhd0117+e4aaUviuR87sW5u5tGrrUlp5dPxZRcpNvdcKI2iQcuJkCJzyoSmz2ZAGogv1Fq9vtI2MFTwcUrUZswMJGw0IyIGaCTNq/cj62mDHghmajp2egRLrjcI2OMYrtNED7RBvsYza3nsXTsTKog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rxor3PoWIi+9ZpnWGWRHjUc1xefCvkyn8RzJdpJ7jNE=;
 b=HCJAH+ZsG4dU+w4UHfCBtIKbS+GwcIdgTjczvdsadZPawG5tlBRxu8/+yIhR8Ogg5oyPrejcNjW7VIfBaxbFgvF8WgOFoKy1frlf/646NQepTC4dCFoGXP38WGCM/diH3xp5QUcuiq89Axn4w0W00k74zspkFF71+JD9x5S638k=
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
Subject: [PATCH v3 for 4.23] Add GIC SGI boot/self tests in Xen
Date: Fri, 28 Aug 2026 11:29:33 +0100
Message-ID: <20260828102933.2853627-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260529170956.49797-1-ayan.kumar.halder@amd.com>
References: <20260529170956.49797-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0001806F:EE_|PH7PR12MB7236:EE_
X-MS-Office365-Filtering-Correlation-Id: 689cb2d5-8b93-4633-00f6-08df04ef4790
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|82310400026|1800799024|36860700016|10067099003|6133799003|3023799007|18002099003|22082099003|11063799006|5023799004|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	ABL1Gv6BsajNCUqY2Lkgz37OSGDVuvoMsrFLYQFBV7N3XcIDtSqs7ubpih0EzJGYUiNW42vT0cTrtim/j8vsqXmlkM5vBPAmcS+2Bf2JVIU0GMZMXIGJfGXowtwGSjqWUt5fPN6lF89HrOk0T6El7IvoJfpdjGr4swnJOMle/dpT8ZosBMICbrjUFnVJfOPbUXHi0Ox67RRXXEgRot6JP/ITsH8vETn1XOBQe1YI+Sd1VR7884CARvB6JkLNGx/LQh0ufh2v00/oBbGCWJWP9WCzfIQOeEWrOFeQlblwp9fZ8Vj5ma2W3jMPh6qMBs04sNyMTscA5vAtG6SEqXpA3wPb+tYIMmun/ebDwJs8Wkl4AcfzK2mFeZh4SngQbq4QtOtRw1E71p08N2M4ssPpndtgYGvdHymczIt3u5pVFQ90udFUlPyw+2sC/eFDagGJIQ7mws94DhRo5sg/7/yj5A/Mk5m35xxnlDTbaz6vUlWCvQDBoGUMo1PaP3c+Kazut1ftBTVTDrnftPNGGav2F6tJe5e6/4zg/ke+AY5TO9ZDORbgztW7dtMzIuTJu/Kds/pZwqBGFDrHnNMG+6VNRULCK4w3Z6TXAgQSwpSrfqk0qWMREHiEaRdbXgD6UdRb6TCQhgRudgyvkmeAzcUG5eMjwA4SjTszj1osHYPl9ca7raJ70+tgexm4ypN/zboOXXPna4rFHbNQHIWedn1gWQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(82310400026)(1800799024)(36860700016)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(11063799006)(5023799004)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UXywtoMlyyTu8VDr7KncWEkI0vqIsIAlmYZ56dmv+iH6bGUd3rlPX6gRZw6x/HlmaSthzFkmQ4rxvsR9d/qQAdrHYT6LDisSCSzehwd4Eg5pBPfFyw7WGYS9GEM0YjX+sFPRtvRSBWTmsvqZ+JUbcqFqQduH4HHkLfyM3wx/4NKDMPsGQG+JeGWRoz5OHzX4NYsV7b4fwgdjQCJUDexXQ0SwpOotwwhfZEH4ngo5jGNk/6/tNpGsqKMiLjXwoHlb2NGZhrNzqtCmtsEyrYaXKSWi33DhsjqD3Kpqt7AYaz/BcpRjD9XjX8VyaB42YeXOlDTWsvQt6UgfS7S9/vN/cqeHq7cc0lU8WLcoBbhI/4SRxPPabUyuCwvGDt7LAXJpmaB1vRnvf7G3ZTbKAmP82kk9Q+rPYOJ483uqzGWPV0w5TNxl0PIpS4eb1scV3IW/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 10:29:45.3794
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 689cb2d5-8b93-4633-00f6-08df04ef4790
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0001806F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7236
X-purgate-ID: tlsNG-d25034/1787912994-02EDAA5B-3FD90508/0/0
X-purgate-type: clean
X-purgate-size: 20211

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
Upstream CI run:
https://gitlab.com/xen-project/people/ayankuma/xen/-/pipelines/2799278627

Changes in v3:
 - Rewrote the commit message: dropped the claim that Xen is not
   functional after the tests (it is), and the misleading "SGI 0 / SGI 1"
   numbering - only one SGI, GIC_SGI_TEST, is used (Julien).
 - Retitled from "GICv3 SGI" to "GIC SGI": the tests only use
   send_SGI_{self,one,allbutself}(), which GICv2 implements too. Verified
   by running them on arm32/GICv2.
 - The tests are now self-checking instead of log-scraping: each CPU
   counts the GIC_SGI_TEST interrupts it takes and the sender waits for
   that count, panicking after 100ms. Xen no longer continues on a
   platform where SGI delivery is broken, and is otherwise unaffected,
   so the option is meaningful on an ordinary debug build (Julien).
 - CONFIG_BOOT_SELFTEST now depends on DEBUG (Julien).
 - "gic-test" is a boolean_param() and is documented in
   docs/misc/xen-command-line.pandoc (Julien).
 - Dropped the unnecessary <xen/delay.h> and <xen/shutdown.h> includes,
   and the unchecked smp_send_state_dump() call (Julien).
 - The "all but self" test is run by whichever CPU observes it is the
   last to arrive, comparing against num_online_cpus(), and targets
   cpu_online_map minus itself, rather than keying off
   smp_get_max_cpus() - 1 (Julien).
 - do_init_boottests() prints a begin/end marker (Julien).
 - Removed the spurious blank line before the closing brace (Julien).
 - The CI test now boots 4 CPUs, so that "send to CPU0" and "send to all
   but self" cover different sets of CPUs (Julien).
 - The registration macro and do_init_boottests() moved to arch/arm, so
   that xen/include/xen/init.h and xen/common/kernel.c are untouched: the
   .initcallboottest.init section only exists in arch/arm/xen.lds.S, and a
   test registered elsewhere would land in an orphan section.
 - do_init_boottests() is no longer __init: it is called from
   start_secondary(), which lives in .text.
 - The static counter used to spot the last CPU is __initdata, so it no
   longer occupies .bss for the life of the hypervisor.
 - Kconfig: use tabs to match the rest of arch/arm/Kconfig, and drop the
   redundant "default n".
 - gic-test.c is SPDX GPL-2.0-or-later, to match the neighbouring GIC
   files.
 - The CI test script takes qemu-system-aarch64 from the test container's
   PATH, the same way the other qemu-smoke-*-arm64 scripts do, rather
   than expecting it in binaries/.
 - Rebased onto current staging: the CI jobs are named after alpine 3.24
   rather than 3.18.

Changes in v2:
 - Renamed the patch from "xen/arm: Introduce GICV3 Self Tests" to
   "Add GICv3 SGI boot/self tests in Xen", and rewrote the commit
   message to explain the intent of boot self-tests (debug /
   validation builds only, Xen not expected to remain functional
   afterwards).
 - Moved the selftest code out of gic-v3.c into a dedicated file
   xen/arch/arm/gic-test.c, gated by CONFIG_BOOT_SELFTEST
   (Stefano, Grygorii).
 - Introduced a generic boot-self-test framework: new section
   "initcallboottest", registration macro __initcallboottest, and
   do_init_boottests() invoked once per CPU after
   local_irq_enable(), so the test runs on every CPU (boot +
   secondaries) and no longer collides with the IRQ-enable timing
   in gicv3_init() (Julien #1, Julien #3).
 - Added Kconfig option CONFIG_BOOT_SELFTEST in
   xen/arch/arm/Kconfig (arm-only for now; arch-specific because
   the only registered test is GICv3-specific).
 - Reserved a dedicated SGI value GIC_SGI_TEST in enum gic_sgi
   (xen/arch/arm/include/asm/gic.h), so the selftest never
   reuses a functional SGI (Grygorii #3).
 - Added a runtime integer command-line parameter "gic-test" so
   the selftest binary can be shipped but its execution selected
   at boot (gic-test=0 -> no-op; gic-test=1 -> SGI tests). Future
   GICv3 features (distributor, ITS, LPI, ...) can claim further
   values (Grygorii #2, partial).
 - Documented why machine_halt() is not invoked after the tests:
   SGI delivery is asynchronous, so there is no well-defined
   point after which every send has been observed by its
   receiver (Julien #2).
 - Wired the tests into upstream GitLab CI: new build job
   alpine-3.18-gcc-debug-arm64-boot-selftest, new test job
   qemu-smoke-boot-selftest-arm64-gcc-debug, and the runner
   script automation/scripts/qemu-boot-selftest-arm64.sh that
   dumps the QEMU virt DTB, injects
   "gic-test=1 console=dtuart sync_console" into
   /chosen/xen,xen-bootargs via fdtput, boots Xen, and checks
   for each "Sending GIC_SGI_TEST ..." followed by the matching
   "CPU%u: GIC_SGI_TEST received".

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
index 1c711fa980..6d7277ae1b 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1267,6 +1267,16 @@ available on Intel Panther Lake and Diamond Rapids CPUs, and AMD Zen6 CPUs.
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
index 0000000000..9ddd47cad2
--- /dev/null
+++ b/xen/arch/arm/gic-test.c
@@ -0,0 +1,102 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
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
+    this_cpu(sgi_test_count)++;
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
index ee2c26adb4..40635a9d32 100644
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
+/* Record a GIC_SGI_TEST delivered to this CPU (see arch/arm/gic-test.c). */
+void gic_sgi_test_interrupt(void);
+#endif
+
 /* print useful debug info */
 extern void gic_dump_info(struct vcpu *v);
 extern void gic_dump_vgic_info(struct vcpu *v);
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 0adfa4993a..2fdf5da526 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -50,6 +50,15 @@ void setup_mm(void);
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
index 6310a47d68..c7abbdb04e 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -83,6 +83,24 @@ static void __init init_idle_domain(void)
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
@@ -470,6 +488,8 @@ void asmlinkage __init noreturn start_xen(unsigned long fdt_paddr)
     enable_errata_workarounds();
     enable_cpu_features();
 
+    do_init_boottests();
+
     /* Create initial domain 0. */
     if ( !is_dom0less_mode() )
         create_dom0();
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 1806c47a08..97d8b19cf4 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -28,6 +28,7 @@
 #include <asm/gic.h>
 #include <asm/procinfo.h>
 #include <asm/psci.h>
+#include <asm/setup.h>
 #include <asm/acpi.h>
 #include <asm/tee/tee.h>
 
@@ -413,6 +414,8 @@ void asmlinkage noreturn start_secondary(void)
 
     printk(XENLOG_DEBUG "CPU %u booted.\n", smp_processor_id());
 
+    do_init_boottests();
+
     startup_cpu_idle_loop();
 }
 
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 2d5f1c516d..14f64a856c 100644
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


