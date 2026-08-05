Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1DFC55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 17:57:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383811.1626993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrfrA-0007oN-SE; Wed, 05 Aug 2026 17:56:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383811.1626993; Wed, 05 Aug 2026 17:56:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrfrA-0007oG-PQ; Wed, 05 Aug 2026 17:56:44 +0000
Received: by outflank-mailman (input) for mailman id 1383811;
 Wed, 05 Aug 2026 17:56:42 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wrfr8-0007o9-Iz
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 17:56:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrfr7-007xQH-SF
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 19:56:42 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a73792d-5cb7-0a2a0a5109dd-0a2a450b8752-36
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 19:56:41 +0200
Received: from [52.101.43.59]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a737958-b7e8-0a2a450b0019-34652b3b670f-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 19:56:41 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by BY5PR03MB5048.namprd03.prod.outlook.com (2603:10b6:a03:1e8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 17:56:37 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%5]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 17:56:37 +0000
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
 b=RynfGg/1BWj8KVgkYctZH3zjXUk57loPoTssB1aW7/WznBY7wfq+C3oRj9bDrzWwitUqZ4faj2QPiOSG2D4dABCZNG+6hrJy3gSpw5LuQ7LTrL+PAljiu6XSTPa9SwIU2iueXKV3o0q5N23b81oaezyMb7lNZ0cAUnA3t76EH41t/EWTjOPpxDHAEJ+d1dp1Mq3r2A0W/jU0XrCLC88CjKlSdJOmjkLiC4J+7eNy50OCppQvjxTxlvLhKtTnwwvyPSDIluPXCOq3uprnc33O1FZ93ReMEFi7XOr9mB15P5fOjQ1X1ZKKdwCpUJt6yjEopgnUCdXiZ0Mg7E3qEjnaxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWL4OLP8uDAfZ7Dt2Z1hIzCUXwvGDKhNOKb66JnPpNs=;
 b=vuWUWENJrTXyHUjN/QbW24zWbs+WPdFjSgr0dcf0M3UQrtINZ1meHQ2aPTLCMjCOUugUlDPJAj/2l3lu+v5OarTIOp53+Z/PIzIdeheM8pdh617fEE47m/76Gm+PK6SP4QaJK5Li3hwCCs6nRTdhs+DC4ajj5Qzp5FAD8hcFoirlwpnIOcc+EW2eeVRm4IXmTao1eKsNVeIiLLcz9044WbLK/Y4yj4nnOJUQ+wf7JIjD8QLf1pTUqG8Nlvd02S/9Gl8GaQssumD5e4yGyDiQwvcNGtZmnoIAiBCaCHlg/wlr7vmy1Sq/KPd+vCih9joFL41SrljDCwYxv1jSuH7OiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWL4OLP8uDAfZ7Dt2Z1hIzCUXwvGDKhNOKb66JnPpNs=;
 b=Gq2Y3Mgayoqq7J87XC7jdDYmQqt3vNKnF/+JFKjc9fN4aysHsP3/vzGeAIZoA4z2zJ/JlxD6kjAZoT/QByyyFq05rxVrgbd7JyTmH/iuzionSWzmzOO+hioLbVcUBuqQluRAzgr9QJeWsy0FMAStnBoDdN3WT5zwx6hi15jZh7k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <49738195-ad6f-4889-984d-b1eeb5372708@citrix.com>
Date: Wed, 5 Aug 2026 18:56:34 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 0/5] x86/nmi: Watchdog fixes/improvement Part 1
To: Jan Beulich <jbeulich@suse.com>
References: <20260805124525.105457-1-andrew.cooper3@citrix.com>
 <e1e873d9-6dc0-4e08-90f5-e99ff42802a0@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e1e873d9-6dc0-4e08-90f5-e99ff42802a0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0110.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::7) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|BY5PR03MB5048:EE_
X-MS-Office365-Filtering-Correlation-Id: 78f2b456-6a2f-48c2-393f-08def31ae503
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|6133799003|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DnuFKRt6lHemYsw6AkJW3boK+i9uwXTpqUrEu0tdjsc+48jDcUpTCs97Us9FcgPu1BBO4mdaecmpk8M1DWd0YClOZHbAELxAul4Ozn8PlVk+YN5yv1C8nhBODlGTTsMtDxgMES6HWWm2bzAHIzkIKfyX2S2O5pD1tSs/rk3ixjGLPl5D4I5VRiz6hksDGX98gTCI/Lziejp6HArP+7k1GRZ+DRR46SjEXkMDsMnIIsF7yvQDJl/YySaSKSAKPpnJ1j7PU5vEyD0Df/Pglt14E68LO+7LsGaS3zYRcScuxp3IoXhAInRQ+lesUdeWXG5tEh1fg2EoIBX0EJyHGrQQVLc1FO3TYQupiVE61g842nIOgWHzX5Yn/Q1dFlvHr4YBWkb7cPFC6Ug04a/3W51swzFRIWHyNnJ9bh3b/IHivfwRfuOTfBBOTV4oDZVX9EGqxGnFeLG9Tb9a9yBQw7Y6NcUvDfKCXpUMp0hsHYPbOtu+zAMT7XCGdezXUUB4guv4e9XY8OeL+ks2HZdheCQYlKId54ghAQGfFb80unq/eKf6E/ltOvjWx81vumIVGQWxzP28zDj7tDuvat3Nzec5CTAMeY1HRza6XVIpt6k1JwCyjB1tXeuTsoPP5gddr6FPJOkhqOUyavWdjn/dBKNrtwSvzUDD5nZFMTeQxeobbtM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkdRdzEyeGdKRnQ4Wkt5ZDZEd3FrdW1vUit3QmJqZ3N1RFBLRll2WWxsdTFK?=
 =?utf-8?B?U3ZhZUJGcXBhb2RBZzhRSloyM0xHekxnUVlzc3d1YjhSbHNkTjlxa0hQVGlB?=
 =?utf-8?B?K2piTlo5VllrM1pqYm5mM25RbXdHcFlNOExWTTJDM1ZVaW1USDltSjNqaGZu?=
 =?utf-8?B?WCt3S2NGNnVLeldVQi9GL2d0blhBUzVTd0NpRkl0Q1I5Q3NybVFrYTQ3U1dK?=
 =?utf-8?B?ZmpvZ0NLaW1ya2JXM0pVSnJNRXU5clMrK3ZPOW5JbTFEWXpJRDF0aFVySTVB?=
 =?utf-8?B?K0pIQ1JDWS9ONmpJQWwvUGRCUEdEaDdRUXFUS2toWGN1TTlhWkhNM2NtakpX?=
 =?utf-8?B?cDNTOUFVZ0htVkpydWZKQ3paM1lRbWlDZDRwb3B3NkNFZDRzNStKZE9YMDJH?=
 =?utf-8?B?dE1TR2JVUmZxdFlQcEUyRFpXRE1Ob2thY2tOY0JpckZpUVYyelF3d0RmTWdm?=
 =?utf-8?B?dVlnRmFPU1haL241cXZnbWNSeEp5ejIvYjB3ZG1xeGl5cXVPM2dLek50bmp5?=
 =?utf-8?B?SDRSa0dYKy9qSmNtZVlQQVQwMTZPOGR0eWw0Wk9aMW5MRTJQWmo0OS82U2Fu?=
 =?utf-8?B?UFIyM0U1cWJMcDliMzZtOVRNUWdObWZDMzVQMVF5TWxHTEFRelEraW5oc3V0?=
 =?utf-8?B?VGtsc1dUSlVDa0hDbXVVZ3k1TCtjbXpTYVlRUmMwUzgwQ0NwQlpNQ3M4cDdz?=
 =?utf-8?B?MnZBWlBCaHR4UEI0ejkzcUJUNEdGYzl0UGxBRlYyU1dNSEhHd2UxZGVtdkxZ?=
 =?utf-8?B?Wmt0aThTVEtrNlk3UjVOMERLdHZjR1VYaWFWbkR5TlM3aFhvRDBFZDNuazYz?=
 =?utf-8?B?OEdyTXhEb0FxbkluOU9jVEFadGZrclN3cmVyOXREdmZDTnlHejhnY0h2K0tL?=
 =?utf-8?B?a0F4dXZSbXhqOVFvcTZhZ1IwMzQ0alJsMC9MSnNydVJnUEtVUHRFZzdjckJG?=
 =?utf-8?B?dEJxTW1aRlUzSjExTFZBT0ZBblU0UWJvUFQ5Z2NncmdDT1JJMXM2UEN6UnJC?=
 =?utf-8?B?UytjVUZxeTgzMkRMZWEvajA5SXpKeXhDdS92WVk5Y0Jtc0xTZDNURmRlQm5J?=
 =?utf-8?B?Y3BkVWgrampwRVZqWUpJNWZBc2EzTjNPcVFhb1VxS1MyK3FpSmt2enE1N2ky?=
 =?utf-8?B?TFU0cDhONTE5WTM5VkJHK2hwQVlBRlFIdjJnZUFjeGJMcFRZcWZjNE9DOUFk?=
 =?utf-8?B?SXo2YUJjbjdMMXMvZzlzVC9Ld3EvVXJZWThKK0cvSWgxK2U4SDdvbUM4d28v?=
 =?utf-8?B?NnFJVmNwSDZDVlRPOXhUN0FxUjBxUGhyVytoWUgyMSs5SkFyWDVSZy9kdUYv?=
 =?utf-8?B?a3JYWS9JM2UyUEp1MkZkM0JrWmJSK2trNlFrQWlQRStCQWN0b2cxU2k4L0Zv?=
 =?utf-8?B?bHM4S0IxOEF6ZWZZYWFicVZ4R2UrTHV4ZEpiVlUydGNCdnJtNHFDcjJLMHNF?=
 =?utf-8?B?UC9HTUlyeU1KUk1MSjdLQlVmc3pJSVJ2ZzRXNkpsZEcxQjB2THNkSm50cnhM?=
 =?utf-8?B?cHRDdkxqUEZqcitTTitIQ2VZaHhBSlNuSmRRUm1XejU2UjNrT3lsTFBCb1Nv?=
 =?utf-8?B?NW05eHNzZlI1elNielJ0OVJSRW5sTWVZVUgxSmJBMEM3VVdJMHJUTDN2TmNs?=
 =?utf-8?B?T2h3Vm92R3ZYS3c0OTJ2bjZXMUdyeE9lSDg0d2orVk94L1VjbHp0RHJNV1A4?=
 =?utf-8?B?UUtGbFVvYnVHTDBMcExleXBKRE0wdDRkbVJnOWx4UzBDekNMVUR3TGJtV0hN?=
 =?utf-8?B?L3d4UzJWVjl3NWl1ZDZOazBHbXB6SCtoejRGdUo2MjhGU3FHeFZJNDdSeFdk?=
 =?utf-8?B?SEVNS1VPSGF0Y0E4RUJleE0yTjJxbi9iS2Ntb0VmcGxpdHk2R0lEQXJBcXND?=
 =?utf-8?B?b0JwT3pmamdzeCtuMUFlQ0xJWUw4M1VET1VKMVlQNXpFdFpra2RJVElNVTk4?=
 =?utf-8?B?T0VIOTViNHlFcXlaNmtoRmVSKzgwdUt6a2VPOFFVNE1heFdId2ZjSEtBZUdJ?=
 =?utf-8?B?T3Z5a29VcFRPcWJyNlJtZjlKR2dKQ3BEQnNveE54V1phWUhTOXExY1RuSFF6?=
 =?utf-8?B?VmtqNzFuM1pZZjV5OXpmVm9YV09PeXQ4bDBCKy9nZjJvRSt6S2Vndk5BT2Rs?=
 =?utf-8?B?VDJGanJvS3A5SDlmYkcwMEs2NVk1eDVrQjRMV3NudTB5RFRYczRzZG1ucXlB?=
 =?utf-8?B?d2w4TmxBZHcyMXgrdHFFaVZ1ako0TFg3OFJaNFZpS1l5SXgyNVFkSE9SZFN5?=
 =?utf-8?B?cmFvMXcwejlSMmlSRXBPbTBYeDZ0Vk1XRkNLL2FKQ01keFN2dlJLWm1DTE1z?=
 =?utf-8?B?dUxtOUYyL2JlRE40WWlyQkkwdWVMbnZSVkU5QlJRdWlpTGIxcy91QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78f2b456-6a2f-48c2-393f-08def31ae503
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 17:56:37.1113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kvp7iL3S1er8kkuyeoMjXpJHYB6e154Yvy2Nj7YonjR5vz0hRb0ho/WWuuFzmb5HiK0wEmBtUh3mcgdp1vq5JAOIBC25xsvebdC4rx7GnLs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5048
X-purgate-ID: tlsNG-42698a/1785952601-1B2DC9EA-40C466E9/0/0
X-purgate-type: clean
X-purgate-size: 3491

On 05/08/2026 2:42 pm, Jan Beulich wrote:
> On 05.08.2026 14:45, Andrew Cooper wrote:
>> This is the start of a very long rabbit hole to address the
>> mis-classification of some watchdog NMIs as non-watchdog NMIs.  For
>> now, just some simple and hopefully non-controvertial changes.
>>
>> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2733861049
>>
>> Andrew Cooper (5):
>>   x86/nmi: Drop {reserve,release}_lapic_nmi()
>>   x86/nmi: Drop K7_NMI_EVENT
>>   x86/nmi: Misc style fixes
>>   x86/nmi: Check MSR_MISC_ENABLE for all Intel platforms
>>   x86/nmi: Don't configure EvtSel repeatedly
>>
>>  xen/arch/x86/include/asm/apic.h |   2 -
>>  xen/arch/x86/nmi.c              | 153 ++++++++++----------------------
>>  2 files changed, 47 insertions(+), 108 deletions(-)
> This series, once again, is putting me in a difficult position: Should I look
> at it, or should I let it sit for two years or more, just like my earlier
> fixes in this area [1], [2] are? (Of course, as always so far, I will look at
> the patches, and I will likely also accept them going in ahead of mine. But I
> cannot exclude that at some point I might actually stop doing so, seeing how
> many of my patches are in that state. While at the same time none of yours
> are, afaict, i.e. as per the track record that I keep of what still needs
> responding to.)
>
> Yes, you did respond to [1], but is not being comfortable with a change really
> a reason to block it, when it _is_ an improvement, and when the alternative
> hasn't materialized in all the time?
>
> Jan
>
> [1] https://lists.xen.org/archives/html/xen-devel/2024-01/msg01365.html
> [2] https://lists.xen.org/archives/html/xen-devel/2024-04/msg00194.html

I'd forgotten about these.

Patch 1, I'm (still) distinctly uneasy about, but I dispute your claim
that it is an improvement.  You are adding complexity and not fixing
anything AFAICT.

The watchdog counts NMIs (and counts incorrectly; this is the root issue
I'm needing to fix).  A timeout is declared when a fixed number of NMIs
(10, in default configuration) pass without the timer softirq having run.

The rate of NMIs varies with P states, including lower than cpu_khz, and
differs between cores.  In some but not all hardware, we could switch
from Unhalted Cycles to Unhalted Reference Cycles, but even that has a
bit caveat saying that the definition changed in 12th Generation.

You are making the rate of the timer softirq dynamic, but it is an
arbitrary fixed rate still unconnected to the rate of NMIs.

The only fix is to make it safe for the NMI handler to read real time. 
Until that time, in a choice between your patch and saying "well don't
set watchdog_timeout=1 then", I'd firmly favour the latter because at
least it means there's less to revert when a real fix does come along.


For patch 2, I had figured that bug out independently though inspection,
and yes I do agree it's an issue.  I was debating removing
watchdog_timeout=, and agree with that aspect of the patch.  However,
watchdog_force needs deleting to fix the incorrect counting, and with
your /* reset to defaults */ you're breaking the incremental property we
have of command line parsing elsewhere; specifically "watchdog=force
watchdog=10s" now sets force to false.

I will make sure to address this bug in my series, but I think it will
be a fairly different patch when the other dust has settled.

~Andrew


