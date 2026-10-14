Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39294CC6B1A
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 16:25:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449293.1665157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH1my-0003GS-Ck; Wed, 14 Oct 2026 16:25:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449293.1665157; Wed, 14 Oct 2026 16:25:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH1my-0003GL-9u; Wed, 14 Oct 2026 16:25:12 +0000
Received: by outflank-mailman (input) for mailman id 1449293;
 Wed, 14 Oct 2026 16:25:10 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xH1mw-0003GF-5b
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 16:25:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xH1mv-005Des-I7
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 18:25:09 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6acfacb6-e002-0a2a0a5209dd-0a2a4505c2f8-40
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 18:25:09 +0200
Received: from [52.101.52.33]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6acface3-4cb1-0a2a45050019-34653421c32a-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 18:25:08 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA2PR03MB5785.namprd03.prod.outlook.com (2603:10b6:806:119::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Wed, 14 Oct
 2026 16:25:05 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 16:25:00 +0000
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
 b=rhde1GgxnulClbazuzhpe//BITAhBY+b9EAdJ9M1JzkvBYQZWFTNMykhH3q/9tm9nQj7SYJlmgSUte3bTtuT8VRYEV+botYK9MIqAvlOu9T5cQoUkHag1FQYW+jZTCaukfMXk338o5Q8qGgbjbTmaoesaP8SxpFQ8meIc2KbfFy5A27RzV0hICMwISjTk9K+/i6p9ClwgZfwcpEpcJ7lt0+WfdGaUdyylX7/iSvvKqxF14KPfGD6dzdIis8u0u5rCI0oHHlL7b1xHmW79tebkuCFRcSYmHaGLO76sa6sNxwaSo5Z3J+T60HCMdmXgNxGmyIQyQFQjgaHlPJhZ3nxtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXSOxE0ZUMiWAHO4dVTQ2TAdO96lp407qOfgCHqca3I=;
 b=Vo1RrUAYTuKI4PDKY3RVRdx8eGWCz/3R3JtnJv8UuvAgRG71URwnJNJ1zo041mY0C7djpIBbZyvoOw9prusBXlLWHCI0TyfQmJ9XHgdHFcunXYHYVNOeey2W+dxy4ZW7O9S7K6QdMydqi7d1nhUIX3US+WHkktTFUjb4pTSItfmdcwBt8vCNYEkIEr4/y10sWWxRCmz/6IWb3yFfDNHPcLVDaybfRzXotC4ffYQQ+u0xwfNHB/neUoSqHi6w3xItibwVLMkEteQX1j1XC36RUq+8HHcWrPS/waCzn7vcv+X87dUWI3hGEKuy7y5WcsQ9/pojbBGD53lYjwv2sJNSQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXSOxE0ZUMiWAHO4dVTQ2TAdO96lp407qOfgCHqca3I=;
 b=ooG9oNYTOAhEYdrbv1rWLpkhSLvJeCgtWftGhpVL4DT0UWnsc4Fws0FwLjp9d/7natOzpqrdJyFf27Oc9XsoTh/1pQvNg+H6YsUguSqGTUBkAVFmhnqncUj+PxwmnnkqgzLjZcJo63y4/uQWuIJA0W7GO44h5owd74Y4COJS4BM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8d4f9d39-f80b-43cf-91a1-033a8bca777f@citrix.com>
Date: Wed, 14 Oct 2026 17:24:57 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH] gnttab: drop bogus check from _cache_flush()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6d0acc68-9d07-4e0a-b27b-0095a51ebe42@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <6d0acc68-9d07-4e0a-b27b-0095a51ebe42@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0251.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA2PR03MB5785:EE_
X-MS-Office365-Filtering-Correlation-Id: 442edb3b-989e-4efc-2363-08df2a0fb1dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|56012099006|11063799006|22082099003|6133799003|10067099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8BWgXFCUUO9R/u8EYLOf7sWxEX+LkkEZrLHZKlQ2SZBybkha2IMnaZB72WTUb+DoqqWpisNHpMZ7KXbQSaLbous2pUPoflw+xjkbsyBxR/J299fOOZeHDQYO+jD7U+i+IxdYocL0wSnjVRSu0HXlVHtr4hRcRSFMsXsvK1lNo2WXy7XHkHYEqL6fJhvTnoIWnAAp6raGVXSKZ4fchCQKWm6dRXdYXkd57YlkA49F7+g5oSAd7t3XqcGuBmu+7iBSiTPL3VzPyaKTcPR8b7YNfI9mEMTn75LR2ObOO0EcX1hZkbW5gc+nrYchWgI1CGFMRdfWYisampP0n8jfDE/GNodo7i0shGChMB46ht09wZRQMRH9dtkuf/dE/xumO4Rntmvmj1goVrg7/ZHM8zETAU1MWen8KvOYKhw7avZE4sTA7EIyxFORRUoBxfqXogP4EiozFs/9sws1hWYwlIt08xsrNshRPN66mdMuC77G3pZ6EXpZZpbddhk5hvb2dFFSPu78LEWigldQ7wDB0RcW/DhxLfZx5/15+xJdtInPcP31cjS2QgRtZy99LqJsy6YUgTKh+YtYda57TL4SbVXUXIB1wBH2vjqrIWkFQdBcjF6+QgC1UJ00PvZDYqxaR2DVHD3ryGnahYhTg41Brsn0Ov6kkqWHvypi9YHVjgH91oA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(11063799006)(22082099003)(6133799003)(10067099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2ZpYW83dGNoUDhybWxDUnNQcURaZCsrMnVFL3VyVVpaU2s0NkRwek5zeHRw?=
 =?utf-8?B?MWs0SWlTbmhxYVZiSTRHT1p4RHFrRHNUN1JtRHBtRE9LSnBVZ0VaK0M1M0pt?=
 =?utf-8?B?VnVyZUR0OTI4MVR5MUk4L3ZROUovUGQyODBNaHRxNVAwN01YamhPWXlvOFc0?=
 =?utf-8?B?cytBN0hxeU9jQWZRVnRWNlIxQkM1bC94U0xnTG1QUjZNcDhwczJUWGtvZjlD?=
 =?utf-8?B?UWVrSHJCRTRPeHhjRklXOHp5QnNuRWdhaWNRZUd5TFJpaXVBbFdqVktvekZV?=
 =?utf-8?B?OVY4Z1dOWGFmNGNEZzBwOUhxeHJkRWZCdTVId21xaXN2Z2t0NlZ5MUJETlFT?=
 =?utf-8?B?Qi82VzR3WGh0MU5RVFZLc0ZnRVRXT1FNRkZGSnA3Y1NVVCtOanhmTEhVVFh1?=
 =?utf-8?B?S3RWMUFqV3MzSWlxNjZNVjU2Z0M2Z0ZFdXRPZllnc002Z0FNZlYvcVdqNDQ0?=
 =?utf-8?B?ZVBUNktZZFcwdGpTYkF4VE92MmdUM1Zzb2JLSGtQUEhJb2Z0NFBEb04vWHlx?=
 =?utf-8?B?cytmNnRTUnpYSlNvaGoxVFVMQU9aWXhIRTZOSzVxWXQraStuWEFlYXUxcGFG?=
 =?utf-8?B?cU16YjM1eHUxMHBadnN1ZXdFWnNDVnZPZW9sVVExeXJNenZoZkdycGpyZHZM?=
 =?utf-8?B?T1c5eDZIQmpXOW1MRFU5bVBqT1NVVk0wa1k1LzBUNkNkN2NWR2VsNS9xdnA2?=
 =?utf-8?B?amRIMlZFbXNEL0NnSW9ZTzlNUk9wZjA2QytNbEk4ZWE1TG0xS0did1VJUjJh?=
 =?utf-8?B?enpPa3Y1eENFdTBoV0ErQ05vYWhsemtNejNpY3VQdmZhTFRGVEY4ZDFlTzNo?=
 =?utf-8?B?azJMOGxhNld4dVpYdGVsZHFkNXBwd21NbmdaVG54eE9CQVVqYVNvUWRNVmwr?=
 =?utf-8?B?cW9zeHJCOEJFZHRsWFBrV0hzcVlWcTBTNDloM2xrRHo0cWl4OGV0YlF6N0xn?=
 =?utf-8?B?ODY1K291RFZ3ZjJha21TdnI0cDZ0blNUVlI3dlprNWZpOG51eUgxTEdzTnVT?=
 =?utf-8?B?amJvYThsL1ozbnJ3citpUWdpdlF1NVRPblp0TDZ3TWJNcDF4MUgvaExaSkZN?=
 =?utf-8?B?aitrOUpaOTJhT3FJcXJuVmQxTHhPV3FtamgyYVdkSlgyMWtMN3JaK21qeU0r?=
 =?utf-8?B?WlB0cGR6WG9HQjZ3VXp3Y3g1bnA3enpiVGw4WnBGVEQ3eGlwNEM4dzJ0YXJE?=
 =?utf-8?B?YnZ2TENsck1yQnIyb0ZXcFRhWjZ5VHY5YnlTY0YwTUluRUovdzJQa25xY1dP?=
 =?utf-8?B?QndYREw0UFFyRmdsY2dBYXlZWHBKRS8wWDRyd2pxM1paSUI3QVNWYmo1SlQ5?=
 =?utf-8?B?cC9MdmxxVzZVeUdhd0V3a1A0ZVZpdmNFT2lrWEVkT3hKSkxhYjhLcGxDOXNR?=
 =?utf-8?B?RkExaEl4VFE4TGtVVXcya054M2hXSmgxZDBiUlBCaXFsUGxoaTJySW5ma3py?=
 =?utf-8?B?NkV4RHpieE8yYnd6WkZSZUgxTFJNZE9RcUh1ZTRIRHo2eElxV0dSVnVvSm43?=
 =?utf-8?B?ajE2STViWnpnZk9LRkwrbHpjcDZrMmp4dE1QU0pIemtNT3dRUGovc3c3RTh2?=
 =?utf-8?B?S2NmMW1wT3dYVGF3OUlZZ1N5eVIxa1dnMzdzd2ZNdU9UdENPQlplWHp0bFM5?=
 =?utf-8?B?ejhTWkJWSkFpb0prT2I0VjJSaXo0cHV5cDhlWk9zVFFGWDhNbUd1cWJBbVlB?=
 =?utf-8?B?RG1sYk16MnNYa3htcTkwN3NHdUR3NVE4SUorTDhQWVUvZTBESzBIZVcrNStt?=
 =?utf-8?B?NnREYk5meTBqRmZ5S1NCVkVZdUFkdHloN3IydGJRLzdPZE5OQ3ladlJxSUUv?=
 =?utf-8?B?dUhXT0QyUi8veS9VZEZ2ZHE0blNXUmJRWUNPTWlJWjNqa21LL3o1ODB6SzVy?=
 =?utf-8?B?aDNFK3I0VHhleFBpWldZajRRdkhGOXpEU3krSUlLUG9UeHhOcmpwczIwbTZT?=
 =?utf-8?B?bVJ2cTRNV3BsNm9mdGZvYnAxcTVQbWRybHFmWEh3RWoyK2M3TzBaeWZNKzJq?=
 =?utf-8?B?SFhBVU54cUJza1hVSC93eXJqQkZ5eFNVUEJ0bDRHelhwVUlIc0ZxR0ZiYTFI?=
 =?utf-8?B?K3M4djJDbC8zNml1UHZ0emVWdURGN3JxaW5jN29JcTR0ZTFnUVZraytPeXp6?=
 =?utf-8?B?RzkwU0Juay9vQWNSTHFMYWx4RzhVRWxpOGJ0Q3J3TWIwVWUyaGxxSkdydlJs?=
 =?utf-8?B?Vko5dXhhbWVIUlNXaFlYcFNCZmQ5VE1kMk1Ka21rWUdRS01DSU9SbGx5ZDVQ?=
 =?utf-8?B?MjF3SzB3NGo4T0JuWk4vRS9ydnd4Kzd5dS9YeHJnV1YzWTRGaXFiV2JoaDFZ?=
 =?utf-8?B?YU94YkVQR0Urays4Y0VqdU9hR1N6bFc1Q0ZzRkM1UDJZc0ZkMXJpRkMvdklE?=
 =?utf-8?Q?3Tv+pV0+Z+ZYDzqU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 442edb3b-989e-4efc-2363-08df2a0fb1dc
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 16:25:00.8811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qqJa46KLUfuQOm6/bmEw0qX6bLbThrg1MZNPkmBq0yD7ZEtEH6j3U/bbQbPKaSpZpJ9bEfuh/pcjpUUj3yy7Pxn8+Kd3XxZM0nPrm7gqias=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5785
X-purgate-ID: tlsNG-c201ff/1791995109-726B52A1-799C1EA2/10/78276251493
X-purgate-type: spam
X-purgate-size: 1208

On 14/10/2026 1:52 pm, Jan Beulich wrote:
> There's no such thing as an alive domain without ->grant_table, and system
> domains (on Arm) don't own any pages. The check should also not be left
> there "just in case", because if that check could legitimately yield
> "false", the page reference obtained would then need dropping on the
> subsequent error path (see XSA-520).
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reported-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -3637,7 +3637,7 @@ static int _cache_flush(gnttab_cache_flu
>  
>      page = mfn_to_page(mfn);
>      owner = page_get_owner_and_reference(page);
> -    if ( !owner || !owner->grant_table )
> +    if ( !owner )
>      {
>          rcu_unlock_domain(d);
>          return -EPERM;

Do you remember that I already posted this patch (to the security team),
and you already reviewed it?

I'm afraid that your commit message is hard to follow, despite knowing
the details.  I already have one prepared from 3 weeks ago which I think
is rather clearer to follow.

~Andrew

