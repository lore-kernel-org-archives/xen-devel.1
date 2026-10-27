Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A083606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 21:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=vZil580i
Received: from list by lists.xenproject.org with outflank-mailman.1462586.1673638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLoNQ-0007ZK-31; Tue, 27 Oct 2026 21:06:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462586.1673638; Tue, 27 Oct 2026 21:06:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLoNP-0007Xg-N8; Tue, 27 Oct 2026 21:06:35 +0000
Received: by outflank-mailman (input) for mailman id 1462586;
 Tue, 27 Oct 2026 21:06:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xLoNO-0007Il-22
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 21:06:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLoNN-007u3c-Eb
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 22:06:33 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ae11240-2eae-0a2a0a5409dd-0a2a450c8962-22
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 22:06:33 +0100
Received: from [52.101.84.83]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ae11258-f479-0a2a450c0019-346554535b99-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 22:06:33 +0100
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by PAVPR03MB9573.eurprd03.prod.outlook.com
 (2603:10a6:102:302::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Tue, 27 Oct
 2026 21:06:31 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 21:06:31 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hPjBn/+9Z/kl9xvQ/r5TWiXVGNNyK6rhFaPy0qJp/z011l2d8ESINacm6yEopIWVWVK+lDrsqSk5D2avCwGTO3C68pTBL5RSK9cpoR8NAAiIHDCRtRty4uundxPY839PSf9fjLr8EHTnZJqk5f2mL1MRTUwn+CWg4WVkfX1NmGlROCjbM1/lRIMRhHIL7f6rIh2UU8b4S9C+JXN2q4zNVsVPp2mTYvH29zbcfJa0piTZG7Fh2M2BRgsBZzv5g1JsZsF2oaDGu0hOZYlb8rxIDnz8q7CWE9u3VLi+xTAv57ZULjLUNVKrghdUGsG2NgNWCODBaDBIgHyaBx/4rxTXFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lf9TmsDfGuKFKY1Sh8y3OhWOESQWbPLVvxQwVSvceEs=;
 b=A3XI3HW/xCnrxoiDhg7oqxVu71hSTZkwNN23Dvi3XBJQMqHqDli5fmGotNnISFnKQvd6ZXbJ5eB0FZjMukCLwiYp2hfuOn73MI8tN/qoeEXIsd9N+8goHO5AlfNGci1t79ZJGFcUbQ7/Icv1LMQVAvl3JVLEhzp64OmNGhat+yd6IOFNs/4Gj+IFmTbUCeP50poMiQqmZrmRCqS08gktu/0ddlo2mTgmIHYFvGbtQhf5GebSTSqND0Y2BVGBlvfpIceDYvG72zkgER3bbj8ujm+yYor/7OQD4zl8Q1I1TIFjjnoYDYtrgVnpjn21iF1UT5VJHS4vlBwJe10SSPXItg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lf9TmsDfGuKFKY1Sh8y3OhWOESQWbPLVvxQwVSvceEs=;
 b=vZil580iQio2tRRmGBxd+lnuNh1qtVy6O9ZnE5WiT040tef10+KtltqwWr6pHPS1AebtDCtEiibofPM3tDfhkWEcLqTn1aiBUS9+6uL3YUVC4jI2AaBang1Yu1bhqSoKqI0mAqrrprSyBXa4rJYXYUd/OeXeh1nBdMuhv59V1cRmxsLVfB63zgucWgtPbGHGC1AlPSipHubm5t/G03HQ1TIIBVTBcfg17sr4A9UuC52bfB72gEH5P99VCPZafBxh+LB8s6HsnHZdbuRlEgzezq0qqrRE6mK56mYD0DQD1KaWH34P5XTn6mx00qpY+aPqCER6WsV0EBApdlYWUEiPVQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v13 12/14] xen/arm: Implement PSCI SYSTEM_SUSPEND call (host interface)
Date: Tue, 27 Oct 2026 23:06:01 +0200
Message-ID: <85786d24cb2f835de97ca8c3cd9e8181a26b4bef.1793129971.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793129971.git.mykola_kvach@epam.com>
References: <cover.1793129971.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0223.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::6) To DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0302MB9208:EE_|PAVPR03MB9573:EE_
X-MS-Office365-Filtering-Correlation-Id: a202282e-b4e7-4242-6d7e-08df346e2cf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|11063799006|5023799004|56012099006|261009223027099003|261021123027099003|261021121427099003|261022105027099003|22082099003|18002099003|6133799003|10067099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	JEV+YLpW6cfke6s3BiLmURTHXWPegamKnA9g5YwMMIMAEbIYvqEHS9LP8Tc2CfWGmtFNtv34EIXZZ4NMz9UwJ2kR52cI47ce1vHjx71yw8/1kfvYhmOmg+mj2XRPpfjZTEW9hpp7mmwRG759mnWSVLfmNKd+LwAA1mDX2cYjHLRFybwq8Fv6XtM/TNq8793D7SHNokg7AEPs/8wcEGXPjrWcWvdR3Y1H2dhyf0fWwcBgL2Vd9c5V4VwDheRfu9T2vf6uA6+IKVGcO0eRH7EvwPzbkGuwHp04u7GzGYrm4Qpl9YzYRCF0xX0q4KnZtWpjnKhAbaQMb3jQwKYNm8umsZd5grlyiu7YBhbvoKnVduBQHFn5tZzyr8D94Py11dN+pww1dJstFg/3L+sPzzyyJWRAxSRpLrr/1S3mjL7J87vQF13j9bx/HELKzpMlq1tM48gZMA7eZrpMKdXPqeTLMB5HBPck4fIGYALFNozVjgh0k5S8Lvr8zn7AWJ9UzLNP3wai78Hwu8v9F4H/tF2zJKnpWxnAXZ7L3K6NT97Xmtfg+1BROGxkISNAut8uOQYQ4cFoZ0N1ZOBDa+ZQ/HLzAjL8VhiHJFvh/H897Xll3mF6ba52PccKIzXGVKmQO19f6ZlhmKLN0W4SEHyIvY1JhOHTF14arJ2eq1Ilnglf+fo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(5023799004)(56012099006)(261009223027099003)(261021123027099003)(261021121427099003)(261022105027099003)(22082099003)(18002099003)(6133799003)(10067099003)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GNQUp4hUY5wWlURfze1KLaA4QBzuGb56mb5WzrLPbqje0nZjyF15Zzv9AVem?=
 =?us-ascii?Q?qTyOLAp8SL3pSSGi+YbbQqz0fQNqAtk5sTIYE9VVV0QdJBNZtMzo87Y+2mID?=
 =?us-ascii?Q?yYVdwXEkVl4SK+4O51XROxaRHfU3BEdVCkPn8kc2JhIqM5Af6c8M4al/Pml/?=
 =?us-ascii?Q?slPatzvQP3jxc4AIEEQB8FGRypuMoyPuz3PbX3nF6edcXuPuYTO89sEir9/C?=
 =?us-ascii?Q?AfPanhPKLoojwngyraO6jYKwv2hTNPguL4oKzmlpL+zjPjwiDPyLZVXPWXR8?=
 =?us-ascii?Q?Km53Y5sB3E0i7WhVvawR13PyEaHB9H9lLDfQFmr4QYBR7jqVy/UQ1QbGPM72?=
 =?us-ascii?Q?tIYCpn5Rfh/j+gM/YAWu6H2Df/T5GMYd1phQcOCqMhQDNFeyLcxWgz1LapR1?=
 =?us-ascii?Q?sMX6C9QCkGM3c1aXCzZVi1Dvvj9AmjSMd9VUenkBxySTLBhOCJULXiQ06CQF?=
 =?us-ascii?Q?269u/rDg0F58Zv97rpm81dVL20WfAW32h9jyFzJl1AEQGJTBs10nJoeDqY8k?=
 =?us-ascii?Q?lfcLRh90qYq3yivz+p8vFt2nq2PmhQDEzWNzL6wPIW7k6FlYvFKcVkfqmA9D?=
 =?us-ascii?Q?ar/pGjo+NhcwbVbH6W33k1lJ/+OuAXIItj0L1mGwiRppD1EUFfDcfW1glknl?=
 =?us-ascii?Q?3kAyMWa1Qtl2V8tfWY/M5bkomXgToYhO4L6rGlm5BloT68DrW3I/0Tr0Cc4o?=
 =?us-ascii?Q?BCXhs8Ysc/W1ras6fRAY5age8o52Y1fLKeY8VHiAXWcdfU81YBqZZuu/2uEH?=
 =?us-ascii?Q?iSCzLWPfW3YueqrubUYmBEvy2uJTfEZKmy4Lb0ib3CF7mMED7Mgmmb9U504d?=
 =?us-ascii?Q?03PFLriTIwSdw1b9PPAiaYfX2VqlLEmRJyY/kxMSzHEM9yCwqnpkPMKQxjBO?=
 =?us-ascii?Q?V0//60+wF9xF/0nkgE6pMXwCTEsXYI+5ziRlXuPF4vZp+2vAxFduT2X7MIL8?=
 =?us-ascii?Q?+hRCo3pmrcW0ZVUKZSImMRnCPZrLIqVq2BPysZJSNNt+dvQpzrnSAF3G9SUM?=
 =?us-ascii?Q?4z+XsalZKWsj0dW+yI6lkVVBuA8bnDGCvViJLwJ1HZdTuI8UQQCfLbMSgc7T?=
 =?us-ascii?Q?tJHqkntty8suMUpyGiqXzsa4bTcpaLuh22B9oMNFYFAtVhdIyfqICbKQBYO6?=
 =?us-ascii?Q?I9jmxdDEnGGt/1RSdC0yoGrABgdlDtXTyyySYuXmbl0A4cCMfrwjCGx4c90t?=
 =?us-ascii?Q?Qq8hjkAZLgkruPAwHp4kRw4Qe9rBR4dxRkMWxg0FV42a9X2v1DQDuR4sr7/Q?=
 =?us-ascii?Q?1mBoz+pAfQH1z2kEfSgO8ingGpYuxiABqSmrbeGJHhqA1whbsuTNiIHMeVVe?=
 =?us-ascii?Q?1Hmese5VW59WXCoabg76fxOzJ9kAwTa2A6d895H0KmmR4wYKw9wBwdSthgTU?=
 =?us-ascii?Q?SXTjZkNdVLFf2mjj/+MciSc/OrGqNxNSUljrPvWDRNVAnGS3gNUV8RpH7ipL?=
 =?us-ascii?Q?R6QrcA3U1K3OXrLQIscOmqLgoxfliYhYsdQ64ebg9+Ulve1GzcMPYBBdKixJ?=
 =?us-ascii?Q?OGCmtwxJ+a5cELdwwcC3dQ7DFFcj+vELtql1ILIZZRXyI/ZsO3f4tsV7K79W?=
 =?us-ascii?Q?kpoiYP7yoG7jcoSDhKOd0dX37YrfrPBy3tTmE5I/wRhpLlXVfPHB+8Ib6Lkg?=
 =?us-ascii?Q?r97JOn1Ld99BlHYtfZf/Tt6NbrDvDaa3ucAAeBj/6VD8uuW4eY/0iefNVlwY?=
 =?us-ascii?Q?/SDZYWVT6zrQXSTMTL7zVvUY8LtjsZNWsO9WRsQnkYjNz8BXOIcTKmQ1yCUA?=
 =?us-ascii?Q?IOiBdodyoA=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a202282e-b4e7-4242-6d7e-08df346e2cf7
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 21:06:31.6289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MBxWnP3S97V4PVlBLFuxmSJdV9CoGe44IXZqJtCP+o4FOaRnpU+PrIlDi/gM9Ul9eGpmBw6pkrG1Oz0onkDMlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9573
X-purgate-ID: tlsNG-d25034/1793135193-01AC4A5B-FC5F4259/0/0
X-purgate-type: clean
X-purgate-size: 4185
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Mirela Simonovic <mirela.simonovic@aggios.com>

Invoke PSCI SYSTEM_SUSPEND to finalize Xen's suspend sequence on ARM64
platforms. Pass the Xen resume entry point (hyp_resume) to EL3 together
with a zero context ID, matching Linux.

This patch wires up only the host-side PSCI SYSTEM_SUSPEND invocation.
The resume trampoline and context restore are provided by earlier patches
in the series.

Only enable this path when CONFIG_SYSTEM_SUSPEND is set and PSCI
advertises SYSTEM_SUSPEND via PSCI_FEATURES.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in v13:
- Use the result returned by arm_smccc_smc() and drop the result pointer.

Changes in v9:
- cache SYSTEM_SUSPEND support using PSCI_FEATURES and gate the host call
  on the cached capability
- keep the cached SYSTEM_SUSPEND capability read-only after init
- log whether firmware reports SYSTEM_SUSPEND support
- pass an explicit zero context ID in the SYSTEM_SUSPEND call
- drop the stale note claiming hyp_resume is still a stub
---
 xen/arch/arm/include/asm/psci.h |  1 +
 xen/arch/arm/psci.c             | 32 +++++++++++++++++++++++++++++++-
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/psci.h
index 48a93e6b79..bb3c73496e 100644
--- a/xen/arch/arm/include/asm/psci.h
+++ b/xen/arch/arm/include/asm/psci.h
@@ -23,6 +23,7 @@ int call_psci_cpu_on(int cpu);
 void call_psci_cpu_off(void);
 void call_psci_system_off(void);
 void call_psci_system_reset(void);
+int call_psci_system_suspend(void);
 
 /* Range of allocated PSCI function numbers */
 #define	PSCI_FNUM_MIN_VALUE                 _AC(0,U)
diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
index 967cb4b77d..4d502216ce 100644
--- a/xen/arch/arm/psci.c
+++ b/xen/arch/arm/psci.c
@@ -17,23 +17,27 @@
 #include <asm/cpufeature.h>
 #include <asm/psci.h>
 #include <asm/acpi.h>
+#include <asm/suspend.h>
 
 /*
  * While a 64-bit OS can make calls with SMC32 calling conventions, for
  * some calls it is necessary to use SMC64 to pass or return 64-bit values.
- * For such calls PSCI_0_2_FN_NATIVE(x) will choose the appropriate
+ * For such calls PSCI_*_FN_NATIVE(x) will choose the appropriate
  * (native-width) function ID.
  */
 #ifdef CONFIG_ARM_64
 #define PSCI_0_2_FN_NATIVE(name)    PSCI_0_2_FN64_##name
+#define PSCI_1_0_FN_NATIVE(name)    PSCI_1_0_FN64_##name
 #else
 #define PSCI_0_2_FN_NATIVE(name)    PSCI_0_2_FN32_##name
+#define PSCI_1_0_FN_NATIVE(name)    PSCI_1_0_FN32_##name
 #endif
 
 uint32_t psci_ver;
 uint32_t smccc_ver;
 
 static uint32_t psci_cpu_on_nr;
+static bool __ro_after_init has_psci_system_suspend;
 
 #define PSCI_RET(res)   ((int32_t)(res).a0)
 
@@ -60,6 +64,26 @@ void call_psci_cpu_off(void)
     }
 }
 
+int call_psci_system_suspend(void)
+{
+#ifdef CONFIG_SYSTEM_SUSPEND
+    struct arm_smccc_res res;
+
+    if ( !has_psci_system_suspend )
+        return PSCI_NOT_SUPPORTED;
+
+    /* Context ID is unused for the Xen resume path. */
+    res = arm_smccc_smc(PSCI_1_0_FN_NATIVE(SYSTEM_SUSPEND),
+                        __pa(hyp_resume), 0);
+
+    return PSCI_RET(res);
+#else
+    dprintk(XENLOG_WARNING,
+            "SYSTEM_SUSPEND not supported (CONFIG_SYSTEM_SUSPEND disabled)\n");
+    return PSCI_NOT_SUPPORTED;
+#endif
+}
+
 void call_psci_system_off(void)
 {
     if ( psci_ver > PSCI_VERSION(0, 1) )
@@ -223,9 +247,15 @@ int __init psci_init(void)
 
     psci_init_smccc();
 
+    has_psci_system_suspend =
+        psci_features(PSCI_1_0_FN_NATIVE(SYSTEM_SUSPEND)) == 0;
+
     printk(XENLOG_INFO "Using PSCI v%u.%u\n",
            PSCI_VERSION_MAJOR(psci_ver), PSCI_VERSION_MINOR(psci_ver));
 
+    printk(XENLOG_DEBUG "PSCI SYSTEM_SUSPEND is %ssupported by firmware\n",
+           has_psci_system_suspend ? "" : "not ");
+
     return 0;
 }
 
-- 
2.53.0


