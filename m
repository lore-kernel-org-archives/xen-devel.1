Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AFF606A323
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 07:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=h+m64Hq+
Received: from list by lists.xenproject.org with outflank-mailman.1479613.1683533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQJny-0007bI-Et; Mon, 09 Nov 2026 07:28:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479613.1683533; Mon, 09 Nov 2026 07:28:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQJny-0007bB-CK; Mon, 09 Nov 2026 07:28:38 +0000
Received: by outflank-mailman (input) for mailman id 1479613;
 Mon, 09 Nov 2026 07:28:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xQJnx-0007Xu-2T
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 07:28:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQJnw-002puz-7V
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 08:28:36 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6af1761d-8faa-0a2a0a5109dd-0a2a450cab94-8
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 08:28:35 +0100
Received: from [40.93.196.15]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6af1761c-f479-0a2a450c0019-285dc40f8d36-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 08:28:30 +0100
Received: from CH2PR19CA0010.namprd19.prod.outlook.com (2603:10b6:610:4d::20)
 by IA4PR12MB989928.namprd12.prod.outlook.com (2603:10b6:207:112::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 07:28:26 +0000
Received: from DM3PEPF000265B2.namprd02.prod.outlook.com
 (2603:10b6:610:4d:cafe::5b) by CH2PR19CA0010.outlook.office365.com
 (2603:10b6:610:4d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Mon, 9
 Nov 2026 07:28:26 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM3PEPF000265B2.mail.protection.outlook.com (10.167.23.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 07:28:26 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 9 Nov
 2026 01:28:24 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 9 Nov
 2026 01:28:24 -0600
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 9 Nov 2026 01:28:23 -0600
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
 b=T2JtxsDjt00ZHoIuLYxLsc15rYrcEY2PfL2YM5d/k4+1KH5BDc5lODMW3OxAy+Y/Q/exsnqb7fI8XCTfXhPnMB9KLB0txI1469PKZgb0r/tMsgM23W6a0FwAtV+87/ZlQ6/47x+10h17n9EJ0YtZw9ijRQ8GY5pzwkm3Mkw8ZW98FFo86A4+YbiJ3J47Ym/CTYJ8vumtneZE9kRwmdv+yEJJ4PEP4agj0ho4er97ku/j2kJJaWWKkNjW5HScp6KH/wf+LWV8kAZsLS10gSEvUAhYQvdbYOGjNq1yLwjHtpFKJd9gen/vOsPmS6nGT/5vZS7MXZL4A7tD1JM+ijg5rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oO/yYMXRhwfVA51pxWl78XPQrvWAeqcOHmglVdYhgPo=;
 b=uzIpfv3qF7g7QWyiN9/OzjEfgQMeik3uQWW/2MfNefbEGwTQiVURBDWkZkaA1mSxj2BN2Vk0Qp7TAOqZXskFoWUkBkGxICp7hk/RSpXUCmIBdqeAZnerJrDPbao/Za+VurwMYQnDDGylsVqApactu87nIrR4NpNu+bpHtrfwBa0Mr3Z9WVwJZSHhIlS2cxGZjMg7yWgpHCyWMZHx+he7HogZi2jwJSKOpDUWNzsl7ptgMCfk0GxDqpvz2UtZNiPZtsZc3hsZHi+U2GHtn1kKXy1mb6SeRq/J3iS2dOxPltqVj4X1CUMzy2eMrnPviOZr8NIjxwEPHLaIeRWBENkbMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oO/yYMXRhwfVA51pxWl78XPQrvWAeqcOHmglVdYhgPo=;
 b=h+m64Hq+VKOSQg1DjQ58hjfY+TfdgMjKZqwcQk1i5piAyMsaqiDGn3wLQ5OCHDQDlcVQTfzFR3cDfbP5gcYUQqw/rhZVr1LViuazuRopvQ8G5v18uygVAsZk14ulPTJKdjizzImPdsKFMzdaTbMLK6K58ggDPiqJ3rU/bE0qR9g=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <c5cdef09-08da-426a-b005-d73112c6b9b1@amd.com>
Date: Mon, 9 Nov 2026 08:28:22 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arch/arm: Correcting comment typos across
 xen/arch/arm
To: Andrew Mbugua <andrewprecious388@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Jens Wiklander <jenswi@kernel.org>
References: <20261105112627.235207-1-andrewprecious388@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20261105112627.235207-1-andrewprecious388@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265B2:EE_|IA4PR12MB989928:EE_
X-MS-Office365-Filtering-Correlation-Id: a0d90a64-b205-419b-a3ed-08df3e330b47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|11063799006|56012099006|261026121527099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	CgubxhGiw3xFaacFiDy2K/ANFDRDFg5uYglzf0y5uWp/GI4zYqUWuzCUZtdQBGjPkh4CEhgrs9CGFihW2WGDUMXvtFSm2oaj7VBwY7Pf6z07XqTZ9Nuwp8IdnGIQgyQ+dkC9k6/pThNqZUhUHahV8L/QFfob1Mbg46anzuN1imXyCgfGyFfLu6gaEqtHYfAHioGJBbY96y/MZWeeK2G4p8VJ1x1JLT7YPyInQP21Ah8pxK+bP6D7GKhvJQTvfv7wcQz+koS3Fj1brSu6vb9gg5YYi/3X3512FyRb1/GOv2BtU8jaWtiq9j480Wqzxw8m6hXYkS2pb9JdYxtj8xojslkQLgDnBc5JoIXQ/tTG8lMsDPaSNAKZTo0zzDxE4R/emuCB6YxJipp/RaVTE3eYCEOMNMS+2paQ1+roNuWJd5YpRTHa+SNQqVFsi3QfHMBnyw9fwgO2EjmwS68+nXXwg2bD5FTKfseuMqZfkXhTnv94EbsxgMCt/DNp7frBKLMTt3B1Sd20oqg198mQEszZBTdM3g3ILY1PhzTgEqlAnDroPkMaG8K3kM/wnIVG6xbj2+16oW+CMh44py57CyrvLhhE+sS4V0vgl9ebX9qwCnDJnlAL7YshHWu0Y835FQzc5U2dMbpadib8ZwNYrnD+hIzwV7iygK8INnielDWugp3D6g1ychFliipGYqEnr5n9Vn/u2osDviFnn3Nw9SMvbQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(11063799006)(56012099006)(261026121527099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YGcJ8eDFm0wsDp7kVeh4zUPWEVM/ul7a0F1Rv7RU6Kr3AkIUCIk6DVWfTfk58ublfM/f5q2sz8+5zJTZ0JJezTBjr35ZW3mLvZVWJg4PoXs3jLC4Us3e2o3ct2xPzQfBywR4X1V0+W6mhikaAarJRv94GGDcKQo7FS2nKZZaIcJMTOlSWbYOlVnhLmjQEG1YBgqMstoDHWM9PMpdOL7RTpDnQDD1UC0RKS6RA4QF4strIF/BHpDJEtmgpnbc+PnPwzwLe6jI3hyRhi2pH5owQYlhjxlRwQkZ83cSTH4XtGyPldlei/EAG23ux2Ft5FeYy1vUuohMais4Mre+NUHNX3686ii7vnGqFnEJPlf2aRq+HauFLNesatBcZiKH3SyWUKs8Cs5ln1T14ayODSL56/fpV28Kx+rBFLv1bse4idQd9nzNusmzDJrj6YJYCbYa
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 07:28:26.2610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0d90a64-b205-419b-a3ed-08df3e330b47
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3PEPF000265B2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB989928
X-purgate-ID: tlsNG-d25034/1794209310-032D8A5B-8AE0B33F/0/0
X-purgate-type: clean
X-purgate-size: 954
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 05-Nov-26 12:26, Andrew Mbugua wrote:
> No functional change.
> 
The below text should be put after "---", given that this is not the information
that should end up in a committed patch.

> I have been making typo corrections across a variety of files
> 
> Scanning Xen using codespell for typo matches I have found:
> 1. Xen native project sources: 3303 typos
Is this hypervisor only or entire Xen repo?

> 2. Qemu Tree - 4908 typos
> 
> Reasons for corrections:
> 1. Keeping the codebase clean,concise for future documentation generation
> 2. Just because typos seem minor doesnt mean that corrections should be ignored,
> while correcting these errors may not be pedantic I think its essential in
> keeping things claan and more readable.
I don't mind patches like this one, so thanks for the contribution:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

I'll do the commit msg adjustment when committing.

~Michal


