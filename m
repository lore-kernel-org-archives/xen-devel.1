Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB35C5B572
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 11:24:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392829.1631797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvvRj-0005yh-FR; Mon, 17 Aug 2026 11:24:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392829.1631797; Mon, 17 Aug 2026 11:24:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvvRj-0005yZ-CK; Mon, 17 Aug 2026 11:24:03 +0000
Received: by outflank-mailman (input) for mailman id 1392829;
 Mon, 17 Aug 2026 11:24:02 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wvvRh-0005yO-V2
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 11:24:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvvRg-00GqBS-EY
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 13:24:00 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a82ef49-8faa-0a2a0a5109dd-0a2a45099c7e-22
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 13:24:00 +0200
Received: from [52.101.193.67]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a82ef4e-be1a-0a2a45090019-3465c143c619-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 13:23:59 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB6496.namprd03.prod.outlook.com (2603:10b6:510:a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 11:23:56 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 11:23:56 +0000
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
 b=FDc4MI1Zks4ByhqpngtvNwSBxdgseDqYIy0np8k/hz6CyGZOrKjXMM1upJ6b5bBPvkyPFREcmO8QjLqDs4cwzIyfGzsOoLb+97ytcNW1wcDOhvIg+mFq4qS+SyXZbUGxCEuD2pGSVBEVoZCMmFxUZPDLh30TqCnzqQoFEVLHg1ENXLv8OvhAYXAXh/ZTf/Q8cTH7kjhzRJ4OmifrS8Yg9bDn87PkUIFibGwVjVTpbT7n95uHKj55wRg8ChoJ3Fh/2pJ+bqrr1V87g6fFhjRWUd+WZHyiCLWlA7JWBfn8plJcnxnuufWpYy84fEafCFbJYjfH2hh697ioN4v1oREl5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7AhNRs50oxqYZpAaHuaYHb9wMA2dbv3cU0k7cmZe4Z0=;
 b=cRF0yhNNBWoMkx74PmCJpT7TxSqsM8iUqhA56s4IxcTVpwKsHp6Ex0FUScSZ76+JVLxSjsbDsOXZjQ0zW0+YNRy4+jrpOzrBL2yhdTIJojg72yXr6OZZ4wLPCz239UskKtAnJQqwtACAP2haRInCsbTevI+SbJBbegrnBz6PYqaLoKR9CthwUpUaoOVj3H4mFpaCbz6H9C2Gp4ZD+ul5ijtxmy6giwUTFmxZvZVzO07LUm1P7khfZ9Qp8A2sskKzldC7a4u1jbRqUU54OHgu9pwXycwKARFvIwo/M/6ExZF52sTlcXmiOOJq5Y4a9jtlo3B/F6LbezAkHvxErT+DyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7AhNRs50oxqYZpAaHuaYHb9wMA2dbv3cU0k7cmZe4Z0=;
 b=fv22JlE/ARULYcy4ryrfBC+jtRA7OZ7a0u/Q+oeYAbz1/kRXo1qLqxotFJy7MlGGuQ6ajmVAbWwtFwxvu6esetVLwquYDxHbv8+ei/2YkTplfBbnn7DqT6Z3bC7XE6BoJTBYhCVJbtlhZYqb9WKv1EGDS79BQ/lmldx3ctSxmNo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <461580b0-fdc6-46d0-8f5c-626434e5ce32@citrix.com>
Date: Mon, 17 Aug 2026 12:23:52 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/3] x86/emul: Adjust comments in x86-types.h
To: Jan Beulich <jbeulich@suse.com>
References: <20260814185841.1757421-1-andrew.cooper3@citrix.com>
 <20260814185841.1757421-2-andrew.cooper3@citrix.com>
 <cf1eb6ef-763c-44d3-ab86-d9dd431cf606@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <cf1eb6ef-763c-44d3-ab86-d9dd431cf606@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0036.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB6496:EE_
X-MS-Office365-Filtering-Correlation-Id: d0c88add-89c4-4222-6173-08defc52067f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|4143699003|10067099003|56012099006|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	V+GjeclD1GJpjVZMhjtzM6ZsW+YXDFrXUaUUcCOgu83RMI7y6OeLNnwl0LJzldtT98e6Gm3d/7X0OAS8vLzgxqtZThH7n02AclSpmROfOWIPj7ct8HwdpdvT98+jqkkqh1n/0q0h1ZEavZD6YXYB5RMuuyjXcwEgk7f85TFYZJ2Ds6nWqkgQ+NDKoHzUox9tGx8WHGoQEiA9GQv74LZNZNsV5zrXZdlWewh3mytAe3JpXb52dgeMnNnbHkmUtxmIl384Fj4lTa5Whzm26KaNscYp/Lvx9ZLLUKSHvstwFuDDWgy87TAXj0OgvWjLS2YGlzKsJCQ2dTbIqpBY3+AsRZ6NArW1TcWM7mxwgc+fx7y52/+DlmwoRM+Ojkip5DeljidqQwgrixx3xTngSX+Tp0LlsnYeSdBJUlP8uO9n5gdHuPxs9Ucuu8F2qmA+kKCEgUCtVQPTBYkQYNGx6CIcCk0s3pTT/vok02qL8OlJTDokQl3QpaUbCjtGtIsIn/czIpdLidPx4vkAFP99nS+L9kgc/V/wdgdaw1rV6rvovT/FxiqGSPNZ7xfPR52qrvqoTyEdDShHMYpxn+l5QYJy5UaI3yxqDMvuPSg3oabJd/T6SyrAd+6l7Qa9MZHEZtzCPb+V0FaT4p4vfjzfx3FUf7ovlgNSAIDHAtpb9OW6UyQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(4143699003)(10067099003)(56012099006)(11063799006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1ZmNnlqenhhMjBtMWthekJTUjZ5WDY1d0UzbEpoNzVQN294RmVmamJJVkFG?=
 =?utf-8?B?MEF0V25XTXkyRkdUSmtoU1c1cTBGY3V2M1JMczJ3Y3JWcUdpZHF4am1JQmlF?=
 =?utf-8?B?WTF6Qmd0Tys0Y1BoQWUzTnlsY2FXclBaa1ZWajdZWVJOZE9NaXl6SGlSNCtZ?=
 =?utf-8?B?RXpPTlZFQ2twL1FyK1VTMVRSSWtrdXNhQUVIUTc0dWhaRDB6QWlGS2g4QVdN?=
 =?utf-8?B?Wk1qQi82ajBIM2E4ZTdtamk4VnF2amFEMkk0QkgyTld5YkhFcmNRZ0VtNzRU?=
 =?utf-8?B?VXE4U3lxVUNUZ0l5eDR0RkZ5eUpMQXFWVm9EY0xoQVZrcXBwN2c4UXdhdHY0?=
 =?utf-8?B?TWlPY0ZzalgvOFZ1MklqQjIvdXBZajNlMXc2RVowZ3JzRjhWQ055eXdvVUdM?=
 =?utf-8?B?dHRWL3NWRU9ieEJlM3FtcWw4cENnemhsaGFVeGFHUzY1UkRmY3JCSkw1b2tW?=
 =?utf-8?B?ZWh3bkE5a0VHbTRPVUM4QVZiVnU5eTJoeDVwcEI0eWZLejl1dUd2SFRSVTBa?=
 =?utf-8?B?YjVPbit2Wnl5OTIzUmNNRjY2NVhWaE9HTS9vSitqSzhqN0lPWXV2Y0tZUEtE?=
 =?utf-8?B?Q2lhM3VIU0JKM1lPUE5XZkZheWN1TE1xUDliUEFhb3h2QUNwSVdrUFZzakZS?=
 =?utf-8?B?VHk2eGVsZzhMSnIwaFMxMVJFeG1lUHlwam1zckJaNGltVlN4cjlUeHByemNP?=
 =?utf-8?B?dVFnUG9NY2hLRllmVmRJR3N0b3NYU0RlcWJHSldZcnkySE80dHEvOUw1bE1E?=
 =?utf-8?B?NlcrQ3E1bTh0K0JYeVFlNTZDdDJ3ejJ0OXVtZnQrNDQwalZqRmNCVXVvUWtZ?=
 =?utf-8?B?cXBpSFZva1ExVzdtYk9ubHR3TmpJTjJ2TE5BVG94MFQxTTBYM3ZqVlhzUkRx?=
 =?utf-8?B?MTA1NFBvMjArb01MUzc2MnpweDdEN1VySWlhTTQ4K0o1WHJCWVBaV3V0RVlD?=
 =?utf-8?B?UXdjWU8wVGpBSjZCY0tKck12TXFaWmI4VENXWnBZWUFhSTFtektsdlFUWllk?=
 =?utf-8?B?S3V6MzhBZ3BlN3hNM3ljNDlTeGF2ejFUVHVWWWpNTmFFaFIyQ3dMbldlNGNF?=
 =?utf-8?B?UDZGWU5iSU9mQUUxTUpNVU9QemVFMloreXErOGpmVUJRZnhWY2FwcURvcW8x?=
 =?utf-8?B?UGZaa29lYU1GZkhZRk1aTmVOb0xhd3N6bkhpNFVtOEM5dzdVdUd5YVQvbmsr?=
 =?utf-8?B?TE9CSkRFZjhHODl3NnlxbkRQWC9zbk4rSGhXTXR1QnpUS0dFWmU5cnJ5SnRO?=
 =?utf-8?B?V01odWxEQ0R2TU05T1hvRFgycFJtNmxsdkM1UHR5bEFhWUMrOEN6S3Qxdk9O?=
 =?utf-8?B?TFpJejI4RjlzSUwyMHpiQVJWVjFxMjhaNzY4RS9GQ0NwUGRQQkQ5cVgrc2FT?=
 =?utf-8?B?ZnFPOENKK0VEcHRZWEZjU0pySnpnNEQveDA4dUIvMzZSZTIrY2Rlc1lRK3FO?=
 =?utf-8?B?QW10NEllVXFlbTFvakZmL1JVMUFielhPTHl3ZjI1bzVTTFFpZCtvNC82cmlX?=
 =?utf-8?B?MTVPcDdkTjJBRXZSdmptbVcraW1vbUwxQVdwZTZWNDFyVTY1UVdJRk9TSUYz?=
 =?utf-8?B?c2pWUFhNM1lqU1VkNEdDYmpnS0hKdkpPcDRTVm1yYzNnOXhBRUNHRWF4Unds?=
 =?utf-8?B?dzduZHRuVzd5bDZQMTZiQlNSYlRQS1VObHFRRXlaS0Vuc0RxaG81VGREVGlC?=
 =?utf-8?B?NWZZTnh6ZmhnMXJzb25yeG94aExKMU9DQm9aOEVTcFZtcVBxdmNLbkhvcmlv?=
 =?utf-8?B?blVQWk91eHcyVCt3NGxpQ0hWN0FJS1l5WmNzWkxlaHpQc1M0S3VTK2dRRVNF?=
 =?utf-8?B?TExXRytUQk9zcVJ6S3FZdjBnbGh4UWUrOHlmMk9vQ2MxMjY2RjFodnpqUW9V?=
 =?utf-8?B?SUsxRzdtT2FUTW93djJSWHVXNnNmZ3F2aEZvSEZsVTQwMDhBOVVianFZWmx5?=
 =?utf-8?B?QmhQS3NMTHlscUJZYzlTcFh3UUlHWUJhdVN4dkJJMzkvUlFYaFRKaHVVbjRk?=
 =?utf-8?B?TllDODYyQ1prMGovYmlxM1FodW1LMksvTFRGVCtIZFpMVGhzdVpoRC9IbDVD?=
 =?utf-8?B?Sm1GOVAwUk9EN2ZvaG85aVlVZ1FNbTl1NVhKTzdNK21wSjcwTktWZDFJSENk?=
 =?utf-8?B?eExDNGxMTUNzdmp0VkM5VGhPRkQ5dzRMY2ZaOFFPV3dqVWhLTUVJMWY4REt5?=
 =?utf-8?B?V2s5THUxTklWd2cvTTErNjJvbStQZ2VrM3I4WWFVd2pCWDlYdGxMNGJVbDRL?=
 =?utf-8?B?VU9MNmlNcjEvQVZ5UElsTHdNZ1d4K1pOTUtLb0FMMzNqcmhOeGsrdkFLbnZL?=
 =?utf-8?B?dXplQW55U2wvM2RTYWJGbEY3SURBYTdRa0piK1BONVJMQlVyV0pXQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0c88add-89c4-4222-6173-08defc52067f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 11:23:56.1933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nzX7kxjn7qMUA1+ZfIjhsY362l717EL4iI+6h0pt25oow1oQnaRyxGOl/Ue7WFcJl53Exwf/gZuabx/J2HDv/MeJnTWQFbKrC/tk3VNI0a8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6496
X-purgate-ID: tlsNG-bad1c0/1786965840-BD0CD034-BD23CC76/0/0
X-purgate-type: clean
X-purgate-size: 1670

On 17/08/2026 7:11 am, Jan Beulich wrote:
> On 14.08.2026 20:58, Andrew Cooper wrote:
>> x86_segment enumerates segments, not segment registers.  Adjust the comment to
>> make this clearer.
>>
>> Fix a stray tab with the closing #endif.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
> I wonder though if we wouldn't better ...
>
>> --- a/xen/arch/x86/include/asm/x86-types.h
>> +++ b/xen/arch/x86/include/asm/x86-types.h
>> @@ -16,9 +16,10 @@
>>  #endif
>>  
>>  /*
>> - * Comprehensive enumeration of x86 segment registers.  Various bits of code
>> - * rely on this order (general purpose before system, tr at the beginning of
>> - * system).
>> + * x86 Segments.
> ... insert "(kind of)" here: "sys" and "none" aren't really "segments",

System segments absolutely are segments.  The VMCB/VMCS layouts hint at
it, and various bits of microcode reverse engineering show explicitly
that they're considered segments (or at least, address spaces) at the
microarchitecture level.

"none" is fine without further explanation.   "linear" is the weird one
but there's a comment explaining it.

> and iirc we said we may need to gain one more such pseudo-segment here to deal
> with WR{,U}SS.

Most likely yes, but again that's going to come with a comment.

We're probably going to need a phys segment at some point too, depending
on how exactly we want to fit VMLOAD/VMSAVE into the emulator.  This too
is a segment as far as microcode is concerned.

I don't think qualifying "(kind of)" is an improvement here.

~Andrew

