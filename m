Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622D5CC6B33
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 09:44:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450147.1665660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHI0V-00034a-Mm; Thu, 15 Oct 2026 09:44:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450147.1665660; Thu, 15 Oct 2026 09:44:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHI0V-00034T-KA; Thu, 15 Oct 2026 09:44:15 +0000
Received: by outflank-mailman (input) for mailman id 1450147;
 Thu, 15 Oct 2026 09:44:14 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xHI0U-00034N-8C
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 09:44:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHI0T-0021c4-Du
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 11:44:13 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ad0a066-e002-0a2a0a5209dd-0a2a4505bdac-18
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 11:44:13 +0200
Received: from [52.101.66.79]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ad0a06c-4cb1-0a2a45050019-3465424f4618-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 11:44:13 +0200
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by GV2PR03MB10950.eurprd03.prod.outlook.com (2603:10a6:150:278::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 09:44:11 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0496.021; Thu, 15 Oct 2026
 09:44:10 +0000
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
 b=UmRnwfe+0w4BVjnvWswUk5i7CiSbLYTy4XXGVIkjhwcWTCOXdYJ2fOfw1Hbplk7AFLdgMv+/pBu0PEHWeP+kTNUlyofVZt22gH7kimXmu+7LUw8nR/Rnh5dIj5FYF1ZwKGiFCEuCYQq+j3UcBy8UgVDLImyGWNLL2D5BGh2NZEKe2zuMyjbkaNiSnxFQBcdhz7x/zJzhAVwEIsBxvYplbVnddGll/qz08YdsrNcNQ01jhvNWIB/3JKrrgVaiNNUw4WU68VT+IAsH/cNAq0WJPdM12N3hh1RT2peiyIQxqfWMMmoeoVkoLHPhsOvX6/MElAgRP2/Oe3b95lEekipvTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W6cUxlVTodAwFv/9vYCDJx4f0tguGJ1LA4TK+tsmmAw=;
 b=x2wYYlSg1fTwUfhaK4DGtNL/5PpBocV6+bRcI2lXYx3uI3k2RafZkIa74apAl2zn3FPo96+xhP1TRoSbAUYkMcgMEymTvSSm4uqHQ5WZMp5nSqHGNuG+I4dGPZ0CnabHx1prvZzAO5SOqUWksnUbp7FIxOguujpPVz+f/UG5lU1JpfKTF8X/eo+aFfHSX0feRBc1UWiLVVP4qDOj6bt6bdxzo2G2XXlXFRFKW5THFgz71Nj13f/lAFnnI4Svkb+2ScSV+f0wRPKoZr9otmT956R6jpe16xy8PPdNruTMBrO1i4evlxqNAeo6SbDPJX/C7EssonAqSlQPK6sn+tXc6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6cUxlVTodAwFv/9vYCDJx4f0tguGJ1LA4TK+tsmmAw=;
 b=k0U56ju71qtmAYO5q/lAWVS/Z6Vhqq+nuavIfvgIqV2bjyoT/M7TRXeaEg/IVPGomnA3TsUVi7X+O+uQUS/DSvGyEtEww8TG82MsFo0x0DVO3253P5IexNqxETPI1bL1P/BKltcY6+8GQ7XJQSmu/s1m9zBSl1t2FP0pSpdFkH0oSjqBf0LkVK8ThIcPc/TudYj/ZxHQ6agHdcnEAmeJgkbJP1BOMycjWruJW9uRv6uSbz0g3n8FRAFT9+o49vq/0Ox0G+bbZU6Xty2My9mi/Wk5i7Gh2BYnP2L8B4OQACW0vREd59CBkjCPrhOLTLdNUjNfUjbjOeHwB10oxPC3eg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <865830ba-e094-4366-800b-7480bdb9e96f@epam.com>
Date: Thu, 15 Oct 2026 11:44:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/22] xen/arm: vsmmuv3: Add support for cmdqueue
 handling
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1791328190.git.milan_djokic@epam.com>
 <b7fcd3cdbe97ae2f23a5797f8c9c51ddba63fcc6.1791328190.git.milan_djokic@epam.com>
 <60e304f6-6c65-40cb-8b4b-1584e5c47272@gmail.com>
Content-Language: en-US
From: Milan Djokic <milan_djokic@epam.com>
In-Reply-To: <60e304f6-6c65-40cb-8b4b-1584e5c47272@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIXP296CA0034.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:36e::19) To AS2PR03MB9587.eurprd03.prod.outlook.com
 (2603:10a6:20b:595::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB9587:EE_|GV2PR03MB10950:EE_
X-MS-Office365-Filtering-Correlation-Id: 115f253e-c6ee-4e64-3c45-08df2aa0dd68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|6133799003|18002099003|22082099003|10067099003|3023799007|11063799006|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	EkvqCwbIMLxEDfdpItnmr7VyqJf+15+UBjgtOmDq/iad4OmW+PPULgj+EOrZIX26PyOAwRHt13ZPRM0HO3SeWIGK1Vrnb3w/1BhvvWvnyJDVmxNgsKked75GElhprV91SGx2H3zukD+sUX9o4A9gRNrormv7kxnuE8zeRxLVxhcwY73iDDWRMmtzZ3x0n1PgQwUN3rovelisVXhLcTa0vUZeYzuWkZBYi8cqKwThZi357bscp0K4dYkZMmFo2Bf0UaagE43C86HCsERvtPTdQJQ5HQrgFXeSRa5Zg+us6sjLq7XUtqFE/oXHJSer6E6YYy9sL8ltmMxRfQEgaN1I4eFds+8VWXL3C3xqih3CYD+4NNlzQdVprNfkO3YoA13nvY8OMw1Y/SeN282Zjl888rTQ4iAWXTO+EXCaSw2URz/vlu5kJLgoqaeFCmW5p3sD7DZLeRketKhpFYQX84a8dL9j7F/4u4kGJdogVYpnG44rZneW0FHfpkVZ2ZiYd/hXAH1A5f4ZoQhu6ZxModTKUCpdMgN2Q+BlrOx2HQTagoDbIgjgz+ipB34HpXaC9BTRsbq3YRUcC3WtnFSNDhPL3A2uSuCSW3qXeY/FI0Ug4d3mjSFWDmNt7/NZyJOpTpn6TGi27SDcxy0EREY/Tlq/yaMlSEuo9gK/YN2Lp95wl2A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(10067099003)(3023799007)(11063799006)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2tBNDhWQ1JRLzZualJLY3VnL0U5eTVWQ2xldWM0b3F5MUd3cE9zd0lrVWlx?=
 =?utf-8?B?aFptTjZQT2p3c0w5dElOT2d5ODFDSzh1c0pEdGo5dGsxTHJ5RmxwdTB6ZGww?=
 =?utf-8?B?bklSZWQxU3dIT3RLUXhtQUNnZzRaQksybHROUTJ1YTdLRGtGbkNsczdIUDNV?=
 =?utf-8?B?MTFxUnpseWVPa3YvQnMvNmlVejQwbWh3WnVSeHdaM1Q0N2Z2YXJvaldPUWpJ?=
 =?utf-8?B?Wm1OazcyaVNzQUJQN1hHWUYweTNJdnJ4eE5WeURoRXgwWDQ1SCtRcjJ1WU9L?=
 =?utf-8?B?SWZZdVNuaTN4WEFyWnV6TUhOa0I0cUM3eUYzWk8vQ2NTcys4cFppak5COWNN?=
 =?utf-8?B?OFNReUI5VDdYUnlyQ0Z3TXVWTE5HZG1BU3RiYSttSVYzZmxVemVsUDF4WU5F?=
 =?utf-8?B?ZFNMVWZOZUFGVHJ5YVMrVFdhUENnSWJ5UHArWUpibWwrSkwwYSsremU1ZGVI?=
 =?utf-8?B?RmJRbzRWNTNqaGpWb3N5d2E1TWI1WFBjTmQ1aFAxcUtEY1JiaDJzMkQrdDdm?=
 =?utf-8?B?d3lLWlQ5QkhHV2J6SFdXSkZFWWZQSHhZVGxHeXBPKzgyT1pONFBhMURHWFhT?=
 =?utf-8?B?OGt6blZjaGNTTVVWNmdOd3NmcUVmYkZTZU1DY2hlK1FMWG9lUjBrWnRkb08r?=
 =?utf-8?B?T3hJZ0JnbVoxQkFSeDJmYTFyUDRjSDlqdzBSelJ1NFp6a3V5cSs2elZ4bDVP?=
 =?utf-8?B?b0I3TGQrd0FaMFh5c1VwNXBPb1NrcXFqZXpQekxOSERjWDd2SWc1K0tXc3h1?=
 =?utf-8?B?SDR2YVVFelg2QmFxZEl3UFQ4eElMTUNvd3dOSVY3YVhMaHk0c2poY2hKaEc2?=
 =?utf-8?B?OXpDeWc4R3BUV3QwUDhtYmZUU1NPdFVFaEhFc3NzeU1kbktYS3V3WjExcGxS?=
 =?utf-8?B?dzNIaW9aNGV4ZXZYZG1maGFoNjdpVHV1QUp4cTVLVXBjT1lKaWtzdjRSYVpU?=
 =?utf-8?B?TlZCVGs0cXc3aVpZOVhESCsvc0JxSTVuUkVYUVJqMWxsME9admIwVHA5dEtO?=
 =?utf-8?B?b1ZjaUV6K1hjOFBTUkZ6dGFjamJ4VFhZeHlmSnJPZEVVZ3BaVEFGU3BVV1dP?=
 =?utf-8?B?N2hpdnNJcjhybjVwZnFUUkI5b01ubFdwcGNsQ0g5SVhOUXRxWkFlSXdHVWR5?=
 =?utf-8?B?bEcySmlYdTBEUEVwRkQwVFBuNU1JUHUyUjVWZ1ZybTRIMGZkYnZNblVSRUho?=
 =?utf-8?B?c3Q2L1pyWTBBaWZZODA3SXpsbWdaN2VFMXBqM0pETm5xbDB6MThmaSs4ZDdi?=
 =?utf-8?B?MzAxczdJNGdxaFQxZmd4V1hxc2ZjTTczYzZvUmt0RmYyQzhZVU9kV0pIYTl1?=
 =?utf-8?B?cTVVYTRDNjA5KzBnQ3BMcFdRS3RZaVV2RUhVdUY2SXpxbEcxRFFlV2J1eStL?=
 =?utf-8?B?S0hFQlZjK0JYQkpTSU1qSDBxWG13UEFyaklZVjdxcVRpbnJ3V2NsdDB0dnZP?=
 =?utf-8?B?R2VUZ1VEOXJsb2VTWDFuMHFXTU9hRWY4YjZTcjRlbWZzalMzUkdFM1ZSd3ZT?=
 =?utf-8?B?cnI4WEZ6OVFlQ2JZcVRiMllWTE9PRHprZmlyVGJuQUs0WWFqak4yTXVFV0Rv?=
 =?utf-8?B?TWZYS2YxUHVWanhQd1EzaUdtaTI5ci9HMEUyTUFlWUwrNTVGMFN3NkVmSG9a?=
 =?utf-8?B?eWtvMW43WkJpTzJjMnFmc1U2ZXI1dS9CT0pvNHpCYkp3aXZUcHJNRzd3dEJM?=
 =?utf-8?B?R0lnUXhESmgvMVBJTlkrWjRqVFk1UHNOUmxNWjM3NHBCM3NGU1NkbkVvaTB2?=
 =?utf-8?B?TE9lclR6SStOVlIyaHlTSjVMemc4bVhtcCtVUXpBMjV2bXRCdDFTeHhKeG9p?=
 =?utf-8?B?WitqWXNzYVFRMElPbFM5SklhdU9RR1UxdWxZZVAvdFlKcXNXYzJPYnlaSzAv?=
 =?utf-8?B?dEgwclZCbE82T0FSRW1JQjVpSmlDeVR5bENUTkxmWHE5Szc4eDhTR2xidG15?=
 =?utf-8?B?M1haY29QVTd2c01QWGZzTmN3aXRLUkhrd0hMQ2JSODVlMDRmanVSdHJ5TDJF?=
 =?utf-8?B?Zk84TW14SWRGenRHZ2taMkZ0b3gyMEVlQ1ZDaGhFQTFPeXNKeFFUeTNwZG1W?=
 =?utf-8?B?UmZYQUtYWDAwWWRGUlFRVUgzcjZScU5yc040R1RFSmhOa1B6bm1MU2Q4bVNN?=
 =?utf-8?B?cWJ1TVVSbldlL0FMaHJINDhpWElhUlIySmQ3Sk4xRnM1NlBGNWgyODZkcnF5?=
 =?utf-8?B?TlV2WlhaY1pBMWFXM1dXamNTWVFmcmZubjZxOEZIZ0d4V3dkSHBuV0k4WXk2?=
 =?utf-8?B?ZkFXY3B1enVXS25wSXhGYW1VTHJ1QVRUY05uNGkyZU5ZRWlNU3l4MTBkQjd6?=
 =?utf-8?B?NnRhb1FKUytmZVZ4SzdGQzB3UEZ5czdXRzdHSlF6WXZWMzY3WmozZz09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 115f253e-c6ee-4e64-3c45-08df2aa0dd68
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 09:44:10.8887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OTOLOyIFr0el7frZjkwQoO1oFyLfJTuntps3tp1JTvG33IcaJfyDFg6/pjPTBxs5pkrksS2c4sb94yNJjaJZfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB10950
X-purgate-ID: tlsNG-c201ff/1792057453-F6EB12A1-4A9708CC/0/0
X-purgate-type: clean
X-purgate-size: 6905

Hi Oleksandr,

On 10/10/26 18:58, Oleksandr Tyshchenko wrote:
> 
> 
> On 10/7/26 03:06, Milan Djokic wrote:
> 
> Hello Milan
> 
>> From: Rahul Singh <rahul.singh@arm.com>
>>
>> Add support for virtual cmdqueue handling for guests
>>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
>> ---
>>    xen/drivers/passthrough/arm/vsmmu-v3.c | 127 +++++++++++++++++++++++++
>>    1 file changed, 127 insertions(+)
>>
>> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrough/arm/vsmmu-v3.c
>> index c4fef6e8bd..10143927e7 100644
>> --- a/xen/drivers/passthrough/arm/vsmmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
>> @@ -8,6 +8,7 @@
>>     * This needs to be fully handled in the future.
>>     */
>>    
>> +#include <xen/guest_access.h>
>>    #include <xen/param.h>
>>    #include <xen/sched.h>
>>    #include <asm/mmio.h>
>> @@ -33,6 +34,51 @@
>>    #define SMMU_EVTQS          19
>>    #define DWORDS_BYTES        8
>>    
>> +/*
>> + * SMMUv3 command definitions
>> + * Some commands are fully handled by the emulation layer, while others are
>> + * currently treated as architectural no-ops because the required behavior
>> + * is either implicitly guaranteed by Xen or not yet modeled explicitly.
>> + *
>> + * Emulation handled commands:
>> + *
>> + * - CMD_CFGI_STE
>> + * - CMD_TLBI_NH_ASID
>> + * - CMD_TLBI_NSNH_ALL
>> + * - CMD_TLBI_NH_VA
>> + *
>> + * No-op/Implicitly handled commands:
>> + *
>> + * - CMD_SYNC
>> + * - CMD_PREFETCH_CFG
>> + * - CMD_CFGI_CD
>> + * - CMD_CFGI_CD_ALL
>> + * - CMD_CFGI_ALL
>> + *
>> + * TODO: Remaining architecture-defined commands are not supported (error
>> + * produced), due to lack of support in SMMUv3 driver / emulation layer
>> + * TODO: Range / per-device invalidation not supported atm
>> + * TODO: Long-running command queue handling is not implemented (command
>> + * consumption should be budgeted with asynchronous resumption).
>> + */
>> +#define CMDQ_OP_PREFETCH_CFG    0x1
>> +#define CMDQ_OP_CFGI_STE        0x3
>> +#define CMDQ_OP_CFGI_ALL        0x4
>> +#define CMDQ_OP_CFGI_CD         0x5
>> +#define CMDQ_OP_CFGI_CD_ALL     0x6
>> +#define CMDQ_OP_TLBI_NH_ASID    0x11
>> +#define CMDQ_OP_TLBI_NH_VA      0x12
>> +#define CMDQ_OP_TLBI_NSNH_ALL   0x30
>> +#define CMDQ_OP_CMD_SYNC        0x46
>> +
>> +/* Queue Handling */
>> +#define Q_BASE(q)       ((q)->q_base & Q_BASE_ADDR_MASK)
>> +#define Q_CONS_ENT(q)   (Q_BASE(q) + Q_IDX(q, (q)->cons) * (q)->ent_size)
>> +#define Q_PROD_ENT(q)   (Q_BASE(q) + Q_IDX(q, (q)->prod) * (q)->ent_size)
>> +
>> +/* Helper Macros */
>> +#define smmu_cmd_get_command(x)     FIELD_GET(CMDQ_0_OP, x)
>> +
>>    /* virtual smmu queue */
>>    struct arm_vsmmu_queue {
>>        uint64_t    q_base; /* base register */
>> @@ -99,6 +145,83 @@ static inline bool smmu_get_evtq_enabled(struct virt_smmu *smmu)
>>        spin_unlock(&smmu->cr0_lock);
>>    
>>        return enabled;
>> +};
>> +
>> +/* Queue manipulation functions */
>> +static bool queue_empty(struct arm_vsmmu_queue *q)
>> +{
>> +    return Q_IDX(q, q->prod) == Q_IDX(q, q->cons) &&
>> +           Q_WRP(q, q->prod) == Q_WRP(q, q->cons);
>> +}
>> +
>> +static void queue_inc_cons(struct arm_vsmmu_queue *q)
>> +{
>> +    uint32_t cons = (Q_WRP(q, q->cons) | Q_IDX(q, q->cons)) + 1;
>> +    q->cons = Q_OVF(q->cons) | Q_WRP(q, cons) | Q_IDX(q, cons);
>> +}
>> +
>> +static void dump_smmu_command(uint64_t *command)
>> +{
>> +    gprintk(XENLOG_ERR, "cmd 0x%02llx: %016"PRIx64" %016"PRIx64"\n",
>> +             smmu_cmd_get_command(command[0]), command[0], command[1]);
>> +}
>> +static int arm_vsmmu_handle_cmds(struct virt_smmu *smmu)
>> +{
>> +    struct arm_vsmmu_queue *q = &smmu->cmdq;
>> +    struct domain *d = smmu->d;
>> +    uint64_t command[CMDQ_ENT_DWORDS];
>> +    paddr_t addr;
>> +    int ret = 0;
>> +
>> +    if ( !smmu_get_cmdq_enabled(smmu) )
>> +        return 0;
>> +
>> +    while ( !queue_empty(q) )
>> +    {
> 
> This is unbounded loop, guest controls PROD and the advertised queue
> size is big enough. Below ...
> 
>> +        int ret;
>> +
>> +        addr = Q_CONS_ENT(q);
>> +        ret = access_guest_memory_by_gpa(d, addr, command,
>> +                                         sizeof(command), false);
>> +        if ( ret ) {
>> +            queue_inc_cons(q);
>> +            return ret;
>> +        }
>> +
>> +        switch ( smmu_cmd_get_command(command[0]) )
>> +        {
>> +        case CMDQ_OP_CFGI_STE:
>> +            break;
>> +        case CMDQ_OP_PREFETCH_CFG:
>> +        case CMDQ_OP_CFGI_CD:
>> +        case CMDQ_OP_CFGI_CD_ALL:
>> +        case CMDQ_OP_CFGI_ALL:
>> +        case CMDQ_OP_CMD_SYNC:
>> +            break;
>> +        case CMDQ_OP_TLBI_NH_ASID:
>> +        case CMDQ_OP_TLBI_NSNH_ALL:
>> +        case CMDQ_OP_TLBI_NH_VA:
>> +            ret = iommu_iotlb_flush_all(smmu->d, 1);
> 
>    ... TLBI does full-VMID flush and waits for the hardware. All of this
> runs inside one MMIO trap with cmd_queue_lock held, so CPU could stall.
> Yes, this is honestly mentioned in the design doc (Security
> Considerations, Observation ...) and doc calls it future work. Yes, this
> should be sorted out before driver can be treated as supported feature.
> 
> So please treat my comment as a remark. For now, I would put a TODO
> (e.g., above the while loop so it does not get forgotten.
> 

Yes, this is a known issue. Addressing it would require significant 
changes to the SMMUv3 driver, so we decided to handle it separately. 
I'll add a TODO in the code as well.

> 
>> +            if ( !ret )
>> +                break;
>> +            fallthrough;
>> +        default:
>> +            gdprintk(XENLOG_ERR, "vSMMUv3: unhandled command\n");
>> +            dump_smmu_command(command);
>> +            break;
>> +        }
>> +
>> +        if ( ret )
>> +        {
>> +            gdprintk(XENLOG_ERR,
>> +                     "vSMMUv3: command error %d while handling command\n",
>> +                     ret);
>> +            dump_smmu_command(command);
>> +        }
>> +        queue_inc_cons(q);
>> +    }
>> +
>> +    return ret;
>>    }
>>    
>>    static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
>> @@ -221,6 +344,10 @@ static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
>>                reg32 = smmu->cmdq.prod;
>>                vreg_reg32_update(&reg32, r, info);
>>                smmu->cmdq.prod = reg32;
>> +
>> +            if ( arm_vsmmu_handle_cmds(smmu) )
>> +                gdprintk(XENLOG_ERR, "error handling vSMMUv3 commands\n");
>> +
>>                spin_unlock(&smmu->cmd_queue_lock);
>>                break;
>>    
> 

BR,
Milan


