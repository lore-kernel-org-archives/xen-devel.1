Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC7BC98318
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 15:31:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1432553.1653763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9lPM-0006BP-19; Thu, 24 Sep 2026 15:30:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1432553.1653763; Thu, 24 Sep 2026 15:30:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9lPL-0006BI-Uk; Thu, 24 Sep 2026 15:30:47 +0000
Received: by outflank-mailman (input) for mailman id 1432553;
 Thu, 24 Sep 2026 15:30:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1x9lPK-0006BC-6q
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 15:30:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9lPJ-00D0Vb-JM
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 17:30:45 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ab5421a-e002-0a2a0a5209dd-0a2a4507915a-22
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 17:30:45 +0200
Received: from [40.93.194.41]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ab54224-b4ea-0a2a45070019-285dc229b021-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 17:30:45 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by CHAPR03MB989225.namprd03.prod.outlook.com (2603:10b6:610:302::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 15:30:41 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0428.015; Thu, 24 Sep 2026
 15:30:41 +0000
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
 b=Mr4xwyBeq0Op3KetQWdOqIMBUFqh0K7MQW8EcBZ8QNvIKsnyAM3SAUr9qP4a43pAyNikf1dzQE7uM6IpCX3cci8YJOT7sdSwltsFAQj+PpaNmTmPxJo0dOfHglauS5dG/fTRhxEglGQac4ucmBshTpuZz0mIuITfRNTeM5WSaDdqwN+9cryXBBIrhNOqRSwp37o4uTELglKRHzjctJRpZOFGlXRmMBvW2sz278+Rbtk+YdywHhXz95G2AYwB5BtzOr5XRP7EJBhayZASLOacHsSwLg7FlVtzB3yMuM1586yOxzkOa0PxpURmHqwB3Jj/ayu2HAuR6Yz2Dq3PYL8GXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnHiWMHoKc3fpqnzFPc2Jv5W3thflSOCUs3uyXfRWSU=;
 b=nqTBXswS5CDjx3UXm1MdWuMZhTe/BmkCf8qPdGo6pdw8opdKttUD0d3xi7O8IriAlv4Yh3q4HAOXwBRB/Y6EFMvQNOcxksEJ6y7KvdgHkaWBlJvEjSWRgzNg1C24L0MT1x80OMW740lZXIryBonWGlFlxuepj9O59aAdeMe1GdM0cNRqHa87eimrbr1Xgg0G7xgHSZcR4FWDFbJsEPBs8tLC63tuBQx901X1bB+AkpfnB6WvLm8KLZIhuSefT3Fq9fp+wYRSoeomuPu3ow982/Bhj4p0yX1ePKiW23kBUwl2qmjt4C52kCSnPNWLU/SmyQJbmtL6YQQmNoFZQwyErw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnHiWMHoKc3fpqnzFPc2Jv5W3thflSOCUs3uyXfRWSU=;
 b=gaAeiRK1cV479cRKq5gZyhqOU4vPkrKqurAi29Ab9xfiu4tuEsrbx5KkNvsK6IhHxPu0uDMsvhPYSRFKg2mFVf6TJEamR2ELmYMQ7dcB5S9Hh7kgc4TdOieRE6Jc+Ga8c0c4P+KFp8AuvJFlKgsthDMegrg2g0CxVjcGEhJ1/HY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4916487d-2492-4377-bdb3-415837b6a401@citrix.com>
Date: Thu, 24 Sep 2026 16:30:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: Clamp Viridian features to known set
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20260924110342.1045230-1-ross.lagerwall@citrix.com>
 <b444508c-1684-4999-b560-c95b9be0efb4@citrix.com>
 <f6de75b7-f936-4257-9a6b-c9ba9a3fc17b@citrix.com>
 <2f929826-3a32-405e-9bd9-0d47006e14f6@suse.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <2f929826-3a32-405e-9bd9-0d47006e14f6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0070.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::10) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|CHAPR03MB989225:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eed7a0e-9b12-4555-9dc2-08df1a50caba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|4143699003|11063799006|56012099006|5023799004|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	yoB9i41lLZ3i1zUVC/8buoqc3jDuZzV0JMIPC2XHl8B7VBJ7SLu0InjprUaIZFYPtbR340Y7Ui7PPRxPGtbBW1nXcM2f1optd1yF9C8wqxjjbPOiGIgR91E9CToHeG0KdxoG+B2COdBvk3KxGkiUEwS04eAa9KcYVv6sknHQDfqDRYRarUCkldpCGpPQuz6zrQPtnB2FKUROCfD3aUeLHIlxQS4ec785CiBGSSpLhEbI0eiaNYZVSrHpz2X66LkGzW8HF6uhRDr9emfyCrV+UBpcP3+H8X8/z+CeloN0SjnXAN1hcanYW3+rJ5y05kpev2qDxQUSn/eGPaItu+pfgdVmMoKn/RzDlEQ3xk1p1Zp+k+G0L1ZU2NVy5b3BruNgqXCKvqvaHx0wHw+J/8zxfBNeenncJs9orf4g9RahfEhY3MccBGIKGbel0/XAVo8fsXvqQPdUBismHVPd8V3epMIaL5PFBVSifSq+PoniJ7Ty/xbpmrC2miLwfQM3sJ2b7nClmX6wzBYQJdim/rdJDlTF5U6j1j9pIcPvhfz6LhDRx754dV80ebqO+FCjrGmcre1oEOdSItidvsWf56TlmpspesMwmYSBT+CFRK8fAfK0kRvH9rk7Cs3LCwWJAZS2HWZHnr+5h5cBU4hKM87cEyoutL+b62CNr3PxB74KkEE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(4143699003)(11063799006)(56012099006)(5023799004)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0tHZkVjR29wa05GdHpXa29zMGRLUXZFaStJOTVidTY1Ym5ZMVJPRGJrZEI4?=
 =?utf-8?B?aHZwSFdpWnNINlNDMkMvWHNNTlM2VXN2alh0MjloZjY2a2VMMThUZGtuSVJo?=
 =?utf-8?B?YTgyVE9LdTJ6V1pUZW5GUWRQWnNjZHlvbzEvTE1mVU9Tb3A0NHEvUkEwamVw?=
 =?utf-8?B?Kzk2SktIN2twT3JNVE9OWCs5bklmVk56Tk5FeUpVaXo5MU1mQ0FQamgrcWxN?=
 =?utf-8?B?YTBvZStVczVnTU53cnJMVHhaRjRDUlQ0TnZnYm8zWVNoMWVQT1JRTSt2OUxn?=
 =?utf-8?B?c0VHdVoyUEgzZ21jeU04M3dINjhVN205ZUx1amtHdjV2ZFFuc3BKUy9DTHA1?=
 =?utf-8?B?WFRtUi8veTRLcEpVclkzck9ScHlJNTc3V0JRYndJVWN2N3VOZi9adlV2cGRL?=
 =?utf-8?B?SG1KL2JDemlMcTI2STAwSE40WU1zVWFKOHYzTDJiVUtmVzh1MmhjWHZTejhJ?=
 =?utf-8?B?d2dnMnA5aTNuS25rbDNVSklGdDlaRWtjaWdidExKRHpsOGZUSk1PaUtiQlJB?=
 =?utf-8?B?cWxna04yN2twMjA4V3BqK0NFbUw1cE12TXhPVlBHQU03QTJTczU4VDd5NXRu?=
 =?utf-8?B?cmdoY21XRTZGMm02MDErZjhhN1F0K1doSkNOTWxMSnlmOU1yeDIzcWtDSnJw?=
 =?utf-8?B?WS9IaDVZL2FBTEY5MEtRdk5MVzh0eVB3czdoODBWbmpRTnBhR3FCZDlxTG9O?=
 =?utf-8?B?MUFlK0kwcGxhSzk1amVmcmRkeTBEOUxpOERCUTdmZFk3bEhyQXpSRWZSbGwy?=
 =?utf-8?B?ZGVFTnNEN1QwcEJYaW5tVndXV0tRRGxnUUFZbUtMbExkaG5yeEI5emlsQzJF?=
 =?utf-8?B?cDNVVjZxVjFDSGdIVjd0c0dWL3p4U2VleW5SenNXUFE3cnpMbHhaQVRsOU53?=
 =?utf-8?B?V2JvNVY0Y0puK3g4eG1YaUgyWGtzU0JUQjVlNFd1K1hNcTZtZEtwdlNaeG5r?=
 =?utf-8?B?ZXY0NGMzUGs1U0FCd1YyMG03SjlobVR6bG40SmwycVBQSi9ka1VZaTZxV2h5?=
 =?utf-8?B?VXUyd0RkZ3FBdWFUcVF3UEsyZ2VDTFBSUkNabURlT0F0RWR4d3l2aWNVV3NS?=
 =?utf-8?B?YkVlblJpVHRRTkVkMEhGYzBpQ2srWDl2UGJ1d0lvZk9QTjdTZG04THhMMlNt?=
 =?utf-8?B?cmIwdEUrOEFMMlBuMG5OWi9ZUjR5VHdTMWQ0amRPWFFNK2hvTGQwQXlLMUNt?=
 =?utf-8?B?WnpqVXhKN1psVTlHOWR1TmNPWEt1bnE3L1VueHJKeFB2RG42RXVjRXc2RFl5?=
 =?utf-8?B?ekRSYUpvQ0VHeVB1ZThwWUMyZ1FpbWkvVjc3MlBiSUozMVRVVndFTzlvR2JX?=
 =?utf-8?B?QnJMazFFaXIrOVRqUFI5ZTlTb2x3OXA0MWNHbUpjN1R0YVRPaWFDcjBqWFVx?=
 =?utf-8?B?UHBla2ZFNTVZaWNpN0g3dDNyU0l2anBHbVJrNTNqTHY5em9mZk9QQ1MwQXhx?=
 =?utf-8?B?L0FtVG4ybFgzbEk4Q1pOV1E0K1ZyTE1hQ2JYcHpreXFJMTRkMUt1VTU1ZVhQ?=
 =?utf-8?B?TUEyVGxubi9odFdONFl0OFYvQVBzN0FOa25abkRyWHRrM3J5eVM4UmFIc3Ju?=
 =?utf-8?B?aENyOENsbW5GTHFGSTQ3UkQ5NHhhYmFGVUhYQU9OV1Nuc0xjTVV2YmFyNVlt?=
 =?utf-8?B?Z00wSzJKRFpYbXh2S1BMN1NRYTRSZmE5dW5GZmR3enAveFVqNktaSVJkVkR1?=
 =?utf-8?B?U05DeWRiUVNhc2NKWmhmb29uTkwwcDNsdVpyNWxlMkxVTnBGQzZ2cm0yekxO?=
 =?utf-8?B?VDdvQnU4WFdBTXdNQVYwR1VuVlVlQzVpZm55NGZFNEFWejQ5cWtPcUh4TjhG?=
 =?utf-8?B?NFdhV2tXdGZOcUp1MTZqR094Y1pwS2pzbGRRV3pYODI0THY5K1N5Z3Y2RDAy?=
 =?utf-8?B?MVlZSE9WMTczQ1R5WnNzSDUzZmd4NUpma0VIOW5JUjhNMm1ZeWg3L0o0bmpu?=
 =?utf-8?B?bmJSeEN3T08vSHMxdFFFN3hmVHQ3TXpwUEw1cVVMOCs5OHprS0pzNGl5Y25j?=
 =?utf-8?B?V0ZFeVJwZVpmcXpWZWZJaVVlcUR0VlI1cHkxMW9uNlRobnptbnVaMFdmY1BN?=
 =?utf-8?B?aDNtRkx0a0tNMEdUT1UzeE9ZNGl0cDNDWGNyVWZaZmdkVjAyWXhPbW51bnY4?=
 =?utf-8?B?WUFacGxRNUljR3U3ZlJlb3dvODl1bVhGNjlsKys1eVRqbE0rZTY3ZGtGT1pN?=
 =?utf-8?B?RElVMVZMaDlmd1F5VXBZTkhVUGI2UHFZeHBkQUVFQUlxQkt1MlVuZEpYUUZ1?=
 =?utf-8?B?MW9RbDQ4Q1FGSzJPc3pHa2REbnR1RnpEOWVUdUMwbU14bUZtUGN1NThLZXd2?=
 =?utf-8?B?RFM0N3Q1U0phT0xROEpRNTRhK3RLVzRKems3TjcvMUZaTFJmeEhMUkdHSmFs?=
 =?utf-8?Q?Egrrfd2HD+vwapes=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eed7a0e-9b12-4555-9dc2-08df1a50caba
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 15:30:41.3094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: usrcF7yv514qYsP+TTqGiGuKdHj7DLnmAi47IgTYgD962v/uF2vl9jaY4c1ni7R/4g3AC32rY3WWu+YhC/QQ0oBrL/6pJyWDlD9OR2zR654=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR03MB989225
X-purgate-ID: tlsNG-ef75cf/1790263845-3C411AE4-6F765D15/0/0
X-purgate-type: clean
X-purgate-size: 1216

On 9/24/26 2:08 PM, Jan Beulich wrote:
> On 24.09.2026 14:56, Ross Lagerwall wrote:
>> On 9/24/26 12:20 PM, Andrew Cooper wrote:
>>> On 24/09/2026 12:03 pm, Ross Lagerwall wrote:
>>>> Instead of returning EINVAL on an unknown feature bit, clamp to the
>>>> known feature set.
>>>
>>> Sorry, but no.
>>>
>>> This is equivalent to saying "I've got a VM using AVX512" and Xen saying
>>> "ok, I'll ignore that safety check and let you run on non-AVX512 capable
>>> hardware".
>>>
>>> Requesting a feature that Xen doesn't know about is a hard error.
>>> Truncating features out like this will cause a guest using those
>>> features to malfunction.
>>>
>>> It is a bug that this was expressed as an HVM Param in the first place.
>>> It should be part of CPU Policy, and it's on a TODO list.
>>
>> But isn't this the same thing the CPU Policy code does? In
>> recalculate_cpuid_policy(), it silently clamps the toolstack's choices to the
>> max featureset.
> 
> Which is behavior that, if I'm not mistaken, is supposed to go away. Such
> requests are intended to instead fail, down the road.

OK, if that is undesirable behaviour and going to change in future I'll retract
this patch.

Ross

