Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBDC2C88E53
	for <xen-devel@archiver.kernel.org>; Tue, 15 Sep 2026 10:05:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1421601.1647372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6Q2h-0005nG-4r; Tue, 15 Sep 2026 10:05:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1421601.1647372; Tue, 15 Sep 2026 10:05:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6Q2h-0005n9-2J; Tue, 15 Sep 2026 10:05:35 +0000
Received: by outflank-mailman (input) for mailman id 1421601;
 Tue, 15 Sep 2026 10:05:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1x6Q2f-0005n1-Bt
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 10:05:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6Q2e-00BhJM-Oj
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 12:05:32 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6aa9186a-e002-0a2a0a5209dd-0a2a450cc8ce-12
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 12:05:32 +0200
Received: from [52.101.46.71]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6aa91868-f479-0a2a450c0019-34652e47ed59-4
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 12:05:30 +0200
Received: from BN0PR04CA0209.namprd04.prod.outlook.com (2603:10b6:408:e9::34)
 by SJ1PR12MB6364.namprd12.prod.outlook.com (2603:10b6:a03:452::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 10:05:25 +0000
Received: from LV8PEPF00000066.namprd03.prod.outlook.com
 (2603:10b6:408:e9:cafe::57) by BN0PR04CA0209.outlook.office365.com
 (2603:10b6:408:e9::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Tue,
 15 Sep 2026 10:05:23 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 LV8PEPF00000066.mail.protection.outlook.com (10.167.248.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 10:05:23 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 15 Sep
 2026 05:05:23 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 15 Sep
 2026 05:05:23 -0500
Received: from [10.59.21.158] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 15 Sep 2026 05:05:21 -0500
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
 b=DnRt4yTDNKzemUtdIFmlFjFGommpMs7KyLPRcWLiQR8fT9cXW3dxgr/9kGJd+zNmJSZ6u4z0n/KsiW2YrjMdCW+oMLQ+LeAh7uOWtdOBGEgxjaveoWcx8oB98yi2KRlgLqKMEMZUOTwNsfjawwUUhs9uH5leMWeycQOyLj51QhmVCCMnKd3+RrDl1U9phW1vm+TUUfYgl2rsQnGlF1ofGKB4JgNWvWl/YWgUhG2bH+VSSERu1JrjKEcBmb/fl6mejNTp3Al6rhAJV9bepIIM9eAexWijYkcEwRTNP7u2u1HeQM4MZfVZ0KcIbzmJScA3mAaOOdabvvQxsimm7Natjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j006rmxLo+ApI4QfmDcFsOzeYmInP1NFjds5PKVI7+U=;
 b=VM++YpADTiu6HwmSnYGMftVcc5cKUp/e+/Lhx78FzzCY1QwsltHyG78MlSJ6C2HF4wigLxbDLcfvWqo55Q5KlXQWInYwH56XoI3YwFpCJ6wQeTvcIWR+YyBu/wdBVOxsXcNmLavoECRzBm2Pj+N3KAb+f13n65he/JW1GQ/FrojJnfr5lAchdPJSgKYdfwUo7QeNYI50OmflcCq8AuJtxWKKbIDkHyTWGprzJIpwP9cncyRYzGpR2dDHhUbX9wd7VnLMi/KCOidpvLkE2ZwlHba6HIyDDe+1U5UJMxXOLhZlYLiDOUEzDQ62K2pzgcjflV6KJEUdBIrBkTSm3UZ36Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j006rmxLo+ApI4QfmDcFsOzeYmInP1NFjds5PKVI7+U=;
 b=ANd4+iYEz2qV3yvy0fjmba8sXBibPQxHfdEaPsh34JqYbr5soTGkAeBrgTDTTPVfEJqahKDUIEjicMAVmUlE9YKJACoepfcbb37fynDHVV3x3b5lNLbvR1s7b9+HHmM1lGQOubRk1sdlvQG0bIgxWXjjsd0pNP2OKJ4JD3wFL0A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <cdd5445d-93b0-4362-b7bf-8c2d8fa3f933@amd.com>
Date: Tue, 15 Sep 2026 12:05:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] xen/arm: handle irq_set_type() failures
To: Mykola Kvach <mykola_kvach@epam.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>, Jens Wiklander <jenswi@kernel.org>
References: <cover.1787050437.git.mykola_kvach@epam.com>
 <a960bc4917d4673cd1920cada2cfdb7eb7475f23.1787050437.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <a960bc4917d4673cd1920cada2cfdb7eb7475f23.1787050437.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF00000066:EE_|SJ1PR12MB6364:EE_
X-MS-Office365-Filtering-Correlation-Id: cfc22f37-7d63-47b6-4c11-08df1310dbd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|1800799024|376014|23010399003|6133799003|18002099003|22082099003|10067099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	fIB/3NiCgOMFLYQZbq1PbWdO5q3jOnB+i2IuULF+lwTs0tKIh/5XNBo7WoH3uoOFAWuG1FW52ocyuHWGbqvwFoE2ObroRK9wGRSZQIImyaUZfagtGGV04qyqP5XZfV0zGvYPMAezW798T9MNJpT1cOtnfBHzP8W8u5j9ojHrYJzuAi48Q6idyFu5RT/B70aIPeDSilqybAhB8Ik1KdAyBI6R8PNA8DVizqIZkicZf5GXQh0vMvoa7hOcZXfnlJBOq8988/5K4yZes+X1MM9U06GWF4t3fhy1WhNln5OuoH+PCbwFLv0ZJVJS5s6NUsaeuLdqhCgAdSuAEN6hrl9zhVn4fUCL3u36zD09SVd65EdDsGz4zdrw8SmGCtdW+eVmwkI9fuHYaMZ34W6reLdgvooVQhC8ZWAJIkzQtdNHO46JhsDekMW2qgdXZ0/CWqf52tla3tgqWQu35HWfFIfusBvflrdMHDKLQXLg/4bR/LV3m8AHjJ5FZ0EUntJGO0qsv4QHrS/8Vc2IFMrNr688Xxk6whUOYiehPUv2JBCKKiPEoVCzImFwH4r79as230x4BIfEpj0cVUdHXcTwnE7XJ9v68VWWcVRQTdsxMoc4IAHi28oz4MXIYxbDaUR7d9C6+sgOD0cmWwEdHSB6dJlBjnBjyB1G/j+igKTFUSz+rq6o+Tb/HWRF9dnupZNVRyz/5C2iQ0wrHWc8LzK/ZxQu4g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(1800799024)(376014)(23010399003)(6133799003)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	a1aqWonAu11FVvFrmVWRP5APWFdB+txzAcD5+9Z7M5bjbMWO9MeyGdP99dMktQJYsZ8bCXtZ39Mqz6Eh611SrHZILmLuxJtKF3acVMpGqodYcSivLmfbe//gqB9Nh96Ot0jV2kjWPbguFlzirSfvEk/fR3VecDSQFbbJSyabl1nJcvOlR9YFmw2nEyLShIZPs1wHOs2bMZIo7iJWEWfa5jbyX6lD4XMV1gMAhf9TZgPhH7lj9owVaYUFTL8AOmFeNx+NaAQlQPLbPTzJB1iKtx0LjRvp4bl1aWZuz7svaXGB8yK+RlRcRjOTbeO87DfqVPgpYoKHlTnqGXUoYO1CN8NMTc65AqIcA7nWav0uvfyFiBrOkOxpMayEHLMIRZdeAmdFEATcRszSNu/mPv21lAcCPBi1AZ4KjFfsBquV3dtwRNqgCoYMCvNVkQvRfY49
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 10:05:23.8238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc22f37-7d63-47b6-4c11-08df1310dbd7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF00000066.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6364
X-purgate-ID: tlsNG-d25034/1789466730-5290EA5B-AE2C3C15/0/0
X-purgate-type: clean
X-purgate-size: 1016



On 18-Aug-26 13:33, Mykola Kvach wrote:
> Several Arm firmware initialization paths discard irq_set_type()'s return
> value, violating MISRA C Rule 17.7. If trigger configuration fails,
> initialization continues with an IRQ that was not configured as requested.
> 
> GTDT and MADT retain rejected timer and maintenance INTIDs.
> check_timer_irq_cfg() and release_irq() later perform unconditional
> descriptor lookups on those values. Xen has no backing descriptors for
> INTIDs 1024 through 4095, so retaining one can cause an out-of-bounds
> access.
> 
> Check the return value in the GTDT, MADT, SPCR, and FF-A paths. Store timer
> INTIDs only after successful trigger configuration, make GTDT parsing
> failure fatal, and stop UART or notification setup when trigger
> configuration fails.
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
This should be the first patch in a series that can be committed right away.

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


