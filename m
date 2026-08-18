Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1BAC5DF70
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 07:18:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393503.1632324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwE5j-0001C7-SA; Tue, 18 Aug 2026 07:18:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393503.1632324; Tue, 18 Aug 2026 07:18:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwE5j-0001Bx-Pd; Tue, 18 Aug 2026 07:18:35 +0000
Received: by outflank-mailman (input) for mailman id 1393503;
 Tue, 18 Aug 2026 07:18:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wwE5i-0001BQ-Q7
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 07:18:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwE5i-0083Au-6u
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 09:18:34 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a840743-bab6-0a2a0a5309dd-0a2a450bbc36-20
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 09:18:33 +0200
Received: from [52.101.193.63]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a840748-b7e8-0a2a450b0019-3465c13fb579-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 09:18:33 +0200
Received: from CH0PR03CA0003.namprd03.prod.outlook.com (2603:10b6:610:b0::8)
 by SAVPR12MB999143.namprd12.prod.outlook.com (2603:10b6:806:4e5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 07:18:28 +0000
Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::16) by CH0PR03CA0003.outlook.office365.com
 (2603:10b6:610:b0::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Tue,
 18 Aug 2026 07:18:28 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Tue, 18 Aug 2026 07:18:27 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 02:18:27 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Tue, 18 Aug 2026 02:18:26 -0500
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
 b=s2NDtwdDLcVVwGlFnimHClKCa5AZwxEVuq3o6EvsKV773sriqiQsRGaqV0jlTgsEEMlKnTHPSC/UiGHx3dUCpO1rdlNnkTgTi3oSyTLs+mTXG1EIvIi67dkAfQDYm6goi6NclxUm6CEXq7DZN0ebRtnpNNgmKWXyzxWCk4ULBPmlIHtWBabSi/2x9jsB7CRY82zXSwyBEC8Ug5VlfYo8kcNc2IbcuEi7vIxGgCWGOsTwGOlpGBzVRkmTbEO+SoTPZFca2vAlEcWmrZyaa3yxo25pHhQ8yRK9Fy+Y05w+XKGBrFsvFpO2cSpr/fSVP2dfwkXnkf0XypWoOsnOO04v8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nfr/XdqaQfwcneuaTPPE2HBtDkQgRyv4jhc+Rw/0Va4=;
 b=elDCXLK18L2vaKUoGxyV+qxZR+fDALo1iKo3GtcwxBcYGsa70CqodUtY7f8MSwZmDfwZVf34eSJMEhFxTJ+3Lxv4464zzQLcHzd/mJIm/x/tw6eMPsYWs8ygHKpX/h82hzfRaPxH5IHWvDaoqM7mVZH3fTvokAUerjI+wMRaziLDMk6bdHUe7JlKoyVaajYpz+EYMhPDcjsO3T9WxGi/1Z8BDBwgkCGiFVh25jEGAILg4WU02u/Kjlbq2yDlXWKW5wZpNlVDMvEWjEMHOS5bvt+AI327hHqUbIiE/5jM9y1q2lSAXNcVCyZXh/8gZdZeOVcJeACKvXQ5TbOG7g9UoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nfr/XdqaQfwcneuaTPPE2HBtDkQgRyv4jhc+Rw/0Va4=;
 b=lie7NOfuNTs4lkD9Bj7fdLWTxdZd/eWZMQilJNFmXM+UumhXdMIUQR6yHu573R+1PGNubmHz20s35zbtFA4e3vO0QxLDzHzZCSYnOBFNqncYs9zZAh8Zu+8Bpdd3NtImuVcO4qORGKIkT8UszghBKzpqxjAqudZVKxfFXmMz0bY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <d80dbc73-d69f-4f68-a508-7a7c5ea30c12@amd.com>
Date: Tue, 18 Aug 2026 09:18:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] xen/arm64: add early printk for the classic i.MX
 UART
To: Wig Cheng <onlywig@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, John Ernberg <john.ernberg@actia.se>,
	Peng Fan <peng.fan@nxp.com>
References: <20260818025224.4165503-1-onlywig@gmail.com>
 <20260818025224.4165503-3-onlywig@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260818025224.4165503-3-onlywig@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|SAVPR12MB999143:EE_
X-MS-Office365-Filtering-Correlation-Id: c8f6dcb5-0b60-4244-0c39-08defcf8e65d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|376014|82310400026|18002099003|22082099003|10067099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	zkKANjQmV+XGkhuEMtrw+iMl16pG76u0+IvRvmjBdYiC/XMh70C2lI4g+em6beSVf8wNWUVldBzObddpKxrrKUnthiMlgvsGSudHIN0kS62F2HK73DB0FpY8GloS1IPpbjFJoEGYRSY6+h11gyio8yMQM0TA2O1aDfU75hT3Nd3v5jtLg+etC0/LAmD87oWH5zfRfO2/kZfmSoZ7rFItFO8RUQ7zVoqq1qNctEIjPkNbRB3/DoEZf3Ap1xmLviClC1beWeEp3jNLJT631kZqsR4Uq75V1ZeFGs2NvPdvpSJsBPuF/IvMbmR4SUZA16mxwyrjCx0202d5JjuYF6fDK6XVNmFERH2LqW9uBFO/sWc93Z8Qg8HdN0OX2K2D4TpuYGuZfMy2szr8c4raqftJhEMOP6nvg/2MRubJBeyQntUO9jQjAR5wj6wS21gLSu0S4M9WBgg/TxF1lUG3vcC8k5zqVwSMLfHn1WbcvfAHfjbcmHYOuFRburN38DkzGDgLpWHVOUKIcVzTl8E3AhEd8wisJ2Dzwjl21FWtiL4kbDaAHpoFm4pqUZtfMyKMbLTPX+XyHEpoa4R2AAAtIgmyAc3pCISdY0iN7aiv09UM3Fr1/fJBvtvcUdPFAFxZNHIyr55VuhUU7nTS4P7PiFuojT1ckbmeMC37WpkZnECO3aOKfEc1IDPMQk8I3S0IcHL6ufYqmQrAxXOOguP5ldbO1Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(376014)(82310400026)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7CLv6Y3NFMs8DWorPlllsKw3fEazSdPvYjPo0XJKmDcqqtfPxN9rlFGUERoLUDv2yVpVq6ATA+g3jJaM5RIITwJag6vbvjsKAd8oahIPXNz2Y6bXYkNtR6t2tXiEUfpena9ADJxtufwxRbUq5ojSynNlAMnf7djFedIQwnOpre+SZC+JRH+a81nCEj52ega2vx8z19b/UYI395nNZFhhXg6PNumtsUa78P5b5OK5JJerICyo4QxOaBcdaL8KfWoB3/Pa7bRLRICzrkWIi3OdP/V0zKLV0pQtr7e2j0n5COpOHh7OvYoF3Vzbl5j9kHDSHo20VYSvrAR6vDsUJoxhwGfMxMLtcNmhYB73pDjBlIwXOkoIohAhEgzQoWcwIXF2uMSRc916KBrec7866NXSVewNtWvyrk7veu6Law3It3oK4JMF2q1hw5zaQcE8/QAW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 07:18:27.9780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8f6dcb5-0b60-4244-0c39-08defcf8e65d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR12MB999143
X-purgate-ID: tlsNG-42698a/1787037513-190CD9EA-2019530F/0/0
X-purgate-type: clean
X-purgate-size: 339



On 18-Aug-26 04:52, Wig Cheng wrote:
> Add an early printk implementation for the classic i.MX UART IP,
> selectable via EARLY_UART_CHOICE_IMX_UART.  The UART is expected to be
> fully initialized by the bootloader.
> 
> Signed-off-by: Wig Cheng <onlywig@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


