Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F94C61DD3
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2026 11:51:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1403934.1637870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x10XU-0002oW-81; Mon, 31 Aug 2026 11:51:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1403934.1637870; Mon, 31 Aug 2026 11:51:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x10XU-0002oP-4J; Mon, 31 Aug 2026 11:51:00 +0000
Received: by outflank-mailman (input) for mailman id 1403934;
 Mon, 31 Aug 2026 11:50:58 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1x10XS-0002nE-I4
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 11:50:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x10XR-00AxJ1-EO
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 13:50:57 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a956a97-e002-0a2a0a5209dd-0a2a4506d724-34
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 13:50:56 +0200
Received: from [40.93.195.43]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a956a9f-195a-0a2a45060019-285dc32b42c3-3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 13:50:56 +0200
Received: from MW4PR04CA0270.namprd04.prod.outlook.com (2603:10b6:303:88::35)
 by CYXPR12MB9280.namprd12.prod.outlook.com (2603:10b6:930:e4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 11:50:50 +0000
Received: from MWH0EPF000C618E.namprd02.prod.outlook.com
 (2603:10b6:303:88:cafe::ae) by MW4PR04CA0270.outlook.office365.com
 (2603:10b6:303:88::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 11:50:50 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C618E.mail.protection.outlook.com (10.167.249.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Mon, 31 Aug 2026 11:50:50 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 31 Aug
 2026 06:50:49 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Mon, 31 Aug 2026 06:50:48 -0500
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
 b=qiTBVenv9iqz317eTf+0DUVd3Jziv0MKO/Z45bK5RNiXsnRPD4BsfEv30bWRKf4M6tnk6Yct8ayIEdmgV9anWlIKya4QsYiphA7aJ08Bzkd1Fs/4vIpZDTXwApUXEOFs6abkqzIogZPt+R+oYaKNu1lIksCWpcd1ZyVNrXpszvoVSuWOmnouLiepTQZ5jhX4y22+QCcGK3nMDizdqU8Bbj9EMBmgGsJf3ynz80tdhmD9x8crFgQzDrHFo112TlI1VC4nbUNmB8O+1Ow+BbWFyIgphIYqNqhVmWgQOTt8B2NFHsx3qV7/2YAZo8AovFjhuxd6ge5XAQXbGRrt8LXiIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IujtkwXMHfDFXdqwQftrHetytD5NgiSmrmc2PNl8NC0=;
 b=Q9vmasT4uUjzl7+Xh2D4dq2iz79qT2OGuDAE+3gcgEapJ0f2vzJpKdtM0O0y7pGH+f3sRDHQNovYjIqj78iCtTCDWr1JZAr38FJNvmEjrp7EgvdpGbX7SaDboS6cpgkVxtl0npMzBws0VNV2RG44NMbIFzOcmSxrMGe1K08YX2grIYCMhXcqMHptT2sgoKmZpdZdZ4uSPt5ohuxRs9EV44uQWgl1eW1yW5PNBo0cA/4tCo66RWzjmRyvhf2+4VQNAqbS3KKeqjkVW76SXKrGorWGyz4Y6Bfmyzn3ZGgpZTUaqN5uZttuO+rLfc/0GfWPLsU13P+X2AuW3u8Lz0negA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IujtkwXMHfDFXdqwQftrHetytD5NgiSmrmc2PNl8NC0=;
 b=lNXgPyW2uMkbBa+woWoyJwsWbMGgetKzzNZDldkAr760xWPlkBJCqB1Dr0kQ9VLpusgySnRqZAMactcQSMIToDKcjJTpezEo2XCX+eITeZjP2bAUYE+Gr4hPIhLJSe5jlLKXo8nPvF4bZvEPgXkV3r+hSr2EaG4a/JpvK/JB9hQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <38fdf553-ae94-4b04-b9c3-f3ebe68a10cb@amd.com>
Date: Mon, 31 Aug 2026 13:50:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Don't pad between function with x86 nops
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand
 Marquis <bertrand.marquis@arm.com>
References: <20260831095633.2834187-1-andrew.cooper3@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260831095633.2834187-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618E:EE_|CYXPR12MB9280:EE_
X-MS-Office365-Filtering-Correlation-Id: c63f6e35-6702-4f5d-5e15-08df07561ab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|10067099003|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fuTtfhwG85cSybVgNNURSnswFWPGmwDgEiGV5lkToyH6tSfQVwLzpIAGrMlaqHUG2jrMGXgL1puPsNj9VHoaUiAPXZUI60dn2fLefqJB5VdecdBANXn4Hv9DYuMC//oUjnmlN3f9YNwd1FGFCtd5U9UlWwevf3vjFngoUqXxKOS2eymma8GzFLQf4Da2bPNDTxDbH+TnbqJPHFnkbrd5BbtieCuTh8FjqrYFRD5U24rbAjprKRgcoA9UcTStKOawjymDIqJabsmHB2VEnDy4eNU59DNEEt3qlggDsWK6jlm1+dD6oH6ye0DmdZ+4S5NKCB66nXPztb2mj+ouzfpNvqqIeJXqJr0TCxus5fNx5jaHrqspW0L+FLNJPIoVXc+3n9yne8U0HjJ0vXkuj4+u6bdEqVLTFN2Wpp0SlRqYmbkgS90WCZBYWNfMMOhtzxyQ+9S+IzFS0MvoT/qUqxzqhLQw5vWqsTFFaWo4bJRbstuNrK6azIXued/GRaWYimpxtc48M/f+gfeVb9mh2LCv1+74EyXrO3qH5S8FAPDUW64WfPC7ZHnH2ldK9ujBDeseYSBnNmB8knOJjfGyXLHlKbDb36A9QvN+wX0eVsTef8Gn/TrZbfXdny3ZNbWIuzjNRBAwaTpNy9FyO7D0grUiVWgDj568SDlrbo58pkoZQX+bCdE9KubMrYkswQt+RjaFO4JOUnmyyNVQ5dlSUmYw5A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sDAdBx3aFWwZQGDLZ5V0yHtO4kP13Zq6L9J0bhhLAFTjjqX/nQHOz1FMPxXBqb/Dc83EGnS2Zz1pnhv5xfuMjI8BTCAdAD3JfJ8BJ7O1ENAZaTKNky4A1S1vT9uImWXynUfDPpJ1c+1S4XYI5aCeLorTiMs/17X21l+PafkjhbNB+IKA9bdmXgZn9J/4gmiMRhPeDr3wHlLpmXCZ822s64kjIlsg8yVtfAmxRWsQYJBRwe3wgiISpwvSwcQkGOBLK8Z+BUcS1ccJkPfWDByU+Sw2BUsJqjqvX0tvCGUzV3KdTbNCOHKeBTL020GY7uAEccwFh91Lfdw5r3adgeDnHrpKt8Mfs57Rj7bGSo3cfCtT9ie+zSHBry0XruK/DYl9N6I/5ggkfrGCGOyA8Tvl9K952ZIL/y1aqM4C7Hem63X4lBMQBwOVFviXO8amMQSW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 11:50:50.4971
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c63f6e35-6702-4f5d-5e15-08df07561ab1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9280
X-purgate-ID: tlsNG-16d1c6/1788177056-F627077B-92F972D3/0/0
X-purgate-type: clean
X-purgate-size: 489



On 31-Aug-26 11:56, Andrew Cooper wrote:
> This was copy&paste from x86.  It causes the padding between functions to be:
> 
>   a000026dd64:   90909090        adrp    x16, 9ff2147d000 <start-0xded83000>
> 
> rather than:
> 
>   a000026dd64:   00000000        udf     #0
> 
> No functional change.
> 
> Fixes: 5da0d3123c0a ("arm: entry.S and head.S")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


