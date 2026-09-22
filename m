Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB96C982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 14:24:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428972.1651890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91QG-0005WB-1k; Tue, 22 Sep 2026 14:24:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428972.1651890; Tue, 22 Sep 2026 14:24:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91QF-0005W4-VH; Tue, 22 Sep 2026 14:24:39 +0000
Received: by outflank-mailman (input) for mailman id 1428972;
 Tue, 22 Sep 2026 14:24:38 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1x91QE-0005Vt-Db
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 14:24:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x91QD-004mzz-Qd
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 16:24:37 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ab28fa4-2eae-0a2a0a5409dd-0a2a4507b324-8
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:24:37 +0200
Received: from [40.107.209.53]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ab28fa4-b4ea-0a2a45070019-286bd135b5b7-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:24:37 +0200
Received: from BY5PR04CA0029.namprd04.prod.outlook.com (2603:10b6:a03:1d0::39)
 by BY5PR12MB4241.namprd12.prod.outlook.com (2603:10b6:a03:20c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 14:21:16 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::af) by BY5PR04CA0029.outlook.office365.com
 (2603:10b6:a03:1d0::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.13 via Frontend Transport; Tue,
 22 Sep 2026 14:21:16 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 14:21:16 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 22 Sep
 2026 09:21:15 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 22 Sep
 2026 09:21:14 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 22 Sep 2026 09:21:13 -0500
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
 b=QM7IjKYQmg36TzDvXvKkLC45Y9vky9ixpDSotiVQRHrthWcWhfqu8Owk80Nni7198fWbfotkkF5mGW4GseWNnZDhoTyvHcAwCJO3dW7xsI2K99PqriZpZ4Vro2t4iuHj1w6lafbBFRlWSSti6BqIyLf62lk1B8GeZ7CmS4z2sgedbqxZgam8LIvtjSbwbdr5FVMamxobBsowd4I2D/fZEEVe22vgfpwNcIBiZzzpVihg9htAhWxJ8UtB07ouFAFF0qX89lwsBMkMLIRXqEwDUmY5EeoHnFVFisyuC7UtGOZyk5M3EDBrlHzpP79dsYQRGWT5LKTU0shKr1wryG0ViA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UOcZmDEQVFh+hFHW/y8ILASHFQwfF/paE8y4vWUmMtM=;
 b=Mt0bVn8Gq8AonSFpOrEFJGxvq5zm21i/Yv7HTdKGa0hn8rYctMfjiPv2bS66QaAhV3n5K74Ag59YcMRLV5caEePZ/FIErrdO3b/iDHZHcwNE5DjUAREFZVfRIu4kDUZM7ZiYd7qWjzhU+xuzCekhTMrTo5RA3HXyvOaOlo3B+XkQrevYT7exMh2uTMh4sDdWxNLEhYm7ZuR2B0S4m/v+Wlyl4UfYkb0bMyo1AbN4udjw3lrjc8rYrvVkPNEECttT+ZEHso0ND7MhsZD5X8jsUIIQnKrh4A9RUIDFc6tekKBPZ6+UolZaF9E70rAx+UK1CYOVP4DYvu+jZSaG+3jVCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UOcZmDEQVFh+hFHW/y8ILASHFQwfF/paE8y4vWUmMtM=;
 b=NApspWGFcVugzmVdINiEnGV+ZnoPF6rhpH5AUsSXOMgrmXZ+Jhhpr9IaNOdQxFXCjrEB+7l9QEDV3fod1l3LIQJ9QgaZ0Sib8JbWBQSzzS+Jgi0SZ1+3SK0ClzB1dgWkuIi9Y+9fU2JGUEO7FgxIizAV3kVFk8PzRkRMGnUqenI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <bf6c4358-32c0-4f9e-8122-8e2c298a6377@amd.com>
Date: Tue, 22 Sep 2026 16:21:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] xen/arm: vgic: free eSPIs using the bitmap index
To: Mykola Kvach <mykola_kvach@epam.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <cover.1790056623.git.mykola_kvach@epam.com>
 <eb8e52ee6c227f0fd7d059d1ddfd0de6eec45fe4.1790056623.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <eb8e52ee6c227f0fd7d059d1ddfd0de6eec45fe4.1790056623.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|BY5PR12MB4241:EE_
X-MS-Office365-Filtering-Correlation-Id: 068f67e8-5f4c-4f7c-f67f-08df18b4c3b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	otcUTWCkJczJGzMyAc1K+5olLoUXhcKjfG6+Grn6LaILynUhZHwf47niGoIIUWRcejDPTaaIcPiLqLTJ/WP7j88q5+2eY/2ds07FTRa0sQMbbS6462tvt8tokFgh/a7jBZI2fWthr8SHl/GPSh6Qg2BGYtTgBroS2VeklVxhdVKVpUrbk3Q0XbfjJJUUxbOpXMjiltZzcMYtl84jRrXq/+biqHza29/q1pxWel20AxFScJ9d8Sx0aF80OpZEPhpTXFXoL7iP2yAaypW/kd9kPMiU/HLK6ISb00RIO6cwjNM5KYFaQ/9H4WFNTCzvbUfcz/tWY/Cpq7HAPvx7PkuCx9I4J6BJgTb5MO9wVM/maP/oC8YITyXYn1AvqOIlWdjm3m+ZwqNVps7AnmDjz6n/i90T4SNNHbLbXwoSMgbk4z3nOUnhfdPU+jl1NwnubRWG2UcLKn8ryHnGlwoc4fq322LDWmq3EKy61K2yt9lk9wXzC6ul3rQCPr2sy+IdZOcsPbjT/sxfzSfNKTmGo+A1/ACy/0RSExht3iyC3zJU7N8xnf8BK2C9mV4B1oKBYaWWOz1fQFfDkfFVNjOxLUK7ZqPFdDGCBk4wS9pvoXyNk/etKPBBYXrU5INIKkmoBpOX6indV84BfijPG7oVI4lyr+OSQ40A49P41TK1XcvBprh3hu4qQ/3trU3N4YFp+3TIecdGSJGBg3zmFPvr8jPlQQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	915P4r3qnPyh8r8Q3/c21yEu3kUYKF6d+CKa5naiRM2IDILqJkqKEj587dBEK8jNOJXCPGl2ZyPY9pyhmG//1FtRK9+vo6PB4yeb4izhoYdg2RHKcA9eIaO9s3tp3fkb06Pho57PbqM0t2DUVj72clLuzuj09wRZHiOEiZadyXniDLP02YZPwHJvjabNooL7O0tPtoFWVT0LKoqgnCq5qnFZ14K8a05BXYVvVl/AlsR0YGlPplv6xFOeP5ZcId9Gjt3e4laoYnOUn5mD5YtWk3CjCn9AEmNl5Xa33tGHARoVwOc42jUg07tB4WfLpg3G/mFKBHN2iYj+4d7l1nPe0b1Tv5D/NxO5aiOOoUvg1ElCJRRdl3IDxNwJgOMh5lIhWwy2s2gAJbN0vT4h97vWeMAX4L8FjYOgvWTG50VI5Nt21THG+F3jyJjta4qFQ+dH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 14:21:16.5342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 068f67e8-5f4c-4f7c-f67f-08df18b4c3b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4241
X-purgate-ID: tlsNG-ef75cf/1790087077-350CDAE4-2C924FA1/0/0
X-purgate-type: clean
X-purgate-size: 895



On 22-Sep-26 08:39, Mykola Kvach wrote:
> The allocated_irqs bitmap in the existing vGIC implementation stores eSPI
> allocation bits immediately after the regular vIRQ bits.
> vgic_reserve_virq() converts an eSPI INTID to this compressed bitmap index,
> but vgic_free_virq() used the raw INTID.
> 
> Freeing INTID 4096 therefore clears bit 4096 instead of the first eSPI bit.
> This writes beyond allocated_irqs and leaves the intended eSPI bit set.
> Valid eSPIs reach this path during DOMCTL bind failure cleanup and unbind,
> and during vPL011 teardown.
> 
> Add virq_to_idx(), the inverse of idx_to_virq(), and use it when reserving
> and freeing vIRQs. Validate a vIRQ before clearing its allocation bit.
Please also add this validation (just vgic_is_valid_line() guard) to a new VGIC
vgic.c. It's eSPI agnostic and we should keep them in sync if possible.

~Michal


