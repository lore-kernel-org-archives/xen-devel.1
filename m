Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0081FC61DC6
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 14:32:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400687.1636323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzb9j-00078r-Jo; Thu, 27 Aug 2026 14:32:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400687.1636323; Thu, 27 Aug 2026 14:32:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzb9j-00077b-Ek; Thu, 27 Aug 2026 14:32:39 +0000
Received: by outflank-mailman (input) for mailman id 1400687;
 Thu, 27 Aug 2026 14:32:37 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wzb9h-0006rI-Mt
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 14:32:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzb9h-00BhhD-3I
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 16:32:37 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a904a7b-2eae-0a2a0a5409dd-0a2a450686cc-12
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 16:32:37 +0200
Received: from [52.101.84.77]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a904a84-195a-0a2a45060019-3465544da39b-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 16:32:36 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AS8PR03MB6742.eurprd03.prod.outlook.com (2603:10a6:20b:295::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 14:32:35 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 14:32:35 +0000
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
 b=LDSrqmTWQ7H6/vqUK5LcUowSYV6/YX98uMFYzoLNOm77Yqx6OW8cgcDYLbBlQwzohaGdLzGZFnM77hlAvfGLVS517OjWVE4P4zWX5YgwXPaBG9QutLopSuoqZ6T+tH9Qude37YnheMLVwXTdOstNZYvYrsk0KfFqWdYQuacE3Dh5cSEnlLJl6mv2CLPnYmYLJtXpw6H+EngNtTyztRQ6griXKB3NYQQ45+YbVNmF4Nw82YlCld7nzYerxKHXnqYAldtmC5m/wD4/Ql+ZWOw4o+3p+TkGI0dZrF3s0LWO+NTFyleToUTS2zc+vFq/fpKWX/OzxElT2euob1T4A3YmLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Q1Fsw7I5VcRKOn6Vwcp1VtMdJtga40n5Ed4Emmc+5c=;
 b=Bk1Ddif56qzNoxkLIIr78ZnO5eZowg6IyxiUS9zx+pE7+FTth9p/lDVUWgqB3YMlES9GQGXOst1x6Uzwu6Hvxw8P8F/mIAwtFGLDEDryLP8dtukpsM3E/Fo19+z6KsPs3XJuZ4rwMkIVmj/T/KoTBXx2zXkpWsiAh2S0YX1CTBmMC2NBk6GEZxyB1EoGTeYVny3lNaCY4SRLDISPVPTKJgEJUrdM0k1Wd/TSjILOjHX6xOIWHzXoK545XJo2s3RkSb81euKRjXNq/ShfFC551fL9/LGET1QUEzmqi0WAQDDOszrdQYYP91no4rGRffWseK57Dxl2OD5HsHKl752H0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Q1Fsw7I5VcRKOn6Vwcp1VtMdJtga40n5Ed4Emmc+5c=;
 b=bo+kUXhTJyKsO3EVj4TFDlAu8JmDxsl7l1yhvzlPT6LDVp3OnPtaRd6zovaaW8F7chKPg/2tMxvWu2Zqsbhba9bvLLTfFnYUuf+/SOo4QGX/WYRB0q9302VvzJtQ3wz6pxz0yMvXBslIR3aZjbLSkxA8jetZOKGZZGiXH1W7Te11Yzwr4kj6fZ7g6rNX0qe+OV213P2SBqJDswoNCbFMeaihj4qB4n+/eW2nw37PeWkSGy/Dy8DEPTGaZTX9XAo3bjvz4PbeycvTqaAyoItxKfU/MU7MXh7tVUSluRcrAvg+/BxlcewWNIj0ryXdFrUsyeichdD3RG+b30yySVR4iQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v12 11/13] xen/arm: Implement PSCI SYSTEM_SUSPEND call (host interface)
Date: Thu, 27 Aug 2026 17:31:59 +0300
Message-ID: <39722280b669cf6b914d7cc70fbda667c123e21d.1787838455.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787838455.git.mykola_kvach@epam.com>
References: <cover.1787838455.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::15) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|AS8PR03MB6742:EE_
X-MS-Office365-Filtering-Correlation-Id: 513fd4ac-b84a-4d85-fad2-08df04480979
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10067099003|6133799003|22082099003|18002099003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	HvkDjEfjsnSwVW1ZtkYEiIbFVcpl0PKrgykSG4Di+K9wuKRiJkSIuNkyrt4blBOUYhbXPwhyXdTdAaYiqtsWFjKRa+o4N5/7G+kxlPUzdbZitf6jkaXYVONH/4jxWGgJV9eSZrDRvu546WgzAI3Wxli1wK5E4mpFPROJNNYhhttKVQwfAP61SW5/B8npYcn/OhSoS1Hy8FDK9rDVkOPgVn6Kt0uj/lr47KJX5Rp2bZ8gVq04+3xoKs3JSXeJeQ7IoO76FAxg3ZcpNiSTuE/ldCLt6TUrGIObzYE3MseE/DjmPfEuuv9tL2fPkMgmTBeODy8aT85q9S8NbwPEbO4NSvL37UdJERo57AUje+eA3Q+QMvPiglCZHv5pVNlD6XDudURuxI8+V9Zuy7raQwZKFzHQQywMz+qCcWRJRC+yCfZ1MkafUtyO8l/xvP6f2z7c5vm0S1JKMVQmF5iyiwqlOnY9PI9rCAxmB3BSeVod06I1xSlXIqPy6ssR4aHnnVrdee/rVO0x0+PJwXmLE0ETQ1FiTCbr0N2o9dEufQq9rJ2J95FX91o4SWTKHQujxYNi8+a16Rm08DuC5xZwHfL05GY4DvoTLb/BnlM85qICTU/RlqHJfNFoAlq0DI3zJ49JbQ0m+zhn3TWQI+2EJgIPyJV7tIPfWDJ7vRZMEJIhv24=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(6133799003)(22082099003)(18002099003)(11063799006)(5023799004)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2MiI7NhxRCZSq3VxkbgCsDPKTHmzE2z5iEu3vaSsqHylDRVa7rz6UDzqmdyP?=
 =?us-ascii?Q?YCgvh7uHbYzPu9LXLlifYDvXzgcwcxuIgbDWP5csOcVq4QABI18Fjp+xsWg9?=
 =?us-ascii?Q?8alYIr11iFuDXYBZIyC23uHqCUMKWCbgSdKQdCatgpKsuI7vDlc2bjahim6L?=
 =?us-ascii?Q?7SWHMUjGDZdJswYcBnfNKY1yjLnusC1A+7ceL1evoI4ibKORxV+3H9jpGZ8n?=
 =?us-ascii?Q?y9rwAe8Yd5hd+LwOpQqo4Dd0Q4Jy99YGAp9Ygqvievz4QSLHRrDJ+fGC/+dh?=
 =?us-ascii?Q?FjgJFzX5bCYgcxppvkAl14CxwqNa3ZfTJsrU/Uh1poHphsO4T2wlo0xTdzlF?=
 =?us-ascii?Q?eC4RcTId2p6b4cLc2e2UZ8H3HDP8HyoYWNaJCB4tvC7gzwuNFj3UleMZUEu0?=
 =?us-ascii?Q?6EdQpMwLW8g2MZhtsfppRnCeMOYUOzLX5nDYoomiJmU36P42NwGcOtF8Al8c?=
 =?us-ascii?Q?MXdRwCwqMOzIU/Nv+jJRL+klLUk1y0CWtd+NgvqThMPILqIxO4ZBZebfGbMw?=
 =?us-ascii?Q?fVk+zoYQBBQ0zU4+oiFtBZHvvyw930gUll4iQbcZhmHPJ1qG4vxu16+Q0WHT?=
 =?us-ascii?Q?jWus1J+YI0WFR3vBaJrwLYtvYI7AdEJwiPx040Zdwh1/N69KEcZa4sWbsVQ8?=
 =?us-ascii?Q?VGIsqzyo8jt1JnAKgOaZT83BtKAi3L+sweypgst5wH07kreW4qsZ+uSO+Yc2?=
 =?us-ascii?Q?u1G7RXXzZxvI3drLEAgfiVHYwTdFPEZty9goe2r58jPaX4Wq9C7YDd5Wul23?=
 =?us-ascii?Q?ApUACAI147/wOp8yR2Q7/yhC9m8fpLC68kNSH0YfH5uEqcDD6VWXf7MSOgl8?=
 =?us-ascii?Q?vvclpD4ozOFzFkD2W3bN1rf2cKkcwbXyYPPRuo1ibG6xtvGMco5XDKrcsxLx?=
 =?us-ascii?Q?+DNh0qCbXLtyIRLXLWB25dCVVwh9VvgBwXViAb6SvAae9L4dLvFiLdfUloSg?=
 =?us-ascii?Q?wFXkaWyxKIjBVQVoTBT/i4r/swIkKNi5TXAB0gX5h2M1tTK4gWHWZkzZOx5t?=
 =?us-ascii?Q?8K/0j490yLBCAT73HUt5o62FQHCFF5NJQLeks5rtCRvShX9dUsxOvAAMaQm8?=
 =?us-ascii?Q?S1mGFs/fdgHqCz8TxIJAhZzoFsBy14/1Fx3PE/0a6RNaemDJIc28xz7zk2if?=
 =?us-ascii?Q?UBZXWSj57z6RYcZdU6kYV60mKzGCdXy0wH4wT8LNc5ITk3CKvrEIiyUCLWZa?=
 =?us-ascii?Q?R/PCGoWzUFsR4pBML1Y4YssQp5yq1jcA/I3D7nnGUMCg5B8ZcgaO9z0UgT3i?=
 =?us-ascii?Q?v7GXYXnxVaONk1Ag8FKCHYeSIMNW7kLiMqUcJZSM801xEemxRZ6Ktpd4VbE/?=
 =?us-ascii?Q?6nq1xjKsWdBTd7n0Wd1C2AjkksZYlUnivRDCH8K976ImdAcVRisRPuasZZQ6?=
 =?us-ascii?Q?CKfRIi5je+f7rqXk6OF/XOUg4+i2OCbSiportUBo/7rSOxR2/I2lVjqNzp3T?=
 =?us-ascii?Q?9k4RvpaNOsACWuBiHNJhU6TWIjH6nYGpvZ/KVZRDw2uqB1cPptc16vCxNmQP?=
 =?us-ascii?Q?+XOGBN4pfgKrNF4zL7pjrdaWkpurRmB7zXFewroT0DWWXsqNSUFBBPJPqEFx?=
 =?us-ascii?Q?ts4pjAmGZ9fGZhhU21KFe1702LBY+KuXouP8j7tA49uqP4UHP3GFkKzSR1GJ?=
 =?us-ascii?Q?2lyI03Qy300DBLJdT1pCqOxQX2fZN2grzHA4NkiLvWg3PcO7oaBKGkP+i6pO?=
 =?us-ascii?Q?oXIkBVNEyzAgSi2EqRmzR1+5SdEaM/M+++ydwqaSgqIKB6J8BmnT9pVIU8Yn?=
 =?us-ascii?Q?ipiSs43C0Q=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 513fd4ac-b84a-4d85-fad2-08df04480979
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 14:32:35.4603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 66gtmKu1bz7oNCxFjfpmfWAAbvsbP5fRE8ltUppVc18fLIcX6OFQ2kjG9Nmktpl14NcDE/jpqQ3lk2u7MSqr3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6742
X-purgate-ID: tlsNG-16d1c6/1787841157-FE07177B-81165615/0/0
X-purgate-type: clean
X-purgate-size: 4081

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
Changes in v9:
- cache SYSTEM_SUSPEND support using PSCI_FEATURES and gate the host call
  on the cached capability
- keep the cached SYSTEM_SUSPEND capability read-only after init
- log whether firmware reports SYSTEM_SUSPEND support
- pass an explicit zero context ID in the SYSTEM_SUSPEND call
- drop the stale note claiming hyp_resume is still a stub
---
 xen/arch/arm/include/asm/psci.h |  1 +
 xen/arch/arm/psci.c             | 31 ++++++++++++++++++++++++++++++-
 2 files changed, 31 insertions(+), 1 deletion(-)

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
index b6860a7760..e05dae1133 100644
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
 
@@ -60,6 +64,25 @@ void call_psci_cpu_off(void)
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
+    arm_smccc_smc(PSCI_1_0_FN_NATIVE(SYSTEM_SUSPEND), __pa(hyp_resume), 0,
+                  &res);
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
@@ -223,9 +246,15 @@ int __init psci_init(void)
 
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
2.43.0


