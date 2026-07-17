Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D61C44515
	for <xen-devel@archiver.kernel.org>; Fri, 17 Jul 2026 07:12:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364693.1615747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkcjy-0006kB-LG; Fri, 17 Jul 2026 07:12:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364693.1615747; Fri, 17 Jul 2026 07:12:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkcjy-0006jN-HV; Fri, 17 Jul 2026 07:12:10 +0000
Received: by outflank-mailman (input) for mailman id 1364693;
 Fri, 17 Jul 2026 07:12:09 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wkcjx-0006JV-6D
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 07:12:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkcjw-008Yk2-Ij
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 09:12:08 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a59d5c7-5cb7-0a2a0a5109dd-0a2a450cc734-8
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 09:12:08 +0200
Received: from [52.101.70.89]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a59d5c7-f479-0a2a450c0019-34654659d56c-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 09:12:08 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AS8PR03MB7985.eurprd03.prod.outlook.com (2603:10a6:20b:428::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 07:12:06 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 07:12:06 +0000
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
 b=rqk4QIMBkIPpiWVVBexJ2xREhFStjddPGa75WEvkFwSKD2J6ZNCc7VxznNneQrPHtsokMiyxXmz+X6XLi+ok5ku3miETDxfF4vgB5ZxuDvthTk17L2dp+5nbWVqVpYGqMxDyWdAO6mwMXiMEEtBngJmYA6LQjh7rLXQxox1XZy/YAkO7Xr9r8GUa8fMS0Siwtmk4h/zpH8aYvjDK/b+hStwoLbLKZKcD6yoExEjm82fMBL8iM9sbn2Z+X0JlhHi9OMlx4l8Mr7uVkzr4pILtDBAHAuDglj4oiQB2aO2bXWvEd5r7+GJH/NMQaHiadQGEHl3TdztNIkZCelHlKZ403g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHZeubp6rodZIu6FKlqVypVjLIt2F/eJExuxnKnFRKc=;
 b=k64083KrxcN3MX0uVmWM9fptJbNWKxndtSZ1kxtUwPkHDT18nLjmlv6OoJeZZ/bV8K7tDJhfNe65c4qf3d/sZ6EPXrhNLzVdluV6G+s9NlWvCuOaCDfv0MheukcbS1ak8xx6mXr0gr0Alv+FYl6fBzHZ5uZB06s2GSXW/gNBLyqPI75SFdygaI3tkMYCzLikAdgjCivxmHucr6u1oS2ZHaMBjWFCZdVaJpvU6/+ihyZrXfpr0S+HR9NokzMIuQXq9gFNvoqODkZvOmbd5/u+bHn1rRfyqEvMlaSSWaILnkDEn0BwyYPdbbm39tggZJMSL4tsInwFDo/6wfxtvVSuIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHZeubp6rodZIu6FKlqVypVjLIt2F/eJExuxnKnFRKc=;
 b=PA0SzqI2ZBGI/MLA6R7Bh8AwiRKFYl0fFDWtvcyoTdHC3uuctCwca1BQZ75NOao86exR6JWP0lC0UYua7V6QFMuZakXud0QPNTHtathmgoA0NkZyDcqZ/H5fIj5h7D5VRHXQ55u5YvEMmW9S9u1VYkMxZLDOO45IeiNvLhexBRfjG8cA8ZOdf89LCnEeUDL7Og6pA5XbVxxR4Rs7ReB1TGrtf82rymQP612SiXNqVHz3pWeKFI3ss8oYsmAInxu55H7aDqI8I3yxuB/EJoNfx3j5HN87aQo89FC2GFi2ffbtMwnK+lhtG/YbGWh13MbFp7gVkT7PMAozYrHRzh2rYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Subject: [REQUIREMENTS][PATCH v2 6/6] reqs: add GICv4 direct-delivery requirements
Date: Fri, 17 Jul 2026 10:11:27 +0300
Message-ID: <76e371b97b8376f552fbfeb51d1ef3a3dec38006.1784272211.git.mykola_kvach@epam.com>
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
X-MS-Office365-Filtering-Correlation-Id: 883cdd68-e1ab-4f0f-8260-08dee3d2b5b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|3023799007|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	9pR8ZLgg7KMHD+YgPDqsCiLbmMs5mHFAPq/Zc4t8ULLL+UB04B731vANgD2LWpVoO0KjgE2UeHpmjpUqaKEpp8q04pkSJHZn4rOLSBXgLGVsqq1NMO/iAG23Qsx3AmoafemuxESx5RiKHKNWPNZsbE2WdBxsGKhLDXNCWfc3EWv3gFbq0b3PrxAJ/1DAys1NTcC9mkSk8l5e50sse1q/2eQ7xw8twaZ1CNZ5glY3NArwOH6M1aWoImRSy8B+YgUD/RE6x36hxHPR5wJcytSrI1sWTxFD8x77Ph9r+rG4rmBSjhZPcSucbnBc4hCj/O20FSmtSmU+LAtz8GDRPLhOZmuvtyh7+gUK7Giahp41J0xnvZFsYcEiYovwp/Oj0rhGnjRX7AJmCW7yr7dlhVZdQqe8hOYG7cJHvIAWtXMvDFdlNYzjUb2c87yNmMAn+RBhcJQ2TIYlnFG0yNK+7mi5/MsNvAlC4IGDikf1PYdpcO/fGpRCDqvT7eUEafXWg9dwlPGOyX9Q1W45WQ2Jq0BZbppx8VbXPPZeJzGrdhEXKlP4plwaUSztSXWZhmk8mPFwY9TngGYaUjddt8dkEo6ejMIBOqasy/xRRoVL9xlLJpCiJs7hDBfHhiIJPxH40nY3PVxTq+ARQBs+71CKFfMR6g3gQbxLBE9puvXxqAyI4QE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(3023799007)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tsJvBHiBAK3ICPqOAPxsMwFmWTylcz49y0ALc+B0n3XkcxtctFWMEzfdf2/7?=
 =?us-ascii?Q?FaM5wUQohl1yaLP6J4De4HYX/3ayRxDXMI0DRfrLBC54GoerjFqINShSGv2B?=
 =?us-ascii?Q?KdHvK0RDyUsBgGnDqKt6vG4NOl9Rdhq7t1N1cNxl/7slC1NQMgSFgFJJ+FYP?=
 =?us-ascii?Q?arSjzfvIlqnAk9L2eFJBp0474Sb/++joFOMHfh7pSsvpELyc5U+Y2MiUdZn7?=
 =?us-ascii?Q?PiqaV0WkumFRIG5vkwHDSN0xamQnBTqa905JDmLIDV5ZLw1iRN/hrIylL3Jm?=
 =?us-ascii?Q?xB7eRPOxBEH8pMdpsE8RFFl9XAvC8cMVzDUOZndhg2Sp5Xlm4s+WEa6prWqJ?=
 =?us-ascii?Q?xDUfjSTJkoyayMDJacdXnqW6iRnlkIOXAXNJlVN7AvrRTLugrkwiNqiT9WaB?=
 =?us-ascii?Q?aEs/tzTGAdakTq1ED9aJJnOCQsAb+O8uuOS5EaKv5amOrSJbPiSXpg0hbp8z?=
 =?us-ascii?Q?52G34TYCp3ZHeQvJeRkOsgi7AY9e33DIAPg7y6LwZtYG1SmnDVPiTe6Odjbq?=
 =?us-ascii?Q?XZlsA8U6YYH2r0G/lrMSRkI4ESexBNkbUl4ZINTUZscaI/h77MZXTHFXwjiu?=
 =?us-ascii?Q?40G/galNgg67lqgUKm7ZbZFSuSHS9v5shj9Kr+jHviAtWd8jHu4itReqNA/N?=
 =?us-ascii?Q?HMxnstN3F9dR0Vl6VKk071caPGgzMS7+F1zsldspyoj+P3H+atQEOOhLpm6Z?=
 =?us-ascii?Q?Ki2yg5klOXGC/keK9r8sptc77mMMX8Hri2vK5YAQ2Uh1Ow/cr2S2/P1sVQOI?=
 =?us-ascii?Q?t52oX/4d2okbhl45fyJM6VORifItWo2gmG0fdr50ImY1gWB2nqWceV6o1fWE?=
 =?us-ascii?Q?eADpvjJL/ibFd10uCcWvHw0a5xf3q85jtkstIW7oymqfqkMtKjETRSWGROaO?=
 =?us-ascii?Q?1lxE0WjjV4UXenHqv8/zsyJb1A6hyjdtYBF6wIzzETwVRqN4wZBi8pXud5lT?=
 =?us-ascii?Q?Uu2Fzda3p4yASCPM1WI6Wr/q5PDCdJmCDkneQ4LQnQbYA11I2Ea1jApneXo5?=
 =?us-ascii?Q?ErXaG/lH6zWWtRLwrG66AW+GwqCnSF9KzMwzVpg9jR7vo82Ww1ehpcqkhncE?=
 =?us-ascii?Q?SBG2KJOx/T4r8wequsp3ln+wXjKwxlooJk0Kf9GYYzcKcoQhfOYOY/5GqZhu?=
 =?us-ascii?Q?OMWb+xqBSuypeGKyMGUYHn8mAuATZ0EyHS9gf51IDSsqqgH0hPSf5UOkHru7?=
 =?us-ascii?Q?qKjL+b1mpTMPLnQWAAIKEONfC0+SK8+V5VS9oid4RQUyOcq7a7Z9yp2aYtBP?=
 =?us-ascii?Q?bGKPh3+xGs6mHaSThjPiEfDNgvdE0IVPmsAjV2Eq07Vj/2zm1ClbYX8XNhCw?=
 =?us-ascii?Q?0UeKDyqS+gdP1eoYZxW8CXkmqdIYHJl4LJTPXGinZ76HelLa/6Z+xqBVKou0?=
 =?us-ascii?Q?SpF9DNkpr7VpgjO8BxWlIWXCx8KFfZgwXS8AlOGPFbNiFQ0YxHRICmPGo5mz?=
 =?us-ascii?Q?g1HUFlDXqUqOUpn77xn5vTaxqW6cal0eg2SM+jLW76cwdUtqi9+rGSYFGQ+y?=
 =?us-ascii?Q?tWR3ZJIcCkcSxeZytD54BpR1fe/pevlwUDU7/FKbB4jVTvFz1beLLltbg+b8?=
 =?us-ascii?Q?L9TOQasQTDE3BXwU81QR98BsFXCvQY56rxMh961xI8Eu/BHt8iWTtcw7pef6?=
 =?us-ascii?Q?oycTv/8g0PESToDTvRi5qXgQD5KZlnjAiS1e+FGThl4Rm9yJEpqfgSc+RP+G?=
 =?us-ascii?Q?oNqAaxT2LYQNPjdpvm1VYD/8QQPZXv7EPdCGebQ4kbC/g+Xw/iCQrMAMu3TH?=
 =?us-ascii?Q?XPeo5mBXhg=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 883cdd68-e1ab-4f0f-8260-08dee3d2b5b8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 07:12:06.6446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H5F4VdULB19WUekUony4ySBbaczQQu2xw2zd4vLHujEM3lQLgjiGJlgkBtGv6VYZB+oQjeBH8mbs4+D9QZBj6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7985
X-purgate-ID: tlsNG-d25034/1784272328-5290EA5B-50CEFA32/0/0
X-purgate-type: clean
X-purgate-size: 24105

Add software requirements for Xen's Arm GICv4 and GICv4.1 direct-delivery
support.

The host GICv4 requirements cover backend state such as vPE lifetime,
residency, doorbells, direct vLPI mappings and GICv4 ITS command handling.

The vGIC direct-delivery requirements cover guest-visible direct SGI
capability, request control and direct-vSGI state handling.

These requirements do not expose GICv4 as a guest interrupt-controller
architecture and do not replace the existing GICv3, ITS, vITS or common
interrupt-management requirements.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 .../arm64/index.rst                           |   1 +
 .../arm64/vgic_direct_delivery.rst            | 166 ++++++
 .../physical_resources/arm64/gicv4.rst        | 515 ++++++++++++++++++
 .../physical_resources/arm64/index.rst        |   1 +
 4 files changed, 683 insertions(+)
 create mode 100644 software_safety_reqs/domain_creation_and_runtime/domain_partially_emulated_resources/arm64/vgic_direct_delivery.rst
 create mode 100644 software_safety_reqs/domain_creation_and_runtime/physical_resources/arm64/gicv4.rst

diff --git a/software_safety_reqs/domain_creation_and_runtime/domain_partially_emulated_resources/arm64/index.rst b/software_safety_reqs/domain_creation_and_runtime/domain_partially_emulated_resources/arm64/index.rst
index 7896770..9d83bbf 100644
--- a/software_safety_reqs/domain_creation_and_runtime/domain_partially_emulated_resources/arm64/index.rst
+++ b/software_safety_reqs/domain_creation_and_runtime/domain_partially_emulated_resources/arm64/index.rst
@@ -10,4 +10,5 @@ Arm64
    gicv3
    its
    tee
+   vgic_direct_delivery
    viommu
diff --git a/software_safety_reqs/domain_creation_and_runtime/domain_partially_emulated_resources/arm64/vgic_direct_delivery.rst b/software_safety_reqs/domain_creation_and_runtime/domain_partially_emulated_resources/arm64/vgic_direct_delivery.rst
new file mode 100644
index 0000000..dc364b1
--- /dev/null
+++ b/software_safety_reqs/domain_creation_and_runtime/domain_partially_emulated_resources/arm64/vgic_direct_delivery.rst
@@ -0,0 +1,166 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+vGIC direct-delivery requirements
+=================================
+
+The following requirements define guest-visible vGIC behavior that can be backed
+by GICv4 direct-delivery mechanisms [1].
+
+These requirements do not expose GICv4 as a guest interrupt-controller
+architecture. GICv4 remains a Xen backend used to implement selected
+guest-visible vGIC behavior when the required host capabilities are available.
+
+Direct vSGI backend selection
+-----------------------------
+
+`XenSSR~arm64_gicv4_direct_vsgi_backend_selection~1`
+
+Description:
+Xen shall enable a direct-vSGI backend for a selected domain only when the
+domain uses the virtual GICv3 model, the GICv4 vLPI backend is available, a
+GICv4.1 host ITS is available, and the selected domain has initialized
+per-domain GICv4 direct-delivery state.
+
+Rationale:
+Direct vSGI delivery requires GICv4.1 support and vPE state. Enabling the
+backend without the required host capabilities would expose a direct delivery
+mode that Xen cannot safely provide.
+
+Covers:
+ - `XenPRQ~intc~1`
+ - `XenPRQ~virtual_interrupt_controller~1`
+
+Needs:
+ - XenVerTestCase
+
+Guest direct SGI capability exposure
+------------------------------------
+
+`XenSSR~arm64_gicv4_direct_vsgi_cap_exposure~1`
+
+Description:
+Xen shall derive the guest-visible ``GICD_TYPER2.nASSGIcap`` capability from
+direct-vSGI backend availability for the selected domain.
+
+Rationale:
+``GICD_TYPER2.nASSGIcap`` is a guest-visible virtual Distributor capability. A
+guest uses this field to determine whether it may request the direct SGI
+active-state model through ``GICD_CTLR.nASSGIreq``. Xen derives this capability
+from the virtual GICv3 domain model and the GICv4.1 direct-vSGI backend
+available for that domain.
+
+Covers:
+ - `XenPRQ~virtual_interrupt_controller~1`
+
+Needs:
+ - XenVerTestCase
+
+Guest direct SGI active-state request control
+---------------------------------------------
+
+`XenSSR~arm64_gicv4_direct_vsgi_active_state_request_control~1`
+
+Description:
+Xen shall accept a guest direct SGI active-state request through
+``GICD_CTLR.nASSGIreq`` only when ``GICD_TYPER2.nASSGIcap`` is exposed for the
+selected domain.
+
+Rationale:
+``GICD_CTLR.nASSGIreq`` is the guest-visible control that selects the SGI
+active-state model when direct SGI capability is exposed. Xen uses this control
+to switch the domain between software-emulated SGI delivery and direct-vSGI
+delivery while preserving the guest-visible virtual GIC state.
+
+Covers:
+ - `XenPRQ~virtual_interrupt_controller~1`
+
+Needs:
+ - XenVerTestCase
+
+Direct vSGI configuration source
+--------------------------------
+
+`XenSSR~arm64_gicv4_direct_vsgi_conf_source~1`
+
+Description:
+Xen shall derive direct-vSGI hardware configuration from the authoritative
+guest-visible virtual GIC software state.
+
+Rationale:
+Direct-vSGI hardware state is a delivery backend, not the guest-visible GIC
+model. Xen needs guest register readback, software/direct mode switching and
+partial configuration updates to observe one coherent SGI model for enable,
+priority, group and pending-state semantics.
+
+Covers:
+ - `XenPRQ~virtual_interrupt_controller~1`
+
+Needs:
+ - XenVerTestCase
+
+Direct vSGI pending-state preservation
+--------------------------------------
+
+`XenSSR~arm64_gicv4_direct_vsgi_pending_state_preservation~1`
+
+Description:
+Xen shall preserve guest-visible SGI pending state when switching a vCPU
+between software-emulated SGI delivery and direct-vSGI delivery.
+
+Rationale:
+SGIs are used for inter-vCPU communication. Losing pending state can hang a
+guest, while duplicating pending state can break guest synchronization
+assumptions. When leaving direct-vSGI mode, Xen needs completed hardware
+pending-state information before reinjecting pending SGIs into the software
+vGIC model.
+
+Covers:
+ - `XenPRQ~virtual_interrupt_controller~1`
+
+Needs:
+ - XenVerTestCase
+
+Direct vSGI pending-state readback
+----------------------------------
+
+`XenSSR~arm64_gicv4_direct_vsgi_pending_state_readback~1`
+
+Description:
+Xen shall consume direct-vSGI pending-state readback only after the
+Redistributor reports that the query has completed and the queried vPEID and
+Redistributor are still the serialized target of the query.
+
+Rationale:
+Direct-vSGI pending-state readback observes Redistributor-side state indexed by
+vPEID. Consuming a busy, stale or ambiguously targeted readback can lose a
+pending vSGI, inject a spurious or duplicate vSGI, or transfer pending state
+from the wrong vPE.
+
+Covers:
+ - `XenPRQ~virtual_interrupt_controller~1`
+
+Needs:
+ - XenVerTestCase
+
+Direct vSGI send mediation
+--------------------------
+
+`XenSSR~arm64_gicv4_direct_vsgi_send_mediation~1`
+
+Description:
+Xen shall mediate guest SGI generation through the selected domain's virtual
+CPU topology before issuing any direct-vSGI hardware operation.
+
+Rationale:
+Guest SGI generation contains guest-controlled affinity, target-list, group and
+SGI INTID fields. Xen translates those fields through the domain's virtual CPU
+topology and issues direct-vSGI operations only for vPEIDs owned by the sending
+domain and selected by that topology.
+
+Covers:
+ - `XenPRQ~virtual_interrupt_controller~1`
+
+Needs:
+ - XenVerTestCase
+
+| [1] Arm Generic Interrupt Controller Architecture Specification (GIC architecture version 3 and version 4)
diff --git a/software_safety_reqs/domain_creation_and_runtime/physical_resources/arm64/gicv4.rst b/software_safety_reqs/domain_creation_and_runtime/physical_resources/arm64/gicv4.rst
new file mode 100644
index 0000000..8224a5c
--- /dev/null
+++ b/software_safety_reqs/domain_creation_and_runtime/physical_resources/arm64/gicv4.rst
@@ -0,0 +1,515 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Host GICv4 requirements
+=======================
+
+The following requirements are related to Xen's host-side support for the
+Arm Generic Interrupt Controller version 4 (GICv4) architecture [1].
+
+The GICv4 requirements describe Xen's direct-delivery backend state. In the
+current vITS command path, guest ITS commands are exposed to the hardware
+domain.
+
+
+GICv4 direct-delivery backend selection
+---------------------------------------
+
+`XenSSR~arm64_gicv4_direct_delivery_backend_selection~1`
+
+Description:
+Xen shall use a GICv4 direct-delivery backend only when the required host ITS
+and Redistributor capabilities are available for the selected domain, vPE or
+device-event mapping.
+
+Rationale:
+GICv4 direct delivery is a Xen backend choice. A vPE can become resident on
+different Redistributors during execution, and a device event is programmed
+through the host ITS associated with the physical DeviceID and EventID. Using a
+direct-delivery backend when a required host component lacks the corresponding
+capability can make interrupt delivery depend on unsupported runtime placement
+or unsupported ITS command semantics.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+GICv4 ITS virtual command capability gating
+-------------------------------------------
+
+`XenSSR~arm64_gicv4_its_virtual_command_capability_gating~1`
+
+Description:
+Xen shall issue GICv4 ITS virtual interrupt commands only through a host ITS
+that reports virtual LPI support, and shall issue GICv4.1-only commands or
+fields only through a host ITS that reports GICv4.1 support. This shall include
+use of:
+
+ - ``VMAPP``
+ - ``VMAPTI`` and ``VMAPI``
+ - ``VMOVP`` and ``VMOVI``
+ - ``VINVALL``
+ - ``VSYNC``
+ - ``VSGI``
+ - ``INVDB``
+
+Rationale:
+GICv4 virtual interrupt commands depend on host ITS virtual LPI capability.
+GICv4.1 commands and fields, including ``INVDB``, ``VSGI`` and GICv4.1
+``VMAPP`` lifetime and default-doorbell fields, are valid only on a GICv4.1
+ITS.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+GICv4 command completion
+------------------------
+
+`XenSSR~arm64_gicv4_command_completion~1`
+
+Description:
+Xen shall treat a GICv4 direct-delivery state transition as successful only
+after the required host ITS command sequence has been issued and completed
+successfully.
+
+Rationale:
+GICv4 ITS commands can create, update or remove hardware-visible virtual
+interrupt state asynchronously. If a required command cannot be issued or does
+not complete, the dependent direct-delivery state cannot be treated as
+committed.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+vPEID allocation and lifetime
+-----------------------------
+
+`XenSSR~arm64_gicv4_vpeid_allocation_and_lifetime~1`
+
+Description:
+Xen shall allocate a unique vPEID for each GICv4 vPE and shall release that
+vPEID only after the hardware-visible vPE mapping that uses it has been
+removed.
+
+Rationale:
+A vPEID indexes hardware-visible virtual interrupt state. Reusing a vPEID
+before old ITS and Redistributor references have been removed can deliver a
+virtual interrupt to stale or wrong vPE state.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+vPE table entry readiness
+-------------------------
+
+`XenSSR~arm64_gicv4_vpe_table_entry_readiness~1`
+
+Description:
+Xen shall allocate and initialize host GICv4 vPE table backing storage for a
+vPEID before programming a host ITS mapping that can reference that vPEID.
+
+Rationale:
+The host ITS can use the vPEID to locate vPE table state. If the backing table
+entry or its second-level storage is missing or uninitialized, direct delivery
+can consume invalid vPE state.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+GICv4.1 shared vPE table common-affinity sharing
+------------------------------------------------
+
+`XenSSR~arm64_gicv4_1_shared_vpe_table_common_affinity_sharing~1`
+
+Description:
+Xen shall share a GICv4.1 vPE table between host ITS or Redistributor
+components only when their computed common LPI affinity matches.
+
+Rationale:
+A shared vPE table can be consumed by multiple Redistributors or ITS
+instances. Sharing outside the compatible common-LPI-affinity scope can make
+different GIC components consume different vPE configuration state for the same
+vPEID.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+GICv4.1 VMAPP lifetime
+----------------------
+
+`XenSSR~arm64_gicv4_1_vmapp_lifetime~1`
+
+Description:
+Xen shall encode GICv4.1 ``VMAPP`` lifetime state according to the
+architectural lifetime of each vPEID mapping.
+
+Rationale:
+In GICv4.1, ``VMAPP`` lifetime fields identify first-map and last-unmap
+operations for virtual pending and configuration table state. Incorrect
+lifetime programming can leave the interrupt routing infrastructure accessing
+stale vPE table, virtual pending table or virtual configuration table state
+after Xen has removed the software owner.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+vPE publication after initialization
+------------------------------------
+
+`XenSSR~arm64_gicv4_vpe_publication_after_initialization~1`
+
+Description:
+Xen shall make a GICv4 vPE available to direct-vLPI, doorbell and direct-vSGI
+paths only after the vPEID, virtual pending table, vPE table entry, host
+VMAPP mappings and doorbell state required for that vPE have been
+initialized successfully.
+
+Rationale:
+A published vPE can be used by direct-vLPI, doorbell and direct-vSGI paths.
+Making the vPE available before required backing state is ready can allow later
+direct-delivery operations to consume partial or invalid vPE state.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Single vPE residency
+--------------------
+
+`XenSSR~arm64_gicv4_single_vpe_residency~1`
+
+Description:
+Xen shall keep each GICv4 vPE resident on at most one Redistributor at any
+time.
+
+Rationale:
+A vPE represents one hardware-visible virtual CPU interrupt context. Making the
+same vPE resident on more than one Redistributor can cause duplicate delivery,
+cross-CPU delivery or ambiguous ownership of pending virtual interrupt state.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+vPE residency synchronization
+-----------------------------
+
+`XenSSR~arm64_gicv4_vpe_residency_synchronization~1`
+
+Description:
+Xen shall rely on a vPE residency transition only after the architectural
+completion state for that transition has been observed.
+
+Rationale:
+The Redistributor can update or consume virtual pending state asynchronously
+during vPE residency transitions. Reusing a Redistributor, reusing vPE pending
+state, or freeing old vPE resources before synchronization can lose pending
+virtual interrupts, duplicate virtual interrupts, corrupt the wrong pending
+table, or make doorbell decisions from stale state.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+vPE movement serialization
+--------------------------
+
+`XenSSR~arm64_gicv4_vpe_movement_serialization~1`
+
+Description:
+Xen shall serialize vPE movement with GICv4 operations that depend on the
+vPE's current Redistributor target.
+
+Rationale:
+vPE movement changes the Redistributor that owns the vPE. Register-based
+invalidation, doorbell handling, virtual LPI operations and direct-vSGI
+pending-state readback can target Redistributor-resident state. Issuing such
+operations against a stale Redistributor can leave cached state unchanged or
+operate on the wrong state.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Doorbell LPI ownership
+----------------------
+
+`XenSSR~arm64_gicv4_doorbell_lpi_ownership~1`
+
+Description:
+Xen shall reserve physical LPIs used as GICv4 doorbells for Xen use and shall
+associate each doorbell with the owning domain and vCPU.
+
+Rationale:
+Doorbells are hypervisor wakeup signals for non-resident vPEs. Guest ownership
+or reuse of a doorbell LPI can suppress, spoof or misroute hypervisor wakeups.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Doorbell invalidation and readiness
+-----------------------------------
+
+`XenSSR~arm64_gicv4_doorbell_invalidation_and_readiness~1`
+
+Description:
+Xen shall update and invalidate GICv4 doorbell state through the
+architecture-supported backend path before relying on the updated doorbell
+state.
+
+Rationale:
+Doorbell state can be cached by the GIC. Xen uses GICv4.1 ``INVDB``,
+Redistributor register invalidation, or a proxy-device invalidation path
+depending on the selected backend.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Doorbell LPI observation
+------------------------
+
+`XenSSR~arm64_gicv4_doorbell_lpi_observation~1`
+
+Description:
+Xen shall mark the vPE as having pending virtual interrupt work and kick
+the owning vCPU when Xen receives a GICv4 doorbell LPI for a non-resident vPE.
+
+Rationale:
+A doorbell is a hypervisor wakeup signal for a non-resident vPE. Marking the
+vPE pending state and kicking the vCPU makes the wakeup visible to Xen's
+scheduler.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+GICv4.1 non-resident pending-state indication
+---------------------------------------------
+
+`XenSSR~arm64_gicv4_1_non_resident_pending_state_indication~1`
+
+Description:
+Xen shall record the architectural ``PendingLast`` indication reported by
+``GICR_VPENDBASER`` before relying on the vPE non-resident state when making
+a GICv4.1 vPE non-resident
+
+Rationale:
+``PendingLast`` reports whether pending enabled virtual interrupts remain after
+the non-resident transition. Xen uses this state as part of its scheduling and
+wakeup handling for the vPE.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Direct vLPI mapping ownership
+-----------------------------
+
+`XenSSR~arm64_gicv4_direct_vlpi_mapping_ownership~1`
+
+Description:
+Xen shall install a hardware-forwarded vLPI mapping only when the target
+virtual INTID is valid for the selected domain and the mapping has one
+domain/device/event/vPE/vINTID owner.
+
+Rationale:
+GICv4 virtual LPI mappings are keyed by device events and vPE state. Reusing a
+DeviceID/EventID mapping, aliasing vPEID/vINTID ownership, or using an
+out-of-range virtual INTID can cause wrong-owner delivery, duplicate delivery,
+missed invalidation or constrained unpredictable GIC behaviour.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Direct vLPI setup recovery
+--------------------------
+
+`XenSSR~arm64_gicv4_direct_vlpi_setup_recovery~1`
+
+Description:
+Xen shall restore the previous safe host LPI mapping or otherwise keep the
+event unavailable when a direct vLPI setup operation fails after the previous
+mapping has been removed.
+
+Rationale:
+Direct vLPI setup can discard the previous mapping before ``VMAPTI`` succeeds.
+If ``VMAPTI`` fails and the event is left without a safe mapping, subsequent
+device events can be lost or delivered through stale state.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Direct vLPI unmap ordering
+--------------------------
+
+`XenSSR~arm64_gicv4_direct_vlpi_unmap_ordering~1`
+
+Description:
+Xen shall remove a direct vLPI mapping, restore the host physical LPI mapping,
+invalidate the affected event state and then release the software vLPI mapping
+state.
+
+Rationale:
+A mapped event can remain visible to the host ITS and Redistributor until the
+hardware mapping and cached state have been updated. Releasing software mapping
+state before restoring and invalidating the host mapping can leave hardware
+delivery targeting stale domain state.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Direct vLPI movement
+--------------------
+
+`XenSSR~arm64_gicv4_direct_vlpi_movement~1`
+
+Description:
+Xen shall move a direct vLPI mapping to another vPE using the GICv4 virtual
+movement operation and shall synchronize the old vPE before relying on a later
+movement of the same event.
+
+Rationale:
+GICv4 movement updates the vPEID associated with the event and can move
+pending state. The architecture requires synchronization between repeated moves
+of the same virtual interrupt to prevent pending-state loss or delivery to the
+old vPE.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Direct vLPI property update
+---------------------------
+
+`XenSSR~arm64_gicv4_direct_vlpi_property_update~1`
+
+Description:
+Xen shall update the virtual LPI property table and perform the required
+direct-delivery invalidation before relying on updated virtual LPI enable or
+priority state.
+
+Rationale:
+The GIC can cache virtual LPI property state. Updating the virtual property
+table without completing the corresponding invalidation can make direct
+delivery use stale enable or priority state.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+Direct vLPI doorbell update
+---------------------------
+
+`XenSSR~arm64_gicv4_direct_vlpi_doorbell_update~1`
+
+Description:
+Xen shall update the doorbell setting for an existing direct vLPI mapping using
+a GICv4 movement operation that preserves the existing event mapping.
+
+Rationale:
+Re-issuing a mapping command for an already mapped DeviceID and EventID has
+unpredictable architectural behaviour. Xen changes the doorbell association for
+an existing mapping through a virtual movement operation targeting the same
+vPE.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+vLPI invalidation
+-----------------
+
+`XenSSR~arm64_gicv4_vlpi_invalidation~1`
+
+Description:
+Xen shall perform GICv4 virtual interrupt invalidation through the
+architecture-supported path for the affected event or vPE and shall wait for
+completion before relying on the invalidated state.
+
+Rationale:
+GICv4 virtual interrupt state can be cached in Redistributors or ITS-visible
+state. Xen uses ITS virtual invalidation, GICv4.1 register invalidation or
+proxy invalidation according to backend capability. Relying on updated virtual
+interrupt state before invalidation completion can preserve stale delivery
+state.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+vPE teardown ordering
+---------------------
+
+`XenSSR~arm64_gicv4_vpe_teardown_ordering~1`
+
+Description:
+Xen shall unmap a vPE from every host ITS that can reference the vPE before
+freeing the vPEID or virtual pending table used by that vPE.
+
+Rationale:
+A host ITS can retain hardware-visible references to vPEID and virtual pending
+table state until the corresponding ``VMAPP`` unmap operation has completed.
+Freeing the vPEID or virtual pending table before the vPE has been unmapped
+can create stale hardware-visible references.
+
+Covers:
+ - `XenPRQ~intc~1`
+
+Needs:
+ - XenVerTestCase
+
+| [1] Arm Generic Interrupt Controller Architecture Specification (GIC architecture version 3 and version 4)
diff --git a/software_safety_reqs/domain_creation_and_runtime/physical_resources/arm64/index.rst b/software_safety_reqs/domain_creation_and_runtime/physical_resources/arm64/index.rst
index cd1aaca..da8cd1e 100644
--- a/software_safety_reqs/domain_creation_and_runtime/physical_resources/arm64/index.rst
+++ b/software_safety_reqs/domain_creation_and_runtime/physical_resources/arm64/index.rst
@@ -7,6 +7,7 @@ Arm64
    :maxdepth: 1
 
    gicv3
+   gicv4
    its
    p2m
    pci_host_rcar
-- 
2.43.0


