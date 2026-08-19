Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664BCC5DF81
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 21:07:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1395809.1634029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwnUP-0003NO-K9; Wed, 19 Aug 2026 21:06:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1395809.1634029; Wed, 19 Aug 2026 21:06:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwnUP-0003NG-Ej; Wed, 19 Aug 2026 21:06:25 +0000
Received: by outflank-mailman (input) for mailman id 1395809;
 Wed, 19 Aug 2026 21:06:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wwnUO-0003N3-41
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 21:06:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwnUN-00BFcr-HE
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 23:06:23 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a861abe-bab6-0a2a0a5309dd-0a2a4503949c-46
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 23:06:23 +0200
Received: from [52.101.56.62]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a861ace-fae8-0a2a45030019-3465383eb019-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 23:06:23 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BLAPR03MB5604.namprd03.prod.outlook.com (2603:10b6:208:29a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 21:06:20 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 21:06:20 +0000
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
 b=ItSqfhxsKGc6QrBjg+H4sH2gPENlqAN7yHSAaTi/jKuWeiYuSYEVbJsuZEhdfB0Kl43CC7C/2u/gs/dAS+Zmt4WUAx6XWpNu7exS5ePhAzEOoL5ky/mBuI+HAlF2gGDWQMuhFzp13IRrrOtFq19cwk6ahR0rHyRDOvqpOTMYDoPosqTvqLMlZJItmWr45yEgjJo3hk/QRjFAbsChTv1/O6kl2JgLnRXx6eLzIVz9bhXmvyiS4uke2Fde1XTVsOkpM2GBwYn7Ih3U9uPVXtuj3kuZczDthnJYu0scpQwb6ObUO57yxOkSjmywIumIz7yos0QpOSWD/KCxtMYmsxftaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4RAy1iA+wEISg9oWUqKgTndMJKJIZBWyCoImFmxuYEA=;
 b=ylrkgaiNhxh+eQzNY1jZLdOqqsVYSqwMt+97RrE1d8CaF9ErJU9hURjJHh9uy0nraPMkxuwan+In/Kib0GXF8oDCHyJENVYSleTamGAXs3/jF8mV3k7sG9D9GCaeniW3yG/2LeJcJSN1SIxnupjkdBfV2RYSY/QOmEz9q/iRKxrKh1O3LEk+qOFM/V5+tv7HGvJ8p4Y47VXexUfU7QvsAEYA69RQug07vfRfmCMN236zzhm6Dp2NEB78U6HwLhxAxZapqfcoqFe027uwJepV2KMXaiK+Wb1pd4spnt9CsnpE7Gi2TwIBZ0aJPJuO+RWY96ckeraz0coaPm/7wxxsdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RAy1iA+wEISg9oWUqKgTndMJKJIZBWyCoImFmxuYEA=;
 b=sg8g3VnLbgg4JZhpS2XOq+DuJ6ru+/an9r8FCilM1enpwor2bco6wLSxf8pGeY0o64t+CZIyms+YEK3JOPGvG0CXvT5Hko68r4yx6K012mwyN267sSJ2e1vB4HNr/2h7BZu6txmJf3eYLDDP+GLPkHeSsFy7n26q7y5dM3VSuvE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5f6df9e5-d0bc-4c1f-8513-27eaefe73292@citrix.com>
Date: Wed, 19 Aug 2026 22:06:17 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/ucode: Remove MICROCODE_UPDATE_TIMEOUT and associated
 panic()
To: Jan Beulich <jbeulich@suse.com>
References: <20260818130738.1911850-1-andrew.cooper3@citrix.com>
 <5fa222d8-af04-4b1a-a457-ee5004ace484@suse.com>
 <65789d8b-d18f-4f1c-8ffc-e1247daa4031@citrix.com>
 <ffe6c2b0-ec82-40e6-9bf5-fd49a3ef3a43@suse.com>
 <1200071f-122a-4dc0-aa08-7a7e2f1a6587@citrix.com>
 <90d8da75-3d95-4cb2-944c-24e11b0e215a@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <90d8da75-3d95-4cb2-944c-24e11b0e215a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0411.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BLAPR03MB5604:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f2772c8-a166-420c-9e66-08defe35b78a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|6133799003|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	TqN2CD9h9BwSwwq6APTzOlJ3Z1LWKfNo9oUiyjsCxXttuW6YUDWI35GFE4xVa4pDGF7C2nQ2IumDc9ZlynXIxqys1QQP/Kijk1TY5nhR3JPLGF1lPMwMzGolHij3tVPZGh6pw1Sla5gh5/YVSIZwniXsSk+ZPZ116bUzc561yRVtLGvlcNFeo4BPvLXwWZb28zRbrBqJxdzxkz0ABHHyh8EH48JSZJtcmEnGFSKI6eNo0zj9Of2/52JlIRlBs5nfzSFDo2O4bAQ1U3LKbPSBm1uaBk8PcJSnreu4TJMRjEEj38O05A7XEieounj3g6FfNEaRjzm+20O2fXN7MkGOL3XJ7d2DStMA3idTPpjiLdilumb4TN1BC5CnbLrmD1lpY/bJJqp4VNTt21xPkLSEXF5HyphKvAyoE0H1/wp3GPJuISI7K+XHnAjxJS5ZoFxtQiFtLV542syLCf4sYRGRxRc4Fdkxc79aTsk+9S6WFVBSl5jhkCighBwkykZEC4Cuw9NczRksAhcQ1FZNN32GIDIlNpLKfmCVTs2yBDvM9UIurcoDLLVMUdS4D7Md8m8AxThSKJMBLQH+7qd7nDFJmdkKyQQBa5/AEjr9uZWyAvC+8FyM902d7fNwOp0Sjrj5R3Z0/h3xcmgg6oYASaEtbJ0cQP+VPYrl9rtDAetD9YQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2dZWlhEdXFDcW5rdDd2Y0V0ekpkUkMrcjhMQm41Z01XTG5wMjlLbzNWTmpW?=
 =?utf-8?B?SE8yVG11UThDNjJ3K3FETDZ2dk12SWcrZThUZEp1MWNVaTB0NjQvV3BDR2Rm?=
 =?utf-8?B?OUJkaGxCME9vckxBOGxleE5QQUU5TTBva0x0aG1RZFdreUJqeFoxTEZMQkg5?=
 =?utf-8?B?ckh3Q1oxb3k1U2xNQkpTMUFKN1hCRnVpZmw2MHZrcEdvUGgxT0dRNXBMYmtH?=
 =?utf-8?B?VDJBUVlCSnM4M0ZleDFJeTZYZEJzaGFiWVZuSjJLaTBJdGhhMUNwUkJIR2tR?=
 =?utf-8?B?MGk2SjJvUmhoS0dod21aemZLcmFTS2ZtdXY5Z3cxZWppdmRiZlozcmtaY003?=
 =?utf-8?B?TnVwYUEwM2hZTEttQ0ZqTDZuVmd4eVBmbzkwdktVZU1MY0h0YlpvWFNvS1NN?=
 =?utf-8?B?WWJGbUpmdGZ6M2MvMHo3S1BUNDRETXhFNmowRUM1YmlhQmF5bUZQOUpLT3RN?=
 =?utf-8?B?R09WNUhod2hOOUcyR3dEWG12d2hJV2wrMk9QK0wrQnFoTUxkQkZ4Sjczdy9z?=
 =?utf-8?B?TWprQUtkNW1DSWxkMkRZWlk1SlRMZE1wSEdYM2xsUVpOSmpIVzNCWmhjWFN1?=
 =?utf-8?B?bkJMVlNJMHBpN2l4bmlPelhHbVk5SFl3SVAwSkkxaU9OT0xqaW5lOE9BNEsz?=
 =?utf-8?B?TkNTM2p0REd6ZXlSd3JMejJuRHNkREJVMWRRVW5sUnpOS2tEejJTUkxpWG9t?=
 =?utf-8?B?SDBmZ1RwaG5aeVFpK2lsbkUwTXZmT0NaT2d5RDJSalVzcmZUUWRKNUw1bGQ4?=
 =?utf-8?B?dm9XVG5KakNlOTJmRlZta3BoTUIxL3hQc3FtNHBHOS82N0EwQ1Q1OWc4WDRR?=
 =?utf-8?B?eUg2UWdOSGJSbDlBbTZNL3h3a0h5Z29icTZrNGlxR0pOWlJGaWthZENFV1ZL?=
 =?utf-8?B?WVlIODZrWjFvTllwZ3ZQTmdDdXpNMWlLOEFreEdKZWFiUFdqRjBIdTY3bnZG?=
 =?utf-8?B?OU1mZTcrMW1oclJObkVFVGtiY210QitVWlJ0Q2t1L09TdFg4Y2pYZ1NWVDgx?=
 =?utf-8?B?UklNTy9ja0VmT0Q2QVQ4Nkt3RE5zZGI3REhXY0Z0a3BzTk81dlpLMVFYTUUy?=
 =?utf-8?B?ZEZhYUM1Ti8vdXROeXdacjJCMWpWL0dMZVBoNjNRWE9wVTBpRFlMeGRyd05k?=
 =?utf-8?B?d3lZWjdYbVB4dDA1YWM5ZEd5WTJwZ1lJM2FZNHd3OThpL3lyRHVsU0kzdE5z?=
 =?utf-8?B?NldLM1ZGemZIRDI4YUovU0RqbHVmWTZjMzJQTE5yQzZHMU1nUVVyeWFoczRH?=
 =?utf-8?B?QTNib3RBeUtoNGhTOWtleTYxdmMra0hKTE9ubkFJV2VaeE9PSUk0WmlQYWVl?=
 =?utf-8?B?K2FxZUFibGVEZVMrbzFicW8ySFM3UU00QUVYUzBuQ3lWMFRpWjhXL0RmTFJu?=
 =?utf-8?B?c2hOcGRtRExDeGxHeXhZOC9xaGJRZ0VkNEltRTA2Y0ZqNEhSdFYwLzZZd1N0?=
 =?utf-8?B?cG9wU0w5SEVCdGpGTmRJWXNJK1dJc1dOcTJFdW9QUTNmRkE0Q3JUVWRFancy?=
 =?utf-8?B?c3ZaYzZyMTFvN1JUcVoyamtYZUphTmJXc2lqY2llT09qOXc4TFJLd2krOUNM?=
 =?utf-8?B?Z3NVR0pjT1p1STRZNzBnQUFiRmlRZk9kRjh2TDA1MDF1NzdwMTBaZ1lLR3Nj?=
 =?utf-8?B?dzdIeHZCUnNaVmxuc2tZSm8wYXMxUjdhYmpDNlloMCswZ1ZMMnJyRkE2Mm10?=
 =?utf-8?B?dnErL2p5Y2ZVWjdpUTc3anVWTVQ0c3FWalZrNXA1Vk9td09MdTd6dkl0RTU3?=
 =?utf-8?B?aHlWUWxXaWY5NkdIK2t6dWV1WWZWbjkrU3hURlczVVNKMi96WENBcVM4c01s?=
 =?utf-8?B?RlF2YWVCTWdESkdBVXpGeXQ1MHRTR1J0aitscWhZbGUvNUorenhOSUpqRytW?=
 =?utf-8?B?Rk00dkRMb3dDMk1oTVpKM2g5NGo2Zzl6aTAwckR0R1lDRXJlVUhuaEluSHpZ?=
 =?utf-8?B?YWltSnBFQ1lRdG1aemMzQWlCY2tXRkJzZG9kdHNqNU9IRE4rT3lWNFdqUVFN?=
 =?utf-8?B?cDFVZ01mOVNrWk1UcTd4aG5aclM5SDZyMzBpTG9HYU5tVDZkcXJjcHhieXl6?=
 =?utf-8?B?SER5clRxTlNHRGxGNGJNcG0xbldDY0o1RSt1aFBJKzdmSzZ1eDZmeEFKVlZx?=
 =?utf-8?B?YTdqZ2xDa25oNnhMMnBKTElNa1NCNFBsUi9nSkNJcUk3cFNoRk9JR3EvNldo?=
 =?utf-8?B?N0FHN2IrWDA3RklWN0sxYVd0anZBT1QzUys2NDJvVWtyQVVSNnBObVlHNWFz?=
 =?utf-8?B?bjAxODU0eWltcGVtVEljM2crdjA3OFZNZ09FMWdNVnpNRFR2OGc1Sk1UUHFW?=
 =?utf-8?B?RUc5OXErVE9LZjQxQ3h4WGFRcS9MWjVjN1hBL2ZXdVdmUU4vdzZEK2oxbmI4?=
 =?utf-8?Q?Ri7ZO0ay6QcjacpI=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f2772c8-a166-420c-9e66-08defe35b78a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 21:06:19.9979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+u07jk+lppz5yNmbNTLohhdryPNrH3uO5zxv0MXgYi+ifUZ7fLPtLp7Cv6Kh+CtpXsa7QnKI9QIGzlhryn1mfCq2GVsbdtmxFrELjnTV8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5604
X-purgate-ID: tlsNG-33051d/1787173583-6FAC44E9-81A618E7/0/0
X-purgate-type: clean
X-purgate-size: 1762

On 19/08/2026 3:53 pm, Jan Beulich wrote:
> On 19.08.2026 16:04, Andrew Cooper wrote:
>> One other idea I had:
>>
>> If we rearrange the loop to have a periodic "taken $X seconds" (shows
>> liveness), and maybe at 40s decide to panic (by passing through the out:
>> label first so we release the APs, so they can crash more cleanly), then
>> that might be acceptable.
>>
>> By 40s, the system isn't surviving even if the cores do all come back.
> Maybe, yet I'm curious: How did you land at 40s as the "magic" boundary?

Mostly arbitrary.  Linux has as least one timeouts around the 20s mark
(panic on soft lockup).  XenServer has some clustering timeouts around 30s.

> For a runtime load, even the 4.5s that you say GNR takes may already be
> too much for the system (Dom0 and/or DomU-s) to properly survive as a
> whole, depending on their requirements and/or configuration.

Its 9s all together, given our algorithm.  And I was a bit surprised,
but even a busy system doesn't seem to suffer any permanent issues as a
consequence.

> Even our
> time calibration rendezvous wants to occur once a second (albeit it may
> not really need to run that often, plus iirc you have been saying that
> we should get rid of it altogether).

Most hardware from the past 15y doesn't need it at all, because of
Invariant TSC.  Some >=8 socket Intel servers need a one-off calibration
during AP bringup, but that suffices AIUI.

There is one advantage to the tsc rendezvous.  If a core/thread/etc
really goes offline, it guarantees to get caught.  With the watchdog, 5
seconds after that, you'll notice.  System-wide TLB flushes have this
property too, but they're irregular and never the thing caught by the
watchdog.

~Andrew

