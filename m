Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1120ECC6B33
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 09:34:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450121.1665633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHHqj-0007aC-9l; Thu, 15 Oct 2026 09:34:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450121.1665633; Thu, 15 Oct 2026 09:34:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHHqj-0007a5-78; Thu, 15 Oct 2026 09:34:09 +0000
Received: by outflank-mailman (input) for mailman id 1450121;
 Thu, 15 Oct 2026 09:34:07 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xHHqh-0007Zz-7K
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 09:34:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHHqg-007Mcx-5T
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 11:34:06 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ad09e0a-2eae-0a2a0a5409dd-0a2a450cb75c-24
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 11:34:06 +0200
Received: from [52.101.66.88]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ad09e0d-f479-0a2a450c0019-346542583b48-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 11:34:05 +0200
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by VI2PR03MB11003.eurprd03.prod.outlook.com (2603:10a6:800:299::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 09:34:02 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0496.021; Thu, 15 Oct 2026
 09:34:02 +0000
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
 b=v+nODBM/7bO3poAFFGetnFUAk01sh1PBt+GdQdzmcrW/TN93wXDJB8Xw5rOKu4yCPj2K3B585TESL6r5pmIctXnZtYQZf51sa7C5KlwX6HUinQhE1kfY1CRq46ABERDsBMGWP+sN/LXmNN4QHgzS4D4cDGv6iA3czcVx8y7RxpoVl9w7RIvs3yDLkS6AsK2eoNNVtG0lwQ+L6lNWp+cAtlE5XhYOuYC55awWJwoQcxSsWYhBsFGpGmbw/wzYeTQKrRMzhDN6mnVv9pE95PqlEIlRgG9pUlI36sehAYIiMi1VjHQTw5nZqChmapatsvOGvMii6SWdJfi4GHtN2/FZqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8G+7gP20opyVvGfbc7rYzjyDJjT+pSHAze58KWYd8A=;
 b=xMjcZaFgYZOyohK6Zd5/sAL2X2+ePpz+AMmZVdOTl4Ge/K/UzzqjYmHkd0mU4tVguYGrPWZVIFSh7Z5ClgM7ImVCJ7WXP8QAnudE/aRU/qOc3JIRmHRhdPWopW+fdVy/rm19akfpfK0x40rAdBTimApaOeVQaAsl2OEnhcLqDq251em0Es/+PIXisvfI9hiCjR8or8jQZjWGJrWYqeS2421H0RkdxxYTdUP286huIi1zE5F62Du5ZVXOUnpkKxses1wpSFvyXt4wKxa827M1q5DQi44bwJJqGKKCQOm5t+Y4hdVzMyn73vhLmFQAOZXlzBOg1sF/tWyo33NKoZ36ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8G+7gP20opyVvGfbc7rYzjyDJjT+pSHAze58KWYd8A=;
 b=asApyFk4mDkCSWQG4B0uBmu8qpzMvUjJiIdWJxfVw7qlrM98GyRMs2JEcA56SDKVltWEuBOcBd3SkAwG9NwrQjrRBkdx49jw7r2mWuKz1qYXbFMdsY5RwsUwyZdLtKrgwx0wudpTBw/dd8xH5KGvadv6v6rYVaR1lZ0AqZc+w94v74eqRPac+ESm3TP0A7tQ6qVjE8FwiMPHVJsRuxXXBd1vjgIJdsXO70Q6Gr8Hmu99ekuLR7cNdhrnoYpS18iBtwt5am29h3FaICI+VTGOETbvnVfSOl7xPOplqkdpB5iOnoLMYJE5Lv3qVzv5/ucha6xGrYJlK+L636rpWCwrBw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <b7debc79-7828-422b-8507-b5aeaf1b3c0b@epam.com>
Date: Thu, 15 Oct 2026 11:33:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/22] xen/arm: vIOMMU: add generic vIOMMU framework
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.com>
References: <cover.1791328190.git.milan_djokic@epam.com>
 <6c7570f50af7ebaae8aa709db86959dbd09e1f82.1791328190.git.milan_djokic@epam.com>
 <144fe444-39ef-456b-9fd4-747c0abc02c5@gmail.com>
Content-Language: en-US
From: Milan Djokic <milan_djokic@epam.com>
In-Reply-To: <144fe444-39ef-456b-9fd4-747c0abc02c5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0088.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35c::12) To AS2PR03MB9587.eurprd03.prod.outlook.com
 (2603:10a6:20b:595::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB9587:EE_|VI2PR03MB11003:EE_
X-MS-Office365-Filtering-Correlation-Id: b4e2e1c8-1dcf-4b46-df64-08df2a9f7286
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|56012099006|11063799006|4143699003|261009223027099003|260925022911599003|18002099003|10067099003|22082099003|6133799003|260925021311599003|260925021911599003;
X-Microsoft-Antispam-Message-Info:
	rrWZ3q+QJTbUgnX5rANVqjfSGUBotelbqJk7lhma/4UEwRsAj58D5mtCa9BMNYHx/sd1mEj3e3yWqFmpOoXE59WPSa9SYcP8BMDS38XnzD/gsYy9xtcXSPl0GVJ72XOJ489xYzT0rUEcuwe6lKnki6fwyD1xWS9JDw9sJvCkOGjeKd0+ig9Jzqv7/GvlC8JONkMiBy2gUvaKMIUaMfifh7v0mgr4v6GK8rGHGWNGRDRYu07dz3qGQDud8DDI8vxr+GdtNUOafWb9FqSB/JzOI0Sdx3JS4ESLYIc84SGSqcCPLq28sMg0+zQXaWLCLnibeUjXW/ob9jt7Hj5wAcxxRtis1oJKCvH59cz1CgGhDVs9T23EXuYLE20INlYJpDSE8mxVN/KwC0izRK5Wr0clJrN/UDNLj8s2Q//vvPlobfQdeGUdsRFs8yMBAo35iSDBIcVy1qqLOlKoolO/AQmOibbZHDRJFIz2Apk5nXZ4nS8WMqcyb1NCbKctHEM+uavh1U+bpsY3xiIjpoOFZVP+KMW2yWBYd1P/MyAYUPmf93UJjdKZlAz3dbhHB0kqdpmlyHlEPWqPMBc5kGfSpx+fii8tPuZzP7+0fsa68qtEubv/8X3QfoUGXgWsoeTPEvNjUfCrwNqmN2YQm2blXi0cXgvfRgj8Vbvu/f+QlQVVEAs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(11063799006)(4143699003)(261009223027099003)(260925022911599003)(18002099003)(10067099003)(22082099003)(6133799003)(260925021311599003)(260925021911599003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0htQjNiTm80MDROVEpsY1dmYTNOQWt3alRvMnMxTDA2MHlOZnp5SllXR0NR?=
 =?utf-8?B?eUtkNjRBRi9vaFRoQXpvaWZ0dFhHakVJYjlDQkw5WDZaSGh1WWRtdW1wL1dX?=
 =?utf-8?B?aFpGQWRKc1d4SEFYV2RuK3M0aVppVmR5OVp1UmZDNytIUEVILytOSjBEdXpU?=
 =?utf-8?B?OStJK1NISTRSaUFNSWdjdUU3Si9lT3FQYWJHVTBTY1lWN05TK1dPNFZTdTdS?=
 =?utf-8?B?ek5VNkU2bncwVWY2MjIrOXgvRm95ZnNCSnVRUitZT0VPVVZVa3c4b3NQdWNw?=
 =?utf-8?B?TGdMa2swYy9jWCszc1pkN010TXFFcjUzSWxZSHBzSG9lZFAyb0laK2huSG9E?=
 =?utf-8?B?RDlranp1MVB5dEs2dUdHTjk2dFZXSEp6Z0NkUXYvbEh4VmFQcGhseGdvMENV?=
 =?utf-8?B?eXpFNGhsbytENHEyUmVPaHBCMERaQ0dxWktCQlB3Sjlld1VvQ2lMUFZ4MDBl?=
 =?utf-8?B?THF5cnNKWFdvSitGNTZKQm1ZNkxJWGQweERSZStzbXFycWVCUFJrMldFNERi?=
 =?utf-8?B?eWpDQkpocmt6R0RQZ2R0Z040bHZmUGs0bWYzcy9NU2Zpa2N3dDhMdzJ1dHNN?=
 =?utf-8?B?U0FsUzUvTWV3VnFBeGRQSjlLaHlFRDN5emQ5cnl3RmVRWU1taFVnN01JNk1o?=
 =?utf-8?B?WDN6NjRvbHJ3RnB0cHdzM1MvU0xYeTQ1bGRTSUNtNHEyOHZGcWFoWmV0Mit6?=
 =?utf-8?B?VFJCTDR5UGsvdDF6NjhWY0h0MUxrTzRpZVJMOG8za2ZtYkpqNkxWYTE1a1Ja?=
 =?utf-8?B?a0VKNGRsNDhKU0c5M1M2M0dDWlJJM1hzTjM4QkZHQks1Nkt6bUw3WW1sUnUv?=
 =?utf-8?B?eDZOQnJqVE91Q1hrVU4vTzJwd3dndzFIOUE3eGlLOGhRclJ1TTJqczFiMmR3?=
 =?utf-8?B?NExNS3lXQ1FZQVRiVmVERHZrS1pUVFhiQ0RhZlkrV0VWdjZKWVczOU43cko2?=
 =?utf-8?B?cmpFMEh2ZWY1Tk42bTE1N3RDekw5SXV4NlJzeDU3M0ZUNGlTY2ovMzRDcEEy?=
 =?utf-8?B?TStPUUhTc1kyaXhESTIwUk1WQXNsMklRR2kyRE9sR2o2VUpIaTQyRWxJVC9E?=
 =?utf-8?B?UnA4RndnaFlxdUFMbDcvdEI3Y0xyN2RBN3FyektnK3EzaFJZS2V2aGxodVgw?=
 =?utf-8?B?dWZPNUwvOUl4d0l1YTErT2FMTTRpNXdNcDZJZitLSmdZQ3pMOVg4UlA1Y2hL?=
 =?utf-8?B?UUtXcldjWlo3U1F3bjhUZzVrM2FMbytqWmdXL2hZM0MxRndDaGcvRTNLQXRT?=
 =?utf-8?B?cmY4UVVPMXpXSm82S3VLNW5yam42YTRjazRxZDR0NGNwTjhobnBOZHZVVlBI?=
 =?utf-8?B?d1d0ZExyTGs2T3lzQms2bnRqMkVseGFWQm82d0hhdHFIMW0wd21JZGtCbDV6?=
 =?utf-8?B?L0tOVzF5OVRrVlJNODYzM0k3YjAva3ovTElzZFlzT1RmU05lbndtMkxCSGt1?=
 =?utf-8?B?TUVFTzVLekxnbXAxREJweUFGMFl2S1NZZTBMd3dlQjB5VVhrNC9sL1g2T0Zv?=
 =?utf-8?B?b2xQbGxGdlRTOEFIT2FZaHZSZ3luenpyWUsyTWk0MDE3d3JHMVg2VklrNTNz?=
 =?utf-8?B?bXFtREpuN1RYd1FjcFk5MjU5YzA1L3l1UVVXU05vVVlNdmdoaGFGQkZlWkR4?=
 =?utf-8?B?VFFCaThIYndTRjlLYWN6c0tsR2tIbnFBaGh2aGV1MVpZWXJKS2VWUnhHdzk3?=
 =?utf-8?B?M2VweUk4bXE3T2RxOEllaVJOR0w0OStpVkx6T0w2WDdwRXltaFBWblNweEdD?=
 =?utf-8?B?TkRoc2UxbERJNUNlSThucXhXK2hRY1BteXZLZG9aVDh4eFNKNEcxSGVnVUtE?=
 =?utf-8?B?eDZyM0laVmROR0RFMUdNVlY4SnF2VmMyMCtOQmNZWDlOck1NL01qY1piSzVv?=
 =?utf-8?B?QWM0SHZEeUlNTzV3SVljNkowWFFmRnB4QVBQVGVWNlZDTG0wb1lBRHdIOTlS?=
 =?utf-8?B?eHZYNmNSQTlJSm5oUm9YcFY4YlhidmtGcWVXaDhOcVEvMXRkSzcydzNLdXBa?=
 =?utf-8?B?UXZDM3diVnMyanFKbEFPbTR5Mk9hTWUvSVF6djRiUkRmTVd6SGM3eDlXSXFZ?=
 =?utf-8?B?YW1pL3lDQW8zTStUdzUwK2V1YXVGVUd0amk5UGZpb1hNZjExeGc3ejYvSVBV?=
 =?utf-8?B?ZTJuYkNWZlNpWFpUS0Rhb3ZKdzVZSklUYlJkREZDZU8wSVJzS2pOcTRDQ2VD?=
 =?utf-8?B?MjZBYlZaeU9KNzlWeld1VWpmei9WSVNaVTlZOXA5TWdueUp6MzI1V05jS2p1?=
 =?utf-8?B?eFZCNlQwbDkvU0NiMXNpRUNRRVRpeVc1bjNyRHdzNkdwbWZhTW4xSVRzS3VE?=
 =?utf-8?B?cjg4YzZMTWdLNnUyc1paQkRtTVhpaHFuNUhPalRucmZha3IvR1dzQT09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e2e1c8-1dcf-4b46-df64-08df2a9f7286
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 09:34:02.0892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +1Tg80XlZFapIDCF21JXUQmI+W8iZ8pCSC2lp81US/yPFmSDb6Skdehy1QFpAoiF9XRd2IOAii/VQrDY2CYFoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB11003
X-purgate-ID: tlsNG-d25034/1792056846-02CDBA5B-FF87A43F/0/0
X-purgate-type: clean
X-purgate-size: 11534

Hi Oleksandr,

On 10/9/26 13:41, Oleksandr Tyshchenko wrote:
> [You don't often get email from olekstysh@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> On 10/7/26 03:06, Milan Djokic wrote:
> 
> Hello Milan
> 
> 
>> From: Rahul Singh <rahul.singh@arm.com>
>>
>> This patch adds basic framework for vIOMMU.
>>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
>> ---
>>    xen/arch/arm/dom0less-build.c        |  2 +
>>    xen/arch/arm/domain.c                | 31 +++++++++++-
>>    xen/arch/arm/domain_build.c          |  2 +
>>    xen/arch/arm/include/asm/viommu.h    | 70 ++++++++++++++++++++++++++++
>>    xen/drivers/passthrough/Kconfig      |  5 ++
>>    xen/drivers/passthrough/arm/Makefile |  1 +
>>    xen/drivers/passthrough/arm/viommu.c | 49 +++++++++++++++++++
>>    xen/include/public/arch-arm.h        |  6 ++-
>>    8 files changed, 164 insertions(+), 2 deletions(-)
>>    create mode 100644 xen/arch/arm/include/asm/viommu.h
>>    create mode 100644 xen/drivers/passthrough/arm/viommu.c
>>
>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
>> index 3f48f74226..f87437915e 100644
>> --- a/xen/arch/arm/dom0less-build.c
>> +++ b/xen/arch/arm/dom0less-build.c
>> @@ -23,6 +23,7 @@
>>    #include <asm/arm64/sve.h>
>>    #include <asm/domain_build.h>
>>    #include <asm/firmware/sci.h>
>> +#include <asm/viommu.h>
>>    #include <asm/grant_table.h>
>>    #include <asm/setup.h>
>>
>> @@ -369,6 +370,7 @@ int __init arch_parse_dom0less_node(struct dt_device_node *node,
>>        uint32_t val;
>>
>>        d_cfg->arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
>> +    d_cfg->arch.viommu_type = viommu_get_type();
>>        d_cfg->flags |= XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
>>
>>        if ( domu_dt_sci_parse(node, d_cfg) )
>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>> index a739dd157e..5c411a2310 100644
>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -33,6 +33,7 @@
>>    #include <asm/vgic.h>
>>    #include <asm/vpci.h>
>>    #include <asm/vpsci.h>
>> +#include <asm/viommu.h>
>>    #include <asm/vtimer.h>
>>
>>    #include "vuart.h"
>> @@ -663,6 +664,21 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>>            return -EINVAL;
>>        }
>>
>> +    if ( !(config->flags & XEN_DOMCTL_CDF_iommu) &&
>> +         config->arch.viommu_type != XEN_DOMCTL_CONFIG_VIOMMU_NONE )
>> +    {
>> +        dprintk(XENLOG_INFO,
>> +                "vIOMMU requested while iommu not enabled for domain\n");
>> +        return -EINVAL;
>> +    }
> 
> 
> I might miss something, but if CONFIG_ARM_VIRTUAL_IOMMU=y and we have
> SMMUv3 the dom0less domains "without passthrough" will fail to build.
> 
> arch_parse_dom0less_node() sets viommu_type for every guest. But
> CDF_iommu is only set when passthrough = "enabled" or the node has a
> multiboot DTB. So a plain guest without passthrough is therefore
> rejected here.
> 

Good catch. The domain's ``viommu_type`` should be set based on both 
``CDF_IOMMU`` and the detected vIOMMU. The vIOMMU should be disabled for 
the domain when passthrough is disabled. I will fix this.

> 
> 
>> +
>> +    if ( config->arch.viommu_type != XEN_DOMCTL_CONFIG_VIOMMU_NONE )
>> +    {
>> +        dprintk(XENLOG_INFO,
>> +                "vIOMMU type requested not supported by the platform or Xen\n");
>> +        return -EINVAL;
>> +    }
>> +
>>        return sci_domain_sanitise_config(config);
>>    }
>>
>> @@ -762,6 +778,9 @@ int arch_domain_create(struct domain *d,
>>        if ( (rc = sci_domain_init(d, config)) != 0 )
>>            goto fail;
>>
>> +    if ( (rc = domain_viommu_init(d, config->arch.viommu_type)) != 0 )
>> +        goto fail;
>> +
>>        return 0;
>>
>>    fail:
>> @@ -822,7 +841,8 @@ static void resume_ctx_reset(struct resume_info *ctx)
>>    void arch_domain_destroy(struct domain *d)
>>    {
>>        resume_ctx_reset(&d->arch.resume_ctx);
>> -
>> +    if ( viommu_relinquish_resources(d) )
>> +        printk(XENLOG_INFO "%pd: Domain vIOMMU teardown failed\n", d);
>>        tee_free_domain_ctx(d);
>>        /* IOMMU page table is shared with P2M, always call
>>         * iommu_domain_destroy() before p2m_final_teardown().
>> @@ -1058,6 +1078,7 @@ static int relinquish_memory(struct domain *d, struct page_list_head *list)
>>     */
>>    enum {
>>        PROG_pci = 1,
>> +    PROG_viommu,
>>        PROG_sci,
>>        PROG_tee,
>>        PROG_xen,
>> @@ -1105,6 +1126,14 @@ int domain_relinquish_resources(struct domain *d)
>>            if ( ret )
>>                return ret;
>>    #endif
>> +    /*
>> +     * PCI devices may rely on the vIOMMU, so its resources
>> +     * should be relinquished only after the PCI devices are released.
>> +     */
>> +    PROGRESS(viommu):
>> +        ret = viommu_relinquish_resources(d);
>> +        if (ret )
>> +            return ret;
>>
>>        PROGRESS(sci):
>>            ret = sci_relinquish_resources(d);
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 72d5316180..cd2e09f005 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -36,6 +36,7 @@
>>    #include <asm/arm64/sve.h>
>>    #include <asm/cpufeature.h>
>>    #include <asm/domain_build.h>
>> +#include <asm/viommu.h>
>>    #include <xen/event.h>
>>
>>    #include <xen/irq.h>
>> @@ -1964,6 +1965,7 @@ void __init create_dom0(void)
>>        dom0_cfg.arch.nr_spis = vgic_def_nr_spis();
>>        dom0_cfg.arch.tee_type = tee_get_type();
>>        dom0_cfg.max_vcpus = dom0_max_vcpus();
>> +    dom0_cfg.arch.viommu_type = viommu_get_type();
>>
>>        if ( iommu_enabled )
>>            dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>> diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/viommu.h
>> new file mode 100644
>> index 0000000000..95f82d9cf5
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/viommu.h
>> @@ -0,0 +1,70 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
>> +#ifndef __ARCH_ARM_VIOMMU_H__
>> +#define __ARCH_ARM_VIOMMU_H__
>> +
>> +#include <xen/lib.h>
>> +#include <xen/types.h>
>> +#include <public/xen.h>
>> +
>> +struct viommu_ops {
>> +    /*
>> +     * Called during domain construction if toolstack requests to enable
>> +     * vIOMMU support.
>> +     */
>> +    int (*domain_init)(struct domain *d);
>> +
>> +    /*
>> +     * Called during domain destruction to free resources used by vIOMMU.
>> +     */
>> +    int (*relinquish_resources)(struct domain *d);
>> +};
>> +
>> +struct viommu_desc {
>> +    /* vIOMMU domains init/free operations described above. */
>> +    const struct viommu_ops *ops;
>> +
>> +    /*
>> +     * ID of vIOMMU. Corresponds to xen_arch_domainconfig.viommu_type.
>> +     * Should be one of XEN_DOMCTL_CONFIG_VIOMMU_xxx
>> +     */
>> +    uint8_t viommu_type;
>> +};
>> +
>> +#ifdef CONFIG_ARM_VIRTUAL_IOMMU
>> +
>> +int domain_viommu_init(struct domain *d, uint8_t viommu_type);
>> +int viommu_relinquish_resources(struct domain *d);
>> +uint8_t viommu_get_type(void);
>> +
>> +#else
>> +
>> +static inline uint8_t viommu_get_type(void)
>> +{
>> +    return XEN_DOMCTL_CONFIG_VIOMMU_NONE;
>> +}
>> +
>> +static inline int domain_viommu_init(struct domain *d, uint8_t viommu_type)
>> +{
>> +    if ( likely(viommu_type == XEN_DOMCTL_CONFIG_VIOMMU_NONE) )
>> +        return 0;
>> +
>> +    return -ENODEV;
>> +}
>> +
>> +static inline int viommu_relinquish_resources(struct domain *d)
>> +{
>> +    return 0;
>> +}
>> +
>> +#endif /* CONFIG_ARM_VIRTUAL_IOMMU */
>> +
>> +#endif /* __ARCH_ARM_VIOMMU_H__ */
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
>> index b413c33a4c..a92cfbea98 100644
>> --- a/xen/drivers/passthrough/Kconfig
>> +++ b/xen/drivers/passthrough/Kconfig
>> @@ -35,6 +35,11 @@ config IPMMU_VMSA
>>          (H3 ES3.0, M3-W+, etc) or Gen4 SoCs which IPMMU hardware supports stage 2
>>          translation table format and is able to use CPU's P2M table as is.
>>
>> +config ARM_VIRTUAL_IOMMU
>> +     bool "Virtual IOMMU Support (UNSUPPORTED)" if UNSUPPORTED
>> +     help
>> +       Support virtual IOMMU infrastructure to implement vIOMMU.
>> +
>>    endif
>>
>>    config AMD_IOMMU
>> diff --git a/xen/drivers/passthrough/arm/Makefile b/xen/drivers/passthrough/arm/Makefile
>> index c5fb3b58a5..c3783188e3 100644
>> --- a/xen/drivers/passthrough/arm/Makefile
>> +++ b/xen/drivers/passthrough/arm/Makefile
>> @@ -2,3 +2,4 @@ obj-y += iommu.o iommu_helpers.o iommu_fwspec.o
>>    obj-$(CONFIG_ARM_SMMU) += smmu.o
>>    obj-$(CONFIG_IPMMU_VMSA) += ipmmu-vmsa.o
>>    obj-$(CONFIG_ARM_SMMU_V3) += smmu-v3.o
>> +obj-$(CONFIG_ARM_VIRTUAL_IOMMU) += viommu.o
>> diff --git a/xen/drivers/passthrough/arm/viommu.c b/xen/drivers/passthrough/arm/viommu.c
>> new file mode 100644
>> index 0000000000..0c0efd668e
>> --- /dev/null
>> +++ b/xen/drivers/passthrough/arm/viommu.c
>> @@ -0,0 +1,49 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
>> +
>> +#include <xen/errno.h>
>> +#include <xen/init.h>
>> +#include <xen/types.h>
>> +
>> +#include <asm/viommu.h>
>> +
>> +/* Struct to hold the vIOMMU ops and vIOMMU type */
>> +static const struct viommu_desc __ro_after_init *cur_viommu;
>> +
>> +int domain_viommu_init(struct domain *d, uint8_t viommu_type)
>> +{
>> +    if ( viommu_type == XEN_DOMCTL_CONFIG_VIOMMU_NONE )
>> +        return 0;
>> +
>> +    if ( !cur_viommu )
>> +        return -ENODEV;
>> +
>> +    if ( cur_viommu->viommu_type != viommu_type )
>> +        return -EINVAL;
>> +
>> +    return cur_viommu->ops->domain_init(d);
>> +}
>> +
>> +int viommu_relinquish_resources(struct domain *d)
>> +{
>> +    if ( !cur_viommu )
>> +        return 0;
>> +
>> +    return cur_viommu->ops->relinquish_resources(d);
>> +}
>> +
>> +uint8_t viommu_get_type(void)
>> +{
>> +    if ( !cur_viommu )
>> +        return XEN_DOMCTL_CONFIG_VIOMMU_NONE;
>> +
>> +    return cur_viommu->viommu_type;
>> +}
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
>> index 00de30b896..a1491f9cf7 100644
>> --- a/xen/include/public/arch-arm.h
>> +++ b/xen/include/public/arch-arm.h
>> @@ -334,6 +334,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>>    #define XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_PMSA    1
>>    #define XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_VMSA    2
>>
>> +#define XEN_DOMCTL_CONFIG_VIOMMU_NONE   0
>> +
>>    struct xen_arch_domainconfig {
>>        /* IN/OUT */
>>        uint8_t gic_version;
>> @@ -361,7 +363,9 @@ struct xen_arch_domainconfig {
>>        uint8_t arm_sci_type;
>>        /* IN */
>>        uint8_t v8r_el1_msa;
>> -    uint16_t pad;
>> +    /* IN */
>> +    uint8_t viommu_type;
>> +    uint8_t pad;
>>    };
>>    #endif /* __XEN__ || __XEN_TOOLS__ */
>>
> 

BR,
Milan


