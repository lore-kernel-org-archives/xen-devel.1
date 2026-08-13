Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0918C5B572
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 11:49:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389869.1630478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuTva-0005IR-FR; Thu, 13 Aug 2026 11:48:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389869.1630478; Thu, 13 Aug 2026 11:48:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuTva-0005IK-Ch; Thu, 13 Aug 2026 11:48:54 +0000
Received: by outflank-mailman (input) for mailman id 1389869;
 Thu, 13 Aug 2026 11:48:52 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wuTvY-0005IE-Kc
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 11:48:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuTvY-0031IV-0k
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 13:48:52 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a7daf1d-e002-0a2a0a5209dd-0a2a4501b24a-30
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 13:48:51 +0200
Received: from [40.107.208.53]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a7daf21-5984-0a2a45010019-286bd0357d2c-4
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 13:48:51 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN9PR03MB5964.namprd03.prod.outlook.com (2603:10b6:408:135::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 11:48:48 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 11:48:47 +0000
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
 b=f+X4ZVQfy28x7aU3xQMvEFOpTZh/oBiC7pqQljLLTs3cJru35VjOFrNWLm8sqiU9I9vW1imzh1fBpu36ZPE6AZ3BX02fbUu7lan4NUGYKAVsbspSwQ7ULLUNFUf70A5d0yjkr9nJupjlmnRQGqTfMC/R+Mfcj9S7ZWyfrEcb639H9Guoh0nc2QF9INxbLzaXDMR2TMhKFeGlmAgyGY8L8z96x+WQ+F/hloPHnVkJ2d06pAa1Ky8R+iHPmWPPxK/ia66BqFBo3t693OJeBZwVaWsUE+qwZW7gqRwLIBNGaYiRMDsL3zp7a7pSeCVFtnIO1T/dScAO8FmHXZniAeIN3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rNr4ycQHg4kH4UcLusuVXOWNigth+KTRd8vT/BJeAnA=;
 b=Brd9waN0ev7OgVCsShqs7M9OH63Ut6FFjw9HpAAqY1PdW9CLr1ad0JkCTZSvzFMCOvy2WeMi5eX0jZOpPH6s4DwIXny2MD5fNWht9YkDxEDjriYI5gTDTQ0oxXv79oGJLc0Hjr//6vGWw8Bhp1ARk6k0/jmStOQKC91mchorKrgpfwuyU9s8udAboWdHbpXEPm2mXWjpMykFPnX+QtIr9GhaW7eM/VeyaYW5N6ZRU2P5f9tdN9NwfFsgqRO5LWJPcNItWxabF829N7XaFgSS14pE9dcyNa0C71L3MdV7t7hE1AWv//HGUkUM9y7F2UxfJ4Ki9Y3moI61tF5QpsG1yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rNr4ycQHg4kH4UcLusuVXOWNigth+KTRd8vT/BJeAnA=;
 b=FhKt/YTxD6XMSqitCdvOzssibTA65FvSGri7gmvUJxDGYoLtlKppNf6iJIdD/tKZnitESRlAh7hfITV8ve4K2HIc8dDj8flaOSrmz1SKCtC3b0Ufwz7MbBBrx/N7ClMBZlA9zgq++GcszImIJ2fuKP0yeO2hqWo7hXUnYrgELnI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c76d69db-f976-4c7a-b653-ab1f13854db3@citrix.com>
Date: Thu, 13 Aug 2026 12:48:43 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 Frediano Ziglio <freddy77@gmail.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v10 2/10] libs/guest: move batch_pfns into a separate
 structure
To: Jan Beulich <jbeulich@suse.com>
References: <20260810103018.54564-1-frediano.ziglio@citrix.com>
 <20260810103018.54564-3-frediano.ziglio@citrix.com>
 <d41d0fa2-7273-4723-a5e0-6424d030cf0a@citrix.com>
 <1101df6e-bb36-4766-9b11-365d1043342b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1101df6e-bb36-4766-9b11-365d1043342b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0291.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN9PR03MB5964:EE_
X-MS-Office365-Filtering-Correlation-Id: 17369e5f-ccc0-4e0e-2a60-08def930d5b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|6133799003|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	RsBrXtc6nPpl8pjUKiHKlDQJGKqc5mW+GuC6l4QcJzKOvSN5D1i5fmoWI6f6RWO/ngf4u4Y/is8rQ7EtI0TJ7j6i8NF7yFuPp+WLVfbKjEcLbIK8XOHhcn8L0Ctw42u5Ot/Y+uc2km6RUPdjnFPo9J3q80FzSXiFhr6NQzRdqZEerw04rQrgvhcYiQkalaKJP72pHm9aRC1fRMpDeC64BvLfxK7vftMbSMDy4GndX1Dqg5jH9A8Lsi0kihJf5WvlzW2gMHM2DlJOOcTT/MJykxD3WxIv2eGAkFdaS+uU4hwvO+6hFL7ALwNvWDF9LPbAuGMg7102xnwTnuC6ISGa507IJr2TiM+KtvFQb9A3tO14uOD207zs4KK4EXxFUEuEU27dpbR6YevYxRXcMThgp6GQZEaPWJ6ysg7C4ZI14lZdsrX3cLX6F1rggON3eXGAF1gVIuSRUH+YxDOU7DXtC+9Fj5jr5wpS8eyHJNbG37BJVhZ9QUgmwE0mtpeShS6DRwY69Tl5W0DhyyDHO1IPnVJoglVSXzQ6Z8Jwful77BKkL9xo7dGhIHzgSNgjhVjKc8+G/ew8vMTglNjINZRYWIHVQoFl7fZv8mh0BEUCBL/60B4Z4Nwwyz52yx1LGnkxA7wj6F3d8s3V2mHfpdA6yPygbpgHklTBFwYCOmIQwpQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWJWcCswU1cxVWlqazdtKzR3QU1qN3lDZEgzVmtEdkZvdS9ablF4Rk5BVWl6?=
 =?utf-8?B?bUlDcmcvdkhZYVY3VDV6ZjJqS0hVRi9vQnFFWmoyYm5oZkROdHZqM0FYTHZG?=
 =?utf-8?B?QUcyeEJ1WlpmNXNBUXBNZEpoNHpsbEtnWFI0cnpFZGtPVkVpYWJkVXVqNlY0?=
 =?utf-8?B?K2dQdURTYzl3WDlJNEN1Q1RlOWdrd29jSFJJdWJoVmtkYnArNy9mMEFTTlRI?=
 =?utf-8?B?VlBjNzNabzVLNStPTHpHWE9FbUpWSmFKNTFMYmpKbHc0V2l0aFkxL1l0aVQ3?=
 =?utf-8?B?d1JMOXhPSWZCdWZ2bjNpYkRHRHJDdkNSdVMxVUNSSGVyWUNQTFhzWitPaDZC?=
 =?utf-8?B?ejBmSGVwRWl3ZDhFUExJbFZPTUVjVUl6Z1lPbEd4ZTg5cFFMeFJxQ0lyNXJM?=
 =?utf-8?B?NTZWZHJjbVpVczNxaHZVZjFlMStTT0d0Yy8yb25FanVZUndwa1ZWUklZY01x?=
 =?utf-8?B?ZDQzWXRwbHY4SWpDR2YrVkVHcjVUKzl0OFRSdzViN2ZXTGpaeE9RbFZyUlFK?=
 =?utf-8?B?aFoydWxPQ2w0cThMQkF5UHVtaXdGRlhIUEdoYzZIK0YrTTFlaWYxUTliZjBW?=
 =?utf-8?B?RnQvemU4Qkc4bVBBU2RvN1A1V1E5UnVRaWYyOFB5TFZnMEowajhFT2I2Rndi?=
 =?utf-8?B?OFdySkw0TmNleGZpTWRvOXFiRjFMd1hSSFU2SVFIa3F0VEJna1V1ajQ2SUhw?=
 =?utf-8?B?YTA4eEpOa3J6QzczVVV0YnFXMFZ5RzdXWVN4L1F6dENyRVBLVjN5Y3YvVXNY?=
 =?utf-8?B?SmNabFozVHVaWlplUEp2NFV1Sm5CT01qQ3dqOXc5azlVL09LMlJPVEkyUHVL?=
 =?utf-8?B?bkJIK0pHMEdoNEx1YzVtVE0xZ0doR29FcUhraXF0VWhyM1I4RzJhZ2FVSTJ5?=
 =?utf-8?B?WDNLQUxWUFZuMzVPUmpxUWx3UWZxNTYzcC9sc0hDMG5RaUtobTV6aHJZOVRB?=
 =?utf-8?B?MDN1a0F3b0d1WHE5SEpzaC8xRytFYWJFY2dtbDhZeTFNWTNickljQ1ZFdTQy?=
 =?utf-8?B?TWdkUmZXNEhkSlJMRFN6UWFvd0duUXlBTkdqQnRnSnJhNk9EVjE0eDl1NzI1?=
 =?utf-8?B?RmFWRVErUlJtNXBWOFVBYlNWK3hESWRwaHcwSEM3NURqY3pMaVlHM1RoQmJF?=
 =?utf-8?B?cmN3OFpISGhzVW1tUllUdFg4YlhJU2ZweGNKNndFV1k1dmdYTVVtZ20wN0pY?=
 =?utf-8?B?WkdXVHZmbHpCL1hWckh6Z0N4cnZ1a0x1NWVFVmplandJcEdsRnh2SE40UHNL?=
 =?utf-8?B?RWF2RjF4Q05Qa0tFcjdmSWtvb1JnNDczNld5a2NFQ3VvS3B6YXNvWlJiWVYz?=
 =?utf-8?B?YisxQVdyWUdwTjF5K0ZVZHRodDRQNW1BYUszc0QzVWpRRVNLTWN0WDdwUHhR?=
 =?utf-8?B?TUlaNlpSMy91SlZKdmQ4dWIwV1dSclVTeHlBcjYxK3ViMUl0NWpxczJMYVJ4?=
 =?utf-8?B?RzYyL0Z0cXAxdDJIcGNjaUI1SXdPTWNMaWJpMmNtUVcwdU1mWjRPSmVHNWNW?=
 =?utf-8?B?VERBQ3lxVkZMRk43UjVQa1lKYUhkdHlkQkxtazlldEVrRW0zMFFsNVRjSUFr?=
 =?utf-8?B?d01UMFN1VFlTQUlCdXJvYjFnYjRkbUNLblBsZTBUcDJUVWxLc2N5dmw0RVlj?=
 =?utf-8?B?Vk55dCswbWptcFkyMTRiK3RhY3o5TFVaWk1UNjRsY1Q5Q1RydkU5SEtzV2ht?=
 =?utf-8?B?S2k3MXNXWEFpaUJMUGFiZUFKVW1jQ1dhWWh6SDkxSWxFMHFDZGF3VFJvVFVP?=
 =?utf-8?B?eFZVTFJTdk8vR214eWxydXVyL0Z5eFB4ZEF1cGlLa3c5Ym1zdHovVlpFL2VW?=
 =?utf-8?B?VTlzR0pIY0VQamlORTJnU1JZR1FyaE9xS1ZpQk4rUE1XcytLRjhFclA4VDNK?=
 =?utf-8?B?NVZqL3NsMnZkQUIvWWxiRm5jdy82QUdTb3RVRkpwSXBUVjZ1eUZSUDMvQWJx?=
 =?utf-8?B?alNkNU1wRW51QVp2SkxxQ1Q1L3dRMHg1UE95Ny9iTzhWWW1WTnRUbEYveEZk?=
 =?utf-8?B?RTJSbmVXam1mRmhnTDNRZFlvTXpJWGJsVDBjQ0dkQVROeFY0blFLd1Jmazdi?=
 =?utf-8?B?aXZrS3BWdFRJcVM3MXJvdzdmdzZQNmFXdFI1ck1sdVByU21PelFvSnR4V0hD?=
 =?utf-8?B?Wkl1NEVtRWpmQ3Qvc2c4eGM4NjVja3gzTjUzOVM3cVhuSGwyUVd4Wk0zT3U4?=
 =?utf-8?B?OW90WXBoSHkvZ2xVUXVCTm55RzRXa3JneldRTWdGYWZCanF4blpyVmljQW52?=
 =?utf-8?B?K0JCbWE3ZExwR2d0NkNsRG52ek1qRnhNVk5BamV0NzlpWjROeW1mZDRjWGJl?=
 =?utf-8?B?bnAveitrOFFjMk8zVjUzYU5DWHVLY1FidUpSbFo0UmJRL1RjdjlPUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17369e5f-ccc0-4e0e-2a60-08def930d5b7
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 11:48:47.3251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MBW5NGpAYEUj6xR9//j/bplzJCci/mTmgYl3ybW/R/e0yX2cwxwB25QMq1kSsn6z8FNMyAIzZ9Mc6Sa0dVNWWkNwj7dspMKVOcQYoU45k0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5964
X-purgate-ID: tlsNG-d62444/1786621731-1D87F757-8F111398/0/0
X-purgate-type: clean
X-purgate-size: 1821

On 13/08/2026 12:27 pm, Jan Beulich wrote:
> On 13.08.2026 13:08, Andrew Cooper wrote:
>> On 10/08/2026 11:30 am, Frediano Ziglio wrote:
>>> Preparation for a followup patch "libs/guest: allocate various migration
>>> arrays just once".
>>>
>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
>>> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
>> Coverity thinks this change has memory corruption.  I have to admit that
>> I'm not completely sure why it's noticed now; possibly because now it
>> can see the size of batch_pfns[] where previously it couldn't
> I had looked into that too, and I'm puzzled that ...
>
>> ** CID 1700057:       Memory - corruptions  (OVERRUN)
>> /tools/libs/guest/xg_sr_save.c: 284           in add_to_batch()
>> _____________________________________________________________________________________________
>> *** CID 1700057:         Memory - corruptions  (OVERRUN)
>> /tools/libs/guest/xg_sr_save.c: 284             in add_to_batch()
>> 278         int rc = 0;
>> 279     
>> 280         if ( ctx->save.nr_batch_pfns == MAX_BATCH_SIZE )
>> 281             rc = flush_batch(ctx);
> ... the tool can't spot that flush_batch() resets ctx->save.nr_batch_pfns
> to 0 in the success case. And ...
>
>> 283         if ( rc == 0 )
> ... only the success case is what matters.

Hmm.  Both flush_batch() and write_batch() are static, so fully visible
to Coverity.

I guess this means that Coverity failed to figure out the properties of
write_batch(); it is a complicated function, even if it has become less
complicated recently.

I'm still advocating to remove the Valgrind logic rather than extend it
in patch 3, and that will remove flush_batch() which might simplify things.

~Andrew

