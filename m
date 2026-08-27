Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F51C5DF9D
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 08:23:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400393.1636053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzVOJ-000165-LX; Thu, 27 Aug 2026 08:23:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400393.1636053; Thu, 27 Aug 2026 08:23:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzVOJ-00015y-Hu; Thu, 27 Aug 2026 08:23:19 +0000
Received: by outflank-mailman (input) for mailman id 1400393;
 Thu, 27 Aug 2026 08:23:18 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wzVOI-00015s-IK
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 08:23:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzVOH-00GsUX-3t
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 10:23:17 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a8ff3e6-bab6-0a2a0a5309dd-0a2a45058638-36
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 10:23:16 +0200
Received: from [40.93.201.42]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a8ff3f3-4cb1-0a2a45050019-285dc92a99b8-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 10:23:16 +0200
Received: from BN9PR03CA0228.namprd03.prod.outlook.com (2603:10b6:408:f8::23)
 by PH7PR12MB7456.namprd12.prod.outlook.com (2603:10b6:510:20f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Thu, 27 Aug
 2026 08:23:11 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:408:f8:cafe::45) by BN9PR03CA0228.outlook.office365.com
 (2603:10b6:408:f8::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Thu,
 27 Aug 2026 08:23:10 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Thu, 27 Aug 2026 08:23:10 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 03:23:10 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 03:23:10 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Thu, 27 Aug 2026 03:23:09 -0500
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
 b=xVI5ZO19z8T2TDHj9V5yl6Cy7TCA7aTY0qHf8WdLOiqbVnUH/c9WzDt/U6XLhHI5UTw6TdZw4ukitLoT2k8RMgxSOOVhvlI1OBQ4I6nAk5W67w3ffJ4VGZoLKMABSbp6avbnAdQRTnM4DsS8K/W+gBXDHfhoW87POvaWukR5iH2nvBYGQDnwD7Efow+qMnfJVB0ozpznXwSKf1F0/FyIstB0zBAw+wMNwOuODUV1MH3EfK49SFQw3xxIS7OLblcBQmg+0/lwFDH0JXXc0Y2f5TWitmDlmlGMiujk2II9PqtDllLAdT5833eiSzncoTcnZ7c5dYfUsdwQMqR+KS38mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjoiI3jA92lSsQgwZ4R8+YsMenuPk2Dm0CBsOMgBuBg=;
 b=rZp534xfMdqiDmtFSvvGJUMGb7PjERYYPauH6da0KaPUtGrqAq+EhwlaKI/t4yQ2JOM1wlTo9WZt4a/MuJeu++iDv+QQfxIh5GwN+eU3bTfPTgYTnn3idq9kAO4j+fhzpxVCxNpi1HNuST8nwLUju+fLx4TiNIXeZEBM9Bue7XV2RCKz9VEsSkKvA7lf42oK28pCqxRuLw9BwmU9lV4K5PTwUnCT+3X/LY4GaGXOa3M4inPYj/Tufq6DL1X2X3pIysPxDhOp/4nz6LVD3bRsMms6l8BYec3RO8gj/LODks8IIHfhyTSCgTPcESQ7FBcB7dBNjPbh3+smSB4vVU1Pbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjoiI3jA92lSsQgwZ4R8+YsMenuPk2Dm0CBsOMgBuBg=;
 b=nIZC9zNov25xAZHZByyKqExNjbLL7saC/LFV1bM0of/SZOhM9S0X8aKx0A0Fsn3yq4wIw1CmxylXxZIDjIeyvgSqIUmIWlb/1IiIed9BJE9nfPUser2rrVslfq5TfuOnAI50KjrwDAbRX+3YRKYZJhJj3vzEq1Gu/1A2v/p1J68=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <4e82e859-9c0b-4467-a80c-210379a64e84@amd.com>
Date: Thu, 27 Aug 2026 10:23:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/arm: traps: report level 0 faults in panic_PAR()
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20260825062329.16762-1-michal.orzel@amd.com>
 <20260825062329.16762-2-michal.orzel@amd.com>
 <c576b8de-b149-4d60-bc7d-436e06039832@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <c576b8de-b149-4d60-bc7d-436e06039832@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|PH7PR12MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: c87a4d5c-894c-40ae-1655-08df04146e6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|10067099003|3023799007|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	N68s8D5fEP5Og5k0UpvxQD3BRNoVS3M+DkQlTaTPP0tNLUSzw44ufDoGs5kFFl8OiMkwx9KayLvVNG4u+9dM7jliy/kzElSjG4RnYMekXF4cPmWS5uviBDF68B5enscmP0zzQRqV8pMLGmOOvx2kFeQ8wz30/TLgykOT/5GWuTsp+xoSiImjsZmLLd5RgyJi55Sv70j632gJRhG5jTl9NCtOA737a9dfK7BoUolS0XasCV3K1p3ysILJ23n3DLaXQY7x69b7GgKvqeCLQ+UCddQHKp8Xq+DBufXo8qDB2qMet0oaQwkmNoImFZ0hMteOHNIK4QVfdq5OsNVbsp2F9lIACg/KvkhUQyrxHAub7s5Fe7swqER6HuuypM5yNQfTOvK3bbGNHGgbXQH60cHZ8HNaP2imlGX/xfrY5Y5u5E3qfWlpJHys/E/1VjoTINq5c21kC5qIfzKXyYLcBAffmz1EQt/ivlfuiLf3A5fKCo9UwkgD4l5qXeaZRtk8rWqDxuUdzfWBvZ1qdCGHoLftx6+HaYkj8Dl2Gzw0SFQVfO5YiuFG4IZbOHLZdZdU+V2uFFatsn/sNeptOnroDD8O9neKFoV4zaCDDy2VDs1yb6Mp6OOqIyOMKSxO5IsVsFiHORpK8DKyOoq0GqBdZbRFRRUUULZKXTehLBGb289Vpoo8OgaHxzO/9oQXd78gkhtLLrWQTclt8WWvzKx1+/ting==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(10067099003)(3023799007)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	N1F+SetQAOuLeKB3fI0FjgSSdq5YvpWg4vgQ5Es67P8LRF0pbTRKbdz5BU3dJV96nEGVukGvKmyN1ogdK9tBWhECF7Qx/oZJNHjE34v2Ige96kdCOVA8NW5Qqp4Ex/ybc1U5rAA5jULvdCS5y/EqnXeAvj8wc8eboDV/5sHT/xRKjlhkefXdwodjzbbopHMbMSfv14okR4j9j39811UReAO/4yS9uFJSUW+l59sS0veuAVXxbEihZkjAm/4+U+9O3D0oQlz1EXsDzpNqrF57mP3E7FhggKtwUvDP0lohK750zJUs7HR6I0S0hBNDvcmH28O4LGV5P759NPF5nYEZkzt5gO1v4HhxaEuTBMlvpHrn3quhkYxEuhy3aV649aDYL6d46G39+Zw1W8SLLY426EeEDo+xc0W6F5zQ0Bf4bygYOtj1Z+sUiMVhCjCdbT+E
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 08:23:10.7956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c87a4d5c-894c-40ae-1655-08df04146e6d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7456
X-purgate-ID: tlsNG-c201ff/1787818996-F70B22A1-1EC709B2/0/0
X-purgate-type: clean
X-purgate-size: 3442



On 26-Aug-26 17:47, Oleksandr Tyshchenko wrote:
> 
> 
> On 8/25/26 09:23, Michal Orzel wrote:
> 
> Hello Michal
> 
> 
>> decode_fsc() derives the fault level from the low two bits of the FSC, so
>> level 0 is a valid output: FSC_FLT_TRANS is 0x04, i.e. "translation fault,
>> level 0".
>>
>> This is reachable on arm64 because xen_pgtable is the zeroeth-level root,
>> but fsc_level_str() has no case for it and prints " (level invalid)"
>> instead. At the time the function was created Xen used only three levels.
>>
>> Add the missing case. On arm32 the zeroeth level does not exist, hence
>> guard the case by CONFIG_ARM_64.
>>
>> While at it, make decode_fsc() decode also address size faults.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> 
> Patch looks ok to me, so:
> Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> but I have a comment below:
> 
>> ---
>>   xen/arch/arm/include/asm/processor.h | 2 ++
>>   xen/arch/arm/traps.c                 | 8 ++++++++
>>   2 files changed, 10 insertions(+)
>>
>> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
>> index a3753c317fff..509040a1cdc0 100644
>> --- a/xen/arch/arm/include/asm/processor.h
>> +++ b/xen/arch/arm/include/asm/processor.h
>> @@ -521,6 +521,7 @@ extern register_t __cpu_logical_map[];
>>   /*
>>    * 543210 BIT
>>    * 00XXLL -- XX Fault Level LL
>> + * ..00LL -- Address Size Fault LL
>>    * ..01LL -- Translation Fault LL
>>    * ..10LL -- Access Fault LL
>>    * ..11LL -- Permission Fault LL
>> @@ -534,6 +535,7 @@ extern register_t __cpu_logical_map[];
>>   #define FSC_TYPE_OTH   (_AC(0x02,U)<<4)
>>   #define FSC_TYPE_IMPL  (_AC(0x03,U)<<4)
>>   
>> +#define FSC_FLT_ADDR_SIZE (0x00)
>>   #define FSC_FLT_TRANS  (0x04)
>>   #define FSC_FLT_ACCESS (0x08)
>>   #define FSC_FLT_PERM   (0x0c)
>> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
>> index 0c01f37ad6b4..dc0ec8a345ed 100644
>> --- a/xen/arch/arm/traps.c
>> +++ b/xen/arch/arm/traps.c
>> @@ -307,6 +307,10 @@ static const char *decode_fsc(uint32_t fsc, int *level)
>>   
>>       switch ( fsc & 0x3f )
>>       {
>> +    case FSC_FLT_ADDR_SIZE ... FSC_FLT_ADDR_SIZE + 3:
>> +        msg = "Address size fault";
>> +        *level = fsc & FSC_LL_MASK;
>> +        break;
>>       case FSC_FLT_TRANS ... FSC_FLT_TRANS + 3:
>>           msg = "Translation fault";
>>           *level = fsc & FSC_LL_MASK;
>> @@ -363,6 +367,10 @@ static const char *fsc_level_str(int level)
>>       switch ( level )
>>       {
>>       case -1: return "";
>> +#ifdef CONFIG_ARM_64
>> +    /* On arm32 the zeroeth level does not exist */
>> +    case 0:  return " at level 0";
>> +#endif
> 
> 
> NIT: Before this patch fsc of 0x00 fell through to default, so it 
> printed "Unknown Failure" and level stayed -1. After the patch Arm32 
> decodes 0x00 as an address size fault and sets *level = 0, while case 0: 
> in fsc_level_str() is compiled out there, so the print becomes "Address 
> size fault (level invalid)". So I would either drop the #ifdef (to keep 
> the two hunks consistent), or not set the level on Arm32.
Actually, FSC 0 means address size fault at...:
 - on AArch64: level 0 OR translation table base register
 - on AArch32: translation table base register
so I will say: "at level 0 or TTBR" and drop the #ifdef.

~Michal


