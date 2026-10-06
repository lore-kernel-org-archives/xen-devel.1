Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DD5CA5FFC
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 10:45:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441378.1658959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE2fv-0006Vg-HZ; Tue, 06 Oct 2026 10:45:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441378.1658959; Tue, 06 Oct 2026 10:45:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE2fv-0006VZ-Ex; Tue, 06 Oct 2026 10:45:35 +0000
Received: by outflank-mailman (input) for mailman id 1441378;
 Tue, 06 Oct 2026 10:45:33 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xE2ft-0006VD-MK
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 10:45:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xE2fs-00E4O2-Kv
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 12:45:32 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ac4d141-8faa-0a2a0a5109dd-0a2a4509d548-32
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 12:45:32 +0200
Received: from [52.101.53.68]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ac4d14b-be1a-0a2a45090019-34653544ffbb-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 12:45:32 +0200
Received: from BN0PR02CA0013.namprd02.prod.outlook.com (2603:10b6:408:e4::18)
 by SJ2PR12MB7961.namprd12.prod.outlook.com (2603:10b6:a03:4c0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 10:45:27 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:408:e4:cafe::7c) by BN0PR02CA0013.outlook.office365.com
 (2603:10b6:408:e4::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue, 6
 Oct 2026 10:45:27 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Tue, 6 Oct 2026 10:45:27 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 6 Oct
 2026 05:45:25 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 6 Oct 2026 05:45:24 -0500
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
 b=ksItfQmw72TGK3qGgY2kV95i5ykgyWMJRC8YysFotZfKSOYSVdWKzb0jl2bzhxhVHuJ/34lKEW6vZxn4QJUPSiW5zH+gFiRHWSXu9Yt6JFlHkEpV3QTgiBdqIG6XYhBObNgZFtC1CaxCzP7OBRliIw1GsTUCZoCS/5nWqY6G8+eh7fXqcsc4znDEEfm+xWfb1IsQUbrF/d5/3Jd7t44SuP58UITouyPDpgVrlaKl3LtghUyTG2sbHqwDNiVcg5C4ct9faH4qfbSZQYauTifiv4kcG5rgtqrowzpM9LveY/b8UPHuRmB7dVldkCOmqUtiOKvp+moJ8atIyNNhEL19aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+Gue58WhydqS9oPe9T3U2QhGrFn9zlVd9joxzISyC4=;
 b=ii74mQ4m/9JcoFemckFpS8ZvGTk0e/ljoB0EXWz4n5nGhmcCk4ZMyBsTzEzN6V5vWl9QcvOoS9q1YlIKUi9+vEMvCBFDHm4cf82+fwswyjsRmiuhzjYvVehqm71gI9QUdOGMFEUwLV+3X/wOFHeOuiC92kSPqI8u9mQBOD0RaJZLmCtvnh0VrKl0+CG+TxqwSyzRaFX7cXxUBe8NRip+sgn9f8uzPH4baTm9BKVAyAw9iJC457t3gZVkES6uYr5SUB6wMnw8J3+G3uQY4Y53XdHNBP5a/tPquMPps+0qTiaNcxsBOkxhxekRObBbYd2ZrVgLyt9EH3tM6nMMKJg5Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+Gue58WhydqS9oPe9T3U2QhGrFn9zlVd9joxzISyC4=;
 b=JlRiJOJ3+/CncQ0ApMiCwbBbYbcWfKLFH8LdPoXjM5wLOQhLru703WFigw/2TRyaXja6nnkuvtyL/FFwHfd9TTCYSW7h5LrSqsRUWU2TSp06/sNVqziIfmcoA8qGeSO3keLNEpNDsVcQPS0c28uaiMaWeO/DWiv3DcGssHr+Iqs=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <f9c2cb00-e334-4dab-a173-4cbffff18d94@amd.com>
Date: Tue, 6 Oct 2026 12:45:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm/nospec: Make nospec helpers always_inline
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20261006103142.139422-1-alejandro.garciavallejo@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20261006103142.139422-1-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|SJ2PR12MB7961:EE_
X-MS-Office365-Filtering-Correlation-Id: bc2cd641-3510-42ea-8ce2-08df2396eef3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	slGKS2YXYYoZ3foXviefUdUlrD6Gu/a+ATDOS82P8L5d2Zefe4NmvAJjhOea7ztPGrwIMvGUb1Sat+IMyXgF+367yZk+uk+c9QUpq6nPduqVyR/WcnxYAq8PmYWVqH1fmXNRHf/TnVGQqhKDNHeiXhBmXmp+eUAOVRovqt6qPnZowmiZymCPdHVs6ScJ1CyfZWatc00SYFr13sizsYGVYkeSQ0u/V2d9vakvEFpHD4W/2XLLy9Rg+SnzQ65uueEqXNDOdLmn7JTbBLfTaIGxmGcyWiOeDx20Un1Ad4Wdl0H+58tqcDXK8SnMrNjxrSGWaEt5eBfuurxyfwBqlV2saKN6yX5YTC17ivn5DC65CM3L6IYY9lqCYbEmNZEa1iycIpDpEsZJOtEPfEDMy/jNpXhEhSTFuvkoCB73JaIwBg7yXC0VSKw1pmSPN6LAEqjvDCyv7PAretphRIcyK4hr2651tcE3IkzVdCVgpoYl5HFUHue1gHZahsCPPgLpyRz5Sp/TN2+rkCThEhR9OTgXSXzgE+BIpi1IGIv197k9bpcf/nz9zEQpmWH6NAu8okX8JEluiWnAp3QEjR9zX0I8J+qHTlezo00c6CA5QBAJuOr62BOC7QZAHWXDbp5ZHAVh/jvDWISjNoqjH031jxFN1Ioci4sQJsze8XXVmCsUW/nNN6adGi5+2NRH25I8DnsfiQIzu3pUaUtuz5WQtLPcSw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9Po0CTlQ7ORqPnfGaGsNjs7yACZFmJ/aS3SngatqnNaLFxJnqcTWD5QeubzoVpF6ARaBWFyMWZlAXgq/yTb1PVrN+Lc97SSGrcXhkzP/gkw3OUMXQo+S2U0vdGUhX6qLEdxRaJPx2JP4EJwxRyt/S4IGZaEEMVDo3OI4HkYOLoHhEV2wnraDYvWDZ7A3KFpc3A3Ly7wuJBrsSo7KP91ARg+ix8Rpbe0OHvb+vlSEkcw/AnApd0MLhJQ86GHvEFFW2m6/CcoGL1e2PKD7r2xvzAi2DGKbae2SMn+B6atElxWxnaGClXySppbpEXJR/B0z0pa8s1qpPiB//gZyERDTzFGVHXWjsN5dPMVzHL1TnrSwMFq5AJzdHoxqGFIiihFlpsWPVTv8KUjUWSYTtkxJR0RRRVeD+iHovdcj3WL6ko0wRzMNW5g/EhWa7vG78Xvj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 10:45:27.0438
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc2cd641-3510-42ea-8ce2-08df2396eef3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7961
X-purgate-ID: tlsNG-bad1c0/1791283532-FC817034-A40E5320/0/0
X-purgate-type: clean
X-purgate-size: 497



On 06-Oct-26 12:31, Alejandro Vallejo wrote:
> While today they don't implement fencing in a way that would block
> speculation, once/if they do they'll absolutely need to be inlined, even
> if -fno-inline or -fno-early-inlining are passed.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

but this should be done for Arm, RISCV and PPC at once in which case you can
keep my tag for v2 # for Arm.

~Michal


