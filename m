Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C1E606A324
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 02:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=i2B8UNSW
Received: from list by lists.xenproject.org with outflank-mailman.1467597.1676692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNhOZ-0006WO-Oi; Mon, 02 Nov 2026 02:03:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1467597.1676692; Mon, 02 Nov 2026 02:03:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNhOZ-0006WH-Ln; Mon, 02 Nov 2026 02:03:35 +0000
Received: by outflank-mailman (input) for mailman id 1467597;
 Mon, 02 Nov 2026 02:03:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xNhOY-0006Um-OF
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 02:03:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNhOY-005zsm-5B
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 03:03:34 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ae7ef58-8faa-0a2a0a5109dd-0a2a4503b9d4-22
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 03:03:34 +0100
Received: from [40.107.130.108]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ae7ef75-fae8-0a2a45030019-286b826c1829-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 03:03:34 +0100
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by AS8PR03MB9024.eurprd03.prod.outlook.com (2603:10a6:20b:5b6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 02:03:32 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 02:03:32 +0000
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
 b=fGiCH4FYqfqzcC7v5RVYyz6UC202LVTAm5yPY+BZ16atuc9BIvlJoAv5U+Rhj0G6JOieAF/Qd1vv99wOT77x1b0IQ9JCPoF6nWhwpMVavq2a4mqDcNrYAC+Y6fPySFidt52v7PGlarg5qaZiQbkuC3QeVCc6lXNxcWnUW5ZGIOEXLzqsZiZxSdN47gLLTUxO00AeVo6dRNTbEgDY4uh2mdR9EDQtqf4pM8/Hgl0nRTG3gwG5qg1Lv2N3Z8q/+E6tfkCl/9eH4x7tkJDLrDrCBU7p5SCLDZpmy9YVtDIt1p/rGSOipgxE25clXmisY98V+jmrIZAKPWmTMHDXDGvOgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRRYV0eGEbi4+8XpbWOAK4nHmOJftx5mBglJzIHRjCY=;
 b=UeK+tuiXRIgC2flT0PXZ2PZUpucvVF5BrMPzuXyUECSZ5ywjv1sNHA5rZTXj5N+qntHu6cTzDMudTW4VgHYeD+pnrz/XqrrDzTR4XmgEk3Q5Q8rTaiC/c0ABJGSj3krqSqUC+9zgqqX6PpW7f/NKKkEyAYveBtqOuF4OXh35MKQivKnlPhAdNXoQFDECbqYT+9NYnaVOIZaTvedxZNx7L6x3Vn7jPI6OhNhQ0HCZ0TkghlXjkPwQx8sBtwmryBYR7NQQLKAgZCvIOIRMzGcuNGKW/PEwBVbhTH/DvdX9r1B3UkEpgOcI0wIzhCFMKxoJ0NhA69UTS01mr/U0tQJlHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qRRYV0eGEbi4+8XpbWOAK4nHmOJftx5mBglJzIHRjCY=;
 b=i2B8UNSWJlUCCuf1jJkkmL9oO34xLhtHc5jfNTkc9Tjwm0duRb94IjM9MC1dFkq69E67nxNzpJ8U0mNEZEtH0aK20YPW5C7La9qvGR0s2Pux4/lcCPS5GuTiAq0mdtM6DSioLa+4sEo5AQz66JpYdINWTznTHRAwsZ7SwSxnDfNPSBmnWAD8wd8dHisEwb2kphExpw0HsPnpz2FdR/Y+YclGRdQxU5X8i5dPI3ia5e+3dix1OTTO7sRo7xjTlSpBhkY6CoU84mvRtUNaHU68hVYnRTg3DJGU5nMwHNpQ3Kw2133ndAe7sm+d9rf3DAO7TAiRJcHCDvzag6oV35x/yg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <0271b2fa-02c6-45fa-9267-151ca85fa9bb@epam.com>
Date: Mon, 2 Nov 2026 03:03:30 +0100
User-Agent: Mozilla Thunderbird
From: Milan Djokic <milan_djokic@epam.com>
Subject: Re: [PATCH v4 13/22] xen/arm: vsmmuv3: IOMMU device tree node for
 dom0
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1791328190.git.milan_djokic@epam.com>
 <c38b1a9476f54e42050e4712a98b19bf1d97f3a0.1791328190.git.milan_djokic@epam.com>
 <b92b4b48-f4b3-452b-a973-d98744adfb2d@gmail.com>
Content-Language: en-US
In-Reply-To: <b92b4b48-f4b3-452b-a973-d98744adfb2d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P191CA0029.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::34) To AS2PR03MB9587.eurprd03.prod.outlook.com
 (2603:10a6:20b:595::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB9587:EE_|AS8PR03MB9024:EE_
X-MS-Office365-Filtering-Correlation-Id: d0d1e81e-7a57-44af-ff77-08df38857ec1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|260925022911599003|260925021311599003|260925021911599003|4143699003|11063799006|56012099006|261009223027099003|261028144727099003|261021121427099003|261021123027099003|261026121527099003|261026140227099003|261022075727099003|261022105027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	TpFdNC0W/zlosvZAexFvfzsKT4J8ZZhoKHNdcOuiEKr+BAaaXwAwrnLWzOb9D3kiekKbWCEKlex3/iDNY7DmOvH8DVkBdQer+cOwnmhTkchq3eMKuvgWVxahrqcpjMQhp+xTdvudSEYbLHJG+3U/Og16K3RHto+LJTvi2HkcULQ8/fT2dXAAEiW0iXJ6GW9mGERNiQ1DZneMLbIv04UI9RgkbxKRSu4AUJffpE1tqvJPQ+/M99aoQ9yhi7+GE8sATczSyoWqysiHWAWuI2l16L6/laN0M8SjZGX87IbuN+iUuH+CVHZwuMTw+iTnIzXLvFgrSkX7W8tB0VjA+cMXMoLU8RSA4NLXs/WRBmuUWBrTJX9bzRtDhOqCJrZJ0FQTMAYoTuevAt7aBud1vxMPfBpWBPBp145eYbhyV+FHYlL5qe6LJQ1mME5efbEboR+zWE3uKxkwsCaErwMY0lgeRb3ltJjQDh0BBRYFhk67D6bOqbGFgxa04AM900Sj5vQ8VjGYyNtuun+KgSYRqeeeuEfp1m+WdO3Msydm3E8fVNTyjksAT3eIqBm1iYMIDRoRHYG6UL6U1twvOzJ3M7AhFqau4YARy9TENoOkvQnVZTmH0UdC9gLFVq6YFmP99oeseSOGhUM+h6647TPfnQu3J3ATlIUAm1kFb447D+AojsE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(260925022911599003)(260925021311599003)(260925021911599003)(4143699003)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWZ0Nm81SzM3MW9hU0RNTStVQk1FZkNvaXRjZFZSRUlXY0VsSlRpRkpDRjZR?=
 =?utf-8?B?SkRHS3p3NzhpMitNOWNlVm5lWndYK1RXMUlFSTBxaW5FM2k4alB0K3QrTFJF?=
 =?utf-8?B?Q1JsSVFzNkhvdlZDbFhrZXZjSkVac01ydjU1b09uTXJyMlhlK3cxVjJIU3ND?=
 =?utf-8?B?aytweXc0a1d6RWxFS3QwOXU3SC9zUkkvWXEwMGEybHNtRm5HbnhxdlJJRytt?=
 =?utf-8?B?QnR5S2Q4V3FQdTl5dmFMcmd1UkZZNTZSWmlCTFNrL05LRVJuOXBKdXlPWFQx?=
 =?utf-8?B?YTdYS3VlTzdrbmZTVjhBUVFNWG1yaWdTV1RjMXFhVzJiOXpqdlF6WkpFSURC?=
 =?utf-8?B?Tm5WdWZZUU9mRStCWDNSWmp0M3p6MDlmaVNNdCtwNEd0ckM0RzF1SGo2eGR4?=
 =?utf-8?B?dnBkVkJOdFRxUW5ONTNyU210NFVBL0FPOG11WmxZbTFIKzFuYXpoUXZFdGor?=
 =?utf-8?B?K0FQM1l2MGcwTzhWQ1BkQjBWaW1TbUl4Zys3Y055Wjl5YUxrTVFUbitFSUlQ?=
 =?utf-8?B?UjdWbWU3VWJGVXhNN3RtSWRWTWllT29SM0pDNUZNRWxvcFViTmppaXVNa3hY?=
 =?utf-8?B?bFQ2dFVaWlZqNmlTZ1R5T3NCdkFmVXpRTUZFVGZOSzc2cFQvSmtheGVXUzlZ?=
 =?utf-8?B?dG5ETmx6QkVuNjB0eWFBVlM5NUJnSk9NZlVVaDBUN1kzT2swSnppR1B4UFBE?=
 =?utf-8?B?QUlkNUJOSnZDZmxOREVuVm9vNlRTS25EZldPc0RLYmJjU1JZZXA1MXc1aEJN?=
 =?utf-8?B?Skd0U2NLcWJTaHRLODRIV0FNbzJxQisxUTZNNmJ2bVJOb0tqckNUS2xkczF6?=
 =?utf-8?B?aEM4eW5nb0NoZE5CaVFIUkxIbW5VSG05SUdzYlIvKzJZVUV2bHB5T25HZ0ZC?=
 =?utf-8?B?UGVkTkZXV2Ric0EybnY0d1pJT1BPNmxLcFBnbDErc0lrdEhCdkd5S0gyOElO?=
 =?utf-8?B?VlVtSFowTEdUcmZ6czNmaVBGbFB4TU1WVHlsYVp0VjB6QXpYYlZnNTZTbml0?=
 =?utf-8?B?Mi9jMjhaWkxBOW91RWpBT2xsQ01qYzJUTlpkWEdsUEFZTDYwSmlHMmR0VndJ?=
 =?utf-8?B?a3ROcWZnWFpqUHZKR1AwbmZDbjI5ZmNWblBXbjNoeHJzNHVyV3hiMG5ta2hr?=
 =?utf-8?B?VjE4VllaQlIzT0tCZkJzMzUzb1Y4M2FGczdiMmF5RWdMWTR0Qmx3bkZUWlE5?=
 =?utf-8?B?WWdsdmpBc1hlZitwdnQ0VnhkdFg5ZmJVb1RPTm9kVnd1UUlWb056clhXWkZh?=
 =?utf-8?B?ejFwYjZwMXhydnlZTUJ6OWlJS3dWcjhFYXJLaE9aeGJZN0dTZVRpbnNBUDdl?=
 =?utf-8?B?dkZZN1pnUS9NYkFnZGg4QTl3cW5tVnczV1BqNVNJMkZ0Y1BMNWtPZm84UEwv?=
 =?utf-8?B?OFNQVkdCSVAwbUZtaGlTcjlpV21VUTFxa2JUa25pdjUvejdwdC9YaWpzYjFy?=
 =?utf-8?B?bkR5TlgvT0pTa3owZGJUbXd5U3hWU2ZvMUhGbVpjOG5CdTZkWGQ4THFYS1BQ?=
 =?utf-8?B?aVU5RFBEK0pja2wzbzMyVmlLK09wU25iUVZNWm9DRkhPeVZXQWFpQXhlbXc3?=
 =?utf-8?B?QmlzM2RIWmJCcHFsV2ZlUlJKZXVKdWt3Y2NPM3VQb0IxbXA3dm4yUUtpVUgy?=
 =?utf-8?B?QTg3YXJzRE1iWVJxazV0Q3pFc2hXZFZxOVlyTUhHWmFDNzdYTGFNamNOYzdD?=
 =?utf-8?B?RzBJOXNrYTc1RzdPaE56bXJnbnJKdXowSGxMbjFyZkhsUG8vYUErRnNNamxO?=
 =?utf-8?B?T1AvZjFWM3FXN0swSUh4STNGN1pmU0NoYm9pdjZqN3lkbG0veGE1UnhRVktJ?=
 =?utf-8?B?am5Yb3VNWTl5M2tTb3AzalhDY0hKRzVHcjJMM3ZpKzY2M1ljWll6L2VPWEFu?=
 =?utf-8?B?U09RbUp4VXptSUFBSThweGU1ZHgrY3BKZ2p4OHhhN25RS28vbmswN21lTUpV?=
 =?utf-8?B?L2pkaUcvNUdjWkpZcng1Z3hIbXYxNHA5MWNUMjQxRFJ6M2JSZXR2RWJrVCt0?=
 =?utf-8?B?SUd6UnNHcDc1Mm5BcXFibjVIbk1PS05qb2d3cEg0K0NQb1RLTVA4VDdTWGcv?=
 =?utf-8?B?amhSaW5LNUJVQ1dFSHlONHNXRkI4bFNWUDZybGcvb1RCVURwZWZ5ZzlqaUxy?=
 =?utf-8?B?OFRjcEVKRGZOU3NZNzVKaXRDSXU0Q1pqWEhSeEs2N0JuSmZBNkJ2R2ZDK2xk?=
 =?utf-8?B?U0xabW1PTGxudXNiSkljZGIxaEhBWjJRWno4YStvVG9jb3VSMnRWVXo5Wjhl?=
 =?utf-8?B?Tlc5UnFPdE1qYmdHbVQ5Nm9EZnMwbk15RzBjeE03YW8zdFR0RTdRSTdLRFlF?=
 =?utf-8?B?cG5HOWZzRko0MUorU0dEUE9BWStJZGN4Lzcwc29UUHZwK2ZTZ0QzZz09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0d1e81e-7a57-44af-ff77-08df38857ec1
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 02:03:31.9210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5aMqOPUOCsoCphQLfdIND6LQYgWO911/t05SdGArM61nOiJa7KIJ49W5R9whxxsWLQiWVL+lj0EtNRxsHtaG0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9024
X-purgate-ID: tlsNG-33051d/1793585014-770F64E9-08C8210B/0/0
X-purgate-type: clean
X-purgate-size: 6778
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Oleksandr,

On 10/10/26 17:30, Oleksandr Tyshchenko wrote:
> 
> 
> On 10/7/26 03:07, Milan Djokic wrote:
> 
> Hello Milan
> 
>> From: Rahul Singh <rahul.singh@arm.com>
>>
>> XEN will create an IOMMU device tree node in the device tree
>> to enable the dom0 to discover the virtual SMMUv3 during dom0 boot.
>> IOMMU device tree node will only be created when viommu is enabled
>> via Kconfig build options.
>>
>> "iommus" property will be added for dom0 devices to virtual
>> IOMMU node to enable the dom0 linux kernel to configure the IOMMU.
>>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
>> ---
>>    xen/arch/arm/domain_build.c       | 102 +++++++++++++++++++++++++++++-
>>    xen/arch/arm/include/asm/viommu.h |   1 +
>>    2 files changed, 101 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index cd2e09f005..6513140133 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -557,9 +557,12 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>>                continue;
>>            }
>>    
>> -        if ( iommu_node )
>> +        /*
>> +         * Expose IOMMU specific properties to hwdom when vIOMMU is
>> +         * enabled.
>> +         */
>> +        if ( iommu_node && viommu_get_type() == XEN_DOMCTL_CONFIG_VIOMMU_NONE )
>>            {
>> -            /* Don't expose IOMMU specific properties to hwdom */
>>                if ( dt_property_name_is_equal(prop, "iommus") )
>>                    continue;
>>    
>> @@ -1457,6 +1460,95 @@ int __init make_timer_node(const struct kernel_info *kinfo)
>>        return res;
>>    }
>>    
>> +#ifdef CONFIG_ARM_VIRTUAL_IOMMU
>> +static int __init make_hwdom_viommu_node(const struct kernel_info *kinfo)
>> +{
>> +    uint32_t len;
>> +    int res;
>> +    char buf[24];
>> +    void *fdt = kinfo->fdt;
>> +    const void *prop = NULL;
>> +    const struct dt_device_node *iommu = NULL;
>> +    struct host_iommu *iommu_data;
>> +    gic_interrupt_t intr;
>> +
>> +    if ( list_empty(&host_iommu_list) )
>> +        return 0;
>> +
>> +    list_for_each_entry( iommu_data, &host_iommu_list, entry )
>> +    {
>> +        if ( iommu_data->hwdom_node_created )
>> +            return 0;
>> +
>> +        iommu = iommu_data->dt_node;
>> +
>> +        snprintf(buf, sizeof(buf), "iommu@%"PRIx64, iommu_data->addr);
>> +
>> +        res = fdt_begin_node(fdt, buf);
>> +        if ( res )
>> +            return res;
>> +
>> +        prop = dt_get_property(iommu, "compatible", &len);
>> +        if ( !prop )
>> +        {
>> +            res = -FDT_ERR_XEN(ENOENT);
>> +            return res;
>> +        }
>> +
>> +        res = fdt_property(fdt, "compatible", prop, len);
>> +        if ( res )
>> +            return res;
>> +
>> +        if ( iommu->phandle )
>> +        {
>> +            res = fdt_property_cell(fdt, "phandle", iommu->phandle);
>> +            if ( res )
>> +                return res;
>> +        }
>> +
>> +        /* Use the same reg regions as the IOMMU node in host DTB. */
>> +        prop = dt_get_property(iommu, "reg", &len);
>> +        if ( !prop )
>> +        {
>> +            printk(XENLOG_ERR "vIOMMU: Can't find IOMMU reg property.\n");
>> +            res = -FDT_ERR_XEN(ENOENT);
>> +            return res;
>> +        }
>> +
>> +        res = fdt_property(fdt, "reg", prop, len);
>> +        if ( res )
>> +            return res;
>> +
>> +        prop = dt_get_property(iommu, "#iommu-cells", &len);
>> +        if ( !prop )
>> +        {
>> +            res = -FDT_ERR_XEN(ENOENT);
>> +            return res;
>> +        }
>> +
>> +        res = fdt_property(fdt, "#iommu-cells", prop, len);
>> +        if ( res )
>> +            return res;
>> +
>> +        res = fdt_property_string(fdt, "interrupt-names", "combined");
>> +        if ( res )
>> +            return res;
>> +
>> +        set_interrupt(intr, iommu_data->irq, 0xf, DT_IRQ_TYPE_LEVEL_HIGH);
>> +
>> +        res = fdt_property_interrupts(kinfo, &intr, 1);
>> +        if ( res )
>> +            return res;
>> +
>> +        iommu_data->hwdom_node_created = true;
>> +
>> +        fdt_end_node(fdt);
>> +    }
>> +
>> +    return res;
>> +}
>> +#endif
>> +
>>    static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
>>                                  struct dt_device_node *node,
>>                                  p2m_type_t p2mt)
>> @@ -1525,6 +1617,12 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
>>        if ( dt_match_node(timer_matches, node) )
>>            return make_timer_node(kinfo);
>>    
>> +#ifdef CONFIG_ARM_VIRTUAL_IOMMU
>> +    if ( device_get_class(node) == DEVICE_IOMMU &&
>> +         viommu_get_type() != XEN_DOMCTL_CONFIG_VIOMMU_NONE )
>> +        return make_hwdom_viommu_node(kinfo);
> 
> So all vIOMMU nodes are created at the position of the first pIOMMU
> node, right? If so, could it be possible in real life for IOMMUs to sit
> under different buses (under different parent nodes)?
> 

Yes, for hardware domains, all vIOMMU nodes are inserted at the position 
of the first pIOMMU node.

If pIOMMUs are located under different buses, the guest DT hierarchy 
will differ from the host DT hierarchy, with all vIOMMU nodes placed 
under the same parent. This is not necessarily a problem. However, the 
``reg`` property is copied from the original pIOMMU node and may 
therefore contain an address relative to its parent bus, whereas the 
host IOMMU list and the registered MMIO regions use the translated 
physical address obtained during the SMMUv3 driver probe. This 
inconsistency could prevent the guest from accessing the vIOMMUs correctly.

I'll change the implementation so that vIOMMU nodes are created under 
their corresponding parent buses, preserving the original pIOMMU 
hierarchy from the host DT.

Thank you for noticing this.

> 
>> +#endif
>> +
>>        /* Skip nodes used by Xen */
>>        if ( dt_device_used_by(node) == DOMID_XEN )
>>        {
>> diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/viommu.h
>> index 844cf34d56..5ae21042f0 100644
>> --- a/xen/arch/arm/include/asm/viommu.h
>> +++ b/xen/arch/arm/include/asm/viommu.h
>> @@ -20,6 +20,7 @@ struct host_iommu {
>>        paddr_t size;
>>        /* Used for dom0 EVTQ and GERROR interrupts (1-1 IRQ mapping) */
>>        uint32_t irq;
>> +    bool hwdom_node_created;
>>    };
>>    
>>    struct viommu_ops {
> 

BR,
Milan


