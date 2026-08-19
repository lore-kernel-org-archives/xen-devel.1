Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BE5C5B572
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 14:05:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1395425.1633802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwguL-0003hp-At; Wed, 19 Aug 2026 14:04:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1395425.1633802; Wed, 19 Aug 2026 14:04:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwguL-0003hi-83; Wed, 19 Aug 2026 14:04:45 +0000
Received: by outflank-mailman (input) for mailman id 1395425;
 Wed, 19 Aug 2026 14:04:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wwguJ-0003hX-Or
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 14:04:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwguF-005tR8-U1
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 16:04:39 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a85b7ee-e002-0a2a0a5209dd-0a2a4505d388-30
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 16:04:39 +0200
Received: from [52.101.48.65]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a85b7f5-4cb1-0a2a45050019-346530417a1e-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 16:04:39 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA2PR03MB5771.namprd03.prod.outlook.com (2603:10b6:806:11e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 14:04:36 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 14:04:36 +0000
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
 b=opi9Zkk60Zeu7Z04qxn/Xpm7ZlAzgJdgA7lY9BCJjctmIyIWwB/xrYjM+5DUetZwtgbR69aTWTelrfSBZ4ZYTqmA/F9araC0SzjWVHBS7t3Zqx3H42mWm8jRhofkoYbt9Lx0Z+h9B6OY4HIbzBSsYh08nmLaDR3oZ2s2rgBtPCet6jMHdjKajxgJMHELbs7XBbLjuXn+G600SAwZNjmTp+AZ5ptduXRAMRImg7aXqJ3oQpZnoE+D8k+vezRXfTMEl5mrHB5lg+n0HrwWW8OAGS05FGEL4GLMeEO4W9Vm+nLNIYW9lCf0xdvdoGy5tThfbp0lf44FUuXn+sFc9ON+IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CrVmE5+FnLQ6dD2nN978imW6NMMpjS99mVRfpfPXzwU=;
 b=E+0+h1mTXdpY8HS/eaBKfL29jMjiCFbILQljCnZs2ujMrIW8BOJWxy9gSBTkgjeXz8f4nNan+AwRRd9OA7UjeGttto6zpFYgbast8FW/XyWiyVpBKw2vHnwxGspVtr/P9fjVi9cY+yAKGtKS7EYh9bUjCce47Ex2wtgutlH6ff1m35axt4efR6yfkPrb/UiOgAJwlSPwYthsjt1k0Mi8IhWTDRqjIQkLSxjA6XmyAkACYYMrdRuPicxOR2SZNxtMpd8QLY55OgS6kGAN7EHw6NnzzZ4qV3w4oC9jgc+ZqglTWH9Ye4Z0eUZgQZrsjd4rAj6hf+vZ+r9OtDPlD9G0kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CrVmE5+FnLQ6dD2nN978imW6NMMpjS99mVRfpfPXzwU=;
 b=Dsot+i30nl1jlxHkTpnSJv9clt0LpzkHNMWM9/kIODI8LIgUK1bQsVOVjRahrtWwlDYm2BQYkQf7rcCSUg20J0+PiCCe7pmUi6zSnYDkc5a1wGxXIJvVWcFRQ2CzQKa8EcqFE2ixSil7tSSBEbJuriFxNiomfeLLq7brhiUBoHU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1200071f-122a-4dc0-aa08-7a7e2f1a6587@citrix.com>
Date: Wed, 19 Aug 2026 15:04:32 +0100
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
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ffe6c2b0-ec82-40e6-9bf5-fd49a3ef3a43@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0249.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA2PR03MB5771:EE_
X-MS-Office365-Filtering-Correlation-Id: dee61821-0ab2-4ef7-7319-08defdfacd60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|10067099003|56012099006|6133799003|4143699003|22082099003|18002099003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	IBU3JPj2SRF6hjf5N9CyxKF7c78K3LyGWsMimwtDOMrSRkQT57BRSDmAPm6NioL/C+/tWTSzi4rOhIFKShyYfYhq2Xztl+1bWxmIP8I+whuSgc3+OfB+w8Q9JpneXukRz0kWK2ghWNq2YriYI6uHQC0BAz4oEERFZCDAFrjF/ppQebliDlnvtDf9x+CCZ9ndmaUpkBNFIKiEvrg5s2zyGNv1hx2NMKoH7nZ9CuQ2hLWT8nlxVRv2Gb4hdM2u9KjrPLCEbs6FvSEGH4SPdHebxyWuwv8kSfwSdT5PG+vfob9WZZMDc2p5wTBhpIRuxuTCj4KCut3f2Bl2oRXLn3fSpbkgKOJK9p09WzHd7WL7mKk2ZkY8KK3dOSKzs6lnLe0G15YCtOM8YTdvuzcft4q5BWyVO6gOUP4SIFj3S2Th1TIY/aBWZOHltyjUa3GGlDhyUf9wURlaYxcgbvdafRk/DDYPrm7kXPq5VrE1h8/Dx3ioYhI9KQWA4iTCr0dM2jI3Qck1wZgq9g6530KhGURVk+AU9WLmfxV+qC/D7KIZ4uI5rYG54PrGX/04t/auwytWmCP9G5K9w6WMjnlNIwP+ThWv/5MUNwPM24JfDnCNqT3DujK5baK80GGj+hI6fyAPKmgpFjWmY267qel9wjUlVv2w37nA884JzUfmqWagXFI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(6133799003)(4143699003)(22082099003)(18002099003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUhpVXNySUt0TEZyVkc0L09jazM0VndHclBTU3J1WU02SHV0RmpjQ2dyZXNw?=
 =?utf-8?B?VCtMN2loR2hXd0oxeUZLYzhFYW01NWJRaHhZV3QwZCtEZm01VjJjQzMremps?=
 =?utf-8?B?NW9QbGF0dUY4VkpGQkNrdkNkeXgwdVhiM0dXTndGenh2dk4zR0FVZkVYWURW?=
 =?utf-8?B?NHFMRzRzcmxUMUlyalVtb0kxOGoySmpmNjdYci9QM2cwTzJGcFl4L21pOTRp?=
 =?utf-8?B?ZmJFU2hKNUFtY09icmRIcnJXdE9ITFNJa0JVZHhBaWVrSHZZRU5OYldjbkpY?=
 =?utf-8?B?Y1phKy9KWFRQTFI0bFZPcGdBOThFR01kZkpzWElqTDdYbWJybXFqTFlkMkJa?=
 =?utf-8?B?SFZVdG8vQXRlY005cDlWbFZFUTl4NjBCTGFLM291b3o0UkhLSldzSy9hU0pI?=
 =?utf-8?B?Ukp5M1Q4QWZyNkk1RStlRnd0YW1hNG9ZVGZURlErMnRZZkdsUTZock9IL3lD?=
 =?utf-8?B?cjRDc0gvTzcweEtja3hYL1o2TnRpeG1YQXRSRDhWSmFPZVIxRXg3MDNsMXpH?=
 =?utf-8?B?eXZJWHpUcU03UFJhUkQ4am1sZ0JkazlzcFNyTTg4dngrVzhKUUVkU2xQT0xw?=
 =?utf-8?B?TTJoZ3dvWnZvTEZYS3pvay9ScCttK1NBWDlFanROWkpaaW5HeklGaFh3WERm?=
 =?utf-8?B?MHFGU2FxMHBlYTdhcDY0bFVla2tSbXorUUR6M1BsTUZGNFBVcXgxaGpTWitn?=
 =?utf-8?B?Ymt5dXVvUk8xRFZuQ3M3b0hML0Njb3FmbGZKalRTSUJMM0o4SC9oSlRmdGli?=
 =?utf-8?B?T21yaE9kY1VpVG9PZU5GT0hvazAraHVXL2V1YjhlMHVJbjNtM0lmRHplWm5T?=
 =?utf-8?B?ajBvemcxYXFNY3F2a0JEWi9PbXZwdmg0RDJtV1NsdnhoTVRsQWRObmNXaFF0?=
 =?utf-8?B?RWZycDF6RGFScVV6a3c4dTRaekxMdXppRkpqeThPUlpIM1Q5cHJPTnhtYmcx?=
 =?utf-8?B?bVV0OVNxSjBjei9pR1NxeXJBQU9qRUg4TlMwaFpUb2RUUzBQczVRUkJmWFls?=
 =?utf-8?B?aHU3eEFjYzBFS0RlTzR3L0NmeWcrbXNqbC85elAzWmRZYmpIMCtpUnlXd0lL?=
 =?utf-8?B?bHV1Y3JEUG1PK0ZCM3RrYzkvQ0hqZnYzYzFqRFBaclZaK2hhMDJJWE53ZGxi?=
 =?utf-8?B?aloxbHlzS3gxZkZsWTZyQmV4WXozQTY1ZEF3SnhHL0VFNUlsb0lUaVFyMDI1?=
 =?utf-8?B?V1RjM0xWNWZkRWlJQjZ5OGpGUmJvbzBvbDBsSGxBMnBZTmY2Tm1DRHhjdEt2?=
 =?utf-8?B?Sk5SdnUwTktuYWhWbFVjb01lQ3FVc3Z1NnhjUkg0dGJ4UC84VEJVRTVjRjBn?=
 =?utf-8?B?aGtGd0VxQnQwN2FVNEZOMjY5NXI4QXlobVI0MmM3aVozMDE0QmRTaWJsb2Vu?=
 =?utf-8?B?N2RGRVhoMmFYTWdrZnp1aG94WlFBZkROQStaUCtXU1ZZMmtJMVBCaThiNU9I?=
 =?utf-8?B?RGZSckpSYWptTVo0NlBjMkZoeDNuQzJ6Qkd2VUpJNGYrQlo4SUFlbGdKOFBE?=
 =?utf-8?B?c21UWndHODdvVFV5R0tDb2Iya0tha3dQUkw2bkNRVVVLSVNiTGgrSEVpU1pu?=
 =?utf-8?B?a2pQU3ZLTll0eDdDUjBhWUJXUHFzUktSRGtXUVpvMmJkaC9hdWVOVWZTRW0z?=
 =?utf-8?B?V201d2N6ajNNQ0x4Y2k2emovQkphdktjeGQyWW1ad3loelFWTkg4M285RHM2?=
 =?utf-8?B?NlhXTk9lTXpOeFJSMWdsdFl1V29GbzlWZkdWRzc2aHRnL0hHK3FpYWJGaTlB?=
 =?utf-8?B?d2VrOVIxa2kzSzdoS3ZqTU4yMWdpNnZDYlVaaFJkViszTWdPZmx2L21sNmtP?=
 =?utf-8?B?RDU5eDFtb3MxVTF3N1lUOTU0b2dvVXpDL3FlYnowN0EvdERlUXdjTThubVZQ?=
 =?utf-8?B?ZW5TSTkvSDFCaEx1K3R4L21zd2JtazFETDE0eFlKRVY4bHN2UzY4WFJIVU93?=
 =?utf-8?B?SFJJR0xIM1k4Y2p0VWhiOHJVUHZ6V2t4OGV2b1AxWkRwaGdzaWx2T2w3ODRZ?=
 =?utf-8?B?Q1I0RnhjN0JqbXh3QmRvc09HbzZiQXNGUkFENk5vL2lGU2g2Y0lTLzFZQitp?=
 =?utf-8?B?ZEVNU1VkbE4yajdCOXhoOGdHVXpXSG1aVzNleGowb3ppZzA3WDVuK0FScGxn?=
 =?utf-8?B?dk55a2kydUc4aHRKUHBnRHJMU1dvRWtOMnI3L05vai9MYWowK2U5SVJWUXVk?=
 =?utf-8?B?N1pza1pEWmVpdEdhT3krNGozN0VmdDR3b3NrbGZHMUQvWTB5b3FHN3RpUFd4?=
 =?utf-8?B?NDgveGRqdFlrdktwM0l5WGRzSkhWNmJyQS81aHA5SHFGclhNbGNaY3ZEd1BO?=
 =?utf-8?B?ajBSczNQdnNweFAwdWp1MkJtRlFOSktTUStRSHJXdE9nTE0vbVZCOWpFRWVY?=
 =?utf-8?Q?8ABarrny95SpMaTw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dee61821-0ab2-4ef7-7319-08defdfacd60
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 14:04:36.3207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: thn7VcrzH5KdwJwF/TsbxXzCqreEkctfdBcwyLqJ7yfmuOXtFGlin2Evsf7Krm4rNQ6uCoo/cjdbK6/XgldZRgFRxXlCuIo7Se9f16cZsjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5771
X-purgate-ID: tlsNG-c201ff/1787148279-728B62A1-084CA0E4/0/0
X-purgate-type: clean
X-purgate-size: 4172

On 19/08/2026 12:56 pm, Jan Beulich wrote:
> On 19.08.2026 13:13, Andrew Cooper wrote:
>> On 18/08/2026 3:31 pm, Jan Beulich wrote:
>>> On 18.08.2026 15:07, Andrew Cooper wrote:
>>>> Panicing in the case of a timeout turns out to be about the worst possible
>>>> action Xen can take.  It leaves all other APs waiting on the condition
>>>> variable, some in NMI context.  As a result, they fail to be shot down and
>>>> dump state for kexec crash analysis.
>>> At the same time there likely isn't much to be learned from a kexec dump, as
>>> the source of the issue is in the CPU, not in Xen.
>> The single most valuable print message I've ever added to Xen is the one
>> which reports which CPUs didn't respond to NMIs.  Up until now, it has
>> always highlighted hardware issues.
>>
>> Despite my wish to remove this panic specifically, there is still
>> information to be gained from kexec in a similar scenario.
> That is you think of a system without console, where those log messages would
> only be possible to fish out of the dump. Fair enough.

Yes.  This covers approximately all of XenServer deployments.

>
>>> Further, this code runs with the watchdog disabled. If there's truly no
>>> progress anymore, how would one know from the outside whether the system is
>>> dead altogether vs the control CPU still kicking around?
>> The scenario you describe can only occur if the BSP accepts the
>> microcode successfully, and one of the APs locks up properly.
>>
>> If the BSP locks up, we never get as far as deciding to panic(), and the
>> system hangs already.
>>
>> If we have a bad microcode, it is far more likely for the BSP to hang
>> than for the BSP to work one of the APs hang.
> Hmm, probably. (I'm always having in mind the one old system I have where only
> the primary cores on each socket get ucode updated by firmware, with secondary
> cores needing us to deal with them.) Still somewhat hesitantly:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
>>>> Microcode Loading on Granite Rapids takes about 4.5s of wallclock time, far in
>>>> excess of the of the arbitrary 1s Xen allows.  This time is spent in the WRMSR
>>>> to load the blob, and there's nothing the system can do but to sit and wait.
>>>> Despite the delay, the system as a whole does survive.
>>> For this I wonder whether the log message issues after 1 sec is adequate. If
>>> we know things can take this long, wouldn't we better issue the log message
>>> no earlier than, say, 5s * nr_sockets?
>> I have some work there not submitted yet, which would periodically print
>> a message.  That at least gives you slight signs of life.
>>
>> But nothing involving nr_sockets.  It's far more often wrong than it is
>> right, and that's not how our algorithm scales.
>>
>> GNR has gone from milliseconds to 4.5s.  Putting the limit at 5s is just
>> going to need another change in a year or two.
> That's one possibility, yes. The other is that they realize that they have to
> bring processing time back down.

I'm still trying to get details out of Intel, but I strongly suspect the
massive jump here is because of the introduction of the Ucode Staging
Buffer.

Even the architectural description is:

IA32_MCU_ENUMERATION (0x7b), bit 4: MCU_STAGING
"When set to 1, indicates that the microcode update staging capability
is supported by the processor. When supported, the use of the MCU
staging capability is recommended to reduce the latency of the
IA32_BIOS_UPDT_TRIG operation."

which all-but-says "high latency now expected".

When the staging buffer is primed properly, it gets back down to a
reasonable time, but I have no idea when we're going to be able to
support that, and in the meantime running xen-ucode needs to not crash.

One other idea I had:

If we rearrange the loop to have a periodic "taken $X seconds" (shows
liveness), and maybe at 40s decide to panic (by passing through the out:
label first so we release the APs, so they can crash more cleanly), then
that might be acceptable.

By 40s, the system isn't surviving even if the cores do all come back.

~Andrew

