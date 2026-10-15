Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498A3CCA464
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 20:13:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451070.1666280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHRor-0001BU-6R; Thu, 15 Oct 2026 20:12:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451070.1666280; Thu, 15 Oct 2026 20:12:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHRor-0001BM-1T; Thu, 15 Oct 2026 20:12:53 +0000
Received: by outflank-mailman (input) for mailman id 1451070;
 Thu, 15 Oct 2026 20:12:51 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xHRop-0001BG-28
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 20:12:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHRoo-003jaF-AA
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 22:12:50 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ad13386-2eae-0a2a0a5409dd-0a2a4507acfa-38
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 22:12:50 +0200
Received: from [52.101.70.120]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ad133c1-b4ea-0a2a45070019-3465467884a4-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 22:12:50 +0200
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by PR3PR03MB6361.eurprd03.prod.outlook.com (2603:10a6:102:7d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Thu, 15 Oct
 2026 20:12:46 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0496.021; Thu, 15 Oct 2026
 20:12:46 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hi+0/QNQxM/aenGI+Xps+f1a1lqDPm0y7ebAbVlm2C3CHaUPuxps8bJd0kigEV9o5OsvyIenpgS/tmuvg5HLsXzbM4SW8sa841Py7JLBTQmdHVJ178eq3lhJm450swbWbQPKdQv4DX1WrTM+063J+4ngTtRYcSfSabq+74hd5Whc8pVv5a2ka9BrrwwCcL4kbeVWwqWK+ZBgnQ0NIuOosREd8lzWnws5cvtUwTk0vyhXSkAJ8QzRLgi+b4gtUv5floYzBlIKm7XWIME2jLCOA4R+J06oRarLqYaBt8J5eFjbyr996jU0EEFQxkvXxl7XXct3rupkpBL7KHOQe4ToQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hpymvdoUJNHPFdmRIppfSALpFY+nXbzKiJ1kKD67Fr4=;
 b=GbQl3PMwFPsLtpmqADUloYTMeqXZWFcOMABSRwTafakyO3cQEIq9ybfb/1y3gsPaTpcA+ia+hIyk9MIgQNAnOoBormqUZMyMZOdLtRvVbVpz4X8Ik2fOVuewePlz+NgNx5FXcfiTwr49gMOc9L8Ptk8bMWPfwJTk+8Mho0cDrbalGwyzBSGfIgMy2IopXtl3I6abbfb56Np+kM1OEkiMcE8V7NcfJWkD4CacPhnWaXqUsWJSjrnl4dC+cAaCsxykjpe1gHVqmkiY/w3Hff1SVzZjSHTSMM4MmRDeE2/5VdQmRKBLeAI8HAboIrjLn+UEfVtU099MOxFStEN7IZIL0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpymvdoUJNHPFdmRIppfSALpFY+nXbzKiJ1kKD67Fr4=;
 b=G7BegEVoA/yIdDivDeTcCvtiRYY0NdcJ4XQCtI51E7IlFLoU5cM0NBO+xSxUwDPmRKVZwYaOo1IZeMzrE4bJmypWyYi89qLRtiJ2r8M4Z0wVegpmzfHCVjLNGSPTZXgto7LyC8+vg5zxQlbhOb6D0DaVbe6NeXrHeMsUoPCL+JiX8ObXrl2EG4xlklJ+nseUsOQOD1dL5K6S4MGyXgcYF6ANK1mIkChwSsRd+rtiJVhUlMTTw2/J3caGvGEqFAKzfiH79yJzEhg5bWGRBjvaRYl0kTq9vhrdV+myYA95fnfTm9U7ZZ6Hm+cd8AJNncl+croR18ZaNIB9RBX+HO/GJw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <61bf8fa4-1ede-4a74-9eff-8ec8188bc1a3@epam.com>
Date: Thu, 15 Oct 2026 22:12:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/22] xen/arm: vsmmuv3: Add support for command
 CMD_CFGI_STE
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1791328190.git.milan_djokic@epam.com>
 <de962fe524d632a9bcb8a07bf07e1dc6e041edaa.1791328190.git.milan_djokic@epam.com>
 <d85d5cd1-e426-41d9-a3af-dfb09413ca27@gmail.com>
Content-Language: en-US
From: Milan Djokic <milan_djokic@epam.com>
In-Reply-To: <d85d5cd1-e426-41d9-a3af-dfb09413ca27@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0026.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5db::13) To AS2PR03MB9587.eurprd03.prod.outlook.com
 (2603:10a6:20b:595::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB9587:EE_|PR3PR03MB6361:EE_
X-MS-Office365-Filtering-Correlation-Id: b0bebc27-ca94-4e22-4566-08df2af8ad6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|11063799006|56012099006|261009223027099003|4143699003|22082099003|6133799003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	5xIy0DprifNigwPcjSmV+OFWliqi4lEt8p8EaSgRXlpANDLpyOiZeyV6sQQRyzNduJ0oQKiG7hq0h16XtPqd9GOWQv7q1ZGaVnLwIEyIPdE3sGs3BDqDqem4IliV58vxyTVlEt5k88b2UoNMfVAhznSKsDe/B5Z5iw6UZBGvFJT9Cu9FKJ54MTiipD7A7vzTFJ5aQpo7CNtfOwrk5L58We7fA/JvDj9sSAT3gqaPc0rSOuvHxp0dCtAw5VB5jHNILD8qSjqZalJHt1dc09/AGgY5mZZL1diY3Kj2s2VO3e2fZTnTUhGdJ6O5vBVpiLuTlV4e0uIGbN1Jz+IvkfRrokPnyVGOOxtDZmPmgXDxpKIzwHlcR1hX/RpSr34Lxd+zxnroYJdntAH7EV24LG7z0yHC8hJIVY2pz9D1dnml6T5gpGj/0tYLo5dS5tBpmRL9/qZu7YEHTAidPrIGiHSDNbRnsctxzZtxq/LpoxhEtb3TEWasAP4Km0Am1n0rDiV00+ZWigr9o4IAOT3XXXuqsbgshI4fxQ7xXynWl6ZmUYJ7sX7KjPNqDecsgXNGAaNQB+DHa1ORatYYpbx5KQt7MXcoE5Z6oW+7kiLIoZcnWBsyMfm2G62nt34cKg1IMfw7zevqqrHtLEe4/lWudlO1Lg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(11063799006)(56012099006)(261009223027099003)(4143699003)(22082099003)(6133799003)(18002099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDJ1cGlXWjFDb3hzUFV0OGlrZzNNR1hERnNvTExFRnE5RWJUNmhPR1FNZUpW?=
 =?utf-8?B?WmNFbU92TnltTkxFRkdxaitTTTF3UUFOUFYvY2gyVWdFRko5V2ZPOTZMcGV2?=
 =?utf-8?B?amxzL3lOVTBoak5NaHlkL3JQRlliY2RUMzFob3FFdksyc1FhUk9KYTJLSVBF?=
 =?utf-8?B?OEorV3VHdngrS2t2NWNnWm1rSGJkZHBRRXVPQjJvSFNjRUhYSzUvVWt6c05U?=
 =?utf-8?B?aWxjcHEzMHQ1UWwwTHV4VnNMWi9YWU1jeUpMcHIzTWNTb0R1RW5HSmJYL0F6?=
 =?utf-8?B?Wnp1RGNXMUp0UzZ1VTlOc3VUV3R5T3Bjd05CTFNGRzVtdzkzdHhBWENZL01D?=
 =?utf-8?B?SnFxZDlNdEVkM29vRktSSTAxVFlocTcrN0wzZklSdVB1MWFDa0pWK2EyV1ds?=
 =?utf-8?B?TGEvTHZIWlVmamtRUisxaFJZTks3OS9DdTJRQkVLelltOHRKdFpVdmhxSlpr?=
 =?utf-8?B?ZmROcVFlNVlkdzRFamlUZXg4T2VCNnNGeFhEUzNIK0R1Z2luVzlreVdVcFd5?=
 =?utf-8?B?TURmczRWT0E4WnFrVm1OZENvakNzbTdmbnJNMzJMZG1rYkdacHk4dm5xY1hh?=
 =?utf-8?B?UEkwYVpVcnk5N1ZMZEFjZU4xd0ljL1ZsdEJ5bks5NVU4QVUyektqcWVIY0NN?=
 =?utf-8?B?WTFzcDZweFFJaEVCMUtQbmkrYUk5MGZOZUNTVm8yYVhNN1NtaFd1UWRrNU5s?=
 =?utf-8?B?U2dhRVhqRW92ZWZRVmxQbmN4WWR1Uk51cmcySS9odGR2bnZaNnRrT0phaFY5?=
 =?utf-8?B?ZTg0NTJUa3RJdzFKeHFyYzhqNFFTbFRiK2xOR1prWTlzSTEvcUVMdzU4cU84?=
 =?utf-8?B?ckc3aHUrbTIwcnJjSkdlZkhWKzNlenJnbTF4bk00QmlleXg2M2t6N29kV0NN?=
 =?utf-8?B?OTVweW1RYmZrTk1RVkU2NUs5Ym5kQ0Z2MkNFb2FnSGZuT1dOVWZ2cDhoQWta?=
 =?utf-8?B?TzAvTGk3SXhYL1JQK2ZVaWtOUDFiVHhWeVhmWG8yZXRsdU9JRHZkZG5ZSjNz?=
 =?utf-8?B?eDUxSHNBZnZiRTNvMkEvSmRuOVI3N1dSUXhzNFcyMFIyVUNpWFIxeVdnVjEw?=
 =?utf-8?B?clVlbC8wdjllSEVtYmFuS1htaVVGWjEvV1Fyb2hqL3NPREhQQ01TK3ZxNE9V?=
 =?utf-8?B?enhsYXEyNEdYVy81RW5lODJ2bWlXL2NZWWtwOWpTa05QNUZoK25LbU5SaEVL?=
 =?utf-8?B?RDBvWnBxSzJ3Rkg3MkdQSU5HcXd0Rzl2TC93cGhNU2NoQTVUTFluYkx2TlBV?=
 =?utf-8?B?amJIK1VJUFVzNWVob1JvN3FidHNFZ1pIaTcwYU5RL05tK29JNDRHZ2svcUVS?=
 =?utf-8?B?N0FPbi92WVI0bm9uWGp0Wk9tTFFXL2s5cENqWEFSTHprdmoxOHROSlFHMGRD?=
 =?utf-8?B?MWtKSWdzcU5kS3BPQkxhd0FoQ0orckQxNkVuQXBiWCtvak94bnh6eEhjaEky?=
 =?utf-8?B?YkNWSVpuQ2dTb0JucGdKME1TV0dvbUpQTGJIL3JFbUFiYU01S001OFVrSjFD?=
 =?utf-8?B?b0pKQ2lpeWxrdFgvbU9PUm40VEtrZHQveEptbGZiUnJGMHh5ci91c2RkNzdk?=
 =?utf-8?B?UXBwYzZvcUlIaEcrc250ejNnVktNd0RHcENxNGoxZzEzRUlaYTVmK2EyVi9P?=
 =?utf-8?B?Nk45VDM3NG9ZdnkzRHNjM3p1MW5YNlFKNitiMzZER3hGQ0kvc0hpOFJOZUJ0?=
 =?utf-8?B?Y1lYOEo2clFEM3lDQ1YzTm5YZUFRSDFJVi9Bc0FlZ3Z4aXZyWEVzb3VCZFdp?=
 =?utf-8?B?dFUrNElIdVFnRVMxeGxMRzhtYUkrWlFQT2EvREhvb2E4NGlFZjJ3Wi8rYnJE?=
 =?utf-8?B?d2I2U0pFYy90bVJDbjFTZDcrMnh5QXhtQkhEWHVZQUNpME9YQi9hQ0ZNM3lQ?=
 =?utf-8?B?K0J5UGxmUmxEcW10UU41NHZldVM4VHNZczRkTTAvWWg1d0E4ZTJXVTVnd2lz?=
 =?utf-8?B?b0Yxb3ZnSGJieWwzZzVxdXVjWm5rV2E3STRWQ3hsTVhDMUM0bHZqd05qcUVL?=
 =?utf-8?B?eHJ2Myt1YWd3RWNRMHJHdHZDZ3RmMEZwc0pQMUYwc2hQdkdTRG1nN1ptTzVa?=
 =?utf-8?B?ZGtwd2RZZkQxY0V6RXI3SDdBa1N5SDNZdjNCaVd1cit2QWwzNUQwek9QVVNZ?=
 =?utf-8?B?UC9pQzY0UXVIRzRpMU5YcGhKeHFlV3hSWlZHSzJ1Y1hhWDZ6eHBrZXN0b1Z1?=
 =?utf-8?B?c1N6M0JFeWNCL1pPSSs5Qi9lWEkvRHU4bmJBdGQxZ2MvRFh6UmRNZ2lqQUpO?=
 =?utf-8?B?c2NYNUhpUnkrdGR0dWlydnM1Sll6ZXZMREdIU2JYNGN0VmpiZUd0VG9WaG9O?=
 =?utf-8?B?ZnZyVk01Rml1eGppdm1OOFg2SEFkd0I3Z1ludC9uZ25EVnZqVDh2QT09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0bebc27-ca94-4e22-4566-08df2af8ad6c
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 20:12:46.1156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: He3YjRN7qSN93Ar8wH/h6dRpNsIwt2wrdxvnC/odqUZFv2fFp4dY9jWbfeYTztJqQpO04CKBFEOdvIa7aC5e8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6361
X-purgate-ID: tlsNG-ef75cf/1792095170-358C1AE4-81F2525F/0/0
X-purgate-type: clean
X-purgate-size: 8697

Hi Oleksandr,

On 10/10/26 18:14, Oleksandr Tyshchenko wrote:
> 
> 
> On 10/7/26 03:06, Milan Djokic wrote:
> 
> Hello Milan
> 
>> From: Rahul Singh <rahul.singh@arm.com>
>>
>> CMD_CFGI_STE is used to invalidate/validate the STE. Emulated vSMMUv3
>> driver in XEN will read the STE from the guest memory space and capture
>> the Stage-1 configuration required to support nested translation.
>>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
>> ---
>>    xen/drivers/passthrough/arm/vsmmu-v3.c | 169 +++++++++++++++++++++++++
>>    1 file changed, 169 insertions(+)
>>
>> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrough/arm/vsmmu-v3.c
>> index 10143927e7..25ba734fa7 100644
>> --- a/xen/drivers/passthrough/arm/vsmmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
>> @@ -78,6 +78,21 @@
>>    
>>    /* Helper Macros */
>>    #define smmu_cmd_get_command(x)     FIELD_GET(CMDQ_0_OP, x)
>> +#define smmu_cmd_get_sid(x)         FIELD_GET(CMDQ_CFGI_0_SID, x)
>> +#define smmu_get_ste_s1cdmax(x)     FIELD_GET(STRTAB_STE_0_S1CDMAX, x)
>> +#define smmu_get_ste_s1fmt(x)       FIELD_GET(STRTAB_STE_0_S1FMT, x)
>> +#define smmu_get_ste_s1stalld(x)    FIELD_GET(STRTAB_STE_1_S1STALLD, x)
>> +#define smmu_get_ste_s1ctxptr(x)    FIELD_PREP(STRTAB_STE_0_S1CTXPTR_MASK, \
>> +                                    FIELD_GET(STRTAB_STE_0_S1CTXPTR_MASK, x))
>> +
>> +/* stage-1 translation configuration */
>> +struct arm_vsmmu_s1_trans_cfg {
>> +    paddr_t s1ctxptr;
>> +    uint8_t s1fmt;
>> +    uint8_t s1cdmax;
>> +    bool    bypassed;             /* translation is bypassed */
>> +    bool    aborted;              /* translation is aborted */
>> +};
>>    
>>    /* virtual smmu queue */
>>    struct arm_vsmmu_queue {
>> @@ -165,6 +180,159 @@ static void dump_smmu_command(uint64_t *command)
>>        gprintk(XENLOG_ERR, "cmd 0x%02llx: %016"PRIx64" %016"PRIx64"\n",
>>                 smmu_cmd_get_command(command[0]), command[0], command[1]);
>>    }
>> +
>> +static int arm_vsmmu_find_ste(struct virt_smmu *smmu, uint32_t sid,
>> +                              uint64_t *ste)
>> +{
>> +    paddr_t addr, strtab_base;
>> +    struct domain *d = smmu->d;
>> +    uint32_t log2size;
>> +    int strtab_size_shift;
>> +    int ret;
>> +
>> +    spin_lock(&smmu->strtab_cfg_lock);
>> +    log2size = MIN(FIELD_GET(STRTAB_BASE_CFG_LOG2SIZE, smmu->strtab_base_cfg),
>> +                SMMU_IDR1_SIDSIZE);
>> +    spin_unlock(&smmu->strtab_cfg_lock);
>> +
>> +    if ( sid >= (1U << log2size) )
>> +        return -EINVAL;
>> +
>> +    spin_lock(&smmu->strtab_cfg_lock);
>> +    if ( FIELD_GET(STRTAB_BASE_CFG_FMT, smmu->strtab_base_cfg) ==
>> +         STRTAB_BASE_CFG_FMT_2LVL )
>> +    {
>> +        int idx, max_l2_ste, span;
>> +        paddr_t l1ptr, l2ptr;
>> +        uint64_t l1std;
>> +        uint8_t sid_split = FIELD_GET(STRTAB_BASE_CFG_SPLIT,
>> +                              smmu->strtab_base_cfg);
>> +
>> +        /*
>> +        * Reserved SPLIT values behave as 6 according to the architecture.
>> +        */
>> +        if ( sid_split != 0x6 && sid_split != 0x8 && sid_split != 0xA )
>> +        {
>> +            sid_split = 0x6;
>> +        }
>> +
>> +        strtab_size_shift = MAX(5, (int)log2size - sid_split - 1 + 3);
>> +        strtab_base = smmu->strtab_base & STRTAB_BASE_ADDR_MASK &
>> +                        ~GENMASK_ULL(strtab_size_shift, 0);
>> +        spin_unlock(&smmu->strtab_cfg_lock);
>> +        idx = (sid >> sid_split) * STRTAB_L1_DESC_DWORDS;
>> +        l1ptr = (paddr_t)(strtab_base + idx * sizeof(l1std));
>> +
>> +        ret = access_guest_memory_by_gpa(d, l1ptr, &l1std,
>> +                                         sizeof(l1std), false);
>> +        if ( ret )
>> +        {
>> +            gdprintk(XENLOG_ERR,
>> +                     "Could not read L1PTR at 0X%"PRIx64"\n", l1ptr);
>> +            return ret;
>> +        }
>> +
>> +        span = FIELD_GET(STRTAB_L1_DESC_SPAN, l1std);
>> +
>> +        /* Validate SPAN against the architecturally defined range and SPLIT. */
>> +        if ( !span || span > 0xB || span > sid_split + 1 )
>> +        {
>> +            /* L2Ptr is invalid; this descriptor matches no valid STEs. */
>> +            return -EINVAL;
>> +        }
>> +
>> +        max_l2_ste = (1U << (span - 1)) - 1;
>> +        l2ptr = FIELD_PREP(STRTAB_L1_DESC_L2PTR_MASK,
>> +                    FIELD_GET(STRTAB_L1_DESC_L2PTR_MASK, l1std));
>> +        idx = sid & ((1 << sid_split) - 1);
>> +        if ( idx > max_l2_ste )
>> +        {
>> +            gdprintk(XENLOG_ERR, "idx=%d > max_l2_ste=%d\n",
>> +                     idx, max_l2_ste);
>> +            return -EINVAL;
>> +        }
>> +        addr = l2ptr + idx * sizeof(*ste) * STRTAB_STE_DWORDS;
>> +    }
>> +    else
>> +    {
>> +        strtab_size_shift = log2size + 5;
>> +        strtab_base = smmu->strtab_base & STRTAB_BASE_ADDR_MASK &
>> +                      ~GENMASK_ULL(strtab_size_shift, 0);
>> +        spin_unlock(&smmu->strtab_cfg_lock);
>> +        addr = strtab_base + sid * sizeof(*ste) * STRTAB_STE_DWORDS;
>> +    }
>> +    ret = access_guest_memory_by_gpa(d, addr, ste, sizeof(*ste), false);
>> +    if ( ret )
>> +    {
>> +        gdprintk(XENLOG_ERR,
>> +                "Cannot fetch pte at address=0x%"PRIx64"\n", addr);
>> +        return -EINVAL;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int arm_vsmmu_decode_ste(struct virt_smmu *smmu, uint32_t sid,
>> +                                struct arm_vsmmu_s1_trans_cfg *cfg,
>> +                                uint64_t *ste)
>> +{
>> +    uint64_t val = ste[0];
>> +
>> +    if ( !(val & STRTAB_STE_0_V) )
>> +        return -EAGAIN;
> 
> I am sorry, but I do not follow why invalid entry ...
> 
> 
>> +
>> +    switch ( FIELD_GET(STRTAB_STE_0_CFG, val) )
>> +    {
>> +    case STRTAB_STE_0_CFG_BYPASS:
>> +        cfg->bypassed = true;
>> +        return 0;
>> +    case STRTAB_STE_0_CFG_ABORT:
>> +        cfg->aborted = true;
>> +        return 0;
>> +    case STRTAB_STE_0_CFG_S1_TRANS:
>> +        break;
>> +    case STRTAB_STE_0_CFG_S2_TRANS:
>> +        gdprintk(XENLOG_ERR, "vSMMUv3 does not support stage 2 yet\n");
>> +        goto bad_ste;
>> +    default:
>> +        gdprintk(XENLOG_ERR, "Invalid STE config type\n");
>> +        goto bad_ste;
>> +    }
>> +
>> +    cfg->s1ctxptr = smmu_get_ste_s1ctxptr(val);
>> +    cfg->s1fmt = smmu_get_ste_s1fmt(val);
>> +    cfg->s1cdmax = smmu_get_ste_s1cdmax(val);
>> +    if ( cfg->s1cdmax != 0 )
>> +    {
>> +        gdprintk(XENLOG_ERR,
>> +                 "vSMMUv3 does not support multiple context descriptors\n");
>> +        goto bad_ste;
>> +    }
>> +
>> +    return 0;
>> +
>> + bad_ste:
>> +    return -EINVAL;
>> +}
>> +
>> +static int arm_vsmmu_handle_cfgi_ste(struct virt_smmu *smmu, uint64_t *cmdptr)
>> +{
>> +    int ret;
>> +    uint64_t ste[STRTAB_STE_DWORDS];
> 
> NIT: Looks like ste[0] is only used today (first 8 bytes), the rest is
> uninitialised.
> 

Initially, this was defined to hold the entire STE. However, since we
currently use only the fields in ste[0], we can reduce it to a single
8-byte variable.

>> +    struct arm_vsmmu_s1_trans_cfg s1_cfg = {0};
>> +    uint32_t sid = smmu_cmd_get_sid(cmdptr[0]);
>> +
>> +    ret = arm_vsmmu_find_ste(smmu, sid, ste);
>> +    if ( ret )
>> +        return ret;
>> +
>> +    ret = arm_vsmmu_decode_ste(smmu, sid, &s1_cfg, ste);
>> +    if ( ret )
>> +        return (ret == -EAGAIN ) ? 0 : ret;
> 
>    ... is treated as success an no-op. The physical STE keeps its old
> guest_cfg (added by subsequent commit) after the guest invalidates it.
> Could you please clarify why this is ok. Should not it become abort?
> 

Yes, this is not handled properly. I will update the implementation to 
switch the domain to abort mode to prevent the hardware from using a 
stale STE.

>> +
>> +    return 0;
>> +}
>> +
>>    static int arm_vsmmu_handle_cmds(struct virt_smmu *smmu)
>>    {
>>        struct arm_vsmmu_queue *q = &smmu->cmdq;
>> @@ -191,6 +359,7 @@ static int arm_vsmmu_handle_cmds(struct virt_smmu *smmu)
>>            switch ( smmu_cmd_get_command(command[0]) )
>>            {
>>            case CMDQ_OP_CFGI_STE:
>> +            ret = arm_vsmmu_handle_cfgi_ste(smmu, command);
>>                break;
>>            case CMDQ_OP_PREFETCH_CFG:
>>            case CMDQ_OP_CFGI_CD:
> 

BR,
Milan

