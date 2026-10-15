Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4788ACC6B33
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 09:22:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450112.1665623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHHev-0004wP-6B; Thu, 15 Oct 2026 09:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450112.1665623; Thu, 15 Oct 2026 09:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHHev-0004wI-2t; Thu, 15 Oct 2026 09:21:57 +0000
Received: by outflank-mailman (input) for mailman id 1450112;
 Thu, 15 Oct 2026 09:21:55 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xHHet-0004wC-8Y
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 09:21:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHHes-001oyC-LP
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 11:21:54 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ad09b31-8faa-0a2a0a5109dd-0a2a45029248-4
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 11:21:54 +0200
Received: from [52.101.69.133]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ad09b31-6ca4-0a2a45020019-3465458546f3-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 11:21:54 +0200
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by ZR6PR03MB752061.eurprd03.prod.outlook.com (2603:10a6:910:e6::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 09:21:52 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0496.021; Thu, 15 Oct 2026
 09:21:52 +0000
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
 b=UP1epsXQJsMccEeXHjWYMrV7uzNOH/VNmqyNfny9CndNjWOm+gq+8dGygjR/x7frXa1ns7aIWFGVaB4G/N6vbQ5ZBj3wNgUjEulr2+lMU+gj7gQpU8OvcaXNxgfC69cb1pi+AwPWkrine1r7se7+XWdtFfgj2IUWMV7jpnHMT45l26jJDyDpX8/8WUo6LL4x4DWb4S2a0utnukRV7FhhB6nQPo4L3HcpL+7GPCd+DHvqcYGdZ4LlrzLdVXWE7rVWQEYwodj/c/7BThvaeN//bKi0iynLVn6vgSy0wfsQ9adUq9FwbFyYYUg94Z2RIsZ1qaIFFc8S7kUbBpSmRU78Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUdGGyGlC1fuQOr5YIhT4OyKseeS87e5fQ3eh2GFAvI=;
 b=jDJN8dWSSOq8xmX4mo5kbPaCeenbEHmg8mhfzN79FTEoVYEiV6mPtZF2lzFd3HS7ypCGjIKor16zhXeiR0+M/ToATF3hTBVxZ6cDlJkhhByBmNYeZ0acDWUa2ZZO3v+YNmtJ2Fob90wi9LH5F0I/fPqBI/6VHZrlQgSxv3QvExExueqbtgy+o+2IryWOEpOYP99UoYb0yhsMPKnawsyu9u07BK4+TlN2aoQjNMC8s1IHQYgwyHTGas/6+AwqsFP4Ky8C16ezdef8vmjcaDkpSOi0GppEZcTuWJTtE0f/Y5Z2Qkj4a3jy/NprXPHu4nP+AuGLZoFws+CjScrtGeb3NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUdGGyGlC1fuQOr5YIhT4OyKseeS87e5fQ3eh2GFAvI=;
 b=PWKHYb0efXv7lTl6s+hzjNzJlylVUQw6Mi8Fe8Vsl1V6Syf1Fh5YeYZGxKvfn7B1ezNsUiogaKhZ0kFIbMNVECJk2hCk0wliyrqFvyeNuqBVcT9zTg+SBeGcF+qMFvnMWpyptOvfgjgrPyTI1nOnrhL66gwovX6YwKmPuTwaNThroABkL1Kcuo4H1f3PgOenbdFY8s0QeB/wWz24GmCp8W8+1rkSSRyc/VsBn9aV8KOjvEFI2Bf3kJGRQy/YZ+fq+DiZ1pExzorPSqFvpDlcBHNkUGPknCO3N+XZeqoj6HT6DDvkQ8tsb8DO4kcE0S4i/IhmmGXGMk6zoZv5GASYjQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <1a922652-0f3e-49f6-9ae8-ae08d65850e6@epam.com>
Date: Thu, 15 Oct 2026 11:21:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/22] xen/arm: smmuv3: Add support for stage-1 and
 nested stage translation
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1791328190.git.milan_djokic@epam.com>
 <6e45683f154be94e573a4a5e5d25c7efcc29fbe5.1791328190.git.milan_djokic@epam.com>
 <ef146c92-fc46-4ba6-b863-fe7aadf97b59@gmail.com>
Content-Language: en-US
From: Milan Djokic <milan_djokic@epam.com>
In-Reply-To: <ef146c92-fc46-4ba6-b863-fe7aadf97b59@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0123.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::20) To AS2PR03MB9587.eurprd03.prod.outlook.com
 (2603:10a6:20b:595::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB9587:EE_|ZR6PR03MB752061:EE_
X-MS-Office365-Filtering-Correlation-Id: 747f364a-8dfe-4974-99bd-08df2a9dbf6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|261009223027099003|10067099003|3023799007|11063799006|4143699003|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	mfRgZTqYs7IsUSsvBTNs1An/zRcoENlAp0+8jQhMdHIsQ5spNaSjOGSduyJrTDEuqkYG91LnD+WTEjNLH6BjPFFCCGxAmsXtGJKTE+LPzs+W514QRdj76NteJn+maaqa09gpOdcse6HvONCLw5hw4Fn72Du05bKbETGqLE8zxAgDJ7WABi9iStKxWlgXhKIKyeYhNXGuUnMbYQfTOTl8NzQbh+D0wyAPx5yqczkaUKlCgtvfiUsSd+I21tcdhcdPGwbNBdDm922Ak3wzoA9FsLlZZVzg9yNBPPtAPin5YpCKMckJNoStCMq7Nk+vII1CdUQkdYXAVjxWu0PVM3fnxm0qPqDtEU9UnMSI0l8rQCRuIgFAfumVVfE+sYKd7wB5uARFu8SXqYWTLoK14H3nL4B5++IVegktNjfFkZIvNrEAXiVOk+IHwQ+EtNQnyrLc48hLdCYO59liuuBIZXx9W/TV1ik9tW6FbvVSqjiRuO8vYXlcF3yeu6nRriUGieoK2j8UGiM9ZXkBjdb6luFbPuD9ps0pWEzDHZBhjVoEplTxxdUFXidnJR4YGnyRt/at8zh/jadEZ2uCKPozMsH/ZtpPY+kZFLBK11dbQfFFnZPox6Maurme2sq7ki71iVTLX+7kYhugFkfRnLmEUlETrQeZUQw20YWTuzLtOCA8SNk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261009223027099003)(10067099003)(3023799007)(11063799006)(4143699003)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bitFZEQrUHpFR2MvRFR6UnhZWi9zQ3E3a09lc2xrUzdxdE0vZVVIczd2cG1Q?=
 =?utf-8?B?T0pleTczNUd2bUd6Tlg3d21EVmc4TmxNbG4zRXArSThaeUJBakZ4QWdERnNv?=
 =?utf-8?B?UktqOFJRNC9zSW1PMnVnZnhGMjNLWjdNZUpKN0ZBUVJsYkExbHdqWXlxVHRv?=
 =?utf-8?B?d1JkTlJBRUFFUHR0UEx4S1BnWTRSL05JaHdpWkVRTEhESmNCWHFYY3kvL2M1?=
 =?utf-8?B?ZTVpMWZ2eUxoSEJld3FVNUFXNmg3cjJmVklJc0NIaG51V0pWWSs5OU9wZ2dP?=
 =?utf-8?B?R3N5VW0yZy9ReWo5NlNxNndjWmJLL2M4USsrWkM3RFFJRElSczdycFhNY2Y5?=
 =?utf-8?B?Q2V1dVBucStFUmdta3hVMFpCcVRYNlRnajNZbzFBK016cm9uMm9kWWE2MjYr?=
 =?utf-8?B?WjRZaUk0cFN0R2JCdXRYaWZMcmpzUHJaKzEvNnFEMzBjbi8zWHE1czZDaHVM?=
 =?utf-8?B?UUtVSnM4ZGlNTzZBVlU3VUVSL0hqWTJqK0VKeWZBdFJ0QU5yT0h4WDY1dTR4?=
 =?utf-8?B?ZnZmeGJvWjBGcDdjMkcreEYxTFFDWDZwbTl5SFRMMjVRbUNZTVJwQkJXclpl?=
 =?utf-8?B?T1BFQVg0OEt4cVcxcU5OaWMzTTNCZVd3Rkp2L01uaU5rdlBVbFV0NWM4NWNE?=
 =?utf-8?B?MTk5WkN5M0FELytCakIwdzU0RGFhbk5COVJoNWk0Q0lpSURxVXNjK0tUckQ5?=
 =?utf-8?B?QVNTOHJZVDdnMC9MTFZkZ2xnNndHbzJ1UEdZTktvdGlzZHRPbUN3d3IyNUNs?=
 =?utf-8?B?OGozdnFjRU12Nk5UeWwrNmJLb1FlSC9TRFB5T1UrUUVHd05aVmtYdWpJSER5?=
 =?utf-8?B?Yy9LN21WQStQZm8raGFqTU5mYkVQYk0xZzNxQ2JvSzVFOEtWMml5dkpKemZi?=
 =?utf-8?B?RHRpQmFESmcxWUtkYzhSNGN6REE5NVFHQUNUM21NTzBkODAyUXhXTWFnbmZ4?=
 =?utf-8?B?ekpoWldHKytYS3NuZThNWWJQcUIvelhVR3BVc3JOVXB3Uit2ZER4OVhFQ3do?=
 =?utf-8?B?YnBKZkk4dmtqMEhVUDVndFlBYUtwNTJBSUpWdnBrbzVmRUYvVjk0UWVtc1E3?=
 =?utf-8?B?ZHNxcFY0SVVNZXdhK3lKSmxBL01MZVNjbDlkYndtbmk1L0gwODRUQStZWlFH?=
 =?utf-8?B?bDBscStJcTdyY2hGV3RLeDB2aWt0b3c4eXo2UUdmTE51WTdGMG0zbjZud0FI?=
 =?utf-8?B?U0tkU0xaNEoxazNXa3NNc1VNZXE2RlhwU1ZVOVFDMm9DTE9XWFNhQnN3TDNu?=
 =?utf-8?B?eGIyZ2xTYzNGOG54MHRkTkNLdHRnUDl3M04vTjZ6LzBjVlpBZWhmWlhYa2N0?=
 =?utf-8?B?QjVQTTAxbFd2OFdpUkRLT0tiOHBFOTdQVjk0RmpHZVErajZOQXdsbGNhVHB4?=
 =?utf-8?B?ZU13MDRTV3Q0RjgrUWsvUTZ3dGpkSWpwN2V3Z1dYdDFUbzFjMlR6aFhSTyt1?=
 =?utf-8?B?a0hJeGFxSWEzeDhKWE5ZbzJWYWFUUTdIUGdPNkFRdEdHWUkwNTRtTE45bmpT?=
 =?utf-8?B?Z1VFZkU5MGROYWpKNWxHeHlNcURaZkd5SCszUk90aUZET2N0dVhrMW40WHhD?=
 =?utf-8?B?cXBySHNheGYrSEppc2Nlb0RFNlh2c2U0RmFwWUsrZDRDT2JXSHZla2ZKSThj?=
 =?utf-8?B?Rms0MUVxbXNrck8vSndITnN2cWVMZEk0TnN5anJNdnh5Ni9IaGFCRHUvWkpU?=
 =?utf-8?B?OGYyWktsUHk3S2dxKythWFZiaFJTTHo5K1Q1Y1dBa1h0d1NNd3BqZGJORVRB?=
 =?utf-8?B?eTZaVmR2cWd0QnRrOUVVY1VPQmR6UFRhZThZUE5zejhUUGU1K0ZNWlRPRFlo?=
 =?utf-8?B?Q2NSN2dsUDR1QmpINCs5dU92eUNBTXZ4MDF1dzBnZjYybVFiOU5kQlk2ODB3?=
 =?utf-8?B?T2trVnROQkhrQjV4M1Vra0JjMy90Q3cwcUQ5aWpTLzU2cmVNTmVCVlIwbkk1?=
 =?utf-8?B?VHRaQ3ZnTndLNGNsNnc3RWk0ajJ6bEN5Z2ViUWltWVNlNlE2bllZVG9WeXM1?=
 =?utf-8?B?NXg4c2owRkNzSHlqUUJGN240ditxRndtTnRwbVgxbHRHUUtOVFprQjFHdHFS?=
 =?utf-8?B?aW9QdC9WTFE4NnJzR01MVmgva2NyZjFWT1c0LzVxM1NWbnFwWjFLK3BPR3BG?=
 =?utf-8?B?SldCcGZHWVJpbDZGdldRR1J2V1pObWhWRWhWbDlLSjkrRWozNGRxWXAvZVlP?=
 =?utf-8?B?RENHUmg5cDBvb2c5dnpNRkhXV1hHS2cybkgxN3FPcnNvdU5teWxKQTRyKzN1?=
 =?utf-8?B?RWRQRGJiUkw4WW5WZzZvcGwvelhwekovcFNiSTdzSWN6d0FPMWNuTDBaWlUx?=
 =?utf-8?B?S0VaQVR3bFZFekZocTBtN3JqUzM4Y09teGlrMFpBeE1kZzZ5N2JLdz09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 747f364a-8dfe-4974-99bd-08df2a9dbf6e
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 09:21:52.2082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HN4WSUorQeY5ovNBkg5u2ihwLqLda8wBdaPNmlC6EPKQttNfQI5FhAP0sRwbc8tiieKWIDFRoGcpQlmc5PYiqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR03MB752061
X-purgate-ID: tlsNG-720697/1792056114-674BE2AC-A76C23A4/0/0
X-purgate-type: clean
X-purgate-size: 11098

Hi Oleksandr,

On 10/9/26 19:37, Oleksandr Tyshchenko wrote:
> [You don't often get email from olekstysh@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> On 10/7/26 03:06, Milan Djokic wrote:
> 
> Hello Milan
> 
>> From: Rahul Singh <rahul.singh@arm.com>
>>
>> Xen SMMUv3 driver only supports stage-2 translation. Add support for
>> Stage-1 translation that is required to support nested stage
>> translation.
>>
>> In true nested mode, both s1_cfg and s2_cfg will coexist.
>> Let's remove the union. When nested stage translation is setup, both
>> s1_cfg and s2_cfg are valid.
>>
>> We introduce a new smmu_domain abort field that will be set
>> upon guest stage-1 configuration passing. If no guest stage-1
>> config has been attached, it is ignored when writing the STE.
>>
>> arm_smmu_write_strtab_ent() is modified to write both stage
>> fields in the STE and deal with the abort field.
>>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
>> ---
>>    xen/drivers/passthrough/arm/smmu-v3.c | 96 +++++++++++++++++++++++----
>>    xen/drivers/passthrough/arm/smmu-v3.h |  9 +++
>>    2 files changed, 93 insertions(+), 12 deletions(-)
>>
>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
>> index 7162473d62..d3e88d5a55 100644
>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>> @@ -683,8 +683,10 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
>>         * 3. Update Config, sync
>>         */
>>        u64 val = le64_to_cpu(dst[0]);
>> -     bool ste_live = false;
>> +     bool s1_live = false, s2_live = false, ste_live = false;
>> +     bool abort, translate = false;
>>        struct arm_smmu_device *smmu = NULL;
>> +     struct arm_smmu_s1_cfg *s1_cfg = NULL;
>>        struct arm_smmu_s2_cfg *s2_cfg = NULL;
>>        struct arm_smmu_domain *smmu_domain = NULL;
>>        struct arm_smmu_cmdq_ent prefetch_cmd = {
>> @@ -699,30 +701,57 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
>>                smmu = master->smmu;
>>        }
>>
>> -     if (smmu_domain)
>> -             s2_cfg = &smmu_domain->s2_cfg;
>> +     if (smmu_domain) {
>> +             switch (smmu_domain->stage) {
>> +             case ARM_SMMU_DOMAIN_S1:
>> +                     s1_cfg = &smmu_domain->s1_cfg;
>> +                     break;
>> +             case ARM_SMMU_DOMAIN_NESTED:
>> +                     s1_cfg = &smmu_domain->s1_cfg;
>> +                     fallthrough;
>> +             case ARM_SMMU_DOMAIN_S2:
>> +                     s2_cfg = &smmu_domain->s2_cfg;
>> +                     break;
>> +             default:
>> +                     break;
>> +             }
>> +             translate = s1_cfg || s2_cfg;
>> +     }
>>
>>        if (val & STRTAB_STE_0_V) {
>>                switch (FIELD_GET(STRTAB_STE_0_CFG, val)) {
>>                case STRTAB_STE_0_CFG_BYPASS:
>>                        break;
>> +             case STRTAB_STE_0_CFG_S1_TRANS:
>> +                     s1_live = true;
>> +                     break;
>>                case STRTAB_STE_0_CFG_S2_TRANS:
>> -                     ste_live = true;
>> +                     s2_live = true;
>> +                     break;
>> +             case STRTAB_STE_0_CFG_NESTED:
>> +                     s1_live = true;
>> +                     s2_live = true;
>>                        break;
>>                case STRTAB_STE_0_CFG_ABORT:
>> -                     BUG_ON(!disable_bypass);
>>                        break;
>>                default:
>>                        BUG(); /* STE corruption */
>>                }
>>        }
>>
>> +     ste_live = s1_live || s2_live;
>> +
>>        /* Nuke the existing STE_0 value, as we're going to rewrite it */
>>        val = STRTAB_STE_0_V;
>>
>>        /* Bypass/fault */
>> -     if (!smmu_domain || !(s2_cfg)) {
>> -             if (!smmu_domain && disable_bypass)
>> +     if (!smmu_domain)
>> +             abort = disable_bypass;
>> +     else
>> +             abort = smmu_domain->abort;
>> +
>> +     if (abort || !translate) {
>> +             if (abort)
>>                        val |= FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_ABORT);
>>                else
>>                        val |= FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_BYPASS);
>> @@ -740,7 +769,32 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
>>                return;
>>        }
>>
>> +     if (ste_live) {
>> +             /* First invalidate the live STE */
>> +             dst[0] = cpu_to_le64(STRTAB_STE_0_CFG_ABORT);
>> +             arm_smmu_sync_ste_for_sid(smmu, sid);
>> +     }
>> +
>> +     if (s1_cfg) {
>> +             dst[1] = cpu_to_le64(
>> +                      FIELD_PREP(STRTAB_STE_1_S1DSS, STRTAB_STE_1_S1DSS_SSID0) |
>> +                      FIELD_PREP(STRTAB_STE_1_S1CIR, STRTAB_STE_1_S1C_CACHE_WBRA) |
>> +                      FIELD_PREP(STRTAB_STE_1_S1COR, STRTAB_STE_1_S1C_CACHE_WBRA) |
>> +                      FIELD_PREP(STRTAB_STE_1_S1CSH, ARM_SMMU_SH_ISH) |
>> +                      FIELD_PREP(STRTAB_STE_1_STRW, STRTAB_STE_1_STRW_NSEL1));
>> +
>> +             if (smmu->features & ARM_SMMU_FEAT_STALLS &&
>> +                !(smmu->features & ARM_SMMU_FEAT_STALL_FORCE))
>> +                     dst[1] |= cpu_to_le64(STRTAB_STE_1_S1STALLD);
>> +
>> +             val |= (s1_cfg->s1ctxptr & STRTAB_STE_0_S1CTXPTR_MASK) |
>> +                     FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S1_TRANS) |
>> +                     FIELD_PREP(STRTAB_STE_0_S1CDMAX, s1_cfg->s1cdmax) |
>> +                     FIELD_PREP(STRTAB_STE_0_S1FMT, s1_cfg->s1fmt);
>> +     }
>> +
>>        if (s2_cfg) {
>> +             u64 vttbr = s2_cfg->vttbr & STRTAB_STE_3_S2TTB_MASK;
>>                u64 strtab =
>>                         FIELD_PREP(STRTAB_STE_2_S2VMID, s2_cfg->vmid) |
>>                         FIELD_PREP(STRTAB_STE_2_VTCR, s2_cfg->vtcr) |
>> @@ -750,12 +804,19 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
>>                         STRTAB_STE_2_S2PTW | STRTAB_STE_2_S2AA64 |
>>                         STRTAB_STE_2_S2R;
>>
>> -             BUG_ON(ste_live);
>> +             if (s2_live) {
>> +                     u64 s2ttb = le64_to_cpu(dst[3]) & STRTAB_STE_3_S2TTB_MASK;
>> +                     BUG_ON(s2ttb != vttbr);
>> +             }
>> +
>>                dst[2] = cpu_to_le64(strtab);
>>
>> -             dst[3] = cpu_to_le64(s2_cfg->vttbr & STRTAB_STE_3_S2TTB_MASK);
>> +             dst[3] = cpu_to_le64(vttbr);
>>
>>                val |= FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S2_TRANS);
>> +     } else {
>> +             dst[2] = 0;
>> +             dst[3] = 0;
>>        }
>>
>>        if (master->ats_enabled)
>> @@ -1254,8 +1315,16 @@ static int arm_smmu_domain_finalise(struct iommu_domain *domain,
>>    {
>>        int ret;
>>        struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
>> +     struct arm_smmu_device *smmu = smmu_domain->smmu;
>> +
>> +     if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S2))
>> +             return 0;
> 
> 
> I am not fully confident I understood all the magic here correctly, but
> it appears the initial state may be broken on SMMUs without stage-2
> (stage-1-only hosts).
> 
> Here we return early without setting a stage, and the zeroed domain has
> stage-1 (enum value 0). So a new domain is left in a default stage-1
> state with no real config. The first attach then writes a live S1 STE
> with s1ctxptr = 0 in arm_smmu_write_strtab_ent(), so the hardware reads
> a context descriptor from physical address 0. I wonder we should default
> the domain to abort.
> 
> Could you please double-check?
> 

Yes, this is a valid point. The first STE write shall install the 
incorrect configuration. I will default the domain to abort when
stage-2 is not supported.

> Also, it is my understanding that without stage-2 translation the
> guest’s s1ctxptr and the stage-1 output address are used as host
> physical addresses. The guest decides where the hardware reads and
> writes. I wonder whether we should refuse this mode for non-hardware
> (non-direct-mapped) domains.
> 

Same here. I'll update the implementation to allow Stage-1-only mode 
only for direct-mapped domains.

> Apologies if this has already been discussed.
> 
>>
>> -     /* Restrict the stage to what we can actually support */
>> +     /*
>> +      * Default to stage-2 support and initialize it. Stage-1 will be
>> +      * initialized during guest config attachment, if nested or stage-1
>> +      * mode is required
>> +      */
>>        smmu_domain->stage = ARM_SMMU_DOMAIN_S2;
>>
>>        ret = arm_smmu_domain_finalise_s2(smmu_domain, master);
>> @@ -2398,11 +2467,14 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>>                break;
>>        }
>>
>> +     if (reg & IDR0_S1P)
>> +             smmu->features |= ARM_SMMU_FEAT_TRANS_S1;
>> +
>>        if (reg & IDR0_S2P)
>>                smmu->features |= ARM_SMMU_FEAT_TRANS_S2;
>>
>> -     if (!(reg & IDR0_S2P)) {
>> -             dev_err(smmu->dev, "no stage-2 translation support!\n");
>> +     if (!(reg & (IDR0_S1P | IDR0_S2P))) {
>> +             dev_err(smmu->dev, "no translation support!\n");
>>                return -ENXIO;
>>        }
>>
>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthrough/arm/smmu-v3.h
>> index ab1f29f6c7..e257de6db9 100644
>> --- a/xen/drivers/passthrough/arm/smmu-v3.h
>> +++ b/xen/drivers/passthrough/arm/smmu-v3.h
>> @@ -197,6 +197,7 @@
>>    #define STRTAB_STE_0_CFG_BYPASS             4
>>    #define STRTAB_STE_0_CFG_S1_TRANS   5
>>    #define STRTAB_STE_0_CFG_S2_TRANS   6
>> +#define STRTAB_STE_0_CFG_NESTED              7
>>
>>    #define STRTAB_STE_0_S1FMT          GENMASK_ULL(5, 4)
>>    #define STRTAB_STE_0_S1FMT_LINEAR   0
>> @@ -549,6 +550,12 @@ struct arm_smmu_strtab_l1_desc {
>>        dma_addr_t                      l2ptr_dma;
>>    };
>>
>> +struct arm_smmu_s1_cfg {
>> +     u64                             s1ctxptr;
>> +     u8                              s1fmt;
>> +     u8                              s1cdmax;
>> +};
>> +
>>    struct arm_smmu_s2_cfg {
>>        u16                             vmid;
>>        u64                             vttbr;
>> @@ -669,6 +676,8 @@ struct arm_smmu_domain {
>>        atomic_t                        nr_ats_masters;
>>
>>        enum arm_smmu_domain_stage      stage;
>> +     bool                    abort;
>> +     struct arm_smmu_s1_cfg  s1_cfg;
>>        struct arm_smmu_s2_cfg  s2_cfg;
>>
>>        /* Xen domain associated with this SMMU domain */
> 

BR,
Milan


