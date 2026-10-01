Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57C2CA5FD2
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 13:17:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438332.1657196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCGep-0000Tz-ND; Thu, 01 Oct 2026 13:17:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438332.1657196; Thu, 01 Oct 2026 13:17:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCGep-0000Ts-JQ; Thu, 01 Oct 2026 13:17:07 +0000
Received: by outflank-mailman (input) for mailman id 1438332;
 Thu, 01 Oct 2026 13:17:06 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xCGeo-0000Tm-Op
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 13:17:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCGeo-000OQ0-5l
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 15:17:06 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6abe5d48-bab6-0a2a0a5309dd-0a2a4502e42c-24
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 15:17:06 +0200
Received: from [52.101.85.50]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6abe5d50-6ca4-0a2a45020019-3465553213da-3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 15:17:05 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB5847.namprd03.prod.outlook.com (2603:10b6:510:35::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Thu, 1 Oct
 2026 13:17:02 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0451.026; Thu, 1 Oct 2026
 13:17:02 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q35i35cXKkZCIu0Z8zKo/TrsaQfUppRlH+IdbaDxeuNc8VjKUI5+RAZRU9jXeedFthzEvvxDnPdo8NhnhpBeDt2TZUfkGTpNxdIkR/6nMp1giRQqwG2CEKfM2EvSkze2jJGPh61GhVlFyNaJsSyPcVvuZr0shkjyhDyXGaaugrRRNCttluRuSuu+vlRd4+OmsVz6CZe9EQAN6EJ5GdvkZY3uwk80+cQ1VBXEAhE7yYMD7kUtHzkwuncLwcP9mGrtnfwz8509oL0DV/aXi4+HjUJ968jACimdEpY5d56+/wj0oAbCcvXGeawX1gEPPDoKzQ9j2dY7cr0RoRlPSv6s2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pyP/jQ+ZhCjRF5zBitK2wtGaCPOBactiBs6oTJjvKgo=;
 b=U5bKfZSnUEEcs1BqD77LbzQb1unX+R3SeIlgrWjXvOqJfDlLZq3uGjjpnL7Jjz35AEjWAfK1DHYKZZ6DGaytyxgI2hlSP/Xwx7c2vScvhRfX2yu+exB4yOPD8WwrUH6MwVs1ddXLh3eEbzoQuBpVQdtFwbnMP43iqoJW+QjyMO/UjCrIYkvrcW8x4kF5D/ObJ0r4DOl0Ol8NmmS9YcK1UKgAwqc5Gm/voxQrS+cxfYOWNtLXoYGi6oKW8MWkaMsz8w+P1ibCQDp8fCrCsj++OYUJgHGCbNUKlnwzTJ1CRPyXR+pvDN+vELnnqXgHrptJtUCntzw0qIN/r4edq5gbwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pyP/jQ+ZhCjRF5zBitK2wtGaCPOBactiBs6oTJjvKgo=;
 b=Do7aMrJkWg5qh1GDHHfCisRfCqbb2MJluDxtwZ8RV+ySn3DT+lDnyR18LheyzhnXlBbjrkVUHkaRb7BISujhslncGSjCMi5AxuzPfMX/OENRdpCGIIsPW7MNrKggUzX2CoXKGNoXZLp4rwCgiZqFn+G22kF0Fvlcwkcx1vapelo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3cb25b4c-6470-44a4-bc46-55776317ea67@citrix.com>
Date: Thu, 1 Oct 2026 14:16:57 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org, Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH] misra: deviate C library-style functions from Misra
 C:2012 rule 11.8
To: Jan Beulich <jbeulich@suse.com>
References: <4abcb11ef287170ced74935cbee60c90058c1307.1790671787.git.dmytro_prokopchuk1@epam.com>
 <0a286fe9-2133-4f28-8fab-59f4e51d1484@suse.com>
 <446354d93ae04a07b86d7293705d7e46@bugseng.com>
 <0373fcc0-5bc9-4140-a2c9-52a31c7e42b5@suse.com>
 <2a8557d7ba88e95ec75148ff180ae0a0@bugseng.com>
 <f68982e1-f46c-4640-88b7-36ef362bf340@citrix.com>
 <cefa3793-a319-4041-9204-fb115b9c5511@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <cefa3793-a319-4041-9204-fb115b9c5511@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0551.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB5847:EE_
X-MS-Office365-Filtering-Correlation-Id: 5906b5c8-ec6d-4b8a-e536-08df1fbe47ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|4143699003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	R+PzlEJloZdr2RfoWtvMAAtOu7vnfz1n8HWh6gDkifXzeC+1Nx4LyihHg8I/VeK8a1wJc92NJz66glE1AW7Ycaw4fPnXzvbQgaFwnj8cSpiaL7rYi0MgQl7vWVxUEyfCJg+Yk7DJNvA+0G6VkC8AcRcDWsQ32j2VG0C+mvJ8mvKk1JSvzapXFrZBYRVUplXUdvSXUCUAVCqq4JGsP93MK3gGyUJM+EQjy1H/Konk1jpMwrgPvYVpJxC0elKWhhVLu5Ye2wbUreNwqDeWVpS11mz5ixjsxmzxXa7ugtjGR65dGcT+mz4j9e3XyC29ILq+PE9geyeTx7y9b3wMND+YLI0gPq3vC0tt+3EZWS2LtetuN8/JUF4apfDtLrjqmGy8jDaHD0jqjfcwoUtrJzl4GqtsbbKrWAoIjBw/7zSADaJZyqmkESgFEIgyxphqLQK2Ym9ow8BDwL0bLD31ClT88I61oGxfCC+SUnjeH6W4UFA5h6s93ml0w/oOC2kEOpEBz/dyYNRdM2GMLTySHmTftXZPogQ5j4DtnjgbUkfd3XMhESL3m+4rbEnqrXsS87pLzFhEPpEiQQVV8K5VgDv0pox/H5b2gOOUfmGiiHI/N8e47mvyLaY1X4b/QYePoEhPuM6T4vUlmeyxocDtil711rUQdu8DJk0GWjes1NBe+9U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(4143699003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzVaZ0dMa01TLzJwSWJ1Sk0yLzc5Y3FXQ3N6T1diQXZIc2xCbmxnWkpiVDdN?=
 =?utf-8?B?djhhL3BDSUdPTHRQR1A2SURndXFuUWxwVGdtbTQ5V2ZZRERQNzZ6SXhWclRm?=
 =?utf-8?B?SDIwRk5ZdGhpMVFuSTBibGNkbjg2UGo5N0JHbXZqZU83TzVockhyalRJOU0v?=
 =?utf-8?B?TjZzQTBGbW5xQ2N1SnBoTUhCT3VoNHpVNzhialV4L3NGaStTOXk1MDRaN0sr?=
 =?utf-8?B?MkpHNzQ5QVFvYlh1eXRleVNoS3dDQXRRakNoQVVkUFF6dWtyaWUzVndTZTdZ?=
 =?utf-8?B?SEZ0eGdBNW9IaCs3UkpwbGVVNFY3akE4eVBKeDd1dUdSQmpiSlhEcDVSUEg5?=
 =?utf-8?B?eThkZ3pjRFF3djkvOTZlNFhmczhXdzI1NGYyLzl4WGx1ZjF3WVVWSVNUak5X?=
 =?utf-8?B?QjRqMjdoSG8yTlA0dk9sWndIYk1HdHFtbzN6S2tFS0lTZkhLeUhOc2lXNVBF?=
 =?utf-8?B?NjRGU1hNYWY4MHd2R3M2THYxUEhJLzNwYS9QbU1mdGpGSEw1ak5qYW1YVnBp?=
 =?utf-8?B?NHFiWjdRVU9rUFVRSjZBejJOZUNCN3lyUTl6RWJseCtwbEczbUVsNEJXeE1C?=
 =?utf-8?B?KzlONzMrZ0VmSVJuQ0NWSTV2Znk4azEva0JwM0c1L0s4RzhLenFUT0lvR2ZH?=
 =?utf-8?B?MksxeWUrMzlIUUJlSzcxWTF2c0hMUnpsbWtrQittM05MN0pPR0NuNks3aUlK?=
 =?utf-8?B?RnZ0b2hVNUdhMWZucXlMdDV0QytiVW14N0pDSWxXanhkWDByR05VZ0VOb0FL?=
 =?utf-8?B?bytXemVBKzdoVExKWHAxV3NzVm5CZ21TU2FoaDBDWndVVUtJYmE0TTY3TS9o?=
 =?utf-8?B?cTlMNEZUVm1lSUk5UXpodmlvTnBPRXJiSzB6YkdmdkxMdUVwa2ZzUXp3WXNP?=
 =?utf-8?B?aUxrU3hxYUZnUDBkbUc0NDN0VG5VRzhpcXZFT21pSUk5OUdXTWxxQkNSZHdX?=
 =?utf-8?B?MmhqUXRHOFFNR01hMzJNR1lrbnlpZmd5S0pSd3ZkZmVjd0dEZEFlSGIwbEpP?=
 =?utf-8?B?VXdPaXBRa2kxV0R2b05IMWhRVXlHU295SnVENWFyL2o2bW9QbFNpT2FPWjIr?=
 =?utf-8?B?MmU5eE9Za3ZJZHo4ditnS2sxZWFzM1V4Y1psSGZZRHZtc2ZhdjJZM1RYTVBD?=
 =?utf-8?B?TUU0ZWV3U2NnSlo2cG1HZWVublR5KzdqL05lc1p2U2NWY3MvN3hCclRFK3Bj?=
 =?utf-8?B?dGFRMXF6ck9jUEdSbGRDTnVFM3Jld0R4Z3lsTVZKOStxbmRwZG9TcVNsZzYw?=
 =?utf-8?B?VXpBVzYyYUEwU2dKRjYzMzV6VUJHT2R3R2JEcTBlbzZJMFM2b1lFSGN2bFBi?=
 =?utf-8?B?SitqTUp0em5LaXJtcm81WmVGTDUrZlVDK20rOS9LVEY3NERtYW5wMlYvbXVx?=
 =?utf-8?B?MUtIQTZrU25zTDlCQW5nRzgveWNENDMzcC80SUxGeTZpSUsyczFPa1dtc25S?=
 =?utf-8?B?OEl5cTVMbkFKSXpnbjdlMDBuV2NrL3JOVzdpTW1GZXN5dEphck4rQU9tSzVR?=
 =?utf-8?B?eVVjZVRnYWcyRzM5bzhEdFREc2tTUFpFSDh5eGxmUlJVbjhsR2JSajh6MDVK?=
 =?utf-8?B?SUcvL3JWTjIveGFYU3JhVjhwZmVoRzlEUXYwbWVDS2Z0dmFFcU1qTi9OZEwr?=
 =?utf-8?B?RjhBV0xoQ2JRYjg2VUprQnd4clBvdXByKzl2WVhBSzRRV3hjYWdPTGFZbXNE?=
 =?utf-8?B?Yy9iV2xnaGtSSEx0UnB3RWV2eml1UTQ4d3ZkSDlDWUZMNUJIM1RMZlZ3R2cx?=
 =?utf-8?B?NmQ4bDlFblhMV2pjZ1kwS2tFWjkxVTdYRFdzN0lsQk0rbEN3aTZPVkYrZUt3?=
 =?utf-8?B?TmhTRytoc0dVSmFDRUpuMFNDaGVlYU1NTVFPSWJ0UmJqbTExdnFEQmRrVDdO?=
 =?utf-8?B?cm9FOFQ2RmZPdWczQTNmY3dCWjB1UVRGRFM5Q2FYNXpXTUlRUEc5Wjk0L1hp?=
 =?utf-8?B?MXkvelZkeE8rY3hkNk0yK2VJQi80aWJDSXFCOG0xSWtka1h2OS96aFJXWGVK?=
 =?utf-8?B?Vi8zWDZTUnNBbGZXVEMybGdQdkpyWlNDVFAvYkdHL0RlRklDcUZyWnI5UEpU?=
 =?utf-8?B?N1JJYWFJT092ejlLL2FvT2xsMDc3SXZ4Mkk1ZTdiL3JZQmYwM0dCR0JDc2NF?=
 =?utf-8?B?bXo3b1dnMWFrL0lhQXVwNGtHSXBYRUYrcnhjTjNJeXkzN255dGpXRndaOThZ?=
 =?utf-8?B?RlIzdTY5MFIwSnluUWJITmhTVDZ2WGc1WGNGRWJUQmxxS2d5ODlpekxacng0?=
 =?utf-8?B?L2d5MnQ3OXlrM2pzZEp0T2kvQ2RCQ0VabGNuSHlXdHlQbWJQeEdDR1FzeGZB?=
 =?utf-8?B?eG1SQ2NucDV6Ri96UTNjeXIrdGNwdzFxSFczbHZXWGxDQkdsaTE4UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5906b5c8-ec6d-4b8a-e536-08df1fbe47ba
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 13:17:01.9638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dN/+7a1QMi1v4DVRNzs8kZ/DPRl/ZNhGjmQG99SU2w/eYTNG9UfcLH6UNYccpWAwZr2CVUbiDAgGERhHrint94InTMIJrI/mXyYf2yQpjnQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5847
X-purgate-ID: tlsNG-720697/1790860625-662A92AC-61CF9459/0/0
X-purgate-type: clean
X-purgate-size: 648

On 01/10/2026 1:43 pm, Jan Beulich wrote:
> On 01.10.2026 14:39, Andrew Cooper wrote:
>> We want _Generic() for const-correctness reasons only.  (And possibly
>> API transition work - this has mixed results but can substantially
>> reduce churn in a series if done well).
>>
>> This depends on moving to C11, which we need to at some point anyway
>> even if weren't for _Generic().
> Why is this? Can't we use _Generic() as a compiler extension, i.e. without
> fully going to C11?

AIUI, the parsing rules had to change in C11 to support _Generic()'s
syntax, and IIRC Eclair can't parse it without specifying C11 or later.

~Andrew

