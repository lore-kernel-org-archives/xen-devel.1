Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0CBC624D4
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 20:40:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406221.1639589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1rkn-00029I-Gg; Wed, 02 Sep 2026 20:40:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406221.1639589; Wed, 02 Sep 2026 20:40:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1rkn-00029A-Da; Wed, 02 Sep 2026 20:40:17 +0000
Received: by outflank-mailman (input) for mailman id 1406221;
 Wed, 02 Sep 2026 20:40:15 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x1rkl-000294-Dt
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 20:40:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1rkj-00CkKU-VA
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 22:40:14 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a98896a-8faa-0a2a0a5109dd-0a2a4507d9be-46
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 22:40:13 +0200
Received: from [52.101.56.52]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a9889ac-b4ea-0a2a45070019-34653834575a-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 22:40:13 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH9PR03MB554594.namprd03.prod.outlook.com (2603:10b6:510:427::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 20:40:10 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 20:40:10 +0000
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
 b=U9trhTennRbW/omLgmTDJ/td+pDsQOUOMTzlzQZo0cYy+PA0vssRgzqgk+baBnHJjjk7k0NTjgJNWeu2Y36T4rZk/CKKt2U3ExK32tnn7iXChp2N7DE8WoEy5/qou+QY7t0vmmYY59mPU0zFf5ed7uRzKlGD4+BCYENFjyF6a6eJkSRo/TRVL4boCUATjRKj8nJkDONWcIewaBUhL0MIIueiiSvGZ8BBqz4a3zAhq7E796GNygNYm7/d4VEyLu5Xfuezo6ehHnR1krmMffFNUriZ6rYwZYCZodIPovzbs3DE8GoU0k6LKdMhoo56rfQGoLG1UoUtQBYemdBiFPu8Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ku9poZ+OXv8pHs5ajNmfPbXButIpFhwZBavMU6aWfkM=;
 b=Eeg4HzIX26VCNUX4d/L4/ndy471engzOqXMvYIozi6zIlhwUsWJxeGHvxzmceJcMHT1ghglLlIMJrA1sXVCQfWsKOUrSA87aHaCaU+RNlwUzSYOwPOl0CSxj/kdfpUDM+fhUirRBctU18wCl5mKpeL7bQK9Csl24E847mnGjspIBgqm0Z3WHh7r37iLkyjAOqeLgsc8BJkwC/Rp9msjTqIhq4hgzv8F5/aciVIywuM0Rw2r7Cy8VDrmdXwScQTzdhL41pey6G8IlL5iUMU4zYqv0W9pykHQwmyWwwCRuAUb1jSltqntxFF0sH1HgyryfiblPn6i0VrHm/hmyoPgJSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ku9poZ+OXv8pHs5ajNmfPbXButIpFhwZBavMU6aWfkM=;
 b=UbpceBkHRnlrNR2uUuxT8v0n4Lr1kpb94uPJfYyWounwGKkHY/Qc/d3oBYsRz8v0wvNgXekFcY4jOUVVmoNtzExi0lmc8GiavUSQAt4SjXrpKJy6ks4wqza7nfDpSh1StCBfTWxa7Youlee8znsKb+BIqXDsywU1Gok8Vs5oqTI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4c834442-5a31-4814-984e-6398a6bb3602@citrix.com>
Date: Wed, 2 Sep 2026 21:40:06 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH 3/4] x86/bitops: Remove ADDR
To: Jan Beulich <jbeulich@suse.com>
References: <20260902114339.62043-1-andrew.cooper3@citrix.com>
 <20260902114339.62043-4-andrew.cooper3@citrix.com>
 <0c43989b-2d7c-4411-8715-eab7390c14d8@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <0c43989b-2d7c-4411-8715-eab7390c14d8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0430.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::21) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH9PR03MB554594:EE_
X-MS-Office365-Filtering-Correlation-Id: 821c72ce-cf09-449c-5f10-08df093261ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|22082099003|18002099003|56012099006|11063799006|4143699003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	lcFo0VN1kKo1ZTw1a4kfrCj+RNNcbSEIwTMlXH+m3trd1l5pR//ooph29lLGIvKexYhmTjKZdFQ7b2da0jDib4xG/evbkLnTmmdE/mEQ0Qy1urlfgxBoepTQf0F4DAnmcmX/SR0Q7sIOKkhTDM1i998o+JYOnvsLnvvpH9SjmsexsylUH9x1ETM5ckWWgaj9BgX9BoDLg5XBEgrIqPdOer9qMJEq0adY445Rwl9neALojwbHU53xRRU3jzhAWNAypx/3+ZDK5611iE8emrdYsTuvAJPdYebcf/36+GGQ0zZXodGdXrUzrZ0beDOuZ5SCuBYZNJl8Rb42zvBWAqrCzf0xMX3oDr9KPebG8Q4O1SYwwPSIyCKtnqLk1nTpIX7D+E7+1k1vIlkTszE1LsFMFUQwoU8bHricR9tBsrMqjQ4dOentmWU4HBf4yr/jGIpvcpEhLULtpo/x7VrjXtpZac8ljpxDf2sCQgCgG5Mj6LljEFnrp6b96E28ePPR+uIV/VYOz2NOxRD8uJrCfMw8pV59n0SEh4aIBT2pHt32XQhtwhmq7/k2Ihdw1WpyIN5mve6JfDFjaJ73sF/cDFy17g34qGn/zF7F5Sj2Qh+nrL489KdUTor/W1EpVpf/oCALcoCVFjS9H4KBixj7GqTjnm7nOp4+VTXlWz5vqy+lsXE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MktxL1FrT2wrZVhid05xWTFQM3M5bi9NcEMycnViYmJiMGJiazBvVU95Tmtx?=
 =?utf-8?B?aFVXMGR2N25GejR4dy9mYnkyRzRFbjU2SlcxUDAvQ1JPcDJ3UFhVclhhZzVR?=
 =?utf-8?B?V25YVFpwMWh0blNwZ0RTa1BFNlMyalJUa3NZSWpCZSsrNGtLaFR1dXBudVVB?=
 =?utf-8?B?TTdkRldpeGpVWTVEWEZCcCtnVHBScld1cWJiUFpDSThIQ2lmc2pqUXBpc3Uz?=
 =?utf-8?B?Y2dqYWNXRnhIZEkzb2NSbk82N2dlc0t0SEp6cndFZ09Ld0c2cDBERjlTUkdN?=
 =?utf-8?B?YlNtbUl3UFpRSEVEMHpJcTBOMi9WMDIxRklaMGJuaGRkTWtzL09TdnJ2ZHFI?=
 =?utf-8?B?TGt6c0tmMTczSFl2M0ZJL3p2elZNWWI3MnFlRlIvcDBaVHd4R2pBbFVnSTJI?=
 =?utf-8?B?QXNORHc0a1FLZEFlTnBZbFh1Z1hHa1dmcXRpaG1pZWNpMHppbHR0V2pDd2dX?=
 =?utf-8?B?Uk9vekNaNmxnYVJWRkt4UExReEpWQzNEaE5xVkhMMFY0K3JsNGU0YnlXNFFR?=
 =?utf-8?B?TVlBRHR1UlFnUXVvdUFyRWFqcVJCVmpaNmo1NHlwb1NJdm9VYXpHblFSY0NN?=
 =?utf-8?B?aGNleGgrTHRoK1VOWXRZeGdPT2NrVDhucUtoei9nNXVXaWdCV1pOQ0w1WTF6?=
 =?utf-8?B?SEpKUlEvNDZLd2taTG96KzVlS0Yyb0JTc1Jld2hxOEZXMW1vcDBWYUNKZGhw?=
 =?utf-8?B?RlR0WG8rZm4rTTc4WVlGRm41TGhNYjlwNU8yYXZ5TlJDVmZSdHk4aEtTaUpx?=
 =?utf-8?B?dnRsOXlKOHVTYXl6b2tXOHlpOW5KWTNVK1dmTVJaN0FKYlRYR0tMNTI5OFdl?=
 =?utf-8?B?RjN2SFRvVjRLd1BzMTJHZXNxR0t4MmF5WHRYVXR3WkxkWFBBM1FhUE9HZlRQ?=
 =?utf-8?B?ZlRvMHdWTUl1eVhNOVRpQXlwNGFhSVRjeXo3bXpWQ1diYlRXTTB0NHRndXp5?=
 =?utf-8?B?Z3djR05rQ2ZXRFcxaTYrRlFFM3lqMExtdlJnbjMxWXBsSTBvN2NWekZEOEs4?=
 =?utf-8?B?Q1JxZEYyN2RwSVo5bkJ1VlVmTVlSMG9ndVQzNlBmaXdkb3paMGsxWWhEUVRM?=
 =?utf-8?B?Rys3Y29EeTgzM0JScm9XR0FGZDdReHR1U2RiK1FaQXZVNHlnUlBQZVpKK3hK?=
 =?utf-8?B?eEgxdnd3bEFKeHNGV3BVbmwzaW5UMU1xb08wSTJ1dzFPM0huLzFFOXQ1eDBQ?=
 =?utf-8?B?QW93WGVuUlZxZkFLazgzOHJ4Z2l6ZWpDYkVBT1hzaWhBdk1BdjZuQzY1bUVt?=
 =?utf-8?B?dkRWVlhOOHhvNlhkZFpBTHpweExRVnV6ZWRVR3U2OER2U0kvR0g4NHlubVd0?=
 =?utf-8?B?bGt1OVVyQ0kwVFlrd05EREF6VEVZVDV4SDF2Z1FDT0xGeXVlemc1T0szeWdJ?=
 =?utf-8?B?Zm9jUlNmNmxnV0Q4d1pBTUJiQ3NLM0xuWENoSGJwcU9uaVpMRE40bm1SeUY2?=
 =?utf-8?B?aHkzZVJBZW9pWVdHM242dVVmMi9mU3RLWE9wZnN2TG5vbVRpSVlsbS83WWFT?=
 =?utf-8?B?UW53QzlFalFLYnlqV2xvVDYxa0U0T3hsamN6cDUyczNOb2NHOXVxMW5nNWp6?=
 =?utf-8?B?RjE4SmpMMWFXejRHT0hKVGJML28xZWJUcGo0ZFZxTXVOTzJsazVkcXRwQjZH?=
 =?utf-8?B?N0ZrbGUvZ2QvSTYrOXh4KytGVC9DL3kvQjJFU2h2aVpjUVh1Y3pvM2FNYi8z?=
 =?utf-8?B?YVJsWlJ5ZnYreERoeHJ2K0tPWmlqUlY4UkV0dXNFZkZrY05XK1pob3A5clhM?=
 =?utf-8?B?MFIrNzVxL0xPU0ZlWWV1dysvQWVJaEQ5ZDZPL051VWNad3NZV0oyNHJwMWpw?=
 =?utf-8?B?MGZ2U0JyYUZLVzJWalFLNXV3L3FWQ0VNbFoyQ0l2VmE3aU9MZU50S1VKeGEr?=
 =?utf-8?B?V0VkMHFuckNDUUFvTldBeFhocUxOY3BWOGdiRVZhWTNzSkxwOHZHVDhhWGlW?=
 =?utf-8?B?NkU3T3hkdmhITGd2REdVN0RIQnArSlVEU0JURHJ4OFZCWjZMaHdQWSt2a0dn?=
 =?utf-8?B?d1krY2QwdnBZWXUwS2ZlRFh4KzB5a0VKRVRJOWNGNHR3US96Zml3TWNTSmx3?=
 =?utf-8?B?a2NrWTkxOFdiQnlBZDFoU1cyM2FCWGt1ZkZVUnlYUGI3WDZTczQ2dmZPY2FW?=
 =?utf-8?B?RDE3UjErVW1Ld1FLdkI3YWZKSjRhbFdCOUp6RnFFSG4yUVZOWmwwY2N2QWFO?=
 =?utf-8?B?dFdUZlM5UlNYVDgzeHVXT1lLblVOM3pMWE5HalUwMjdTSG9pUEl2U0NoQldE?=
 =?utf-8?B?NkdNajRJdGxuSVEzMkJPS1V3OU5HMUkrK3BmRkZOQmZ4UG9wSXhFUjJ5VkNH?=
 =?utf-8?B?WTdmNDY0dkVScEhYM0w1VUNRV25oa1U0VGdkR1ZJSHdINjJENUpXdGNpVG5z?=
 =?utf-8?Q?jTVcuwRSp+f9s5Uo=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 821c72ce-cf09-449c-5f10-08df093261ab
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 20:40:10.2448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fo0/DIeMCP3h4LjQZg070u3NjwdYSMSd8dhFZxqwRwHwQOmbgCHyxDjRvYwLbgQBO0X+DsiVoHxWphv5mcfiFfvrbX6bDHoRMRrUCibMIm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR03MB554594
X-purgate-ID: tlsNG-ef75cf/1788381613-3C817AE4-D290463B/0/0
X-purgate-type: clean
X-purgate-size: 1590

On 02/09/2026 1:50 pm, Jan Beulich wrote:
> On 02.09.2026 13:43, Andrew Cooper wrote:
>> All this does is obfuscate the usage sites.
> I don't mind these changes, yet I'd like to express that as so often there
> are multiple ways of looking at things. The benefit of the macros was that
> the use sites were textually shorter, and hence easier to process (assuming
> you know what ADDR stands for).

"assuming" is the whole problem, and what makes this obfuscation.  If it
were a pattern we used everywhere, it would be fine, but it's unique to
this header.

It hides the width and volatility of the access, which variable is being
referenced, and the indirection.

The only thing it has going for it is that it is recognisable as
"probably a macro", but you're still forced to look elsewhere to
identify how it works.

>
>> --- a/xen/arch/x86/include/asm/bitops.h
>> +++ b/xen/arch/x86/include/asm/bitops.h
>> @@ -9,16 +9,6 @@
>>  #include <asm/asm_defns.h>
>>  #include <asm/cpufeatureset.h>
>>  
>> -/*
>> - * We specify the memory operand as both input and output because the memory
>> - * operand is both read from and written to. Since the operand is in fact a
>> - * word array, we also specify "memory" in the clobbers list to indicate that
>> - * words other than the one directly addressed by the memory operand may be
>> - * modified.
>> - */
> Might we not better keep this justification for the seemingly odd memory
> clobbers? (The first sentence, otoh, I agree can be dropped.)

I don't think it's useful to keep, but fine...

~Andrew

