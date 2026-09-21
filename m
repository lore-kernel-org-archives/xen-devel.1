Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B05C982E1
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 09:17:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427208.1649834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8a99-0006p5-JP; Mon, 21 Sep 2026 09:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427208.1649834; Mon, 21 Sep 2026 09:17:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8a99-0006oy-Gq; Mon, 21 Sep 2026 09:17:11 +0000
Received: by outflank-mailman (input) for mailman id 1427208;
 Mon, 21 Sep 2026 09:17:10 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1x8a98-0006os-Hw
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 09:17:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8a97-006JkE-1t
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 11:17:09 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ab0f60b-2eae-0a2a0a5409dd-0a2a4506e068-28
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 11:17:08 +0200
Received: from [52.101.56.9]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ab0f613-195a-0a2a45060019-3465380913f8-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 11:17:08 +0200
Received: from BN9PR03CA0779.namprd03.prod.outlook.com (2603:10b6:408:13a::34)
 by LV9PR12MB9781.namprd12.prod.outlook.com (2603:10b6:408:2f6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 09:17:04 +0000
Received: from BN1PEPF0000468D.namprd05.prod.outlook.com
 (2603:10b6:408:13a:cafe::98) by BN9PR03CA0779.outlook.office365.com
 (2603:10b6:408:13a::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 09:17:04 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF0000468D.mail.protection.outlook.com (10.167.243.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 09:17:03 +0000
Received: from espagarciav-lx01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 04:17:02 -0500
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
 b=k8cgpro8oTlppAbECpLtXbFe107WM4ctDpwfEevtMe71trkoLDEoaBBmGto9XTi/KJoM6YQaLC3QK9leb+7saNGmImi23amAtCeFMy+zv0nwhl+mYzEBPXb+OQORSG+2QOem0lC+a/oboeTog9nQxo0DsT384QOYNxawZ8WEdNn8SeUZursCFrD7R7Dbb6oTys9yZYJHutN8bD6hycBq4Um17eCXSKc8/8MIhO0R54CUT1/IQa2hBj4oR6Cv+FJCQUNh+VK/VQbYmHSdNGfINStBAdLPZZVeEONoICmKY0/jq9GdKoi4mchZuht87H0wXd+Sul8qNHUtYvuR1sqZpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpG4PP+LdqdKmBVP32nleuKcECNMY4ZmvUOiP88omMY=;
 b=HIJfN4CXIskeTQJbjmEliqsXJwSZq82ECOoHWFfS+YC7ghNB0Jmgu/V1PbWMmW3H7BCQv3PJcL53qx3ZTrpbBrhJ1IVKmqX4hnoBkrxcVm/1+RFhaDg4BXwGBjg/iSlXfAjdabUHmmj+1ApFqmix+DD37jX6s0/r6P5efhUg9EJsYNN7MQsW1HJrjenRjimMAjPWQ7gGXp/4pVEszEPg3N6gsNNC19lgpkLD7jk3SBRDb2eAHnIPEM6UdcFR0Mt/CQKJpDiUyH8TWMqsOGSM5LHiU9+7HXKanADqwbVMwfACSIwJfClgLwxp9kb01wBPnmIJo9I0QZL5nzMSUJyvXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QpG4PP+LdqdKmBVP32nleuKcECNMY4ZmvUOiP88omMY=;
 b=sD39krAT8PNO+G6d02gCQ52I6KIdJxe1ulgABa6I/ZsDD5t/cH4IIC1r28tFCcKEmfzB3BN1IMpwOnOEX04j77pn1sj/EZw/P5TTaBoVpie2MoA9oqaO7QYOAJGWxbd2Nd/kC4RFc6TIHHrGwdVp0F4fbRgshiQCAnuExxjBaRw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>, Teddy Astie
	<teddy.astie@vates.tech>
Subject: [PATCH] x86/vpmu: Fix incorrect printk format specifiers
Date: Mon, 21 Sep 2026 11:16:50 +0200
Message-ID: <20260921091651.34761-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468D:EE_|LV9PR12MB9781:EE_
X-MS-Office365-Filtering-Correlation-Id: ee7107e5-78ec-4219-aab6-08df17c119e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UfQbwf7clVfOwmOjat/N10Xe7hXOJtYjgJp34or9Fvlq0ULMYFOo6GoXhdK9AUNIH3Grb+4D3oF2Ryg55ssL1hSdH36pstypz4XEU3g75lRfZmPnCpoduPaKJ1+dS0C0OfW1bOEByEFsPLjew8Nb4dFmwyKhlXS5rF7iuAm5VMbp3440SP6sZf9GwtCrhzFOteQE9U1eUkRcfE38TrwD9g0nTI/EHH4pgz/NYrbcxjGzuRsrOQjuwHT/OqpvwLwwlD1Fy3aR8H0b3JBWEhUKmDlbX79o5ec3rqVIFGeAJ37iHWccuDuyo6kx46lSsw5nYUd0FTUyFiiZP8Y7M9y+WPAEaMc9kdLwP3NQ+83Gc/o031hDU4sE0oSUyYtvxtWsHGp6QCtdYEmZxXap41ypVkOT225fVH6zPRPs2NLNYfJbPPDxN4N1EjkcP3GqjWW0sGdom0gaPn7di6X7JK9q81vQV8K2aieABWf4QY/GMg9gAn35z07ycUlt8nItxQgC7GvAJVGIijMJzLye+d9pMSw12caEUea2R209fOEK6VMm9du0ovlUkR5uhztuveY9Ut35UESY3H4F5nO8QxWsEwlVHyW4JDWC8hUeFj5V2INPIvPTRpuNVYGoTfm5HMIsH7Z467x9nv8KZTxAvtxYwA8rygfiC/IO9AOD2m3jjdxzTBoBRM+i8/aYcDdWZoM89ZXkkma2mqkfna5M+7sVMg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2qTTg0hMI/zxVqJGEEHIPnkij8LpbDfuNFcv14kUgu5TCGSv6lOTyaMhSjbOQLpd3VanakA21hWSVpNNR/y6YqaAlAbY8w/bo/vILHVh34VLDIE+zHCQR85vhKw3/NwOpv8AbOOsiAFAr88RxsaVEs/brcfTvgfJwNL0z7+xzR3Ngwf4Aj3pDE+8CttuQQ2GWHyuXRBHisbNu41WwBHh2ionMgaUixSKtoJfYZVbMbTDTZx/4lpC0u14bGnh/+oTWXeAe6nYmxhyxDIA1X6T5e/LwGMnGiemjyP3/hdoiNs6wpFn8Gq4M8TGHBv4fa+VOdhG16dBYr/U6jes4fI48wD/cewabfDZ8L6e406iw4rZYABiewQBRTqzkeq/U0zuG5lzdkt2qCgWsNZ9sFKMF+kSF9iy2JoggNVrSHwJh8zjkUvUpX8HbGmDeE2zXmfx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 09:17:03.9855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee7107e5-78ec-4219-aab6-08df17c119e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9781
X-purgate-ID: tlsNG-16d1c6/1789982228-FDE0E77B-C5C10649/0/0
X-purgate-type: clean
X-purgate-size: 1370

The patch in Fixes adjusted two vendor variables from uint8_t and plain
int to to unsigned int. But they were both used later in printks with
the %d specifier rather than %u. Adjust accordingly.

Fixes: 39a9a49449d7 ("x86: Remove x86 prefixed names from x86/cpu/ files")
Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/cpu/vpmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index 470f5ec98d..e0f7edded3 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -417,7 +417,7 @@ static int vpmu_arch_initialise(struct vcpu *v)
     {
         if ( vpmu_mode != XENPMU_MODE_OFF )
         {
-            printk(XENLOG_G_WARNING "VPMU: Unknown CPU vendor %d. "
+            printk(XENLOG_G_WARNING "VPMU: Unknown CPU vendor %u. "
                    "Disabling VPMU\n", vendor);
             opt_vpmu_enabled = 0;
             vpmu_mode = XENPMU_MODE_OFF;
@@ -849,7 +849,7 @@ static int __init cf_check vpmu_init(void)
 #endif
 
     default:
-        printk(XENLOG_WARNING "VPMU: Unknown CPU vendor: %d. "
+        printk(XENLOG_WARNING "VPMU: Unknown CPU vendor: %u. "
                "Turning VPMU off.\n", vendor);
         break;
     }

base-commit: adbbbd47a1fad8e3bc1ab65c555f11d831fd6681
-- 
2.43.0


