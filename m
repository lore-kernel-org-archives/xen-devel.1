Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F493C4451B
	for <xen-devel@archiver.kernel.org>; Fri, 17 Jul 2026 07:12:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364690.1615729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkcjw-0006H0-Ri; Fri, 17 Jul 2026 07:12:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364690.1615729; Fri, 17 Jul 2026 07:12:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkcjw-0006Gt-Nr; Fri, 17 Jul 2026 07:12:08 +0000
Received: by outflank-mailman (input) for mailman id 1364690;
 Fri, 17 Jul 2026 07:12:06 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wkcju-0005q6-Dx
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 07:12:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkcjt-00H0XY-Q2
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 09:12:05 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a59d5b8-e002-0a2a0a5209dd-0a2a4501c0f4-30
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 09:12:05 +0200
Received: from [52.101.70.109]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a59d5c5-5984-0a2a45010019-3465466d3704-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 09:12:05 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AS8PR03MB7985.eurprd03.prod.outlook.com (2603:10a6:20b:428::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 07:12:04 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 07:12:04 +0000
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
 b=pkN2og13ZaOs6pCSf2b6V13pUP00uvbFKfnmq/pOxzK2CxXFTFcLWS2Un7yzUHrjDObFUo76VL3squv/mUjGwcGgz/SXJPKmlZsCxaINt+/sFQ5wXwe9A35j/GrrU/tlI8CzmtmN9r2w9mH1EURMS8wKsRd7pFawqEun94c0qH7xtT0gaK0gzqofnDbNi7grcUHyyAtM/SiIcIPWF88i7u/lR1TwhDp0iEt+yZDnrngyV1VzPxOGx+F8oh6g0DYQcooLl8byIdqlOXsm2HWSAlzj3/UDdOC0POeMrhT5BrNC/IDibAMrqzrcVYorBEHd1tlXGuPykbRzTWGDZTmu9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dr92w94V0rPtA/gfsJJq+CW+myR1yaLgep3VMkEZMFY=;
 b=G+aQZ8kgU9EqBDcqP0IGFlIbWyrJXZswLSJ2PpwDlWMR6dMJfMzHWQ27UEm/F4V3Xg03NsHHIBQeMy++zXw3LMqEhxdtWreJk+3vsOaXHoOPN9wMPOFTpa2QmLuzn4kksMUXr9Pk/H/RwT6i4LDF2r17xxQPeNoQsZPQGo8FAlGpQxWOweOKspm2Fv7Wtkq+LO/ogaVIvOsO+/pEH080jd0RBXfDPbKvfS8gJTK9p92EVRHJ4wZbgVPqD3nAm+0EBnwg2Dk1VVyhsBZwi/VaLBAIJejWU639TrCCC5pSOqWMb+t/hAzn8djsm8+lYhGEBYTrCQvKTSpD4/axzS/z9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dr92w94V0rPtA/gfsJJq+CW+myR1yaLgep3VMkEZMFY=;
 b=BhmdUUqufW6wRg7hNTXRK7IzcmYj4wQBYxR+YM1o7j9Ri6ArTwiz+f9a7ucnwZAFt3bXiZGDlOCQWZZZEX/+VCGUBoK/PX7MxXTUFQ+0FTu3Bqc3SmZl8Pr31LsP6/7g2f32agMBV39YZVGMyJ3Oy/HbhyCWRLIKTMgAvg26Jviv/gwb+oivK5JRCeeO2FzkWF+YenXCffxgzv3xyEodXZ+ePItOTptewp8E0eo0Xr1j51yu7Ue+pPCYxCcIRVtpUByRKWZ06FP8mVc6rE995dUbZoSL6kNNlpeRUvXFZSzlozctt/ykbzhWDDHAWHS8qIrjRnzjqj/iXb0OLD0UvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Subject: [REQUIREMENTS][PATCH v2 4/6] reqs: add host ITS/LPI requirements
Date: Fri, 17 Jul 2026 10:11:25 +0300
Message-ID: <614929b338211f30efe8a51f61a4ad263ee862e6.1784272211.git.mykola_kvach@epam.com>
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
X-MS-Office365-Filtering-Correlation-Id: 37012a48-e8f5-431d-1b3c-08dee3d2b447
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|3023799007|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	NNqpgIXR+oaO0M6dYKuPsmAMDyjTT87chavq+newrG6nqU7UvqpLxYIeSz5vcl5X07Tos2MaKxbD9mhnORCdBcRrpepVUgeIjdYIo80VkCLIs4kZo5TcCFjma726T/G2SAGGC46TZD6x1S5l/rX4wOeSVGJP7RDNKaqKMvzWsMZJAncLR225DKFOpch34me7i8wtH9EuCNCRNNBxSaAjmYHYI5zN5GCATki38Ak6857/W1PnhKRNIFgcllvNqu09xX837IhHVxhfB9eHlJeOkK/xcZViim17BvyFHEHscv7JgE/HMge9TJlYby26k709kntJ6zXFHNVBhslmMwZPAR1Ixvi0+szJKwXcVIoiBSC9KlwJQghpvDYHDvfVZl/1mpIGlgOQD7EtD2ZwBWkJX+VyEChtX+AyCMkp0iylsCFgBnc0VeHSRySORI6PQyxeQQ74YZKlJjyPEDD3c6fmPW7/ePtoHt5ziDOju8Pq2r/v60BFhrGa8CuSN69yWGLvNBwnlimb3o3tHiVEbYg9hiujkWVELyZ6wg7iLYHX+TGZ8EIvsh9mrPCXhdXfb6ef21raUHfMzTYUq2Mi6o5FwwNBwt98C1ubFpuglYGsQa8JKBLWgI50P/XSsg7xVRcEq2JaF3fg2fM9LPzPEWLeadgJhphRz/FFbrLKWZ9RWdM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(3023799007)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/xGa+0kVRo9yJU7+7D8NeepsMZf2LOgQeycSUlAA2owKwLMnm4qODSHOEMvL?=
 =?us-ascii?Q?dLe95/jb3abA9k4uLDdoJv7/JFwqxWZufue0xpcB/0Sbw1zzsxdlxxIr/C3c?=
 =?us-ascii?Q?BRiocUGEugeb9/Q+n5i4jN/a5h5H6PywtCZorBaCv9k8h8cEP070ZgtVtEM+?=
 =?us-ascii?Q?Q+XCe46yfg0Qhm3qkmhVfwQ2maLSmzNr9HPW9AytJqxOrrncAS0v5VLWNdCd?=
 =?us-ascii?Q?57t+RizY4fPb2a/gIFsApWG6zazuJ+6zSX+Ej0qkgRENn8deSinwX5xLrVzP?=
 =?us-ascii?Q?1PIdxaGDenKoo+eMuu+Bev4nVr+V6i5/WdkYv1VZJmFwa6fDlYrxADlY4Tox?=
 =?us-ascii?Q?O+IAnLR3Xw98yuEqPVNvsW7LpKBpl+YPY8SY9Y+DqyWLDoIwg7JTik9deiwK?=
 =?us-ascii?Q?BloU7K1tyohxwcRr81cqLEDotQLSvl3r0wWL+BszzSYUcp3fqnu+1ri7XHVC?=
 =?us-ascii?Q?QOEDoNIm3WIjqf5GPmChXwnBMCyG7XxgENaHeXpot70+bXNgmJK5LzzfGtv1?=
 =?us-ascii?Q?fuo+QdZ0qm3EOfoV+u9gpY0mJHplGdsupn6pMO+jFFCyx2fObhSv1k4/i1bN?=
 =?us-ascii?Q?/8m5HOEkqE7c8LQApWQ4WlunZtJttkMvHYAAP+GK5CJOV7VWfhesaAusTfJe?=
 =?us-ascii?Q?u94yfjh8yk6wzPZW3WqR7ABteNPA7sQpIXFo++D7N8omZaMWPrDZaaZeZW3I?=
 =?us-ascii?Q?7NhDWeZSd725os1ncW5ik+ao3bJm4Z+zwa2U5mOhJlKk7l8x3rXrPhQZfigX?=
 =?us-ascii?Q?7IvA4u3HgLNgXbS85KaSXBkYqKU9vtrP3u425DHlAjGtQseuRf4J01614NRi?=
 =?us-ascii?Q?suqEi3Jie67GGivJuhXpsggsUmvLmZAql8g5YzSzuZgIqrCC9MVGEq0DjAKc?=
 =?us-ascii?Q?kcRNp0ADwz9ktbwJZCabVmkcAQ3fqAzV2nsz+tqmvgxaQ8c1aaAsNe51u3ku?=
 =?us-ascii?Q?SoINrQznQ2o0NEdm6boZsol0G+pB5NOC7IFNfeD8KIUGEdhMSOEah7wPCEDF?=
 =?us-ascii?Q?Sx2iuYCXgGzO61VklJiAaSkRUCJ3wVeUQtMyjQww1H2blI9fw7/VP4QnB6UI?=
 =?us-ascii?Q?RH8eG4bHFGYDBUo8hRWm2w34zFbe7YwIAfvJ3lSIO+BxCq9OS1UcsyY3DwoW?=
 =?us-ascii?Q?WALw8dqODF2EkITHotPSgBMhR7UWnn984E3WTUM6BRf2a956OL60vEjZfFOZ?=
 =?us-ascii?Q?S2+btf86AUaoiG9VLMqa9TNfJphfa5ZmhEVBynVDzisKBbXzgXR4jgg1I+sN?=
 =?us-ascii?Q?ertLObqkgQ61ELUgq2oabVbmjeE9DfwTwQrDuA4oge1taxdw89UUsf49SsrK?=
 =?us-ascii?Q?IdHWDnf+jk8vSOUYnINh53hZXVif9Mr/O7Y2tRwiLska4cxf9ZCcOTd+NOuE?=
 =?us-ascii?Q?9e01vXh5qSRQ1MOYKiWixR7t1/VhcNblbV/1M5xfTfzb4+tMgq+s4++Ez6Ij?=
 =?us-ascii?Q?q8jV97wjkPHIzWtCAjQaE0dLR9SyJUgAVTfXcR00mixU9i8gmTJezaqt7Afm?=
 =?us-ascii?Q?PxZQf+fq0TVipo2XxZ2C0w/5TQDIR2MvM5d3kTe7epJDv3NIiL46+N2yd0re?=
 =?us-ascii?Q?mQroS7CRBVFXOMMg9pv5Fn93+ecOFSAorporJjTNn1YX0OTpFxWM/526V3W/?=
 =?us-ascii?Q?vZmQ533mwDRE4rL2dtWAQ8aH2lMGtyb7W6Z4a9pTBpVdxHrrkw/32XwHuQYP?=
 =?us-ascii?Q?03nnesXJSKH0H0yfKwmSwUed66C6AD6yUEnCOo3IdX6H6CFp/CKaCmU74Oka?=
 =?us-ascii?Q?Sttc/yPjzQ=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37012a48-e8f5-431d-1b3c-08dee3d2b447
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 07:12:04.2570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2l+Geg4UxQ8vUh2DdX822quNRBtli7kl0kWRdtePj7anYxYHEH5L0hLttVQwuA/jqHXcSvaZshnQoGeBY8iqmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7985
X-purgate-ID: tlsNG-d62444/1784272325-BC95A757-4198AD93/0/0
X-purgate-type: clean
X-purgate-size: 15908

Add software requirements for Xen's host-side ITS-backed LPI handling.
Guest-visible ITS behaviour is covered by separate requirement.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v2:
- avoid passive voice in titles.
---
 .../physical_resources/arm64/index.rst        |   1 +
 .../physical_resources/arm64/its.rst          | 519 ++++++++++++++++++
 2 files changed, 520 insertions(+)
 create mode 100644 software_safety_reqs/domain_creation_and_runtime/physical_resources/arm64/its.rst

diff --git a/software_safety_reqs/domain_creation_and_runtime/physical_resources/arm64/index.rst b/software_safety_reqs/domain_creation_and_runtime/physical_resources/arm64/index.rst
index 71d8981..cd1aaca 100644
--- a/software_safety_reqs/domain_creation_and_runtime/physical_resources/arm64/index.rst
+++ b/software_safety_reqs/domain_creation_and_runtime/physical_resources/arm64/index.rst
@@ -7,6 +7,7 @@ Arm64
    :maxdepth: 1
 
    gicv3
+   its
    p2m
    pci_host_rcar
    scif
diff --git a/software_safety_reqs/domain_creation_and_runtime/physical_resources/arm64/its.rst b/software_safety_reqs/domain_creation_and_runtime/physical_resources/arm64/its.rst
new file mode 100644
index 0000000..6024259
--- /dev/null
+++ b/software_safety_reqs/domain_creation_and_runtime/physical_resources/arm64/its.rst
@@ -0,0 +1,519 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Host ITS/LPI requirements
+=========================
+
+The following requirements define Xen's host-side use of GICv3 ITS and LPI
+interfaces [1]. Guest-visible ITS/vGIC state and GICv4 direct virtual LPI
+delivery are covered by separate requirement groups.
+
+Host ITS Device Tree discovery
+------------------------------
+
+`XenSSR~arm64_gicv3_its_dt_discovery~1`
+
+Description:
+Xen shall discover host ITS frames from Device Tree nodes compatible with
+``arm,gic-v3-its``. This discovery shall include use of the following Device
+Tree state:
+
+ - ITS node compatibility
+ - ITS register frame base address
+ - ITS register frame size
+
+Rationale:
+Xen uses host ITS frames to translate assigned-device MSI events into host
+LPIs.
+
+Covers:
+ - `XenPRQ~boot~1`
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Host ITS initialization before use
+----------------------------------
+
+`XenSSR~arm64_gicv3_its_init_before_use~1`
+
+Description:
+Xen shall initialize a discovered host ITS before using it for MSI/LPI
+translation.
+
+Rationale:
+A host ITS translates DeviceID and EventID values into LPIs routed to
+Redistributors. Xen relies on initialized ITS state before creating host event
+mappings.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Host ITS quiescent state before configuration
+---------------------------------------------
+
+`XenSSR~arm64_gicv3_its_quiescent_before_config~1`
+
+Description:
+Xen shall put a host ITS into the quiescent state before programming its
+command queue or translation table base registers. This shall include use of:
+
+ - ``GITS_CTLR.Enabled``
+ - ``GITS_CTLR.Quiescent``
+
+Rationale:
+A host ITS can retain outstanding commands or translations. Xen ensures that
+previous ITS activity has completed before programming new host ITS state.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Host ITS command queue readiness
+--------------------------------
+
+`XenSSR~arm64_gicv3_its_cmd_queue_ready~1`
+
+Description:
+Xen shall configure the host ITS command queue before issuing host ITS
+commands. This shall include use of:
+
+ - ``GITS_CBASER``
+ - ``GITS_CWRITER``
+ - ``GITS_CREADR``
+
+Rationale:
+Xen issues host ITS commands through the ITS command queue. The command queue
+state determines where command entries are stored and how producer and consumer
+positions are tracked.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Host ITS translation table readiness
+------------------------------------
+
+`XenSSR~arm64_gicv3_its_translation_table_ready~1`
+
+Description:
+Xen shall configure the host ITS translation tables required by the selected
+ITS before enabling that ITS. This shall include use of:
+
+ - ``GITS_BASER<n>``
+ - ``GITS_TYPER``
+ - ``GITS_CTLR``
+
+Rationale:
+The ITS uses translation tables to store Device, Collection and other
+implementation-supported translation state.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Host ITS command issue
+----------------------
+
+`XenSSR~arm64_gicv3_its_cmd_issue~1`
+
+Description:
+Xen shall issue a host ITS command only after the command queue has space for
+the command entry. This shall include use of:
+
+ - ``GITS_CREADR``
+ - ``GITS_CWRITER``
+
+Rationale:
+The ITS command queue is a circular queue. Xen advances the command queue
+producer position to expose command entries to the ITS.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Host ITS command completion
+---------------------------
+
+`XenSSR~arm64_gicv3_its_cmd_completion~1`
+
+Description:
+Xen shall complete the host ITS command sequence required for a mapping before
+reporting that mapping as successful. Depending on the mapping operation, this
+shall include completion of the relevant command sequence using:
+
+ - ``MAPC``
+ - ``MAPD``
+ - ``MAPTI``
+ - ``INV``
+ - ``SYNC``
+
+Rationale:
+Host ITS commands complete asynchronously. Mapping success depends on the host
+ITS completing the commands that create, update or invalidate interrupt
+translation state.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Host ITS command failure propagation
+------------------------------------
+
+`XenSSR~arm64_gicv3_its_cmd_failure_propagation~1`
+
+Description:
+Xen shall propagate host ITS command issue or completion failure to the
+operation that depends on that command.
+
+Rationale:
+A host ITS command queue full condition, command issue failure or command
+completion timeout means the dependent ITS translation state cannot be treated
+as committed.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Host ITS Redistributor target encoding
+--------------------------------------
+
+`XenSSR~arm64_gicv3_its_rd_target_encoding~1`
+
+Description:
+Xen shall encode host ITS Redistributor targets using the RDbase format selected
+by the host ITS. This shall include use of:
+
+ - ``GITS_TYPER.PTA``
+
+Rationale:
+A host ITS can identify Redistributor targets by physical address or by
+Redistributor processor number. Xen uses the selected ITS target address format
+when encoding commands that refer to Redistributor targets.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Host ITS collection target setup
+--------------------------------
+
+`XenSSR~arm64_gicv3_its_collection_target_setup~1`
+
+Description:
+Xen shall complete host ITS collection setup for a CPU before using that CPU as
+an LPI delivery target. This shall include completion of:
+
+ - ``MAPC``
+ - ``SYNC``
+
+Rationale:
+A host ITS collection identifies the Redistributor target used for LPI delivery
+to a CPU.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Host ITS DeviceID and EventID range
+-----------------------------------
+
+`XenSSR~arm64_gicv3_its_device_event_range~1`
+
+Description:
+Xen shall map host ITS device events using DeviceID and EventID values within
+the ranges supported by the selected host ITS. This shall include use of:
+
+ - ``GITS_TYPER``
+
+Rationale:
+The host ITS uses DeviceID and EventID values to index interrupt translation
+state. Xen derives the supported ranges from the selected host ITS capability
+state.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Host ITS assigned-device mapping setup
+--------------------------------------
+
+`XenSSR~arm64_gicv3_its_assigned_dev_mapping_setup~1`
+
+Description:
+Xen shall complete host ITS device and event mapping before reporting an
+assigned-device interrupt mapping as successful. Depending on the mapping
+operation, this shall include completion of the relevant command sequence using:
+
+ - ``MAPD``
+ - ``MAPTI``
+ - ``INV``
+ - ``SYNC``
+
+Rationale:
+Assigned-device interrupt delivery depends on a valid host device table entry
+and a valid EventID-to-host-LPI translation.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Host ITS setup rollback
+-----------------------
+
+`XenSSR~arm64_gicv3_its_setup_rollback~1`
+
+Description:
+Xen shall remove host ITS and host LPI state created for an assigned-device
+event setup when that setup fails before completion.
+
+Rationale:
+Assigned-device interrupt setup can fail after some host ITS or host LPI state
+has been created. Xen removes the partial state so that later interrupts cannot
+use an incomplete mapping.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Host LPI support selection
+--------------------------
+
+`XenSSR~arm64_gicv3_lpi_support_selection~1`
+
+Description:
+Xen shall enable host LPI delivery only when the host GIC reports LPI support
+and at least one host ITS has been discovered.
+
+Rationale:
+The reviewed Xen host LPI implementation uses an ITS to translate MSI events
+into LPIs. Without a discovered host ITS, Xen does not configure Redistributor
+LPI delivery for host LPIs.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Host LPI Redistributor state readiness
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+`XenSSR~arm64_gicv3_lpi_redist_state_readiness~1`
+
+Description:
+Xen shall enable host LPI delivery for a Redistributor only after the LPI
+Property table and a zeroed LPI Pending table for that Redistributor have been
+initialized successfully. This shall include use of:
+
+ - GICR_PROPBASER
+ - GICR_PENDBASER
+ - GICR_CTLR
+
+Rationale:
+The Redistributor uses the LPI Property table to determine LPI enable and
+priority state, and the LPI Pending table to record physical LPI pending state.
+Xen enables host LPI delivery only after both tables have been initialized so
+that host LPIs are delivered using initialized Redistributor LPI state.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Host LPI INTID allocation
+-------------------------
+
+`XenSSR~arm64_gicv3_lpi_intid_allocation~1`
+
+Description:
+Xen shall allocate host LPI INTIDs from the physical LPI INTID range supported
+by the host GIC. This shall include use of the following state:
+
+ - ``GICD_TYPER.IDbits``
+ - configured Xen host LPI limit
+
+Rationale:
+Host LPIs are physical interrupt IDs used to represent assigned-device events.
+Xen limits host LPI allocation to the implemented physical INTID range and to
+the configured host LPI limit.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Host LPI ownership lookup
+-------------------------
+
+`XenSSR~arm64_gicv3_lpi_delivery_ownership~1`
+
+Description:
+Xen shall resolve a received host LPI to the domain and virtual LPI associated
+with the active host ITS mapping for that device event.
+
+Rationale:
+A host LPI represents an assigned-device event after host ITS translation. Xen
+uses the host LPI ownership state to identify the target domain and virtual LPI
+before handing the interrupt to the virtual interrupt delivery path.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Host suspend/resume
+-------------------
+
+Suspend/resume ITS context
+^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The suspend/resume requirements below apply to Xen-owned host ITS state and
+Redistributor LPI state. The covered context includes the following state, when
+the corresponding feature is implemented and enabled on the platform.
+
+ITS state:
+
+ - ``GITS_CTLR``
+ - ``GITS_CBASER``
+ - ``GITS_BASER<n>``
+ - ``GITS_CWRITER`` is reset after restoring ``GITS_CBASER`` so that command
+   queue pointers are coherent after resume.
+ - ITS collection state is replayed only when the collection is held in the ITS
+   itself. Memory-backed collections are restored through the restored
+   ``GITS_BASER<n>`` tables and are not remapped unconditionally.
+
+Redistributor LPI state:
+
+ -  ``GICR_PROPBASER``
+ -  ``GICR_PENDBASER``
+
+Save host ITS/LPI state before suspend
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+`XenSSR~arm64_suspend_resume_its_lpi_save_before_firmware~1`
+
+Description:
+Xen shall save the Xen-owned host ITS/LPI context required to restore host
+MSI-to-LPI translation and LPI delivery after firmware wakeup before invoking
+firmware ``SYSTEM_SUSPEND``. The saved context is described in the
+`Suspend/resume ITS context`_.
+
+Rationale:
+Firmware suspend can remove or reset host ITS and Redistributor LPI state. Xen
+saves the Xen-owned ITS/LPI state before entering firmware suspend so that host
+MSI-to-LPI translation and LPI delivery can be restored after wakeup.
+
+Covers:
+ - `XenPRQ~intc~1`
+ - `XenPRQ~suspend~1`
+
+Needs:
+ - XenVerTestCase
+
+Restore host ITS/LPI state before use
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+`XenSSR~arm64_suspend_resume_its_lpi_restore_before_use~1`
+
+Description:
+Xen shall restore the Xen-owned host ITS/LPI context after firmware resume or
+host-suspend abort before issuing host ITS commands or relying on host LPI
+delivery. The restored context is described in the `Suspend/resume ITS context`_.
+
+Rationale:
+Host ITS commands and host LPI delivery rely on initialized ITS tables, command
+queue state, and Redistributor LPI state. Xen restores the Xen-owned ITS/LPI
+context before using the host ITS or relying on host LPI delivery after resume
+or suspend abort.
+
+Covers:
+ - `XenPRQ~intc~1`
+ - `XenPRQ~resume~1`
+
+Needs:
+ - XenVerTestCase
+
+Replay ITS-backed collection mappings when required
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+`XenSSR~arm64_suspend_resume_its_collection_replay_conditional~1`
+
+Description:
+Xen shall replay host ITS collection mappings on resume only for collection IDs
+held in the ITS itself, as indicated by ``GITS_TYPER.HCC``. This shall include
+use of:
+
+ - ``GITS_TYPER.HCC``
+ - ``MAPC``
+ - ``SYNC``
+
+Xen shall use the restored ``GITS_BASER<n>`` translation table state as the
+source of collection state for memory-backed collections.
+
+Rationale:
+ITS collection state can be held either in the ITS itself or in memory-backed
+tables. Replaying collection mappings for memory-backed collections can
+duplicate or overwrite state that has already been restored through
+``GITS_BASER<n>``. Conditioning replay on ``GITS_TYPER.HCC`` keeps the resume
+path aligned with the ITS collection storage model.
+
+Covers:
+ - `XenPRQ~intc~1`
+ - `XenPRQ~resume~1`
+
+Needs:
+ - XenVerTestCase
+
+Tolerate retained Redistributor LPI state
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+`XenSSR~arm64_suspend_resume_its_retained_redist_lpi_state~1`
+
+Description:
+Xen shall tolerate platforms where Redistributor LPI state is retained across
+CPU_OFF/CPU_ON or host suspend/resume, and shall avoid reinitializing retained
+Redistributor LPI state as lost state.
+
+Rationale:
+Some platforms retain Redistributor LPI state across CPU power transitions or
+host suspend/resume. Incorrect reinitialization can corrupt retained pending or
+configured LPI state.
+
+Covers:
+ - `XenPRQ~intc~1`
+ - `XenPRQ~pcpu_on~1`
+ - `XenPRQ~resume~1`
+
+Needs:
+ - XenVerTestCase
+
+| [1] Arm Generic Interrupt Controller Architecture Specification (GIC architecture version 3 and version 4)
-- 
2.43.0


