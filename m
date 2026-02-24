Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91007E9B268
	for <xen-devel@archiver.kernel.org>; Tue, 24 Feb 2026 14:18:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1240096.1541596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vutEz-0002sH-Ml; Tue, 24 Feb 2026 14:18:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240096.1541596; Tue, 24 Feb 2026 14:18:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vutEz-0002sA-Ie; Tue, 24 Feb 2026 14:18:21 +0000
Received: by outflank-mailman (input) for mailman id 1240096;
 Tue, 24 Feb 2026 14:18:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8A/i=A4=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vutEy-0002rY-Eo
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 14:18:20 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a97afd7a-118b-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Feb 2026 15:18:17 +0100 (CET)
Received: from BYAPR06CA0049.namprd06.prod.outlook.com (2603:10b6:a03:14b::26)
 by CH1PPFDA34A4201.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::625) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Tue, 24 Feb
 2026 14:18:10 +0000
Received: from MWH0EPF000C618F.namprd02.prod.outlook.com
 (2603:10b6:a03:14b:cafe::73) by BYAPR06CA0049.outlook.office365.com
 (2603:10b6:a03:14b::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 14:17:57 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C618F.mail.protection.outlook.com (10.167.249.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 14:18:09 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 24 Feb
 2026 08:18:08 -0600
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 24 Feb 2026 08:18:07 -0600
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
X-Inumbo-ID: a97afd7a-118b-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VBJPock3sGKEZtZBwv1+ErcJX2qNdrHC97mv8a3Rcnv3jWni59PlHML6FGEHqKcIXhUWCyQ8bQcfD497k8JKk83kSZGIqlOC64ZKShYEqqMK8yrPLY5TC9qOxg73eRmvd0XuGYKlAgofkz8wBe088S1LL9GTOUZ7197og+4CaAbXMnIZgCXy5fSCKNUvE8BoOOVoSW82Gp8a8s84CoiQO8AfqQHQuksrr81Svh7RMXR92Aa1me6ah9sddxUDPK+A4guavUWA1OMV0NbC7LF2+t9YAIkwbHvWZLM72Dhlsk9hIUGOSPYmkf1SCwcFO4J5sa7cZnxGzVKjRDK7kXUcRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WhAwpyF4eVpKJr+13Ng33DywkWY82AX1hItQ16FOarU=;
 b=u5PknNkIitPjmLFnEnKrai8uyeYH17aUAGj22RlrmhOacQKXxuc/InT5kkimpqHWIZTLDq5G7fw9R/DTiEhl07BvP9cLkgx0OsJDxDNrN6ziDth2jTCewWm3xapADFyLsifw+OG6Kh4OV02kDIJDBXk0ekLl/ASlw7GrSZ/anj7O9ZIfO8rFRokCMFiSn/As0Kwlu5ZoZqX9/0+PLAVOpKavtirNBCfAt6xfZkHEFCBBtR3oIwzdY78GOy6VswYXaL8pSm1lYHqWQJ7/Kp3istVHfLG54J6ekePL0N9AMKjjWEhHjN01x8d+VMKk2Caz0etplYQq3vguWNWPzsgQIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhAwpyF4eVpKJr+13Ng33DywkWY82AX1hItQ16FOarU=;
 b=VJItD7StMvJ2SybXtMAAaWC7UsqjkxwLGQbXtXycbizzCPzmOiTMFlQMp19hrR2uzzotmtVmx7dsU140boukvpPNwSvW5LQVuUt5ecfjq3SY9WKjKIhYLe3oacUNDwtv/2iN1w2+Ki464AkCXGaAFbkZwHmvySFDwV4cYqF9Vxg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <261af40e-db79-477a-b67d-1af7428782d4@amd.com>
Date: Tue, 24 Feb 2026 15:18:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/arm: Simplify type handling for SMCCC
 declarations
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand
 Marquis <bertrand.marquis@arm.com>
References: <20260224124558.3675278-1-andrew.cooper3@citrix.com>
 <20260224124558.3675278-3-andrew.cooper3@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260224124558.3675278-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618F:EE_|CH1PPFDA34A4201:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d5279c4-972c-430e-d202-08de73af89a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d3lhMlZxWURXcDZlTWtvTU5CaXJjT252cE1KbWtPUThvVmpIQko5S0JGZk5k?=
 =?utf-8?B?ekRjem92cmpTOW1PMVRsbG5ZUEpCSXlzcWtBOHRyMHdRM2c4VXVwUVJaWGt3?=
 =?utf-8?B?aXVIcEdjK052M3haQVJVWTRaTmJISitlYUhzMHc0RFIxUUFIYWhKNWcvbEZS?=
 =?utf-8?B?QkxFeWc1bloxRHkyWmhYeDVPM3M3SGd1elAycGJQdjZNcFRqb1VwYnR1elFv?=
 =?utf-8?B?L09ocUJzSUtXMWFZa29IMUw2MklhVmFFV0czQ3dQemhjQnpjVVBCOGN2RDZV?=
 =?utf-8?B?emZ6OTFObTFFR1BQaVRlNHdwamk3a3pNNEZGcStCejRnV1doN1M5WHBqMVVK?=
 =?utf-8?B?elMxc2JHNGM0VDJEd3UzL0dwaWhLSHUyVDhsazhlQVR3NkVWS0NiRG16VzQr?=
 =?utf-8?B?QXNxN09XT04zcVBxcTFiQjF4R1hBcDRzRnorY3hncTFXTG14aU9MeUpXOHIz?=
 =?utf-8?B?WWpxQVFheTUvaXB3ZDlpMWpjNjd3Y1FwbE1Mb285TjNsVklDNHBwc2wrdE15?=
 =?utf-8?B?ODdvd1ZMeVFreW43QWhSMTd2WURTYklWZEpXWW1TUTB6RmhjVjZoeHJLRHZQ?=
 =?utf-8?B?Y0ZjaVAzUTNXd3k0UnRTRzdFVTZRaVZLb09Nd0hIdjd2aW1sZzZjZEhyQVNn?=
 =?utf-8?B?T2Q0WXpqcFI5bDVyNkhIb0hyWS9lRDY3WUxoMkRpRjRCRUJ4TFRyRG5BR1BU?=
 =?utf-8?B?NzY1QjZ6di9VRU50ZmVjVjZKOFc2OWt4dHlIb05YRHhpVkZDUGRhZjV1a3RB?=
 =?utf-8?B?Rm90WnJCS3FmOXZWRXdPOWFsZjhpQ290WXFpVHkwMlBISGwya0hNV1RqT0xo?=
 =?utf-8?B?NFVKN0p0TlV3aVBIMmRJbDVrT1g4U0NOVjJhZGE3WExpcVRHYlVBbWlGb0Vj?=
 =?utf-8?B?bDNMdmNjODVRV05KdkZla002R2xHZDd4L29VdWlyODdwMjVMMDRFcXViMFV1?=
 =?utf-8?B?S2pBS2NJV0Fva2RCNGpVaXR2NDFWUWdURUJpdlBHd2ZCYXBZbmZWdkhoU1hs?=
 =?utf-8?B?eGRpZUdLcitBV1lkZUdvQ0krajdUWStOZXZJOXNpck5TcGtjcFdBYTNudVJz?=
 =?utf-8?B?VDY2OTJkdGN1UXFtcFcvQllqeG10WGJyTWVXazVUV3NocVphNnozc3VmdE5j?=
 =?utf-8?B?azltZGltU2FvUWtPYnp3MWt6aEVkY2hQeTB1UGtwMk9FeFRsVHNjcGsrMk5l?=
 =?utf-8?B?ais5YktIQjFwaDNUV090VTdvMWltblo3VlNTRWkyWUFWMWliZnJCWU91Vng5?=
 =?utf-8?B?N0ZSREF6RHdMQmJDeHNEKzlsamYycnE5SnE3anNuN2hrR05EenBkamVONWdM?=
 =?utf-8?B?Uk0zdUx1cWpmd0hPSHFId3d5d24wVysyRHRzR0I4M1ZZd29aN0hNRWk1NE52?=
 =?utf-8?B?enA5NCtDdDJpMGh5R20xM3pHa0FGN3RJdmhhTzRHVTBIOVV4QW5xa3BoSWZM?=
 =?utf-8?B?NGtyVjlyRFZCSGpLVGl1OGZoVWtlTjVWSnFSK3JYQ3hzRHhscFpTL1h4NWU3?=
 =?utf-8?B?WlAzUG11eDVsSk9UeVBCSHk3UGI5djlBVU42anZkemQ5WmZYZlBwbEpib2lN?=
 =?utf-8?B?VlA2eDBZaUNQOWoyanppTk91RExqaUtBdFp3aXN6US9VR0t4elZHMXA2SXZN?=
 =?utf-8?B?TWZZYTQ4NGFhMjZuNkpZRUo1dExvMUZMc3ZGdUJDZ2RrM0FIVVpTWHI4MTZE?=
 =?utf-8?B?T0xrdXVXY1pDWVkzakRBTk1pd0E4bllBZ0E5dFJMTWVvZ25pZTBlYStmVk40?=
 =?utf-8?B?Z0ovUkVaY0Nnb1lVRUpmTHdaU093YWJCVDh1NFRGSzR6K1dSN0x3YVNBQjVy?=
 =?utf-8?B?R1NBRXF4MEJaMFJ5NVRLL01wSTlEaFJIVlhKOWZFck04WlJReGgrVks2Z0E5?=
 =?utf-8?B?TFBta2VyL09XYmtSS0hMTWZINmZJTlVNTU1pZVltNFZQc2JMNVFBcVhvODIx?=
 =?utf-8?B?UTJHekhXTW5GcWZmTnhFUXBRWVZ5S2JkTWpJbHhVaVoydnZQK3UySXY0dThh?=
 =?utf-8?B?dFJJM0pXclJQWVZrd09XV0JDcm84K1lXYnVNcEFCNHUzcWlPNVdVODIrWUpu?=
 =?utf-8?B?aE5jV00yMFdsYUpNNE5yMitqblA3QmRTK3VZZ09LYzhYQml4Q2VUM1BwNjJQ?=
 =?utf-8?B?MkNCUGhGdjcwSmRLc04yVlJpQU9jcU52UTZCbUt4ZDU4djJncG04Ri9HSjE4?=
 =?utf-8?B?ZGtSV2FKUlBXM2NHYndJeVo1bmFhVnYvem9nM0RleVZrOWY2dkdGeitPR0dU?=
 =?utf-8?B?b0NqYmVLYkd1cHpaMXZTd2tudVBBPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1wyV7ymCilWxx12eDDLDZfA8Sh1PLqvKKH3SNUoBbi2KjHGHvF9x5g6S4o30ZT3BWDGOlPUyeI/eMM4vaGKs8LJMJlUuE7wt3kRNWstEPVrcxE0rWaenTdvm8y8F1YjpuqlkiEcXkQJqWcKQLRVSsL19I+JExHc/WdthR9HkhnKcMTvZqByBNCVv1Hei3+hgqenMWvu1w0ZcEmpUHl7fkRS7YqZGOssqIyPScaDrfNEaYbB6gwJr+LfdG/1YCi/hWBVRnuO1Y8ixCPXq6ExsKx6CAUF5fjDe5U5eGVFdTvnbvIg0WLvlMZjdBsXluZF4ZZo1g9F1SAOwHQC1kRqgGOJ2vFhVvhJXUW0dDFFFTt3U59YjR+nYqN5HXrYd5s6R6bIaZwtY6a2rtFvB2yZQTpfl3orUUIvMTet5/NFvG68sArIUqoU3/ngYuTGN2WqQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 14:18:09.7990
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d5279c4-972c-430e-d202-08de73af89a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFDA34A4201



On 24/02/2026 13:45, Andrew Cooper wrote:
> There's no use creating a typed copy of a macro argument, simply to use it to
> create a second typed copy.  Remove the indirection, halving the number of
> local variables created in scope.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> 
> This also makes them clearly elliglbe for converstion to auto, where they
> weren't before (typeof expression not being that of the RHS).
> ---
>  xen/arch/arm/include/asm/smccc.h | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/smccc.h
> index 347c4526d12a..7e90b0b56550 100644
> --- a/xen/arch/arm/include/asm/smccc.h
> +++ b/xen/arch/arm/include/asm/smccc.h
> @@ -113,39 +113,32 @@ struct arm_smccc_res {
>      register unsigned long  arg0 ASM_REG(0) = (uint32_t)(a0)
>  
>  #define __declare_arg_1(a0, a1, res)                        \
> -    typeof(a1) __a1 = (a1);                                 \
>      __declare_arg_0(a0, res);                               \
> -    register typeof(a1)     arg1 ASM_REG(1) = __a1
> +    register typeof(a1)     arg1 ASM_REG(1) = a1
>  
>  #define __declare_arg_2(a0, a1, a2, res)                    \
> -    typeof(a1) __a1 = (a1);                                 \
>      __declare_arg_1(a0, a1, res);                           \
> -    register typeof(a2)     arg2 ASM_REG(2) = __a2
> +    register typeof(a2)     arg2 ASM_REG(2) = a2
Here you fix the issue introduced in patch 1/2 :) You drop typeof(a1) and
replace it with correct typeof(a2).

Provided this patch is rebased on fixed 1/2:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


