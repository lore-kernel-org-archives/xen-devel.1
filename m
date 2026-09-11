Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9BCC88E50
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 13:17:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416717.1645666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x518I-0008Kh-TK; Fri, 11 Sep 2026 13:17:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416717.1645666; Fri, 11 Sep 2026 13:17:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x518I-0008KW-Q0; Fri, 11 Sep 2026 13:17:34 +0000
Received: by outflank-mailman (input) for mailman id 1416717;
 Fri, 11 Sep 2026 13:17:33 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x518H-0008Je-15
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 13:17:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x518G-00E0kL-Cw
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 15:17:32 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa3ff52-e002-0a2a0a5209dd-0a2a4504a372-42
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 15:17:32 +0200
Received: from [52.101.85.57]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa3ff69-b57f-0a2a45040019-346555395ffa-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 15:17:32 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA3PR03MB7516.namprd03.prod.outlook.com (2603:10b6:806:399::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 13:17:27 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 13:17:27 +0000
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
 b=HT3g4N4hDe12sALiOrYsegwq3YSwcBkDac7UUh0y8fGwdJ5n0zkN28EqNVhqLKNH6sTTIOf6ax2/gXjlMExgTnMrmi+7fUNgfgQF2KK46feRHCYoH6wrNmbArSEVnvItuDTiIMC9ziIolilkBTi22Q1SBlU5ABYxKChlXqvoRxcAmUIApRj+U2mv7TcVAf68xXNV42wVJgWBNgzC2KlDs+SeMfooo93XR4IWqGuFCrAlSn1f1jQlKKPOAIG1soGjw6N2VRiHLsZ+lszoqvOwJOfFXfJ1PpJZz4LcY6PheY4GcdEduwOxwzialpiuP6PS4bjYP1b99pETj3cjw4XZpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KkuRlAcZHaS/vKiVUQLWCbVJQrB6ORaAMpZc6CPonvI=;
 b=Ha3522AbogZwqmW550edpbPkZ6GQhCS8vAfr8qmCaOURQ/lLx6wGFne/en1tfwJSbl/2VpZ4XrFiyM8gkLZCSdwS4+/hhn8clFfH5zs/pcH/eOl4hqwqusWBNxOleHahyA6CMVG+cJdVe2bX4sWXX1WeA6725rjSS/17/HkGD/O4byHF7vy0BDWP87b+9x/8K7Lruds6EyXxbtcy6CtFHfgktTExYwPvufRzolCfGQOoenJ/yh43cJwPkEg56NbT840H4OH9f0sxi5kVV6jYlqXDKLT8X41iU3Wl0S5BWgG7kgqVl783HWs7j2oi5G4nyaN2hsWwEZn9gkkXN0ARzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KkuRlAcZHaS/vKiVUQLWCbVJQrB6ORaAMpZc6CPonvI=;
 b=A8zKr5nb8AZfCZSx1gCFRF2+YmYsM+vGKLOqEVmTOUG/68acY7+RxtQnp5hl7RncMOsq20bixGJ44V0+Q6PxMqwu/P8zsmk3dTYIVXPHacNoGZ9IAEEHIVXIAMTDb30VRa6Qng8Zue+ayhRQph7phJBviLGPpUX+qrvc9WiSwJM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <06d7c190-9912-4d09-b01f-77e2cde56af2@citrix.com>
Date: Fri, 11 Sep 2026 14:17:23 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com,
 George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2 1/7] x86: make UPDATE_ENTRY() allow for multiple
 operation flags
To: Teddy Astie <teddy.astie@vates.tech>,
 Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
References: <20260910203113.462943-1-kevin.lampis@citrix.com>
 <20260910203113.462943-2-kevin.lampis@citrix.com>
 <1789119951.8631fc262581453bbf619ec5b2062170.1a08fdbf3c0000c4f3@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1789119951.8631fc262581453bbf619ec5b2062170.1a08fdbf3c0000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0278.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA3PR03MB7516:EE_
X-MS-Office365-Filtering-Correlation-Id: 12c3781f-22fa-4290-765d-08df1007068a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|18002099003|56012099006|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	eKS29v+TJeTmibSAkECgKNWXpQx8FJl32PnfKYtcDhcKe4gxDJidr907KfNhDh4o2qDeDFM55J28zgz6raT9dHWmT70rDmlzKiEhAgzSpMIB8KXxYM9fKgET63e9bWEH1+Dl9+ug+mfPx264Qz3Ch8qJ9GehnN0WGsoMTip1g/F4bwGfoRh+XdZrr+yc5di2oytOLK/+/A+utKRkUqUjzKetsha+PraGwkvhX3DicvXzsey/LdCF7lzFtr3nsTtOqsRgu/mvZVJfSt4zTQ925K9F1T2gbZya6Z+2V0Bg4K9CJrbkgj9/KE7eddOPpapSYuXbk2Cf9B5bs7QIL87egImIoKA5RLN4wFFXjC6o7qXb3vkkY/tBGTUUSa97ggai707KgiK1n3RvXoDssTnXDrZvZ6M5ineCFWVRN5lNhBZ9exKaaLgJaAMj6i3ZgS1asnnP1ejWAGuOWug0nnMu+1Cj4xI3maMundWV/LicdTR9+3Yy/6SrOM/xy6mAkT/RTHHYT8B1cVr3aOCkEwNGSpIRFnpe4zxtGHJCtHtPApxMumy+ud/l6Nl+7Qqe01UE8CHVVq4Y64HC+i7Cd8NrcUekBzkJfOiUZcspuWFaZ6lGoa7wSdeg4UNg/PvGxnMONcn/87b01EF/86bato/kjhC6PrtNSvmt5coxMnDVfzY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(18002099003)(56012099006)(22082099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHVNTWNYSitleGF0R1d3bEdBVVFtY2dLaEJyT3VTWXk1bUNTUXhtVzN5WHBl?=
 =?utf-8?B?dXNBTSsrNHNZMmpUYWRrZWRxd2NTWitFQ2FHU29SaElCNXY0S2U5TUcyYzNq?=
 =?utf-8?B?eFFFUU5YUy9EYWVtVkJZb3lFV3RnNEgxZllSSmRGTFpNMG80bFJxZFN6UE1H?=
 =?utf-8?B?THJLby91RW9UWEk5c0t5VTlHRDUxMWdZTmxRUmducVJWbG13RHRmU08xTVVX?=
 =?utf-8?B?UGhNN3NyaVVLU3dFNmhLVkQ4K3dkSXZ5WFJOQTFoeVR2Sk5vZTZqb1lFd21r?=
 =?utf-8?B?VEE2bVMzcHR3SzBncGhObjJZTDdRanRxSFdxblpOMFpVUTRpcnQ2UkZUVlU1?=
 =?utf-8?B?T3J4dnRuL0tTYkUwbU1TcHZwUlBTeGZFSWttSEdvaTREMzBGdXB2aHhQRFpP?=
 =?utf-8?B?WHJxaDlpRXNWMWlMelVZc1BxL0FsOGhYcFBsVjdBNXpBSjJUUDIxRE1SK1VY?=
 =?utf-8?B?WHF1dXp0NjZxRjVZKzVCaGZzMWZaNlRjVU5LU2E0YUYzSEg4a2h3eVQ1MFlU?=
 =?utf-8?B?TkhpSVFWcnREWWQwV0NnLzJaZEVjOVZaS3EwUXZxamJEeHlwZ3dSZXJ0amhP?=
 =?utf-8?B?SmFwVFhNV05CcGRPMkswMkJKM0xib2N4VmI1NVEyMzR5a3BXRlhvRXlkT3Mv?=
 =?utf-8?B?QlNvaXExV0ZqMWNGbjUwRlovUnMyMUNRY2F5ZmVBT3djZ0V5VTB2WlZDMzFM?=
 =?utf-8?B?RC9GcUw1TE1VUFBtYWwrTkg3cDN3eWRNcnRKbGl5MUQ5R2RDODNHZldCZHpO?=
 =?utf-8?B?ZDVJYkVObnB0MWN4Nnliby9mT1RnemdFU2ZoRlBGdnBsYVQ4WHRPNlBNYmFD?=
 =?utf-8?B?MExpS3lpc0RWSk9iSzBYRE12UDNMTzNWUjI0ZU1veDJWNGRVdHFUNHNudTJE?=
 =?utf-8?B?Vm1WdUhVTWNSTFBEN0hMWmJZcXRPTFJwWTJsaG9rbGxwdHRnU2J5MVNyS0oy?=
 =?utf-8?B?anBwa0QvYlFhdi9SZU0rNnRLUlpkS2RNcU0xc2VrU3RBNURmeXBBTXNYY09I?=
 =?utf-8?B?TDIvdSsvU0JQSUY3ZFpJdjFPWi9NNSs1ellySTk0ZENMamRCd3h4OU1NRTFX?=
 =?utf-8?B?VlluR0JHSVZwcUNhanU5bXFaQUUvN25zZ0pQaTRDWHJwazdxbmtOa1RWRFIw?=
 =?utf-8?B?UU16VG1LWDVoQ1lWeHArR2RGMUNId1FyWEJXSGxOZG9UTjk4b0l5WjBqYTVQ?=
 =?utf-8?B?VnEvRXJOTXkrVzc0MFp2TmdlK3dpMHdsZktwUU5NaFpoNUlzWnJtRGMyV1Vk?=
 =?utf-8?B?a2dUTjhBUEFNNUZndlNBdUtzdWl6aTdDK2t2L2w5TlRDQjV2dGZlam1QQWNy?=
 =?utf-8?B?ZmNIc3Fxbk9YeXVaaGJNeDlxZm04MytCbmVxZENWaXB1dlVqenlXSXFSSnVI?=
 =?utf-8?B?aWw4V2lnRGNNMUNCRnI0RkFYU21EYytMZExqU25GTXowNitKQmF4OFNzZEdw?=
 =?utf-8?B?MTk2a2VnbG9nWDU0WCs1SkdTZXduNHMwQzJSVjhLcmFxNU5odnI4QmJXUjli?=
 =?utf-8?B?UU5PclJTWUYxc0U4Y0lnQUg1ZVJnQTBJSWswS1FIcElIWmpjRng0WEplallW?=
 =?utf-8?B?SnVnN2I2Z01yMjdkTlI3WCtNbmRCakNzcFd6dCt4MURDa2U2Qi9VMDhVblNY?=
 =?utf-8?B?NDhkVm9tdWowUU10Z2s5S1RlZ1BqTWVURUptMmJ5dG13YXljRzUrWlVPSVF5?=
 =?utf-8?B?WlJibVNtWk5GUnJhV3p6eloyK0pvQmVPRVYvSi90ZlJLKzB3QVhlVHRVSnhq?=
 =?utf-8?B?Nlc1Tm9sRVg0WE9tcmVpQm1RMFQvaC9IcUFTRzBtMGwydGtDb1pHbjhaYkFH?=
 =?utf-8?B?V21kVTBXelZpLzhVRGZ0NW5Rc2xVUDN6U2RqTkRhOEpxYW1SVVgxZFRZb2FS?=
 =?utf-8?B?dmRkYmRmelJSanAwSjBzVkU1ZmxmOWQ2bTRydVo0R090ckJETUVEbzhKSmUv?=
 =?utf-8?B?eklHbFVwSzFIYjJGcEpkRnczUTZwNzNaN1E2Lzlwd25PUDRpUnoySENZUkZH?=
 =?utf-8?B?U01ST3RKZ3dzOWszcmlQcXNsdEwrWHZpSUxabC91MHFCMmR1OTdESitpS2pj?=
 =?utf-8?B?MExPRmZJRkNjcmFydUFFcHRQbW1Wd2RQSEUxczZjR0hZbFBpVmg0aEVnN3Zv?=
 =?utf-8?B?MkxNYlFwY1p4K0JEcjFBaDFaZzcwdlhITldtVFBKY21GS3VWdlNCTHlDU2x6?=
 =?utf-8?B?alNtSDdGbnp4TWRybEFKUkMzclVYZ1BiUmREencxVW12NjlKWmp2cFhkMDBS?=
 =?utf-8?B?TjNoM25iQlAvSDBxYjZGNm8yOTJJNHBpcm5BaEhlUDRualpVd2RNZE0yUjkr?=
 =?utf-8?B?ekRSRjBxZTZUbndhUlNUTnQ2WEdTTkt1WHJFQldIT0N1RGJ5MzhVZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12c3781f-22fa-4290-765d-08df1007068a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 13:17:27.1344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gmVZXBoyHb9yhmjekT9EeR2Vnwo4zq8UhNMAzPRzPe866WwhKjIj0//7fPysyGhAERmewfy4hoci1HAnf1qNJ2PKrXW60gagvUCEI0Q2SkQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7516
X-purgate-ID: tlsNG-ebf023/1789132652-C12DCB50-89425757/0/0
X-purgate-type: clean
X-purgate-size: 2004

On 11/09/2026 10:45 am, Teddy Astie wrote:
> Le 10/09/2026 à 22:31, Kevin Lampis a écrit : 
>> @@ -2435,7 +2434,7 @@ static int mod_l4_entry(l4_pgentry_t *pl4e,
>>       else if ( pv_l1tf_check_l4e(d, nl4e) )
>>           return -ERESTART;
>>       else if ( unlikely(!UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu,
>> -                                     preserve_ad)) )
>> +                                     update_flags)) )
>>       {
>>           return -EFAULT;
>>       }
>> @@ -4135,18 +4134,23 @@ long do_mmu_update(
>>                 if ( page_lock(page) )
>>               {
>> +                unsigned int update_flags = (cmd ==
>> MMU_PT_UPDATE_PRESERVE_AD)
>> +                                            ? PTE_UPDATE_PRESERVE_AD
>> +                                            : (cmd ==
>> MMU_PT_UPDATE_NO_TRANSLATE)
>> +                                              ?
>> PTE_UPDATE_NO_TRANSLATE : 0;
>> +
>
> I'm not fully convinced by the double-ternary operator here. While
> it's a bit more compact, I don't find it very readable, I would prefer
> something like
>
> unsigned int update_flags = 0;
> if ( cmd == MMU_PT_UPDATE_PRESERVE_AD )
>     update_flags = PTE_UPDATE_PRESERVE_AD;
> if ( cmd == MMU_PT_UPDATE_NO_TRANSLATE )
>     update_flags = PTE_UPDATE_NO_TRANSLATE;
>
> Which is one line longer, but looks to me more clear on what it does.

The second wants to be an else if.  I too would prefer to see this
written not squashed onto the RHS.

Given that it doesn't grow later in the series, then this if/else chain
is ok.  If it does get longer, then it probably wants splitting out into
a cmd_to_pte_update_flags() helper.

~Andrew

