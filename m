Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE1C606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 22:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=gKPfOeRC
Received: from list by lists.xenproject.org with outflank-mailman.1493291.1693355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTRKU-0001gT-OW; Tue, 17 Nov 2026 22:07:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493291.1693355; Tue, 17 Nov 2026 22:07:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTRKU-0001gM-KN; Tue, 17 Nov 2026 22:07:06 +0000
Received: by outflank-mailman (input) for mailman id 1493291;
 Tue, 17 Nov 2026 22:07:05 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xTRKT-0001gG-3H
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 22:07:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTRKR-002POS-Tb
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 23:07:03 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6afccfff-bab6-0a2a0a5309dd-0a2a450caf86-12
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 23:07:03 +0100
Received: from [52.101.66.95]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6afcd007-f479-0a2a450c0019-3465425f7ec8-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 23:07:03 +0100
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by PAXPR03MB7967.eurprd03.prod.outlook.com (2603:10a6:102:21a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Tue, 17 Nov
 2026 22:07:01 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0592.009; Tue, 17 Nov 2026
 22:07:01 +0000
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
 b=DTC8zlF077YOz5mZkcL3n4LuuuQfikiY7w+zI/rDLoLS+LOWYnDK8NgFdpH12MoQYA2KS36UGBOnTzJHGFDRM31q/3WAWA93+P7udD20B0+qXlotHitfEAJz0IEMePws0iHuC/mRdU15J+zoBF8H/SdQbYoCqhbWlO4/6okQJ90MiJkN73yE/F3kqcr8rdcCaJh8+vRn4tqzXM3Ibb2kdX+Mgl8O8i0s1vphNM3MSuD9faMfnOhV4K6olpnEY4omXetuwf5uM/GgKMd1++H4nU9XzBrkSiALmonIBI498zPR9mtF3Tu66yiQSvJ6+BamJPwJfp4ulkkFBBYzQ70PPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WfdT4opn+PqZahDCW+jN3XeR3CU8vc7tUOLTzTaeTWg=;
 b=mpxFhY757tqBdo5pd5mw8MVUuwdaelUB3Sy3KngN7cxcT1GjkYfkQy17a6ykhub2S10gNagjIA6Tt7kJBGYw503RcLG/OQJP0daM8zZbRbpkTBcTLLMyWlhk5kEF5/cppFMhU1VHH+vb9D40R6/3xbqml/JAImkti0XRriGo5Wfr2OcTrixlk6WfeB4GtLx/GPxKe74ffTpUuzpGutdO/Z2crGzuNO5D+RD/l1qEzDR5veDLMvqqd8O52zoJQZtqbiUwaAZBaj0epoEmAx4X457zRo8An/CRBtPud3kl5rrNXvnJNjolaZNZ5LHJS7KPMhoKpy3QGy7yAekMxzDv7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WfdT4opn+PqZahDCW+jN3XeR3CU8vc7tUOLTzTaeTWg=;
 b=gKPfOeRCnhAiVZx+I4m2a0tmdXShuG7yg7Ycf2uD096N8vIoi+5uLR1BJRNtAxZv78RFbpAVvAwptvoJzWJAi2jaoxmaj1XDe2nh+0E/ctGs4FUXLOqu/zfgj86nct/hXiFjWAjTTKOxmRmEUqPdhSRBJfYO7C5kKlEpiWa1A22nCcUO9UylsMtq7laothBszIZUeZIJIQv1BwrznRyOtGEn8ZJRE0LZk0ZerJN4dn/fOjuhGS8ZAYv624AxGtnDYXfAG9x1fSRO+D3MDm6zfGwfgwQrSqrhZf9x0N+yDh2KHw6swuOCCacuhGxcbjtD5JA/wJpj14rjIua0tRUOwg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <50debbcd-c110-4151-8330-945ca8293f05@epam.com>
Date: Wed, 18 Nov 2026 00:06:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: deviate MISRA R11.8 for the one-time SBDF
 initialization
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.com>
References: <ed06386df3f5ae485a409e8c0bed10b01d7fd33d.1794948091.git.dmytro_prokopchuk1@epam.com>
Content-Language: en-US
From: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
In-Reply-To: <ed06386df3f5ae485a409e8c0bed10b01d7fd33d.1794948091.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: AS4P190CA0002.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::11) To AM9PR03MB7526.eurprd03.prod.outlook.com
 (2603:10a6:20b:3de::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR03MB7526:EE_|PAXPR03MB7967:EE_
X-MS-Office365-Filtering-Correlation-Id: fa9145ce-ab58-408c-f8a7-08df44f71b1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|261102123227099003|261028144727099003|261022113327099003|261022105027099003|261022115727099003|261022075727099003|261021133027099003|261021135927099003|261021123027099003|261021130227099003|261026121527099003|261026140227099003|261026130827099003|261026135527099003|261021121427099003|11063799006|56012099006|10067099003|260925022911599003|260925021911599003|260925021311599003|22082099003|18002099003|6133799003|261009223027099003|4133799003;
X-Microsoft-Antispam-Message-Info:
	+E2L+MBFQOusb9SFg0/UlKaeVRSHjoBUfZ4K4ABsRtTb9BBXQJwc+PnuMyjgDV1NUijtXAh/v6i+fW/mcI8FJhWD9hKjiL7Q8GCa3V5+zXcUnS++4bVBPs3+toPyaKhgpvbdzBIqYlwllWUPrNHne173UaiDqX6cgucP02fni2Py93zN3kwndetdBAWYfS3Ej5zERkMftl/Yu2dU4llTmOOVAOaLpM60YVGBFfGJ2rhNaMPwOCy8Uw8qcpb2tGhJCa4EMA76Isf+85E77PE8Gl/UFvVPzwEmVKcry1Z4gwiOsO5R7ODAZebdYvkXS00b1/LMcXG01yNx7MUy/Cm3B2QziAMLoMaIeG5sha7QncctBM/DHz2hH81/J6qBLSStVdzsfZp/GjOymLBm649l36GwWr9P4USf3iGhZOWPSY20+Cp9qVMq9LYIZq8LDCGqmrLhssU/pDN6sKKCpGBSGD0xrbUk6lwEPjUeSjKFlzHgKR7q88FdUQlr0ZJTBOZS6jhfBWibWws+3ozy23vzqSWrd5gjjduQRM3h2zoc84+xYcyoL18DgB8wsTT31riVp7/7fT+TC8Dfu7CGYtK5zljmDf0MBczOk5Nczlpm4459S4j2CgQB0f/f4vgESDcH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261102123227099003)(261028144727099003)(261022113327099003)(261022105027099003)(261022115727099003)(261022075727099003)(261021133027099003)(261021135927099003)(261021123027099003)(261021130227099003)(261026121527099003)(261026140227099003)(261026130827099003)(261026135527099003)(261021121427099003)(11063799006)(56012099006)(10067099003)(260925022911599003)(260925021911599003)(260925021311599003)(22082099003)(18002099003)(6133799003)(261009223027099003)(4133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVAzYlZWcFQxM3NJRko5eUVGemVUZ0FrdWtoQ3FuUTgwcW5TZTFpellBaDZV?=
 =?utf-8?B?L09ncHpBaWFBRVJXaGlFQ1p4T1pIVXFXeU0xMUMzUmhaekR5Ri9wSFhBNnJZ?=
 =?utf-8?B?L0RaeVc2dDRFVGdDSE1TZ09xZjI5c3llcEExbDJzbXJkZnVBUEZYOHJ0c1lH?=
 =?utf-8?B?RnNQd2RyWEJRRHdheGRGMmE2bGx6ZWZFVGdsR0MxQklONEV2YlVvN1RMZmE1?=
 =?utf-8?B?Z3NPa0JYNTJ2aEUwLzJ2MHRoWCtYSXY5cXVMMW9rdk1GYm9oWlprVDF4QmpW?=
 =?utf-8?B?QjdORk5sZ3kvTDhqajU2dDQ0NkpWU2dqU09pNjNzRzZCWmdpS2hUV2M5d0sy?=
 =?utf-8?B?dU0zMUdudDdlSzlPYlRnT1JQTVJ3alRLS3RlbllRaGQ5US9ndGxaMlFOMU02?=
 =?utf-8?B?SHFVUXJLeWZKU2tnQUo0MEFKK0s0bUd2dU9GR1hUOWVHbDlxUlF5ZzRMb2d2?=
 =?utf-8?B?eG5GMFFKSXR6RjhoR0h5RGQ3R2pkNEYxcG5uQUxxR3JvcitYdThsYnNta0ln?=
 =?utf-8?B?Zk5DUEV6dU9OQUxhTmFBQlEzVVBneTZWcTFlZC9MdDRiZTNRRHVDTGpvaFpK?=
 =?utf-8?B?eU0zSzYzWUZ1UnozWmRueUdyYmFtek5weDJZVm9xSEhpc0VZQk4zc0JLWnRm?=
 =?utf-8?B?ZW11anFUVXpFek1CZU1SQVU4R1M5TENSLzA2VUtLRCs5Uk5mQjNQY3U1U0x6?=
 =?utf-8?B?L0pXUHpxaWlkek9LMTljL0RvSzN2d1BWMzJybWEvek1tbWtCRmhGZUhEVytK?=
 =?utf-8?B?RzJiUjBPQmhvdTJ0ZEEvbVNSN2JjVGdWZFFlOFFJcklneG01cDgzUW5FdUdi?=
 =?utf-8?B?TlQ0U3BtNlMwOXpFNG1xSVhQbUtwNFR5UTRZTjlEcjZiN1J0ZENJNXpINVlC?=
 =?utf-8?B?S3RFdWlhWnRVTEdNVXJkNTdheVVqRWZzYUZkVWNEL1ZMZnlRVWRmcDZTcGwy?=
 =?utf-8?B?c3pMWEVMQVV5KzFjaG1GZEN5UHN6dUdDTkFBaG90ZU1ZaktzUWFrNlZuaUp0?=
 =?utf-8?B?L3E3UHVkS09DYVMwWkM4dXZZOU5QaHo3MWljenBkNWJPaU1wZERwZytZYVVs?=
 =?utf-8?B?TkY2c0lnUkdwbkJrZDQ1MmNpeXhDaXBHZnora201ajBXa0dDT3ZaY0N5SFd1?=
 =?utf-8?B?RTBudDk1TWlNSkJacTI4YWNmZXNlZnZHTXBiRHVIaWc0NmxJdnJJKzE5UFZ2?=
 =?utf-8?B?QzY5dWoxbFRjNG9GMXVuSjlraDljb1psNjZqMnJySEVnRTV3R2E2ZVhMTWRI?=
 =?utf-8?B?bEluTFVQODVKeHBLcEpkcjhDcVZlRmVhMG81bDNOVXdNNTdTdWxoZGtKc3gy?=
 =?utf-8?B?bHovU2l1Unc3eWdoMG1VMWxBTGNjY2dsS29SMDcrNnZVaFB0SDBmbUx2NWw1?=
 =?utf-8?B?d3BHMlY5azE4eUdhWWJFU0RuOUpDN1p5ODhDdHQ0ZlpyS1cza1BXR09PTWRP?=
 =?utf-8?B?NENETVZldStlQ2QzNWlGUmVQYnRpQzlLRE4yRldNOTZXekppc3NIeG1ITEpo?=
 =?utf-8?B?RS8zK2Vha1NHWDVVUDFPWVNDaEhwMko4WXFZWStoek5UcVpjZjNPMDUyWXZL?=
 =?utf-8?B?NUtISHY1ZGxWWVBsTS9ZMHpFR0lTNERqZjFwamhRSlRROHVRTDRwRW9YenpM?=
 =?utf-8?B?cWdlMXNPUUJ2SlJ6SytZcXZmMWNBNTBwbGsxUzlrc1Jibmt2MG9tdHdGWHIz?=
 =?utf-8?B?Q3g3V21RWVNXbE5LYkVQd0hyZFpiR1RtZFozOUdwQUFsUC9BV05qTWZIU3U3?=
 =?utf-8?B?L3hHZFNod0x4ckVadlNnQXIzTzR2ai8xelY0bFZuZDE2TTNSenBJQmdYdktW?=
 =?utf-8?B?MXN0QlBsN2hCdURnVlFmck9NSVdtRktEbUoyUmJVMWpKWGNFOEZxOU4rU20w?=
 =?utf-8?B?QlJrMm1oa0cvZzd3V2RsUC9kYWxEdFhlYjhJcmVDZDBkMEtZam94MDJndlZI?=
 =?utf-8?B?ZnRNbVBwQkJGU3RHS3FFNlZJUE9GS3ZLNis1OENpMGJ3VFYzTUp3V0V0L2Z0?=
 =?utf-8?B?WE1WbHVqWFBpTG1RTUFZekNoMDQ0eVJSOUpSK3VlRWRiNUFlS2hDTjR2TXFZ?=
 =?utf-8?B?K2dIdWNzMFhJODVZY2RucFZrOE1iUGd2ZVdOUG9lZWMxUng2WmJ0QmpTdmx2?=
 =?utf-8?B?b3hwZUM5SUNQUEVsem1UNUNQbURUQk9iUG9zRkZITFUybWhEcnFXdDREak1U?=
 =?utf-8?B?ZXBIRmtnV3JWVDVqUEJxanVEeTdqWnNLb0dsSFNTOC82OGJBMDFjVURTc1Jk?=
 =?utf-8?B?eFlhRVUwRDUzN2tUOWkvc3Rya2tPbDRYRExlWGFMekEwMWJjdUt0TlY3YnMv?=
 =?utf-8?B?blVqQlBwUjJhWW8zZmpVeFowRkQ4NjBCNXJwam9rbm1sVGppd3oxVUhTdlds?=
 =?utf-8?Q?Y+v1/2by7WlMguyE=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa9145ce-ab58-408c-f8a7-08df44f71b1d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 22:07:01.3747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YKyxqbmQQhWj49GRZtDHRL5fLzgVwUt4WkaTzk5q6WbGmxdtDEHXxpnNVP35+01eRWevYyTQy0PLzCVyaBA+0BvVrHQ0ulPaqaMcJDQv4Ko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7967
X-purgate-ID: tlsNG-d25034/1794953223-01AC4A5B-7D13843B/0/0
X-purgate-type: clean
X-purgate-size: 2559
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/17/26 22:55, Dmytro Prokopchuk1 wrote:
> MISRA C Rule 11.8 states: "A cast shall not remove any const or volatile
> qualification from the type pointed to by a pointer".
> 
> alloc_pdev() writes the device identity once. seg, bus and devfn are
> members of a const union, so that write goes through a cast that removes
> const. Three such casts performed the same initialization.
> 
> Store the whole sbdf in one assignment and document that cast with
> one-line SAF-15-safe comment.
> 
> No functional changes.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
> Test CI pipeline:
> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/3081067362
> ---
>   docs/misra/safe.json          | 8 ++++++++
>   xen/drivers/passthrough/pci.c | 5 ++---
>   2 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/misra/safe.json b/docs/misra/safe.json
> index 3584cb90c6..3503d2e808 100644
> --- a/docs/misra/safe.json
> +++ b/docs/misra/safe.json
> @@ -124,6 +124,14 @@
>           },
>           {
>               "id": "SAF-15-safe",
> +            "analyser": {
> +                "eclair": "MC3A2.R11.8"
> +            },
> +            "name": "Rule 11.8: one-time init of a const PCI identity",
> +            "text": "The cast removes const only to initialize the const pci_dev identity fields (seg, bus, devfn). The const qualification prevents any later assignment, and this is the only write, performed before the device is published on alldevs_list."
> +        },
> +        {
> +            "id": "SAF-16-safe",
>               "analyser": {},
>               "name": "Sentinel",
>               "text": "Next ID to be used"
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 578472d068..14d59b1293 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -329,9 +329,8 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>       if ( !pdev )
>           return NULL;
>   
> -    *(u16*) &pdev->seg = pseg->nr;
> -    *((u8*) &pdev->bus) = bus;
> -    *((u8*) &pdev->devfn) = devfn;
> +    /* SAF-15-safe R11.8 one-time init of the const PCI identity */
> +    *(pci_sbdf_t *)&pdev->sbdf = PCI_SBDF(pseg->nr, bus, devfn);
>       pdev->domain = NULL;
>   
>       INIT_LIST_HEAD(&pdev->vf_list);

This can be used as alternative to this Jan's patch:

https://lists.xenproject.org/archives/html/xen-devel/2026-09/msg00048.html

BR, Dmytro.

