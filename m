Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E67606A324
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 02:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=u64ri3O6
Received: from list by lists.xenproject.org with outflank-mailman.1467574.1676666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNhNI-0004sy-Tv; Mon, 02 Nov 2026 02:02:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1467574.1676666; Mon, 02 Nov 2026 02:02:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNhNI-0004sr-PG; Mon, 02 Nov 2026 02:02:16 +0000
Received: by outflank-mailman (input) for mailman id 1467574;
 Mon, 02 Nov 2026 02:02:15 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xNhNH-0004r4-QT
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 02:02:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNhNH-0094LF-7S
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 03:02:15 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ae7eef0-bab6-0a2a0a5309dd-0a2a4505ea3e-36
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 03:02:15 +0100
Received: from [52.101.84.139]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ae7ef26-4cb1-0a2a45050019-3465548b6a38-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 03:02:15 +0100
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by AS8PR03MB9024.eurprd03.prod.outlook.com (2603:10a6:20b:5b6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 02:02:12 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 02:02:12 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O0oyrPlFiCEdQ4sJpKyJuHMtJFCQ5ePaSCGKvJY5QeJz3ayQKNTz+dLbR5kGqmN9JQtCm2eoalHbPR5tdHSuBl7pmhCAA86FjNzmM3vvSumVTs03ENLr+9YPmqs25ofx0jbebMQGXX5+/kSJ6uFzRWSzTzk//gdHVa0SP7IcEC2U2oMGwPV1kU6rm4WcUQSCN6J2XOrXdr7QkQMNNByTccbnEkq2lNyoWrP4SCMKf1cuQWmgyOwGerHv6a40oe9Cbg87KtUlgvjlZTTZz7abh1nisW8fWXzf4lv2qVTmUqbeghR+9AjsquOoD4KEqluo6u7YQHDrnq33vny6ngVUUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3Q8hsZwSvUNJdl/ZiVf2f/axqxLBBI355h9Ky3wrQ4=;
 b=F6hHNUOaT0svrg0AaauI6HmuO9qsCVa67dKZNiEqh2+X/hQfB0vtAJ9vj5ExYP8/Jlz4xpNOA8VldFsKaeCdPoZJ+XkCbhmrJGUv+LH5lQNhwXhYi4Zx2/2gcf0YAP9odjSd37krujv6yUwQ18bht1h6meNwxsfAgf4dgBwFOrvoFFIN6PdBDkob/8PrXe/hFxiEYF6v7WjxfGq7C1YIPGcYGs4f2dy4Cy4hsO0Cm3Q0/gsiuyTo8MSWztYdjvECkhjMAKmf8jafvfkbTIQlr0f/jeWapALoWnQ2m3tY7mXelJLE/TGC25NTgzjxwVDG72XcGYn13aNCiptHYLzsZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3Q8hsZwSvUNJdl/ZiVf2f/axqxLBBI355h9Ky3wrQ4=;
 b=u64ri3O6LMNwDqft4zW3MnQdjPDU6Lzhm9r+QskZa5J50de+b4K/a/YoPQ2m4zJqZdKthqttpNKReG8ILlGbv+KZPiGIp2EGfn9P2zDa7XbyYCQIz4331QHsy+D87dvZTeGYgENwUTn0GGLV3D2jiQvrjAKff27huJGU8rPHHBycmstx1K92jnYla66OzT2fhgXhzVwozn97GKIwgnr0u5YFQcD5n+ohaQWEu+9Qt92QC3kt0L3KrkQkLYuTVCAS4TdUYk8rfaS7Jt3brC/wxpcdWI7JSyfxF6h8LAFxIWqRL2FneCI7JoO08t5eaKtCzwV5PTYXCx1nHxHmpJ1pxw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <a5301bb9-9b0b-44e7-a813-7101de1d8cc8@epam.com>
Date: Mon, 2 Nov 2026 03:02:11 +0100
User-Agent: Mozilla Thunderbird
From: Milan Djokic <milan_djokic@epam.com>
Subject: Re: [PATCH v4 19/22] xen/arm: vIOMMU: Modify the partial device tree
 for dom0less
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1791328190.git.milan_djokic@epam.com>
 <9e31544f751d8a9708e1e6385da1b3ac6a438153.1791328190.git.milan_djokic@epam.com>
 <cbdea9d7-e410-4228-acfa-3600e02bb956@gmail.com>
Content-Language: en-US
In-Reply-To: <cbdea9d7-e410-4228-acfa-3600e02bb956@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P190CA0014.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::19) To AS2PR03MB9587.eurprd03.prod.outlook.com
 (2603:10a6:20b:595::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB9587:EE_|AS8PR03MB9024:EE_
X-MS-Office365-Filtering-Correlation-Id: 85d243e7-21d6-4241-5c3e-08df38854f76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|4143699003|11063799006|56012099006|261009223027099003|261028144727099003|261021121427099003|261021123027099003|261026121527099003|261026140227099003|261022105027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aug4OuBV+v3NsDEwAMpY6Xp1+RYqFuu2i+7ytEoywtrqcObtjrw6cXfBxqNV3Vr+R3IFuq8EphIjhC5fhl5IXOjonqOhKnUTBPyAp+loU2D+Ea+YbExr292X+DMWgBk8MyIp0Qk/zAv7wutHgXMUMnGjYyEkiNrbCkHSetmoB+RDXR4RsRz9fK8Fz208uZlx99w5CH9+aMZXKj9iRsaaQwn8iU2rSPzwC3zP5c0SGuq+nNDxSdcFRXcGdvO+OVpCA++uXsxf3jSB5Qc1vJZuty6WNozE3JdbACdsyR6Ul9002IpnlCZLGbcRcKxu+pLpV1/QtvmRjssawQKvs7/fbvE0mQDlAPTImqbYCEZ+rCuPjx9yx1RWUa/qSrhuoPC7YzccJGEAaeSivlsDSBI6LqNowo1ernfnL4FJ8EbhMYR2pdV+QZd1cjdUrFLORSQ5lAPLomm6yeqP4+gEJofj1/ljUJwg3JZhMWLengUwBvgzAwsxt6WcpnDknjOTsfCq8H0H97/tjcgoKxvj7T1Jyp6jDvr8o2xXdgLTUmVX1ktxfSYyXcFkU1IlPiCPalfv21ixFlRkFGwh0ZSVSvWEs/g2dk9P8oH7MpUziQ6eSTozYgObI33lMH99NrGMWZCg6Qr5OjGFPoJuIDrbGoFNvaAhrGPY+5XxzGZSi2KzMYQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261026121527099003)(261026140227099003)(261022105027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWp4b3pwVHVrdkUwQUgrbGpUQnhKdEhQa3QveEsyQUU3ZVFIQzI1bnZFcjJu?=
 =?utf-8?B?K2l3VnhvOHY5RHhocElueG9JclQzYjMzREpvU25tbWorbjRVbFVleEVvNkpU?=
 =?utf-8?B?N296aUxUdTVMYitWRUh2NE8xdUVqSGZFY3lxM1R1VGh3NEpxYmlrZ3JpbWFZ?=
 =?utf-8?B?R3B6VGhCTnRIRE1wMlEwSzNvZFBicWtzK01VTFY2Q09YNzVzczd4WGtrZ2ZV?=
 =?utf-8?B?cG56SlIyamVDNmtPVm15RVNJcy9NOW9LU3ZoaGRJWnBCMjZRUC82K1ZBbnVV?=
 =?utf-8?B?WGFhbUxNam14cGI4VitJMWh4UkFaV21xbDdBaVlzSEtVYjRlMTV5Z29JOUpl?=
 =?utf-8?B?ZEtTbUhOdTk3bGNMNDN5cnhlK1ZRYW5IYWtiZ2tzZTNnczNkOUF5V1FXQ2hl?=
 =?utf-8?B?c1duS3grLzl2THJ1USsxZDdzdGZQQVhsSjlubVd6c1VmRnNMNVd1czRodWNF?=
 =?utf-8?B?OHpmUytDL3FJZzZ3WGNuUnBMQjQvdktyb0FXR0hFRlZVWEgya2pqTDYzTEVV?=
 =?utf-8?B?SjREOWMvMyszcVQ3c2ZEd3Fia2dTVkVQazJCUU1OVGVKZUt1MFBKNTQ0Mk8w?=
 =?utf-8?B?Q1MxazFXSzZramhQMUppbWIwNFRGZjNOV3hGQUdQUGJFaDNTWEp6eUp6REJu?=
 =?utf-8?B?MndpcmNLZ2lZSVZpbXo2V1JWS212QjhoQU43TTIvVkMvV3NyUTYrQkVEbW9P?=
 =?utf-8?B?ZlU5eC9IYjBBUUNvZG1OZUJWdHBGN3BQdURTNytQOEJOczJsSnBDR0s4eWtQ?=
 =?utf-8?B?Umt5MFY3TGRtWG9GT1hlRWF2alA0RDFXYnFUNFdHOUx0RGkyODdtVm1XR1Nz?=
 =?utf-8?B?cDJqUU16Y2FnT21kOXNiYll5N2Urb1lsVEZ0RWFYRTNZZjNnZjVXKzQ0OEh4?=
 =?utf-8?B?UGdiMG9VQVpZdmN1cVRRdlo2Mm84NlVCRm9yeXhXQ2hqL1d6RjB6WVBTYWM1?=
 =?utf-8?B?dHd0MTFnQU82a01IellESjVCTzhJWk1DV0dGbnhydkpxZWF3bWVaUHlHR1lC?=
 =?utf-8?B?U2d5WVJYVTdhNTBRMEhZQm56ZVFyM1M5RzhTeWJibWdqT1RSMUdFd2Nkc29h?=
 =?utf-8?B?TzZHelhpYlJuenR3ajduWVA1ZEFTUWxpc0tOU09zNElObFBGbDhKdE84OXgr?=
 =?utf-8?B?NjU3V3VQVGpkZkNRYWdKUmxzY0RZUDJIZXZYOGZqWGNLQ3NlRmFXY3Y4VVRR?=
 =?utf-8?B?cFNIWTZOSnVrZEpBenJWZVowTmlPR0U0aTQ0YjVvc29KTGpGWUtkVUpteVBu?=
 =?utf-8?B?V0hHVHFVdGRFc2hmcURXRE9vUW96ZUpYNVA3L01EWGxveEoyYTlyV25pejhi?=
 =?utf-8?B?aVE4ZGdxUUJ3NDJwR29LeWNCd3k4cy9FOTM5VDVkdE1ONHRYbWw0cENpZnJI?=
 =?utf-8?B?NGg3ZHZPb1VuZ1hMUmY2TzFJTGRSd0dVcnpnUUNWeS9TK21PczV1Z1FrbEFK?=
 =?utf-8?B?QXV6VHBrWG5zUEY3aXEzQk85N1lCSE1MRlUwOGVWOXFtK0taNWhpZjQzenVG?=
 =?utf-8?B?aGgzMzJYNXFxU0Q5MS9pTmZVOFdaMFB1cm5aajRLUWk2WWRoR2V4YklUOEMv?=
 =?utf-8?B?NlpxcHByZENodzVQYVZsUVFiY0hVNFhXbDJNM2EzNDY3RGhOQmJieVJJY2JX?=
 =?utf-8?B?VlJhNFEvNExEZ0crcXM1dDhsM2x0czFVR1JEMWdOTFkvYlRPMnJXZTVpd2NS?=
 =?utf-8?B?TnluMEg4TWdrVFF0UWpIZFZPUFFYMnlxa0VDTE9nSVV0dXhUcW9rS29kQmQ3?=
 =?utf-8?B?cm9ESk5CT2I2V0ovU2pVbUkxSzV4anNVaXVLczd6QU1jN1loYXJuSWQ3QVRQ?=
 =?utf-8?B?UU5uU25odGZGemlGejZUU3dodVZmMkdRbWE4b0xCSDd5QWRJWm8yZ0VZMGlF?=
 =?utf-8?B?bStmZkhiK0dTbUg4STdiaTBCNWV5T011N1dTelVXNHdwTVlZb1hpeFhqY1lp?=
 =?utf-8?B?SmtwbkNmcTlBTXJKMnlIRCtCZitRdlNYLzI2elI2RW8reEVjVENtK2l1QnBE?=
 =?utf-8?B?MWNQenNTcmREdDJkb2tzeHFJZTd5NTEyNVZwOHFwM2Vld3dQU3hPVTRUMU5M?=
 =?utf-8?B?Yis0VFNVWTUrUExoR25JMVMreWQyTEc1cHIyTGtncFZLUy9tVTJFSG1SYmFo?=
 =?utf-8?B?YXJWYzJCbEJlRDFnK096OU9QMVlRL0wySFl6QmlEQmpHQzE2MFQ0ODA5UmIw?=
 =?utf-8?B?bVREU2pyVHlta0VYaWJBSlZTcDlrbUNVTm9LZWgwbmpickN0elFPL3VCZmNu?=
 =?utf-8?B?NGhRcTJBbm1GaUNET2FuSzVwaHZqTVVwVVdCbmx0QkRSSTJPMVYxRUIvbnh0?=
 =?utf-8?B?QnJ3d0I5cUdzVWpMeHhLSlYzQ0E3dytwd21HTWtvSk5tTTQxc3hHZz09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85d243e7-21d6-4241-5c3e-08df38854f76
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 02:02:12.5866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K3+OuJ/0aIvYahej+NkLCAeebEwrPKNPwNO5oO5HExFk3O44xgqAVi5m8K1Yf18C9oBUucrZTft87CjnE/9jkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9024
X-purgate-ID: tlsNG-c201ff/1793584935-247132A1-80F439C0/0/0
X-purgate-type: clean
X-purgate-size: 3685
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Oleksandr,

On 10/9/26 14:34, Oleksandr Tyshchenko wrote:
> [You don't often get email from olekstysh@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> On 10/7/26 03:07, Milan Djokic wrote:
> 
> Hello Milan
> 
>> From: Rahul Singh <rahul.singh@arm.com>
>>
>> To configure IOMMU in guest for passthrough devices, user will need to
>> copy the unmodified "iommus" property from host device tree to partial
>> device tree. To enable the dom0 linux kernel to configure the IOMMU
>> correctly replace the phandle in partial device tree with virtual
>> IOMMU phandle when "iommus" property is set.
>>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
>> ---
>>    xen/common/device-tree/dom0less-build.c | 40 ++++++++++++++++++++++++-
>>    1 file changed, 39 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
>> index fcbeb8adbd..7280bcf72b 100644
>> --- a/xen/common/device-tree/dom0less-build.c
>> +++ b/xen/common/device-tree/dom0less-build.c
>> @@ -331,7 +331,44 @@ static int __init handle_prop_pfdt(struct kernel_info *kinfo,
>>        return ( propoff != -FDT_ERR_NOTFOUND ) ? propoff : 0;
>>    }
>>
>> -static int __init scan_pfdt_node(struct kernel_info *kinfo, const void *pfdt,
>> +#ifdef CONFIG_ARM_VIRTUAL_IOMMU
>> +static void __init modify_pfdt_node(void *pfdt, int nodeoff)
>> +{
>> +    int proplen, i, rc;
>> +    const fdt32_t *prop;
>> +    fdt32_t *prop_c;
>> +
>> +    prop = fdt_getprop(pfdt, nodeoff, "iommus", &proplen);
>> +    if ( !prop )
>> +        return;
>> +
>> +    prop_c = xzalloc_bytes(proplen);
>> +    if ( !prop_c )
>> +        return;
>> +
>> +    for ( i = 0; i < proplen / 8; ++i )
>> +    {
>> +        prop_c[i * 2] = cpu_to_fdt32(GUEST_PHANDLE_VSMMUV3);
>> +        prop_c[i * 2 + 1] = prop[i * 2 + 1];
>> +    }
>> +
>> +    rc = fdt_setprop(pfdt, nodeoff, "iommus", prop_c, proplen);
>> +    if ( rc )
>> +    {
>> +        dprintk(XENLOG_ERR, "Can't set the iommus property in partial FDT");
>> +        return;
>> +    }
>> +
>> +    return;
>> +}
>> +#else
>> +    static inline void __init modify_pfdt_node(void *pfdt, int nodeoff)
>> +    {
>> +        return;
>> +    }
>> +#endif
>> +
>> +static int __init scan_pfdt_node(struct kernel_info *kinfo, void *pfdt,
>>                                     int nodeoff,
>>                                     uint32_t address_cells, uint32_t size_cells,
>>                                     bool scan_passthrough_prop)
>> @@ -357,6 +394,7 @@ static int __init scan_pfdt_node(struct kernel_info *kinfo, const void *pfdt,
>>        node_next = fdt_first_subnode(pfdt, nodeoff);
>>        while ( node_next > 0 )
>>        {
>> +        modify_pfdt_node(pfdt, node_next);
> 
> I might miss something, but ^^^ returns void, so allocation or vSID
> assigment failures (viommu_allocate_vsid() is added by next commit
> #20/22) are ignored. So the guest might be created with the host phandle
> and SID in its device tree or with a half-updated device tree. The IOMMU
> may (will?) not work and nobody is told. Should not we return the error
> here?
> 
> Also looks like the each rewritten node also leaks prop_c.
> 

Yes, both remarks are valid. I'll update ``modify_pfdt_node``
to propagate error and free ``prop_c``.

> 
> 
>>            rc = scan_pfdt_node(kinfo, pfdt, node_next, address_cells, size_cells,
>>                                scan_passthrough_prop);
>>            if ( rc )
> 

BR,
Milan


