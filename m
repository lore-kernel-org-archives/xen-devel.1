Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BA5606A321
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 14:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=W+AT7qAp
Received: from list by lists.xenproject.org with outflank-mailman.1480190.1684151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQQVP-0000ge-Ef; Mon, 09 Nov 2026 14:37:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480190.1684151; Mon, 09 Nov 2026 14:37:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQQVP-0000gX-Ba; Mon, 09 Nov 2026 14:37:55 +0000
Received: by outflank-mailman (input) for mailman id 1480190;
 Mon, 09 Nov 2026 14:37:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xQQVN-0000gF-LD
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 14:37:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQQVM-0037fV-Qz
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 15:37:52 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6af1daad-8faa-0a2a0a5109dd-0a2a450c9fba-48
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 15:37:52 +0100
Received: from [52.101.201.24]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6af1dabe-f479-0a2a450c0019-3465c9180c39-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 15:37:52 +0100
Received: from SJ0PR03CA0173.namprd03.prod.outlook.com (2603:10b6:a03:338::28)
 by SA1PR12MB999084.namprd12.prod.outlook.com (2603:10b6:806:4a1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 14:37:46 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:a03:338:cafe::a5) by SJ0PR03CA0173.outlook.office365.com
 (2603:10b6:a03:338::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 9
 Nov 2026 14:37:46 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 14:37:45 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 9 Nov
 2026 08:37:45 -0600
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 9 Nov 2026 08:37:43 -0600
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
 b=LjQnjGCM8it9HprfObV4LSkQXVaaEsyYNET0rr8DOOz+HE4CBhJJlNFv22BLyRuUS+67M6FE3TsPq9R/h/6ncWC+pBA6keFMlEZQ+v55L1tLok3AzlWQzb8/6cFvGfjQadgHLtfENAMTmXwAs3BBWUuBxwwdOspEBW0ycKiWt04Ng4fjo7KRpOtC5N/1FI8AkpXGi+qMRPpEe5t6Tq/E8AuHbSy6/CwIsDs9ecKMfCpPmGBTKvMx/BzjKIpixy8DkS/Olq26Ccl9/tYC2tKjm4Oyd4V6VUcxDob3EP3UvXbGnw1e3Ys1ZnEfmXHdWimEtZgEAwfSPBCNmAeZiAE8Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIZU04lTnhq7EXyrBoEjHzWp+Bt1aT/8gZ7UOoxj/X0=;
 b=IE55ZUF1Qz4LUMCYvEOly2Q1q9O3SsWgl+2ByKlvLVFF1vy9JhS42z5pGHmDWNiw/wFiwZOON45Bqh0I9FLhNFkKef66t5jUf+ef01+2tlE4dpUq2RRCoor8koQWQqSjmjnjwQ4xE2bpYXi9YDQMhm1I0VEV5zjyT2spmW/apizoJx9WFY/htWNV0RWBXYYlnF9rRCcL32ffdwgWqz1+loYqT7tAE9vxSldBPqd4J2+ceOeEf/ZCH3+1YM8W7GZrUdEKm+GOfmigbull+ADrUWTZi7noAKF5U784Fw5lOlsWXQ8OnvFbrAvbv7MJpYEQukIpaIxcIogAhNyUt5UNug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIZU04lTnhq7EXyrBoEjHzWp+Bt1aT/8gZ7UOoxj/X0=;
 b=W+AT7qAprigKb83GVRMcNL8mKfpjOBqWooZs3Gr+4rrZ/bKRmnqL0w4Cb17Ij2DThUwcoYmGJuf+UqXEAghXoVTQOLzxnMQakg/vtb9+DxCsE27qHN9YmyvsYzomDHhrxCOcernU5avYQyzxeeeqnFBs78t/J7XKz/j9XdLogkI=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <e58463ae-40a7-45ed-8e53-bfb26e7d259c@amd.com>
Date: Mon, 9 Nov 2026 15:37:38 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arch/arm: Correcting comment typos across
 xen/arch/arm
To: Andrew Precious <andrewprecious388@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jens Wiklander <jenswi@kernel.org>
References: <20261105112627.235207-1-andrewprecious388@gmail.com>
 <c5cdef09-08da-426a-b005-d73112c6b9b1@amd.com>
 <CAF14T9k4nz5gdz2jvRGZ7b7Ju2nJqzETmRHr6boAZFHHpGg1BQ@mail.gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <CAF14T9k4nz5gdz2jvRGZ7b7Ju2nJqzETmRHr6boAZFHHpGg1BQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|SA1PR12MB999084:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f97c3ef-f542-4db5-dbff-08df3e6f0543
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|10067099003|11063799006|4143699003|56012099006|261022105027099003|261026140227099003|261026121527099003|261028144727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DpPgbCp+PNauLc2/sSKzXISpfiPKm51K0XB+1niJPTo4Q8dnkJuQIXluX62ryFRKdgSo0k1sEB0tNkczvxEKbuXN56WwYfHepzKsEr3HK2qnTblCu1ksfztSCuxirzNkM/OvxzYWE/iYfHx58eJzLUgqGPT8b7Hsbmr+608yz2gAD05023UrlHvqL740ZESFBXigwAYGe0Go0aOLDSytrgZJkZ69LgzV5d0GS9vETzbtzvna/aQGQreElehDAjjnBM2GZfFq2T4tlzMLGTnC1Omdc5y+T4OBubNFMtHnNSZMByttWqi1t41JksbzY9hE/hf/8cCJp+gDiMPA8iyDLGV/D1OsVCxvqoPCc7UvvubeX5QF5wEHY7x9gAwWxYYmQuxZs1L6wSbP7d2oQNzaIMTIJEZq2gTw5OUcVTLISgOD/mfkDlffX70hsglx1BgZaN3OHeKD51cs9dBb+cSQ6MPnamywOGLxBHP0AHmnxyueKo9wTd754JKgCScOkVe9sMIVmXL8283kSxfh+1YQAcHsBazM+YSZ4bmWIVj6X1pfd7DV7eLAWDVE7+dEVqEQBUvLJHyHOkoaBNMoMr3k5hAQ62UAEqedJGuC/lCJaHEBuswC251vT/7/r0wBjss2FmAsq9QsnKyJjU6ZSbK/FOcCETZE6Pu7g7tnuMQgcjt1qVI7u0OFfjkPfWxZwEsIgMPWHWiXZ01SnsJyB7pJuQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(10067099003)(11063799006)(4143699003)(56012099006)(261022105027099003)(261026140227099003)(261026121527099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TlxoAqcH4g/5n6d+YVnAbMTBUmgazLqS15mJUkNo2HRyil4yjd1gBuK1DmoROqkVdgCkwByB//0AID20q64Ir7I09KCifN3Dmt3JWMBaOgYr3XvfeYP0uNoFQ6x4CVSfD7UYasLyCxsrs8nFCjF8syKwsKfh/++Cvm47QMBUzpcoFGs4vwYUQNJnoN0sjpYuhTW/r5hvBRT43GjIkgMQEVOvPr2xI+FaaZqqz7y6G8vkewD3MF2+Yp4YOrF2DVWjCm9oox8AuTqz0m+4pWbovTEtTddNXKKyhGMKI2qsE0uxgjWBvUaWq0EzWJsydBSVO/7tdoCHRAd9mIt21N5n6qq+E1DCvbZRw/Z/TGy4Dauo2WTmo3GrF8ss84ib807sQH8UOeJQ8aEjo1qSMAN1FSL320z2/G51TONK2yzhUew7t0MsSRVAqSBjkfCj+KfP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 14:37:45.9248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f97c3ef-f542-4db5-dbff-08df3e6f0543
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB999084
X-purgate-ID: tlsNG-d25034/1794235072-51538A5B-06C6990A/0/0
X-purgate-type: clean
X-purgate-size: 1948
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 09-Nov-26 12:49, Andrew Precious wrote:
> Thanks for response
> 
>> Scanning Xen using codespell for typo matches I have found:
>> 1. Xen native project sources: 3303 typos
> Is this hypervisor only or entire Xen repo?
> 
> Entire Xen project repo - 3303 typos
> Hypervisor code only has - 351 typos
That's good and hypervisor code is what I would start with...

> 
> However the scanner can be tweaked to ignore/include areas
> such as code pulled from linux source trees and 3rd party stubdoms.
... having this in mind i.e. we don't want to modify files for which we first
require a submission to the relevant project and then to backport the patch to Xen.

~Michal

> 
> On Mon, Nov 9, 2026 at 10:28 AM Orzel, Michal <michal.orzel@amd.com
> <mailto:michal.orzel@amd.com>> wrote:
> 
> 
> 
>     On 05-Nov-26 12:26, Andrew Mbugua wrote:
>     > No functional change.
>     >
>     The below text should be put after "---", given that this is not the information
>     that should end up in a committed patch.
> 
>     > I have been making typo corrections across a variety of files
>     >
>     > Scanning Xen using codespell for typo matches I have found:
>     > 1. Xen native project sources: 3303 typos
>     Is this hypervisor only or entire Xen repo?
> 
>     > 2. Qemu Tree - 4908 typos
>     >
>     > Reasons for corrections:
>     > 1. Keeping the codebase clean,concise for future documentation generation
>     > 2. Just because typos seem minor doesnt mean that corrections should be
>     ignored,
>     > while correcting these errors may not be pedantic I think its essential in
>     > keeping things claan and more readable.
>     I don't mind patches like this one, so thanks for the contribution:
>     Reviewed-by: Michal Orzel <michal.orzel@amd.com <mailto:michal.orzel@amd.com>>
> 
>     I'll do the commit msg adjustment when committing.
> 
>     ~Michal
> 


