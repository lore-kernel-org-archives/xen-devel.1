Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C74AC4450F
	for <xen-devel@archiver.kernel.org>; Fri, 17 Jul 2026 07:12:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364688.1615712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkcju-0005o7-4Z; Fri, 17 Jul 2026 07:12:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364688.1615712; Fri, 17 Jul 2026 07:12:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkcju-0005o0-0E; Fri, 17 Jul 2026 07:12:06 +0000
Received: by outflank-mailman (input) for mailman id 1364688;
 Fri, 17 Jul 2026 07:12:04 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wkcjs-0005Zx-AS
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 07:12:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkcjr-008Yk2-G0
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 09:12:03 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a59d5b9-5cb7-0a2a0a5109dd-0a2a4504e1ca-18
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 09:12:03 +0200
Received: from [52.101.70.117]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a59d5c3-b57f-0a2a45040019-3465467548ab-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 09:12:03 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AS8PR03MB7985.eurprd03.prod.outlook.com (2603:10a6:20b:428::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 07:12:02 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 07:12:02 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TAQeiyYBkM3CBxaGqfx+WW3VYcOR+i1CqhCyA411/jIlCK0B5OO1fb06nWinesKclgV4yoVDORRmkqgjpRdIFiPm1Fed+hmur8qvnctVMu0OO0An9NKFYbc5txyvfSvDM9SUoK1+9v2wtPYXjJLsHPEh/ZyURIkFSGHVTsFzwot6E3Kgr3vjtH8FXPwc4lskwyDySvRpQ3Mp8pwpu2Wr2JrNycPpCHPlVcGvNlptlQm9IVHTlu9K90WTNREqrEHoaRfHVuWy7OJrRZNBa9WTlhz/wmW+jHBggSWQtKFGzqhBm6SC+iwEAvMIRFYmpRHLelAsThhfa20OEmhzr28QAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsnvCitpeI3GbiUP5GVRR+L9xj+M72SQ8QpfsJVVk30=;
 b=Th+e8rvw7fHJKqTop1XIcNDGk6D3lJCS30iN9gJmfvVRol3wnhMbjbIVgb3gSArYk7RsluPPj3zFhC2sk2bUdSdY66IOvN/ksTmKLZXAUMX/rhU1HSBBJ9rx80BBqk6AnMz/4u5xf1ESiip+ObfVLt6WwSM2GrQKWKSD9ZjpRWBrwd3lxKM7ekNAY4oGPvcGeSvq76EJEi+uDKHILSD30PDmPllr6HfXqQ2FbnrXpWQo1SRMmdfOlvD0WPqY1PuHd9k+y0B3D5bI1Naa87oL2xTL1bfDVS/g/kkYwO2PyS9NtzsndNS9y06iTwSqvkY6avngUjg5dDFPdSDemPjtYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SsnvCitpeI3GbiUP5GVRR+L9xj+M72SQ8QpfsJVVk30=;
 b=gBDdom/oIxSR7vUj9i21u7Ey0vrWEQyk9GATF1mrKwLnCxKiGUv1MzGIU/HCsCL0BDKM8HgVg7+1LBQ3ZR770dAI6UgrPuELWPfLV7E2OYyWSI5TMHtLiuWIPtIpoYMMb1gXFwHahsudmh4JbMAvtY5JcBllW0TNpa0aguL8yEi0jEDSQ7LbHGmZXgfqApvS36uJ52v+G4oZq9XMzM39TmcaDgRkvIpIe/FB7ttcUo07HTX7R4v+pD02K9YEjTlA+fxkvb1Yn7VCdS1yd1W+TzpCKWnZDCCNxQPbVVPraRg/Cu+5GyuPvCa9k9OM3AlFSw4P01wfF2xVAlQQzJbcrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Subject: [REQUIREMENTS][PATCH v2 2/6] reqs: add host GICv3 requirements
Date: Fri, 17 Jul 2026 10:11:23 +0300
Message-ID: <f5f0f7ed62715dba2c70eb651aedb5b368cdc208.1784272211.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784272211.git.mykola_kvach@epam.com>
References: <cover.1784272211.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::22) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|AS8PR03MB7985:EE_
X-MS-Office365-Filtering-Correlation-Id: 67d73b72-f855-47d4-37ea-08dee3d2b2f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	eOyRAVX3NH+bW1VVbAtfuOlO9SLe+LOHGurvtntJYHekDfgo09UTClqaHh6Fmn8AWFkY24ZPJKMs3GMnDaGKb+LVVL8MjdLlQFuyx/BC8+oWLhIhkNWbYsAt2Fl+Dsj/4x3fCC8glXBS88bLF6yEFxXSYliUIj1hlj3CR8JIcDhmE6Xi2PA8HrKnWNCblD1S52ZdtMeew4MlSNqEPjHF9WlFpzwFvwCXD+ZG45YJY6IP/SRvIbRu9np+7MmZgceCvol7N072jXL/f9rD9lnRcCuVHOIDUWecIQeetjBV72/aYqkDVIPlzXXbipPm35xAwGTKiFD1eUwzQnFTaOn6K+lJEeDj9ccIM9VhIHwQoO+1fvtfLU9EBF5RtCOIYFpHI/VQFOtzPe9GBMnSxvVb2BXahQNNA/fmoquELSqF8tcTRuSt/frbE/WQ9Kg4HaUxPeYGpyF5PRGT/I4mdY9/mJy0rT8L2jvTy39rZV4ky1Xeh/HGonrHw6+1u8zfv7cafkUj8Fwxqh/jk3+0F3m2MbJtGtkR5A6QVATKNDGpRoA72ooy3f7/FFOkztWsUOSoQGIpTpBx8uq4dbDz9NdndXpqYAuxKUbl5Ygk7z4H5GKn7vjxgIZPosYZTsYW70nE63WHA1cIgzBPLB6GdP6UW47i4OP5STnGUabzI2lJhWA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HdMQEP+lPieDkQC+7QrBKRjw6LneRYOu0hMoz4c2a29WJQ4Ey+wV5Q+Qe2at?=
 =?us-ascii?Q?bLty+RB3WQADeYyGDVllCdU/MBMkLHZA1BI+GKJf/xPEll4C2oyPAAgqLYaK?=
 =?us-ascii?Q?E1H2tct0ms0l8vGxnwebxNsbBobu8rEF5s3iU9cK10XfzS01ndLFhjKTwKph?=
 =?us-ascii?Q?D41W6T3tEz/ONOGNK5yq6FYtn/n04WOZrpMdFUyT5Rk8jPXr1//hPHOkqVc0?=
 =?us-ascii?Q?fOAynmLGH3CcKEOWktJ/pmlWYqxoH43xN54AIbA5qlVKMXYDvzCyVlnWHA39?=
 =?us-ascii?Q?9X+itaAe7nyDrtOeiaw2OwKPcPBqEoItMlOjk4+vavhrUHZ5fUOxR7dU8f29?=
 =?us-ascii?Q?5lZyGocXf8qf1cOfAp6AOXUDl7Yyw5UV61G94Ca2POkqUhkTK9GWPnu71+KK?=
 =?us-ascii?Q?IjDVFG8i7QFWtpLqHV5CL5Wikbt+4VrxFPW1gWmqjnYv/uiJ83syTRvnTv1t?=
 =?us-ascii?Q?W+z820cS6y+QRtqy/my/6H9lQoTgy4dKOQE1j4gH8nkQYyxjByx1TRWiZ7fJ?=
 =?us-ascii?Q?OxolJyyPRxjgGorG8xIiV3aUBcHEuOxqHa4XPfBNIdrA5qJTLG7HTY5UTTt+?=
 =?us-ascii?Q?fvSX+x0Aw3JyHow1eP9mO7ziZkDSkLUrYE4aznmejt4Pz6jIxKUoWhb+Ass3?=
 =?us-ascii?Q?SXkYY1JFHqbmaiRU3Y+yrjQban5eUbbdmw0WA8kdN5f98AykoutExBqdXafp?=
 =?us-ascii?Q?vGu61uwJJhgs+XXqQpHsyD0YdImxgqRYar+1yGq15pbtsf/Ys64xjKNLYekl?=
 =?us-ascii?Q?bdb13v7zDHxOeXZVeWvzs0Hs67YsnHXIrHGVUjKdmbGsXSFBYmAWdoHa9E6S?=
 =?us-ascii?Q?MRrwmzjx3AWSVhlWZffn9bk08vU+BKGOUpPkVeh7fovT/iBVR2uqCpkh8B03?=
 =?us-ascii?Q?LnrrDBo8Okls+3XIRAgtEbTS40CtK/Wj41mQLDrk/72JIjPcxrBV+AGYeAhj?=
 =?us-ascii?Q?B2nFuky4i9diBa4UTfus4lF9FMhUGPDcNkvtmr/o8wJiSXp0w1r+w3echwEx?=
 =?us-ascii?Q?aITbu3vRm0/M/2ZmWA1Pr1+FXuBGl/b6+x+FneftmKwDp/afFz9CwO6G3x1p?=
 =?us-ascii?Q?J0bs4PyZwaIKlEbF7P4wAviN2C5Pb84/LOxJ2lDJPnQx1fWWXv8ud74kyiRX?=
 =?us-ascii?Q?+AHHRyt//ydLoaMwfnvs2J6fYDIRUZ00oEGdOvDPjiJgkYHNvKGWlP6JpmHy?=
 =?us-ascii?Q?IvTlvuv7bcQp4UEFQ+Wn7Wzi+eX2NXBQAFM+B7qXqBNVtfarHuO72gqc8zHW?=
 =?us-ascii?Q?lzYAdrizFidjt23BODrMck9er/+S0RcZB2fZ/ZxDoDj4tBjqEAdDsNkmAHgt?=
 =?us-ascii?Q?ZFa13H8uHLTr8RqTBXr8RddrPI79szpYWjC9y5J76j32WbJfFNpOwBci5uZw?=
 =?us-ascii?Q?NQkhdBXtMHtPPYcztO1V1pcEsUyyuqDXxs6SelJhvltaMjj7oIDfzycU07Af?=
 =?us-ascii?Q?x2PC4b3PrdLQoHAp9mm4dcCRl1VKZrtNDtzQnOXa4Irr3wEJuCR8e4iiy2Op?=
 =?us-ascii?Q?i5fEbpBZKEvwlwMF9Wl6h8ZtBKkX9KR8fBDUDhKwH8ghuYZ78ylOmkR5QEgF?=
 =?us-ascii?Q?exDjd/6LCt9c4T3r3g63+WyLGYAMFhpiRAdQh7qHO+DEsH2XZOw27umpgy4d?=
 =?us-ascii?Q?OeVtd1ah+jk8UV/sIcvyvMCun2FzrGbfYBP8KXwuc9fqagARSGNBMNfFTRX5?=
 =?us-ascii?Q?pmOR+XlTuxD4BfGuI0GaeFBroZ0ojceqyZGmmicou2WnZTcoSreWG28omFr1?=
 =?us-ascii?Q?1WxzP0mpSw=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67d73b72-f855-47d4-37ea-08dee3d2b2f1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 07:12:01.9861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H4CdNpaMWFnD9/m5wW02mF/LRD8t8odTrlMV8nmeIW8ht5ZSXH6fONCfL2KHpkku/2EDXC0dS11nCMvbG3KeVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7985
X-purgate-ID: tlsNG-ebf023/1784272323-534C3B50-63ACFD31/0/0
X-purgate-type: clean
X-purgate-size: 18369

Add software requirements for the Device Tree-based host GICv3 path.

The requirements cover GICv3-specific host behavior: Device Tree operation
registration and description parsing, GICD/GICR architecture identification,
supported SPI and extended SPI INTID handling, Distributor and Redistributor
initialization, Redistributor enumeration and CPU association, CPU interface
initialization, SPI and extended SPI routing, Group 1 interrupt acknowledge
and completion, SGI delivery, and secondary pCPU interrupt readiness.

Guest/vGIC state, ITS/LPI handling, host GICv4 behavior, and common
interrupt-management behavior are covered by separate requirement groups.
ACPI discovery is out of scope for this document.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v2:
- avoid passive voice in titles.
---
 .../physical_resources/arm64/gicv3.rst        | 564 ++++++++++++++++++
 .../physical_resources/arm64/index.rst        |   1 +
 2 files changed, 565 insertions(+)
 create mode 100644 software_safety_reqs/domain_creation_and_runtime/physical_resources/arm64/gicv3.rst

diff --git a/software_safety_reqs/domain_creation_and_runtime/physical_resources/arm64/gicv3.rst b/software_safety_reqs/domain_creation_and_runtime/physical_resources/arm64/gicv3.rst
new file mode 100644
index 0000000..6a43165
--- /dev/null
+++ b/software_safety_reqs/domain_creation_and_runtime/physical_resources/arm64/gicv3.rst
@@ -0,0 +1,564 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Host GICv3 requirements
+=======================
+
+The following requirements are related to Xen's host-side support for the
+Arm Generic Interrupt Controller version 3 (GICv3) architecture [1].
+
+These requirements cover Xen's management of the physical GICv3 interfaces,
+including Distributor, Redistributor, CPU interface.
+
+Software Safety Requirements
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Host GICv3 Device Tree operation registration
+---------------------------------------------
+
+`XenSSR~arm64_register_gicv3_ops~1`
+
+Description:
+Xen shall register the host GICv3 interrupt-controller operations for Device
+Tree nodes that identify a GICv3 interrupt controller.
+
+Rationale:
+Xen uses the registered GICv3 operations to initialize and operate the host
+physical interrupt controller when the platform firmware describes a GICv3
+interrupt controller through Device Tree.
+
+Covers:
+ - `XenPRQ~boot~1`
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Host GICv3 Device Tree description
+----------------------------------
+
+`XenSSR~arm64_gicv3_dt_description~1`
+
+Description:
+Xen shall collect the GICv3 Distributor base and Redistributor region
+description from the Device Tree before host GICv3 initialization.
+
+The relevant Device Tree state includes:
+
+ - Distributor base address
+ - Redistributor region base addresses
+ - Redistributor region sizes
+ - ``#redistributor-regions``
+ - ``redistributor-stride``
+
+Rationale:
+Xen uses the Device Tree GICv3 description to locate the Distributor and to walk
+the Redistributor regions used by the host physical interrupt controller.
+
+Covers:
+ - `XenPRQ~boot~1`
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Host GICv3 System register support
+----------------------------------
+
+`XenSSR~arm64_gicv3_sysreg_support~1`
+
+Description:
+Xen shall select the host GICv3 driver after confirming GICv3 System register
+support is available on the CPU.
+
+Rationale:
+The host GICv3 driver uses the GICv3 CPU interface System registers for
+physical interrupt handling.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Host GICv3 architecture identification
+--------------------------------------
+
+`XenSSR~arm64_gicv3_arch_identification~1`
+
+Description:
+Xen shall identify a host GIC Distributor or Redistributor frame as
+GICv3-compatible only when its ``PIDR2`` architecture field reports GICv3 or
+GICv4.
+
+The relevant registers include:
+
+ - ``GICD_PIDR2``
+ - ``GICR_PIDR2``
+
+Rationale:
+Xen uses ``PIDR2`` to validate that the mapped frame belongs to a GICv3 or
+GICv4-compatible interrupt controller before using that frame as a host GICv3
+interface.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Host Distributor security-state preservation
+--------------------------------------------
+
+`XenSSR~arm64_gicv3_dist_are_ns_state_preservation~1`
+
+Description:
+Xen shall preserve the ``GICD_CTLR.ARE_NS`` value when disabling Distributor
+Group 1 physical interrupt delivery during initialization.
+
+Rationale:
+The GIC architecture makes changing ``GICD_CTLR.ARE_NS`` from 1 to 0
+unpredictable. Xen preserves the field when preparing the Distributor for host
+GICv3 initialization.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Host supported SPI and extended SPI INTID ranges
+------------------------------------------------
+
+`XenSSR~arm64_gicv3_supported_spi_and_espi_ranges~1`
+
+Description:
+Xen shall initialize and operate only SPI and extended SPI INTIDs implemented
+by the host GICv3 Distributor, as reported by GICD_TYPER.
+
+Rationale:
+Xen derives the supported Distributor-controlled physical interrupt range from
+the Distributor type information and uses that range when initializing and
+operating global interrupt state.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Host extended SPI support
+-------------------------
+
+`XenSSR~arm64_gicv3_espi_support~1`
+
+Description:
+Xen shall initialize and operate extended SPI INTIDs only when the host GICv3
+Distributor reports extended SPI support in GICD_TYPER. This shall include
+use of the following registers:
+
+ - ``GICD_TYPER``
+ - ``GICD_ICFGR<n>E``
+ - ``GICD_IPRIORITYR<n>E``
+ - ``GICD_ICENABLER<n>E``
+ - ``GICD_ICACTIVER<n>E``
+ - ``GICD_IGROUPR<n>E``
+ - ``GICD_IROUTER<n>E``
+
+Rationale:
+GICv3.1 defines an extended SPI range controlled through extended Distributor
+registers. Xen uses Distributor capability information to determine whether
+extended SPIs are present before initializing their configuration, priority,
+enable, active, group, and routing state.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Host Distributor Group 1 delivery
+---------------------------------
+
+`XenSSR~arm64_gicv3_dist_group1_delivery~1`
+
+Description:
+Xen shall enable Distributor Group 1 physical interrupt delivery only after
+supported SPI and extended SPI interrupt state has been initialized. The
+initialized state shall include:
+
+ - interrupt group state
+ - interrupt enable state
+ - interrupt active state
+ - interrupt priority state
+ - interrupt configuration state
+ - interrupt routing state
+
+Rationale:
+Xen initializes supported Distributor-controlled interrupt state before
+enabling Distributor forwarding so that physical interrupts are delivered using
+the configured group, enable, active, priority, configuration, and routing
+state.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Host Redistributor region enumeration
+-------------------------------------
+
+`XenSSR~arm64_gicv3_redist_region_enumeration~1`
+
+Description:
+Xen shall locate Redistributor frames only within discovered GICv3
+Redistributor regions and according to the region layout used for that
+platform. This shall include use of the following Redistributor discovery
+state:
+
+ - Redistributor region base
+ - Redistributor region count
+ - Redistributor stride
+ - ``GICR_TYPER.Last``
+ - ``GICR_TYPER.VLPIS``
+
+Rationale:
+GICv3 Redistributors can be described as one or more regions, and a region can
+contain Redistributor frames separated by the platform stride or by the
+architectural frame layout. A GICv4-compatible Redistributor can include
+additional VLPI and reserved frames after the RD and SGI frames. Xen uses the
+Redistributor region description to walk the available Redistributor frames and
+to stop at the end of the described Redistributor sequence.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Host Redistributor CPU association
+----------------------------------
+
+`XenSSR~arm64_gicv3_redist_cpu_association~1`
+
+Description:
+Xen shall associate each CPU with the GICv3 Redistributor that corresponds to
+that CPU before using Redistributor-local interrupt state for that CPU. This
+shall include use of Redistributor affinity information reported by:
+
+ - ``GICR_TYPER``
+
+Rationale:
+Redistributor-local registers control SGI and PPI hardware state for one CPU.
+Xen uses Redistributor affinity information to select the Redistributor
+associated with the CPU before programming local interrupt state.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Host Redistributor local interrupt initialization
+-------------------------------------------------
+
+`XenSSR~arm64_gicv3_redist_local_int_init~1`
+
+Description:
+Xen shall initialize Redistributor-local SGI and PPI hardware state before
+enabling local interrupt delivery on a CPU. The initialized state shall include:
+
+ - Redistributor wakeup state
+ - SGI and PPI priority state
+ - SGI and PPI active state
+ - SGI and PPI enable state
+ - SGI and PPI group state
+
+Rationale:
+The common interrupt-management requirements cover per-CPU local IRQ software
+state. The host GICv3 driver initializes the Redistributor-local hardware state
+used for SGI and PPI delivery before local interrupt delivery is enabled on the
+CPU.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Host CPU interface initialization
+---------------------------------
+
+`XenSSR~arm64_gicv3_cpu_interface_init~1`
+
+Description:
+Xen shall initialize the GICv3 CPU interface System register interface before
+enabling Group 1 interrupt delivery on a CPU. This shall include use of the
+following CPU interface System registers:
+
+ - ``ICC_SRE_EL2``
+ - ``ICC_BPR1_EL1``
+ - ``ICC_PMR_EL1``
+ - ``ICC_CTLR_EL1``
+
+Rationale:
+Xen uses the GICv3 CPU interface System registers to control access to the
+System register interface, priority masking, priority drop, deactivation, and
+Group 1 interrupt delivery.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Host CPU interface Group 1 delivery control
+-------------------------------------------
+
+`XenSSR~arm64_gicv3_cpu_iface_group1_delivery_control~1`
+
+Description:
+Xen shall use ``ICC_IGRPEN1_EL1`` to enable and disable host Group 1 physical
+interrupt delivery through the GICv3 CPU interface according to the per-CPU
+GICv3 lifecycle state.
+
+Rationale:
+The GICv3 CPU interface controls whether Group 1 physical interrupts can be
+signaled to a CPU. Xen enables Group 1 delivery only after per-CPU GICv3
+initialization has completed and disables Group 1 delivery when shutting down
+the per-CPU GICv3 physical CPU interface.
+
+Covers:
+ - `XenPRQ~intc~1`
+ - `XenPRQ-pcpu_off~1`
+ - `XenPRQ~pcpu_on~1`
+ - `XenPRQ~resume~1`
+ - `XenPRQ~suspend~1`
+
+Needs:
+ - XenVerTestCase
+
+Host SPI and extended SPI affinity routing
+------------------------------------------
+
+`XenSSR~arm64_gicv3_spi_and_espi_affinity_routing~1`
+
+Description:
+Xen shall route a physical SPI or extended SPI to a CPU selected from the
+requested CPU mask. This shall include use of the following Distributor routing
+register groups:
+
+ - ``GICD_IROUTER<n>``
+ - ``GICD_IROUTER<n>E``
+
+Rationale:
+The common interrupt-management requirements define the CPU-affinity contract
+for physical interrupts. The host GICv3 driver realizes that contract for SPIs
+and extended SPIs by programming the corresponding GICv3 Distributor routing
+register group.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Host Group 1 interrupt acknowledge
+----------------------------------
+
+`XenSSR~arm64_gicv3_cpu_iface_group1_ack~1`
+
+Description:
+Xen shall acknowledge host Group 1 physical interrupts through the GICv3 CPU
+interface. This shall include reading: ``ICC_IAR1_EL1``.
+
+Rationale:
+``ICC_IAR1_EL1`` is the GICv3 CPU interface register used to acknowledge a
+Group 1 physical interrupt and obtain the INTID selected by the CPU interface.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Host Xen-owned physical interrupt completion
+--------------------------------------------
+
+`XenSSR~arm64_gicv3_cpu_iface_host_int_completion~1`
+
+Description:
+Xen shall complete a Xen-owned physical interrupt through the GICv3 CPU
+interface when separate priority-drop and deactivate mode is used. This shall
+include use of:
+
+ - `ICC_EOIR1_EL1`
+ - `ICC_DIR_EL1`
+
+Rationale:
+In separate priority-drop and deactivate mode, `ICC_EOIR1_EL1` drops the
+priority of the interrupt and `ICC_DIR_EL1` deactivates the interrupt. Xen
+uses both operations so that a Xen-owned physical interrupt is no longer active
+after its handler has completed.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Host SGI delivery
+-----------------
+
+`XenSSR~arm64_gicv3_cpu_iface_sgi_delivery~1`
+
+Description:
+Xen shall send a host SGI through ``ICC_SGI1R_EL1`` to the CPU targets selected
+by the requested SGI mode and CPU mask.
+
+Rationale:
+``ICC_SGI1R_EL1`` encodes the SGI INTID and the target CPUs selected by Xen.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Host secondary CPU physical interrupt readiness
+-----------------------------------------------
+
+`XenSSR~arm64_gicv3_secondary_cpu_phys_int_readiness~1`
+
+Description:
+Xen shall complete per-CPU host GICv3 physical interrupt initialization before
+accepting physical interrupts on a secondary CPU.
+
+Rationale:
+The common interrupt-management requirements cover CPU hotplug notification and
+per-CPU IRQ software state. The host GICv3 driver initializes the
+Redistributor-local hardware state and physical CPU interface state required for
+SGI, PPI and routed SPI delivery on the secondary CPU.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Host suspend/resume
+^^^^^^^^^^^^^^^^^^^
+
+Suspend/resume GIC context
+--------------------------
+
+The Xen-owned GIC suspend/resume context covers the following register state,
+when the corresponding GIC version and optional feature is implemented and
+enabled on the platform.
+
+CPU interface registers:
+ - ``ICC_CTLR_EL1``
+ - ``ICC_PMR_EL1``
+ - ``ICC_BPR1_EL1``
+ - ``ICC_SRE_EL2``
+ - ``ICC_IGRPEN1_EL1``
+ - ``ICC_AP1R<n>_EL1`` is checked for physical Group 1 active-priority
+   quiescence before suspend and is not restored as normal suspend context.
+
+Distributor registers:
+ - ``GICD_CTLR``
+ - ``GICD_ISENABLER<n>``
+ - ``GICD_ISACTIVER<n>``
+ - ``GICD_IPRIORITYR<n>``
+ - ``GICD_IROUTER<n>``
+ - ``GICD_ICFGR<n>``
+ - ``GICD_IGROUPR<n>`` is re-initialized as part of resume ordering where
+   required by the GICv3 restore sequence.
+
+Redistributor registers:
+ - ``GICR_CTLR``
+ - ``GICR_IPRIORITYR<n>`` for SGI/PPI priority state
+ - ``GICR_ISACTIVER0``
+ - ``GICR_ISENABLER0``
+ - ``GICR_IGROUPR0``
+ - ``GICR_ICFGR1``
+
+Distributor eSPI registers:
+ - ``GICD_ISENABLERnE<n>``
+ - ``GICD_ISACTIVERnE<n>``
+ - ``GICD_IPRIORITYRnE<n>``
+ - ``GICD_IROUTERnE<n>``
+ - ``GICD_ICFGRnE<n>``
+ - ``GICD_IGROUPRnE<n>`` is re-initialized as part of the eSPI resume ordering
+   where required by the GICv3 restore sequence.
+
+The GIC suspend/resume context is limited to state owned by Xen. Guest-owned
+virtual GIC state that is saved and restored on vCPU context switch is not part
+of the host-wide GIC suspend context.
+
+Save GIC state before on suspend
+--------------------------------
+
+`XenSSR~arm64_suspend_resume_gic_save_before_firmware~1`
+
+Description:
+Xen shall save the Xen-owned GIC context before invoking firmware
+``SYSTEM_SUSPEND``, it is required to restore host interrupt management
+after firmware wakeup.
+
+The saved context is described in `Suspend/resume GIC context`_.
+
+Rationale:
+
+Covers:
+ - `XenPRQ~intc~1`
+ - `XenPRQ~suspend~1`
+
+Needs:
+ - XenVerTestCase
+
+Restore GIC state before unmasking local IRQ delivery
+-----------------------------------------------------
+
+`XenSSR~arm64_suspend_resume_gic_restore_before_irq_unmask~1`
+
+Description:
+Xen shall restore the Xen-owned GIC context after firmware resume or
+host-suspend abort, it is required for host interrupt management before
+local IRQ delivery is unmasked on the CPU executing the host resume or
+abort path.
+
+The restored context is described in `Suspend/resume GIC context`_.
+
+Rationale:
+
+Covers:
+ - `XenPRQ~intc~1`
+ - `XenPRQ~resume~1`
+
+Needs:
+ - XenVerTestCase
+
+Quiescent GIC state before suspend point
+----------------------------------------
+
+`XenSSR~arm64_suspend_resume_gic_quiescent_state~1`
+
+Description:
+Xen shall enter a GIC suspend point only after visible active-priority and
+active interrupt state has reached a quiescent state suitable for saving the
+GIC context.
+
+Rationale:
+Saving interrupt-controller state while active state remains visible can make
+the saved GIC context inconsistent with the physical interrupt lifecycle and
+break interrupt restoration after resume.
+
+Covers:
+ - `XenPRQ~intc~1`
+ - `XenPRQ~suspend~1`
+
+Needs:
+ - XenVerTestCase
+
+| [1] Arm Generic Interrupt Controller Architecture Specification (GIC architecture version 3 and version 4)
diff --git a/software_safety_reqs/domain_creation_and_runtime/physical_resources/arm64/index.rst b/software_safety_reqs/domain_creation_and_runtime/physical_resources/arm64/index.rst
index 8ba4601..71d8981 100644
--- a/software_safety_reqs/domain_creation_and_runtime/physical_resources/arm64/index.rst
+++ b/software_safety_reqs/domain_creation_and_runtime/physical_resources/arm64/index.rst
@@ -6,6 +6,7 @@ Arm64
 .. toctree::
    :maxdepth: 1
 
+   gicv3
    p2m
    pci_host_rcar
    scif
-- 
2.43.0


