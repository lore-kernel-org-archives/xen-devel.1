Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3AAC55822
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 08:43:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383039.1626298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrXDi-0002Mp-GE; Wed, 05 Aug 2026 08:43:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383039.1626298; Wed, 05 Aug 2026 08:43:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrXDi-0002Mi-Ay; Wed, 05 Aug 2026 08:43:26 +0000
Received: by outflank-mailman (input) for mailman id 1383039;
 Wed, 05 Aug 2026 08:43:24 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wrXDg-0002MN-Dx
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 08:43:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrXDf-008yvM-Qv
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 10:43:23 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a72f7a8-5cb7-0a2a0a5109dd-0a2a450a81c8-4
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 10:43:23 +0200
Received: from [52.101.48.69]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a72f7a9-f2d2-0a2a450a0019-3465304536bf-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 10:43:23 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SAWPR03MB989599.namprd03.prod.outlook.com (2603:10b6:806:55c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Wed, 5 Aug
 2026 08:43:19 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 08:43:19 +0000
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
 b=EvVsttTWUj647XbRZLCHNglDPkLrMD2EzpTCINOJ7HDD0wkdBsIrdZL4TT/ogCUKnp7oqtL4mhX3YS5HpCH9JGq0+eYDxnJkIbqCYBfxbWZ78AZsUEegLOeWc3c9JEqtk553iJWAdYnKsfWcLahlLW7Xz+E0p02ve1ThdvutI6W+G9dPdAwhdoUdv+d1eTHKeo7GcLNLVnk4ZtP7L680yr8KNUPg1pr32sZSkIUppKzX4/zlPDRPUNr4imyJ+2E/Mq9NKKgqTckWx6dA9M+6mNUfPWMWgpn6bU1PZDt1olk+qWAzcdKq198EwB84wxlkY5ZzSxyNfaOWTmGO6YgBYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/RvCbaRfhs5kTs2/OCvfUueUwM9lcgQflO749DQY4Q=;
 b=cjY5nTsu4OBFZRuRIeORPXYKet3ZhKPcJsFn6or8Vhojn05iRGpTU2p7KMFra1xClCXqEvuPAmyIwL1OViu7qb8xmX0xQrrUZaD4GhlZjUAJQi0oHWwAFLthJTez1pvJ4cK5b+aQNlG7CZ4SvjNHRMokrNarIraX0f2ZaBC40DLLhJ12pQ5KKW0iyZlx+zoX3xTI1kHceFYzWxbdewg7XB/5XI/FSz86t3I3lKxlIy9f5zxgo9dzqcqAN+SExstZXI4LzyeusKlz2hkv0B9JekAG5QwpaUdrM8jlTnQST3OySNLMlvwwuxuq4ipXnEEHP8b4g5GYDO5SwNpPykyEyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/RvCbaRfhs5kTs2/OCvfUueUwM9lcgQflO749DQY4Q=;
 b=sHR/ZhOMgnkuV0u4iAjwUW/j+xDmFEg0s3MVxRYOOOOnQsKd4KPxwll6i0ZbSD60YTHlMM3rCGHGRvtkvdavq3giPsWcADN0qhPIbIJcl1tX63QTuO32J64kCQ2laUpnt8nATmtYk6WwWU2zoGGJUz0bOW9sUZud490XA0L9/0o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <cf26aa7d-2d67-4328-b441-a1c9b7bcd925@citrix.com>
Date: Wed, 5 Aug 2026 09:43:15 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 1/4] x86/xen: Remove redundant config dependency on
 X86_LOCAL_APIC
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
References: <20260805082137.1214967-1-jgross@suse.com>
 <20260805082137.1214967-2-jgross@suse.com>
 <08441834-6087-4cfe-8d56-ba660564384e@suse.com>
 <5e7d500e-7403-4a64-8e4d-50f1031716ba@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <5e7d500e-7403-4a64-8e4d-50f1031716ba@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0180.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::23) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SAWPR03MB989599:EE_
X-MS-Office365-Filtering-Correlation-Id: 22eff28a-ad6d-4997-c5d1-08def2cd998b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|366016|376014|1800799024|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	soc8V89rktikwsKPTbEUOLSSI/WTVsJGX8KJcQzxEEbrJqBWhPPH9rL5H6BSL1+HxNw2CLAANoFcLgFYZi17Px4jHaBDNTIFjNHo5dgtFBZVbHMDkKWkGTu/HOzodRg6s71DeJsc5/UTS9Vuxozjgz9FZZ+K0yQlWS5wzuRuagsz42RtuODl0JSD8XCWXx5J06DxAgeTLQbFrhsYKT5zrWIvyGLJdoUcW2QXs4rZy/V2K0XIfq3jJm7sPhHKoXxpPk5Az33uuK2Icy/vN6faiAkQeknyBwKI0sE2x9sS999CrF92vsZl5w3V+/zcA6k2jY+YL3uqEBwh1rqUl4auSI67tbmg40o7uLnjDQGTtG8iiUXgJZMWdoOPcuZqv9fw09N+IDn8wPBUqR78CpOdwtiEXg/bNoPqPuPODrGp3SNFtYsOJ4UMwzO5ea5yrEReHn2acwtdRJU7FZY55kpVYAl48KNg+3yIGYYrkvksyV3ugLORfC56toLhARllWR92hmRp7dPNOKEFMaKKpC52ihS56VoughO1aNqfQ62CXe0K28EqwFWGxeiYkX331WoqVrfXG34X9Bz/swtbm71ov1WYcR2G7HBEWHOK4JGfhfcfThmER/f3pT53m5OzlE/TZyMqESJJp9StafEeknNodg3OwopD05K9MMPaETz6B4U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(376014)(1800799024)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXRQZXcrRFlDdWE4TXlOT1I2dTk0SGdBVTdrclFlREJmODQzSjRHUnJJNStR?=
 =?utf-8?B?S0YwUnpXRmdGWU5uTkVjZXB1MEkva3VTcXdhNSt2Wm5JcDlGVDUyN00vUUM2?=
 =?utf-8?B?c2V1ZVpTeVVCdEM0SlgyM1NvQXNmOU1IUXJsNTh3Q1FVSUx2YUlENEpNb2Jm?=
 =?utf-8?B?SG53bm9ONmtHVDdDQUwrdndYZjdWdlhZS3F0UlRkSFpwaWUrWkQ5cjdwL3lG?=
 =?utf-8?B?L3E4ZzhHT3p4VE9vaXl6T1lobnRndlVTOTQ0dWlzU0xhQmlrb1pFWUk0SWpy?=
 =?utf-8?B?VzdRT2hnZkxNVW5SUGozclcvdzNFWnhQZTFDZ3JvdG1yZ3NnMCtLN1JDTjRy?=
 =?utf-8?B?QVBFQlc0clF2WHJOaTIyczYrVVAxSjA0T25EWm9vWWNMSkFhU0Z3eFRlUDY5?=
 =?utf-8?B?M1lDQy9TYjV6R01hc2NScmRvbEtBSzJ3TVNjK3RCSS9mT2dRcCtXN3B1c1dJ?=
 =?utf-8?B?QVh0MGJISWl1TXhId1hvdUpXNmJkYkVkaE9OMW1JLzdGUHBJT2ZtRGJENnFi?=
 =?utf-8?B?YjVoQVpGbVMwaDYyNmtOMTk2LzQyR3R2cmk1bzRydDZ3bmthdGlBTCtLOVdH?=
 =?utf-8?B?WVErelRvVWRqd21nbC96bnEvZENGNVhkTXBCYzBzZGNyaVVueHlsbHJ3RXhQ?=
 =?utf-8?B?b2FyWEpMd1NqdTY2bFdoeUZOT2JJSG13TzRWSFZPenBvWkU4WDZidURyeXZy?=
 =?utf-8?B?bFJKV0VaRktSU2d1dFlLODJNT0FrZDdJVkNnckZaUHRneHgweWd2NlNqeTUy?=
 =?utf-8?B?OTZOZ2o4UDJaUWI0R0xLYThJdU5LN2ZDM3lSQnJoeVJXOWRuNEx0YkdLSmYx?=
 =?utf-8?B?Y2RrdUF3OGlnb05ZN3pLS1BrSGU3K2x3bXAyVWtBbk15SktlNS93eWhvenpi?=
 =?utf-8?B?dGl0NVBDVzRCTnI3SHRJNk5uVTNheVZzb2pEa3ZQVFlXMDF2OU9hV1FsOFNR?=
 =?utf-8?B?U1dLNExPZk45ZE5NQlFZOURRSFdGbGcwalNlaG1lUytkaEk3RU5KVFlXNkNV?=
 =?utf-8?B?Zm9OOHFlQ05ya1lpd1c5a3hMMGJBci9mcGtyL1RSRjVPd1BWWmNOS3VkUHdp?=
 =?utf-8?B?Y0liUUI4WFFoV0Y3bW9QOVhEUU5jSWptRW55ZGlDRnE5cktFUkNkWHpWWEZQ?=
 =?utf-8?B?RzNLa0NiTjFCSGdZSUh2d1lzak00UGJBYkZ0MXJHNW42a29UckxRUUs4bFdo?=
 =?utf-8?B?cGJCb0MxVVZFVW5BOXJ6QmsrK1Q0N3Q5cGY2TWE0UFFPTHRISDF2cTVhWkhS?=
 =?utf-8?B?am52Z1JtRDdzd3NESC8yVHVpbEhzZnBtMXZaeXVMZ1NINVBIMnovcXowVCtq?=
 =?utf-8?B?b2tkV0FXV2loUXNNRjNCNGVlZ0ZLb0JNR0ozMjcrUXZNL25LV3dVTEExYXJU?=
 =?utf-8?B?dmNzc1loTlhRT0FGMHFPbmhLL0xubTJoQytseElzb1NRaWt1WGJ5TDl6bnIy?=
 =?utf-8?B?U1pvWUNFaHZ2cW1tOEFEbVdlTUdWanUrRnFaTjNlWVRpNisxejJIN2NwYU1I?=
 =?utf-8?B?Y0QyL1Exck1GaDZWT0o2TEJzTDdnbzV3YlBFV09xcnBYQnErbTZTVGNPaVZu?=
 =?utf-8?B?RUJFU3NSNXdPbG8vdktOUzF1YnNHRlA2TWhCOURRK3pEQ1VUdC9YOWVRMmw3?=
 =?utf-8?B?K1NtaVF4VmoyMS9SbTlvdGtSZytiTDJmVUQ3NEJBMHRwRUFZOGRZM3dQdFlo?=
 =?utf-8?B?MThaUGgvckp4eVlDd3J3UUw1cXp6Q01NOTFxbkppejJvcWV6MVJ1VVkzb0xq?=
 =?utf-8?B?bmJzdGlVdkdWWWtsUkdhS3ZoaWxmY3dHNGRZT3FlcmczR2E1SDEvenJEd1Rk?=
 =?utf-8?B?aTNVZ3dSd255STVwVmlVYlpxY1ZMc2N6ejZBWjRZT2szQmw3WjJ5N1p0WTF3?=
 =?utf-8?B?dnFHMzNEd0lQUk5wSitsSmlmd0l2UTNEM25Ob1VUdlZNdjlhbWpGaUZQSC80?=
 =?utf-8?B?UjdHbDlVNTJHdTh1TitMZFVLTlNsUEFmRkNub3JUQklEaVI4Vk1ZYnpzZXdO?=
 =?utf-8?B?aHYzZ3hyNVhGdUFYMHlHbERESW1qSWNYV3pyTUo5MCtoWnM4Z3ZvUUFtbncz?=
 =?utf-8?B?bEZPZjdsOFRsM25PUzBMR0tMSzlTVHpSOWtOaHpvN1FhdzNMbUZLZmdtSHVK?=
 =?utf-8?B?TzZnV3o4NEYyZTYybmdiOEY3STg1eHhWSVl1UDNVZWhGY1JBT2J2SGpXUUxV?=
 =?utf-8?B?UmV2clhUUTB1MUpoSEVPQ0VlWHg1V0J5bWRWeFNtcWxHTjFlY0podjkzWC9E?=
 =?utf-8?B?R0NKejZTSit1d3pZOGt1M0VTQ1hNYzh6aDZYVDBpckJzQnhXMTg3cXlWVGpo?=
 =?utf-8?B?S0xicGpBamJuV3RLbEFGTHFsZllIVm1SdFA4MTF5V21KWVI0OC9LR2hxQ1RB?=
 =?utf-8?Q?jx5IffTO09Hbljwk=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22eff28a-ad6d-4997-c5d1-08def2cd998b
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 08:43:19.3057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oDeE5ScGhUy9wWrt/c2uWei42siiV+NNsyNpZyYlABt34lerARRDwSQwbigAsItyeTG5lCAdfiEAvnaa+itu0rIiWIRuE47wTRx0sZcZJEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR03MB989599
X-purgate-ID: tlsNG-4011c0/1785919403-4BED2CFC-F23D01E6/0/0
X-purgate-type: clean
X-purgate-size: 765

On 05/08/2026 9:40 am, Jan Beulich wrote:
> On 05.08.2026 10:37, Jan Beulich wrote:
>> On 05.08.2026 10:21, Juergen Gross wrote:
>>> CONFIG_XEN depends on CONFIG_X86_LOCAL_APIC already, so the dependency
>>> of CONFIG_XEN_PVHVM on CONFIG_X86_LOCAL_APIC can be dropped.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> Hmm, looking at patch 2 I wonder: Isn't it XEN's dependency which wants
> dropping? XEN_PV shouldn't require X86_LOCAL_APIC, should it?

In Linux terms, XEN_PV does need X86_LOCAL_APIC.

While the PV guest doesn't have an APIC directly, other areas (parsing
the ACPI tables, configuring device interrupts) require Linux to think
it's on a normal APIC-like system.

~Andrew

