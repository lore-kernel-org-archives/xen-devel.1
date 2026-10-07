Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC476CA5FF1
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 13:45:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442358.1659907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xERww-0004Q3-TW; Wed, 07 Oct 2026 13:44:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442358.1659907; Wed, 07 Oct 2026 13:44:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xERww-0004Pw-Qn; Wed, 07 Oct 2026 13:44:50 +0000
Received: by outflank-mailman (input) for mailman id 1442358;
 Wed, 07 Oct 2026 13:44:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xERwv-0004Pq-UN
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 13:44:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xERwv-00FaBc-B8
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 15:44:49 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ac64cc7-e002-0a2a0a5209dd-0a2a450b888e-42
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 15:44:49 +0200
Received: from [40.107.209.23]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ac64ccd-b7e8-0a2a450b0019-286bd1172519-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 15:44:48 +0200
Received: from BN9PR03CA0901.namprd03.prod.outlook.com (2603:10b6:408:107::6)
 by MW6PR12MB8898.namprd12.prod.outlook.com (2603:10b6:303:246::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Wed, 7 Oct
 2026 13:44:41 +0000
Received: from IA0PEPF0000003D.namprd03.prod.outlook.com
 (2603:10b6:408:107:cafe::11) by BN9PR03CA0901.outlook.office365.com
 (2603:10b6:408:107::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 7
 Oct 2026 13:44:40 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 IA0PEPF0000003D.mail.protection.outlook.com (10.167.249.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 13:44:39 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 7 Oct
 2026 08:44:38 -0500
Received: from [192.168.19.2] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Wed, 7 Oct 2026 08:44:38 -0500
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
 b=gI7aGN/QzFbeVX8EF65Hw76beGcN6kh/lBJ7kwWISUh47nh65ObYmRR1RVDbEPeZHgiqrPETC0Ifx1leSIWqwYFVBzqyTx0yA+m8eetkpw0NLxF2PgpF5wAbNedpljUFDuJBbZbBTXLBj3N2xW//U78lsMTKMUwz348P53IiOyLpQLKMo+N7frclqXw+Gih0F5VjLN+ZTY5VkBdG6JLMLhSCZfio4MD3rlqvUgdc+mr5ikWDGkbIapFfCGKVUlLS78nlMgDdKysgwhSdpJgR+xVle78bgxmF/oo89tuY6WrSzTfThdTUx/HmiWzLSKDXAh1IavsPhr6ixgO9ThT+Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5WTVUPd9E0VgosHkW7VWrS3q+RIZNjmpZKDgQJ6ixM=;
 b=AJ+XQvhC6C1N3rvBupNhe+c4wStrhpkK406pctx/4278pkfr1o6C2zeqiUdWJTE7g4kKJFHbGB0/7ro7t4cqpzg04UiOUa/1ZVHmylYi0vFwdHu77RaSTCj8vH7+BZXL1hH3c8LYtmvND5msM3kla5oVn1da+r7AZQjV24seUch7JuEJv9N1Xi36LtWyg2Zkr5nSULnLqfFOKqX/7Oc/5i+TCYntEhKldU28BcZaeELfT36LrN30AQ8o8+nYVi4f645WbsuHR8EsrxJj9sbB5vMdWg5mtRw06jc/CbjP/zVzhzb0jL1Zit0JuyA2VncTQrzOXQyW1k1e0+v9U6xMzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=solinno.co.uk smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5WTVUPd9E0VgosHkW7VWrS3q+RIZNjmpZKDgQJ6ixM=;
 b=Xy38J6VUguYEB1Y5SWuWErmnbQu9IFXlmOFgtEXqLph/dLpLn7Qm4Fx0+8g832EChMBzZy0SRFODwdtY6FawiaW5qQm5YGbsAYxmqMoXU7sZ0Y9DdVJPpuj2efuKg9CctIwHxU9BP7tsy6hFdKj13ATgBpi3F4QYyk3ypegI/ZM=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <2d2765c0-be80-4f51-9a6e-a4f6d7507ea3@amd.com>
Date: Wed, 7 Oct 2026 07:41:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Finalise bridge VLAN support
To: Leigh Brown <leigh@solinno.co.uk>, <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony Perard
	<anthony.perard@citrix.com>, Jason Andryuk <jandryuk@gmail.com>
References: <20240517140506.8460-1-leigh@solinno.co.uk>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20240517140506.8460-1-leigh@solinno.co.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF0000003D:EE_|MW6PR12MB8898:EE_
X-MS-Office365-Filtering-Correlation-Id: 43fb34b2-38ef-4566-37ad-08df24792282
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	B7l1UzDYfTGvNXPIgi63aB+OpTqE+oOS3DI5Zrrj9PEUBsgme9xloIv+alpKEyvt2030mcwhMLBqPP/1suhmTuM3cotTeVbsSTbatljGzu/AYMTd2eoM2r+eNl+nP3UAzYDDCdkPF7W+Ew3qEOYSv87j4z0I3HzWtUguKgbwF8RqYJcrnRPDpxi8LaHERLVuwQfrUMdJ5flQoSrLu+zkOUHmfT76TurgdoejXDoyIa61SE435Cuwjj0Bg4SPcO9EB9lLHiIYHSqZWaXMx46GS6MyzXo6Jr7lMvHhSI2QHv9oyA5OCX3wIZrTdZ93iHwjCiululUz1Oj/qq9qw2U0dTvVmROLsIu0xst94JX9c/P6rrKiQb2ASrpiBueEiQFA5l69/AjTBHHf0bAYRyWFvkuxUJ/GZo/jWs9Iorj6xn7CXSG7/AHUaxFERqU9Pjgzfkyzj2HvrnLxyg6u9udpXE+prbwjMgdoA2Z03J3nRTs/RB6R8bW2HrNhaks3nvHGNhYs9mXrKLUNCefTBPYB+ntctj+LU4RG9aGpl0/Ghmw4Itg1DT5kLqQ3jlI9nhHDrTApPJ6BqCjvgF2ieg0od/XmFb2kz8Avq7kUCMZFquMhUPn56K3XPlJzhvARXK6r8pT/IdbM896hyfJ/5IgaVzZz4vqaCp8x39rgCt+rfeC02vA1JcuNIRwM+8h4snucuPjGam7Mvl5mwbKB5VCUNA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	innjrUNoTxkpbShyIqZvMEIq3P9MQJTe1Tal/sHALpncTypdZuX6ZC1r97psjFKH/gVI9Efydz+S7EKJMqvyQnB/rNj6I13tcLdvNAfAiVEnvNXhoDHgBcb89zH8USirbIzMs9abSg0Se/FjksRe3d42f9fMpvc/wrs5DpQkQQ6a+yPSKFoaQ9CMwUa9mK3U8wK5qhItULzaVZbkOc/yAG3TW+nGhM7UvWRneaL127AbZ91h5m173DrvnSOBfMDxxm/ibGcqo7ewrLX0yLy8+dOQngkLtKFKhtb9/yjM8GMFMo4pOHRNcgzeuWQsqv7OtaW2kdwM89tlKHvvK1Hn3yVfzodmZSP3qRy3ExWz6wHjGkB97f230dWb0+vUu5Rd+CRkAo4Sal/w0lwrOAEGILjnD5rJfPWY51s2+fq6o/oXPNaC/fnjU3K3ni/MhQri
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 13:44:39.8065
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43fb34b2-38ef-4566-37ad-08df24792282
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	IA0PEPF0000003D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8898
X-purgate-ID: tlsNG-42698a/1791380688-A96C29EA-2E93E4D8/0/0
X-purgate-type: clean
X-purgate-size: 447

On 2024-05-17 10:05, Leigh Brown wrote:
> Hello,
> 
> The first two patches have been merged so this version has the remaining
> two. Only the first of these two patches has changed since v3.
I was asked about vlan support recently - apparently it's not working. 
As Leigh states, the xl changes were merged, but these two hotplug 
script changes were not.

I reviewed them, but they need Anthony's Maintainer Ack/R-b.

Thanks,
Jason

