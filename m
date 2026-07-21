Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C23C4452F
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2026 12:48:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367769.1617458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm9t8-000264-Rv; Tue, 21 Jul 2026 12:47:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367769.1617458; Tue, 21 Jul 2026 12:47:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm9t8-00025x-OP; Tue, 21 Jul 2026 12:47:58 +0000
Received: by outflank-mailman (input) for mailman id 1367769;
 Tue, 21 Jul 2026 12:47:57 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ayan.kumar.halder@amd.com>) id 1wm9t7-0001rA-5r
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 12:47:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wm9t6-00DDDW-Iw
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 14:47:56 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a5f6a78-e002-0a2a0a5209dd-0a2a4507a972-6
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 14:47:56 +0200
Received: from [52.101.56.12]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a5f6a7b-b4ea-0a2a45070019-3465380cd5bb-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 14:47:56 +0200
Received: from CH2PR19CA0002.namprd19.prod.outlook.com (2603:10b6:610:4d::12)
 by LV3PR12MB9215.namprd12.prod.outlook.com (2603:10b6:408:1a0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 12:47:49 +0000
Received: from DS2PEPF000061C5.namprd02.prod.outlook.com
 (2603:10b6:610:4d:cafe::af) by CH2PR19CA0002.outlook.office365.com
 (2603:10b6:610:4d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 12:47:49 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF000061C5.mail.protection.outlook.com (10.167.23.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 12:47:49 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 21 Jul
 2026 07:47:48 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via
 Frontend Transport; Tue, 21 Jul 2026 07:47:47 -0500
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
 b=AJZsugYzE+M9FTjIiJVSPGRW2tD8eGQgg2WNAkm2/glQXnaeui7LPOGa2RU2dgo7tvh4mAeELmCALCFYFpcrUShwymQR74A4+83kR+eINyyd2fjNzVoIeQ1NkZWxqjrSg7359LR+9CmyE2FNf5JnhJVvVsei7qfrcF8aeFqJJ7upNZQ9afZfPz/B69trHnT9mmxITX9vE3DULuFAaZLgu/hk/JhtN90Hsvjlu8w17GMhq+epWGqFY1wDmrUt4iXEA39AyBx0YFEQtlbeLHBt7bUVq6HYGbmvwK64ekeTs7HYhSXggnj3mBjG4X4rXllWmFG1St9P4MA+dpJ4O2JLtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4cAH2lqwOxWzPzwrleswyO3U6NgZz3i6Pgd/cYSg/IE=;
 b=buwMsjDAVLrGgf+4pGWzr5k72FMvgx0N0MjmuRvkCci+kX+c2U+0VNyGG1+PUNZhe5nAoowiz4j+rImnEmpdpRxMq1Qn5MQdBPa0vaPdvrCGVzIzM3S0xFpX0+pwCTwjZBzpSftB6ujjXxncDj1YIHZOfkz2XSKRLO7aCtlimZeLbnacF4HW1Fb8VAR0hfX12nFKI+MRieG4rlWFH94wJSiJwO1/UwaoShs2iiBgQYpAYT8cqrSKZfqjurFCryBg4kAx6nW/Q4ZF1GLt2cFgJlS0b+3yfoRa4++nS9KK3NovLfEwL6G57vJLWmeYTrfk/Nm9M4QY1StTwRTd5frGzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4cAH2lqwOxWzPzwrleswyO3U6NgZz3i6Pgd/cYSg/IE=;
 b=ZTwDGcbQ0tuuFrsApYpJ/P09ubYktswSqeLir947d6DvMP/Rd0IUhuMdY8GeF+PJ2SmrxJjWl/it3wkU2UZFWnnCorRkBbmfXk77gaQqznX8FbiXRV8jjxaizOEzcXeQHMM2SGTOkOptx4vduTVAvf/zM7HFTVWBeaI1P9ZGG8A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Artem Mygaiev
	<artem_mygaiev@epam.com>, <matthew.l.weber3@boeing.com>,
	<harunobu.kurokawa.dn@renesas.com>
Subject: [XEN PATCH v1 2/2] docs/fusa: add generic timer arch spec with ASCII diagrams
Date: Tue, 21 Jul 2026 13:47:29 +0100
Message-ID: <20260721124729.868630-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260721124729.868630-1-ayan.kumar.halder@amd.com>
References: <20260721124729.868630-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C5:EE_|LV3PR12MB9215:EE_
X-MS-Office365-Filtering-Correlation-Id: 604ef56f-17fa-40a4-bf95-08dee7264557
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|13003099007|6133799003|5023799004|11063799006|56012099006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
 ZCjXqqNVD+ZaZI4kYMhEQgcCBqh/Yiyslk5USZkg1qa9Zex/fYu5Kf6OtSjsR9GWaSdOV+HqYVy5/kwrWNVfxp4Bl9FzlGxe6addUu3JYEAPoVM8/vP5xllzLbPAoQuQ0bt9R30j/N0Gt8xCdBaNLg86zj61Dro7LNmCvPedRi2XAAoP3fZZL/boXW//DDA691c6nSx+BYwEzyftlnz5p91CHnkT3dz9QvxAE1+ONHxcMt8iU8XZHlYnW3ENnF1p1moLo9g5B+aSCMxKo592ftc2bvvG2daLUpTT+lcmlrS9XwzOuQSnvoUYU3Z4brTzJ/8nCHN7E2SMd7cTANglZZGOZtfrHHILQgWlrbhHyNh1yOVnx/P513WU/sZ3dr8XdnyovM/lPZNQDcQOdfy06dT9KkwDsWTackNukjDKfkEs5oXoJ/XY3R+0+xpMCvBfnvdmvK9YYt2xoKrNLLeLBUeVAnV/boUiuXA5caxwPoPn87JMlFegOdJAMFO4eOMeFGHa+o8z5HPnK32NJxocfA6nsMEbgn3/gj3v04lpu5cm0acLp/AA/Z8YSfmwmVBMZqc1Cna2sOyTOVRE1w8LpjfBfcdmTJbcgSgiaeKHCLBHgW9VgP/g+zIH8LzE4yJWS5Wd6tdVcefV7lrwMseuVaTe21qtHZ1LV/kQm8a0H0bWdQNqQgFJ2iPKyqhuP0JIpDV+SXI1VvtsKC9DGF8awQ==
X-Forefront-Antispam-Report:
 CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(13003099007)(6133799003)(5023799004)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 rLWYKGkYdMkUsUy/0Va2I1p4ZXMsFIZlSblZ87c0tpvaJWF3Mmko/yxiakoi4bxk2plENFYYbgrOcaYiIsdi0LllA4j/ZBszowdnyjAKOuC0l57eEKjNfBzh2L2q+912cmLNR4ifmtoS+fdYmdXEfdQx6MbxdTS3JeA4TdLz24axWcgS1hV82ocIXYVoQRrd5sdi1E1hLpdKt8444F37yel/uFU56sB+Ye1dYbskNJIb2iD4bgUwKnB8BV6+WUZrEqkdw3KSQjzfcCIHb/y+BCyBXUMuWVB7Q6KfnYu+Ihp2ZYmniOg8Ue4JtYljC3T+3Cl3Q2gUjmUnPb1xsIDx7kgaOhHiUsPm0XTiwuiHKP8id/40QZ9yykW+Uv/wwm1RkWofq6swHUnJgScVpcAvHqkbL15SKC7Qy87eYj1f27Jlc8HYoiyl9beOGe1XFVRm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 12:47:49.0525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 604ef56f-17fa-40a4-bf95-08dee7264557
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF000061C5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9215
X-purgate-ID: tlsNG-ef75cf/1784638076-A4ECEAE4-DDE2BFCC/0/0
X-purgate-type: clean
X-purgate-size: 11562

An architecture specification is a prose document that describes how Xen
uses a particular piece of hardware: what the hardware does, which parts
of it Xen drives directly, which parts it emulates on behalf of a guest,
and how the two interact over the lifetime of a VM. It sits between the
high-level requirements and the source code, giving a reviewer or
safety assessor a readable explanation of the design without having to
reconstruct it from the code, and it is the anchor that the design
requirements trace to.

This adds the arm64 generic timer architecture spec, which explains
Xen's usage of the Arm Generic Timer: the system counter and the
physical and virtual timers, how Xen sets up the timer for a VM at
creation, and how it traps, emulates and injects timer interrupts while
the VM runs. The spec's Covers list points at the existing
XenSwdgn~arm64_generic_timer_* design-requirement IDs, matching the OFT
tag convention already used throughout docs/fusa/reqs/design-reqs.

Wire the section into the docs/fusa toctree.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
The architecture spec explains the detailed design of a component in Xen.
Together with design requirements, the architecture spec helps to define the
test cases to prove that the component can be used in a safety environment.

 .../fusa/architecture_specs/generic_timer.rst | 215 ++++++++++++++++++
 docs/fusa/architecture_specs/index.rst        |   9 +
 docs/fusa/index.rst                           |   1 +
 3 files changed, 225 insertions(+)
 create mode 100644 docs/fusa/architecture_specs/generic_timer.rst
 create mode 100644 docs/fusa/architecture_specs/index.rst

diff --git a/docs/fusa/architecture_specs/generic_timer.rst b/docs/fusa/architecture_specs/generic_timer.rst
new file mode 100644
index 0000000000..6caeffca13
--- /dev/null
+++ b/docs/fusa/architecture_specs/generic_timer.rst
@@ -0,0 +1,215 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Generic Timer
+=============
+
+`XenArch~arm64_generic_timer~1`
+
+Covers:
+ - `XenSwdgn~arm64_generic_timer_probe_dt~1`
+ - `XenSwdgn~arm64_generic_timer_read_freq~1`
+ - `XenSwdgn~arm64_generic_timer_access_cntkctlel1~1`
+ - `XenSwdgn~arm64_generic_timer_access_virtual_timer~1`
+ - `XenSwdgn~arm64_generic_timer_access_physical_timer~1`
+ - `XenSwdgn~arm64_generic_timer_trigger_virtual_interrupt~1`
+ - `XenSwdgn~arm64_generic_timer_trigger_physical_interrupt~1`
+
+Needs:
+ - XenVerTestCase
+
+This document aims to explain the usage of Arm generic timer during the
+lifetime of a VM.
+
+Introduction
+------------
+
+The Generic Timer:
+
+- provides a system counter that measures the passing of time in real-time,
+- supports virtual counters that measure the passing of virtual-time. That is,
+  a virtual counter can measure the passing of time on a particular
+  virtual machine,
+- can trigger events after a period of time has passed.
+
+Types of timers
+---------------
+
+Xen exposes two types of timer on behalf of VM's lifetime:
+
+- physical timer
+- virtual timer
+
+::
+
+    +------------------+
+    |  System Counter  |
+    +--------+---------+
+             | System Time Bus
+             +----------------------------+
+             |                            |
+             |                            v
+             |                        +-------+       +----------+
+             |                        |   -   |<------|  CNTVOFF |
+             |                        +---+---+       +----------+
+             |                            |
+             v                            v
+        +---------+                  +---------+
+        |  CNTPCT |                  |  CNTVCT |
+        +---------+                  +---------+
+        +---------+                  +---------+
+        | Physical|                  | Virtual |
+        |  Timer  |                  |  Timer  |
+        +---------+                  +---------+
+    ( PE )
+
+The physical timer measures the passage of time in relation to the physical
+counter. It is used to broadcast the wall-clock time (i.e. the number of clock
+cycles since Xen boot). It is accessed by the following registers:
+
+- CNTPCT_EL0 - physical count value
+- CNTP_CTL_EL0 - control register
+- CNTP_CVAL_EL0 - compare value register
+- CNTP_TVAL_EL0 - timer value register
+
+The virtual timer measures the passage of time in relation to the virtual
+counter. It is used to broadcast the virtual time (physical - offset). Offset is
+set by Xen (CNTVOFF_EL2 register) during VM creation. As a result, the virtual
+time will report time from the creation of the VM. It is accessed by the
+following registers:
+
+- CNTVCT_EL0 - virtual count value
+- CNTV_CTL_EL0 - control register
+- CNTV_CVAL_EL0 - compare value register
+- CNTV_TVAL_EL0 - compare value register
+
+CNTFRQ_EL0 reports the frequency of the system counter. However, this register
+is not populated by hardware. The register is write-able at the highest
+implemented Exception level and readable at all Exception levels. Firmware,
+typically running at EL3, populates this register as part of early system
+initialization. Higher-level software, like an operating system, can then use
+the register to get the frequency.
+
+Generic timer usage during VM creeation
+---------------------------------------
+
+While preparing the device tree for a VM, Xen creates a timer node (based on the
+spec[1]) for the VM. For this, host device tree is expected to have a node for
+the generic timer.
+
+During the VM creation, Xen sets the offset (CNTVOFF_EL2) used to broadcast the
+virtual time for a VM and assigns the following per processor interrupts for
+timers.
+
+.. list-table::
+   :header-rows: 1
+
+   * - Name
+     - Interrupt id
+
+   * - Virtual timer
+     - 27
+
+   * - physical secure timer
+     - 29
+
+   * - physical non secure timer
+     - 30
+
+Xen reserves the 27, 29 and 30 interrupt ids in the virtual GIC. The exception
+to this is for hardware VM, where the VM will be assigned interrupt numbers the
+same as in the host device tree.
+
+The parent interrupt is linked to the Generic interrupt controller node.
+
+If the host device tree node for the generic timer contains the property
+"clock-frequency", the same is passed on to the guest device tree.
+
+During the VM vCPU creation, Xen initializes the internal/background timers (one
+for physical timer and one for virtual timer).
+
+Generic timer interface between Xen and VM
+------------------------------------------
+
+VM can make use of both the physical and virtual timer.
+
+Physical timer
+^^^^^^^^^^^^^^
+
+Xen traps accesses to system registers related to physical timer (except
+CNTPCT_EL0). This is done to allow Xen to emulate the physical timer for a VM
+(e.g. checking the right access, taking into account the time when Xen was not
+running). Xen does not route the physical timer interrupt to guest or itself.
+Instead, it makes use of the internal timer used for the physical timer
+emulation to schedule the interrupt injection into the VM.
+
+The flow can be depicted as follows:
+
+::
+
+    +---------------------------------------------------+
+    | VMs read or write                                 |
+    | any of CNTP_CTL, CNTP_CVAL, CNTP_TVAL             |
+    +-------------------------+-------------------------+
+                              |
+                              v
+    +---------------------------------------------------+
+    | MSR/MRS instruction is trapped by Xen             |
+    +-------------------------+-------------------------+
+                              |
+                              v
+    +---------------------------------------------------+
+    | Xen reads or writes to the register               |
+    | on behalf of VM                                   |
+    |                                                   |
+    |  1. For read access : Xen returns the value from  |
+    |     the VM's vcpu physical timer context.         |
+    |  2. For write access : Xen saves the value in the |
+    |     VM's vcpu physical timer context. Depending   |
+    |     on the value, it schedules the internal timer |
+    |     for interrupt injection.                      |
+    |                                                   |
+    |  Increments the VM program counter                |
+    |  and returns control to VM.                       |
+    +---------------------------------------------------+
+
+Virtual timer
+^^^^^^^^^^^^^
+
+Xen does not trap accesses to system registers related to virtual timer.
+The timer context (i.e. content of timer registers) is saved/restored during the
+vCPU context switch. At save time, Xen initializes an internal timer to make
+sure the VM's vCPU is scheduled at the time of the next virtual timer interrupt.
+The virtual timer interrupt is first routed to Xen, masked and injected into the
+VM. The interrupt behave in a level-sensitive manner, meaning the timer will
+continue to signal the interrupt until one of the following situations occurs:
+
+- interrupt is masked
+- timer is disabled
+- firing condition is no longer met
+
+Xen masks the interrupt (using the CNTV_CTL_EL0 register) before injecting it
+into the VM to avoid an interrupt storm that could otherwise occur if the VM
+did not handle the interrupt properly.
+
+Error propagation
+-----------------
+
+The following Generic Timer device-tree faults observed during early boot
+trigger an unrecoverable panic:
+
+- No device-tree node advertising a compatible ARM Generic Timer
+  identifier (for example "arm,armv8-timer"): Xen matches the timer by the
+  node's "compatible" property rather than its name, so if no node carries
+  a supported timer compatible string the lookup returns nothing and Xen
+  panics with "Unable to find a compatible timer in the device tree".
+- Timer node with a "clock-frequency" value less than 1000: Xen cannot
+  derive a usable timer rate and panics with "Timer frequency is less
+  than 1 KHz".
+- Timer node missing the "interrupts" property (or whose interrupts entry
+  for the timer in use cannot be parsed): Xen cannot retrieve the timer
+  IRQ from the device tree and panics with "Timer: Unable to retrieve IRQ
+  N from the device tree" (where N identifies which of the timer
+  interrupts could not be parsed).
+
+| [1] Arm Architecture Reference Manual for A-profile architecture, Chapter 11
+| [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml
diff --git a/docs/fusa/architecture_specs/index.rst b/docs/fusa/architecture_specs/index.rst
new file mode 100644
index 0000000000..395e3c1225
--- /dev/null
+++ b/docs/fusa/architecture_specs/index.rst
@@ -0,0 +1,9 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Architecture specifications
+===========================
+
+.. toctree::
+   :maxdepth: 2
+
+   generic_timer
diff --git a/docs/fusa/index.rst b/docs/fusa/index.rst
index dd5ca4dd95..88aaafe7a6 100644
--- a/docs/fusa/index.rst
+++ b/docs/fusa/index.rst
@@ -7,4 +7,5 @@ Functional Safety documentation
    :maxdepth: 2
 
    reqs/index
+   architecture_specs/index
    coverage_gap
-- 
2.25.1


