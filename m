Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF06C982FE
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 14:25:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428977.1651900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91Qm-00061U-9Z; Tue, 22 Sep 2026 14:25:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428977.1651900; Tue, 22 Sep 2026 14:25:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91Qm-00061M-6P; Tue, 22 Sep 2026 14:25:12 +0000
Received: by outflank-mailman (input) for mailman id 1428977;
 Tue, 22 Sep 2026 14:25:11 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1x91Ql-00061B-5G
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 14:25:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x91Qk-004nIV-I4
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 16:25:10 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ab28fbb-2eae-0a2a0a5409dd-0a2a4507b596-34
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:25:10 +0200
Received: from [52.101.43.0]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ab28fc4-b4ea-0a2a45070019-34652b007964-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:25:09 +0200
Received: from PH7PR17CA0061.namprd17.prod.outlook.com (2603:10b6:510:325::11)
 by CH2PR12MB4327.namprd12.prod.outlook.com (2603:10b6:610:7d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 14:25:02 +0000
Received: from SA2PEPF00003F61.namprd04.prod.outlook.com
 (2603:10b6:510:325:cafe::e) by PH7PR17CA0061.outlook.office365.com
 (2603:10b6:510:325::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.13 via Frontend Transport; Tue,
 22 Sep 2026 14:25:02 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003F61.mail.protection.outlook.com (10.167.248.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 14:25:01 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 22 Sep
 2026 09:25:01 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 22 Sep 2026 09:24:59 -0500
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
 b=AyURv1WWmopIPslncxza23Ohs4vPmQin/hqOIPBB1vyTJc5yndjEtilxEXK8bLJWq4+TvPyvga4tScmJPI2Ql5WoMMBSkKUaHg/4T3rmNjCb0csMTIgwrCB5DzA6OPt/pIngeiiwVwfV5DQP8AEt1ZEdl52Ozo/M+GdApBu6FN/YZN8rMjT5xJJ94zri1NfoZFm1QojRtkb6p2jKGLrWlS1giHJPVP+1fNnqJ/QQcVns+UAMvD9iWsn1mhc+qVqMs0utN8RVSrMsu6HT3FdseVTY0F/Cp7eoMCie8RCoyBWkvVuBc8FzJ+NLLZgDPupYqdr5mfOSgWJ7diGfBwEnJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qG0XuocjWs6WiHLtjd0Q4a+ZOxxKSdKCQzn586RzgM=;
 b=sXQbkE5obV5t6Tht1bZNj+l23HpJQ9xBkkOsO5CiTJ0AZltV7eGkT4VB5odUYJrL98IvhT2XekPOWXGNwSBH5B9XBy044C7wtp00DtszAUaDHmxmrKw8VzfN6pz8vucNoE8ZImHfWW5YMIuwvLX+aEgaxyVKXcpng7PgVnt6dIjLnWwvGEBF/cdVjwTgsktDZqcpSprLunn4ixxyGcEvOkku79z/lTDOOILYRfGCCCGLJHOV6GIk6WvJSp3uHp1q7tiRLwrw1eMBRwerwtVuBk0Zg3GVjkRjGrG/wWSfMeH9l53HSuBtdwUv+V44lUTH7unfKiCiI2zQryyxhbtf4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qG0XuocjWs6WiHLtjd0Q4a+ZOxxKSdKCQzn586RzgM=;
 b=2sga5If4SVTIZOAp1g+7TakWPU8vI5dKeiTe53ZVX1FHXjdEzQngyq9HQvQPz2cnKLX0KR5dmpNHiVd1qyvQdixa2P8aY9sjLJ9GXeB55qIrrNjmzixmXzigJ/JPkSMkmnP6aKAGJQLTooPD0l3TyfRgEWEW+dHpsPDlWTRhhBA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <c7350208-54e0-45e1-a744-24460deb2117@amd.com>
Date: Tue, 22 Sep 2026 16:24:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] xen/arm: handle irq_set_type() failures
To: Mykola Kvach <mykola_kvach@epam.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>, Jens Wiklander <jenswi@kernel.org>
References: <cover.1790056623.git.mykola_kvach@epam.com>
 <85c5f8f04b19eea8d32e875a8b7e94f4ebb88292.1790056623.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <85c5f8f04b19eea8d32e875a8b7e94f4ebb88292.1790056623.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F61:EE_|CH2PR12MB4327:EE_
X-MS-Office365-Filtering-Correlation-Id: d7b6682d-1095-4820-86d3-08df18b549e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|7416014|376014|23010399003|6133799003|18002099003|22082099003|11063799006|10067099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Nbqo8cT6DzTO/S4jqLlw731wF1x8OLp26aWM6DQRgzluIryRuxvJpxSGjEZbPmrZExJuM5nJBNj47pgDD8GMXKIsU8CIXd0uH7nwh5U/vIVLl9CZDlXqHTsON5aAmEyhV15TuBsN0fK3gaYOkM0GsUz+8SCOGXJyWNltA6FlV7E3zFoj71vwGql4EepmrHrvAfA/YTMSzvxjW3TiDQt5gG5whyYfwasVOlAQnCvWu1+nQbIob/ZgrVXgh2eD0eIl/D4C7X5jXCe113EP6ZHWrRZH+kJ+KpkgaoPoA7ExHXr/G4R+64lX9yEzs6UzuFcLCDb+SrSKpbc5sWNxvDHil/IYLRtpohru4yp2NwW4WEH0qY8eYswUrqQ+m5KkU4B+bcM94Sjh5RB7LY4DBN6t0TdwzaAXUwSXAaKnG3ZGHt+frf4apnPHWENhACMVTcT0fUM8lnPliyrngRyqtZ6tt7JyV1Nq3Zkg5ywrtC+PEYbREYTIWILGehR/WNbVNBD0Jq677UgNCySrkL6X2VpX9nP4kfztMp7hiOFEWiYdxGg3WVMDRn4yXSjZ0yb4wggJdSCgaVZP9H0zl4Lm7hHnD7bbzcyzcyO9EOzu5fx3dDKrBTB1TfmSP8dTRbyrTS1ehPpYKVJY4p9sY/pYF0xMCZtxc6rjYNyj+tH7RpRKfP6xnHyIcBOXCW7uQaY6be8+jRJ3Nxn5yx5NkdJ7DfjMMw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(7416014)(376014)(23010399003)(6133799003)(18002099003)(22082099003)(11063799006)(10067099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DPYyN6gcB+OGn+WzJQmFtUNFhtNyxu2b8/GIInFBzQ0zgUfBoICMDZuMMjvCFa5KiaotT6XJba3S4ohFwvgpeXwou6+H4O+A5/8PBP7CjtzhN7tidh3vz7Yo7K9989xBB3CHSDQKh7ZWBZgHywvd8XsyxDBDC2F2c38zLxq/U4/Uoz2Ac0y0SxBqU74XK+m2QzUVKH1A7LAN4BHkvEyMRhGVKQ/v3/u2JP9Qv3rlaBDJ5q/BqG+w/70e7mx5jzz/Zz56QgPUHKQWqpmVMtvUaUbIh+yYSYm+mNrN3HD4N+hACJ5eH8hQrN5AP6jui767DQ8py9kSd4++Nox0g36s5JeWDG3qNU4PIw6Ixmy4qUZHBGgBa02mORibjctZoOKH7ebqBVH1YtnRCSfUZ7wiMZOhixrk4mmENDOA7nelS1q8/jTd5T8G5FpGoWvBBI/s
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 14:25:01.7342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7b6682d-1095-4820-86d3-08df18b549e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4327
X-purgate-ID: tlsNG-ef75cf/1790087110-A7ED6AE4-B8F95524/0/0
X-purgate-type: clean
X-purgate-size: 1187



On 22-Sep-26 08:39, Mykola Kvach wrote:
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
> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
I asked you on v3 to reorder the patches, so that this one comes first (usually
when sending the series, fixes, improvements should come first so that they can
be immediately taken).

~Michal


