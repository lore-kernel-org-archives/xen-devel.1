Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6331C5DF66
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 16:20:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393114.1632009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ww03s-0002Aa-JH; Mon, 17 Aug 2026 16:19:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393114.1632009; Mon, 17 Aug 2026 16:19:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ww03s-0002AT-GM; Mon, 17 Aug 2026 16:19:44 +0000
Received: by outflank-mailman (input) for mailman id 1393114;
 Mon, 17 Aug 2026 16:19:43 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1ww03r-0002AN-0q
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 16:19:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ww03p-003XRs-VM
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 18:19:41 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a833482-bab6-0a2a0a5309dd-0a2a450c848a-12
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 18:19:41 +0200
Received: from [40.93.201.50]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a83349c-f479-0a2a450c0019-285dc932276a-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 18:19:41 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA1PR03MB7074.namprd03.prod.outlook.com (2603:10b6:806:33b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 16:19:38 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 16:19:38 +0000
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
 b=ZiUDlM/TqwMRKOmabTwGi6/bwtU4Vdi01BLTLiSS4R1Yt6MkcpF+/6Y5KyQpbWRnAf4IaHnkie3ft8cT007YeibGZZPYYb9Q6mwdVlGCSeFD6iUCls27s9AB26gtMkI19sCL08OE570YsdhO25LVfaooqjWjF1+N6NU9lIx9WTzU0AM4KFCKCvN+YiZdTZZjSPpZGNyZ/wfgeZRd8KFwKz9vl9Q6Tkh27R/HALPIHyisg6cBH1mt02wjGGqv3JAngxFgTVZmVBItXusXu88diTujzBhkudWgLfpQhWSsI1c8X/xXF9f0gGt8UIMJPZksPf5HAy6MdkMQufJeNwDcgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+rCYubIYCA+/98dtToTiiG2983eNW+kp9TEJmrHWMk=;
 b=WIbk2h13RsVgZDW20ujV8JBbHCVn8ScaD40Iv29IF6KkSE8vtYwt56AZKkuV16v1HqrIyhOQNMbeEvckT0HgthQ23LVkgEu67SYJBiEvd1kpCpgWbaRCLdLC2umhd4S9Frm91J7vLKObdlErvzO8JfSRzP0zDgkTHZOkdOnRM4Eg+Z/PrhabfVcUttplw0m56X51koOiFWlpS8r6l/ncLUxNj2znS9wsgfLDaILFFoCrBr2N3CXwl6tBcElEnw4528XuY9xzJ/SJ22Tp1eH3qhodhP5sMgxp+fk84BNwT6LLPceR2rh9tXwqIJgU8WW7X/WCaL2Jqu9jqFb9N88yYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+rCYubIYCA+/98dtToTiiG2983eNW+kp9TEJmrHWMk=;
 b=XepI+jamsQGDDXuWLpOtEZZbxCdXDQjjBoNZZ302z2Rbqrddrr+/ZgUmOa/hgsqdIkkRSHJahRvdnxUno5+nRH1HMtDhpZ+wm97WDDyQvtRjqCSBSbLhA0ymKvMgEXw3FF3B26ee1vd3u79ce3ZO5zn3a3S0MMk5xgTzRmK33no=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9d7ecb39-e2a9-4433-a051-29efc5c682f3@citrix.com>
Date: Mon, 17 Aug 2026 17:19:34 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 3/5] x86/nmi: Misc style fixes
To: Jan Beulich <jbeulich@suse.com>
References: <20260805124525.105457-1-andrew.cooper3@citrix.com>
 <20260805124525.105457-4-andrew.cooper3@citrix.com>
 <3e414c79-26cd-4fe4-a48e-73d80b02b4e2@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3e414c79-26cd-4fe4-a48e-73d80b02b4e2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0479.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA1PR03MB7074:EE_
X-MS-Office365-Filtering-Correlation-Id: 27da3914-8a17-4aeb-9f46-08defc7b5595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|4143699003|5023799004|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	J4Cs94d8A7AfJtqsCh073qeCmm6dfUS91NkjIjD6gUH15p9wAbfXDTT3JceqAKZh0yu+5i87yyqpvii5aW25Xd/O1Ny6qjSq25wFX7S8cgBS44IP5950JSaTT0fU4cepSxIdu7sE+uigMr9K32NNuX+Mw6qRz5XE9wZqnWpEls+7oVacS5EJ3UmE06bBgqPClZyQAl3iQ/B32qaUQYrtegSGApGaRQ4Y5JN3iuIkU2Vxyr3h65eyLNqXVB8satlffCdJ0QJFepQyvE98hAP6jmth+OPoNnyQzsBzVUSqO/n0IzgcEQe4bF4P8r5/blj02yjZOkpMGWxBTd0S2gF3bGYam1wZIiskHhuofeNA807KiIwIc8/DSVSk9U9sIdGWPtpso1Zo6fxoZVKZwudk7n3auWGGOPU6D7uVV6EFwkMBIl8bNX+cm5cj9xxXTuw192WGSrYYhgbgU98w+2t6h52JM/+GEGA3RsrfhXs/SbHlAGF4ZOfAg0a5h1nwmeb/cPSYdQskDFr4xiYCWNDiO7gHX+izTy7Q500Ssaf/pJ7hCj93VcJTDFAkscG0698nci/S+W9uuS/TNjuNcm/R9RMyslr7V/QJ2wQEnjh/Kp3UjZdT24gR4oH0AVv7f+jlKCUVj/492P2MxKdWkddL7T2BKU3zR0U0W9vhIM+1H8Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(4143699003)(5023799004)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aG84dTA4VTZOTHVxZFZGNERucEUvRHF1cjZHRE1Wa0ZvRnpITDNzcUhMejZu?=
 =?utf-8?B?NFNSQW1CSGw4c0ExQ0FnSGRsK0VEZng5bGMxMkZRWkFXdStvdFNUcnFkeGVU?=
 =?utf-8?B?cWE2dlAySkdIdGVsS3lXWXlWQVJWS2RxYVFnWlV3TUFMVWRJWG1yWGRaZ3pN?=
 =?utf-8?B?VzlGaGF3ZEZWZ0Q3ZmNDbERRQkczWE1xb1NQUnNSYXFvdkVWSngzWGQ4NWNJ?=
 =?utf-8?B?eGNCZ2dDTWZsRmtvQi9FUkxrQS9oUzk3RUgvZGpBRVFJN3RQTlJDeFNVN2Zx?=
 =?utf-8?B?NWZrQTNxNUhzenJ0YXM3Q1NIVGlnTlZwbWNRaldUNFJpei80bm1ZdTQrNjhH?=
 =?utf-8?B?SVBMZGtvYVZXMkxYSjRSMDI3UlpISmQxKzlTR0VDdFVRbktoTU5PbVV3eXBC?=
 =?utf-8?B?b2xKYmdXUDJMOFVKKys4ckpJdFUzaUNZSFJkYmtpQmMwNVJyT3dLbi92azdR?=
 =?utf-8?B?azh2YWNaNnNuVi9tNmVDME1PSkkzamRNN1UxSGNhQ0pVOTJJZGRqc0wwU3J1?=
 =?utf-8?B?Yy9DeVVHN05UY0hLTmhreTFJbVlHTzZBajNmVjR3aDBHbkdDNmFFRSszcXZm?=
 =?utf-8?B?TWhxYW11S1l3SkFzQmMxK3RXTmxPdmtnNmNGM0liK2ZncCszQkJhMThXN1JX?=
 =?utf-8?B?WkJVbnF0NFBUNXhySEUwRW0rbVhpOW54cnMzeWxZNklnSmcySTgxRmFJeUdm?=
 =?utf-8?B?SFpOazdhWnBsWEdZdkJ5WVJobTZTVzJsb05TZEhlVGlKNVFwQTJ3NjFMSU1s?=
 =?utf-8?B?Y2EyZVBnVUtVMUZ0WGlkUUFyemlpdkhXNFErQWVHWHFUSWJhYjNZS2h5R0FN?=
 =?utf-8?B?Z0tEYTBQVVBrOVI3V1lsOWNSNG5Jd0tUZVhrbnlWYjFEQ2xUcUJWZTdPQWRr?=
 =?utf-8?B?RGRIVXZ5clc2N3F5WHpPczJTT3JHSjZPMkF2MVVDeHQ1V0tVaHRjZTNuNDlF?=
 =?utf-8?B?enhRZ1FCakRTdHVLMGJKVTlNZk5JYUpUS3FIQ2hNSmdXZEhoN0owY09qd3dR?=
 =?utf-8?B?NzRFaFFVSkczQlVYNTUzWXI2Z2VxNmxpbWM4R1V1bDhrUGNIdHAwTGZOcWlF?=
 =?utf-8?B?QklucTEvMzVrQzM1R2pqVjgxVG1GWjM0aEs1QTE2RzZPWFNTTDFkcEVzS0lr?=
 =?utf-8?B?TTc2Qkl2L24xSGNybzl5OE1DbUdZMUlxQ3ZSZXpwb3BPRXF0U2tnRG04OElM?=
 =?utf-8?B?TVdXSmowT3VWM0VMYXcxMWJ0VE5ZWVJ2ckdiUHROS3RSWnpMb1A3VjRuWkhX?=
 =?utf-8?B?b0VvMisrMHZpS0krTWdVajdsS2wvVkRUcnBBZlFPeVJCcUllejVKZHp3MWVp?=
 =?utf-8?B?Wm1OWWhSbThZWDQ5RkdvR2JQM1o3ZFBtT0o2MUllLzRKSUhKMVl2Niswc1Ba?=
 =?utf-8?B?OEhSZ0FGWDdaYUYyMzJGakU2WFh2V0d1VTRIVWphc1NkS2J1UHBVbHNSZ0Zh?=
 =?utf-8?B?VE9JOWI2NVhkNENGRlEwWU1nUXczUFFxOXJrL00wR2ZpUzJ2ckptL1VFQU5H?=
 =?utf-8?B?MUdKa1I3MytxWXdoOERzQ3lQYVhyQ2lPRkZRVFV2STVnNzVkaWpQWWRpTDVl?=
 =?utf-8?B?M2RHbWpweTdnNVhaWjJyd01nU0E4d3ZFNGVSc3pKc2U1VlBwbzlNV3hIV2tD?=
 =?utf-8?B?NDhRRlkvaHVUbU1mcXlLc083aS9mMXVCTGk4K2lLWThpYUVRb0tJTWZRRVQ5?=
 =?utf-8?B?NmhNUDU4bXlaZjhiQUk4NnhaUHVnWWVWOFlJZFQ3cTdFbjhuQmYyZStVR2RB?=
 =?utf-8?B?UTJ2UURZTmJSL0FtNFNXVGtPNVZlalpoeVBadlNrYXBGZ09tSjNDMmlYUkd4?=
 =?utf-8?B?K3dYOURtaWJQeFlvWVRLZ1RUZnA4T0UxZm8yL2lxck5SQVBGU01wTFhTMFpl?=
 =?utf-8?B?NWpUY3FwTnZHRndxNTM0YXRhTXE4a08xQ0UxV2xGUE8xcjZvTThmK0xwd2Nk?=
 =?utf-8?B?SDV6RWFUU1NjTEJhRFdOT0lJQll5Z04wSUtMVi9DNHk1dEJMemZHa0JEUXNL?=
 =?utf-8?B?Q2VNc3lEd1dtelZWSnRKd2NxNkZnSnVHUGhWSVdicm5CeGM5ZGhTeHhZNk9x?=
 =?utf-8?B?WDZzNnhCZjViVGJoMUxBYUtVUmpxVG1sbjZyalRpMFZNZlFHQ3BxbXdUU3JW?=
 =?utf-8?B?R2RTNWRNcTNNVHRsbGdoY210WmxwWWI0UzYwaFRRb2ZTMWZucGd3d25mbitG?=
 =?utf-8?B?aDhoU2dvQjZVVDV6UlhzNGV5SEpkM1N1ZE5ZWEI3VTZ6NTJsMWVTQkJGYWhD?=
 =?utf-8?B?R2RpRjVIbnQzbTJHaWdrenZmQVBqcDI2Y3lSN0RYSy81NDJockg5VjhERlBT?=
 =?utf-8?B?RXV6VGFqWEZ3TGpyR3N3ZHlOTWxmYUFESGpBd3lYVGM3VlBXUzRCQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27da3914-8a17-4aeb-9f46-08defc7b5595
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 16:19:38.1865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /NHzZMNjrTMtKzlVEzUniKOKmlhQKO0ICJwqdr5E56MoOSzznaMofgcTtDpFpb3ACAsLdDV2fpPUX1W8GqJpZcsJcA6CmaQ1tDtI9I6bexw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7074
X-purgate-ID: tlsNG-d25034/1786983581-51538A5B-DD141510/0/0
X-purgate-type: clean
X-purgate-size: 1443

On 05/08/2026 2:52 pm, Jan Beulich wrote:
> On 05.08.2026 14:45, Andrew Cooper wrote:
>>  * Drop trailing whitespace
>>  * Sort includes, dropping asm/mc146818rtc.h and asm/div64.h as unused
>>  * Brace position, and types
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> albeit I would have suggested ...
>
>> @@ -310,15 +308,18 @@ static void setup_p4_watchdog(void)
>>      if ( boot_cpu_data.x86_num_siblings == 2 )
>>          nmi_p4_cccr_val |= P4_CCCR_OVF_PMI1;
>>  
>> -    if (!(misc_enable & MSR_IA32_MISC_ENABLE_PEBS_UNAVAIL))
>> +    if ( !(misc_enable & MSR_IA32_MISC_ENABLE_PEBS_UNAVAIL) )
>>          clear_msr_range(0x3F1, 2);
>>      /* MSR 0x3F0 seems to have a default value of 0xFC00, but current
>>         docs doesn't fully define it, so leave it alone for now. */
>> -    if (boot_cpu_data.model >= 0x3) {
>> +    if ( boot_cpu_data.model >= 0x3 )
>> +    {
>>          /* MSR_P4_IQ_ESCR0/1 (0x3ba/0x3bb) removed */
>>          clear_msr_range(0x3A0, 26);
>>          clear_msr_range(0x3BC, 3);
>> -    } else {
>> +    }
>> +    else
>> +    {
>>          clear_msr_range(0x3A0, 31);
>>      }
> ... to instead drop the figure braces here.

There's an easier fix.  Model 3 was the first 64bit-capable P4.

I'll do a separate patch to take out the entire else clause.

~Andrew

