Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4F4606A31D
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 10:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=SEsnxL3y
Received: from list by lists.xenproject.org with outflank-mailman.1459105.1671176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKCrX-0002sP-Nm; Fri, 23 Oct 2026 10:51:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1459105.1671176; Fri, 23 Oct 2026 10:51:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKCrX-0002sI-KU; Fri, 23 Oct 2026 10:51:03 +0000
Received: by outflank-mailman (input) for mailman id 1459105;
 Fri, 23 Oct 2026 10:51:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xKCrW-0002rq-0p
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 10:51:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xKCrV-005Jxi-5d
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 12:51:01 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6adb3c05-8faa-0a2a0a5109dd-0a2a4501b008-20
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 12:51:00 +0200
Received: from [40.93.194.21]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6adb3c13-5984-0a2a45010019-285dc215a7e8-4
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 12:51:00 +0200
Received: from BN1PR14CA0024.namprd14.prod.outlook.com (2603:10b6:408:e3::29)
 by DM4PR12MB8497.namprd12.prod.outlook.com (2603:10b6:8:180::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Fri, 23 Oct
 2026 10:50:52 +0000
Received: from BN6PEPF0000006F.namprd03.prod.outlook.com
 (2603:10b6:408:e3:cafe::72) by BN1PR14CA0024.outlook.office365.com
 (2603:10b6:408:e3::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.19 via Frontend Transport; Fri,
 23 Oct 2026 10:50:51 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN6PEPF0000006F.mail.protection.outlook.com (10.167.248.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 23 Oct 2026 10:50:51 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 23 Oct
 2026 05:50:42 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 23 Oct
 2026 05:50:42 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 23 Oct 2026 05:50:41 -0500
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
 b=PscDW/IjrTHDc0Cp8Cd0HXiWAvYeVVS8u8o8K3gqyl0uh7BKR8C8xOjodkXLvkqD3EhjJFtBINiDtyvzbiLvdUMhcyHraVTz8VVBfhWKb3aobVuv+ZQpt5SMLttZBm6A0VgQ1ukREByr+gAhyplZuSrUuUNKCuLhGwuLsrALniN+6orqlFR1qkGd5XzJW56qX7j+XMb2X8E3kZ4lyRR/CNCt1NWGkHNs6qJGWsvWF+TTVjUBO8QO7h1Q/zcsrBYWiOGDnBqb/AsCoPebhUx/ekIlqBkh2M5UFzs0iMiEG9JvSjx8yyBIE4s32MZG1olUTmGovD2TyhFIO6nBZalNMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7De5DrU5rp2otcZmYE96HsjyySabRs7G0qpdpG+urc=;
 b=CyOw1xHE0KGkHB3Ki4HdcWZOqhBTPa9hO2iZlLcz1X/Xej+m7YUDOmN9ivQqG5BFp+bkjvNJQDOq4fE0pDdSy16JRPDt510frFf7wprz10h+jZ/wVin2inleG+Cr/l325NxvE1DoMLhxNm1bYTxNyFSFgy2GH9oLWeAKRxUkH/ZdWM3da7TlERKQ/l6Fk2zq3zTzwAKSLw4kjofdo8Qie996Rt8G362RKS6obg03fvREPRq/xAn6jufDsLqZIe7B0B8ksbk13uQwWfeQYh61bY17/T/5ERuZgWhR+AV1dQS+gNdlZXWzjpZUAI2z+RX/NQ8ysTasJvfxqaIq7Y552g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7De5DrU5rp2otcZmYE96HsjyySabRs7G0qpdpG+urc=;
 b=SEsnxL3yV5Qc6mkYIu67Ytld3ciUJaXDsgL0ksPx/ngXs+TSzNdkEvURmuLBzKWvt1+9avL2ZjPRWmbu4P1Z/tjHRdMHrDGT7yktgOtV+LLEDo4qk7I9enISuhZp/kBFePebIEpZRFwjU7bhqQeXnydP75C+64juXhh3uA2EkOo=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <9ea319f7-ad39-4955-a284-9092b63767b3@amd.com>
Date: Fri, 23 Oct 2026 12:50:41 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] xen/arm: its: initialize host LPI state before
 activating ITSes
To: Mykola Kvach <mykola_kvach@epam.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <cover.1790707009.git.mykola_kvach@epam.com>
 <0afac276107d8b2a170489950d75e611c69a599b.1790707009.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <0afac276107d8b2a170489950d75e611c69a599b.1790707009.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PEPF0000006F:EE_|DM4PR12MB8497:EE_
X-MS-Office365-Filtering-Correlation-Id: 7677b5b6-6af5-4f34-25af-08df30f38173
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|6133799003|22082099003|10067099003|18002099003|3023799007|11063799006|56012099006|4143699003|261009223027099003|261022105027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	QQGJ304u7EOeUTOyIIZy2fMKkKxLHLQhSa6EEKCFLqhHR37Sb7lKmD+ogi0SHAxXi6vPoIDd0n3u4zLM9YW6Ub6y21/9ouS/pel4Gxu2GYSxoPdbE3q2sj7aqjXsZMSnqJmKzFmZ+PiALlOC/GeKc/o6dmfQCbucJfoairiul1ZCCL7YK0Aq1sBunf4jnRjz0SLeJLnSGmX46o2pf1SLwHmzkHclJuLFPhYzBlK9rETWYGOsK9w9rgVzdeOP4qxLoszaDcZyzIeIQw9O2UWMIxsNfWadKIswuz7X5oD4Ij8UIrbz4KknuYwKib0UGh+zyOATfRUUmeFOEtalHf6A5BvWD3vzvbRDaZ2jzWiuxXT2O/SJRm1o2zRTXBrB5Oa1pNNDMts10ICGKWzmcZ4+PkDeoaf58STeAJ75RnQKdrBYEo8ObXoJ1CexI40y2mMjvZqHUHDFUyZ2OaYDFA/c8+8ji0KZEVdeo+MEynAtNw0YVyh9/zBAA42JXssVAkalSJ5Jp0VYlaBW7WYuSnop6DYVGKK21smA19w1nvMbj4Zj4ITc4ldhxCajRTwrYsS64kECxhzogNNSXp6veZVO3oPf1HxgVWrei4hIb77EHFYdmRlcw8ZIfTJPyKW5JHBolsGKi3gB6U/l8qMRY+s0X3wnJABpux4tB63ufU5H9zxMZLeQJxNCPmXgQq3/kgHbDCm8qFjCikFyUfQvNy2CLA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(6133799003)(22082099003)(10067099003)(18002099003)(3023799007)(11063799006)(56012099006)(4143699003)(261009223027099003)(261022105027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Pe3+QjjgYOHyVCBhwVtl3nuUhdm6EwA+HHkGDrFtvZJFsQtOl+WIK3m2ez3k7572giGvUK5qXbdpeNXbAIqhRDUQBk+thu6rhms+4fxbRYoS+8izqflEXkpE+PNzsI/htQkVd5HOvLT8iL4z2DyGXquS1eug4G1NUngNOUMdsMxjoAi7bmBsyUaF/Qf+Kpx5LUBZ4pkHij+14YENKObGPTX4LSml/MMaQD3BBpWKEGCKX8AHhWG95LHN6wkKZRYmktgAmgOJG9JfnMgqYsTvD56A0AcnaXOppIiPvexxW5LA+EjL3CEEw4sFvSHovjf/A0ktnTO/lDpvSxckATrLafmK49IllPZSQNooev+0GnfjigUqrwxylqNakIC6qpTl8BU9I9Ui7LeDEvNHzkxn1mbjjILT3RAvDioJMxKPvlrkWOOlnb1/SRxlBTZUsAb0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 10:50:51.6464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7677b5b6-6af5-4f34-25af-08df30f38173
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF0000006F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8497
X-purgate-ID: tlsNG-d62444/1792752660-1EA66757-C5325051/0/0
X-purgate-type: clean
X-purgate-size: 1169
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 29-Sep-26 21:02, Mykola Kvach wrote:
> The boot CPU pending table must use the memory attributes selected by
> ITS quirks. gicv3_lpi_init_host_lpis() is therefore called after
> gicv3_its_init(). However, gicv3_its_init() also programs and enables
> each ITS before host LPI state is allocated. No ITS commands are
> submitted at that point, but this ordering relies on that implementation
> detail.
> 
> Split per-ITS initialization into preparation and activation phases.
> First map and disable every ITS and collect its quirks. Then initialize
> host LPI state. Only after that, allocate and program the ITS tables and
> command queue, and enable each ITS.
> 
> The subsequent gicv3_cpu_init() sequence remains unchanged: it programs
> the Redistributor LPI tables, enables LPIs, and then submits the first
> MAPC and SYNC commands.
> 
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
The only caller of gicv3_lpi_init_host_lpis() is now in -its.c file, so we
should drop the stub (can be done on commit). Other than that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


