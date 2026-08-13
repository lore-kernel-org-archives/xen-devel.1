Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8AEC5B572
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 12:22:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389945.1630525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuUSB-00062w-5o; Thu, 13 Aug 2026 12:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389945.1630525; Thu, 13 Aug 2026 12:22:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuUSB-00062p-2B; Thu, 13 Aug 2026 12:22:35 +0000
Received: by outflank-mailman (input) for mailman id 1389945;
 Thu, 13 Aug 2026 12:22:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wuUS9-00062j-5N
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 12:22:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuUS8-000t8q-IA
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 14:22:32 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a7db705-2eae-0a2a0a5409dd-0a2a450c9b20-2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 14:22:32 +0200
Received: from [40.107.200.68]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a7db707-f479-0a2a450c0019-286bc8446ea1-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 14:22:32 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA2PR03MB5788.namprd03.prod.outlook.com (2603:10b6:806:11b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Thu, 13 Aug
 2026 12:22:29 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 12:22:28 +0000
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
 b=SJ//nk70yEqCRCrrFqsk9hDBtJrNpjb19sWlLpIdtf2LZ0aTSEVYcRtOt9MxCvUX2PjQB3HJ1em85zfUvOgPOBK+tsM18r8NXLR1Z9mkB0heHosYMNcMkTu7XU0eIC9xlF4Qv7Vdhb1hacJh+5dn/t/MyPHoYTdlPxRGAIq3GoB681qmCwRIzEcHFgKNc6GVLlykSuShR6XRFTv4cwmPfLw1CMBadM4TbI13TJSIBWovFVEvsNzacnJlp57Yo6l3JfA4PQJlLhUn5TeQEUfFIoYWOfxNgFVgm1xEQCDGdloC/dhCPVY8wGnVsfJV6r6Jb73PgaTPcP1GHXX+OWOHrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=McZ5SVT6shrDS5/Lw+9osd/kd9UaN7QK0vOnmdwylYA=;
 b=y0U9yCc/at1CJDFy4fXpFzycM0AEUmFsssFlIJ+xkq9c7RQFdAIxJ3OeRl5ZCgO199UrbDtY+GeETXD8SxzoOtgW5siY12Tp73MVMPf9+WkavoBVeNpHKrwGs8NnkhBTxrLo1RdbZ+fxqfaRIDIjWdDtCT7N0t4jBZJdIWtKf298dmg5w3gMuYOP1TsRh/qRTIN9UTq0bz8hc4GdGAOtG1jcjSEYzdtMi5UlwzdQpDtlNU+JbZ1eJT9Ml5IZX9XOm78ZH8pv4TG3dOxjv9EruRBI5UlwdtI+6EgiUEl3IwRev7+f3+HQhy2vff6AbnkpEKAxSDYIHFHK3yc8bd7CUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=McZ5SVT6shrDS5/Lw+9osd/kd9UaN7QK0vOnmdwylYA=;
 b=UBWL1S+5aD6m96VQ/zEq15vr7xaXKwoOTwKYTX/4PoMSsM+ADmRU3ZClihCXTIIfOQmmgo8SW8U+ApGGBFkcRjoH3RX0IPu9lMUHRF2Nbw/h3PBZ64R1JV8H4hVd5YRCCBFjabkrBP4tx013N8KIILqT4MUj81dQTYhMjyD0Pt4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4d9931dd-9369-4b87-9064-aa484ef5a570@citrix.com>
Date: Thu, 13 Aug 2026 13:22:25 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/4] x86: extend update_intpte() to support atomic
 get-and-update
To: Jan Beulich <jbeulich@suse.com>, Kevin Lampis <kevin.lampis@citrix.com>
References: <20260727150615.1373200-1-kevin.lampis@citrix.com>
 <20260727150615.1373200-2-kevin.lampis@citrix.com>
 <6166e2ac-3b8b-4702-ac15-357d1c1a4c56@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <6166e2ac-3b8b-4702-ac15-357d1c1a4c56@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0057.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA2PR03MB5788:EE_
X-MS-Office365-Filtering-Correlation-Id: 10e8ca07-d8f9-4225-b85a-08def9358a7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	WYODp4j/x/b1Jtg6R1M4azS3DFqcDWkZ27kgMXCXf9x3lj/rdv77+0TbsHwVY0GVe0C3YRhsGuloUIO1F9gZdqz5L6Fo6HkQi0MtU8LdoBmWplghK17yCoUy4syj8eXDqACAWQI0sXtM7njnYU9BIaKqFTDPlz72c+RwBhXIjPUWblA3zHjvTBQHiNmHpZAdKVdgOsSyDq67h/rVEwGo2lhLsZE5A2Hxg/Lp7YHlyi3Lm6L8UcAah9Cz+aGij3x4XJAY9SLH5ged7TwosquUWTM13sYMGiQHnfbaGPAiwM0uXgplsoQ8ClZvPg00BPxQyjE7it1DF7xtPfNr7U/BGnRoTsiZevBCW70ftUNdzGDFcPJOfZ0qINBiIb8fV0Mk3y1qukDHz7K8T4ZNtK7MvHQwoPOIgWshBKOMxrELbSDWfPuwhVIz3f06Gjo6QS6MQeT7zFqWyKgAZySflT+3vM/7F0daBccpDzlk8ZCmuQZzn+mr4GDX8+v4LA4IMcM9euLm6xkvH5xpNoidS2dLX+6S9Q1pkXsDiGxEp3QmuWLfd6AkrdgxM1oilB5Uq98bogLjd7146cQVndb9G4gIhDNCzQXn6K1rEElosMrLCQBjFS+zNKbVKhhkJtUTYWylKuzMwwIrtal9rtUWs7Bmhek6ujBc7H8qd5foixYetz8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tk9TOUNvK2gzOXljQWNjS1pSdS9DVEdUZWE4U1UyelhldzlQK3ZpU3ZsOEVT?=
 =?utf-8?B?Qm4vTE1qbkMxR0QvU3RkS2xqSzg1aE9jd3NyNWFVeHlCQ0xzamtGNHRUcDdm?=
 =?utf-8?B?dnVwZFdMVmZ5dW9qeC8xb21iWFNwc040dTVxd3R5OGtKR3hOMGc5WS9GZ3Vi?=
 =?utf-8?B?SHNBQWd4bEJwSXhneUlVcm5ZdmVFbWpqanRVTTk1V24wdDNXdm9MQUFMZXhq?=
 =?utf-8?B?RDVJRkhyNXM2Ky93Wi9NVmFQclM1Y25JN3RMZ0ZSZU1iVFV6YlFRRVZ4bmtV?=
 =?utf-8?B?bnBQa2F3LzQrMW1sWm9rOHFpZGNTTjJYUWNDaXVhOVBwSXF5MzVSMHcwUGtr?=
 =?utf-8?B?dmJTazl6N2FyZEg5VDV4bWI2ZVRmbC9wKzJnQ2s0MTdIYWhHckJWNGQ4QS92?=
 =?utf-8?B?Z2FoZWd0WS9oNVBBNUlLMVBVOUZObGtxbXJQQXpZVllKZFNBbDRya2xQYVFS?=
 =?utf-8?B?SVZ6eDF1TDJSSU9rcmdhakZkUFRpZW04K1lnRDU4N2JSWnduVHJxbWxNUzgx?=
 =?utf-8?B?UmJDK1JTVVJOeWdtS1U5bmx3OE5tbnJwd2xlMk9BOWw3dWRZczdPRURGYjZS?=
 =?utf-8?B?Vlc3NjYrdEthVHhIcDlVbDM2eWlRWXlxbDJrMU5wcitnd0dXRTF0ZWsvUktx?=
 =?utf-8?B?MFlUMHgvMUdNb2pBY2lBbUM1TEx3S2xmUjlqS0Q3a01uMnFvdlNyTUZFUC9U?=
 =?utf-8?B?Z2dBdkZKbjh6eUpTcDBwNGhHajRRN3BEdVdobXJMY2YxMHRieElJSTZ1d0RB?=
 =?utf-8?B?NEhoYktDUm95cmUvQW50UUQzMFBoV3hnNFBJRCtJTmhzL1p6cmorY2NidHZF?=
 =?utf-8?B?Y0dyOUtFM2JaZ2xyajVlUGNNcDhVSU5ERzR0VmZhNm53YmpkU3ZLR05acFVp?=
 =?utf-8?B?VnZXTDFmNWRpL3FWVHlBOWo5YVB0VGkxQStwcUdzdDEzbjBJQlJrejJLcExV?=
 =?utf-8?B?SkU2bVQ1SklmZHBpeTkybGJzSzNJV1pmcEtLUlcxR084WDNqM3YyZ1hKS3RK?=
 =?utf-8?B?M2dMUXE2RDIzMW10VXZvTUpmbUVrd2RuV1hQTExrbHdWNmJmUU5XRkhXYzgz?=
 =?utf-8?B?TXBOUjNmNjlLeWdjSldVaVZVMGN5Q1htVm5CTHVXR3cwN1licXVKYXNHcmZF?=
 =?utf-8?B?YUgzcldtTy9UNFBuTGoyQVo1SFpDclJpYnFFbmtuNGh6OC9uNnNBV1ZrUmsr?=
 =?utf-8?B?L2FtQ0pidlVaeWw2Ujk2dnZOYityb0RMSUxISUxkU09qRC9BSHRrWDVXelZF?=
 =?utf-8?B?S1VEcTJmZ0w0SjdxWWJEb1JpemVacHNuUG1LTDJKM1RWVkRhcmNPQjAzU252?=
 =?utf-8?B?RXpjcTNVbEYvZnJ4SDJ5b0xuT3JoakpMaXpUMzJRZ1Z0Z3kxTDcyVXNZVmt3?=
 =?utf-8?B?SUIwMWQrL2xEZy9zaHVBd0p4TlEvTlpmbmExbXdFT0o1cGJjaTcydFpZT2Z0?=
 =?utf-8?B?Mm00TnYvWkl0eG15U2hDakluZDZSdkN6Z0I4SnRCQm0rbmplYjNtKzdRRVMv?=
 =?utf-8?B?RkxjdGtiY2M5ZE9sWGZwcXUxSUt5MGtKYXBWZFd0TklITWVaOHhZMnZwK1hs?=
 =?utf-8?B?ek5wZlpqZzdvR2tDYk96MDVpODBIZDMyMzhoUCtSV0JEeHZPZjB5cEo3ZWo5?=
 =?utf-8?B?elBWUVJWTWJXVnY4TUU2Lzc2dTlyTzREWDZCU2dEUTUzUnd6WGVYbDFrRFUw?=
 =?utf-8?B?RGduOTRnME5md0FTaG00ZVN0a1dGT1dXdExxcU5JMCtLRzhoeDlxaGEzVjlp?=
 =?utf-8?B?UTl1OVBTVHRPYlZlTk5jbDQ5SEp4amlXT0VLaWh2d0VZTkNxK3lwNUlhem9x?=
 =?utf-8?B?WUZweEVWR2FKWS9uSDRZamdLS29sM040RVJLQm1DODM4Zi8rRmNpYnBDSlRy?=
 =?utf-8?B?SFVEZUloMnUvOVRjeEFnQjhYWWtrUDdLM1NnT0wwVER3NnFVNitmZlhZQVJu?=
 =?utf-8?B?U1NHMVJiLzlKT09MOWJReUUzQStYaTVFbzV4OUsxck11c1A3WENZdGVoU1Z5?=
 =?utf-8?B?WktwR2NMTW1XUWtOUFdzdVlPY0JwNlIwV2R5L1FXWjlDNGZNWVArQTNDaWpt?=
 =?utf-8?B?YW5XOCtvMVRDOEM1MFNObGRjaGhGdlg4YndsdmlabHhMWkhzV3RNQndNRG0y?=
 =?utf-8?B?eFg1eU9xZGZ5U0ViU3VVNUFFS3dHZlhGVStrakFrS1g3VU1xV05ZbFpVWkVr?=
 =?utf-8?B?VEdSb2tvUFVMMU5SdER0YmpMMDFQS1pRVjlPdENaNytPbUMybVdIYUdSQldk?=
 =?utf-8?B?bzdRb0FBSHArR2pBcHNYUmtmdUlGVi95WExnOTBOYXVVemdTcHlROVVJT0Yz?=
 =?utf-8?B?ZUlUaWVmVW1Tay8yaXBIYWkrOEgzdm5jekpycHNpS0ZONmtYMk5uQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10e8ca07-d8f9-4225-b85a-08def9358a7d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 12:22:28.6310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 563N4qF8X6uYfL0LoZBHnf03yauAXOCqeaTHngyCkA2vmg0X3si4T9VF7mA7Vrsq9yk1oj/QzW+Qun6h5oKXDINXOcuITmVusuCpOZ3uEz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5788
X-purgate-ID: tlsNG-d25034/1786623752-50B3DA5B-01066367/0/0
X-purgate-type: clean
X-purgate-size: 2003

On 13/08/2026 1:01 pm, Jan Beulich wrote:
> On 27.07.2026 17:06, Kevin Lampis wrote:
>> --- a/xen/arch/x86/pv/mm.h
>> +++ b/xen/arch/x86/pv/mm.h
>> @@ -66,13 +66,14 @@ static inline intpte_t paging_cmpxchg_guest_entry(
>>   * How to write an entry to the guest pagetables.
>>   * Returns false for failure (pointer not valid), true for success.
>>   */
>> -static inline bool update_intpte(intpte_t *p, intpte_t old, intpte_t new,
>> -                                 mfn_t mfn, struct vcpu *v, bool preserve_ad)
>> +static inline bool update_intpte(intpte_t *p, intpte_t *old, intpte_t new,
>> +                                 mfn_t mfn, struct vcpu *v, bool preserve_ad,
>> +                                 bool use_cmpxchg)
> No 2nd boolean parameter, please. (use_cmpxchg also doesn't look to be an
> overly good name; "swap" maybe?)

This is half of a patch that's been in the XenServer queue for decades
for other purposes.  (TLB-flush avoidance based on A/D being clear, for
which you must use some form of atomic, but it relies on dom0 being
trusted not to clear the A/D bits in isolation.)

I agree that we don't want more booleans.  Your flags proposal looks
like the right way to go.

XenServer's pre-existing usecase could get away with XCHG.  I think it
was wired into CMPXCHG simply because that already existed.  This new
usecase probably wants to be XCHG too.  I don't think "please preserve
AD while swapping X for Y and also tell the the old value you found"
makes much sense at the hypercall level at least.

Furthermore, now that the return value is unused, we could return the
actual old value to anyone who cares, which avoids turning the input
"old" value into a pointer.

~Andrew

P.S. looking at the preserve_ad logic, I think it ought to be tightened
to only permit A/D becoming set, because that's the only direction that
hardware will move the bits.  A/D becoming clear is a race against
something which is not the pagewalker.

