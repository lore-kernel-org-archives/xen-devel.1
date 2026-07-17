Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FDBC4450F
	for <xen-devel@archiver.kernel.org>; Fri, 17 Jul 2026 07:12:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364689.1615716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkcju-0005rG-Es; Fri, 17 Jul 2026 07:12:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364689.1615716; Fri, 17 Jul 2026 07:12:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkcju-0005qH-8X; Fri, 17 Jul 2026 07:12:06 +0000
Received: by outflank-mailman (input) for mailman id 1364689;
 Fri, 17 Jul 2026 07:12:05 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wkcjt-0005n8-8m
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 07:12:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkcjs-0083h9-LZ
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 09:12:04 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a59d5b9-2eae-0a2a0a5409dd-0a2a450ccd0e-42
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 09:12:04 +0200
Received: from [52.101.70.123]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a59d5c4-f479-0a2a450c0019-3465467ba3d5-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 09:12:04 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AS8PR03MB7985.eurprd03.prod.outlook.com (2603:10a6:20b:428::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 07:12:03 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 07:12:03 +0000
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
 b=GeX8eAquuO6af4SypcfKt5melDVadpaEcg2+6aEx0r0JMUfAtGiJn1NBGbzV3wMvCF6y2K9F0zbHRdUqAtq6IclPEaNtfmyy0p4DddgU5hSdXDQ/kjdETuL6WvP/MoGvFr9rtbOwSYmLFcOx29EzutZrn4RVr1cFNc0t6PCwws015BGjRajm9EcDn0YfkhY9uwsCmbDTxyzJAVYSxY2fHzuW8LjB8ZkhL4DQER8T2AZ4Hy47xnzVYwX8lHthrNT25PXOcquo0MS0bzI2ZwG788PPxnlwH8MtjAW9VcoxCEXtudyWcSu6R9BwnQ/FXP8f3teLhoaK3uraB9I+5divng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kIVFKNcVZQjluf7v8uIph/veqYCABO1SJTrjKkjRvQI=;
 b=BB7M9daJwYG0iuordhKGQch1PG37Ol3UOTVCnQlfLCZXMfWysO5IqATsAS9ly4Up8GpVUfz9R4vvpgI+5kDPv5Kb4qreV9/2tzv40NukR+6NTUStpqwkr+lYc5WBsN9VOWXG6qdPvFjaxxaTrhq9ZbdqmnQRYdKPy5x/gSupuVt9acizG3GJ8ZvZg1dBWA4HEWLvJvfc+IoA/PJape+ln2KNAjWiuu91fxpUZ+hGA6ScPYIKOvYX1dEnTDNhVegGJemknUyDB6k+CMr/bpodGHmnbYWf5dM+Arz+KYFXLXvNUQT5/ZkHpPquzmAyglI4YVhBCYOOcDFcHE46u6TbSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kIVFKNcVZQjluf7v8uIph/veqYCABO1SJTrjKkjRvQI=;
 b=eDbsxh5jWuORdSpdTY9rR8bGkcbsJYR9wSzzMMlNUNfO/xiMDVxUAQgIkUceUAktrvbsDx408pWb2nWnhzm5xb8rd1YNKPe3FF463848MoUzJVlL8+jJwYR5mG4d5JU1wkKmph8nwv8K+yO9wEEItppQvSfxAmrI6NpM2vN6wPBVEtMMQeUD8RPc7zp+36EAHJJ5hSHThxJZh+t+jJDAhuniRJH+dSask1BbQrdE1l/xj6s5MZEkP62I4SVB+Ycw7G/02dZdUCbw+7VTTXJjGVOK2/3Mb7WXtWbE4YnCa54QFy7H+K0P+/5xqLkA8epXqqw+mWumuEnrI+n97xxkKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Subject: [REQUIREMENTS][PATCH v2 3/6] reqs: drop duplicate GIC version AoU
Date: Fri, 17 Jul 2026 10:11:24 +0300
Message-ID: <338323dfeeba74f130f1c5ee336327ff07dd5cba.1784272211.git.mykola_kvach@epam.com>
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
X-MS-Office365-Filtering-Correlation-Id: cead1757-b6e5-4a05-dbfe-08dee3d2b39b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	ljLrVl+Y3cZISnv8vlKu0sNjht/CRA9vMJDDTfS9B+crYpCtbT2WHmsztUD7H/vplt7WcDFuDC6a6hub2+uNuE0KPQ7BsIUXDe2V73qyvD0DVXJrzvBBpTW944mruexFI2OZap6QOP4jWcqWr/5QB7AyvKebnzIZ+hnn9Fr4Cxpn1e566TThjL0AI5zkCpH14ps7d0ojQ7N76ygoLtR/uIdXsfBHubpbP0sra6WnVpe67LR8Fu1fjF/eOACNt8EZXek8sQNSy/gMcdZ2jzgbFfq9k6pdKcuowrSMXv51G6KJr9ZKmoee9fw+SmcwhlD72DS3kbVkGnkugXvjgaDGX+0SrE54qWf/bHnMZKF7qAL/yL4Fved8k0jgr9+aGUiTjWn73GsM55Vrw+iY+tLXePvZRAnZ6Bx/tE+++5jC0CYZo5VR5E+kJcAUJ+fqKskzsWwz7QuXLrrVfjpXY8N+WWeACLICYXmcxUjsTiSoTIOWDrvYk5n6zUiTJ+jJUdwDaVPzDqTAJVTa9zknBI4vRL4jWI0wTudm3CshO/8ecLd9ghYo2MRG6sc24tXsq9JoU5rJ7BpiWOkHuCOFS4Crruy73DuIKAHhJTVKqXPet3GzZM9NqlExMjhE2PxD7fFz+JVzDc2T/aGNZ7itCPpd1fnLdWClxEpEVZvTlHL8S4w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oKFXBw4RvmL93JhhVbpaK7TWotOBb6FeAtGWKah8xbyYItFTGBx3/mM6BurO?=
 =?us-ascii?Q?m5EpOVuF1IhaEA+7Nlp+52C9p1CQsPsd3jZaExLgDlGb1cRHw3qlMjKW2tL6?=
 =?us-ascii?Q?Ht1C3YVUlzfh5KsPA99vQ3Q0DfytGwObdqiACOBtOE7qYHNp/h0ll8RGDNc4?=
 =?us-ascii?Q?MlRZsFl2eUh/HY/YA0Bf0Dg/WBhuFtjfuIg3O8q8fCNTwW9bJDx9wE5sRv0j?=
 =?us-ascii?Q?jT4sH4b2DQEoJGdqaynCwYNKH+SLX8n1aKBaGdaP4r5zI5tUU6D4GbFWDW/n?=
 =?us-ascii?Q?HOB1U+wfLs0d+vapzPs/YXG28aX24cU5WFi5/2MuWZ+oEMhKrEnXs3FYtZHf?=
 =?us-ascii?Q?NjvOKZO1EO+6iwXxgvrSvTM1g2/IHDy1iAlpjZzUUYQ6XI9SMJdSqab5wbb5?=
 =?us-ascii?Q?JJFalxse39OAuqyOLLU6Tb7yrl8g/AfjK25BgdUtRMXFkH4YVJL7xuEhm6GD?=
 =?us-ascii?Q?QCIZ7AOKzVf+KNDiu3Nlx6p7k+pR+vxkDwwfgMZKEaxVe5Wp2lzj5+6hiefD?=
 =?us-ascii?Q?c2563JF9O/bXETJfcGX6sRMjvIXN/t/XWKvZWRtx9bmHIrNlw0tMIcRoDG3O?=
 =?us-ascii?Q?uZMAPqtQ42SM0QDf4jpl434RTs4I8tuvpoEER0m+5Vm3PuXDr4u2X5eJG65J?=
 =?us-ascii?Q?y89HmoaRhZroTMUVtXpQfIJM2gbJ3R/4Od0NLT5aKAJPGhWrPhR4nI0Om81u?=
 =?us-ascii?Q?6/cehhAKD5zjPkIetwLqzpeX6yNmHQ9NjgK8Anta24Nn+v6gF5Z4QlsVwbyX?=
 =?us-ascii?Q?n0N92FqLWaZIK5x+fOsJYGadHql67RQltLXYJ24t/yfOVoWNbdoxcp2F0EI5?=
 =?us-ascii?Q?Vv/zWMjEqaXCikrKgZZBLcMpuQJGXnvIALXDtK25EQK/ze4nBSwsuBSF855b?=
 =?us-ascii?Q?n6WQ3QII6b8c9w68RM68FqXEoAXeKbp4pPaQ21WSyMT1Q88NmXOoN+f8PkFD?=
 =?us-ascii?Q?e+qb0YPH0NSCBPOX1LfgYBg766OLJUM2TJe1A8ebzQ/3ukDKQ6M9qZA+mO98?=
 =?us-ascii?Q?bW+NC6+0AU8bi7NsgU+Hl3/w44yi4v/hQWN6zzKsEDqDsiI9Y5beNOMdGJLg?=
 =?us-ascii?Q?dY7/Ml5AE3E373KtxZf4ploS16iTKZ4+C2tf7MNy7S8JmpJ50HBWZulSZimk?=
 =?us-ascii?Q?7Kexm1BPj0gKFN7AwyD+hYDk40dPLEIY9B4nAeFF9S3ZmmmMrhx1o7hIAbfE?=
 =?us-ascii?Q?Tahwr/2k2JZ7Eiq49dU1668r1iKzQIr5TFCAWmnv4dahUOnk7Ik34nL/xfZW?=
 =?us-ascii?Q?xUIkxY+JpUG6a/Xn1hpYruCApaDE08o3rDdXQgcuGKbVSalS4glCOFTuz5Mf?=
 =?us-ascii?Q?OyESM0fnU8Y8WMXxGuJLNZBHmvBllxxrnTTGMaDTgOz29NpLMFbiNpqKlcGf?=
 =?us-ascii?Q?RaHiR9Cn8c+e62emiGm2w7k+gsGwbhBQZYFGtt83017zbnAiiTFgA4HjoFTm?=
 =?us-ascii?Q?qAiTir4MRXS+gGewvi3cTIVV4XGdh9CxYJIN08qIyrDDPZoh0pjkfNPQel62?=
 =?us-ascii?Q?+8fISf2hJJ1f3je6GtYpaTHqUMioaK3t1pCcup8xJzQbCt795RMIdfHjKJTk?=
 =?us-ascii?Q?5ckO0GUG2hzx/++7pXfQltiglRoUwF0bOHpT74gE69Pu4vnz5dsdv1s8bHGn?=
 =?us-ascii?Q?c2/GVWVF9GulyLSSrBptwDJbXhh2xgQVTaY0wgSHnR13koIHB3WkVULcygPR?=
 =?us-ascii?Q?1Lb9j/veLq7WAj4g5M+ATjivvGy7/iWlnLpNclSCV7MicvxwQAZ7PF/bG/Ap?=
 =?us-ascii?Q?eDLtZfRdAQ=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cead1757-b6e5-4a05-dbfe-08dee3d2b39b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 07:12:03.0269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +50zw0AcgzzdTUXo6LymYa1xBqnpqDw3uJVY5D3Jt8OeFBqNBRJnntRRWaVVwCvzi/NERU4o1R01YEyAkvWqMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7985
X-purgate-ID: tlsNG-d25034/1784272324-030D9A5B-1B3E1569/0/0
X-purgate-type: clean
X-purgate-size: 1502

reqs: drop duplicate GIC version AoU

Drop the AoU requiring GICv3 hardware.

The certification scope also includes GICv4.1, while the supported
physical GIC version is already specified by the corresponding PRQ.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v2:
- drop AoU instead of moving.
---
 .../arm64/gicv3.rst                                 | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/software_safety_reqs/domain_creation_and_runtime/domain_partially_emulated_resources/arm64/gicv3.rst b/software_safety_reqs/domain_creation_and_runtime/domain_partially_emulated_resources/arm64/gicv3.rst
index e16576f..2c146f0 100644
--- a/software_safety_reqs/domain_creation_and_runtime/domain_partially_emulated_resources/arm64/gicv3.rst
+++ b/software_safety_reqs/domain_creation_and_runtime/domain_partially_emulated_resources/arm64/gicv3.rst
@@ -7,19 +7,6 @@ The following are the requirements related to ARM Generic Interrupt
 Controller, version 3 [1] interface (hereafter, GICv3) exposed by Xen
 to Arm64 domains.
 
-Assumption of Use on the Physical Platform
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
-
-GICv3 shall be present in the hardware
---------------------------------------
-
-`XenAoU~arm64_platform_gicv3_presence~1`
-
-Description:
-The physical platform shall have the ARM Generic Interrupt Controller, version 3.
-
-Rationale:
-
 Assumption of Use on a VM
 ^^^^^^^^^^^^^^^^^^^^^^^^^
 
-- 
2.43.0


