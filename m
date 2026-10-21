Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37726606A31B
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2026 13:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=sjhOnl8N
Received: from list by lists.xenproject.org with outflank-mailman.1457143.1670033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJWLD-0007zK-Mj; Wed, 21 Oct 2026 13:26:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457143.1670033; Wed, 21 Oct 2026 13:26:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJWLD-0007zD-K5; Wed, 21 Oct 2026 13:26:51 +0000
Received: by outflank-mailman (input) for mailman id 1457143;
 Wed, 21 Oct 2026 13:26:50 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ayan.kumar.halder@amd.com>) id 1xJWLC-0007z7-6U
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 13:26:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJWLB-001NGB-Hs
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 15:26:49 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6ad8bd88-bab6-0a2a0a5309dd-0a2a4502c6ea-34
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 15:26:49 +0200
Received: from [52.101.43.47]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6ad8bd97-6ca4-0a2a45020019-34652b2fdf00-3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 15:26:48 +0200
Received: from PH8P220CA0017.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:345::21)
 by SN7PR12MB7297.namprd12.prod.outlook.com (2603:10b6:806:2ad::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 13:26:43 +0000
Received: from SJ5PEPF000001ED.namprd05.prod.outlook.com
 (2603:10b6:510:345:cafe::39) by PH8P220CA0017.outlook.office365.com
 (2603:10b6:510:345::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Wed,
 21 Oct 2026 13:26:43 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001ED.mail.protection.outlook.com (10.167.242.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Wed, 21 Oct 2026 13:26:42 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 21 Oct
 2026 08:26:41 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 21 Oct
 2026 08:26:41 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via
 Frontend Transport; Wed, 21 Oct 2026 08:26:40 -0500
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
 b=lyMj/SB40cbmlvBTJVIBTujiYyEwA/mu/ZqDm4NnXKPPLXJopHqmNpYJl+cvcvOSzrRFidfYhIFUlTRsa0QU+RQ9/I+FW14mdHVePkXQVXOk69m+d06/MT+rDKmiQ7HbU9ieVfg92BMxkPlkL5/HJRr0Mgft+bkJzB5EywaAEEbALNoTK71F91ZT33BbQ7F1ao0sY33PuqZ8xiRHT9mLHJlnnvj1TRnbINOqY9KwFJRTidPB2G+VCrdaqBreoNjPBRFreIptawyZ3PnxJb/ttQ4E8QrScACwF6am2EGthpMqHbDWs1krSXXBAccWG3IUCsfAJYyZN87RIOH2PN1WAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DY/wsFYYvEngNEDjTFM23GzUCzWYAhBmqOOoe/FCJ2E=;
 b=Rj2jOKUAEgUsYiFxOmzdaB+qv7nal81LnElEunChCPKZYe37xjTvRmUugRU+YH9wtQBYLdKV/iBuTWKZ23M9dc8R5Gxs8ZyxO2BZZdGQQKACm8LTAdOfk217QCVeAX1ecojCjXrMD+iIlNd33CZ1/wZIUichbzvzs0nhgj+pKrI8Tdys7dsgnWHzJFz58lgPpsNzvoe7eBdCOoqzIxHmxZpVE02TJOIMFdoP4QZH1ITlV+iBjEiV+zbu/pU25ILNe6mk02HCh20msKmLVzsVTQA6KEWz1FNgNUjgUBqs/x41p3XmiGSeqlocdKmex12yeknJx4bPDrXDyqAHK4OhyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DY/wsFYYvEngNEDjTFM23GzUCzWYAhBmqOOoe/FCJ2E=;
 b=sjhOnl8N8z76SAkkjV4PUkG1Xk2GmXId1oHWgd1qgRwxtzBCT3jJng/kr+rHt1lE5Ks8ByeQG4tk0tNq8ZIbLg0ymYBSRx4NSUoL+l0WNmc2rallfWm5XhoudlZe7itk4SfTFiXNtFd3MAirlb9oMYGmKtHuj1w3ErstyV/5YjI=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>
Subject: [PATCH] xen/arm: psci: Do not keep a rejected PSCI version in psci_ver
Date: Wed, 21 Oct 2026 14:26:40 +0100
Message-ID: <20261021132640.599126-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001ED:EE_|SN7PR12MB7297:EE_
X-MS-Office365-Filtering-Correlation-Id: dfdd28c8-0767-4499-0350-08df2f76f23d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|376014|36860700016|18002099003|10067099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Syf95CC6rIBWxHdyU+w4CU9gny3gZ3tjCIRo9/z4k/+IkKBrKJcFCStPjEwh3lnnCqp3doSBu7R7389BbfoQyGYrbCi3B9t+hwVoSEzfSFrSUkcD+LSGVv49ojXTwPeZV1JFwKCbfEFu15h6c/59AInhTwCrBXoRoUxcdrGYsI0laZBWXQ+Ka8eJGQzS7ujg7gYmOYTq2X6GWshmniujYdihi84GZm8RmM4grwjEFYpaPxbb5v8glqWE7PMuEpsycBQ8njYrlmuCfasgDGZs/209IxHcgF1B+0wqTCcTs3LjEFnn4zneewJZLOdViWEpdtbxmyWFNzvcvS2fnTJ+FyFNyDUrZRFWE9ZwFwyZUBWDJsBzU5XcqtR+nMbaSbegEnK0QA5T4gdxI39gylu7c+nCTwceg4vnA6i33qBJOIHMY3hsdmVW/tC31dEm7plkmy7TvaBXz6/d7I96g2TC+G47LgHzYAMLYVGTI3QWdQ986jRk4BdwNc/6HRWAl5HYQZqcQnQ1p2f1T9t93g0R4F4HxhF0YAV3MuEy3Ob6IydxklFe7wAWsK+TM9b3x/Uxe4N6bcVaqHlGXdJCstTb6C+TCsHSzsNx5edq29R8hZpkhWKvyKqafdK4rDz4/Yq6JrqOWXKiylwjJ6beHt457+ndovvP7qP0hJ1nFxOqe1XL1gu5ZMfmfoEXBwoEmAAKRoG5TGpf3P/lrx0RBP/rGg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(376014)(36860700016)(18002099003)(10067099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	svub2mBRevRCQjkXpaagDN5rdiUX/Ao+FUvbpxKEM5d9TO66+dH5SAo//nZ4aooMcarI0fW1d49gsxmPLttQrGfB0pmb6p0T4ORrM2X6aedxGpEF1oFHemu70cFJK2VPQNCQtTf2rPElzr/weI4W+PhilU+L0VEZgvMORGdZFM82ULeWzElT+d8w0PuPVNr81dXyZSoYZUYTly95JLU0KbfE9FEwZhhWvZ4UkkDox0+ijDv2H890CWfUvHLt3J85Gkr3fIZ/I6VQVjZtkEUrXNuHhQ+9IffLyOdksC0VVxF4fFRp8zSPvoPuOTt66D3H0lj9l/e3DVTnGuXV3el3JSgD+aXrE6exHSGrfjgb5X7UOeEEA32Jdw9RFfm4B1VnOGUcw8JDgXvQ8kVa0bCjlMzNrNXc5WaRZzNDXuT42lrDEzKpIoBAUel2LFhKkqS6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 13:26:42.5337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfdd28c8-0767-4499-0350-08df2f76f23d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7297
X-purgate-ID: tlsNG-720697/1792589209-F30B02AC-6273D795/0/0
X-purgate-type: clean
X-purgate-size: 3071
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

psci_init_0_2() stores the value returned by PSCI_VERSION in the global
psci_ver before checking that Xen supports it. When the firmware reports
a version other than 0.2 or 1.x, the function prints "Unrecognized PSCI
version" and returns -EOPNOTSUPP, but psci_ver keeps the rejected value
and psci_cpu_on_nr stays 0.

psci_init() then tries the PSCI 0.1 fallback, which overwrites psci_ver
on success. When the fallback fails as well (the /psci node is not
compatible with "arm,psci", it has no "cpu_on" property, or Xen boots
with ACPI), psci_init() returns an error that smp_init_cpus() ignores,
and psci_ver still holds the rejected version. All the users of
psci_ver then consider PSCI as available:
 - on arm64, smp_psci_init() installs call_psci_cpu_on() as the method
   to bring up the secondary CPUs;
 - on arm32, platform_cpu_up() calls call_psci_cpu_on() instead of the
   platform specific cpu_up() callback;
 - call_psci_cpu_off(), call_psci_system_off() and
   call_psci_system_reset() issue their PSCI calls.

As a result, Xen brings up each secondary CPU with an SMC using function
ID 0. An SMCCC compliant firmware refuses it, and Xen reports "Failed to
bring up CPU<n> (error -1)" for each secondary CPU.

Only set psci_ver once the version has been accepted, so that a rejected
version leaves psci_ver at 0 and Xen behaves as if PSCI was not
available. In the case above, Xen no longer issues any other PSCI call:
on arm64 the secondary CPUs using the "psci" enable-method are rejected
by smp_psci_init() and Xen boots on the boot CPU only; on arm32
platform_cpu_up() uses the platform cpu_up() callback, if any. CPU_OFF,
SYSTEM_OFF and SYSTEM_RESET are not issued either, as when the PSCI 0.1
fallback is used.

Fixes: 4d3d72c01467 ("xen/arm: Initial support for PSCI-0.2")
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/psci.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
index 634d0d7467..a720cf8d41 100644
--- a/xen/arch/arm/psci.c
+++ b/xen/arch/arm/psci.c
@@ -169,6 +169,7 @@ static int __init psci_init_0_2(void)
     };
     int ret;
     struct arm_smccc_res res;
+    uint32_t ver;
 
     if ( acpi_disabled )
     {
@@ -191,16 +192,17 @@ static int __init psci_init_0_2(void)
     }
 
     res = arm_smccc_smc(PSCI_0_2_FN32_PSCI_VERSION);
-    psci_ver = PSCI_RET(res);
+    ver = PSCI_RET(res);
 
     /* For the moment, we only support PSCI 0.2 and PSCI 1.x */
-    if ( psci_ver != PSCI_VERSION(0, 2) && PSCI_VERSION_MAJOR(psci_ver) != 1 )
+    if ( ver != PSCI_VERSION(0, 2) && PSCI_VERSION_MAJOR(ver) != 1 )
     {
         printk("Error: Unrecognized PSCI version %u.%u\n",
-               PSCI_VERSION_MAJOR(psci_ver), PSCI_VERSION_MINOR(psci_ver));
+               PSCI_VERSION_MAJOR(ver), PSCI_VERSION_MINOR(ver));
         return -EOPNOTSUPP;
     }
 
+    psci_ver = ver;
     psci_cpu_on_nr = PSCI_0_2_FN_NATIVE(CPU_ON);
 
     return 0;
-- 
2.25.1


