Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CF0C982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 14:17:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428935.1651854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91Iz-00016q-Kl; Tue, 22 Sep 2026 14:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428935.1651854; Tue, 22 Sep 2026 14:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91Iz-00016j-IA; Tue, 22 Sep 2026 14:17:09 +0000
Received: by outflank-mailman (input) for mailman id 1428935;
 Tue, 22 Sep 2026 14:17:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1x91Iy-00016Y-7v
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 14:17:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x91Ix-008E2J-5g
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 16:17:07 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ab28dd6-e002-0a2a0a5209dd-0a2a45019274-20
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:17:06 +0200
Received: from [52.101.53.31]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ab28de1-5984-0a2a45010019-3465351fc8d1-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:17:06 +0200
Received: from CH2PR16CA0018.namprd16.prod.outlook.com (2603:10b6:610:50::28)
 by IA0PPF12042BF6F.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bc8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 14:17:02 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:50:cafe::88) by CH2PR16CA0018.outlook.office365.com
 (2603:10b6:610:50::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.13 via Frontend Transport; Tue,
 22 Sep 2026 14:17:01 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 14:17:01 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 22 Sep
 2026 09:17:00 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 22 Sep
 2026 09:17:00 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 22 Sep 2026 09:16:59 -0500
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
 b=YNx0BNli/zoVpHkZph6wjpPURvRBwU4lKmmJUmwObJ8h7GCGcuymjyWCT6vDSBqJLLFGmNrKjfMPx5bvOt95QF+GL6XSeXKRTgUKLmJdf1PYAtG2ryTQiOtW3frzwQ18bpVC1llhuN2K4BEfWMIp6uxUHNbQosYlXXEuRZysbpT0cGeo7CQ3ruDQRroJ7/2MaqBbFUyjHxihrhAQQG+fGN8+9TKjU5BOVZwBDrHVQFk4di+Nbp+89Sto2iAMd+G2I7yt3tGH2zdBp1HRWNzuWCZhwUJ6N37dO0hx7qHujj3U8WXfcrG8iw051RkiII7TT54H0EKqCdjqLlkLiQIHjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GiyKKdJUOBT3vXd8bxwGTLEbTo7Dtuy1RwvOHLYnLek=;
 b=Anmro2vnonKxOjhARTn1FBWA+SH5t/EbrZLJuxK029BxjmNaltOAWBrjHqjFIWv9ooLZ+OfWQVwcuF5+dL6Dyb+23Dab5aMdI7i8xca+Cd9jRvz0VlIR2NBlQw6vhEDzXyBMoQHd3Uin1qYDOAEi/6hyOknScDZpf11nkpc0iZ+HpyfJJcfSHt0q/sC4SJBjqncb7TUmSPn6lWE+W4yyKYSt5aBuE7tIQwW580covjDQGx4Rew/lZ7+to/kL5xfSl10stYPpybcze+jffvjiht1y780Dd8CkmIwyWl7kvHmWcP4mI/yxvuCdCpwyD16BVsvoSKZlUa0isz15ziHn+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GiyKKdJUOBT3vXd8bxwGTLEbTo7Dtuy1RwvOHLYnLek=;
 b=XXhmblkdGkWAx3vzElZqRVshbu9s63Qd78NIP8MLj9/C5XiYQCuH6dxnCwoCKOAhIK6KYTd06g33vP+s/e8BkwMTEtQdwcRZlh5sJ9NOEhTSrt73zlqP+r8pFp2MkIK5a5ndbmAfW0w7OM8MUG4G9xAVP6PrhPeLtlC9+0vVx38=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <40b411db-a4a7-4f3e-90ff-5e4936c37041@amd.com>
Date: Tue, 22 Sep 2026 16:16:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] xen/arm: validate IRQs before descriptor lookup
To: Mykola Kvach <mykola_kvach@epam.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <cover.1790056623.git.mykola_kvach@epam.com>
 <6a94111e53249fc449b3df7700f37e026d522fc6.1790056623.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <6a94111e53249fc449b3df7700f37e026d522fc6.1790056623.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|IA0PPF12042BF6F:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ce37825-7cca-459c-6145-08df18b42b69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|10067099003|11063799006|56012099006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	AdniWrewZOdZz3BOao5C+hUOdRH0isDrz0vPkDqQbvEYBBlOZvepmqu4Suro83yim6ayIjb9CEw1QznUq8I7f0KCrc1WCnulL1JpvqFgRcoNoQiEzmQ4+77rFgppKT+vzuo652ACf28ffjANLyfr2D69KXM/4xRRLHrNfAZV3zMnOObpzN+hQIH8Hyr+CBwrjUdJQWp9cq55cqhbmeGfLBP8BB7Rrq9h6Z6NzBFK4r1pIoZz1KcN6bVV1DyADFJs2iE1NFwh2vrFMjhIZJCeJfnstHVxXd7bzWf1Kd85NP+Bn/A6HdXLyfBFsdt2NnfpjCbJ3EME6kzWdwO6LHtH55YTvQs/c2uSVKYdA2/OImS+lagS0GWNPmVH9mohyhEBV7nuosRT+L62Pirs7FQr3kMcB3eE/gHJ0BqGwDkMLP19nOt7nu3MB1On+CfG7zsTwvFwVto3Gm/dX8Hfp+oN8MMy83yArdXlgf6NWKfAidVhzavzmq7EPMT97kHFBLinuqU0hU5CarKokiPb2L+TTELgyV1nhHXuTCnSxoc/K9mKnla97/XMZ26mAWIigCTilOPcVHyOnV/g+75Vi35/31P12eAzTU+2P3S/8lzCKyyuFwZepZS5NBSliDyIulPDWyyyqI7tS0zyFtGz2Wk4Q4LHUsEtifnRQKeiEw9APCD2b5ZwXEZRKLzdAuZC/cKPQEzCfN4v7bp0BNGFQf9qxw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WIPug61okO9wkzH39COqxjpQQKQQvmr8CXEXW/jjeuNh3J/sPZlbqLcT8//JxFIYrydRTwXDpiW0GCtN2XnIqRp5sxwCYmj2mnstm9O0atAXUyMz6g+3nOlHobrCCB+5Et+YzR+ix+ONHW7RY3DnHdOXRcLFW7CYex+h84x03tXO+8dhsg8IJXfWc8thPFk7RE3k7N4mx6nC6pVAIw7BZk3ZCNfnHy8aDimrRRsV/4yy/ZoUpahabJnUbnxysX7a7Nv+oXCj7m/TuUHTY0dL71zCjT35XHH4a0W+Bh7gCp2mCHJG0dP8tCFxEow5BTv3Rmyup3GqX+tI8wm3ERIL/KVXMtRC1YZF5nq96i+hivYL7bWkmdTkFUoj/DjeCMwFVwm3vzSbbM2SUBZqJu9RBygQWCZYKkbXDR/zKPgb+sKwetrleb0J0FzAEnFV+Dal
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 14:17:01.0842
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ce37825-7cca-459c-6145-08df18b42b69
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF12042BF6F
X-purgate-ID: tlsNG-d62444/1790086626-1F262757-F2F889B8/0/0
X-purgate-type: clean
X-purgate-size: 1174



On 22-Sep-26 08:39, Mykola Kvach wrote:
> GICv3 eSPI support makes nr_irqs span the architectural INTID namespace
> through ESPI_MAX_INTID, but descriptor storage is sparse. local_irq_desc[]
> and irq_desc[] cover INTIDs below NR_IRQS, while espi_desc[] covers eSPIs.
> INTIDs 1024 through 4095 have no backing descriptors.
> 
> Validation based only on nr_irqs accepts an INTID in this gap.
> __irq_to_desc() then indexes beyond irq_desc[], and callers may lock or
> update unrelated Xen memory.
> 
> Reject INTIDs that the GIC reports as unimplemented in setup_irq() before
> looking up a descriptor. irq_set_spi_type() can run before the implemented
> GIC line counts are available, so validate descriptor-backed ranges there
> before looking up a descriptor.
> 
> Use the same descriptor range check in irq_set_spi_type() and the
> assertion in __irq_to_desc() to keep them in sync. Log the IRQ number
> when setup_irq() rejects an invalid line.
> 
> Fixes: 98f7060b9ed5 ("xen/arm/irq: add handling for IRQs in the eSPI range")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


