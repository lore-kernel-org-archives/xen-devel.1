Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D44BF5A8DE
	for <xen-devel@archiver.kernel.org>; Wed, 22 Apr 2026 11:27:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1290301.1569917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFVjE-0003Hx-J1; Wed, 22 Apr 2026 11:26:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290301.1569917; Wed, 22 Apr 2026 11:26:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFVjE-0003Hq-FC; Wed, 22 Apr 2026 11:26:48 +0000
Received: by outflank-mailman (input) for mailman id 1290301;
 Wed, 22 Apr 2026 11:26:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wFVjD-0003Hk-7c
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 11:26:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFVjC-00AoP0-Ki
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 13:26:46 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e8b066-2eae-0a2a0a5409dd-0a2a450ab728-48
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 13:26:46 +0200
Received: from [40.107.208.1]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e8b074-56b3-0a2a450a0019-286bd0015bed-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 13:26:46 +0200
Received: from BN9PR03CA0519.namprd03.prod.outlook.com (2603:10b6:408:131::14)
 by PH7PR12MB6977.namprd12.prod.outlook.com (2603:10b6:510:1b7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 11:26:40 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:131:cafe::72) by BN9PR03CA0519.outlook.office365.com
 (2603:10b6:408:131::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Wed,
 22 Apr 2026 11:26:39 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 22 Apr 2026 11:26:39 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 22 Apr
 2026 06:26:39 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 22 Apr
 2026 04:26:38 -0700
Received: from [10.71.194.215] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 22 Apr 2026 06:26:28 -0500
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
 b=x2ei8T955erKzQrVXpmNOhj4yFkUpr+ZjZQRCFTgJLKKXn6/x2CddfsKGe1AjQxsoPmr7x0tLfnKW0PCPABClE0SU0ibHi8Lx9sWwtnJxGdT14J7m1KMqomcxCb+DDAOnjCdZYQk/+E8KYcWCq5NeOWl3CzNiZ9LwR6ez70g8roRPx9F1LoNHCsbWJAPYgO2kfQL4Jo8/ubqcN2hPdNlRxfm2GgBwFhD8tpf5zJ5xRkZePDQzFv+tcIOHd/wO1dROSAtXhxhlKRrvT35+W3pmrp3lzNMmJNa/5tldPaziwmMijeONF81Cjg70tQRxjh7F7uQs1kDKJ+ekWP1pa1JFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mcud/qhJpljdbjPwtApNDzmwotYsEHs7Q7isGPtEHG0=;
 b=QgUta9F0bdOcu+w3XakpVjcfIfS4LXwBCruL1kzpMsePA9F69SZ2vCsPL3r3V21c2cJvMZOrzeCeYCkPugvAhp6ghANa9orbCVvFkHA606wcuT8jGEPVSW5Mjk2cBQKzZuT9byD7lXHtINfXmiQBlhGAeK4TJmVyoSazWknZ4wg2KzeoQF4dy12AOaZ9W2DFCUt/CmpZ+82FgSUfui1nZwQwYfqB8o1Fiz1V1IxNZAVJtZ0tvkQQU3DXq7FARDv0gE/Jw75xLPSNZ8WDjfP7H6CxcUnPKFSEDMOsp+Ib8pecJ/kGDjgWF0HrptInMSQzkawkDi565WJjZ0dDOlG8lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mcud/qhJpljdbjPwtApNDzmwotYsEHs7Q7isGPtEHG0=;
 b=les+MVLQuoqonlsoJ5JVtybJ3DksJDNs3+UtjoFhGCki3vFtLiAkGPnKgfsUX6PqQIiWpKA08agPv4ZN/2bR4xzEPBWF4XU7iAAKMLZVkcA05uJx0UeqQOVKHuY7dPnnSHXVHY/QAn5fOS3QKrjaHvB/DeyWTqoHODa7xTBbIrY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <9200d75d-1f5a-441c-9e69-a1764eeed81b@amd.com>
Date: Wed, 22 Apr 2026 13:26:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] xen/drivers/char/cadence-uart: fix IRQ
 registration failure propagation
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <cover.1776850201.git.oleksii_moisieiev@epam.com>
 <fc65ea2c9dcc7c3bc632c8c1a9f14eeb5de6d9b9.1776850201.git.oleksii_moisieiev@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <fc65ea2c9dcc7c3bc632c8c1a9f14eeb5de6d9b9.1776850201.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|PH7PR12MB6977:EE_
X-MS-Office365-Filtering-Correlation-Id: ac9f5c77-7278-4ae2-5fda-08dea06205d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ph6PHYBDVbYcZaNyJuXdzqj0SDaSRbnUEnPfqG+D7Dnozt/ZWf172poTasf+gYOZSbOV2QpwbgASEOplIcX9V0fU07MgCSqEDBhHPF3mYPMQUhQBfOjBL6pQFSna95h4CuwYKsekgWNkV2unL7hDH6DXcSMGImePrebS1UTXi5KMlatDKhUxR7uy0fteXIe0FI191MaPQPW8JQZBF97d93DGOKtF5YoOAdywpVNiFk5lh76zZ+efRhNbCTC7VqU5NybT5FVonLy4DN4EIT5U+baHdDbOosikXB+qa4pKers9hJbWvi25iqi0R+COg45Mxkk9UaGiIeOgi4Q9kMVFCdXKnvhxpsTJRoTsmnj4RBj+uwaKtjl5pplsbHJNCbJMmXeYpuLUm5Geg/hEiCM0SQNNNjYenZMNLnwjVBDatfWou+4ETF9pLxIppfuZvPBLQWHsNFbRreb6s+qVw/YFDSOKpAS39SfSK0CuGa8P8eUdXHu/yYZguvxX0ZrH46MHjx9iQzTvcQ3o42Mc0pwgkbq2Vf7wHh0QAhydCHhZve1hxoUBwE3c9Gpwyn9Nsdu4nMYDOqWBEmcaf7CHaXXcl5wtAZ4QxmqK78dQxlQNJzqspO0LiQGuL/HvnOWGmFN8LJlbyTpDU3G4uAxdrYGJDYftBFk/ifRoAE9SzR4ZCWJMqob7vn4gDDfNVViOINbmDzvO0ylDLNQTVhaV8yAEuhB7R2ZjLGX9vneFMMCt9Hknbau+8NCwhlYwR0IDePUh98xvUacS19PDWp0Q2c2ZgA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	z41JlxH8iIhA7kpleMFgCoJPlVnYVWYsNeA8sJsrlbfUkAdaT6RmMCzb1WMwIagR1x4Ea1+DlF36sTqo0+n4lNP0mleWMLDAgoCGkAV2NqpPt7Km/8aYh7mBqhC1LBBQJcSAVsoufUxnz/Mg4R9oKx1JgESHrCPFJoMLo9MaPV4uG+plVIVULhfhGNO2jAzonNI46vDsCxcU8w2PKGMHZtu6JEgJM1dnLB2/6fVthwu80H9cNf25S5AAupP949RuqzS/KLqx+2OuOzggucnZHKkSyveQi28JSbdY/8VYGWUgYfiXQf2czNYcQGLxTZDs8rCnYZjZYAOFZ/xg9Utas+2+RCI0gk72jo7yPGq6zJHjrjCEECChGKXlvTM9HOh7j/UQdiUjO92jKqPNid6Jq8830VyvPNsu3ULIWA4iCQJh8xP1aAmPl51YUEJmRTPC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 11:26:39.7930
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac9f5c77-7278-4ae2-5fda-08dea06205d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6977
X-purgate-ID: tlsNG-4011c0/1776857206-CF1728B7-0E295FA9/0/0
X-purgate-type: clean
X-purgate-size: 1032



On 22/04/2026 11:33, Oleksii Moisieiev wrote:
> In cuart_init_postirq(), two code paths could reach the
> interrupt-enable write to IER without a handler being registered:
> 
> - When no valid IRQ number was provided (uart->irq <= 0), the original
>   positive-condition guard (if uart->irq > 0) skipped the irqaction
>   setup but still fell through to the IER write, enabling the receive
>   data interrupt with no handler installed.
> 
> - When setup_irq() returned an error, only an error message was
>   printed and execution continued to the IER write, arming the
>   receive hardware interrupt line with no handler to service it. On
>   platforms where the GIC receives this asserted line, the result is
>   either repeated spurious-interrupt warnings or an unhandled
>   interrupt fault.
> 
> Restructure cuart_init_postirq() to use early returns in both error
> paths.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


