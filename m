Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A06D60741C4
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 19:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=T/D0C78f
Received: from list by lists.xenproject.org with outflank-mailman.1475452.1682127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP3Sk-00011t-AJ; Thu, 05 Nov 2026 19:49:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1475452.1682127; Thu, 05 Nov 2026 19:49:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP3Sk-00011i-6M; Thu, 05 Nov 2026 19:49:30 +0000
Received: by outflank-mailman (input) for mailman id 1475452;
 Thu, 05 Nov 2026 19:49:28 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ayan.kumar.halder@amd.com>) id 1xP3Si-0000yF-4s
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 19:49:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xP3Sh-00H238-DM
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 20:49:27 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6aecddad-2eae-0a2a0a5409dd-0a2a4506953e-44
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 20:49:26 +0100
Received: from [40.107.201.42]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6aecddc4-195a-0a2a45060019-286bc92a646b-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 20:49:26 +0100
Received: from CH2PR02CA0011.namprd02.prod.outlook.com (2603:10b6:610:4e::21)
 by IA1PR12MB6068.namprd12.prod.outlook.com (2603:10b6:208:3ec::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 19:49:18 +0000
Received: from BN7PEPF00000096.namprd03.prod.outlook.com
 (2603:10b6:610:4e:cafe::3b) by CH2PR02CA0011.outlook.office365.com
 (2603:10b6:610:4e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 19:49:17 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN7PEPF00000096.mail.protection.outlook.com (10.167.245.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 19:49:17 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 5 Nov
 2026 13:49:16 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 5 Nov
 2026 13:49:15 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via
 Frontend Transport; Thu, 5 Nov 2026 13:49:15 -0600
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vqFZppIq67L8E8uzZ4tjSGjR7/aDRNd5t3AqgPHDOBcPBnu6t+1BS0nohQbbIb5/9ikMdwrxb1a9DHEvd4tRsbDsqwIzkBNP5gDdRMMBJzfdzS6dWJ4vvQemkAXEZEKhNWChdAWGx1rxJqNzFqJCSNn9nZaJnflzsl21kgb+DHWnHlqP+FUFHfnuqkyxUC91Li33jKbZdRlOG2LAhjYijN6QxLzRgm7/Lub6U5JQhZClmodfTe6m/YWmvc/EYHZxXjV3audLZ2W3N5ejsvyo/L3rVI2c3THyJ9+RLlsExOKNFiEm6Cy/J2kJ/f0ehLO/QYx37u9ySkRKPiCceqwP6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vxijgqwtMMbeEP8fdxjHUyKp3RSGALhMiKwSj2SW5fw=;
 b=LTZ3+0pDn1xgnwwLmg+OFxHwUtsJm/hQNqWWwSaxUESo6U73oNaBY7xwMrPkLQBxPLNRQf9T6u+s1qkkHoDEUiIQkUj6SuXZJ3CVXaf2nKXl7WTbGrdOG7MWgNa94GaSxEig3gX2LRR4Axqekl9+CLijRq2ddq4jO8fdrFStTcWRit7yMSCAkQkGmUXoyI6UIiiadiNB7G0X+RnK9mUg6YIhJGGiyiNMbFXJXj2spl5fywErCJO5xdb42Qe2cks0FiniDv54rORxGzDC232x4OXPo5+5kg/eHs/PNNj5GfKGm3QVxx7MeUMOAokszQkWomytyUgcFHAP5O6kZSxSXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxijgqwtMMbeEP8fdxjHUyKp3RSGALhMiKwSj2SW5fw=;
 b=T/D0C78f4slXvfuZ4sxAwA9arnmoLtR+JryWQX50CGXcnYopQT5ac20yJ4fTtHFIMwZsvMikCOl6nlIPx9PvX6pDBCJS5l5bny3gRJixcEqiSEE57qwNytWZVzf/W+azcyNJPIWZtDVvOIArOJZ0QQ8ltAfTNXk+XEMvjMGfHOA=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Artem
 Mygaiev" <artem_mygaiev@epam.com>, Matthew L Weber
	<matthew.l.weber3@boeing.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN PATCH v2] docs/fusa: add the Arm Generic Timer architecture specification
Date: Thu, 5 Nov 2026 19:49:10 +0000
Message-ID: <20261105194910.1186029-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF00000096:EE_|IA1PR12MB6068:EE_
X-MS-Office365-Filtering-Correlation-Id: 420525e2-2974-45e2-adb6-08df3b75e07b
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|36860700016|82310400026|260925021311599003|261009223027099003|261021135927099003|260925022911599003|260925021911599003|261022113327099003|11063799006|261021121427099003|261026121527099003|261026140227099003|261028144727099003|56012099006|261022075727099003|261022105027099003|20046099003|261102123227099003|18002099003|6133799003|10067099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
 gR1tRiBIH6KmQOnJwugsEniooPa3EXRfAoEttABCHypZNiIFqkXycRzOM4p/rT0ABNhBWq05k7KELJQlBF5hUFJxkRJDby5q7We7q7g2lGUacNYLzxtHA65VjYTuxCuEIpxsLLTKoQLBr5+gQWHW1tKzrnZ2WpOg8hUZYkx5JaUbNgsnT9Vk5HMPGgubbjTmr19nrTPCQvWDfSHBQDTk2oofN0eQ8iWhwv+VKeMUqblu2GY3fPhdGImMMms48mno4VSUl8SVngM+Q/pA4EaDiSSNKO/z/3IyNYb183MKSs7RcLI9GuFeUVZJjAvDwTzQ3zV1UYqZmf7x+8eNOovaCDohVL8odJc5GlTpFJ9r7SaxpIEdO3xcXLjgJblw2IhGOJ1BX1fPgMN9EA5xKU/+z0oFhoiD/HMIMDjQPtSsKqPrBMqHhDHDj2giXHhfvAW+YBlc7W+51TlLE/mUlC4j+t+64qWDEWtcLHhDamGyBOZaMAUOuav6V31suQIH/xhXwjY1DaACImHG+ati8YZna3hq12Cy0kbePa+TJw5dFlyxAdVeovUptE8E7zat5xEmy8RZ6tsPwjJ2fz1LlVtZZbuLB+e9KNudjWHAT5VdMYY3iVuuN7nJ17xfB1TK9NLXdyg4Gb5f//G+fSpJxrCm59WnJFrt08ozFoQj2E7sFWo=
X-Forefront-Antispam-Report:
 CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(36860700016)(82310400026)(260925021311599003)(261009223027099003)(261021135927099003)(260925022911599003)(260925021911599003)(261022113327099003)(11063799006)(261021121427099003)(261026121527099003)(261026140227099003)(261028144727099003)(56012099006)(261022075727099003)(261022105027099003)(20046099003)(261102123227099003)(18002099003)(6133799003)(10067099003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 6oHd4Z2aMlwQlb3e+bdKY8JPIcaLER+3XC7Fxb9LBxGdlTfoHmlLdKBG04HNIPu+b5JgoXlcfxcsmCfDEa5STX3qqRiZ8pnLKHYvMrniS3RWAHbZ9fVQVqnPey1LQqBTT7g/O0Aozk6i4yoOovAojPuaQzEzMkXaIwg/92Zdxfjy+B8V5TO5pOWAwzUpZSpwFF5VyRB/UcqdgEYN93PSIBkTwGNxFtuT0zG9HCBvkwUhhnLcK6MtEQFrdgCmXeh5e0SMn5ejtsgm+vCNlUVwtKPYx2+ATtGOqzDJdyvvuSKFU9quNyOKQlLbYVfJZV21L8lrHKNHOeLQerlKiMAbayYO5lbw8eTN/XMbkO+/Kjnb1mFdWZap78iR0aM9dJgbI+gT0SRZbxlWg/R/vBsf67EiFT08vsPO8G2DOAk8B4mwAxwZVbrYkXMH2WY5lqMp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 19:49:17.2879
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 420525e2-2974-45e2-adb6-08df3b75e07b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN7PEPF00000096.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6068
X-purgate-ID: tlsNG-16d1c6/1793908166-F4C0777B-41ED7EA4/0/0
X-purgate-type: clean
X-purgate-size: 14630
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Describe how Xen uses the Arm Generic Timer over the lifetime of a VM:
the two timers it exposes, how each relates to the system counter, what
it sets up while creating a VM, and how it emulates the physical timer
and handles the virtual one.

Also describe freedom from interference between VMs. The timers are
emulated per vCPU, so timer programming in one VM does not alter
another's. The virtual timer is isolated by the per VM offset in
CNTVOFF_EL2 and the per vCPU context saved and restored across context
switches; the physical timer by the per vCPU state Xen keeps for the
trapped accesses. A VM that reprograms its own physical timer clears its
own pending condition, which the architecture requires of a timer given
a new deadline and which affects no other VM.

Add an architecture_specs index and reference it from the functional
safety documentation index.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes in v2:
- Dropped Matt's Reviewed-by: the patch changed materially after his review
  (timer-name capitalisation and the footnote conversion below were not in the
  reviewed version), so the tag is not carried forward.
- Fixed typo "creeation" -> "creation" in the VM-creation section heading.
  (Matt)
- Corrected the CNTV_TVAL_EL0 description from "compare value register" to
  "timer value register" (TVAL is the timer-value alias, CVAL is the
  comparator). (Matt)
- Grammar: "The interrupt behave" -> "The interrupt behaves". (Matt)
- Capitalised and hyphenated the timer names in the interrupt-id table:
  "Secure" / "Non-secure", matching Arm terminology. (Matt)
- Converted the [1]/[2] references from a manual line block to proper RST
  footnotes (.. [1] / [2]_), so Sphinx renders numbered citations and
  cross-references. (Matt)
- Added the arm64_generic_timer_plat_program_cntfrq_el0 design requirement to
  the Covers: list, so the architecture specification covers all of the
  generic-timer design requirements in
  docs/fusa/reqs/design-reqs/arm64/generic-timer.rst.
- Added a blank line between the interrupt-id list-table and the following
  paragraph to silence a Sphinx "explicit markup ends without a blank line"
  warning.
- Rebased onto current staging; split out from the v1 2/2 series as a
  standalone patch (arch spec only), adding the architecture_specs index and
  wiring it into docs/fusa/index.rst.

 .../fusa/architecture_specs/generic_timer.rst | 251 ++++++++++++++++++
 docs/fusa/architecture_specs/index.rst        |   9 +
 docs/fusa/index.rst                           |   1 +
 3 files changed, 261 insertions(+)
 create mode 100644 docs/fusa/architecture_specs/generic_timer.rst
 create mode 100644 docs/fusa/architecture_specs/index.rst

diff --git a/docs/fusa/architecture_specs/generic_timer.rst b/docs/fusa/architecture_specs/generic_timer.rst
new file mode 100644
index 0000000000..bb2d066f8d
--- /dev/null
+++ b/docs/fusa/architecture_specs/generic_timer.rst
@@ -0,0 +1,251 @@
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
+ - `XenSwdgn~arm64_generic_timer_plat_program_cntfrq_el0~1`
+
+Needs:
+ - XenTestCase
+
+This document describes Xen's usage of the Arm Generic Timer during the
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
+Xen exposes two types of timer over the lifetime of a VM:
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
+counter, CNTPCT_EL0. The physical counter starts from zero when the system
+counter starts, that is, at power-on or reset, so its value is not related to
+when Xen booted. Xen derives its own system time (``NOW()`` / ``get_s_time()``)
+from it by subtracting a snapshot of CNTPCT taken at boot, so that system time
+is measured from Xen boot. The physical timer is accessed by the following
+registers:
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
+- CNTV_TVAL_EL0 - timer value register
+
+CNTFRQ_EL0 reports the frequency of the system counter. However, this register
+is not populated by hardware. The register is writable at the highest
+implemented Exception level and readable at all Exception levels. Firmware,
+typically running at EL3, populates this register as part of early system
+initialization. Higher-level software, like an operating system, can then use
+the register to get the frequency.
+
+Xen reads the counter frequency from the device tree (the timer node's
+``clock-frequency`` property, or the firmware-populated CNTFRQ_EL0) and relies
+on that value being correct; it is a configuration input to Xen's system time,
+not something Xen can independently cross-check against hardware.
+
+Generic timer usage during VM creation
+--------------------------------------
+
+While preparing the device tree for a VM, Xen creates a timer node (based on the
+device tree bindings [2]_ and architecture specification [1]_) for the VM. For
+this, the host device tree is expected to have a node for the generic timer.
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
+   * - Physical Secure timer
+     - 29
+
+   * - Physical Non-secure timer
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
+Xen traps VM's accesses to system registers related to physical timer (except
+CNTPCT_EL0). This is done to allow Xen to emulate the physical timer for a VM,
+that is, to check that the access is permitted and to translate the compare
+value the VM programs, which is an absolute physical counter value, into Xen's
+system time. Xen does not route the physical timer interrupt to guest or itself.
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
+VM. The interrupt behaves in a level-sensitive manner, meaning the timer will
+continue to signal the interrupt until one of the following situations occurs:
+
+- interrupt is masked
+- timer is disabled
+- firing condition is no longer met
+
+Xen masks the interrupt (using the CNTV_CTL_EL0 register) before injecting it
+into the VM to avoid an interrupt storm that could otherwise occur if the VM
+did not handle the interrupt properly. This masking is specific to the virtual
+timer: Xen does not mask the physical timer when injecting its interrupt (see
+the physical timer section above), and that difference is what the virtual and
+physical deschedule test cases verify.
+
+Freedom from interference
+-------------------------
+
+The Generic Timer is emulated per vCPU, so timer programming in one VM cannot
+alter another VM's timer state. The mechanism differs between the two timers.
+
+Virtual timer isolation
+^^^^^^^^^^^^^^^^^^^^^^^
+
+Each VM has its own virtual time base, which Xen sets in CNTVOFF_EL2 during VM
+creation, so the virtual count a VM reads is its own. The virtual timer
+context, that is the compare and control registers, is saved and restored per
+vCPU across context switches, and the internal timer Xen uses to schedule
+interrupt injection is per vCPU as well. Every emulation path acts on the vCPU
+that trapped, so one VM enabling, disabling or rearming its virtual timer does
+not change what another VM's virtual timer is waiting for, nor when it fires.
+This isolation assumes the per-vCPU virtual timer context is saved and restored
+on every vCPU context switch; that save/restore is the premise the freedom-from-
+interference claim depends on.
+
+Physical timer isolation
+^^^^^^^^^^^^^^^^^^^^^^^^
+
+The physical timer is fully emulated, and the compare value, control value and
+pending condition Xen keeps on a VM's behalf are per vCPU. One VM's accesses
+to CNTP_CTL_EL0, CNTP_CVAL_EL0 or CNTP_TVAL_EL0 are trapped and applied to its
+own context only.
+
+A VM that writes CNTP_TVAL_EL0 or CNTP_CVAL_EL0 while its physical timer has a
+pending condition clears that condition and re-arms the timer. This is the
+behaviour the architecture requires of a timer that is given a new deadline,
+and it affects only the VM that performs the write. It is not a loss of an
+interrupt belonging to another VM.
+
+System counter isolation
+^^^^^^^^^^^^^^^^^^^^^^^^
+
+The system counter itself is read-only to a VM and monotonic, so concurrent
+reads from several VMs cannot interfere with one another. Both timers derive
+from it, the physical one directly and the virtual one through the per VM
+offset described above.
+
+.. [1] Arm Architecture Reference Manual for A-profile architecture, Chapter 11
+.. [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml
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
index 5f1e8acfc4..b3c72ec7d4 100644
--- a/docs/fusa/index.rst
+++ b/docs/fusa/index.rst
@@ -7,3 +7,4 @@ Functional Safety documentation
    :maxdepth: 2
 
    reqs/index
+   architecture_specs/index

base-commit: c4a09c112c391ffc1aea33afff49ffb28156fbdb
-- 
2.25.1


